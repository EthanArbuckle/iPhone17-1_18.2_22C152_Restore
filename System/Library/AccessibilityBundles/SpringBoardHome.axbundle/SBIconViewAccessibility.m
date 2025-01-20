@interface SBIconViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanDrag;
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityCanReceiveGrabbedIcons;
- (BOOL)_accessibilityCanReceiveIcons:(id)a3;
- (BOOL)_accessibilityDeleteApp;
- (BOOL)_accessibilityElementShouldBeInvalid;
- (BOOL)_accessibilityHasBadge;
- (BOOL)_accessibilityIsCategoryIconView;
- (BOOL)_accessibilityIsDraggingWidget;
- (BOOL)_accessibilityIsFolderIconView;
- (BOOL)_accessibilityIsInCmdTabSwitcher;
- (BOOL)_accessibilityIsInFolder;
- (BOOL)_accessibilityIsInShortcutMenu;
- (BOOL)_accessibilityIsTimedOut;
- (BOOL)_accessibilityIsWidgetIconView;
- (BOOL)_accessibilityIsWidgetInAddWidgetSheet;
- (BOOL)_accessibilityIsWidgetStackIconView;
- (BOOL)_accessibilityLaunchAppWithRole:(int64_t)a3 onLeadingSide:(BOOL)a4;
- (BOOL)_accessibilityLaunchFloatingTrailing:(id)a3;
- (BOOL)_accessibilityLaunchLeading:(id)a3;
- (BOOL)_accessibilityLaunchTrailing:(id)a3;
- (BOOL)_accessibilityOverridesInvisibility;
- (BOOL)_accessibilityResizeControl:(id)a3;
- (BOOL)_accessibilityScrollToVisible;
- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (BOOL)_accessibilityShowAppLibrary;
- (BOOL)_accessibilityShowTodayView;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilityToggleJigglyMode;
- (BOOL)_accessibilityUpdatesSwitchMenu;
- (BOOL)_axIconManagerHasOpenFolder;
- (BOOL)_axInAmbientPresentationMode;
- (BOOL)_axIsAppLibraryInDock;
- (BOOL)_axIsIconEditing;
- (BOOL)_axIsInControlCenter;
- (BOOL)_axIsInControlCenterGallery;
- (BOOL)_axIsInDock;
- (BOOL)accessibilityActivate;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (BOOL)shouldGroupAccessibilityChildren;
- (CGPoint)_accessibilityAmbientModeDropPoint:(BOOL)a3;
- (CGPoint)accessibilityActivationPoint;
- (CGRect)_accessibilityCompareFrameForScrollParent:(id)a3 frame:(CGRect)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6;
- (CGRect)_accessibilityFrameForSorting;
- (CGRect)accessibilityBrailleMapRenderRegion;
- (CGRect)accessibilityFrame;
- (id)_accessibilityAddToDragSessionCustomAction;
- (id)_accessibilityBundleIdentifier;
- (id)_accessibilityFilterInteractionLocationDescriptorsForVisible:(id)a3;
- (id)_accessibilityPreferredScrollActions;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySupportGesturesAttributes;
- (id)_axDragManager;
- (id)_axDropPointLabel:(BOOL)a3;
- (id)_axFolderController;
- (id)_axIconController;
- (id)_axIconManager;
- (id)_axRootList;
- (id)_axSortedSupportedGridSizeClasses;
- (id)_axStringForGridSizeClass:(id)a3;
- (id)_viewToAddFocusLayer;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityDropPointDescriptors;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (id)automationElements;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)focusGroupIdentifier;
- (int64_t)_accessibilityExpandedStatus;
- (int64_t)_axIconToCCUIGridSize:(id)a3;
- (int64_t)_insertionIndexOfFocusLayerInView;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
- (unint64_t)accessibilityTraits;
- (unsigned)_accessibilityMediaAnalysisOptions;
- (void)_accessibilityAddAppLibraryViewAction:(id)a3;
- (void)_accessibilityAddControlsGalleryViewAction:(id)a3;
- (void)_accessibilityAddEditActions:(id)a3;
- (void)_accessibilityAddTodayViewAction:(id)a3;
- (void)_accessibilityBeginDragAtPoint:(CGPoint)a3 endpoint:(id)a4 completion:(id)a5;
- (void)_accessibilityDeleteActions:(id)a3;
- (void)_accessibilityDropFromFolderAction:(id)a3;
- (void)_accessibilityEditAmbientIcon;
- (void)_accessibilityInDockActions:(id)a3;
- (void)_accessibilityIsWidgetInAddWidgetSheet;
- (void)_accessibilityResizeActions:(id)a3;
- (void)_accessibilitySetupCloseBox;
- (void)_axIsInDock;
- (void)_axRootList;
- (void)_createCloseBoxIfNecessary;
- (void)_updateCloseBoxAnimated:(BOOL)a3;
- (void)_updateCustomIconImageViewControllerHitTesting;
- (void)accessibilityElementDidBecomeFocused;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation SBIconViewAccessibility

- (void)_updateCloseBoxAnimated:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBIconViewAccessibility;
  [(SBIconViewAccessibility *)&v4 _updateCloseBoxAnimated:a3];
  [(SBIconViewAccessibility *)self _accessibilitySetupCloseBox];
}

- (void)_accessibilitySetupCloseBox
{
  v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"_closeBox"];
  [v3 setAccessibilityIdentifier:@"DeleteButton"];

  id v4 = [(SBIconViewAccessibility *)self safeValueForKey:@"_closeBox"];
  [v4 setIsAccessibilityElement:0];
}

