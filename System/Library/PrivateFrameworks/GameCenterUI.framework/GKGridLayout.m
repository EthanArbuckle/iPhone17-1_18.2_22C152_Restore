@interface GKGridLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)_areWePortrait;
- (BOOL)displayClipView;
- (BOOL)displayingOverlay;
- (BOOL)hideAboveSegmentOnAppear;
- (BOOL)hideSearchBarOnAppear;
- (BOOL)ignoreBoundsForSizeCalculation;
- (BOOL)movedItemsInUpdateCarrySections;
- (BOOL)noMoreShowMore;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldLayoutRTL;
- (BOOL)shouldSlideInSupplementaryElementOfKind:(id)a3 forUpdateItem:(id)a4 atIndexPath:(id)a5;
- (BOOL)shouldSlideOutSupplementaryElementOfKind:(id)a3 forUpdateItem:(id)a4 atIndexPath:(id)a5;
- (BOOL)shouldUpdateVisibleCellLayoutAttributes;
- (BOOL)showPlaceholder;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result withScrollingVelocity:(CGPoint)a4;
- (CGRect)layoutBounds;
- (CGSize)_sizeAdjustedForTabBarSettingsBasedOnSize:(CGSize)a3;
- (CGSize)collectionViewContentSize;
- (CGSize)laidOutContentSize;
- (CGSize)minimumLaidOutContentSize;
- (CGSize)oldLaidOutContentSize;
- (GKCollectionViewDataSource)dataSourceForUpdate;
- (GKCollectionViewLayoutAttributes)clipViewAttributes;
- (GKDataSourceMetrics)dataSourceMetrics;
- (GKGridLayout)init;
- (GKSectionMetrics)defaultSectionMetricsInternal;
- (NSArray)currentUpdateItems;
- (NSIndexPath)indexPathOfTouchedShowMore;
- (NSMutableArray)laidOutAttributes;
- (NSMutableDictionary)indexPathToDecoration;
- (NSMutableDictionary)indexPathToItem;
- (NSMutableDictionary)indexPathToMetrics;
- (NSMutableDictionary)indexPathToSupplementary;
- (NSMutableDictionary)keyToMetricData;
- (NSMutableDictionary)oldIndexPathToDecoration;
- (NSMutableDictionary)oldIndexPathToItem;
- (NSMutableDictionary)oldIndexPathToSupplementary;
- (NSMutableDictionary)oldSectionToMetricKeys;
- (NSMutableIndexSet)sectionsWithPinnedHeaders;
- (NSMutableOrderedSet)laidOutPinnableAttributes;
- (NSMutableSet)knownSupplementaryKinds;
- (NSMutableSet)revealedIndexPaths;
- (NSPointerArray)sectionToMetricData;
- (NSPointerArray)sectionToPresentationData;
- (NSSet)visibleIndexPathsFilter;
- (double)applyBottomPinningToAttributes:(id)a3 minY:(double)a4 maxY:(double)a5;
- (double)applyTopPinningToAttributes:(id)a3 minY:(double)a4 maxY:(double)a5;
- (double)bottomContentPadding;
- (double)calculatedBottomPaddingForSection:(int64_t)a3;
- (double)hiddenSearchBarOffset;
- (double)layoutBottomPinningAttributes:(id)a3 minY:(double)a4 maxY:(double)a5;
- (double)layoutTopPinningAttributes:(id)a3 minY:(double)a4 maxY:(double)a5;
- (double)leftLayoutGuideOffset;
- (double)rightLayoutGuideOffset;
- (double)scale;
- (double)segmentedBoxY;
- (double)segmentedHeaderPinningOffset;
- (double)yOffsetForSection:(int64_t)a3;
- (double)yOffsetForSlidingUpdate;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)_existingPresentationDataForSection:(int64_t)a3;
- (id)_gkDescriptionWithChildren:(int64_t)a3;
- (id)attributesForSupplementaryIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)finalLayoutAttributesForSlidingAwayItemAtIndexPath:(id)a3;
- (id)firstVisibleIndexAtOrAfterItem:(int64_t)a3 itemCount:(int64_t)a4 inSection:(int64_t)a5;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForSlidingInItemAtIndexPath:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)metricDataForKey:(id)a3;
- (id)metricDataForSection:(int64_t)a3;
- (id)metricsForSection:(int64_t)a3;
- (id)presentationDataForSection:(int64_t)a3;
- (id)revealMoreForSectionIndex:(int64_t)a3;
- (id)revealMoreForSectionIndex:(int64_t)a3 revealCount:(unint64_t)a4 andDeleteItemCount:(unint64_t)a5;
- (int64_t)_prepareOverlayLayoutForSection:(int64_t)a3 offset:(int64_t)a4;
- (int64_t)_prepareSupplementaryLayoutForSection:(int64_t)a3 atLocation:(unint64_t)a4 offset:(int64_t)a5 globalOffset:(int64_t *)a6;
- (int64_t)indexOfSupplementaryMetricsOfKind:(id)a3 inList:(id)a4;
- (int64_t)metricsInvalidationCount;
- (int64_t)searchResultsCount;
- (unint64_t)_prepareItemLayoutForSection:(int64_t)a3;
- (unint64_t)currentMaxVisibleItemCountForSection:(int64_t)a3;
- (unint64_t)filteredTotalItemCountForSection:(int64_t)a3;
- (unint64_t)invalidationFlags;
- (unint64_t)landscapeInterleavedSectionsCount;
- (unint64_t)portraitInterleavedSectionsCount;
- (unint64_t)sectionsPerRow;
- (unint64_t)updateType;
- (void)_filterPinnedAttributes;
- (void)_prepareSegmentedBoxLayoutWithOffset:(int64_t)a3;
- (void)_resetState;
- (void)calculateCollectionViewContentSize;
- (void)disableClipView;
- (void)enableClipView;
- (void)enumerateSectionsIndexesOverlappingYOffset:(double)a3 block:(id)a4;
- (void)finalizeAnimatedBoundsChange;
- (void)finalizeCollectionViewUpdates;
- (void)finalizeGlobalPresentationDataWithSectionRange:(_NSRange)a3;
- (void)finalizePinnedAttributes:(id)a3 forSection:(int64_t)a4 footer:(BOOL)a5;
- (void)forceFullInvalidate;
- (void)fullyRebuildLayout;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForAnimatedBoundsChange:(CGRect)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareForMovingItemsCarryingSections;
- (void)prepareForUpdate:(unint64_t)a3 inDataSource:(id)a4;
- (void)prepareLayout;
- (void)refreshMetrics;
- (void)setBottomContentPadding:(double)a3;
- (void)setClipViewAttributes:(id)a3;
- (void)setCurrentUpdateItems:(id)a3;
- (void)setDataSourceForUpdate:(id)a3;
- (void)setDataSourceMetrics:(id)a3;
- (void)setDefaultSectionMetricsInternal:(id)a3;
- (void)setDisplayClipView:(BOOL)a3;
- (void)setDisplayingOverlay:(BOOL)a3;
- (void)setHiddenSearchBarOffset:(double)a3;
- (void)setHideAboveSegmentOnAppear:(BOOL)a3;
- (void)setHideSearchBarOnAppear:(BOOL)a3;
- (void)setIgnoreBoundsForSizeCalculation:(BOOL)a3;
- (void)setIndexPathOfTouchedShowMore:(id)a3;
- (void)setIndexPathToDecoration:(id)a3;
- (void)setIndexPathToItem:(id)a3;
- (void)setIndexPathToMetrics:(id)a3;
- (void)setIndexPathToSupplementary:(id)a3;
- (void)setInvalidationFlags:(unint64_t)a3;
- (void)setKeyToMetricData:(id)a3;
- (void)setKnownSupplementaryKinds:(id)a3;
- (void)setLaidOutAttributes:(id)a3;
- (void)setLaidOutContentSize:(CGSize)a3;
- (void)setLaidOutPinnableAttributes:(id)a3;
- (void)setLandscapeInterleavedSectionsCount:(unint64_t)a3;
- (void)setLeftLayoutGuideOffset:(double)a3;
- (void)setMetricData:(id)a3 forSection:(int64_t)a4;
- (void)setMetricsInvalidationCount:(int64_t)a3;
- (void)setMinimumLaidOutContentSize:(CGSize)a3;
- (void)setMovedItemsInUpdateCarrySections:(BOOL)a3;
- (void)setNoMoreShowMore:(BOOL)a3;
- (void)setOldIndexPathToDecoration:(id)a3;
- (void)setOldIndexPathToItem:(id)a3;
- (void)setOldIndexPathToSupplementary:(id)a3;
- (void)setOldLaidOutContentSize:(CGSize)a3;
- (void)setOldSectionToMetricKeys:(id)a3;
- (void)setPortraitInterleavedSectionsCount:(unint64_t)a3;
- (void)setRevealedIndexPaths:(id)a3;
- (void)setRightLayoutGuideOffset:(double)a3;
- (void)setSectionToMetricData:(id)a3;
- (void)setSectionToPresentationData:(id)a3;
- (void)setSectionsWithPinnedHeaders:(id)a3;
- (void)setSegmentedBoxY:(double)a3;
- (void)setSegmentedHeaderPinningOffset:(double)a3;
- (void)setShouldLayoutRTL:(BOOL)a3;
- (void)setShowPlaceholder:(BOOL)a3;
- (void)setUpdateType:(unint64_t)a3;
- (void)setVisibleIndexPathsFilter:(id)a3;
- (void)updatePinnableAreas;
- (void)updatePlaceholderVisibility;
- (void)updatePresentationDataForLastInterleavedSections;
- (void)updatePresentationDataInSection:(int64_t)a3 withAttributes:(id)a4 supplementaryLocation:(unint64_t)a5;
@end

@implementation GKGridLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (GKGridLayout)init
{
  v36.receiver = self;
  v36.super_class = (Class)GKGridLayout;
  v2 = [(GKGridLayout *)&v36 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:0];
    sectionToMetricData = v2->_sectionToMetricData;
    v2->_sectionToMetricData = (NSPointerArray *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:0];
    sectionToPresentationData = v2->_sectionToPresentationData;
    v2->_sectionToPresentationData = (NSPointerArray *)v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyToMetricData = v2->_keyToMetricData;
    v2->_keyToMetricData = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    laidOutAttributes = v2->_laidOutAttributes;
    v2->_laidOutAttributes = v9;

    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    laidOutPinnableAttributes = v2->_laidOutPinnableAttributes;
    v2->_laidOutPinnableAttributes = v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    sectionsWithPinnedHeaders = v2->_sectionsWithPinnedHeaders;
    v2->_sectionsWithPinnedHeaders = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexPathToSupplementary = v2->_indexPathToSupplementary;
    v2->_indexPathToSupplementary = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexPathToDecoration = v2->_indexPathToDecoration;
    v2->_indexPathToDecoration = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexPathToItem = v2->_indexPathToItem;
    v2->_indexPathToItem = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    oldIndexPathToSupplementary = v2->_oldIndexPathToSupplementary;
    v2->_oldIndexPathToSupplementary = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    oldIndexPathToDecoration = v2->_oldIndexPathToDecoration;
    v2->_oldIndexPathToDecoration = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    oldIndexPathToItem = v2->_oldIndexPathToItem;
    v2->_oldIndexPathToItem = v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    revealedIndexPaths = v2->_revealedIndexPaths;
    v2->_revealedIndexPaths = v27;

    v2->_portraitInterleavedSectionsCount = 1;
    v2->_landscapeInterleavedSectionsCount = 1;
    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    indexPathToMetrics = v2->_indexPathToMetrics;
    v2->_indexPathToMetrics = v29;

    v31 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    knownSupplementaryKinds = v2->_knownSupplementaryKinds;
    v2->_knownSupplementaryKinds = v31;

    v2->_updateType = 6;
    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    oldSectionToMetricKeys = v2->_oldSectionToMetricKeys;
    v2->_oldSectionToMetricKeys = v33;

    v2->_bottomContentPadding = 21.0;
    v2->_shouldLayoutRTL = GKShouldLayoutRTL();
  }
  return v2;
}

- (double)scale
{
  v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (CGRect)layoutBounds
{
  v2 = [(GKGridLayout *)self collectionView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  unsigned __int8 v11 = GKShouldLayoutRTL();
  if (v4 < 0.0) {
    unsigned __int8 v12 = v11;
  }
  else {
    unsigned __int8 v12 = 0;
  }
  double v13 = 0.0;
  if ((v12 & (v8 + v4 == 0.0)) == 0) {
    double v13 = v4;
  }
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setUpdateType:(unint64_t)a3
{
  unint64_t updateType = self->_updateType;
  if (updateType != a3)
  {
    if (updateType != 6 && a3 != 3 && a3 != 6)
    {
      double v8 = NSString;
      double v9 = [NSNumber numberWithUnsignedInteger:a3];
      double v10 = [NSNumber numberWithUnsignedInteger:self->_updateType];
      unsigned __int8 v11 = [v8 stringWithFormat:@"Multiple update types attempted for the same collection view update loop (%@ vs %@)", v9, v10];
      unsigned __int8 v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m"];
      id v13 = [v12 lastPathComponent];
      double v14 = [v8 stringWithFormat:@"%@ (_updateType == GKGridLayoutUpdateInvalid || updateType == GKGridLayoutUpdateInvalid || updateType == GKGridLayoutUpdateRotation)\n[%s (%s:%d)]", v11, "-[GKGridLayout setUpdateType:]", objc_msgSend(v13, "UTF8String"), 378];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v14 format];
    }
    self->_unint64_t updateType = a3;
  }
}

- (id)_gkDescriptionWithChildren:(int64_t)a3
{
  double v5 = _gkTabStringForTabLevel();
  double v6 = [MEMORY[0x1E4F28E78] string];
  v28.receiver = self;
  v28.super_class = (Class)GKGridLayout;
  double v7 = [(GKGridLayout *)&v28 description];
  [v6 appendFormat:@"%@%@ {\n", v5, v7];

  dataSourceMetrics = self->_dataSourceMetrics;
  if (dataSourceMetrics)
  {
    double v9 = NSString;
    double v10 = [(GKDataSourceMetrics *)dataSourceMetrics _gkDescriptionWithChildren:a3 + 2];
    unsigned __int8 v11 = [v9 stringWithFormat:@"    %@dataSourceMetrics: {\n%@", v5, v10];
    [v6 appendString:v11];

    unsigned __int8 v12 = [NSString stringWithFormat:@"%@    }\n", v5];
    [v6 appendString:v12];
  }
  id v13 = [(GKGridLayout *)self collectionView];
  uint64_t v14 = [v13 numberOfSections];

  if (v14)
  {
    double v15 = [NSString stringWithFormat:@"    %@----------\n", v5];
    [v6 appendString:v15];

    double v16 = [NSString stringWithFormat:@"    %@metricData: {\n", v5];
    [v6 appendString:v16];

    uint64_t v17 = 0;
    int64_t v18 = a3 + 2;
    do
    {
      v19 = [(GKGridLayout *)self metricDataForSection:v17];
      v20 = [v19 _gkDescriptionWithChildren:v18];
      v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      v22 = [v20 stringByTrimmingCharactersInSet:v21];

      v23 = [NSNumber numberWithInteger:v17];
      v24 = [v19 layoutKey];
      [v6 appendFormat:@"        %@%@ - %@ - %@", v5, v23, v24, v22];

      ++v17;
    }
    while (v14 != v17);
    v25 = [NSString stringWithFormat:@"    %@}\n", v5];
    [v6 appendString:v25];
  }
  v26 = [NSString stringWithFormat:@"%@}\n", v5];
  [v6 appendString:v26];

  return v6;
}

- (id)metricDataForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMutableDictionary *)self->_keyToMetricData objectForKeyedSubscript:v4];
  if (!v5)
  {
    double v5 = objc_alloc_init(GKMetricData);
    [(NSMutableDictionary *)self->_keyToMetricData setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)metricDataForSection:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = a3 + 1;
  }
  NSUInteger v5 = [(NSPointerArray *)self->_sectionToMetricData count];
  double v6 = 0;
  if (v4 < v5)
  {
    double v6 = [(NSPointerArray *)self->_sectionToMetricData pointerAtIndex:v4];
  }

  return v6;
}

