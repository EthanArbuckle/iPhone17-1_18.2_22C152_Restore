@interface MUTransitLineItemSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (GEOTransitLineItem)lineItem;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MUTransitLineItemSectionController)initWithTransitLineItem:(id)a3;
- (NSArray)sectionViews;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (id)analyticsModule;
- (id)draggableContent;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)revealedAnalyticsModule;
- (void)setActive:(BOOL)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUTransitLineItemSectionController

- (MUTransitLineItemSectionController)initWithTransitLineItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUTransitLineItemSectionController;
  v6 = [(MUTransitLineItemSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_lineItem, a3);
  }

  return v7;
}

- (UIView)sectionView
{
  sectionView = self->_sectionView;
  if (!sectionView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_sectionView;
    self->_sectionView = v5;

    sectionView = self->_sectionView;
  }
  return sectionView;
}

- (NSArray)sectionViews
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(MUTransitLineItemSectionController *)self sectionView];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (UIViewController)sectionViewController
{
  return 0;
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (BOOL)hasContent
{
  return 1;
}

- (id)infoCardChildPossibleActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)analyticsModule
{
  v2 = objc_opt_new();
  return v2;
}

- (id)revealedAnalyticsModule
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
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

- (GEOTransitLineItem)lineItem
{
  return self->_lineItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineItem, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end