@interface MUPlaceUnifiedActionRowSectionController
- (BOOL)hasContent;
- (BOOL)isImpressionable;
- (MUFeatureDiscoveryAnnotationView)offlineFeatureDiscoveryView;
- (MUOfflineMapProvider)offlineMapProvider;
- (MUPlaceUnifiedActionRowLayoutBuilder)layoutBuilder;
- (MUPlaceUnifiedActionRowSectionController)initWithMapItem:(id)a3 configuration:(id)a4;
- (MUPlaceUnifiedActionRowSectionControllerConfiguration)configuration;
- (MUPlaceUnifiedActionRowSectionControllerDelegate)actionDelegate;
- (_MKPlaceActionButtonController)secondaryActionButtonController;
- (id)analyticsModule;
- (id)menuElementForActionItem:(id)a3;
- (id)menuForActionItem:(id)a3;
- (id)sectionView;
- (int)analyticsModuleType;
- (void)_buildButtonLayout;
- (void)_createSectionView;
- (void)_populateRevealedAnalyticsModule:(id)a3;
- (void)_updateActions:(id)a3;
- (void)_updateHasContent;
- (void)actionsRowView:(id)a3 didPresentMenuForViewModel:(id)a4;
- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5;
- (void)setActionDelegate:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setLayoutBuilder:(id)a3;
- (void)setOfflineFeatureDiscoveryView:(id)a3;
- (void)setOfflineMapProvider:(id)a3;
- (void)setSecondaryActionButtonController:(id)a3;
@end

@implementation MUPlaceUnifiedActionRowSectionController

- (MUPlaceUnifiedActionRowSectionController)initWithMapItem:(id)a3 configuration:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MUPlaceUnifiedActionRowSectionController;
  v8 = [(MUPlaceSectionController *)&v15 initWithMapItem:a3];
  if (v8)
  {
    v9 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", "", v14, 2u);
    }

    objc_storeStrong((id *)&v8->_configuration, a4);
    v10 = [[MUPlaceUnifiedActionRowLayoutBuilder alloc] initWithConfiguration:v8->_configuration delegate:v8];
    layoutBuilder = v8->_layoutBuilder;
    v8->_layoutBuilder = v10;

    [(MUPlaceUnifiedActionRowSectionController *)v8 _buildButtonLayout];
    [(MUPlaceUnifiedActionRowSectionController *)v8 _createSectionView];
    v12 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)v14 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MUPlaceActionRowSectionControllerInit", "", v14, 2u);
    }
  }
  return v8;
}

- (void)_createSectionView
{
  id v12 = +[MUGroupedActionsRowViewConfiguration defaultConfiguration];
  objc_msgSend(v12, "setUseVibrancy:", +[MUInfoCardStyle hasExternallyProvidedTintColor](MUInfoCardStyle, "hasExternallyProvidedTintColor"));
  v3 = [[MUGroupedActionsRowView alloc] initWithConfiguration:v12];
  actionsRowView = self->_actionsRowView;
  self->_actionsRowView = v3;

  [(MUGroupedActionsRowView *)self->_actionsRowView setPreservesSuperviewLayoutMargins:0];
  -[MUGroupedActionsRowView setLayoutMargins:](self->_actionsRowView, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [(MUGroupedActionsRowView *)self->_actionsRowView setDelegate:self];
  [(MUPlaceUnifiedActionRowSectionController *)self _buildButtonLayout];
  v5 = [[MUPlaceSectionView alloc] initWithStyle:1 alwaysHideSeparators:1];
  sectionView = self->_sectionView;
  self->_sectionView = v5;

  [(MUPlaceSectionView *)self->_sectionView configureWithSectionController:self];
  [(MUPlaceSectionView *)self->_sectionView attachViewToContentView:self->_actionsRowView];
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 bundleIdentifier];
  char v9 = [v8 isEqualToString:*MEMORY[0x1E4F64320]];

  if ((v9 & 1) == 0)
  {
    v10 = +[MUPlaceholderGridCache unretainedInstance];
    placeholderGridCache = self->_placeholderGridCache;
    self->_placeholderGridCache = v10;

    [(MUPlaceholderGridCache *)self->_placeholderGridCache loadPlaceholderGridImages];
  }
}