- (unint64_t)filteredTotalItemCountForSection:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  visibleIndexPathsFilter = self->_visibleIndexPathsFilter;
  if (!visibleIndexPathsFilter) {
    return -1;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  NSUInteger v5 = visibleIndexPathsFilter;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "section", (void)v12) == a3) {
          ++v8;
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)setMetricData:(id)a3 forSection:(int64_t)a4
{
  id v7 = a3;
  objc_msgSend(v7, "setFilteredTotalItemCount:", -[GKGridLayout filteredTotalItemCountForSection:](self, "filteredTotalItemCountForSection:", a4));
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = a4 + 1;
  }
  if ((int64_t)[(NSPointerArray *)self->_sectionToMetricData count] <= v6) {
    [(NSPointerArray *)self->_sectionToMetricData setCount:v6 + 1];
  }
  [(NSPointerArray *)self->_sectionToMetricData replacePointerAtIndex:v6 withPointer:v7];
}

- (id)attributesForSupplementaryIndexPath:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_indexPathToSupplementary objectForKeyedSubscript:a3];
}

- (void)setPortraitInterleavedSectionsCount:(unint64_t)a3
{
  if (!a3)
  {
    NSUInteger v5 = NSString;
    int64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m"];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [v5 stringWithFormat:@"%@ (portraitInterleavedSectionsCount > 0)\n[%s (%s:%d)]", v6, "-[GKGridLayout setPortraitInterleavedSectionsCount:]", objc_msgSend(v8, "UTF8String"), 472];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  self->_portraitInterleavedSectionsCount = a3;
}

- (void)setLandscapeInterleavedSectionsCount:(unint64_t)a3
{
  if (!a3)
  {
    NSUInteger v5 = NSString;
    int64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m"];
    id v8 = [v7 lastPathComponent];
    uint64_t v9 = [v5 stringWithFormat:@"%@ (landscapeInterleavedSectionsCount > 0)\n[%s (%s:%d)]", v6, "-[GKGridLayout setLandscapeInterleavedSectionsCount:]", objc_msgSend(v8, "UTF8String"), 478];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  self->_landscapeInterleavedSectionsCount = a3;
}

- (GKSectionMetrics)defaultSectionMetricsInternal
{
  defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  if (!defaultSectionMetricsInternal)
  {
    unint64_t v4 = +[GKGridLayoutMetrics metrics];
    [(GKGridLayout *)self setDefaultSectionMetricsInternal:v4];

    defaultSectionMetricsInternal = self->_defaultSectionMetricsInternal;
  }

  return defaultSectionMetricsInternal;
}

- (id)metricsForSection:(int64_t)a3
{
  double v3 = [(GKGridLayout *)self metricDataForSection:a3];
  unint64_t v4 = [v3 sectionMetrics];

  return v4;
}

- (int64_t)searchResultsCount
{
  visibleIndexPathsFilter = self->_visibleIndexPathsFilter;
  if (visibleIndexPathsFilter) {
    return [(NSSet *)visibleIndexPathsFilter count];
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)updatePlaceholderVisibility
{
  BOOL v3 = self->_showPlaceholder || [(GKGridLayout *)self searchResultsCount] == 0;
  self->_displayingOverlay = v3;
}

- (void)setVisibleIndexPathsFilter:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_visibleIndexPathsFilter != (NSSet *)v5)
  {
    uint64_t v7 = v5;
    uint64_t v5 = objc_msgSend((id)v5, "isEqual:");
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_visibleIndexPathsFilter, a3);
      [(GKGridLayout *)self updatePlaceholderVisibility];
      uint64_t v5 = [(GKGridLayout *)self invalidateLayout];
      uint64_t v6 = v7;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setLeftLayoutGuideOffset:(double)a3
{
  if (self->_leftLayoutGuideOffset != a3)
  {
    self->_leftLayoutGuideOffset = a3;
    [(GKGridLayout *)self invalidateLayout];
  }
}

- (void)setRightLayoutGuideOffset:(double)a3
{
  if (self->_rightLayoutGuideOffset != a3)
  {
    self->_rightLayoutGuideOffset = a3;
    [(GKGridLayout *)self invalidateLayout];
  }
}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (self->_showPlaceholder != a3)
  {
    self->_showPlaceholder = a3;
    [(GKGridLayout *)self updatePlaceholderVisibility];
    unint64_t v4 = objc_alloc_init(GKGridLayoutInvalidationContext);
    [(GKGridLayoutInvalidationContext *)v4 setInvalidatePlaceholderVisibility:1];
    [(GKGridLayout *)self invalidateLayoutWithContext:v4];
  }
}

- (CGSize)_sizeAdjustedForTabBarSettingsBasedOnSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  [(GKGridLayout *)self layoutBounds];
  double v7 = v6;
  id v8 = [(GKGridLayout *)self collectionView];
  [v8 contentInset];
  double v10 = v9;
  double v12 = v11;

  double hiddenSearchBarOffset = self->_hiddenSearchBarOffset;
  if (hiddenSearchBarOffset < self->_segmentedHeaderPinningOffset) {
    double hiddenSearchBarOffset = self->_segmentedHeaderPinningOffset;
  }
  double v14 = v7 - v10 - v12 + hiddenSearchBarOffset;
  if (height + self->_bottomContentPadding >= v14 || self->_ignoreBoundsForSizeCalculation) {
    double v14 = height + self->_bottomContentPadding;
  }
  double v16 = width;
  result.double height = v14;
  result.CGFloat width = v16;
  return result;
}

- (void)calculateCollectionViewContentSize
{
  BOOL v3 = (CGFloat *)MEMORY[0x1E4F1DB28];
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v6 = self->_laidOutAttributes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    CGFloat x = *v3;
    CGFloat y = v3[1];
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "isHidden", (void)v20) & 1) == 0)
        {
          [v13 frame];
          v28.origin.CGFloat x = v14;
          v28.origin.CGFloat y = v15;
          v28.size.double width = v16;
          v28.size.double height = v17;
          v26.origin.CGFloat x = x;
          v26.origin.CGFloat y = y;
          v26.size.double width = width;
          v26.size.double height = height;
          CGRect v27 = CGRectUnion(v26, v28);
          CGFloat x = v27.origin.x;
          CGFloat y = v27.origin.y;
          double width = v27.size.width;
          double height = v27.size.height;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  self->_oldLaidOutContentSize = self->_laidOutContentSize;
  self->_minimumLaidOutContentSize.double width = width;
  self->_minimumLaidOutContentSize.double height = height;
  -[GKGridLayout _sizeAdjustedForTabBarSettingsBasedOnSize:](self, "_sizeAdjustedForTabBarSettingsBasedOnSize:", width, height);
  self->_laidOutContentSize.double width = v18;
  self->_laidOutContentSize.double height = v19;
}

- (CGSize)collectionViewContentSize
{
  double width = self->_laidOutContentSize.width;
  double height = self->_laidOutContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result
{
  CGFloat x = result.x;
  if (self->_hideSearchBarOnAppear || self->_hideAboveSegmentOnAppear)
  {
    [(GKGridLayout *)self layoutBounds];
    double v6 = v5;
    uint64_t v7 = [(GKGridLayout *)self collectionView];
    [v7 contentInset];
    double v9 = v8;

    double v10 = v6;
    if (self->_hideSearchBarOnAppear) {
      double v10 = self->_hiddenSearchBarOffset - v9;
    }
    double v11 = v6;
    if (self->_hideAboveSegmentOnAppear) {
      double v11 = self->_segmentedHeaderPinningOffset - v9;
    }
    if (v10 < v11) {
      double v10 = v11;
    }
    if (v10 >= v6) {
      result.CGFloat y = v10;
    }
    else {
      result.CGFloat y = v6;
    }
  }
  double v12 = x;
  result.CGFloat x = v12;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)result withScrollingVelocity:(CGPoint)a4
{
  self->_hideSearchBarOnAppear = 0;
  self->_hideAboveSegmentOnAppear = 0;
  return result;
}

- (void)refreshMetrics
{
  BOOL v3 = [(GKGridLayout *)self collectionView];
  id v5 = [v3 dataSource];

  if (!self->_metricsInvalidationCount)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      ++self->_metricsInvalidationCount;
      unint64_t v4 = [v5 createMetricsTreeWithGridLayout:self];
      [(GKGridLayout *)self setDataSourceMetrics:v4];
      --self->_metricsInvalidationCount;
    }
  }
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [v4 invalidateDataSourceCounts];
  int v6 = [v4 invalidateEverything];
  char v7 = [v4 invalidateBoundsChange];
  int v8 = [v4 invalidatePlaceholderVisibility];
  int v9 = [v4 invalidatePinnableAreas];
  if ((v5 & 1) == 0 && (v6 & 1) == 0 && (v7 & 1) == 0 && (v8 & 1) == 0 && !v9)
  {
    uint64_t v10 = 0xFFFFFFFFFFFFLL;
LABEL_16:
    self->_invalidationFlags |= v10;
    goto LABEL_17;
  }
  if (v5)
  {
    self->_invalidationFlags |= 0xFFFFFFFFFFFFuLL;
    if (!v6)
    {
LABEL_9:
      if (!v8) {
        goto LABEL_10;
      }
LABEL_14:
      self->_invalidationFlags |= 4uLL;
      if (!v9) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  else if (!v6)
  {
    goto LABEL_9;
  }
  self->_invalidationFlags |= 0xFFFFFFFFFFFFuLL;
  if (v8) {
    goto LABEL_14;
  }
LABEL_10:
  if (v9)
  {
LABEL_15:
    uint64_t v10 = 8;
    goto LABEL_16;
  }
LABEL_17:
  v11.receiver = self;
  v11.super_class = (Class)GKGridLayout;
  [(GKGridLayout *)&v11 invalidateLayoutWithContext:v4];

  if ((self->_invalidationFlags & 5) != 0) {
    [(GKGridLayout *)self refreshMetrics];
  }
}

- (void)updatePinnableAreas
{
  [(GKGridLayout *)self _filterPinnedAttributes];
  BOOL v3 = objc_alloc_init(GKGridLayoutInvalidationContext);
  [(GKGridLayoutInvalidationContext *)v3 setInvalidatePinnableAreas:1];
  [(GKGridLayout *)self invalidateLayoutWithContext:v3];
}

- (void)enableClipView
{
  self->_displayClipView = 1;
  [(UICollectionViewLayoutAttributes *)self->_clipViewAttributes setHidden:0];
}

- (void)disableClipView
{
  self->_displayClipView = 0;
  [(UICollectionViewLayoutAttributes *)self->_clipViewAttributes setHidden:1];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (BOOL)shouldUpdateVisibleCellLayoutAttributes
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(GKGridLayout *)self layoutBounds];
  if (v9 != width || v8 != height) {
    self->_invalidationFlags |= 2uLL;
  }
  v13.receiver = self;
  v13.super_class = (Class)GKGridLayout;
  objc_super v11 = -[GKGridLayout invalidationContextForBoundsChange:](&v13, sel_invalidationContextForBoundsChange_, x, y, width, height);
  [v11 setInvalidateBoundsChange:1];

  return v11;
}

- (void)forceFullInvalidate
{
  self->_invalidationFlags |= 0xFFFFFFFFFFFFuLL;
  id v2 = [(GKGridLayout *)self collectionView];
  [v2 reloadData];
}

- (double)calculatedBottomPaddingForSection:(int64_t)a3
{
  double v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v6 = -[GKGridLayout metricsForSection:](self, "metricsForSection:");
    [v6 padding];
    double v3 = v7;
    if ([v6 incrementalRevealConsumesPadding])
    {
      double v8 = [v6 listForLocation:1];
      int64_t v9 = [(GKGridLayout *)self indexOfSupplementaryMetricsOfKind:@"IncrementalReveal" inList:v8];
      uint64_t v10 = [(GKGridLayout *)self metricDataForSection:a3];
      objc_super v11 = [(GKGridLayout *)self collectionView];
      unint64_t v12 = [v11 numberOfItemsInSection:a3];

      unint64_t v13 = [v10 filteredTotalItemCount];
      if (v12 >= v13) {
        unint64_t v12 = v13;
      }
      if (v12 > [v10 currentMaxVisibleItemCount]
        && [v6 incrementalRevealItemCount]
        && v9 != 0x7FFFFFFFFFFFFFFFLL)
      {
        CGFloat v14 = [v8 objectAtIndexedSubscript:v9];
        [v14 desiredHeight];
        double v3 = (double)((int)(v3 - v15) & ~((int)(v3 - v15) >> 31));
      }
    }
  }
  return v3;
}

- (void)updatePresentationDataForLastInterleavedSections
{
  unint64_t v3 = [(GKGridLayout *)self sectionsPerRow];
  id v4 = [(GKGridLayout *)self collectionView];
  uint64_t v5 = [v4 numberOfSections];

  if (v3)
  {
    uint64_t v6 = v5 - 1;
    double v7 = 0.0;
    uint64_t v8 = v6;
    unint64_t v9 = v3;
    do
    {
      uint64_t v10 = [(GKGridLayout *)self presentationDataForSection:v8];
      [v10 maxY];
      if (v7 < v11) {
        double v7 = v11;
      }

      --v8;
      --v9;
    }
    while (v9);
    do
    {
      unint64_t v12 = [(GKGridLayout *)self presentationDataForSection:v6];
      [v12 setMaxY:v7];

      --v6;
      --v3;
    }
    while (v3);
  }
}

- (void)updatePresentationDataInSection:(int64_t)a3 withAttributes:(id)a4 supplementaryLocation:(unint64_t)a5
{
  id v14 = a4;
  uint64_t v8 = [(GKGridLayout *)self presentationDataForSection:a3];
  unint64_t v9 = v8;
  if (v14)
  {
    [v8 updateWithLayoutAttributes:v14 supplementaryLocation:a5];
  }
  else if (a3 != 0x7FFFFFFFFFFFFFFFLL && a5)
  {
    [(GKGridLayout *)self calculatedBottomPaddingForSection:a3];
    double v11 = v10;
    [v9 showMoreMaxY];
    [v9 setShowMoreMaxY:v11 + v12];
    [v9 maxY];
    [v9 setMaxY:v11 + v13];
  }
}

- (void)finalizeGlobalPresentationDataWithSectionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(GKGridLayout *)self presentationDataForSection:0x7FFFFFFFFFFFFFFFLL];
  double v7 = [(GKGridLayout *)self presentationDataForSection:location];
  uint64_t v8 = [(GKGridLayout *)self presentationDataForSection:length + location - 1];
  if (![v6 numItems])
  {
    [v7 showMoreMaxY];
    objc_msgSend(v6, "setItemsMinY:");
    [v8 minY];
    objc_msgSend(v6, "setItemsMaxY:");
  }
  if (![v6 numFooters])
  {
    [v8 showMoreMaxY];
    objc_msgSend(v6, "setItemsMaxY:");
    [v6 itemsMaxY];
    objc_msgSend(v6, "setFooterMinY:");
    [v6 itemsMaxY];
    objc_msgSend(v6, "setFooterMaxY:");
    [v6 itemsMaxY];
    objc_msgSend(v6, "setShowMoreMaxY:");
  }
  if (self->_segmentedHeaderPinningOffset != 0.0)
  {
    unint64_t v9 = [(GKGridLayout *)self metricDataForSection:0x7FFFFFFFFFFFFFFFLL];
    [v6 headerMaxY];
    self->_segmentedHeaderPinningOffset = v10;
    double v11 = [v9 headerPinnableAttributes];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__GKGridLayout_finalizeGlobalPresentationDataWithSectionRange___block_invoke;
    v12[3] = &unk_1E5F63A00;
    v12[4] = self;
    [v11 enumerateObjectsUsingBlock:v12];
  }
}