+ (id)safeCategoryTargetClassName
{
  return @"SBIconView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBHLibraryPodIndicatorIcon"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"location", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"_isShowingCloseBox", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"_createCloseBoxIfNecessary", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"_updateCloseBoxAnimated:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"contextMenuInteraction:configurationForMenuAtLocation:", "@", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"contextMenuInteraction:willEndForConfiguration:animator:", "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"canBecomeFocused", "B", 0);
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_closeBox" withType:"SBCloseBoxView"];
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_accessoryView" withType:"UIView<SBIconAccessoryView>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"canReceiveGrabbedIcon:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"directlyContainsIcon:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"directlyContainsLeafIconWithIdentifier:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"effectiveDockListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"currentIconListView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"icon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"indexForIcon:", "Q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"isEditing", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isFolderIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isPlaceholder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isWidgetIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isCategoryIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"isWidgetStackIcon", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"canBeAddedToMultiItemDrag", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"gridSizeClass", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"isFull", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIcon", @"labelAccessoryType", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolder", @"containsIcon:", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"openedFolder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"_iconImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"folderIcon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"iconImageCornerRadius", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"isCustomIconImageViewHitTestingDisabled", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"_updateCustomIconImageViewControllerHitTesting", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"customIconImageViewController", "@", 0);
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_iconLocation" withType:"NSString"];
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_focusEffectPlatterView" withType:"SBIconFocusEffectPlatterView"];
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_delegate" withType:"<SBIconViewDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"enumerateIconDragContextsUsingBlock:", "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"isUserActive", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragContext", @"draggedIcons", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderController", @"setCurrentPageIndex: animated: completion:", "B", "q", "B", "@?", 0);
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_accessoryView" withType:"UIView<SBIconAccessoryView>"];
  [v3 validateProtocol:@"SBIconViewDelegate" hasOptionalInstanceMethod:@"iconTapped:"];
  [v3 validateProtocol:@"SBIconViewDelegate" hasOptionalInstanceMethod:@"iconCloseBoxTapped:"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFloatingDockViewController", @"suggestionsViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_accessibilityCanDrag", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_accessibilityBeginDragAtPoint:endpoint:completion:", "v", "{CGPoint=dd}", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"cancelAllDrags", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconDragManager", @"isTrackingWidgetIconDrags", "B", 0);
  [v3 validateClass:@"SBHIconManager"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"currentRootIconList", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"_effectiveTodayViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"openedFolderController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"hasOpenFolder", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconManager", @"setEditing:", "v", "B", 0);
  [v3 validateClass:@"SBIconListView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconColumnsForCurrentOrientation", "Q", 0);
  [v3 validateProtocol:@"_UIFocusItemInternal" hasOptionalInstanceMethod:@"_viewToAddFocusLayer"];
  [v3 validateProtocol:@"_UIFocusItemInternal" hasOptionalInstanceMethod:@"_insertionIndexOfFocusLayerInView"];
  [v3 validateClass:@"SBHPageManagementIcon"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryViewController", @"podFolderViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryViewController", @"popNestedViewControllerAnimated:withCompletion:", "v", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryPodFolderController", @"_nestingViewControllerForPushing", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"behaviorDelegate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityFrameForSorting", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "q", "q", 0);
  [v3 validateClass:@"SBHLibraryCategoryStackView"];
  [v3 validateClass:@"SBHLibraryCategoryStackView" hasInstanceVariable:@"_iconImageViews" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"presentStackConfigurationCard", "v", 0);
  [v3 validateClass:@"SBHStackConfigurationViewController" hasInstanceVariable:@"_presenter" withType:"<SBHWidgetSheetViewControllerPresenter>"];
  [v3 validateClass:@"SBHStackConfigurationViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"coordinateAtPoint:", "{SBIconCoordinate=qq}", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"centerForIconCoordinate:", "{CGPoint=dd}", "{SBIconCoordinate=qq}", 0);
  [v3 validateClass:@"_SBHStackConfigurationIconView"];
  [v3 validateClass:@"_SBHStackConfigurationIconView" isKindOfClass:@"SBIconView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SBHStackConfigurationIconView", @"_stackConfigurationViewController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_SBHStackConfigurationIconView", @"_iconListView", "@", 0);
  [v3 validateClass:@"SBIconView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_delegate" withType:"<SBIconViewDelegate>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"isShowingResizeHandle", "B", 0);
  [v3 validateClass:@"SBIconView" hasInstanceVariable:@"_customIconImageViewController" withType:"UIViewController<SBIconViewCustomImageViewControlling>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"supportedIconGridSizeClasses", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"iconGridSizeClassSizes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHIconGridSizeClassSizeMap", @"gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"listLayout", "@", 0);
  [v3 validateProtocol:@"SBIconListLayout" hasMethod:@"iconImageInfoForGridSizeClass:" isInstanceMethod:1 isRequired:0];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconView", @"setIconImageInfo:", "v", "{SBIconImageInfo={CGSize=dd}dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"bestGridCellIndexForInsertingIcon:maintainingPositionBeforeIcon:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", "Q", "@", "@", "B", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"bestGridCellIndexForInsertingIcon:maintainingPositionAfterIcon:ignoringPlaceholders:gridCellInfoOptions:mutationOptions:", "Q", "@", "@", "B", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"iconAtGridCellIndex:gridCellInfoOptions:", "@", "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"iconViewForIcon:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"iconWithIdentifier:", "@", "@", 0);
  [v3 validateClass:@"SBIconListView" hasInstanceVariable:@"_placeholderAssertions" withType:"NSHashTable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListViewPlaceholderAssertion", @"placeholderIcon", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListView", @"displayedModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"numberOfNonPlaceholderIcons", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBIconListModel", @"maxNumberOfIcons", "Q", 0);
}

- (BOOL)_accessibilityIsInCmdTabSwitcher
{
  v2 = [(SBIconViewAccessibility *)self _accessibilityValueForKey:@"AXIsInCmdTabSwitcher"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)_accessibilityIsInShortcutMenu
{
  v2 = [(SBIconViewAccessibility *)self _accessibilityValueForKey:@"AXIsInShortcutMenu"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)_accessibilityAutomationType
{
  return 44;
}

- (BOOL)_axIsAppLibraryInDock
{
  char v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  if ([(SBIconViewAccessibility *)self _axIsInDock])
  {
    NSClassFromString(&cfstr_Sbhlibrarypodi_3.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_axIsInControlCenterGallery
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"delegate"];
  NSClassFromString(&cfstr_Controlcenteru_0.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsInControlCenter
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"location"];
  char v3 = [v2 isEqualToString:@"controlCenter"];

  return v3;
}

- (id)accessibilityLabel
{
  if ([(SBIconViewAccessibility *)self _axIsAppLibraryInDock])
  {
    accessibilityLocalizedString(@"app.library");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    v5 = AXSBMainSwitcherControllerCoordinatorSharedInstance();
    if ([v5 safeBoolForKey:@"_axIsAppSwitcherPeekingSlideOver"])
    {
      v6 = [v5 safeValueForKeyPath:@"_activeDisplaySwitcherController._currentLayoutState.floatingAppLayout"];
      v7 = [v5 _appLayoutContainingDisplayItem:v6];
    }
    else if ([v5 safeBoolForKey:@"_axIsAppSwitcherPeekingSplitView"])
    {
      v7 = [v5 safeValueForKeyPath:@"_activeDisplaySwitcherController._currentLayoutState.appLayout"];
    }
    else
    {
      v7 = 0;
    }
    v8 = [v4 accessibilityLabel];
    v9 = v8;
    if (v7)
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__8;
      v23 = __Block_byref_object_dispose__8;
      id v24 = 0;
      uint64_t v17 = MEMORY[0x263EF8330];
      v18 = self;
      AXPerformSafeBlock();
      id v10 = (id)v20[5];
      _Block_object_dispose(&v19, 8);

      char v11 = [v10 safeBoolForKey:@"isMedusaCapable"];
      if (v11)
      {
        v12 = [v7 safeStringForKey:@"_axDisplayName"];
        if ([v5 safeBoolForKey:@"_axIsAppSwitcherPeekingSlideOver"]) {
          v13 = @"create.slide.over.with.home.icon";
        }
        else {
          v13 = @"create.split.view.with.home.icon";
        }
        v14 = accessibilityLocalizedString(v13);
        objc_msgSend(NSString, "stringWithFormat:", v14, v12, v9, v17, 3221225472, __45__SBIconViewAccessibility_accessibilityLabel__block_invoke, &unk_265157EE8, v18, &v19);
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = NSString;
        v12 = accessibilityLocalizedString(@"incompatible.split.view.icon");
        objc_msgSend(v15, "stringWithFormat:", v12, v9);
        id v3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v3 = v8;
    }
  }

  return v3;
}

void __45__SBIconViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  AXSBApplicationControllerSharedInstance();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(a1 + 32) _accessibilityBundleIdentifier];
  uint64_t v3 = [v6 applicationWithBundleIdentifier:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilityIdentifier
{
  if ([(SBIconViewAccessibility *)self _axIsAppLibraryInDock])
  {
    uint64_t v3 = @"AppLibrary";
  }
  else
  {
    uint64_t v4 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    uint64_t v3 = [v4 accessibilityIdentifier];
  }

  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  if ([(SBIconViewAccessibility *)self _axIsAppLibraryInDock])
  {
    uint64_t v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"delegate"];
    char v4 = [v3 safeBoolForKey:@"isPresentingLibrary"];

    if (v4) {
      return 1;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)SBIconViewAccessibility;
  return [(SBIconViewAccessibility *)&v6 _accessibilityExpandedStatus];
}

- (BOOL)_accessibilityIsFolderIconView
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"folderIcon"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_accessibilityIsWidgetIconView
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  char v3 = [v2 safeBoolForKey:@"isWidgetIcon"];

  return v3;
}

- (BOOL)_accessibilityIsWidgetStackIconView
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  char v3 = [v2 safeBoolForKey:@"isWidgetStackIcon"];

  return v3;
}

- (BOOL)_accessibilityIsWidgetInAddWidgetSheet
{
  v2 = [(SBIconViewAccessibility *)self safeStringForKey:@"location"];
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v3 = (void *)getSBIconLocationAddWidgetSheetSymbolLoc_ptr;
  uint64_t v10 = getSBIconLocationAddWidgetSheetSymbolLoc_ptr;
  if (!getSBIconLocationAddWidgetSheetSymbolLoc_ptr)
  {
    char v4 = (void *)SpringBoardHomeLibrary_0();
    v8[3] = (uint64_t)dlsym(v4, "SBIconLocationAddWidgetSheet");
    getSBIconLocationAddWidgetSheetSymbolLoc_ptr = v8[3];
    char v3 = (void *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v3) {
    -[SBIconViewAccessibility _accessibilityIsWidgetInAddWidgetSheet]();
  }
  char v5 = [v2 containsString:*v3];

  return v5;
}

- (BOOL)_accessibilityIsCategoryIconView
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  char v3 = [v2 safeBoolForKey:@"isCategoryIcon"];

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (CGRect)accessibilityBrailleMapRenderRegion
{
  char v3 = [(SBIconViewAccessibility *)self safeUIViewForKey:@"_iconImageView"];
  [v3 frame];
  -[SBIconViewAccessibility convertRect:fromView:](self, "convertRect:fromView:", v3);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0x100000;
}

- (int64_t)accessibilityContainerType
{
  int v3 = ![(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView]
    || ([(SBIconViewAccessibility *)self safeBoolForKey:@"isCustomIconImageViewHitTestingDisabled"] & 1) != 0|| [(SBIconViewAccessibility *)self _axIsIconEditing];
  double v4 = [(SBIconViewAccessibility *)self safeStringForKey:@"location"];
  double v5 = getSBIconLocationAppLibrary();
  int v6 = [v4 containsString:v5];

  if (v6) {
    int v3 = ![(SBIconViewAccessibility *)self _accessibilityIsCategoryIconView];
  }
  if ([(SBIconViewAccessibility *)self _axIsInControlCenter]
    || [(SBIconViewAccessibility *)self _axIsInControlCenterGallery]
    || v3)
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (BOOL)_accessibilityIsInFolder
{
  if (!AXProcessIsSpringBoard()) {
    return 0;
  }
  int v3 = [(SBIconViewAccessibility *)self _axIconManager];
  if ([(SBIconViewAccessibility *)self _axIconManagerHasOpenFolder])
  {
    if ([(SBIconViewAccessibility *)self _axIsInControlCenter])
    {
      double v4 = [(SBIconViewAccessibility *)self _axFolderController];
      double v5 = [v4 safeValueForKeyPath:@"folderView.folder"];
    }
    else
    {
      double v5 = [v3 safeValueForKey:@"openedFolder"];
    }
    double v7 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    uint64_t v11 = 0;
    double v12 = &v11;
    uint64_t v13 = 0x2020000000;
    char v14 = 0;
    id v9 = v5;
    id v10 = v7;
    AXPerformSafeBlock();
    BOOL v6 = *((unsigned char *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __51__SBIconViewAccessibility__accessibilityIsInFolder__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) containsIcon:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityHasBadge
{
  int v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  double v4 = [v3 safeValueForKey:@"badgeNumberOrString"];
  if (v4)
  {
    objc_opt_class();
    double v5 = [(SBIconViewAccessibility *)self safeValueForKey:@"_accessoryView"];
    BOOL v6 = __UIAccessibilityCastAsClass();

    char v7 = [v6 _accessibilityViewIsVisible];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_accessibilityIsTimedOut
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"_icon"];
  uint64_t v3 = [v2 safeIntegerForKey:@"labelAccessoryType"];

  return v3 == 4;
}

- (BOOL)_accessibilityCanReceiveIcons:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        if ([*(id *)(*((void *)&v22 + 1) + 8 * i) safeBoolForKey:@"isPlaceholder"])
        {
          LOBYTE(v16) = 0;
          char v7 = AXSBIconControllerSharedInstance();
          double v8 = [v7 safeValueForKey:@"iconDragManager"];
          id v9 = __UIAccessibilitySafeClass();

          if ((_BYTE)v16) {
            abort();
          }
          uint64_t v16 = 0;
          uint64_t v17 = &v16;
          uint64_t v18 = 0x3032000000;
          uint64_t v19 = __Block_byref_object_copy__8;
          v20 = __Block_byref_object_dispose__8;
          id v21 = 0;
          id v15 = v9;
          AXPerformSafeBlock();
          BOOL v10 = [(SBIconViewAccessibility *)self _accessibilityCanReceiveIcons:v17[5]];

          _Block_object_dispose(&v16, 8);
          if (!v10) {
            goto LABEL_13;
          }
        }
        uint64_t v16 = 0;
        uint64_t v17 = &v16;
        uint64_t v18 = 0x2020000000;
        LOBYTE(v19) = 0;
        AXPerformSafeBlock();
        int v11 = *((unsigned __int8 *)v17 + 24);
        _Block_object_dispose(&v16, 8);
        if (!v11)
        {
LABEL_13:
          BOOL v12 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_14:

  return v12;
}

uint64_t __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke_2;
  v3[3] = &unk_265158038;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIconDragContextsUsingBlock:v3];
}

void __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 safeBoolForKey:@"isUserActive"])
  {
    uint64_t v3 = [v6 safeArrayForKey:@"draggedIcons"];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

uint64_t __57__SBIconViewAccessibility__accessibilityCanReceiveIcons___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canReceiveGrabbedIcon:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityCanReceiveGrabbedIcons
{
  v2 = self;
  uint64_t v3 = [(SBIconViewAccessibility *)self _axDragManager];
  uint64_t v4 = [v3 _axGrabbedIcons];
  LOBYTE(v2) = [(SBIconViewAccessibility *)v2 _accessibilityCanReceiveIcons:v4];

  return (char)v2;
}

- (id)accessibilityHint
{
  uint64_t v3 = [(SBIconViewAccessibility *)self safeStringForKey:@"location"];
  uint64_t v4 = getSBIconLocationAppLibrary();
  if ([v3 containsString:v4])
  {
    BOOL v5 = [(SBIconViewAccessibility *)self _accessibilityIsCategoryIconView];

    if (v5)
    {
      id v6 = 0;
      goto LABEL_19;
    }
  }
  else
  {
  }
  if ([(SBIconViewAccessibility *)self _axIsAppLibraryInDock])
  {
    char v7 = [(SBIconViewAccessibility *)self safeValueForKey:@"delegate"];
    int v8 = [v7 safeBoolForKey:@"isPresentingLibrary"];

    if (v8)
    {
      id v9 = @"app.library.hide.hint";
LABEL_13:
      accessibilityLocalizedString(v9);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  if ([(SBIconViewAccessibility *)self _axIsInControlCenterGallery])
  {
    if (AXProcessIsPosterBoard())
    {
      id v9 = @"quick.actions.add.control.hint";
      goto LABEL_13;
    }
    if (AXProcessIsSpringBoard())
    {
      id v9 = @"control.center.add.control.hint";
      goto LABEL_13;
    }
  }
  BOOL v10 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  int v11 = [v10 accessibilityHint];

  if (!v11)
  {
    if (!AXProcessIsSpringBoard()
      || [(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView])
    {
      int v11 = 0;
      goto LABEL_18;
    }
    BOOL v13 = [(SBIconViewAccessibility *)self _axIsIconEditing];
    int v14 = [(SBIconViewAccessibility *)self safeBoolForKey:@"_isShowingCloseBox"];
    id v15 = [(SBIconViewAccessibility *)self safeValueForKey:@"_icon"];
    uint64_t v16 = [v15 safeIntegerForKey:@"labelAccessoryType"];

    if (!v13 && !v14)
    {
      unint64_t v17 = [(SBIconViewAccessibility *)self accessibilityTraits];
      if ((*MEMORY[0x263F813A0] & v17) != 0)
      {
        if ([(SBIconViewAccessibility *)self _accessibilityIsTimedOut])
        {
          uint64_t v18 = @"app.icon.timed.out.hint";
        }
        else if (v16 == 3)
        {
          uint64_t v18 = @"app.icon.cloud.hint";
        }
        else
        {
          uint64_t v18 = @"app.icon.hint";
        }
        goto LABEL_37;
      }
      if ([(SBIconViewAccessibility *)self _axIsInDock])
      {
        uint64_t v18 = @"dock.full.hint";
        goto LABEL_37;
      }
LABEL_33:
      int v11 = 0;
      goto LABEL_38;
    }
    uint64_t v19 = [(SBIconViewAccessibility *)self _axDragManager];
    v20 = [v19 _axGrabbedIcons];
    uint64_t v21 = [v20 count];

    if (v21)
    {
      long long v22 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
      char v23 = [v22 safeBoolForKey:@"canBeAddedToMultiItemDrag"];

      if ((v23 & 1) == 0) {
        goto LABEL_33;
      }
      uint64_t v18 = @"app.icon.add.to.drag.hint";
    }
    else
    {
      uint64_t v18 = @"app.icon.reorder.hint";
    }
LABEL_37:
    int v11 = accessibilityLocalizedString(v18);
LABEL_38:
    if (AXForceTouchAvailableAndEnabled())
    {
      long long v25 = accessibilityLocalizedString(@"icons.with.forcetouch.hint");
      uint64_t v24 = __UIAXStringForVariables();

      int v11 = (void *)v24;
    }
  }
LABEL_18:
  id v6 = v11;

LABEL_19:

  return v6;
}

- (id)accessibilityValue
{
  if ([(SBIconViewAccessibility *)self _accessibilityIsTimedOut])
  {
    uint64_t v3 = accessibilityLocalizedString(@"screen.time.timed.out");
    goto LABEL_31;
  }
  uint64_t v4 = [(SBIconViewAccessibility *)self safeValueForKey:@"_icon"];
  uint64_t v5 = [v4 safeIntegerForKey:@"labelAccessoryType"];

  if ((unint64_t)(v5 - 1) > 2)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = accessibilityLocalizedString(off_265158418[v5 - 1]);
  }
  char v7 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  v36 = [v7 accessibilityValue];
  int v8 = __UIAXStringForVariables();

  if ([(SBIconViewAccessibility *)self _accessibilityIsFolderIconView])
  {
    objc_opt_class();
    id v9 = [(SBIconViewAccessibility *)self safeValueForKey:@"folderIcon"];
    BOOL v10 = [v9 safeValueForKey:@"_folder"];
    int v11 = [v10 safeValueForKey:@"allIcons"];
    BOOL v12 = __UIAccessibilityCastAsClass();

    uint64_t v13 = [v12 count];
    int v14 = [(SBIconViewAccessibility *)self safeStringForKey:@"location"];
    id v15 = getSBIconLocationAppLibrary();
    int v16 = [v14 containsString:v15];

    if (v16) {
      uint64_t v17 = v13 + 3;
    }
    else {
      uint64_t v17 = v13;
    }
    uint64_t v18 = NSString;
    uint64_t v19 = accessibilityLocalizedString(@"folder.icon.count");
    v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);

    uint64_t v21 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    uint64_t v22 = [v21 safeIntegerForKey:@"progressState"];

    if (v22 == 2)
    {
      long long v25 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
      [v25 safeFloatForKey:@"progressPercent"];
      float v27 = v26;

      if (v27 < 1.0)
      {
        v28.n128_u32[1] = 0;
        v28.n128_f32[0] = v27;
        if (v27 >= 0.0)
        {
          uint64_t v23 = MEMORY[0x245663CE0](0, v28);
          goto LABEL_13;
        }
      }
    }
    else if (v22 == 1)
    {
      uint64_t v23 = accessibilityLocalizedString(@"icon.state.download.waiting");
LABEL_13:
      uint64_t v24 = (void *)v23;
LABEL_17:
      v38 = v8;
      v39 = @"__AXStringForVariablesSentinel";
      v37 = v20;
      uint64_t v29 = __UIAXStringForVariables();

      int v8 = (void *)v29;
      goto LABEL_18;
    }
    uint64_t v24 = 0;
    goto LABEL_17;
  }
LABEL_18:
  if (![(SBIconViewAccessibility *)self _axIsInControlCenter]
    && ![(SBIconViewAccessibility *)self _axIsInControlCenterGallery])
  {
    if ([(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView])
    {
      v32 = accessibilityLocalizedString(@"widget.icon");
      if ([(SBIconViewAccessibility *)self _accessibilityIsWidgetStackIconView])
      {
        v33 = accessibilityLocalizedString(@"widget.icon.stack");
      }
      else
      {
        v33 = 0;
      }
      uint64_t v34 = __UIAXStringForVariables();

      int v8 = (void *)v34;
    }
    id v31 = v8;
    int v8 = v31;
    goto LABEL_29;
  }
  if (![(SBIconViewAccessibility *)self _axIsIconEditing])
  {
    accessibilityLocalizedString(@"control.icon");
    id v31 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
    uint64_t v3 = v31;
    goto LABEL_30;
  }
  v30 = [(SBIconViewAccessibility *)self safeValueForKeyPath:@"icon.gridSizeClass"];
  uint64_t v3 = [(SBIconViewAccessibility *)self _axStringForGridSizeClass:v30];

LABEL_30:
LABEL_31:

  return v3;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = [(SBIconViewAccessibility *)self storedIsAccessibilityElement];

  if (v3)
  {
    uint64_t v4 = [(SBIconViewAccessibility *)self storedIsAccessibilityElement];
    char v5 = [v4 BOOLValue];

    return v5;
  }
  if ([(SBIconViewAccessibility *)self _accessibilityIsInCmdTabSwitcher]) {
    goto LABEL_6;
  }
  if ([(SBIconViewAccessibility *)self _accessibilityIsInShortcutMenu]) {
    goto LABEL_6;
  }
  char v7 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  NSClassFromString(&cfstr_Sbgrabbedplace.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    goto LABEL_6;
  }
  if ([(SBIconViewAccessibility *)self _axIsInDock]
    || [(SBIconViewAccessibility *)self _axIsInControlCenterGallery])
  {
    goto LABEL_10;
  }
  if (![(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView])
  {
    BOOL v10 = [(SBIconViewAccessibility *)self safeStringForKey:@"location"];
    int v11 = getSBIconLocationAppLibrarySearch();
    char v12 = [v10 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = getSBIconLocationAppLibrary();
      int v14 = [v10 containsString:v13];

      if (v14)
      {
        BOOL v9 = ![(SBIconViewAccessibility *)self _accessibilityIsCategoryIconView];
        goto LABEL_31;
      }
      id v15 = getAPUIIconLocationAppPredictions();
      int v16 = [v10 isEqualToString:v15];

      if (v16)
      {
        LOBYTE(v9) = 1;
        goto LABEL_31;
      }
      if (AXProcessIsSpringBoard())
      {
        uint64_t v17 = AXSBHIconManagerFromSharedIconController();
        if ([v17 safeBoolForKey:@"hasOpenFolder"])
        {
          uint64_t v18 = [v17 safeValueForKey:@"openedFolder"];
          uint64_t v28 = 0;
          uint64_t v29 = &v28;
          uint64_t v30 = 0x2020000000;
          LOBYTE(v31) = 0;
          uint64_t v34 = MEMORY[0x263EF8330];
          uint64_t v35 = 3221225472;
          v36 = __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke;
          v37 = &unk_265157EC0;
          v40 = &v28;
          id v19 = v18;
          id v38 = v19;
          v39 = self;
          AXPerformSafeBlock();
          LOBYTE(v9) = *((unsigned char *)v29 + 24) != 0;

          _Block_object_dispose(&v28, 8);
        }
        else
        {
          v20 = [v17 safeValueForKey:@"currentRootIconList"];
          uint64_t v21 = [v20 safeValueForKey:@"model"];

          uint64_t v28 = 0;
          uint64_t v29 = &v28;
          uint64_t v30 = 0x3032000000;
          id v31 = __Block_byref_object_copy__8;
          v32 = __Block_byref_object_dispose__8;
          id v33 = 0;
          id v27 = v21;
          AXPerformSafeBlock();
          id v22 = (id)v29[5];

          _Block_object_dispose(&v28, 8);
          uint64_t v28 = 0;
          uint64_t v29 = &v28;
          uint64_t v30 = 0x2020000000;
          LOBYTE(v31) = 0;
          id v19 = v27;
          id v23 = v22;
          AXPerformSafeBlock();
          int v24 = *((unsigned __int8 *)v29 + 24);

          _Block_object_dispose(&v28, 8);
          if (v24)
          {
            LOBYTE(v9) = 1;
          }
          else
          {
            uint64_t v28 = 0;
            uint64_t v29 = &v28;
            uint64_t v30 = 0x2020000000;
            LOBYTE(v31) = 0;
            id v25 = v19;
            id v26 = v23;
            AXPerformSafeBlock();
            LOBYTE(v9) = *((unsigned char *)v29 + 24) != 0;

            _Block_object_dispose(&v28, 8);
          }
        }
        goto LABEL_31;
      }
    }
    LOBYTE(v9) = 0;
LABEL_31:

    return v9;
  }
  if ([(SBIconViewAccessibility *)self _accessibilityIsWidgetInAddWidgetSheet])
  {
LABEL_6:
    LOBYTE(v9) = 0;
    return v9;
  }
  if ([(SBIconViewAccessibility *)self safeBoolForKey:@"isCustomIconImageViewHitTestingDisabled"])
  {
LABEL_10:
    LOBYTE(v9) = 1;
    return v9;
  }

  return [(SBIconViewAccessibility *)self _axIsIconEditing];
}

void __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) safeValueForKey:@"icon"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsIcon:v3];
}

void __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) safeValueForKey:@"icon"];
  id v3 = [v7 safeStringForKey:@"nodeIdentifier"];
  uint64_t v4 = [v2 iconWithIdentifier:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) directlyContainsIcon:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __49__SBIconViewAccessibility_isAccessibilityElement__block_invoke_4(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) safeValueForKey:@"leafIdentifier"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 directlyContainsLeafIconWithIdentifier:v3];
}

- (id)automationElements
{
  id v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  uint64_t v4 = [v3 automationElements];
  uint64_t v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x263EFF980] array];
  }
  int v8 = v7;

  if (!v8)
  {
    int v8 = [MEMORY[0x263EFF980] array];
  }
  if ([(SBIconViewAccessibility *)self _axIsAppLibraryInDock])
  {
    BOOL v9 = [(SBIconViewAccessibility *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Sbhlibrarycate_4.isa)];
    BOOL v10 = [v9 safeArrayForKey:@"_iconImageViews"];
    [v8 axSafelyAddObjectsFromArray:v10];
  }
  if ([(SBIconViewAccessibility *)self safeBoolForKey:@"_isShowingCloseBox"])
  {
    int v11 = [(SBIconViewAccessibility *)self safeValueForKey:@"_closeBox"];
    [v8 axSafelyAddObject:v11];

LABEL_12:
    id v12 = v8;
    goto LABEL_14;
  }
  if (-[SBIconViewAccessibility isAccessibilityElement](self, "isAccessibilityElement") && [v8 count]) {
    goto LABEL_12;
  }
  objc_opt_class();
  uint64_t v13 = __UIAccessibilityCastAsClass();
  id v12 = [v13 subviews];

LABEL_14:

  return v12;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = *MEMORY[0x263F1CF18];
  if (![(SBIconViewAccessibility *)self safeBoolForKey:@"_isShowingCloseBox"]
    || _AXSAutomationEnabled())
  {
    v3 |= *MEMORY[0x263F813A0];
  }
  BOOL v4 = [(SBIconViewAccessibility *)self _axIsIconEditing];
  uint64_t v5 = *MEMORY[0x263F81398];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v3 | *MEMORY[0x263F1CF68];
}

- (id)_accessibilityBundleIdentifier
{
  v2 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  uint64_t v3 = [v2 _accessibilityBundleIdentifier];

  return v3;
}

- (CGRect)_accessibilityFrameForSorting
{
  if (!AXDeviceIsPad()) {
    goto LABEL_15;
  }
  if (![(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView]) {
    goto LABEL_15;
  }
  uint64_t v3 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  BOOL v4 = getSBIconLocationRoot();
  int v5 = [v3 isEqualToString:v4];

  if (!v5) {
    goto LABEL_15;
  }
  [(SBIconViewAccessibility *)self accessibilityFrame];
  AX_CGRectGetCenter();
  double v7 = v6;
  double v9 = v8;
  BOOL v10 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  int v11 = [v10 safeStringForKey:@"gridSizeClass"];

  if (![v11 isEqualToString:*MEMORY[0x263F792D0]])
  {
    if (([v11 isEqualToString:*MEMORY[0x263F79310]] & 1) != 0
      || ([v11 isEqualToString:*MEMORY[0x263F792E8]] & 1) != 0
      || [v11 isEqualToString:*MEMORY[0x263F792F0]])
    {
      goto LABEL_12;
    }
    if (([v11 isEqualToString:*MEMORY[0x263F792E0]] & 1) != 0
      || [v11 isEqualToString:*MEMORY[0x263F792D8]])
    {
      [(SBIconViewAccessibility *)self accessibilityFrame];
      double v9 = v9 + v17 * -0.25;
LABEL_12:
      [(SBIconViewAccessibility *)self accessibilityFrame];
      double v16 = v18;
      [(SBIconViewAccessibility *)self accessibilityFrame];
      goto LABEL_13;
    }

LABEL_15:
    v28.receiver = self;
    v28.super_class = (Class)SBIconViewAccessibility;
    [(SBIconViewAccessibility *)&v28 _accessibilityFrameForSorting];
    double v7 = v20;
    double v9 = v21;
    double v16 = v22;
    double v19 = v23;
    goto LABEL_16;
  }
  v29.receiver = self;
  v29.super_class = (Class)SBIconViewAccessibility;
  [(SBIconViewAccessibility *)&v29 _accessibilityFrameForSorting];
  double v7 = v13;
  double v9 = v14;
  double v16 = v15;
LABEL_13:
  double v19 = v12;

LABEL_16:
  double v24 = v7;
  double v25 = v9;
  double v26 = v16;
  double v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (CGRect)_accessibilityCompareFrameForScrollParent:(id)a3 frame:(CGRect)a4 fromOrientation:(int64_t)a5 toOrientation:(int64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  if (!AXDeviceIsPad()
    || ![(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView]
    || ([(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"],
        double v14 = objc_claimAutoreleasedReturnValue(),
        getSBIconLocationRoot(),
        double v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v14 isEqualToString:v15],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    v25.receiver = self;
    v25.super_class = (Class)SBIconViewAccessibility;
    -[SBIconViewAccessibility _accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:](&v25, sel__accessibilityCompareFrameForScrollParent_frame_fromOrientation_toOrientation_, v13, a5, a6, x, y, width, height);
    double x = v17;
    double y = v18;
    double width = v19;
    double height = v20;
  }

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"superview"];

  if (v3)
  {
    BOOL v4 = [(SBIconViewAccessibility *)self safeValueForKey:@"bounds"];
    [v4 rectValue];

    int v5 = [(SBIconViewAccessibility *)self safeValueForKey:@"_accessoryView"];
    double v6 = [(SBIconViewAccessibility *)self safeValueForKey:@"_labelView"];
    if (v5 && ([v5 superview], double v7 = objc_claimAutoreleasedReturnValue(), v7, v7))
    {
      UIAccessibilityFrameForBounds();
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [v5 accessibilityFrame];
      v44.origin.CGFloat x = v16;
      v44.origin.CGFloat y = v17;
      v44.size.CGFloat width = v18;
      v44.size.CGFloat height = v19;
      v37.origin.CGFloat x = v9;
      v37.origin.CGFloat y = v11;
      v37.size.CGFloat width = v13;
      v37.size.CGFloat height = v15;
      CGRect v38 = CGRectUnion(v37, v44);
    }
    else
    {
      UIAccessibilityFrameForBounds();
    }
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
    objc_super v28 = [v6 superview];

    if (v28)
    {
      [v6 accessibilityFrame];
      v45.origin.CGFloat x = v29;
      v45.origin.CGFloat y = v30;
      v45.size.CGFloat width = v31;
      v45.size.CGFloat height = v32;
      v39.origin.CGFloat x = x;
      v39.origin.CGFloat y = y;
      v39.size.CGFloat width = width;
      v39.size.CGFloat height = height;
      CGRect v40 = CGRectUnion(v39, v45);
      CGFloat x = v40.origin.x;
      CGFloat y = v40.origin.y;
      CGFloat width = v40.size.width;
      CGFloat height = v40.size.height;
    }
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGRect v42 = CGRectInset(v41, -2.0, -2.0);
    CGFloat v20 = v42.origin.x;
    CGFloat v21 = v42.origin.y;
    CGFloat v22 = v42.size.width;
    CGFloat v23 = v42.size.height;
  }
  else
  {
    CGFloat v20 = *MEMORY[0x263F001A8];
    CGFloat v21 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v22 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v23 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  double v33 = v20;
  double v34 = v21;
  double v35 = v22;
  double v36 = v23;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  int v5 = AXSBIconControllerSharedInstance();
  double v6 = v5;
  if (a3 == 2)
  {
    if ([v5 _axNeedsToDismissHomeScreenTodayView])
    {
      [v6 _axHideTodayView];
      goto LABEL_7;
    }
LABEL_8:
    v9.receiver = self;
    v9.super_class = (Class)SBIconViewAccessibility;
    BOOL v7 = [(SBIconViewAccessibility *)&v9 accessibilityScroll:a3];
    goto LABEL_9;
  }
  if (a3 != 1 || ![v5 _axIsShowingAppLibrary]) {
    goto LABEL_8;
  }
  [v6 _axHideAppLibrary];
LABEL_7:
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (CGPoint)accessibilityActivationPoint
{
  if ([(SBIconViewAccessibility *)self _axIsAppLibraryInDock]
    || [(SBIconViewAccessibility *)self _axIsInControlCenterGallery])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBIconViewAccessibility;
    [(SBIconViewAccessibility *)&v10 accessibilityActivationPoint];
  }
  else
  {
    int v5 = [(SBIconViewAccessibility *)self safeValueForKey:@"_iconImageView"];
    [v5 accessibilityActivationPoint];
    double v7 = v6;
    double v9 = v8;

    double v3 = v7;
    double v4 = v9;
  }
  result.CGFloat y = v4;
  result.CGFloat x = v3;
  return result;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  CGRect v41 = AXSBHIconManagerFromSharedIconController();
  CGRect v40 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
  if (![(SBIconViewAccessibility *)self _axIsInDock])
  {
    if ([v41 safeBoolForKey:@"hasOpenFolder"])
    {
      double v24 = AXSBCurrentFolderController();
      objc_super v25 = [v24 safeValueForKey:@"currentIconListView"];
      double v26 = __UIAccessibilitySafeClass();
    }
    else
    {
      double v26 = [v41 safeValueForKey:@"currentRootIconList"];
    }
    double v27 = [v26 safeValueForKey:@"model"];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    uint64_t v60 = MEMORY[0x263EF8330];
    uint64_t v61 = 3221225472;
    v62 = __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke;
    v63 = &unk_265157EE8;
    v65 = &v66;
    id v3 = v26;
    id v64 = v3;
    AXPerformSafeBlock();
    unint64_t v28 = v67[3];

    _Block_object_dispose(&v66, 8);
    uint64_t v53 = MEMORY[0x263EF8330];
    uint64_t v54 = 3221225472;
    v55 = __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_2;
    v56 = &unk_265157EC0;
    v59 = &v70;
    id v4 = v27;
    id v57 = v4;
    id v58 = v40;
    AXPerformSafeBlock();
    unint64_t v29 = v71[3];
    if (v29 == 0x7FFFFFFFFFFFFFFFLL)
    {
      CGFloat v30 = 0;
    }
    else
    {
      CGFloat v31 = NSString;
      CGFloat v32 = accessibilityLocalizedString(@"finished.moving.app");
      double v33 = MEMORY[0x245663CF0](v29 / v28 + 1);
      double v34 = MEMORY[0x245663CF0](v29 % v28 + 1);
      CGFloat v30 = objc_msgSend(v31, "stringWithFormat:", v32, v33, v34);
    }
    id v11 = v57;
    goto LABEL_29;
  }
  id v3 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  id v4 = [v41 safeValueForKey:@"effectiveDockListView"];
  if ([v3 isEqual:@"SBIconLocationFloatingDockSuggestions"])
  {
    int v5 = AXSBFloatingDockControllerFromActiveDisplayWindowScene();
    double v6 = [v5 safeValueForKey:@"_viewController"];
    double v7 = [v6 safeValueForKey:@"floatingDockViewController"];
    double v8 = [v7 safeValueForKey:@"suggestionsViewController"];
    uint64_t v9 = [v8 safeValueForKey:@"listView"];

    id v4 = (id)v9;
  }
  objc_super v10 = [v4 safeValueForKey:@"model"];
  v71[3] = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v46 = MEMORY[0x263EF8330];
  uint64_t v47 = 3221225472;
  v48 = __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_3;
  v49 = &unk_265157EC0;
  v52 = &v70;
  id v11 = v10;
  id v50 = v11;
  id v12 = v40;
  id v51 = v12;
  AXPerformSafeBlock();
  if (v71[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    CGFloat v13 = [v11 safeArrayForKey:@"icons"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v74 count:16];
    if (v14)
    {
      uint64_t v15 = 0;
      uint64_t v16 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v43 != v16) {
            objc_enumerationMutation(v13);
          }
          if ([*(id *)(*((void *)&v42 + 1) + 8 * i) isEqual:v12]) {
            v71[3] = v15 + i;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v42 objects:v74 count:16];
        v15 += i;
      }
      while (v14);
    }

    if (v71[3] == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_27;
    }
  }
  CGFloat v18 = getSBIconLocationDock();
  int v19 = [v3 isEqual:v18];

  if (!v19)
  {
    if ([v3 isEqual:@"SBIconLocationFloatingDockSuggestions"])
    {
      double v35 = NSString;
      CGFloat v21 = accessibilityLocalizedString(@"suggestions.dock.position");
      CGFloat v22 = MEMORY[0x245663CF0](v71[3] + 1);
      uint64_t v23 = objc_msgSend(v35, "stringWithFormat:", v21, v22);
      goto LABEL_26;
    }
LABEL_27:
    CGFloat v30 = 0;
    goto LABEL_28;
  }
  CGFloat v20 = NSString;
  CGFloat v21 = accessibilityLocalizedString(@"finished.moving.app.in.dock");
  CGFloat v22 = MEMORY[0x245663CF0](v71[3] + 1);
  uint64_t v23 = objc_msgSend(v20, "stringWithFormat:", v21, v22);
LABEL_26:
  CGFloat v30 = (void *)v23;

LABEL_28:
LABEL_29:

  double v36 = [(SBIconViewAccessibility *)self _accessibilityScrollAncestor];
  CGRect v39 = [v36 _accessibilityScrollStatus];
  CGRect v37 = __UIAXStringForVariables();

  _Block_object_dispose(&v70, 8);

  return v37;
}

uint64_t __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) iconColumnsForCurrentOrientation];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexForIcon:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBIconViewAccessibility__accessibilityScrollStatus__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) indexForIcon:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityScrollToVisible
{
  id v3 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  id v4 = getSBIconLocationAppLibrary();
  if (([v3 containsString:v4] & 1) == 0)
  {
    BOOL v5 = [(SBIconViewAccessibility *)self _axIsInControlCenterGallery];

    if (v5) {
      goto LABEL_4;
    }
    if (AXProcessIsCarPlay())
    {
      v12.receiver = self;
      v12.super_class = (Class)SBIconViewAccessibility;
      unsigned __int8 v6 = [(SBIconViewAccessibility *)&v12 _accessibilityScrollToVisible];
      goto LABEL_5;
    }
    uint64_t v9 = [(SBIconViewAccessibility *)self safeValueForKey:@"delegate"];
    NSClassFromString(&cfstr_Sbhstackconfig_0.isa);
    if (objc_opt_isKindOfClass())
    {
      objc_super v10 = [v9 safeValueForKey:@"_presenter"];
      NSClassFromString(&cfstr_Amuiinfographv.isa);
      if (objc_opt_isKindOfClass())
      {
        v11.receiver = self;
        v11.super_class = (Class)SBIconViewAccessibility;
        BOOL v7 = [(SBIconViewAccessibility *)&v11 _accessibilityScrollToVisible];

LABEL_14:
        goto LABEL_6;
      }
    }
    BOOL v7 = 1;
    goto LABEL_14;
  }

LABEL_4:
  v13.receiver = self;
  v13.super_class = (Class)SBIconViewAccessibility;
  unsigned __int8 v6 = [(SBIconViewAccessibility *)&v13 _accessibilityScrollToVisible];
LABEL_5:
  BOOL v7 = v6;
LABEL_6:

  return v7;
}

- (BOOL)accessibilityActivate
{
  if (AXProcessIsCarPlay()) {
    return 0;
  }
  BOOL v4 = [(SBIconViewAccessibility *)self _axIsIconEditing];
  int v5 = [(SBIconViewAccessibility *)self safeBoolForKey:@"_isShowingCloseBox"];
  unsigned __int8 v6 = [(SBIconViewAccessibility *)self _axDragManager];
  int v7 = [v6 _axIsIconDragging];

  if (v7)
  {
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    return [(SBIconViewAccessibility *)&v12 accessibilityActivate];
  }
  else if ((v4 & v5) == 1)
  {
    return [(SBIconViewAccessibility *)self _accessibilityDeleteApp];
  }
  else
  {
    double v8 = [(SBIconViewAccessibility *)self safeValueForKey:@"_delegate"];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      objc_super v10 = [(SBIconViewAccessibility *)self safeValueForKey:@"_delegate"];
      [v10 iconTapped:self];

      return 1;
    }
    else
    {
      return [(SBIconViewAccessibility *)&v11 accessibilityActivate];
    }
  }
}

- (BOOL)_accessibilityDeleteApp
{
  id v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"_delegate"];
  char v4 = objc_opt_respondsToSelector();
  if (v4) {
    [v3 iconCloseBoxTapped:self];
  }

  return v4 & 1;
}

