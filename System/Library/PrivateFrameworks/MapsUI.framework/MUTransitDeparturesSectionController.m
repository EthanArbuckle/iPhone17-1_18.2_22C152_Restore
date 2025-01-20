@interface MUTransitDeparturesSectionController
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (BOOL)sectionViewProvider:(id)a3 canSelect:(id)a4 using:(id)a5;
- (MUTransitDeparturesSectionController)initWithMapItem:(id)a3 allowTransitLineSelection:(BOOL)a4 departuresDelegate:(id)a5;
- (MUTransitDeparturesSectionControllerDelegate)departuresDelegate;
- (NSArray)sectionViews;
- (id)draggableContent;
- (id)traitsForDeparturesDataSource:(id)a3;
- (int)analyticsModuleType;
- (void)_setupSections;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8;
- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10;
- (void)sectionViewProvider:(id)a3 didSelect:(id)a4 using:(id)a5;
- (void)sectionViewProvider:(id)a3 didSelectAttribution:(id)a4;
- (void)sectionViewProvider:(id)a3 didSelectConnectionInfo:(id)a4;
- (void)sectionViewProvider:(id)a3 didSelectDepartureSequence:(id)a4 using:(id)a5;
- (void)sectionViewProvider:(id)a3 didSelectIncidents:(id)a4;
- (void)setActive:(BOOL)a3;
- (void)setDeparturesDelegate:(id)a3;
- (void)transitDeparturesDataSourceWantsReload:(id)a3;
@end

@implementation MUTransitDeparturesSectionController

- (MUTransitDeparturesSectionController)initWithMapItem:(id)a3 allowTransitLineSelection:(BOOL)a4 departuresDelegate:(id)a5
{
  id v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)MUTransitDeparturesSectionController;
  v8 = [(MUPlaceSectionController *)&v11 initWithMapItem:a3];
  v9 = v8;
  if (v8)
  {
    [(MUTransitDeparturesSectionController *)v8 setDeparturesDelegate:v7];
    [(MUTransitDeparturesSectionController *)v9 _setupSections];
  }

  return v9;
}

- (void)_setupSections
{
  v3 = [MUTransitDeparturesDataSource alloc];
  v4 = [(MUPlaceSectionController *)self mapItem];
  v5 = [(MUTransitDeparturesDataSource *)v3 initWithMapItem:v4];
  dataSource = self->_dataSource;
  self->_dataSource = v5;

  [(MUTransitDeparturesDataSource *)self->_dataSource setDelegate:self];
  id v7 = [[MUTransitDeparturesSectionViewProvider alloc] initWithDataSource:self->_dataSource userInteractionDelegate:self];
  viewProvider = self->_viewProvider;
  self->_viewProvider = v7;
  MEMORY[0x1F41817F8](v7, viewProvider);
}

- (NSArray)sectionViews
{
  return (NSArray *)[(MUTransitDeparturesSectionViewProvider *)self->_viewProvider sectionViewsForCurrentState];
}

- (id)draggableContent
{
  return 0;
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = [(MUPlaceSectionController *)self analyticsDelegate];
  [v9 infoCardAnalyticsDidSelectAction:v6 eventValue:v8 feedbackDelegateSelector:v5];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = [(MUPlaceSectionController *)self analyticsDelegate];
  [v12 infoCardAnalyticsDidSelectAction:v8 eventValue:v11 feedbackDelegateSelector:v6 actionRichProviderId:v10];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a7;
  id v13 = a5;
  id v14 = [(MUPlaceSectionController *)self analyticsDelegate];
  [v14 infoCardAnalyticsDidSelectAction:v10 target:v9 eventValue:v13 feedbackDelegateSelector:v7 actionRichProviderId:v12];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  id v17 = a10;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v23 = [(MUPlaceSectionController *)self analyticsDelegate];
  LODWORD(v22) = a9;
  [v23 infoCardAnalyticsDidSelectAction:v15 target:v14 eventValue:v21 actionURL:v20 photoID:v19 moduleMetadata:v18 feedbackDelegateSelector:v22 actionRichProviderId:v17];
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v15 = *(void *)&a3;
  id v17 = a9;
  id v18 = a7;
  id v19 = a6;
  id v21 = [(MUPlaceSectionController *)self analyticsDelegate];
  LODWORD(v20) = a10;
  [v21 infoCardTransitAnalyticsDidSelectionAction:v15 resultIndex:a4 targetID:a5 transitSystem:v19 transitDepartureSequence:v18 transitCardCategory:v10 transitIncident:v17 feedbackDelegateSelector:v20];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  uint64_t v8 = *(void *)&a7;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = [(MUPlaceSectionController *)self analyticsDelegate];
  [v17 infoCardAnalyticsDidSelectAction:v12 target:v11 eventValue:v16 moduleMetadata:v15 feedbackDelegateSelector:v8 actionRichProviderId:v14];
}

- (int)analyticsModuleType
{
  return 6;
}

- (BOOL)isImpressionable
{
  return 1;
}

- (BOOL)sectionViewProvider:(id)a3 canSelect:(id)a4 using:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  LOBYTE(self) = [v9 transitDeparturesSectionController:self canSelectDepartureSequence:v8 usingMapItem:v7];

  return (char)self;
}

- (void)sectionViewProvider:(id)a3 didSelectAttribution:(id)a4
{
  id v5 = a4;
  [(MUPlaceSectionController *)self captureInfoCardAction:7006 eventValue:0 feedbackType:0 actionRichProviderId:0];
  id v6 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  [v6 transitDeparturesSectionController:self didSelectAttribution:v5];
}

- (void)sectionViewProvider:(id)a3 didSelectConnectionInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  [v6 transitDeparturesSectionController:self didSelectConnectionInformation:v5];
}

- (void)sectionViewProvider:(id)a3 didSelectDepartureSequence:(id)a4 using:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  [v9 transitDeparturesSectionController:self didSelectDepartureSequence:v8 usingMapItem:v7];
}

- (void)sectionViewProvider:(id)a3 didSelect:(id)a4 using:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  [v9 transitDeparturesSectionController:self didSelectTransitLine:v8 usingPresentationOptions:v7 completion:&__block_literal_global_35];
}

- (void)sectionViewProvider:(id)a3 didSelectIncidents:(id)a4
{
  id v5 = a4;
  id v6 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  [v6 transitDeparturesSectionController:self showIncidents:v5];
}

- (id)traitsForDeparturesDataSource:(id)a3
{
  v4 = [(MUTransitDeparturesSectionController *)self departuresDelegate];
  id v5 = [v4 traitsForTransitDeparturesSectionController:self];

  return v5;
}

- (void)transitDeparturesDataSourceWantsReload:(id)a3
{
  [(MUTransitDeparturesSectionViewProvider *)self->_viewProvider setNeedsRebuild:1];
  id v4 = [(MUPlaceSectionController *)self delegate];
  [v4 placeSectionControllerDidUpdateContent:self];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[MUTransitDeparturesDataSource setIsActive:](self->_dataSource, "setIsActive:");
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (MUTransitDeparturesSectionControllerDelegate)departuresDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_departuresDelegate);
  return (MUTransitDeparturesSectionControllerDelegate *)WeakRetained;
}

- (void)setDeparturesDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_departuresDelegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_viewProvider, 0);
}

@end