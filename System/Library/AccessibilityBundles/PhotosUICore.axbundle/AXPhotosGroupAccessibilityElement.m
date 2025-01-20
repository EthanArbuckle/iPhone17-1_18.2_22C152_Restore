@interface AXPhotosGroupAccessibilityElement
+ (void)_accessibilityPerformValidations:(id)a3;
- (AXPhotosGroupAccessibilityElement)initWithAccessibilityContainer:(id)a3 forGroup:(id)a4 inView:(id)a5;
- (AXPhotosGroupAccessibilityElement)initWithAccessibilityContainer:(id)a3 forGroup:(id)a4 inView:(id)a5 withAdditionalScrollViewElements:(id)a6;
- (BOOL)_accessibilityHasVisibleFrame;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_accessibilityInStoryViewController;
- (BOOL)_axInAllPhotosView;
- (BOOL)_axInZoomLevel:(int64_t)a3;
- (BOOL)_axIsAssetSection;
- (BOOL)_axIsCardSectionBody;
- (BOOL)_axIsChapterHeader;
- (BOOL)_axIsDaysView;
- (BOOL)_axIsDecorating;
- (BOOL)_axIsFeedContentLayout;
- (BOOL)_axIsGrid;
- (BOOL)_axIsInlineHeader;
- (BOOL)_axIsMemoriesScrubberInStoryViewController;
- (BOOL)_axIsMemoriesStyleSwitcherInStoryViewController;
- (BOOL)_axIsMonthsView;
- (BOOL)_axIsSectionHeader;
- (BOOL)_axIsStoryClipLayout;
- (BOOL)_axIsStoryColorGradeEditorItem;
- (BOOL)_axIsStoryColorGradeEditorItemOverlay;
- (BOOL)_axIsStoryFullsizeLayout;
- (BOOL)_axIsStoryLayout;
- (BOOL)_axIsStoryScrubberContentLayout;
- (BOOL)_axIsStoryStyleSwitchingFullsizeLayout;
- (BOOL)_axIsStoryThumbnailChromeLayout;
- (BOOL)_axIsStoryTransitionLayout;
- (BOOL)_axIsYearsView;
- (BOOL)accessibilityScroll:(int64_t)a3;
- (BOOL)canBecomeFocused;
- (BOOL)isAccessibilityElement;
- (CGRect)accessibilityFrame;
- (CGRect)accessibilityFrameForScrolling;
- (Class)_axAssetsSectionLayoutClass;
- (Class)_axCuratedLibraryCardSectionBodyLayoutClass;
- (Class)_axCuratedLibraryChapterHeaderLayoutClass;
- (Class)_axCuratedLibraryOverlayButtonClass;
- (Class)_axCuratedLibrarySectionHeaderLayoutClass;
- (Class)_axCuratedLibraryUIViewControllerClass;
- (Class)_axDecoratingLayoutClass;
- (Class)_axFeedContentLayoutClass;
- (Class)_axFeedViewControllerClass;
- (Class)_axGridLayoutClass;
- (Class)_axInlineHeadersSpriteLayoutClass;
- (Class)_axStoryChromeButtonClass;
- (Class)_axStoryClipLayoutClass;
- (Class)_axStoryColorGradeEditorItemLayoutClass;
- (Class)_axStoryColorGradeEditorItemOverlayLayoutClass;
- (Class)_axStoryFullsizeLayoutClass;
- (Class)_axStoryLayoutClass;
- (Class)_axStoryScrubberContentLayoutClass;
- (Class)_axStoryStyleSwitchingFullsizeLayoutClass;
- (Class)_axStoryThumbnailChromeLayoutClass;
- (Class)_axStoryTransitionLayoutClass;
- (Class)_axStoryViewControllerClass;
- (id)_accessibilityCuratedLibraryUIViewController;
- (id)_accessibilityDefaultFocusGroupIdentifier;
- (id)_accessibilityFeedViewController;
- (id)_accessibilityInfoSource;
- (id)_accessibilityParentForFindingScrollParent;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axCachedLeafElements;
- (id)_axCachedLeafSpriteIndexes;
- (id)_axCachedSubgroupElements;
- (id)_axCardSectionBodyInSubgroups;
- (id)_axChapterHeadersInSubgroups;
- (id)_axCurrentLeafInStory;
- (id)_axDecoratingInSubgroups;
- (id)_axFilterLeafsByContentKind:(int64_t)a3;
- (id)_axFilterStaleKeys:(id)a3 usingIndexSet:(id)a4;
- (id)_axFilterSubgroupsByInfoSourceType:(id)a3;
- (id)_axGroupsAccessibilityElements;
- (id)_axLeafAccessibilityElements;
- (id)_axMoreButtonInMonthsView;
- (id)_axSectionHeadersInSubgroups;
- (id)_axStoryClipLayoutInSubgroups;
- (id)_axStoryColorGradeLeafElement;
- (id)_axStoryFullsizeLayoutInSubgroups;
- (id)_axStoryThumbnailChromeLayoutInSubgroups;
- (id)_axUniqueIdentifierForLeaf:(id)a3;
- (id)_axUnsortedGroupsAccessibilityElements;
- (id)_axUnsortedLeafAccessibilityElements;
- (id)accessibilityCustomActions;
- (id)accessibilityElements;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)additionalScrollViewElements;
- (id)automationElements;
- (id)group;
- (id)view;
- (int64_t)_axCompareAXPhotoElement:(id)a3 toElement:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)_axCleanupAccessibilityElements:(id)a3 withUpdatedKeys:(id)a4;
- (void)_axContainingGroup:(id)a3 performedAction:(int64_t)a4 withUserInfo:(id)a5;
- (void)_axMoveStoryForInfoSource:(id)a3 inDirection:(unint64_t)a4;
- (void)_axMoveToNextInfoInDirection:(unint64_t)a3;
- (void)_axRefreshGridGroupData:(id)a3;
- (void)_axShouldShowAlternateUI:(BOOL)a3;
- (void)_axUnloadStaleLeafObjects;
- (void)_cleanupStaleGroupAccessibilityElements;
- (void)_setAxAssetsSectionLayoutClass:(Class)a3;
- (void)_setAxCachedLeafElements:(id)a3;
- (void)_setAxCachedLeafSpriteIndexes:(id)a3;
- (void)_setAxCachedSubgroupElements:(id)a3;
- (void)_setAxCuratedLibraryCardSectionBodyLayoutClass:(Class)a3;
- (void)_setAxCuratedLibraryChapterHeaderLayoutClass:(Class)a3;
- (void)_setAxCuratedLibraryOverlayButtonClass:(Class)a3;
- (void)_setAxCuratedLibrarySectionHeaderLayoutClass:(Class)a3;
- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3;
- (void)_setAxDecoratingLayoutClass:(Class)a3;
- (void)_setAxFeedContentLayoutClass:(Class)a3;
- (void)_setAxFeedViewControllerClass:(Class)a3;
- (void)_setAxGridLayoutClass:(Class)a3;
- (void)_setAxInlineHeadersSpriteLayoutClass:(Class)a3;
- (void)_setAxStoryChromeButtonClass:(Class)a3;
- (void)_setAxStoryClipLayoutClass:(Class)a3;
- (void)_setAxStoryColorGradeEditorItemLayoutClass:(Class)a3;
- (void)_setAxStoryColorGradeEditorItemOverlayLayoutClass:(Class)a3;
- (void)_setAxStoryFullsizeLayoutClass:(Class)a3;
- (void)_setAxStoryLayoutClass:(Class)a3;
- (void)_setAxStoryScrubberContentLayoutClass:(Class)a3;
- (void)_setAxStoryStyleSwitchingFullsizeLayoutClass:(Class)a3;
- (void)_setAxStoryThumbnailChromeLayoutClass:(Class)a3;
- (void)_setAxStoryTransitionLayoutClass:(Class)a3;
- (void)_setAxStoryViewControllerClass:(Class)a3;
- (void)_updateGroupAccessibilityElements;
- (void)_updateLeafAccessibilityElements:(id)a3 forVisibleSpriteIndexes:(id)a4;
- (void)_updateLeafAccessibilityElementsIfNeeded;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)setAdditionalScrollViewElements:(id)a3;
- (void)setGroup:(id)a3;
- (void)setView:(id)a3;
@end

@implementation AXPhotosGroupAccessibilityElement

- (id)_axCachedSubgroupElements
{
}

- (void)_setAxCachedSubgroupElements:(id)a3
{
}

- (id)_axCachedLeafElements
{
}

- (void)_setAxCachedLeafElements:(id)a3
{
}

- (id)_axCachedLeafSpriteIndexes
{
}

- (void)_setAxCachedLeafSpriteIndexes:(id)a3
{
}

- (Class)_axAssetsSectionLayoutClass
{
}

- (void)_setAxAssetsSectionLayoutClass:(Class)a3
{
}

- (Class)_axCuratedLibraryChapterHeaderLayoutClass
{
}

- (void)_setAxCuratedLibraryChapterHeaderLayoutClass:(Class)a3
{
}

- (Class)_axCuratedLibrarySectionHeaderLayoutClass
{
}

- (void)_setAxCuratedLibrarySectionHeaderLayoutClass:(Class)a3
{
}

- (Class)_axDecoratingLayoutClass
{
}

- (void)_setAxDecoratingLayoutClass:(Class)a3
{
}

- (Class)_axCuratedLibraryCardSectionBodyLayoutClass
{
}

- (void)_setAxCuratedLibraryCardSectionBodyLayoutClass:(Class)a3
{
}

- (Class)_axInlineHeadersSpriteLayoutClass
{
}

- (void)_setAxInlineHeadersSpriteLayoutClass:(Class)a3
{
}

- (Class)_axGridLayoutClass
{
}

- (void)_setAxGridLayoutClass:(Class)a3
{
}

- (Class)_axStoryColorGradeEditorItemLayoutClass
{
}

- (void)_setAxStoryColorGradeEditorItemLayoutClass:(Class)a3
{
}

- (Class)_axStoryColorGradeEditorItemOverlayLayoutClass
{
}

- (void)_setAxStoryColorGradeEditorItemOverlayLayoutClass:(Class)a3
{
}

- (Class)_axStoryLayoutClass
{
}

