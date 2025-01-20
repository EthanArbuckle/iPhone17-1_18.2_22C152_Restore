@interface MUTransitFooterActionsSectionController
- (CGRect)impressionsFrame;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUTransitFooterActionsSectionController)initWithTransitLineItem:(id)a3 actionManager:(id)a4;
- (UIView)sectionView;
- (id)analyticsModule;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)revealedAnalyticsModule;
- (void)reloadData;
- (void)setAnalyticsDelegate:(id)a3;
@end

@implementation MUTransitFooterActionsSectionController

- (MUTransitFooterActionsSectionController)initWithTransitLineItem:(id)a3 actionManager:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MUTransitFooterActionsSectionController;
  v7 = [(MUTransitLineItemSectionController *)&v11 initWithTransitLineItem:a3];
  if (v7)
  {
    v8 = [[MUFooterActionsSectionController alloc] initWithActionManager:v6];
    underlyingSectionController = v7->_underlyingSectionController;
    v7->_underlyingSectionController = v8;
  }
  return v7;
}

- (UIView)sectionView
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController sectionView];
}

- (CGRect)impressionsFrame
{
  v2 = [(MUTransitFooterActionsSectionController *)self sectionView];
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

- (void)reloadData
{
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController analyticsDelegate];
}

- (id)infoCardChildPossibleActions
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController infoCardChildPossibleActions];
}

- (id)infoCardChildUnactionableUIElements
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController infoCardChildUnactionableUIElements];
}

- (id)analyticsModule
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController analyticsModule];
}

- (id)revealedAnalyticsModule
{
  return [(MUFooterActionsSectionController *)self->_underlyingSectionController revealedAnalyticsModule];
}

- (void).cxx_destruct
{
}

@end