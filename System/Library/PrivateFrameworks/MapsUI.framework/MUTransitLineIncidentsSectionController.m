@interface MUTransitLineIncidentsSectionController
- (BOOL)hasContent;
- (MUTransitLineIncidentsSectionController)initWithTransitLineItem:(id)a3;
- (MUTransitLineIncidentsSectionControllerDelegate)incidentsDelegate;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (void)_setupSection;
- (void)setIncidentsDelegate:(id)a3;
- (void)transitLineIncidentsViewController:(id)a3 didSelectDetailsForIncidents:(id)a4;
@end

@implementation MUTransitLineIncidentsSectionController

- (MUTransitLineIncidentsSectionController)initWithTransitLineItem:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUTransitLineIncidentsSectionController;
  v3 = [(MUTransitLineItemSectionController *)&v6 initWithTransitLineItem:a3];
  v4 = v3;
  if (v3) {
    [(MUTransitLineIncidentsSectionController *)v3 _setupSection];
  }
  return v4;
}

- (void)_setupSection
{
  v3 = [MUTransitLineIncidentsViewController alloc];
  v4 = [(MUTransitLineItemSectionController *)self lineItem];
  v14 = [(MUTransitLineIncidentsViewController *)v3 initWithLineItem:v4];

  [(MUTransitLineIncidentsViewController *)v14 setIncidentsDelegate:self];
  v5 = [[MUFixedHeightAwareViewController alloc] initWithViewController:v14];
  fixedHeightAwareVC = self->_fixedHeightAwareVC;
  self->_fixedHeightAwareVC = v5;

  v7 = [(MUFixedHeightAwareViewController *)self->_fixedHeightAwareVC view];
  objc_msgSend(v7, "_mapsui_setCardCorner");

  v8 = [MUPlaceSectionView alloc];
  v9 = [(MUTransitLineItemSectionController *)self sectionHeaderViewModel];
  v10 = [(MUPlaceSectionView *)v8 initWithStyle:1 sectionHeaderViewModel:v9];
  sectionView = self->_sectionView;
  self->_sectionView = v10;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  v12 = self->_sectionView;
  v13 = [(MUFixedHeightAwareViewController *)self->_fixedHeightAwareVC view];
  [(MUPlaceSectionView *)v12 attachViewToContentView:v13];
}

- (UIViewController)sectionViewController
{
  return (UIViewController *)self->_fixedHeightAwareVC;
}

- (UIView)sectionView
{
  return (UIView *)self->_sectionView;
}

- (BOOL)hasContent
{
  v2 = [(MUTransitLineItemSectionController *)self lineItem];
  v3 = [v2 incidents];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)transitLineIncidentsViewController:(id)a3 didSelectDetailsForIncidents:(id)a4
{
  id v5 = a4;
  id v6 = [(MUTransitLineIncidentsSectionController *)self incidentsDelegate];
  [v6 incidentsSectionController:self didSelectDetailsForIncidents:v5];
}

- (MUTransitLineIncidentsSectionControllerDelegate)incidentsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incidentsDelegate);
  return (MUTransitLineIncidentsSectionControllerDelegate *)WeakRetained;
}

- (void)setIncidentsDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_incidentsDelegate);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_fixedHeightAwareVC, 0);
}

@end