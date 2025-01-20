@interface MUHeaderButtonsSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (CGRect)impressionsFrame;
- (MUHeaderButtonsSectionController)initWithETAProvider:(id)a3 headerButtonsConfiguration:(id)a4;
- (MUHeaderButtonsSectionControllerDelegate)delegate;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (NSArray)sectionViews;
- (UIView)sectionView;
- (_MKPlaceActionButtonController)alternatePrimaryButtonController;
- (_MKPlaceActionButtonController)secondaryButtonController;
- (id)analyticsModule;
- (id)draggableContent;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)revealedAnalyticsModule;
- (int)analyticsModuleType;
- (unint64_t)primaryButtonType;
- (void)_setupSectionView;
- (void)_updateWithPreviousState:(BOOL)a3;
- (void)headerButtonsView:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5;
- (void)headerButtonsViewWillPresentMenu:(id)a3;
- (void)placeHeaderButtonsViewController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withView:(id)a5;
- (void)setActive:(BOOL)a3;
- (void)setAlternatePrimaryButtonController:(id)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimaryButtonType:(unint64_t)a3;
- (void)setSecondaryButtonController:(id)a3;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUHeaderButtonsSectionController

- (MUHeaderButtonsSectionController)initWithETAProvider:(id)a3 headerButtonsConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MUHeaderButtonsSectionController;
  v8 = [(MUHeaderButtonsSectionController *)&v27 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_etaProvider, v6);
    objc_storeStrong((id *)&v9->_headerConfiguration, a4);
    if (MapKitIdiomIsMacCatalyst())
    {
      v10 = (MKPlaceHeaderButtonsViewController *)objc_alloc_init(MEMORY[0x1E4F30FB0]);
      p_catalystHeaderViewController = &v9->_catalystHeaderViewController;
      catalystHeaderViewController = v9->_catalystHeaderViewController;
      v9->_catalystHeaderViewController = v10;

      v13 = [(MKPlaceHeaderButtonsViewController *)v9->_catalystHeaderViewController view];
      [v13 setPreservesSuperviewLayoutMargins:0];

      v14 = [(MKPlaceHeaderButtonsViewController *)v9->_catalystHeaderViewController view];
      [v14 setInsetsLayoutMarginsFromSafeArea:0];

      v15 = [(MKPlaceHeaderButtonsViewController *)v9->_catalystHeaderViewController contentView];
      [v15 setPreservesSuperviewLayoutMargins:0];

      double v16 = *MEMORY[0x1E4FB2848];
      double v17 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v18 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v19 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      v20 = [(MKPlaceHeaderButtonsViewController *)v9->_catalystHeaderViewController contentView];
      objc_msgSend(v20, "setLayoutMargins:", v16, v17, v18, v19);

      [(MKPlaceHeaderButtonsViewController *)v9->_catalystHeaderViewController setDelegate:v9];
      v21 = [(MKPlaceHeaderButtonsViewController *)v9->_catalystHeaderViewController view];
    }
    else
    {
      v22 = [[MUHeaderButtonsView alloc] initWithConfiguration:v7];
      p_catalystHeaderViewController = &v9->_headerButtonsView;
      headerButtonsView = v9->_headerButtonsView;
      v9->_headerButtonsView = v22;

      [(MUHeaderButtonsView *)v9->_headerButtonsView setDelegate:v9];
      [(MUHeaderButtonsView *)v9->_headerButtonsView setAccessibilityIdentifier:@"PlaceHeaderButtonsView"];
      v21 = v9->_headerButtonsView;
    }
    contentView = v9->_contentView;
    v9->_contentView = &v21->super;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_etaProvider);
    [WeakRetained addObserver:*p_catalystHeaderViewController];

    [(MUHeaderButtonsSectionController *)v9 _setupSectionView];
  }

  return v9;
}

- (void)_setupSectionView
{
  v3 = [[MUPlaceSectionView alloc] initWithStyle:1 alwaysHideSeparators:1];
  sectionView = self->_sectionView;
  self->_sectionView = v3;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  v5 = self->_sectionView;
  contentView = self->_contentView;
  [(MUPlaceSectionView *)v5 attachViewToContentView:contentView];
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

- (CGRect)impressionsFrame
{
  v2 = [(MUHeaderButtonsSectionController *)self sectionView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (_MKPlaceActionButtonController)secondaryButtonController
{
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v4 = 24;
  if (IsMacCatalyst) {
    uint64_t v4 = 40;
  }
  double v5 = [*(id *)((char *)&self->super.isa + v4) secondaryButtonController];
  return (_MKPlaceActionButtonController *)v5;
}

- (void)setSecondaryButtonController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MUHeaderButtonsSectionController *)self hasContent];
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v7 = 24;
  if (IsMacCatalyst) {
    uint64_t v7 = 40;
  }
  [*(id *)((char *)&self->super.isa + v7) setSecondaryButtonController:v4];

  [(MUHeaderButtonsSectionController *)self _updateWithPreviousState:v5];
}

