@interface MKPlaceHoursViewController
+ (id)placeHoursWithMapItem:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldOnlyShowExpanded;
- (BOOL)resizableViewsDisabled;
- (MKMapItem)mapItem;
- (MKPlaceHoursViewController)initWithMapItem:(id)a3;
- (NSArray)businessHours;
- (NSTimeZone)timeZone;
- (_MKInfoCardAnalyticsDelegate)analyticsDelegate;
- (id)hoursBuilderWithHours:(id)a3;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)titleString;
- (void)_contentSizeDidChange;
- (void)_setExpanded:(BOOL)a3;
- (void)_toggleShowAllHours;
- (void)_updateHoursAnimated:(BOOL)a3;
- (void)infoCardThemeChanged;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setResizableViewsDisabled:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MKPlaceHoursViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)placeHoursWithMapItem:(id)a3
{
  id v3 = a3;
  if (([v3 _isMapItemTypeBrand] & 1) != 0
    || ([v3 _businessHours],
        v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = [[MKPlaceHoursViewController alloc] initWithMapItem:v3];
  }

  return v6;
}

- (MKPlaceHoursViewController)initWithMapItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MKPlaceHoursViewController;
  uint64_t v5 = [(MKPlaceHoursViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(MKPlaceHoursViewController *)v5 setMapItem:v4];
  }

  return v6;
}

- (id)titleString
{
  return _MKLocalizedStringFromThisBundle(@"PlaceView_Hours");
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MKPlaceHoursViewController;
  [(MKPlaceHoursViewController *)&v11 viewDidLoad];
  id v3 = [(MKPlaceSectionViewController *)self sectionView];
  [v3 setPreservesSuperviewLayoutMargins:1];

  id v4 = [MKPlaceSectionHeaderView alloc];
  uint64_t v5 = -[MKPlaceSectionHeaderView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  headerView = self->_headerView;
  self->_headerView = v5;

  [(MKPlaceSectionHeaderView *)self->_headerView setShowSeeMoreButton:1];
  [(MKViewWithHairline *)self->_headerView setBottomHairlineHidden:1];
  v7 = [(MKPlaceHoursViewController *)self titleString];
  [(MKPlaceSectionHeaderView *)self->_headerView setTitle:v7];

  [(MKPlaceSectionHeaderView *)self->_headerView setTarget:self action:sel__toggleShowAllHours];
  objc_super v8 = self->_headerView;
  v9 = [(MKPlaceSectionViewController *)self sectionView];
  [v9 setHeaderView:v8];

  [(MKPlaceHoursViewController *)self _setExpanded:self->_isExpanded];
  v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__contentSizeDidChange name:*MEMORY[0x1E4F43788] object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MKPlaceHoursViewController;
  [(MKPlaceHoursViewController *)&v7 viewWillAppear:a3];
  id v4 = [(MKPlaceSectionViewController *)self sectionView];
  uint64_t v5 = [v4 rowViews];
  uint64_t v6 = [v5 count];

  if (!v6) {
    [(MKPlaceHoursViewController *)self _updateHoursAnimated:0];
  }
}

- (void)setResizableViewsDisabled:(BOOL)a3
{
  if (self->_resizableViewsDisabled != a3)
  {
    self->_resizableViewsDisabled = a3;
    if (a3)
    {
      [(MKPlaceHoursViewController *)self _setExpanded:1];
      if ([(MKPlaceHoursViewController *)self isViewLoaded])
      {
        [(MKPlaceHoursViewController *)self _updateHoursAnimated:0];
      }
    }
    else
    {
      BOOL isExpanded = self->_isExpanded;
      [(MKPlaceHoursViewController *)self _setExpanded:isExpanded];
    }
  }
}

- (NSTimeZone)timeZone
{
  return [(MKMapItem *)self->_mapItem timeZone];
}

- (id)hoursBuilderWithHours:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [_MKLocalizedHoursBuilder alloc];
  uint64_t v6 = [(MKPlaceHoursViewController *)self timeZone];
  objc_super v7 = [(_MKLocalizedHoursBuilder *)v5 initWithBusinessHours:v4 timeZone:v6 localizedHoursStringOptions:0 conciseStyle:0 openAt:0];

  return v7;
}

- (NSArray)businessHours
{
  return [(MKMapItem *)self->_mapItem _businessHours];
}

- (void)setMapItem:(id)a3
{
  uint64_t v5 = (MKMapItem *)a3;
  uint64_t v6 = v5;
  if (self->_mapItem != v5)
  {
    businessHours = self->_businessHours;
    self->_businessHours = 0;
    v9 = v5;

    objc_storeStrong((id *)&self->_mapItem, a3);
    int v8 = [(MKPlaceHoursViewController *)self isViewLoaded];
    uint64_t v6 = v9;
    if (v8)
    {
      [(MKPlaceHoursViewController *)self _setExpanded:[(MKPlaceHoursViewController *)self _shouldOnlyShowExpanded]];
      [(MKPlaceHoursViewController *)self _updateHoursAnimated:0];
      uint64_t v6 = v9;
    }
  }
}

