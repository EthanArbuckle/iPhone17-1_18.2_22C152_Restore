@interface MUPlaceSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (BOOL)isImpressionable;
- (CGRect)impressionsFrame;
- (GEOAPPlaceCardModule)analyticsModule;
- (GEORevealedPlaceCardModule)revealedAnalyticsModule;
- (MKMapItem)mapItem;
- (MUImpressionElement)impressionElement;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUPersonalizedSuggestionSectionArbiterDelegate)personalizedSuggestionsArbiterDelegate;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceSectionController)initWithMapItem:(id)a3;
- (MUPlaceSectionControllerDelegate)delegate;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (NSArray)sectionViews;
- (UIView)sectionView;
- (id)_placeCardImpressionsMetadata;
- (id)draggableContent;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (int)analyticsModuleType;
- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4;
- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4 feedbackType:(int)a5;
- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4 feedbackType:(int)a5 actionRichProviderId:(id)a6;
- (void)captureInfoCardAction:(int)a3 target:(int)a4 eventValue:(id)a5;
- (void)captureInfoCardPartnerAction:(int)a3 eventValue:(id)a4 sharedStateButtonList:(id)a5;
- (void)captureInfoCardPartnerAction:(int)a3 target:(int)a4 eventValue:(id)a5 sharedStateButtonList:(id)a6;
- (void)setActive:(BOOL)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPersonalizedSuggestionsArbiterDelegate:(id)a3;
- (void)setSubmissionStatus:(id)a3;
@end

@implementation MUPlaceSectionController

- (MUPlaceSectionController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPlaceSectionController;
  v6 = [(MUPlaceSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
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
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [(MUPlaceSectionController *)self sectionView];

  if (v3)
  {
    id v4 = [(MUPlaceSectionController *)self sectionView];
    v7[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return (NSArray *)v5;
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
  v2 = [(MUPlaceSectionController *)self sectionViews];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)infoCardChildPossibleActions
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)infoCardChildUnactionableUIElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4
{
}

- (void)captureInfoCardAction:(int)a3 target:(int)a4 eventValue:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v10 = [(MUPlaceSectionController *)self analyticsDelegate];
  objc_super v9 = [(MUPlaceSectionController *)self analyticsModule];
  [v10 infoCardAnalyticsDidSelectAction:v6 target:v5 eventValue:v8 moduleMetadata:v9 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4 feedbackType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v10 = [(MUPlaceSectionController *)self analyticsDelegate];
  objc_super v9 = [(MUPlaceSectionController *)self analyticsModule];
  [v10 infoCardAnalyticsDidSelectAction:v6 target:201 eventValue:v8 moduleMetadata:v9 feedbackDelegateSelector:v5 actionRichProviderId:0];
}

- (void)captureInfoCardAction:(int)a3 eventValue:(id)a4 feedbackType:(int)a5 actionRichProviderId:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a4;
  id v13 = [(MUPlaceSectionController *)self analyticsDelegate];
  v12 = [(MUPlaceSectionController *)self analyticsModule];
  [v13 infoCardAnalyticsDidSelectAction:v8 target:201 eventValue:v11 moduleMetadata:v12 feedbackDelegateSelector:v6 actionRichProviderId:v10];
}

- (void)captureInfoCardPartnerAction:(int)a3 target:(int)a4 eventValue:(id)a5 sharedStateButtonList:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v14 = a5;
  id v10 = a6;
  id v11 = [(MUPlaceSectionController *)self analyticsDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [(MUPlaceSectionController *)self analyticsDelegate];
    [v13 infoCardAnalyticsPopulateSharedStateWithButtonList:v10];
  }
  [(MUPlaceSectionController *)self captureInfoCardAction:v8 target:v7 eventValue:v14];
}

- (void)captureInfoCardPartnerAction:(int)a3 eventValue:(id)a4 sharedStateButtonList:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v12 = a4;
  id v8 = a5;
  objc_super v9 = [(MUPlaceSectionController *)self analyticsDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(MUPlaceSectionController *)self analyticsDelegate];
    [v11 infoCardAnalyticsPopulateSharedStateWithButtonList:v8];
  }
  [(MUPlaceSectionController *)self captureInfoCardAction:v6 eventValue:v12];
}

