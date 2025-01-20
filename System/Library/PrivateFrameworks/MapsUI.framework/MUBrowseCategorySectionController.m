@interface MUBrowseCategorySectionController
- (BOOL)isImpressionable;
- (MUBrowseCategorySectionController)initWithMapItem:(id)a3;
- (MUBrowseCategorySectionControllerDelegate)browseCategoryDelegate;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (int)analyticsModuleType;
- (void)_setupSectionView;
- (void)categoryBrowseViewController:(id)a3 didTapOnSearchCategory:(id)a4;
- (void)setBrowseCategoryDelegate:(id)a3;
@end

@implementation MUBrowseCategorySectionController

- (MUBrowseCategorySectionController)initWithMapItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MUBrowseCategorySectionController;
  v3 = [(MUPlaceSectionController *)&v8 initWithMapItem:a3];
  if (v3)
  {
    v4 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUBrowseCategorySectionControllerInit", "", v7, 2u);
    }

    [(MUBrowseCategorySectionController *)v3 _setupSectionView];
    v5 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUBrowseCategorySectionControllerInit", "", v7, 2u);
    }
  }
  return v3;
}

- (void)_setupSectionView
{
  v3 = [MUBrowseCategoryViewController alloc];
  v4 = [(MUPlaceSectionController *)self mapItem];
  v5 = [(MUBrowseCategoryViewController *)v3 initWithMapItem:v4];
  browseCategoryVC = self->_browseCategoryVC;
  self->_browseCategoryVC = v5;

  [(MUBrowseCategoryViewController *)self->_browseCategoryVC setDisableBottomPadding:1];
  v7 = [(MUBrowseCategoryViewController *)self->_browseCategoryVC view];
  [v7 setPreservesSuperviewLayoutMargins:0];

  double v8 = *MEMORY[0x1E4FB2848];
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  v12 = [(MUBrowseCategoryViewController *)self->_browseCategoryVC view];
  objc_msgSend(v12, "setLayoutMargins:", v8, v9, v10, v11);

  [(MUBrowseCategoryViewController *)self->_browseCategoryVC setDelegate:self];
  v13 = [[MUPlaceSectionView alloc] initWithStyle:0 sectionHeaderViewModel:0];
  sectionView = self->_sectionView;
  self->_sectionView = v13;

  [(MUPlaceSectionView *)self->_sectionView setAccessibilityIdentifier:@"VenuesBrowseCategorySection"];
  v15 = self->_sectionView;
  id v16 = [(MUBrowseCategoryViewController *)self->_browseCategoryVC view];
  [(MUPlaceSectionView *)v15 attachViewToContentView:v16];
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_browseCategoryVC;
}

- (void)categoryBrowseViewController:(id)a3 didTapOnSearchCategory:(id)a4
{
  id v5 = a4;
  id v6 = [(MUBrowseCategorySectionController *)self browseCategoryDelegate];
  [v6 browseCategorySectionController:self didTapOnSearchCategory:v5];
}

- (int)analyticsModuleType
{
  return 30;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (MUBrowseCategorySectionControllerDelegate)browseCategoryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browseCategoryDelegate);
  return (MUBrowseCategorySectionControllerDelegate *)WeakRetained;
}

- (void)setBrowseCategoryDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_browseCategoryDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_browseCategoryVC, 0);
}

@end