uint64_t __63__GKGridLayout_finalizeGlobalPresentationDataWithSectionRange___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(*(void *)(a1 + 32) + 552);
  uint64_t result = [a2 frame];
  if (v3 <= v5) {
    double v6 = v3;
  }
  else {
    double v6 = v5;
  }
  *(double *)(*(void *)(a1 + 32) + 552) = v6;
  return result;
}

- (id)_existingPresentationDataForSection:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    int64_t v4 = 0;
  }
  else {
    int64_t v4 = a3 + 1;
  }
  if ((int64_t)[(NSPointerArray *)self->_sectionToPresentationData count] <= v4) {
    [(NSPointerArray *)self->_sectionToPresentationData setCount:v4 + 1];
  }
  sectionToPresentationData = self->_sectionToPresentationData;

  return [(NSPointerArray *)sectionToPresentationData pointerAtIndex:v4];
}

- (id)presentationDataForSection:(int64_t)a3
{
  -[GKGridLayout _existingPresentationDataForSection:](self, "_existingPresentationDataForSection:");
  double v5 = (GKSectionPresentationData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      double v6 = 0;
    }
    else
    {
      if (a3) {
        int64_t v7 = a3 - 1;
      }
      else {
        int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      double v6 = [(GKGridLayout *)self _existingPresentationDataForSection:v7];
    }
    double v5 = [[GKSectionPresentationData alloc] initWithSection:a3 presentationData:v6];
    if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v8 = 0;
    }
    else {
      int64_t v8 = a3 + 1;
    }
    [(NSPointerArray *)self->_sectionToPresentationData replacePointerAtIndex:v8 withPointer:v5];
  }

  return v5;
}

- (BOOL)_areWePortrait
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  BOOL v3 = (unint64_t)([v2 statusBarOrientation] - 1) < 2;

  return v3;
}

- (unint64_t)sectionsPerRow
{
  BOOL v3 = [(GKGridLayout *)self _areWePortrait];
  int64_t v4 = &OBJC_IVAR___GKGridLayout__landscapeInterleavedSectionsCount;
  if (v3) {
    int64_t v4 = &OBJC_IVAR___GKGridLayout__portraitInterleavedSectionsCount;
  }
  return *(unint64_t *)((char *)&self->super.super.isa + *v4);
}

- (double)yOffsetForSection:(int64_t)a3
{
  double v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [(GKGridLayout *)self sectionsPerRow];
    if (a3 >= v6) {
      uint64_t v7 = a3 - v6;
    }
    else {
      uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    int64_t v8 = [(GKGridLayout *)self presentationDataForSection:v7];
    [v8 maxY];
    double v3 = fmax(v9, 0.0);
  }
  return v3;
}

- (void)enumerateSectionsIndexesOverlappingYOffset:(double)a3 block:(id)a4
{
  id v14 = (void (**)(id, uint64_t))a4;
  NSUInteger v6 = [(NSPointerArray *)self->_sectionToPresentationData count];
  if (v6 >= 2)
  {
    NSUInteger v7 = v6;
    for (uint64_t i = 1; i != v7; ++i)
    {
      double v9 = [(NSPointerArray *)self->_sectionToPresentationData pointerAtIndex:i];
      [v9 minY];
      if (v10 <= a3 && ([v9 maxY], v11 >= a3)
        || ([(GKGridLayout *)self sectionsWithPinnedHeaders],
            double v12 = objc_claimAutoreleasedReturnValue(),
            int v13 = [v12 containsIndex:i],
            v12,
            v13))
      {
        v14[2](v14, i - 1);
      }
    }
  }
}

- (int64_t)indexOfSupplementaryMetricsOfKind:(id)a3 inList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    while (1)
    {
      double v10 = [v6 objectAtIndexedSubscript:v9];
      double v11 = [v10 kind];
      char v12 = [v11 isEqualToString:v5];

      if (v12) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (int64_t)_prepareSupplementaryLayoutForSection:(int64_t)a3 atLocation:(unint64_t)a4 offset:(int64_t)a5 globalOffset:(int64_t *)a6
{
  v131[1] = *MEMORY[0x1E4F143B8];
  v128 = [(GKGridLayout *)self collectionView];
  int64_t v9 = [(GKGridLayout *)self metricDataForSection:a3];
  double v10 = v9;
  if (a4)
  {
    if (a4 != 1) {
      goto LABEL_6;
    }
    double v11 = [v9 footerPinnableAttributes];
  }
  else
  {
    double v11 = [v9 headerPinnableAttributes];
  }
  char v12 = v11;
  [v11 removeAllObjects];

LABEL_6:
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = 0.0;
    double v119 = -0.0;
  }
  else
  {
    int v13 = [(GKGridLayoutMetrics *)self->_dataSourceMetrics supplementaryMetricsForKey:@"SegmentedBoxMetricKey"];

    if (v13) {
      double v14 = 40.0;
    }
    else {
      double v14 = 0.0;
    }
    double v119 = v14;
  }
  [(GKGridLayout *)self layoutBounds];
  uint64_t v117 = v16;
  double v118 = v15;
  double v121 = v17;
  uint64_t v116 = v18;
  v123 = [v128 dataSource];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v130 = 0;
    dataSourceMetrics = self->_dataSourceMetrics;
  }
  else
  {
    v130 = [(GKGridLayout *)self metricsForSection:a3];
    dataSourceMetrics = v130;
  }
  v102 = dataSourceMetrics;
  v127 = [(GKGridLayoutMetrics *)v102 listForLocation:a4];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v10 filteredTotalItemCount];
    unint64_t v126 = 0;
    unint64_t v115 = 0;
    unint64_t v122 = 0;
  }
  else
  {
    unint64_t v20 = [v128 numberOfItemsInSection:a3];
    unint64_t v21 = [v10 filteredTotalItemCount];
    unint64_t v115 = v20;
    if (v20 >= v21) {
      unint64_t v20 = v21;
    }
    unint64_t v22 = [v10 currentMaxVisibleItemCount];
    unint64_t v126 = v20;
    if (v20 >= v22) {
      unint64_t v23 = v22;
    }
    else {
      unint64_t v23 = v20;
    }
    unint64_t v122 = v23;
  }
  v24 = [(GKGridLayout *)self presentationDataForSection:a3];
  if (a4 == 1) {
    unint64_t v110 = [(GKGridLayout *)self indexOfSupplementaryMetricsOfKind:@"IncrementalReveal" inList:v127];
  }
  else {
    unint64_t v110 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v126 == v122 || a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v109 = 0;
    if (a4)
    {
LABEL_31:
      [v24 itemsMaxY];
      goto LABEL_34;
    }
  }
  else
  {
    BOOL v109 = [(GKDataSourceMetrics *)v130 incrementalRevealItemCount] != 0;
    if (a4) {
      goto LABEL_31;
    }
  }
  [(GKGridLayout *)self yOffsetForSection:a3];
LABEL_34:
  double v27 = v26;
  [(GKGridLayout *)self leftLayoutGuideOffset];
  double v29 = v28;
  [(GKGridLayout *)self rightLayoutGuideOffset];
  double v31 = v30;
  int v32 = GKShouldLayoutRTL();
  if (v32) {
    double v33 = v29;
  }
  else {
    double v33 = v31;
  }
  if (v32) {
    double v34 = v31;
  }
  else {
    double v34 = v29;
  }
  double v120 = v34;
  unint64_t v35 = [(GKGridLayout *)self sectionsPerRow];
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(GKDataSourceMetrics *)v130 marginBetweenItems];
    if (a3 % v35)
    {
      double v37 = v36 * 0.5;
      double v120 = v37;
      if (a3 % v35 != v35 - 1) {
        double v33 = v37;
      }
    }
    else
    {
      double v33 = v36 * 0.5;
    }
  }
  v101 = v24;
  v124 = v10;
  uint64_t v38 = [v127 count];
  v104 = [MEMORY[0x1E4F1CA48] array];
  [(GKGridLayout *)self scale];
  double v40 = v39;
  uint64_t v114 = v38;
  if (v38)
  {
    unint64_t v107 = a3 / v35;
    unint64_t v108 = v35;
    char v103 = 0;
    v111 = 0;
    unint64_t v41 = 0;
    BOOL v42 = a3 != 0x7FFFFFFFFFFFFFFFLL;
    if (v126) {
      BOOL v43 = 0;
    }
    else {
      BOOL v43 = a3 != 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v35 <= 1) {
      BOOL v42 = 0;
    }
    BOOL v112 = v42;
    BOOL v113 = v43;
    double v105 = (v121 + v14 * 2.0) / (double)v35;
    double v106 = (double)v35;
    do
    {
      v44 = [v127 objectAtIndexedSubscript:v41];
      [v44 sizeForCollectionView:v128];
      double v46 = v45;
      double v48 = v47;
      int v49 = [v44 isHidden];
      if (v113)
      {
        if ([(GKDataSourceMetrics *)v130 shouldShowSectionHeadersWhenNoItems])
        {
          v50 = [v44 kind];
          if ([v50 isEqualToString:@"SectionHeader"]) {
            BOOL v51 = [(GKGridLayout *)self sectionsPerRow] == 1;
          }
          else {
            BOOL v51 = 1;
          }
        }
        else
        {
          BOOL v51 = 1;
        }
      }
      else
      {
        BOOL v51 = 0;
      }
      unsigned int v52 = v51 | v49;
      if (v48 == 0.0) {
        unsigned int v52 = 1;
      }
      if (v46 == 0.0) {
        uint64_t v53 = 1;
      }
      else {
        uint64_t v53 = v52;
      }
      v54 = [v44 kind];
      if ([v54 isEqualToString:@"IncrementalReveal"])
      {
        int v55 = [(GKDataSourceMetrics *)v130 shouldAlwaysIncludeShowMore];

        uint64_t v53 = v53 | (v55 | v109) ^ 1;
      }
      else
      {
      }
      if ([v44 shouldUseGlobalIndexing] && a6)
      {
        if (!v111)
        {
          v111 = [(GKGridLayout *)self presentationDataForSection:0x7FFFFFFFFFFFFFFFLL];
        }
        uint64_t v56 = *a6++;
        v57 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v56];
      }
      else
      {
        if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:");
        }
        else {
        v57 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:");
        }
        ++a5;
      }
      if (self->_displayingOverlay)
      {
        if ((unint64_t)[v57 length] > 1) {
          uint64_t v53 = 1;
        }
        else {
          uint64_t v53 = v53;
        }
      }
      v58 = [v44 kind];
      v59 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v58 withIndexPath:v57];

      if (a4 == 1)
      {
        BOOL v60 = v110 == 0x7FFFFFFFFFFFFFFFLL || v41 > v110;
        char v61 = v60 ? v53 : 1;
        if ((v61 & 1) == 0)
        {
          [(GKGridLayout *)self calculatedBottomPaddingForSection:a3];
          double v27 = v27 + v62;
          char v103 = 1;
        }
      }
      double v63 = v118;
      double v64 = v121;
      if (v112)
      {
        double v64 = v105;
        double v46 = (v46 + v14 * 2.0) / v106;
        double v63 = (v46 + v14 * -2.0) * (double)(a3 - v107 * v108);
      }
      double v65 = round(v63 + (v64 - v46) * 0.5);
      uint64_t v67 = v116;
      uint64_t v66 = v117;
      double MaxX = CGRectGetMaxX(*(CGRect *)&v63);
      v132.origin.double x = v65;
      v132.origin.double y = v27;
      v132.size.double width = v46;
      v132.size.double height = v48;
      if (CGRectGetMaxX(v132) <= MaxX) {
        double v69 = v46;
      }
      else {
        double v69 = MaxX - v65;
      }
      if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
        double v70 = v69;
      }
      else {
        double v70 = v69 + v14 * -2.0;
      }
      objc_msgSend(v59, "setFrame:", floor(v40 * (v119 + v65)) / v40, floor(v40 * v27) / v40, floor(v40 * v70) / v40, floor(v40 * v48) / v40);
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v44 shouldPin]) {
          uint64_t v71 = 0x7FFFFFFFFFFFFFFELL;
        }
        else {
          uint64_t v71 = 0x7FFFFFFFFFFFF82ELL;
        }
      }
      else
      {
        uint64_t v71 = 1;
      }
      [v59 setZIndex:v71];
      [v59 setDataSource:v123];
      [v59 setSectionMetrics:v130];
      [v59 setSupplementaryMetrics:v44];
      [v59 setAllSectionItemsVisible:v126 == v122];
      [v59 setUnpinnedY:v27];
      [v59 setCurrentTotalItemCount:v126];
      [v59 setMaxTotalItemCount:v115];
      objc_msgSend(v59, "setCurrentVisibleItemCount:", objc_msgSend(v124, "currentMaxVisibleItemCount"));
      [v59 setGridLayoutLocation:a4];
      [v59 setLeadingMargin:v120];
      [v59 setTrailingMargin:v33];
      [v59 setHidden:v53];
      double v72 = 1.0;
      if (v53) {
        double v72 = 0.0;
      }
      [v59 setAlpha:v72];
      indexPathToSupplementardouble y = self->_indexPathToSupplementary;
      v74 = [v59 indexPath];
      [(NSMutableDictionary *)indexPathToSupplementary setObject:v59 forKeyedSubscript:v74];

      [(NSMutableArray *)self->_laidOutAttributes addObject:v59];
      knownSupplementaryKinds = self->_knownSupplementaryKinds;
      v76 = [v44 kind];
      [(NSMutableSet *)knownSupplementaryKinds addObject:v76];

      if (([v44 shouldPinGlobal] ^ 1 | v53))
      {
        if ((([v44 shouldPin] ^ 1 | v53) & 1) == 0)
        {
          if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
            [v59 setIsPartOfGlobalPinningGroup:1];
          }
          [v104 addObject:v59];
          [(NSMutableOrderedSet *)self->_laidOutPinnableAttributes addObject:v59];
        }
      }
      else
      {
        [v59 setIsPartOfGlobalPinningGroup:1];
        v77 = [(GKGridLayout *)self metricDataForSection:0x7FFFFFFFFFFFFFFFLL];
        v131[0] = v59;
        v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:1];
        [v77 addAttributes:v78 forLocation:a4];

        [(NSMutableOrderedSet *)self->_laidOutPinnableAttributes addObject:v59];
      }
      [(NSMutableDictionary *)self->_indexPathToMetrics setObject:v44 forKeyedSubscript:v57];
      if ((v53 & 1) == 0)
      {
        [(GKGridLayout *)self updatePresentationDataInSection:a3 withAttributes:v59 supplementaryLocation:a4];
        [v59 frame];
        double v27 = v27 + v79;
      }
      v80 = [v44 kind];
      int v81 = [v80 isEqualToString:@"SearchBar"];

      if (!a4 && (v81 & ~v53 & (a3 == 0x7FFFFFFFFFFFFFFFLL)) != 0 && self->_hiddenSearchBarOffset == 0.0) {
        self->_double hiddenSearchBarOffset = v27;
      }

      ++v41;
    }
    while (v114 != v41);
  }
  else
  {
    v111 = 0;
    char v103 = 0;
  }
  v82 = v104;
  v83 = v124;
  if ([v104 count]) {
    [v124 addAttributes:v104 forLocation:a4];
  }
  if ((a4 != 1) | v103 & 1)
  {
    BOOL v84 = a3 != 0x7FFFFFFFFFFFFFFFLL;
    if (a4) {
      BOOL v84 = 1;
    }
    if (!v84)
    {
      v85 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:");
      v86 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:@"ClipArea" withIndexPath:v85];

      [v86 setZIndex:0x7FFFFFFFFFFFFFFFLL];
      double v87 = *MEMORY[0x1E4F1DAD8];
      double v88 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v89 = [(GKGridLayout *)self collectionView];
      [v89 bounds];
      double v91 = v90;
      v92 = [(GKGridLayout *)self collectionView];
      [v92 contentOffset];
      double v94 = v93;
      v95 = [(GKGridLayout *)self collectionView];
      [v95 contentInset];
      objc_msgSend(v86, "setFrame:", floor(v40 * v87) / v40, floor(v40 * v88) / v40, floor(v40 * v91) / v40, floor(v40 * (v94 + v96)) / v40);

      [v86 setHidden:!self->_displayClipView];
      [(NSMutableArray *)self->_laidOutAttributes addObject:v86];
      v97 = self->_indexPathToSupplementary;
      v98 = [v86 indexPath];
      v99 = v97;
      v82 = v104;
      [(NSMutableDictionary *)v99 setObject:v86 forKeyedSubscript:v98];

      [(GKGridLayout *)self setClipViewAttributes:v86];
      ++a5;
      v83 = v124;
    }
  }
  else
  {
    [(GKGridLayout *)self updatePresentationDataInSection:a3 withAttributes:0 supplementaryLocation:1];
  }

  return a5;
}