- (void)_setAxStoryLayoutClass:(Class)a3
{
}

- (Class)_axStoryThumbnailChromeLayoutClass
{
}

- (void)_setAxStoryThumbnailChromeLayoutClass:(Class)a3
{
}

- (Class)_axStoryFullsizeLayoutClass
{
}

- (void)_setAxStoryFullsizeLayoutClass:(Class)a3
{
}

- (Class)_axStoryClipLayoutClass
{
}

- (void)_setAxStoryClipLayoutClass:(Class)a3
{
}

- (Class)_axStoryTransitionLayoutClass
{
}

- (void)_setAxStoryTransitionLayoutClass:(Class)a3
{
}

- (Class)_axFeedContentLayoutClass
{
}

- (void)_setAxFeedContentLayoutClass:(Class)a3
{
}

- (Class)_axStoryScrubberContentLayoutClass
{
}

- (void)_setAxStoryScrubberContentLayoutClass:(Class)a3
{
}

- (Class)_axStoryStyleSwitchingFullsizeLayoutClass
{
}

- (void)_setAxStoryStyleSwitchingFullsizeLayoutClass:(Class)a3
{
}

- (Class)_axCuratedLibraryUIViewControllerClass
{
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
}

- (Class)_axFeedViewControllerClass
{
}

- (void)_setAxFeedViewControllerClass:(Class)a3
{
}

- (Class)_axStoryViewControllerClass
{
}

- (void)_setAxStoryViewControllerClass:(Class)a3
{
}

- (Class)_axCuratedLibraryOverlayButtonClass
{
}

- (void)_setAxCuratedLibraryOverlayButtonClass:(Class)a3
{
}

- (Class)_axStoryChromeButtonClass
{
}

- (void)_setAxStoryChromeButtonClass:(Class)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXGBasicAXGroup"];
  [v3 validateClass:@"PXCuratedLibraryChapterHeaderLayout"];
  [v3 validateClass:@"PXCuratedLibrarySectionHeaderLayout"];
  [v3 validateClass:@"PXGDecoratingLayout"];
  [v3 validateClass:@"PXCuratedLibraryCardSectionBodyLayout"];
  [v3 validateClass:@"PXInlineHeadersSpriteLayout"];
  [v3 validateClass:@"PXAssetsSectionLayout"];
  [v3 validateClass:@"PXGReusableAXInfo"];
  [v3 validateClass:@"PXGView"];
  [v3 validateClass:@"PXGEngine"];
  [v3 validateClass:@"PXCuratedLibraryUIViewController"];
  [v3 validateClass:@"PhotosUIApps.PUStoryColorGradeEditorItemLayout"];
  [v3 validateClass:@"PUStoryColorGradeEditorItemOverlayLayout"];
  [v3 validateClass:@"PXFeedViewController"];
  [v3 validateClass:@"PXStoryLayout"];
  [v3 validateClass:@"PXStoryThumbnailChromeLayout"];
  [v3 validateClass:@"PXStoryFullsizeLayout"];
  [v3 validateClass:@"PXStoryClipLayout"];
  [v3 validateClass:@"PXStoryTransitionLayout"];
  [v3 validateClass:@"PXFeedContentLayout"];
  [v3 validateClass:@"PXStoryChromeButton"];
  [v3 validateClass:@"PXGBasicAXGroup" hasInstanceVariable:@"_axInfoSource" withType:"id<PXGAXInfoSource>"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axRole", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axSubgroups", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axLeafs", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"subgroupIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"loadedSubgroupIndexes", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axNextResponder", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"_axInfoSource", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axIsVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXAssetsSectionLayout", @"zoomLevel", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHObject", @"localIdentifier", "@", 0);
  [v3 validateClass:@"PHAsset" isKindOfClass:@"PHObject"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axText", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axAsset", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axSubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axImageName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"spriteIndex", "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGAXInfo", @"axContentKind", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGReusableAXInfo", @"axContainingGroup", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGView", @"engine", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGEngine", @"ensureUpdatedLayout", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryUIViewController", @"viewProvider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewProvider", @"viewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXCuratedLibraryViewModel", @"zoomablePhotosViewModel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXZoomablePhotosViewModel", @"isDisplayingIndividualItems", "@", 0);
  [v3 validateProtocol:@"PXGAXInfoSource" hasMethod:@"axVisibleSpriteIndexes" isInstanceMethod:1 isRequired:1];
  [v3 validateProtocol:@"PXGAXInfoSource" hasMethod:@"axSpriteIndexClosestToSpriteIndex:inDirection:" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"loadLeafAtSpriteIndexIfNeeded:usingOptions:", "@", "I", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"loadedLeafAtSpriteIndex:", "@", "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"unloadLeafAtSpriteIndex:usingOptions:", "@", "I", "Q", 0);
  [v3 validateProtocol:@"PXGAXResponder" hasMethod:@"axGroup:didRequestToPerformAction:userInfo:" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFeedViewController", @"configuration", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFeedConfiguration", @"gadgetSpec", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGadgetSpec", @"interItemSpacing", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryChromeButton", @"userData", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryChromeButtonConfiguration", @"menu", "@", 0);
  [v3 validateClass:@"PXCuratedLibraryOverlayButton" isKindOfClass:@"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIButton", @"menu", "@", 0);
  [v3 validateClass:@"PXStoryScrubberContentLayout"];
  [v3 validateClass:@"PUStoryViewController"];
  [v3 validateClass:@"PXGReusableAXInfo" hasInstanceVariable:@"_content" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryScrubberContentLayout", @"_axScrubberFractionNumerator", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryScrubberContentLayout", @"_axScrubberFractionDenominator", "Q", 0);
  [v3 validateClass:@"PXStoryStyleSwitchingFullsizeLayout"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryStyleSwitchingFullsizeLayout", @"_axSwitcherFractionNumerator", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryStyleSwitchingFullsizeLayout", @"_axSwitcherFractionDenominator", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXStoryStyleSwitchingFullsizeLayout", @"_axStyleTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axScrollParent", "@", 0);
  [v3 validateProtocol:@"PXGAXResponder" hasMethod:@"axContainingScrollViewForAXGroup:" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NSObject", @"_accessibilityHasVisibleFrame", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAssetCollection", @"kind", "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAssetCollection", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PHAssetCollection", @"subtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXGBasicAXGroup", @"axIdentifier", "@", 0);
}

- (AXPhotosGroupAccessibilityElement)initWithAccessibilityContainer:(id)a3 forGroup:(id)a4 inView:(id)a5 withAdditionalScrollViewElements:(id)a6
{
  v15.receiver = self;
  v15.super_class = (Class)AXPhotosGroupAccessibilityElement;
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  v12 = [(AXPhotosGroupAccessibilityElement *)&v15 initWithAccessibilityContainer:a3];
  -[AXPhotosGroupAccessibilityElement setGroup:](v12, "setGroup:", v11, v15.receiver, v15.super_class);

  [(AXPhotosGroupAccessibilityElement *)v12 setView:v10];
  [(AXPhotosGroupAccessibilityElement *)v12 setAdditionalScrollViewElements:v9];

  v13 = [MEMORY[0x263F08A00] defaultCenter];
  [v13 addObserver:v12 selector:sel__axRefreshGridGroupData_ name:@"AXPhotosGridGroupDataChanged" object:0];

  return v12;
}

- (AXPhotosGroupAccessibilityElement)initWithAccessibilityContainer:(id)a3 forGroup:(id)a4 inView:(id)a5
{
  return [(AXPhotosGroupAccessibilityElement *)self initWithAccessibilityContainer:a3 forGroup:a4 inView:a5 withAdditionalScrollViewElements:0];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(AXPhotosGroupAccessibilityElement *)self group];
  uint64_t v4 = [v3 safeIntegerForKey:@"axRole"];

  if ((unint64_t)(v4 - 3) < 2) {
    return 0;
  }
  if (v4 != 1)
  {
    if (v4)
    {
      v6.receiver = self;
      v6.super_class = (Class)AXPhotosGroupAccessibilityElement;
      return [(AXPhotosGroupAccessibilityElement *)&v6 isAccessibilityElement];
    }
    if (![(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesScrubberInStoryViewController])
    {
      return [(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesStyleSwitcherInStoryViewController];
    }
    return 1;
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView]
    || [(AXPhotosGroupAccessibilityElement *)self _axIsYearsView]
    || [(AXPhotosGroupAccessibilityElement *)self _axIsStoryColorGradeEditorItem])
  {
    return 1;
  }

  return [(AXPhotosGroupAccessibilityElement *)self _axIsStoryLayout];
}

- (id)accessibilityLabel
{
  uint64_t v41 = 0;
  v42 = (id *)&v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = [NSString string];
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryColorGradeEditorItem])
  {
    uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _axStoryColorGradeLeafElement];
    v5 = v4;
    if (v4)
    {
      objc_super v6 = [v4 accessibilityLabel];
    }
    else
    {
      objc_super v6 = 0;
    }
    objc_storeStrong(v42 + 5, v6);
    if (v5) {
  }
    }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView]
    || [(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    v7 = [(AXPhotosGroupAccessibilityElement *)self group];
    v8 = [v7 safeValueForKey:@"_axInfoSource"];
    id v9 = [v8 safeValueForKey:@"assetCollection"];

    if ([v9 safeIntForKey:@"kind"] == 1)
    {
      id v10 = [(AXPhotosGroupAccessibilityElement *)self _axSectionHeadersInSubgroups];
      uint64_t v11 = [v10 count];
      if (v11)
      {
        id v2 = [v10 firstObject];
        v12 = [v2 accessibilityLabel];
      }
      else
      {
        v12 = 0;
      }
      objc_storeStrong(v42 + 5, v12);
      if (v11)
      {
      }
      v13 = [(AXPhotosGroupAccessibilityElement *)self _axChapterHeadersInSubgroups];
      uint64_t v15 = [v13 count];
      if (v15)
      {
        id v2 = [v13 firstObject];
        v16 = [v2 accessibilityLabel];
      }
      else
      {
        v16 = 0;
      }
      v35 = v16;
      v36 = @"__AXStringForVariablesSentinel";
      uint64_t v17 = __UIAXStringForVariables();
      id v18 = v42[5];
      v42[5] = (id)v17;

      if (!v15) {
        goto LABEL_23;
      }
    }
    else
    {
      id v10 = [v9 safeStringForKey:@"title"];
      v13 = [v9 safeStringForKey:@"subtitle"];
      v35 = v13;
      v36 = @"__AXStringForVariablesSentinel";
      uint64_t v14 = __UIAXStringForVariables();
      id v2 = v42[5];
      v42[5] = (id)v14;
    }

LABEL_23:
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryLayout])
  {
    v19 = [(AXPhotosGroupAccessibilityElement *)self _axStoryFullsizeLayoutInSubgroups];
    if ([v19 count])
    {
      v20 = [v19 firstObject];
      v21 = [v20 _axStoryClipLayoutInSubgroups];

      uint64_t v22 = MEMORY[0x2455E3D70](v21);
      id v23 = v42[5];
      v42[5] = (id)v22;
    }
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesScrubberInStoryViewController])
  {
    uint64_t v24 = accessibilityPhotosUICoreLocalizedString(@"memories.scrubber");
    id v25 = v42[5];
    v42[5] = (id)v24;
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesStyleSwitcherInStoryViewController])
  {
    id v26 = v42[5];
    v42[5] = 0;
  }
  id v27 = v42[5];
  if (v27 && ![v27 length])
  {
    v28 = [(AXPhotosGroupAccessibilityElement *)self _axFilterLeafsByContentKind:2];
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke;
    v40[3] = &unk_2650A5CA8;
    v40[4] = &v41;
    [v28 enumerateObjectsUsingBlock:v40];
    v29 = [(AXPhotosGroupAccessibilityElement *)self _axFilterLeafsByContentKind:1];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_2;
    v39[3] = &unk_2650A5CA8;
    v39[4] = &v41;
    [v29 enumerateObjectsUsingBlock:v39];
    v30 = [(AXPhotosGroupAccessibilityElement *)self _axFilterLeafsByContentKind:6];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_3;
    v38[3] = &unk_2650A5CA8;
    v38[4] = &v41;
    [v30 enumerateObjectsUsingBlock:v38];
  }
  id v31 = v42[5];
  if (v31 && [v31 length])
  {
    id v32 = v42[5];
  }
  else
  {
    v37.receiver = self;
    v37.super_class = (Class)AXPhotosGroupAccessibilityElement;
    id v32 = [(AXPhotosGroupAccessibilityElement *)&v37 accessibilityLabel];
  }
  v33 = v32;
  _Block_object_dispose(&v41, 8);

  return v33;
}