- (BOOL)_accessibilityResizeControl:(id)a3
{
  id v10 = a3;
  id v4 = v10;
  AXPerformSafeBlock();
  int v5 = NSString;
  unsigned __int8 v6 = accessibilityLocalizedString(@"control.resize.announcement");
  int v7 = [(SBIconViewAccessibility *)self _axStringForGridSizeClass:v4];
  double v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], self);
  UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v8);

  return 1;
}

void __55__SBIconViewAccessibility__accessibilityResizeControl___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_customIconImageViewController"];
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"_delegate"];
  id v3 = [*(id *)(a1 + 32) safeSwiftValueForKey:@"listLayout"];
  [v3 iconImageInfoForGridSizeClass:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:");
  [*(id *)(a1 + 32) layoutIfNeeded];
  objc_msgSend(v5, "setGridSizeClass:", objc_msgSend(*(id *)(a1 + 32), "_axIconToCCUIGridSize:", *(void *)(a1 + 40)));
  id v4 = [*(id *)(a1 + 32) safeValueForKey:@"icon"];
  [v2 changeGridSizeClassOfIcon:v4 toGridSizeClass:*(void *)(a1 + 40)];

  [v2 resetEndEditingTimerIfNecessary];
}

- (int64_t)_axIconToCCUIGridSize:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CCUIIconGridSizeClassSmall"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassSmallTall"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassSmallWide"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassSmallExtraWide"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassMedium"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassMediumWide"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassLarge"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassLargeTall"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassLargeWide"])
  {
    int64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassLargeExtraTall"])
  {
    int64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"CCUIIconGridSizeClassLargeExtraWide"])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_accessibilityElementShouldBeInvalid
{
  id v3 = [(SBIconViewAccessibility *)self superview];

  if (!v3) {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBIconViewAccessibility;
  return [(SBIconViewAccessibility *)&v5 _accessibilityElementShouldBeInvalid];
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  v2 = AXSBHIconManagerFromSharedIconController();
  char v3 = [v2 safeBoolForKey:@"hasOpenFolder"];

  return v3;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  return _AXSAutomationEnabled() != 0;
}

- (BOOL)accessibilityPerformEscape
{
  char v3 = AXSBIconControllerSharedInstance();
  if ([v3 safeBoolForKey:@"areAnyIconViewContextMenusShowing"])
  {
    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"AXDismissShortcutMenu" object:0];
LABEL_6:

    goto LABEL_7;
  }
  if ([v3 _axIsShowingAppLibrary])
  {
    objc_super v5 = [(SBIconViewAccessibility *)self safeStringForKey:@"location"];
    unsigned __int8 v6 = getSBIconLocationAppLibraryCategoryPodExpanded();
    int v7 = [v5 isEqualToString:v6];

    if (!v7)
    {
      [v3 _axHideAppLibrary];
      goto LABEL_7;
    }
    double v8 = AXLibraryViewController(@"activeDisplayWindowScene");
    char v9 = [v8 safeValueForKeyPath:@"podFolderViewController._nestingViewControllerForPushing"];

    id v4 = v9;
    AXPerformSafeBlock();

    goto LABEL_6;
  }
  if (![v3 _axNeedsToDismissHomeScreenTodayView])
  {
    BOOL v10 = 0;
    goto LABEL_8;
  }
  [v3 _axHideTodayView];
LABEL_7:
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

uint64_t __53__SBIconViewAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) popNestedViewControllerAnimated:1 withCompletion:0];
}