- (int64_t)_prepareOverlayLayoutForSection:(int64_t)a3 offset:(int64_t)a4
{
  uint64_t v7 = [(GKGridLayout *)self collectionView];
  v59 = [(GKGridLayout *)self metricDataForSection:a3];
  [(GKGridLayout *)self layoutBounds];
  double v9 = v8;
  [(GKGridLayout *)self scale];
  double v11 = v10;
  [v7 contentInset];
  double v13 = v12;
  double v15 = v14;
  v57 = v7;
  uint64_t v56 = [v7 dataSource];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v55 = 0;
    dataSourceMetrics = self->_dataSourceMetrics;
  }
  else
  {
    int v55 = [(GKGridLayout *)self metricsForSection:a3];
    dataSourceMetrics = v55;
  }
  double v17 = dataSourceMetrics;
  v58 = [(GKGridLayoutMetrics *)v17 listForLocation:2];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v18 = 0;
  }
  else {
    unint64_t v18 = [v57 numberOfItemsInSection:a3];
  }
  unint64_t v19 = [v59 filteredTotalItemCount];
  if (v18 >= v19) {
    unint64_t v20 = v19;
  }
  else {
    unint64_t v20 = v18;
  }
  unint64_t v54 = v20;
  unint64_t v21 = [(GKGridLayout *)self presentationDataForSection:a3];
  [v21 headerMaxY];
  double v23 = v22;
  uint64_t v53 = [v58 count];
  if (v53)
  {
    v50 = v21;
    BOOL v51 = v17;
    unint64_t v52 = v18;
    uint64_t v24 = 0;
    if (v9 - (v13 + v15) - v23 >= 200.0) {
      double v25 = v9 - (v13 + v15) - v23;
    }
    else {
      double v25 = 200.0;
    }
    int64_t v26 = a4;
    do
    {
      double v27 = [v58 objectAtIndexedSubscript:v24];
      [v27 sizeForCollectionView:v57];
      uint64_t v29 = v28 == 0.0 || v25 == 0.0;
      if (v25 > 0.0 && v28 > 0.0)
      {
        if (self->_displayingOverlay) {
          uint64_t v29 = v29;
        }
        else {
          uint64_t v29 = 1;
        }
        if (self->_showPlaceholder
          && ([v27 kind],
              double v30 = objc_claimAutoreleasedReturnValue(),
              int v31 = [v30 isEqualToString:@"SearchPlaceholderMetricKey"],
              v30,
              !v31))
        {
          uint64_t v29 = 0;
        }
        else
        {
          int v32 = [v27 kind];
          int v33 = [v32 isEqualToString:@"SearchPlaceholderMetricKey"];

          if (v33) {
            uint64_t v29 = self->_showPlaceholder || [(GKGridLayout *)self searchResultsCount] != 0;
          }
        }
      }
      uint64_t v34 = a4 + v24;
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v35 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v34];
        uint64_t v36 = 0x7FFFFFFFFFFFFFFELL;
      }
      else
      {
        unint64_t v35 = [MEMORY[0x1E4F28D58] indexPathForItem:v34 inSection:a3];
        uint64_t v36 = 1;
      }
      double v37 = [v27 kind];
      uint64_t v38 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v37 withIndexPath:v35];

      UIRectCenteredXInRect();
      double v40 = v39;
      objc_msgSend(v38, "setFrame:", floor(v11 * v41) / v11, floor(v11 * v39) / v11, floor(v11 * v42) / v11, floor(v11 * v43) / v11);
      [v38 setZIndex:v36];
      [v38 setDataSource:v56];
      [v38 setSectionMetrics:v55];
      [v38 setSupplementaryMetrics:v27];
      [v38 setAllSectionItemsVisible:1];
      [v38 setUnpinnedY:v40];
      [v38 setCurrentTotalItemCount:v54];
      [v38 setMaxTotalItemCount:v52];
      objc_msgSend(v38, "setCurrentVisibleItemCount:", objc_msgSend(v59, "currentMaxVisibleItemCount"));
      [v38 setGridLayoutLocation:2];
      [v38 setHidden:v29];
      double v44 = 1.0;
      if (v29) {
        double v44 = 0.0;
      }
      [v38 setAlpha:v44];
      indexPathToSupplementardouble y = self->_indexPathToSupplementary;
      double v46 = [v38 indexPath];
      [(NSMutableDictionary *)indexPathToSupplementary setObject:v38 forKeyedSubscript:v46];

      [(NSMutableArray *)self->_laidOutAttributes addObject:v38];
      knownSupplementaryKinds = self->_knownSupplementaryKinds;
      double v48 = [v27 kind];
      [(NSMutableSet *)knownSupplementaryKinds addObject:v48];

      [(NSMutableDictionary *)self->_indexPathToMetrics setObject:v27 forKeyedSubscript:v35];
      ++v24;
      a4 = v26;
    }
    while (v53 != v24);
    a4 = v26 + v24;
    unint64_t v21 = v50;
    double v17 = v51;
  }

  return a4;
}

- (void)_prepareSegmentedBoxLayoutWithOffset:(int64_t)a3
{
  id v5 = [(GKGridLayoutMetrics *)self->_dataSourceMetrics supplementaryMetricsForKey:@"SegmentedBoxMetricKey"];
  if (v5)
  {
    id v57 = v5;
    id v6 = [(GKGridLayout *)self collectionView];
    [(GKGridLayout *)self scale];
    double v8 = v7;
    [(GKGridLayout *)self layoutBounds];
    double v10 = v9;
    [v6 contentInset];
    double v13 = v10 - (v11 + v12);
    double v14 = [v6 dataSource];
    BOOL v15 = v13 == 0.0 || self->_laidOutContentSize.height == 0.0;
    uint64_t v16 = [(GKGridLayoutMetrics *)self->_dataSourceMetrics supplementaryMetricsForKey:@"SegmentedControlMetricKey"];
    [v16 desiredHeight];
    double v17 = [MEMORY[0x1E4F28D58] indexPathWithIndex:a3];
    unint64_t v18 = [v57 kind];
    unint64_t v19 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v18 withIndexPath:v17];

    UIRectCenteredXInRect();
    double x = v59.origin.x;
    double y = v59.origin.y;
    double width = v59.size.width;
    double height = v59.size.height;
    CGRectGetMaxY(v59);
    objc_msgSend(v19, "setFrame:", floor(v8 * x) / v8, floor(v8 * y) / v8, floor(v8 * width) / v8, floor(v8 * height) / v8);
    [v19 setDataSource:v14];
    [v19 setSupplementaryMetrics:v57];
    [v19 setUnpinnedY:y];
    [v19 setGridLayoutLocation:3];
    [v19 setHidden:v15];
    BOOL v56 = v15;
    double v24 = 1.0;
    if (v15) {
      double v24 = 0.0;
    }
    [v19 setAlpha:v24];
    [v19 setZIndex:-3000];
    indexPathToSupplementardouble y = self->_indexPathToSupplementary;
    int64_t v26 = [v19 indexPath];
    [(NSMutableDictionary *)indexPathToSupplementary setObject:v19 forKeyedSubscript:v26];

    [(NSMutableArray *)self->_laidOutAttributes addObject:v19];
    knownSupplementaryKinds = self->_knownSupplementaryKinds;
    double v28 = [v57 kind];
    [(NSMutableSet *)knownSupplementaryKinds addObject:v28];

    [(NSMutableDictionary *)self->_indexPathToMetrics setObject:v57 forKeyedSubscript:v17];
    uint64_t v29 = [(GKGridLayoutMetrics *)self->_dataSourceMetrics supplementaryMetricsForKey:@"ContentBoxMetricKey"];
    if (v29)
    {
      int v55 = v16;
      int64_t v30 = a3 + 1;
      uint64_t v31 = [v6 numberOfSections];
      if (v31)
      {
        int v32 = v14;
        int v33 = v6;
        uint64_t v34 = 0;
        uint64_t v35 = v31 - 1;
        do
        {
          uint64_t v36 = [(GKGridLayout *)self presentationDataForSection:v34];
          [v36 headerMaxY];
          double v38 = v37;
        }
        while (v38 <= 0.0 && v35 != v34++);
        double v40 = v38 + -32.0;
        id v6 = v33;
        double v14 = v32;
      }
      else
      {
        double v40 = -32.0;
      }
      uint64_t v41 = v40 <= 0.0 || v56;
      uint64_t v42 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v30];

      double v43 = [v29 kind];
      double v44 = +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:v43 withIndexPath:v42];

      UIRectCenteredXInRect();
      double v46 = v45;
      objc_msgSend(v44, "setFrame:", floor(v8 * v47) / v8, floor(v8 * v45) / v8, floor(v8 * v48) / v8, floor(v8 * v49) / v8);
      [v44 setDataSource:v14];
      [v44 setSupplementaryMetrics:v29];
      [v44 setUnpinnedY:v46];
      [v44 setGridLayoutLocation:4];
      [v44 setHidden:v41];
      double v50 = 1.0;
      if (v41) {
        double v50 = 0.0;
      }
      [v44 setAlpha:v50];
      [v44 setZIndex:-2999];
      BOOL v51 = self->_indexPathToSupplementary;
      unint64_t v52 = [v44 indexPath];
      [(NSMutableDictionary *)v51 setObject:v44 forKeyedSubscript:v52];

      [(NSMutableArray *)self->_laidOutAttributes addObject:v44];
      uint64_t v53 = self->_knownSupplementaryKinds;
      unint64_t v54 = [v29 kind];
      [(NSMutableSet *)v53 addObject:v54];

      [(NSMutableDictionary *)self->_indexPathToMetrics setObject:v29 forKeyedSubscript:v42];
      unint64_t v19 = v44;
      double v17 = (void *)v42;
      uint64_t v16 = v55;
    }

    id v5 = v57;
  }
}

- (id)firstVisibleIndexAtOrAfterItem:(int64_t)a3 itemCount:(int64_t)a4 inSection:(int64_t)a5
{
  int64_t v6 = a3;
  if (self->_visibleIndexPathsFilter)
  {
    if (a3 >= a4)
    {
LABEL_5:
      double v9 = 0;
    }
    else
    {
      while (1)
      {
        double v9 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:a5];
        if ([(NSSet *)self->_visibleIndexPathsFilter containsObject:v9]) {
          break;
        }
        ++v6;

        if (a4 == v6) {
          goto LABEL_5;
        }
      }
    }
  }
  else
  {
    double v9 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:a5];
  }

  return v9;
}

