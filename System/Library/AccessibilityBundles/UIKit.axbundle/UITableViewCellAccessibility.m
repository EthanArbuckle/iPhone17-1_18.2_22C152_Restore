@interface UITableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAlwaysReturnsChild;
- (BOOL)_accessibilityAvoidsMockViewContainers;
- (BOOL)_accessibilityHandleDetailButtonPress:(id)a3;
- (BOOL)_accessibilityHandleReorderMoveDown;
- (BOOL)_accessibilityHandleReorderMoveUp;
- (BOOL)_accessibilityHandleReorderMoveUp:(BOOL)a3;
- (BOOL)_accessibilityHasTextOperations;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (BOOL)_accessibilityImplementsDefaultRowRange;
- (BOOL)_accessibilityIsButtonAccessoryType:(uint64_t)a1;
- (BOOL)_accessibilityIsDescendantOfElement:(id)a3;
- (BOOL)_accessibilityIsInTableCell;
- (BOOL)_accessibilityIsOutsideParentBounds;
- (BOOL)_accessibilityIsSpeakThisElement;
- (BOOL)_accessibilityIsTableCell;
- (BOOL)_accessibilityLabelShouldBeDistinct:(id)a3;
- (BOOL)_accessibilityRespondsToUserInteractionForElement:(id)a3;
- (BOOL)_accessibilityScrollToVisibleForNextElementRetrieval:(int64_t)a3;
- (BOOL)_accessibilitySetNativeFocus;
- (BOOL)_accessibilityShouldBeEmptyIfHidden;
- (BOOL)_accessibilityShouldSetNativeFocusWhenATVFocused;
- (BOOL)_accessibilityShouldSortTableViewCellChildren;
- (BOOL)_accessibilitySwipeActionsAllowed;
- (BOOL)_accessibilityTableViewCellHidesInsertControl;
- (BOOL)_accessibilityTableViewCellSubclassShouldExist;
- (BOOL)_accessibilityUseElementAtPositionAfterActivation;
- (BOOL)_accessibilityUsesOverrideContainerProtocol;
- (BOOL)_accessibilityViewHierarchyHasNativeFocus;
- (BOOL)_axHasLeadingSwipeActions;
- (BOOL)_axHasTrailingSwipeActions;
- (BOOL)_axPerformAction:(id)a3;
- (BOOL)_axReorderElementsByMovingIndexPaths:(BOOL)a3 tableView:(id)a4 currentPath:(id)a5;
- (BOOL)_axShouldForceRefreshChildren;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)accessibilityElementIsFocused;
- (BOOL)accessibilityScrollToVisible;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)tableTextAccessibleFrame:(id)a3;
- (_NSRange)_accessibilityIndexPathAsRange;
- (_NSRange)accessibilityRowRange;
- (double)_accessibilityAllowedGeometryOverlap;
- (double)_accessibilityAllowedGeometryOverlapX;
- (id)_accessibilityCellEditingControl;
- (id)_accessibilityCellReorderControl;
- (id)_accessibilityChildren;
- (id)_accessibilityContainerElements;
- (id)_accessibilityDetailTextLabelIfExists;
- (id)_accessibilityEditableTextFieldIfExists;
- (id)_accessibilityEquivalenceTag;
- (id)_accessibilityFindRemoveConfirmSubview;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilityImageViewIfExists;
- (id)_accessibilityIndexPath;
- (id)_accessibilityInternalData;
- (id)_accessibilityInternalDataRetrieveOnly;
- (id)_accessibilityKeyCommands;
- (id)_accessibilityMockParent;
- (id)_accessibilityNativeFocusPreferredElement;
- (id)_accessibilityNextIndexPath;
- (id)_accessibilityParentTableView;
- (id)_accessibilityPerformableActions;
- (id)_accessibilityPreviousIndexPath;
- (id)_accessibilityRetrieveTableViewCellText;
- (id)_accessibilityRetrieveTableViewCellText:(void *)a1;
- (id)_accessibilityRetrieveTableViewCellTextExcludingDetailText;
- (id)_accessibilityRetrieveTableViewCellTextForReorderControl;
- (id)_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:(int64_t)a3 shouldExcludeDetailText:(BOOL)a4 forReorderControl:(BOOL)a5;
- (id)_accessibilityRetrieveTableViewIvarsText;
- (id)_accessibilityScannerGroupElements;
- (id)_accessibilityStepperAccessory;
- (id)_accessibilitySubviewsForAdding;
- (id)_accessibilitySubviewsForAddingWithSort:(void *)a1;
- (id)_accessibilitySupplementaryHeaderViews;
- (id)_accessibilityTableViewSwitch;
- (id)_accessibilityTextElementText;
- (id)_accessibilityTextLabelIfExists;
- (id)_accessibilityUserTestingChildrenInAccessibilitySortedOrder:(void *)a1;
- (id)_accessoryViewForType:(int64_t)a3;
- (id)_axCustomActionsForActions:(uint64_t)a1;
- (id)_axGetFocusedSubview;
- (id)_checkmarkImage:(BOOL)a3;
- (id)_privateAccessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (id)accessibilityElements;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityUserInputLabels;
- (id)accessibilityValue;
- (id)automationElements;
- (id)preferredFocusedView;
- (id)tableTextAccessibleLabel:(id)a3;
- (id)tableTextAccessibleLocalizationBundleID:(id)a3;
- (id)tableTextAccessibleLocalizationBundlePath:(id)a3;
- (id)tableTextAccessibleLocalizedTableName:(id)a3;
- (id)tableTextAccessibleStringKey:(id)a3;
- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4;
- (int64_t)_accessibilityUserTestingChildrenCount;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (uint64_t)_accessibilityClientIgnoresReorderControl;
- (uint64_t)_accessibilityHasReorderActions;
- (uint64_t)_accessibilityIsButton;
- (uint64_t)_accessibilityIsRemoveConfirmVisible;
- (uint64_t)_accessibilityIsRemoveControlVisible;
- (uint64_t)_accessibilityTableViewIsOpaque;
- (uint64_t)_axSubviewIgnoredDueToHiddenOrZeroAlphaAncestry:(uint64_t)a1;
- (uint64_t)accessibilityIsFetchingChildren;
- (uint64_t)accessibilitySetIsFetchingChildren:(uint64_t)result;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityClearChildren;
- (void)_accessibilityFinishSwipeAction:(id)a3 controller:(id)a4 indexPath:(id)a5 tableView:(id)a6 tvDelegate:(id)a7 wasEditing:(BOOL)a8;
- (void)_accessibilityHandleRemoveConfirm;
- (void)_accessibilityHandleRemoveSwitch;
- (void)_accessibilityHandleReorderMoveDownWithFocus;
- (void)_accessibilityHandleReorderMoveUpWithFocus;
- (void)_accessibilityKeyCommandActionMinus;
- (void)_accessibilityKeyCommandActionPlus;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_accessibilityReevaluateChildren;
- (void)_accessibilityRemoveInternalData;
- (void)_accessibilityReuseChildren:(void *)a3 forMockParent:;
- (void)_accessibilitySwitchMockView:(void *)a3 toParent:(void *)a4 withPossibleSubviews:;
- (void)_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:(id)a3;
- (void)_accessibilityUpdateRemoveControl;
- (void)_axApplyAccessoryType:(id)obj withControl:;
- (void)_axSetFocusedSubview:(id)a3;
- (void)_axSetShouldForceRefreshChildren:(BOOL)a3;
- (void)_didRemoveSubview:(id)a3;
- (void)_didUpdateFocusInContext:(id)a3;
- (void)_setAccessibilityMockParent:(void *)a1;
- (void)_setPopupMenuButton:(id)a3;
- (void)_setShowingDeleteConfirmation:(BOOL)a3;
- (void)_setSwipeContainerView:(id)a3;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)deleteConfirmationControlWasCancelled:(id)a3;
- (void)deleteConfirmationControlWasClicked:(id)a3;
- (void)didTransitionToState:(unint64_t)a3;
- (void)editControlWasClicked:(id)a3;
- (void)paste:(id)a3;
- (void)prepareForReuse;
- (void)registerMockChild:(id)a3;
- (void)selectAll:(id)a3;
- (void)setAccessoryView:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setShowingDeleteConfirmation:(BOOL)a3;
- (void)unregisterMockChild:(id)a3;
@end

@implementation UITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axShouldForceRefreshChildren
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetShouldForceRefreshChildren:(BOOL)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v20 = location;
  id v19 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = "@";
  v10 = @"UITableView";
  v15 = "B";
  [location[0] validateClass:"@" hasInstanceMethod:"@" withFullSignature:0];
  v18 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_draggingReorderingCell:yDelta:touch:", v16, "d", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_endReorderingForCell:wasCancelled:animated:", v18, v16, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_dragAndDropUsedForReordering", v15, 0);
  v17 = @"UITableViewCell";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v11 = @"UIView";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_checkmarkImage:", v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_manuallyManagesSwipeUI", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"prepareForReuse", v18, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewRowAction", @"_handler", "@?", 0);
  v3 = "UIControl";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v17, @"_editingAccessoryView");
  [location[0] validateClass:v17 hasInstanceVariable:@"_accessoryView" withType:v3];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_defaultAccessoryView", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"setShowingDeleteConfirmation:", v18, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_setShowingDeleteConfirmation:", v18, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_tableView", v16, 0);
  v4 = @"UITable_UITableViewCellDelegate";
  objc_msgSend(location[0], "validateClass:conformsToProtocol:", v10);
  v5 = @"UICollectionViewTableCell";
  objc_msgSend(location[0], "validateClass:conformsToProtocol:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_editableTextField:", v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_textLabel:", v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_detailTextLabel:", v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_imageView:", v16, v15, 0);
  [location[0] validateClass:v5];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_setSwipeContainerView:", v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", v16, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", v16, v16, 0);
  v6 = @"UISwipeActionController";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, @"_swipedViewForItemAtIndexPath:", v16, 0);
  v7 = @"UISwipeOccurrence";
  v8 = "UISwipeActionPullView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:v7 hasInstanceVariable:@"_leadingPullView" withType:v8];
  [location[0] validateClass:@"UISwipeActionPullView" hasInstanceVariable:@"_buttons" withType:"NSMutableArray"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"swipeActionController:didEndSwipeForItemAtIndexPath:", v18, v16, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"swipeActionController:willBeginSwipeForItemAtIndexPath:", v18, v16, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_dragController", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_dropController", v16, 0);
  v9 = "{CGPoint=dd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_canBeginDragAtPoint:indexPath:", v15, "{CGPoint=dd}", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, @"_targetIndexPathAtPoint:withLastTargetIndexPath:adjustedForGap:", v9, v16, v15, 0);
  [location[0] validateClass:@"_UITableViewDragController"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"canPerformAction:withSender:", v15, ":", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"canBecomeFocused", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"preferredFocusedView", v16, 0);
  [location[0] validateClass:v17 isKindOfClass:v11];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"_isEligibleForFocusInteraction", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, @"_isFocusedOrAncestorOfFocusedView", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_didUpdateFocusInContext:", v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_accessoryViewForType:", v16, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"cut:", v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"copy:", v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"paste:", v18, v16, 0);
  [location[0] validateClass:v17 hasInstanceVariable:@"_editingData" withType:v16];
  v12 = @"UITableViewCellEditingData";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  [location[0] validateClass:v12 hasInstanceVariable:@"_reorderControl" withType:"UITableViewCellReorderControl"];
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_accessoryManager", v16, 0);
  v13 = @"UICellAccessoryManager";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v13, @"currentConfigurationIdentifier", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"UICellAccessoryConfiguration", @"leadingAccessories", v16, 0);
  v14 = @"_UICellAccessory";
  objc_msgSend(location[0], "validateClass:isKindOfClass:", @"_UICellViewAccessory");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, @"view", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityRespondsToUserInteraction", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_setPopupMenuButton:", v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"_hasEditingAccessoryView", v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, @"editControlWasClicked:", v18, v16, 0);
  objc_storeStrong(v20, v19);
}

- (id)_accessoryViewForType:(int64_t)a3
{
  v9 = self;
  SEL v8 = a2;
  uint64_t v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility;
  id obj = [(UITableViewCellAccessibility *)&v5 _accessoryViewForType:a3];
  -[UITableViewCellAccessibility _axApplyAccessoryType:withControl:]((uint64_t)v9, v7, obj);
  id v4 = obj;
  objc_storeStrong(&obj, 0);

  return v4;
}

- (void)_axApplyAccessoryType:(id)obj withControl:
{
  uint64_t v7 = a1;
  uint64_t v6 = a2;
  id location = 0;
  objc_storeStrong(&location, obj);
  if (v7)
  {
    [location accessibilitySetIdentification:0];
    if (v6)
    {
      uint64_t v4 = v6;
      char v3 = 1;
    }
    else
    {
      uint64_t v4 = 0;
      char v3 = 0;
    }
    if ((v3 & 1) == 0)
    {
      switch(v4)
      {
        case 0:
          break;
        case 1:
        case 3:
          [location setIsAccessibilityElement:0];
          break;
        case 2:
          [location accessibilitySetIdentification:@"UITableCellViewDisclosure"];
          [location setIsAccessibilityElement:1];
          break;
        case 4:
          [location setIsAccessibilityElement:1];
          [location accessibilitySetIdentification:@"UITableViewCellAccessoryDetailButton"];
          break;
        default:
          JUMPOUT(0);
      }
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  [(UITableViewCellAccessibility *)v7 _axSetShouldForceRefreshChildren:1];
  char v3 = v7;
  uint64_t v2 = [(UITableViewCellAccessibility *)v7 accessoryType];
  id v4 = (id)[(UITableViewCellAccessibility *)v7 safeUIViewForKey:@"_defaultAccessoryView"];
  -[UITableViewCellAccessibility _axApplyAccessoryType:withControl:]((uint64_t)v3, v2, v4);
}

- (id)_accessibilityTextLabelIfExists
{
  id v12 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    SEL v6 = &v5;
    int v7 = 838860800;
    int v8 = 48;
    v9 = __Block_byref_object_copy__21;
    v10 = __Block_byref_object_dispose__21;
    id v11 = 0;
    v4[1] = &v5;
    v4[0] = v12;
    AXPerformSafeBlock();
    id v3 = (id)v6[5];
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    objc_storeStrong(&v11, 0);
    id v13 = v3;
  }
  else
  {
    id v13 = 0;
  }
  v1 = v13;

  return v1;
}

void __63__UITableViewCellAccessibility__accessibilityTextLabelIfExists__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _textLabel:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityDetailTextLabelIfExists
{
  id v12 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    SEL v6 = &v5;
    int v7 = 838860800;
    int v8 = 48;
    v9 = __Block_byref_object_copy__21;
    v10 = __Block_byref_object_dispose__21;
    id v11 = 0;
    v4[1] = &v5;
    v4[0] = v12;
    AXPerformSafeBlock();
    id v3 = (id)v6[5];
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    objc_storeStrong(&v11, 0);
    id v13 = v3;
  }
  else
  {
    id v13 = 0;
  }
  id v1 = v13;

  return v1;
}

void __69__UITableViewCellAccessibility__accessibilityDetailTextLabelIfExists__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _detailTextLabel:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityImageViewIfExists
{
  id v12 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    SEL v6 = &v5;
    int v7 = 838860800;
    int v8 = 48;
    v9 = __Block_byref_object_copy__21;
    v10 = __Block_byref_object_dispose__21;
    id v11 = 0;
    v4[1] = &v5;
    v4[0] = v12;
    AXPerformSafeBlock();
    id v3 = (id)v6[5];
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    objc_storeStrong(&v11, 0);
    id v13 = v3;
  }
  else
  {
    id v13 = 0;
  }
  id v1 = v13;

  return v1;
}

void __63__UITableViewCellAccessibility__accessibilityImageViewIfExists__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _imageView:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityEditableTextFieldIfExists
{
  id v12 = a1;
  if (a1)
  {
    uint64_t v5 = 0;
    SEL v6 = &v5;
    int v7 = 838860800;
    int v8 = 48;
    v9 = __Block_byref_object_copy__21;
    v10 = __Block_byref_object_dispose__21;
    id v11 = 0;
    v4[1] = &v5;
    v4[0] = v12;
    AXPerformSafeBlock();
    id v3 = (id)v6[5];
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    objc_storeStrong(&v11, 0);
    id v13 = v3;
  }
  else
  {
    id v13 = 0;
  }
  id v1 = v13;

  return v1;
}

void __71__UITableViewCellAccessibility__accessibilityEditableTextFieldIfExists__block_invoke(uint64_t a1)
{
  id v1 = (id)[*(id *)(a1 + 32) _editableTextField:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (id)_accessibilityTableViewSwitch
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewCellAccessibility *)self safeValueForKey:@"accessoryView"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([location[0] _accessibilityViewIsVisibleIgnoringAXOverrides:1] & 1) != 0
    || ([(UITableViewCellAccessibility *)v7 safeBoolForKey:@"isEditing"] & 1) != 0
    && (v2 = (id)-[UITableViewCellAccessibility safeValueForKey:](v7, "safeValueForKey:", @"editingAccessoryView"), id v3 = location[0], location[0] = v2, v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& ([location[0] _accessibilityViewIsVisibleIgnoringAXOverrides:1] & 1) != 0)
  {
    id v8 = location[0];
  }
  else
  {
    id v8 = 0;
  }
  objc_storeStrong(location, 0);
  id v4 = v8;

  return v4;
}

- (void)copy:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v3 copy:location[0]];
  [(UITableViewCellAccessibility *)v5 _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B78]];
  objc_storeStrong(location, 0);
}

- (void)cut:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UITableViewCellAccessibility *)v5 _accessibilityIgnoreNextPostPasteboardTextOperation:*MEMORY[0x263F21B78]];
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v3 cut:location[0]];
  [(UITableViewCellAccessibility *)v5 _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21B80]];
  objc_storeStrong(location, 0);
}

- (void)paste:(id)a3
{
  uint64_t v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UITableViewCellAccessibility *)v5 _accessibilityPostPasteboardTextForOperation:*MEMORY[0x263F21BC0]];
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v3 paste:location[0]];
  objc_storeStrong(location, 0);
}

- (void)selectAll:(id)a3
{
  id v8 = self;
  SEL v7 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v3 = (id)[(UITableViewCellAccessibility *)v8 safeValueForKey:@"_tableView"];
  [v3 _performAction:v7 forCell:v8 sender:location];

  UIAccessibilityNotifications notification = *MEMORY[0x263F1CDC8];
  id v5 = accessibilityLocalizedString((id)*MEMORY[0x263F21BE8]);
  UIAccessibilityPostNotification(notification, v5);

  objc_storeStrong(&location, 0);
}

- (void)registerMockChild:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)unregisterMockChild:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_setPopupMenuButton:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16.receiver = v18;
  v16.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v16 _setPopupMenuButton:location[0]];
  objc_initWeak(&v15, location[0]);
  id v4 = objc_loadWeakRetained(&v15);
  uint64_t v5 = [v4 accessibilityTraits];

  v14 = (void *)v5;
  objc_initWeak(v13, v18);
  id v3 = location[0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __52__UITableViewCellAccessibility__setPopupMenuButton___block_invoke;
  v10 = &unk_2650AEBE0;
  objc_copyWeak(&v11, v13);
  objc_copyWeak(v12, &v15);
  v12[1] = v14;
  [v3 _setAccessibilityTraitsBlock:&v6];
  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

uint64_t __52__UITableViewCellAccessibility__setPopupMenuButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = 0;
  LOBYTE(v4) = 0;
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

- (id)_accessibilitySubviewsForAdding
{
  if (a1) {
    id v2 = -[UITableViewCellAccessibility _accessibilitySubviewsForAddingWithSort:](a1, 1);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (id)_accessibilitySubviewsForAddingWithSort:(void *)a1
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v20 = a1;
  char v19 = a2 & 1;
  if (a1)
  {
    id v12 = (id)[v20 safeValueForKey:@"subviews"];
    id v18 = (id)[v12 mutableCopyWithZone:0];

    id location = (id)[v20 safeUIViewForKey:@"contentView"];
    if (([location _accessibilityHasOrderedChildren] & 1) == 0)
    {
      [v18 removeObject:location];
      memset(__b, 0, sizeof(__b));
      id v9 = (id)[v20 safeUIViewForKey:@"contentView"];
      id obj = (id)[v9 subviews];

      uint64_t v11 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
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
          uint64_t v16 = *(void *)(__b[1] + 8 * v7);
          if ([v18 indexOfObjectIdenticalTo:v16] == 0x7FFFFFFFFFFFFFFFLL) {
            [v18 addObject:v16];
          }
          ++v7;
          if (v5 + 1 >= v8)
          {
            uint64_t v7 = 0;
            unint64_t v8 = [obj countByEnumeratingWithState:__b objects:v22 count:16];
            if (!v8) {
              break;
            }
          }
        }
      }
    }
    char v13 = 0;
    BOOL v4 = 0;
    if (v19)
    {
      id v14 = (id)[v20 superview];
      char v13 = 1;
      BOOL v4 = v14 != 0;
    }
    if (v13) {

    }
    if (v4) {
      [v20 _accessibilitySortElementsUsingGeometry:v18];
    }
    id v21 = v18;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    id v21 = 0;
  }
  id v2 = v21;

  return v2;
}

- (id)_checkmarkImage:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility;
  id v6 = [(UITableViewCellAccessibility *)&v5 _checkmarkImage:a3];
  [v6 setAccessibilityIdentifier:@"Checkmark"];
  id v4 = v6;
  objc_storeStrong(&v6, 0);

  return v4;
}

- (int64_t)_accessibilityUserTestingChildrenCount
{
  char v5 = -[UITableViewCellAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:") & 1;
  [(UITableViewCellAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"AXPerformingChildrenCount"];
  id v3 = -[UITableViewCellAccessibility _accessibilityUserTestingChildrenInAccessibilitySortedOrder:](self, 0);
  int64_t v4 = [v3 count];

  [(UITableViewCellAccessibility *)self _accessibilitySetBoolValue:v5 & 1 forKey:@"AXPerformingChildrenCount"];
  return v4;
}

- (id)_accessibilityUserTestingChildrenInAccessibilitySortedOrder:(void *)a1
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  v105 = a1;
  char v104 = a2 & 1;
  if (a1)
  {
    id v103 = -[UITableViewCellAccessibility _accessibilityInternalData](v105);
    id v102 = (id)[v105 _accessibilityChildren];
    id v101 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v102, "count"));
    memset(__b, 0, sizeof(__b));
    id obj = v102;
    uint64_t v61 = [obj countByEnumeratingWithState:__b objects:v114 count:16];
    if (v61)
    {
      uint64_t v57 = *(void *)__b[2];
      uint64_t v58 = 0;
      unint64_t v59 = v61;
      while (1)
      {
        uint64_t v56 = v58;
        if (*(void *)__b[2] != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v100 = *(void *)(__b[1] + 8 * v58);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [v101 addObject:v100];
        }
        ++v58;
        if (v56 + 1 >= v59)
        {
          uint64_t v58 = 0;
          unint64_t v59 = [obj countByEnumeratingWithState:__b objects:v114 count:16];
          if (!v59) {
            break;
          }
        }
      }
    }

    if (*((void *)v103 + 10)) {
      [v101 addObjectsFromArray:*((void *)v103 + 10)];
    }
    id v98 = -[UITableViewCellAccessibility _accessibilitySubviewsForAddingWithSort:](v105, v104 & 1);
    id v97 = (id)[MEMORY[0x263EFF980] array];
    memset(v95, 0, sizeof(v95));
    id v54 = v98;
    uint64_t v55 = [v54 countByEnumeratingWithState:v95 objects:v113 count:16];
    if (v55)
    {
      uint64_t v51 = *(void *)v95[2];
      uint64_t v52 = 0;
      unint64_t v53 = v55;
      while (1)
      {
        uint64_t v50 = v52;
        if (*(void *)v95[2] != v51) {
          objc_enumerationMutation(v54);
        }
        id v96 = *(id *)(v95[1] + 8 * v52);
        if (([v96 accessibilityElementsHidden] & 1) == 0)
        {
          id location = 0;
          memset(v92, 0, sizeof(v92));
          id v48 = v101;
          uint64_t v49 = [v48 countByEnumeratingWithState:v92 objects:v112 count:16];
          if (v49)
          {
            uint64_t v45 = *(void *)v92[2];
            uint64_t v46 = 0;
            unint64_t v47 = v49;
            while (1)
            {
              uint64_t v44 = v46;
              if (*(void *)v92[2] != v45) {
                objc_enumerationMutation(v48);
              }
              id v93 = *(id *)(v92[1] + 8 * v46);
              char v90 = 0;
              char v43 = 1;
              if (v93 != v96)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (char v43 = 1, ([v93 _accessibilityIsViewDescendantOfElement:v96] & 1) == 0))
                {
                  objc_opt_class();
                  char v42 = 0;
                  if (objc_opt_isKindOfClass())
                  {
                    id v91 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v93);
                    char v90 = 1;
                    char v42 = [v91 _accessibilityIsViewDescendantOfElement:v96];
                  }
                  char v43 = v42;
                }
              }
              if (v90) {

              }
              if (v43) {
                break;
              }
              ++v46;
              if (v44 + 1 >= v47)
              {
                uint64_t v46 = 0;
                unint64_t v47 = [v48 countByEnumeratingWithState:v92 objects:v112 count:16];
                if (!v47) {
                  goto LABEL_34;
                }
              }
            }
            objc_storeStrong(&location, v93);
            int v89 = 6;
          }
          else
          {
LABEL_34:
            int v89 = 0;
          }

          if (!location) {
            goto LABEL_45;
          }
          [v101 removeObject:location];
          objc_opt_class();
          char v87 = 0;
          char v41 = 0;
          if (objc_opt_isKindOfClass())
          {
            id v88 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location);
            char v87 = 1;
            char v41 = 0;
            if (v88 == v96)
            {
              objc_opt_class();
              char isKindOfClass = 1;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                char isKindOfClass = objc_opt_isKindOfClass();
              }
              char v41 = isKindOfClass;
            }
          }
          if (v87) {

          }
          if (v41) {
LABEL_45:
          }
            [v97 addObject:v96];
          else {
            [v97 addObject:location];
          }
          objc_storeStrong(&location, 0);
        }
        ++v52;
        if (v50 + 1 >= v53)
        {
          uint64_t v52 = 0;
          unint64_t v53 = [v54 countByEnumeratingWithState:v95 objects:v113 count:16];
          if (!v53) {
            break;
          }
        }
      }
    }

    [v101 addObjectsFromArray:v97];
    id v86 = (id)[v105 _accessibilitySupplementaryHeaderViews];
    memset(v84, 0, sizeof(v84));
    id v37 = (id)[v86 reverseObjectEnumerator];
    id v38 = (id)[v37 allObjects];

    uint64_t v39 = [v38 countByEnumeratingWithState:v84 objects:v111 count:16];
    if (v39)
    {
      uint64_t v34 = *(void *)v84[2];
      uint64_t v35 = 0;
      unint64_t v36 = v39;
      while (1)
      {
        uint64_t v33 = v35;
        if (*(void *)v84[2] != v34) {
          objc_enumerationMutation(v38);
        }
        uint64_t v85 = *(void *)(v84[1] + 8 * v35);
        [v101 insertObject:v85 atIndex:0];
        ++v35;
        if (v33 + 1 >= v36)
        {
          uint64_t v35 = 0;
          unint64_t v36 = [v38 countByEnumeratingWithState:v84 objects:v111 count:16];
          if (!v36) {
            break;
          }
        }
      }
    }

    id v83 = (id)[v105 _accessibilitySupplementaryFooterViews];
    memset(v81, 0, sizeof(v81));
    id v31 = v83;
    uint64_t v32 = [v31 countByEnumeratingWithState:v81 objects:v110 count:16];
    if (v32)
    {
      uint64_t v28 = *(void *)v81[2];
      uint64_t v29 = 0;
      unint64_t v30 = v32;
      while (1)
      {
        uint64_t v27 = v29;
        if (*(void *)v81[2] != v28) {
          objc_enumerationMutation(v31);
        }
        uint64_t v82 = *(void *)(v81[1] + 8 * v29);
        [v101 addObject:v82];
        ++v29;
        if (v27 + 1 >= v30)
        {
          uint64_t v29 = 0;
          unint64_t v30 = [v31 countByEnumeratingWithState:v81 objects:v110 count:16];
          if (!v30) {
            break;
          }
        }
      }
    }

    id v80 = (id)[v105 _accessibilityParentTableView];
    id v79 = (id)[v80 _swipeActionController];
    memset(v78, 0, 0x40uLL);
    char v77 = 0;
    objc_opt_class();
    id v26 = (id)[v79 safeValueForKey:@"swipeOccurrences"];
    id v76 = (id)__UIAccessibilityCastAsClass();

    id v75 = v76;
    objc_storeStrong(&v76, 0);
    id v24 = v75;
    uint64_t v25 = [v75 countByEnumeratingWithState:v78 objects:v109 count:16];
    if (v25)
    {
      uint64_t v21 = *(void *)v78[2];
      uint64_t v22 = 0;
      unint64_t v23 = v25;
      while (1)
      {
        uint64_t v20 = v22;
        if (*(void *)v78[2] != v21) {
          objc_enumerationMutation(v24);
        }
        v78[8] = *(void *)(v78[1] + 8 * v22);
        char v73 = 0;
        objc_opt_class();
        id v72 = (id)__UIAccessibilityCastAsClass();
        if (v73) {
          abort();
        }
        id v71 = v72;
        objc_storeStrong(&v72, 0);
        id v74 = v71;
        id v18 = (id)[v71 indexPath];
        id v17 = (id)[v105 _accessibilityIndexPath];
        char v19 = objc_msgSend(v18, "isEqual:");

        if (v19)
        {
          memset(v69, 0, sizeof(v69));
          id v15 = &unk_26F48ED28;
          uint64_t v16 = [v15 countByEnumeratingWithState:v69 objects:v108 count:16];
          if (v16)
          {
            uint64_t v12 = *(void *)v69[2];
            uint64_t v13 = 0;
            unint64_t v14 = v16;
            while (1)
            {
              uint64_t v11 = v13;
              if (*(void *)v69[2] != v12) {
                objc_enumerationMutation(v15);
              }
              uint64_t v70 = *(void *)(v69[1] + 8 * v13);
              char v67 = 0;
              id v10 = (id)[v74 safeValueForKey:v70];
              id v66 = (id)__UIAccessibilitySafeClass();

              if (v67) {
                abort();
              }
              id v65 = v66;
              objc_storeStrong(&v66, 0);
              id v68 = v65;
              id v64 = (id)[v65 safeArrayForKey:@"_buttons"];
              memset(v62, 0, sizeof(v62));
              id v8 = v64;
              uint64_t v9 = [v8 countByEnumeratingWithState:v62 objects:v107 count:16];
              if (v9)
              {
                uint64_t v5 = *(void *)v62[2];
                uint64_t v6 = 0;
                unint64_t v7 = v9;
                while (1)
                {
                  uint64_t v4 = v6;
                  if (*(void *)v62[2] != v5) {
                    objc_enumerationMutation(v8);
                  }
                  id v63 = *(id *)(v62[1] + 8 * v6);
                  [v63 setAccessibilityContainer:v105];
                  [v101 addObject:v63];
                  ++v6;
                  if (v4 + 1 >= v7)
                  {
                    uint64_t v6 = 0;
                    unint64_t v7 = [v8 countByEnumeratingWithState:v62 objects:v107 count:16];
                    if (!v7) {
                      break;
                    }
                  }
                }
              }

              objc_storeStrong(&v64, 0);
              objc_storeStrong(&v68, 0);
              ++v13;
              if (v11 + 1 >= v14)
              {
                uint64_t v13 = 0;
                unint64_t v14 = [v15 countByEnumeratingWithState:v69 objects:v108 count:16];
                if (!v14) {
                  break;
                }
              }
            }
          }
        }
        objc_storeStrong(&v74, 0);
        ++v22;
        if (v20 + 1 >= v23)
        {
          uint64_t v22 = 0;
          unint64_t v23 = [v24 countByEnumeratingWithState:v78 objects:v109 count:16];
          if (!v23) {
            break;
          }
        }
      }
    }

    id v106 = v101;
    int v89 = 1;
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v86, 0);
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v98, 0);
    objc_storeStrong(&v101, 0);
    objc_storeStrong(&v102, 0);
    objc_storeStrong(&v103, 0);
  }
  else
  {
    id v106 = 0;
  }
  id v2 = v106;

  return v2;
}

