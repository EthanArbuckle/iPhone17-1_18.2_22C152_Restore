@interface MUPlaceListItemSectionController
- (BOOL)isImpressionable;
- (MUPlaceListItemSectionController)initWithMapItem:(id)a3 annotatedList:(id)a4;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (int)analyticsModuleType;
- (void)_captureUserAction:(int)a3;
- (void)_performPunchout;
- (void)_setupSubviews;
@end

@implementation MUPlaceListItemSectionController

- (MUPlaceListItemSectionController)initWithMapItem:(id)a3 annotatedList:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MUPlaceListItemSectionController;
  v8 = [(MUPlaceSectionController *)&v13 initWithMapItem:a3];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceListItemSectionControllerInit", "", v12, 2u);
    }

    objc_storeStrong((id *)&v8->_annotatedList, a4);
    [(MUPlaceListItemSectionController *)v8 _setupSubviews];
    v10 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceListItemSectionControllerInit", "", v12, 2u);
    }
  }
  return v8;
}

- (void)_setupSubviews
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(GEOAnnotatedItemList *)self->_annotatedList textItemContainer];
  v5 = [v4 textItems];
  v6 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(GEOAnnotatedItemList *)self->_annotatedList textItemContainer];
  v8 = [v7 textItems];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_super v13 = [*(id *)(*((void *)&v22 + 1) + 8 * v12) primaryText];
        [v6 addObject:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v14 = +[MUTextPairViewModel textPairViewModelsFromStrings:v6];
  v15 = [MUTextPairVerticalCardView alloc];
  v16 = -[MUTextPairVerticalCardView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  textVerticalCardView = self->_textVerticalCardView;
  self->_textVerticalCardView = v16;

  [(MUTextPairVerticalCardView *)self->_textVerticalCardView setViewModels:v14];
  v18 = self->_textVerticalCardView;
  v19 = [(MUPlaceListItemSectionController *)self sectionHeaderViewModel];
  v20 = +[MUPlaceSectionView cardShadowSectionViewForContentView:v18 sectionHeaderViewModel:v19];
  sectionView = self->_sectionView;
  self->_sectionView = v20;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  sectionHeaderViewModel = self->_sectionHeaderViewModel;
  if (!sectionHeaderViewModel)
  {
    annotatedList = self->_annotatedList;
    v5 = self;
    v6 = annotatedList;
    id v7 = mkAttributionForAnnotatedList();
    v8 = [(GEOAnnotatedItemList *)v6 title];
    uint64_t v9 = +[MUPlaceSectionHeaderViewModel viewModelForTitle:v8 attribution:v7 target:v5 action:sel__performPunchout];

    [(MUPlaceSectionHeaderViewModel *)v9 setTarget:v5 selector:sel__performPunchout];
    uint64_t v10 = self->_sectionHeaderViewModel;
    self->_sectionHeaderViewModel = v9;

    sectionHeaderViewModel = self->_sectionHeaderViewModel;
  }
  return sectionHeaderViewModel;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (void)_performPunchout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(MUPlaceListItemSectionController *)self _captureUserAction:6054];
  id v3 = self->_annotatedList;
  v4 = mkAttributionForAnnotatedList();
  v5 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 providerName];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "Attempting to punch our with attribution with provider %@", (uint8_t *)&v9, 0xCu);
  }
  id v7 = (void *)MEMORY[0x1E4F30E40];
  v8 = [v4 attributionURLs];
  [v7 launchAttributionURLs:v8 withAttribution:v4 completionHandler:&__block_literal_global_51];
}

- (void)_captureUserAction:(int)a3
{
}

- (int)analyticsModuleType
{
  return 19;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_annotatedList, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_textVerticalCardView, 0);
}

@end