- (unint64_t)_prepareItemLayoutForSection:(int64_t)a3
{
  int64_t v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = NSString;
    int64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m"];
    id v8 = [v7 lastPathComponent];
    double v9 = [v5 stringWithFormat:@"%@ (sectionIdx != GKGlobalSection)\n[%s (%s:%d)]", v6, "-[GKGridLayout _prepareItemLayoutForSection:]", objc_msgSend(v8, "UTF8String"), 1305];

    int64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  double v10 = [(GKGridLayoutMetrics *)self->_dataSourceMetrics supplementaryMetricsForKey:@"SegmentedBoxMetricKey"];

  if (v10) {
    double v11 = 40.0;
  }
  else {
    double v11 = 0.0;
  }
  uint64_t v116 = [(GKGridLayout *)self metricDataForSection:v3];
  v124 = [(GKGridLayout *)self metricsForSection:v3];
  unint64_t v12 = v3;
  unint64_t v13 = [(GKGridLayout *)self sectionsPerRow];
  double v14 = [(GKGridLayout *)self collectionView];
  [(GKGridLayout *)self layoutBounds];
  CGFloat v119 = v18;
  CGFloat v120 = v17;
  double v19 = (v16 + v11 * -2.0) / (double)v13;
  unint64_t v20 = v12 % v13;
  if (v13 >= 2) {
    double v15 = v11 + (double)(v12 % v13) * v19;
  }
  else {
    double v19 = v16;
  }
  double v122 = v15;
  double v123 = v19;
  BOOL v113 = [v14 dataSource];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v21 = 0;
  }
  else {
    unint64_t v21 = [v14 numberOfItemsInSection:v12];
  }
  unint64_t v22 = [v116 filteredTotalItemCount];
  if (v21 >= v22) {
    unint64_t v23 = v22;
  }
  else {
    unint64_t v23 = v21;
  }
  unint64_t v115 = v23;
  [v124 lineSpacing];
  double v25 = v24;
  [v124 interitemSpacing];
  double v27 = v26;
  [v124 padding];
  double v29 = v28;
  double v108 = v31;
  double v109 = v30;
  double v32 = v123 - (v30 + v31);
  [v124 itemSizeForCollectionView:v14];
  double v121 = v34;
  if (v13 >= 2) {
    double v35 = (v33 + v11 * 2.0) / (double)v13;
  }
  else {
    double v35 = v33;
  }
  if (v35 == 0.0)
  {
    unint64_t v37 = 1;
  }
  else
  {
    float v36 = (v32 - v35) / (v27 + v35);
    unint64_t v37 = (unint64_t)(float)(floorf(v36) + 1.0);
  }
  if (v37 <= 1) {
    unint64_t v38 = 1;
  }
  else {
    unint64_t v38 = v37;
  }
  unint64_t v39 = [v116 currentMaxVisibleItemCount];
  if (v115 >= v39) {
    unint64_t v40 = v39;
  }
  else {
    unint64_t v40 = v115;
  }
  if (v37 >= 2 && v40 % v38)
  {
    if (v40 + v38 - v40 % v38 >= v115) {
      unint64_t v40 = v115;
    }
    else {
      unint64_t v40 = v40 + v38 - v40 % v38;
    }
  }
  if (v11 <= 0.0) {
    double v41 = v35;
  }
  else {
    double v41 = v35 - (v11 + v11) / (double)v38;
  }
  unint64_t v42 = v40 % v38;
  if (v40 >= v38) {
    unint64_t v43 = v38;
  }
  else {
    unint64_t v43 = v40;
  }
  if (!v42) {
    unint64_t v42 = v43;
  }
  unint64_t v103 = v43;
  unint64_t v104 = v42;
  float v44 = (double)v40 / (double)v38;
  unint64_t v45 = vcvtps_u32_f32(v44);
  double v46 = [(NSMutableArray *)self->_laidOutAttributes lastObject];
  [v46 frame];
  double MaxY = CGRectGetMaxY(v126);
  if (self->_shouldLayoutRTL) {
    [(GKGridLayout *)self rightLayoutGuideOffset];
  }
  else {
    [(GKGridLayout *)self leftLayoutGuideOffset];
  }
  double v112 = v48;
  if (self->_shouldLayoutRTL) {
    [(GKGridLayout *)self leftLayoutGuideOffset];
  }
  else {
    [(GKGridLayout *)self rightLayoutGuideOffset];
  }
  double v111 = v49;
  if (v45)
  {
    v95 = v46;
    unint64_t v96 = v40;
    v97 = v14;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    unint64_t v52 = v45;
    uint64_t v53 = 0;
    double v54 = v32 - (v27 * (double)(v38 - 1) + v41 * (double)v38);
    double v55 = v32 - (v27 * (double)(v104 - 1) + v41 * (double)v104) - v54;
    float v56 = v54 * 0.5;
    float v57 = v55 * 0.5;
    double v125 = v29 + MaxY;
    double v101 = floorf(v56);
    double v102 = v54;
    double v100 = -v54;
    unint64_t v106 = v52;
    unint64_t v105 = v52 - 1;
    double v99 = floorf(v57);
    *(float *)&double v55 = v55;
    float v98 = floorf(*(float *)&v55);
    unint64_t v110 = v13 - 1;
    int64_t v58 = a3;
    while (1)
    {
      double v59 = v122 + v109;
      if (self->_shouldLayoutRTL)
      {
        v127.origin.double x = v122;
        v127.size.double width = v123;
        v127.size.double height = v119;
        v127.origin.double y = v120;
        double v59 = CGRectGetMaxX(v127) - v109 - v41;
      }
      uint64_t v60 = [v124 alignment];
      if (v60 == 2)
      {
        BOOL v61 = !self->_shouldLayoutRTL;
        double v62 = v102;
        double v63 = v100;
      }
      else
      {
        if (v60 != 1) {
          goto LABEL_57;
        }
        BOOL v61 = !self->_shouldLayoutRTL;
        double v63 = -v101;
        double v62 = v101;
      }
      if (!v61) {
        double v62 = v63;
      }
      double v59 = v59 + v62;
LABEL_57:
      if (v50 == v105)
      {
        uint64_t v64 = [v124 lastLineItemAlignment];
        if (v64 == 2)
        {
          float v67 = v98;
          if (self->_shouldLayoutRTL) {
            float v67 = -v98;
          }
          double v65 = v67;
LABEL_67:
          double v59 = v59 + v65;
        }
        else if (v64 == 1)
        {
          double v65 = v99;
          if (self->_shouldLayoutRTL) {
            double v65 = -v99;
          }
          goto LABEL_67;
        }
        unint64_t v66 = v104;
        goto LABEL_69;
      }
      unint64_t v66 = v103;
LABEL_69:
      [v124 marginBetweenItems];
      double v69 = v68;
      [(GKGridLayout *)self scale];
      uint64_t v107 = v50;
      if (v66)
      {
        double v71 = v70;
        uint64_t v72 = 0;
        double v118 = floor(v125 * v70) / v70;
        double v117 = floor(v121 * v70) / v70;
        do
        {
          v73 = v53;
          uint64_t v53 = [(GKGridLayout *)self firstVisibleIndexAtOrAfterItem:v51 itemCount:v21 inSection:v58];

          if (v53)
          {
            v74 = +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:v53];
            v128.origin.double x = v122;
            v128.origin.double y = v120;
            v128.size.double width = v123;
            v128.size.double height = v119;
            double MinX = CGRectGetMinX(v128);
            v129.origin.double x = v122;
            v129.origin.double y = v120;
            v129.size.double width = v123;
            v129.size.double height = v119;
            double MaxX = CGRectGetMaxX(v129);
            if (self->_shouldLayoutRTL)
            {
              v130.origin.double x = v59;
              v130.origin.double y = v125;
              v130.size.double width = v41;
              v130.size.double height = v121;
              CGFloat v77 = CGRectGetMinX(v130);
              double v78 = MinX - v77;
              BOOL v79 = v77 < MinX;
              double v80 = -0.0;
              if (v79) {
                double v80 = v78;
              }
              double v81 = v59 + v80;
              if (!v79) {
                double v78 = 0.0;
              }
              double v82 = v41 - v78;
            }
            else
            {
              double v83 = MaxX;
              v131.origin.double x = v59;
              v131.origin.double y = v125;
              v131.size.double width = v41;
              v131.size.double height = v121;
              if (CGRectGetMaxX(v131) > v83) {
                double v82 = v83 - v59;
              }
              else {
                double v82 = v41;
              }
              double v81 = v59;
            }
            objc_msgSend(v74, "setFrame:", floor(v71 * v81) / v71, v118, floor(v71 * v82) / v71, v117);
            [v74 setDataSource:v113];
            [v74 setSectionMetrics:v124];
            [v74 setCurrentTotalItemCount:v115];
            [v74 setMaxTotalItemCount:v21];
            objc_msgSend(v74, "setCurrentVisibleItemCount:", objc_msgSend(v116, "currentMaxVisibleItemCount"));
            if (v20 | v72)
            {
              BOOL v84 = 0;
            }
            else
            {
              double v85 = v109;
              if (self->_shouldLayoutRTL) {
                double v85 = v108;
              }
              BOOL v84 = v85 == 0.0;
            }
            [v74 setDoesAbutLeftOfCollectionView:v84];
            if (v66 - 1 == v72)
            {
              unint64_t v86 = v110;
              BOOL v87 = v20 == v110;
              if (self->_shouldLayoutRTL) {
                BOOL v87 = v20 == 0;
              }
            }
            else
            {
              BOOL v87 = 0;
              unint64_t v86 = v110;
            }
            if (v87) {
              double v88 = v111;
            }
            else {
              double v88 = v69 * 0.5;
            }
            if (self->_shouldLayoutRTL) {
              BOOL v89 = v20 == v86;
            }
            else {
              BOOL v89 = v20 == 0;
            }
            double v90 = v112;
            if (v72 != 0 || !v89) {
              double v90 = v69 * 0.5;
            }
            [v74 setLeadingMargin:v90];
            [v74 setTrailingMargin:v88];
            [v74 setHidden:self->_displayingOverlay];
            indexPathToItem = self->_indexPathToItem;
            v92 = [v74 indexPath];
            [(NSMutableDictionary *)indexPathToItem setObject:v74 forKeyedSubscript:v92];

            [(NSMutableArray *)self->_laidOutAttributes addObject:v74];
            [(GKGridLayout *)self updatePresentationDataInSection:a3 withAttributes:v74 supplementaryLocation:-1];
            double v93 = -v41;
            if (!self->_shouldLayoutRTL) {
              double v93 = v41;
            }
            double v59 = v59 + v93;

            int64_t v58 = a3;
          }
          uint64_t v51 = [v53 item] + 1;
          ++v72;
        }
        while (v66 != v72);
      }
      double v125 = v25 + v121 + v125;
      uint64_t v50 = v107 + 1;
      if (v107 + 1 == v106)
      {

        unint64_t v40 = v96;
        double v14 = v97;
        double v46 = v95;
        break;
      }
    }
  }

  return v40;
}

- (void)_resetState
{
  [(NSMutableDictionary *)self->_oldSectionToMetricKeys removeAllObjects];
  uint64_t v3 = [(NSPointerArray *)self->_sectionToMetricData count];
  uint64_t v4 = v3 - 1;
  if (v3 >= 1)
  {
    if (v3 != 1)
    {
      uint64_t v5 = 0;
      do
      {
        int64_t v6 = [(GKGridLayout *)self metricDataForSection:v5];
        double v7 = [v6 layoutKey];
        oldSectionToMetricKeys = self->_oldSectionToMetricKeys;
        double v9 = [NSNumber numberWithLong:v5];
        [(NSMutableDictionary *)oldSectionToMetricKeys setObject:v7 forKeyedSubscript:v9];

        ++v5;
      }
      while (v4 != v5);
    }
    double v10 = [(GKGridLayout *)self metricDataForSection:0x7FFFFFFFFFFFFFFFLL];
    double v11 = [v10 layoutKey];
    [(NSMutableDictionary *)self->_oldSectionToMetricKeys setObject:v11 forKeyedSubscript:&unk_1F0811C58];
  }
  [(NSPointerArray *)self->_sectionToMetricData setCount:0];
  [(NSPointerArray *)self->_sectionToPresentationData setCount:0];
  [(NSMutableArray *)self->_laidOutAttributes removeAllObjects];
  [(NSMutableOrderedSet *)self->_laidOutPinnableAttributes removeAllObjects];
  [(NSMutableIndexSet *)self->_sectionsWithPinnedHeaders removeAllIndexes];
  [(NSMutableDictionary *)self->_oldIndexPathToDecoration removeAllObjects];
  [(NSMutableDictionary *)self->_oldIndexPathToDecoration setValuesForKeysWithDictionary:self->_indexPathToDecoration];
  [(NSMutableDictionary *)self->_indexPathToDecoration removeAllObjects];
  [(NSMutableDictionary *)self->_oldIndexPathToSupplementary removeAllObjects];
  [(NSMutableDictionary *)self->_oldIndexPathToSupplementary setValuesForKeysWithDictionary:self->_indexPathToSupplementary];
  [(NSMutableDictionary *)self->_indexPathToSupplementary removeAllObjects];
  [(NSMutableDictionary *)self->_oldIndexPathToItem removeAllObjects];
  [(NSMutableDictionary *)self->_oldIndexPathToItem setValuesForKeysWithDictionary:self->_indexPathToItem];
  [(NSMutableDictionary *)self->_indexPathToItem removeAllObjects];
  [(NSMutableDictionary *)self->_indexPathToMetrics removeAllObjects];
  [(NSMutableSet *)self->_knownSupplementaryKinds removeAllObjects];
  self->_double hiddenSearchBarOffset = 0.0;
  self->_segmentedHeaderPinningOffset = 0.0;
  self->_segmentedBoxY = 0.0;
}

- (void)prepareLayout
{
  if ((self->_invalidationFlags & 6) != 0) {
    [(GKGridLayout *)self fullyRebuildLayout];
  }
  self->_invalidationFlags = 0;
}

- (void)fullyRebuildLayout
{
  [(GKGridLayout *)self _resetState];
  uint64_t v3 = [(GKGridLayout *)self collectionView];
  uint64_t v4 = [v3 numberOfSections];
  dataSourceMetrics = self->_dataSourceMetrics;
  if (!dataSourceMetrics)
  {
    [(GKGridLayout *)self refreshMetrics];
    dataSourceMetrics = self->_dataSourceMetrics;
  }
  [(GKDataSourceMetrics *)dataSourceMetrics prepareLayout:self];
  int64_t v6 = [(GKGridLayout *)self presentationDataForSection:0x7FFFFFFFFFFFFFFFLL];
  int64_t v7 = [(GKGridLayout *)self _prepareSupplementaryLayoutForSection:0x7FFFFFFFFFFFFFFFLL atLocation:0 offset:0 globalOffset:0];
  [v6 setNumHeaders:v7 - 1];
  [v6 setOverlayOffset:v7];
  int64_t v12 = [(GKGridLayout *)self _prepareOverlayLayoutForSection:0x7FFFFFFFFFFFFFFFLL offset:v7];
  objc_msgSend(v6, "setNumOverlays:", v12 + ~objc_msgSend(v6, "numHeaders"));
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      double v9 = [(GKGridLayout *)self presentationDataForSection:i];
      int64_t v10 = [(GKGridLayout *)self _prepareSupplementaryLayoutForSection:i atLocation:0 offset:0 globalOffset:&v12];
      [v9 setNumHeaders:v10];
      objc_msgSend(v9, "setNumItems:", -[GKGridLayout _prepareItemLayoutForSection:](self, "_prepareItemLayoutForSection:", i));
      objc_msgSend(v9, "setNumFooters:", -[GKGridLayout _prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:](self, "_prepareSupplementaryLayoutForSection:atLocation:offset:globalOffset:", i, 1, v10, &v12)- objc_msgSend(v9, "numHeaders"));
    }
  }
  if ([(GKGridLayout *)self sectionsPerRow] > 1) {
    [(GKGridLayout *)self updatePresentationDataForLastInterleavedSections];
  }
  -[GKGridLayout finalizeGlobalPresentationDataWithSectionRange:](self, "finalizeGlobalPresentationDataWithSectionRange:", 0, v4);
  int64_t v11 = v12;
  int64_t v12 = [(GKGridLayout *)self _prepareSupplementaryLayoutForSection:0x7FFFFFFFFFFFFFFFLL atLocation:1 offset:v12 globalOffset:0];
  [v6 setNumFooters:v11 - v12];
  [(GKGridLayout *)self calculateCollectionViewContentSize];
  [(GKGridLayout *)self _prepareSegmentedBoxLayoutWithOffset:v12];
  [(GKGridLayout *)self _filterPinnedAttributes];
}

- (double)applyBottomPinningToAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v6 = a3;
  uint64_t v7 = [v6 count];
  if (v7 >= 1)
  {
    unint64_t v8 = v7 + 1;
    do
    {
      double v9 = [v6 objectAtIndexedSubscript:v8 - 2];
      [v9 frame];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [v9 unpinnedY];
      CGFloat v17 = v16;
      v21.origin.double x = v11;
      v21.origin.double y = v17;
      v21.size.double width = v13;
      v21.size.double height = v15;
      double MaxY = CGRectGetMaxY(v21);
      if (MaxY <= a5) {
        double v19 = v17;
      }
      else {
        double v19 = a5 - v15;
      }
      if (MaxY > a5) {
        a5 = a5 - v15;
      }
      objc_msgSend(v9, "setFrame:", v11, v19, v13, v15);

      --v8;
    }
    while (v8 > 1);
  }

  return a5;
}

- (double)applyTopPinningToAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 count];
  if (v8 < 1)
  {
    CGFloat MaxY = a4;
  }
  else
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      double v11 = [v7 objectAtIndexedSubscript:i];
      [v11 frame];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      [v11 unpinnedY];
      if (v18 >= a4)
      {
        double v20 = v18;
        CGFloat MaxY = a4;
      }
      else
      {
        v23.origin.double x = v13;
        v23.origin.double y = a4;
        v23.size.double width = v15;
        v23.size.double height = v17;
        CGFloat MaxY = CGRectGetMaxY(v23);
        if (MaxY - a5 <= 0.0)
        {
          double v20 = a4;
        }
        else
        {
          if (MaxY - a5 >= v17)
          {
            [v11 unpinnedY];
            double v20 = v21;
          }
          else
          {
            v24.origin.double x = v13;
            v24.origin.double y = a4;
            v24.size.double width = v15;
            v24.size.double height = v17;
            double v20 = a5 - CGRectGetHeight(v24);
          }
          CGFloat MaxY = a5;
        }
      }
      objc_msgSend(v11, "setFrame:", v13, v20, v15, v17);

      a4 = MaxY;
    }
  }

  return MaxY;
}

- (double)layoutBottomPinningAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  id v8 = a3;
  [(GKGridLayout *)self applyBottomPinningToAttributes:v8 minY:a4 maxY:a5];
  double v10 = v9;
  if (v9 < a4)
  {
    [(GKGridLayout *)self applyTopPinningToAttributes:v8 minY:a4 maxY:1.79769313e308];
    double v10 = a4;
  }

  return v10;
}

- (double)layoutTopPinningAttributes:(id)a3 minY:(double)a4 maxY:(double)a5
{
  -[GKGridLayout applyTopPinningToAttributes:minY:maxY:](self, "applyTopPinningToAttributes:minY:maxY:", a3, a4);
  if (result > a5) {
    return a5;
  }
  return result;
}

- (void)finalizePinnedAttributes:(id)a3 forSection:(int64_t)a4 footer:(BOOL)a5
{
  id v8 = a3;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v9 = [v8 count];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__GKGridLayout_finalizePinnedAttributes_forSection_footer___block_invoke;
  v12[3] = &unk_1E5F63A28;
  BOOL v13 = a5;
  v12[4] = &v14;
  void v12[5] = v9;
  [v8 enumerateObjectsUsingBlock:v12];
  if (!a5)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
      int64_t v10 = 0;
    }
    else {
      int64_t v10 = a4 + 1;
    }
    if (*((unsigned char *)v15 + 24))
    {
      double v11 = [(GKGridLayout *)self sectionsWithPinnedHeaders];
      [v11 addIndex:v10];
    }
    else
    {
      double v11 = [(GKGridLayout *)self sectionsWithPinnedHeaders];
      [v11 removeIndex:v10];
    }
  }
  _Block_object_dispose(&v14, 8);
}

void __59__GKGridLayout_finalizePinnedAttributes_forSection_footer___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v13 = a2;
  [v13 frame];
  double v6 = v5;
  [v13 unpinnedY];
  BOOL v8 = v6 != v7;
  [v13 setIsPinned:v6 != v7];
  uint64_t v9 = *(void *)(a1 + 40);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v8;
  uint64_t v10 = a3 - v9;
  int v11 = [v13 isPartOfGlobalPinningGroup];
  uint64_t v12 = 0x7FFFFFFFFFFFFC16;
  if (v11) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFELL;
  }
  [v13 setZIndex:v10 + v12];
}