- (id)automationElements
{
  return -[UITableViewCellAccessibility _accessibilityUserTestingChildrenInAccessibilitySortedOrder:](self, 1);
}

- (id)_accessibilityInternalData
{
  id v4 = a1;
  if (a1)
  {
    id v3 = (id)[v4 _accessibilityValueForKey:@"AXInternalData"];
    if (!v3)
    {
      id v3 = (id)[objc_allocWithZone((Class)_AXTableViewCellInternal) init];

      [v4 _accessibilitySetRetainedValue:v3 forKey:@"AXInternalData"];
    }
    id v5 = v3;
    objc_storeStrong(&v3, 0);
  }
  else
  {
    id v5 = 0;
  }
  id v1 = v5;

  return v1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v28 = self;
  SEL v27 = a2;
  unint64_t v26 = 0;
  v25.receiver = self;
  v25.super_class = (Class)UITableViewCellAccessibility;
  unint64_t v26 = [(UITableViewCellAccessibility *)&v25 accessibilityTraits];
  id v24 = [(UITableViewCellAccessibility *)v28 _accessibilityParentTableView];
  uint64_t v23 = [(UITableViewCellAccessibility *)v28 accessoryType];
  id v7 = (id)[v24 indexPathsForSelectedRows];
  id v8 = [(UITableViewCellAccessibility *)v28 _accessibilityIndexPath];
  char v21 = 0;
  char v9 = 0;
  if (objc_msgSend(v7, "containsObject:"))
  {
    id v22 = (id)[(UITableViewCellAccessibility *)v28 safeValueForKey:@"isSelected"];
    char v21 = 1;
    char v9 = [v22 BOOLValue];
  }
  if (v21) {

  }
  if (v9)
  {
    if (!v23 || v23 == 3) {
      v26 |= *MEMORY[0x263F1CF38];
    }
  }
  else
  {
    char v16 = 0;
    char v14 = 0;
    char v12 = 0;
    char v6 = 1;
    if ([(UITableViewCellAccessibility *)v28 accessoryType] != 3)
    {
      char v20 = 0;
      id v5 = -[UITableViewCellAccessibility _accessibilityImageViewIfExists](v28);
      id v19 = (id)__UIAccessibilitySafeClass();

      id v18 = v19;
      objc_storeStrong(&v19, 0);
      id v17 = v18;
      char v16 = 1;
      id v15 = (id)[v18 image];
      char v14 = 1;
      id v13 = (id)[v15 accessibilityIdentifier];
      char v12 = 1;
      char v6 = [v13 hasPrefix:@"UIPreferencesBlueCheck"];
    }
    if (v12) {

    }
    if (v14) {
    if (v16)
    }

    if (v6) {
      v26 |= *MEMORY[0x263F1CF38];
    }
  }
  if (-[UITableViewCellAccessibility _accessibilityIsButton](v28)) {
    v26 |= *MEMORY[0x263F1CEE8];
  }
  id v11 = -[UITableViewCellAccessibility _accessibilityTextLabelIfExists](v28);
  if (v11 && ([v11 safeBoolForKey:@"enabled"] & 1) == 0) {
    v26 |= *MEMORY[0x263F1CF20];
  }
  id v10 = [(UITableViewCellAccessibility *)v28 _accessibilityTableViewSwitch];
  if (v10)
  {
    uint64_t v2 = [v10 accessibilityTraits];
    v26 |= v2;
    v26 &= ~*MEMORY[0x263F813E8];
  }
  unint64_t v4 = v26;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v24, 0);
  return v4;
}

- (uint64_t)_accessibilityIsButton
{
  if (a1)
  {
    char v3 = 1;
    if (!-[UITableViewCellAccessibility _accessibilityIsButtonAccessoryType:]((uint64_t)a1, [a1 accessoryType]))
    {
      char v2 = 0;
      if (-[UITableViewCellAccessibility _accessibilityIsButtonAccessoryType:]((uint64_t)a1, [a1 editingAccessoryType]))
      {
        char v2 = [a1 isEditing];
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

- (BOOL)_accessibilityIsButtonAccessoryType:(uint64_t)a1
{
  return a1 && ((unint64_t)(a2 - 1) <= 1 || a2 == 4);
}

- (BOOL)_accessibilityIsInTableCell
{
  return 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  id location[2] = self;
  location[1] = (id)a2;
  uint64_t v8 = 0x7FFFFFFFLL;
  uint64_t v7 = 0;
  uint64_t v9 = 0x7FFFFFFFLL;
  uint64_t v10 = 0;
  uint64_t v5 = 0x7FFFFFFFLL;
  uint64_t v6 = 0;
  location[0] = [(UITableViewCellAccessibility *)self _accessibilityIndexPath];
  if (location[0])
  {
    uint64_t v5 = [location[0] row];
    uint64_t v6 = [location[0] section];
  }
  objc_storeStrong(location, 0);
  NSUInteger v2 = v5;
  NSUInteger v3 = v6;
  result.length = v3;
  result.id location = v2;
  return result;
}

- (BOOL)_accessibilityIsTableCell
{
  return 1;
}

- (BOOL)_accessibilityScrollToVisibleForNextElementRetrieval:(int64_t)a3
{
  id v48 = (UIView *)self;
  SEL v47 = a2;
  int64_t v46 = a3;
  id v45 = (id)[(UITableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (([v45 isScrollEnabled] & 1) == 0) {
    goto LABEL_7;
  }
  [v45 frame];
  uint64_t v40 = v3;
  uint64_t v41 = v4;
  uint64_t v42 = v5;
  double v43 = v6;
  double v44 = v6;
  [(UIView *)v48 frame];
  uint64_t v36 = v7;
  uint64_t v37 = v8;
  uint64_t v38 = v9;
  double v39 = v10;
  if (v10 >= v44)
  {
    [(UIView *)v48 bounds];
    rect.origin.x = v11;
    rect.origin.y = v12;
    rect.size.width = v13;
    rect.size.height = v14;
    if (v46 == 1) {
      rect.origin.y = rect.origin.y + rect.size.height - v44 / 2.0;
    }
    else {
      rect.origin.y = rect.origin.y - (rect.size.height - v44 / 2.0);
    }
    CGRect v50 = UIAccessibilityConvertFrameToScreenCoordinates(rect, v48);
    CGRect v34 = v50;
    objc_msgSend(v45, "_accessibilityScrollToFrame:forView:", v48, v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    [v45 _accessibilityOpaqueElementScrollCleanup];
    char v49 = 1;
    int v33 = 1;
  }
  else
  {
LABEL_7:
    char v32 = [(UIView *)v48 _accessibilityScrollToVisible] & 1;
    if (([v45 isScrollEnabled] & 1) == 0) {
      goto LABEL_25;
    }
    id v31 = 0;
    id v30 = (id)[(UIView *)v48 _accessibilityIndexPath];
    id v29 = 0;
    if (v46 == 1)
    {
      id v15 = -[UITableViewCellAccessibility _accessibilityNextIndexPath](v48);
      id v16 = v31;
      id v31 = v15;

      id v17 = (id)objc_msgSend(v45, "footerViewForSection:", objc_msgSend(v30, "section"));
      id v18 = v29;
      id v29 = v17;
    }
    else if (v46 == 2)
    {
      id v19 = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](v48);
      id v20 = v31;
      id v31 = v19;

      id v21 = (id)objc_msgSend(v45, "headerViewForSection:", objc_msgSend(v30, "section"));
      id v22 = v29;
      id v29 = v21;
    }
    uint64_t v27 = [v30 section];
    if (v27 == [v31 section] || !v29)
    {
      id location = (id)[v45 indexPathsForVisibleRows];
      if (!v31
        || ([location containsObject:v31] & 1) != 0
        || (uint64_t v26 = [v31 section], v26 >= objc_msgSend(v45, "numberOfSections"))
        || (uint64_t v25 = [v31 row],
            v25 >= objc_msgSend(v45, "numberOfRowsInSection:", objc_msgSend(v31, "section"))))
      {
        int v33 = 0;
      }
      else
      {
        uint64_t v23 = 3;
        if (v46 != 1) {
          uint64_t v23 = 1;
        }
        [v45 scrollToRowAtIndexPath:v31 atScrollPosition:v23 animated:0];
        [v45 _accessibilityOpaqueElementScrollCleanup];
        char v49 = 1;
        int v33 = 1;
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      char v49 = v32 & 1;
      int v33 = 1;
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    if (!v33)
    {
LABEL_25:
      char v49 = v32 & 1;
      int v33 = 1;
    }
  }
  objc_storeStrong(&v45, 0);
  return v49 & 1;
}

- (id)_accessibilityNextIndexPath
{
  id v13 = a1;
  if (a1)
  {
    id v12 = (id)[v13 _accessibilityParentTableView];
    id location = (id)[v13 _accessibilityIndexPath];
    if (v12 && location)
    {
      uint64_t v8 = objc_msgSend(v12, "numberOfRowsInSection:", objc_msgSend(location, "section"));
      if (v8 <= [location row] + 1)
      {
        uint64_t v7 = [v12 numberOfSections];
        if (v7 > [location section] + 1)
        {
          uint64_t v9 = [location section] + 1;
          if ([v12 numberOfRowsInSection:v9] > 0)
          {
            id v3 = (id)[MEMORY[0x263F088C8] indexPathForRow:0 inSection:v9];
            id v4 = location;
            id location = v3;
          }
        }
      }
      else
      {
        uint64_t v10 = [location row] + 1;
        id v1 = (id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v10, objc_msgSend(location, "section"));
        id v2 = location;
        id location = v1;
      }
      id v14 = location;
    }
    else
    {
      id v14 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v12, 0);
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v5 = v14;

  return v5;
}

- (id)_accessibilityPreviousIndexPath
{
  id v12 = a1;
  if (a1)
  {
    id v11 = (id)[v12 _accessibilityParentTableView];
    id location = (id)[v12 _accessibilityIndexPath];
    if (v11 && location)
    {
      if ([location row] <= 0)
      {
        if (![location row] && objc_msgSend(location, "section") > 0)
        {
          uint64_t v8 = [location section] - 1;
          uint64_t v7 = [v11 numberOfRowsInSection:v8] - 1;
          if (v7 >= 0)
          {
            id v3 = (id)[MEMORY[0x263F088C8] indexPathForRow:v7 inSection:v8];
            id v4 = location;
            id location = v3;
          }
        }
      }
      else
      {
        uint64_t v9 = [location row] - 1;
        id v1 = (id)objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v9, objc_msgSend(location, "section"));
        id v2 = location;
        id location = v1;
      }
      id v13 = location;
    }
    else
    {
      id v13 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    id v13 = 0;
  }
  uint64_t v5 = v13;

  return v5;
}

- (void)_accessibilityClearChildren
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  if (v13[0])
  {
    objc_msgSend(*((id *)v13[0] + 6), "setAccessibilityContainer:");
    [*((id *)v13[0] + 3) setAccessibilityContainer:0];
    [*((id *)v13[0] + 5) setAccessibilityContainer:0];
    [*((id *)v13[0] + 4) setAccessibilityContainer:0];
    -[UITableTextAccessibilityElement setTextDelegate:](*((id **)v13[0] + 4), 0);
    -[UITableTextAccessibilityElement setAttributeDelegate:](*((id **)v13[0] + 4), 0);
    id WeakRetained = objc_loadWeakRetained((id *)v13[0] + 8);
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v8 = objc_loadWeakRetained((id *)v13[0] + 8);
      [v8 unregisterAllChildren];
    }
    memset(__b, 0, sizeof(__b));
    id obj = *((id *)v13[0] + 1);
    uint64_t v7 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
    if (v7)
    {
      uint64_t v3 = *(void *)__b[2];
      uint64_t v4 = 0;
      unint64_t v5 = v7;
      while (1)
      {
        uint64_t v2 = v4;
        if (*(void *)__b[2] != v3) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(__b[1] + 8 * v4);
        [v12 setAccessibilityContainer:0];
        ++v4;
        if (v2 + 1 >= v5)
        {
          uint64_t v4 = 0;
          unint64_t v5 = [obj countByEnumeratingWithState:__b objects:v14 count:16];
          if (!v5) {
            break;
          }
        }
      }
    }

    [*((id *)v13[0] + 1) removeAllObjects];
    [*((id *)v13[0] + 7) removeAllObjects];
    [*((id *)v13[0] + 10) removeAllObjects];
    objc_storeStrong((id *)v13[0] + 5, 0);
    objc_storeStrong((id *)v13[0] + 3, 0);
    objc_storeStrong((id *)v13[0] + 6, 0);
    objc_storeStrong((id *)v13[0] + 4, 0);
    objc_storeWeak((id *)v13[0] + 8, 0);
    objc_storeStrong(v13, 0);
  }
  objc_storeStrong(v13, 0);
}

- (void)_accessibilityReevaluateChildren
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v26 = a1;
  if (a1 && ([v26 _accessibilityBoolValueForKey:@"InDealloc"] & 1) == 0)
  {
    char v25 = 0;
    id v24 = -[UITableViewCellAccessibility _accessibilitySubviewsForAddingWithSort:](v26, 0);
    char v23 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v24;
    uint64_t v14 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
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
        id v22 = *(id *)(__b[1] + 8 * v11);
        if ([v22 isAccessibilityElement]) {
          char v23 = 1;
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v12) {
            break;
          }
        }
      }
    }

    uint64_t v20 = [v26 accessoryType];
    if (v20 == 2 || v20 == 4) {
      char v23 = 1;
    }
    if (v23)
    {
      id v18 = -[UITableViewCellAccessibility _accessibilityInternalData](v26);
      memset(v16, 0, sizeof(v16));
      id v7 = *((id *)v18 + 1);
      uint64_t v8 = [v7 countByEnumeratingWithState:v16 objects:v27 count:16];
      if (v8)
      {
        uint64_t v4 = *(void *)v16[2];
        uint64_t v5 = 0;
        unint64_t v6 = v8;
        while (1)
        {
          uint64_t v3 = v5;
          if (*(void *)v16[2] != v4) {
            objc_enumerationMutation(v7);
          }
          id v17 = *(id *)(v16[1] + 8 * v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id location = v17;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v1 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v17);
              id v2 = location;
              id location = v1;
            }
            if (location && [v24 indexOfObject:location] != 0x7FFFFFFFFFFFFFFFLL)
            {
              int v19 = 0;
            }
            else
            {
              char v25 = 1;
              int v19 = 4;
            }
            objc_storeStrong(&location, 0);
            if (v19) {
              break;
            }
          }
          ++v5;
          if (v3 + 1 >= v6)
          {
            uint64_t v5 = 0;
            unint64_t v6 = [v7 countByEnumeratingWithState:v16 objects:v27 count:16];
            if (!v6) {
              goto LABEL_30;
            }
          }
        }
      }
      else
      {
LABEL_30:
        int v19 = 0;
      }

      if (v25) {
        [v26 _accessibilityClearChildren];
      }
      objc_storeStrong(&v18, 0);
      int v19 = 0;
    }
    else
    {
      int v19 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
}

- (void)_accessibilitySwitchMockView:(void *)a3 toParent:(void *)a4 withPossibleSubviews:
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v45 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v43 = 0;
  objc_storeStrong(&v43, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  if (v45)
  {
    if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v40 = -[UITableViewCellAccessibility _accessibilityInternalData](v45);
      [location setAccessibilityContainer:v43];
      [v43 registerMockChild:location];
      id v16 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location);
      uint64_t v39 = objc_opt_class();

      memset(__b, 0, sizeof(__b));
      id v17 = v42;
      uint64_t v18 = [v17 countByEnumeratingWithState:__b objects:v46 count:16];
      if (v18)
      {
        uint64_t v13 = *(void *)__b[2];
        uint64_t v14 = 0;
        unint64_t v15 = v18;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)__b[2] != v13) {
            objc_enumerationMutation(v17);
          }
          uint64_t v38 = *(void **)(__b[1] + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || ([v45 _accessibilityLabelShouldBeDistinct:v38] & 1) != 0)
          {
            char v36 = 0;
            char v11 = 1;
            if (([v38 isAccessibilityElement] & 1) == 0) {
              char v11 = [v38 _accessibilityHasOrderedChildren];
            }
            char v36 = v11 & 1;
            char v34 = 0;
            char v32 = 0;
            char v30 = 0;
            char v28 = 0;
            char v10 = 0;
            if (v11)
            {
              char v10 = 0;
              if (objc_opt_isKindOfClass())
              {
                id v8 = (id)[location accessibilityLabel];
                id v35 = v8;
                char v34 = 1;
                id v33 = (id)[v38 _accessibilityAXAttributedLabel];
                char v32 = 1;
                char v9 = 1;
                if (v8 != v33)
                {
                  id v7 = (id)[location accessibilityLabel];
                  id v31 = v7;
                  char v30 = 1;
                  id v29 = (id)[v38 _accessibilityAXAttributedLabel];
                  char v28 = 1;
                  char v9 = objc_msgSend(v7, "isEqualToString:");
                }
                char v10 = v9;
              }
            }
            if (v28) {

            }
            if (v30) {
            if (v32)
            }

            if (v34) {
            if (v10)
            }
            {
              uint64_t v27 = 0;
              unint64_t v6 = (void *)*((void *)v40 + 7);
              uint64_t v21 = MEMORY[0x263EF8330];
              int v22 = -1073741824;
              int v23 = 0;
              id v24 = __91__UITableViewCellAccessibility__accessibilitySwitchMockView_toParent_withPossibleSubviews___block_invoke;
              char v25 = &unk_2650AF380;
              id v26 = v38;
              uint64_t v27 = [v6 indexOfObjectPassingTest:&v21];
              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ([v38 _accessibilityHasOrderedChildren])
                {
                  uint64_t v4 = v38;
                  id v5 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location);
                  objc_msgSend(v4, "_accessibilitySwitchOrderedChildrenFrom:");
                }
                -[UIAccessibilityElementMockView setView:]((id *)location, v38);
                int v41 = 4;
              }
              else
              {
                int v41 = 0;
              }
              objc_storeStrong(&v26, 0);
              if (v41) {
                break;
              }
            }
          }
          ++v14;
          if (v12 + 1 >= v15)
          {
            uint64_t v14 = 0;
            unint64_t v15 = [v17 countByEnumeratingWithState:__b objects:v46 count:16];
            if (!v15) {
              goto LABEL_36;
            }
          }
        }
      }
      else
      {
LABEL_36:
        int v41 = 0;
      }

      objc_storeStrong(&v40, 0);
      int v41 = 0;
    }
    else
    {
      _AXAssert();
      int v41 = 1;
    }
  }
  else
  {
    int v41 = 1;
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&location, 0);
}

BOOL __91__UITableViewCellAccessibility__accessibilitySwitchMockView_toParent_withPossibleSubviews___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v2 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location[0]);
  BOOL v5 = v2 == a1[4];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)prepareForReuse
{
  uint64_t v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v10 prepareForReuse];
  char v9 = (id *)-[UITableViewCellAccessibility _accessibilityInternalData](v12);
  id WeakRetained = objc_loadWeakRetained(v9 + 8);
  objc_opt_class();
  char v7 = 0;
  char v5 = 0;
  BOOL v4 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_loadWeakRetained(v9 + 8);
    char v7 = 1;
    unint64_t v6 = (UITableViewCellAccessibility *)-[UITableViewCellAccessibilityElement existingTableViewCell]((uint64_t)v8);
    char v5 = 1;
    BOOL v4 = v6 == v12;
  }
  if (v5) {

  }
  if (v7) {
  if (v4)
  }
  {
    id v2 = objc_loadWeakRetained(v9 + 8);
    [v2 setTableViewCell:0];
  }
  objc_storeWeak(v9 + 8, 0);
  objc_storeStrong(v9 + 10, 0);
  [(UITableViewCellAccessibility *)v12 _accessibilityRemoveValueForKey:@"AXIsShowingSelectedBackground"];
  [(UITableViewCellAccessibility *)v12 _accessibilityClearChildren];
  objc_storeStrong((id *)&v9, 0);
}

- (void)_didRemoveSubview:(id)a3
{
  char v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v5 _didRemoveSubview:location[0]];
  id v3 = -[UITableViewCellAccessibility _accessibilityInternalDataRetrieveOnly](v7);
  BOOL v4 = v3 == 0;

  if (!v4) {
    -[UITableViewCellAccessibility _accessibilityReevaluateChildren](v7);
  }
  objc_storeStrong(location, 0);
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

