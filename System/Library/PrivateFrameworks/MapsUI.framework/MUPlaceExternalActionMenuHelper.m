@interface MUPlaceExternalActionMenuHelper
- (BOOL)isQuickAction;
- (MUGroupedExternalActionController)actionController;
- (MUPlaceExternalActionMenuHelper)initWithExternalActionController:(id)a3 iconCache:(id)a4;
- (NSString)actionName;
- (NSString)symbolName;
- (id)_buildMenuElementForViewModel:(id)a3 presentationOptions:(id)a4 isSingleProvider:(BOOL)a5;
- (id)_buildMenuItemViewModelWithCachedImageForViewModel:(id)a3 isSingleProvider:(BOOL)a4;
- (id)buildMenuElementsWithPresentationOptions:(id)a3;
- (unint64_t)_imageVariantForViewModel:(id)a3 isSingleProvider:(BOOL)a4;
- (void)_downloadImageWithURL:(id)a3 variant:(unint64_t)a4 uniqueIdentifier:(id)a5 completion:(id)a6;
- (void)buildMenuItemViewModelsWithUpdateDelegate:(id)a3 completion:(id)a4;
- (void)setIsQuickAction:(BOOL)a3;
@end

@implementation MUPlaceExternalActionMenuHelper

- (MUGroupedExternalActionController)actionController
{
  return self->_resolver;
}

- (MUPlaceExternalActionMenuHelper)initWithExternalActionController:(id)a3 iconCache:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPlaceExternalActionMenuHelper;
  v9 = [(MUPlaceExternalActionMenuHelper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_iconCache, a4);
    objc_storeStrong((id *)&v10->_resolver, a3);
  }

  return v10;
}

- (id)buildMenuElementsWithPresentationOptions:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  objc_super v12 = __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke;
  v13 = &unk_1E574EBE0;
  objc_copyWeak(&v16, &location);
  v14 = self;
  id v6 = v4;
  id v15 = v6;
  id v7 = [v5 elementWithProvider:&v10];
  v18[0] = v7;
  id v8 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 1, v10, v11, v12, v13, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v8;
}

void __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(*((id *)WeakRetained + 3), "captureGroupedMenuRevealAnalyticsIfNeededWithIsQuickAction:", objc_msgSend(a1[4], "isQuickAction"));
    id v6 = (void *)v5[3];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_2;
    v7[3] = &unk_1E574EBB8;
    id v9 = v3;
    objc_copyWeak(&v10, a1 + 6);
    id v8 = a1[5];
    [v6 fetchProviderLockupsWithCompletion:v7];

    objc_destroyWeak(&v10);
  }
}

void __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MUGetMUPlaceExternalActionMenuHelperLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch vendor link models with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    id v9 = WeakRetained;
    if (WeakRetained)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_4;
      v14[3] = &unk_1E574EB90;
      v14[4] = WeakRetained;
      id v15 = *(id *)(a1 + 32);
      id v16 = v5;
      uint64_t v10 = MUMap(v16, v14);
      id v11 = v9[5];
      v9[5] = (id)v10;

      uint64_t v12 = *(void *)(a1 + 40);
      v13 = (void *)[v9[5] copy];
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    }
  }
}

id __76__MUPlaceExternalActionMenuHelper_buildMenuElementsWithPresentationOptions___block_invoke_4(void *a1, void *a2)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)a1[6];
  id v5 = a2;
  id v6 = objc_msgSend(v2, "_buildMenuElementForViewModel:presentationOptions:isSingleProvider:", v5, v3, objc_msgSend(v4, "count") == 1);

  return v6;
}

- (id)_buildMenuItemViewModelWithCachedImageForViewModel:(id)a3 isSingleProvider:(BOOL)a4
{
  id v6 = a3;
  id v7 = [v6 artworkURL];
  iconCache = self->_iconCache;
  id v9 = [v6 uniqueIdentifier];
  uint64_t v10 = [(MUTimeExpirableLRUCache *)iconCache objectForKeyedSubscript:v9];

  if (a4) {
    [(MUPlaceExternalActionMenuHelper *)self actionName];
  }
  else {
  id v11 = [v6 appShortName];
  }
  if (!v7)
  {
    uint64_t v12 = [v6 fallbackSymbolName];

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E4FB1818];
      v14 = [v6 fallbackSymbolName];
      uint64_t v15 = [v13 _systemImageNamed:v14 variant:0];

      uint64_t v10 = (void *)v15;
    }
  }
  id v16 = [[MUVendorLinkMenuItemViewModel alloc] initWithTitle:v11 image:v10 vendorLinkViewModel:v6];

  return v16;
}