void __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  objc_super v6 = [a2 accessibilityLabel];
  uint64_t v3 = __UIAXStringForVariables();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v6 = [a2 accessibilityLabel];
  uint64_t v3 = __UIAXStringForVariables();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v6 = [a2 accessibilityLabel];
  uint64_t v3 = __UIAXStringForVariables();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)accessibilityValue
{
  uint64_t v44 = 0;
  v45 = (id *)&v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  id v49 = [NSString string];
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView]
    || [(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    if ([(AXPhotosGroupAccessibilityElement *)self _axIsYearsView]) {
      [(AXPhotosGroupAccessibilityElement *)self _axShouldShowAlternateUI:1];
    }
    uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _axSectionHeadersInSubgroups];
    uint64_t v5 = [v4 count];
    if (v5)
    {
      id v2 = [v4 firstObject];
      objc_super v6 = [v2 accessibilityValue];
    }
    else
    {
      objc_super v6 = 0;
    }
    objc_storeStrong(v45 + 5, v6);
    if (v5)
    {
    }
    v7 = [(AXPhotosGroupAccessibilityElement *)self _axChapterHeadersInSubgroups];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      objc_super v6 = [v7 firstObject];
      id v9 = [v6 accessibilityValue];
    }
    else
    {
      id v9 = 0;
    }
    uint64_t v10 = __UIAXStringForVariables();
    id v11 = v45[5];
    v45[5] = (id)v10;

    if (v8)
    {
    }
    if ([(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
    {
      [(AXPhotosGroupAccessibilityElement *)self _axShouldShowAlternateUI:0];
    }
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesScrubberInStoryViewController])
  {
    v12 = [(AXPhotosGroupAccessibilityElement *)self group];
    v13 = [v12 safeValueForKey:@"_axInfoSource"];

    uint64_t v14 = [v13 safeUnsignedIntegerForKey:@"_axScrubberFractionNumerator"];
    uint64_t v15 = [v13 safeUnsignedIntegerForKey:@"_axScrubberFractionDenominator"];
    v16 = [(AXPhotosGroupAccessibilityElement *)self _axCurrentLeafInStory];
    uint64_t v17 = [v16 safeValueForKey:@"_content"];
    id v18 = NSString;
    v19 = accessibilityPhotosUICoreLocalizedString(@"memories.scrubber.choice");
    v20 = objc_msgSend(v18, "localizedStringWithFormat:", v19, v14, v15);
    v38 = [v17 accessibilityLabel];
    v40 = @"__AXStringForVariablesSentinel";
    uint64_t v21 = __UIAXStringForVariables();
    id v22 = v45[5];
    v45[5] = (id)v21;
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesStyleSwitcherInStoryViewController])
  {
    id v23 = [(AXPhotosGroupAccessibilityElement *)self group];
    uint64_t v24 = [v23 safeValueForKey:@"_axInfoSource"];

    uint64_t v25 = [v24 safeUnsignedIntegerForKey:@"_axSwitcherFractionNumerator"];
    uint64_t v26 = [v24 safeUnsignedIntegerForKey:@"_axSwitcherFractionDenominator"];
    id v27 = [v24 safeStringForKey:@"_axStyleTitle"];
    v28 = NSString;
    v29 = accessibilityPhotosUICoreLocalizedString(@"memories.style.choice");
    v30 = objc_msgSend(v28, "localizedStringWithFormat:", v29, v25, v26);
    v39 = v27;
    uint64_t v41 = @"__AXStringForVariablesSentinel";
    uint64_t v31 = __UIAXStringForVariables();
    id v32 = v45[5];
    v45[5] = (id)v31;
  }
  if (!objc_msgSend(v45[5], "length", v39, v41))
  {
    v33 = [(AXPhotosGroupAccessibilityElement *)self _axFilterLeafsByContentKind:1];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityValue__block_invoke;
    v43[3] = &unk_2650A5CA8;
    v43[4] = &v44;
    [v33 enumerateObjectsUsingBlock:v43];
  }
  id v34 = v45[5];
  if (v34 && [v34 length])
  {
    id v35 = v45[5];
  }
  else
  {
    v42.receiver = self;
    v42.super_class = (Class)AXPhotosGroupAccessibilityElement;
    id v35 = [(AXPhotosGroupAccessibilityElement *)&v42 accessibilityValue];
  }
  v36 = v35;
  _Block_object_dispose(&v44, 8);

  return v36;
}

void __55__AXPhotosGroupAccessibilityElement_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  objc_super v6 = [a2 accessibilityValue];
  uint64_t v3 = __UIAXStringForVariables();
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v3 = [NSString string];
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView]
    || [(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _axCardSectionBodyInSubgroups];
    if ([v4 count])
    {
      uint64_t v5 = [v4 firstObject];
      objc_super v6 = [v5 _axFilterLeafsByContentKind:6];

      if ([v6 count])
      {
        v7 = [v6 firstObject];
        uint64_t v8 = [v7 accessibilityLabel];

        uint64_t v3 = v7;
      }
      else
      {
        uint64_t v8 = 0;
      }

      uint64_t v3 = (void *)v8;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)AXPhotosGroupAccessibilityElement;
  id v11 = [(AXPhotosGroupAccessibilityElement *)&v12 _accessibilityScrollStatus];
  id v9 = __UIAXStringForVariables();

  return v9;
}

- (CGRect)accessibilityFrame
{
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self group];
  [v3 accessibilityFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryLayout]
    && [(AXPhotosGroupAccessibilityElement *)self _accessibilityInStoryViewController])
  {
    double v5 = v5 + 0.0;
    double v7 = v7 + 100.0;
    double v11 = v11 + -280.0;
  }
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

- (id)accessibilityIdentifier
{
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self group];

  if (!v3
    || ([(AXPhotosGroupAccessibilityElement *)self group],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 safeStringForKey:@"axIdentifier"],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    double v6 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
    if (v6)
    {
      double v7 = v6;
      double v8 = NSString;
      double v9 = [v6 className];
      double v5 = [v8 stringWithFormat:@"%@-Group", v9];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)AXPhotosGroupAccessibilityElement;
      double v5 = [(AXPhotosGroupAccessibilityElement *)&v11 accessibilityIdentifier];
    }
  }

  return v5;
}

- (BOOL)_accessibilityHasVisibleFrame
{
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityFeedViewController];

  if (v3
    && ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryTransitionLayout]
     || [(AXPhotosGroupAccessibilityElement *)self _axIsFeedContentLayout]))
  {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)AXPhotosGroupAccessibilityElement;
  return [(AXPhotosGroupAccessibilityElement *)&v5 _accessibilityHasVisibleFrame];
}

- (unint64_t)accessibilityTraits
{
  v13.receiver = self;
  v13.super_class = (Class)AXPhotosGroupAccessibilityElement;
  unint64_t v3 = [(AXPhotosGroupAccessibilityElement *)&v13 accessibilityTraits];
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    v3 |= *MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8] | *MEMORY[0x263F1CED8];
    return v3;
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView])
  {
    double v4 = [(AXPhotosGroupAccessibilityElement *)self _axChapterHeadersInSubgroups];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      double v9 = [(AXPhotosGroupAccessibilityElement *)self _axSectionHeadersInSubgroups];
      uint64_t v10 = [v9 count];

      if (!v10) {
        return v3;
      }
      uint64_t v11 = *MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8];
LABEL_18:
      v3 |= v11;
      return v3;
    }
    double v6 = (uint64_t *)MEMORY[0x263F1CEF8];