- (uint64_t)_accessibilityTableViewIsOpaque
{
  if (a1)
  {
    id v2 = (id)[a1 _accessibilityParentTableView];
    char v3 = [v2 isAccessibilityOpaqueElementProvider] & 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

- (void)_accessibilityReuseChildren:(void *)a3 forMockParent:
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v42 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  id v40 = 0;
  objc_storeStrong(&v40, a3);
  if (v42)
  {
    if (-[UITableViewCellAccessibility _accessibilityTableViewIsOpaque](v42))
    {
      int v39 = 1;
    }
    else
    {
      id v38 = -[UITableViewCellAccessibility _accessibilityInternalData](v42);
      objc_storeWeak((id *)v38 + 8, v40);
      if (location == v42)
      {
        int v39 = 1;
      }
      else
      {
        id v37 = (id)[location _accessibilityValueForKey:@"AXInternalData"];
        if (v37)
        {
          char v36 = 0;
          [*((id *)v38 + 1) removeAllObjects];
          objc_storeStrong((id *)v38 + 5, 0);
          objc_storeStrong((id *)v38 + 3, 0);
          objc_storeStrong((id *)v38 + 4, *((id *)v37 + 4));
          -[UITableTextAccessibilityElement setTextDelegate:](*((id **)v38 + 4), v40);
          -[UITableTextAccessibilityElement setAttributeDelegate:](*((id **)v38 + 4), v40);
          [v40 registerMockChild:*((void *)v38 + 4)];
          [*((id *)v38 + 4) setAccessibilityContainer:v40];
          objc_storeStrong((id *)v38 + 6, *((id *)v37 + 6));
          [v40 registerMockChild:*((void *)v38 + 6)];
          if (*((void *)v37 + 3))
          {
            objc_storeStrong((id *)v38 + 3, *((id *)v37 + 3));
            [v40 registerMockChild:*((void *)v38 + 3)];
          }
          if (*((void *)v37 + 4)
            || ![*((id *)v37 + 1) count]
            || [*((id *)v37 + 7) count])
          {
            if ([*((id *)v37 + 7) count])
            {
              id v33 = -[UITableViewCellAccessibility _accessibilitySubviewsForAdding](v42);
              for (unint64_t i = 0; ; ++i)
              {
                unint64_t v18 = i;
                if (v18 >= [v33 count]) {
                  break;
                }
                id v31 = (id)[v33 objectAtIndex:i];
                if ([v31 _accessibilityViewIsVisible])
                {
                  if (([v31 isAccessibilityElement] & 1) == 0)
                  {
                    memset(v29, 0, sizeof(v29));
                    id v14 = v42;
                    id v15 = (id)[v31 subviews];
                    id v16 = (id)objc_msgSend(v14, "_accessibilityGeometrySortedElements:");

                    uint64_t v17 = [v16 countByEnumeratingWithState:v29 objects:v44 count:16];
                    if (v17)
                    {
                      uint64_t v11 = *(void *)v29[2];
                      uint64_t v12 = 0;
                      unint64_t v13 = v17;
                      while (1)
                      {
                        uint64_t v10 = v12;
                        if (*(void *)v29[2] != v11) {
                          objc_enumerationMutation(v16);
                        }
                        uint64_t v30 = *(void *)(v29[1] + 8 * v12);
                        if ([v33 indexOfObjectIdenticalTo:v30] == 0x7FFFFFFFFFFFFFFFLL) {
                          [v33 addObject:v30];
                        }
                        ++v12;
                        if (v10 + 1 >= v13)
                        {
                          uint64_t v12 = 0;
                          unint64_t v13 = [v16 countByEnumeratingWithState:v29 objects:v44 count:16];
                          if (!v13) {
                            break;
                          }
                        }
                      }
                    }
                  }
                  int v39 = 0;
                }
                else
                {
                  int v39 = 6;
                }
                objc_storeStrong(&v31, 0);
              }
              memset(v27, 0, sizeof(v27));
              id v8 = *((id *)v37 + 7);
              uint64_t v9 = [v8 countByEnumeratingWithState:v27 objects:v43 count:16];
              if (v9)
              {
                uint64_t v5 = *(void *)v27[2];
                uint64_t v6 = 0;
                unint64_t v7 = v9;
                while (1)
                {
                  uint64_t v4 = v6;
                  if (*(void *)v27[2] != v5) {
                    objc_enumerationMutation(v8);
                  }
                  char v28 = *(void **)(v27[1] + 8 * v6);
                  if (v28 != *((void **)v38 + 6)
                    && v28 != *((void **)v37 + 3)
                    && v28 != *((void **)v37 + 5)
                    && ([*((id *)v38 + 1) containsObject:v28] & 1) == 0)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      [*((id *)v38 + 7) addObject:v28];
                      -[UITableViewCellAccessibility _accessibilitySwitchMockView:toParent:withPossibleSubviews:](v42, v28, v40, v33);
                    }
                  }
                  ++v6;
                  if (v4 + 1 >= v7)
                  {
                    uint64_t v6 = 0;
                    unint64_t v7 = [v8 countByEnumeratingWithState:v27 objects:v43 count:16];
                    if (!v7) {
                      break;
                    }
                  }
                }
              }

              objc_storeStrong(&v33, 0);
            }
          }
          else
          {
            [*((id *)v38 + 1) addObjectsFromArray:*((void *)v37 + 1)];
            memset(__b, 0, sizeof(__b));
            id v23 = *((id *)v38 + 1);
            uint64_t v24 = [v23 countByEnumeratingWithState:__b objects:v45 count:16];
            if (v24)
            {
              uint64_t v20 = *(void *)__b[2];
              uint64_t v21 = 0;
              unint64_t v22 = v24;
              while (1)
              {
                uint64_t v19 = v21;
                if (*(void *)__b[2] != v20) {
                  objc_enumerationMutation(v23);
                }
                id v35 = *(id *)(__b[1] + 8 * v21);
                [v35 setAccessibilityContainer:v40];
                [v40 registerMockChild:v35];
                ++v21;
                if (v19 + 1 >= v22)
                {
                  uint64_t v21 = 0;
                  unint64_t v22 = [v23 countByEnumeratingWithState:__b objects:v45 count:16];
                  if (!v22) {
                    break;
                  }
                }
              }
            }
          }
          BOOL v26 = 1;
          if ([*((id *)v37 + 1) count] == 1 && objc_msgSend(*((id *)v38 + 1), "count") == 1) {
            BOOL v26 = *((void *)v37 + 4) != *((void *)v38 + 4);
          }
          [*((id *)v37 + 1) removeAllObjects];
          id v3 = (id)[v42 _accessibilityChildren];
          if (v26) {
            UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], (id)*MEMORY[0x263F21A08]);
          }
        }
        objc_storeStrong(&v37, 0);
        int v39 = 0;
      }
      objc_storeStrong(&v38, 0);
    }
  }
  else
  {
    int v39 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&location, 0);
}

- (void)dealloc
{
  uint64_t v4 = self;
  SEL v3 = a2;
  [(UITableViewCellAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"InDealloc"];
  [(UITableViewCellAccessibility *)v4 _accessibilityClearChildren];
  -[UITableViewCellAccessibility _accessibilityRemoveInternalData](v4);
  v2.receiver = v4;
  v2.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v2 dealloc];
}

- (void)_accessibilityRemoveInternalData
{
  if (result) {
    return (void *)[result _accessibilityRemoveValueForKey:@"AXInternalData"];
  }
  return result;
}

- (id)accessibilityElements
{
  uint64_t v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  return [(UITableViewCellAccessibility *)&v3 accessibilityElements];
}

- (BOOL)_accessibilityUsesOverrideContainerProtocol
{
  id v14 = self;
  SEL v13 = a2;
  if (!_accessibilityUsesOverrideContainerProtocol_BaseNSObjectMethod)
  {
    objc_super v2 = (objc_class *)objc_opt_class();
    _accessibilityUsesOverrideContainerProtocol_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityElementCount);
    objc_super v3 = (objc_class *)objc_opt_class();
    _accessibilityUsesOverrideContainerProtocol_BaseNSObjectAXElementsMethod = (uint64_t)class_getInstanceMethod(v3, sel_accessibilityElements);
  }
  SEL v4 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v4, sel_accessibilityElementCount);
  uint64_t v5 = (objc_class *)objc_opt_class();
  Method v11 = class_getInstanceMethod(v5, sel_accessibilityElements);
  if (InstanceMethod == (Method)_accessibilityUsesOverrideContainerProtocol_BaseNSObjectMethod)
  {
    char v8 = 0;
    BOOL v7 = 1;
    if ((Method)_accessibilityUsesOverrideContainerProtocol_BaseNSObjectAXElementsMethod == v11)
    {
      v10.receiver = v14;
      v10.super_class = (Class)UITableViewCellAccessibility;
      id v9 = [(UITableViewCellAccessibility *)&v10 accessibilityElements];
      char v8 = 1;
      BOOL v7 = [v9 count] != 0;
    }
    if (v8) {

    }
    return v7;
  }
  if (([(UITableViewCellAccessibility *)v14 _accessibilityBoolValueForKey:@"CheckingOverride"] & 1) == 0)return (unint64_t)[(UITableViewCellAccessibility *)v14 accessibilityElementCount] <= 0x7FFFFFFFFFFFFFFELL; {
  return 0;
  }
}

- (void)_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:(id)a3
{
  char v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(UITableViewCellAccessibility *)v8 _accessibilityParentTableView];
  char v4 = [v3 isAccessibilityOpaqueElementProvider];

  if (v4)
  {
    v6.receiver = v8;
    v6.super_class = (Class)UITableViewCellAccessibility;
    [(UITableViewCellAccessibility *)&v6 _accessibilityUpdateContainerElementReferencesIfNeededForNewElements:location[0]];
  }
  else
  {
    id v5 = [(UITableViewCellAccessibility *)v8 _accessibilityMockParent];
    if (v5 == v8) {
      _AXLogWithFacility();
    }
    else {
      [v5 _accessibilityUpdateContainerElementReferencesIfNeededForNewElements:location[0]];
    }
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityContainerElements
{
  id v9 = a1;
  if (a1)
  {
    id v8 = (id)[v9 _accessibilityElements];
    if (v8)
    {
      id v10 = v8;
      int v7 = 1;
    }
    else
    {
      uint64_t v6 = [v9 accessibilityElementCount];
      if (v6 && v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v5 = (id)[MEMORY[0x263EFF980] array];
        for (uint64_t i = 0; i < v6; ++i)
        {
          id v3 = (id)[v9 accessibilityElementAtIndex:i];
          [v5 axSafelyAddObject:v3];
          objc_storeStrong(&v3, 0);
        }
        id v10 = v5;
        int v7 = 1;
        objc_storeStrong(&v5, 0);
      }
      else
      {
        id v10 = 0;
        int v7 = 1;
      }
    }
    objc_storeStrong(&v8, 0);
  }
  else
  {
    id v10 = 0;
  }
  id v1 = v10;

  return v1;
}

- (_NSRange)accessibilityRowRange
{
  int v7 = self;
  v6[1] = (id)a2;
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0;
  uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v13 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v9 = 0;
  v6[0] = (id)[(UITableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  if (v6[0])
  {
    id location = [(UITableViewCellAccessibility *)v7 _accessibilityIndexPath];
    uint64_t v4 = [v6[0] numberOfSections];
    if (v4 > [location section])
    {
      uint64_t v8 = [location row];
      uint64_t v9 = objc_msgSend(v6[0], "numberOfRowsInSection:", objc_msgSend(location, "section"));
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v6, 0);
  NSUInteger v2 = v8;
  NSUInteger v3 = v9;
  result.length = v3;
  result.id location = v2;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  v9[2] = self;
  v9[1] = (id)a2;
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = (uint64_t (*)(void))__71__UITableViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke;
  uint64_t v8 = &unk_2650AE580;
  v9[0] = self;
  int v3 = v7() ^ 1;
  objc_storeStrong(v9, 0);
  return v3 & 1;
}

BOOL __71__UITableViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  unint64_t v18 = (dispatch_once_t *)&AXIsShowingSelectedBackground_block_invoke_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_39);
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
      log = v12;
      os_log_type_t type = v11;
      uint64_t v8 = NSStringFromSelector(sel_accessibilityRowRange);
      uint64_t v4 = v8;
      uint64_t v10 = v4;
      NSUInteger v2 = (objc_class *)objc_opt_class();
      int v7 = NSStringFromClass(v2);
      uint64_t v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXIsShowingSelectedBackground_block_invoke_BaseImplementation;
}

void __71__UITableViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  if (InstanceMethod)
  {
    AXIsShowingSelectedBackground_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      int v7 = NSStringFromSelector(sel_accessibilityRowRange);
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

- (id)_accessibilityMockParent
{
  id v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  id WeakRetained = objc_loadWeakRetained((id *)v4[0] + 8);
  objc_storeStrong(v4, 0);

  return WeakRetained;
}

- (void)_setAccessibilityMockParent:(void *)a1
{
  int v5 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    NSUInteger v2 = (id *)-[UITableViewCellAccessibility _accessibilityInternalData](v5);
    objc_storeWeak(v2 + 8, location);
    objc_storeStrong((id *)&v2, 0);
    int v3 = 0;
  }
  else
  {
    int v3 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityTableViewCellHidesInsertControl
{
  return 0;
}

- (id)_accessibilityIndexPath
{
  uint64_t v17 = self;
  v16[1] = (id)a2;
  v16[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  id WeakRetained = objc_loadWeakRetained((id *)v16[0] + 8);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = (id)-[UITableViewCellAccessibilityElement indexPath]((uint64_t)WeakRetained);
    int v14 = 1;
  }
  else
  {
    uint64_t v6 = 0;
    int v7 = &v6;
    int v8 = 838860800;
    int v9 = 48;
    char v10 = __Block_byref_object_copy__21;
    id v11 = __Block_byref_object_dispose__21;
    id v12 = 0;
    v5[1] = &v6;
    v5[0] = v17;
    AXPerformSafeBlock();
    id v4 = (id)v7[5];
    objc_storeStrong(v5, 0);
    _Block_object_dispose(&v6, 8);
    objc_storeStrong(&v12, 0);
    id v13 = v4;
    id v18 = v4;
    int v14 = 1;
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(v16, 0);
  NSUInteger v2 = v18;

  return v2;
}

void __55__UITableViewCellAccessibility__accessibilityIndexPath__block_invoke(uint64_t a1)
{
  id v5 = (id)[*(id *)(a1 + 32) _accessibilityParentTableView];
  id v1 = (id)[v5 indexPathForCell:*(void *)(a1 + 32)];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  int v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v1;
}

- (BOOL)_accessibilityHasTextOperations
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibility *)self _accessibilityParentTableView];
  char v6 = 0;
  LOBYTE(v3) = 0;
  if (location[0])
  {
    id v7 = (id)[location[0] visibleCells];
    char v6 = 1;
    int v3 = [v7 containsObject:v9] ^ 1;
  }
  if (v6) {

  }
  if (v3)
  {
    char v10 = 0;
  }
  else
  {
    v4.receiver = v9;
    v4.super_class = (Class)UITableViewCellAccessibility;
    char v10 = [(UITableViewCellAccessibility *)&v4 _accessibilityHasTextOperations];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (uint64_t)_accessibilityIsRemoveControlVisible
{
  id v9 = a1;
  if (a1)
  {
    id v8 = (id)[v9 safeValueForKey:@"_editingData"];
    id location = (id)[v8 safeValueForKey:@"_editControl"];
    id v3 = (id)[v9 safeValueForKey:@"editingStyle"];
    uint64_t v4 = (int)[v3 intValue];

    if (location && v4 == 2 && ([v9 _accessibilityTableViewCellHidesInsertControl] & 1) != 0)
    {
      char v10 = 0;
    }
    else
    {
      char v5 = 0;
      LOBYTE(v2) = 0;
      if (v4)
      {
        id v6 = (id)[location superview];
        char v5 = 1;
        LOBYTE(v2) = 0;
        if (v6) {
          int v2 = [location isHiddenOrHasHiddenAncestor] ^ 1;
        }
      }
      char v10 = v2 & 1;
      if (v5) {
    }
      }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

- (uint64_t)_accessibilityIsRemoveConfirmVisible
{
  if (a1) {
    char v2 = [a1 showingDeleteConfirmation] & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (id)_accessibilityCellEditingControl
{
  id v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UITableViewCellAccessibility *)self safeValueForKey:@"_editingData"];
  id v4 = (id)[v5[0] safeValueForKey:@"_editControl"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);

  return v3;
}

- (id)_accessibilityCellReorderControl
{
  id v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)[(UITableViewCellAccessibility *)self safeValueForKey:@"_editingData"];
  id v4 = (id)[v5[0] safeValueForKey:@"_reorderControl"];
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);

  return v3;
}

- (void)_accessibilityHandleRemoveSwitch
{
  uint64_t v46 = a1;
  if (a1)
  {
    id v45 = -[UITableViewCellAccessibility _accessibilityInternalData](v46);
    if (![*((id *)v45 + 1) count])
    {
      int v44 = 1;
LABEL_33:
      objc_storeStrong(&v45, 0);
      return;
    }
    char v42 = 0;
    BOOL v27 = 0;
    if (-[UITableViewCellAccessibility _accessibilityIsRemoveControlVisible](v46))
    {
      id WeakRetained = objc_loadWeakRetained((id *)v45 + 8);
      char v42 = 1;
      BOOL v27 = WeakRetained != 0;
    }
    if (v42) {

    }
    if (!v27)
    {
      if (*((void *)v45 + 4))
      {
        [*((id *)v45 + 4) accessibilityFrame];
        double v28 = v9;
        double v29 = v10;
        double v30 = v11;
        double v32 = v12;
        id v19 = (id)[v46 window];
        id v18 = (id)[v19 windowScene];
        uint64_t v20 = [v18 interfaceOrientation];

        if (UIInterfaceOrientationIsLandscape(v20))
        {
          [*((id *)v45 + 3) accessibilityFrame];
          double v33 = v32 + v13;
          [*((id *)v45 + 3) accessibilityFrame];
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v28, v29 - v14, v30, v33);
        }
        else
        {
          [*((id *)v45 + 3) accessibilityFrame];
          double v31 = v30 + v15;
          [*((id *)v45 + 3) accessibilityFrame];
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v28 - v16, v29, v31, v32);
        }
      }
      id v17 = objc_loadWeakRetained((id *)v45 + 8);
      [v17 unregisterMockChild:*((void *)v45 + 3)];

      [*((id *)v45 + 1) removeObjectIdenticalTo:*((void *)v45 + 3)];
      objc_storeStrong((id *)v45 + 3, 0);
      goto LABEL_32;
    }
    id v41 = (id)[v46 _accessibilityCellEditingControl];
    id location = *((id *)v45 + 3);
    if (location)
    {
      -[UIAccessibilityElementMockView setView:]((id *)location, v41);
      if ([*((id *)v45 + 1) indexOfObjectIdenticalTo:location] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([*((id *)v45 + 1) count]) {
          [*((id *)v45 + 1) insertObject:location atIndex:0];
        }
        else {
          [*((id *)v45 + 1) addObject:location];
        }
      }
    }
    else
    {
      id v25 = objc_allocWithZone((Class)UIAccessibilityElementMockView);
      id v26 = objc_loadWeakRetained((id *)v45 + 8);
      id location = (id)objc_msgSend(v25, "initWithAccessibilityContainer:");

      if (!location)
      {
        int v44 = 1;
        goto LABEL_25;
      }
      if ([*((id *)v45 + 1) count]) {
        [*((id *)v45 + 1) insertObject:location atIndex:0];
      }
      else {
        [*((id *)v45 + 1) addObject:location];
      }
      objc_storeStrong((id *)v45 + 3, location);
      -[UIAccessibilityElementMockView setView:]((id *)location, v41);
      id v24 = objc_loadWeakRetained((id *)v45 + 8);
      [v24 registerMockChild:location];

      if (*((void *)v45 + 4))
      {
        [*((id *)v45 + 4) accessibilityFrame];
        double v34 = v1;
        double v35 = v2;
        double v36 = v3;
        double v38 = v4;
        id v22 = (id)[v46 window];
        id v21 = (id)[v22 windowScene];
        uint64_t v23 = [v21 interfaceOrientation];

        if (UIInterfaceOrientationIsLandscape(v23))
        {
          [location accessibilityFrame];
          double v39 = v38 - v5;
          [location accessibilityFrame];
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v34, v35 + v6, v36, v39);
        }
        else
        {
          [location accessibilityFrame];
          double v37 = v36 - v7;
          [location accessibilityFrame];
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v34 + v8, v35, v37, v38);
        }
      }
    }
    int v44 = 0;
LABEL_25:
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v41, 0);
    if (v44) {
      goto LABEL_33;
    }
LABEL_32:
    int v44 = 0;
    goto LABEL_33;
  }
}

- (id)_accessibilityFindRemoveConfirmSubview
{
  double v4 = a1;
  if (a1)
  {
    if (-[UITableViewCellAccessibility _accessibilityIsRemoveConfirmVisible](v4))
    {
      id v3 = (id)[v4 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_666_0];
      id v5 = (id)[v3 firstObject];
      objc_storeStrong(&v3, 0);
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  double v1 = v5;

  return v1;
}

uint64_t __70__UITableViewCellAccessibility__accessibilityFindRemoveConfirmSubview__block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(&cfstr_Uitableviewcel_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)_accessibilityHandleRemoveConfirm
{
  double v38 = a1;
  if (a1)
  {
    id v37 = -[UITableViewCellAccessibility _accessibilityInternalData](v38);
    if (![*((id *)v37 + 1) count])
    {
      int v36 = 1;
LABEL_28:
      objc_storeStrong(&v37, 0);
      return;
    }
    char v34 = 0;
    BOOL v23 = 0;
    if (-[UITableViewCellAccessibility _accessibilityIsRemoveConfirmVisible](v38))
    {
      id WeakRetained = objc_loadWeakRetained((id *)v37 + 8);
      char v34 = 1;
      BOOL v23 = WeakRetained != 0;
    }
    if (v34) {

    }
    if (!v23)
    {
      if (*((void *)v37 + 5))
      {
        if (*((void *)v37 + 4))
        {
          [*((id *)v37 + 4) accessibilityFrame];
          double v24 = v7;
          double v25 = v8;
          double v26 = v9;
          double v27 = v10;
          id v15 = (id)[v38 window];
          id v14 = (id)[v15 windowScene];
          uint64_t v16 = [v14 interfaceOrientation];

          if (UIInterfaceOrientationIsLandscape(v16))
          {
            [*((id *)v37 + 5) accessibilityFrame];
            objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v24, v25, v26, v27 + v11);
          }
          else
          {
            [*((id *)v37 + 5) accessibilityFrame];
            objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v24, v25, v26 + v12, v27);
          }
        }
        id v13 = objc_loadWeakRetained((id *)v37 + 8);
        [v13 unregisterMockChild:*((void *)v37 + 5)];

        [*((id *)v37 + 1) removeObjectIdenticalTo:*((void *)v37 + 5)];
        objc_storeStrong((id *)v37 + 5, 0);
      }
      goto LABEL_27;
    }
    id v33 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v38);
    id location = *((id *)v37 + 5);
    if (location)
    {
      -[UIAccessibilityElementMockView setView:]((id *)location, v33);
    }
    else
    {
      id v21 = objc_allocWithZone((Class)UIAccessibilityElementMockView);
      id v22 = objc_loadWeakRetained((id *)v37 + 8);
      id location = (id)objc_msgSend(v21, "initWithAccessibilityContainer:");

      if (!location)
      {
        int v36 = 1;
        goto LABEL_19;
      }
      [*((id *)v37 + 1) addObject:location];
      objc_storeStrong((id *)v37 + 5, location);
      -[UIAccessibilityElementMockView setView:]((id *)location, v33);
      id v20 = objc_loadWeakRetained((id *)v37 + 8);
      [v20 registerMockChild:location];

      UIAccessibilityPostNotification(*MEMORY[0x263F812F8], location);
      if (*((void *)v37 + 4))
      {
        [*((id *)v37 + 4) accessibilityFrame];
        double v28 = v1;
        double v29 = v2;
        double v30 = v3;
        double v31 = v4;
        id v18 = (id)[v38 window];
        id v17 = (id)[v18 windowScene];
        uint64_t v19 = [v17 interfaceOrientation];

        if (UIInterfaceOrientationIsLandscape(v19))
        {
          [location accessibilityFrame];
          objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v28, v29, v30, v31 - v5);
        }
        else
        {
          [location accessibilityFrame];
          objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v28, v29, v30 - v6, v31);
        }
      }
    }
    int v36 = 0;
LABEL_19:
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v33, 0);
    if (v36) {
      goto LABEL_28;
    }
LABEL_27:
    int v36 = 0;
    goto LABEL_28;
  }
}

- (BOOL)_accessibilityAlwaysReturnsChild
{
  return 1;
}

