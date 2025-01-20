@interface MUPlaceDescriptionSectionController
- (BOOL)isImpressionable;
- (MUPlaceDescriptionSectionController)initWithMapItem:(id)a3 configuration:(id)a4;
- (MUPlaceDescriptionSectionControllerDelegate)actionDelegate;
- (id)infoCardChildPossibleActions;
- (id)sectionFooterViewModel;
- (id)sectionHeaderViewModel;
- (id)sectionView;
- (int)analyticsModuleType;
- (void)_attributionTapped;
- (void)_setupTextBlurb;
- (void)setActionDelegate:(id)a3;
@end

@implementation MUPlaceDescriptionSectionController

- (MUPlaceDescriptionSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceDescriptionSectionController;
  v8 = [(MUPlaceSectionController *)&v13 initWithMapItem:a3];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceDescriptionSectionControllerInit", "", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    [(MUPlaceDescriptionSectionController *)v8 _setupTextBlurb];
    v10 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceDescriptionSectionControllerInit", "", v12, 2u);
    }
  }
  return v8;
}

- (void)_setupTextBlurb
{
  v3 = [MUExpandableBlurbView alloc];
  v4 = -[MUExpandableBlurbView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  blurbView = self->_blurbView;
  self->_blurbView = v4;

  v6 = [(MUPlaceDescriptionConfiguration *)self->_configuration textBlockText];
  [(MUExpandableBlurbView *)self->_blurbView setText:v6];

  objc_initWeak(&location, self);
  id v7 = self->_blurbView;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke;
  v16 = &unk_1E574F3A8;
  objc_copyWeak(&v17, &location);
  [(MUExpandableBlurbView *)v7 setResizeBlock:&v13];
  v8 = self->_blurbView;
  v9 = [(MUPlaceDescriptionSectionController *)self sectionHeaderViewModel];
  v10 = [(MUPlaceDescriptionSectionController *)self sectionFooterViewModel];
  v11 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v8 sectionHeaderViewModel:v9 sectionFooterViewModel:v10 alwaysInsetContentView:0];
  sectionView = self->_sectionView;
  self->_sectionView = v11;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained delegate];
    v4 = [v3 placeSectionControllerRequestsRootView:v2];

    v5 = (void *)MEMORY[0x1E4FB1EB0];
    v7[4] = v2;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_2;
    v8[3] = &unk_1E574EFD0;
    id v9 = v4;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_3;
    v7[3] = &unk_1E574F160;
    id v6 = v4;
    [v5 animateWithDuration:4 delay:v8 options:v7 animations:0.3 completion:0.0];
  }
}

uint64_t __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mapsui_layoutIfNeeded");
}

void __54__MUPlaceDescriptionSectionController__setupTextBlurb__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 placeSectionControllerRequestsLayoutChange:*(void *)(a1 + 32)];
}

- (id)sectionView
{
  return self->_sectionView;
}

- (id)sectionHeaderViewModel
{
  if ([(MUPlaceDescriptionConfiguration *)self->_configuration showSectionTitle])
  {
    id v2 = [MUPlaceSectionHeaderViewModel alloc];
    v3 = _MULocalizedStringFromThisBundle(@"About [Placecard]");
    v4 = [(MUPlaceSectionHeaderViewModel *)v2 initWithTitleString:v3];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)sectionFooterViewModel
{
  v3 = [(MUPlaceDescriptionConfiguration *)self->_configuration attribution];

  if (v3)
  {
    footerViewModel = self->_footerViewModel;
    if (!footerViewModel)
    {
      v5 = [(MUPlaceDescriptionConfiguration *)self->_configuration attribution];
      id v6 = +[MUPlaceFooterAtributionViewModel viewModelForGeoMapItemAttribution:v5];
      id v7 = self->_footerViewModel;
      self->_footerViewModel = v6;

      objc_initWeak(&location, self);
      v8 = self->_footerViewModel;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __61__MUPlaceDescriptionSectionController_sectionFooterViewModel__block_invoke;
      v11[3] = &unk_1E574F3A8;
      objc_copyWeak(&v12, &location);
      [(MUPlaceSectionFooterViewModel *)v8 setActionBlock:v11];
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      footerViewModel = self->_footerViewModel;
    }
    id v9 = footerViewModel;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

void __61__MUPlaceDescriptionSectionController_sectionFooterViewModel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _attributionTapped];
    id WeakRetained = v2;
  }
}

- (void)_attributionTapped
{
  v3 = [(MUPlaceDescriptionConfiguration *)self->_configuration attribution];
  v4 = [v3 providerID];
  v5 = [(MUPlaceSectionController *)self mapItem];
  id v6 = [v5 _reviewsAttribution];
  id v7 = [v6 providerID];
  [(MUPlaceSectionController *)self captureInfoCardAction:6020 eventValue:v4 feedbackType:0 actionRichProviderId:v7];

  id v8 = [(MUPlaceDescriptionSectionController *)self actionDelegate];
  [v8 placeDescriptionSectionControllerDidTapAttribution:self];
}

- (id)infoCardChildPossibleActions
{
  id v2 = [(MUPlaceDescriptionConfiguration *)self->_configuration attribution];

  if (v2) {
    return &unk_1EE405198;
  }
  else {
    return (id)MEMORY[0x1E4F1CBF0];
  }
}

- (int)analyticsModuleType
{
  return 8;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUPlaceDescriptionSectionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (MUPlaceDescriptionSectionControllerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_footerViewModel, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_blurbView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end