LABEL_17:
    uint64_t v11 = *v6;
    goto LABEL_18;
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryColorGradeEditorItem])
  {
    double v7 = [(AXPhotosGroupAccessibilityElement *)self _axStoryColorGradeLeafElement];
    double v8 = v7;
    if (v7) {
      v3 |= [v7 accessibilityTraits];
    }
  }
  else
  {
    if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesScrubberInStoryViewController])
    {
      double v6 = (uint64_t *)MEMORY[0x263F1CED8];
      goto LABEL_17;
    }
    if ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryLayout])
    {
      v3 |= *MEMORY[0x263F1CF00];
      if ([(AXPhotosGroupAccessibilityElement *)self _axIsFeedContentLayout])
      {
        double v6 = (uint64_t *)MEMORY[0x263F1CEE8];
        goto LABEL_17;
      }
    }
  }
  return v3;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)automationElements
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView])
  {
    unint64_t v3 = [MEMORY[0x263EFF980] array];
    double v4 = [(AXPhotosGroupAccessibilityElement *)self _axMoreButtonInMonthsView];
    uint64_t v5 = [v4 accessibilityLabel];
    double v6 = v5;
    if (v5 && [v5 length]) {
      [v3 axSafelyAddObject:v4];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosGroupAccessibilityElement;
    unint64_t v3 = [(AXPhotosGroupAccessibilityElement *)&v8 automationElements];
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (![(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView])
  {
    if (![(AXPhotosGroupAccessibilityElement *)self _axIsStoryLayout])
    {
      v31.receiver = self;
      v31.super_class = (Class)AXPhotosGroupAccessibilityElement;
      id v30 = [(AXPhotosGroupAccessibilityElement *)&v31 accessibilityCustomActions];
      goto LABEL_31;
    }
    id v30 = [MEMORY[0x263EFF980] array];
    double v4 = [(AXPhotosGroupAccessibilityElement *)self _axStoryThumbnailChromeLayoutInSubgroups];
    if (![v4 count]) {
      goto LABEL_29;
    }
    v29 = v4;
    uint64_t v11 = [v4 firstObject];
    double v12 = [v11 _axLeafAccessibilityElements];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (!v14) {
      goto LABEL_28;
    }
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
LABEL_14:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v37 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v36 + 1) + 8 * v17);
      v19 = [v18 leaf];
      v20 = [v19 safeValueForKey:@"axView"];

      if ([(AXPhotosGroupAccessibilityElement *)self _axStoryChromeButtonClass])
      {
        if (v20) {
          goto LABEL_21;
        }
      }
      else
      {
        [(AXPhotosGroupAccessibilityElement *)self _setAxStoryChromeButtonClass:MEMORY[0x2455E3C60](@"PXStoryChromeButton")];
        if (v20)
        {
LABEL_21:
          [(AXPhotosGroupAccessibilityElement *)self _axStoryChromeButtonClass];
          if (objc_opt_isKindOfClass())
          {
            uint64_t v21 = [v20 safeValueForKeyPath:@"userData.menu"];

            id v22 = objc_alloc(MEMORY[0x263F1C390]);
            if (v21)
            {
              id v23 = [v20 accessibilityLabel];
              v34[0] = MEMORY[0x263EF8330];
              v34[1] = 3221225472;
              v34[2] = __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_2;
              v34[3] = &unk_2650A5CD0;
              v35[0] = v20;
              v35[1] = v18;
              uint64_t v24 = (void *)[v22 initWithName:v23 actionHandler:v34];

              [v30 addObject:v24];
              uint64_t v25 = (id *)v35;
            }
            else
            {
              uint64_t v26 = [v18 accessibilityLabel];
              v32[0] = MEMORY[0x263EF8330];
              v32[1] = 3221225472;
              v32[2] = __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_3;
              v32[3] = &unk_2650A5CF8;
              id v33 = v20;
              id v27 = (void *)[v22 initWithName:v26 actionHandler:v32];

              [v30 addObject:v27];
              uint64_t v25 = &v33;
            }
          }
        }
      }

      if (v15 == ++v17)
      {
        uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v43 count:16];
        if (!v15)
        {
LABEL_28:

          double v4 = v29;
          goto LABEL_29;
        }
        goto LABEL_14;
      }
    }
  }
  id v30 = [MEMORY[0x263EFF980] array];
  unint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _axMoreButtonInMonthsView];
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 leaf];
    double v6 = [v5 safeUIViewForKey:@"axView"];

    if ([v6 _accessibilityViewIsVisible])
    {
      if (![(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryOverlayButtonClass])[(AXPhotosGroupAccessibilityElement *)self _setAxCuratedLibraryOverlayButtonClass:MEMORY[0x2455E3C60](@"PXCuratedLibraryOverlayButton")]; {
      [(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryOverlayButtonClass];
      }
      if (objc_opt_isKindOfClass())
      {
        double v7 = [v6 safeValueForKey:@"menu"];

        if (v7)
        {
          id v8 = objc_alloc(MEMORY[0x263F1C390]);
          double v9 = [v6 accessibilityLabel];
          v40[0] = MEMORY[0x263EF8330];
          v40[1] = 3221225472;
          v40[2] = __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke;
          v40[3] = &unk_2650A5CD0;
          id v41 = v6;
          id v42 = v4;
          uint64_t v10 = (void *)[v8 initWithName:v9 actionHandler:v40];

          [v30 addObject:v10];
        }
      }
    }
  }
LABEL_29:

LABEL_31:

  return v30;
}

uint64_t __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  return 1;
}

- (id)accessibilityElements
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  double v4 = [(AXPhotosGroupAccessibilityElement *)self _axUnsortedGroupsAccessibilityElements];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke;
  v14[3] = &unk_2650A5D20;
  id v5 = v3;
  id v15 = v5;
  [v4 enumerateObjectsUsingBlock:v14];
  double v6 = [(AXPhotosGroupAccessibilityElement *)self _axUnsortedLeafAccessibilityElements];
  if ([v6 count]) {
    [v5 axSafelyAddObjectsFromArray:v6];
  }
  double v7 = [(AXPhotosGroupAccessibilityElement *)self additionalScrollViewElements];
  if (v7)
  {
    id v8 = [(AXPhotosGroupAccessibilityElement *)self additionalScrollViewElements];
    double v9 = v8[2]();
  }
  else
  {
    double v9 = [MEMORY[0x263EFF8C0] array];
  }

  [v5 axSafelyAddObjectsFromArray:v9];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke_2;
  v13[3] = &unk_2650A5D48;
  v13[4] = self;
  uint64_t v10 = [v5 sortedArrayUsingComparator:v13];
  uint64_t v11 = (void *)[v10 mutableCopy];

  return v11;
}

void __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  unint64_t v3 = [v5 group];
  int v4 = [v3 safeBoolForKey:@"axIsVisible"];

  if (v4) {
    [*(id *)(a1 + 32) axSafelyAddObject:v5];
  }
}

uint64_t __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _axCompareAXPhotoElement:a2 toElement:a3];
}

- (CGRect)accessibilityFrameForScrolling
{
  [(AXPhotosGroupAccessibilityElement *)self accessibilityFrame];
  CGFloat x = v3;
  CGFloat y = v5;
  double width = v7;
  double height = v9;
  uint64_t v11 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityCuratedLibraryUIViewController];
  if (v11)
  {
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.double width = width;
    v22.size.double height = height;
    CGRect v23 = CGRectInset(v22, 0.0, (height + width) * -0.5);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    double width = v23.size.width;
    double height = v23.size.height;
  }
  else
  {
    double v12 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityFeedViewController];
    id v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v12 safeValueForKeyPath:@"configuration.gadgetSpec"];
      [v14 safeCGFloatForKey:@"interItemSpacing"];
      if (v14)
      {
        double v16 = v15 * -4.0;
        double v17 = 0.0;
      }
      else
      {
        double v17 = height / -3.0;
        double v16 = 0.0;
      }
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      CGRect v25 = CGRectInset(v24, v16, v17);
      CGFloat x = v25.origin.x;
      CGFloat y = v25.origin.y;
      double width = v25.size.width;
      double height = v25.size.height;
    }
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (id)_accessibilityParentForFindingScrollParent
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsStoryLayout]
    && ([(AXPhotosGroupAccessibilityElement *)self _accessibilityFeedViewController],
        double v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    int v4 = [(AXPhotosGroupAccessibilityElement *)self group];
    double v5 = [v4 safeValueForKey:@"axScrollParent"];

    double v6 = [v5 safeValueForKey:@"axNextResponder"];
    double v7 = [(AXPhotosGroupAccessibilityElement *)self group];
    id v8 = [v6 axContainingScrollViewForAXGroup:v7];
  }
  else
  {
    id v8 = [(AXPhotosGroupAccessibilityElement *)self accessibilityContainer];
  }

  return v8;
}

- (void)accessibilityIncrement
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesScrubberInStoryViewController])
  {
    [(AXPhotosGroupAccessibilityElement *)self _axMoveStoryForInfoSource:@"PXStoryScrubberContentLayout" inDirection:5];
  }
  else
  {
    [(AXPhotosGroupAccessibilityElement *)self _axMoveToNextInfoInDirection:5];
  }
}

- (void)accessibilityDecrement
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesScrubberInStoryViewController])
  {
    [(AXPhotosGroupAccessibilityElement *)self _axMoveStoryForInfoSource:@"PXStoryScrubberContentLayout" inDirection:6];
  }
  else
  {
    [(AXPhotosGroupAccessibilityElement *)self _axMoveToNextInfoInDirection:6];
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesStyleSwitcherInStoryViewController])goto LABEL_5; {
  if (a3 == 2)
  }
  {
    uint64_t v5 = 5;
    goto LABEL_7;
  }
  if (a3 != 1)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)AXPhotosGroupAccessibilityElement;
    return [(AXPhotosGroupAccessibilityElement *)&v7 accessibilityScroll:a3];
  }
  uint64_t v5 = 6;
LABEL_7:
  [(AXPhotosGroupAccessibilityElement *)self _axMoveStoryForInfoSource:@"PXStoryStyleSwitchingFullsizeLayout" inDirection:v5];
  return 1;
}