- (void)_accessibilityUpdateRemoveControl
{
  if (a1)
  {
    -[UITableViewCellAccessibility _accessibilityHandleRemoveSwitch](a1);
    -[UITableViewCellAccessibility _accessibilityHandleRemoveConfirm](a1);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (BOOL)_accessibilityIsDescendantOfElement:(id)a3
{
  double v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = -[UITableViewCellAccessibility _accessibilityInternalData](v11);
  id v5 = location[0];
  id WeakRetained = objc_loadWeakRetained((id *)v9 + 8);
  BOOL v6 = v5 != WeakRetained;

  if (v6)
  {
    v7.receiver = v11;
    v7.super_class = (Class)UITableViewCellAccessibility;
    char v12 = [(UITableViewCellAccessibility *)&v7 _accessibilityIsDescendantOfElement:location[0]];
  }
  else
  {
    char v12 = 1;
  }
  int v8 = 1;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (BOOL)accessibilityElementIsFocused
{
  double v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  id v8 = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  if ([(UITableViewCellAccessibility *)v10 isAccessibilityElement])
  {
    id WeakRetained = objc_loadWeakRetained((id *)v8 + 8);
    BOOL v6 = WeakRetained == 0;

    if (!v6)
    {
      id v3 = objc_loadWeakRetained((id *)v8 + 8);
      id v4 = location[0];
      location[0] = v3;
    }
  }
  if (!location[0] && *((void *)v8 + 4)) {
    objc_storeStrong(location, *((id *)v8 + 4));
  }
  if (location[0] && location[0] != v10)
  {
    char v11 = [location[0] accessibilityElementIsFocused] & 1;
  }
  else
  {
    v7.receiver = v10;
    v7.super_class = (Class)UITableViewCellAccessibility;
    char v11 = [(UITableViewCellAccessibility *)&v7 accessibilityElementIsFocused];
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (BOOL)_accessibilityAvoidsMockViewContainers
{
  id v5 = self;
  SEL v4 = a2;
  if (-[UITableViewCellAccessibility _accessibilityTableViewIsOpaque](self)) {
    return 1;
  }
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  return [(UITableViewCellAccessibility *)&v3 _accessibilityAvoidsMockViewContainers];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v147 = *MEMORY[0x263EF8340];
  CGPoint v140 = a3;
  id v139 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  char v137 = [v139 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1;
  char v130 = 0;
  char v55 = 0;
  if (!v137)
  {
    uint64_t v131 = MEMORY[0x263EF8330];
    int v132 = -1073741824;
    int v133 = 0;
    v134 = __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v135 = &unk_2650AE580;
    id v136 = v139;
    char v130 = 1;
    v129 = &v136;
    char v55 = ((uint64_t (*)(void))__64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke)();
  }
  if (v55)
  {
    [v139 _accessibilitySetBoolValue:1 forKey:@"AXInHitTestOverride"];
    id v128 = (id)objc_msgSend(v139, "accessibilityHitTest:withEvent:", location[0], v140.x, v140.y);
    [v139 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
    id v141 = v128;
    int v127 = 1;
    objc_storeStrong(&v128, 0);
  }
  else
  {
    int v127 = 0;
  }
  if (v130) {
    objc_storeStrong(v129, 0);
  }
  if (!v127)
  {
    if (([location[0] _accessibilityAutomationHitTest] & 1) == 0)
    {
      if ((unsigned __int16)[location[0] _accessibilityHitTestType] == 3)
      {
        id v141 = (id)objc_msgSend(v139, "__accessibilityHitTest:withEvent:", location[0], v140.x, v140.y);
        int v127 = 1;
        goto LABEL_88;
      }
      goto LABEL_43;
    }
    id v126 = 0;
    id v54 = -[UITableViewCellAccessibility _accessibilityUserTestingChildrenInAccessibilitySortedOrder:](v139, 0);
    id v53 = (id)[v54 reverseObjectEnumerator];
    id v125 = (id)[v53 allObjects];

    os_log_t oslog = (os_log_t)(id)AXLogUIA();
    os_log_type_t type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      id v52 = v139;
      id v51 = (id)[v139 subviews];
      id v122 = v51;
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v146, (uint64_t)v125, (uint64_t)v52, (uint64_t)v122);
      _os_log_debug_impl(&dword_2402B7000, oslog, type, "Cell children: %@ for %@ -> {subviews: %@}", v146, 0x20u);

      objc_storeStrong(&v122, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    memset(__b, 0, sizeof(__b));
    id obj = v125;
    uint64_t v50 = [obj countByEnumeratingWithState:__b objects:v145 count:16];
    if (v50)
    {
      uint64_t v46 = *(void *)__b[2];
      uint64_t v47 = 0;
      unint64_t v48 = v50;
      while (1)
      {
        uint64_t v45 = v47;
        if (*(void *)__b[2] != v46) {
          objc_enumerationMutation(obj);
        }
        id v121 = *(id *)(__b[1] + 8 * v47);
        id v119 = 0;
        NSPoint aPoint = v140;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v139 convertPoint:v121 toView:v140];
          v44.x = v4;
          v44.y = v5;
          NSPoint v117 = v44;
          NSPoint aPoint = v44;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v43 = v139;
            id v41 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v121);
            objc_msgSend(v43, "convertPoint:toView:", v140);
            v42.x = v6;
            v42.y = v7;
            NSPoint v116 = v42;
            NSPoint aPoint = v42;
          }
        }
        os_log_t v115 = (os_log_t)(id)AXLogUIA();
        os_log_type_t v114 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
        {
          id v37 = v115;
          os_log_type_t v38 = v114;
          uint64_t v39 = (uint64_t)v121;
          id v40 = v139;
          int v36 = NSStringFromPoint(aPoint);
          id v113 = v36;
          __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v144, v39, (uint64_t)v40, (uint64_t)v113);
          _os_log_debug_impl(&dword_2402B7000, v37, v38, "hit test: check child %@ [in cell %@] with pt: %@", v144, 0x20u);

          objc_storeStrong(&v113, 0);
        }
        objc_storeStrong((id *)&v115, 0);
        id v8 = (id)[v121 _accessibilityHitTest:location[0] withEvent:aPoint];
        id v9 = v119;
        id v119 = v8;

        if (v119)
        {
          os_log_t v112 = (os_log_t)(id)AXLogUIA();
          os_log_type_t v111 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
          {
            char v34 = v112;
            os_log_type_t v35 = v111;
            __os_log_helper_16_2_1_8_64((uint64_t)v143, (uint64_t)v119);
            _os_log_impl(&dword_2402B7000, v34, v35, "Found tableViewCell result: %@", v143, 0xCu);
          }
          objc_storeStrong((id *)&v112, 0);
          if ([v119 _accessibilityElementIsBeingHitTested])
          {
            os_log_t v110 = (os_log_t)(id)AXLogUIA();
            os_log_type_t v109 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              id v33 = v110;
              __os_log_helper_16_2_1_8_64((uint64_t)v142, (uint64_t)v119);
              _os_log_impl(&dword_2402B7000, v33, v109, "This was the element being hit tested for so returnign that: %@", v142, 0xCu);
            }
            objc_storeStrong((id *)&v110, 0);
            id v141 = v119;
            int v127 = 1;
            goto LABEL_31;
          }
          objc_storeStrong(&v126, v119);
        }
        int v127 = 0;
LABEL_31:
        objc_storeStrong(&v119, 0);
        if (v127) {
          goto LABEL_35;
        }
        ++v47;
        if (v45 + 1 >= v48)
        {
          uint64_t v47 = 0;
          unint64_t v48 = [obj countByEnumeratingWithState:__b objects:v145 count:16];
          if (!v48) {
            break;
          }
        }
      }
    }
    int v127 = 0;
LABEL_35:

    if (!v127)
    {
      if (v126)
      {
        id v141 = v126;
        int v127 = 1;
      }
      else
      {
        int v127 = 0;
      }
    }
    objc_storeStrong(&v125, 0);
    objc_storeStrong(&v126, 0);
    if (!v127)
    {
LABEL_43:
      if (objc_msgSend(v139, "pointInside:withEvent:", location[0], v140.x, v140.y))
      {
        if ([v139 isAccessibilityElement])
        {
          id v32 = v139;
          id v31 = (id)[v139 _accessibilitySupplementaryHeaderViews];
          id v108 = (id)objc_msgSend(v32, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v140.x, v140.y);

          if (v108)
          {
            id v141 = v108;
            int v127 = 1;
          }
          else
          {
            id v30 = v139;
            id v29 = (id)[v139 _accessibilitySupplementaryFooterViews];
            id v108 = (id)objc_msgSend(v30, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v140.x, v140.y);

            if (v108) {
              id v141 = v108;
            }
            else {
              id v141 = v139;
            }
            int v127 = 1;
          }
          objc_storeStrong(&v108, 0);
        }
        else
        {
          UIAccessibilityPointForPoint();
          *(void *)&long long v28 = v10;
          *((void *)&v28 + 1) = v11;
          long long v107 = v28;
          uint64_t v100 = 0;
          id v101 = (id *)&v100;
          int v102 = 838860800;
          int v103 = 48;
          char v104 = __Block_byref_object_copy__21;
          v105 = __Block_byref_object_dispose__21;
          id v106 = 0;
          uint64_t v93 = 0;
          v94 = &v93;
          int v95 = 838860800;
          int v96 = 48;
          id v97 = __Block_byref_object_copy__21;
          id v98 = __Block_byref_object_dispose__21;
          id v99 = 0;
          v87[0] = 0;
          v87[1] = v87;
          int v88 = 0x10000000;
          int v89 = 48;
          char v90 = &unk_24046C852;
          uint64_t v91 = 0;
          uint64_t v92 = 0;
          CGSizeMake_2();
          uint64_t v91 = v12;
          uint64_t v92 = v13;
          v82[0] = 0;
          v82[1] = v82;
          int v83 = 0x10000000;
          int v84 = 48;
          uint64_t v85 = &unk_24046C852;
          long long v86 = 0uLL;
          long long v86 = *MEMORY[0x263F001B0];
          char v81 = [v139 _accessibilityHitTestShouldFallbackToNearestChild] & 1;
          v77[0] = 0;
          v77[1] = v77;
          int v78 = 0x20000000;
          int v79 = 32;
          uint64_t v80 = 0x7FEFFFFFFFFFFFFFLL;
          uint64_t v70 = 0;
          id v71 = &v70;
          int v72 = 838860800;
          int v73 = 48;
          id v74 = __Block_byref_object_copy__21;
          id v75 = __Block_byref_object_dispose__21;
          id v76 = 0;
          id v26 = v139;
          char v27 = [v139 _accessibilityHitTestReverseOrder];
          uint64_t v14 = 2;
          if ((v27 & 1) == 0) {
            uint64_t v14 = 0;
          }
          uint64_t v25 = v14;
          uint64_t v60 = MEMORY[0x263EF8330];
          int v61 = -1073741824;
          int v62 = 0;
          id v63 = __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_686;
          id v64 = &unk_2650AF3A8;
          id v65 = location[0];
          long long v67 = v107;
          v66[1] = v87;
          v66[2] = &v100;
          v66[0] = v139;
          CGPoint v68 = v140;
          char v69 = v81 & 1;
          v66[3] = v77;
          v66[4] = &v70;
          v66[5] = v82;
          v66[6] = &v93;
          [v26 accessibilityEnumerateContainerElementsWithOptions:v25 usingBlock:&v60];
          id v15 = (id)[v139 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
          BOOL v24 = v15 != 0;

          BOOL v59 = v24;
          if (!v101[5] && v59 && ([v139 _accessibilityAlwaysReturnsChild] & 1) != 0)
          {
            if (v81) {
              objc_storeStrong(v101 + 5, (id)v71[5]);
            }
            else {
              objc_storeStrong(v101 + 5, (id)v94[5]);
            }
          }
          if (v101[5])
          {
            id v58 = 0;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_storeStrong(&v58, v101[5]);
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v16 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v101[5]);
              }
              else {
                id v16 = (id)[v101[5] _accessibilityParentView];
              }
              id v17 = v58;
              id v58 = v16;
            }
            [v58 convertPoint:v139 fromView:v140];
            v57[1] = v18;
            v57[2] = v19;
            v57[0] = (id)objc_msgSend(v101[5], "_accessibilityHitTest:withEvent:", location[0], *(double *)&v18, *(double *)&v19);
            if (v57[0])
            {
              if (([v57[0] isAccessibilityElement] & 1) != 0
                || ([v57[0] _accessibilityHasOrderedChildren] & 1) != 0
                || ([v57[0] isAccessibilityOpaqueElementProvider] & 1) != 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                objc_storeStrong(v101 + 5, v57[0]);
              }
              else if (v81 & 1) != 0 && ([(id)v71[5] isAccessibilityElement])
              {
                objc_storeStrong(v101 + 5, (id)v71[5]);
              }
              else if ([(id)v94[5] isAccessibilityElement])
              {
                objc_storeStrong(v101 + 5, (id)v94[5]);
              }
            }
            else if (([v139 _accessibilityAlwaysReturnsChild] & 1) != 0 {
                   && [v101[5] accessibilityElementCount] > 0)
            }
            {
              uint64_t v56 = [v101[5] accessibilityElementCount];
              if (v56 && v56 != 0x7FFFFFFFFFFFFFFFLL)
              {
                id v20 = (id)[v101[5] accessibilityElementAtIndex:0];
                id v21 = v101[5];
                v101[5] = v20;
              }
              else
              {
                objc_storeStrong(v101 + 5, 0);
              }
            }
            objc_storeStrong(v57, 0);
            objc_storeStrong(&v58, 0);
          }
          id v141 = v101[5];
          int v127 = 1;
          objc_storeStrong(v66, 0);
          objc_storeStrong(&v65, 0);
          _Block_object_dispose(&v70, 8);
          objc_storeStrong(&v76, 0);
          _Block_object_dispose(v77, 8);
          _Block_object_dispose(v82, 8);
          _Block_object_dispose(v87, 8);
          _Block_object_dispose(&v93, 8);
          objc_storeStrong(&v99, 0);
          _Block_object_dispose(&v100, 8);
          objc_storeStrong(&v106, 0);
        }
      }
      else
      {
        id v141 = 0;
        int v127 = 1;
      }
    }
  }
LABEL_88:
  objc_storeStrong(location, 0);
  id v22 = v141;

  return v22;
}

BOOL __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v16 = a1;
  uint64_t v15 = a1;
  id v18 = (dispatch_once_t *)&AXIsShowingSelectedBackground_block_invoke_2_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_680);
  if (*v18 != -1) {
    dispatch_once(v18, location);
  }
  objc_storeStrong(&location, 0);
  double v1 = (objc_class *)objc_opt_class();
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
      CGFloat v4 = v8;
      uint64_t v10 = v4;
      double v2 = (objc_class *)objc_opt_class();
      CGFloat v7 = NSStringFromClass(v2);
      id v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXIsShowingSelectedBackground_block_invoke_2_BaseImplementation;
}

void __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  double v1 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    AXIsShowingSelectedBackground_block_invoke_2_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v11 = (id)AXLogCommon();
    char v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      os_log_type_t type = v10;
      CGFloat v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      objc_super v3 = v7;
      id v9 = v3;
      double v2 = (objc_class *)objc_opt_class();
      CGFloat v6 = NSStringFromClass(v2);
      id v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_2402B7000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

void __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_686(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  [location[0] accessibilityFrame];
  v17.origin.x = v2;
  v17.origin.y = v3;
  v17.size.width = v4;
  v17.size.height = v5;
  char v16 = 1;
  if (([location[0] isAccessibilityElement] & 1) == 0) {
    char v16 = [location[0] _accessibilityHasOrderedChildren];
  }
  uint64_t v6 = [location[0] accessibilityTraits];
  if (v6 & *MEMORY[0x263F813E8]) == 0 || ([*(id *)(a1 + 32) _accessibilityAutomationHitTest])
  {
    if (CGRectContainsPoint(v17, *(CGPoint *)(a1 + 96))
      && v17.size.width <= *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32)
      && v17.size.height <= *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      if (v16)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), location[0]);
      }
      else
      {
        id v14 = location[0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", location[0], *(double *)(a1 + 112), *(double *)(a1 + 120));
          id v9 = objc_msgSend(v14, "_accessibilityHitTest:withEvent:", *(void *)(a1 + 32), v7, v8, v14);
        }
        else
        {
          id v9 = objc_msgSend(v14, "_accessibilityHitTest:withEvent:", *(void *)(a1 + 32), *(double *)(a1 + 112), *(double *)(a1 + 120), v14);
        }
        id v10 = v9;
        uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
        id v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      *(CGSize *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v17.size;
    }
    if (*(unsigned char *)(a1 + 128))
    {
      [location[0] accessibilityActivationPoint];
      AX_CGPointGetDistanceToPoint();
      if (v13 < *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), location[0]);
      }
    }
    if (v17.size.width >= *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32)
      && v17.size.height >= *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
      && (v16 & 1) != 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), location[0]);
      *(CGSize *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = v17.size;
    }
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  CGFloat v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  return [(UITableViewCellAccessibility *)&v3 _accessibilitySupplementaryHeaderViews];
}

- (void)setAccessoryView:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(UITableViewCellAccessibility *)v6 safeValueForKey:@"accessoryView"];
  if (v4 != location[0])
  {
    -[UITableViewCellAccessibility _accessibilityReevaluateChildren](v6);
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  v3.receiver = v6;
  v3.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v3 setAccessoryView:location[0]];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

void __49__UITableViewCellAccessibility_setAccessoryView___block_invoke()
{
}

- (id)_accessibilityTextElementText
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  if (*((void *)v8[0] + 4))
  {
    id v10 = (id)[*((id *)v8[0] + 4) accessibilityLabel];
  }
  else
  {
    id v7 = -[UITableViewCellAccessibility _accessibilityEditableTextFieldIfExists](v9);
    id v6 = (id)[v7 accessibilityValue];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = (id)[v6 string];
      id v3 = v6;
      id v6 = v2;
    }
    id v10 = v6;
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong(v8, 0);
  id v4 = v10;

  return v4;
}

- (CGRect)tableTextAccessibleFrame:(id)a3
{
  uint64_t v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v48 = -[UITableViewCellAccessibility _accessibilityInternalData](v50);
  id WeakRetained = (UITableViewCellAccessibility *)objc_loadWeakRetained((id *)v48 + 8);
  char v46 = 0;
  char v44 = 0;
  BOOL v36 = 0;
  if (WeakRetained != v50)
  {
    id v47 = objc_loadWeakRetained((id *)v48 + 8);
    char v46 = 1;
    id v45 = (id)[v47 realTableViewCell];
    char v44 = 1;
    BOOL v36 = v45 == 0;
  }
  if (v44) {

  }
  if (v46) {
  if (v36)
  }
  {
    id v34 = objc_loadWeakRetained((id *)v48 + 8);
    [v34 accessibilityFrame];
    double v51 = v3;
    double v52 = v4;
    double v53 = v5;
    double v54 = v6;
  }
  else
  {
    char v43 = 0;
    uint64_t v42 = AXRequestingClient();
    if (v42 == 3 || v42 == 4) {
      char v43 = 1;
    }
    [(UITableViewCellAccessibility *)v50 bounds];
    v41.origin.x = v7;
    v41.origin.y = v8;
    v41.size.width = v9;
    v41.size.height = v10;
    if (*((void *)v48 + 3) && (v43 & 1) == 0)
    {
      id v33 = (id)-[UIAccessibilityElementMockView view](*((void *)v48 + 3));
      [v33 bounds];
      double v40 = v11;

      v41.origin.x = v40;
      v41.size.width = v41.size.width - v40;
    }
    if (*((void *)v48 + 5))
    {
      id v32 = (id)-[UIAccessibilityElementMockView view](*((void *)v48 + 5));
      [v32 bounds];
      v41.size.width = v41.size.width - v12;
    }
    if (*((void *)v48 + 6))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v31 = (id)-[UIAccessibilityElementMockView view](*((void *)v48 + 6));
        [v31 frame];
        rect.origin.x = v13;
        rect.origin.y = v14;
        rect.size.width = v15;
        rect.size.height = v16;

        CGRectGetMaxX(v41);
        CGRectGetMinX(rect);
      }
    }
    char v37 = 0;
    char v30 = 0;
    if ((-[UITableViewCellAccessibility _accessibilityClientIgnoresReorderControl]() & 1) == 0)
    {
      id v38 = (id)[(UITableViewCellAccessibility *)v50 safeValueForKey:@"showsReorderControl"];
      char v37 = 1;
      char v30 = 0;
      if ([v38 BOOLValue]) {
        char v30 = objc_opt_respondsToSelector();
      }
    }
    if (v37) {

    }
    if (v30)
    {
      id v29 = v50;
      [(UITableViewCellAccessibility *)v50 bounds];
      -[UITableViewCellAccessibility reorderRectForBounds:](v29, "reorderRectForBounds:", v17, v18, v19, v20);
    }
    UIAccessibilityFrameForBounds();
    double v51 = v21;
    double v52 = v22;
    double v53 = v23;
    double v54 = v24;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  double v25 = v51;
  double v26 = v52;
  double v27 = v53;
  double v28 = v54;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (uint64_t)_accessibilityClientIgnoresReorderControl
{
  return 0;
}

- (id)_accessibilityRetrieveTableViewIvarsText
{
  double v12 = self;
  location[1] = (id)a2;
  id v9 = (id)[(UITableViewCellAccessibility *)self safeUIViewForKey:@"contentView"];
  location[0] = -[UIViewAccessibility _accessibilityRetrieveIvarText](v9);

  if (![location[0] length])
  {
    id v2 = -[UIViewAccessibility _accessibilityRetrieveIvarText](v12);
    id v3 = location[0];
    location[0] = v2;
  }
  id v10 = (id)[MEMORY[0x263F089C0] punctuationCharacterSet];
  id v6 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  objc_msgSend(v10, "formUnionWithCharacterSet:");

  id v7 = (id)[location[0] stringByTrimmingCharactersInSet:v10];
  BOOL v8 = [v7 length] != 0;

  if (!v8) {
    objc_storeStrong(location, 0);
  }
  id v5 = location[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)tableTextAccessibleLabel:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(UITableViewCellAccessibility *)v6 _accessibilityRetrieveTableViewCellText];
  objc_storeStrong(location, 0);

  return v4;
}

- (id)tableTextAccessibleStringKey:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 1);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)_accessibilityRetrieveTableViewCellText:(void *)a1
{
  if (a1) {
    id v3 = (id)[a1 _accessibilityRetrieveTableViewCellTextWithLocalizationOptions:a2 shouldExcludeDetailText:0 forReorderControl:0];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)tableTextAccessibleLocalizationBundleID:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 2);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)tableTextAccessibleLocalizationBundlePath:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 3);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)tableTextAccessibleLocalizedTableName:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 4);
  objc_storeStrong(location, 0);

  return v4;
}

- (BOOL)_accessibilityLabelShouldBeDistinct:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[location[0] isAccessibilityUserDefinedElement];
  char v7 = 0;
  char v6 = 1;
  if (([v5 BOOLValue] & 1) == 0)
  {
    uint64_t v3 = [location[0] accessibilityTraits];
    char v6 = 1;
    if ((v3 & *MEMORY[0x263F1CEE8]) == 0)
    {
      id v8 = (id)[location[0] accessibilityIdentification];
      char v7 = 1;
      char v6 = [v8 isEqualToString:*MEMORY[0x263F81488]];
    }
  }
  char v10 = v6 & 1;
  if (v7) {

  }
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (id)_accessibilityRetrieveTableViewCellText
{
  return -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](self, 0);
}

- (id)_accessibilityRetrieveTableViewCellTextForReorderControl
{
  return -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellTextWithLocalizationOptions:shouldExcludeDetailText:forReorderControl:](self, "_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:shouldExcludeDetailText:forReorderControl:", 0, 0, 1, a2, self);
}

- (id)_accessibilityRetrieveTableViewCellTextExcludingDetailText
{
  if (a1) {
    id v2 = (id)[a1 _accessibilityRetrieveTableViewCellTextWithLocalizationOptions:0 shouldExcludeDetailText:1 forReorderControl:0];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityUseElementAtPositionAfterActivation
{
  return ([(UITableViewCellAccessibility *)self _accessibilityViewIsVisible] ^ 1) & 1;
}

- (id)_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:(int64_t)a3 shouldExcludeDetailText:(BOOL)a4 forReorderControl:(BOOL)a5
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  os_log_t v112 = self;
  SEL v111 = a2;
  int64_t v110 = a3;
  BOOL v109 = a4;
  BOOL v108 = a5;
  if ([(UITableViewCellAccessibility *)self _accessibilityBoolValueForKey:_accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl__InSortingSentinel])
  {
    id v113 = @"IN_PROGRESS";
  }
  else
  {
    id v107 = (id)[(UITableViewCellAccessibility *)v112 accessibilityUserDefinedLabel];
    if (v107)
    {
      id v113 = (__CFString *)v107;
      int v106 = 1;
    }
    else
    {
      id v105 = (id)[(UITableViewCellAccessibility *)v112 safeValueForKey:@"accessibilityTableViewCellText"];
      if (![v105 length]
        && ![(UITableViewCellAccessibility *)v112 isAccessibilityElement])
      {
        id v5 = (id)[(UITableViewCellAccessibility *)v112 _accessibilityAXAttributedLabel];
        id v6 = v105;
        id v105 = v5;
      }
      char v104 = [(UITableViewCellAccessibility *)v112 isHidden] & 1;
      if ([(UITableViewCellAccessibility *)v112 _accessibilityLanguageOverriddesUser])id v7 = (id)*MEMORY[0x263F217F0]; {
      else
      }
        id v7 = (id)*MEMORY[0x263F217A8];
      id v103 = v7;
      if (![v105 length])
      {
        id v102 = -[UITableViewCellAccessibility _accessibilityTextLabelIfExists](v112);
        id v101 = -[UITableViewCellAccessibility _accessibilityDetailTextLabelIfExists](v112);
        char v98 = 0;
        if (([v102 _accessibilityViewIsVisible] & 1) != 0 || (v104)
          && ![(UITableViewCellAccessibility *)v112 _accessibilityLabelShouldBeDistinct:v102])
        {
          id v99 = (id)[v102 accessibilityLabel];
          char v98 = 1;
          id v8 = v99;
        }
        else
        {
          id v8 = 0;
        }
        id v100 = v8;
        if (v98) {

        }
        id v76 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        id v9 = (id)objc_msgSend(v100, "stringByTrimmingCharactersInSet:");
        id v10 = v100;
        id v100 = v9;

        id v97 = (id)[v102 accessibilityLanguage];
        if (v97 && v100)
        {
          id v11 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v100];
          id v12 = v100;
          id v100 = v11;

          [v100 setAttribute:v97 forKey:v103];
        }
        char v94 = 0;
        if (([v101 _accessibilityViewIsVisible] & 1) != 0 || (v104)
          && ![(UITableViewCellAccessibility *)v112 _accessibilityLabelShouldBeDistinct:v102])
        {
          id v95 = (id)[v101 accessibilityLabel];
          char v94 = 1;
          id v13 = v95;
        }
        else
        {
          id v13 = 0;
        }
        id location = v13;
        if (v94) {

        }
        id v75 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
        id v14 = (id)objc_msgSend(location, "stringByTrimmingCharactersInSet:");
        id v15 = location;
        id location = v14;

        id v16 = (id)[v101 accessibilityLanguage];
        id v17 = v97;
        id v97 = v16;

        if (v97 && location)
        {
          id v18 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:location];
          id v19 = location;
          id location = v18;

          [location setAttribute:v97 forKey:v103];
        }
        if (([(UITableViewCellAccessibility *)v112 _accessibilityTableCellUsesDetailTextAsValue] & 1) != 0|| v109)
        {
          objc_storeStrong(&location, 0);
        }
        id v54 = location;
        id v20 = (id)__UIAXStringForVariables();
        id v21 = v105;
        id v105 = v20;

        id v93 = (id)objc_msgSend(MEMORY[0x263F81198], "options", v54, @"__AXStringForVariablesSentinel");
        id v92 = -[UITableViewCellAccessibility _accessibilityInternalData](v112);
        id WeakRetained = objc_loadWeakRetained((id *)v92 + 8);
        objc_opt_class();
        char v90 = 0;
        LOBYTE(v74) = 0;
        if (objc_opt_isKindOfClass())
        {
          id v91 = objc_loadWeakRetained((id *)v92 + 8);
          char v90 = 1;
          int v74 = -[UITableViewCellAccessibilityElement usingRealTableViewCell]((uint64_t)v91) ^ 1;
        }
        if (v90) {

        }
        if (v74) {
          [v93 setIncludeHiddenViews:1];
        }
        id v89 = (id)[(UITableViewCellAccessibility *)v112 _badgeText];
        [v93 setShouldUseAllSubviews:1];
        [(UITableViewCellAccessibility *)v112 _accessibilitySetBoolValue:1 forKey:_accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl__InSortingSentinel];
        id v88 = (id)[(UITableViewCellAccessibility *)v112 _accessibilityViewChildrenWithOptions:v93];
        [(UITableViewCellAccessibility *)v112 _accessibilitySetBoolValue:0 forKey:_accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl__InSortingSentinel];
        memset(__b, 0, sizeof(__b));
        id obj = v88;
        uint64_t v72 = [obj countByEnumeratingWithState:__b objects:v114 count:16];
        if (v72)
        {
          uint64_t v68 = *(void *)__b[2];
          uint64_t v69 = 0;
          unint64_t v70 = v72;
          while (1)
          {
            uint64_t v67 = v69;
            if (*(void *)__b[2] != v68) {
              objc_enumerationMutation(obj);
            }
            id v87 = *(id *)(__b[1] + 8 * v69);
            if (v87 != v102 && v87 != v101)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && ([v87 isAccessibilityElement] & 1) != 0
                && ![(UITableViewCellAccessibility *)v112 _accessibilityLabelShouldBeDistinct:v87])
              {
                id v85 = 0;
                if (v110)
                {
                  int64_t v23 = v110;
                  char v22 = 1;
                }
                else
                {
                  int64_t v23 = 0;
                  char v22 = 0;
                }
                if ((v22 & 1) == 0)
                {
                  switch(v23)
                  {
                    case 0:
                      id v24 = (id)[v87 _accessibilityAXAttributedLabel];
                      id v25 = v85;
                      id v85 = v24;

                      id v65 = v85;
                      id v66 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
                      id v26 = (id)objc_msgSend(v65, "stringByTrimmingCharactersInSet:");
                      id v27 = v85;
                      id v85 = v26;

                      break;
                    case 1:
                      id v28 = (id)[v87 accessibilityLocalizedStringKey];
                      id v29 = v85;
                      id v85 = v28;

                      break;
                    case 2:
                      id v30 = (id)[v87 accessibilityLocalizationBundleID];
                      id v31 = v85;
                      id v85 = v30;

                      break;
                    case 3:
                      id v32 = (id)[v87 accessibilityLocalizationBundlePath];
                      id v33 = v85;
                      id v85 = v32;

                      break;
                    case 4:
                      id v34 = (id)[v87 accessibilityLocalizedStringTableName];
                      id v35 = v85;
                      id v85 = v34;

                      break;
                    default:
                      JUMPOUT(0);
                  }
                }
                id v36 = (id)objc_msgSend(v87, "accessibilityLanguage", v53, v56);
                id v37 = v97;
                id v97 = v36;

                if (v97)
                {
                  id v38 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:v85];
                  id v39 = v85;
                  id v85 = v38;

                  [v85 setAttribute:v97 forKey:v103];
                }
                BOOL v84 = 0;
                BOOL v64 = 0;
                if ([v85 isEqualToString:v89]) {
                  BOOL v64 = [v89 length] != 0;
                }
                BOOL v84 = v64;
                if (!v64)
                {
                  id v53 = v85;
                  uint64_t v56 = @"__AXStringForVariablesSentinel";
                  id v40 = (id)__UIAXStringForVariables();
                  id v41 = v105;
                  id v105 = v40;
                }
                objc_storeStrong(&v85, 0);
              }
            }
            ++v69;
            if (v67 + 1 >= v70)
            {
              uint64_t v69 = 0;
              unint64_t v70 = [obj countByEnumeratingWithState:__b objects:v114 count:16];
              if (!v70) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&v88, 0);
        objc_storeStrong(&v89, 0);
        objc_storeStrong(&v92, 0);
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v97, 0);
        objc_storeStrong(&v100, 0);
        objc_storeStrong(&v101, 0);
        objc_storeStrong(&v102, 0);
      }
      if ((objc_msgSend(v105, "isAXAttributedString", v53) & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v62 = v105;
          id v63 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          id v42 = (id)objc_msgSend(v62, "stringByTrimmingCharactersInSet:");
          id v43 = v105;
          id v105 = v42;
        }
      }
      if (![v105 length])
      {
        id v44 = [(UITableViewCellAccessibility *)v112 _accessibilityRetrieveTableViewIvarsText];
        id v45 = v105;
        id v105 = v44;
      }
      uint64_t v83 = AXRequestingClient();
      if (v83 == 3 || v83 == 4)
      {
        id v82 = 0;
        if (([(UITableViewCellAccessibility *)v112 safeBoolForKey:@"_hasEditingAccessoryView"] & 1) == 0&& !v108)
        {
          id v60 = (id)[(UITableViewCellAccessibility *)v112 safeValueForKey:@"editingStyle"];
          int v61 = (void *)(int)[v60 intValue];

          v81[1] = v61;
          if (v61 == (void *)1)
          {
            id v58 = (id)accessibilityUIKitLocalizedString();
            id v55 = v105;
            id v48 = (id)AXCFormattedString();
            id v49 = v82;
            id v82 = v48;
          }
          else if (v61 == (void *)2)
          {
            id v59 = (id)accessibilityUIKitLocalizedString();
            id v55 = v105;
            id v46 = (id)AXCFormattedString();
            id v47 = v82;
            id v82 = v46;
          }
        }
        if (objc_msgSend(v105, "length", v55) && (objc_msgSend(v105, "isAXAttributedString") & 1) != 0 && v82)
        {
          v81[0] = v105;
          id v80 = (id)[objc_alloc(MEMORY[0x263F21660]) initWithString:v82];
          *(void *)&long long v79 = [v80 rangeOfString:v105];
          *((void *)&v79 + 1) = v50;
          if (v50 == [v105 length])
          {
            id v57 = v81[0];
            id v77 = v80;
            long long v78 = v79;
            objc_msgSend(v57, "enumerateAttributesUsingBlock:");
            objc_storeStrong(&v77, 0);
          }
          objc_storeStrong(&v105, v80);
          objc_storeStrong(&v80, 0);
          objc_storeStrong(v81, 0);
        }
        else if (v82)
        {
          objc_storeStrong(&v105, v82);
        }
        objc_storeStrong(&v82, 0);
      }
      id v113 = (__CFString *)v105;
      int v106 = 1;
      objc_storeStrong(&v103, 0);
      objc_storeStrong(&v105, 0);
    }
    objc_storeStrong(&v107, 0);
  }
  double v51 = v113;

  return v51;
}

