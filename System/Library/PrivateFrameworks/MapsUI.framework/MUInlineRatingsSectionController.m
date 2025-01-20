@interface MUInlineRatingsSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (MUInlineRatingsSectionController)initWithMapItem:(id)a3 inlineRatingsViewProvider:(id)a4;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (int)analyticsModuleType;
- (void)_setupSectionView;
@end

@implementation MUInlineRatingsSectionController

- (MUInlineRatingsSectionController)initWithMapItem:(id)a3 inlineRatingsViewProvider:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MUInlineRatingsSectionController;
  v7 = [(MUPlaceSectionController *)&v10 initWithMapItem:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_viewProvider, v6);
    [(MUInlineRatingsSectionController *)v8 _setupSectionView];
  }

  return v8;
}

- (BOOL)hasContent
{
  return self->_inlineRatingsViewController != 0;
}

- (UIViewController)sectionViewController
{
  return self->_inlineRatingsViewController;
}

- (UIView)sectionView
{
  sectionView = self->_sectionView;
  if (!sectionView)
  {
    [(MUInlineRatingsSectionController *)self _setupSectionView];
    sectionView = self->_sectionView;
  }
  return (UIView *)sectionView;
}

- (void)_setupSectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewProvider);
  v4 = [WeakRetained inlineRatingsSectionControllerRequestsContentViewController:self];
  inlineRatingsViewController = self->_inlineRatingsViewController;
  self->_inlineRatingsViewController = v4;

  [(UIViewController *)self->_inlineRatingsViewController setViewRespectsSystemMinimumLayoutMargins:0];
  id v6 = [(UIViewController *)self->_inlineRatingsViewController view];
  objc_msgSend(v6, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);

  if (self->_inlineRatingsViewController)
  {
    v7 = [MUPlaceSectionView alloc];
    v8 = [(MUInlineRatingsSectionController *)self sectionHeaderViewModel];
    v9 = [(MUPlaceSectionView *)v7 initWithStyle:0 sectionHeaderViewModel:v8];
    sectionView = self->_sectionView;
    self->_sectionView = v9;

    v11 = self->_sectionView;
    id v12 = [(UIViewController *)self->_inlineRatingsViewController view];
    [(MUPlaceSectionView *)v11 attachViewToContentView:v12];
  }
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  v2 = [MUPlaceSectionHeaderViewModel alloc];
  v3 = _MULocalizedStringFromThisBundle(@"Rate This Place [Section Header]");
  v4 = [(MUPlaceSectionHeaderViewModel *)v2 initWithTitleString:v3];

  return v4;
}

- (int)analyticsModuleType
{
  return 36;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewProvider);
  objc_storeStrong((id *)&self->_inlineRatingsViewController, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end