- (id)accessibilityHint
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    double v3 = accessibilityPhotosUICoreLocalizedString(@"years.adjustment.instructions");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXPhotosGroupAccessibilityElement;
    double v3 = [(AXPhotosGroupAccessibilityElement *)&v5 accessibilityHint];
  }

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMemoriesStyleSwitcherInStoryViewController])
  {
    double v3 = [(AXPhotosGroupAccessibilityElement *)self _axLeafAccessibilityElements];
    int v4 = (void *)[v3 mutableCopy];

    [v4 sortUsingSelector:sel_accessibilityCompareGeometry_];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AXPhotosGroupAccessibilityElement;
    int v4 = [(AXPhotosGroupAccessibilityElement *)&v6 _accessibilitySupplementaryFooterViews];
  }

  return v4;
}

- (void)_updateGroupAccessibilityElements
{
  id v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedSubgroupElements];
  int v4 = [(AXPhotosGroupAccessibilityElement *)self group];
  objc_super v5 = [v4 safeArrayForKey:@"axSubgroups"];

  if ([v5 count])
  {
    if (!v3)
    {
      id v3 = [MEMORY[0x263EFF9A0] dictionary];
    }
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __70__AXPhotosGroupAccessibilityElement__updateGroupAccessibilityElements__block_invoke;
    double v9 = &unk_2650A5D70;
    id v3 = v3;
    id v10 = v3;
    uint64_t v11 = self;
    [v5 enumerateObjectsUsingBlock:&v6];
    -[AXPhotosGroupAccessibilityElement _setAxCachedSubgroupElements:](self, "_setAxCachedSubgroupElements:", v3, v6, v7, v8, v9);
  }
  else
  {
    [(AXPhotosGroupAccessibilityElement *)self _setAxCachedSubgroupElements:0];
  }
  [(AXPhotosGroupAccessibilityElement *)self _cleanupStaleGroupAccessibilityElements];
}

void __70__AXPhotosGroupAccessibilityElement__updateGroupAccessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "safeIntegerForKey:", @"subgroupIndex"));
  int v4 = [*(id *)(a1 + 32) objectForKey:v3];
  if (v4)
  {
    objc_super v5 = v4;
    [(AXPhotosGroupAccessibilityElement *)v4 setGroup:v9];
  }
  else
  {
    uint64_t v6 = [AXPhotosGroupAccessibilityElement alloc];
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = [v7 view];
    objc_super v5 = [(AXPhotosGroupAccessibilityElement *)v6 initWithAccessibilityContainer:v7 forGroup:v9 inView:v8];

    [*(id *)(a1 + 32) setObject:v5 forKey:v3];
  }
}

- (void)_cleanupStaleGroupAccessibilityElements
{
  id v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedSubgroupElements];
  if (v3)
  {
    char v11 = 0;
    objc_opt_class();
    int v4 = [(AXPhotosGroupAccessibilityElement *)self group];
    objc_super v5 = [v4 safeValueForKey:@"loadedSubgroupIndexes"];
    uint64_t v6 = __UIAccessibilityCastAsClass();

    uint64_t v7 = [v3 allKeys];
    id v8 = [(AXPhotosGroupAccessibilityElement *)self _axFilterStaleKeys:v7 usingIndexSet:v6];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __76__AXPhotosGroupAccessibilityElement__cleanupStaleGroupAccessibilityElements__block_invoke;
    v9[3] = &unk_2650A5D98;
    id v10 = v3;
    [v8 enumerateIndexesUsingBlock:v9];
  }
}

void __76__AXPhotosGroupAccessibilityElement__cleanupStaleGroupAccessibilityElements__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithInteger:a2];
  [v2 removeObjectForKey:v3];
}

- (id)_axUnsortedGroupsAccessibilityElements
{
  id v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedSubgroupElements];
  if (!v3)
  {
    [(AXPhotosGroupAccessibilityElement *)self _updateGroupAccessibilityElements];
    id v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedSubgroupElements];
  }
  int v4 = [v3 allValues];

  return v4;
}

- (id)_axGroupsAccessibilityElements
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [(AXPhotosGroupAccessibilityElement *)self _axUnsortedGroupsAccessibilityElements];
  id v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"group.subgroupIndex" ascending:1];
  v7[0] = v3;
  int v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  objc_super v5 = [v2 sortedArrayUsingDescriptors:v4];

  return v5;
}

- (id)_axFilterSubgroupsByInfoSourceType:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AXPhotosGroupAccessibilityElement *)self _axGroupsAccessibilityElements];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__AXPhotosGroupAccessibilityElement__axFilterSubgroupsByInfoSourceType___block_invoke;
  v9[3] = &unk_2650A5DC0;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = [v5 axFilterObjectsUsingBlock:v9];

  return v7;
}

uint64_t __72__AXPhotosGroupAccessibilityElement__axFilterSubgroupsByInfoSourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosGridSectionHeader"])
  {
    uint64_t v4 = [v3 _axIsSectionHeader];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosGridChapterHeader"])
  {
    uint64_t v4 = [v3 _axIsChapterHeader];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosGridDecorating"])
  {
    uint64_t v4 = [v3 _axIsDecorating];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosGridCardSectionBody"])
  {
    uint64_t v4 = [v3 _axIsCardSectionBody];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosStoryFullsizeLayoutKey"])
  {
    uint64_t v4 = [v3 _axIsStoryFullsizeLayout];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosStoryClipLayoutKey"])
  {
    uint64_t v4 = [v3 _axIsStoryClipLayout];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:@"AXPhotosStoryThumbnailChromeLayoutKey"])
  {
    uint64_t v4 = [v3 _axIsStoryThumbnailChromeLayout];
  }
  else
  {
    if (![*(id *)(a1 + 32) isEqualToString:@"AXPhotosStoryScrubberContentLayoutKey"])
    {
      uint64_t v5 = 0;
      goto LABEL_18;
    }
    uint64_t v4 = [v3 _axIsStoryScrubberContentLayout];
  }
  uint64_t v5 = v4;
LABEL_18:

  return v5;
}

- (id)_axSectionHeadersInSubgroups
{
  return [(AXPhotosGroupAccessibilityElement *)self _axFilterSubgroupsByInfoSourceType:@"AXPhotosGridSectionHeader"];
}

- (id)_axChapterHeadersInSubgroups
{
  return [(AXPhotosGroupAccessibilityElement *)self _axFilterSubgroupsByInfoSourceType:@"AXPhotosGridChapterHeader"];
}

- (id)_axDecoratingInSubgroups
{
  return [(AXPhotosGroupAccessibilityElement *)self _axFilterSubgroupsByInfoSourceType:@"AXPhotosGridDecorating"];
}

- (id)_axCardSectionBodyInSubgroups
{
  id v2 = [(AXPhotosGroupAccessibilityElement *)self _axDecoratingInSubgroups];
  if ([v2 count])
  {
    id v3 = [v2 firstObject];
    uint64_t v4 = [v3 _axFilterSubgroupsByInfoSourceType:@"AXPhotosGridCardSectionBody"];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_axStoryClipLayoutInSubgroups
{
  return [(AXPhotosGroupAccessibilityElement *)self _axFilterSubgroupsByInfoSourceType:@"AXPhotosStoryClipLayoutKey"];
}

- (id)_axStoryFullsizeLayoutInSubgroups
{
  return [(AXPhotosGroupAccessibilityElement *)self _axFilterSubgroupsByInfoSourceType:@"AXPhotosStoryFullsizeLayoutKey"];
}

- (id)_axStoryThumbnailChromeLayoutInSubgroups
{
  return [(AXPhotosGroupAccessibilityElement *)self _axFilterSubgroupsByInfoSourceType:@"AXPhotosStoryThumbnailChromeLayoutKey"];
}

- (id)_axUniqueIdentifierForLeaf:(id)a3
{
  id v3 = a3;
  switch([v3 safeIntegerForKey:@"axContentKind"])
  {
    case 1:
      id v6 = [v3 safeValueForKey:@"axTitle"];
      uint64_t v7 = [v3 safeValueForKey:@"axSubtitle"];
      goto LABEL_9;
    case 2:
    case 3:
      uint64_t v4 = @"axText";
      goto LABEL_6;
    case 4:
      uint64_t v4 = @"axImageName";
LABEL_6:
      id v6 = [v3 safeValueForKey:v4];
      uint64_t v8 = __UIAXStringForVariables();
      goto LABEL_7;
    case 5:
      id v9 = NSString;
      id v6 = [v3 safeValueForKey:@"axView"];
      uint64_t v7 = objc_msgSend(v9, "stringWithFormat:", @"%p", v6);
LABEL_9:
      uint64_t v5 = __UIAXStringForVariables();

      goto LABEL_10;
    case 6:
      id v6 = [v3 safeValueForKey:@"axAsset"];
      uint64_t v8 = [v6 safeValueForKey:@"localIdentifier"];
      if (v8) {
        goto LABEL_7;
      }
      MEMORY[0x2455E3C60](@"CKMediaObjectBackedAsset");
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = [v6 safeValueForKey:@"uuid"];
LABEL_7:
        uint64_t v5 = (void *)v8;
      }
      else
      {
        uint64_t v5 = 0;
      }
LABEL_10:

LABEL_11:
      return v5;
    default:
      uint64_t v5 = 0;
      goto LABEL_11;
  }
}

- (void)_updateLeafAccessibilityElementsIfNeeded
{
  id v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedLeafElements];
  uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _axCachedLeafSpriteIndexes];
  uint64_t v5 = [(AXPhotosGroupAccessibilityElement *)self group];
  id v6 = [v5 safeArrayForKey:@"axLeafs"];

  if (![v6 count])
  {
    [(AXPhotosGroupAccessibilityElement *)self _setAxCachedLeafElements:0];
    goto LABEL_11;
  }
  if (v3)
  {
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    id v3 = [MEMORY[0x263EFF9A0] dictionary];
    if (v4) {
      goto LABEL_4;
    }
  }
  uint64_t v4 = [MEMORY[0x263F089C8] indexSet];
LABEL_4:
  uint64_t v7 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityCuratedLibraryUIViewController];
  uint64_t v8 = [v7 safeValueForKey:@"viewProvider"];
  id v9 = [v8 safeValueForKey:@"viewModel"];
  id v10 = [v9 safeValueForKey:@"zoomablePhotosViewModel"];
  int v11 = [v10 safeBoolForKey:@"isDisplayingIndividualItems"];

  if (!v7 || v11)
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __77__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElementsIfNeeded__block_invoke;
    v16[3] = &unk_2650A5DE8;
    id v17 = v4;
    objc_copyWeak(&v20, &location);
    double v18 = self;
    id v12 = v3;
    id v19 = v12;
    [v6 enumerateObjectsUsingBlock:v16];
    objc_opt_class();
    id v13 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
    uint64_t v14 = [v13 safeValueForKey:@"axVisibleSpriteIndexes"];
    double v15 = __UIAccessibilityCastAsClass();

    if ([v15 count]) {
      [(AXPhotosGroupAccessibilityElement *)self _updateLeafAccessibilityElements:v12 forVisibleSpriteIndexes:v15];
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

LABEL_11:
}

void __77__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElementsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v6, "safeUnsignedIntForKey:", @"spriteIndex"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [WeakRetained _axUniqueIdentifierForLeaf:v6];

  if (v4)
  {
    uint64_t v5 = [[AXPhotosLeafAccessibilityElement alloc] initWithAccessibilityContainer:*(void *)(a1 + 40) forLeaf:v6];
    [*(id *)(a1 + 48) setObject:v5 forKey:v4];
  }
}

- (void)_updateLeafAccessibilityElements:(id)a3 forVisibleSpriteIndexes:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x263EFF9C0];
  id v8 = a4;
  id v9 = [v7 set];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke;
  v12[3] = &unk_2650A5E38;
  v12[4] = self;
  id v13 = v6;
  id v14 = v9;
  id v10 = v9;
  id v11 = v6;
  [v8 enumerateIndexesUsingBlock:v12];

  [(AXPhotosGroupAccessibilityElement *)self _axUnloadStaleLeafObjects];
  [(AXPhotosGroupAccessibilityElement *)self _axCleanupAccessibilityElements:v11 withUpdatedKeys:v10];
}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke(id *a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  AXPerformSafeBlock();
  id v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  if (!v2)
  {
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy_;
    id v11 = __Block_byref_object_dispose_;
    id v12 = 0;
    AXPerformSafeBlock();
    id v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    id v10 = __Block_byref_object_copy_;
    id v11 = __Block_byref_object_dispose_;
    id v12 = 0;
    AXPerformSafeBlock();
    id v2 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  uint64_t v4 = [a1[4] _axUniqueIdentifierForLeaf:v2];
  if (v4)
  {
    uint64_t v5 = [a1[5] objectForKey:v4];
    if (v5)
    {
      id v6 = v5;
      [(AXPhotosLeafAccessibilityElement *)v5 setLeaf:v2];
    }
    else
    {
      id v6 = [[AXPhotosLeafAccessibilityElement alloc] initWithAccessibilityContainer:a1[4] forLeaf:v2];
      [a1[5] setObject:v6 forKey:v4];
    }
  }
  [a1[6] axSafelyAddObject:v4];
}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) group];
  uint64_t v2 = [v5 loadedLeafAtSpriteIndex:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) group];
  uint64_t v2 = [v5 loadLeafAtSpriteIndexIfNeeded:*(unsigned int *)(a1 + 48) usingOptions:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) group];
  uint64_t v2 = [v5 loadedLeafAtSpriteIndex:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_axUnloadStaleLeafObjects
{
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedLeafSpriteIndexes];
  char v12 = 0;
  objc_opt_class();
  uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  id v5 = [v4 safeValueForKey:@"axVisibleSpriteIndexes"];
  id v6 = __UIAccessibilityCastAsClass();

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__AXPhotosGroupAccessibilityElement__axUnloadStaleLeafObjects__block_invoke;
  v9[3] = &unk_2650A5E88;
  id v10 = v6;
  id v11 = self;
  id v7 = v6;
  [v3 enumerateIndexesUsingBlock:v9];
  id v8 = (void *)[v7 mutableCopy];
  [(AXPhotosGroupAccessibilityElement *)self _setAxCachedLeafSpriteIndexes:v8];
}

