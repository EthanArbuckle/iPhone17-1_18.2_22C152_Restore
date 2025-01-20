@interface MUPlaceVenueInfoSectionController
- (BOOL)isImpressionable;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MUPlaceVenueInfoSectionController)initWithMapItem:(id)a3;
- (UIView)sectionView;
- (int)analyticsModuleType;
- (void)_setupSectionView;
@end

@implementation MUPlaceVenueInfoSectionController

- (MUPlaceVenueInfoSectionController)initWithMapItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceVenueInfoSectionController;
  v3 = [(MUPlaceSectionController *)&v8 initWithMapItem:a3];
  if (v3)
  {
    v4 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceVenueInfoSectionControllerInit", "", v7, 2u);
    }

    [(MUPlaceVenueInfoSectionController *)v3 _setupSectionView];
    v5 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceVenueInfoSectionControllerInit", "", v7, 2u);
    }
  }
  return v3;
}

- (void)_setupSectionView
{
  v3 = [(MUPlaceSectionController *)self mapItem];
  v4 = [v3 _venueInfo];
  id v14 = [v4 contents];

  v5 = [v14 items];
  v6 = +[MUTextPairViewModel textPairViewModelsFromStrings:v5];

  v7 = [MUTextPairVerticalCardView alloc];
  objc_super v8 = -[MUTextPairVerticalCardView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  contentView = self->_contentView;
  self->_contentView = v8;

  [(MUTextPairVerticalCardView *)self->_contentView setViewModels:v6];
  v10 = self->_contentView;
  v11 = [(MUPlaceVenueInfoSectionController *)self sectionHeaderViewModel];
  v12 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v10 sectionHeaderViewModel:v11];
  sectionView = self->_sectionView;
  self->_sectionView = v12;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    v4 = [MUPlaceSectionHeaderViewModel alloc];
    v5 = [(MUPlaceSectionController *)self mapItem];
    v6 = [v5 _venueInfo];
    v7 = [v6 contents];
    objc_super v8 = [v7 title];
    v9 = [(MUPlaceSectionHeaderViewModel *)v4 initWithTitleString:v8];
    v10 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v9;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (int)analyticsModuleType
{
  return 17;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end