- (unint64_t)_imageVariantForViewModel:(id)a3 isSingleProvider:(BOOL)a4
{
  return a4 && [a3 linkType] == 1;
}

- (id)_buildMenuElementForViewModel:(id)a3 presentationOptions:(id)a4 isSingleProvider:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MUPlaceExternalActionMenuHelper *)self _buildMenuItemViewModelWithCachedImageForViewModel:v8 isSingleProvider:v5];
  objc_initWeak(&location, self);
  id v11 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v12 = [v10 title];
  v13 = [v10 image];
  v14 = [v8 uniqueIdentifier];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke;
  v30[3] = &unk_1E574EC08;
  objc_copyWeak(&v32, &location);
  id v15 = v8;
  id v31 = v15;
  id v16 = [v11 actionWithTitle:v12 image:v13 identifier:v14 handler:v30];

  v17 = [v15 linkTypeString];
  id v18 = [v17 stringByAppendingString:@"ExternalPartnerMenuAction"];
  [v16 setAccessibilityIdentifier:v18];

  uint64_t v19 = [v10 image];

  if (!v19)
  {
    v20 = [v15 artworkURL];
    unint64_t v21 = [(MUPlaceExternalActionMenuHelper *)self _imageVariantForViewModel:v15 isSingleProvider:v5];
    v22 = [v15 uniqueIdentifier];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_2;
    v25[3] = &unk_1E574EC58;
    id v23 = v20;
    id v26 = v23;
    id v27 = v15;
    objc_copyWeak(&v29, &location);
    id v28 = v9;
    [(MUPlaceExternalActionMenuHelper *)self _downloadImageWithURL:v23 variant:v21 uniqueIdentifier:v22 completion:v25];

    objc_destroyWeak(&v29);
  }

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v16;
}

void __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained;
    [WeakRetained[3] openPartnerActionUsingViewModel:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id WeakRetained = MUGetMUPlaceExternalActionMenuHelperLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) uniqueIdentifier];
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1931EA000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to download artwork url %@ for model %@ with error %@", buf, 0x20u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      id v9 = [*(id *)(a1 + 48) contextMenuInteraction];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_16;
      v12[3] = &unk_1E574EC30;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      id v13 = *(id *)(a1 + 40);
      [v9 updateVisibleMenuWithBlock:v12];

      objc_destroyWeak(&v14);
    }
  }
}

id __102__MUPlaceExternalActionMenuHelper__buildMenuElementForViewModel_presentationOptions_isSingleProvider___block_invoke_16(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v22 = a1;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v21 = v3;
    id v4 = [v3 children];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
            id v11 = [v10 identifier];
            uint64_t v12 = [WeakRetained[1] objectForKeyedSubscript:v11];
            if (v12)
            {
              id v13 = (void *)v12;
              id v14 = [*(id *)(v22 + 32) uniqueIdentifier];
              int v15 = [v11 isEqual:v14];

              if (v15)
              {
                uint64_t v16 = MUGetMUPlaceExternalActionMenuHelperLog();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  __int16 v17 = [*(id *)(v22 + 32) uniqueIdentifier];
                  *(_DWORD *)buf = 138412290;
                  id v29 = v17;
                  _os_log_impl(&dword_1931EA000, v16, OS_LOG_TYPE_INFO, "Updating image for view model %@", buf, 0xCu);
                }
                id v18 = [WeakRetained[1] objectForKeyedSubscript:v11];
                [v10 setImage:v18];

                goto LABEL_17;
              }
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v3 = v21;
  }
  __int16 v19 = (void *)[v3 copy];

  return v19;
}

- (void)buildMenuItemViewModelsWithUpdateDelegate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  resolver = self->_resolver;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__MUPlaceExternalActionMenuHelper_buildMenuItemViewModelsWithUpdateDelegate_completion___block_invoke;
  v11[3] = &unk_1E574ECD0;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(MUGroupedExternalActionController *)resolver fetchProviderLockupsWithCompletion:v11];
}

