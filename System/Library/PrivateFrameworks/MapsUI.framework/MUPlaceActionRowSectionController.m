@interface MUPlaceActionRowSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (MUPlaceActionRowSectionController)initWithMapItem:(id)a3 actionManager:(id)a4 menuProvider:(id)a5;
- (id)analyticsModule;
- (id)menuElementForActionItem:(id)a3;
- (id)menuForActionItem:(id)a3;
- (id)sectionView;
- (int)analyticsModuleType;
- (void)_setupButtons;
- (void)updateForActionRowInfoChange;
@end

@implementation MUPlaceActionRowSectionController

- (MUPlaceActionRowSectionController)initWithMapItem:(id)a3 actionManager:(id)a4 menuProvider:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceActionRowSectionController;
  v10 = [(MUPlaceSectionController *)&v15 initWithMapItem:a3];
  if (v10)
  {
    v11 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v11))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", "", v14, 2u);
    }

    objc_storeWeak((id *)&v10->_actionManager, v8);
    objc_storeWeak((id *)&v10->_menuProvider, v9);
    [(MUPlaceActionRowSectionController *)v10 _setupButtons];
    v12 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", "", v14, 2u);
    }
  }
  return v10;
}

- (void)_setupButtons
{
  v3 = [[MUPlaceCardActionsRowViewController alloc] initWithStyle:0];
  actionsRowViewController = self->_actionsRowViewController;
  self->_actionsRowViewController = v3;

  if (MapKitIdiomIsMacCatalyst()) {
    [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController setMenuProvider:self];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionManager);
  [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController setActionManager:WeakRetained];

  v6 = [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController view];
  [v6 setPreservesSuperviewLayoutMargins:0];

  v7 = [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController view];
  [v7 setInsetsLayoutMarginsFromSafeArea:0];

  id v8 = [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController actionsRowView];
  [v8 setPreservesSuperviewLayoutMargins:0];

  double v9 = *MEMORY[0x1E4FB2848];
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v12 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v13 = [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController actionsRowView];
  objc_msgSend(v13, "setLayoutMargins:", v9, v10, v11, v12);

  v14 = [[MUPlaceSectionView alloc] initWithStyle:1 sectionHeaderViewModel:0];
  sectionView = self->_sectionView;
  self->_sectionView = v14;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  v16 = self->_sectionView;
  v17 = [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController view];
  [(MUPlaceSectionView *)v16 attachViewToContentView:v17];

  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  v19 = [v18 bundleIdentifier];
  char v20 = [v19 isEqualToString:*MEMORY[0x1E4F64320]];

  if ((v20 & 1) == 0)
  {
    v21 = +[MUPlaceholderGridCache unretainedInstance];
    placeholderGridCache = self->_placeholderGridCache;
    self->_placeholderGridCache = v21;

    v23 = self->_placeholderGridCache;
    [(MUPlaceholderGridCache *)v23 loadPlaceholderGridImages];
  }
}

- (id)menuForActionItem:(id)a3
{
  v3 = [(MUPlaceActionRowSectionController *)self menuElementForActionItem:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)menuElementForActionItem:(id)a3
{
  p_menuProvider = &self->_menuProvider;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_menuProvider);
  v6 = [WeakRetained menuElementForActionItem:v4];

  return v6;
}

- (id)sectionView
{
  return self->_sectionView;
}

- (void)updateForActionRowInfoChange
{
}

- (BOOL)hasContent
{
  v2 = [(MUPlaceCardActionsRowViewController *)self->_actionsRowViewController actionButtons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)analyticsModule
{
  v2 = (void *)MEMORY[0x1E4F643A8];
  uint64_t v3 = [(MUPlaceActionRowSectionController *)self analyticsModuleType];
  return (id)[v2 moduleFromModuleType:v3];
}

- (int)analyticsModuleType
{
  return 12;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_menuProvider);
  objc_storeStrong((id *)&self->_placeholderGridCache, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_actionsRowViewController, 0);
  objc_destroyWeak((id *)&self->_actionManager);
}

@end