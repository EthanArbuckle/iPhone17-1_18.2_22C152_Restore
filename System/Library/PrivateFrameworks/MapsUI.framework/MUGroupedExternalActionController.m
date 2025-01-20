@interface MUGroupedExternalActionController
- (BOOL)hasMultipleVendorsForAnalytics;
- (BOOL)supportsMultipleVendorSelection;
- (GEOPlaceExternalAction)externalAction;
- (MUGroupedExternalActionController)initWithGroupedExternalAction:(id)a3 amsResultProvider:(id)a4 supportsMultipleVendorSelection:(BOOL)a5 actionHandler:(id)a6 analyticsHandler:(id)a7;
- (id)_viewModelsWithSortApplied;
- (int)multipleVendorAnalyticsTarget;
- (int)resolvedAnalyticsTarget;
- (int)singleVendorAnalyticsTarget;
- (int64_t)analyticsModuleType;
- (int64_t)source;
- (void)_executeBestIntegrationForProvider:(id)a3 index:(unint64_t)a4;
- (void)_openMapsExtensionUsingExtensionParams:(id)a3 handlingOptions:(id)a4;
- (void)captureGroupedMenuRevealAnalyticsIfNeededWithIsQuickAction:(BOOL)a3;
- (void)fetchProviderLockupsWithCompletion:(id)a3;
- (void)openFirstPartnerAction;
- (void)openPartnerActionUsingViewModel:(id)a3;
- (void)setAnalyticsModuleType:(int64_t)a3;
- (void)setMultipleVendorAnalyticsTarget:(int)a3;
- (void)setSingleVendorAnalyticsTarget:(int)a3;
- (void)setSource:(int64_t)a3;
@end

@implementation MUGroupedExternalActionController

- (MUGroupedExternalActionController)initWithGroupedExternalAction:(id)a3 amsResultProvider:(id)a4 supportsMultipleVendorSelection:(BOOL)a5 actionHandler:(id)a6 analyticsHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MUGroupedExternalActionController;
  v17 = [(MUGroupedExternalActionController *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_externalAction, a3);
    objc_storeWeak((id *)&v18->_actionHandler, v15);
    objc_storeWeak((id *)&v18->_analyticsHandler, v16);
    objc_storeStrong((id *)&v18->_amsResultProvider, a4);
    v18->_supportsMultipleVendorSelection = a5;
  }

  return v18;
}