uint64_t __62__AXPhotosGroupAccessibilityElement__axUnloadStaleLeafObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if ((result & 1) == 0) {
    return AXPerformSafeBlock();
  }
  return result;
}

void __62__AXPhotosGroupAccessibilityElement__axUnloadStaleLeafObjects__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) group];
  [v2 unloadLeafAtSpriteIndex:*(unsigned int *)(a1 + 40) usingOptions:3];
}

- (void)_axCleanupAccessibilityElements:(id)a3 withUpdatedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v9 = [v6 allKeys];
    id v10 = [v8 setWithArray:v9];

    [v10 minusSet:v7];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __85__AXPhotosGroupAccessibilityElement__axCleanupAccessibilityElements_withUpdatedKeys___block_invoke;
    v11[3] = &unk_2650A5EB0;
    id v12 = v6;
    [v10 enumerateObjectsUsingBlock:v11];
  }
  [(AXPhotosGroupAccessibilityElement *)self _setAxCachedLeafElements:v6];
}

uint64_t __85__AXPhotosGroupAccessibilityElement__axCleanupAccessibilityElements_withUpdatedKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

- (id)_axUnsortedLeafAccessibilityElements
{
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedLeafElements];
  if (!v3)
  {
    [(AXPhotosGroupAccessibilityElement *)self _updateLeafAccessibilityElementsIfNeeded];
    uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _axCachedLeafElements];
  }
  uint64_t v4 = [v3 allValues];

  return v4;
}

- (id)_axLeafAccessibilityElements
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = [(AXPhotosGroupAccessibilityElement *)self _axUnsortedLeafAccessibilityElements];
  uint64_t v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"leaf.spriteIndex" ascending:1];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v5 = [v2 sortedArrayUsingDescriptors:v4];

  return v5;
}

- (id)_axFilterLeafsByContentKind:(int64_t)a3
{
  uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _axLeafAccessibilityElements];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __65__AXPhotosGroupAccessibilityElement__axFilterLeafsByContentKind___block_invoke;
  v7[3] = &__block_descriptor_40_e45_B24__0__AXPhotosLeafAccessibilityElement_8Q16l;
  v7[4] = a3;
  id v5 = [v4 axFilterObjectsUsingBlock:v7];

  return v5;
}

BOOL __65__AXPhotosGroupAccessibilityElement__axFilterLeafsByContentKind___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 leaf];
  uint64_t v4 = [v3 safeIntegerForKey:@"axContentKind"];

  return v4 == *(void *)(a1 + 32);
}

- (void)_axContainingGroup:(id)a3 performedAction:(int64_t)a4 withUserInfo:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  id v13 = v7;
  id v14 = v8;
  AXPerformSafeBlock();

  _Block_object_dispose(v15, 8);
  uint64_t v9 = [(AXPhotosGroupAccessibilityElement *)self view];
  id v10 = [v9 safeValueForKey:@"engine"];

  id v11 = (id)[v10 safeValueForKey:@"ensureUpdatedLayout"];
}

void __85__AXPhotosGroupAccessibilityElement__axContainingGroup_performedAction_withUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) safeValueForKey:@"axNextResponder"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 axGroup:*(void *)(a1 + 32) didRequestToPerformAction:*(void *)(a1 + 56) userInfo:*(void *)(a1 + 40)];
}

- (void)_axShouldShowAlternateUI:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    id v5 = [(AXPhotosGroupAccessibilityElement *)self _axCardSectionBodyInSubgroups];
    if ([v5 count])
    {
      id v6 = [v5 firstObject];
      id v7 = [v6 group];
      id v8 = [v7 safeArrayForKey:@"axLeafs"];

      if ([v8 count])
      {
        uint64_t v9 = [v8 firstObject];
        if (v9)
        {
          id v10 = v9;
          id v11 = [v9 safeValueForKey:@"axContainingGroup"];
          if (v11)
          {
            uint64_t v16 = 0;
            id v17 = &v16;
            uint64_t v18 = 0x3032000000;
            id v19 = __Block_byref_object_copy_;
            id v20 = __Block_byref_object_dispose_;
            id v21 = 0;
            uint64_t v14 = MEMORY[0x263EF8330];
            id v15 = v10;
            AXPerformSafeBlock();
            id v12 = (id)v17[5];

            _Block_object_dispose(&v16, 8);
            if (v3) {
              uint64_t v13 = 2;
            }
            else {
              uint64_t v13 = 3;
            }
            -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](self, "_axContainingGroup:performedAction:withUserInfo:", v11, v13, v12, v14, 3221225472, __62__AXPhotosGroupAccessibilityElement__axShouldShowAlternateUI___block_invoke, &unk_2650A5F20);
          }
        }
      }
    }
  }
}

void __62__AXPhotosGroupAccessibilityElement__axShouldShowAlternateUI___block_invoke(uint64_t a1)
{
  id v2 = __UIAccessibilityCastAsProtocol();
  uint64_t v3 = PXGAXCreateActionUserInfo();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_axMoreButtonInMonthsView
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsMonthsView])
  {
    uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _axSectionHeadersInSubgroups];
    if ([v3 count])
    {
      uint64_t v4 = [v3 firstObject];
      id v5 = [v4 _axLeafAccessibilityElements];

      id v6 = [v5 axFilterObjectsUsingBlock:&__block_literal_global];
      if ([v6 count])
      {
        id v7 = [v6 firstObject];
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

BOOL __62__AXPhotosGroupAccessibilityElement__axMoreButtonInMonthsView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 leaf];
  BOOL v3 = [v2 safeIntegerForKey:@"axContentKind"] == 5;

  return v3;
}