- (id)menuForActionItem:(id)a3
{
  v3 = [(MUPlaceUnifiedActionRowSectionController *)self menuElementForActionItem:a3];
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
  id v4 = a3;
  v5 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
  v6 = [v5 actionRowMenuProvider];
  id v7 = [v6 menuElementForActionItem:v4];

  return v7;
}

- (id)sectionView
{
  return self->_sectionView;
}

- (BOOL)hasContent
{
  return self->_hasContent;
}

- (void)_updateHasContent
{
  BOOL v3 = [(MUGroupedActionsRowView *)self->_actionsRowView hasContent];
  if (self->_hasContent != v3)
  {
    self->_hasContent = v3;
    id v4 = [(MUPlaceSectionController *)self delegate];
    [v4 placeSectionControllerDidUpdateContent:self];
  }
}

- (id)analyticsModule
{
  v2 = (void *)MEMORY[0x1E4F643A8];
  uint64_t v3 = [(MUPlaceUnifiedActionRowSectionController *)self analyticsModuleType];
  return (id)[v2 moduleFromModuleType:v3];
}

- (int)analyticsModuleType
{
  return 39;
}

- (void)_populateRevealedAnalyticsModule:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F64978]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = self->_actionItemViewModels;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v22 + 1) + 8 * v11) analyticsButtonValues];
        objc_msgSend(v6, "_mapsui_addObjectsFromArrayIfNotNil:", v12);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v5, "addButtons:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }

  if ([v13 count]) {
    [v4 setUnifiedActionRow:v5];
  }
}

- (BOOL)isImpressionable
{
  return 1;
}

- (void)actionsRowView:(id)a3 didSelectViewModel:(id)a4 presentationOptions:(id)a5
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [(MUPlaceUnifiedActionRowSectionController *)self analyticsModule];
    v30[0] = *MEMORY[0x1E4F30DC8];
    uint64_t v10 = [v8 sourceView];
    uint64_t v11 = *MEMORY[0x1E4F30DC0];
    v31[0] = v10;
    v31[1] = v9;
    uint64_t v12 = *MEMORY[0x1E4F30DB8];
    v30[1] = v11;
    v30[2] = v12;
    v31[2] = MEMORY[0x1E4F1CC28];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

    uint64_t v14 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
    uint64_t v15 = [v14 actionManager];
    uint64_t v16 = [v7 actionRowItem];
    uint64_t v17 = [v16 resolvedActionItem];
    [v15 performAction:v17 options:v13 completion:0];

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = [(MUPlaceUnifiedActionRowSectionController *)self actionDelegate];
    long long v18 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
    objc_msgSend(v9, "sectionController:didSelectPrimaryButtonType:", self, objc_msgSend(v18, "primaryButtonType"));
LABEL_6:

    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v7;
    uint64_t v9 = [(MUPlaceUnifiedActionRowSectionController *)self analyticsModule];
    v28[0] = *MEMORY[0x1E4F30DC8];
    long long v20 = [v8 sourceView];
    uint64_t v21 = *MEMORY[0x1E4F30DC0];
    v29[0] = v20;
    v29[1] = v9;
    uint64_t v22 = *MEMORY[0x1E4F30DB8];
    v28[1] = v21;
    v28[2] = v22;
    v29[2] = MEMORY[0x1E4F1CC28];
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

    long long v23 = (void *)MEMORY[0x1E4F30F98];
    uint64_t v24 = [v19 actionItemType];

    long long v25 = [v23 actionItemWithType:v24];
    v26 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
    v27 = [v26 actionManager];
    [v27 performAction:v25 options:v18 completion:0];

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 performSingleVendorSelectionAction];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 performWithPresentationOptions:v8];
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v9 = [(MUPlaceUnifiedActionRowSectionController *)self actionDelegate];
  [v9 sectionControllerDidSelectViewContactButton:self];
