@interface MUCuratedGuidesSectionView
- (BOOL)isShowingExploreGuides;
- (MKCollectionsCarouselView)carouselView;
- (MKPlaceCollectionsDelegate)collectionsDelegate;
- (id)initCollectionsCarouselViewWithPlaceCollections:(id)a3 usingSyncCoordinator:(id)a4 withRoutingDelegate:(id)a5 withScrollViewDelegate:(id)a6 withAnalyticsDelegate:(id)a7 exploreGuides:(id)a8;
- (int64_t)carouselContext;
- (void)_setupSubviews;
- (void)displayCollectionsIfNeeded;
- (void)refreshCollections;
- (void)setCarouselView:(id)a3;
- (void)setCollectionsDelegate:(id)a3;
@end

@implementation MUCuratedGuidesSectionView

- (id)initCollectionsCarouselViewWithPlaceCollections:(id)a3 usingSyncCoordinator:(id)a4 withRoutingDelegate:(id)a5 withScrollViewDelegate:(id)a6 withAnalyticsDelegate:(id)a7 exploreGuides:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)MUCuratedGuidesSectionView;
  v20 = -[MUCuratedGuidesSectionView initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v20)
  {
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F30E68]), "initCollectionsCarouselViewWithContext:withPlaceCollections:usingSyncCoordinator:withRoutingDelegate:withScrollViewDelegate:withAnalyticsDelegate:exploreGuides:", -[MUCuratedGuidesSectionView carouselContext](v20, "carouselContext"), v14, v15, v16, v17, v18, v19);
    carouselView = v20->_carouselView;
    v20->_carouselView = (MKCollectionsCarouselView *)v21;

    v20->_isSingleCollection = [v14 count] == 1;
    [(MUCuratedGuidesSectionView *)v20 _setupSubviews];
  }

  return v20;
}

- (void)_setupSubviews
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if (MapKitIdiomIsMacCatalyst())
  {
    v3 = [[MUPagingScrollContainerView alloc] initWithHorizontalScrollView:self->_carouselView];
    p_pagingContainerView = (id *)&self->_pagingContainerView;
    pagingContainerView = self->_pagingContainerView;
    self->_pagingContainerView = v3;
  }
  else
  {
    p_pagingContainerView = (id *)&self->_carouselView;
  }
  id v6 = *p_pagingContainerView;
  [(MUCuratedGuidesSectionView *)self addSubview:v6];
  v7 = [[MUEdgeLayout alloc] initWithItem:v6 container:self];
  objc_msgSend(MEMORY[0x1E4F30E68], "horizontalLayoutHeightInContext:includeExploreGuidesHeight:isSingleCollection:", -[MUCuratedGuidesSectionView carouselContext](self, "carouselContext"), -[MKCollectionsCarouselView isShowingExploreGuides](self->_carouselView, "isShowingExploreGuides"), self->_isSingleCollection);
  v8 = [MUSizeLayout alloc];
  carouselView = self->_carouselView;
  +[MUSizeLayout useIntrinsicContentSize];
  v10 = -[MUSizeLayout initWithItem:size:](v8, "initWithItem:size:", carouselView);
  v11 = (void *)MEMORY[0x1E4F28DC8];
  v13[0] = v7;
  v13[1] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  objc_msgSend(v11, "_mapsui_activateLayouts:", v12);
}

- (int64_t)carouselContext
{
  if (MapKitIdiomIsMacCatalyst()) {
    return 6;
  }
  else {
    return 1;
  }
}

- (void)displayCollectionsIfNeeded
{
  v3 = [(MUCuratedGuidesSectionView *)self carouselView];
  char v4 = [v3 isDisplayingCollections];

  if ((v4 & 1) == 0)
  {
    id v5 = [(MUCuratedGuidesSectionView *)self carouselView];
    [v5 displayCollections];
  }
}

- (void)refreshCollections
{
}

- (BOOL)isShowingExploreGuides
{
  return [(MKCollectionsCarouselView *)self->_carouselView isShowingExploreGuides];
}

- (MKPlaceCollectionsDelegate)collectionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionsDelegate);
  return (MKPlaceCollectionsDelegate *)WeakRetained;
}

- (void)setCollectionsDelegate:(id)a3
{
}

- (MKCollectionsCarouselView)carouselView
{
  return self->_carouselView;
}

- (void)setCarouselView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_destroyWeak((id *)&self->_collectionsDelegate);
  objc_storeStrong((id *)&self->_pagingContainerView, 0);
}

@end