- (void)_axMoveToNextInfoInDirection:(unint64_t)a3
{
  if ([(AXPhotosGroupAccessibilityElement *)self _axIsYearsView])
  {
    uint64_t v4 = [(AXPhotosGroupAccessibilityElement *)self _axCardSectionBodyInSubgroups];
    if ([v4 count])
    {
      id v5 = [v4 firstObject];
      id v6 = [v5 _axLeafAccessibilityElements];
      if ([v6 count])
      {
        id v7 = [v6 firstObject];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = [v7 leaf];
          id v10 = [v9 safeValueForKey:@"axContainingGroup"];

          if (v10)
          {
            CGRect v24 = [v10 safeValueForKey:@"axInfoSource"];
            id v11 = [v8 leaf];
            [v11 safeUnsignedIntForKey:@"spriteIndex"];

            uint64_t v29 = 0;
            id v30 = &v29;
            uint64_t v31 = 0x3032000000;
            id v32 = __Block_byref_object_copy_;
            id v33 = __Block_byref_object_dispose_;
            id v34 = 0;
            id v28 = v8;
            AXPerformSafeBlock();
            id v12 = (id)v30[5];

            _Block_object_dispose(&v29, 8);
            id v23 = v12;
            [(AXPhotosGroupAccessibilityElement *)self _axContainingGroup:v10 performedAction:2 withUserInfo:v12];
            uint64_t v29 = 0;
            id v30 = &v29;
            uint64_t v31 = 0x2020000000;
            LODWORD(v32) = 0;
            id v25 = v24;
            AXPerformSafeBlock();
            LODWORD(v12) = *((_DWORD *)v30 + 6);

            _Block_object_dispose(&v29, 8);
            if (v12 == -1)
            {
              UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21918]);
              id v20 = self;
              id v19 = v23;
              [(AXPhotosGroupAccessibilityElement *)v20 _axContainingGroup:v10 performedAction:3 withUserInfo:v23];
            }
            else
            {
              uint64_t v29 = 0;
              id v30 = &v29;
              uint64_t v31 = 0x3032000000;
              id v32 = __Block_byref_object_copy_;
              id v33 = __Block_byref_object_dispose_;
              id v34 = 0;
              id v27 = v10;
              AXPerformSafeBlock();
              id v13 = (id)v30[5];

              _Block_object_dispose(&v29, 8);
              uint64_t v29 = 0;
              id v30 = &v29;
              uint64_t v31 = 0x3032000000;
              id v32 = __Block_byref_object_copy_;
              id v33 = __Block_byref_object_dispose_;
              id v34 = 0;
              id v14 = v27;
              AXPerformSafeBlock();
              id v15 = (id)v30[5];

              _Block_object_dispose(&v29, 8);
              if (v15)
              {
                uint64_t v29 = 0;
                id v30 = &v29;
                uint64_t v31 = 0x3032000000;
                id v32 = __Block_byref_object_copy_;
                id v33 = __Block_byref_object_dispose_;
                id v34 = 0;
                id v22 = v15;
                id v26 = v15;
                AXPerformSafeBlock();
                id v16 = (id)v30[5];

                _Block_object_dispose(&v29, 8);
                [(AXPhotosGroupAccessibilityElement *)self _axContainingGroup:v14 performedAction:4 withUserInfo:v16];
                id v17 = [(AXPhotosGroupAccessibilityElement *)self accessibilityValue];
                id v21 = [(AXPhotosGroupAccessibilityElement *)self accessibilityLabel];
                uint64_t v18 = __UIAXStringForVariables();

                UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v18);
                [(AXPhotosGroupAccessibilityElement *)self _axContainingGroup:v14, 3, v16, v21, @"__AXStringForVariablesSentinel" performedAction withUserInfo];

                id v15 = v22;
              }

              id v19 = v23;
            }
          }
        }
      }
    }
  }
}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) leaf];
  uint64_t v2 = PXGAXCreateActionUserInfo();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = __UIAccessibilityCastAsProtocol();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 axSpriteIndexClosestToSpriteIndex:*(unsigned int *)(a1 + 56) inDirection:*(void *)(a1 + 48)];
}

uint64_t __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_3(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) loadLeafAtSpriteIndexIfNeeded:*(unsigned int *)(a1 + 48) usingOptions:1];

  return MEMORY[0x270F9A758]();
}

uint64_t __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) loadedLeafAtSpriteIndex:*(unsigned int *)(a1 + 48)];

  return MEMORY[0x270F9A758]();
}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = __UIAccessibilityCastAsProtocol();
  uint64_t v3 = PXGAXCreateActionUserInfo();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_axCurrentLeafInStory
{
  uint64_t v2 = [(AXPhotosGroupAccessibilityElement *)self group];
  uint64_t v3 = [v2 safeArrayForKey:@"axLeafs"];

  uint64_t v4 = [v3 axFilterObjectsUsingBlock:&__block_literal_global_924];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

BOOL __58__AXPhotosGroupAccessibilityElement__axCurrentLeafInStory__block_invoke(uint64_t a1, void *a2)
{
  return [a2 safeUnsignedIntForKey:@"spriteIndex"] == 1001;
}

- (void)_axMoveStoryForInfoSource:(id)a3 inDirection:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AXPhotosGroupAccessibilityElement *)self _axCurrentLeafInStory];
  if (v7)
  {
    id v8 = [(AXPhotosGroupAccessibilityElement *)self group];
    uint64_t v9 = [v8 safeValueForKey:@"axInfoSource"];

    MEMORY[0x2455E3C60](v6);
    if (objc_opt_isKindOfClass())
    {
      int v10 = [v7 safeUnsignedIntForKey:@"spriteIndex"];
      uint64_t v19 = 0;
      id v20 = &v19;
      uint64_t v21 = 0x2020000000;
      LODWORD(v22) = 0;
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      id v27 = __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke;
      id v28 = &unk_2650A5F68;
      id v30 = &v19;
      id v11 = v9;
      int v32 = v10;
      id v29 = v11;
      unint64_t v31 = a4;
      AXPerformSafeBlock();
      int v12 = *((_DWORD *)v20 + 6);

      _Block_object_dispose(&v19, 8);
      if (v12 == -1)
      {
        UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], (id)*MEMORY[0x263F21918]);
      }
      else
      {
        uint64_t v19 = 0;
        id v20 = &v19;
        uint64_t v21 = 0x3032000000;
        id v22 = __Block_byref_object_copy_;
        id v23 = __Block_byref_object_dispose_;
        id v24 = 0;
        AXPerformSafeBlock();
        id v13 = (id)v20[5];
        _Block_object_dispose(&v19, 8);

        uint64_t v19 = 0;
        id v20 = &v19;
        uint64_t v21 = 0x3032000000;
        id v22 = __Block_byref_object_copy_;
        id v23 = __Block_byref_object_dispose_;
        id v24 = 0;
        AXPerformSafeBlock();
        id v14 = (id)v20[5];
        _Block_object_dispose(&v19, 8);

        if (v14)
        {
          uint64_t v19 = 0;
          id v20 = &v19;
          uint64_t v21 = 0x3032000000;
          id v22 = __Block_byref_object_copy_;
          id v23 = __Block_byref_object_dispose_;
          id v24 = 0;
          uint64_t v17 = MEMORY[0x263EF8330];
          id v18 = v14;
          AXPerformSafeBlock();
          id v15 = (id)v20[5];

          _Block_object_dispose(&v19, 8);
          id v16 = [(AXPhotosGroupAccessibilityElement *)self group];
          [(AXPhotosGroupAccessibilityElement *)self _axContainingGroup:v16 performedAction:4 withUserInfo:v15];
        }
      }
    }
  }
}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke(uint64_t a1)
{
  uint64_t v2 = __UIAccessibilityCastAsProtocol();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 axSpriteIndexClosestToSpriteIndex:*(unsigned int *)(a1 + 56) inDirection:*(void *)(a1 + 48)];
}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke_2(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) group];
  uint64_t v2 = [v5 loadLeafAtSpriteIndexIfNeeded:*(unsigned int *)(a1 + 48) usingOptions:1];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke_3(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) group];
  uint64_t v2 = [v5 loadedLeafAtSpriteIndex:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = __UIAccessibilityCastAsProtocol();
  uint64_t v3 = PXGAXCreateActionUserInfo();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_axRefreshGridGroupData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  id v6 = [v5 valueForKey:@"AXPhotosGridUpdateKey"];
  uint64_t v7 = [v6 integerValue];

  id v8 = [v4 userInfo];
  uint64_t v9 = [v8 valueForKey:@"AXPhotosGridGroupKey"];

  if (v7 == 8)
  {
    int v10 = [(AXPhotosGroupAccessibilityElement *)self group];

    if (v9 == v10)
    {
      [(AXPhotosGroupAccessibilityElement *)self _updateGroupAccessibilityElements];
      objc_opt_class();
      id v11 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
      int v12 = [v11 safeValueForKey:@"axVisibleSpriteIndexes"];
      id v13 = __UIAccessibilityCastAsClass();

      if ([v13 count])
      {
        id v14 = [(AXPhotosGroupAccessibilityElement *)self _axCachedLeafElements];
        id v15 = (void *)[v14 mutableCopy];

        [(AXPhotosGroupAccessibilityElement *)self _updateLeafAccessibilityElements:v15 forVisibleSpriteIndexes:v13];
      }
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
    }
  }
}

- (id)_accessibilityInfoSource
{
  uint64_t v2 = [(AXPhotosGroupAccessibilityElement *)self group];
  uint64_t v3 = [v2 safeValueForKey:@"_axInfoSource"];

  return v3;
}