- (void)fetchProviderLockupsWithCompletion:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  if ([(NSArray *)self->_viewModels count])
  {
    v5 = [(MUGroupedExternalActionController *)self _viewModelsWithSortApplied];
    v4[2](v4, v5, 0);
  }
  else
  {
    v64 = v4;
    v6 = [MEMORY[0x1E4F31038] sharedInstance];
    [v6 screenScale];
    double v8 = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v69 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v68 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v65 = self;
    v66 = -[MUAMSResultProviderFetchOptions initWithDisplayScale:artworkSize:source:]([MUAMSResultProviderFetchOptions alloc], "initWithDisplayScale:artworkSize:source:", [(MUGroupedExternalActionController *)self source], v8, 40.0, 40.0);
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v10 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v103 objects:v108 count:16];
    id v67 = v9;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v104;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v104 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v103 + 1) + 8 * i);
          id v16 = [v15 supportedIntegrations];
          v17 = [v16 firstObject];

          if (v17) {
            [v9 addObject:v17];
          }
          v18 = [v15 appAdamId];
          switch([v17 type])
          {
            case 1u:
              v19 = [v17 appClipRepresentedAsQuickLink];
              [v73 addObject:v19];
              objc_super v20 = [v19 URLString];
              [v72 setObject:v18 forKey:v20];

              v21 = [v15 identifier];
              v22 = v71;
              v23 = v21;
              v24 = v18;
              goto LABEL_16;
            case 2u:
              v19 = [v15 identifier];
              v25 = v70;
              goto LABEL_14;
            case 3u:
              v26 = [v17 siriExtensionParams];
              v27 = [v17 attributionAppForMapsExtension];
              v28 = [v27 appBundleIdentifier];
              [v69 setObject:v26 forKey:v28];

              id v9 = v67;
              v19 = [v15 identifier];
              v25 = v68;
LABEL_14:
              [v25 setObject:v19 forKey:v18];
              goto LABEL_17;
            case 4u:
              v19 = [v17 webLinkParams];
              v21 = [v15 identifier];
              v22 = v76;
              v23 = v19;
              v24 = v21;
LABEL_16:
              [v22 setObject:v23 forKey:v24];

LABEL_17:
              break;
            default:
              break;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v103 objects:v108 count:16];
      }
      while (v12);
    }

    v29 = v65;
    v30 = [(GEOPlaceExternalAction *)v65->_externalAction actionName];
    v31 = dispatch_group_create();
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v76 count])
    {
      v75 = v32;
      v33 = v30;
      group = v31;
      dispatch_group_enter(v31);
      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      obuint64_t j = [v76 allKeys];
      uint64_t v34 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v100;
        do
        {
          for (uint64_t j = 0; j != v35; ++j)
          {
            if (*(void *)v100 != v36) {
              objc_enumerationMutation(obj);
            }
            uint64_t v38 = *(void *)(*((void *)&v99 + 1) + 8 * j);
            v39 = [v76 objectForKeyedSubscript:v38];
            v40 = [v39 icon];
            v41 = [MEMORY[0x1E4F646D0] defaultPhotoOptionsWithAllowSmaller:1];
            v42 = objc_msgSend(v40, "bestPhotoForFrameSize:displayScale:options:", v41, 40.0, 40.0, v8);
            v43 = [v42 url];

            v44 = [MUVendorLinkViewModel alloc];
            v45 = [v39 displayName];
            v46 = [v39 displayName];
            v47 = [(MUVendorLinkViewModel *)v44 initWithPartnerId:v38 linkType:4 artworkURL:v43 providerName:v45 appAdamId:0 appShortName:v46 actionName:v33 fallbackSymbolName:@"safari"];

            [v75 addObject:v47];
          }
          uint64_t v35 = [obj countByEnumeratingWithState:&v99 objects:v107 count:16];
        }
        while (v35);
      }

      v31 = group;
      dispatch_group_leave(group);
      id v9 = v67;
      v29 = v65;
      v30 = v33;
      id v32 = v75;
    }
    if ([v73 count])
    {
      dispatch_group_enter(v31);
      v48 = [MEMORY[0x1E4F30E60] sharedInstance];
      v49 = (void *)[v73 copy];
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke;
      v93[3] = &unk_1E574FEA0;
      id v94 = v72;
      id v95 = v71;
      id v96 = v30;
      id v97 = v32;
      v98 = v31;
      [v48 appClipsFromQuickLinks:v49 completion:v93];
    }
    v50 = v70;
    v4 = v64;
    v51 = v69;
    if ([v70 count])
    {
      dispatch_group_enter(v31);
      amsResultProvider = v29->_amsResultProvider;
      v53 = [v70 allKeys];
      v88[0] = MEMORY[0x1E4F143A8];
      v88[1] = 3221225472;
      v88[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_3;
      v88[3] = &unk_1E574FEC8;
      id v89 = v70;
      id v90 = v30;
      id v91 = v32;
      v92 = v31;
      [(MUAMSResultProvider *)amsResultProvider fetchResultsForAdamIds:v53 options:v66 callbackQueue:MEMORY[0x1E4F14428] completion:v88];
    }
    v54 = (void *)&property descriptor for EVChargingSectionController.delegate;
    if ([v69 count])
    {
      dispatch_group_enter(v31);
      v55 = [MUPlaceExtensionDiscoveryManager alloc];
      v56 = [v69 allValues];
      v57 = [v56 reverseObjectEnumerator];
      v58 = [v57 allObjects];
      uint64_t v59 = [(MUPlaceExtensionDiscoveryManager *)v55 initWithExtensionDataItems:v58 amsResultProvider:v29->_amsResultProvider];
      extensionDiscoveryManager = v29->_extensionDiscoveryManager;
      v29->_extensionDiscoveryManager = (MUPlaceExtensionDiscoveryManager *)v59;

      v51 = v69;
      v50 = v70;

      v54 = &property descriptor for EVChargingSectionController.delegate;
      v61 = v29->_extensionDiscoveryManager;
      v83[0] = MEMORY[0x1E4F143A8];
      v83[1] = 3221225472;
      v83[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_4;
      v83[3] = &unk_1E574FEC8;
      id v84 = v68;
      id v85 = v30;
      id v86 = v32;
      v87 = v31;
      [(MUPlaceExtensionDiscoveryManager *)v61 performExtensionDiscoveryWithOptions:v66 callbackQueue:MEMORY[0x1E4F14428] completion:v83];
    }
    objc_initWeak(&location, v29);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = v54[183];
    block[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_5;
    block[3] = &unk_1E574FEF0;
    objc_copyWeak(&v81, &location);
    id v78 = v32;
    v79 = v29;
    v80 = v64;
    id v62 = v32;
    dispatch_group_notify(v31, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v81);
    objc_destroyWeak(&location);
  }
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_2;
  v5[3] = &unk_1E574FE78;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v9 = a1[6];
  id v10 = a1[7];
  id v11 = a1[8];
  id v4 = v3;
  +[MapsUIUtilities performOnMainIfNecessary:v5];
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v16 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v18 != v16) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v6 = [v5 appClipURL];
        id v7 = [v6 absoluteString];

        id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
        id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:v8];
        id v10 = [MUVendorLinkViewModel alloc];
        id v11 = [v5 artworkURL];
        uint64_t v12 = [v5 provider];
        uint64_t v13 = [v5 appShortName];
        id v14 = [(MUVendorLinkViewModel *)v10 initWithPartnerId:v9 linkType:1 artworkURL:v11 providerName:v12 appAdamId:v8 appShortName:v13 actionName:*(void *)(a1 + 56) fallbackSymbolName:0];

        [*(id *)(a1 + 64) addObject:v14];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v3);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v8 = [v7 identifier];
        id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v8];
        id v10 = [MUVendorLinkViewModel alloc];
        id v11 = [v7 artworkURL];
        uint64_t v12 = [v7 artistName];
        uint64_t v13 = [v7 shortName];
        id v14 = [(MUVendorLinkViewModel *)v10 initWithPartnerId:v9 linkType:2 artworkURL:v11 providerName:v12 appAdamId:v8 appShortName:v13 actionName:*(void *)(a1 + 40) fallbackSymbolName:0];

        [*(id *)(a1 + 48) addObject:v14];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v4);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = a2;
  uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v17)
  {
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v4 = [v3 appStoreApp];
        uint64_t v5 = [v4 identifier];

        id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
        id v7 = [MUVendorLinkViewModel alloc];
        long long v18 = [v3 appStoreApp];
        id v8 = [v18 artworkURL];
        id v9 = [v3 appStoreApp];
        id v10 = [v9 artistName];
        id v11 = [v3 appStoreApp];
        uint64_t v12 = [v11 shortName];
        uint64_t v13 = [(MUVendorLinkViewModel *)v7 initWithPartnerId:v6 linkType:3 artworkURL:v8 providerName:v10 appAdamId:v5 appShortName:v12 actionName:*(void *)(a1 + 40) fallbackSymbolName:0];

        [*(id *)(a1 + 48) addObject:v13];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v17);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __72__MUGroupedExternalActionController_fetchProviderLockupsWithCompletion___block_invoke_5(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) copy];
    uint64_t v3 = (void *)WeakRetained[3];
    WeakRetained[3] = v2;

    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = [*(id *)(a1 + 40) _viewModelsWithSortApplied];
    (*(void (**)(uint64_t, void *, void))(v4 + 16))(v4, v5, 0);
  }
}

- (void)openPartnerActionUsingViewModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    externalAction = self->_externalAction;
    id v7 = [v4 partnerId];
    id v8 = [(GEOPlaceExternalAction *)externalAction partnerActionForPartnerId:v7];

    if (v8)
    {
      [(MUGroupedExternalActionController *)self _executeBestIntegrationForProvider:v8 index:0];
    }
    else
    {
      id v9 = MUGetMUGroupedExternalActionControllerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v5 uniqueIdentifier];
        id v11 = [v5 appAdamId];
        int v12 = 138412546;
        uint64_t v13 = v10;
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_impl(&dword_1931EA000, v9, OS_LOG_TYPE_ERROR, "Unable to find a matching provider for a view model with identifier %@ and adam id %@.  Early return", (uint8_t *)&v12, 0x16u);
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = MUGetMUGroupedExternalActionControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_ERROR, "Attempting to open a nil view model.  Early return", (uint8_t *)&v12, 2u);
    }
  }
}

- (void)openFirstPartnerAction
{
  uint64_t v3 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    id v8 = MUGetMUGroupedExternalActionControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = 0;
      id v9 = "No action providers.  Early return";
      id v10 = (uint8_t *)&v15;
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
LABEL_13:
      _os_log_impl(&dword_1931EA000, v11, v12, v9, v10, 2u);
    }