- (GEOAPPlaceCardModule)analyticsModule
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F643A8], "moduleFromModuleType:", -[MUPlaceSectionController analyticsModuleType](self, "analyticsModuleType"));
  [(MUPlaceSectionController *)self _populateAnalyticsModule:v3];
  return (GEOAPPlaceCardModule *)v3;
}

- (GEORevealedPlaceCardModule)revealedAnalyticsModule
{
  if ([(MUPlaceSectionController *)self isImpressionable])
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F64948], "moduleWithType:", -[MUPlaceSectionController analyticsModuleType](self, "analyticsModuleType"));
    [(MUPlaceSectionController *)self _populateRevealedAnalyticsModule:v3];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (GEORevealedPlaceCardModule *)v3;
}

- (int)analyticsModuleType
{
  return 0;
}

- (MUImpressionElement)impressionElement
{
  if ([(MUPlaceSectionController *)self isImpressionable])
  {
    impressionElement = self->_impressionElement;
    if (!impressionElement)
    {
      +[MUPlaceModuleVisibilityConfigStore visibilityThresholdForModuleType:[(MUPlaceSectionController *)self analyticsModuleType]];
      double v5 = v4;
      uint64_t v6 = [MUImpressionElement alloc];
      uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
      id v8 = [(MUImpressionElement *)v6 initWithElementIdentifier:v7 visibilityThreshold:v5];
      objc_super v9 = self->_impressionElement;
      self->_impressionElement = v8;

      char v10 = [(MUPlaceSectionController *)self _placeCardImpressionsMetadata];
      [(MUImpressionElement *)self->_impressionElement setCustomData:v10];

      id v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      [(MUImpressionElement *)self->_impressionElement setDebugString:v12];

      impressionElement = self->_impressionElement;
    }
    id v13 = impressionElement;
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (id)_placeCardImpressionsMetadata
{
  BOOL v3 = objc_alloc_init(MUPlaceCardImpressionsMetadata);
  double v4 = [(MUPlaceSectionController *)self mapItem];
  -[MUPlaceCardImpressionsMetadata setBusinessId:](v3, "setBusinessId:", [v4 _muid]);

  double v5 = [(MUPlaceSectionController *)self mapItem];
  uint64_t v6 = [v5 place];
  -[MUPlaceCardImpressionsMetadata setLocalSearchProviderId:](v3, "setLocalSearchProviderId:", [v6 localSearchProviderID]);

  [(MUPlaceSectionController *)self analyticsModuleType];
  [(MUPlaceCardImpressionsMetadata *)v3 setModuleType:GEOPDPlaceDataLayoutConfigurationFromGEOModuleType()];
  return v3;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (CGRect)impressionsFrame
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [(MUPlaceSectionController *)self sectionViews];
  uint64_t v3 = [v2 count];
  double v4 = [v2 firstObject];
  [v4 frame];
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;

  if (v3 != 1)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v2;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * v17), "frame", (void)v26);
          v35.origin.CGFloat x = v18;
          v35.origin.CGFloat y = v19;
          v35.size.CGFloat width = v20;
          v35.size.CGFloat height = v21;
          v32.origin.CGFloat x = x;
          v32.origin.CGFloat y = y;
          v32.size.CGFloat width = width;
          v32.size.CGFloat height = height;
          CGRect v33 = CGRectUnion(v32, v35);
          CGFloat x = v33.origin.x;
          CGFloat y = v33.origin.y;
          CGFloat width = v33.size.width;
          CGFloat height = v33.size.height;
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
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

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (MUPlaceSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUPlaceSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MUPersonalizedSuggestionSectionArbiterDelegate)personalizedSuggestionsArbiterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_personalizedSuggestionsArbiterDelegate);
  return (MUPersonalizedSuggestionSectionArbiterDelegate *)WeakRetained;
}

- (void)setPersonalizedSuggestionsArbiterDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_personalizedSuggestionsArbiterDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_impressionElement, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end