- (id)accessibilityCustomActions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if ([(SBIconViewAccessibility *)self _axIsInControlCenterGallery])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF980] array];
    objc_super v5 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
    unsigned __int8 v6 = AXLogSpringboardServer();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      uint64_t v22 = (uint64_t)v5;
      _os_log_impl(&dword_2425C0000, v6, OS_LOG_TYPE_INFO, "[Custom Action]: Icon located in %@.", (uint8_t *)&v21, 0xCu);
    }

    int v7 = getAPUIIconLocationAppPredictions();
    if ([v5 isEqualToString:v7])
    {
      char v8 = 1;
    }
    else
    {
      char v9 = getSBIconLocationAppLibrary();
      if ([v5 containsString:v9])
      {
        BOOL v10 = getSBIconLocationAppLibraryCategoryPodExpanded();
        if ([v5 isEqualToString:v10]) {
          char v8 = 0;
        }
        else {
          char v8 = ![(SBIconViewAccessibility *)self _accessibilityIsCategoryIconView];
        }
      }
      else
      {
        char v8 = 0;
      }
    }
    objc_super v11 = AXLogSpringboardServer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = [(SBIconViewAccessibility *)self _accessibilityIsCategoryIconView];
      objc_super v13 = @"NO";
      if (v12) {
        objc_super v13 = @"YES";
      }
      int v21 = 138412290;
      uint64_t v22 = (uint64_t)v13;
      _os_log_impl(&dword_2425C0000, v11, OS_LOG_TYPE_INFO, "[Custom Action]: Icon is a category view: %@.", (uint8_t *)&v21, 0xCu);
    }

    if (AXProcessIsSpringBoard())
    {
      uint64_t v14 = [MEMORY[0x263F22968] server];
      char v15 = [v14 isShowingNonSystemApp];

      if ((v15 & 1) == 0)
      {
        uint64_t v16 = AXLogSpringboardServer();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_2425C0000, v16, OS_LOG_TYPE_INFO, "[Custom Action]: SpringBoard process is focused and SpringBoard is visible.", (uint8_t *)&v21, 2u);
        }

        if ((v8 & 1) == 0) {
          [(SBIconViewAccessibility *)self _accessibilityAddEditActions:v4];
        }
        [(SBIconViewAccessibility *)self _accessibilityDeleteActions:v4];
        [(SBIconViewAccessibility *)self _accessibilityDropFromFolderAction:v4];
      }
    }
    if ((v8 & 1) == 0 && ![(SBIconViewAccessibility *)self _axIsInControlCenter])
    {
      [(SBIconViewAccessibility *)self _accessibilityInDockActions:v4];
      [(SBIconViewAccessibility *)self _accessibilityAddTodayViewAction:v4];
      [(SBIconViewAccessibility *)self _accessibilityAddAppLibraryViewAction:v4];
    }
    if ([(SBIconViewAccessibility *)self _axIsInControlCenter])
    {
      [(SBIconViewAccessibility *)self _accessibilityResizeActions:v4];
      [(SBIconViewAccessibility *)self _accessibilityAddControlsGalleryViewAction:v4];
    }
    if ([v4 count]) {
      id v17 = v4;
    }
    else {
      id v17 = 0;
    }
    CGFloat v18 = AXLogSpringboardServer();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v17 count];
      int v21 = 134217984;
      uint64_t v22 = v19;
      _os_log_impl(&dword_2425C0000, v18, OS_LOG_TYPE_INFO, "[Custom Action]: %li actions found.", (uint8_t *)&v21, 0xCu);
    }

    id v3 = v17;
  }

  return v3;
}