LABEL_14:

    return;
  }
  uint64_t v5 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
  uint64_t v6 = [v5 count];

  if (v6 != 1)
  {
    if ([(NSArray *)self->_viewModels count])
    {
      id v13 = [(MUGroupedExternalActionController *)self _viewModelsWithSortApplied];
      id v7 = [v13 firstObject];
      [(MUGroupedExternalActionController *)self openPartnerActionUsingViewModel:v7];
      goto LABEL_8;
    }
    id v8 = MUGetMUGroupedExternalActionControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      id v9 = "No refined view models.  Early return";
      id v10 = buf;
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v13 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
  id v7 = [v13 firstObject];
  [(MUGroupedExternalActionController *)self _executeBestIntegrationForProvider:v7 index:0];
LABEL_8:
}

- (void)_executeBestIntegrationForProvider:(id)a3 index:(unint64_t)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 supportedIntegrations];
  unint64_t v8 = [v7 count];

  if (v8 <= a4) {
    goto LABEL_24;
  }
  id v9 = [v6 supportedIntegrations];
  id v10 = [v9 objectAtIndex:a4];

  int v11 = [v10 type];
  BOOL v12 = [(MUGroupedExternalActionController *)self hasMultipleVendorsForAnalytics];
  if ((v11 - 1) < 2) {
    goto LABEL_5;
  }
  if (v11 == 3)
  {
    BOOL v13 = !v12;
    int v14 = 6036;
    int v15 = 318;
    goto LABEL_7;
  }
  if (v11 == 4)
  {
LABEL_5:
    BOOL v13 = !v12;
    int v14 = 6074;
    int v15 = 283;
LABEL_7:
    if (!v13) {
      int v14 = v15;
    }
    unsigned int v48 = v14;
    goto LABEL_10;
  }
  unsigned int v48 = 0;