- (BOOL)_shouldOnlyShowExpanded
{
  id v3 = [(MKPlaceHoursViewController *)self businessHours];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(MKPlaceHoursViewController *)self businessHours];
    uint64_t v6 = [v5 count];

    objc_super v7 = [(MKPlaceHoursViewController *)self businessHours];
    int v8 = [v7 objectAtIndexedSubscript:0];
    v9 = [v8 placeDailyHours];
    uint64_t v10 = [v9 count];

    objc_super v11 = [(MKPlaceHoursViewController *)self businessHours];
    v12 = [v11 objectAtIndex:0];
    uint64_t v13 = [v12 hoursType];

    BOOL v16 = (v10 == 1 || v13 == 4) && v6 == 1;
  }
  else
  {
    BOOL v16 = 0;
  }
  return self->_resizableViewsDisabled || v16;
}

- (void)_setExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL isExpanded = a3;
  if ([(MKPlaceHoursViewController *)self _shouldOnlyShowExpanded])
  {
    self->_BOOL isExpanded = 1;
    headerView = self->_headerView;
    [(MKPlaceSectionHeaderView *)headerView setShowSeeMoreButton:0];
  }
  else
  {
    [(MKPlaceSectionHeaderView *)self->_headerView setShowSeeMoreButton:1];
    if (v3) {
      uint64_t v6 = @"Placecard Show operating hours today";
    }
    else {
      uint64_t v6 = @"Placecard Show all operating hours";
    }
    _MKLocalizedStringFromThisBundle(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(MKPlaceSectionHeaderView *)self->_headerView setSeeMoreButtonText:v7];
  }
}

- (void)_toggleShowAllHours
{
  [(MKPlaceHoursViewController *)self _setExpanded:!self->_isExpanded];
  BOOL v3 = [(MKPlaceHoursViewController *)self analyticsDelegate];

  if (v3)
  {
    BOOL isExpanded = self->_isExpanded;
    uint64_t v5 = [(MKPlaceHoursViewController *)self analyticsDelegate];
    uint64_t v6 = v5;
    if (isExpanded) {
      uint64_t v7 = 6012;
    }
    else {
      uint64_t v7 = 6011;
    }
    [v5 infoCardAnalyticsDidSelectAction:v7 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
  }
  [(UIView *)self->_headerView _mapkit_layoutIfNeeded];

  [(MKPlaceHoursViewController *)self _updateHoursAnimated:1];
}

- (void)_contentSizeDidChange
{
}

- (void)_updateHoursAnimated:(BOOL)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v4 = [(MKPlaceHoursViewController *)self view];
    uint64_t v5 = [v4 window];
    BOOL v32 = v5 != 0;
  }
  else
  {
    BOOL v32 = 0;
  }
  uint64_t v6 = objc_opt_new();
  v33 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v7 = [(MKPlaceHoursViewController *)self businessHours];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * v11);
        uint64_t v13 = [MKPlaceHoursDayRow alloc];
        v14 = [(MKPlaceHoursViewController *)self view];
        [v14 bounds];
        v15 = -[MKPlaceHoursDayRow initWithBusinessHours:frame:](v13, "initWithBusinessHours:frame:", v12);

        BOOL v16 = [(MKPlaceHoursViewController *)self hoursBuilderWithHours:v12];
        v17 = [(MKPlaceHoursDayRow *)v15 hoursView];
        [v17 setHoursBuilder:v16];

        [(MKViewWithHairline *)v15 setBottomHairlineHidden:1];
        [v6 addObject:v15];
        v18 = [(MKPlaceHoursDayRow *)v15 hoursView];
        [v33 addObject:v18];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v9);
  }

  v19 = [(MKPlaceHoursViewController *)self businessHours];
  +[MKPlaceHoursViewHelper determineExtraRulesForPlaceHoursViews:v33 withBusinessHours:v19];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v20 = v6;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(v20);
        }
        BOOL isExpanded = self->_isExpanded;
        v26 = [*(id *)(*((void *)&v34 + 1) + 8 * v24) hoursView];
        uint64_t v27 = [v26 placeHoursViewOptions];
        if (isExpanded) {
          uint64_t v28 = 8;
        }
        else {
          uint64_t v28 = 1;
        }
        [v26 setPlaceHoursViewOptions:v27 | v28];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v22);
  }

  v29 = [v20 lastObject];
  [v29 setBottomHairlineHidden:1];

  v30 = [(MKPlaceSectionViewController *)self sectionView];
  v31 = (void *)[v20 copy];
  [v30 setRowViews:v31 animated:v32 isNeedLayout:0];
}

- (void)infoCardThemeChanged
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)MKPlaceHoursViewController;
  [(UIViewController *)&v15 infoCardThemeChanged];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(MKPlaceSectionViewController *)self sectionView];
  uint64_t v4 = [v3 rowViews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) hoursView];
        uint64_t v10 = [v9 hoursBuilder];
        [v10 updateHoursLabelColor];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)infoCardChildPossibleActions
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(MKPlaceSectionHeaderView *)self->_headerView showSeeMoreButton])
  {
    if (self->_isExpanded) {
      uint64_t v4 = 6011;
    }
    else {
      uint64_t v4 = 6012;
    }
    uint64_t v5 = [NSNumber numberWithInteger:v4];
    [v3 addObject:v5];
  }

  return v3;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)resizableViewsDisabled
{
  return self->_resizableViewsDisabled;
}

- (_MKInfoCardAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (_MKInfoCardAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_businessHours, 0);

  objc_storeStrong((id *)&self->_headerView, 0);
}

@end