void __137__UITableViewCellAccessibility__accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&long long v19 = a3;
  *((void *)&v19 + 1) = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  uint64_t v17 = a5;
  uint64_t v16 = a1;
  id v7 = location[0];
  uint64_t v8 = MEMORY[0x263EF8330];
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = __137__UITableViewCellAccessibility__accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl___block_invoke_2;
  id v12 = &unk_2650AF3D0;
  id v13 = *(id *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 40);
  long long v15 = v19;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:");
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __137__UITableViewCellAccessibility__accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl___block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v7 = 0;
  objc_storeStrong(&v7, a3);
  uint64_t v3 = (void *)a1[4];
  id v4 = (void *)a1[8];
  uint64_t v9 = a1[5] + a1[7];
  id location[2] = v4;
  uint64_t v10 = v9;
  id v11 = v4;
  objc_msgSend(v3, "setAttribute:forKey:withRange:", v7, location[0], v9, v4);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didTransitionToState:(unint64_t)a3
{
  id v6 = self;
  SEL v5 = a2;
  unint64_t v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v3 didTransitionToState:a3];
  if (v4 & 2) != 0 || (v4)
  {
    [(UITableViewCellAccessibility *)v6 _accessibilityClearChildren];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  char v6 = [(UITableViewCellAccessibility *)self showingDeleteConfirmation] & 1;
  v5.receiver = v10;
  v5.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v5 setEditing:v8 animated:v7];
  char v4 = [(UITableViewCellAccessibility *)v10 showingDeleteConfirmation] & 1;
  if ((v6 & 1) != v4)
  {
    [(UITableViewCellAccessibility *)v10 _accessibilityClearChildren];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

- (void)_setSwipeContainerView:(id)a3
{
  char v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v4 _setSwipeContainerView:location[0]];
  if (location[0])
  {
    id v3 = location[0];
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(location, 0);
}

void __55__UITableViewCellAccessibility__setSwipeContainerView___block_invoke(id *a1)
{
  argument[2] = a1;
  argument[1] = a1;
  argument[0] = 0;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v1 = (id)[a1[4] _accessibilityFindSubviewDescendant:&__block_literal_global_733];
    id v2 = argument[0];
    argument[0] = v1;
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument[0]);
  objc_storeStrong(argument, 0);
}

uint64_t __55__UITableViewCellAccessibility__setSwipeContainerView___block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  char v3 = 0;
  if (objc_opt_isKindOfClass()) {
    char v3 = [location[0] _accessibilityViewIsVisible];
  }
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)_setShowingDeleteConfirmation:(BOOL)a3
{
  uint64_t v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  char v7 = [(UITableViewCellAccessibility *)self showingDeleteConfirmation] & 1;
  v6.receiver = v10;
  v6.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v6 _setShowingDeleteConfirmation:v8];
  if ((v7 & 1) != v8)
  {
    [(UITableViewCellAccessibility *)v10 _accessibilityClearChildren];
    id argument = 0;
    if (UIAccessibilityIsVoiceOverRunning())
    {
      id v3 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v10);
      id v4 = argument;
      id argument = v3;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
    objc_storeStrong(&argument, 0);
  }
}

- (BOOL)_accessibilityTableViewCellSubclassShouldExist
{
  return 1;
}

- (void)setShowingDeleteConfirmation:(BOOL)a3
{
  uint64_t v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  char v7 = [(UITableViewCellAccessibility *)self showingDeleteConfirmation] & 1;
  v6.receiver = v10;
  v6.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v6 setShowingDeleteConfirmation:v8];
  if ((v7 & 1) != v8)
  {
    [(UITableViewCellAccessibility *)v10 _accessibilityClearChildren];
    id argument = 0;
    if (UIAccessibilityIsVoiceOverRunning())
    {
      id v3 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v10);
      id v4 = argument;
      id argument = v3;
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], argument);
    objc_storeStrong(&argument, 0);
  }
}

- (uint64_t)_axSubviewIgnoredDueToHiddenOrZeroAlphaAncestry:(uint64_t)a1
{
  uint64_t v4 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v4) {
    char v5 = UIAccessibilityViewHasHiddenOrZeroAlphaAncestor() & 1;
  }
  else {
    char v5 = 0;
  }
  objc_storeStrong(&location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 0;
}

- (id)_accessibilityChildren
{
  uint64_t v211 = *MEMORY[0x263EF8340];
  v207 = self;
  SEL v206 = a2;
  char v205 = -[UITableViewCellAccessibility accessibilityIsFetchingChildren]((uint64_t)self) & 1;
  -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v207, 1);
  if (!_accessibilityChildren_DeleteSwitchClass) {
    _accessibilityChildren_DeleteSwitchClass = (uint64_t)NSClassFromString(&cfstr_Uitableviewcel_0.isa);
  }
  id v204 = -[UITableViewCellAccessibility _accessibilityInternalData](v207);
  id v203 = (id)[(UITableViewCellAccessibility *)v207 accessibilityContainer];
  id WeakRetained = objc_loadWeakRetained((id *)v204 + 8);
  LOBYTE(v102) = 0;
  if (!WeakRetained)
  {
    objc_opt_class();
    LOBYTE(v102) = 0;
    if (objc_opt_isKindOfClass()) {
      int v102 = -[UITableViewCellAccessibility _accessibilityTableViewIsOpaque](v207) ^ 1;
    }
  }

  if (v102)
  {
    -[UITableViewAccessibility accessibilityFindMockParentForTableViewCell:](v203, v207);
    id v2 = (id)[(UITableViewCellAccessibility *)v207 _accessibilityValueForKey:@"AXInternalData"];
    id v3 = v204;
    id v204 = v2;

    char v201 = 0;
    BOOL v100 = 1;
    if (v204)
    {
      id v202 = objc_loadWeakRetained((id *)v204 + 8);
      char v201 = 1;
      BOOL v100 = v202 == 0;
    }
    if (v201) {

    }
    if (v100)
    {
      id location = (id)AXLogAppAccessibility();
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        log = location;
        os_log_type_t v99 = type;
        __os_log_helper_16_0_0(v198);
        _os_log_error_impl(&dword_2402B7000, log, v99, "Could not find my mock parent, most likely I am stale.", v198, 2u);
      }
      objc_storeStrong(&location, 0);
      -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v207, v205 & 1);
      [(UITableViewCellAccessibility *)v207 _axSetShouldForceRefreshChildren:0];
      id v208 = 0;
      int v197 = 1;
      goto LABEL_226;
    }
  }
  else
  {
    id v4 = objc_loadWeakRetained((id *)v204 + 8);
    BOOL v97 = v4 != 0;

    if (!v97) {
      objc_storeWeak((id *)v204 + 8, v207);
    }
  }
  char v196 = [(UITableViewCellAccessibility *)v207 isHiddenOrHasHiddenAncestor] & 1;
  if ([(UITableViewCellAccessibility *)v207 _accessibilityUsesOverrideContainerProtocol])
  {
    -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v207, v205 & 1);
    [(UITableViewCellAccessibility *)v207 _axSetShouldForceRefreshChildren:0];
    id v208 = -[UITableViewCellAccessibility _accessibilityContainerElements](v207);
    int v197 = 1;
    goto LABEL_226;
  }
  id v195 = 0;
  if ([0 count] && *((id *)v204 + 1) != v195)
  {
    uint64_t v5 = [v195 mutableCopyWithZone:0];
    objc_super v6 = (void *)*((void *)v204 + 1);
    *((void *)v204 + 1) = v5;

    *((unsigned char *)v204 + 16) = v196 & 1;
  }
  if ([*((id *)v204 + 1) count])
  {
    char v194 = 0;
    if ([(UITableViewCellAccessibility *)v207 _axShouldForceRefreshChildren])
    {
      char v194 = 1;
    }
    else
    {
      char v193 = -[UITableViewCellAccessibility _accessibilityIsRemoveControlVisible](v207) & 1;
      if ((!v193 || *((void *)v204 + 3)) && ((v193 & 1) != 0 || !*((void *)v204 + 3)))
      {
        if ((v196 & 1) != (*((unsigned char *)v204 + 16) & 1)) {
          char v194 = 1;
        }
      }
      else
      {
        char v194 = 1;
      }
    }
    if ((v194 & 1) == 0)
    {
      -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v207, v205 & 1);
      [(UITableViewCellAccessibility *)v207 _axSetShouldForceRefreshChildren:0];
      id v208 = *((id *)v204 + 1);
      int v197 = 1;
      goto LABEL_225;
    }
    id v192 = objc_loadWeakRetained((id *)v204 + 8);
    id v191 = *((id *)v204 + 4);
    [(UITableViewCellAccessibility *)v207 _accessibilityClearChildren];
    id v7 = -[UITableViewCellAccessibility _accessibilityInternalData](v207);
    id v8 = v204;
    id v204 = v7;

    [*((id *)v204 + 1) axSafelyAddObject:v191];
    objc_storeStrong((id *)v204 + 4, v191);
    -[UITableTextAccessibilityElement setTextDelegate:](*((id **)v204 + 4), v192);
    -[UITableTextAccessibilityElement setAttributeDelegate:](*((id **)v204 + 4), v192);
    [v192 registerMockChild:*((void *)v204 + 4)];
    [*((id *)v204 + 4) setAccessibilityContainer:v192];
    objc_storeWeak((id *)v204 + 8, v192);
    objc_storeStrong(&v191, 0);
    objc_storeStrong(&v192, 0);
  }
  *((unsigned char *)v204 + 16) = v196 & 1;
  id v190 = objc_loadWeakRetained((id *)v204 + 8);
  [v190 accessibilityFrame];
  *(void *)&long long v188 = v9;
  *((void *)&v188 + 1) = v10;
  *(void *)&long long v189 = v11;
  *((void *)&v189 + 1) = v12;
  id v187 = (id)[(UITableViewCellAccessibility *)v207 _accessibilityAXAttributedHint];
  id v186 = [(UITableViewCellAccessibility *)v207 _accessibilityRetrieveTableViewCellText];
  char v185 = [(UITableViewCellAccessibility *)v207 _accessibilityIgnoreInternalLabels];
  id v184 = *((id *)v204 + 4);
  if (v184 || !v190)
  {
    [v184 setAccessibilityLabel:0];
  }
  else
  {
    id v13 = (void *)[objc_allocWithZone((Class)UITableTextAccessibilityElement) initWithAccessibilityContainer:v190];
    id v14 = v184;
    id v184 = v13;
  }
  [v190 registerMockChild:v184];
  char v183 = 0;
  id v96 = objc_loadWeakRetained((id *)v204 + 8);
  char v180 = 0;
  if (v96)
  {
    id v181 = objc_loadWeakRetained((id *)v204 + 8);
    char v180 = 1;
    long long v15 = (UITableViewCellAccessibility *)v181;
  }
  else
  {
    long long v15 = v207;
  }
  id v182 = v15;
  if (v180) {

  }
  if ([v186 length])
  {
    [v184 setAccessibilityLabel:v186];
    -[UITableTextAccessibilityElement setTextDelegate:]((id *)v184, v182);
    id v95 = [(UITableViewCellAccessibility *)v207 accessibilityValue];
    objc_msgSend(v184, "setAccessibilityValue:");

    objc_msgSend(v184, "setAccessibilityTraits:", -[UITableViewCellAccessibility accessibilityTraits](v207, "accessibilityTraits"));
    -[UITableTextAccessibilityElement setAttributeDelegate:]((id *)v184, v182);
    char v183 = 1;
  }
  else
  {
    -[UITableTextAccessibilityElement setTextDelegate:]((id *)v184, v182);
    -[UITableTextAccessibilityElement setAttributeDelegate:]((id *)v184, v182);
  }
  id v179 = (id)[*((id *)v204 + 7) copyWithZone:0];
  [*((id *)v204 + 7) removeAllObjects];
  id v178 = -[UITableViewCellAccessibility _accessibilitySubviewsForAdding](v207);
  uint64_t v177 = 0;
  uint64_t v177 = [*((id *)v204 + 1) count];
  char v176 = 0;
  char v175 = 0;
  id v174 = (id)[(UITableViewCellAccessibility *)v207 safeValueForKey:@"_accessoryView"];
  if (v174) {
    [v178 addObject:v174];
  }
  id v173 = 0;
  uint64_t v172 = 0;
  uint64_t v171 = 0;
  while (1)
  {
    unint64_t v94 = v172;
    if (v94 >= [v178 count]) {
      break;
    }
    id v170 = (id)[v178 objectAtIndex:v172];
    if (objc_opt_isKindOfClass())
    {
      int v197 = 4;
      goto LABEL_153;
    }
    char v168 = 0;
    char v93 = 1;
    if (v170 != v174)
    {
      id v169 = (id)[v170 accessibilityIdentification];
      char v168 = 1;
      char v93 = [v169 isEqualToString:@"UITableViewCellAccessoryDetailButton"];
    }
    if (v168) {

    }
    if (v93)
    {
      int v197 = 4;
      goto LABEL_153;
    }
    if ([v170 accessibilityElementsHidden])
    {
      int v197 = 4;
      goto LABEL_153;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [(UITableViewCellAccessibility *)v207 _accessibilityLabelShouldBeDistinct:v170])
    {
      id v91 = v170;
      id v18 = [(UITableViewCellAccessibility *)v207 _accessibilityTableViewSwitch];
      BOOL v92 = v91 != v18;

      if (!v92)
      {
        char v167 = 0;
        objc_opt_class();
        id v166 = (id)__UIAccessibilityCastAsSafeCategory();
        if (v167) {
          abort();
        }
        id v165 = v166;
        objc_storeStrong(&v166, 0);
        id v90 = v165;
        [v165 _accessibilitySetIsAccessibleViaTableViewCell:1];
      }
      BOOL v164 = 0;
      BOOL v89 = 0;
      if ([v170 isAccessibilityElement])
      {
        [v170 alpha];
        BOOL v89 = v19 > 0.0;
      }
      BOOL v164 = v89;
      char v162 = 0;
      char v160 = 0;
      BOOL v88 = 0;
      if (v89)
      {
        id v87 = v170;
        id v163 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v207);
        char v162 = 1;
        BOOL v88 = 0;
        if (v87 != v163)
        {
          id v86 = v170;
          id v161 = [(UITableViewCellAccessibility *)v207 _accessibilityCellEditingControl];
          char v160 = 1;
          BOOL v88 = v86 != v161;
        }
      }
      BOOL v164 = v88;
      if (v160) {

      }
      if (v162) {
      BOOL v159 = 0;
      }
      if (v164) {
        int v85 = -[UITableViewCellAccessibility _axSubviewIgnoredDueToHiddenOrZeroAlphaAncestry:]((uint64_t)v207, v170) & 1;
      }
      else {
        int v85 = 1;
      }
      BOOL v159 = v85 != 0;
      if (!v164 || v159)
      {
        id v151 = (id)[v170 superview];
        char v150 = 0;
        while (1)
        {
          BOOL v68 = 0;
          if (v151) {
            BOOL v68 = v151 != v207;
          }
          if (!v68) {
            break;
          }
          if ([v151 accessibilityElementsHidden])
          {
            char v150 = 1;
            break;
          }
          id v23 = (id)[v151 superview];
          id v24 = v151;
          id v151 = v23;
        }
        if (v150)
        {
          int v197 = 4;
        }
        else
        {
          if (([v170 isAccessibilityElement] & 1) == 0
            && ([v170 accessibilityElementsHidden] & 1) == 0)
          {
            uint64_t v149 = 0;
            uint64_t v149 = [v170 accessibilityElementCount];
            if (v149 == 0x7FFFFFFFFFFFFFFFLL || v149 <= 0)
            {
              id v144 = (id)[v170 subviews];
              id v26 = (id)[(UITableViewCellAccessibility *)v207 _accessibilityGeometrySortedElements:v144];
              id v27 = v144;
              id v144 = v26;

              memset(v142, 0, sizeof(v142));
              id v64 = v144;
              uint64_t v65 = [v64 countByEnumeratingWithState:v142 objects:v209 count:16];
              if (v65)
              {
                uint64_t v61 = *(void *)v142[2];
                uint64_t v62 = 0;
                unint64_t v63 = v65;
                while (1)
                {
                  uint64_t v60 = v62;
                  if (*(void *)v142[2] != v61) {
                    objc_enumerationMutation(v64);
                  }
                  uint64_t v143 = *(void *)(v142[1] + 8 * v62);
                  if ([v178 indexOfObjectIdenticalTo:v143] == 0x7FFFFFFFFFFFFFFFLL) {
                    [v178 addObject:v143];
                  }
                  ++v62;
                  if (v60 + 1 >= v63)
                  {
                    uint64_t v62 = 0;
                    unint64_t v63 = [v64 countByEnumeratingWithState:v142 objects:v209 count:16];
                    if (!v63) {
                      break;
                    }
                  }
                }
              }

              objc_storeStrong(&v144, 0);
            }
            else
            {
              if ([(UITableViewCellAccessibility *)v207 _accessibilityAvoidsMockViewContainers])
              {
                [v170 setAccessibilityContainer:v207];
                [v170 _setAccessibilityShouldUseViewHierarchyForFindingScrollParent:1];
                [*((id *)v204 + 1) addObject:v170];
              }
              else
              {
                id v67 = objc_loadWeakRetained((id *)v204 + 8);
                char v146 = 0;
                if (v67)
                {
                  id v147 = objc_loadWeakRetained((id *)v204 + 8);
                  char v146 = 1;
                  id v25 = (UITableViewCellAccessibility *)v147;
                }
                else
                {
                  id v25 = v207;
                }
                v148 = v25;
                if (v146) {

                }
                id v145 = (id)[objc_allocWithZone((Class)UIAccessibilityElementMockView) initWithAccessibilityContainer:v148];
                [v145 setIsAccessibilityElement:0];
                -[UIAccessibilityElementMockView setView:]((id *)v145, v170);
                [*((id *)v204 + 1) addObject:v145];
                id v66 = objc_loadWeakRetained((id *)v204 + 8);
                [v66 registerMockChild:v145];

                [*((id *)v204 + 7) addObject:v145];
                objc_storeStrong(&v145, 0);
                objc_storeStrong((id *)&v148, 0);
              }
              char v175 = 1;
            }
          }
          int v197 = 0;
        }
        objc_storeStrong(&v151, 0);
        if (!v197) {
LABEL_152:
        }
          int v197 = 0;
      }
      else
      {
        id v158 = 0;
        memset(__b, 0, sizeof(__b));
        id v83 = v179;
        uint64_t v84 = [v83 countByEnumeratingWithState:__b objects:v210 count:16];
        if (v84)
        {
          uint64_t v80 = *(void *)__b[2];
          uint64_t v81 = 0;
          unint64_t v82 = v84;
          while (1)
          {
            uint64_t v79 = v81;
            if (*(void *)__b[2] != v80) {
              objc_enumerationMutation(v83);
            }
            id v157 = *(id *)(__b[1] + 8 * v81);
            id v77 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v157);
            objc_opt_class();
            BOOL v78 = 0;
            if (objc_opt_isKindOfClass()) {
              BOOL v78 = -[UIAccessibilityElementMockView subviewIndex]((uint64_t)v157) == v172;
            }

            if (v78) {
              break;
            }
            ++v81;
            if (v79 + 1 >= v82)
            {
              uint64_t v81 = 0;
              unint64_t v82 = [v83 countByEnumeratingWithState:__b objects:v210 count:16];
              if (!v82) {
                goto LABEL_98;
              }
            }
          }
          objc_storeStrong(&v158, v157);
          int v197 = 5;
        }
        else
        {
LABEL_98:
          int v197 = 0;
        }

        id v75 = (id)[v158 accessibilityIdentification];
        char v76 = [v75 isEqualToString:@"UITableCellViewDisclosure"];

        if (v76)
        {
          objc_storeStrong(&v173, v170);
          int v197 = 4;
        }
        else
        {
          char v155 = 0;
          char v74 = 1;
          if (!-[UITableViewCellAccessibility _accessibilityAvoidsMockViewContainers](v207, "_accessibilityAvoidsMockViewContainers"))char v74 = [v170 _accessibilityAvoidsMockViewContainers]; {
          char v155 = v74 & 1;
          }
          if (v74)
          {
            [v170 _setAccessibilityShouldUseViewHierarchyForFindingScrollParent:1];
            id v71 = v170;
            id v72 = objc_loadWeakRetained((id *)v204 + 8);
            objc_msgSend(v71, "setAccessibilityContainer:");

            id v73 = objc_loadWeakRetained((id *)v204 + 8);
            [v73 registerMockChild:v170];

            [*((id *)v204 + 1) addObject:v170];
          }
          else
          {
            id v70 = objc_loadWeakRetained((id *)v204 + 8);
            char v152 = 0;
            if (v70)
            {
              id v153 = objc_loadWeakRetained((id *)v204 + 8);
              char v152 = 1;
              id v20 = (UITableViewCellAccessibility *)v153;
            }
            else
            {
              id v20 = v207;
            }
            id v154 = v20;
            if (v152) {

            }
            if (v158)
            {
              [v158 setAccessibilityContainer:v154];
            }
            else
            {
              id v21 = (void *)[objc_allocWithZone((Class)UIAccessibilityElementMockView) initWithAccessibilityContainer:v154];
              id v22 = v158;
              id v158 = v21;
            }
            if (([*((id *)v204 + 1) containsObject:v158] & 1) == 0)
            {
              id v69 = objc_loadWeakRetained((id *)v204 + 8);
              [v69 registerMockChild:v158];

              [*((id *)v204 + 1) addObject:v158];
            }
            -[UIAccessibilityElementMockView setSubviewIndex:]((uint64_t)v158, v172);
            -[UIAccessibilityElementMockView setView:]((id *)v158, v170);
            [*((id *)v204 + 7) addObject:v158];
            objc_storeStrong(&v154, 0);
          }
          ++v171;
          char v175 = 1;
          int v197 = 0;
        }
        objc_storeStrong(&v158, 0);
        if (!v197) {
          goto LABEL_152;
        }
      }
    }
    else
    {
      if (!*((void *)v204 + 10))
      {
        id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
        uint64_t v17 = (void *)*((void *)v204 + 10);
        *((void *)v204 + 1UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v16;
      }
      if (([v170 isAccessibilityElement] & 1) != 0
        && ([*((id *)v204 + 10) containsObject:v170] & 1) == 0)
      {
        [*((id *)v204 + 10) addObject:v170];
      }
      int v197 = 4;
    }
LABEL_153:
    objc_storeStrong(&v170, 0);
    ++v172;
  }
  if ((v183 & 1) == 0 && (v176 & 1) == 0)
  {
    id v141 = [(UITableViewCellAccessibility *)v207 _accessibilityRetrieveTableViewIvarsText];
    if ([v141 length])
    {
      [v184 setAccessibilityLabel:v141];
      char v183 = 1;
    }
    char v139 = 0;
    char v137 = 0;
    BOOL v59 = 0;
    if ((v183 & 1) == 0)
    {
      BOOL v59 = 0;
      if ((v175 & 1) == 0)
      {
        id v28 = (objc_class *)objc_opt_class();
        CGPoint v140 = NSStringFromClass(v28);
        char v139 = 1;
        id v29 = (objc_class *)objc_opt_class();
        v138 = NSStringFromClass(v29);
        char v137 = 1;
        BOOL v59 = 0;
        if (!-[NSString isEqualToString:](v140, "isEqualToString:")) {
          BOOL v59 = [(UITableViewCellAccessibility *)v207 _accessibilityTableViewCellSubclassShouldExist];
        }
      }
    }
    if (v137) {

    }
    if (v139) {
    if (v59)
    }
    {
      [v184 setAccessibilityLabel:@" "];
      char v183 = 1;
    }
    objc_storeStrong(&v141, 0);
  }
  id v57 = (id)[(UITableViewCellAccessibility *)v207 window];
  id v56 = (id)[v57 windowScene];
  uint64_t v58 = [v56 interfaceOrientation];

  uint64_t v136 = v58;
  if ([(UITableViewCellAccessibility *)v207 _accessibilityIsTouchContainer]) {
    char v185 = 1;
  }
  if ((v183 & 1) != 0 || (v176) && (v185 & 1) == 0)
  {
    long long v134 = v188;
    long long v135 = v189;
    long long v132 = v188;
    long long v133 = v189;
    long long v130 = v188;
    long long v131 = v189;
    objc_msgSend(v184, "setAccessibilityFrame:", v188, v189);
    if (([*((id *)v204 + 1) containsObject:v184] & 1) == 0)
    {
      if ([*((id *)v204 + 1) count] == v177
        || (unint64_t v55 = v177, v55 > [*((id *)v204 + 1) count]))
      {
        [*((id *)v204 + 1) addObject:v184];
      }
      else
      {
        [*((id *)v204 + 1) insertObject:v184 atIndex:v177];
      }
    }
    objc_storeStrong((id *)v204 + 4, v184);
    [v184 setAccessibilityHint:v187];
  }
  double v129 = 0.0;
  -[UITableViewCellAccessibility _accessibilityHandleRemoveSwitch](v207);
  -[UITableViewCellAccessibility _accessibilityHandleRemoveConfirm](v207);
  if (!v173)
  {
    uint64_t v128 = [(UITableViewCellAccessibility *)v207 accessoryType];
    if (v128 == 2 || v128 == 4)
    {
      char v126 = 0;
      char v124 = 0;
      if ([(UITableViewCellAccessibility *)v207 isEditing])
      {
        id v30 = (id)[(UITableViewCellAccessibility *)v207 safeUIViewForKey:@"_editingAccessoryView"];
        id v127 = v30;
        char v126 = 1;
      }
      else
      {
        id v30 = (id)[(UITableViewCellAccessibility *)v207 safeUIViewForKey:@"_accessoryView"];
        id v125 = v30;
        char v124 = 1;
      }
      objc_storeStrong(&v173, v30);
      if (v124) {

      }
      if (v126) {
    }
      }
    char v122 = 0;
    BOOL v54 = 1;
    if ([v173 isAccessibilityElement])
    {
      id v123 = (id)[v173 superview];
      char v122 = 1;
      BOOL v54 = v123 == 0;
    }
    if (v122) {

    }
    if (v54) {
      objc_storeStrong(&v173, 0);
    }
  }
  if (v173)
  {
    id v121 = *((id *)v204 + 6);
    if (!v121)
    {
      id v53 = objc_loadWeakRetained((id *)v204 + 8);
      char v118 = 0;
      if (v53)
      {
        id v119 = objc_loadWeakRetained((id *)v204 + 8);
        char v118 = 1;
        id v31 = (UITableViewCellAccessibility *)v119;
      }
      else
      {
        id v31 = v207;
      }
      v120 = v31;
      if (v118) {

      }
      id v32 = (void *)[objc_allocWithZone((Class)UIAccessibilityElementMockView) initWithAccessibilityContainer:v120];
      id v33 = v121;
      id v121 = v32;

      objc_storeStrong((id *)&v120, 0);
    }
    -[UIAccessibilityElementMockView setView:]((id *)v121, v173);
    [*((id *)v204 + 1) addObject:v121];
    objc_storeStrong((id *)v204 + 6, v121);
    id v52 = objc_loadWeakRetained((id *)v204 + 8);
    [v52 registerMockChild:v121];

    if (UIInterfaceOrientationIsLandscape(v136))
    {
      [v121 accessibilityFrame];
      uint64_t v114 = v34;
      uint64_t v115 = v35;
      uint64_t v116 = v36;
      double v117 = v37;
      double v129 = v129 + v37;
    }
    else
    {
      [v121 accessibilityFrame];
      uint64_t v110 = v38;
      uint64_t v111 = v39;
      double v112 = v40;
      uint64_t v113 = v41;
      double v129 = v129 + v40;
    }
    objc_storeStrong(&v121, 0);
  }
  if (v129 > 0.0 && *((void *)v204 + 4))
  {
    long long v108 = 0u;
    long long v109 = 0u;
    [*((id *)v204 + 4) accessibilityFrame];
    *(void *)&long long v108 = v42;
    *((void *)&v108 + 1) = v43;
    *(void *)&long long v109 = v44;
    *((void *)&v109 + 1) = v45;
    if (UIInterfaceOrientationIsLandscape(v136)) {
      *((double *)&v109 + 1) = *((double *)&v109 + 1) - v129;
    }
    else {
      *(double *)&long long v109 = *(double *)&v109 - v129;
    }
    objc_msgSend(*((id *)v204 + 4), "setAccessibilityFrame:", v108, v109);
  }
  id v107 = *((id *)v204 + 1);
  char v105 = 0;
  char v103 = 0;
  char v51 = 1;
  if (![(UITableViewCellAccessibility *)v207 _accessibilityShouldSortTableViewCellChildren])
  {
    id v106 = objc_loadWeakRetained((id *)v204 + 8);
    char v105 = 1;
    objc_opt_class();
    char v50 = 0;
    if (objc_opt_isKindOfClass())
    {
      id v104 = objc_loadWeakRetained((id *)v204 + 8);
      char v103 = 1;
      char v50 = -[UITableViewCellAccessibilityElement usingRealTableViewCell]((uint64_t)v104);
    }
    char v51 = v50;
  }
  if (v103) {

  }
  if (v105) {
  if (v51)
  }
  {
    id v46 = (void *)[v107 mutableCopy];
    id v47 = v107;
    id v107 = v46;

    [(UITableViewCellAccessibility *)v207 _accessibilitySortElementsUsingGeometry:v107];
    objc_storeStrong((id *)v204 + 1, v107);
  }
  -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v207, v205 & 1);
  [(UITableViewCellAccessibility *)v207 _axSetShouldForceRefreshChildren:0];
  id v208 = v107;
  int v197 = 1;
  objc_storeStrong(&v107, 0);
  objc_storeStrong(&v173, 0);
  objc_storeStrong(&v174, 0);
  objc_storeStrong(&v178, 0);
  objc_storeStrong(&v179, 0);
  objc_storeStrong(&v182, 0);
  objc_storeStrong(&v184, 0);
  objc_storeStrong(&v186, 0);
  objc_storeStrong(&v187, 0);
  objc_storeStrong(&v190, 0);