LABEL_10:
  uint64_t v16 = [(MUGroupedExternalActionController *)self resolvedAnalyticsTarget];
  id v17 = objc_alloc_init(MEMORY[0x1E4F64950]);
  long long v18 = [(GEOPlaceExternalAction *)self->_externalAction categoryId];
  [v17 setMetadata:v18];

  long long v19 = [v6 appAdamId];
  [v17 setVendor:v19];

  unsigned int v20 = [v10 type] - 1;
  if (v20 > 3) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = dword_19335B740[v20];
  }
  [v17 setLinkType:v21];
  objc_msgSend(v17, "setIsGroup:", -[MUGroupedExternalActionController hasMultipleVendorsForAnalytics](self, "hasMultipleVendorsForAnalytics"));
  v58[0] = v17;
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  v23 = objc_alloc_init(MUExternalActionHandlingOptions);
  [(MUExternalActionHandlingOptions *)v23 setAnalyticsTarget:[(MUGroupedExternalActionController *)self resolvedAnalyticsTarget]];
  switch([v10 type])
  {
    case 1u:
      uint64_t v24 = [v10 appClipRepresentedAsQuickLink];
      v25 = [v24 URLString];
      [(MUExternalActionHandlingOptions *)v23 setAnalyticsEventValue:v25];

      objc_initWeak(location, self);
      v26 = [MEMORY[0x1E4F30E60] sharedInstance];
      v27 = [v10 appClipRepresentedAsQuickLink];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __78__MUGroupedExternalActionController__executeBestIntegrationForProvider_index___block_invoke;
      v49[3] = &unk_1E574FF18;
      objc_copyWeak(v54, location);
      id v50 = v10;
      id v51 = v6;
      v54[1] = (id)a4;
      unsigned int v55 = v48;
      int v56 = v16;
      v52 = v23;
      id v53 = v22;
      [v26 appClipWithQuickLink:v27 completion:v49];

      objc_destroyWeak(v54);
      objc_destroyWeak(location);
      break;
    case 2u:
      v28 = [v10 quickLink];
      v29 = [v28 URLString];
      [(MUExternalActionHandlingOptions *)v23 setAnalyticsEventValue:v29];

      v30 = MUGetMUGroupedExternalActionControllerLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = [v10 quickLink];
        id v32 = [v31 URLString];
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v32;
        _os_log_impl(&dword_1931EA000, v30, OS_LOG_TYPE_INFO, "Opening quick link with url %@", (uint8_t *)location, 0xCu);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsHandler);
      uint64_t v34 = [(MUExternalActionHandlingOptions *)v23 analyticsEventValue];
      [WeakRetained instrumentExternalActionUsingAnalyticsAction:v48 target:v16 eventValue:v34 sharedStateButtonList:v22];

      id v35 = objc_loadWeakRetained((id *)&self->_actionHandler);
      uint64_t v36 = [v10 quickLink];
      [v35 handleQuickLink:v36 options:v23];

      break;
    case 3u:
      id v37 = objc_loadWeakRetained((id *)&self->_analyticsHandler);
      [v37 instrumentExternalActionUsingAnalyticsAction:v48 target:v16 eventValue:0 sharedStateButtonList:v22];

      uint64_t v38 = [v10 siriExtensionParams];
      [(MUGroupedExternalActionController *)self _openMapsExtensionUsingExtensionParams:v38 handlingOptions:v23];

      break;
    case 4u:
      v39 = [v10 webLinkParams];
      v40 = [v39 url];

      v41 = [v40 absoluteString];
      [(MUExternalActionHandlingOptions *)v23 setAnalyticsEventValue:v41];

      v42 = MUGetMUGroupedExternalActionControllerLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        v43 = [v40 absoluteString];
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v43;
        _os_log_impl(&dword_1931EA000, v42, OS_LOG_TYPE_INFO, "Opening flexible action link with url %@", (uint8_t *)location, 0xCu);
      }
      id v44 = objc_loadWeakRetained((id *)&self->_analyticsHandler);
      v45 = [(MUExternalActionHandlingOptions *)v23 analyticsEventValue];
      [v44 instrumentExternalActionUsingAnalyticsAction:v48 target:v16 eventValue:v45 sharedStateButtonList:v22];

      v46 = [v10 webLinkParams];
      -[MUExternalActionHandlingOptions setForcePunchout:](v23, "setForcePunchout:", [v46 supportsEmbeddedWebBrowser] ^ 1);

      id v47 = objc_loadWeakRetained((id *)&self->_actionHandler);
      [v47 handleWebLink:v40 options:v23];

      break;
    default:
      break;
  }

LABEL_24:
}