- (BOOL)_axIsAssetSection
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axAssetsSectionLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxAssetsSectionLayoutClass:MEMORY[0x2455E3C60](@"PXAssetsSectionLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axAssetsSectionLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsChapterHeader
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryChapterHeaderLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxCuratedLibraryChapterHeaderLayoutClass:MEMORY[0x2455E3C60](@"PXCuratedLibraryChapterHeaderLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryChapterHeaderLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsSectionHeader
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axCuratedLibrarySectionHeaderLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxCuratedLibrarySectionHeaderLayoutClass:MEMORY[0x2455E3C60](@"PXCuratedLibrarySectionHeaderLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axCuratedLibrarySectionHeaderLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsDecorating
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axDecoratingLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxDecoratingLayoutClass:MEMORY[0x2455E3C60](@"PXGDecoratingLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axDecoratingLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsCardSectionBody
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryCardSectionBodyLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxCuratedLibraryCardSectionBodyLayoutClass:MEMORY[0x2455E3C60](@"PXCuratedLibraryCardSectionBodyLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryCardSectionBodyLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsInlineHeader
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axInlineHeadersSpriteLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxInlineHeadersSpriteLayoutClass:MEMORY[0x2455E3C60](@"PXInlineHeadersSpriteLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axInlineHeadersSpriteLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsGrid
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axGridLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxGridLayoutClass:MEMORY[0x2455E3C60](@"PXGGridLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axGridLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryColorGradeEditorItem
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryColorGradeEditorItemLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxStoryColorGradeEditorItemLayoutClass:MEMORY[0x2455E3C60](@"PhotosUIApps.PUStoryColorGradeEditorItemLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axStoryColorGradeEditorItemLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryColorGradeEditorItemOverlay
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryColorGradeEditorItemOverlayLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxStoryColorGradeEditorItemOverlayLayoutClass:MEMORY[0x2455E3C60](@"PUStoryColorGradeEditorItemOverlayLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axStoryColorGradeEditorItemOverlayLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxStoryLayoutClass:MEMORY[0x2455E3C60](@"PXStoryLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axStoryLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryThumbnailChromeLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryThumbnailChromeLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxStoryThumbnailChromeLayoutClass:MEMORY[0x2455E3C60](@"PXStoryThumbnailChromeLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axStoryThumbnailChromeLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryFullsizeLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryFullsizeLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxStoryFullsizeLayoutClass:MEMORY[0x2455E3C60](@"PXStoryFullsizeLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axStoryFullsizeLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryClipLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryClipLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxStoryClipLayoutClass:MEMORY[0x2455E3C60](@"PXStoryClipLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axStoryClipLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryTransitionLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryTransitionLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxStoryTransitionLayoutClass:MEMORY[0x2455E3C60](@"PXStoryTransitionLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axStoryTransitionLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsFeedContentLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axFeedContentLayoutClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxFeedContentLayoutClass:MEMORY[0x2455E3C60](@"PXFeedContentLayout")];
  }
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  [(AXPhotosGroupAccessibilityElement *)self _axFeedContentLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryScrubberContentLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryScrubberContentLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxStoryScrubberContentLayoutClass:MEMORY[0x2455E3C60](@"PXStoryScrubberContentLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axStoryScrubberContentLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryStyleSwitchingFullsizeLayout
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryStyleSwitchingFullsizeLayoutClass])[(AXPhotosGroupAccessibilityElement *)self _setAxStoryStyleSwitchingFullsizeLayoutClass:MEMORY[0x2455E3C60](@"PXStoryStyleSwitchingFullsizeLayout")]; {
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  }
  [(AXPhotosGroupAccessibilityElement *)self _axStoryStyleSwitchingFullsizeLayoutClass];
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axInZoomLevel:(int64_t)a3
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axIsAssetSection]) {
    return 0;
  }
  id v5 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInfoSource];
  BOOL v6 = [v5 safeIntegerForKey:@"zoomLevel"] == a3;

  return v6;
}

- (BOOL)_axIsMonthsView
{
  return [(AXPhotosGroupAccessibilityElement *)self _axInZoomLevel:2];
}

- (BOOL)_axIsYearsView
{
  return [(AXPhotosGroupAccessibilityElement *)self _axInZoomLevel:1];
}

- (BOOL)_axIsDaysView
{
  return [(AXPhotosGroupAccessibilityElement *)self _axInZoomLevel:3];
}

- (BOOL)_axInAllPhotosView
{
  return [(AXPhotosGroupAccessibilityElement *)self _axInZoomLevel:4];
}

- (id)_axStoryColorGradeLeafElement
{
  uint64_t v2 = [(AXPhotosGroupAccessibilityElement *)self _axGroupsAccessibilityElements];
  uint64_t v3 = [v2 axFilterObjectsUsingBlock:&__block_literal_global_936];
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    id v5 = v4;
    if (v4)
    {
      BOOL v6 = [v4 _axLeafAccessibilityElements];
      if ([v6 count])
      {
        uint64_t v7 = [v6 firstObject];
      }
      else
      {
        uint64_t v7 = 0;
      }

      goto LABEL_9;
    }
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v7 = 0;
LABEL_9:

  return v7;
}

uint64_t __66__AXPhotosGroupAccessibilityElement__axStoryColorGradeLeafElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _axIsStoryColorGradeEditorItemOverlay];
}

- (id)_accessibilityCuratedLibraryUIViewController
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryUIViewControllerClass])[(AXPhotosGroupAccessibilityElement *)self _setAxCuratedLibraryUIViewControllerClass:MEMORY[0x2455E3C60](@"PXCuratedLibraryUIViewController")]; {
  if ([(AXPhotosGroupAccessibilityElement *)self _axCuratedLibraryUIViewControllerClass])
  }
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __81__AXPhotosGroupAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke;
    v6[3] = &unk_2650A5FF8;
    v6[4] = self;
    uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityFindAncestor:v6 startWithSelf:1];
    id v4 = [v3 _accessibilityViewController];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __81__AXPhotosGroupAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 _accessibilityViewController];
  [*(id *)(a1 + 32) _axCuratedLibraryUIViewControllerClass];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (id)_accessibilityFeedViewController
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axFeedViewControllerClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxFeedViewControllerClass:MEMORY[0x2455E3C60](@"PXFeedViewController")];
  }
  if ([(AXPhotosGroupAccessibilityElement *)self _axFeedViewControllerClass])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __69__AXPhotosGroupAccessibilityElement__accessibilityFeedViewController__block_invoke;
    v6[3] = &unk_2650A5FF8;
    v6[4] = self;
    uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityFindAncestor:v6 startWithSelf:1];
    id v4 = [v3 _accessibilityViewController];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __69__AXPhotosGroupAccessibilityElement__accessibilityFeedViewController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 _accessibilityViewController];
  [*(id *)(a1 + 32) _axFeedViewControllerClass];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (BOOL)_accessibilityInStoryViewController
{
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryViewControllerClass]) {
    [(AXPhotosGroupAccessibilityElement *)self _setAxStoryViewControllerClass:MEMORY[0x2455E3C60](@"PUXStoryViewController")];
  }
  if (![(AXPhotosGroupAccessibilityElement *)self _axStoryViewControllerClass]) {
    return 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __72__AXPhotosGroupAccessibilityElement__accessibilityInStoryViewController__block_invoke;
  v7[3] = &unk_2650A5FF8;
  v7[4] = self;
  uint64_t v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityFindAncestor:v7 startWithSelf:1];
  id v4 = [v3 _accessibilityViewController];
  BOOL v5 = v4 != 0;

  return v5;
}

uint64_t __72__AXPhotosGroupAccessibilityElement__accessibilityInStoryViewController__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 _accessibilityViewController];
  [*(id *)(a1 + 32) _axStoryViewControllerClass];
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (BOOL)_axIsMemoriesScrubberInStoryViewController
{
  BOOL v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInStoryViewController];
  if (v3)
  {
    LOBYTE(v3) = [(AXPhotosGroupAccessibilityElement *)self _axIsStoryScrubberContentLayout];
  }
  return v3;
}

- (BOOL)_axIsMemoriesStyleSwitcherInStoryViewController
{
  BOOL v3 = [(AXPhotosGroupAccessibilityElement *)self _accessibilityInStoryViewController];
  if (v3)
  {
    LOBYTE(v3) = [(AXPhotosGroupAccessibilityElement *)self _axIsStoryStyleSwitchingFullsizeLayout];
  }
  return v3;
}

- (id)_axFilterStaleKeys:(id)a3 usingIndexSet:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F089C8] indexSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue", (void)v14));
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [v7 removeIndexes:v6];

  return v7;
}

- (int64_t)_axCompareAXPhotoElement:(id)a3 toElement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass())
    && ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass()) {
      goto LABEL_28;
    }
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass()) {
      goto LABEL_26;
    }
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v5 leaf];
      unsigned int v8 = [v7 safeUnsignedIntForKey:@"spriteIndex"];

      uint64_t v9 = [v6 leaf];
      unsigned int v10 = [v9 safeUnsignedIntForKey:@"spriteIndex"];

      if (v8 == v10)
      {
LABEL_17:
        _AXAssert();
        unsigned int v10 = v8;
      }
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:
        [v5 accessibilityFrame];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;
        [v6 accessibilityFrame];
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        v35.origin.CGFloat x = v15;
        v35.origin.CGFloat y = v17;
        v35.size.double width = v19;
        v35.size.double height = v21;
        double MinX = CGRectGetMinX(v35);
        v36.origin.CGFloat x = v23;
        v36.origin.CGFloat y = v25;
        v36.size.double width = v27;
        v36.size.double height = v29;
        double v33 = CGRectGetMinX(v36);
        v37.origin.CGFloat x = v15;
        v37.origin.CGFloat y = v17;
        v37.size.double width = v19;
        v37.size.double height = v21;
        double MinY = CGRectGetMinY(v37);
        v38.origin.CGFloat x = v23;
        v38.origin.CGFloat y = v25;
        v38.size.double width = v27;
        v38.size.double height = v29;
        double v31 = CGRectGetMinY(v38);
        if (MinX >= v33) {
          int64_t v11 = MinX > v33;
        }
        else {
          int64_t v11 = -1;
        }
        if (MinY < v31) {
          goto LABEL_26;
        }
        if (MinY <= v31) {
          goto LABEL_29;
        }
LABEL_28:
        int64_t v11 = 1;
        goto LABEL_29;
      }
      int v12 = [v5 group];
      unsigned int v8 = [v12 safeUnsignedIntForKey:@"subgroupIndex"];

      id v13 = [v6 group];
      unsigned int v10 = [v13 safeUnsignedIntForKey:@"subgroupIndex"];

      if (v8 == v10) {
        goto LABEL_17;
      }
    }
    if (v8 != -1 && v10 != -1)
    {
      if (v8 >= v10)
      {
        int64_t v11 = v8 > v10;
        goto LABEL_29;
      }
LABEL_26:
      int64_t v11 = -1;
      goto LABEL_29;
    }
    goto LABEL_22;
  }
  int64_t v11 = [v5 accessibilityCompareGeometry:v6];
LABEL_29:

  return v11;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  return 0;
}

- (id)group
{
  id WeakRetained = objc_loadWeakRetained(&self->_group);

  return WeakRetained;
}

- (void)setGroup:(id)a3
{
}

- (id)view
{
  id WeakRetained = objc_loadWeakRetained(&self->_view);

  return WeakRetained;
}

- (void)setView:(id)a3
{
}

- (id)additionalScrollViewElements
{
  return self->_additionalScrollViewElements;
}

- (void)setAdditionalScrollViewElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalScrollViewElements, 0);
  objc_destroyWeak(&self->_view);

  objc_destroyWeak(&self->_group);
}

@end