- (void)_accessibilityDeleteActions:(id)a3
{
  id v7 = a3;
  if ([(SBIconViewAccessibility *)self _axIsIconEditing])
  {
    id v4 = [(SBIconViewAccessibility *)self _axDragManager];
    if (([v4 _axIsIconDragging] & 1) == 0)
    {
      int v5 = [(SBIconViewAccessibility *)self safeBoolForKey:@"_isShowingCloseBox"];

      if (!v5) {
        goto LABEL_6;
      }
      id v4 = accessibilityLocalizedString(@"delete.key");
      unsigned __int8 v6 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v4 target:self selector:sel__accessibilityDeleteApp];
      [v7 addObject:v6];
    }
  }
LABEL_6:
}

- (void)_accessibilityAddEditActions:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(SBIconViewAccessibility *)self _axIsIconEditing];
  if (!v5 || ![(SBIconViewAccessibility *)self _axInAmbientPresentationMode])
  {
    int v6 = [(SBIconViewAccessibility *)self safeBoolForKey:@"isCustomIconImageViewHitTestingDisabled"];
    id v7 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    NSClassFromString(&cfstr_Sbhpagemanagem_0.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    char v9 = AXLogSpringboardServer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v6) {
        BOOL v10 = @"YES";
      }
      else {
        BOOL v10 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      double v24 = v10;
      _os_log_impl(&dword_2425C0000, v9, OS_LOG_TYPE_INFO, "[Custom Action]: Icon image view hit testing disabled: %@.", buf, 0xCu);
    }

    objc_super v11 = AXLogSpringboardServer();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (isKindOfClass) {
        BOOL v12 = @"YES";
      }
      else {
        BOOL v12 = @"NO";
      }
      *(_DWORD *)buf = 138412290;
      double v24 = v12;
      _os_log_impl(&dword_2425C0000, v11, OS_LOG_TYPE_INFO, "[Custom Action]: Icon view is page management icon: %@.", buf, 0xCu);
    }

    objc_super v13 = [MEMORY[0x263F22968] server];
    if (([v13 isAppSwitcherVisible] & 1) != 0
      || (AXContextMenuIsShowing & 1) != 0
      || ([(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView] & v6 & 1) != 0)
    {
      goto LABEL_29;
    }

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v14 = AXLogSpringboardServer();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2425C0000, v14, OS_LOG_TYPE_INFO, "[Custom Action]: Icon view edit action can be added to icon view.", buf, 2u);
      }

      if ([(SBIconViewAccessibility *)self _axIsInControlCenter]) {
        char v15 = @"control.center.editing.%@";
      }
      else {
        char v15 = @"jiggly.mode.%@";
      }
      uint64_t v16 = @"start";
      if (v5) {
        uint64_t v16 = @"end";
      }
      id v17 = objc_msgSend(NSString, "stringWithFormat:", v15, v16);
      objc_super v13 = accessibilityLocalizedString(v17);

      CGFloat v18 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v13 target:self selector:sel__accessibilityToggleJigglyMode];
      uint64_t v19 = [MEMORY[0x263F22938] sharedInstance];
      objc_msgSend(v18, "setIgnoreWhenVoiceOverTouches:", objc_msgSend(v19, "voiceOverEditAppsActionEnabled") ^ 1);

      CGFloat v20 = AXLogSpringboardServer();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = [v18 ignoreWhenVoiceOverTouches];
        uint64_t v22 = &stru_26F7E8EF8;
        if (v21) {
          uint64_t v22 = @" not";
        }
        *(_DWORD *)buf = 138412290;
        double v24 = v22;
        _os_log_impl(&dword_2425C0000, v20, OS_LOG_TYPE_INFO, "[Custom Action]: Icon edit action is%@ visible to VO.", buf, 0xCu);
      }

      [v4 addObject:v18];
LABEL_29:
    }
  }
}

- (void)_accessibilityDropFromFolderAction:(id)a3
{
  id v13 = a3;
  if (AXProcessIsSpringBoard())
  {
    id v4 = AXSBIconControllerSharedInstance();
    BOOL v5 = [(SBIconViewAccessibility *)self _axDragManager];
    int v6 = [v5 _axIsIconDragging];

    if (v6)
    {
      id v7 = AXSBHIconManagerFromSharedIconController();
      int v8 = [v7 safeBoolForKey:@"hasOpenFolder"];

      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x263F1C390]);
        BOOL v10 = accessibilityLocalizedString(@"move.app.out.of.folder.short");
        objc_super v11 = (void *)[v9 initWithName:v10 target:v4 selector:sel__accessibilityCloseOpenFolder];

        BOOL v12 = accessibilityLocalizedString(@"move.app.out.of.folder.short");
        [v11 _setShortName:v12];

        [v13 addObject:v11];
      }
    }
  }
}

- (void)_accessibilityInDockActions:(id)a3
{
  id v39 = a3;
  uint64_t v4 = [(id)*MEMORY[0x263F1D020] userInterfaceLayoutDirection];
  BOOL v5 = [MEMORY[0x263F22968] server];
  int v6 = [v5 canLaunchAsPinnedApplicationForIconView:self];

  if (v6)
  {
    id v7 = [(SBIconViewAccessibility *)self accessibilityLabel];
    int v8 = NSString;
    if (v4 == 1)
    {
      id v9 = accessibilityLocalizedString(@"app.launch.right");
      BOOL v10 = objc_msgSend(v8, "stringWithFormat:", v9, v7);

      objc_super v11 = NSString;
      BOOL v12 = @"app.launch.right.short";
    }
    else
    {
      id v13 = accessibilityLocalizedString(@"app.launch.left");
      BOOL v10 = objc_msgSend(v8, "stringWithFormat:", v13, v7);

      objc_super v11 = NSString;
      BOOL v12 = @"app.launch.left.short";
    }
    uint64_t v14 = accessibilityLocalizedString(v12);
    char v15 = objc_msgSend(v11, "stringWithFormat:", v14, v7);

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v10 target:self selector:sel__accessibilityLaunchLeading_];
    [v16 _setShortName:v15];
    id v17 = NSString;
    if (v4 == 1) {
      CGFloat v18 = @"app.launch.left";
    }
    else {
      CGFloat v18 = @"app.launch.right";
    }
    uint64_t v19 = v4;
    if (v4 == 1) {
      CGFloat v20 = @"app.launch.left.short";
    }
    else {
      CGFloat v20 = @"app.launch.right.short";
    }
    int v21 = accessibilityLocalizedString(v18);
    uint64_t v22 = objc_msgSend(v17, "stringWithFormat:", v21, v7);

    uint64_t v23 = NSString;
    double v24 = v20;
    uint64_t v4 = v19;
    uint64_t v25 = accessibilityLocalizedString(v24);
    double v26 = objc_msgSend(v23, "stringWithFormat:", v25, v7);

    double v27 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v22 target:self selector:sel__accessibilityLaunchTrailing_];
    [v27 _setShortName:v26];
    if (v19 == 1)
    {
      unint64_t v28 = _UIAccessibilityCustomActionLaunchAppPinRightImage();
      [v16 setImage:v28];

      _UIAccessibilityCustomActionLaunchAppPinLeftImage();
    }
    else
    {
      unint64_t v29 = _UIAccessibilityCustomActionLaunchAppPinLeftImage();
      [v16 setImage:v29];

      _UIAccessibilityCustomActionLaunchAppPinRightImage();
    CGFloat v30 = };
    [v27 setImage:v30];

    [v39 addObject:v16];
    [v39 addObject:v27];
  }
  CGFloat v31 = [MEMORY[0x263F22968] server];
  int v32 = [v31 canLaunchAsFloatingApplicationForIconView:self];

  if (v32)
  {
    double v33 = accessibilityLocalizedString(@"app.launch.floating.trailing");
    double v34 = accessibilityLocalizedString(@"app.launch.floating.trailing.short");
    double v35 = (void *)[objc_alloc(MEMORY[0x263F1C390]) initWithName:v33 target:self selector:sel__accessibilityLaunchFloatingTrailing_];
    [v35 _setShortName:v34];
    double v36 = _UIAccessibilityCustomActionLaunchAppFloatImage();
    CGRect v37 = v36;
    if (v4 == 1)
    {
      CGRect v38 = [v36 imageWithHorizontallyFlippedOrientation];
      [v35 setImage:v38];
    }
    else
    {
      [v35 setImage:v36];
    }
    [v39 addObject:v35];
  }
}

- (void)_accessibilityAddTodayViewAction:(id)a3
{
  id v10 = a3;
  if (AXProcessIsSpringBoard())
  {
    uint64_t v4 = AXSBHIconManagerFromSharedIconController();
    if (([v4 safeBoolForKey:@"isEditing"] & 1) == 0)
    {
      BOOL v5 = [MEMORY[0x263F22968] server];
      if (![v5 isShowingHomescreen])
      {
LABEL_8:

        goto LABEL_9;
      }
      int v6 = AXSBIconControllerSharedInstance();
      if ([v6 _axIsShowingHomeScreenTodayView])
      {

        goto LABEL_8;
      }
      char v7 = [v4 safeBoolForKey:@"hasOpenFolder"];

      if ((v7 & 1) == 0)
      {
        id v8 = objc_alloc(MEMORY[0x263F1C390]);
        id v9 = accessibilityLocalizedString(@"today.visible.key");
        BOOL v5 = (void *)[v8 initWithName:v9 target:self selector:sel__accessibilityShowTodayView];

        [v5 setIgnoreWhenVoiceOverTouches:1];
        [v10 addObject:v5];
        goto LABEL_8;
      }
    }
LABEL_9:
  }

  MEMORY[0x270F9A758]();
}

- (void)_accessibilityAddAppLibraryViewAction:(id)a3
{
  id v10 = a3;
  if (AXProcessIsSpringBoard())
  {
    uint64_t v4 = AXSBHIconManagerFromSharedIconController();
    if (([v4 safeBoolForKey:@"isEditing"] & 1) == 0)
    {
      BOOL v5 = [MEMORY[0x263F22968] server];
      if (![v5 isShowingHomescreen])
      {
LABEL_8:

        goto LABEL_9;
      }
      int v6 = AXSBIconControllerSharedInstance();
      if ([v6 _axIsShowingAppLibrary])
      {

        goto LABEL_8;
      }
      char v7 = [v4 safeBoolForKey:@"hasOpenFolder"];

      if ((v7 & 1) == 0)
      {
        id v8 = objc_alloc(MEMORY[0x263F1C390]);
        id v9 = accessibilityLocalizedString(@"app.library");
        BOOL v5 = (void *)[v8 initWithName:v9 target:self selector:sel__accessibilityShowAppLibrary];

        [v5 setIgnoreWhenVoiceOverTouches:1];
        [v10 addObject:v5];
        goto LABEL_8;
      }
    }
LABEL_9:
  }

  MEMORY[0x270F9A758]();
}

- (void)_accessibilityAddControlsGalleryViewAction:(id)a3
{
  id v4 = a3;
  if ([(SBIconViewAccessibility *)self _axIsInControlCenter])
  {
    if ([(SBIconViewAccessibility *)self _axIsIconEditing])
    {
      BOOL v5 = [(SBIconViewAccessibility *)self _axDragManager];
      char v6 = [v5 _axIsIconDragging];

      if ((v6 & 1) == 0)
      {
        id v7 = objc_alloc(MEMORY[0x263F1C390]);
        id v8 = accessibilityLocalizedString(@"show.controls.gallery");
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __70__SBIconViewAccessibility__accessibilityAddControlsGalleryViewAction___block_invoke;
        v10[3] = &unk_265158328;
        v10[4] = self;
        id v9 = (void *)[v7 initWithName:v8 actionHandler:v10];

        [v4 addObject:v9];
      }
    }
  }
}