void __78__MUGroupedExternalActionController__executeBestIntegrationForProvider_index___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v5 = MUGetMUGroupedExternalActionControllerLog();
    id v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 32) appClipRepresentedAsQuickLink];
        unint64_t v8 = [v7 URLString];
        id v9 = [*(id *)(a1 + 32) appClipRepresentedAsQuickLink];
        id v10 = [v9 bundleID];
        int v20 = 138412546;
        uint64_t v21 = v8;
        __int16 v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_INFO, "Opening app clip with url %@ bundle identifier %@", (uint8_t *)&v20, 0x16u);
      }
      id v11 = objc_loadWeakRetained(WeakRetained + 2);
      uint64_t v12 = *(unsigned int *)(a1 + 80);
      uint64_t v13 = *(unsigned int *)(a1 + 84);
      int v14 = [*(id *)(a1 + 48) analyticsEventValue];
      [v11 instrumentExternalActionUsingAnalyticsAction:v12 target:v13 eventValue:v14 sharedStateButtonList:*(void *)(a1 + 56)];

      id v15 = objc_loadWeakRetained(WeakRetained + 1);
      [v15 handleAppClip:v3 options:*(void *)(a1 + 48)];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [*(id *)(a1 + 32) appClipRepresentedAsQuickLink];
        id v17 = [v16 URLString];
        long long v18 = [*(id *)(a1 + 32) appClipRepresentedAsQuickLink];
        long long v19 = [v18 bundleID];
        int v20 = 138412546;
        uint64_t v21 = v17;
        __int16 v22 = 2112;
        v23 = v19;
        _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_ERROR, "Failed to open app clip with url %@ bundle identifier %@", (uint8_t *)&v20, 0x16u);
      }
      [WeakRetained _executeBestIntegrationForProvider:*(void *)(a1 + 40) index:*(void *)(a1 + 72) + 1];
    }
  }
}

- (id)_viewModelsWithSortApplied
{
  if (self->_viewModels)
  {
    if (!self->_vendorLinkSorter)
    {
      id v3 = [MUVendorLinkSorter alloc];
      uint64_t v4 = (void *)[(NSArray *)self->_viewModels copy];
      uint64_t v5 = [(MUVendorLinkSorter *)v3 initWithViewModels:v4];
      vendorLinkSorter = self->_vendorLinkSorter;
      self->_vendorLinkSorter = v5;
    }
    id v7 = objc_alloc_init(MUVendorLinkSortParameters);
    [(MUVendorLinkSortParameters *)v7 setSortAlphabetically:1];
    unint64_t v8 = [(GEOPlaceExternalAction *)self->_externalAction winningAdamId];
    [(MUVendorLinkSortParameters *)v7 setWinningAdamId:v8];

    if (GEOConfigGetBOOL())
    {
      id v9 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
      id v10 = MUMap(v9, &__block_literal_global_20);

      [(MUVendorLinkSortParameters *)v7 setPreferredOrdering:v10];
    }
    id v11 = [(MUVendorLinkSorter *)self->_vendorLinkSorter sortedViewModelsForParameters:v7];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

uint64_t __63__MUGroupedExternalActionController__viewModelsWithSortApplied__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)_openMapsExtensionUsingExtensionParams:(id)a3 handlingOptions:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  extensionDiscoveryManager = self->_extensionDiscoveryManager;
  if (!extensionDiscoveryManager)
  {
    id v9 = [MUPlaceExtensionDiscoveryManager alloc];
    v26[0] = v6;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v11 = [(MUPlaceExtensionDiscoveryManager *)v9 initWithExtensionDataItems:v10 amsResultProvider:self->_amsResultProvider];
    uint64_t v12 = self->_extensionDiscoveryManager;
    self->_extensionDiscoveryManager = v11;

    extensionDiscoveryManager = self->_extensionDiscoveryManager;
  }
  uint64_t v13 = [(MUPlaceExtensionDiscoveryManager *)extensionDiscoveryManager discoveryResultForDataItem:v6];
  if (v13)
  {
    id WeakRetained = (MUAMSResultProviderFetchOptions *)objc_loadWeakRetained((id *)&self->_actionHandler);
    id v15 = [v13 extension];
    uint64_t v16 = [v13 appStoreApp];
    [(MUAMSResultProviderFetchOptions *)WeakRetained handleMapsExtension:v15 usingAppStoreApp:v16 options:v7];
  }
  else
  {
    id v17 = [MUAMSResultProviderFetchOptions alloc];
    long long v18 = [MEMORY[0x1E4F31038] sharedInstance];
    [v18 screenScale];
    id WeakRetained = -[MUAMSResultProviderFetchOptions initWithDisplayScale:artworkSize:source:](v17, "initWithDisplayScale:artworkSize:source:", [(MUGroupedExternalActionController *)self source], v19, 40.0, 40.0);

    objc_initWeak(&location, self);
    int v20 = self->_extensionDiscoveryManager;
    id v21 = MEMORY[0x1E4F14428];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__MUGroupedExternalActionController__openMapsExtensionUsingExtensionParams_handlingOptions___block_invoke;
    v22[3] = &unk_1E574FF60;
    objc_copyWeak(&v24, &location);
    id v23 = v7;
    [(MUPlaceExtensionDiscoveryManager *)v20 performExtensionDiscoveryWithOptions:WeakRetained callbackQueue:MEMORY[0x1E4F14428] completion:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __92__MUGroupedExternalActionController__openMapsExtensionUsingExtensionParams_handlingOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a3)
  {
    id v10 = [a2 firstObject];
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = objc_loadWeakRetained(WeakRetained + 1);
      unint64_t v8 = [v10 extension];
      id v9 = [v10 appStoreApp];
      [v7 handleMapsExtension:v8 usingAppStoreApp:v9 options:*(void *)(a1 + 32)];
    }
  }
}

