@interface MUCuratedGuidesSectionController
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (BOOL)shouldShowMoreButton;
- (MKPlaceCollectionsDelegate)collectionsDelegate;
- (MUCuratedCollectionsPlacecardAnalyticsManager)analyticsManager;
- (MUCuratedGuidesSectionController)initWithDelegate:(id)a3 withPlaceCollections:(id)a4 usingSyncCoordinator:(id)a5 usingMapItem:(id)a6 usingCollectionIds:(id)a7 exploreGuides:(id)a8;
- (MUCuratedGuidesSectionView)carouselView;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (NSArray)collectionIds;
- (NSArray)placeCollections;
- (UIView)sectionView;
- (id)_sectionHeaderTitle;
- (id)draggableContent;
- (int)analyticsModuleType;
- (void)_seeAllTapped;
- (void)_setupCollectionView;
- (void)_setupViews;
- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5;
- (void)collectionsCarouselDidScrollBackward;
- (void)collectionsCarouselDidScrollForward;
- (void)exploreGuidesButtonTapped;
- (void)refreshCollections;
- (void)setActive:(BOOL)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setCarouselView:(id)a3;
- (void)setCollectionIds:(id)a3;
- (void)setCollectionsDelegate:(id)a3;
- (void)setPlaceCollections:(id)a3;
@end

@implementation MUCuratedGuidesSectionController

- (MUCuratedGuidesSectionController)initWithDelegate:(id)a3 withPlaceCollections:(id)a4 usingSyncCoordinator:(id)a5 usingMapItem:(id)a6 usingCollectionIds:(id)a7 exploreGuides:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v30.receiver = self;
  v30.super_class = (Class)MUCuratedGuidesSectionController;
  v19 = [(MUPlaceSectionController *)&v30 initWithMapItem:a6];
  if (v19)
  {
    v20 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerInit", "", v29, 2u);
    }

    v21 = objc_alloc_init(MUCuratedCollectionsPlacecardAnalyticsManager);
    analyticsManager = v19->_analyticsManager;
    v19->_analyticsManager = v21;

    v23 = [[MUCuratedGuidesSectionView alloc] initCollectionsCarouselViewWithPlaceCollections:v15 usingSyncCoordinator:v16 withRoutingDelegate:v14 withScrollViewDelegate:v19 withAnalyticsDelegate:v19 exploreGuides:v18];
    carouselView = v19->_carouselView;
    v19->_carouselView = v23;

    objc_storeWeak((id *)&v19->_collectionsDelegate, v14);
    objc_storeStrong((id *)&v19->_collectionIds, a7);
    uint64_t v25 = [v15 copy];
    placeCollections = v19->_placeCollections;
    v19->_placeCollections = (NSArray *)v25;

    [(MUCuratedGuidesSectionController *)v19 _setupViews];
    v27 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerInit", "", v29, 2u);
    }
  }
  return v19;
}

- (void)_setupViews
{
  v3 = [MUPlaceSectionView alloc];
  v4 = [(MUCuratedGuidesSectionController *)self sectionHeaderViewModel];
  v5 = [(MUPlaceSectionView *)v3 initWithStyle:0 sectionHeaderViewModel:v4];
  sectionView = self->_sectionView;
  self->_sectionView = v5;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  [(MUPlaceSectionView *)self->_sectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = self->_sectionView;
  id v8 = [(MUCuratedGuidesSectionController *)self carouselView];
  [(MUPlaceSectionView *)v7 attachViewToContentView:v8];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    v4 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerActivate", "", buf, 2u);
    }

    [(MUCuratedGuidesSectionController *)self _setupCollectionView];
    v5 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUCuratedGuidesSectionControllerActivate", "", v6, 2u);
    }
  }
}

- (void)_setupCollectionView
{
  if (self->_active)
  {
    id v2 = [(MUCuratedGuidesSectionController *)self carouselView];
    [v2 displayCollectionsIfNeeded];
  }
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)collectionsCarouselDidScrollForward
{
  id v2 = [(MUCuratedGuidesSectionController *)self analyticsManager];
  [v2 placecardCollectionsScrollForward];
}