LABEL_225:
  objc_storeStrong(&v195, 0);
LABEL_226:
  objc_storeStrong(&v203, 0);
  objc_storeStrong(&v204, 0);
  id v48 = v208;

  return v48;
}

- (uint64_t)accessibilityIsFetchingChildren
{
  if (a1) {
    char v2 = *(unsigned char *)(a1 + 8) & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (uint64_t)accessibilitySetIsFetchingChildren:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2 & 1;
  }
  return result;
}

- (BOOL)_accessibilityShouldSortTableViewCellChildren
{
  return 0;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  uint64_t v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v37 = 0;
  objc_storeStrong(&v37, a4);
  [location[0] accessibilityFrame];
  *(void *)&long long v35 = v4;
  *((void *)&v35 + 1) = v5;
  *(void *)&long long v36 = v6;
  *((void *)&v36 + 1) = v7;
  [v37 accessibilityFrame];
  *(void *)&long long v33 = v8;
  *((void *)&v33 + 1) = v9;
  *(void *)&long long v34 = v10;
  *((void *)&v34 + 1) = v11;
  if (([MEMORY[0x263F1CBC8] _transformLayerRotationsAreEnabled] & 1) == 0)
  {
    id v23 = (id)[(UITableViewCellAccessibility *)v39 window];
    id v22 = (id)[v23 windowScene];
    uint64_t v24 = [v22 interfaceOrientation];

    uint64_t v32 = v24;
    UIAccessibilityConvertRectToPortraitCoordinates();
    *(void *)&long long v30 = v12;
    *((void *)&v30 + 1) = v13;
    *(void *)&long long v31 = v14;
    *((void *)&v31 + 1) = v15;
    long long v35 = v30;
    long long v36 = v31;
    UIAccessibilityConvertRectToPortraitCoordinates();
    *(void *)&long long v28 = v16;
    *((void *)&v28 + 1) = v17;
    *(void *)&long long v29 = v18;
    *((void *)&v29 + 1) = v19;
    long long v33 = v28;
    long long v34 = v29;
  }
  double v41 = *(double *)&v35 - *(double *)&v33;
  if (fabs(*(double *)&v35 - *(double *)&v33) >= 2.0)
  {
    v26.receiver = v39;
    v26.super_class = (Class)UITableViewCellAccessibility;
    int64_t v40 = [(UITableViewCellAccessibility *)&v26 _accessibilityCompareElement:location[0] toElement:v37];
    int v27 = 1;
  }
  else
  {
    uint64_t v20 = 1;
    if (*((double *)&v35 + 1) < *((double *)&v33 + 1)) {
      uint64_t v20 = -1;
    }
    int64_t v40 = v20;
    int v27 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (double)_accessibilityAllowedGeometryOverlapX
{
  return 20.0;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = (id)[(UITableViewCellAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81350]];
  if (location[0])
  {
    [location[0] doubleValue];
    double v7 = v2;
  }
  else
  {
    [(UITableViewCellAccessibility *)v6 bounds];
    double v7 = v3;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)editControlWasClicked:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)AXRetainAutorelease();
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v4 editControlWasClicked:location[0]];
  -[UITableViewCellAccessibility _accessibilityUpdateRemoveControl](v6);
  objc_storeStrong(location, 0);
}

- (void)deleteConfirmationControlWasClicked:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)AXRetainAutorelease();
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v4 deleteConfirmationControlWasClicked:location[0]];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  objc_storeStrong(location, 0);
}

- (void)deleteConfirmationControlWasCancelled:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)AXRetainAutorelease();
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v4 deleteConfirmationControlWasCancelled:location[0]];
  -[UITableViewCellAccessibility _accessibilityUpdateRemoveControl](v6);
  objc_storeStrong(location, 0);
}

- (id)accessibilityValue
{
  uint64_t v13 = self;
  v12[1] = (id)a2;
  v12[0] = [(UITableViewCellAccessibility *)self _accessibilityTableViewSwitch];
  if (v12[0])
  {
    id v14 = (id)[v12[0] accessibilityValue];
    int v11 = 1;
  }
  else
  {
    id v10 = (id)[(UITableViewCellAccessibility *)v13 _badgeText];
    v8.receiver = v13;
    v8.super_class = (Class)UITableViewCellAccessibility;
    id v9 = [(UITableViewCellAccessibility *)&v8 accessibilityValue];
    if (v9 && ([v10 isEqualToString:v9] & 1) != 0)
    {
      id v14 = v9;
      int v11 = 1;
    }
    else
    {
      id v7 = 0;
      if ([(UITableViewCellAccessibility *)v13 _accessibilityTableCellUsesDetailTextAsValue])
      {
        id v6 = -[UITableViewCellAccessibility _accessibilityDetailTextLabelIfExists](v13);
        id v2 = (id)[v6 accessibilityLabel];
        id v3 = v7;
        id v7 = v2;
      }
      id v14 = (id)__UIAXStringForVariables();
      int v11 = 1;
      objc_storeStrong(&v7, 0);
    }
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  objc_storeStrong(v12, 0);
  objc_super v4 = v14;

  return v4;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v17 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibility *)self _accessibilityTableViewSwitch];
  if (location[0])
  {
    [location[0] accessibilityActivationPoint];
    double v18 = v2;
    double v19 = v3;
    int v15 = 1;
  }
  else if (([(UITableViewCellAccessibility *)v17 safeBoolForKey:@"_hasEditingAccessoryView"] & 1) != 0 {
         || (id v11 = (id)-[UITableViewCellAccessibility safeValueForKey:](v17, "safeValueForKey:", @"editingStyle"), v12 = (int)[v11 intValue], v11, v14 = v12, (unint64_t)(v12 - 1) > 1))
  }
  {
    v13.receiver = v17;
    v13.super_class = (Class)UITableViewCellAccessibility;
    [(UITableViewCellAccessibility *)&v13 accessibilityActivationPoint];
    double v18 = v6;
    double v19 = v7;
    int v15 = 1;
  }
  else
  {
    id v10 = [(UITableViewCellAccessibility *)v17 _accessibilityCellEditingControl];
    [v10 accessibilityActivationPoint];
    double v18 = v4;
    double v19 = v5;

    int v15 = 1;
  }
  objc_storeStrong(location, 0);
  double v8 = v18;
  double v9 = v19;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)_accessibilityShouldBeEmptyIfHidden
{
  return a1 != 0;
}

- (int64_t)accessibilityElementCount
{
  double v5 = self;
  v4[1] = (id)a2;
  [(UITableViewCellAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"CheckingOverride"];
  if ([(UITableViewCellAccessibility *)v5 _accessibilityUsesOverrideContainerProtocol])
  {
    [(UITableViewCellAccessibility *)v5 _accessibilitySetBoolValue:0 forKey:@"CheckingOverride"];
    id v3 = (id)[(UITableViewCellAccessibility *)v5 _accessibilityElements];
    int64_t v6 = [v3 count];
  }
  else if (-[UITableViewCellAccessibility _accessibilityShouldBeEmptyIfHidden]((uint64_t)v5) {
         && ([(UITableViewCellAccessibility *)v5 accessibilityElementsHidden] & 1) != 0)
  }
  {
    return 0;
  }
  else
  {
    v4[0] = [(UITableViewCellAccessibility *)v5 _accessibilityChildren];
    [(UITableViewCellAccessibility *)v5 _accessibilitySetBoolValue:0 forKey:@"CheckingOverride"];
    int64_t v6 = [v4[0] count];
    objc_storeStrong(v4, 0);
  }
  return v6;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  objc_super v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UITableViewCellAccessibility *)v26 _accessibilitySetBoolValue:1 forKey:@"CheckingOverride"];
  if ([(UITableViewCellAccessibility *)v26 _accessibilityUsesOverrideContainerProtocol])
  {
    [(UITableViewCellAccessibility *)v26 _accessibilitySetBoolValue:0 forKey:@"CheckingOverride"];
    id v13 = (id)[(UITableViewCellAccessibility *)v26 _accessibilityElements];
    int64_t v27 = [v13 indexOfObject:location[0]];

    int v24 = 1;
  }
  else if (-[UITableViewCellAccessibility _accessibilityShouldBeEmptyIfHidden]((uint64_t)v26) {
         && ([(UITableViewCellAccessibility *)v26 accessibilityElementsHidden] & 1) != 0)
  }
  {
    int64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    int v24 = 1;
  }
  else
  {
    id v23 = [(UITableViewCellAccessibility *)v26 _accessibilityChildren];
    [(UITableViewCellAccessibility *)v26 _accessibilitySetBoolValue:0 forKey:@"CheckingOverride"];
    int64_t v22 = 0;
    memset(__b, 0, sizeof(__b));
    id obj = v23;
    uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
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
        id v21 = *(id *)(__b[1] + 8 * v9);
        if ([v21 isEqual:location[0]])
        {
          int64_t v27 = v22;
          int v24 = 1;
          goto LABEL_33;
        }
        objc_opt_class();
        char v18 = 0;
        char v16 = 0;
        char v14 = 0;
        char v6 = 0;
        if (objc_opt_isKindOfClass())
        {
          id v19 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v21);
          char v18 = 1;
          char v5 = 1;
          if (([v19 isEqual:location[0]] & 1) == 0)
          {
            objc_opt_class();
            char v4 = 0;
            if (objc_opt_isKindOfClass())
            {
              id v17 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v21);
              char v16 = 1;
              id v15 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location[0]);
              char v14 = 1;
              char v4 = objc_msgSend(v17, "isEqual:");
            }
            char v5 = v4;
          }
          char v6 = v5;
        }
        if (v14) {

        }
        if (v16) {
        if (v18)
        }

        if (v6)
        {
          int64_t v27 = v22;
          int v24 = 1;
          goto LABEL_33;
        }
        if ([v21 accessibilityElementCount] != 0x7FFFFFFFFFFFFFFFLL
          && [v21 accessibilityElementCount] > 0
          && [v21 indexOfAccessibilityElement:location[0]] != 0x7FFFFFFFFFFFFFFFLL)
        {
          break;
        }
        ++v22;
        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v28 count:16];
          if (!v10) {
            goto LABEL_32;
          }
        }
      }
      int64_t v27 = v22;
      int v24 = 1;
    }
    else
    {
LABEL_32:
      int v24 = 0;
    }