uint64_t __70__SBIconViewAccessibility__accessibilityAddControlsGalleryViewAction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) safeValueForKey:@"_delegate"];
  objc_opt_class();
  BOOL v5 = [v4 safeSwiftValueForKey:@"addButton"];
  char v6 = __UIAccessibilityCastAsClass();

  [v6 sendActionsForControlEvents:64];
  return 1;
}

- (id)_axSortedSupportedGridSizeClasses
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x3032000000;
  id v7 = __Block_byref_object_copy__8;
  id v8 = __Block_byref_object_dispose__8;
  id v9 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __60__SBIconViewAccessibility__axSortedSupportedGridSizeClasses__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) iconGridSizeClassSizes];
  id v2 = [*(id *)(a1 + 32) supportedIconGridSizeClasses];
  uint64_t v3 = [v6 gridSizeClassesSortedByGridAreaWithAllowedGridSizeClasses:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_axStringForGridSizeClass:(id)a3
{
  id v4 = a3;
  [(SBIconViewAccessibility *)self _axIconToCCUIGridSize:v4];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  __int16 v11 = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(&v8, 8);
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  __int16 v11 = 0;
  AXPerformSafeBlock();
  _Block_object_dispose(&v8, 8);
  BOOL v5 = accessibilityLocalizedString(@"control.size.dimensions");
  id v6 = AXCFormattedString();

  return v6;
}

uint64_t __53__SBIconViewAccessibility__axStringForGridSizeClass___block_invoke(uint64_t a1)
{
  uint64_t result = CCUINumberOfRowsForGridSizeClass();
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __53__SBIconViewAccessibility__axStringForGridSizeClass___block_invoke_2(uint64_t a1)
{
  uint64_t result = CCUINumberOfColumnsForGridSizeClass();
  *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_accessibilityResizeActions:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v16 = a3;
  if ([(SBIconViewAccessibility *)self _axIsIconEditing]
    && [(SBIconViewAccessibility *)self _axIsInControlCenter]
    && [(SBIconViewAccessibility *)self safeBoolForKey:@"isShowingResizeHandle"])
  {
    id v4 = [(SBIconViewAccessibility *)self safeValueForKeyPath:@"icon.gridSizeClass"];
    BOOL v5 = [(SBIconViewAccessibility *)self _axSortedSupportedGridSizeClasses];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
          if (v10 != v4 && ([*(id *)(*((void *)&v18 + 1) + 8 * v9) isEqualToString:v4] & 1) == 0)
          {
            __int16 v11 = accessibilityLocalizedString(@"control.resize");
            char v15 = [(SBIconViewAccessibility *)self _axStringForGridSizeClass:v10];
            BOOL v12 = AXCFormattedString();

            id v13 = objc_alloc(MEMORY[0x263F1C390]);
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __55__SBIconViewAccessibility__accessibilityResizeActions___block_invoke;
            v17[3] = &unk_265158350;
            v17[4] = self;
            v17[5] = v10;
            uint64_t v14 = objc_msgSend(v13, "initWithName:actionHandler:", v12, v17, v15);
            [v16 addObject:v14];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
}

uint64_t __55__SBIconViewAccessibility__accessibilityResizeActions___block_invoke(uint64_t a1)
{
  return 1;
}

- (BOOL)_accessibilityShowTodayView
{
  id v2 = AXSBIconControllerSharedInstance();
  [v2 _axShowTodayView];

  return 1;
}

- (BOOL)_accessibilityShowAppLibrary
{
  id v2 = AXSBIconControllerSharedInstance();
  [v2 _axShowAppLibrary];

  return 1;
}

- (BOOL)_accessibilityLaunchLeading:(id)a3
{
  return [(SBIconViewAccessibility *)self _accessibilityLaunchAppWithRole:2 onLeadingSide:1];
}

- (BOOL)_accessibilityLaunchTrailing:(id)a3
{
  return [(SBIconViewAccessibility *)self _accessibilityLaunchAppWithRole:2 onLeadingSide:0];
}

- (BOOL)_accessibilityLaunchFloatingTrailing:(id)a3
{
  return [(SBIconViewAccessibility *)self _accessibilityLaunchAppWithRole:3 onLeadingSide:0];
}

- (BOOL)_accessibilityLaunchAppWithRole:(int64_t)a3 onLeadingSide:(BOOL)a4
{
  return 1;
}

void __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__8;
  __int16 v11 = __Block_byref_object_dispose__8;
  id v12 = 0;
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = *(void *)(a1 + 32);
  AXPerformSafeBlock();
  id v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  uint64_t v3 = *(void *)(a1 + 40);
  switch(v3)
  {
    case 1:
      id v4 = objc_msgSend(MEMORY[0x263F22968], "server", v5, 3221225472, __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2, &unk_265157EE8, v6, &v7);
      [v4 launchApplication:v2];
      goto LABEL_7;
    case 2:
      id v4 = objc_msgSend(MEMORY[0x263F22968], "server", v5, 3221225472, __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2, &unk_265157EE8, v6, &v7);
      [v4 launchPinnedApplication:v2 onLeadingSide:*(unsigned __int8 *)(a1 + 48)];
      goto LABEL_7;
    case 3:
      id v4 = objc_msgSend(MEMORY[0x263F22968], "server", v5, 3221225472, __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2, &unk_265157EE8, v6, &v7);
      [v4 launchFloatingApplication:v2];
LABEL_7:

      break;
  }
}

void __73__SBIconViewAccessibility__accessibilityLaunchAppWithRole_onLeadingSide___block_invoke_2(uint64_t a1)
{
  AXSBApplicationControllerSharedInstance();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) _accessibilityBundleIdentifier];
  uint64_t v3 = [v6 applicationWithBundleIdentifier:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return ![(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView];
}

- (id)_accessibilitySupportGesturesAttributes
{
  v7[1] = *MEMORY[0x263EF8340];
  v5[0] = @"AXSupportedGestureTypeKey";
  v5[1] = @"AXOrbGestureMode";
  v6[0] = &unk_26F7F1F18;
  v6[1] = &unk_26F7F1F30;
  id v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

  return v3;
}

- (BOOL)_axIsIconEditing
{
  int IsSpringBoard = AXProcessIsSpringBoard();
  if (IsSpringBoard)
  {
    LOBYTE(IsSpringBoard) = [(SBIconViewAccessibility *)self safeBoolForKey:@"isEditing"];
  }
  return IsSpringBoard;
}

- (void)_accessibilityEditAmbientIcon
{
  uint64_t v3 = [(SBIconViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_7 startWithSelf:0];
  uint64_t v4 = [v3 _accessibilityViewController];

  if (v4)
  {
    uint64_t v5 = [v4 safeValueForKey:@"delegate"];
    id v9 = v4;
    id v6 = v5;
    AXPerformSafeBlock();
  }
  else
  {
    objc_opt_class();
    uint64_t v7 = [(SBIconViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_994 startWithSelf:0];
    uint64_t v8 = [v7 _accessibilityViewController];
    __UIAccessibilityCastAsClass();
    id v6 = (id)objc_claimAutoreleasedReturnValue();

    [v6 setEditing:1];
  }
}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Amuiinfographv.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) createUnlockRequestForViewController:*(void *)(a1 + 40)];
  [v2 setName:@"AMUIInfographViewController"];
  uint64_t v3 = accessibilityLocalizedString(@"UNLOCK_WIDGET_STACK_EDITING");
  [v2 setUnlockDestination:v3];

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_3;
  v6[3] = &unk_2651583A0;
  v6[4] = *(void *)(a1 + 48);
  [v4 requestUnlockForViewController:v5 withRequest:v2 completion:v6];
}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    return AXPerformSafeBlock();
  }
  return result;
}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentStackConfigurationCard];
}

uint64_t __56__SBIconViewAccessibility__accessibilityEditAmbientIcon__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  NSClassFromString(&cfstr_Ccuipagingview.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityToggleJigglyMode
{
  int IsSpringBoard = AXProcessIsSpringBoard();
  if (IsSpringBoard) {
    AXPerformSafeBlock();
  }
  return IsSpringBoard;
}

void __57__SBIconViewAccessibility__accessibilityToggleJigglyMode__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _axIsIconEditing];
  if ([*(id *)(a1 + 32) _axIsInControlCenter])
  {
    uint64_t v4 = [*(id *)(a1 + 32) safeValueForKey:@"_delegate"];
    id v3 = v4;
    AXPerformSafeBlock();
  }
  else
  {
    AXSBHIconManagerFromSharedIconController();
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 setEditing:v2 ^ 1u];
  }

  if ((([*(id *)(a1 + 32) _accessibilityIsWidgetIconView] ^ 1 | v2) & 1) == 0) {
    [*(id *)(a1 + 32) _accessibilityEditAmbientIcon];
  }
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

uint64_t __57__SBIconViewAccessibility__accessibilityToggleJigglyMode__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _axDragManager];
  [v2 cancelAllDrags];

  id v3 = *(void **)(a1 + 40);
  BOOL v4 = *(unsigned char *)(a1 + 48) == 0;

  return [v3 setEditing:v4];
}

- (id)accessibilityDragSourceDescriptors
{
  v20[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(SBIconViewAccessibility *)self _axIsIconEditing];
  BOOL v4 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  uint64_t v5 = getSBIconLocationAppLibrarySearch();
  char v6 = [v4 containsString:v5];

  if ((v6 & 1) == 0 && !v3) {
    goto LABEL_5;
  }
  uint64_t v7 = [(SBIconViewAccessibility *)self _axDragManager];
  uint64_t v8 = [v7 _axGrabbedIcons];
  if ([v8 count])
  {
    id v9 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    int v10 = [v9 safeBoolForKey:@"canBeAddedToMultiItemDrag"];

    if (!v10)
    {
LABEL_5:
      __int16 v11 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_opt_class();
  id v12 = __UIAccessibilityCastAsClass();
  id v13 = NSString;
  uint64_t v14 = accessibilityLocalizedString(@"drag.start");
  char v15 = [(SBIconViewAccessibility *)self accessibilityLabel];
  id v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);

  id v17 = objc_alloc(MEMORY[0x263F1C3B8]);
  [v12 bounds];
  UIRectGetCenter();
  long long v18 = objc_msgSend(v17, "initWithName:point:inView:", v16, v12);
  v20[0] = v18;
  __int16 v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];

LABEL_8:

  return v11;
}

- (void)accessibilityElementDidBecomeFocused
{
  int v2 = (void *)dropIndicies;
  dropIndicies = 0;
}