LABEL_7:

LABEL_8:
}

- (void)actionsRowView:(id)a3 didPresentMenuForViewModel:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v6 externalActionMenuRevealButtons];
    [(MUPlaceSectionController *)self captureInfoCardPartnerAction:209 eventValue:0 sharedStateButtonList:v5];
  }
}

- (void)_buildButtonLayout
{
  uint64_t v3 = [(MUPlaceUnifiedActionRowSectionController *)self layoutBuilder];
  id v4 = [v3 buildButtonLayout];

  [(MUPlaceUnifiedActionRowSectionController *)self _updateActions:v4];
}

- (void)setSecondaryActionButtonController:(id)a3
{
  id v10 = a3;
  id v4 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
  id v5 = [v4 secondaryActionButtonController];

  id v6 = v10;
  if (v5 != v10)
  {
    id v7 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
    [v7 setSecondaryActionButtonController:v10];

    id v8 = [(MUPlaceUnifiedActionRowSectionController *)self configuration];
    uint64_t v9 = [v8 buttonModuleConfiguration];

    id v6 = v10;
    if (!v9)
    {
      [(MUPlaceUnifiedActionRowSectionController *)self _buildButtonLayout];
      id v6 = v10;
    }
  }
}

- (_MKPlaceActionButtonController)secondaryActionButtonController
{
  return [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)self->_configuration secondaryActionButtonController];
}

- (void)setOfflineMapProvider:(id)a3
{
  objc_storeWeak((id *)&self->_offlineMapProvider, a3);
  [(MUPlaceUnifiedActionRowSectionController *)self _buildButtonLayout];
}

- (void)setOfflineFeatureDiscoveryView:(id)a3
{
  id v5 = (MUFeatureDiscoveryAnnotationView *)a3;
  p_offlineFeatureDiscoveryView = &self->_offlineFeatureDiscoveryView;
  if (self->_offlineFeatureDiscoveryView != v5)
  {
    uint64_t v9 = v5;
    objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, a3);
    id v7 = [(MUPlaceUnifiedActionRowSectionController *)self layoutBuilder];
    id v8 = [v7 downloadOfflineViewModel];

    [v8 setFeatureDiscoveryView:*p_offlineFeatureDiscoveryView];
    id v5 = v9;
  }
}

- (void)_updateActions:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_actionItemViewModels = &self->_actionItemViewModels;
  if (([(NSArray *)self->_actionItemViewModels isEqual:v5] & 1) == 0)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = *p_actionItemViewModels;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * v11++) removeObserver:self];
        }
        while (v9 != v11);
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v9);
    }

    objc_storeStrong((id *)&self->_actionItemViewModels, a3);
    [(MUGroupedActionsRowView *)self->_actionsRowView setViewModels:v5];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = *p_actionItemViewModels;
    uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v16++), "addObserver:", self, (void)v17);
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v14);
    }

    [(MUPlaceUnifiedActionRowSectionController *)self _updateHasContent];
  }
}

- (MUPlaceUnifiedActionRowSectionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (MUPlaceUnifiedActionRowSectionControllerDelegate *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (MUOfflineMapProvider)offlineMapProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  return (MUOfflineMapProvider *)WeakRetained;
}

- (MUFeatureDiscoveryAnnotationView)offlineFeatureDiscoveryView
{
  return self->_offlineFeatureDiscoveryView;
}

- (MUPlaceUnifiedActionRowSectionControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (MUPlaceUnifiedActionRowLayoutBuilder)layoutBuilder
{
  return self->_layoutBuilder;
}

- (void)setLayoutBuilder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutBuilder, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, 0);
  objc_destroyWeak((id *)&self->_offlineMapProvider);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_actionItemViewModels, 0);
  objc_storeStrong((id *)&self->_placeholderGridCache, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
  objc_storeStrong((id *)&self->_actionsRowView, 0);
}

@end