LABEL_33:

    if (!v24)
    {
      int64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
      int v24 = 1;
    }
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  unint64_t v10 = self;
  SEL v9 = a2;
  int64_t v8 = a3;
  [(UITableViewCellAccessibility *)self _accessibilitySetBoolValue:1 forKey:@"CheckingOverride"];
  if ([(UITableViewCellAccessibility *)v10 _accessibilityUsesOverrideContainerProtocol])
  {
    [(UITableViewCellAccessibility *)v10 _accessibilitySetBoolValue:0 forKey:@"CheckingOverride"];
    id location = (id)[(UITableViewCellAccessibility *)v10 _accessibilityElements];
    if (v8 >= (unint64_t)[location count])
    {
      if (v8 >= (unint64_t)[location count]) {
        _AXAssert();
      }
      id v11 = 0;
      int v6 = 1;
    }
    else
    {
      id v11 = (id)[location objectAtIndex:v8];
      int v6 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  else if (-[UITableViewCellAccessibility _accessibilityShouldBeEmptyIfHidden]((uint64_t)v10) {
         && ([(UITableViewCellAccessibility *)v10 accessibilityElementsHidden] & 1) != 0)
  }
  {
    id v11 = 0;
  }
  else
  {
    id v5 = [(UITableViewCellAccessibility *)v10 _accessibilityChildren];
    [(UITableViewCellAccessibility *)v10 _accessibilitySetBoolValue:0 forKey:@"CheckingOverride"];
    if (v8 < 0 || v8 >= [v5 count])
    {
      id v11 = 0;
      int v6 = 1;
    }
    else
    {
      id v11 = (id)[v5 objectAtIndex:v8];
      int v6 = 1;
    }
    objc_storeStrong(&v5, 0);
  }
  id v3 = v11;

  return v3;
}

- (id)accessibilityLabel
{
  int v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellAccessibility;
  location[0] = [(UITableViewCellAccessibility *)&v4 accessibilityLabel];
  if (![(UITableViewCellAccessibility *)v6 isAccessibilityElement]
    || [location[0] length])
  {
    id v7 = location[0];
  }
  else
  {
    id v7 = [(UITableViewCellAccessibility *)v6 _accessibilityRetrieveTableViewCellText];
  }
  objc_storeStrong(location, 0);
  double v2 = v7;

  return v2;
}

- (id)accessibilityUserInputLabels
{
  SEL v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCellAccessibility;
  v8[0] = [(UITableViewCellAccessibility *)&v7 accessibilityUserInputLabels];
  if (![v8[0] count])
  {
    id v6 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellTextExcludingDetailText](v9);
    id v2 = (id)MEMORY[0x2455E6530]();
    id v3 = v8[0];
    v8[0] = v2;
  }
  id v5 = v8[0];
  objc_storeStrong(v8, 0);

  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v2 = (id)[(UITableViewCellAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v5 = v2 == 0;

  if (v5) {
    return 0;
  }
  id v4 = (id)[(UITableViewCellAccessibility *)self isAccessibilityUserDefinedElement];
  BOOL v7 = [v4 BOOLValue] & 1;

  return v7;
}

- (BOOL)_axHasLeadingSwipeActions
{
  id v12 = a1;
  if (a1)
  {
    id v11 = (id)[v12 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    if (([v11 conformsToProtocol:&unk_26F4BC0F0] & 1) == 0) {
      goto LABEL_13;
    }
    id v10 = (id)[v11 _swipeActionController];
    char v9 = objc_opt_respondsToSelector() & 1;
    char v7 = 0;
    char v4 = 1;
    if (v9)
    {
      id v8 = (id)[v12 _accessibilityIndexPath];
      char v7 = 1;
      char v4 = 1;
      if ((objc_msgSend(v11, "swipeActionController:mayBeginSwipeForItemAtIndexPath:", v10) & 1) == 0) {
        char v4 = [v11 isEditing];
      }
    }
    if (v7) {

    }
    if (v4)
    {
      id v3 = (id)[v12 _accessibilityIndexPath];
      id v2 = (id)objc_msgSend(v11, "swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", v10);
      id v6 = (id)[v2 actions];

      BOOL v13 = [v6 count] != 0;
      int v5 = 1;
      objc_storeStrong(&v6, 0);
    }
    else
    {
      int v5 = 0;
    }
    objc_storeStrong(&v10, 0);
    if (!v5) {
LABEL_13:
    }
      BOOL v13 = 0;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)_axHasTrailingSwipeActions
{
  id v12 = a1;
  if (a1)
  {
    id v11 = (id)[v12 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
    if (([v11 conformsToProtocol:&unk_26F4BC0F0] & 1) == 0) {
      goto LABEL_13;
    }
    id v10 = (id)[v11 _swipeActionController];
    char v9 = objc_opt_respondsToSelector() & 1;
    char v7 = 0;
    char v4 = 1;
    if (v9)
    {
      id v8 = (id)[v12 _accessibilityIndexPath];
      char v7 = 1;
      char v4 = 1;
      if ((objc_msgSend(v11, "swipeActionController:mayBeginSwipeForItemAtIndexPath:", v10) & 1) == 0) {
        char v4 = [v11 isEditing];
      }
    }
    if (v7) {

    }
    if (v4)
    {
      id v3 = (id)[v12 _accessibilityIndexPath];
      id v2 = (id)objc_msgSend(v11, "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", v10);
      id v6 = (id)[v2 actions];

      BOOL v13 = [v6 count] != 0;
      int v5 = 1;
      objc_storeStrong(&v6, 0);
    }
    else
    {
      int v5 = 0;
    }
    objc_storeStrong(&v10, 0);
    if (!v5) {
LABEL_13:
    }
      BOOL v13 = 0;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)_accessibilitySwipeActionsAllowed
{
  uint64_t v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)[(UITableViewCellAccessibility *)self _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v2 = (id)[v19[0] window];
  BOOL v5 = v2 != 0;

  if (v5)
  {
    if ([v19[0] safeBoolForKey:@"_manuallyManagesSwipeUI"])
    {
      char v21 = 0;
      int v18 = 1;
    }
    else
    {
      uint64_t v13 = 0;
      char v14 = &v13;
      int v15 = 0x20000000;
      int v16 = 32;
      char v17 = 0;
      uint64_t v8 = 0;
      char v9 = &v8;
      int v10 = 0x20000000;
      int v11 = 32;
      char v12 = 0;
      id v6 = v19[0];
      v7[0] = v20;
      v7[1] = &v13;
      v7[2] = &v8;
      AXPerformSafeBlock();
      char v4 = 1;
      if ((v14[3] & 1) == 0) {
        char v4 = *((unsigned char *)v9 + 24);
      }
      char v21 = v4 & 1;
      int v18 = 1;
      objc_storeStrong(v7, 0);
      objc_storeStrong(&v6, 0);
      _Block_object_dispose(&v8, 8);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    char v21 = 0;
    int v18 = 1;
  }
  objc_storeStrong(v19, 0);
  return v21 & 1;
}

void __65__UITableViewCellAccessibility__accessibilitySwipeActionsAllowed__block_invoke(uint64_t a1)
{
  id v4[2] = (id)a1;
  v4[1] = (id)a1;
  v4[0] = (id)[*(id *)(a1 + 32) indexPathForCell:*(void *)(a1 + 40)];
  id v3 = (id)[*(id *)(a1 + 32) dataSource];
  if ((objc_opt_respondsToSelector() & 1) != 0
    || -[UITableViewCellAccessibility _axHasLeadingSwipeActions](*(void **)(a1 + 40))
    || -[UITableViewCellAccessibility _axHasTrailingSwipeActions](*(void **)(a1 + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _canEditRowAtIndexPath:v4[0]] & 1;
  }
  id v2 = (id)[*(id *)(a1 + 32) delegate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_opt_respondsToSelector() & 1;
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (BOOL)_accessibilityHandleDetailButtonPress:(id)a3
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = (id)[(UITableViewCellAccessibility *)v10 _accessibilityViewAncestorIsKindOf:objc_opt_class()];
  id v6 = (id)[v8 delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v5 = (id)[v8 delegate];
    id v4 = [(UITableViewCellAccessibility *)v10 _accessibilityIndexPath];
    objc_msgSend(v5, "tableView:accessoryButtonTappedForRowWithIndexPath:", v8);

    char v11 = 1;
  }
  else
  {
    char v11 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (id)_accessibilityEquivalenceTag
{
  int v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0;
  if ([(UITableViewCellAccessibility *)self isAccessibilityElement])
  {
    v8.receiver = v10;
    v8.super_class = (Class)UITableViewCellAccessibility;
    id v2 = [(UITableViewCellAccessibility *)&v8 _accessibilityEquivalenceTag];
    id v3 = v9[0];
    v9[0] = v2;
  }
  else
  {
    id v4 = [(UITableViewCellAccessibility *)v10 _accessibilityRetrieveTableViewCellText];
    id v5 = v9[0];
    v9[0] = v4;
  }
  id v7 = v9[0];
  objc_storeStrong(v9, 0);

  return v7;
}

- (BOOL)_accessibilityShouldSetNativeFocusWhenATVFocused
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibility *)self _accessibilityParentTableView];
  if ((-[UITableViewCellAccessibility _accessibilityBoolValueForKey:](v6, "_accessibilityBoolValueForKey:", @"AXIsShowingSelectedBackground") & 1) == 0|| ([location[0] allowsMultipleSelection] & 1) != 0|| (-[UITableViewCellAccessibility isSelected](v6, "isSelected") & 1) != 0|| !UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableViewCellAccessibility;
    char v7 = [(UITableViewCellAccessibility *)&v3 _accessibilityShouldSetNativeFocusWhenATVFocused];
    int v4 = 1;
  }
  else
  {
    char v7 = 1;
    int v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (id)_accessibilityParentTableView
{
  return (id)[(UITableViewCellAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
}

- (BOOL)_accessibilityIsOutsideParentBounds
{
  id v10 = a1;
  if (a1)
  {
    id v9 = (id)[v10 _accessibilityParentTableView];
    id v6 = (id)[v9 window];
    [v6 accessibilityFrame];
    CGRect v8 = CGRectInset(v12, 0.0, 40.0);
    [v10 accessibilityFrame];
    rect2.origin.x = v1;
    rect2.origin.y = v2;
    rect2.size.width = v3;
    rect2.size.height = v4;
    BOOL v11 = !CGRectIntersectsRect(v8, rect2);

    objc_storeStrong(&v9, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)accessibilityScrollToVisible
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  char v76 = self;
  v75[1] = (id)a2;
  id v39 = [(UITableViewCellAccessibility *)self _accessibilityMockParent];
  v75[0] = (id)[v39 _accessibilityAncestorIsKindOf:objc_opt_class()];

  char v74 = [v75[0] safeBoolForKey:@"isScrollEnabled"] & 1;
  if ([v75[0] _accessibilityRespectsTableScrollEnabledFlag] & 1) == 0 || (v74)
  {
    if ((v74 & 1) == 0)
    {
      id v70 = (id)AXLogScrollToVisible();
      os_log_type_t v69 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v78, (uint64_t)v75[0]);
        _os_log_debug_impl(&dword_2402B7000, (os_log_t)v70, v69, "Scrolling the table view even though it has scroll disabled. May need to implement _accessibilityRespectsTableScrollEnabledFlag on the table view: %{public}@", v78, 0xCu);
      }
      objc_storeStrong(&v70, 0);
    }
    id v2 = (id)AXRetainAutorelease();
    id v68 = (id)[v75[0] indexPathsForVisibleRows];
    id v67 = (id)[v75[0] indexPathForCell:v76];
    if (!v67)
    {
      id v67 = [(UITableViewCellAccessibility *)v76 _accessibilityIndexPath];
    }
    unint64_t v66 = [v68 indexOfObject:v67];
    uint64_t v65 = 2;
    char v64 = 0;
    if (_UIAXObjectIsBehindKeyboard())
    {
      uint64_t v65 = 1;
      char v64 = 1;
    }
    id v38 = v75[0];
    [(UITableViewCellAccessibility *)v76 bounds];
    double v59 = v3;
    double v60 = v4;
    double v61 = v5;
    double v62 = v6;
    objc_msgSend(v38, "convertRect:fromView:", v76, v3, v4, v5, v6);
    v63.origin.x = v7;
    v63.origin.y = v8;
    v63.size.width = v9;
    v63.size.height = v10;
    [v75[0] bounds];
    CGRect rect1 = v81;
    if (!CGRectContainsRect(v81, v63)) {
      char v64 = 1;
    }
    id v37 = (id)[v75[0] safeValueForKey:@"visibleBounds"];
    [v37 rectValue];
    *(void *)&long long v56 = v11;
    *((void *)&v56 + 1) = v12;
    *(void *)&long long v57 = v13;
    *((void *)&v57 + 1) = v14;

    [v75[0] adjustedContentInset];
    double v52 = v15;
    double v53 = v16;
    double v54 = v17;
    double v55 = v18;
    *(void *)&long long v50 = UIEdgeInsetsInsetRect_2(*(double *)&v56, *((double *)&v56 + 1), *(double *)&v57, *((double *)&v57 + 1), v15, v16);
    *((void *)&v50 + 1) = v19;
    *(void *)&long long v51 = v20;
    *((void *)&v51 + 1) = v21;
    long long v56 = v50;
    long long v57 = v51;
    UIAccessibilityFrameForBounds();
    v49.origin.x = v22;
    v49.origin.y = v23;
    v49.size.width = v24;
    v49.size.height = v25;
    [(UITableViewCellAccessibility *)v76 accessibilityFrame];
    rect2.origin.x = v26;
    rect2.origin.y = v27;
    rect2.size.width = v28;
    rect2.size.height = v29;
    if (!CGRectContainsRect(v49, rect2))
    {
      uint64_t v65 = 1;
      if (!UIEdgeInsetsEqualToEdgeInsets(v52, v53, v54, v55, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24)))char v64 = 1; {
      if (v52 > 0.0)
      }
        uint64_t v65 = 0;
    }
    if ((v64 & 1) == 0 && -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v76)) {
      char v64 = 1;
    }
    uint64_t v47 = [v68 count];
    if ((v64 & 1) == 0 && v47 && (v66 > 1 && v66 < v47 - 2 || v47 == 1))
    {
      char v77 = 0;
      int v71 = 1;
    }
    else
    {
      uint64_t v46 = 0;
      uint64_t v45 = [v75[0] numberOfSections];
      for (uint64_t i = 0; i < v45; ++i)
        v46 += [v75[0] numberOfRowsInSection:i];
      if ([v68 count] != v46 || (v64 & 1) != 0)
      {
        if ([v67 section] < v45)
        {
          if (v45)
          {
            uint64_t v36 = [v67 row];
            if (v36 < objc_msgSend(v75[0], "numberOfRowsInSection:", objc_msgSend(v67, "section")))
            {
              uint64_t v65 = [v75[0] _accessibilityScrollPositionForCellOverride:v65];
              [v75[0] scrollToRowAtIndexPath:v67 atScrollPosition:v65 animated:0];
              id v34 = (id)[v75[0] indexPathsForVisibleRows];
              char v42 = 0;
              BOOL IsOutsideParent = 1;
              if ([v34 containsObject:v67])
              {
                id v43 = (id)[v75[0] cellForRowAtIndexPath:v67];
                char v42 = 1;
                BOOL IsOutsideParent = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v43);
              }
              if (v42) {

              }
              if (IsOutsideParent)
              {
                uint64_t v45 = [v75[0] numberOfSections];
                if (!v45
                  || [v67 section] >= v45
                  || (uint64_t v33 = [v67 row],
                      v33 >= objc_msgSend(v75[0], "numberOfRowsInSection:", objc_msgSend(v67, "section"))))
                {
                  char v77 = 0;
                  int v71 = 1;
                  goto LABEL_53;
                }
                [v75[0] scrollToRowAtIndexPath:v67 atScrollPosition:2 animated:0];
              }
              [v75[0] _accessibilityOpaqueElementScrollCleanup];
              id v31 = (id)[v75[0] cellForRowAtIndexPath:v67];
              BOOL v32 = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v31);

              if (v32)
              {
                char v77 = 0;
                int v71 = 1;
              }
              else
              {
                int64_t v40 = v76;
                id v41 = v75[0];
                AXPerformBlockOnMainThreadAfterDelay();
                char v77 = 1;
                int v71 = 1;
                objc_storeStrong(&v41, 0);
                objc_storeStrong((id *)&v40, 0);
              }
              goto LABEL_53;
            }
          }
        }
        char v77 = 0;
        int v71 = 1;
      }
      else
      {
        char v77 = 0;
        int v71 = 1;
      }
    }
LABEL_53:
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
    goto LABEL_54;
  }
  id location = (id)AXLogScrollToVisible();
  os_log_type_t v72 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v79, (uint64_t)v75[0]);
    _os_log_debug_impl(&dword_2402B7000, (os_log_t)location, v72, "Not scrolling the table view because its scroll is disabled: %{public}@", v79, 0xCu);
  }
  objc_storeStrong(&location, 0);
  char v77 = 0;
  int v71 = 1;
LABEL_54:
  objc_storeStrong(v75, 0);
  return v77 & 1;
}

id __60__UITableViewCellAccessibility_accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  id v4 = (id)[*(id *)(a1 + 32) _accessibilityWindow];
  id v6 = (id)[v4 firstResponder];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  BOOL v7 = 0;
  if (([v6 _accessibilityIsDescendantOfElement:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v13 = (id)[*(id *)(a1 + 32) _accessibilityParentView];
    char v12 = 1;
    id v11 = (id)[v13 safeValueForKey:@"window"];
    char v10 = 1;
    id v9 = (id)AXUIKeyboardWindow();
    char v8 = 1;
    BOOL v7 = v11 != v9;
  }
  if (v8) {

  }
  if (v10) {
  if (v12)
  }

  if (v7) {
    _UIAXDismissKeyboardIfNecessary();
  }
  id v1 = self;
  id v2 = self;

  return v2;
}

- (id)_accessibilityScannerGroupElements
{
  double v5 = self;
  v4[1] = (id)a2;
  if ([(UITableViewCellAccessibility *)self accessibilityRespondsToUserInteraction])
  {
    id v6 = 0;
  }
  else
  {
    v4[0] = [(UITableViewCellAccessibility *)v5 _accessibilityChildren];
    id v6 = v4[0];
    objc_storeStrong(v4, 0);
  }
  id v2 = v6;

  return v2;
}

- (void)_accessibilityFinishSwipeAction:(id)a3 controller:(id)a4 indexPath:(id)a5 tableView:(id)a6 tvDelegate:(id)a7 wasEditing:(BOOL)a8
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = 0;
  objc_storeStrong(&v32, a5);
  id v31 = 0;
  objc_storeStrong(&v31, a6);
  id v30 = 0;
  objc_storeStrong(&v30, a7);
  BOOL v29 = a8;
  char v27 = 0;
  objc_opt_class();
  id v26 = (id)__UIAccessibilityCastAsSafeCategory();
  id v25 = v26;
  objc_storeStrong(&v26, 0);
  uint64_t v28 = (uint64_t)v25;
  if (objc_opt_respondsToSelector())
  {
    [v31 swipeActionController:v33 didEndSwipeForItemAtIndexPath:v32];
    if (([v31 isEditing] & 1) != 0 && !v29) {
      [v31 setEditing:0 animated:0];
    }
  }
  if (objc_opt_respondsToSelector()) {
    [v30 _accessibilityTableView:v31 endRowActionHandlingForIndexPath:v32];
  }
  id v10 = (id)[MEMORY[0x263F22938] sharedInstance];
  char v11 = [v10 voiceOverSpeakActionConfirmation];

  if (v11)
  {
    id v9 = (id)[location[0] title];
    char v23 = 0;
    char v21 = 0;
    char v19 = 0;
    char v17 = 0;
    if ([v9 length])
    {
      char v8 = NSString;
      id v24 = accessibilityLocalizedString(@"action.performed");
      char v23 = 1;
      id v22 = (id)[location[0] title];
      char v21 = 1;
      id v20 = (id)objc_msgSend(v8, "stringWithFormat:", v24, v22);
      char v19 = 1;
    }
    else
    {
      id v18 = accessibilityLocalizedString(@"action.performed.no.name");
      char v17 = 1;
    }
    UIAccessibilitySpeak();
    if (v17) {

    }
    if (v19) {
    if (v21)
    }

    if (v23) {
  }
    }
  -[UITableViewAccessibility _accessibilitySetShouldConsiderSwipeDeletionCommitted:](v28);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_axPerformAction:(id)a3
{
  uint64_t v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v25 = 0;
  objc_opt_class();
  id v5 = (id)[location[0] _accessibilityValueForKey:@"AXTableCellActionKey"];
  id v24 = (id)__UIAccessibilityCastAsClass();

  id v23 = v24;
  objc_storeStrong(&v24, 0);
  id v26 = v23;
  id v22 = (id)[v23 handler];
  if (v22)
  {
    char v20 = 0;
    objc_opt_class();
    id v4 = (id)[(UITableViewCellAccessibility *)v28 safeValueForKey:@"_tableView"];
    id v19 = (id)__UIAccessibilityCastAsClass();

    id v18 = v19;
    objc_storeStrong(&v19, 0);
    id v21 = v18;
    id v17 = (id)[v18 _swipeActionController];
    id v16 = [(UITableViewCellAccessibility *)v28 _accessibilityIndexPath];
    id v15 = (id)[v21 delegate];
    if (objc_opt_respondsToSelector()) {
      [v15 _accessibilityTableView:v21 prepareForRowActionHandlingForIndexPath:v16];
    }
    char v14 = [v21 isEditing] & 1;
    if (objc_opt_respondsToSelector()) {
      [v21 swipeActionController:v17 willBeginSwipeForItemAtIndexPath:v16];
    }
    if (objc_opt_respondsToSelector()) {
      [v21 swipeActionController:v17 willPerformAction:v26 atIndexPath:v16];
    }
    id v6 = v21;
    BOOL v7 = v28;
    id v12 = v22;
    id v8 = v26;
    id v9 = v17;
    id v10 = v16;
    id v11 = v15;
    char v13 = v14 & 1;
    AXPerformSafeBlock();
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v7, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __49__UITableViewCellAccessibility__axPerformAction___block_invoke(uint64_t a1)
{
  v26[2] = (id)a1;
  v26[1] = (id)a1;
  char v25 = 0;
  objc_opt_class();
  id v24 = (id)__UIAccessibilityCastAsSafeCategory();
  id v23 = v24;
  objc_storeStrong(&v24, 0);
  v26[0] = v23;
  -[UITableViewAccessibility _accessibilitySetShouldConsiderSwipeDeletionCommitted:]((uint64_t)v23);
  char v21 = 0;
  objc_opt_class();
  id v20 = (id)__UIAccessibilityCastAsClass();
  id v19 = v20;
  objc_storeStrong(&v20, 0);
  id v22 = v19;
  char v18 = [v19 _accessibilityShouldIgnoreSwipeActionCompletionHandler] & 1;
  uint64_t v3 = *(void *)(a1 + 80);
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = MEMORY[0x263EF8330];
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = __49__UITableViewCellAccessibility__axPerformAction___block_invoke_2;
  id v9 = &unk_2650AF448;
  char v16 = v18;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 72);
  char v17 = *(unsigned char *)(a1 + 88) & 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v3 + 16))(v3, v1, v2, &v5);
  if (v18) {
    [*(id *)(a1 + 40) _accessibilityFinishSwipeAction:*(void *)(a1 + 48) controller:*(void *)(a1 + 56) indexPath:*(void *)(a1 + 64) tableView:*(void *)(a1 + 32) tvDelegate:*(void *)(a1 + 72) wasEditing:*(unsigned char *)(a1 + 88) & 1];
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v26, 0);
}

uint64_t __49__UITableViewCellAccessibility__axPerformAction___block_invoke_2(uint64_t result)
{
  if ((*(unsigned char *)(result + 80) & 1) == 0) {
    return [*(id *)(result + 32) _accessibilityFinishSwipeAction:*(void *)(result + 40) controller:*(void *)(result + 48) indexPath:*(void *)(result + 56) tableView:*(void *)(result + 64) tvDelegate:*(void *)(result + 72) wasEditing:*(unsigned char *)(result + 81) & 1];
  }
  return result;
}

- (id)_axCustomActionsForActions:(uint64_t)a1
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v29 = a1;
  id location = 0;
  objc_storeStrong(&location, a2);
  if (v29)
  {
    id v26 = (id)[MEMORY[0x263EFF980] array];
    memset(__b, 0, sizeof(__b));
    id obj = (id)[location actions];
    uint64_t v21 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
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
        id v25 = *(id *)(__b[1] + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = (id)[v25 accessibilityLabel];
          if (![v23 length])
          {
            id v2 = (id)[v25 title];
            id v3 = v23;
            id v23 = v2;

            if (![v23 length])
            {
              id v15 = (id)[v25 image];
              id v4 = (id)[v15 accessibilityLabel];
              id v5 = v23;
              id v23 = v4;

              if (![v23 length])
              {
                id v14 = (id)[v25 image];
                id v6 = (id)[v14 accessibilityIdentifier];
                id v7 = v23;
                id v23 = v6;
              }
            }
          }
          id v8 = (id)objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", @"\n", @" ", v13);
          id v9 = v23;
          id v23 = v8;

          if ([v23 length])
          {
            id v10 = objc_alloc(MEMORY[0x263F1C390]);
            id v22 = (id)[v10 initWithName:v23 target:v29 selector:sel__axPerformAction_];
            [v22 _accessibilitySetRetainedValue:v25 forKey:@"AXTableCellActionKey"];
            [v26 addObject:v22];
            objc_storeStrong(&v22, 0);
          }
          objc_storeStrong(&v23, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v13 = v25;
            _AXAssert();
          }
        }
        ++v18;
        if (v16 + 1 >= v19)
        {
          uint64_t v18 = 0;
          unint64_t v19 = [obj countByEnumeratingWithState:__b objects:v31 count:16];
          if (!v19) {
            break;
          }
        }
      }
    }

    id v30 = v26;
    int v27 = 1;
    objc_storeStrong(&v26, 0);
  }
  else
  {
    id v30 = 0;
    int v27 = 1;
  }
  objc_storeStrong(&location, 0);
  id v11 = v30;

  return v11;
}

- (id)_privateAccessibilityCustomActions
{
  int v71 = self;
  v70[1] = (id)a2;
  v69.receiver = self;
  v69.super_class = (Class)UITableViewCellAccessibility;
  id v40 = [(UITableViewCellAccessibility *)&v69 _privateAccessibilityCustomActions];
  v70[0] = (id)[v40 mutableCopy];

  if (!v70[0])
  {
    id v2 = (id)[MEMORY[0x263EFF980] array];
    id v3 = v70[0];
    v70[0] = v2;
  }
  id v68 = (id)[(UITableViewCellAccessibility *)v71 safeValueForKey:@"_tableView"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(UITableViewCellAccessibility *)v71 _accessibilitySwipeActionsAllowed])
  {
    id v67 = [(UITableViewCellAccessibility *)v71 _accessibilityIndexPath];
    char v65 = 0;
    objc_opt_class();
    id v39 = (id)[(UITableViewCellAccessibility *)v71 safeValueForKey:@"_tableView"];
    id v64 = (id)__UIAccessibilityCastAsClass();

    id v63 = v64;
    objc_storeStrong(&v64, 0);
    id v66 = v63;
    id v62 = (id)[v63 _swipeActionController];
    if ([v66 conformsToProtocol:&unk_26F4BC0F0])
    {
      id v32 = v70[0];
      id v31 = v71;
      id v34 = (id)[v66 swipeActionController:v62 leadingSwipeConfigurationForItemAtIndexPath:v67];
      id v33 = -[UITableViewCellAccessibility _axCustomActionsForActions:]((uint64_t)v31, v34);
      objc_msgSend(v32, "axSafelyAddObjectsFromArray:");

      id v36 = v70[0];
      long long v35 = v71;
      id v38 = (id)[v66 swipeActionController:v62 trailingSwipeConfigurationForItemAtIndexPath:v67];
      id v37 = -[UITableViewCellAccessibility _axCustomActionsForActions:]((uint64_t)v35, v38);
      objc_msgSend(v36, "axSafelyAddObjectsFromArray:");
    }
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
  }
  id v4 = [(UITableViewCellAccessibility *)v71 _accessibilityTableViewSwitch];
  BOOL v30 = v4 == 0;

  if (!v30)
  {
    id v28 = (id)[(UITableViewCellAccessibility *)v71 safeValueForKey:@"editingStyle"];
    uint64_t v29 = (void *)(int)[v28 intValue];

    v61[1] = v29;
    v61[0] = 0;
    if (v29 == (void *)1)
    {
      id v7 = accessibilityLocalizedString(@"remove.control.text");
      id v8 = v61[0];
      v61[0] = v7;
    }
    else if (v29 == (void *)2)
    {
      id v5 = accessibilityLocalizedString(@"insert.control.text");
      id v6 = v61[0];
      v61[0] = v5;
    }
    if (v61[0])
    {
      objc_initWeak(&from, v71);
      id v27 = objc_alloc(MEMORY[0x263F1C390]);
      id v26 = v61[0];
      uint64_t v53 = MEMORY[0x263EF8330];
      int v54 = -1073741824;
      int v55 = 0;
      long long v56 = __66__UITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke;
      long long v57 = &unk_2650AF498;
      objc_copyWeak(&v58, &from);
      id v59 = (id)[v27 initWithName:v26 actionHandler:&v53];
      [v70[0] axSafelyAddObject:v59];
      objc_storeStrong(&v59, 0);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&from);
    }
    objc_storeStrong(v61, 0);
  }
  if ([(UITableViewCellAccessibility *)v71 accessoryType] == 4)
  {
    id v24 = objc_alloc(MEMORY[0x263F1C390]);
    id v25 = accessibilityLocalizedString(@"more.info.button");
    id v52 = (id)objc_msgSend(v24, "initWithName:target:selector:");

    [v70[0] addObject:v52];
    objc_storeStrong(&v52, 0);
  }
  if (-[UITableViewCellAccessibility _accessibilityHasReorderActions](v71))
  {
    id v51 = [(UITableViewCellAccessibility *)v71 _accessibilityIndexPath];
    if ([v51 row] > 0)
    {
      char v49 = 0;
      objc_opt_class();
      id v23 = [(UITableViewCellAccessibility *)v71 _accessibilityParentTableView];
      id v22 = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](v71);
      id v21 = (id)objc_msgSend(v23, "cellForRowAtIndexPath:");
      id v48 = (id)__UIAccessibilityCastAsSafeCategory();

      id v47 = v48;
      objc_storeStrong(&v48, 0);
      id v50 = v47;
      if (-[UITableViewCellAccessibility _accessibilityHasReorderActions](v47))
      {
        id v19 = objc_alloc(MEMORY[0x263F1C390]);
        id v20 = accessibilityLocalizedString(@"table.cell.reorder.action.move.up");
        id v46 = (id)objc_msgSend(v19, "initWithName:target:selector:");

        [v70[0] addObject:v46];
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v50, 0);
    }
    uint64_t v16 = [v51 row];
    id v17 = [(UITableViewCellAccessibility *)v71 _accessibilityParentTableView];
    BOOL v18 = v16 >= objc_msgSend(v17, "numberOfRowsInSection:", objc_msgSend(v51, "section")) - 1;

    if (!v18)
    {
      char v44 = 0;
      objc_opt_class();
      id v15 = [(UITableViewCellAccessibility *)v71 _accessibilityParentTableView];
      id v14 = -[UITableViewCellAccessibility _accessibilityNextIndexPath](v71);
      id v13 = (id)objc_msgSend(v15, "cellForRowAtIndexPath:");
      id v43 = (id)__UIAccessibilityCastAsSafeCategory();

      id v42 = v43;
      objc_storeStrong(&v43, 0);
      id v45 = v42;
      if (-[UITableViewCellAccessibility _accessibilityHasReorderActions](v42))
      {
        id v11 = objc_alloc(MEMORY[0x263F1C390]);
        id v12 = accessibilityLocalizedString(@"table.cell.reorder.action.move.down");
        id v41 = (id)objc_msgSend(v11, "initWithName:target:selector:");

        [v70[0] addObject:v41];
        objc_storeStrong(&v41, 0);
      }
      objc_storeStrong(&v45, 0);
    }
    objc_storeStrong(&v51, 0);
  }
  id v10 = v70[0];
  objc_storeStrong(&v68, 0);
  objc_storeStrong(v70, 0);

  return v10;
}

uint64_t __66__UITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  objc_copyWeak(v4, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v4);
  objc_storeStrong(location, 0);
  return 1;
}

void __66__UITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)[v3 _accessibilityCellEditingControl];
  objc_msgSend(WeakRetained, "editControlWasClicked:");
}

- (uint64_t)_accessibilityHasReorderActions
{
  if (a1) {
    char v2 = [a1 safeBoolForKey:@"showsReorderControl"] & 1;
  }
  else {
    char v2 = 0;
  }
  return v2 & 1;
}

- (BOOL)_accessibilityRespondsToUserInteractionForElement:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(UITableViewCellAccessibility *)v7 isAccessibilityElement])
  {
    char v8 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableViewCellAccessibility;
    char v8 = [(UITableViewCellAccessibility *)&v4 _accessibilityRespondsToUserInteractionForElement:location[0]];
  }
  int v5 = 1;
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (BOOL)_accessibilityHandleReorderMoveDown
{
  return -[UITableViewCellAccessibility _accessibilityHandleReorderMoveUp:](self, "_accessibilityHandleReorderMoveUp:", 0, a2, self);
}

- (BOOL)_accessibilityHandleReorderMoveUp
{
  return -[UITableViewCellAccessibility _accessibilityHandleReorderMoveUp:](self, "_accessibilityHandleReorderMoveUp:", 1, a2, self);
}

- (BOOL)_accessibilityHandleReorderMoveUp:(BOOL)a3
{
  id v73 = self;
  SEL v72 = a2;
  BOOL v71 = a3;
  id v70 = [(UITableViewCellAccessibility *)self _accessibilityParentTableView];
  id v69 = [(UITableViewCellAccessibility *)v73 _accessibilityIndexPath];
  if ((!v71 || [v69 row])
    && (v71
     || (uint64_t v20 = [v69 row],
         v20 != objc_msgSend(v70, "numberOfRowsInSection:", objc_msgSend(v69, "section")) - 1)))
  {
    id v67 = v73;
    [(UITableViewCellAccessibility *)v73 accessibilityActivationPoint];
    uint64_t v64 = v3;
    uint64_t v65 = v4;
    id EventForSceneReferencePoint = (id)UIAccessibilityCreateEventForSceneReferencePoint();
    char v63 = 0;
    uint64_t v58 = 0;
    id v59 = &v58;
    int v60 = 0x20000000;
    int v61 = 32;
    char v62 = 0;
    uint64_t v50 = MEMORY[0x263EF8330];
    int v51 = -1073741824;
    int v52 = 0;
    uint64_t v53 = __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke;
    int v54 = &unk_2650AEAD0;
    v57[1] = &v58;
    id v55 = v70;
    id v56 = v67;
    v57[0] = EventForSceneReferencePoint;
    AXPerformSafeBlock();
    char v49 = v59[3] & 1;
    objc_storeStrong(v57, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v55, 0);
    _Block_object_dispose(&v58, 8);
    char v63 = v49 & 1;
    if (v49)
    {
      id v17 = (id)[MEMORY[0x263F1C920] mainScreen];
      [v17 bounds];
      CGRect rect = v76;
      CGFloat v18 = CGRectGetHeight(v76) / 2.0;

      double v48 = v18;
      [v67 frame];
      v46.origin.x = v5;
      v46.origin.y = v6;
      v46.size.width = v7;
      v46.size.height = v8;
      double v45 = 0.0;
      if (v71) {
        int v9 = -1;
      }
      else {
        int v9 = 1;
      }
      double v19 = (double)v9;
      [v67 bounds];
      uint64_t v41 = v10;
      uint64_t v42 = v11;
      uint64_t v43 = v12;
      double v44 = v13;
      double v45 = v19 * (v13 / 2.0);
      char v40 = 0;
      do
      {
        if (v71) {
          int v14 = -1;
        }
        else {
          int v14 = 1;
        }
        double v45 = v45 + (double)(10 * v14);
        double v39 = 0.0;
        double v39 = CGRectGetMidY(v46) + v45;
        uint64_t v31 = 0;
        id v32 = &v31;
        int v33 = 838860800;
        int v34 = 48;
        long long v35 = __Block_byref_object_copy__21;
        id v36 = __Block_byref_object_dispose__21;
        id v37 = 0;
        uint64_t v24 = MEMORY[0x263EF8330];
        int v25 = -1073741824;
        int v26 = 0;
        id v27 = __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke_2;
        id v28 = &unk_2650AF4C0;
        v30[1] = &v31;
        id v29 = v70;
        v30[2] = *(id *)&v39;
        v30[0] = v69;
        AXPerformSafeBlock();
        id v23 = (id)v32[5];
        objc_storeStrong(v30, 0);
        objc_storeStrong(&v29, 0);
        _Block_object_dispose(&v31, 8);
        objc_storeStrong(&v37, 0);
        id v38 = v23;
        char v40 = ([v69 isEqual:v23] ^ 1) & 1;
        objc_storeStrong(&v38, 0);
        BOOL v16 = 0;
        if ((v40 & 1) == 0)
        {
          double v75 = v45;
          BOOL v16 = fabs(v45) < v48;
        }
      }
      while (v16);
      id v21 = v70;
      v22[0] = v67;
      v22[1] = *(id *)&v45;
      AXPerformSafeBlock();
      char v74 = 1;
      int v68 = 1;
      objc_storeStrong(v22, 0);
      objc_storeStrong(&v21, 0);
    }
    else
    {
      char v74 = [(UITableViewCellAccessibility *)v73 _axReorderElementsByMovingIndexPaths:v71 tableView:v70 currentPath:v69];
      int v68 = 1;
    }
    objc_storeStrong(&EventForSceneReferencePoint, 0);
    objc_storeStrong(&v67, 0);
  }
  else
  {
    char v74 = 0;
    int v68 = 1;
  }
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  return v74 & 1;
}

void __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  id v5 = (id)[*(id *)(a1 + 48) allTouches];
  id v4 = (id)[v5 anyObject];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "_beginReorderingForCell:touch:", v1) & 1;
}

void __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke_2(void *a1)
{
  CGFloat v6 = (void *)a1[4];
  CGPointMake_7();
  id v3 = (id)objc_msgSend(v6, "_targetIndexPathAtPoint:withLastTargetIndexPath:adjustedForGap:", a1[5], 0, v1, v2);
  uint64_t v4 = *(void *)(a1[6] + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v3;
}

uint64_t __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endReorderingForCell:*(void *)(a1 + 40) wasCancelled:0 animated:1];
}