- (void)_filterPinnedAttributes
{
  uint64_t v3 = [(GKGridLayout *)self collectionView];
  if ((unint64_t)([v3 numberOfSections] - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    [v3 contentOffset];
    double v5 = v4;
    double height = self->_laidOutContentSize.height;
    [v3 contentInset];
    double v8 = v7;
    double v10 = v9;
    [(GKGridLayout *)self layoutBounds];
    if (v5 + v8 >= 0.0) {
      double v15 = v5 + v8;
    }
    else {
      double v15 = 0.0;
    }
    double v16 = CGRectGetMaxY(*(CGRect *)&v11) - v10;
    if (v16 <= v5 + height + v10) {
      double v17 = v16;
    }
    else {
      double v17 = v5 + height + v10;
    }
    double v18 = [(GKGridLayout *)self metricDataForSection:0x7FFFFFFFFFFFFFFFLL];
    double v19 = [v18 headerPinnableAttributes];
    if (v19)
    {
      [(GKGridLayout *)self layoutTopPinningAttributes:v19 minY:v15 maxY:v17];
      double v15 = v20;
      [(GKGridLayout *)self finalizePinnedAttributes:v19 forSection:0x7FFFFFFFFFFFFFFFLL footer:0];
    }
    double v21 = [v18 footerPinnableAttributes];
    if (v21)
    {
      [(GKGridLayout *)self layoutBottomPinningAttributes:v21 minY:v15 maxY:v17];
      double v17 = v22;
      [(GKGridLayout *)self finalizePinnedAttributes:v21 forSection:0x7FFFFFFFFFFFFFFFLL footer:1];
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __39__GKGridLayout__filterPinnedAttributes__block_invoke;
    v24[3] = &unk_1E5F63A50;
    v24[4] = self;
    *(double *)&v24[5] = v15;
    *(double *)&v24[6] = v17;
    [(GKGridLayout *)self enumerateSectionsIndexesOverlappingYOffset:v24 block:v15];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__GKGridLayout__filterPinnedAttributes__block_invoke_2;
    v23[3] = &unk_1E5F63A50;
    v23[4] = self;
    *(double *)&v23[5] = v15;
    *(double *)&v23[6] = v17;
    [(GKGridLayout *)self enumerateSectionsIndexesOverlappingYOffset:v23 block:v17];
  }
}

void __39__GKGridLayout__filterPinnedAttributes__block_invoke(uint64_t a1, uint64_t a2)
{
  id v11 = [*(id *)(a1 + 32) metricDataForSection:a2];
  double v4 = [v11 headerPinnableAttributes];
  if (v4)
  {
    double v5 = [*(id *)(a1 + 32) presentationDataForSection:a2];
    double v6 = *(void **)(a1 + 32);
    double v7 = *(double *)(a1 + 40);
    double v8 = *(double *)(a1 + 48);
    [v5 maxY];
    if (v8 <= v9) {
      double v10 = v8;
    }
    else {
      double v10 = v9;
    }
    [v6 layoutTopPinningAttributes:v4 minY:v7 maxY:v10];
    [*(id *)(a1 + 32) finalizePinnedAttributes:v4 forSection:a2 footer:0];
  }
}

void __39__GKGridLayout__filterPinnedAttributes__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v9 = [*(id *)(a1 + 32) metricDataForSection:a2];
  double v4 = [v9 footerPinnableAttributes];
  if (v4)
  {
    double v5 = [*(id *)(a1 + 32) presentationDataForSection:a2];
    double v6 = *(void **)(a1 + 32);
    double v7 = *(double *)(a1 + 40);
    [v5 headerMaxY];
    if (v7 >= v8) {
      double v8 = v7;
    }
    [v6 layoutBottomPinningAttributes:v4 minY:v8 maxY:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) finalizePinnedAttributes:v4 forSection:a2 footer:1];
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v8 = [MEMORY[0x1E4F1CA48] array];
  [(GKGridLayout *)self _filterPinnedAttributes];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = self->_laidOutAttributes;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "frame", (void)v16);
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = y;
        v24.size.CGFloat width = width;
        v24.size.CGFloat height = height;
        if (CGRectIntersectsRect(v23, v24)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  double v5 = [(NSMutableDictionary *)self->_indexPathToItem objectForKeyedSubscript:v4];
  if (!v5)
  {
    double v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v4);
    double v6 = -[GKGridLayout metricsForSection:](self, "metricsForSection:", [v4 section]);
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    id v9 = [(GKGridLayout *)self collectionView];
    [v6 itemSizeForCollectionView:v9];
    objc_msgSend(v5, "setFrame:", v7, v8, v10, v11);

    [v5 setAlpha:0.0];
    [v5 setHidden:1];
  }

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSMutableDictionary *)self->_indexPathToSupplementary objectForKeyedSubscript:v7];
  if (!v8)
  {
    double v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
    [v8 setAlpha:0.0];
    [(NSMutableSet *)self->_knownSupplementaryKinds addObject:v6];
  }

  return v8;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(NSMutableDictionary *)self->_indexPathToDecoration objectForKeyedSubscript:v7];
  if (!v8)
  {
    double v8 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForDecorationViewOfKind:withIndexPath:", v6, v7);
    [v8 setAlpha:0.0];
    [(NSMutableSet *)self->_knownSupplementaryKinds addObject:v6];
  }

  return v8;
}

- (unint64_t)currentMaxVisibleItemCountForSection:(int64_t)a3
{
  uint64_t v3 = [(GKGridLayout *)self metricDataForSection:a3];
  id v4 = v3;
  if (v3) {
    unint64_t v5 = [v3 currentMaxVisibleItemCount];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)revealMoreForSectionIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v5 = NSString;
    id v6 = [NSString stringWithFormat:@"Assertion failed"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayout.m"];
    id v8 = [v7 lastPathComponent];
    id v9 = [v5 stringWithFormat:@"%@ (section != GKGlobalSection)\n[%s (%s:%d)]", v6, "-[GKGridLayout revealMoreForSectionIndex:]", objc_msgSend(v8, "UTF8String"), 1834];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
  }
  double v10 = [(GKGridLayout *)self metricDataForSection:a3];
  double v11 = [v10 sectionMetrics];
  uint64_t v12 = -[GKGridLayout revealMoreForSectionIndex:revealCount:andDeleteItemCount:](self, "revealMoreForSectionIndex:revealCount:andDeleteItemCount:", a3, [v11 incrementalRevealItemCount], 0);

  return v12;
}

- (id)revealMoreForSectionIndex:(int64_t)a3 revealCount:(unint64_t)a4 andDeleteItemCount:(unint64_t)a5
{
  if (a4)
  {
    id v9 = -[GKGridLayout metricDataForSection:](self, "metricDataForSection:");
    double v10 = [v9 sectionMetrics];
    double v32 = [(GKGridLayout *)self collectionView];
    unint64_t v11 = [v32 numberOfItemsInSection:a3];
    unint64_t v12 = [v9 currentMaxVisibleItemCount];
    if (v11 >= v12) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = v11;
    }
    if (a4 >= v11 - v13) {
      unint64_t v14 = v11 - v13;
    }
    else {
      unint64_t v14 = a4;
    }
    unint64_t v15 = v14 - a5 + [v9 currentMaxVisibleItemCount];
    unint64_t v16 = [v10 maximumVisibleItemCount];
    if (v15 <= v16) {
      unint64_t v17 = v16;
    }
    else {
      unint64_t v17 = v15;
    }
    [v9 setCurrentMaxVisibleItemCount:v17];
    if (v11 == a5) {
      [v9 setCurrentMaxVisibleItemCount:-1];
    }
    long long v18 = [MEMORY[0x1E4F1CA80] setWithCapacity:v14];
    if (v14)
    {
      uint64_t v19 = -(uint64_t)a5;
      do
      {
        if (v13 < v11)
        {
          double v20 = [MEMORY[0x1E4F28D58] indexPathForItem:v19 + v13 inSection:a3];
          [v18 addObject:v20];
        }
        ++v13;
        --v14;
      }
      while (v14);
    }
    if ([v9 currentMaxVisibleItemCount] >= v11)
    {
      double v22 = v10;
      int v21 = [v10 shouldAlwaysIncludeShowMore] ^ 1;
    }
    else
    {
      LOBYTE(v21) = 0;
      double v22 = v10;
    }
    self->_noMoreShowMore = v21;
    CGRect v24 = [v22 listForLocation:1];
    double v25 = [(GKGridLayout *)self presentationDataForSection:a3];
    int64_t v26 = [(GKGridLayout *)self indexOfSupplementaryMetricsOfKind:@"IncrementalReveal" inList:v24];
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v27 = v26;
      uint64_t v28 = [v25 numHeaders];
      uint64_t v29 = [v25 numOverlays];
      double v30 = [MEMORY[0x1E4F28D58] indexPathForItem:v28 + v29 + v27 inSection:a3];
      [(GKGridLayout *)self setIndexPathOfTouchedShowMore:v30];
    }
    [(GKGridLayout *)self setRevealedIndexPaths:v18];
    CGRect v23 = [v18 allObjects];
  }
  else
  {
    CGRect v23 = 0;
  }

  return v23;
}

- (id)initialLayoutAttributesForSlidingInItemAtIndexPath:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_indexPathToItem objectForKeyedSubscript:a3];
  unint64_t v5 = (void *)[v4 copy];

  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(GKGridLayout *)self layoutBounds];
  double v15 = -v14;
  if (self->_updateType == 1) {
    double v15 = v14;
  }
  double v16 = v7 + v15;
  [(GKGridLayout *)self yOffsetForSlidingUpdate];
  objc_msgSend(v5, "setFrame:", v16, v9 + v17, v11, v13);

  return v5;
}

- (id)finalLayoutAttributesForSlidingAwayItemAtIndexPath:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_oldIndexPathToItem objectForKeyedSubscript:a3];
  unint64_t v5 = (void *)[v4 copy];

  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(GKGridLayout *)self layoutBounds];
  double v15 = -v14;
  if (self->_updateType != 1) {
    double v15 = v14;
  }
  double v16 = v7 + v15;
  [(GKGridLayout *)self yOffsetForSlidingUpdate];
  objc_msgSend(v5, "setFrame:", v16, v9 - v17, v11, v13);

  return v5;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v61 = self;
  if ([(NSMutableSet *)self->_revealedIndexPaths containsObject:v4])
  {
    unint64_t v5 = [(GKGridLayout *)self layoutAttributesForItemAtIndexPath:v4];
    double v6 = (void *)[v5 copy];

    [v6 setAlpha:0.0];
    if (v6) {
      goto LABEL_74;
    }
    goto LABEL_56;
  }
  if (self->_updateType - 1 <= 1)
  {
    double v7 = [(GKGridLayout *)self collectionView];
    double v8 = [v7 dataSource];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      dataSourceForUpdate = self->_dataSourceForUpdate;
      double v10 = objc_msgSend(v8, "dataSourceForSection:", objc_msgSend(v4, "section"));
      LODWORD(dataSourceForUpdate) = [(GKCollectionViewDataSource *)dataSourceForUpdate containsDataSource:v10];

      if (dataSourceForUpdate)
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        double v11 = self->_currentUpdateItems;
        double v6 = (void *)[(NSArray *)v11 countByEnumeratingWithState:&v73 objects:v79 count:16];
        if (v6)
        {
          obuint64_t j = v8;
          double v12 = v4;
          uint64_t v13 = *(void *)v74;
          while (2)
          {
            for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v74 != v13) {
                objc_enumerationMutation(v11);
              }
              double v15 = *(void **)(*((void *)&v73 + 1) + 8 * i);
              if (!objc_msgSend(v15, "updateAction", v61))
              {
                double v16 = [v15 indexPathAfterUpdate];
                if ([v16 isEqual:v12])
                {

LABEL_52:
                  id v4 = v12;
                  double v6 = [(GKGridLayout *)v61 initialLayoutAttributesForSlidingInItemAtIndexPath:v12];
                  goto LABEL_53;
                }
                double v17 = [v15 indexPathAfterUpdate];
                uint64_t v18 = [v17 section];
                if (v18 == [v12 section])
                {
                  uint64_t v19 = [v15 indexPathAfterUpdate];
                  uint64_t v20 = [v19 item];

                  if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
                    goto LABEL_52;
                  }
                }
                else
                {
                }
              }
            }
            double v6 = (void *)[(NSArray *)v11 countByEnumeratingWithState:&v73 objects:v79 count:16];
            if (v6) {
              continue;
            }
            break;
          }
          id v4 = v12;
LABEL_53:
          double v8 = obj;
        }

LABEL_55:
        if (v6) {
          goto LABEL_74;
        }
        goto LABEL_56;
      }
      oldSectionToMetricKeys = self->_oldSectionToMetricKeys;
      unint64_t v37 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
      unint64_t v38 = [(NSMutableDictionary *)oldSectionToMetricKeys objectForKeyedSubscript:v37];
      unint64_t v39 = -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", [v4 section]);
      char v40 = [v38 isEqual:v39];

      if ((v40 & 1) == 0)
      {
        double v6 = [(GKGridLayout *)self initialLayoutAttributesForSlidingInItemAtIndexPath:v4];
        goto LABEL_55;
      }
    }
    double v6 = 0;
    goto LABEL_55;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obja = self->_currentUpdateItems;
  uint64_t v21 = [(NSArray *)obja countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v70;
LABEL_23:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v70 != v23) {
        objc_enumerationMutation(obja);
      }
      double v25 = *(void **)(*((void *)&v69 + 1) + 8 * v24);
      if (!objc_msgSend(v25, "updateAction", v61))
      {
        int64_t v26 = [v25 indexPathAfterUpdate];
        if ([v26 isEqual:v4])
        {

LABEL_46:
          double v48 = [(NSMutableDictionary *)v61->_indexPathToItem objectForKeyedSubscript:v4];
          double v6 = (void *)[v48 copy];

          double v47 = 0.0;
          goto LABEL_47;
        }
        int64_t v27 = [v25 indexPathAfterUpdate];
        if ([v27 item] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v28 = [v25 indexPathAfterUpdate];
          uint64_t v29 = [v28 section];
          uint64_t v30 = [v4 section];

          if (v29 == v30) {
            goto LABEL_46;
          }
        }
        else
        {
        }
      }
      if ([v25 updateAction] == 3)
      {
        double v31 = [v25 indexPathAfterUpdate];
        if ([v31 isEqual:v4])
        {

LABEL_44:
          oldIndexPathToItem = v61->_oldIndexPathToItem;
          unint64_t v42 = (void *)MEMORY[0x1E4F28D58];
          uint64_t v43 = [v4 item];
          float v44 = [v25 indexPathBeforeUpdate];
          unint64_t v45 = objc_msgSend(v42, "indexPathForItem:inSection:", v43, objc_msgSend(v44, "section"));
          double v46 = [(NSMutableDictionary *)oldIndexPathToItem objectForKeyedSubscript:v45];
          double v6 = (void *)[v46 copy];

          double v47 = 1.0;
LABEL_47:
          [v6 setAlpha:v47];
          goto LABEL_48;
        }
        double v32 = [v25 indexPathAfterUpdate];
        if ([v32 item] == 0x7FFFFFFFFFFFFFFFLL)
        {
          double v33 = [v25 indexPathAfterUpdate];
          uint64_t v34 = [v33 section];
          uint64_t v35 = [v4 section];

          if (v34 == v35) {
            goto LABEL_44;
          }
        }
        else
        {
        }
      }
      if (v22 == ++v24)
      {
        uint64_t v22 = [(NSArray *)obja countByEnumeratingWithState:&v69 objects:v78 count:16];
        if (v22) {
          goto LABEL_23;
        }
        break;
      }
    }
  }
  double v6 = 0;