- (id)accessibilityDropPointDescriptors
{
  v113[2] = *MEMORY[0x263EF8340];
  if (!AXProcessIsSpringBoard())
  {
    id v5 = (id)MEMORY[0x263EFFA68];
    goto LABEL_40;
  }
  BOOL v3 = [(SBIconViewAccessibility *)self _axIconManager];
  BOOL v4 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  if (([v4 isEqualToString:@"SBIconLocationFloatingDockSuggestions"] & 1) == 0)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = [(SBIconViewAccessibility *)self _axDragManager];
    uint64_t v8 = [v7 _axGrabbedIcons];

    if ([(SBIconViewAccessibility *)self _axIsInDock])
    {
      id v9 = [(SBIconViewAccessibility *)self _axRootList];
      int v10 = [v9 safeValueForKey:@"displayedModel"];

      unint64_t v11 = [v10 safeUnsignedIntegerForKey:@"maxNumberOfIcons"];
      uint64_t v12 = [v10 safeUnsignedIntegerForKey:@"numberOfNonPlaceholderIcons"];
      if (([v10 safeBoolForKey:@"isFull"] & 1) != 0
        || ([MEMORY[0x263EFFA08] setWithArray:v8],
            id v13 = objc_claimAutoreleasedReturnValue(),
            unint64_t v14 = [v13 count] + v12,
            v13,
            v14 > v11))
      {

        id v5 = (id)MEMORY[0x263EFFA68];
LABEL_38:

        goto LABEL_39;
      }
    }
    if (![v8 count])
    {
LABEL_37:
      id v5 = v6;
      goto LABEL_38;
    }
    v95 = [v8 firstObject];
    objc_opt_class();
    uint64_t v15 = __UIAccessibilityCastAsClass();
    v92 = [(id)v15 superview];

    v94 = [(SBIconViewAccessibility *)self _axRootList];
    [v94 safeValueForKey:@"displayedModel"];
    uint64_t v106 = 0;
    v107 = &v106;
    uint64_t v108 = 0x3032000000;
    v109 = __Block_byref_object_copy__8;
    v110 = __Block_byref_object_dispose__8;
    id v111 = 0;
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    AXPerformSafeBlock();
    id v93 = (id)v107[5];

    _Block_object_dispose(&v106, 8);
    id v16 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    LOBYTE(v15) = v95 == v16;

    if (v15)
    {
      id v5 = 0;
      BOOL v29 = 1;
      goto LABEL_36;
    }
    v88 = [v95 safeStringForKey:@"gridSizeClass"];
    v87 = [v93 safeStringForKey:@"gridSizeClass"];
    v89 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
    id v17 = getSBIconLocationAppLibrary();
    int v18 = [v89 containsString:v17];

    if (v18)
    {
      long long v19 = NSString;
      long long v20 = accessibilityLocalizedString(@"move.to.app.library");
      long long v21 = [(SBIconViewAccessibility *)self _axDragManager];
      uint64_t v22 = [v21 _axGrabbedIconsLabel];
      uint64_t v23 = [(SBIconViewAccessibility *)self accessibilityLabel];
      objc_msgSend(v19, "stringWithFormat:", v20, v22, v23);
      id v90 = (id)objc_claimAutoreleasedReturnValue();

      if (UIAccessibilityIsSwitchControlRunning())
      {
        uint64_t v24 = accessibilityLocalizedString(@"move.to.app.library.short");

        id v90 = (id)v24;
      }
      id v25 = objc_alloc(MEMORY[0x263F1C3B8]);
      LOBYTE(v106) = 0;
      objc_opt_class();
      double v26 = __UIAccessibilityCastAsClass();
      if ((_BYTE)v106) {
        abort();
      }
      double v27 = v26;
      [v26 frame];
      AX_CGRectGetCenter();
      unint64_t v28 = objc_msgSend(v25, "initWithName:point:inView:", v90, v92);

      [v6 addObject:v28];
      id v5 = v6;
      BOOL v29 = 1;
LABEL_17:

LABEL_35:
LABEL_36:

      if (v29) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    CGFloat v30 = [v94 safeValueForKey:@"placeholderAssertions"];
    CGFloat v31 = [v30 allObjects];
    int v32 = [v31 firstObject];
    id v90 = [v32 safeValueForKey:@"placeholderIcon"];

    if (!v90) {
      id v90 = v95;
    }
    double v33 = (void *)dropIndicies;
    if (!dropIndicies)
    {
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x2020000000;
      v109 = 0;
      id v103 = v91;
      id v104 = v90;
      id v105 = v93;
      AXPerformSafeBlock();
      uint64_t v85 = v107[3];

      _Block_object_dispose(&v106, 8);
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x2020000000;
      v109 = 0;
      id v100 = v103;
      id v101 = v104;
      id v102 = v105;
      AXPerformSafeBlock();
      uint64_t v34 = v107[3];

      _Block_object_dispose(&v106, 8);
      v112[0] = @"beforeIndex";
      double v35 = [NSNumber numberWithUnsignedInteger:v85];
      v112[1] = @"afterIndex";
      v113[0] = v35;
      double v36 = [NSNumber numberWithUnsignedInteger:v34];
      v113[1] = v36;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
      CGRect v38 = (void *)dropIndicies;
      dropIndicies = v37;

      double v33 = (void *)dropIndicies;
    }
    id v39 = [v33 objectForKeyedSubscript:@"beforeIndex"];
    uint64_t v40 = [v39 unsignedIntegerValue];

    if (v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      CGRect v41 = [(SBIconViewAccessibility *)self _axDropPointLabel:1];
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__8;
      v110 = __Block_byref_object_dispose__8;
      id v111 = 0;
      id v99 = v91;
      AXPerformSafeBlock();
      id v42 = (id)v107[5];

      _Block_object_dispose(&v106, 8);
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__8;
      v110 = __Block_byref_object_dispose__8;
      id v111 = 0;
      id v98 = v94;
      id v43 = v42;
      AXPerformSafeBlock();
      id v44 = (id)v107[5];

      _Block_object_dispose(&v106, 8);
      [v44 frame];
      double MinX = CGRectGetMinX(v115);
      [v44 frame];
      AX_CGRectGetCenter();
      double MinY = v46;
      if ([(SBIconViewAccessibility *)self _axInAmbientPresentationMode])
      {
        [v44 frame];
        AX_CGRectGetCenter();
        double MinX = v48;
        [v44 frame];
        double MinY = CGRectGetMinY(v116);
      }
      v49 = objc_msgSend(objc_alloc(MEMORY[0x263F1C3B8]), "initWithName:point:inView:", v41, v92, MinX, MinY);
      [v6 addObject:v49];
    }
    id v50 = [(id)dropIndicies objectForKeyedSubscript:@"afterIndex"];
    uint64_t v51 = [v50 unsignedIntegerValue];

    if (v51 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v52 = [(SBIconViewAccessibility *)self _axDropPointLabel:0];
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__8;
      v110 = __Block_byref_object_dispose__8;
      id v111 = 0;
      id v97 = v91;
      AXPerformSafeBlock();
      id v53 = (id)v107[5];

      _Block_object_dispose(&v106, 8);
      uint64_t v106 = 0;
      v107 = &v106;
      uint64_t v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__8;
      v110 = __Block_byref_object_dispose__8;
      id v111 = 0;
      id v96 = v94;
      id v54 = v53;
      AXPerformSafeBlock();
      id v55 = (id)v107[5];

      _Block_object_dispose(&v106, 8);
      [v55 frame];
      double MaxX = CGRectGetMaxX(v117);
      [v55 frame];
      AX_CGRectGetCenter();
      double MaxY = v57;
      if ([(SBIconViewAccessibility *)self _axInAmbientPresentationMode])
      {
        [v55 frame];
        AX_CGRectGetCenter();
        double MaxX = v59;
        [v55 frame];
        double MaxY = CGRectGetMaxY(v118);
      }
      uint64_t v60 = objc_msgSend(objc_alloc(MEMORY[0x263F1C3B8]), "initWithName:point:inView:", v52, v92, MaxX, MaxY);
      [v6 addObject:v60];
    }
    int v61 = [v95 safeBoolForKey:@"isFolderIcon"];
    uint64_t v62 = *MEMORY[0x263F792D0];
    if ([v88 isEqualToString:*MEMORY[0x263F792D0]]
      && (([v87 isEqualToString:v62] ^ 1 | v61) & 1) == 0)
    {
      id v64 = [v3 safeValueForKey:@"currentRootIconList"];
      BOOL v29 = v94 == v64;

      if (v29)
      {
        v65 = [(SBIconViewAccessibility *)self _axDragManager];
        unint64_t v28 = [v65 _axGrabbedIconsLabel];

        uint64_t v66 = NSString;
        v67 = accessibilityLocalizedString(@"create.new.folder");
        uint64_t v68 = [(SBIconViewAccessibility *)self accessibilityLabel];
        uint64_t v69 = objc_msgSend(v66, "stringWithFormat:", v67, v68, v28);

        if ([(SBIconViewAccessibility *)self _accessibilityIsWidgetIconView])
        {
          BOOL v70 = [(SBIconViewAccessibility *)self _accessibilityIsWidgetStackIconView];
          v71 = NSString;
          if (v70)
          {
            uint64_t v72 = accessibilityLocalizedString(@"add.to.stack");
            uint64_t v73 = objc_msgSend(v71, "stringWithFormat:", v72, v28);
            v86 = @"add.to.stack.short";
          }
          else
          {
            uint64_t v72 = accessibilityLocalizedString(@"create.new.widget.stack");
            uint64_t v74 = [(SBIconViewAccessibility *)self accessibilityLabel];
            uint64_t v73 = objc_msgSend(v71, "stringWithFormat:", v72, v74, v28);

            v86 = @"create.new.widget.stack.short";
            uint64_t v69 = (void *)v74;
          }

          uint64_t v69 = (void *)v73;
        }
        else
        {
          v86 = @"create.new.folder.short";
        }
        if ([v93 safeBoolForKey:@"isFolderIcon"])
        {
          uint64_t v75 = NSString;
          v76 = accessibilityLocalizedString(@"add.to.folder");
          v77 = [(SBIconViewAccessibility *)self accessibilityLabel];
          uint64_t v78 = objc_msgSend(v75, "stringWithFormat:", v76, v28, v77);

          v86 = @"add.to.folder.short";
          uint64_t v69 = (void *)v78;
        }
        id v79 = v69;
        v80 = v79;
        if (UIAccessibilityIsSwitchControlRunning())
        {
          v80 = accessibilityLocalizedString(v86);
        }
        id v81 = objc_alloc(MEMORY[0x263F1C3B8]);
        LOBYTE(v106) = 0;
        objc_opt_class();
        v82 = __UIAccessibilityCastAsClass();
        if ((_BYTE)v106) {
          abort();
        }
        v83 = v82;
        [v82 frame];
        AX_CGRectGetCenter();
        v84 = objc_msgSend(v81, "initWithName:point:inView:", v80, v92);

        [v6 addObject:v84];
        BOOL v29 = 0;
        id v5 = (id)MEMORY[0x263EFFA68];
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v29 = 0;
    }
    id v5 = (id)MEMORY[0x263EFFA68];
    goto LABEL_35;
  }
  id v5 = (id)MEMORY[0x263EFFA68];
LABEL_39:

LABEL_40:

  return v5;
}

void __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) safeValueForKey:@"icon"];
  BOOL v3 = [v7 safeStringForKey:@"nodeIdentifier"];
  uint64_t v4 = [v2 iconWithIdentifier:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bestGridCellIndexForInsertingIcon:*(void *)(a1 + 40) maintainingPositionBeforeIcon:*(void *)(a1 + 48) ignoringPlaceholders:0 gridCellInfoOptions:0 mutationOptions:0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) bestGridCellIndexForInsertingIcon:*(void *)(a1 + 40) maintainingPositionAfterIcon:*(void *)(a1 + 48) ignoringPlaceholders:0 gridCellInfoOptions:0 mutationOptions:0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) iconAtGridCellIndex:*(void *)(a1 + 48) gridCellInfoOptions:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_5(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_6(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) iconAtGridCellIndex:*(void *)(a1 + 48) gridCellInfoOptions:0];

  return MEMORY[0x270F9A758]();
}

uint64_t __60__SBIconViewAccessibility_accessibilityDropPointDescriptors__block_invoke_7(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) iconViewForIcon:*(void *)(a1 + 40)];

  return MEMORY[0x270F9A758]();
}

- (id)_axDropPointLabel:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL IsSwitchControlRunning = UIAccessibilityIsSwitchControlRunning();
  id v6 = @"place.before.app";
  if (IsSwitchControlRunning) {
    id v6 = @"place.before.app.short";
  }
  id v7 = v6;
  BOOL v8 = UIAccessibilityIsSwitchControlRunning();
  id v9 = @"place.after.app";
  if (v8) {
    id v9 = @"place.after.app.short";
  }
  if (v3) {
    int v10 = v7;
  }
  else {
    int v10 = v9;
  }
  unint64_t v11 = accessibilityLocalizedString(v10);

  if (UIAccessibilityIsSwitchControlRunning())
  {
    id v12 = v11;
  }
  else
  {
    id v13 = NSString;
    unint64_t v14 = [(SBIconViewAccessibility *)self _axDragManager];
    uint64_t v15 = [v14 _axGrabbedIconsLabel];
    id v16 = [(SBIconViewAccessibility *)self accessibilityLabel];
    objc_msgSend(v13, "stringWithFormat:", v11, v15, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (CGPoint)_accessibilityAmbientModeDropPoint:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(SBIconViewAccessibility *)self _axDragManager];
  [v4 safeCGPointForKey:@"_accessibilityLastPausedLocation"];
  double v6 = v5;
  double v8 = v7;

  LOBYTE(v19) = 0;
  objc_opt_class();
  id v9 = __UIAccessibilityCastAsClass();
  [v9 frame];
  UIRectGetCenter();
  double v11 = v10;
  double v13 = v12;
  uint64_t v19 = 0;
  long long v20 = (double *)&v19;
  uint64_t v21 = 0x3010000000;
  uint64_t v22 = &unk_2425EB325;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  AXPerformSafeBlock();
  uint64_t v14 = *((void *)v20 + 5);
  _Block_object_dispose(&v19, 8);
  uint64_t v19 = 0;
  long long v20 = (double *)&v19;
  uint64_t v21 = 0x3010000000;
  uint64_t v22 = &unk_2425EB325;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  AXPerformSafeBlock();
  uint64_t v15 = *((void *)v20 + 5);
  _Block_object_dispose(&v19, 8);
  if (v3)
  {
    if (v15 < v14 && v15 == v14 - 1) {
      double v13 = v8;
    }
    else {
      double v6 = v11;
    }
    if ((v15 >= v14 || v15 != v14 - 1) && v15 < v14 && v15 != v14 - 1)
    {
LABEL_14:
      uint64_t v19 = 0;
      long long v20 = (double *)&v19;
      uint64_t v21 = 0x3010000000;
      uint64_t v22 = &unk_2425EB325;
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      AXPerformSafeBlock();
      double v13 = v20[5];
      _Block_object_dispose(&v19, 8);
LABEL_15:
      double v6 = v11;
    }
  }
  else
  {
    uint64_t v16 = v14 + 1;
    if (v15 <= v14 || v15 != v16)
    {
      if (v15 <= v14 || v15 == v16) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
    double v13 = v8;
  }

  double v17 = v6;
  double v18 = v13;
  result.CGFloat y = v18;
  result.CGFloat x = v17;
  return result;
}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axRootList];
  uint64_t v2 = objc_msgSend(v5, "coordinateAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v4;
}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axRootList];
  uint64_t v2 = objc_msgSend(v5, "coordinateAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v2;
  *(void *)(v3 + 40) = v4;
}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axRootList];
  objc_msgSend(v5, "centerForIconCoordinate:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
}

void __62__SBIconViewAccessibility__accessibilityAmbientModeDropPoint___block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _axRootList];
  objc_msgSend(v5, "centerForIconCoordinate:", *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = v4;
}

- (id)_accessibilityFilterInteractionLocationDescriptorsForVisible:(id)a3
{
  id v4 = a3;
  if ([(SBIconViewAccessibility *)self _axInAmbientPresentationMode]
    || [(SBIconViewAccessibility *)self _axIsInControlCenter])
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBIconViewAccessibility;
    id v5 = [(SBIconViewAccessibility *)&v8 _accessibilityFilterInteractionLocationDescriptorsForVisible:v4];
  }
  double v6 = v5;

  return v6;
}