- (BOOL)_axReorderElementsByMovingIndexPaths:(BOOL)a3 tableView:(id)a4 currentPath:(id)a5
{
  int v34 = self;
  SEL v33 = a2;
  BOOL v32 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  if (([location safeBoolForKey:@"_dragAndDropUsedForReordering"] & 1) == 0) {
    goto LABEL_13;
  }
  char v27 = 0;
  char v25 = 0;
  if (v32)
  {
    id v28 = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](v34);
    char v27 = 1;
    id v5 = v28;
  }
  else
  {
    id v26 = -[UITableViewCellAccessibility _accessibilityNextIndexPath](v34);
    char v25 = 1;
    id v5 = v26;
  }
  id v29 = v5;
  if (v25) {

  }
  if (v27) {
  v17[1] = (id)MEMORY[0x263EF8330];
  }
  int v18 = -1073741824;
  int v19 = 0;
  uint64_t v20 = __91__UITableViewCellAccessibility__axReorderElementsByMovingIndexPaths_tableView_currentPath___block_invoke;
  id v21 = &unk_2650AE3B8;
  id v22 = location;
  id v23 = v30;
  id v24 = v29;
  AXPerformSafeBlock();
  id v6 = [(UITableViewCellAccessibility *)v34 _accessibilityIndexPath];
  BOOL v11 = v6 != v29;

  if (v11)
  {
    int v13 = 0;
  }
  else
  {
    char v16 = 0;
    objc_opt_class();
    id v15 = (id)__UIAccessibilityCastAsSafeCategory();
    id v14 = v15;
    objc_storeStrong(&v15, 0);
    id v9 = v29;
    uint64_t v7 = [v30 row];
    v17[0] = -[UITableViewAccessibility _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](v14, v9, v7, !v32);

    uint64_t v10 = (UIAccessibilityNotifications *)MEMORY[0x263F1CDC8];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v17[0]);
    UIAccessibilityPostNotification(*v10, (id)*MEMORY[0x263F21980]);
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    char v35 = 1;
    int v13 = 1;
    objc_storeStrong(v17, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v29, 0);
  if (!v13) {
LABEL_13:
  }
    char v35 = 0;
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&location, 0);
  return v35 & 1;
}

uint64_t __91__UITableViewCellAccessibility__axReorderElementsByMovingIndexPaths_tableView_currentPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endUpdates];
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  CGFloat v8 = self;
  SEL v7 = a2;
  char v6 = 0;
  id v2 = [(UITableViewCellAccessibility *)self _accessibilityTableViewSwitch];
  BOOL v4 = v2 == 0;

  if (!v4) {
    return 1;
  }
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewCellAccessibility;
  return [(UITableViewCellAccessibility *)&v5 _accessibilityIsSpeakThisElement];
}

- (id)accessibilityDragSourceDescriptors
{
  v45[1] = *MEMORY[0x263EF8340];
  uint64_t v43 = self;
  v42[1] = (id)a2;
  v42[0] = (id)[(UITableViewCellAccessibility *)self accessibilityUserDefinedDragSourceDescriptors];
  if (v42[0])
  {
    id v44 = v42[0];
    int v41 = 1;
  }
  else
  {
    id v40 = [(UITableViewCellAccessibility *)v43 _accessibilityParentTableView];
    char v38 = 0;
    id v16 = (id)[v40 safeValueForKey:@"_dragController"];
    id v37 = (id)__UIAccessibilitySafeClass();

    id v36 = v37;
    objc_storeStrong(&v37, 0);
    id v39 = v36;
    if (!v36) {
      goto LABEL_8;
    }
    char v34 = 0;
    objc_opt_class();
    id v33 = (id)__UIAccessibilityCastAsClass();
    id v32 = v33;
    objc_storeStrong(&v33, 0);
    id v35 = v32;
    long long v31 = 0uLL;
    id v15 = v32;
    [v32 bounds];
    uint64_t v25 = v2;
    uint64_t v26 = v3;
    uint64_t v27 = v4;
    uint64_t v28 = v5;
    UIRectGetCenter();
    double v29 = v6;
    double v30 = v7;
    objc_msgSend(v15, "convertPoint:toView:", v40, v6, v7);
    *(void *)&long long v31 = v8;
    *((void *)&v31 + 1) = v9;
    uint64_t v20 = 0;
    id v21 = &v20;
    int v22 = 0x20000000;
    int v23 = 32;
    char v24 = 0;
    v18[1] = &v20;
    id v17 = v40;
    long long v19 = v31;
    v18[0] = v43;
    AXPerformSafeBlock();
    if (v21[3])
    {
      id v14 = objc_alloc(MEMORY[0x263F1C3B8]);
      id v12 = accessibilityLocalizedString(@"drag.table.view.cell");
      id v13 = (id)objc_msgSend(v14, "initWithName:point:inView:", *(double *)&v31, *((double *)&v31 + 1));
      v45[0] = v13;
      id v44 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];

      int v41 = 1;
    }
    else
    {
      int v41 = 0;
    }
    objc_storeStrong(v18, 0);
    objc_storeStrong(&v17, 0);
    _Block_object_dispose(&v20, 8);
    objc_storeStrong(&v35, 0);
    if (!v41)
    {
LABEL_8:
      id v44 = 0;
      int v41 = 1;
    }
    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  objc_storeStrong(v42, 0);
  uint64_t v10 = v44;

  return v10;
}

void __66__UITableViewCellAccessibility_accessibilityDragSourceDescriptors__block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  id v3 = (id)[*(id *)(a1 + 40) _accessibilityIndexPath];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v1 _canBeginDragAtPoint:*(double *)(a1 + 56) indexPath:*(double *)(a1 + 64)] & 1;
}

- (id)accessibilityDropPointDescriptors
{
  v47[3] = *MEMORY[0x263EF8340];
  double v45 = self;
  v44[1] = (id)a2;
  v44[0] = (id)[(UITableViewCellAccessibility *)self accessibilityUserDefinedDropPointDescriptors];
  if (v44[0])
  {
    id v46 = v44[0];
    int v43 = 1;
  }
  else
  {
    id v42 = [(UITableViewCellAccessibility *)v45 _accessibilityParentTableView];
    id v41 = (id)[v42 safeValueForKey:@"_dropController"];
    if (v41)
    {
      [(UITableViewCellAccessibility *)v45 bounds];
      uint64_t v36 = v2;
      uint64_t v37 = v3;
      uint64_t v38 = v4;
      uint64_t v39 = v5;
      UIRectGetCenter();
      *(double *)&long long v40 = v6;
      *((double *)&v40 + 1) = v7;
      -[UITableViewCellAccessibility convertPoint:toView:](v45, "convertPoint:toView:", v42, v6, v7);
      v35[0] = v8;
      v35[1] = v9;
      id v20 = objc_alloc(MEMORY[0x263F1C3B8]);
      id v21 = accessibilityLocalizedString(@"drop.table.view.cell.onto");
      uint64_t v34 = objc_msgSend(v20, "initWithName:point:inView:", *(_OWORD *)v35);

      *(void *)&v35[0] = v40;
      v35[1] = -10.0;
      -[UITableViewCellAccessibility convertPoint:toView:](v45, "convertPoint:toView:", v42, *(double *)&v40, -10.0);
      *(void *)&long long v33 = v10;
      *((void *)&v33 + 1) = v11;
      *(_OWORD *)id v35 = v33;
      id v22 = objc_alloc(MEMORY[0x263F1C3B8]);
      id v23 = accessibilityLocalizedString(@"drop.table.view.cell.before");
      uint64_t v32 = objc_msgSend(v22, "initWithName:point:inView:", *(_OWORD *)v35);

      *(_OWORD *)id v35 = v40;
      [(UITableViewCellAccessibility *)v45 bounds];
      uint64_t v28 = v12;
      uint64_t v29 = v13;
      uint64_t v30 = v14;
      double v31 = v15;
      v35[1] = v15 + 10.0;
      -[UITableViewCellAccessibility convertPoint:toView:](v45, "convertPoint:toView:", v42, v35[0], v15 + 10.0);
      *(void *)&long long v27 = v16;
      *((void *)&v27 + 1) = v17;
      *(_OWORD *)id v35 = v27;
      id v24 = objc_alloc(MEMORY[0x263F1C3B8]);
      id v25 = accessibilityLocalizedString(@"drop.table.view.cell.after");
      uint64_t v26 = objc_msgSend(v24, "initWithName:point:inView:", *(_OWORD *)v35);

      v47[0] = v32;
      v47[1] = v34;
      v47[2] = v26;
      id v46 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
      int v43 = 1;
      objc_storeStrong((id *)&v26, 0);
      objc_storeStrong((id *)&v32, 0);
      objc_storeStrong((id *)&v34, 0);
    }
    else
    {
      id v46 = 0;
      int v43 = 1;
    }
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
  }
  objc_storeStrong(v44, 0);
  int v18 = v46;

  return v18;
}

- (id)accessibilityHeaderElements
{
  double v8 = self;
  v7[1] = (id)a2;
  if (_AXSAutomationEnabled())
  {
    v7[0] = [(UITableViewCellAccessibility *)v8 _accessibilityIndexPath];
    id v6 = [(UITableViewCellAccessibility *)v8 _accessibilityParentTableView];
    id v5 = (id)objc_msgSend(v6, "headerViewForSection:", objc_msgSend(v7[0], "section"));
    id v9 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "axArrayByIgnoringNilElementsWithCount:", 1, v5);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(v7, 0);
  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UITableViewCellAccessibility;
    id v9 = [(UITableViewCellAccessibility *)&v4 accessibilityHeaderElements];
  }
  uint64_t v2 = v9;

  return v2;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v6[2] = self;
  v6[1] = (id)a2;
  id v4 = (id)[MEMORY[0x263F81198] defaultVoiceOverOptions];
  v6[0] = (id)-[UITableViewCellAccessibility _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:");

  id v5 = (id)[v6[0] firstObject];
  objc_storeStrong(v6, 0);

  return v5;
}

- (BOOL)_accessibilitySetNativeFocus
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibility *)self _accessibilityCellEditingControl];
  if ([location[0] _accessibilityViewIsVisible])
  {
    char v7 = [location[0] _accessibilitySetNativeFocus] & 1;
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableViewCellAccessibility;
    char v7 = [(UITableViewCellAccessibility *)&v3 _accessibilitySetNativeFocus];
  }
  int v4 = 1;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = [(UITableViewCellAccessibility *)self _accessibilityCellEditingControl];
  if ([location[0] _accessibilityViewIsVisible])
  {
    char v7 = [location[0] _accessibilityViewHierarchyHasNativeFocus] & 1;
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableViewCellAccessibility;
    char v7 = [(UITableViewCellAccessibility *)&v3 _accessibilityViewHierarchyHasNativeFocus];
  }
  int v4 = 1;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  double v15 = self;
  SEL v14 = a2;
  SEL v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  char v11 = 0;
  v10.receiver = v15;
  v10.super_class = (Class)UITableViewCellAccessibility;
  char v11 = [(UITableViewCellAccessibility *)&v10 canPerformAction:v13 withSender:location];
  if (v11 && v13 == sel_selectAll_)
  {
    uint64_t v17 = (dispatch_once_t *)&canPerformAction_withSender__onceToken;
    id v16 = 0;
    objc_storeStrong(&v16, &__block_literal_global_951_0);
    if (*v17 != -1) {
      dispatch_once(v17, v16);
    }
    objc_storeStrong(&v16, 0);
    int v4 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v4, sel_selectAll_);
    if (InstanceMethod && (Method)canPerformAction_withSender__selectAllBaseMethod == InstanceMethod) {
      char v11 = 0;
    }
  }
  if ((v11 & 1) == 0
    && ([(UITableViewCellAccessibility *)v15 _accessibilityIsFKARunningForFocusItem] & 1) != 0)
  {
    id v8 = [(UITableViewCellAccessibility *)v15 _accessibilityPerformableActions];
    char v7 = NSStringFromSelector(v13);
    char v11 = objc_msgSend(v8, "containsObject:") & 1;
  }
  char v6 = v11;
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

Method __60__UITableViewCellAccessibility_canPerformAction_withSender___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v0, sel_selectAll_);
  canPerformAction_withSender__selectAllBaseMethod = (uint64_t)result;
  return result;
}

- (id)_accessibilityPerformableActions
{
  v8[4] = *MEMORY[0x263EF8340];
  char v7 = NSStringFromSelector(sel__accessibilityHandleReorderMoveUpWithFocus);
  v8[0] = v7;
  char v6 = NSStringFromSelector(sel__accessibilityHandleReorderMoveDownWithFocus);
  v8[1] = v6;
  id v5 = NSStringFromSelector(sel__accessibilityKeyCommandActionPlus);
  id v8[2] = v5;
  objc_super v3 = NSStringFromSelector(sel__accessibilityKeyCommandActionMinus);
  v8[3] = v3;
  id v4 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v4;
}

- (id)_accessibilityKeyCommands
{
  id v9[2] = *MEMORY[0x263EF8340];
  char v7 = self;
  location[1] = (id)a2;
  if (-[UITableViewCellAccessibility _accessibilityHasReorderActions](self))
  {
    id v5 = (id)objc_msgSend(MEMORY[0x263F1C708], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x263F1D3E8]);
    v9[0] = v5;
    id v4 = (id)[MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3C8] modifierFlags:0x20000 action:sel__accessibilityHandleReorderMoveDownWithFocus];
    v9[1] = v4;
    id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];
  }
  else
  {
    location[0] = [(UITableViewCellAccessibility *)v7 _accessibilityStepperAccessory];
    if (location[0]) {
      id v8 = (id)[location[0] _accessibilityKeyCommands];
    }
    else {
      id v8 = 0;
    }
    objc_storeStrong(location, 0);
  }
  uint64_t v2 = v8;

  return v2;
}

- (id)_accessibilityStepperAccessory
{
  char v11 = self;
  SEL v10 = a2;
  char v9 = 0;
  objc_opt_class();
  char v7 = 0;
  objc_opt_class();
  id v6 = (id)__UIAccessibilityCastAsClass();
  id v5 = v6;
  objc_storeStrong(&v6, 0);
  id v3 = (id)[v5 accessoryView];
  id v8 = (id)__UIAccessibilityCastAsSafeCategory();

  if (v9) {
    abort();
  }
  id v4 = v8;
  objc_storeStrong(&v8, 0);

  return v4;
}

- (void)_accessibilityKeyCommandActionPlus
{
  id v2 = [(UITableViewCellAccessibility *)self _accessibilityStepperAccessory];
  [v2 _accessibilityKeyCommandActionPlus];
}

- (void)_accessibilityKeyCommandActionMinus
{
  id v2 = [(UITableViewCellAccessibility *)self _accessibilityStepperAccessory];
  [v2 _accessibilityKeyCommandActionMinus];
}

- (void)_accessibilityHandleReorderMoveDownWithFocus
{
  id v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableViewCellAccessibility _accessibilityNextIndexPath](self);
  id v3 = [(UITableViewCellAccessibility *)v5 _accessibilityParentTableView];
  [(UITableViewCellAccessibility *)v5 _accessibilityHandleReorderMoveDown];
  id v2 = (id)[v3 cellForRowAtIndexPath:v4[0]];
  _UIAXAssignFocusToItem();

  UIAccessibilityPostNotification(*MEMORY[0x263F812B0], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (void)_accessibilityHandleReorderMoveUpWithFocus
{
  id v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](self);
  id v3 = [(UITableViewCellAccessibility *)v5 _accessibilityParentTableView];
  [(UITableViewCellAccessibility *)v5 _accessibilityHandleReorderMoveUp];
  id v2 = (id)[v3 cellForRowAtIndexPath:v4[0]];
  _UIAXAssignFocusToItem();

  UIAccessibilityPostNotification(*MEMORY[0x263F812B0], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (BOOL)canBecomeFocused
{
  long long v33 = self;
  SEL v32 = a2;
  char v31 = 0;
  v30.receiver = self;
  v30.super_class = (Class)UITableViewCellAccessibility;
  char v31 = [(UITableViewCellAccessibility *)&v30 canBecomeFocused];
  if (([(UITableViewCellAccessibility *)v33 _accessibilityIsFKARunningForFocusItem] & 1) == 0)
  {
LABEL_19:
    char v34 = v31 & 1;
    return v34 & 1;
  }
  id v2 = (id)[(UITableViewCellAccessibility *)v33 storedAccessibilityRespondsToUserInteraction];
  BOOL v12 = v2 == 0;

  if (v12)
  {
    if ((v31 & 1) == 0)
    {
      uint64_t v36 = (dispatch_once_t *)&canBecomeFocused_onceToken_0;
      id location = 0;
      objc_storeStrong(&location, &__block_literal_global_965);
      if (*v36 != -1) {
        dispatch_once(v36, location);
      }
      objc_storeStrong(&location, 0);
      id v3 = (objc_class *)objc_opt_class();
      Method InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityRespondsToUserInteraction);
      BOOL v28 = InstanceMethod != (Method)canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod_0;
      id v4 = (id)[(UITableViewCellAccessibility *)v33 storedAccessibilityRespondsToUserInteraction];
      BOOL v9 = v4 != 0;

      BOOL v27 = v9;
      BOOL v10 = 1;
      if (!v28)
      {
        BOOL v10 = 1;
        if (!v27)
        {
          BOOL v10 = 1;
          if (([(UITableViewCellAccessibility *)v33 safeBoolForKey:@"_accessibilityRespondsToUserInteraction"] & 1) == 0)BOOL v10 = [(UITableViewCellAccessibility *)v33 accessibilityTraits] != 0; {
        }
          }
      }
      char v31 = v10;
    }
    char v25 = 0;
    objc_opt_class();
    id v24 = (id)__UIAccessibilityCastAsClass();
    id v23 = v24;
    objc_storeStrong(&v24, 0);
    id v26 = v23;
    if (v31)
    {
      id v8 = (id)[v26 contentView];
      char v31 = (-[UIViewAccessibility _axHasSingleFocusableSubview](v8) ^ 1) & 1;
    }
    if ((v31 & 1) == 0) {
      char v31 = [v26 isEditing] & 1;
    }
    if (v31)
    {
      v19[0] = 0;
      v19[1] = v19;
      int v20 = 0x20000000;
      int v21 = 32;
      uint64_t v22 = 0;
      id v7 = (id)[v26 contentView];
      uint64_t v13 = MEMORY[0x263EF8330];
      int v14 = -1073741824;
      int v15 = 0;
      id v16 = __48__UITableViewCellAccessibility_canBecomeFocused__block_invoke_2;
      uint64_t v17 = &unk_2650AF510;
      v18[0] = v33;
      v18[1] = v19;
      id v5 = (id)[v7 _accessibilityFindDescendant:&v13];
      char v31 = v5 == 0;

      objc_storeStrong(v18, 0);
      _Block_object_dispose(v19, 8);
    }
    objc_storeStrong(&v26, 0);
    goto LABEL_19;
  }
  id v11 = (id)[(UITableViewCellAccessibility *)v33 storedAccessibilityRespondsToUserInteraction];
  char v34 = [v11 BOOLValue] & 1;

  return v34 & 1;
}

Method __48__UITableViewCellAccessibility_canBecomeFocused__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v0, sel_accessibilityRespondsToUserInteraction);
  canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod_0 = (uint64_t)result;
  return result;
}

BOOL __48__UITableViewCellAccessibility_canBecomeFocused__block_invoke_2(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
  {
    BOOL v13 = 0;
  }
  else
  {
    id v6 = location[0];
    id v7 = (id)[*(id *)(a1 + 32) _accessibilityCellEditingControl];
    char v10 = 0;
    BOOL v8 = 0;
    if (v6 != v7)
    {
      id v5 = location[0];
      id v11 = (id)[*(id *)(a1 + 32) _accessibilityCellReorderControl];
      char v10 = 1;
      BOOL v8 = v5 != v11;
    }
    if (v10) {

    }
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (uint64_t v2 = [location[0] accessibilityTraits], (v2 & *MEMORY[0x263F1CEE8]) != 0))
      {
        if (objc_opt_respondsToSelector() & 1) != 0 && ([location[0] canBecomeFocused]) {
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
      }
    }
    objc_opt_class();
    BOOL v4 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      BOOL v4 = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        BOOL v4 = 1;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          BOOL v4 = 1;
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            BOOL v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 2;
          }
        }
      }
    }
    BOOL v13 = v4;
  }
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_axGetFocusedSubview
{
  return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
}

- (void)_axSetFocusedSubview:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedNonRetainedObject();
  objc_storeStrong(location, 0);
}

- (id)preferredFocusedView
{
  int v21 = self;
  v20[1] = (id)a2;
  v19.receiver = self;
  v19.super_class = (Class)UITableViewCellAccessibility;
  v20[0] = [(UITableViewCellAccessibility *)&v19 preferredFocusedView];
  if ([(UITableViewCellAccessibility *)v21 _accessibilityIsFKARunningForFocusItem])
  {
    char v17 = 0;
    objc_opt_class();
    id v16 = (id)__UIAccessibilityCastAsClass();
    id v15 = v16;
    objc_storeStrong(&v16, 0);
    id v18 = v15;
    id v7 = (id)[MEMORY[0x263F1C650] focusSystemForEnvironment:v21];
    id v14 = (id)[v7 focusedItem];

    id v8 = [(UITableViewCellAccessibility *)v21 _axGetFocusedSubview];
    char v11 = 0;
    char v9 = 0;
    if (v8)
    {
      id v2 = v8;
    }
    else
    {
      id v12 = [(UITableViewCellAccessibility *)v21 _accessibilityParentTableView];
      char v11 = 1;
      id v10 = (id)[v12 _axGetLastFocusedChild];
      char v9 = 1;
      id v2 = v10;
    }
    id v13 = v2;
    if (v9) {

    }
    if (v11) {
    if ([(UITableViewCellAccessibility *)v21 canBecomeFocused] && v14 || !v13)
    }
    {
      objc_storeStrong(v20, v18);
    }
    else if ([(UITableViewCellAccessibility *)v21 safeBoolForKey:@"_isFocusedOrAncestorOfFocusedView"] & 1) != 0&& (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      objc_storeStrong(v20, v14);
    }
    else
    {
      id v3 = -[UIViewAccessibility _accessibilitySubviewMatchingFKAView:](v18, v13);
      id v4 = v20[0];
      v20[0] = v3;
    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v18, 0);
  }
  id v6 = v20[0];
  objc_storeStrong(v20, 0);

  return v6;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  int v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19.receiver = v21;
  v19.super_class = (Class)UITableViewCellAccessibility;
  [(UITableViewCellAccessibility *)&v19 _didUpdateFocusInContext:location[0]];
  char v17 = 0;
  char v10 = 0;
  char v7 = 0;
  BOOL v6 = 0;
  if ([(UITableViewCellAccessibility *)v21 _accessibilityIsFKARunningForFocusItem])
  {
    id v5 = (id)[location[0] nextFocusedView];
    id v18 = v5;
    char v17 = 1;
    uint64_t v11 = MEMORY[0x263EF8330];
    int v12 = -1073741824;
    int v13 = 0;
    id v14 = __57__UITableViewCellAccessibility__didUpdateFocusInContext___block_invoke;
    id v15 = &unk_2650AE790;
    id v16 = v21;
    char v10 = 1;
    char v9 = (id *)&v16;
    id v8 = (id)[v5 _accessibilityFindAncestor:&v11 startWithSelf:1];
    char v7 = 1;
    BOOL v6 = v8 != 0;
  }
  if (v7) {

  }
  if (v17) {
  if (v6)
  }
  {
    id v3 = v21;
    id v4 = (id)[location[0] nextFocusedView];
    -[UITableViewCellAccessibility _axSetFocusedSubview:](v3, "_axSetFocusedSubview:");
  }
  if (v10) {
    objc_storeStrong(v9, 0);
  }
  objc_storeStrong(location, 0);
}

BOOL __57__UITableViewCellAccessibility__didUpdateFocusInContext___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  BOOL v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_isEligibleForFocusInteraction
{
  char v25 = self;
  SEL v24 = a2;
  char v23 = 0;
  v22.receiver = self;
  v22.super_class = (Class)UITableViewCellAccessibility;
  char v23 = [(UITableViewCellAccessibility *)&v22 _isEligibleForFocusInteraction];
  if (!v23
    && ([(UITableViewCellAccessibility *)v25 _accessibilityIsFKARunningForFocusItem] & 1) != 0)
  {
    char v20 = 0;
    objc_opt_class();
    id v19 = (id)__UIAccessibilityCastAsClass();
    id v18 = v19;
    objc_storeStrong(&v19, 0);
    id v21 = v18;
    char v16 = 0;
    objc_opt_class();
    id v4 = (id)[(UITableViewCellAccessibility *)v25 safeValueForKey:@"_tableView"];
    id v15 = (id)__UIAccessibilityCastAsClass();

    id v14 = v15;
    objc_storeStrong(&v15, 0);
    id v17 = (id)[v14 _swipeActionController];

    id v3 = v21;
    uint64_t v7 = 0;
    id v8 = &v7;
    int v9 = 838860800;
    int v10 = 48;
    uint64_t v11 = __Block_byref_object_copy__21;
    int v12 = __Block_byref_object_dispose__21;
    id v13 = 0;
    v6[1] = &v7;
    v6[0] = v17;
    AXPerformSafeBlock();
    id v5 = (id)v8[5];
    objc_storeStrong(v6, 0);
    _Block_object_dispose(&v7, 8);
    objc_storeStrong(&v13, 0);
    char v23 = v3 == v5;

    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
  }
  return v23 & 1;
}

void __62__UITableViewCellAccessibility__isEligibleForFocusInteraction__block_invoke(uint64_t a1)
{
  id v4 = *(void **)(a1 + 32);
  id v6 = (id)[v4 swipedIndexPath];
  id v1 = (id)objc_msgSend(v4, "_swipedViewForItemAtIndexPath:");
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 4UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0) = v1;
}

- (id)accessibilityPath
{
  BOOL v27 = self;
  v26[1] = (id)a2;
  v26[0] = [(UITableViewCellAccessibility *)self _accessibilityIndexPath];
  id v25 = [(UITableViewCellAccessibility *)v27 _accessibilityParentTableView];
  uint64_t v13 = [v25 numberOfSections];
  if (v13 <= [v26[0] section])
  {
    id v28 = 0;
  }
  else
  {
    BOOL v24 = [v26[0] row] == 0;
    uint64_t v11 = [v26[0] row];
    BOOL v23 = v11 == objc_msgSend(v25, "numberOfRowsInSection:", objc_msgSend(v26[0], "section")) - 1;
    char v21 = 0;
    objc_opt_class();
    id v12 = (id)[(UITableViewCellAccessibility *)v27 safeValueForKey:@"layer"];
    id v20 = (id)__UIAccessibilityCastAsClass();

    id v19 = v20;
    objc_storeStrong(&v20, 0);
    id v22 = v19;
    uint64_t v18 = 0;
    if (v24) {
      uint64_t v18 = 3;
    }
    if (v23) {
      v18 |= 0xCuLL;
    }
    int v10 = (void *)MEMORY[0x263F1C478];
    [(UITableViewCellAccessibility *)v27 accessibilityFrame];
    double v14 = v2;
    double v15 = v3;
    double v16 = v4;
    double v17 = v5;
    [v22 cornerRadius];
    [v22 cornerRadius];
    CGSizeMake_2();
    id v28 = (id)objc_msgSend(v10, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v18, v14, v15, v16, v17, v6, v7);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  id v8 = v28;

  return v8;
}

@end