@interface MUPlaceCardAnalyticsController
- (BOOL)deferLoggingRevealUntilRefinement;
- (BOOL)instrumentRevealIfNeededWithImpressionsSessionId:(id)a3;
- (GEOLogContextDelegate)logContextDelegate;
- (MUPlaceCardAnalyticsController)initWithAnalyticsProvider:(id)a3;
- (MUPlaceCardAnalyticsProvider)provider;
- (NSArray)analyticModules;
- (_MKPlaceItem)placeItem;
- (void)_infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 modules:(id)a9 actionRichProviderId:(id)a10 completion:(id)a11;
- (void)_requestHostToLogFeedbackTypeIfNeeded:(int)a3;
- (void)disableDeferLoggingUntilRefinementWithShouldInvokeReveal:(BOOL)a3;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8;
- (void)infoCardAnalyticsPopulateSharedStateWithButtonList:(id)a3;
- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10;
- (void)instrumentAction:(int)a3 forModuleType:(int64_t)a4 usingFeedbackType:(int)a5;
- (void)instrumentAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleType:(int64_t)a6 feedbackType:(int)a7;
- (void)instrumentCloseUsingClientType:(unint64_t)a3;
- (void)instrumentConceal;
- (void)instrumentPunchoutActionWithURL:(id)a3 providerId:(id)a4;
- (void)instrumentVerticalScrollWithBeginningPoint:(CGPoint)a3 targetContentOffset:(CGPoint *)a4 velocity:(CGPoint)a5;
- (void)setDisableDeferLoggingUntilRefinement;
@end

@implementation MUPlaceCardAnalyticsController

- (_MKPlaceItem)placeItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v3 = [WeakRetained placeItem];

  return (_MKPlaceItem *)v3;
}

- (NSArray)analyticModules
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v3 = [WeakRetained analyticModules];

  return (NSArray *)v3;
}

- (MUPlaceCardAnalyticsController)initWithAnalyticsProvider:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceCardAnalyticsController;
  v5 = [(MUPlaceCardAnalyticsController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_provider, v4);
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MapsUI.PlaceViewController.Analytics", v7);
    analyticsQueue = v6->_analyticsQueue;
    v6->_analyticsQueue = (OS_dispatch_queue *)v8;
  }
  return v6;
}

- (void)infoCardAnalyticsPopulateSharedStateWithButtonList:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = MUGetPlaceCardAnalyticsUILog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_DEBUG, "Setting the shared state for button list %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v5 = [MEMORY[0x1E4F63E38] sharedData];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__MUPlaceCardAnalyticsController_infoCardAnalyticsPopulateSharedStateWithButtonList___block_invoke;
  v7[3] = &unk_1E574EE58;
  p_long long buf = &buf;
  id v6 = v3;
  id v8 = v6;
  [v5 populateActionButtonDetails:v7];

  _Block_object_dispose(&buf, 8);
}

BOOL __85__MUPlaceCardAnalyticsController_infoCardAnalyticsPopulateSharedStateWithButtonList___block_invoke(uint64_t a1, void *a2, void *a3, _DWORD *a4, unsigned char *a5)
{
  unint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v11 = [*(id *)(a1 + 32) count];
  if (v10 < v11)
  {
    uint64_t v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    *a3 = [v12 vendor];
    *a5 = [v12 isGroup];
    *a2 = [v12 metadata];
    int v13 = [v12 linkType];
    if ((v13 - 1) >= 3) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    *a4 = v14;
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  return v10 < v11;
}

- (BOOL)instrumentRevealIfNeededWithImpressionsSessionId:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(MUPlaceCardAnalyticsController *)self placeItem];
  id v6 = v5;
  if (!v5)
  {
    p_super = MUGetPlaceCardRevealLoggingLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      id v8 = "Place item is nil so not instrumenting reveal";
      goto LABEL_7;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_28;
  }
  if ([v5 isIntermediateMapItem])
  {
    p_super = MUGetPlaceCardRevealLoggingLog();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf) = 0;
      id v8 = "Place item is present but it contains an intermediate map item so not instrumenting reveal";
LABEL_7:
      _os_log_impl(&dword_1931EA000, p_super, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  BOOL deferLoggingRevealUntilRefinement = self->_deferLoggingRevealUntilRefinement;
  unint64_t v11 = MUGetPlaceCardRevealLoggingLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (deferLoggingRevealUntilRefinement)
  {
    if (v12)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1931EA000, v11, OS_LOG_TYPE_DEBUG, "Deferring reveal logging until refinement has finished.  Saving session identifier for next reveal.", (uint8_t *)&buf, 2u);
    }

    int v13 = (NSUUID *)v4;
    BOOL v9 = 0;
    p_super = &self->_cachedSessionId->super;
    self->_cachedSessionId = v13;
  }
  else
  {
    if (v12)
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1931EA000, v11, OS_LOG_TYPE_DEBUG, "Logging reveal for place item %@", (uint8_t *)&buf, 0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    p_super = [WeakRetained revealedModules];

    id v15 = [p_super mutableCopy];
    v16 = [MEMORY[0x1E4F63E38] sharedData];
    [v16 setPlaceCardRevealedPlaceCardModules:v15];

    v17 = MUGetPlaceCardRevealLoggingLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = p_super;
      _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_DEBUG, "Logging reveal modules %@", (uint8_t *)&buf, 0xCu);
    }

    v18 = [MEMORY[0x1E4F63E38] sharedData];
    [v18 populateImpressionObjectId:v4];

    v19 = [v6 mapItem];
    v20 = [v19 _enrichmentInfo];
    v21 = [v20 showcaseId];
    v22 = [MEMORY[0x1E4F63E38] sharedData];
    [v22 setPlaceCardPlaceActionDetailsShowcaseId:v21];

    v23 = MUGetPlaceCardRevealLoggingLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = [v6 mapItem];
      v25 = [v24 _enrichmentInfo];
      v26 = [v25 showcaseId];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v26;
      _os_log_impl(&dword_1931EA000, v23, OS_LOG_TYPE_DEBUG, "Logging showcase id %@", (uint8_t *)&buf, 0xCu);
    }
    v27 = [v6 contact];
    if (v27 && MapsFeature_IsEnabled_MapsWally() && [v6 representsPerson])
    {
      v28 = [v27 postalAddresses];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v56 = 0x2020000000;
      char v57 = 0;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __83__MUPlaceCardAnalyticsController_instrumentRevealIfNeededWithImpressionsSessionId___block_invoke;
      v50[3] = &unk_1E574EE80;
      v50[4] = &buf;
      [v28 enumerateObjectsUsingBlock:v50];
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      char v49 = 0;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __83__MUPlaceCardAnalyticsController_instrumentRevealIfNeededWithImpressionsSessionId___block_invoke_2;
      v45[3] = &unk_1E574EE80;
      v45[4] = &v46;
      [v28 enumerateObjectsUsingBlock:v45];
      v29 = [MEMORY[0x1E4F63E38] sharedData];
      [v29 setPlaceCardIsPersonPlacecard:1];

      int v30 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      v31 = [MEMORY[0x1E4F63E38] sharedData];
      [v31 setPlaceCardIsPersonLocationShared:v30 != 0];

      int v32 = *((unsigned __int8 *)v47 + 24);
      v33 = [MEMORY[0x1E4F63E38] sharedData];
      [v33 setPlaceCardIsPersonAddressAvailable:v32 != 0];

      v34 = MUGetPlaceCardRevealLoggingLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        int v35 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
        int v36 = *((unsigned __int8 *)v47 + 24);
        *(_DWORD *)v51 = 67109376;
        int v52 = v35;
        __int16 v53 = 1024;
        int v54 = v36;
        _os_log_impl(&dword_1931EA000, v34, OS_LOG_TYPE_DEBUG, "Logging person card isLocationShared: %d and isAddressAvailable %d", v51, 0xEu);
      }

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v37 = [MEMORY[0x1E4F63E38] sharedData];
      [v37 setPlaceCardIsPersonPlacecard:0];

      v38 = [MEMORY[0x1E4F63E38] sharedData];
      [v38 setPlaceCardIsPersonLocationShared:0];

      v39 = [MEMORY[0x1E4F63E38] sharedData];
      [v39 setPlaceCardIsPersonAddressAvailable:0];

      v28 = MUGetPlaceCardRevealLoggingLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1931EA000, v28, OS_LOG_TYPE_DEBUG, "Not a person card", (uint8_t *)&buf, 2u);
      }
    }

    id v40 = objc_loadWeakRetained((id *)&self->_provider);
    uint64_t v41 = [v40 defaultTargetForPlaceCardAnalytics];
    v42 = [(MUPlaceCardAnalyticsController *)self analyticModules];
    v43 = (void *)[v42 copy];
    [(MUPlaceCardAnalyticsController *)self _infoCardAnalyticsDidSelectAction:21 target:v41 eventValue:0 actionURL:0 photoID:0 feedbackDelegateSelector:0 modules:v43 actionRichProviderId:0 completion:&__block_literal_global_6];

    BOOL v9 = 1;
  }
LABEL_28:

  return v9;
}

