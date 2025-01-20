@interface MUNearestStationSectionController
- (MUNearestStationSectionController)initWithTransitLineItem:(id)a3 etaProvider:(id)a4;
- (MUNearestStationSectionControllerDelegate)nearestStationDelegate;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (void)ETAProviderUpdated:(id)a3;
- (void)_createNearestStationSection;
- (void)_handleAttributionTap;
- (void)setNearestStationDelegate:(id)a3;
- (void)updateWithMapItem:(id)a3 isLoading:(BOOL)a4;
- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5;
@end

@implementation MUNearestStationSectionController

- (MUNearestStationSectionController)initWithTransitLineItem:(id)a3 etaProvider:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUNearestStationSectionController;
  v8 = [(MUTransitLineItemSectionController *)&v11 initWithTransitLineItem:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_etaProvider, a4);
    [(MKETAProvider *)v9->_etaProvider addObserver:v9];
    [(MUNearestStationSectionController *)v9 _createNearestStationSection];
  }

  return v9;
}

- (void)_createNearestStationSection
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v3 = [MUNearestStationRowView alloc];
  v4 = -[MUNearestStationRowView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  nearestStationRowView = self->_nearestStationRowView;
  self->_nearestStationRowView = v4;

  v6 = +[MUPlaceVerticalCardConfiguration plainConfiguration];
  id v7 = [[MUPlaceVerticalCardContainerView alloc] initWithConfiguration:v6];
  containerView = self->_containerView;
  self->_containerView = v7;

  [(MUPlaceVerticalCardContainerView *)self->_containerView setDelegate:self];
  v9 = self->_containerView;
  v26[0] = self->_nearestStationRowView;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [(MUPlaceVerticalCardContainerView *)v9 setRowViews:v10];

  objc_super v11 = [(MUTransitLineItemSectionController *)self lineItem];
  v12 = +[MUPlaceFooterAtributionViewModel viewModelForMapItem:0 transitLine:v11];
  footerViewModel = self->_footerViewModel;
  self->_footerViewModel = v12;

  objc_initWeak(&location, self);
  v14 = self->_footerViewModel;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __65__MUNearestStationSectionController__createNearestStationSection__block_invoke;
  v23 = &unk_1E574F3A8;
  objc_copyWeak(&v24, &location);
  [(MUPlaceSectionFooterViewModel *)v14 setActionBlock:&v20];
  v15 = self->_containerView;
  v16 = [(MUNearestStationSectionController *)self sectionHeaderViewModel];
  v17 = [(MUNearestStationSectionController *)self sectionFooterViewModel];
  v18 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v15 sectionHeaderViewModel:v16 sectionFooterViewModel:v17 alwaysInsetContentView:1];
  sectionView = self->_sectionView;
  self->_sectionView = v18;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __65__MUNearestStationSectionController__createNearestStationSection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _handleAttributionTap];
    id WeakRetained = v2;
  }
}

- (void)updateWithMapItem:(id)a3 isLoading:(BOOL)a4
{
  objc_storeStrong((id *)&self->_nearestStation, a3);
  id v6 = a3;
  [(MUNearestStationRowView *)self->_nearestStationRowView configureWithNearestStation:v6];
  id v7 = [(MKETAProvider *)self->_etaProvider rawDistanceString];
  [(MUNearestStationRowView *)self->_nearestStationRowView setDistanceString:v7];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  id v2 = [(MUTransitLineItemSectionController *)self lineItem];
  v3 = [v2 name];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = [v2 name];
  }
  else
  {
    id v6 = [v2 system];
    v5 = [v6 name];
  }
  if ([v5 length])
  {
    if ([v5 length])
    {
      id v7 = NSString;
      v8 = _MULocalizedStringFromThisBundle(@"Nearest %@ Station");
      v9 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v5);
    }
    else
    {
      v9 = _MULocalizedStringFromThisBundle(@"Nearest Station");
    }
    v10 = [[MUPlaceSectionHeaderViewModel alloc] initWithTitleString:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return (MUPlaceSectionFooterViewModel *)self->_footerViewModel;
}

- (void)_handleAttributionTap
{
  v3 = [MEMORY[0x1E4F64918] modernManager];
  uint64_t v4 = [v3 activeTileGroup];
  v5 = [v4 attributions];
  id v9 = [v5 firstObject];

  id v6 = [v9 url];
  if (v6)
  {
    id v7 = [(MUNearestStationSectionController *)self nearestStationDelegate];
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
    [v7 nearestStationSectionController:self didSelectStationAttributionURL:v8];
  }
}

- (void)ETAProviderUpdated:(id)a3
{
  id v4 = [a3 rawDistanceString];
  [(MUNearestStationRowView *)self->_nearestStationRowView setDistanceString:v4];
}

- (void)verticalCardContainerView:(id)a3 didSelectRow:(id)a4 atIndex:(unint64_t)a5
{
  if (self->_nearestStationRowView == a4)
  {
    id v6 = [(MUNearestStationSectionController *)self nearestStationDelegate];
    [v6 nearestStationSectionController:self didTapStationItem:self->_nearestStation];
  }
}

- (MUNearestStationSectionControllerDelegate)nearestStationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nearestStationDelegate);
  return (MUNearestStationSectionControllerDelegate *)WeakRetained;
}

- (void)setNearestStationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_nearestStationDelegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_nearestStationRowView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_nearestStation, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
}

@end