LABEL_48:

  if (!v6)
  {
LABEL_56:
    id objb = v4;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    double v49 = v61->_currentUpdateItems;
    uint64_t v50 = [(NSArray *)v49 countByEnumeratingWithState:&v65 objects:v77 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v66;
      while (2)
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v66 != v52) {
            objc_enumerationMutation(v49);
          }
          double v54 = *(void **)(*((void *)&v65 + 1) + 8 * j);
          if (objc_msgSend(v54, "updateAction", v61) != 4 && objc_msgSend(v54, "updateAction") != 2)
          {
            double v55 = [v54 indexPathAfterUpdate];
            uint64_t v56 = [v55 item];
            if (v56 == 0x7FFFFFFFFFFFFFFFLL)
            {
              double v6 = [v54 indexPathAfterUpdate];
              uint64_t v57 = [v6 section];
              if (v57 == [objb section])
              {

LABEL_72:
                double v6 = 0;
                id v4 = objb;
                goto LABEL_73;
              }
            }
            int64_t v58 = [v54 indexPathAfterUpdate];
            char v59 = [v58 isEqual:objb];

            if (v56 == 0x7FFFFFFFFFFFFFFFLL) {
            if (v59)
            }
              goto LABEL_72;
          }
        }
        uint64_t v51 = [(NSArray *)v49 countByEnumeratingWithState:&v65 objects:v77 count:16];
        if (v51) {
          continue;
        }
        break;
      }
    }

    id v4 = objb;
    double v49 = [(NSMutableDictionary *)v61->_indexPathToItem objectForKeyedSubscript:objb];
    double v6 = (void *)[(NSArray *)v49 copy];
LABEL_73:
  }
LABEL_74:

  return v6;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_updateType - 1 > 1)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    double v6 = self->_currentUpdateItems;
    uint64_t v19 = [(NSArray *)v6 countByEnumeratingWithState:&v60 objects:v68 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v57 = self;
      uint64_t v21 = *(void *)v61;
      while (2)
      {
        uint64_t v22 = 0;
        uint64_t v59 = v20;
        do
        {
          if (*(void *)v61 != v21) {
            objc_enumerationMutation(v6);
          }
          uint64_t v23 = *(void **)(*((void *)&v60 + 1) + 8 * v22);
          if ([v23 updateAction] == 3)
          {
            uint64_t v24 = [v23 indexPathBeforeUpdate];
            if ([v24 isEqual:v4])
            {

LABEL_39:
              unint64_t v37 = [v23 indexPathAfterUpdate];
              uint64_t v38 = [v37 item];

              self = v57;
              indexPathToItem = v57->_indexPathToItem;
              if (v38 == 0x7FFFFFFFFFFFFFFFLL)
              {
                char v40 = (void *)MEMORY[0x1E4F28D58];
                uint64_t v41 = [v4 item];
                unint64_t v42 = [v23 indexPathAfterUpdate];
                uint64_t v43 = objc_msgSend(v40, "indexPathForItem:inSection:", v41, objc_msgSend(v42, "section"));
                float v44 = [(NSMutableDictionary *)indexPathToItem objectForKeyedSubscript:v43];
                double v10 = (void *)[v44 copy];
              }
              else
              {
                unint64_t v42 = [v23 indexPathAfterUpdate];
                uint64_t v43 = [(NSMutableDictionary *)indexPathToItem objectForKeyedSubscript:v42];
                double v10 = (void *)[v43 copy];
              }

              [v10 setAlpha:1.0];
              goto LABEL_51;
            }
            double v25 = [v23 indexPathBeforeUpdate];
            if ([v25 item] == 0x7FFFFFFFFFFFFFFFLL)
            {
              int64_t v26 = [v23 indexPathBeforeUpdate];
              uint64_t v27 = [v26 section];
              uint64_t v28 = v21;
              uint64_t v29 = v6;
              id v30 = v4;
              uint64_t v31 = [v4 section];

              BOOL v32 = v27 == v31;
              uint64_t v20 = v59;
              id v4 = v30;
              double v6 = v29;
              uint64_t v21 = v28;
              if (v32) {
                goto LABEL_39;
              }
            }
            else
            {
            }
          }
          if ([v23 updateAction] == 1)
          {
            double v33 = [v23 indexPathBeforeUpdate];
            if ([v33 item] == 0x7FFFFFFFFFFFFFFFLL)
            {
            }
            else
            {
              uint64_t v34 = [v23 indexPathBeforeUpdate];
              uint64_t v35 = [v34 section];
              uint64_t v36 = [v4 section];

              if (v35 != v36)
              {
                self = v57;
                uint64_t v51 = [(NSMutableDictionary *)v57->_indexPathToItem objectForKeyedSubscript:v4];
                double v10 = (void *)[v51 copy];

                goto LABEL_51;
              }
            }
          }
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [(NSArray *)v6 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v20) {
          continue;
        }
        break;
      }
      double v10 = 0;
      self = v57;
      goto LABEL_51;
    }
LABEL_37:
    double v10 = 0;
    goto LABEL_51;
  }
  unint64_t v5 = [(GKGridLayout *)self collectionView];
  double v6 = [v5 dataSource];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_37;
  }
  dataSourceForUpdate = self->_dataSourceForUpdate;
  double v8 = -[NSArray dataSourceForSection:](v6, "dataSourceForSection:", [v4 section]);
  LODWORD(dataSourceForUpdate) = [(GKCollectionViewDataSource *)dataSourceForUpdate containsDataSource:v8];

  if (dataSourceForUpdate)
  {
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    double v9 = self->_currentUpdateItems;
    double v10 = (void *)[(NSArray *)v9 countByEnumeratingWithState:&v64 objects:v69 count:16];
    if (v10)
    {
      uint64_t v56 = self;
      int64_t v58 = v6;
      uint64_t v11 = *(void *)v65;
      while (2)
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v65 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v64 + 1) + 8 * i);
          if ([v13 updateAction] == 1)
          {
            double v14 = [v13 indexPathBeforeUpdate];
            if ([v14 isEqual:v4])
            {

LABEL_48:
              self = v56;
              double v10 = [(GKGridLayout *)v56 finalLayoutAttributesForSlidingAwayItemAtIndexPath:v4];
              goto LABEL_49;
            }
            double v15 = [v13 indexPathBeforeUpdate];
            uint64_t v16 = [v15 section];
            if (v16 == [v4 section])
            {
              double v17 = [v13 indexPathBeforeUpdate];
              uint64_t v18 = [v17 item];

              if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
                goto LABEL_48;
              }
            }
            else
            {
            }
          }
        }
        double v10 = (void *)[(NSArray *)v9 countByEnumeratingWithState:&v64 objects:v69 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      self = v56;
LABEL_49:
      double v6 = v58;
    }
    goto LABEL_50;
  }
  oldSectionToMetricKeys = self->_oldSectionToMetricKeys;
  double v46 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "section"));
  double v47 = [(NSMutableDictionary *)oldSectionToMetricKeys objectForKeyedSubscript:v46];
  double v48 = -[GKGridLayout metricDataForSection:](self, "metricDataForSection:", [v4 section]);
  double v49 = [v48 layoutKey];
  char v50 = [v47 isEqual:v49];

  if (v50)
  {
    double v9 = [(NSMutableDictionary *)self->_indexPathToItem objectForKeyedSubscript:v4];
    double v10 = (void *)[(NSArray *)v9 copy];
LABEL_50:

    goto LABEL_51;
  }
  double v10 = [(GKGridLayout *)self finalLayoutAttributesForSlidingAwayItemAtIndexPath:v4];
LABEL_51:

  if (v10 || [(NSArray *)self->_currentUpdateItems count])
  {
    unint64_t updateType = self->_updateType;
    goto LABEL_54;
  }
  unint64_t updateType = self->_updateType;
  if (updateType != 3)
  {
LABEL_54:
    if (updateType != 4) {
      goto LABEL_56;
    }
  }
  uint64_t v53 = [(NSMutableDictionary *)self->_indexPathToItem objectForKeyedSubscript:v4];
  uint64_t v54 = [v53 copy];

  double v10 = (void *)v54;
LABEL_56:

  return v10;
}

- (BOOL)shouldSlideInSupplementaryElementOfKind:(id)a3 forUpdateItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 updateAction] && (objc_msgSend(v8, "isEqualToString:", @"SegmentedBox") & 1) == 0)
  {
    if ((unint64_t)[v10 length] < 2)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_indexPathToMetrics objectForKeyedSubscript:v10];
      double v14 = [v9 indexPathAfterUpdate];
      if ([v14 section] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = [v13 animateWithSection];
        uint64_t v16 = [v9 indexPathAfterUpdate];
        BOOL v17 = v15 == [v16 section];
LABEL_12:
        BOOL v11 = v17;

        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v13 = [v9 indexPathAfterUpdate];
      if ([v13 isEqual:v10])
      {
        BOOL v11 = 1;
LABEL_18:

        goto LABEL_4;
      }
      double v14 = [v9 indexPathAfterUpdate];
      uint64_t v18 = [v14 section];
      if (v18 == [v10 section])
      {
        uint64_t v16 = [v9 indexPathAfterUpdate];
        BOOL v17 = [v16 item] == 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_12;
      }
    }
    BOOL v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  BOOL v11 = 0;
LABEL_4:

  return v11;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v6 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = self->_currentUpdateItems;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v7)
  {
LABEL_25:

    unint64_t v20 = 0x1E9ABE000;
    goto LABEL_31;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v47;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v47 != v9) {
      objc_enumerationMutation(obj);
    }
    BOOL v11 = *(void **)(*((void *)&v46 + 1) + 8 * v10);
    if (self->_updateType - 1 <= 1)
    {
      if ([(GKGridLayout *)self shouldSlideInSupplementaryElementOfKind:v44 forUpdateItem:*(void *)(*((void *)&v46 + 1) + 8 * v10) atIndexPath:v6])
      {
        break;
      }
    }
    if (objc_msgSend(v11, "updateAction", v44)) {
      goto LABEL_15;
    }
    double v12 = [v11 indexPathBeforeUpdate];
    if ([v12 item] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
    uint64_t v13 = [v11 indexPathAfterUpdate];
    uint64_t v14 = [v13 section];
    if (v14 != [v6 section])
    {

LABEL_14:
      goto LABEL_15;
    }
    unint64_t v15 = [v6 length];

    if (v15 >= 2)
    {
      char v40 = [(GKGridLayout *)self layoutAttributesForSupplementaryViewOfKind:v44 atIndexPath:v6];
      uint64_t v41 = (void *)[v40 copy];

      [v41 setAlpha:1.0];
LABEL_29:
      unint64_t v20 = 0x1E9ABE000uLL;
      goto LABEL_30;
    }
LABEL_15:
    if ([v11 updateAction] == 3)
    {
      uint64_t v16 = [v11 indexPathAfterUpdate];
      if ([v16 item] != 0x7FFFFFFFFFFFFFFFLL && !self->_movedItemsInUpdateCarrySections) {
        goto LABEL_22;
      }
      BOOL v17 = [v11 indexPathAfterUpdate];
      uint64_t v18 = [v17 section];
      if (v18 != [v6 section])
      {

LABEL_22:
        goto LABEL_23;
      }
      unint64_t v19 = [v6 length];

      if (v19 >= 2)
      {
        oldIndexPathToSupplementarCGFloat y = self->_oldIndexPathToSupplementary;
        uint64_t v35 = (void *)MEMORY[0x1E4F28D58];
        uint64_t v36 = [v6 item];
        unint64_t v37 = [v11 indexPathBeforeUpdate];
        uint64_t v38 = objc_msgSend(v35, "indexPathForItem:inSection:", v36, objc_msgSend(v37, "section"));
        unint64_t v39 = [(NSMutableDictionary *)oldIndexPathToSupplementary objectForKeyedSubscript:v38];
        uint64_t v41 = (void *)[v39 copy];

        [v41 setIndexPath:v6];
        goto LABEL_29;
      }
    }
LABEL_23:
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_25;
    }
  }
  unint64_t v20 = 0x1E9ABE000uLL;
  uint64_t v21 = [(NSMutableDictionary *)self->_indexPathToSupplementary objectForKeyedSubscript:v6];
  uint64_t v41 = (void *)[v21 copy];

  [v41 frame];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  [(GKGridLayout *)self layoutBounds];
  double v31 = -v30;
  if (self->_updateType == 1) {
    double v31 = v30;
  }
  double v32 = v23 + v31;
  [(GKGridLayout *)self yOffsetForSlidingUpdate];
  objc_msgSend(v41, "setFrame:", v32, v25 + v33, v27, v29);
LABEL_30:

  if (v41) {
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v42 = objc_msgSend(*(id *)((char *)&self->super.super.isa + *(int *)(v20 + 2904)), "objectForKeyedSubscript:", v6, v44);
  uint64_t v41 = (void *)[v42 copy];

LABEL_32:

  return v41;
}

- (double)yOffsetForSlidingUpdate
{
  uint64_t v3 = [(GKGridLayout *)self collectionView];
  [v3 contentOffset];
  double v5 = v4;
  [v3 frame];
  double v7 = v6;
  [v3 contentInset];
  double v9 = v5 + v7 - v8;
  double height = self->_laidOutContentSize.height;
  if (v9 <= height) {
    double v11 = 0.0;
  }
  else {
    double v11 = v9 - height;
  }

  return v11;
}

- (BOOL)shouldSlideOutSupplementaryElementOfKind:(id)a3 forUpdateItem:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 updateAction] == 1 && (objc_msgSend(v8, "isEqualToString:", @"SegmentedBox") & 1) == 0)
  {
    if ((unint64_t)[v10 length] < 2)
    {
      double v12 = [(NSMutableDictionary *)self->_indexPathToMetrics objectForKeyedSubscript:v10];
      uint64_t v13 = [v9 indexPathBeforeUpdate];
      if ([v13 section] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = [v12 animateWithSection];
        unint64_t v15 = [v9 indexPathBeforeUpdate];
        BOOL v16 = v14 == [v15 section];
LABEL_11:
        BOOL v11 = v16;

        goto LABEL_16;
      }
    }
    else
    {
      double v12 = [v9 indexPathBeforeUpdate];
      if ([v12 isEqual:v10])
      {
        BOOL v11 = 1;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v13 = [v9 indexPathBeforeUpdate];
      uint64_t v17 = [v13 section];
      if (v17 == [v10 section])
      {
        unint64_t v15 = [v9 indexPathBeforeUpdate];
        BOOL v16 = [v15 item] == 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_11;
      }
    }
    BOOL v11 = 0;
LABEL_16:

    goto LABEL_17;
  }
  BOOL v11 = 0;
LABEL_18:

  return v11;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v42 = a3;
  id v6 = a4;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = self->_currentUpdateItems;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (!v7)
  {
LABEL_25:

    goto LABEL_30;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v45;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v45 != v9) {
      objc_enumerationMutation(obj);
    }
    BOOL v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
    if (self->_updateType - 1 <= 1)
    {
      if ([(GKGridLayout *)self shouldSlideOutSupplementaryElementOfKind:v42 forUpdateItem:*(void *)(*((void *)&v44 + 1) + 8 * v10) atIndexPath:v6])
      {
        break;
      }
    }
    if (objc_msgSend(v11, "updateAction", v42) != 1) {
      goto LABEL_15;
    }
    double v12 = [v11 indexPathBeforeUpdate];
    if ([v12 item] != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
    uint64_t v13 = [v11 indexPathBeforeUpdate];
    uint64_t v14 = [v13 section];
    if (v14 != [v6 section])
    {

LABEL_14:
      goto LABEL_15;
    }
    unint64_t v15 = [v6 length];

    if (v15 >= 2)
    {
      unint64_t v39 = [(NSMutableDictionary *)self->_oldIndexPathToSupplementary objectForKeyedSubscript:v6];
      [v39 setAlpha:0.0];
      goto LABEL_29;
    }
LABEL_15:
    if ([v11 updateAction] == 3)
    {
      BOOL v16 = [v11 indexPathBeforeUpdate];
      if ([v16 item] != 0x7FFFFFFFFFFFFFFFLL && !self->_movedItemsInUpdateCarrySections) {
        goto LABEL_22;
      }
      uint64_t v17 = [v11 indexPathBeforeUpdate];
      uint64_t v18 = [v17 section];
      if (v18 != [v6 section])
      {

LABEL_22:
        goto LABEL_23;
      }
      unint64_t v19 = [v6 length];

      if (v19 >= 2)
      {
        indexPathToSupplementarCGFloat y = self->_indexPathToSupplementary;
        uint64_t v34 = (void *)MEMORY[0x1E4F28D58];
        uint64_t v35 = [v6 item];
        uint64_t v36 = [v11 indexPathAfterUpdate];
        unint64_t v37 = objc_msgSend(v34, "indexPathForItem:inSection:", v35, objc_msgSend(v36, "section"));
        uint64_t v38 = [(NSMutableDictionary *)indexPathToSupplementary objectForKeyedSubscript:v37];
        unint64_t v39 = (void *)[v38 copy];

        [v39 setIndexPath:v6];
        goto LABEL_29;
      }
    }
LABEL_23:
    if (v8 == ++v10)
    {
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v8) {
        goto LABEL_3;
      }
      goto LABEL_25;
    }
  }
  unint64_t v20 = [(NSMutableDictionary *)self->_oldIndexPathToSupplementary objectForKeyedSubscript:v6];
  unint64_t v39 = (void *)[v20 copy];

  [v39 frame];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  [(GKGridLayout *)self layoutBounds];
  double v30 = -v29;
  if (self->_updateType != 1) {
    double v30 = v29;
  }
  double v31 = v22 + v30;
  [(GKGridLayout *)self yOffsetForSlidingUpdate];
  objc_msgSend(v39, "setFrame:", v31, v24 - v32, v26, v28);