- (BOOL)hasMultipleVendorsForAnalytics
{
  BOOL v3 = [(MUGroupedExternalActionController *)self supportsMultipleVendorSelection];
  if (v3) {
    LOBYTE(v3) = [(NSArray *)self->_viewModels count] > 1;
  }
  return v3;
}

- (int)resolvedAnalyticsTarget
{
  if ([(MUGroupedExternalActionController *)self hasMultipleVendorsForAnalytics])
  {
    return [(MUGroupedExternalActionController *)self multipleVendorAnalyticsTarget];
  }
  else
  {
    return [(MUGroupedExternalActionController *)self singleVendorAnalyticsTarget];
  }
}

- (void)captureGroupedMenuRevealAnalyticsIfNeededWithIsQuickAction:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(GEOPlaceExternalAction *)self->_externalAction actionProviders];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    id v7 = MUExternalActionRevealedAnalyticsModuleButtonsForAction(self->_externalAction);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v11++) setIsGroup:1];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    if (a3) {
      uint64_t v12 = 30;
    }
    else {
      uint64_t v12 = [(MUGroupedExternalActionController *)self resolvedAnalyticsTarget];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsHandler);
    [WeakRetained instrumentExternalActionUsingAnalyticsAction:6074 target:v12 eventValue:0 sharedStateButtonList:v7];
  }
}

- (GEOPlaceExternalAction)externalAction
{
  return self->_externalAction;
}

- (int)singleVendorAnalyticsTarget
{
  return self->_singleVendorAnalyticsTarget;
}

- (void)setSingleVendorAnalyticsTarget:(int)a3
{
  self->_singleVendorAnalyticsTarget = a3;
}

- (int)multipleVendorAnalyticsTarget
{
  return self->_multipleVendorAnalyticsTarget;
}

- (void)setMultipleVendorAnalyticsTarget:(int)a3
{
  self->_multipleVendorAnalyticsTarget = a3;
}

- (int64_t)analyticsModuleType
{
  return self->_analyticsModuleType;
}

- (void)setAnalyticsModuleType:(int64_t)a3
{
  self->_analyticsModuleType = a3;
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (BOOL)supportsMultipleVendorSelection
{
  return self->_supportsMultipleVendorSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAction, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_extensionDiscoveryManager, 0);
  objc_storeStrong((id *)&self->_vendorLinkSorter, 0);
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_destroyWeak((id *)&self->_analyticsHandler);
  objc_destroyWeak((id *)&self->_actionHandler);
}

@end