- (void)collectionsCarouselDidScrollBackward
{
  id v2 = [(MUCuratedGuidesSectionController *)self analyticsManager];
  [v2 placecardCollectionsScrollBackward];
}

- (void)collectionsCarouselDidRouteToCollectionId:(id)a3 atIndex:(int64_t)a4 isSaved:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [(MUCuratedGuidesSectionController *)self analyticsManager];
  [v9 placecardCollectionTapped:v8 atIndex:a4 isCurrentlySaved:v5];
}

- (void)exploreGuidesButtonTapped
{
  id v2 = [(MUCuratedGuidesSectionController *)self analyticsManager];
  [v2 placecardExploreGuidesButtonTapped];
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    BOOL v4 = [(MUCuratedGuidesSectionController *)self shouldShowMoreButton];
    BOOL v5 = [MUPlaceSectionHeaderViewModel alloc];
    v6 = [(MUCuratedGuidesSectionController *)self _sectionHeaderTitle];
    v7 = [(MUPlaceSectionHeaderViewModel *)v5 initWithTitleString:v6 showSeeMore:v4];
    id v8 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v7;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
    if (v4)
    {
      [(MUPlaceSectionHeaderViewModel *)sectionHeaderViewModel setTarget:self selector:sel__seeAllTapped];
      sectionHeaderViewModel = self->_sectionHeaderViewModel;
    }
  }
  return sectionHeaderViewModel;
}

- (id)draggableContent
{
  return 0;
}

- (void)refreshCollections
{
}

- (void)_seeAllTapped
{
  id v6 = [(MUCuratedGuidesSectionController *)self collectionsDelegate];
  v3 = [(MUCuratedGuidesSectionController *)self placeCollections];
  BOOL v4 = [(MUPlaceSectionHeaderViewModel *)self->_sectionHeaderViewModel titleString];
  BOOL v5 = [(MUCuratedGuidesSectionController *)self collectionIds];
  [v6 showAllCollections:v3 usingTitle:v4 usingCollectionIds:v5];
}

- (id)_sectionHeaderTitle
{
  v3 = [(MUPlaceSectionController *)self mapItem];
  char v4 = [v3 _isMapItemTypeSettlement];

  if (v4)
  {
    BOOL v5 = @"[Curated Collections] Guides";
  }
  else if ([(NSArray *)self->_placeCollections count] == 1)
  {
    BOOL v5 = @"[Curated Collections] poi section title for single guide";
  }
  else
  {
    BOOL v5 = @"[Curated Collections] poi section title for more than 1 guide";
  }
  id v6 = _MULocalizedStringFromThisBundle(v5);
  return v6;
}

- (BOOL)shouldShowMoreButton
{
  v3 = [(MUCuratedGuidesSectionController *)self carouselView];
  char v4 = [v3 traitCollection];
  if ([v4 userInterfaceIdiom] == 5)
  {
    BOOL v5 = [(MUCuratedGuidesSectionController *)self placeCollections];
    unint64_t v6 = [v5 count];

    if (v6 > 5) {
      return 1;
    }
  }
  else
  {
  }
  id v8 = [(MUCuratedGuidesSectionController *)self carouselView];
  if ([v8 isShowingExploreGuides])
  {
    BOOL v7 = 0;
  }
  else
  {
    id v9 = [(MUCuratedGuidesSectionController *)self placeCollections];
    BOOL v7 = (unint64_t)[v9 count] > 5;
  }
  return v7;
}

- (int)analyticsModuleType
{
  return 31;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUCuratedGuidesSectionView)carouselView
{
  return self->_carouselView;
}

- (void)setCarouselView:(id)a3
{
}

- (MUCuratedCollectionsPlacecardAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (MKPlaceCollectionsDelegate)collectionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionsDelegate);
  return (MKPlaceCollectionsDelegate *)WeakRetained;
}

- (void)setCollectionsDelegate:(id)a3
{
}

- (NSArray)collectionIds
{
  return self->_collectionIds;
}

- (void)setCollectionIds:(id)a3
{
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_collectionIds, 0);
  objc_destroyWeak((id *)&self->_collectionsDelegate);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end