LABEL_29:

  if (v39) {
    goto LABEL_31;
  }
LABEL_30:
  char v40 = -[NSMutableDictionary objectForKeyedSubscript:](self->_indexPathToSupplementary, "objectForKeyedSubscript:", v6, v42);
  unint64_t v39 = (void *)[v40 copy];

LABEL_31:

  return v39;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3);
  double v5 = v4;
  if (self->_noMoreShowMore && self->_indexPathOfTouchedShowMore) {
    objc_msgSend(v4, "addObject:");
  }

  return v5;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  id v4 = a3;
  [(GKGridLayout *)self setCurrentUpdateItems:v4];
  v5.receiver = self;
  v5.super_class = (Class)GKGridLayout;
  [(GKGridLayout *)&v5 prepareForCollectionViewUpdates:v4];
}

- (void)finalizeCollectionViewUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)GKGridLayout;
  [(GKGridLayout *)&v3 finalizeCollectionViewUpdates];
  [(NSMutableSet *)self->_revealedIndexPaths removeAllObjects];
  [(GKGridLayout *)self setCurrentUpdateItems:0];
  [(GKGridLayout *)self setIndexPathOfTouchedShowMore:0];
  [(GKGridLayout *)self setUpdateType:6];
  [(GKGridLayout *)self setDataSourceForUpdate:0];
  [(GKGridLayout *)self setMovedItemsInUpdateCarrySections:0];
  self->_oldLaidOutContentSize = self->_laidOutContentSize;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKGridLayout;
  -[GKGridLayout prepareForAnimatedBoundsChange:](&v6, sel_prepareForAnimatedBoundsChange_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = [(GKGridLayout *)self collectionView];
  objc_super v5 = [v4 dataSource];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_super v5 = 0;
  }
  [(GKGridLayout *)self prepareForUpdate:3 inDataSource:v5];
}

- (void)finalizeAnimatedBoundsChange
{
  v3.receiver = self;
  v3.super_class = (Class)GKGridLayout;
  [(GKGridLayout *)&v3 finalizeAnimatedBoundsChange];
  [(GKGridLayout *)self setUpdateType:6];
  [(GKGridLayout *)self setDataSourceForUpdate:0];
}

- (void)prepareForUpdate:(unint64_t)a3 inDataSource:(id)a4
{
  id v6 = a4;
  [(GKGridLayout *)self setUpdateType:a3];
  [(GKGridLayout *)self setDataSourceForUpdate:v6];
}

- (void)prepareForMovingItemsCarryingSections
{
  self->_movedItemsInUpdateCarrySections = 1;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a5 != 2
    || self->_updateType
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v9 representedElementCategory])
  {
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v13 = self->_currentUpdateItems;
  uint64_t v10 = (void *)[(NSArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v10) {
    goto LABEL_28;
  }
  double v27 = v8;
  double v28 = v13;
  uint64_t v14 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v32 != v14) {
        objc_enumerationMutation(v13);
      }
      BOOL v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if ([v16 updateAction] == 1)
      {
        uint64_t v17 = [v9 indexPath];
        uint64_t v18 = [v16 indexPathBeforeUpdate];
        if ([v17 isEqual:v18])
        {
          [v9 alpha];
          double v20 = v19;

          if (v20 == 0.0) {
            goto LABEL_27;
          }
        }
        else
        {
          double v21 = [v9 indexPath];
          uint64_t v22 = [v21 section];
          double v23 = [v16 indexPathBeforeUpdate];
          if (v22 != [v23 section]) {
            goto LABEL_23;
          }
          double v24 = [v16 indexPathBeforeUpdate];
          if ([v24 item] != 0x7FFFFFFFFFFFFFFFLL)
          {

LABEL_23:
            uint64_t v13 = v28;
            continue;
          }
          [v9 alpha];
          double v26 = v25;

          uint64_t v13 = v28;
          if (v26 == 0.0)
          {
LABEL_27:
            v29[0] = MEMORY[0x1E4F143A8];
            v29[1] = 3221225472;
            v29[2] = __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
            v29[3] = &unk_1E5F63A78;
            id v8 = v27;
            id v30 = v27;
            uint64_t v10 = (void *)[v29 copy];

            goto LABEL_28;
          }
        }
      }
    }
    uint64_t v10 = (void *)[(NSArray *)v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  id v8 = v27;
LABEL_28:

LABEL_6:
  BOOL v11 = _Block_copy(v10);

  return v11;
}

void __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  v8[3] = &unk_1E5F62EB0;
  id v9 = *(id *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v6[3] = &unk_1E5F631C0;
  id v7 = v3;
  id v5 = v3;
  [v4 animateWithDuration:v8 animations:v6 completion:0.2];
}

uint64_t __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) closeForDelete];
}

uint64_t __66__GKGridLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (unint64_t)portraitInterleavedSectionsCount
{
  return self->_portraitInterleavedSectionsCount;
}

- (unint64_t)landscapeInterleavedSectionsCount
{
  return self->_landscapeInterleavedSectionsCount;
}

- (double)leftLayoutGuideOffset
{
  return self->_leftLayoutGuideOffset;
}

- (double)rightLayoutGuideOffset
{
  return self->_rightLayoutGuideOffset;
}

- (BOOL)hideSearchBarOnAppear
{
  return self->_hideSearchBarOnAppear;
}

- (void)setHideSearchBarOnAppear:(BOOL)a3
{
  self->_hideSearchBarOnAppear = a3;
}

- (BOOL)hideAboveSegmentOnAppear
{
  return self->_hideAboveSegmentOnAppear;
}

- (void)setHideAboveSegmentOnAppear:(BOOL)a3
{
  self->_hideAboveSegmentOnAppear = a3;
}

- (CGSize)laidOutContentSize
{
  double width = self->_laidOutContentSize.width;
  double height = self->_laidOutContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLaidOutContentSize:(CGSize)a3
{
  self->_laidOutContentSize = a3;
}

- (CGSize)minimumLaidOutContentSize
{
  double width = self->_minimumLaidOutContentSize.width;
  double height = self->_minimumLaidOutContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setMinimumLaidOutContentSize:(CGSize)a3
{
  self->_minimumLaidOutContentSize = a3;
}

- (double)bottomContentPadding
{
  return self->_bottomContentPadding;
}

- (void)setBottomContentPadding:(double)a3
{
  self->_bottomContentPadding = a3;
}

- (BOOL)ignoreBoundsForSizeCalculation
{
  return self->_ignoreBoundsForSizeCalculation;
}

- (void)setIgnoreBoundsForSizeCalculation:(BOOL)a3
{
  self->_ignoreBoundsForSizeCalculation = a3;
}

- (NSPointerArray)sectionToPresentationData
{
  return self->_sectionToPresentationData;
}

- (void)setSectionToPresentationData:(id)a3
{
}

- (NSPointerArray)sectionToMetricData
{
  return self->_sectionToMetricData;
}

- (void)setSectionToMetricData:(id)a3
{
}

- (NSMutableArray)laidOutAttributes
{
  return self->_laidOutAttributes;
}

- (void)setLaidOutAttributes:(id)a3
{
}

- (NSMutableOrderedSet)laidOutPinnableAttributes
{
  return self->_laidOutPinnableAttributes;
}

- (void)setLaidOutPinnableAttributes:(id)a3
{
}

- (CGSize)oldLaidOutContentSize
{
  double width = self->_oldLaidOutContentSize.width;
  double height = self->_oldLaidOutContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOldLaidOutContentSize:(CGSize)a3
{
  self->_oldLaidOutContentSize = a3;
}

- (NSMutableDictionary)indexPathToSupplementary
{
  return self->_indexPathToSupplementary;
}

- (void)setIndexPathToSupplementary:(id)a3
{
}

- (NSMutableDictionary)indexPathToDecoration
{
  return self->_indexPathToDecoration;
}

- (void)setIndexPathToDecoration:(id)a3
{
}

- (NSMutableDictionary)indexPathToItem
{
  return self->_indexPathToItem;
}

- (void)setIndexPathToItem:(id)a3
{
}

- (NSMutableDictionary)oldIndexPathToSupplementary
{
  return self->_oldIndexPathToSupplementary;
}

- (void)setOldIndexPathToSupplementary:(id)a3
{
}

- (NSMutableDictionary)oldIndexPathToDecoration
{
  return self->_oldIndexPathToDecoration;
}

- (void)setOldIndexPathToDecoration:(id)a3
{
}

- (NSMutableDictionary)oldIndexPathToItem
{
  return self->_oldIndexPathToItem;
}

- (void)setOldIndexPathToItem:(id)a3
{
}

- (NSMutableDictionary)indexPathToMetrics
{
  return self->_indexPathToMetrics;
}

- (void)setIndexPathToMetrics:(id)a3
{
}

- (NSMutableIndexSet)sectionsWithPinnedHeaders
{
  return self->_sectionsWithPinnedHeaders;
}

- (void)setSectionsWithPinnedHeaders:(id)a3
{
}

- (NSMutableSet)revealedIndexPaths
{
  return self->_revealedIndexPaths;
}

- (void)setRevealedIndexPaths:(id)a3
{
}

- (NSIndexPath)indexPathOfTouchedShowMore
{
  return self->_indexPathOfTouchedShowMore;
}

- (void)setIndexPathOfTouchedShowMore:(id)a3
{
}

- (BOOL)noMoreShowMore
{
  return self->_noMoreShowMore;
}

- (void)setNoMoreShowMore:(BOOL)a3
{
  self->_noMoreShowMore = a3;
}

- (NSMutableDictionary)keyToMetricData
{
  return self->_keyToMetricData;
}

- (void)setKeyToMetricData:(id)a3
{
}

- (NSMutableDictionary)oldSectionToMetricKeys
{
  return self->_oldSectionToMetricKeys;
}

- (void)setOldSectionToMetricKeys:(id)a3
{
}

- (int64_t)metricsInvalidationCount
{
  return self->_metricsInvalidationCount;
}

- (void)setMetricsInvalidationCount:(int64_t)a3
{
  self->_metricsInvalidationCount = a3;
}

- (NSArray)currentUpdateItems
{
  return self->_currentUpdateItems;
}

- (void)setCurrentUpdateItems:(id)a3
{
}

- (NSMutableSet)knownSupplementaryKinds
{
  return self->_knownSupplementaryKinds;
}

- (void)setKnownSupplementaryKinds:(id)a3
{
}

- (GKCollectionViewDataSource)dataSourceForUpdate
{
  return self->_dataSourceForUpdate;
}

- (void)setDataSourceForUpdate:(id)a3
{
}

- (unint64_t)updateType
{
  return self->_updateType;
}

- (BOOL)movedItemsInUpdateCarrySections
{
  return self->_movedItemsInUpdateCarrySections;
}

- (void)setMovedItemsInUpdateCarrySections:(BOOL)a3
{
  self->_movedItemsInUpdateCarrySections = a3;
}

- (BOOL)displayClipView
{
  return self->_displayClipView;
}

- (void)setDisplayClipView:(BOOL)a3
{
  self->_displayClipView = a3;
}

- (GKCollectionViewLayoutAttributes)clipViewAttributes
{
  return self->_clipViewAttributes;
}

- (void)setClipViewAttributes:(id)a3
{
}

- (unint64_t)invalidationFlags
{
  return self->_invalidationFlags;
}

- (void)setInvalidationFlags:(unint64_t)a3
{
  self->_invalidationFlags = a3;
}

- (BOOL)displayingOverlay
{
  return self->_displayingOverlay;
}

- (void)setDisplayingOverlay:(BOOL)a3
{
  self->_displayingOverlaCGFloat y = a3;
}

- (double)segmentedBoxY
{
  return self->_segmentedBoxY;
}

- (void)setSegmentedBoxY:(double)a3
{
  self->_segmentedBoxY = a3;
}

- (BOOL)shouldLayoutRTL
{
  return self->_shouldLayoutRTL;
}

- (void)setShouldLayoutRTL:(BOOL)a3
{
  self->_shouldLayoutRTL = a3;
}

- (NSSet)visibleIndexPathsFilter
{
  return self->_visibleIndexPathsFilter;
}

- (void)setDefaultSectionMetricsInternal:(id)a3
{
}

- (GKDataSourceMetrics)dataSourceMetrics
{
  return self->_dataSourceMetrics;
}

- (void)setDataSourceMetrics:(id)a3
{
}

- (double)hiddenSearchBarOffset
{
  return self->_hiddenSearchBarOffset;
}

- (void)setHiddenSearchBarOffset:(double)a3
{
  self->_double hiddenSearchBarOffset = a3;
}

- (double)segmentedHeaderPinningOffset
{
  return self->_segmentedHeaderPinningOffset;
}

- (void)setSegmentedHeaderPinningOffset:(double)a3
{
  self->_segmentedHeaderPinningOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceMetrics, 0);
  objc_storeStrong((id *)&self->_defaultSectionMetricsInternal, 0);
  objc_storeStrong((id *)&self->_visibleIndexPathsFilter, 0);
  objc_storeStrong((id *)&self->_clipViewAttributes, 0);
  objc_storeStrong((id *)&self->_dataSourceForUpdate, 0);
  objc_storeStrong((id *)&self->_knownSupplementaryKinds, 0);
  objc_storeStrong((id *)&self->_currentUpdateItems, 0);
  objc_storeStrong((id *)&self->_oldSectionToMetricKeys, 0);
  objc_storeStrong((id *)&self->_keyToMetricData, 0);
  objc_storeStrong((id *)&self->_indexPathOfTouchedShowMore, 0);
  objc_storeStrong((id *)&self->_revealedIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionsWithPinnedHeaders, 0);
  objc_storeStrong((id *)&self->_indexPathToMetrics, 0);
  objc_storeStrong((id *)&self->_oldIndexPathToItem, 0);
  objc_storeStrong((id *)&self->_oldIndexPathToDecoration, 0);
  objc_storeStrong((id *)&self->_oldIndexPathToSupplementary, 0);
  objc_storeStrong((id *)&self->_indexPathToItem, 0);
  objc_storeStrong((id *)&self->_indexPathToDecoration, 0);
  objc_storeStrong((id *)&self->_indexPathToSupplementary, 0);
  objc_storeStrong((id *)&self->_laidOutPinnableAttributes, 0);
  objc_storeStrong((id *)&self->_laidOutAttributes, 0);
  objc_storeStrong((id *)&self->_sectionToMetricData, 0);

  objc_storeStrong((id *)&self->_sectionToPresentationData, 0);
}

@end