void __88__MUPlaceExternalActionMenuHelper_buildMenuItemViewModelsWithUpdateDelegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = MUGetMUPlaceExternalActionMenuHelperLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v6;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch vendor link models with error %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v9 = [v5 count];
    id v10 = dispatch_group_create();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v27 = v5;
    id obj = v5;
    uint64_t v11 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v40;
      uint64_t v28 = *(void *)v40;
      do
      {
        uint64_t v14 = 0;
        uint64_t v29 = v12;
        do
        {
          if (*(void *)v40 != v13) {
            objc_enumerationMutation(obj);
          }
          int v15 = *(void **)(*((void *)&v39 + 1) + 8 * v14);
          dispatch_group_enter(v10);
          uint64_t v16 = [*(id *)(a1 + 32) _buildMenuItemViewModelWithCachedImageForViewModel:v15 isSingleProvider:v9 == 1];
          [v16 setUpdateDelegate:*(void *)(a1 + 40)];
          [v8 addObject:v16];
          __int16 v17 = [v16 image];

          if (v17)
          {
            dispatch_group_leave(v10);
          }
          else
          {
            uint64_t v31 = [*(id *)(a1 + 32) _imageVariantForViewModel:v15 isSingleProvider:v9 == 1];
            id v18 = v8;
            __int16 v19 = *(void **)(a1 + 32);
            v20 = [v15 artworkURL];
            [v15 uniqueIdentifier];
            uint64_t v21 = a1;
            id v23 = v22 = v9;
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __88__MUPlaceExternalActionMenuHelper_buildMenuItemViewModelsWithUpdateDelegate_completion___block_invoke_20;
            v36[3] = &unk_1E574EC80;
            v36[4] = v15;
            v37 = v10;
            id v38 = v16;
            long long v24 = v19;
            id v8 = v18;
            uint64_t v13 = v28;
            [v24 _downloadImageWithURL:v20 variant:v31 uniqueIdentifier:v23 completion:v36];

            uint64_t v9 = v22;
            a1 = v21;

            uint64_t v12 = v29;
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v12);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __88__MUPlaceExternalActionMenuHelper_buildMenuItemViewModelsWithUpdateDelegate_completion___block_invoke_21;
    block[3] = &unk_1E574ECA8;
    id v25 = *(id *)(a1 + 48);
    id v34 = 0;
    id v35 = v25;
    id v33 = v8;
    id v26 = v8;
    dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);

    id v6 = 0;
    id v5 = v27;
  }
}

void __88__MUPlaceExternalActionMenuHelper_buildMenuItemViewModelsWithUpdateDelegate_completion___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    id v7 = MUGetMUPlaceExternalActionMenuHelperLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) artworkURL];
      uint64_t v9 = [*(id *)(a1 + 32) uniqueIdentifier];
      int v10 = 138412802;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      int v15 = v6;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_ERROR, "Failed to download artwork url %@ for model %@ with error %@", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 48) setImage:a2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __88__MUPlaceExternalActionMenuHelper_buildMenuItemViewModelsWithUpdateDelegate_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)_downloadImageWithURL:(id)a3 variant:(unint64_t)a4 uniqueIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [MEMORY[0x1E4F31038] sharedInstance];
  [v13 screenScale];
  double v15 = v14;

  uint64_t v16 = objc_alloc_init(MUAppLockupImageMetrics);
  -[MUAppLockupImageMetrics setFrameSize:](v16, "setFrameSize:", 40.0, 40.0);
  [(MUAppLockupImageMetrics *)v16 setScale:v15];
  [(MUAppLockupImageMetrics *)v16 setVariant:a4];
  __int16 v17 = [[MUAppLockupImage alloc] initWithRemoteURL:v10 metrics:v16];
  [(NSMutableDictionary *)self->_lockupImagesByIdentifiers setObject:v17 forKeyedSubscript:v11];
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__MUPlaceExternalActionMenuHelper__downloadImageWithURL_variant_uniqueIdentifier_completion___block_invoke;
  v21[3] = &unk_1E574ECF8;
  objc_copyWeak(&v25, &location);
  id v18 = v17;
  uint64_t v22 = v18;
  id v19 = v11;
  id v23 = v19;
  id v20 = v12;
  id v24 = v20;
  [(MUAppLockupImage *)v18 loadImageWithCompletion:v21];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __93__MUPlaceExternalActionMenuHelper__downloadImageWithURL_variant_uniqueIdentifier_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = (void *)WeakRetained[1];
    id v7 = WeakRetained;
    id v4 = [*(id *)(a1 + 32) cachedImage];
    [v3 setObject:v4 forKey:*(void *)(a1 + 40)];

    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) cachedImage];
    (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0);

    id WeakRetained = v7;
  }
}

- (NSString)actionName
{
  uint64_t v2 = [(MUGroupedExternalActionController *)self->_resolver externalAction];
  id v3 = [v2 actionName];

  return (NSString *)v3;
}

- (NSString)symbolName
{
  uint64_t v2 = [(MUGroupedExternalActionController *)self->_resolver externalAction];
  id v3 = [v2 symbolName];

  return (NSString *)v3;
}

- (BOOL)isQuickAction
{
  return self->_isQuickAction;
}

- (void)setIsQuickAction:(BOOL)a3
{
  self->_isQuickAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partnerActionMenuElements, 0);
  objc_destroyWeak((id *)&self->_actionHandler);
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_lockupImagesByIdentifiers, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
}

@end