- (void)setAlternatePrimaryButtonController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MUHeaderButtonsSectionController *)self hasContent];
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v7 = 24;
  if (IsMacCatalyst) {
    uint64_t v7 = 40;
  }
  [*(id *)((char *)&self->super.isa + v7) setAlternatePrimaryButtonController:v4];

  [(MUHeaderButtonsSectionController *)self _updateWithPreviousState:v5];
}

- (_MKPlaceActionButtonController)alternatePrimaryButtonController
{
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v4 = 24;
  if (IsMacCatalyst) {
    uint64_t v4 = 40;
  }
  BOOL v5 = [*(id *)((char *)&self->super.isa + v4) alternatePrimaryButtonController];
  return (_MKPlaceActionButtonController *)v5;
}

- (void)setPrimaryButtonType:(unint64_t)a3
{
  BOOL v5 = [(MUHeaderButtonsSectionController *)self hasContent];
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v7 = 24;
  if (IsMacCatalyst) {
    uint64_t v7 = 40;
  }
  [*(id *)((char *)&self->super.isa + v7) setPrimaryButtonType:a3];
  [(MUHeaderButtonsSectionController *)self _updateWithPreviousState:v5];
}

- (unint64_t)primaryButtonType
{
  int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
  uint64_t v4 = 24;
  if (IsMacCatalyst) {
    uint64_t v4 = 40;
  }
  BOOL v5 = *(Class *)((char *)&self->super.isa + v4);
  return [v5 primaryButtonType];
}

- (BOOL)hasContent
{
  if ([(MUHeaderButtonsSectionController *)self primaryButtonType]) {
    return 1;
  }
  uint64_t v4 = [(MUHeaderButtonsSectionController *)self secondaryButtonController];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)_updateWithPreviousState:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if ([(MUHeaderButtonsSectionController *)self hasContent] != a3)
  {
    BOOL v5 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109376;
      v7[1] = v3;
      __int16 v8 = 1024;
      BOOL v9 = [(MUHeaderButtonsSectionController *)self hasContent];
      _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_INFO, "MUPlaceHeaderButtonsSectionController: hasContent changed from %d to %d, will tell parent to update.", (uint8_t *)v7, 0xEu);
    }

    double v6 = [(MUHeaderButtonsSectionController *)self delegate];
    [v6 headerButtonsSectionControllerDidUpdateContent:self];
  }
}

- (void)headerButtonsView:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  id v7 = a5;
  id v8 = [(MUHeaderButtonsSectionController *)self delegate];
  [v8 headerButtonsSectionController:self didSelectPrimaryType:a4 withPresentationOptions:v7];
}

- (void)headerButtonsViewWillPresentMenu:(id)a3
{
  uint64_t v4 = [(MUHeaderButtonsSectionController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUHeaderButtonsSectionController *)self delegate];
    [v6 headerButtonsSectionControllerWillPresentMenu:self];
  }
}

- (void)placeHeaderButtonsViewController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withView:(id)a5
{
  id v7 = a5;
  double v17 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v17 setSourceView:v7];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  -[MUPresentationOptions setSourceRect:](v17, "setSourceRect:", v9, v11, v13, v15);
  double v16 = [(MUHeaderButtonsSectionController *)self delegate];
  [v16 headerButtonsSectionController:self didSelectPrimaryType:a4 withPresentationOptions:v17];
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
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v4 = [(MUHeaderButtonsSectionController *)self primaryButtonType] - 1;
  if (v4 <= 3) {
    [v3 addObject:qword_1E5751AC0[v4]];
  }
  char v5 = [(MUHeaderButtonsViewConfiguration *)self->_headerConfiguration possibleAnalyticActions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(MUHeaderButtonsViewConfiguration *)self->_headerConfiguration possibleAnalyticActions];
    [v3 addObjectsFromArray:v7];
  }
  double v8 = [(MUHeaderButtonsSectionController *)self secondaryButtonController];
  int v9 = [v8 conformsToProtocol:&unk_1EE414488];

  if (v9)
  {
    double v10 = [(MUHeaderButtonsSectionController *)self secondaryButtonController];
    if (objc_opt_respondsToSelector())
    {
      double v11 = [v10 infoCardChildPossibleActions];
      if ([v11 count]) {
        [v3 addObjectsFromArray:v11];
      }
    }
  }
  double v12 = (void *)[v3 copy];

  return v12;
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)analyticsModule
{
  v2 = (void *)MEMORY[0x1E4F643A8];
  uint64_t v3 = [(MUHeaderButtonsSectionController *)self analyticsModuleType];
  return (id)[v2 moduleFromModuleType:v3];
}

- (int)analyticsModuleType
{
  return 2;
}

- (id)revealedAnalyticsModule
{
  v2 = (void *)MEMORY[0x1E4F64948];
  uint64_t v3 = [(MUHeaderButtonsSectionController *)self analyticsModuleType];
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

- (MUHeaderButtonsSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUHeaderButtonsSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionHeaderViewModel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_catalystHeaderViewController, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_headerButtonsView, 0);
  objc_storeStrong((id *)&self->_headerConfiguration, 0);
  objc_destroyWeak((id *)&self->_etaProvider);
}

@end