void __83__MUPlaceCardAnalyticsController_instrumentRevealIfNeededWithImpressionsSessionId___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  v7 = objc_msgSend(MEMORY[0x1E4F1B8F8], "_mapkit_sharedLocationContactIdentifer");
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __83__MUPlaceCardAnalyticsController_instrumentRevealIfNeededWithImpressionsSessionId___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  v7 = objc_msgSend(MEMORY[0x1E4F1B8F8], "_mapkit_sharedLocationContactIdentifer");
  char v8 = [v6 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __83__MUPlaceCardAnalyticsController_instrumentRevealIfNeededWithImpressionsSessionId___block_invoke_8()
{
  id v0 = [MEMORY[0x1E4F63E38] sharedData];
  [v0 populateImpressionObjectId:0];
}

- (void)instrumentConceal
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = MUGetPlaceCardRevealLoggingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(MUPlaceCardAnalyticsController *)self placeItem];
    int v5 = 138412290;
    id v6 = v4;
    _os_log_impl(&dword_1931EA000, v3, OS_LOG_TYPE_DEBUG, "Logging conceal for place item %@", (uint8_t *)&v5, 0xCu);
  }
  [(MUPlaceCardAnalyticsController *)self infoCardAnalyticsDidSelectAction:47 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (void)instrumentVerticalScrollWithBeginningPoint:(CGPoint)a3 targetContentOffset:(CGPoint *)a4 velocity:(CGPoint)a5
{
  double v5 = a3.y - a4->y;
  if (v5 <= 0.0)
  {
    if (v5 < 0.0) {
      uint64_t v6 = 7;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 8;
  }
  [(MUPlaceCardAnalyticsController *)self infoCardAnalyticsDidSelectAction:v6 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (void)instrumentCloseUsingClientType:(unint64_t)a3
{
  if (a3 == 3) {
    unsigned int v3 = 701;
  }
  else {
    unsigned int v3 = 0;
  }
  if (a3 == 2) {
    uint64_t v4 = 702;
  }
  else {
    uint64_t v4 = v3;
  }
  [(MUPlaceCardAnalyticsController *)self infoCardAnalyticsDidSelectAction:4 target:v4 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (void)instrumentPunchoutActionWithURL:(id)a3 providerId:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = MUGetPlaceCardAnalyticsUILog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_DEBUG, "Instrumenting punchout with url %@ and provider id %@", (uint8_t *)&v9, 0x16u);
  }

  [(MUPlaceCardAnalyticsController *)self infoCardAnalyticsDidSelectAction:6050 eventValue:v6 feedbackDelegateSelector:0 actionRichProviderId:v7];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  p_provider = &self->_provider;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_provider);
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v6, [WeakRetained defaultTargetForPlaceCardAnalytics], v9, v5, 0);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  p_provider = &self->_provider;
  id v11 = a6;
  id v12 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_provider);
  -[MUPlaceCardAnalyticsController infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:](self, "infoCardAnalyticsDidSelectAction:target:eventValue:feedbackDelegateSelector:actionRichProviderId:", v8, [WeakRetained defaultTargetForPlaceCardAnalytics], v12, v6, v11);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  LODWORD(v8) = a7;
  [(MUPlaceCardAnalyticsController *)self infoCardAnalyticsDidSelectAction:*(void *)&a3 target:*(void *)&a4 eventValue:a5 actionURL:0 photoID:0 moduleMetadata:a6 feedbackDelegateSelector:v8 actionRichProviderId:a8];
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  uint64_t v13 = *(void *)&a4;
  uint64_t v14 = *(void *)&a3;
  uint64_t v16 = a9;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a10;
  if (a8)
  {
    v25[0] = a8;
    v21 = (void *)MEMORY[0x1E4F1C978];
    id v22 = a8;
    v23 = v21;
    uint64_t v16 = a9;
    v24 = [v23 arrayWithObjects:v25 count:1];
  }
  else
  {
    v24 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [(MUPlaceCardAnalyticsController *)self _infoCardAnalyticsDidSelectAction:v14 target:v13 eventValue:v17 actionURL:v18 photoID:v19 feedbackDelegateSelector:v16 modules:v24 actionRichProviderId:v20 completion:0];
}

- (void)_infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 modules:(id)a9 actionRichProviderId:(id)a10 completion:(id)a11
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v17 = a5;
  id v44 = a6;
  id v43 = a7;
  id v18 = a9;
  id v41 = a10;
  id v39 = a11;
  [(MUPlaceCardAnalyticsController *)self _requestHostToLogFeedbackTypeIfNeeded:v11];
  id v19 = MUGetPlaceCardAnalyticsUILog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    if ((int)v15 > 4000)
    {
      if ((int)v15 <= 10100)
      {
        if ((int)v15 > 7000)
        {
          switch((int)v15)
          {
            case 9001:
              id v20 = @"TAP_WIDGET_ITEM";
              break;
            case 9002:
              id v20 = @"DISPLAY_NOTIFICATION";
              break;
            case 9003:
              id v20 = @"TAP_NOTIFICATION";
              break;
            case 9004:
              id v20 = @"EXPAND_NOTIFICATION";
              break;
            case 9005:
              id v20 = @"DISMISS_NOTIFICATION";
              break;
            case 9006:
              id v20 = @"OPEN_SEARCH";
              break;
            case 9007:
              id v20 = @"OPEN_PAN_VIEW";
              break;
            case 9008:
              id v20 = @"PAN_LEFT";
              break;
            case 9009:
              id v20 = @"PAN_UP";
              break;
            case 9010:
            case 9041:
            case 9042:
            case 9043:
            case 9044:
            case 9045:
            case 9046:
            case 9047:
            case 9048:
            case 9049:
            case 9050:
            case 9051:
            case 9052:
            case 9053:
            case 9054:
            case 9055:
            case 9056:
            case 9057:
            case 9058:
            case 9059:
            case 9060:
            case 9061:
            case 9062:
            case 9063:
            case 9064:
            case 9065:
            case 9066:
            case 9067:
            case 9068:
            case 9069:
            case 9070:
            case 9071:
            case 9072:
            case 9073:
            case 9074:
            case 9075:
            case 9076:
            case 9077:
            case 9078:
            case 9079:
            case 9080:
            case 9081:
            case 9082:
            case 9083:
            case 9084:
            case 9085:
            case 9086:
            case 9087:
            case 9088:
            case 9089:
            case 9090:
            case 9091:
            case 9092:
            case 9093:
            case 9094:
            case 9095:
            case 9096:
            case 9097:
            case 9098:
            case 9099:
            case 9100:
              goto LABEL_47;
            case 9011:
              id v20 = @"PAN_DOWN";
              break;
            case 9012:
              id v20 = @"TAP_RECENT_DESTINATIONS";
              break;
            case 9013:
              id v20 = @"OPEN_DESTINATIONS";
              break;
            case 9014:
              id v20 = @"OPEN_FAVORITES";
              break;
            case 9015:
              id v20 = @"VIEW_NAV_OPTIONS";
              break;
            case 9016:
              id v20 = @"START_NAV_NO_GUIDANCE";
              break;
            case 9017:
              id v20 = @"TURN_OFF_GUIDANCE";
              break;
            case 9018:
              id v20 = @"TURN_ON_GUIDANCE";
              break;
            case 9019:
              id v20 = @"OPEN_KEYBOARD";
              break;
            case 9020:
              id v20 = @"SHARE_DESTINATION";
              break;
            case 9021:
              id v20 = @"START_NAV_AUTOMATED";
              break;
            case 9022:
              id v20 = @"SHARE_ETA";
              break;
            case 9023:
              id v20 = @"SELECT_GROUP";
              break;
            case 9024:
              id v20 = @"DESELECT_GROUP";
              break;
            case 9025:
              id v20 = @"SELECT_CONTACT";
              break;
            case 9026:
              id v20 = @"DESELECT_CONTACT";
              break;
            case 9027:
              id v20 = @"TAP_VIEW_CONTACTS";
              break;
            case 9028:
              id v20 = @"STOP_RECEIVING_ETA";
              break;
            case 9029:
              id v20 = @"DISPLAY_ANNOUNCEMENT";
              break;
            case 9030:
              id v20 = @"TAP_ANNOUNCEMENT";
              break;
            case 9031:
              id v20 = @"DISPLAY_CYCLING_NOTIFICATION";
              break;
            case 9032:
              id v20 = @"TAP_CYCLING_NOTIFICATION";
              break;
            case 9033:
              id v20 = @"SHARE_CYCLING_ETA";
              break;
            case 9034:
              id v20 = @"MANAGE_NOTIFICATIONS";
              break;
            case 9035:
              id v20 = @"PUNCH_OUT_PUBLISHER_REVIEW";
              break;
            case 9036:
              id v20 = @"SCROLL_FORWARD";
              break;
            case 9037:
              id v20 = @"SCROLL_BACKWARD";
              break;
            case 9038:
              id v20 = @"SHOW_ALL_CURATED_COLLECTIONS";
              break;
            case 9039:
              id v20 = @"TAP_LESS";
              break;
            case 9040:
              id v20 = @"TAP_MORE";
              break;
            case 9101:
              id v20 = @"DISPLAY_ADD_HOME_AND_WORK";
              break;
            case 9102:
              id v20 = @"TAP_ADD_HOME_AND_WORK";
              break;
            case 9103:
              id v20 = @"DISPLAY_ALLOW_FREQUENTS";
              break;
            case 9104:
              id v20 = @"TAP_ALLOW_FREQUENTS";
              break;
            case 9105:
              id v20 = @"DISPLAY_ALLOW_LOCATION";
              break;
            case 9106:
              id v20 = @"TAP_ALLOW_LOCATION";
              break;
            default:
              switch((int)v15)
              {
                case 7001:
                  id v20 = @"EXPAND_TRANSIT_SYSTEM";
                  break;
                case 7002:
                  id v20 = @"COLLAPSE_TRANSIT_SYSTEM";
                  break;
                case 7003:
                  id v20 = @"SHOW_MORE_DEPARTURES";
                  break;
                case 7004:
                  id v20 = @"VIEW_TRANSIT_LINE";
                  break;
                case 7005:
                  id v20 = @"CANCEL_VIEW_TRANSIT_LINE";
                  break;
                case 7006:
                  id v20 = @"TAP_TRANSIT_ATTRIBUTION";
                  break;
                case 7007:
                  id v20 = @"TAP_TRANSIT_ADVISORY";
                  break;
                case 7008:
                  id v20 = @"MORE_DETAILS_TRANSIT_ADVISORY";
                  break;
                case 7009:
                  id v20 = @"SUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7010:
                  id v20 = @"UNSUBSCRIBE_LINE_INCIDENT";
                  break;
                case 7011:
                  id v20 = @"TAP_NEAREST_STATION";
                  break;
                case 7012:
                  id v20 = @"TAP_NEAREST_STOP";
                  break;
                case 7013:
                  id v20 = @"TAP_CONNECTION";
                  break;
                case 7014:
                  id v20 = @"GET_TICKETS";
                  break;
                case 7015:
                  id v20 = @"OPEN_SCHEDULECARD_DATETIME";
                  break;
                case 7016:
                  id v20 = @"EXPAND_PRIOR_STEP_DETAILS_TRANSIT";
                  break;
                case 7017:
                  id v20 = @"EXPAND_ALIGHT_STEP_DETAILS_TRANSIT";
                  break;
                case 7018:
                  id v20 = @"VIEW_ON_MAP";
                  break;
                case 7019:
                  id v20 = @"FORCE_UPDATE_DEPARTURE_INFO";
                  break;
                case 7020:
                  id v20 = @"TAP_TRANSIT_LINE_INFO";
                  break;
                case 7021:
                  id v20 = @"TAP_ATTRIBUTION_CELL";
                  break;
                case 7022:
                  id v20 = @"TAP_NEXT_DEPARTURES";
                  break;
                case 7023:
                  id v20 = @"VIEW_BANNER";
                  break;
                case 7024:
                  id v20 = @"GET_SHOWTIMES";
                  break;
                case 7025:
                  id v20 = @"MAKE_APPOINTMENT";
                  break;
                case 7026:
                  id v20 = @"RESERVE_PARKING";
                  break;
                case 7027:
                  id v20 = @"RESERVE_ROOM";
                  break;
                case 7028:
                  id v20 = @"WAITLIST";
                  break;
                case 7029:
                  id v20 = @"ORDER_TAKEOUT";
                  break;
                case 7030:
                  id v20 = @"RESERVE";
                  break;
                default:
                  switch((int)v15)
                  {
                    case 8001:
                      id v20 = @"INVOKE_SIRI_SNIPPET";
                      break;
                    case 8002:
                      id v20 = @"INVOKE_SIRI_DISAMBIGUATION";
                      break;
                    case 8003:
                      id v20 = @"SHOW_PLACE_DETAILS";
                      break;
                    case 8004:
                      id v20 = @"ANSWER_REROUTE_SUGGESTION";
                      break;
                    case 8005:
                      id v20 = @"SUGGEST_NAV_REROUTE";
                      break;
                    case 8006:
                      id v20 = @"GET_NAV_STATUS";
                      break;
                    case 8007:
                      id v20 = @"REPEAT_NAV_STATUS";
                      break;
                    case 8008:
                      id v20 = @"SELECT_AUDIO_VOLUME_UNMUTE";
                      break;
                    case 8009:
                      id v20 = @"INVOKE_SIRI";
                      break;
                    case 8010:
                      id v20 = @"DISPLAY_SIRI_ERROR_MESSAGE";
                      break;
                    case 8011:
                      id v20 = @"DISPLAY_NO_RESULTS_MESSAGE";
                      break;
                    default:
                      goto LABEL_47;
                  }
                  break;
              }
              break;
          }
        }
        else
        {
          switch((int)v15)
          {
            case 6003:
              id v20 = @"GET_DIRECTIONS";
              break;
            case 6004:
              id v20 = @"TAP_FLYOVER_TOUR";
              break;
            case 6005:
              id v20 = @"REMOVE_PIN";
              break;
            case 6006:
              id v20 = @"TAP_PHOTO";
              break;
            case 6007:
              id v20 = @"TAP_MAPS_VIEW";
              break;
            case 6008:
              id v20 = @"TAP_ADDRESS";
              break;
            case 6009:
              id v20 = @"CALL";
              break;
            case 6010:
              id v20 = @"TAP_URL";
              break;
            case 6011:
              id v20 = @"SHOW_TODAY_HOURS";
              break;
            case 6012:
              id v20 = @"SHOW_ALL_HOURS";
              break;
            case 6013:
              id v20 = @"SHARE";
              break;
            case 6014:
            case 6017:
            case 6028:
            case 6030:
            case 6035:
              goto LABEL_47;
            case 6015:
              id v20 = @"ADD_TO_FAVORITES";
              break;
            case 6016:
              id v20 = @"ADD_CONTACT";
              break;
            case 6018:
              id v20 = @"PUNCH_OUT_PHOTO";
              break;
            case 6019:
              id v20 = @"PUNCH_OUT_USEFUL_TO_KNOW";
              break;
            case 6020:
              id v20 = @"PUNCH_OUT_OPEN_APP";
              break;
            case 6021:
              id v20 = @"PUNCH_OUT_SINGLE_REVIEW";
              break;
            case 6022:
              id v20 = @"PUNCH_OUT_CHECK_IN";
              break;
            case 6023:
              id v20 = @"PUNCH_OUT_MORE_INFO";
              break;
            case 6024:
              id v20 = @"PUNCH_OUT_WRITE_REVIEW";
              break;
            case 6025:
              id v20 = @"PUNCH_OUT_ADD_PHOTO";
              break;
            case 6026:
              id v20 = @"TAP_GRID_VIEW";
              break;
            case 6027:
              id v20 = @"EDIT_LOCATION";
              break;
            case 6029:
              id v20 = @"ADD_PHOTO";
              break;
            case 6031:
              id v20 = @"RETAKE";
              break;
            case 6032:
              id v20 = @"ADD_NOTE";
              break;
            case 6033:
              id v20 = @"REMOVE_CAR";
              break;
            case 6034:
              id v20 = @"EDIT_NAME";
              break;
            case 6036:
              id v20 = @"RESERVE_TABLE";
              break;
            case 6037:
              id v20 = @"ADD_TO_QUEUE";
              break;
            case 6038:
              id v20 = @"VIEW_BOOKED_TABLE";
              break;
            case 6039:
              id v20 = @"VIEW_QUEUED_TABLE";
              break;
            case 6040:
              id v20 = @"PUNCH_OUT_THIRD_PARTY_APP";
              break;
            case 6041:
              id v20 = @"PUNCH_OUT_LEGAL_LINK";
              break;
            case 6042:
              id v20 = @"TAP_PLACECARD_HEADER";
              break;
            case 6043:
              id v20 = @"REMOVE_FROM_FAVORITES";
              break;
            case 6044:
              id v20 = @"VIEW_CONTACT";
              break;
            case 6045:
              id v20 = @"CHAT";
              break;
            case 6046:
              id v20 = @"FIND_STORES";
              break;
            case 6047:
              id v20 = @"TAP_PARENT";
              break;
            case 6048:
              id v20 = @"SCROLL_LEFT_PHOTOS";
              break;
            case 6049:
              id v20 = @"SCROLL_RIGHT_PHOTOS";
              break;
            case 6050:
              id v20 = @"PUNCH_OUT";
              break;
            case 6051:
              id v20 = @"TAP_ENTER_MUNIN";
              break;
            case 6052:
              id v20 = @"TAP_RECOMMENDED_DISHES_PHOTO";
              break;
            case 6053:
              id v20 = @"PUNCH_OUT_RECOMMENDED_DISHES_OPEN_APP";
              break;
            case 6054:
              id v20 = @"PUNCH_OUT_RECOMMENDED_DISHES_MORE_INFO";
              break;
            case 6055:
              id v20 = @"SCROLL_RIGHT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6056:
              id v20 = @"SCROLL_LEFT_RECOMMENDED_DISHES_PHOTOS";
              break;
            case 6057:
              id v20 = @"SHOW_LINKED_SERVICE_HOURS";
              break;
            case 6058:
              id v20 = @"ENTER_LOOK_AROUND";
              break;
            case 6059:
              id v20 = @"EXIT_LOOK_AROUND";
              break;
            case 6060:
              id v20 = @"TAP_ENTER_LOOK_AROUND_VIEW";
              break;
            case 6061:
              id v20 = @"TAP_ENTER_LOOK_AROUND_PIP";
              break;
            case 6062:
              id v20 = @"EXPAND_LOOK_AROUND_VIEW";
              break;
            case 6063:
              id v20 = @"CLOSE_LOOK_AROUND";
              break;
            case 6064:
              id v20 = @"COLLAPSE_LOOK_AROUND_VIEW";
              break;
            case 6065:
              id v20 = @"TAP_SHOW_ACTIONS";
              break;
            case 6066:
              id v20 = @"TAP_HIDE_LABELS";
              break;
            case 6067:
              id v20 = @"TAP_SHOW_LABELS";
              break;
            case 6068:
              id v20 = @"TAP_SHOW_DETAILS";
              break;
            case 6069:
              id v20 = @"PAN_LOOK_AROUND";
              break;
            case 6070:
              id v20 = @"TAP_LOOK_AROUND_THUMBNAIL";
              break;
            case 6071:
              id v20 = @"TAP_LANDMARK";
              break;
            case 6072:
              id v20 = @"TAP_SCENE";
              break;
            case 6073:
              id v20 = @"SHOW_LINKED_BUSINESS_HOURS";
              break;
            case 6074:
              id v20 = @"TAP_PLACECARD_SHORTCUT";
              break;
            case 6075:
              id v20 = @"SHOW_ALL_LOCATIONS_INSIDE";
              break;
            case 6076:
              id v20 = @"SHOW_ALL_SIMILAR_LOCATIONS";
              break;
            case 6077:
              id v20 = @"SHOW_ALL_LOCATIONS_AT_ADDRESS";
              break;
            case 6078:
              id v20 = @"TAP_PARENT_LOCATION";
              break;
            case 6079:
              id v20 = @"TAP_SIMILAR_LOCATION";
              break;
            case 6080:
              id v20 = @"TAP_LOCATION_INSIDE";
              break;
            case 6081:
              id v20 = @"TAP_LOCATION_AT_ADDRESS";
              break;
            case 6082:
              id v20 = @"CLOSE_ROUTE_GENIUS";
              break;
            case 6083:
              id v20 = @"LOAD_WEB_CONTENT";
              break;
            case 6084:
              id v20 = @"SCROLL_FORWARD_WEB_CONTENT";
              break;
            case 6085:
              id v20 = @"SCROLL_BACKWARD_WEB_CONTENT";
              break;
            case 6086:
              id v20 = @"TAP_WEB_CONTENT";
              break;
            case 6087:
              id v20 = @"SHOW_PHOTO_VIEWER";
              break;
            case 6088:
              id v20 = @"SHOW_LAST_PAGE";
              break;
            case 6089:
              id v20 = @"TAP_VIEW_APP";
              break;
            case 6090:
              id v20 = @"TAP_APP_CLIP";
              break;
            case 6091:
              id v20 = @"DEAD_BATTERY";
              break;
            case 6092:
              id v20 = @"DISMISS_LOW_BATTERY_ALERT";
              break;
            case 6093:
              id v20 = @"DISMISS_OUT_OF_RANGE_ALERT";
              break;
            case 6094:
              id v20 = @"FAILED_TO_LOAD_EV_STATUS";
              break;
            case 6095:
              id v20 = @"LOW_BATTERY_ALERT";
              break;
            case 6096:
              id v20 = @"PAUSE_ROUTE";
              break;
            case 6097:
              id v20 = @"TAP_ADD_STOP";
              break;
            case 6098:
              id v20 = @"TAP_CHARGE_POINT";
              break;
            case 6099:
              id v20 = @"TAP_OUT_OF_RANGE_ALERT";
              break;
            case 6100:
              id v20 = @"SCROLL_DOWN_PHOTOS";
              break;
            case 6101:
              id v20 = @"SCROLL_UP_PHOTOS";
              break;
            case 6102:
              id v20 = @"TAP_MORE_PHOTOS";
              break;
            case 6103:
              id v20 = @"TAP_TO_CONFIRM_INCIDENT";
              break;
            case 6104:
              id v20 = @"SHOW_INCIDENT";
              break;
            case 6105:
              id v20 = @"REVEAL_APP_CLIP";
              break;
            case 6106:
              id v20 = @"ORDER_DELIVERY";
              break;
            case 6107:
              id v20 = @"VIEW_MENU";
              break;
            case 6108:
              id v20 = @"TAP_EDIT_STOPS";
              break;
            case 6109:
              id v20 = @"LEARN_MORE_WEB_CONTENT";
              break;
            case 6110:
              id v20 = @"MAKE_APPOINTMENT_WEB_CONTENT";
              break;
            case 6111:
              id v20 = @"REVEAL_SHOWCASE";
              break;
            default:
              switch((int)v15)
              {
                case 5001:
                  id v20 = @"SHOW_MAPS_SETTINGS";
                  break;
                case 5002:
                  id v20 = @"TAP_STANDARD_MODE";
                  break;
                case 5003:
                  id v20 = @"TAP_TRANSIT_MODE";
                  break;
                case 5004:
                  id v20 = @"TAP_SATELLITE_MODE";
                  break;
                case 5005:
                  id v20 = @"SWITCH_ON_TRAFFIC";
                  break;
                case 5006:
                  id v20 = @"SWITCH_OFF_TRAFFIC";
                  break;
                case 5007:
                  id v20 = @"SWITCH_ON_LABELS";
                  break;
                case 5008:
                  id v20 = @"SWITCH_OFF_LABELS";
                  break;
                case 5009:
                  id v20 = @"SWITCH_ON_3D_MAP";
                  break;
                case 5010:
                  id v20 = @"SWITCH_OFF_3D_MAP";
                  break;
                case 5011:
                  id v20 = @"SWITCH_ON_WEATHER";
                  break;
                case 5012:
                  id v20 = @"SWITCH_OFF_WEATHER";
                  break;
                case 5013:
                  id v20 = @"REPORT_A_PROBLEM";
                  break;
                case 5014:
                  id v20 = @"ADD_PLACE";
                  break;
                case 5015:
                  goto LABEL_47;
                case 5016:
                  id v20 = @"TAP_PREFERENCES";
                  break;
                case 5017:
                  id v20 = @"SWITCH_ON_TOLLS";
                  break;
                case 5018:
                  id v20 = @"SWITCH_OFF_TOLLS";
                  break;
                case 5019:
                  id v20 = @"SWITCH_ON_HIGHWAYS";
                  break;
                case 5020:
                  id v20 = @"SWITCH_OFF_HIGHWAYS";
                  break;
                case 5021:
                  id v20 = @"SWITCH_ON_HEADING";
                  break;
                case 5022:
                  id v20 = @"SWITCH_OFF_HEADING";
                  break;
                case 5023:
                  id v20 = @"SWITCH_ON_SPEED_LIMIT";
                  break;
                case 5024:
                  id v20 = @"SWITCH_OFF_SPEED_LIMIT";
                  break;
                case 5025:
                  id v20 = @"ELECT_DRIVING_MODE";
                  break;
                case 5026:
                  id v20 = @"ELECT_WALKING_MODE";
                  break;
                case 5027:
                  id v20 = @"ELECT_TRANSIT_MODE";
                  break;
                case 5028:
                  id v20 = @"ELECT_RIDESHARE_MODE";
                  break;
                case 5029:
                  id v20 = @"SWITCH_ON_FIND_MY_CAR";
                  break;
                case 5030:
                  id v20 = @"SWITCH_OFF_FIND_MY_CAR";
                  break;
                case 5031:
                  id v20 = @"MARK_MY_LOCATION";
                  break;
                case 5032:
                  id v20 = @"TAP_HYBRID_MODE";
                  break;
                case 5033:
                  id v20 = @"CHECK_AVOID_BUSY_ROADS";
                  break;
                case 5034:
                  id v20 = @"UNCHECK_AVOID_BUSY_ROADS";
                  break;
                case 5035:
                  id v20 = @"CHECK_AVOID_HILLS";
                  break;
                case 5036:
                  id v20 = @"UNCHECK_AVOID_HILLS";
                  break;
                case 5037:
                  id v20 = @"CHECK_AVOID_STAIRS";
                  break;
                case 5038:
                  id v20 = @"UNCHECK_AVOID_STAIRS";
                  break;
                case 5039:
                  id v20 = @"ELECT_CYCLING_MODE";
                  break;
                default:
                  switch((int)v15)
                  {
                    case 4001:
                      id v20 = @"RECENTER_CURRENT_LOCATION";
                      break;
                    case 4002:
                      id v20 = @"TAP_HEADING_ON";
                      break;
                    case 4003:
                      id v20 = @"TAP_HEADING_OFF";
                      break;
                    case 4004:
                      id v20 = @"PUCK_DRIFT";
                      break;
                    case 4005:
                      id v20 = @"PUCK_SNAP";
                      break;
                    case 4006:
                      id v20 = @"SELECT_FLOOR";
                      break;
                    default:
                      goto LABEL_47;
                  }
                  break;
              }
              break;
          }
        }
      }
      else if ((int)v15 > 13000)
      {
        if ((int)v15 <= 16000)
        {
          if ((int)v15 <= 15000)
          {
            switch((int)v15)
            {
              case 14001:
                id v20 = @"VIEW_APP";
                break;
              case 14002:
                id v20 = @"ENABLE";
                break;
              case 14003:
                id v20 = @"BOOK_RIDE";
                break;
              case 14004:
                id v20 = @"REQUEST_RIDE";
                break;
              case 14005:
                id v20 = @"CONTACT_DRIVER";
                break;
              case 14006:
                id v20 = @"CHANGE_PAYMENT";
                break;
              case 14007:
                id v20 = @"ENABLE_ALL_RIDESHARE_APPS";
                break;
              case 14008:
                id v20 = @"TAP_FOR_MORE_RIDES";
                break;
              case 14009:
                id v20 = @"SUBMIT_TRIP_FEEDBACK";
                break;
              default:
                switch((int)v15)
                {
                  case 13001:
                    id v20 = @"SELECT_ADDRESS";
                    break;
                  case 13002:
                    id v20 = @"ADD_ADDRESS";
                    break;
                  case 13003:
                    id v20 = @"SELECT_LABEL";
                    break;
                  case 13004:
                    id v20 = @"DELETE_ADDRESS";
                    break;
                  case 13005:
                    id v20 = @"EDIT_ITEMS";
                    break;
                  case 13006:
                    id v20 = @"RAP_FAVORITES";
                    break;
                  case 13007:
                    id v20 = @"SORT_LIST_ITEM";
                    break;
                  default:
                    goto LABEL_47;
                }
                break;
            }
          }
          else
          {
            switch(v15)
            {
              case 0x3A99:
                id v20 = @"ORB_PEEK";
                break;
              case 0x3A9A:
                id v20 = @"ORB_POP";
                break;
              case 0x3A9B:
                id v20 = @"ORB_DISMISS";
                break;
              default:
LABEL_47:
                objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v15);
                id v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
                break;
            }
          }
        }
        else
        {
          switch((int)v15)
          {
            case 17001:
              id v20 = @"START_DRAG";
              break;
            case 17002:
              id v20 = @"CANCEL_DRAG";
              break;
            case 17003:
              id v20 = @"COMPLETE_DRAG";
              break;
            case 17004:
              id v20 = @"START_DROP";
              break;
            case 17005:
              id v20 = @"CANCEL_DROP";
              break;
            case 17006:
              id v20 = @"COMPLETE_DROP";
              break;
            case 17007:
              id v20 = @"ANNOTATION_SELECT";
              break;
            case 17008:
              id v20 = @"ANNOTATION_SELECT_AUTO";
              break;
            case 17009:
              id v20 = @"ANNOTATION_SELECT_LIST";
              break;
            case 17010:
              id v20 = @"BROWSE_TOP_CATEGORY_DISPLAYED";
              break;
            case 17011:
              id v20 = @"CALLOUT_FLYOVER_TOUR";
              break;
            case 17012:
              id v20 = @"CALLOUT_INFO";
              break;
            case 17013:
              id v20 = @"CALLOUT_NAV_TRANSIT";
              break;
            case 17014:
              id v20 = @"CALLOUT_TRAFFIC_INCIDENT_INFO";
              break;
            case 17015:
              id v20 = @"CALLOUT_VIEW_TRANSIT_LINE";
              break;
            case 17016:
              id v20 = @"DIRECTIONS_SELECT";
              break;
            case 17017:
              id v20 = @"DIRECTIONS_TRANSIT_CUSTOM";
              break;
            case 17018:
              id v20 = @"DIRECTIONS_TRANSIT_CUSTOM_ARRIVES";
              break;
            case 17019:
              id v20 = @"DIRECTIONS_TRANSIT_CUSTOM_DEPARTS";
              break;
            case 17020:
              id v20 = @"DIRECTIONS_TRANSIT_CUSTOM_DONE";
              break;
            case 17021:
              id v20 = @"DIRECTIONS_TRANSIT_LATER";
              break;
            case 17022:
              id v20 = @"DIRECTIONS_TRANSIT_NOW";
              break;
            case 17023:
              id v20 = @"FLYOVER_NOTIFICATION_DISMISS";
              break;
            case 17024:
              id v20 = @"FLYOVER_NOTIFICATION_START";
              break;
            case 17025:
              id v20 = @"FLYOVER_TOUR_COMPLETED";
              break;
            case 17026:
              id v20 = @"FLYOVER_TOUR_END";
              break;
            case 17027:
              id v20 = @"FLYOVER_TOUR_NOTIFICATION";
              break;
            case 17028:
              id v20 = @"FLYOVER_TOUR_START";
              break;
            case 17029:
              id v20 = @"INFO_BOOKMARKS";
              break;
            case 17030:
              id v20 = @"INFO_CARD_DETACHED";
              break;
            case 17031:
              id v20 = @"INFO_CONTACTS";
              break;
            case 17032:
              id v20 = @"INFO_DIRECTIONS";
              break;
            case 17033:
              id v20 = @"INFO_DIRECTIONS_FROM";
              break;
            case 17034:
              id v20 = @"INFO_DIRECTIONS_TO";
              break;
            case 17035:
              id v20 = @"INFO_DISMISS";
              break;
            case 17036:
              id v20 = @"INFO_INFO";
              break;
            case 17037:
              id v20 = @"INFO_PHOTOS";
              break;
            case 17038:
              id v20 = @"INFO_REVIEWS";
              break;
            case 17039:
              id v20 = @"INFO_SHARE";
              break;
            case 17040:
              id v20 = @"INFO_SHARE_AIRDROP";
              break;
            case 17041:
              id v20 = @"INFO_SHARE_FACEBOOK";
              break;
            case 17042:
              id v20 = @"INFO_SHARE_MAIL";
              break;
            case 17043:
              id v20 = @"INFO_SHARE_MESSAGE";
              break;
            case 17044:
              id v20 = @"INFO_SHARE_TENCENTWEIBO";
              break;
            case 17045:
              id v20 = @"INFO_SHARE_WEIBO";
              break;
            case 17046:
              id v20 = @"INFO_YELP";
              break;
            case 17047:
              id v20 = @"MAPS_APP_LAUNCH";
              break;
            case 17048:
              id v20 = @"MAP_3D_OFF";
              break;
            case 17049:
              id v20 = @"MAP_3D_ON";
              break;
            case 17050:
              id v20 = @"MAP_OPTIONS_DROP_PIN";
              break;
            case 17051:
              id v20 = @"MAP_OPTIONS_HYBRID";
              break;
            case 17052:
              id v20 = @"MAP_OPTIONS_PRINT";
              break;
            case 17053:
              id v20 = @"MAP_OPTIONS_REMOVE_PIN";
              break;
            case 17054:
              id v20 = @"MAP_OPTIONS_SATELLITE";
              break;
            case 17055:
              id v20 = @"MAP_OPTIONS_STANDARD";
              break;
            case 17056:
              id v20 = @"MAP_OPTIONS_TRAFFIC_HIDE";
              break;
            case 17057:
              id v20 = @"MAP_OPTIONS_TRAFFIC_SHOW";
              break;
            case 17058:
              id v20 = @"MAP_OPTIONS_TRANSIT";
              break;
            case 17059:
              id v20 = @"MAP_TAP_FLYOVER_CITY";
              break;
            case 17060:
              id v20 = @"MAP_TAP_LINE";
              break;
            case 17061:
              id v20 = @"MAP_TAP_POI_TRANSIT";
              break;
            case 17062:
              id v20 = @"MAP_TAP_TRAFFIC_INCIDENT";
              break;
            case 17063:
              id v20 = @"MAP_TRANSIT_NOT_AVAIL_SHOWING";
              break;
            case 17064:
              id v20 = @"MAP_USER_TRACKING_OFF";
              break;
            case 17065:
              id v20 = @"MAP_USER_TRACKING_ON";
              break;
            case 17066:
              id v20 = @"MAP_USER_TRACKING_WITH_HEADING_ON";
              break;
            case 17067:
              id v20 = @"NAV_CLEAR";
              break;
            case 17068:
              id v20 = @"NAV_LIST";
              break;
            case 17069:
              id v20 = @"NAV_ROUTE_STEP_NEXT";
              break;
            case 17070:
              id v20 = @"NAV_ROUTE_STEP_PREV";
              break;
            case 17071:
              id v20 = @"NO_NETWORK_ROUTING_ALERT_DISPLAYED";
              break;
            case 17072:
              id v20 = @"ORB_DISPLAY_MENU";
              break;
            case 17073:
              id v20 = @"ORB_MENU_CALL";
              break;
            case 17074:
              id v20 = @"ORB_MENU_DIRECTIONS";
              break;
            case 17075:
              id v20 = @"ORB_MENU_DISMISS";
              break;
            case 17076:
              id v20 = @"ORB_MENU_SHARE";
              break;
            case 17077:
              id v20 = @"ORB_MENU_SHOW_PLACECARD";
              break;
            case 17078:
              id v20 = @"ORB_MENU_TRANSIT_LINE_VIEW_ON_MAP";
              break;
            case 17079:
              id v20 = @"ORB_MENU_URL";
              break;
            case 17080:
              id v20 = @"ORB_PRESS";
              break;
            case 17081:
              id v20 = @"ORB_SPRINGBOARD_MARK_LOCATION";
              break;
            case 17082:
              id v20 = @"ORB_SPRINGBOARD_SEARCH";
              break;
            case 17083:
              id v20 = @"ORB_SPRINGBOARD_SHARE_LOCATION";
              break;
            case 17084:
              id v20 = @"RAP_ENTRY_SEARCH_AUTOCOMPLETE";
              break;
            case 17085:
              id v20 = @"RAP_PERMISSION_CANCEL";
              break;
            case 17086:
              id v20 = @"RAP_PERMISSION_EMAIL_NA";
              break;
            case 17087:
              id v20 = @"RAP_PERMISSION_EMAIL_OK";
              break;
            case 17088:
              id v20 = @"RAP_PERMISSION_EMAIL_SETTINGS_ACCEPTED";
              break;
            case 17089:
              id v20 = @"RAP_PERMISSION_EMAIL_SETTINGS_DENIED";
              break;
            case 17090:
              id v20 = @"RAP_PERMISSION_OK";
              break;
            case 17091:
              id v20 = @"SEARCH_BEGIN";
              break;
            case 17092:
              id v20 = @"SEARCH_CANCEL";
              break;
            case 17093:
              id v20 = @"SEARCH_SELECT";
              break;
            case 17094:
              id v20 = @"TRANSIT_LINE_SELECTION_DISMISS";
              break;
            case 17095:
              id v20 = @"TRANSIT_LINE_SELECTION_VIEW";
              break;
            case 17096:
              id v20 = @"TRANSIT_ROUTE_CLUSTER_SHEET_DISMISS";
              break;
            case 17097:
              id v20 = @"TRANSIT_ROUTE_CLUSTER_SHEET_SELECT_LINE";
              break;
            case 17098:
              id v20 = @"TRANSIT_ROUTE_CLUSTER_SHEET_VIEW_DETAILS";
              break;
            case 17099:
              id v20 = @"UNKNOWN_ACTION";
              break;
            case 17100:
              id v20 = @"INFO_SHARE_TWITTER";
              break;
            case 17101:
              id v20 = @"INFO_TAP_POPULAR_APP_NEARBY";
              break;
            case 17102:
              id v20 = @"INFO_DIRECTIONS_WALK";
              break;
            case 17103:
              id v20 = @"INFO_DIRECTIONS_TRANSIT";
              break;
            case 17104:
              id v20 = @"INFO_DIRECTIONS_DRIVE";
              break;
            case 17105:
              id v20 = @"INFO_REPORT_A_PROBLEM";
              break;
            case 17106:
              id v20 = @"CALLOUT_NAV";
              break;
            case 17107:
              id v20 = @"RAP_PERMISSION_EMAIL_CANCEL";
              break;
            case 17108:
              id v20 = @"MAP_TAP_POI";
              break;
            default:
              if (v15 == 16001)
              {
                id v20 = @"SEARCH_IN_MAPS";
              }
              else
              {
                if (v15 != 90010) {
                  goto LABEL_47;
                }
                id v20 = @"PAN_RIGHT";
              }
              break;
          }
        }
      }
      else
      {
        switch((int)v15)
        {
          case 10101:
            id v20 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT";
            break;
          case 10102:
            id v20 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE";
            break;
          case 10103:
            id v20 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT";
            break;
          case 10104:
            id v20 = @"RAP_DIRECTIONS_ESTIMATED_ARRIVAL_TIME_INCORRECT";
            break;
          case 10105:
            id v20 = @"RAP_DIRECTIONS_ADD_INSTRUCTION_INFO";
            break;
          case 10106:
            id v20 = @"RAP_DIRECTIONS_COLLAPSE_INSTRUCTION";
            break;
          case 10107:
            id v20 = @"RAP_DIRECTIONS_EXPAND_INSTRUCTION";
            break;
          case 10108:
            id v20 = @"RAP_DIRECTIONS_SELECT_INSTRUCTION";
            break;
          case 10109:
            id v20 = @"RAP_CANCEL";
            break;
          case 10110:
            id v20 = @"RAP_NEXT";
            break;
          case 10111:
            id v20 = @"RAP_BACK";
            break;
          case 10112:
            id v20 = @"RAP_SEND";
            break;
          case 10113:
            id v20 = @"RAP_SKIP";
            break;
          case 10114:
            id v20 = @"RAP_SHOW_MORE";
            break;
          case 10115:
            id v20 = @"RAP_ADD_PHOTO";
            break;
          case 10116:
            id v20 = @"RAP_MAP_INCORRECT";
            break;
          case 10117:
            id v20 = @"RAP_BAD_DIRECTIONS";
            break;
          case 10118:
            id v20 = @"RAP_TRANSIT_INFO_INCORRECT";
            break;
          case 10119:
            id v20 = @"RAP_SATELLITE_IMAGE_PROBLEM";
            break;
          case 10120:
            id v20 = @"RAP_SEARCH_RESULTS_INCORRECT";
            break;
          case 10121:
            id v20 = @"RAP_ADD_A_PLACE";
            break;
          case 10122:
            id v20 = @"RAP_HOME";
            break;
          case 10123:
            id v20 = @"RAP_WORK";
            break;
          case 10124:
            id v20 = @"RAP_OTHER";
            break;
          case 10125:
            id v20 = @"RAP_LOCATION";
            break;
          case 10126:
            id v20 = @"RAP_TRANSIT_STATION_INFO_INCORRECT";
            break;
          case 10127:
            id v20 = @"RAP_TRANSIT_STATION_ACCESS_POINT_INFO_INCORRECT";
            break;
          case 10128:
            id v20 = @"RAP_TRANSIT_LINE_INFO_INCORRECT";
            break;
          case 10129:
            id v20 = @"RAP_TRANSIT_LINE_NAME_INCORRECT";
            break;
          case 10130:
            id v20 = @"RAP_TRANSIT_LINE_SHAPE_INCORRECT";
            break;
          case 10131:
            id v20 = @"RAP_TRANSIT_LINE_SCHEDULE_INCORRECT";
            break;
          case 10132:
            id v20 = @"RAP_TRANSIT_DELAY";
            break;
          case 10133:
            id v20 = @"RAP_LOCATION_CLOSED";
            break;
          case 10134:
            id v20 = @"RAP_CLOSED_PERMANENTLY";
            break;
          case 10135:
            id v20 = @"RAP_CLOSED_TEMPORARILY";
            break;
          case 10136:
            id v20 = @"RAP_HOURS_HAVE_CHANGED";
            break;
          case 10137:
            id v20 = @"RAP_SELECT_STATION";
            break;
          case 10138:
            id v20 = @"RAP_SELECT_LINE";
            break;
          case 10139:
            id v20 = @"RAP_SELECT_ACCESS_POINT";
            break;
          case 10140:
            id v20 = @"RAP_SELECT_SEARCH";
            break;
          case 10141:
            id v20 = @"RAP_PAN_MAP";
            break;
          case 10142:
            id v20 = @"RAP_CENTER_MAP_ON_USER";
            break;
          case 10143:
            id v20 = @"RAP_SEARCH_UNEXPECTED";
            break;
          case 10144:
            id v20 = @"RAP_ADD_POI";
            break;
          case 10145:
            id v20 = @"RAP_ADD_STREET_ADDRESS";
            break;
          case 10146:
            id v20 = @"RAP_ADD_OTHER";
            break;
          case 10147:
            id v20 = @"RAP_SELECT_CATEGORY";
            break;
          case 10148:
            id v20 = @"RAP_TAKE_PHOTO";
            break;
          case 10149:
            id v20 = @"RAP_RETAKE_PHOTO";
            break;
          case 10150:
            id v20 = @"RAP_PLACE_DETAILS";
            break;
          case 10151:
            id v20 = @"RAP_SATELLITE_IMAGE_OUTDATED";
            break;
          case 10152:
            id v20 = @"RAP_SATELLITE_IMAGE_QUALITY";
            break;
          case 10153:
            id v20 = @"RAP_SELECT_LABEL";
            break;
          case 10154:
            id v20 = @"RAP_SELECT_ROUTE";
            break;
          case 10155:
            id v20 = @"RAP_CLAIM_BUSINESS";
            break;
          case 10156:
            id v20 = @"RAP_BRAND_DETAILS";
            break;
          case 10157:
            id v20 = @"RAP_LOOK_AROUND_IMAGE_QUALITY";
            break;
          case 10158:
            id v20 = @"RAP_LOOK_AROUND_LABELS_STREET";
            break;
          case 10159:
            id v20 = @"RAP_LOOK_AROUND_BLURRING";
            break;
          case 10160:
            id v20 = @"RAP_LOOK_AROUND_REMOVE_HOME";
            break;
          case 10161:
            id v20 = @"RAP_LOOK_AROUND_LABELS_STORE";
            break;
          case 10162:
            id v20 = @"RAP_LOOK_AROUND_PRIVACY";
            break;
          case 10163:
            id v20 = @"RAP_INCORRECT_HOURS";
            break;
          case 10164:
            id v20 = @"RAP_INCORRECT_ADDRESS";
            break;
          case 10165:
            id v20 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 10166:
            id v20 = @"RAP_EDIT_PLACE_NAME";
            break;
          case 10167:
            id v20 = @"RAP_EDIT_ADDRESS";
            break;
          case 10168:
            id v20 = @"RAP_ADD_CATEGORY";
            break;
          case 10169:
            id v20 = @"RAP_REMOVE_CATEGORY";
            break;
          case 10170:
            id v20 = @"RAP_DESELECT_CATEGORY";
            break;
          case 10171:
            id v20 = @"RAP_ADD_HOURS";
            break;
          case 10172:
            id v20 = @"RAP_REMOVE_HOURS";
            break;
          case 10173:
            id v20 = @"RAP_TAP_DAY_OF_WEEK";
            break;
          case 10174:
            id v20 = @"RAP_TAP_24_HOURS_BUTTON";
            break;
          case 10175:
            id v20 = @"RAP_TAP_OPEN_TIME";
            break;
          case 10176:
            id v20 = @"RAP_TAP_CLOSED_TIME";
            break;
          case 10177:
            id v20 = @"RAP_TAP_TEMPORARY_CLOSURE";
            break;
          case 10178:
            id v20 = @"RAP_TAP_PERMANENTLY_CLOSED";
            break;
          case 10179:
            id v20 = @"RAP_EDIT_WEBSITE";
            break;
          case 10180:
            id v20 = @"RAP_EDIT_PHONE_NUMBER";
            break;
          case 10181:
            id v20 = @"RAP_TAP_ACCEPTS_APPLE_PAY";
            break;
          case 10182:
            id v20 = @"RAP_ADD_COMMENTS";
            break;
          case 10183:
            id v20 = @"RAP_EDIT_LOCATION";
            break;
          case 10184:
            id v20 = @"RAP_VIEW_LOCATION";
            break;
          case 10185:
            id v20 = @"RAP_ZOOM_IN";
            break;
          case 10186:
            id v20 = @"RAP_ZOOM_OUT";
            break;
          case 10187:
            id v20 = @"RAP_VIEW_ENTRY_POINTS";
            break;
          case 10188:
            id v20 = @"RAP_EDIT_EXISTING_ENTRY_POINT";
            break;
          case 10189:
            id v20 = @"RAP_ADD_NEW_ENTRY_POINT";
            break;
          case 10190:
            id v20 = @"RAP_REMOVE_ENTRY_POINT";
            break;
          case 10191:
            id v20 = @"RAP_SELECT_ENTRY_POINT_TYPE";
            break;
          default:
            switch((int)v15)
            {
              case 11001:
                id v20 = @"EXIT_MAPS_LOWER_WRIST";
                break;
              case 11002:
                id v20 = @"TASK_READY";
                break;
              case 11003:
                id v20 = @"TAP_SEARCH";
                break;
              case 11004:
                id v20 = @"TAP_MY_LOCATION";
                break;
              case 11005:
                id v20 = @"SHOW_NEARBY";
                break;
              case 11006:
                id v20 = @"TAP_NEARBY";
                break;
              case 11007:
                id v20 = @"TAP_PROACTIVE";
                break;
              case 11008:
                id v20 = @"FORCE_PRESS";
                break;
              case 11009:
                id v20 = @"TAP_CONTACTS";
                break;
              case 11010:
                id v20 = @"TAP_TRANSIT";
                break;
              case 11011:
                id v20 = @"TAP_DICTATION";
                break;
              case 11012:
                id v20 = @"GET_DIRECTIONS_DRIVING";
                break;
              case 11013:
                id v20 = @"GET_DIRECTIONS_WALKING";
                break;
              case 11014:
                id v20 = @"GET_DIRECTIONS_TRANSIT";
                break;
              case 11015:
                id v20 = @"OPEN_STANDARD_MAP";
                break;
              case 11016:
                id v20 = @"OPEN_TRANSIT_MAP";
                break;
              case 11017:
                id v20 = @"START_NAV_AUTO";
                break;
              case 11018:
                id v20 = @"TAP_RECENT";
                break;
              case 11019:
                id v20 = @"TAP_FAVORITE";
                break;
              case 11020:
                id v20 = @"TAP_SCRIBBLE";
                break;
              case 11021:
                id v20 = @"TAP_VIEW_MAP";
                break;
              case 11022:
                id v20 = @"TAP_VIEW_TBT";
                break;
              case 11023:
                id v20 = @"VIEW_ROUTE_INFO";
                break;
              case 11024:
                id v20 = @"NAV_UNMUTE";
                break;
              case 11025:
                id v20 = @"NAV_MUTE";
                break;
              case 11026:
                id v20 = @"GET_DIRECTIONS_CYCLING";
                break;
              case 11027:
                id v20 = @"TAP_SEARCH_HOME";
                break;
              case 11028:
                id v20 = @"ROUTE_PAUSED_ON_WATCH";
                break;
              case 11029:
                id v20 = @"NEXT_STOP_TAPPED_ON_WATCH";
                break;
              default:
                switch((int)v15)
                {
                  case 12001:
                    id v20 = @"VIEW_MORE_OPTIONS";
                    break;
                  case 12002:
                    id v20 = @"SELECT_TIME";
                    break;
                  case 12003:
                    id v20 = @"SHOW_NEXT_AVAILABLE";
                    break;
                  case 12004:
                    id v20 = @"DECREASE_TABLE_SIZE";
                    break;
                  case 12005:
                    id v20 = @"INCREASE_TABLE_SIZE";
                    break;
                  case 12006:
                    id v20 = @"EDIT_BOOKING";
                    break;
                  case 12007:
                    id v20 = @"EDIT_PHONE";
                    break;
                  case 12008:
                    id v20 = @"ADD_SPECIAL_REQUEST";
                    break;
                  case 12009:
                    id v20 = @"CHANGE_RESERVATION";
                    break;
                  case 12010:
                    id v20 = @"LEARN_MORE";
                    break;
                  default:
                    goto LABEL_47;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      id v20 = @"UI_ACTION_UNKNOWN";
      switch((int)v15)
      {
        case 0:
          break;
        case 1:
          id v20 = @"PULL_UP";
          break;
        case 2:
          id v20 = @"PULL_DOWN";
          break;
        case 3:
          id v20 = @"TAP";
          break;
        case 4:
          id v20 = @"CLOSE";
          break;
        case 5:
          id v20 = @"SWIPE_PREV";
          break;
        case 6:
          id v20 = @"SWIPE_NEXT";
          break;
        case 7:
          id v20 = @"SCROLL_UP";
          break;
        case 8:
          id v20 = @"SCROLL_DOWN";
          break;
        case 9:
        case 23:
        case 24:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 501:
        case 502:
        case 503:
        case 504:
        case 505:
        case 506:
        case 507:
        case 508:
        case 509:
        case 510:
        case 511:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 601:
        case 602:
        case 603:
        case 604:
        case 605:
        case 606:
        case 607:
        case 608:
        case 609:
        case 610:
        case 611:
        case 612:
        case 613:
        case 614:
        case 615:
        case 616:
        case 617:
        case 618:
        case 619:
        case 620:
        case 621:
        case 622:
        case 623:
        case 624:
        case 625:
        case 626:
        case 627:
        case 628:
        case 629:
        case 630:
        case 631:
        case 632:
        case 633:
        case 634:
        case 635:
        case 636:
        case 637:
        case 638:
        case 639:
        case 640:
        case 641:
        case 642:
        case 643:
        case 644:
        case 645:
        case 646:
        case 647:
        case 648:
        case 649:
        case 650:
        case 651:
        case 652:
        case 653:
        case 654:
        case 655:
        case 656:
        case 657:
        case 658:
        case 659:
        case 660:
        case 661:
        case 662:
        case 663:
        case 664:
        case 665:
        case 666:
        case 667:
        case 668:
        case 669:
        case 670:
        case 671:
        case 672:
        case 673:
        case 674:
        case 675:
        case 676:
        case 677:
        case 678:
        case 679:
        case 680:
        case 681:
        case 682:
        case 683:
        case 684:
        case 685:
        case 686:
        case 687:
        case 688:
        case 689:
        case 690:
        case 691:
        case 692:
        case 693:
        case 694:
        case 695:
        case 696:
        case 697:
        case 698:
        case 699:
        case 700:
        case 701:
        case 702:
        case 703:
        case 704:
        case 705:
        case 706:
        case 707:
        case 708:
        case 709:
        case 710:
        case 711:
        case 712:
        case 713:
        case 714:
        case 715:
        case 716:
        case 717:
        case 718:
        case 719:
        case 720:
        case 721:
        case 722:
        case 723:
        case 724:
        case 725:
        case 726:
        case 727:
        case 728:
        case 729:
        case 730:
        case 731:
        case 732:
        case 733:
        case 734:
        case 735:
        case 736:
        case 737:
        case 738:
        case 739:
        case 740:
        case 741:
        case 742:
        case 743:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
        case 801:
        case 802:
        case 803:
        case 804:
        case 805:
        case 806:
        case 807:
        case 808:
        case 809:
        case 810:
        case 811:
        case 812:
        case 813:
        case 814:
        case 815:
        case 816:
        case 817:
        case 818:
        case 819:
        case 820:
        case 821:
        case 822:
        case 823:
        case 824:
        case 825:
        case 826:
        case 827:
        case 828:
        case 829:
        case 830:
        case 831:
        case 832:
        case 833:
        case 834:
        case 835:
        case 836:
        case 837:
        case 838:
        case 839:
        case 840:
        case 841:
        case 842:
        case 843:
        case 844:
        case 845:
        case 846:
        case 847:
        case 848:
        case 849:
        case 850:
        case 851:
        case 852:
        case 853:
        case 854:
        case 855:
        case 856:
        case 857:
        case 858:
        case 859:
        case 860:
        case 861:
        case 862:
        case 863:
        case 864:
        case 865:
        case 866:
        case 867:
        case 868:
        case 869:
        case 870:
        case 871:
        case 872:
        case 873:
        case 874:
        case 875:
        case 876:
        case 877:
        case 878:
        case 879:
        case 880:
        case 881:
        case 882:
        case 883:
        case 884:
        case 885:
        case 886:
        case 887:
        case 888:
        case 889:
        case 890:
        case 891:
        case 892:
        case 893:
        case 894:
        case 895:
        case 896:
        case 897:
        case 898:
        case 899:
        case 900:
        case 901:
        case 902:
        case 903:
        case 904:
        case 905:
        case 906:
        case 907:
        case 908:
        case 909:
        case 910:
        case 911:
        case 912:
        case 913:
        case 914:
        case 915:
        case 916:
        case 917:
        case 918:
        case 919:
        case 920:
        case 921:
        case 922:
        case 923:
        case 924:
        case 925:
        case 926:
        case 927:
        case 928:
        case 929:
        case 930:
        case 931:
        case 932:
        case 933:
        case 934:
        case 935:
        case 936:
        case 937:
        case 938:
        case 939:
        case 940:
        case 941:
        case 942:
        case 943:
        case 944:
        case 945:
        case 946:
        case 947:
        case 948:
        case 949:
        case 950:
        case 951:
        case 952:
        case 953:
        case 954:
        case 955:
        case 956:
        case 957:
        case 958:
        case 959:
        case 960:
        case 961:
        case 962:
        case 963:
        case 964:
        case 965:
        case 966:
        case 967:
        case 968:
        case 969:
        case 970:
        case 971:
        case 972:
        case 973:
        case 974:
        case 975:
        case 976:
        case 977:
        case 978:
        case 979:
        case 980:
        case 981:
        case 982:
        case 983:
        case 984:
        case 985:
        case 986:
        case 987:
        case 988:
        case 989:
        case 990:
        case 991:
        case 992:
        case 993:
        case 994:
        case 995:
        case 996:
        case 997:
        case 998:
        case 999:
        case 1000:
        case 1005:
        case 1006:
        case 1007:
        case 1008:
        case 1009:
        case 1012:
        case 1013:
        case 1014:
        case 1015:
        case 1016:
        case 1019:
        case 1021:
        case 1022:
        case 1023:
        case 1024:
        case 1025:
        case 1026:
        case 1027:
        case 1028:
        case 1029:
          goto LABEL_47;
        case 10:
          id v20 = @"SHOW_MORE";
          break;
        case 11:
          id v20 = @"SHOW_LESS";
          break;
        case 12:
          id v20 = @"SWIPE_LEFT";
          break;
        case 13:
          id v20 = @"SWIPE_RIGHT";
          break;
        case 14:
          id v20 = @"MINIMIZE";
          break;
        case 15:
          id v20 = @"TAP_PREV";
          break;
        case 16:
          id v20 = @"TAP_NEXT";
          break;
        case 17:
          id v20 = @"SUBMIT";
          break;
        case 18:
          id v20 = @"CANCEL";
          break;
        case 19:
          id v20 = @"ENTER_MAPS";
          break;
        case 20:
          id v20 = @"EXIT_MAPS";
          break;
        case 21:
          id v20 = @"REVEAL";
          break;
        case 22:
          id v20 = @"OPEN_NEW_TAB";
          break;
        case 25:
          id v20 = @"BACK";
          break;
        case 26:
          id v20 = @"ACTIVATE";
          break;
        case 27:
          id v20 = @"DEACTIVATE";
          break;
        case 28:
          id v20 = @"AGREE";
          break;
        case 29:
          id v20 = @"DISAGREE";
          break;
        case 30:
          id v20 = @"SKIP_ANSWER";
          break;
        case 31:
          id v20 = @"EXPAND";
          break;
        case 32:
          id v20 = @"COLLAPSE";
          break;
        case 33:
          id v20 = @"ENTER";
          break;
        case 34:
          id v20 = @"EXIT";
          break;
        case 35:
          id v20 = @"SCROLL_UP_INDEX_BAR";
          break;
        case 36:
          id v20 = @"SCROLL_DOWN_INDEX_BAR";
          break;
        case 37:
          id v20 = @"TOGGLE_ON";
          break;
        case 38:
          id v20 = @"TOGGLE_OFF";
          break;
        case 39:
          id v20 = @"LONG_PRESS";
          break;
        case 40:
          id v20 = @"CLICK";
          break;
        case 41:
          id v20 = @"TAP_DONE";
          break;
        case 42:
          id v20 = @"TAP_CLOSE";
          break;
        case 43:
          id v20 = @"SCROLL_LEFT";
          break;
        case 44:
          id v20 = @"SCROLL_RIGHT";
          break;
        case 45:
          id v20 = @"DISPLAY";
          break;
        case 46:
          id v20 = @"OPEN_IN_APP";
          break;
        case 47:
          id v20 = @"CONCEAL";
          break;
        case 48:
          id v20 = @"TAP_DELETE";
          break;
        case 49:
          id v20 = @"TAP_FILTER";
          break;
        case 50:
          id v20 = @"TAP_SECONDARY_BUTTON";
          break;
        case 51:
          id v20 = @"TAP_WIDGET_FOOD";
          break;
        case 52:
          id v20 = @"TAP_WIDGET_GAS";
          break;
        case 53:
          id v20 = @"TAP_WIDGET_LOADING";
          break;
        case 54:
          id v20 = @"TAP_WIDGET_SEARCH";
          break;
        case 55:
          id v20 = @"TAP_WIDGET_STORES";
          break;
        case 56:
          id v20 = @"DISPLAY_ALLOW_ONCE_PROMPT";
          break;
        case 57:
          id v20 = @"SHARE_CURRENT_LOCATION";
          break;
        case 58:
          id v20 = @"SHARE_PHOTO";
          break;
        case 59:
          id v20 = @"TAP_KEEP_OFF";
          break;
        case 60:
          id v20 = @"TAP_PHOTO_CATEGORY";
          break;
        case 61:
          id v20 = @"TAP_PRECISE_LOCATION_OFF_BANNER";
          break;
        case 62:
          id v20 = @"TAP_TURN_ON";
          break;
        case 63:
          id v20 = @"DISPLAY_CYCLING_ANNOTATION";
          break;
        case 64:
          id v20 = @"DISPLAY_DRIVING_DEFAULT_OPTION";
          break;
        case 65:
          id v20 = @"DISPLAY_TRANSIT_DEFAULT_OPTION";
          break;
        case 66:
          id v20 = @"DISPLAY_WALKING_DEFAULT_OPTION";
          break;
        case 67:
          id v20 = @"TAP_CYCLING_ANNOTATION";
          break;
        case 68:
          id v20 = @"TAP_DRIVING_DEFAULT_OPTION";
          break;
        case 69:
          id v20 = @"TAP_TRANSIT_DEFAULT_OPTION";
          break;
        case 70:
          id v20 = @"TAP_WALKING_DEFAULT_OPTION";
          break;
        case 71:
          id v20 = @"DISPLAY_RIDESHARE_DEFAULT_OPTION";
          break;
        case 72:
          id v20 = @"TAP_RIDESHARE_DEFAULT_OPTION";
          break;
        case 73:
          id v20 = @"TAP_PERSONAL_COLLECTION";
          break;
        case 74:
          id v20 = @"RESUME_ROUTE";
          break;
        case 75:
          id v20 = @"DISPLAY_OUT_OF_RANGE_ALERT";
          break;
        case 76:
          id v20 = @"TAP_ALLOW_ONCE";
          break;
        case 77:
          id v20 = @"TAP_DO_NOT_ALLOW";
          break;
        case 78:
          id v20 = @"ADD_RECCOMENDED_FAVORITE";
          break;
        case 79:
          id v20 = @"ADD_RECOMMENDED_HOME_FAVORITE";
          break;
        case 80:
          id v20 = @"ADD_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 81:
          id v20 = @"ADD_RECOMMENDED_WORK_FAVORITE";
          break;
        case 82:
          id v20 = @"CREATE_RECCOMENDED_SCHOOL_FAVORITE";
          break;
        case 83:
          id v20 = @"CREATE_SCHOOL_FAVORITE";
          break;
        case 84:
          id v20 = @"TAP_SCHOOL_FAVORITE";
          break;
        case 85:
          id v20 = @"SELECT_ROUTING_TYPE_CYCLING";
          break;
        case 86:
          id v20 = @"REPORT_PHOTO";
          break;
        case 87:
          id v20 = @"TAP_LARGE_WIDGET_BROWSE_CATEGORY";
          break;
        case 88:
          id v20 = @"TAP_MEDIUM_WIDGET_BROWSE_CATEGORY";
          break;
        case 89:
          id v20 = @"TAP_SMALL_WIDGET_BROWSE_CATEGORY";
          break;
        case 90:
          id v20 = @"CREATE_RECOMMENDED_FAVORITE";
          break;
        case 91:
          id v20 = @"CREATE_RECOMMENDED_HOME_FAVORITE";
          break;
        case 92:
          id v20 = @"CREATE_RECOMMENDED_SCHOOL_FAVORITE";
          break;
        case 93:
          id v20 = @"CREATE_RECOMMENDED_WORK_FAVORITE";
          break;
        case 94:
          id v20 = @"TAP_SMALL_WIDGET_ITEM";
          break;
        case 95:
          id v20 = @"TAP_MEDIUM_WIDGET_ITEM";
          break;
        case 96:
          id v20 = @"TAP_LARGE_WIDGET_ITEM";
          break;
        case 97:
          id v20 = @"DISPLAY_ARP_TIPKIT";
          break;
        case 98:
          id v20 = @"NEXT";
          break;
        case 99:
          id v20 = @"TAP_RATE_AND_ADD_PHOTOS";
          break;
        case 100:
          id v20 = @"TAP_TO_ADD_POSITIVE_RATING";
          break;
        case 101:
          id v20 = @"TAP_TO_ADD_NEGATIVE_RATING";
          break;
        case 102:
          id v20 = @"TAP_ACTIVE_SHARING_NOTIFICATION";
          break;
        case 103:
          id v20 = @"INVOKE_SIRI_PROMPT";
          break;
        case 104:
          id v20 = @"ETA_SHARED_SUCCESSFULLY";
          break;
        case 105:
          id v20 = @"ENDED_ETA_SHARE_SUCCESSFULLY";
          break;
        case 106:
          id v20 = @"CLEAR_INCIDENT";
          break;
        case 107:
          id v20 = @"CONFIRM_INCIDENT";
          break;
        case 108:
          id v20 = @"DISMISS_INCIDENT";
          break;
        case 109:
          id v20 = @"INCIDENT_ALERT_TIMEOUT";
          break;
        case 110:
          id v20 = @"INCIDENT_ALERT_TRAY_SHOWN";
          break;
        case 111:
          id v20 = @"INCIDENT_CARD_SHOWN";
          break;
        case 112:
          id v20 = @"INCIDENT_REPORT_CONFIRMATION_TRAY_SHOWN";
          break;
        case 113:
          id v20 = @"INCIDENT_REPORT_TRAY_SHOWN";
          break;
        case 114:
          id v20 = @"NAV_TRAY_DISCOVERY_SHOWN";
          break;
        case 115:
          id v20 = @"TAP_TO_REPORT_INCIDENT";
          break;
        case 116:
          id v20 = @"TAP_SHORTCUT";
          break;
        case 117:
          id v20 = @"BLOCK_CONTACT";
          break;
        case 118:
          id v20 = @"TAP_TO_ADD_RATING";
          break;
        case 119:
          id v20 = @"AR_WALKING_LOCALIZATION_FAILED";
          break;
        case 120:
          id v20 = @"AR_WALKING_LOCALIZATION_FAILED_TO_INITIALIZE";
          break;
        case 121:
          id v20 = @"AR_WALKING_LOCALIZATION_SUCCESSFUL";
          break;
        case 122:
          id v20 = @"AR_WALKING_LOCALIZATION_USER_ABANDON";
          break;
        case 123:
          id v20 = @"ATTEMPT_AR_WALKING_LOCALIZATION";
          break;
        case 124:
          id v20 = @"RAISE_TO_ENTER_AR_WALKING";
          break;
        case 125:
          id v20 = @"TAP_DISMISS";
          break;
        case 126:
          id v20 = @"TAP_ENTER_AR_WALKING";
          break;
        case 127:
          id v20 = @"TAP_OK";
          break;
        case 128:
          id v20 = @"TAP_TRY_AGAIN";
          break;
        case 129:
          id v20 = @"TAP_TURN_ON_IN_SETTINGS";
          break;
        case 130:
          id v20 = @"VLF_CORRECTION_FAILED_TO_INITIALIZE";
          break;
        case 131:
          id v20 = @"VLF_CORRECTION_USER_ABANDON";
          break;
        case 132:
          id v20 = @"AREA_EVENTS_ALERT";
          break;
        case 133:
          id v20 = @"TAP_SHOW_EVENTS_ADVISORY_DETAILS";
          break;
        case 134:
          id v20 = @"ACCEPT_EVENT_REROUTE";
          break;
        case 135:
          id v20 = @"DISPLAY_AREA_EVENTS_ADVISORY";
          break;
        case 136:
          id v20 = @"DISMISS_EVENT_REROUTE";
          break;
        case 137:
          id v20 = @"PUNCH_OUT_EVENTS_LINK";
          break;
        case 138:
          id v20 = @"SELECT_VOICE_GUIDANCE_ALERTS_ONLY";
          break;
        case 139:
          id v20 = @"ADJUST_GUIDANCE_SETTINGS";
          break;
        case 140:
          id v20 = @"HIDE_DETAILS";
          break;
        case 141:
          id v20 = @"SELECT_VOICE_GUIDANCE_ON";
          break;
        case 142:
          id v20 = @"SELECT_VOICE_GUIDANCE_OFF";
          break;
        case 143:
          id v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_INCREASE";
          break;
        case 144:
          id v20 = @"TAP_TEXT_LABEL";
          break;
        case 145:
          id v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_WALKING";
          break;
        case 146:
          id v20 = @"TAP_EXIT";
          break;
        case 147:
          id v20 = @"TAP_CITY_MENU";
          break;
        case 148:
          id v20 = @"CHECK_AVOID_TOLLS";
          break;
        case 149:
          id v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_TRANSIT";
          break;
        case 150:
          id v20 = @"TAP_ICLOUD";
          break;
        case 151:
          id v20 = @"CHECK_AVOID_HIGHWAYS";
          break;
        case 152:
          id v20 = @"TAP_FAVORITES";
          break;
        case 153:
          id v20 = @"SELECT_DISTANCE_IN_KM";
          break;
        case 154:
          id v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_DECREASE";
          break;
        case 155:
          id v20 = @"OPEN_FULL_CARD_FILTER";
          break;
        case 156:
          id v20 = @"SCROLL_TEMPORAL_COLLECTION_BACKWARD";
          break;
        case 157:
          id v20 = @"OPEN_SINGLE_CARD_FILTER";
          break;
        case 158:
          id v20 = @"SELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 159:
          id v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MIN_DECREASE";
          break;
        case 160:
          id v20 = @"SESSIONLESS_REVEAL";
          break;
        case 161:
          id v20 = @"SCROLL_CITY_CURATED_COLLECTION_BACKWARD";
          break;
        case 162:
          id v20 = @"SCROLL_TEMPORAL_COLLECTION_FORWARD";
          break;
        case 163:
          id v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_CYCLING";
          break;
        case 164:
          id v20 = @"ENTER_RAP_REPORT_MENU";
          break;
        case 165:
          id v20 = @"SELECT_PREFERRED_TRAVEL_TYPE_DRIVING";
          break;
        case 166:
          id v20 = @"TAP_MY_VEHICLES";
          break;
        case 167:
          id v20 = @"SUBMIT_SINGLE_CARD_FILTER";
          break;
        case 168:
          id v20 = @"SUBMIT_FULL_CARD_FILTER";
          break;
        case 169:
          id v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MIN_INCREASE";
          break;
        case 170:
          id v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_DECREASE";
          break;
        case 171:
          id v20 = @"TAP_EXPLORE_CURATED_COLELCTIONS";
          break;
        case 172:
          id v20 = @"TAP_ACCOUNT";
          break;
        case 173:
          id v20 = @"TAP_WORLDWIDE_CURATED_COLLECTIONS";
          break;
        case 174:
          id v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_DECREASE";
          break;
        case 175:
          id v20 = @"TAP_RECENTLY_VIEWED_CURATED_COLLECTION";
          break;
        case 176:
          id v20 = @"RESULT_REFINEMENT_TOGGLE_OFF";
          break;
        case 177:
          id v20 = @"TAP_CITY_CURATED_COLLECTIONS";
          break;
        case 178:
          id v20 = @"TAP_REPORTS";
          break;
        case 179:
          id v20 = @"TAP_RATINGS";
          break;
        case 180:
          id v20 = @"TAP_EXPLORE_CURATED_COLLECTIONS";
          break;
        case 181:
          id v20 = @"TAP_OPEN_SPOTLIGHT_CURATED_COLLECTION";
          break;
        case 182:
          id v20 = @"RESULT_REFINEMENT_DISCRETE_RANGE_MAX_INCREASE";
          break;
        case 183:
          id v20 = @"SELECT_DISTANCE_IN_MILES";
          break;
        case 184:
          id v20 = @"TAP_PRIVACY_STATEMENT";
          break;
        case 185:
          id v20 = @"TAP_MAPS_SETTINGS";
          break;
        case 186:
          id v20 = @"CANCEL_FULL_CARD_FILTER";
          break;
        case 187:
          id v20 = @"TAP_LATEST_CURATED_COLLECTION";
          break;
        case 188:
          id v20 = @"TAP_TEMPORAL_CURATED_COLLECTION";
          break;
        case 189:
          id v20 = @"UNCHECK_AVOID_TOLLS";
          break;
        case 190:
          id v20 = @"UNSELECT_SEARCH_REFINEMENT";
          break;
        case 191:
          id v20 = @"TAP_RATING";
          break;
        case 192:
          id v20 = @"TAP_ICLOUD_SIGN_IN";
          break;
        case 193:
          id v20 = @"RESULT_REFINEMENT_CONTINUOUS_RANGE_MAX_INCREASE";
          break;
        case 194:
          id v20 = @"TAP_POI_HIGHLIGHTED_AUXILIARY";
          break;
        case 195:
          id v20 = @"UNCHECK_AVOID_HIGHWAYS";
          break;
        case 196:
          id v20 = @"SCROLL_CITY_CURATED_COLLECTION_FORWARD";
          break;
        case 197:
          id v20 = @"RESULT_REFINEMENT_TOGGLE_ON";
          break;
        case 198:
          id v20 = @"TAP_CONTEXT_LINE_HYPERLINK";
          break;
        case 199:
          id v20 = @"TAP_MY_GUIDES";
          break;
        case 200:
          id v20 = @"SELECT_SEARCH_REFINEMENT";
          break;
        case 201:
          id v20 = @"SESSIONLESS_TAP_ACCOUNT";
          break;
        case 202:
          id v20 = @"UNSELECT_RESULT_REFINEMENT_MULTI_SELECT";
          break;
        case 203:
          id v20 = @"TAP_TRAVEL_PREFERENCES";
          break;
        case 204:
          id v20 = @"SHOW_CURATED_COLLECTION_LIST";
          break;
        case 205:
          id v20 = @"CANCEL_SINGLE_CARD_FILTER";
          break;
        case 206:
          id v20 = @"DISPLAY_HFP_OPTION";
          break;
        case 207:
          id v20 = @"SWITCH_OFF_HFP";
          break;
        case 208:
          id v20 = @"SWITCH_ON_HFP";
          break;
        case 209:
          id v20 = @"TAP_QUICK_ACTION_TRAY";
          break;
        case 210:
          id v20 = @"SHOW_ALL_CITIES";
          break;
        case 211:
          id v20 = @"TAP_ADD_NEARBY_TRANSIT";
          break;
        case 212:
          id v20 = @"RESUME";
          break;
        case 213:
          id v20 = @"DISPLAY_TIPKIT_PROMPT";
          break;
        case 214:
          id v20 = @"TAP_NEARBY_TRANSIT_FAVORITE";
          break;
        case 215:
          id v20 = @"TAP_DRIVING_MODE";
          break;
        case 216:
          id v20 = @"SWITCH_ON_VOICE_GUIDANCE";
          break;
        case 217:
          id v20 = @"DISMISS_TIPKIT_PROMPT";
          break;
        case 218:
          id v20 = @"TAP_EXPAND_EXIT_DETAILS";
          break;
        case 219:
          id v20 = @"TAP_NEARBY_TRANSIT_FILTER";
          break;
        case 220:
          id v20 = @"TAP_MORE_DEPARTURES";
          break;
        case 221:
          id v20 = @"RAP_INDIVIDUAL_PLACE";
          break;
        case 222:
          id v20 = @"RAP_ADD_MAP";
          break;
        case 223:
          id v20 = @"TAP_SUGGESTED_RAP";
          break;
        case 224:
          id v20 = @"RAP_STREET_ISSUE";
          break;
        case 225:
          id v20 = @"SWIPE_PIN_REVEAL";
          break;
        case 226:
          id v20 = @"TAP_ADD_TIPKIT_FAVORITE";
          break;
        case 227:
          id v20 = @"SCROLL_VEHICLE_INFORMATION_BACKWARD";
          break;
        case 228:
          id v20 = @"RAP_BAD_TRIP";
          break;
        case 229:
          id v20 = @"RAP_PLACE_ISSUE";
          break;
        case 230:
          id v20 = @"TAP_OPEN_MAPS";
          break;
        case 231:
          id v20 = @"TAP_NEARBY_TRANSIT_RESULT";
          break;
        case 232:
          id v20 = @"RAP_GUIDE";
          break;
        case 233:
          id v20 = @"SWITCH_OFF_VOICE_GUIDANCE";
          break;
        case 234:
          id v20 = @"DISPLAY_TRIP_FEEDBACK_MESSAGE";
          break;
        case 235:
          id v20 = @"SELECT_TRANSIT_STEP";
          break;
        case 236:
          id v20 = @"SCROLL_VEHICLE_INFORMATION_FORWARD";
          break;
        case 237:
          id v20 = @"TAP_SEE_MORE";
          break;
        case 238:
          id v20 = @"RAP_IN_REVIEW";
          break;
        case 239:
          id v20 = @"TAP_OPEN_MENU";
          break;
        case 240:
          id v20 = @"TAP_NEARBY_TRANSIT";
          break;
        case 241:
          id v20 = @"TAP_PIN_LINE";
          break;
        case 242:
          id v20 = @"SWITCH_OFF_TRIP_FEEDBACK";
          break;
        case 243:
          id v20 = @"RAP_GOOD_TRIP";
          break;
        case 244:
          id v20 = @"TAP_FILTERED_CURATED_COLLECTION";
          break;
        case 245:
          id v20 = @"SHARE_MY_LOCATION";
          break;
        case 246:
          id v20 = @"ADD_RECOMMENDATION_TO_MAPS_WITH_SESSION";
          break;
        case 247:
          id v20 = @"DISPLAY_GENERIC_ADVISORY";
          break;
        case 248:
          id v20 = @"ADVISORY_ALERT";
          break;
        case 249:
          id v20 = @"PUNCH_OUT_LINK";
          break;
        case 250:
          id v20 = @"TAP_GENERIC_ADVISORY";
          break;
        case 251:
          id v20 = @"TAP_EXPLORE_MODE";
          break;
        case 252:
          id v20 = @"TAP_UNPIN_LINE";
          break;
        case 253:
          id v20 = @"MENU_UNPIN";
          break;
        case 254:
          id v20 = @"MENU_PIN";
          break;
        case 255:
          id v20 = @"SWIPE_PIN";
          break;
        case 256:
          id v20 = @"SWIPE_UNPIN";
          break;
        case 257:
          id v20 = @"TAP_MEDIA_APP";
          break;
        case 258:
          id v20 = @"TAP_GUIDES_SUBACTION";
          break;
        case 259:
          id v20 = @"TAP_MEDIA";
          break;
        case 260:
          id v20 = @"PUNCH_OUT_MEDIA";
          break;
        case 261:
          id v20 = @"SHOW_MEDIA_APP_MENU";
          break;
        case 262:
          id v20 = @"SCROLL_RIGHT_RIBBON";
          break;
        case 263:
          id v20 = @"SCROLL_LEFT_RIBBON";
          break;
        case 264:
          id v20 = @"TAP_GOOD_TO_KNOW_MORE_BUTTON";
          break;
        case 265:
          id v20 = @"TAP_SHOW_MORE_TEXT";
          break;
        case 266:
          id v20 = @"SCROLL_LEFT_RATINGS";
          break;
        case 267:
          id v20 = @"SCROLL_LEFT_TEMPLATE_PLACE";
          break;
        case 268:
          id v20 = @"SCROLL_RIGHT_TEMPLATE_PLACE";
          break;
        case 269:
          id v20 = @"SCROLL_RIGHT_RATINGS";
          break;
        case 270:
          id v20 = @"TAP_ALLOW";
          break;
        case 271:
          id v20 = @"TAP_GO_TO_SETTING";
          break;
        case 272:
          id v20 = @"START_SUBMIT_REPORT";
          break;
        case 273:
          id v20 = @"AUTHENTICATION_INFO_FAILURE";
          break;
        case 274:
          id v20 = @"SUCCESSFULLY_SUBMIT_REPORT";
          break;
        case 275:
          id v20 = @"FAILED_SUBMIT_REPORT";
          break;
        case 276:
          id v20 = @"AUTHENTICATION_INFO_SUCCESS";
          break;
        case 277:
          id v20 = @"EDIT_WAYPOINT";
          break;
        case 278:
          id v20 = @"CLEAR_TEXT";
          break;
        case 279:
          id v20 = @"REORDER_WAYPOINT";
          break;
        case 280:
          id v20 = @"REMOVE_WAYPOINT";
          break;
        case 281:
          id v20 = @"TAP_SECONDARY_MULTI_VENDORS_SELECTION";
          break;
        case 282:
          id v20 = @"TAP_SHOWCASE_MENU";
          break;
        case 283:
          id v20 = @"TAP_SHORTCUT_MULTI_VENDORS_SELECTION";
          break;
        case 284:
          id v20 = @"TAP_PHOTO_ALBUM";
          break;
        case 285:
          id v20 = @"RESEARVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 286:
          id v20 = @"RAP_INLINE_ADD";
          break;
        case 287:
          id v20 = @"RAP_TAP_EDIT";
          break;
        case 288:
          id v20 = @"CLAIM_BUSINESS";
          break;
        case 289:
          id v20 = @"RAP_EDIT_OPTIONS";
          break;
        case 290:
          id v20 = @"TAP_IN_REVIEW_RAP";
          break;
        case 291:
          id v20 = @"ORB_MENU_ADD_STOP";
          break;
        case 292:
          id v20 = @"NEXT_STOP";
          break;
        case 293:
          id v20 = @"ARRIVE_AT_WAYPOINT";
          break;
        case 294:
          id v20 = @"REMOVE_STOP";
          break;
        case 295:
          id v20 = @"DISPLAY_PAUSE_BUTTON";
          break;
        case 296:
          id v20 = @"DISPLAY_PAUSE_NEXT_BUTTONS";
          break;
        case 297:
          id v20 = @"AUTO_ADVANCE_NEXT_STOP";
          break;
        case 298:
          id v20 = @"ADD_INLINE_NEGATIVE_RATING";
          break;
        case 299:
          id v20 = @"ADD_INLINE_POSITIVE_RATING";
          break;
        case 300:
          id v20 = @"TAP_TO_ADD_RATING_AND_PHOTO";
          break;
        case 301:
          id v20 = @"SUBMIT_RATINGS_AND_PHOTOS";
          break;
        case 302:
          id v20 = @"TAP_RECENTLY_VIEWED_MULTIPOINT_ROUTE";
          break;
        case 303:
          id v20 = @"TAP_RECENTLY_VIEWED_ROUTE";
          break;
        case 304:
          id v20 = @"SHOW_ALL_RECENTS";
          break;
        case 305:
          id v20 = @"RESUME_MULTIPOINT_ROUTE";
          break;
        case 306:
          id v20 = @"DISMISS_TRANSIT_TIPKIT";
          break;
        case 307:
          id v20 = @"DISPLAY_TRANSIT_TIPKIT";
          break;
        case 308:
          id v20 = @"TAP_TRANSIT_TIPKIT";
          break;
        case 309:
          id v20 = @"FILTER_EV";
          break;
        case 310:
          id v20 = @"FILTER_SURCHARGE";
          break;
        case 311:
          id v20 = @"FILTER_PREFER";
          break;
        case 312:
          id v20 = @"TAP_WALKING_ANNOTATION";
          break;
        case 313:
          id v20 = @"FILTER_AVOID";
          break;
        case 314:
          id v20 = @"FILTER_TRANSPORTATION_MODE";
          break;
        case 315:
          id v20 = @"FILTER_RECOMMENDED_ROUTES";
          break;
        case 316:
          id v20 = @"FILTER_IC_FARES";
          break;
        case 317:
          id v20 = @"FILTER_TRANSIT_CARD_FARES";
          break;
        case 318:
          id v20 = @"RESERVE_TABLE_MULTI_VENDORS_SELECTION";
          break;
        case 319:
          id v20 = @"TAP_NOTIFICATION_SETTINGS";
          break;
        case 320:
          id v20 = @"TAP_ENABLE_NOTIFICATION";
          break;
        case 321:
          id v20 = @"ARP_SUGGESTIONS_TURN_OFF";
          break;
        case 322:
          id v20 = @"ARP_SUGGESTIONS_TURN_ON";
          break;
        case 323:
          id v20 = @"DISMISS_ARP_SUGGESTION";
          break;
        case 324:
          id v20 = @"RATINGS_AND_PHOTOS_TURN_ON";
          break;
        case 325:
          id v20 = @"SCROLL_RIGHT_SUGGESTED_PHOTOS";
          break;
        case 326:
          id v20 = @"UNSELECT_SUGGESTED_PHOTOS";
          break;
        case 327:
          id v20 = @"SUGGESTED_PHOTOS_SHOWN";
          break;
        case 328:
          id v20 = @"DISMISS_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 329:
          id v20 = @"TAP_YOUR_PHOTOS_ALBUM";
          break;
        case 330:
          id v20 = @"RATINGS_AND_PHOTOS_TURN_OFF";
          break;
        case 331:
          id v20 = @"DELETE_PHOTO";
          break;
        case 332:
          id v20 = @"DISPLAY_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 333:
          id v20 = @"SCROLL_LEFT_SUGGESTED_PHOTOS";
          break;
        case 334:
          id v20 = @"TAP_PHOTOS_LIVE_NOTIFICATION";
          break;
        case 335:
          id v20 = @"DISPLAY_YOUR_PHOTOS_ALBUM";
          break;
        case 336:
          id v20 = @"SELECT_SUGGESTED_PHOTOS";
          break;
        case 337:
          id v20 = @"ADD_STOP";
          break;
        case 338:
          id v20 = @"SHOW_CREDIT_TURN_ON";
          break;
        case 339:
          id v20 = @"DISPLAY_ARP_SUGGESTION";
          break;
        case 340:
          id v20 = @"TAP_TO_ADD_PHOTO_CREDIT";
          break;
        case 341:
          id v20 = @"SHOW_CREDIT_TURN_OFF";
          break;
        case 342:
          id v20 = @"TAP_TO_EDIT_NICKNAME";
          break;
        case 343:
          id v20 = @"SUBMIT_RATINGS";
          break;
        case 344:
          id v20 = @"END_NAV_ON_WATCH";
          break;
        case 345:
          id v20 = @"FILTER_EBIKE";
          break;
        case 356:
          id v20 = @"ADD_STOP_SIRI";
          break;
        case 357:
          id v20 = @"TAP_REVIEWED_RAP";
          break;
        case 358:
          id v20 = @"TAP_OUTREACH_RAP";
          break;
        case 359:
          id v20 = @"DISPLAY_SUGGESTED_ITEM";
          break;
        case 360:
          id v20 = @"DISPLAY_HIKING_TIPKIT";
          break;
        case 361:
          id v20 = @"DISMISS_HIKING_TIPKIT";
          break;
        case 362:
          id v20 = @"TAP_HIKING_TIPKIT";
          break;
        case 363:
          id v20 = @"SCROLL_LEFT_TRAILS";
          break;
        case 364:
          id v20 = @"TAP_MORE_TRAILS";
          break;
        case 365:
          id v20 = @"TAP_RELATED_TRAIL";
          break;
        case 366:
          id v20 = @"DISPLAY_EXPIRED_SHOWCASE_ERROR";
          break;
        case 367:
          id v20 = @"SCROLL_RIGHT_TRAILS";
          break;
        case 368:
          id v20 = @"SELECT_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 369:
          id v20 = @"DISPLAY_DOWNLOAD_MAPS_ALERTS";
          break;
        case 370:
          id v20 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 371:
          id v20 = @"TAP_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 372:
          id v20 = @"SELECT_DOWNLOAD_OFFLINE_MAPS";
          break;
        case 373:
          id v20 = @"EXPIRED_MAPS_REMOVED";
          break;
        case 374:
          id v20 = @"UPDATE_ALL_DOWNLOAD_MAPS";
          break;
        case 375:
          id v20 = @"TAP_EXPIRED_MAPS";
          break;
        case 376:
          id v20 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 377:
          id v20 = @"MOVE_DOWNLOAD_MAPS";
          break;
        case 378:
          id v20 = @"SAVE_RENAME_DOWNLOAD_MAPS";
          break;
        case 379:
          id v20 = @"TAP_COMPLETE_DOWNLOAD_MAPS";
          break;
        case 380:
          id v20 = @"TAP_ENTER_OFFLINE_MAPS";
          break;
        case 381:
          id v20 = @"TAP_DOWNLOAD_MAPS";
          break;
        case 382:
          id v20 = @"TAP_DOWNLOAD_MAPS_CONTINUE";
          break;
        case 383:
          id v20 = @"DELETE_DOWNLOAD_MAPS";
          break;
        case 384:
          id v20 = @"SLIDE_CLEAR_EXPIRED_MAPS";
          break;
        case 385:
          id v20 = @"RENAME_DOWNLOAD_MAPS";
          break;
        case 386:
          id v20 = @"RESIZE_DOWNLOAD_MAPS";
          break;
        case 387:
          id v20 = @"DISPLAY_COMPLETE_DOWNLOAD_MAPS_SESSIONLESS";
          break;
        case 388:
          id v20 = @"RESTORE_EXPIRED_MAPS";
          break;
        case 389:
          id v20 = @"CLEAR_EXPIRED_MAPS";
          break;
        case 390:
          id v20 = @"TAP_USING_OFFLINE_BAR";
          break;
        case 391:
          id v20 = @"UPDATE_DOWNLOAD_MAPS";
          break;
        case 392:
          id v20 = @"DISPLAY_DOWNLOAD_MAPS_TIPKIT";
          break;
        case 393:
          id v20 = @"DISPLAY_DOWNLOAD_MAPS";
          break;
        case 394:
          id v20 = @"TAP_DOWNLOAD_MAPS_SIGNIFICANT_LOCATION";
          break;
        case 395:
          id v20 = @"DISPLAY_EXPIRED_MAPS";
          break;
        case 396:
          id v20 = @"COMPLETE_DOWNLOAD_OFFLINE_MAPS_SESSIONLESS";
          break;
        case 397:
          id v20 = @"DISPLAY_SUGGESTED_DOWNLOAD_MAPS";
          break;
        case 398:
          id v20 = @"SLIDE_RESTORE_EXPIRED_MAPS";
          break;
        case 399:
          id v20 = @"ETA_SHARE_TRAY_TIMEOUT";
          break;
        case 400:
          id v20 = @"START_ETA_SHARING";
          break;
        case 401:
          id v20 = @"PERSON_LOCATION_UPDATE";
          break;
        case 402:
          id v20 = @"STOP_ETA_SHARING";
          break;
        case 403:
          id v20 = @"PUNCH_OUT_TO_FINDMY";
          break;
        case 404:
          id v20 = @"TAP_PEOPLE_LOCATION";
          break;
        case 405:
          id v20 = @"TAP_TO_REQUEST_LOCATION";
          break;
        case 406:
          id v20 = @"ZOOM_OUT_CROWN";
          break;
        case 407:
          id v20 = @"TAP_RESIZE_DOWNLOAD_MAPS";
          break;
        case 408:
          id v20 = @"TAP_DELETE_DOWNLOAD_MAPS";
          break;
        case 409:
          id v20 = @"SELECT_LIST_VIEW";
          break;
        case 410:
          id v20 = @"SCROLL_RIGHT_TRAILHEADS";
          break;
        case 411:
          id v20 = @"SWITCH_TO_ONLINE_MODE";
          break;
        case 412:
          id v20 = @"TAP_RELATED_TRAILHEAD";
          break;
        case 413:
          id v20 = @"SELECT_ELEVATION_VIEW";
          break;
        case 414:
          id v20 = @"TOGGLE_PROXIMITY_RADIUS_ON";
          break;
        case 415:
          id v20 = @"SEE_MORE_RECENTS";
          break;
        case 416:
          id v20 = @"SEE_MORE_GUIDES";
          break;
        case 417:
          id v20 = @"SELECT_CONTROLS";
          break;
        case 418:
          id v20 = @"NO_SEARCH_RESULTS";
          break;
        case 419:
          id v20 = @"TAP_VIEW_RESULTS_CAROUSEL";
          break;
        case 420:
          id v20 = @"TAP_VIEW_RESULTS_LIST";
          break;
        case 421:
          id v20 = @"SELECT_MAP_VIEW";
          break;
        case 422:
          id v20 = @"SCROLL_LEFT_TRAILHEADS";
          break;
        case 423:
          id v20 = @"SWITCH_TO_OFFLINE_MODE";
          break;
        case 424:
          id v20 = @"ZOOM_IN_CROWN";
          break;
        case 425:
          id v20 = @"TOGGLE_PROXIMITY_RADIUS_OFF";
          break;
        case 426:
          id v20 = @"TAP_MAP";
          break;
        case 427:
          id v20 = @"SWIPE_DOWN";
          break;
        case 428:
          id v20 = @"TAP_MORE_TRAILHEADS";
          break;
        case 429:
          id v20 = @"TAP_ROUTE_OPTIONS";
          break;
        case 430:
          id v20 = @"TAP_ROUTE_NAV_MAP";
          break;
        case 431:
          id v20 = @"TAP_ROUTE_OVERVIEW_MAP";
          break;
        case 432:
          id v20 = @"TAP_AUDIO";
          break;
        case 433:
          id v20 = @"TAP_OPEN_PLACECARD";
          break;
        case 434:
          id v20 = @"TAP_VIEW_STOPS";
          break;
        case 435:
          id v20 = @"TAP_ROUTE_DETAILS";
          break;
        case 436:
          id v20 = @"ADD_LPR_VEHICLE";
          break;
        case 437:
          id v20 = @"TAP_ADD_VEHICLE";
          break;
        case 438:
          id v20 = @"TAP_PLUG_TYPE";
          break;
        case 439:
          id v20 = @"UNSELECT_SUGGESTED_NETWORK";
          break;
        case 440:
          id v20 = @"TAP_SET_UP_LATER";
          break;
        case 441:
          id v20 = @"ADD_EV_VEHICLE";
          break;
        case 442:
          id v20 = @"UPDATE_COLOR";
          break;
        case 443:
          id v20 = @"SELECT_OTHER_NETWORK";
          break;
        case 444:
          id v20 = @"UNSELECT_NETWORK";
          break;
        case 445:
          id v20 = @"TAP_BACK";
          break;
        case 446:
          id v20 = @"TAP_CANCEL";
          break;
        case 447:
          id v20 = @"UNSELECT_VEHICLE";
          break;
        case 448:
          id v20 = @"UNSELECT_OTHER_NETWORK";
          break;
        case 449:
          id v20 = @"DISPLAY_EV_TIPKIT";
          break;
        case 450:
          id v20 = @"SELECT_NETWORK";
          break;
        case 451:
          id v20 = @"TAP_EV_TIPKIT";
          break;
        case 452:
          id v20 = @"TAP_CHOOSE_NETWORKS";
          break;
        case 453:
          id v20 = @"TAP_ADD_NETWORK";
          break;
        case 454:
          id v20 = @"FILTER_NETWORK";
          break;
        case 455:
          id v20 = @"SELECT_SUGGESTED_NETWORK";
          break;
        case 456:
          id v20 = @"TRANSIT_TO_WALKING";
          break;
        case 457:
          id v20 = @"TRANSIT_TO_FINDMY";
          break;
        case 458:
          id v20 = @"TAP_AC_KEYBOARD";
          break;
        case 459:
          id v20 = @"REACH_PHOTO_STRIP_END";
          break;
        case 460:
          id v20 = @"SEARCH_HERE_REVEAL";
          break;
        case 461:
          id v20 = @"TAP_SEARCH_HERE";
          break;
        case 462:
          id v20 = @"TAP_RECENTLY_VIEWED_CURATED_HIKE";
          break;
        case 463:
          id v20 = @"SAVE";
          break;
        case 464:
          id v20 = @"TAP_MORE_CURATED_HIKES";
          break;
        case 465:
          id v20 = @"CREATE_CUSTOM_ROUTE";
          break;
        case 466:
          id v20 = @"TAP_TRY_NOW";
          break;
        case 467:
          id v20 = @"TAP_CURATED_HIKE";
          break;
        case 468:
          id v20 = @"TAP_RECENTLY_VIEWED_CUSTOM_ROUTE";
          break;
        case 469:
          id v20 = @"ADD_TO_LIBRARY";
          break;
        case 470:
          id v20 = @"START_HIKING";
          break;
        case 471:
          id v20 = @"EDIT_NOTE";
          break;
        case 472:
          id v20 = @"CREATE_NOTE";
          break;
        case 473:
          id v20 = @"DELETE_PIN";
          break;
        case 474:
          id v20 = @"ADD_ROUTE";
          break;
        case 475:
          id v20 = @"ADD_PIN";
          break;
        case 476:
          id v20 = @"REMOVE_FROM_COLLECTION";
          break;
        case 477:
          id v20 = @"REMOVE_FROM_LIBRARY";
          break;
        case 478:
          id v20 = @"TAP_ITEM";
          break;
        case 479:
          id v20 = @"DELETE_ROUTE";
          break;
        case 480:
          id v20 = @"TAP_ROUTE";
          break;
        case 481:
          id v20 = @"TAP_DOWNLOAD_WATCH_MAPS";
          break;
        case 482:
          id v20 = @"DISPLAY_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 483:
          id v20 = @"STOP_DOWNLOAD_ONTO_WATCH";
          break;
        case 484:
          id v20 = @"TAP_DOWNLOAD_ONTO_WATCH";
          break;
        case 485:
          id v20 = @"TAP_WATCH_NOT_ENOUGH_DOWNLOAD_TIPKIT";
          break;
        case 486:
          id v20 = @"TAP_DOWNLOAD_NOW_WATCH";
          break;
        case 487:
          id v20 = @"REVEAL_DETECTION_LIST";
          break;
        case 488:
          id v20 = @"TAP_RECOMMENDATION";
          break;
        case 489:
          id v20 = @"TAP_EXPAND";
          break;
        case 490:
          id v20 = @"EXPAND_DETECTION_LIST";
          break;
        case 1001:
          id v20 = @"PAN";
          break;
        case 1002:
          id v20 = @"ZOOM_IN";
          break;
        case 1003:
          id v20 = @"ZOOM_OUT";
          break;
        case 1004:
          id v20 = @"ROTATE";
          break;
        case 1010:
          id v20 = @"TAP_POI";
          break;
        case 1011:
          id v20 = @"TAP_POI_TRANSIT";
          break;
        case 1017:
          id v20 = @"TAP_POI_HIGHLIGHTED";
          break;
        case 1018:
          id v20 = @"TAP_POI_CLUSTERED";
          break;
        case 1020:
          id v20 = @"TAP_POI_DROPPED_PIN";
          break;
        case 1030:
          id v20 = @"DROP_PIN";
          break;
        case 1031:
          id v20 = @"TAP_INCIDENT";
          break;
        case 1032:
          id v20 = @"TAP_TRANSIT_LINE";
          break;
        case 1033:
          id v20 = @"TAP_POI_CALENDAR";
          break;
        case 1034:
          id v20 = @"TAP_POI_CURRENT_LOCATION";
          break;
        case 1035:
          id v20 = @"TAP_POI_TRANSIT_LINE";
          break;
        case 1036:
          id v20 = @"TAP_POI_LANDMARK";
          break;
        case 1037:
          id v20 = @"TAP_POI_FLYOVER";
          break;
        case 1038:
          id v20 = @"TAP_TO_HIDE_TRAY";
          break;
        case 1039:
          id v20 = @"TAP_TO_REVEAL_TRAY";
          break;
        case 1040:
          id v20 = @"TAP_COMPASS";
          break;
        case 1041:
          id v20 = @"PITCH_AWAY_FROM_GROUND";
          break;
        case 1042:
          id v20 = @"PITCH_CLOSER_TO_GROUND";
          break;
        case 1043:
          id v20 = @"ZOOM_IN_PINCH";
          break;
        case 1044:
          id v20 = @"ZOOM_OUT_PINCH";
          break;
        case 1045:
          id v20 = @"ZOOM_IN_DOUBLE_TAP";
          break;
        case 1046:
          id v20 = @"ZOOM_OUT_TWO_FINGER_TAP";
          break;
        case 1047:
          id v20 = @"ZOOM_IN_ONE_FINGER";
          break;
        case 1048:
          id v20 = @"ZOOM_OUT_ONE_FINGER";
          break;
        case 1049:
          id v20 = @"ZOOM_IN_BUTTON";
          break;
        case 1050:
          id v20 = @"ZOOM_OUT_BUTTON";
          break;
        case 1051:
          id v20 = @"TAP_TRAFFIC_CAMERA";
          break;
        case 1052:
          id v20 = @"DISPLAY_INDOOR_MAP_BUTTON";
          break;
        case 1053:
          id v20 = @"OPEN_INDOOR_MAP";
          break;
        case 1054:
          id v20 = @"DISPLAY_VENUE_BROWSE_BUTTON";
          break;
        case 1055:
          id v20 = @"TAP_VENUE_BROWSE_BUTTON";
          break;
        case 1056:
          id v20 = @"ENTER_VENUE_EXPERIENCE";
          break;
        case 1057:
          id v20 = @"EXIT_VENUE_EXPERIENCE";
          break;
        case 1058:
          id v20 = @"ZOOM_IN_SCENE_PINCH";
          break;
        case 1059:
          id v20 = @"ZOOM_OUT_SCENE_PINCH";
          break;
        case 1060:
          id v20 = @"ZOOM_RESET";
          break;
        case 1061:
          id v20 = @"TAP_SCENE_UNAVAILABLE_AREA";
          break;
        case 1062:
          id v20 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 1063:
          id v20 = @"TAP_SPEED_CAMERA";
          break;
        case 1064:
          id v20 = @"TAP_RED_LIGHT_CAMERA";
          break;
        case 1065:
          id v20 = @"TAP_GEO";
          break;
        default:
          switch((int)v15)
          {
            case 2001:
              id v20 = @"TAP_SEARCH_FIELD";
              break;
            case 2002:
              id v20 = @"CLEAR_SEARCH";
              break;
            case 2003:
              id v20 = @"CANCEL_SEARCH";
              break;
            case 2004:
              id v20 = @"TAP_BROWSE_TOP_CATEGORY";
              break;
            case 2005:
              id v20 = @"TAP_BROWSE_SUB_CATEGORY";
              break;
            case 2006:
              id v20 = @"TAP_BACK_TO_BROWSE_TOP_CATEGORY";
              break;
            case 2007:
              id v20 = @"TAP_LIST_ITEM";
              break;
            case 2008:
              id v20 = @"SHARE_LIST_ITEM";
              break;
            case 2009:
              id v20 = @"DELETE_LIST_ITEM";
              break;
            case 2010:
              id v20 = @"EDIT_LIST_ITEM";
              break;
            case 2011:
              id v20 = @"REFRESH_SEARCH";
              break;
            case 2012:
              id v20 = @"REVEAL_LIST_ITEM_ACTIONS";
              break;
            case 2013:
              id v20 = @"HIDE_LIST_ITEM_ACTIONS";
              break;
            case 2014:
              id v20 = @"TAP_SEARCH_BUTTON";
              break;
            case 2015:
              id v20 = @"SHOW_SEARCH_RESULTS";
              break;
            case 2016:
              id v20 = @"SHOW_REFRESH_SEARCH";
              break;
            case 2017:
              id v20 = @"PASTE_TEXT";
              break;
            case 2018:
              id v20 = @"TAP_LIST_SUB_ITEM";
              break;
            case 2019:
              id v20 = @"DISPLAY_DID_YOU_MEAN_MESSAGE";
              break;
            case 2020:
              id v20 = @"TAP_DID_YOU_MEAN_MESSAGE";
              break;
            case 2021:
              id v20 = @"CLOSE_DID_YOU_MEAN_MESSAGE";
              break;
            case 2022:
              id v20 = @"SCROLL_LEFT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2023:
              id v20 = @"SCROLL_RIGHT_DID_YOU_MEAN_MESSAGE";
              break;
            case 2024:
              id v20 = @"RETAINED_QUERY";
              break;
            case 2025:
              id v20 = @"TAP_RECENT_AC_SUGGESTION";
              break;
            case 2026:
              id v20 = @"CLEAR_RECENT_AC_SUGGESTION";
              break;
            case 2027:
              id v20 = @"DELETE_RECENT_AC_SUGGESTION";
              break;
            case 2028:
            case 2029:
              goto LABEL_47;
            case 2030:
              id v20 = @"TAP_BROWSE_NEARBY_CATEGORY";
              break;
            case 2031:
              id v20 = @"TAP_SUBACTION";
              break;
            case 2032:
              id v20 = @"TAP_QUERY_BUILDING_ARROW";
              break;
            case 2033:
              id v20 = @"CLICK_ON_EDIT_SEARCH";
              break;
            case 2034:
              id v20 = @"REMOVE_CLIENT_AC_SUGGESTION";
              break;
            case 2035:
              id v20 = @"SHARE_CLIENT_AC_SUGGESTION";
              break;
            case 2036:
              id v20 = @"TAP_ON_MORE_RESULTS";
              break;
            case 2037:
              id v20 = @"SHARE_ITEM";
              break;
            case 2038:
              id v20 = @"HIDE_ITEM";
              break;
            case 2039:
              id v20 = @"TAP_SUGGESTED_ITEM";
              break;
            case 2040:
              id v20 = @"SHARE_SUGGESTED_ITEM";
              break;
            case 2041:
              id v20 = @"HIDE_SUGGESTED_ITEM";
              break;
            case 2042:
              id v20 = @"ADD_HOME_FAVORITE";
              break;
            case 2043:
              id v20 = @"ADD_WORK_FAVORITE";
              break;
            case 2044:
              id v20 = @"ADD_FAVORITE";
              break;
            case 2045:
              id v20 = @"VIEW_FAVORITES_LIST";
              break;
            case 2046:
              id v20 = @"TAP_HOME_FAVORITE";
              break;
            case 2047:
              id v20 = @"TAP_WORK_FAVORITE";
              break;
            case 2048:
              id v20 = @"TAP_CAR_FAVORITE";
              break;
            case 2049:
              id v20 = @"TAP_FAVORITE_ITEM";
              break;
            case 2050:
              id v20 = @"CREATE_HOME_FAVORITE";
              break;
            case 2051:
              id v20 = @"CREATE_WORK_FAVORITE";
              break;
            case 2052:
              id v20 = @"CREATE_FAVORITE";
              break;
            case 2053:
              id v20 = @"SUBMIT_FAVORITE_EDIT";
              break;
            case 2054:
              id v20 = @"ADD_RECOMMENDED_FAVORITE";
              break;
            case 2055:
              id v20 = @"EDIT_FAVORITE";
              break;
            case 2056:
              id v20 = @"REMOVE_FAVORITE";
              break;
            case 2057:
              id v20 = @"SHARE_FAVORITE";
              break;
            case 2058:
              id v20 = @"EDIT_FAVORITES";
              break;
            case 2059:
              id v20 = @"ADD_FAVORITE_PLACE";
              break;
            case 2060:
              id v20 = @"REMOVE_FAVORITE_PLACE";
              break;
            case 2061:
              id v20 = @"CHANGE_HOME_ADDRESS";
              break;
            case 2062:
              id v20 = @"CHANGE_WORK_ADDRESS";
              break;
            case 2063:
              id v20 = @"REFINE_LOCATION";
              break;
            case 2064:
              id v20 = @"TAP_RECENTLY_VIEWED_ITEM";
              break;
            case 2065:
              id v20 = @"SHOW_COLLECTION_LIST";
              break;
            case 2066:
              id v20 = @"SHOW_FAVORITES_COLLECTION";
              break;
            case 2067:
              id v20 = @"SHOW_COLLECTION";
              break;
            case 2068:
              id v20 = @"TAP_COLLECTION_ITEM";
              break;
            case 2069:
              id v20 = @"SHARE_COLLECTION_ITEM";
              break;
            case 2070:
              id v20 = @"REMOVE_COLLECTION_ITEM";
              break;
            case 2071:
              id v20 = @"SAVE_SHARED_COLLECTION";
              break;
            case 2072:
              id v20 = @"CREATE_NEW_COLLECTION";
              break;
            case 2073:
              id v20 = @"SAVE_TO_COLLECTION";
              break;
            case 2074:
              id v20 = @"EDIT_PHOTO";
              break;
            case 2075:
              id v20 = @"SORT_BY_NAME";
              break;
            case 2076:
              id v20 = @"SORT_BY_DISTANCE";
              break;
            case 2077:
              id v20 = @"SORT_BY_RECENT";
              break;
            case 2078:
              id v20 = @"AUTO_SHARE_ETA";
              break;
            case 2079:
              id v20 = @"CANCEL_AUTO_SHARE_ETA";
              break;
            case 2080:
              id v20 = @"MAP_SEARCH";
              break;
            case 2081:
              id v20 = @"DELETE_COLLECTION";
              break;
            case 2082:
              id v20 = @"SHARE_COLLECTION";
              break;
            case 2083:
              id v20 = @"SHOW_TRANSIT_LINES_COLLECTION";
              break;
            case 2084:
              id v20 = @"SHOW_MY_PLACES";
              break;
            case 2085:
              id v20 = @"SHOW_ALL_PLACES";
              break;
            case 2086:
              id v20 = @"TAP_RECENT_QUERY";
              break;
            case 2087:
              id v20 = @"TAP_QUERY_SUGGESTION";
              break;
            case 2088:
              id v20 = @"DELETE_CURATED_COLLECTION";
              break;
            case 2089:
              id v20 = @"FOLLOW";
              break;
            case 2090:
              id v20 = @"PUNCH_IN";
              break;
            case 2091:
              id v20 = @"SAVE_CURATED_COLLECTION";
              break;
            case 2092:
              id v20 = @"SCROLL_LEFT_COLLECTIONS";
              break;
            case 2093:
              id v20 = @"SCROLL_RIGHT_COLLECTIONS";
              break;
            case 2094:
              id v20 = @"SEE_ALL_CURATED_COLLECTION";
              break;
            case 2095:
              id v20 = @"SEE_ALL_PUBLISHERS";
              break;
            case 2096:
              id v20 = @"SHARE_CURATED_COLLECTION";
              break;
            case 2097:
              id v20 = @"SHARE_PUBLISHER";
              break;
            case 2098:
              id v20 = @"SHOW_MORE_COLLECTION";
              break;
            case 2099:
              id v20 = @"TAP_CURATED_COLLECTION";
              break;
            case 2100:
              id v20 = @"TAP_FEATURED_COLLECTIONS";
              break;
            case 2101:
              id v20 = @"TAP_LOCATION";
              break;
            case 2102:
              id v20 = @"TAP_PUBLISHER";
              break;
            case 2103:
              id v20 = @"TAP_PUBLISHER_APP";
              break;
            case 2104:
              id v20 = @"TAP_PUBLISHER_COLLECTIONS";
              break;
            case 2105:
              id v20 = @"UNFOLLOW";
              break;
            case 2106:
              id v20 = @"CHANGE_SCHOOL_ADDRESS";
              break;
            case 2107:
              id v20 = @"ADD_VEHICLE";
              break;
            case 2108:
              id v20 = @"DISPLAY_VIRTUAL_GARAGE";
              break;
            case 2109:
              id v20 = @"ENTER_VIRTUAL_GARAGE";
              break;
            case 2110:
              id v20 = @"PUNCH_OUT_MANUFACTURER_APP";
              break;
            case 2111:
              id v20 = @"REMOVE_LICENSE_PLATE";
              break;
            case 2112:
              id v20 = @"REMOVE_VEHICLE";
              break;
            case 2113:
              id v20 = @"SELECT_VEHICLE";
              break;
            case 2114:
              id v20 = @"SUBMIT_LICENSE_PLATE";
              break;
            case 2115:
              id v20 = @"TAP_ADD_LICENSE_PLATE";
              break;
            case 2116:
              id v20 = @"TAP_ADD_NEW_CAR";
              break;
            case 2117:
              id v20 = @"TAP_BANNER";
              break;
            case 2118:
              id v20 = @"TAP_CONNECT";
              break;
            case 2119:
              id v20 = @"TAP_CONTINUE";
              break;
            case 2120:
              id v20 = @"TAP_EDIT";
              break;
            case 2121:
              id v20 = @"TAP_NAME";
              break;
            case 2122:
              id v20 = @"TAP_NOT_NOW";
              break;
            case 2123:
              id v20 = @"TAP_OTHER_VEHICLE";
              break;
            case 2124:
              id v20 = @"TAP_REMOVE_LICENSE_PLATE";
              break;
            case 2125:
              id v20 = @"TAP_UPDATE_PLATE_NUMBER";
              break;
            case 2126:
              id v20 = @"TAP_VEHICLE";
              break;
            case 2127:
              id v20 = @"TAP_VEHICLE_NAME";
              break;
            case 2128:
              id v20 = @"UPDATE_NAME";
              break;
            case 2129:
              id v20 = @"DONE_TAKING_PHOTO";
              break;
            case 2130:
              id v20 = @"ENABLE_SHOW_PHOTO_NAME";
              break;
            case 2131:
              id v20 = @"SUBMIT_PHOTO";
              break;
            case 2132:
              id v20 = @"USE_PHOTO";
              break;
            case 2133:
              id v20 = @"ADD_RECOMMENDATION_TO_MAPS";
              break;
            case 2134:
              id v20 = @"CANCEL_PHOTO_SUBMISSION";
              break;
            case 2135:
              id v20 = @"CLOSE_RECOMMENDATION_CARD";
              break;
            case 2136:
              id v20 = @"EDIT_RATING";
              break;
            case 2137:
              id v20 = @"PROMPTED_TO_ADD_PHOTO";
              break;
            case 2138:
              id v20 = @"PROMPTED_TO_ADD_RATING";
              break;
            case 2139:
              id v20 = @"PROMPTED_TO_ADD_RECOMMENDATION_NOTIFICATION";
              break;
            case 2140:
              id v20 = @"PROMPTED_TO_ADD_RECOMMENDATION_SIRI";
              break;
            case 2141:
              id v20 = @"RETAKE_PHOTO";
              break;
            case 2142:
              id v20 = @"REVEAL_RECOMMENDATION_CARD";
              break;
            case 2143:
              id v20 = @"SUBMIT_NEGATIVE_RATING";
              break;
            case 2144:
              id v20 = @"SUBMIT_POSITIVE_RATING";
              break;
            case 2145:
              id v20 = @"TAP_CHOOSING_PHOTO";
              break;
            case 2146:
              id v20 = @"TAP_TAKE_NEW_PHOTO";
              break;
            case 2147:
              id v20 = @"TAP_TO_ADD_PHOTO";
              break;
            case 2148:
              id v20 = @"CANCEL_INCIDENT_REPORT";
              break;
            case 2149:
              id v20 = @"INCIDENT_REPORT_SUBMITTED";
              break;
            case 2150:
              id v20 = @"REPORTED_INCIDENT_NOT_RECEIVED";
              break;
            case 2151:
              id v20 = @"REPORTED_INCIDENT_RECEIVED";
              break;
            case 2152:
              id v20 = @"REPORT_INCIDENT";
              break;
            case 2153:
              id v20 = @"SELECT_INCIDENT_TYPE";
              break;
            case 2154:
              id v20 = @"SIRI_NOT_RESPOND_TO_REPORTED_INCIDENT";
              break;
            case 2155:
              id v20 = @"TAP_TO_START_REPORT_INCIDENT";
              break;
            case 2156:
              id v20 = @"ACTIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2157:
              id v20 = @"ATTEMPT_VLF_CORRECTION";
              break;
            case 2158:
              id v20 = @"DISMISS_VLF_PROMPT";
              break;
            case 2159:
              id v20 = @"PASSIVELY_DISPLAY_VLF_ENTRY_POINT";
              break;
            case 2160:
              id v20 = @"VLF_CORRECTION_FAILED";
              break;
            case 2161:
              id v20 = @"VLF_CORRECTION_SUCCESSFUL";
              break;
            case 2162:
              id v20 = @"ENABLE_WIDGET_SUGGESTIONS";
              break;
            case 2163:
              id v20 = @"DISPLAY_CZ_ADVISORY";
              break;
            case 2164:
              id v20 = @"PUNCH_OUT_URL_PAY";
              break;
            case 2165:
              id v20 = @"TAP_SHOW_CZ_ADVISORY_DETAILS";
              break;
            case 2166:
              id v20 = @"DELETE_ITEM";
              break;
            case 2167:
              id v20 = @"CANCEL_REMOVE";
              break;
            case 2168:
              id v20 = @"DELETE_SUGGESTION";
              break;
            case 2169:
              id v20 = @"ADD_SCHOOL_FAVORITE";
              break;
            case 2170:
              id v20 = @"GO_TO_WEBSITE";
              break;
            case 2171:
              id v20 = @"TRY_AGAIN";
              break;
            case 2172:
              id v20 = @"CHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2173:
              id v20 = @"CHECK_EBIKE";
              break;
            case 2174:
              id v20 = @"DISPLAY_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2175:
              id v20 = @"DISPLAY_CYCLING_DEFAULT_OPTION";
              break;
            case 2176:
              id v20 = @"DISPLAY_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2177:
              id v20 = @"DISPLAY_CYCLING_STAIRS_ADVISORY";
              break;
            case 2178:
              id v20 = @"DISPLAY_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2179:
              id v20 = @"TAP_AUTOMATIC_WORKOUT_OPTION";
              break;
            case 2180:
              id v20 = @"TAP_CYCLING_DEFAULT_OPTION";
              break;
            case 2181:
              id v20 = @"TAP_CYCLING_NO_BIKE_ADVISORY";
              break;
            case 2182:
              id v20 = @"TAP_CYCLING_STAIRS_ADVISORY";
              break;
            case 2183:
              id v20 = @"TAP_CYCLING_STEEP_CLIMB_ADVISORY";
              break;
            case 2184:
              id v20 = @"UNCHECK_AUTO_RECORD_WORKOUT";
              break;
            case 2185:
              id v20 = @"UNCHECK_EBIKE";
              break;
            case 2186:
              id v20 = @"DISPLAY_LICENSE_PLATE_SUGGESTION";
              break;
            case 2187:
              id v20 = @"DISPLAY_LPR_ADVISORY";
              break;
            case 2188:
              id v20 = @"TAP_SHOW_LPR_ADVISORY_DETAILS";
              break;
            case 2189:
              id v20 = @"CREATE_WIDGET";
              break;
            case 2190:
              id v20 = @"REVEAL_WIDGET_TRAY";
              break;
            case 2191:
              id v20 = @"LPR_ERROR_CODE";
              break;
            case 2192:
              id v20 = @"TAP_SEE_ALL_RECENTLY_VIEWED";
              break;
            case 2193:
              id v20 = @"TAP_CLEAR_RECENTLY_VIEWED";
              break;
            case 2194:
              id v20 = @"LPR_HARD_STOP";
              break;
            case 2195:
              id v20 = @"TAP_PUBLISHER_SUBACTION";
              break;
            case 2196:
              id v20 = @"CARPLAY_DISPLAY_ACTIVATED";
              break;
            case 2197:
              id v20 = @"CARPLAY_DISPLAY_DEACTIVATED";
              break;
            case 2198:
              id v20 = @"TAP_FEATURED_COLLECTION";
              break;
            case 2199:
              id v20 = @"SCROLL_FEATURED_COLLECTION_FORWARD";
              break;
            case 2200:
              id v20 = @"SCROLL_FEATURED_COLLECTION_BACKWARD";
              break;
            default:
              switch((int)v15)
              {
                case 3001:
                  id v20 = @"START_NAV";
                  break;
                case 3002:
                  id v20 = @"END_NAV";
                  break;
                case 3003:
                  id v20 = @"OPEN_NAV_AUDIO_SETTINGS";
                  break;
                case 3004:
                  id v20 = @"VIEW_DETAILS";
                  break;
                case 3005:
                  id v20 = @"TAP_SEARCH_ALONG_ROUTE_CATEGORY";
                  break;
                case 3006:
                  id v20 = @"OPEN_ROUTING_EDITOR";
                  break;
                case 3007:
                  id v20 = @"EDIT_ORIGIN";
                  break;
                case 3008:
                  id v20 = @"EDIT_DESTINATION";
                  break;
                case 3009:
                  id v20 = @"SWAP_ORIGIN_DESTINATION";
                  break;
                case 3010:
                  id v20 = @"OPEN_MORE_ROUTES";
                  break;
                case 3011:
                  id v20 = @"SELECT_ROUTING_TYPE_DRIVING";
                  break;
                case 3012:
                  id v20 = @"SELECT_ROUTING_TYPE_WALKING";
                  break;
                case 3013:
                  id v20 = @"SELECT_ROUTING_TYPE_TRANSIT";
                  break;
                case 3014:
                  id v20 = @"SELECT_ROUTING_TYPE_RIDESHARE";
                  break;
                case 3015:
                  id v20 = @"SELECT_ROUTE";
                  break;
                case 3016:
                  id v20 = @"COLLAPSE_STEP_DETAILS_WALK";
                  break;
                case 3017:
                  id v20 = @"EXPAND_STEP_DETAILS_WALK";
                  break;
                case 3018:
                  id v20 = @"COLLAPSE_STEP_DETAILS_TRANSIT";
                  break;
                case 3019:
                  id v20 = @"EXPAND_STEP_DETAILS_TRANSIT";
                  break;
                case 3020:
                  id v20 = @"UNCHECK_BUS";
                  break;
                case 3021:
                  id v20 = @"UNCHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3022:
                  id v20 = @"UNCHECK_COMMUTER_RAIL";
                  break;
                case 3023:
                  id v20 = @"UNCHECK_FERRY";
                  break;
                case 3024:
                  id v20 = @"CHECK_BUS";
                  break;
                case 3025:
                  id v20 = @"CHECK_SUBWAY_AND_LIGHT_RAIL";
                  break;
                case 3026:
                  id v20 = @"CHECK_COMMUTER_RAIL";
                  break;
                case 3027:
                  id v20 = @"CHECK_FERRY";
                  break;
                case 3028:
                  id v20 = @"SELECT_LEAVE_AT";
                  break;
                case 3029:
                  id v20 = @"SELECT_ARRIVE_BY";
                  break;
                case 3030:
                  id v20 = @"SELECT_LEAVE_NOW";
                  break;
                case 3031:
                  id v20 = @"SELECT_DATE_TIME";
                  break;
                case 3032:
                  id v20 = @"SWITCH_ON_IC_FARES";
                  break;
                case 3033:
                  id v20 = @"SWITCH_OFF_IC_FARES";
                  break;
                case 3034:
                  id v20 = @"OPEN_ROUTE_OPTIONS_DATETIME";
                  break;
                case 3035:
                  id v20 = @"OPEN_ROUTE_OPTIONS_TRANSIT";
                  break;
                case 3036:
                  id v20 = @"OPEN_ROUTE_OPTIONS_DRIVING";
                  break;
                case 3037:
                  id v20 = @"OPEN_TRANSIT_ROUTE_CLUSTER_SHEET";
                  break;
                case 3038:
                  id v20 = @"REVEAL_FROM_ROUTING";
                  break;
                case 3039:
                  id v20 = @"DISPLAY_ROUTES";
                  break;
                case 3040:
                  id v20 = @"CHECK_RECOMMENDED_ROUTES";
                  break;
                case 3041:
                  id v20 = @"UNCHECK_RECOMMENDED_ROUTES";
                  break;
                case 3042:
                  id v20 = @"CHECK_FASTER_TRIPS";
                  break;
                case 3043:
                  id v20 = @"UNCHECK_FASTER_TRIPS";
                  break;
                case 3044:
                  id v20 = @"CHECK_FEWER_TRANSFERS";
                  break;
                case 3045:
                  id v20 = @"UNCHECK_FEWER_TRANSFERS";
                  break;
                case 3046:
                  id v20 = @"CHECK_LESS_WALKING";
                  break;
                case 3047:
                  id v20 = @"UNCHECK_LESS_WALKING";
                  break;
                case 3048:
                  id v20 = @"OPEN_ROUTE_OPTIONS_CYCLING";
                  break;
                case 3049:
                  id v20 = @"TAP_MORE_ROUTES";
                  break;
                case 3050:
                  id v20 = @"OPEN_NAV_OVERVIEW";
                  break;
                case 3051:
                  id v20 = @"RESUME_NAV_MANEUVER_VIEW";
                  break;
                case 3052:
                  id v20 = @"SELECT_AUDIO_VOLUME_SILENT";
                  break;
                case 3053:
                  id v20 = @"SELECT_AUDIO_VOLUME_LOW";
                  break;
                case 3054:
                  id v20 = @"SELECT_AUDIO_VOLUME_NORMAL";
                  break;
                case 3055:
                  id v20 = @"SELECT_AUDIO_VOLUME_LOUD";
                  break;
                case 3056:
                  id v20 = @"SWITCH_ON_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3057:
                  id v20 = @"SWITCH_OFF_PAUSE_SPOKEN_AUDIO";
                  break;
                case 3058:
                  id v20 = @"RESUME_PREV_NAV";
                  break;
                case 3059:
                  id v20 = @"ACKNOWLEDGE_TRAFFIC_INCIDENT";
                  break;
                case 3060:
                  id v20 = @"ACCEPT_REROUTE";
                  break;
                case 3061:
                  id v20 = @"DISMISS_REROUTE";
                  break;
                case 3062:
                  id v20 = @"ATTEMPT_END_NAV";
                  break;
                case 3063:
                  id v20 = @"DISPLAY_BANNER";
                  break;
                case 3064:
                  id v20 = @"VIEW_BANNER_DETAILS";
                  break;
                case 3065:
                  id v20 = @"ENTER_GUIDANCE";
                  break;
                case 3066:
                  id v20 = @"AUTO_ADVANCE_GUIDANCE";
                  break;
                case 3067:
                  id v20 = @"TAP_OPEN_WALLET";
                  break;
                case 3068:
                  id v20 = @"SELECT_VOICE_GUIDANCE_ALL";
                  break;
                case 3069:
                  id v20 = @"SELECT_VOICE_GUIDANCE_INCIDENTS";
                  break;
                case 3070:
                  id v20 = @"SELECT_VOICE_GUIDANCE_NONE";
                  break;
                case 3071:
                  id v20 = @"DISPLAY_CARD";
                  break;
                case 3072:
                  id v20 = @"RENDER_ROUTE";
                  break;
                case 3073:
                  id v20 = @"DISPLAY_JUNCTION_VIEW";
                  break;
                case 3074:
                  id v20 = @"SELECT_DEPARTURE";
                  break;
                case 3075:
                  id v20 = @"DISPLAY_AR_VIEW_RAISE_BANNER";
                  break;
                case 3076:
                  id v20 = @"DEVICE_RAISE";
                  break;
                case 3077:
                  id v20 = @"ENTER_AR_NAV_VIEW";
                  break;
                case 3078:
                  id v20 = @"EXIT_AR_NAV_VIEW";
                  break;
                case 3079:
                  id v20 = @"AR_CALIBRATION_START";
                  break;
                case 3080:
                  id v20 = @"AR_CALIBRATION_FAILURE";
                  break;
                case 3081:
                  id v20 = @"AR_CALIBRATION_SUCCESS";
                  break;
                case 3082:
                  id v20 = @"DISPLAY_AR_NAV_ARROW";
                  break;
                case 3083:
                  id v20 = @"DISPLAY_AR_NAV_TURN_AROUND";
                  break;
                case 3084:
                  id v20 = @"DISPLAY_GO_OUTSIDE_BANNER";
                  break;
                case 3085:
                  id v20 = @"DISPLAY_AR_DARKNESS_MESSAGE";
                  break;
                case 3086:
                  id v20 = @"DISPLAY_AR_NAV_ENDPOINT";
                  break;
                case 3087:
                  id v20 = @"DISPLAY_ADVISORY_BANNER";
                  break;
                case 3088:
                  id v20 = @"TAP_SHOW_ADVISORY_DETAILS";
                  break;
                default:
                  goto LABEL_47;
              }
              break;
          }
          break;
      }
    }
    v21 = v20;
    if ((int)v14 > 1000)
    {
      if ((int)v14 > 1600)
      {
        switch((int)v14)
        {
          case 1700:
            id v22 = @"LOOK_AROUND_PIP";
            break;
          case 1701:
            id v22 = @"LOOK_AROUND_ACTION_SHEET";
            break;
          case 1702:
            id v22 = @"LOOK_AROUND_VIEW";
            break;
          case 1703:
            id v22 = @"LOOK_AROUND_PLATTER";
            break;
          case 1704:
            id v22 = @"LOOK_AROUND_PIP_UNAVAILABLE_ZOOM";
            break;
          case 1705:
            id v22 = @"LOOK_AROUND_PIP_UNAVAILABLE_REGION";
            break;
          case 1706:
            id v22 = @"LOOK_AROUND_VIEW_PLACECARD";
            break;
          case 1707:
            id v22 = @"LOOK_AROUND_PIP_PLACECARD";
            break;
          case 1708:
            id v22 = @"OFFLINE_BROWSE_ONLY_SEARCH_TRAY";
            break;
          default:
            if (v14 == 1601)
            {
              id v22 = @"MENU_ITEM_DARK_MAP";
            }
            else
            {
LABEL_1354:
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
              id v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
      }
      else
      {
        switch((int)v14)
        {
          case 1001:
            id v22 = @"CARPLAY_NAV";
            break;
          case 1002:
            id v22 = @"CARPLAY_EXPLORE";
            break;
          case 1003:
            id v22 = @"CARPLAY_DESTINATIONS";
            break;
          case 1004:
            id v22 = @"CARPLAY_TRAFFIC_INCIDENT";
            break;
          case 1005:
            id v22 = @"CARPLAY_CONTROL";
            break;
          case 1006:
            id v22 = @"CARPLAY_PROACTIVE";
            break;
          case 1007:
            id v22 = @"CARPLAY_ROUTING";
            break;
          case 1008:
            id v22 = @"CARPLAY_MORE_ROUTES";
            break;
          case 1009:
            id v22 = @"CARPLAY_SEARCH_ALONG_ROUTE";
            break;
          case 1010:
            id v22 = @"CARPLAY_SEARCH";
            break;
          case 1011:
            id v22 = @"CARPLAY_SEARCH_RESULTS";
            break;
          case 1012:
            id v22 = @"CARPLAY_FAVORITES";
            break;
          case 1013:
            id v22 = @"CARPLAY_NAV_CONFIRMATION";
            break;
          case 1014:
            id v22 = @"CARPLAY_DESTINATION_SHARING";
            break;
          case 1015:
            id v22 = @"CARPLAY_NOTIFICATION_BATTERY";
            break;
          case 1016:
            id v22 = @"CARPLAY_NOTIFICATION_DOOM";
            break;
          case 1017:
            id v22 = @"CARPLAY_NOTIFICATION_FUEL";
            break;
          case 1018:
            id v22 = @"CARPLAY_NOTIFICATION_HYBRID";
            break;
          case 1019:
            id v22 = @"CARPLAY_SHARE_ETA_TRAY";
            break;
          case 1020:
            id v22 = @"CARPLAY_ETA_UPDATE_TRAY";
            break;
          case 1021:
            id v22 = @"CARPLAY_ACTION_TRAY";
            break;
          case 1022:
            id v22 = @"CARPLAY_PLACECARD";
            break;
          case 1023:
            id v22 = @"CARPLAY_KEYBOARD";
            break;
          case 1024:
            id v22 = @"CARPLAY_UI_TARGET_UNKNOWN";
            break;
          case 1025:
            id v22 = @"CARPLAY_EDIT_STOPS";
            break;
          case 1026:
          case 1027:
          case 1028:
          case 1029:
          case 1030:
          case 1031:
          case 1032:
          case 1033:
          case 1034:
          case 1035:
          case 1036:
          case 1037:
          case 1038:
          case 1039:
          case 1040:
          case 1041:
          case 1042:
          case 1043:
          case 1044:
          case 1045:
          case 1046:
          case 1047:
          case 1048:
          case 1049:
          case 1050:
          case 1051:
          case 1052:
          case 1053:
          case 1054:
          case 1055:
          case 1056:
          case 1057:
          case 1058:
          case 1059:
          case 1060:
          case 1061:
          case 1062:
          case 1063:
          case 1064:
          case 1065:
          case 1066:
          case 1067:
          case 1068:
          case 1069:
          case 1070:
          case 1071:
          case 1072:
          case 1073:
          case 1074:
          case 1075:
          case 1076:
          case 1077:
          case 1078:
          case 1079:
          case 1080:
          case 1081:
          case 1082:
          case 1083:
          case 1084:
          case 1085:
          case 1086:
          case 1087:
          case 1088:
          case 1089:
          case 1090:
          case 1091:
          case 1092:
          case 1093:
          case 1094:
          case 1095:
          case 1096:
          case 1097:
          case 1098:
          case 1099:
          case 1162:
          case 1163:
          case 1164:
          case 1165:
          case 1166:
          case 1167:
          case 1168:
          case 1169:
          case 1170:
          case 1171:
          case 1172:
          case 1173:
          case 1174:
          case 1175:
          case 1176:
          case 1177:
          case 1178:
          case 1179:
          case 1180:
          case 1181:
          case 1182:
          case 1183:
          case 1184:
          case 1185:
          case 1186:
          case 1187:
          case 1188:
          case 1189:
          case 1190:
          case 1191:
          case 1192:
          case 1193:
          case 1194:
          case 1195:
          case 1196:
          case 1197:
          case 1198:
          case 1199:
          case 1200:
          case 1241:
          case 1242:
          case 1243:
          case 1244:
          case 1245:
          case 1246:
          case 1247:
          case 1248:
          case 1249:
          case 1250:
          case 1251:
          case 1252:
          case 1253:
          case 1254:
          case 1255:
          case 1256:
          case 1257:
          case 1258:
          case 1259:
          case 1260:
          case 1261:
          case 1262:
          case 1263:
          case 1264:
          case 1265:
          case 1266:
          case 1267:
          case 1268:
          case 1269:
          case 1270:
          case 1271:
          case 1272:
          case 1273:
          case 1274:
          case 1275:
          case 1276:
          case 1277:
          case 1278:
          case 1279:
          case 1280:
          case 1281:
          case 1282:
          case 1283:
          case 1284:
          case 1285:
          case 1286:
          case 1287:
          case 1288:
          case 1289:
          case 1290:
          case 1291:
          case 1292:
          case 1293:
          case 1294:
          case 1295:
          case 1296:
          case 1297:
          case 1298:
          case 1299:
          case 1300:
            goto LABEL_1354;
          case 1100:
            id v22 = @"RAP_DIRECTIONS_MENU";
            break;
          case 1101:
            id v22 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST";
            break;
          case 1102:
            id v22 = @"RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM";
            break;
          case 1103:
            id v22 = @"RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM";
            break;
          case 1104:
            id v22 = @"RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM";
            break;
          case 1105:
            id v22 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM";
            break;
          case 1106:
            id v22 = @"RAP_TRANSIT_MENU";
            break;
          case 1107:
            id v22 = @"RAP_STATION_MAP";
            break;
          case 1108:
            id v22 = @"RAP_STATION_MENU";
            break;
          case 1109:
            id v22 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP";
            break;
          case 1110:
            id v22 = @"RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM";
            break;
          case 1111:
            id v22 = @"RAP_STATION_CLOSED_FORM";
            break;
          case 1112:
            id v22 = @"RAP_LINE_MAP";
            break;
          case 1113:
            id v22 = @"RAP_LINE_MENU";
            break;
          case 1114:
            id v22 = @"RAP_LINE_NAME_FORM";
            break;
          case 1115:
            id v22 = @"RAP_LINE_SHAPE_FORM";
            break;
          case 1116:
            id v22 = @"RAP_LINE_SCHEDULE_INCORRECT_FORM";
            break;
          case 1117:
            id v22 = @"RAP_ADD_PLACE_MENU";
            break;
          case 1118:
            id v22 = @"RAP_ADD_POI_MAP";
            break;
          case 1119:
            id v22 = @"RAP_CATEGORY_LIST";
            break;
          case 1120:
            id v22 = @"RAP_POI_DETAILS_FORM";
            break;
          case 1121:
            id v22 = @"RAP_ADD_STREET_MAP";
            break;
          case 1122:
            id v22 = @"RAP_STREET_DETAILS_FORM";
            break;
          case 1123:
            id v22 = @"RAP_ADD_OTHER_MAP";
            break;
          case 1124:
            id v22 = @"RAP_OTHER_DETAILS_FORM";
            break;
          case 1125:
            id v22 = @"RAP_CAMERA";
            break;
          case 1126:
            id v22 = @"RAP_LABEL_MAP";
            break;
          case 1127:
            id v22 = @"RAP_LABEL_DETAILS_FORM";
            break;
          case 1128:
            id v22 = @"RAP_SEARCH_MENU";
            break;
          case 1129:
            id v22 = @"RAP_SEARCH_UNEXPECTED_RESULT_FORM";
            break;
          case 1130:
            id v22 = @"RAP_SEARCH_ADDRESS_INCORRECT_FORM";
            break;
          case 1131:
            id v22 = @"RAP_SEARCH_LOCATION_INCORRECT_MAP";
            break;
          case 1132:
            id v22 = @"RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM";
            break;
          case 1133:
            id v22 = @"RAP_SATELLITE_IMAGE_MAP";
            break;
          case 1134:
            id v22 = @"RAP_SATELLITE_IMAGE_DETAILS_FORM";
            break;
          case 1135:
            id v22 = @"RAP_OTHER_FORM";
            break;
          case 1136:
            id v22 = @"RAP_PRIVACY";
            break;
          case 1137:
            id v22 = @"RAP_CONFIRMATION";
            break;
          case 1138:
            id v22 = @"RAP_POI_MENU";
            break;
          case 1139:
            id v22 = @"RAP_SEARCH_AUTOCOMPLETE_MENU";
            break;
          case 1140:
            id v22 = @"RAP_ADD_A_PLACE_MAP";
            break;
          case 1141:
            id v22 = @"RAP_POI_LOCATION_MAP";
            break;
          case 1142:
            id v22 = @"RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP";
            break;
          case 1143:
            id v22 = @"RAP_POI_CLOSED_FORM";
            break;
          case 1144:
            id v22 = @"RAP_CLAIM_BUSINESS_DIALOG";
            break;
          case 1145:
            id v22 = @"RAP_BRAND_MENU";
            break;
          case 1146:
            id v22 = @"RAP_BRAND_DETAILS_FORM";
            break;
          case 1147:
            id v22 = @"RAP_LOOK_AROUND_IMAGE_QUALITY_FORM";
            break;
          case 1148:
            id v22 = @"RAP_LOOK_AROUND_LABELS_STREET_FORM";
            break;
          case 1149:
            id v22 = @"RAP_LOOK_AROUND_BLURRING_FORM";
            break;
          case 1150:
            id v22 = @"RAP_LOOK_AROUND_REMOVE_HOME_FORM";
            break;
          case 1151:
            id v22 = @"RAP_LOOK_AROUND_MENU";
            break;
          case 1152:
            id v22 = @"RAP_LOOK_AROUND_LABELS_STORE_FORM";
            break;
          case 1153:
            id v22 = @"RAP_LOOK_AROUND_PRIVACY_MENU";
            break;
          case 1154:
            id v22 = @"RAP_LIGHTWEIGHT";
            break;
          case 1155:
            id v22 = @"RAP_EDIT_PLACE_DETAILS";
            break;
          case 1156:
            id v22 = @"RAP_ADD_CATEGORY";
            break;
          case 1157:
            id v22 = @"RAP_ADD_HOURS";
            break;
          case 1158:
            id v22 = @"RAP_EDIT_LOCATION";
            break;
          case 1159:
            id v22 = @"RAP_EDIT_ENTRY_POINT";
            break;
          case 1160:
            id v22 = @"RAP_LOOK_AROUND";
            break;
          case 1161:
            id v22 = @"RAP_ADD_ENTRY_POINT";
            break;
          case 1201:
            id v22 = @"WATCH_MAIN_MENU";
            break;
          case 1202:
            id v22 = @"WATCH_MAIN_PRESS_MENU";
            break;
          case 1203:
            id v22 = @"WATCH_SEARCH";
            break;
          case 1204:
            id v22 = @"WATCH_DICTATION";
            break;
          case 1205:
            id v22 = @"WATCH_FAVORITES";
            break;
          case 1206:
            id v22 = @"WATCH_SUB_CATEGORY_LIST";
            break;
          case 1207:
            id v22 = @"WATCH_SEARCH_RESULTS_LIST";
            break;
          case 1208:
            id v22 = @"WATCH_MAP_VIEW";
            break;
          case 1209:
            id v22 = @"WATCH_PLACECARD";
            break;
          case 1210:
            id v22 = @"WATCH_ROUTE_PLANNING";
            break;
          case 1211:
            id v22 = @"WATCH_ROUTE_DETAILS";
            break;
          case 1212:
            id v22 = @"WATCH_NAV_TBT";
            break;
          case 1213:
            id v22 = @"WATCH_NAV_MAP";
            break;
          case 1214:
            id v22 = @"WATCH_NAV_PRESS_MENU";
            break;
          case 1215:
            id v22 = @"WATCH_MAP_PRESS_MENU";
            break;
          case 1216:
            id v22 = @"WATCH_ROUTING_PRESS_MENU";
            break;
          case 1217:
            id v22 = @"WATCH_TRANSIT_MAP_VIEW";
            break;
          case 1218:
            id v22 = @"WATCH_SCRIBBLE";
            break;
          case 1219:
            id v22 = @"WATCH_COLLECTION_VIEW";
            break;
          case 1220:
            id v22 = @"WATCH_ROUTE_PLANNING_WALKING";
            break;
          case 1221:
            id v22 = @"WATCH_ROUTE_PLANNING_DRIVING";
            break;
          case 1222:
            id v22 = @"WATCH_ROUTE_PLANNING_TRANSIT";
            break;
          case 1223:
            id v22 = @"WATCH_PAIRED_DEVICE";
            break;
          case 1224:
            id v22 = @"WATCH_NAV_DRIVING_SPLIT";
            break;
          case 1225:
            id v22 = @"WATCH_NAV_DRIVING_PLATTER";
            break;
          case 1226:
            id v22 = @"WATCH_NAV_DRIVING_MAP";
            break;
          case 1227:
            id v22 = @"WATCH_NAV_WALKING_SPLIT";
            break;
          case 1228:
            id v22 = @"WATCH_NAV_WALKING_PLATTER";
            break;
          case 1229:
            id v22 = @"WATCH_NAV_WALKING_MAP";
            break;
          case 1230:
            id v22 = @"WATCH_NAV_TRANSIT_SPLIT";
            break;
          case 1231:
            id v22 = @"WATCH_NAV_TRANSIT_PLATTER";
            break;
          case 1232:
            id v22 = @"WATCH_NAV_TRANSIT_MAP";
            break;
          case 1233:
            id v22 = @"WATCH_ROUTE_INFO";
            break;
          case 1234:
            id v22 = @"WATCH_NAV_CYCLING_MAP";
            break;
          case 1235:
            id v22 = @"WATCH_NAV_CYCLING_PLATTER";
            break;
          case 1236:
            id v22 = @"WATCH_NAV_CYCLING_SPLIT";
            break;
          case 1237:
            id v22 = @"WATCH_ROUTE_PLANNING_CYCLING";
            break;
          case 1238:
            id v22 = @"WATCH_SEARCH_INPUT";
            break;
          case 1239:
            id v22 = @"WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
            break;
          case 1240:
            id v22 = @"WATCH_SIRI_SUGGESTION_RESUME_ROUTE";
            break;
          case 1301:
            id v22 = @"PERSONALIZED_ADDRESS_LIST";
            break;
          case 1302:
            id v22 = @"PERSONALIZED_ADDRESS_FORM";
            break;
          case 1303:
            id v22 = @"PERSONALIZED_LABEL_FORM";
            break;
          case 1304:
            id v22 = @"PERSONALIZED_EDIT_MAP";
            break;
          case 1305:
            id v22 = @"PERSONALIZED_CONFIRMATION";
            break;
          case 1306:
            id v22 = @"PERSONALIZED_ADDRESS_DELETE_DIALOG";
            break;
          case 1307:
            id v22 = @"PERSONALIZED_ADDRESS_INFO";
            break;
          case 1308:
            id v22 = @"PERSONALIZED_ADDRESS_SEARCH";
            break;
          case 1309:
            id v22 = @"PERSONALIZED_ADDRESS_SEARCH_RESULTS";
            break;
          case 1310:
            id v22 = @"FAVORITE_SEARCH";
            break;
          case 1311:
            id v22 = @"FAVORITE_LIST";
            break;
          case 1312:
            id v22 = @"FAVORITE_INFO";
            break;
          case 1313:
            id v22 = @"PERSONALIZED_CONFIRMATION_WITH_PRIVACY";
            break;
          default:
            switch((int)v14)
            {
              case 1401:
                id v22 = @"ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS";
                break;
              case 1402:
                id v22 = @"ROUTING_TRAY_RIDESHARE_DETAILS_PICKING";
                break;
              case 1403:
                id v22 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING";
                break;
              case 1404:
                id v22 = @"ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED";
                break;
              case 1405:
                id v22 = @"ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG";
                break;
              case 1406:
                id v22 = @"ROUTING_TRAY_RIDESHARE_FEEDBACK";
                break;
              case 1407:
                id v22 = @"ROUTING_TRAY_RIDESHARE_ENABLE_ALL";
                break;
              default:
                switch((int)v14)
                {
                  case 1501:
                    id v22 = @"PLACECARD_HEADER";
                    break;
                  case 1502:
                    id v22 = @"PLACECARD_ADDRESS";
                    break;
                  case 1503:
                    id v22 = @"PLACECARD_PHONE";
                    break;
                  case 1504:
                    id v22 = @"PLACECARD_URL";
                    break;
                  default:
                    goto LABEL_1354;
                }
                break;
            }
            break;
        }
      }
    }
    else
    {
      id v22 = @"UI_TARGET_UNKNOWN";
      switch((int)v14)
      {
        case 0:
          break;
        case 1:
          id v22 = @"UI_TARGET_POI";
          break;
        case 2:
          id v22 = @"UI_TARGET_SEARCH_RESULT_LIST";
          break;
        case 3:
          id v22 = @"UI_TARGET_POPULAR_NEARBY_LIST";
          break;
        case 4:
          id v22 = @"UI_TARGET_CALLOUT";
          break;
        case 5:
          id v22 = @"UI_TARGET_SEARCH_PIN";
          break;
        case 6:
          id v22 = @"UI_TARGET_DROPPED_PIN";
          break;
        case 7:
          id v22 = @"UI_TARGET_TRANSIT_LINE";
          break;
        case 8:
          id v22 = @"SEARCH_TRAY";
          break;
        case 9:
          id v22 = @"SEARCH_TRAY_BROWSE";
          break;
        case 10:
          id v22 = @"SEARCH_TRAY_POPULAR_NEARBY";
          break;
        case 11:
          id v22 = @"SEARCH_TRAY_AC";
          break;
        case 12:
          id v22 = @"SEARCH_TRAY_AC_INTERMEDIATE";
          break;
        case 13:
          id v22 = @"SEARCH_TRAY_NO_QUERY";
          break;
        case 14:
          id v22 = @"AR_WALKING_LEGAL_TRAY";
          break;
        case 15:
          id v22 = @"RAISE_TO_START_AR_TRAY";
          break;
        case 16:
          id v22 = @"EVENTS_ADVISORY_DETAILS_PAGE";
          break;
        case 17:
          id v22 = @"INCIDENT_REPORT_TRAY_CARPLAY";
          break;
        case 18:
          id v22 = @"HIGHLIGHTED_AREA";
          break;
        case 19:
          id v22 = @"CURATED_COLLECTIONS_HOME";
          break;
        case 20:
          id v22 = @"TRAVEL_PREFERENCES_TRAY";
          break;
        case 21:
          id v22 = @"RESULT_TRAY_SEARCH";
          break;
        case 22:
          id v22 = @"SINGLE_CARD_FILTER";
          break;
        case 23:
          id v22 = @"FULL_CARD_FILTER";
          break;
        case 24:
          id v22 = @"ACCOUNT_PRIVACY_TRAY";
          break;
        case 25:
          id v22 = @"APPLE_RATINGS_HISTORY_TRAY";
          break;
        case 26:
          id v22 = @"CURATED_COLLECTIONS_HOME_FILTERED";
          break;
        case 27:
          id v22 = @"CITY_MENU";
          break;
        case 28:
          id v22 = @"CURATED_COLLECTIONS_HOME_CONDENSED";
          break;
        case 29:
          id v22 = @"ACCOUNT_TRAY";
          break;
        case 30:
          id v22 = @"QUICK_ACTION_TRAY";
          break;
        case 31:
          id v22 = @"SUBMIT_TRIP_FEEDBACK";
          break;
        case 32:
          id v22 = @"RAP_PLACE_ISSUE_DETAILS";
          break;
        case 33:
          id v22 = @"RAP_GUIDES_DETAILS";
          break;
        case 34:
          id v22 = @"RAP_BAD_DIRECTIONS_DETAILS";
          break;
        case 35:
          id v22 = @"RAP_ADD_MAP_DETAILS";
          break;
        case 36:
          id v22 = @"WATCH_COMPLICATION";
          break;
        case 37:
          id v22 = @"RAP_NAV_MENU";
          break;
        case 38:
          id v22 = @"NOTIFICATION_ALIGHT_BANNER_TRANSIT";
          break;
        case 39:
          id v22 = @"RAP_REPORT_MENU";
          break;
        case 40:
          id v22 = @"RAP_CURATED_COLLECTION_MENU";
          break;
        case 41:
          id v22 = @"RAP_REPORT_CARD_DETAILS";
          break;
        case 42:
          id v22 = @"NOTIFICATION_NO_LOCATION_TRANSIT";
          break;
        case 43:
          id v22 = @"RAP_STREET_ISSUE_DETAILS";
          break;
        case 44:
          id v22 = @"NEARBY_TRANSIT_CARD";
          break;
        case 45:
          id v22 = @"WATCH_NAV_MENU";
          break;
        case 46:
          id v22 = @"GENERIC_ADVISORY_PAGE";
          break;
        case 47:
          id v22 = @"USER_PROFILE_TRAY";
          break;
        case 48:
          id v22 = @"MEDIA_APP_MENU";
          break;
        case 49:
          id v22 = @"TEMPLATE_PLACE_TRAY";
          break;
        case 50:
          id v22 = @"NOTIFICATION_CONSENT_REPROMPT_RAP";
          break;
        case 51:
          id v22 = @"ALLOW_NOTIFICATION_DIALOG";
          break;
        case 52:
          id v22 = @"NOTIFICATION_CONSENT_REPROMPT_DRIVING";
          break;
        case 53:
          id v22 = @"NOTIFICATION_CONSENT_REPROMPT_ARP";
          break;
        case 54:
          id v22 = @"NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED";
          break;
        case 55:
          id v22 = @"NOTIFICATION_CONSENT_PROMPT";
          break;
        case 56:
          id v22 = @"QUICK_ACTION_TRAY_VENDORS_MENU";
          break;
        case 57:
          id v22 = @"PLACECARD_TRAY_VENDORS_MENU";
          break;
        case 58:
          id v22 = @"RESULTS_TRAY_SEARCH_ROUTE_PLANNING";
          break;
        case 59:
          id v22 = @"SEARCH_ALONG_ROUTE_TRAY";
          break;
        case 60:
          id v22 = @"MAP_RESULTS_SEARCH_ROUTE_PLANNING";
          break;
        case 61:
          id v22 = @"PLACECARD_SHOWCASE_MENU";
          break;
        case 62:
          id v22 = @"RAP_INLINE_ADD_DETAILS";
          break;
        case 63:
          id v22 = @"RAP_EDIT_MENU_DETAILS";
          break;
        case 64:
          id v22 = @"RAP_SUBMISSION_PROMPT";
          break;
        case 65:
          id v22 = @"RAP_PLACECARD_EDIT_MENU";
          break;
        case 66:
          id v22 = @"ARP_SUBMISSION_CONFIRMATION_PAGE";
          break;
        case 67:
          id v22 = @"INCIDENT_REPORT_MENU";
          break;
        case 68:
          id v22 = @"RAP_SELECT_BAD_ROUTES_STEPS";
          break;
        case 69:
          id v22 = @"RAP_SELECT_BAD_ROUTES";
          break;
        case 70:
          id v22 = @"SIRI_SUGGESTION_RESUME_ROUTE";
          break;
        case 71:
          id v22 = @"SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE";
          break;
        case 72:
          id v22 = @"SPOTLIGHT_BUSINESS_ENTITY_LIST";
          break;
        case 73:
          id v22 = @"SPOTLIGHT_BUSINESS_ENTITY";
          break;
        case 74:
          id v22 = @"NOTIFICATION_ARP";
          break;
        case 75:
          id v22 = @"IMPROVE_LOCATION_ACCURACY_PROMPT";
          break;
        case 76:
          id v22 = @"YOUR_PHOTOS_ALBUM";
          break;
        case 77:
          id v22 = @"ARP_PHOTO_CREDIT";
          break;
        case 78:
          id v22 = @"RAP_OUTREACH_REVIEWED_REPORT";
          break;
        case 79:
          id v22 = @"RAP_REPORT_MENU_MORE";
          break;
        case 80:
          id v22 = @"WATCH_MAPS_SETTINGS";
          break;
        case 81:
          id v22 = @"OFFLINE_FEATURE_PROMPT";
          break;
        case 82:
          id v22 = @"EXPIRED_MAPS_DETAILS";
          break;
        case 83:
          id v22 = @"MAPS_VIEW";
          break;
        case 84:
          id v22 = @"NOTIFICATION_OFFLINE";
          break;
        case 85:
          id v22 = @"EXPIRED_MAPS_MANAGEMENT";
          break;
        case 86:
          id v22 = @"OFFLINE_NEW_MAPS_MANAGEMENT";
          break;
        case 87:
          id v22 = @"EDIT_EXPIRED_MAPS_MANAGEMENT";
          break;
        case 88:
          id v22 = @"OFFLINE_MAPS_MANAGEMENT";
          break;
        case 89:
          id v22 = @"REGION_SELECTOR";
          break;
        case 90:
          id v22 = @"OFFLINE_SUGGESTED_MAPS_MANAGEMENT";
          break;
        case 91:
          id v22 = @"FIND_MY_ETA_SHARING_TRAY";
          break;
        case 92:
          id v22 = @"WATCH_PLACE";
          break;
        case 93:
          id v22 = @"WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL";
          break;
        case 94:
          id v22 = @"WATCH_ROUTE_PLANNING_MAP";
          break;
        case 95:
          id v22 = @"WATCH_NAV_WALKING_CONTROLS";
          break;
        case 96:
          id v22 = @"WATCH_NAV_CYCLING_CONTROLS";
          break;
        case 97:
          id v22 = @"WATCH_ROUTE_PLANNING_WALKING_CAROUSEL";
          break;
        case 98:
          id v22 = @"WATCH_NAV_TRANSIT_CONTROLS";
          break;
        case 99:
          id v22 = @"WATCH_SEARCH_RESULTS_CAROUSEL";
          break;
        case 100:
          id v22 = @"WATCH_NAV_DRIVING_CONTROLS";
          break;
        case 101:
          id v22 = @"RESULTS_TRAY_SEARCH";
          break;
        case 102:
          id v22 = @"RESULTS_TRAY_BROWSE";
          break;
        case 103:
          id v22 = @"RESULTS_TRAY_FAVORITES";
          break;
        case 104:
          id v22 = @"RESULTS_TRAY_SEARCH_ALONG_ROUTE";
          break;
        case 105:
          id v22 = @"RESULTS_TRAY_CLUSTER";
          break;
        case 106:
          id v22 = @"RESULTS_TRAY_VENUE_BROWSE";
          break;
        case 107:
          id v22 = @"WATCH_MAP_RESULTS";
          break;
        case 108:
          id v22 = @"WATCH_NAV_WALKING_ELEVATION_VIEW";
          break;
        case 109:
          id v22 = @"WATCH_PLACES";
          break;
        case 110:
          id v22 = @"WATCH_NAV_CYCLING_ELEVATION_VIEW";
          break;
        case 111:
          id v22 = @"WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL";
          break;
        case 112:
          id v22 = @"DOWNLOADED_MAPS_DETAILS";
          break;
        case 113:
          id v22 = @"WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL";
          break;
        case 114:
          id v22 = @"WATCH_NAV_TRANSIT_OVERVIEW_MAP";
          break;
        case 115:
          id v22 = @"WATCH_NAV_WALKING_OVERVIEW_MAP";
          break;
        case 116:
          id v22 = @"WATCH_NAV_CYCLING_OVERVIEW_MAP";
          break;
        case 117:
          id v22 = @"WATCH_ROUTE_OPTIONS";
          break;
        case 118:
          id v22 = @"WATCH_NAV_DRIVING_OVERVIEW_MAP";
          break;
        case 119:
          id v22 = @"WATCH_MORE_GUIDES";
          break;
        case 120:
          id v22 = @"WATCH_RECENTLY_VIEWED";
          break;
        case 121:
          id v22 = @"EV_SUCCESS_TRAY";
          break;
        case 122:
          id v22 = @"PREFERRED_NETWORK_SELECTION_TRAY";
          break;
        case 123:
          id v22 = @"PREFERRED_NETWORK_TRAY";
          break;
        case 124:
          id v22 = @"WALKING_TRANSITION_SUGGESTION_TRAY";
          break;
        case 125:
          id v22 = @"FINDMY_TRANSITION_SUGGESTION_TRAY";
          break;
        case 126:
          id v22 = @"CARPLAY_FIND_MY_ETA_SHARING_TRAY";
          break;
        case 127:
          id v22 = @"AC_KEYBOARD_TRAY";
          break;
        case 128:
          id v22 = @"MORE_RELATED_TRAILS";
          break;
        case 129:
          id v22 = @"MORE_RELATED_TRAILHEADS";
          break;
        case 130:
          id v22 = @"ROUTING_TRAY_CUSTOM_ROUTE";
          break;
        case 131:
          id v22 = @"CUSTOM_ROUTE_CREATION_TRAY";
          break;
        case 132:
          id v22 = @"ROUTING_TRAY_CURATED_HIKE";
          break;
        case 133:
          id v22 = @"MORE_CURATED_HIKES";
          break;
        case 134:
          id v22 = @"CUSTOM_ROUTE_ONBOARDING";
          break;
        case 135:
          id v22 = @"LIBRARY_ROUTES";
          break;
        case 136:
          id v22 = @"HIKING_TRANSITION_SUGGESTION_TRAY";
          break;
        case 137:
          id v22 = @"MY_LIBRARY";
          break;
        case 138:
          id v22 = @"EDIT_NOTE_TRAY";
          break;
        case 139:
          id v22 = @"CREATE_NOTE_TRAY";
          break;
        case 140:
          id v22 = @"LIBRARY_PLACES";
          break;
        case 141:
          id v22 = @"WATCH_ACCOUNT";
          break;
        case 142:
          id v22 = @"WATCH_DOWNLOADED_MAPS";
          break;
        case 143:
          id v22 = @"VISUAL_INTELLIGENCE_DETECTION_LIST";
          break;
        case 144:
          id v22 = @"VISUAL_INTELLIGENCE_DETECTION";
          break;
        case 145:
          id v22 = @"VISUAL_INTELLIGENCE_SNIPPET";
          break;
        case 146:
        case 147:
        case 148:
        case 149:
        case 150:
        case 151:
        case 152:
        case 153:
        case 154:
        case 155:
        case 156:
        case 157:
        case 158:
        case 159:
        case 160:
        case 161:
        case 162:
        case 163:
        case 164:
        case 165:
        case 166:
        case 167:
        case 168:
        case 169:
        case 170:
        case 171:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 177:
        case 178:
        case 179:
        case 180:
        case 181:
        case 182:
        case 183:
        case 184:
        case 185:
        case 186:
        case 187:
        case 188:
        case 189:
        case 190:
        case 191:
        case 192:
        case 193:
        case 194:
        case 195:
        case 196:
        case 197:
        case 198:
        case 199:
        case 200:
        case 203:
        case 204:
        case 205:
        case 206:
        case 207:
        case 208:
        case 209:
        case 210:
        case 211:
        case 212:
        case 213:
        case 214:
        case 215:
        case 216:
        case 217:
        case 218:
        case 219:
        case 220:
        case 221:
        case 222:
        case 223:
        case 224:
        case 225:
        case 226:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 232:
        case 233:
        case 234:
        case 235:
        case 236:
        case 237:
        case 238:
        case 239:
        case 240:
        case 241:
        case 242:
        case 243:
        case 244:
        case 245:
        case 246:
        case 247:
        case 248:
        case 249:
        case 269:
        case 270:
        case 271:
        case 272:
        case 273:
        case 274:
        case 275:
        case 276:
        case 277:
        case 278:
        case 279:
        case 280:
        case 281:
        case 282:
        case 283:
        case 284:
        case 285:
        case 286:
        case 287:
        case 288:
        case 289:
        case 290:
        case 291:
        case 292:
        case 293:
        case 294:
        case 295:
        case 296:
        case 297:
        case 298:
        case 299:
        case 300:
        case 307:
        case 308:
        case 309:
        case 310:
        case 311:
        case 312:
        case 313:
        case 314:
        case 315:
        case 316:
        case 317:
        case 318:
        case 319:
        case 320:
        case 321:
        case 322:
        case 323:
        case 324:
        case 325:
        case 326:
        case 327:
        case 328:
        case 329:
        case 330:
        case 331:
        case 332:
        case 333:
        case 334:
        case 335:
        case 336:
        case 337:
        case 338:
        case 339:
        case 340:
        case 341:
        case 342:
        case 343:
        case 344:
        case 345:
        case 346:
        case 347:
        case 348:
        case 349:
        case 350:
        case 351:
        case 352:
        case 353:
        case 354:
        case 355:
        case 356:
        case 357:
        case 358:
        case 359:
        case 360:
        case 361:
        case 362:
        case 363:
        case 364:
        case 365:
        case 366:
        case 367:
        case 368:
        case 369:
        case 370:
        case 371:
        case 372:
        case 373:
        case 374:
        case 375:
        case 376:
        case 377:
        case 378:
        case 379:
        case 380:
        case 381:
        case 382:
        case 383:
        case 384:
        case 385:
        case 386:
        case 387:
        case 388:
        case 389:
        case 390:
        case 391:
        case 392:
        case 393:
        case 394:
        case 395:
        case 396:
        case 397:
        case 398:
        case 399:
        case 400:
        case 405:
        case 406:
        case 407:
        case 408:
        case 409:
        case 410:
        case 411:
        case 412:
        case 413:
        case 414:
        case 415:
        case 416:
        case 417:
        case 418:
        case 419:
        case 420:
        case 421:
        case 422:
        case 423:
        case 424:
        case 425:
        case 426:
        case 427:
        case 428:
        case 429:
        case 430:
        case 431:
        case 432:
        case 433:
        case 434:
        case 435:
        case 436:
        case 437:
        case 438:
        case 439:
        case 440:
        case 441:
        case 442:
        case 443:
        case 444:
        case 445:
        case 446:
        case 447:
        case 448:
        case 449:
        case 450:
        case 451:
        case 452:
        case 453:
        case 454:
        case 455:
        case 456:
        case 457:
        case 458:
        case 459:
        case 460:
        case 461:
        case 462:
        case 463:
        case 464:
        case 465:
        case 466:
        case 467:
        case 468:
        case 469:
        case 470:
        case 471:
        case 472:
        case 473:
        case 474:
        case 475:
        case 476:
        case 477:
        case 478:
        case 479:
        case 480:
        case 481:
        case 482:
        case 483:
        case 484:
        case 485:
        case 486:
        case 487:
        case 488:
        case 489:
        case 490:
        case 491:
        case 492:
        case 493:
        case 494:
        case 495:
        case 496:
        case 497:
        case 498:
        case 499:
        case 500:
        case 512:
        case 513:
        case 514:
        case 515:
        case 516:
        case 517:
        case 518:
        case 519:
        case 520:
        case 521:
        case 522:
        case 523:
        case 524:
        case 525:
        case 526:
        case 527:
        case 528:
        case 529:
        case 530:
        case 531:
        case 532:
        case 533:
        case 534:
        case 535:
        case 536:
        case 537:
        case 538:
        case 539:
        case 540:
        case 541:
        case 542:
        case 543:
        case 544:
        case 545:
        case 546:
        case 547:
        case 548:
        case 549:
        case 550:
        case 551:
        case 552:
        case 553:
        case 554:
        case 555:
        case 556:
        case 557:
        case 558:
        case 559:
        case 560:
        case 561:
        case 562:
        case 563:
        case 564:
        case 565:
        case 566:
        case 567:
        case 568:
        case 569:
        case 570:
        case 571:
        case 572:
        case 573:
        case 574:
        case 575:
        case 576:
        case 577:
        case 578:
        case 579:
        case 580:
        case 581:
        case 582:
        case 583:
        case 584:
        case 585:
        case 586:
        case 587:
        case 588:
        case 589:
        case 590:
        case 591:
        case 592:
        case 593:
        case 594:
        case 595:
        case 596:
        case 597:
        case 598:
        case 599:
        case 600:
        case 700:
        case 744:
        case 745:
        case 746:
        case 747:
        case 748:
        case 749:
        case 750:
        case 751:
        case 752:
        case 753:
        case 754:
        case 755:
        case 756:
        case 757:
        case 758:
        case 759:
        case 760:
        case 761:
        case 762:
        case 763:
        case 764:
        case 765:
        case 766:
        case 767:
        case 768:
        case 769:
        case 770:
        case 771:
        case 772:
        case 773:
        case 774:
        case 775:
        case 776:
        case 777:
        case 778:
        case 779:
        case 780:
        case 781:
        case 782:
        case 783:
        case 784:
        case 785:
        case 786:
        case 787:
        case 788:
        case 789:
        case 790:
        case 791:
        case 792:
        case 793:
        case 794:
        case 795:
        case 796:
        case 797:
        case 798:
        case 799:
        case 800:
          goto LABEL_1354;
        case 201:
          id v22 = @"PLACECARD_TRAY";
          break;
        case 202:
          id v22 = @"WEB_MODULE";
          break;
        case 250:
          id v22 = @"ADD_FAVORITE_TRAY";
          break;
        case 251:
          id v22 = @"COLLECTION_LIST";
          break;
        case 252:
          id v22 = @"COLLECTION_VIEW";
          break;
        case 253:
          id v22 = @"FAVORITE_DETAILS";
          break;
        case 254:
          id v22 = @"FAVORITES_TRAY";
          break;
        case 255:
          id v22 = @"SHARED_COLLECTION";
          break;
        case 256:
          id v22 = @"SHARED_COLLECTION_VIEW";
          break;
        case 257:
          id v22 = @"RECENTLY_VIEWED";
          break;
        case 258:
          id v22 = @"SHARED_WEB_COLLECTION";
          break;
        case 259:
          id v22 = @"CURATED_COLLECTION_VIEW";
          break;
        case 260:
          id v22 = @"FEATURED_COLLECTIONS";
          break;
        case 261:
          id v22 = @"PUBLISHER_TRAY";
          break;
        case 262:
          id v22 = @"SHARED_CURATED_COLLECTION_VIEW";
          break;
        case 263:
          id v22 = @"CURATED_COLLECTION_NOTIFICATION";
          break;
        case 264:
          id v22 = @"CURATED_COLLECTION_LIST";
          break;
        case 265:
          id v22 = @"PUBLISHER_LIST";
          break;
        case 266:
          id v22 = @"WATCH_CURATED_COLLECTION_VIEW";
          break;
        case 267:
          id v22 = @"SIRI_SUGGESTION_SHARED_ETA_SUBLIST";
          break;
        case 268:
          id v22 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST";
          break;
        case 301:
          id v22 = @"ROUTING_TRAY_DRIVING";
          break;
        case 302:
          id v22 = @"ROUTING_TRAY_WALKING";
          break;
        case 303:
          id v22 = @"ROUTING_TRAY_TRANSIT";
          break;
        case 304:
          id v22 = @"ROUTING_TRAY_RIDESHARE";
          break;
        case 305:
          id v22 = @"ROUTING_TRAY_CYCLING";
          break;
        case 306:
          id v22 = @"ROUTING_TRAY_VIRTUAL_GARAGE_VIEW";
          break;
        case 401:
          id v22 = @"NAV_TRAY_DRIVING";
          break;
        case 402:
          id v22 = @"NAV_TRAY_WALKING";
          break;
        case 403:
          id v22 = @"NAV_TRAY_TRANSIT";
          break;
        case 404:
          id v22 = @"NAV_TRAY_CYCLING";
          break;
        case 501:
          id v22 = @"MAP_PLACECARD";
          break;
        case 502:
          id v22 = @"MAP_SEARCH";
          break;
        case 503:
          id v22 = @"MAP_RESULTS";
          break;
        case 504:
          id v22 = @"MAP_ROUTING";
          break;
        case 505:
          id v22 = @"MAP_NAV";
          break;
        case 506:
          id v22 = @"MAP_RESULTS_SEARCH_ALONG_ROUTE";
          break;
        case 507:
          id v22 = @"MAP_TRAFFIC_INCIDENT";
          break;
        case 508:
          id v22 = @"MAP_FULL_SCREEN";
          break;
        case 509:
          id v22 = @"MAP_DRIVE";
          break;
        case 510:
          id v22 = @"MAP_LAUNCH_AND_GO";
          break;
        case 511:
          id v22 = @"MAP_VIEW";
          break;
        case 601:
          id v22 = @"MAPS_SETTINGS";
          break;
        case 602:
          id v22 = @"MAPS_PREFERENCES";
          break;
        case 603:
          id v22 = @"RAP";
          break;
        case 604:
          id v22 = @"ROUTING_DRIVING_DETAILS";
          break;
        case 605:
          id v22 = @"ROUTING_WALKING_DETAILS";
          break;
        case 606:
          id v22 = @"ROUTING_TRANSIT_DETAILS";
          break;
        case 607:
          id v22 = @"ROUTING_EDITOR";
          break;
        case 608:
          id v22 = @"NAV_DRIVING_DETAILS";
          break;
        case 609:
          id v22 = @"NAV_WALKING_DETAILS";
          break;
        case 610:
          id v22 = @"NAV_TRANSIT_DETAILS";
          break;
        case 611:
          id v22 = @"NAV_AUDIO_SETTINGS";
          break;
        case 612:
          id v22 = @"PHOTO_VIEWER_ALL";
          break;
        case 613:
          id v22 = @"PHOTO_VIEWER_SINGLE";
          break;
        case 614:
          id v22 = @"ROUTE_OPTIONS_TRANSIT";
          break;
        case 615:
          id v22 = @"TRAFFIC_INCIDENT_TRAY";
          break;
        case 616:
          id v22 = @"NAV_DIRECTIONS_BANNER_DRIVING";
          break;
        case 617:
          id v22 = @"NAV_DIRECTIONS_BANNER_WALKING";
          break;
        case 618:
          id v22 = @"NAV_DIRECTIONS_BANNER_TRANSIT";
          break;
        case 619:
          id v22 = @"REFINE_SEARCH_SUGGESTION_AREA";
          break;
        case 620:
          id v22 = @"ADD_PHOTO_SHEET";
          break;
        case 621:
          id v22 = @"ADD_PLACE_SHEET";
          break;
        case 622:
          id v22 = @"SHARE_SHEET";
          break;
        case 623:
          id v22 = @"EDIT_LOCATION_SHEET";
          break;
        case 624:
          id v22 = @"ADD_CONTACT_SHEET";
          break;
        case 625:
          id v22 = @"EDIT_NAME_SHEET";
          break;
        case 626:
          id v22 = @"DRIVING_NAV_SETTINGS";
          break;
        case 627:
          id v22 = @"TRANSIT_SETTINGS";
          break;
        case 628:
          id v22 = @"TRANSIT_ADVISORY_SHEET";
          break;
        case 629:
          id v22 = @"REMOVE_CAR_SHEET";
          break;
        case 630:
          id v22 = @"ROUTE_OPTIONS_DRIVING";
          break;
        case 631:
          id v22 = @"ROUTE_OPTIONS_DATETIME";
          break;
        case 632:
          id v22 = @"TRANSIT_ADVISORY_BANNER";
          break;
        case 633:
          id v22 = @"BOOK_TABLE_SELECT_TIME";
          break;
        case 634:
          id v22 = @"BOOK_TABLE_MORE_OPTIONS";
          break;
        case 635:
          id v22 = @"BOOK_TABLE_READY";
          break;
        case 636:
          id v22 = @"BOOK_TABLE_BOOKED";
          break;
        case 637:
          id v22 = @"TRANSIT_LINE_CLUSTER_SHEET";
          break;
        case 638:
          id v22 = @"TRANSIT_LINE_LIST_SHEET";
          break;
        case 639:
          id v22 = @"TRANSIT_BALANCE_BANNER";
          break;
        case 640:
          id v22 = @"WEATHER_ICON";
          break;
        case 641:
          id v22 = @"HELP_IMPROVE_MAPS_DIALOG";
          break;
        case 642:
          id v22 = @"HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG";
          break;
        case 643:
          id v22 = @"COMMUTE_PREDICTION_ACCURACY_DIALOG";
          break;
        case 644:
          id v22 = @"FLOOR_PICKER";
          break;
        case 645:
          id v22 = @"VENUE_LIST";
          break;
        case 646:
          id v22 = @"AR_MODE";
          break;
        case 647:
          id v22 = @"ROUTING_TRANSIT_TICKETS_SHEET";
          break;
        case 648:
          id v22 = @"LINKED_SERVICE_HOURS";
          break;
        case 649:
          id v22 = @"SHARE_ETA_TRAY";
          break;
        case 650:
          id v22 = @"ETA_UPDATE_TRAY";
          break;
        case 651:
          id v22 = @"SCHEDULECARD_TRAY";
          break;
        case 652:
          id v22 = @"AR_NAV";
          break;
        case 653:
          id v22 = @"TAP_TRANSIT_ACCESS_POINT";
          break;
        case 654:
          id v22 = @"LOCATIONS_INSIDE";
          break;
        case 655:
          id v22 = @"SIMILAR_LOCATIONS";
          break;
        case 656:
          id v22 = @"LOCATIONS_AT_ADDRESS";
          break;
        case 657:
          id v22 = @"NAV_DIRECTIONS_BANNER_CYCLING";
          break;
        case 658:
          id v22 = @"ROUTE_OPTIONS_CYCLING";
          break;
        case 659:
          id v22 = @"EV_CONNECTION_TRAY";
          break;
        case 660:
          id v22 = @"VIRTUAL_GARAGE";
          break;
        case 661:
          id v22 = @"VIRTUAL_GARAGE_BANNER";
          break;
        case 662:
          id v22 = @"VIRTUAL_GARAGE_VEHICLE_VIEW";
          break;
        case 663:
          id v22 = @"ADVISORY_DETAILS_PAGE";
          break;
        case 664:
          id v22 = @"APP_CLIP_NOTIFICATION";
          break;
        case 665:
          id v22 = @"PHOTO_VIEWER_GALLERY";
          break;
        case 666:
          id v22 = @"RECOMMENDATION_CARD";
          break;
        case 667:
          id v22 = @"INCIDENT_REPORT_TRAY";
          break;
        case 668:
          id v22 = @"MAPS_WIDGET_DISPLAY";
          break;
        case 669:
          id v22 = @"VISUAL_LOCATION_FRAMEWORK";
          break;
        case 670:
          id v22 = @"APP_CLIP_TRAY";
          break;
        case 671:
          id v22 = @"LICENSE_PLATE_SUGGESTION_PAGE";
          break;
        case 672:
          id v22 = @"NOTIFICATION_ADD_PLATE";
          break;
        case 673:
          id v22 = @"MAPS_RESULTS";
          break;
        case 674:
          id v22 = @"MAPS_WIDGET_APP_CONNECTION";
          break;
        case 675:
          id v22 = @"MAPS_WIDGET_CURRENT_LOCATION";
          break;
        case 676:
          id v22 = @"MAPS_WIDGET_CURRENT_NAV";
          break;
        case 677:
          id v22 = @"MAPS_WIDGET_ETA";
          break;
        case 678:
          id v22 = @"MAPS_WIDGET_TRANSIT";
          break;
        case 679:
          id v22 = @"MAPS_WIDGET_UPC_DESTINATION";
          break;
        case 680:
          id v22 = @"WIDGET_CREATION_TRAY";
          break;
        case 681:
          id v22 = @"MAPS_WIDGET_HOME";
          break;
        case 682:
          id v22 = @"MAPS_WIDGET_PARKED_CAR";
          break;
        case 683:
          id v22 = @"MAPS_WIDGET_POI";
          break;
        case 684:
          id v22 = @"MAPS_WIDGET_SCHOOL";
          break;
        case 685:
          id v22 = @"MAPS_WIDGET_WORK";
          break;
        case 686:
          id v22 = @"AIRPORT_NOTIFICATION";
          break;
        case 687:
          id v22 = @"MAPS_WIDGET_EMPTY";
          break;
        case 688:
          id v22 = @"COARSE_LOCATION_OPTIONS_PROMPT";
          break;
        case 689:
          id v22 = @"ALLOW_PRECISE_LOCATION_PROMPT";
          break;
        case 690:
          id v22 = @"SHARE_MY_LOCATION";
          break;
        case 691:
          id v22 = @"MARK_MY_LOCATION";
          break;
        case 692:
          id v22 = @"AIRPORT_NOTIFICATION_WATCH";
          break;
        case 693:
          id v22 = @"EDIT_FAVORITE";
          break;
        case 694:
          id v22 = @"ROUTING_CYCLING_DETAILS";
          break;
        case 695:
          id v22 = @"NAV_CYCLING_DETAILS";
          break;
        case 696:
          id v22 = @"MAPS_SUGGESTION_WIDGET";
          break;
        case 697:
          id v22 = @"ARP_TIPKIT";
          break;
        case 698:
          id v22 = @"ARP_PRIVACY";
          break;
        case 699:
          id v22 = @"ROUTE_OPTIONS_WALKING";
          break;
        case 701:
          id v22 = @"SAFARI_SEARCH";
          break;
        case 702:
          id v22 = @"SPOTLIGHT_SEARCH";
          break;
        case 703:
          id v22 = @"SAFARI_MAPS_SEARCH_RESULTS";
          break;
        case 704:
          id v22 = @"SPOTLIGHT_MAPS_SEARCH_RESULTS";
          break;
        case 705:
          id v22 = @"WIDGET_MAPS_DESTINATIONS";
          break;
        case 706:
          id v22 = @"WIDGET_MAPS_TRANSIT";
          break;
        case 707:
          id v22 = @"WIDGET_MAPS_NEARBY";
          break;
        case 708:
          id v22 = @"NOTIFICATION_FIND_MY_CAR";
          break;
        case 709:
          id v22 = @"CONTROL_CENTER";
          break;
        case 710:
          id v22 = @"NOTIFICATION_CENTER";
          break;
        case 711:
          id v22 = @"NOTIFICATION_DOOM";
          break;
        case 712:
          id v22 = @"NOTIFICATION_VENUES";
          break;
        case 713:
          id v22 = @"NOTIFICATION_RAP_UPDATE";
          break;
        case 714:
          id v22 = @"NOTIFICATION_TRIP_CANCELLED";
          break;
        case 715:
          id v22 = @"NOTIFICATION_STOP_SKIPPED";
          break;
        case 716:
          id v22 = @"NOTIFICATION_TRIP_DELAYED";
          break;
        case 717:
          id v22 = @"NOTIFICATION_RAP";
          break;
        case 718:
          id v22 = @"NOTIFICATION_PROXY_AUTH";
          break;
        case 719:
          id v22 = @"NOTIFICATION_PUSH_TO_DEVICE";
          break;
        case 720:
          id v22 = @"NOTIFICATION_LOW_FUEL";
          break;
        case 721:
          id v22 = @"NOTIFICATION_FIND_MY_CAR_RESET";
          break;
        case 722:
          id v22 = @"NOTIFICATION_TRAFFIC_CONDITIONS";
          break;
        case 723:
          id v22 = @"NOTIFICATION_SHARED_ETA";
          break;
        case 724:
          id v22 = @"NOTIFICATION_SHARED_ETA_UPDATE";
          break;
        case 725:
          id v22 = @"ANNOUNCEMENT_TYPE_UNKNOWN";
          break;
        case 726:
          id v22 = @"ANNOUNCEMENT_TYPE_GENERAL";
          break;
        case 727:
          id v22 = @"ANNOUNCEMENT_TYPE_FLYOVER";
          break;
        case 728:
          id v22 = @"ANNOUNCEMENT_TYPE_TRANSIT";
          break;
        case 729:
          id v22 = @"ANNOUNCEMENT_TYPE_VENUES";
          break;
        case 730:
          id v22 = @"ANNOUNCEMENT_TYPE_ENHANCED_DETAIL";
          break;
        case 731:
          id v22 = @"ANNOUNCEMENT_TYPE_LANE_GUIDANCE";
          break;
        case 732:
          id v22 = @"ANNOUNCEMENT_TYPE_LOOK_AROUND";
          break;
        case 733:
          id v22 = @"APP_SHEET";
          break;
        case 734:
          id v22 = @"CZ_ADVISORY_DETAILS_PAGE";
          break;
        case 735:
          id v22 = @"SHARE_ETA_CONTACT_TRAY";
          break;
        case 736:
          id v22 = @"SIRI_SHARE_ETA";
          break;
        case 737:
          id v22 = @"SIRI_SUGGESTION_SHARED_ETA";
          break;
        case 738:
          id v22 = @"SIRI_SUGGESTION_SHARED_ETA_CARPLAY";
          break;
        case 739:
          id v22 = @"INCIDENT_ALERT_TRAY";
          break;
        case 740:
          id v22 = @"INCIDENT_REPORT_CONFIRMATION_TRAY";
          break;
        case 741:
          id v22 = @"RAP_INCIDENT_REPORT_VIEW";
          break;
        case 742:
          id v22 = @"SEARCH_ALONG_ROUTE_CATEGORY_TRAY";
          break;
        case 743:
          id v22 = @"TRAFFIC_ADVISORY_SHEET";
          break;
        case 801:
          id v22 = @"SIRI_PLUGIN_SNIPPET";
          break;
        case 802:
          id v22 = @"SIRI_PLUGIN_COMMAND";
          break;
        case 803:
          id v22 = @"SIRI_SEARCH_RESULT_LIST";
          break;
        case 804:
          id v22 = @"SIRI_DISAMBIGUATION_LIST";
          break;
        case 805:
          id v22 = @"SIRI_PLACE_SNIPPET";
          break;
        default:
          if (v14 != 901) {
            goto LABEL_1354;
          }
          id v22 = @"CHROME";
          break;
      }
    }
    *(_DWORD *)long long buf = 138413058;
    v60 = v21;
    __int16 v61 = 2112;
    v62 = v22;
    __int16 v63 = 2112;
    id v64 = v17;
    __int16 v65 = 2112;
    id v66 = v18;
    _os_log_impl(&dword_1931EA000, v19, OS_LOG_TYPE_DEBUG, "Creating an action %@ with target %@ with value %@ and module metadata %@", buf, 0x2Au);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  v24 = [WeakRetained generateAvailableActionForAnalytics];

  id v25 = objc_loadWeakRetained((id *)&self->_provider);
  v26 = [v25 generateUnactionableUIElementsForAnalytics];

  v27 = [(MUPlaceCardAnalyticsController *)self placeItem];
  v28 = [v27 mapItem];

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v30 = objc_loadWeakRetained((id *)&self->_provider);
  LODWORD(v27) = [v30 getPlaceCardTypeForAnalytics];

  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke;
  block[3] = &unk_1E574EED0;
  int v56 = v15;
  int v57 = v14;
  id v46 = v17;
  id v47 = v28;
  CFAbsoluteTime v55 = Current;
  id v48 = v44;
  id v49 = v43;
  int v58 = (int)v27;
  id v50 = v24;
  id v51 = v26;
  id v52 = v18;
  id v53 = v41;
  id v54 = v39;
  id v40 = v39;
  id v42 = v41;
  id v32 = v18;
  id v33 = v26;
  id v34 = v24;
  id v35 = v43;
  id v36 = v44;
  id v37 = v28;
  id v38 = v17;
  dispatch_async(analyticsQueue, block);
}

void __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke(uint64_t a1)
{
  v23 = [MEMORY[0x1E4F30F28] sharedService];
  unsigned int v21 = *(_DWORD *)(a1 + 116);
  unsigned int v22 = *(_DWORD *)(a1 + 112);
  v2 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  double v3 = *(double *)(a1 + 104);
  uint64_t v19 = [v2 _muid];
  uint64_t v4 = [*(id *)(a1 + 40) _vendorID];
  int v16 = *(_DWORD *)(a1 + 120);
  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 40) _firstLocalizedCategoryName];
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  id v9 = *(id *)(a1 + 40);
  id v10 = [v9 _allPhotoAttributions];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    id v12 = [v9 _allPhotoAttributions];
    uint64_t v13 = MUMap(v12, &__block_literal_global_5541);
  }
  else
  {
    uint64_t v13 = 0;
  }

  LODWORD(v15) = v16;
  objc_msgSend(v23, "capturePlaceCardUserAction:onTarget:eventValue:mapItem:timestamp:resultIndex:targetID:providerID:animationID:actionURL:photoID:placeCardType:localizedMapItemCategory:availableActions:unactionableUIElements:modules:commingledPhotoProviderIDs:actionRichProviderId:", v22, v21, v20, v2, 0xFFFFFFFFLL, v19, v3, v4, 0, v17, v18, v15, v5, v6, v7,
    v8,
    v13,
    *(void *)(a1 + 88));

  uint64_t v14 = *(void **)(a1 + 96);
  if (v14)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke_2;
    block[3] = &unk_1E574EEA8;
    id v25 = v14;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __169__MUPlaceCardAnalyticsController__infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_feedbackDelegateSelector_modules_actionRichProviderId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  [(MUPlaceCardAnalyticsController *)self _requestHostToLogFeedbackTypeIfNeeded:a10];
  uint64_t v18 = [(MUPlaceCardAnalyticsController *)self placeItem];
  uint64_t v19 = [v18 mapItem];

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  int v22 = [WeakRetained defaultTargetForPlaceCardAnalytics];

  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __198__MUPlaceCardAnalyticsController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke;
  block[3] = &unk_1E574EEF8;
  int v37 = a3;
  int v38 = v22;
  CFAbsoluteTime v34 = Current;
  int64_t v35 = a4;
  unint64_t v36 = a5;
  int v39 = a8;
  id v30 = v19;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v19;
  dispatch_async(analyticsQueue, block);
}

void __198__MUPlaceCardAnalyticsController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke(uint64_t a1)
{
  id v10 = [MEMORY[0x1E4F30F28] sharedService];
  uint64_t v2 = *(unsigned int *)(a1 + 88);
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  uint64_t v4 = *(void **)(a1 + 32);
  double v5 = *(double *)(a1 + 64);
  uint64_t v6 = *(unsigned int *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 80);
  uint64_t v8 = [v4 _vendorID];
  LODWORD(v9) = *(_DWORD *)(a1 + 96);
  [v10 captureTransitPlaceCardUserAction:v2 onTarget:v3 eventValue:0 mapItem:v4 timestamp:v6 resultIndex:v7 targetID:v5 providerID:v8 animationID:-1 transitCardCategory:v9 transitSystem:*(void *)(a1 + 40) transitDepartureSequence:*(void *)(a1 + 48) transitIncident:*(void *)(a1 + 56)];
}

- (void)_requestHostToLogFeedbackTypeIfNeeded:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    double v5 = MUGetPlaceCardAnalyticsUILog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_DEBUG, "Invoking the delegate and placecard type is %d", (uint8_t *)v7, 8u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
    [WeakRetained requestHostToLogFeedbackTypeIfNeeded:v3];
  }
}

