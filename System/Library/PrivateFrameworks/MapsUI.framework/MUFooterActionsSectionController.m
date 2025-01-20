@interface MUFooterActionsSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (MUFooterActionsSectionController)initWithActionManager:(id)a3;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (NSArray)sectionViews;
- (UIView)sectionView;
- (id)analyticsModule;
- (id)draggableContent;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)revealedAnalyticsModule;
- (int)analyticsModuleType;
- (void)_setupFooterView;
- (void)reloadData;
- (void)setActive:(BOOL)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUFooterActionsSectionController

- (MUFooterActionsSectionController)initWithActionManager:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MUFooterActionsSectionController;
  v5 = [(MUFooterActionsSectionController *)&v10 init];
  if (v5)
  {
    v6 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceFooterActionsSectionControllerInit", "", v9, 2u);
    }

    objc_storeWeak((id *)&v5->_actionManager, v4);
    [(MUFooterActionsSectionController *)v5 _setupFooterView];
    v7 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceFooterActionsSectionControllerInit", "", v9, 2u);
    }
  }
  return v5;
}

- (void)_setupFooterView
{
  v3 = [MUActionGroupSectionView alloc];
  id v4 = +[MUInfoCardStyle preferredVerticalCardConfiguration];
  v5 = [(MUActionGroupSectionView *)v3 initWithConfiguration:v4];
  footerView = self->_footerView;
  self->_footerView = v5;

  v7 = +[MUPlaceSectionView cardShadowSectionViewForContentView:self->_footerView sectionHeaderViewModel:0];
  sectionView = self->_sectionView;
  self->_sectionView = v7;

  [(MUPlaceSectionView *)self->_sectionView hideBottomSeperator];
  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  [(MUFooterActionsSectionController *)self reloadData];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (NSArray)sectionViews
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_sectionView;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return (NSArray *)v2;
}

- (BOOL)hasContent
{
  return 1;
}

- (void)reloadData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  id v4 = [WeakRetained createFooterActions];
  footerActions = self->_footerActions;
  self->_footerActions = v4;

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_footerActions, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_footerActions;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * v9);
        v11 = [[MUActionItemCellModel alloc] initWithActionItem:v10];
        objc_initWeak(&location, self);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __46__MUFooterActionsSectionController_reloadData__block_invoke;
        v14[3] = &unk_1E5750F48;
        objc_copyWeak(&v15, &location);
        v14[4] = v10;
        [(MUActionItemCellModel *)v11 setActionBlock:v14];
        [v6 addObject:v11];
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  v12 = (void *)[v6 copy];
  [(MUActionGroupSectionView *)self->_footerView setViewModels:v12];
}

void __46__MUFooterActionsSectionController_reloadData__block_invoke(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 2);
    uint64_t v7 = [*(id *)(a1 + 32) resolvedActionItem];
    uint64_t v8 = *MEMORY[0x1E4F30DC8];
    v13[0] = v3;
    uint64_t v9 = *MEMORY[0x1E4F30DC0];
    v12[0] = v8;
    v12[1] = v9;
    uint64_t v10 = [v5 analyticsModule];
    v13[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    [v6 performAction:v7 options:v11 completion:0];
  }
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (id)infoCardChildPossibleActions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_footerActions;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "resolvedActionItem", (void)v14);
        uint64_t v10 = [v9 type];

        uint64_t v11 = v10 - 1;
        if (unint64_t)(v10 - 1) <= 0x11 && ((0x201F9u >> v11)) {
          [v3 addObject:qword_1E5750F68[v11]];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = (void *)[v3 copy];
  return v12;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (int)analyticsModuleType
{
  return 23;
}

- (id)analyticsModule
{
  v2 = (void *)MEMORY[0x1E4F643A8];
  uint64_t v3 = [(MUFooterActionsSectionController *)self analyticsModuleType];
  return (id)[v2 moduleFromModuleType:v3];
}

- (id)revealedAnalyticsModule
{
  v2 = (void *)MEMORY[0x1E4F64948];
  uint64_t v3 = [(MUFooterActionsSectionController *)self analyticsModuleType];
  return (id)[v2 moduleWithType:v3];
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return self->_sectionHeaderViewModel;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void)setSubmissionStatus:(id)a3
{
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);
  return (MUInfoCardAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_footerActions, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end