- (void)_accessibilityBeginDragAtPoint:(CGPoint)a3 endpoint:(id)a4 completion:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __78__SBIconViewAccessibility__accessibilityBeginDragAtPoint_endpoint_completion___block_invoke;
  uint64_t v15 = &unk_265157D70;
  uint64_t v16 = self;
  id v9 = a5;
  id v10 = a4;
  AXPerformSafeBlock();
  v11.receiver = self;
  v11.super_class = (Class)SBIconViewAccessibility;
  -[SBIconViewAccessibility _accessibilityBeginDragAtPoint:endpoint:completion:](&v11, sel__accessibilityBeginDragAtPoint_endpoint_completion_, v10, v9, x, y);

  SBAXPerformingAXDrag = 1;
}

void __78__SBIconViewAccessibility__accessibilityBeginDragAtPoint_endpoint_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _axDragManager];
  [v1 cancelAllDrags];
}

- (id)_accessibilityPreferredScrollActions
{
  v9[2] = *MEMORY[0x263EF8340];
  int v2 = [(SBIconViewAccessibility *)self _accessibilityIsRTL];
  if (v2) {
    uint64_t v3 = 2009;
  }
  else {
    uint64_t v3 = 2008;
  }
  if (v2) {
    uint64_t v4 = 2008;
  }
  else {
    uint64_t v4 = 2009;
  }
  id v5 = [NSNumber numberWithUnsignedInt:v3];
  v9[0] = v5;
  double v6 = [NSNumber numberWithUnsignedInt:v4];
  v9[1] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  return v7;
}

- (BOOL)_accessibilityCanDrag
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6.receiver = self,
        v6.super_class = (Class)SBIconViewAccessibility,
        [(SBIconViewAccessibility *)&v6 _accessibilityCanDrag]))
  {
    uint64_t v3 = [(SBIconViewAccessibility *)self safeValueForKey:@"icon"];
    int v4 = [v3 safeBoolForKey:@"isPlaceholder"] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)_accessibilityUpdatesSwitchMenu
{
  return 1;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)_axIsInDock
{
  int v2 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  uint64_t v3 = getSBIconLocationDock();
  if ([v2 isEqual:v3]) {
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v4 = (void *)getSBIconLocationFloatingDockSymbolLoc_ptr;
  uint64_t v11 = getSBIconLocationFloatingDockSymbolLoc_ptr;
  if (!getSBIconLocationFloatingDockSymbolLoc_ptr)
  {
    id v5 = (void *)SpringBoardHomeLibrary_0();
    void v9[3] = (uint64_t)dlsym(v5, "SBIconLocationFloatingDock");
    getSBIconLocationFloatingDockSymbolLoc_ptr = v9[3];
    int v4 = (void *)v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v4) {
    -[SBIconViewAccessibility _axIsInDock]();
  }
  if ([v2 isEqualToString:*v4]) {
LABEL_6:
  }
    char v6 = 1;
  else {
    char v6 = [v2 isEqual:@"SBIconLocationFloatingDockSuggestions"];
  }

  return v6;
}

- (BOOL)_axInAmbientPresentationMode
{
  int v2 = AXWindowScene(@"activeDisplayWindowScene");
  uint64_t v3 = [v2 safeValueForKey:@"ambientPresentationController"];
  char v4 = [v3 safeBoolForKey:@"isPresented"];

  return v4;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBIconViewAccessibility;
  uint64_t v8 = -[SBIconViewAccessibility contextMenuInteraction:configurationForMenuAtLocation:](&v12, sel_contextMenuInteraction_configurationForMenuAtLocation_, v7, x, y);
  objc_opt_class();
  id v9 = __UIAccessibilityCastAsClass();
  uint64_t v10 = [v9 window];
  [v10 setAccessibilityViewIsModal:1];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], (id)*MEMORY[0x263F21AB0]);
  if (v8) {
    AXContextMenuIsShowing = 1;
  }

  return v8;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBIconViewAccessibility;
  [(SBIconViewAccessibility *)&v13 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];
  objc_opt_class();
  uint64_t v11 = __UIAccessibilityCastAsClass();
  objc_super v12 = [v11 window];
  [v12 setAccessibilityViewIsModal:0];

  AXContextMenuIsShowing = 0;
}

- (id)_viewToAddFocusLayer
{
  uint64_t v3 = [(SBIconViewAccessibility *)self safeUIViewForKey:@"_iconImageView"];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_opt_class();
    char v6 = [(SBIconViewAccessibility *)self safeValueForKey:@"customIconImageViewController"];
    id v7 = __UIAccessibilityCastAsClass();

    id v5 = [v7 view];
  }

  return v5;
}

- (id)accessibilityPath
{
  if ([(SBIconViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    [(SBIconViewAccessibility *)self safeCGFloatForKey:@"iconImageCornerRadius"];
    uint64_t v3 = [(SBIconViewAccessibility *)self safeUIViewForKey:@"_focusEffectPlatterView"];
    char v4 = v3;
    if (v3
      || ([(SBIconViewAccessibility *)self safeUIViewForKey:@"_iconImageView"],
          id v5 = (SBIconViewAccessibility *)objc_claimAutoreleasedReturnValue(),
          char v4 = self,
          !v5))
    {
      id v5 = v4;
    }
    [(SBIconViewAccessibility *)v5 accessibilityFrame];
    UIRectInsetEdges();
    char v6 = objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:");
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)focusGroupIdentifier
{
  if ([(SBIconViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    BOOL v3 = [(SBIconViewAccessibility *)self _axIsInDock];
    char v4 = @"SBIconView";
    if (v3) {
      char v4 = @"SBIconViewDock";
    }
    id v5 = v4;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconViewAccessibility;
    id v5 = [(SBIconViewAccessibility *)&v7 focusGroupIdentifier];
  }

  return v5;
}

- (int64_t)_insertionIndexOfFocusLayerInView
{
  BOOL v3 = [(SBIconViewAccessibility *)self _viewToAddFocusLayer];
  char v4 = [(SBIconViewAccessibility *)self safeUIViewForKey:@"_accessoryView"];
  id v5 = [v3 layer];
  char v6 = [v5 sublayers];
  objc_super v7 = [v4 layer];
  int64_t v8 = [v6 indexOfObject:v7];

  return v8;
}

- (id)_accessibilityAddToDragSessionCustomAction
{
  if ([(SBIconViewAccessibility *)self _accessibilityIsDraggingWidget])
  {
    BOOL v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBIconViewAccessibility;
    BOOL v3 = [(SBIconViewAccessibility *)&v5 _accessibilityAddToDragSessionCustomAction];
  }

  return v3;
}

- (BOOL)_accessibilityIsDraggingWidget
{
  int v2 = AXSBIconControllerSharedInstance();
  BOOL v3 = [v2 safeValueForKey:@"iconDragManager"];
  char v4 = __UIAccessibilitySafeClass();

  if (v4) {
    char v5 = [v4 safeBoolForKey:@"isTrackingWidgetIconDrags"];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_axDragManager
{
  BOOL v3 = [(SBIconViewAccessibility *)self _axIsInControlCenter];
  char v4 = [(SBIconViewAccessibility *)self _axIconController];
  char v5 = v4;
  if (v3) {
    [v4 safeSwiftValueForKey:@"iconDragManager"];
  }
  else {
  char v6 = [v4 safeValueForKey:@"iconDragManager"];
  }

  return v6;
}

- (id)_axIconController
{
  NSClassFromString(&cfstr_Sbhstackconfig_1.isa);
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(SBIconViewAccessibility *)self safeValueForKeyPath:@"_stackConfigurationViewController"];
  }
  else
  {
    if ([(SBIconViewAccessibility *)self _axIsInControlCenter]) {
      [(SBIconViewAccessibility *)self safeValueForKey:@"_delegate"];
    }
    else {
    BOOL v3 = AXSBIconControllerSharedInstance();
    }
  }

  return v3;
}

- (id)_axIconManager
{
  if ([(SBIconViewAccessibility *)self _axIsInControlCenter])
  {
    int v2 = 0;
  }
  else
  {
    int v2 = AXSBHIconManagerFromSharedIconController();
  }

  return v2;
}

- (id)_axFolderController
{
  if ([(SBIconViewAccessibility *)self _axIsInControlCenter])
  {
    BOOL v3 = [(SBIconViewAccessibility *)self _axIconController];
    uint64_t v4 = [v3 safeSwiftValueForKey:@"__rootFolderController"];
  }
  else
  {
    if (AXSBOnenessOrXCUITestIsCurrentlyRequestingClientDuringContinuitySession())
    {
      char v5 = AXSBCurrentFolderController();
      goto LABEL_7;
    }
    BOOL v3 = [(SBIconViewAccessibility *)self _axIconController];
    uint64_t v4 = [v3 safeValueForKey:@"_currentFolderController"];
  }
  char v5 = (void *)v4;

LABEL_7:

  return v5;
}

- (BOOL)_axIconManagerHasOpenFolder
{
  if ([(SBIconViewAccessibility *)self _axIsInControlCenter])
  {
    BOOL v3 = [(SBIconViewAccessibility *)self _axFolderController];
    uint64_t v4 = v3;
    char v5 = @"isOpen";
  }
  else
  {
    BOOL v3 = AXSBHIconManagerFromSharedIconController();
    uint64_t v4 = v3;
    char v5 = @"hasOpenFolder";
  }
  char v6 = [v3 safeBoolForKey:v5];

  return v6;
}

- (id)_axRootList
{
  BOOL v3 = [(SBIconViewAccessibility *)self _axIconManager];
  BOOL v4 = [(SBIconViewAccessibility *)self _axIconManagerHasOpenFolder];
  char v5 = [(SBIconViewAccessibility *)self safeStringForKey:@"_iconLocation"];
  char v6 = [(SBIconViewAccessibility *)self _axFolderController];
  objc_super v7 = v6;
  if (v4)
  {
    int64_t v8 = @"currentIconListView";
  }
  else
  {
    int64_t v8 = @"currentRootIconList";
    char v6 = v3;
  }
  id v9 = [v6 safeValueForKey:v8];
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v10 = (void *)getSBIconLocationTodayViewSymbolLoc_ptr;
  uint64_t v22 = getSBIconLocationTodayViewSymbolLoc_ptr;
  if (!getSBIconLocationTodayViewSymbolLoc_ptr)
  {
    uint64_t v11 = (void *)SpringBoardHomeLibrary_0();
    v20[3] = (uint64_t)dlsym(v11, "SBIconLocationTodayView");
    getSBIconLocationTodayViewSymbolLoc_ptr = v20[3];
    id v10 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v10) {
    -[SBIconViewAccessibility _axRootList]();
  }
  if ([v5 containsString:*v10])
  {
    uint64_t v12 = [(SBIconViewAccessibility *)v3 safeValueForKeyPath:@"_effectiveTodayViewController.listView"];
  }
  else
  {
    if ([(SBIconViewAccessibility *)self _axInAmbientPresentationMode])
    {
      objc_super v13 = @"_iconListView";
      uint64_t v14 = self;
    }
    else
    {
      uint64_t v15 = getSBIconLocationDock();
      int v16 = [v5 isEqualToString:v15];

      if (!v16) {
        goto LABEL_15;
      }
      objc_super v13 = @"effectiveDockListView";
      uint64_t v14 = v3;
    }
    uint64_t v12 = [(SBIconViewAccessibility *)v14 safeValueForKey:v13];
  }
  double v17 = (void *)v12;

  id v9 = v17;
LABEL_15:

  return v9;
}

- (BOOL)canBecomeFocused
{
  if ([(SBIconViewAccessibility *)self _accessibilityIsFKARunningForFocusItem])
  {
    return [(SBIconViewAccessibility *)self isAccessibilityElement];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBIconViewAccessibility;
    return [(SBIconViewAccessibility *)&v4 canBecomeFocused];
  }
}

- (void)_updateCustomIconImageViewControllerHitTesting
{
  v7.receiver = self;
  v7.super_class = (Class)SBIconViewAccessibility;
  [(SBIconViewAccessibility *)&v7 _updateCustomIconImageViewControllerHitTesting];
  if ([(SBIconViewAccessibility *)self _accessibilityIsWidgetInAddWidgetSheet]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [(SBIconViewAccessibility *)self safeBoolForKey:@"isCustomIconImageViewHitTestingDisabled"];
  }
  objc_opt_class();
  objc_super v4 = [(SBIconViewAccessibility *)self safeValueForKey:@"customIconImageViewController"];
  char v5 = __UIAccessibilityCastAsClass();

  char v6 = [v5 view];
  [v6 setAccessibilityElementsHidden:v3];
}

- (void)_createCloseBoxIfNecessary
{
  v3.receiver = self;
  v3.super_class = (Class)SBIconViewAccessibility;
  [(SBIconViewAccessibility *)&v3 _createCloseBoxIfNecessary];
  [(SBIconViewAccessibility *)self _accessibilitySetupCloseBox];
}

- (void)_accessibilityIsWidgetInAddWidgetSheet
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationAddWidgetSheet(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 31, @"%s", dlerror());

  __break(1u);
}

- (void)_axIsInDock
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationFloatingDock(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 25, @"%s", dlerror());

  __break(1u);
}

- (void)_axRootList
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  id v1 = [NSString stringWithUTF8String:"NSString *getSBIconLocationTodayView(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBIconViewAccessibility.m", 28, @"%s", dlerror());

  __break(1u);
}

@end