- (void)instrumentAction:(int)a3 forModuleType:(int64_t)a4 usingFeedbackType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](self, "instrumentAction:target:eventValue:moduleType:feedbackType:", v7, [WeakRetained defaultTargetForPlaceCardAnalytics], 0, a4, v5);
}

- (void)instrumentAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleType:(int64_t)a6 feedbackType:(int)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  uint64_t v13 = [(MUPlaceCardAnalyticsController *)self analyticModules];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__MUPlaceCardAnalyticsController_instrumentAction_target_eventValue_moduleType_feedbackType___block_invoke;
  v16[3] = &__block_descriptor_40_e37_B32__0__GEOAPPlaceCardModule_8Q16_B24l;
  v16[4] = a6;
  uint64_t v14 = MUFindFirst(v13, v16);

  LODWORD(v15) = a7;
  [(MUPlaceCardAnalyticsController *)self infoCardAnalyticsDidSelectAction:v10 target:v9 eventValue:v12 actionURL:0 photoID:0 moduleMetadata:v14 feedbackDelegateSelector:v15 actionRichProviderId:0];
}

BOOL __93__MUPlaceCardAnalyticsController_instrumentAction_target_eventValue_moduleType_feedbackType___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void *)(a1 + 32) - 1;
  if (v2 > 5) {
    int v3 = 0;
  }
  else {
    int v3 = dword_19335B6E0[v2];
  }
  return v3 == [a2 type];
}

- (void)setDisableDeferLoggingUntilRefinement
{
  self->_BOOL deferLoggingRevealUntilRefinement = 1;
}

- (void)disableDeferLoggingUntilRefinementWithShouldInvokeReveal:(BOOL)a3
{
  self->_BOOL deferLoggingRevealUntilRefinement = 0;
  if (a3)
  {
    uint64_t v4 = (void *)[(NSUUID *)self->_cachedSessionId copy];
    [(MUPlaceCardAnalyticsController *)self instrumentRevealIfNeededWithImpressionsSessionId:v4];
  }
  cachedSessionId = self->_cachedSessionId;
  self->_cachedSessionId = 0;
}

- (BOOL)deferLoggingRevealUntilRefinement
{
  return self->_deferLoggingRevealUntilRefinement;
}

- (MUPlaceCardAnalyticsProvider)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (MUPlaceCardAnalyticsProvider *)WeakRetained;
}

- (GEOLogContextDelegate)logContextDelegate
{
  return self->_logContextDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logContextDelegate, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_cachedSessionId, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end