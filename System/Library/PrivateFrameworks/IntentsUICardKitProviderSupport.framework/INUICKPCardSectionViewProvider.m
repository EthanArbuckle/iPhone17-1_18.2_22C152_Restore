@interface INUICKPCardSectionViewProvider
+ (id)_viewConfigurationsFromAllocator:(id)a3;
+ (void)requestInstanceFromDefaultAllocatorWithCard:(id)a3 delegate:(id)a4 reply:(id)a5;
+ (void)requestInstanceWithCard:(id)a3 delegate:(id)a4 allocator:(id)a5 reply:(id)a6;
- (BOOL)vetoDisplayOfCardSection:(id)a3;
- (CRCard)card;
- (CRKCardSectionViewProviderDelegate)cardSectionViewProviderDelegate;
- (INUICKPViewControllerAllocating)allocator;
- (NSArray)viewConfigurations;
- (NSString)providerIdentifier;
- (double)boundingWidthForViewControllerAllocator:(id)a3;
- (unint64_t)displayPriorityForCardSection:(id)a3;
- (void)setAllocator:(id)a3;
- (void)setCardSectionViewProviderDelegate:(id)a3;
- (void)setViewConfigurations:(id)a3;
@end

@implementation INUICKPCardSectionViewProvider

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.IntentsUICardKitProvider";
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return 1;
}

- (BOOL)vetoDisplayOfCardSection:(id)a3
{
  id v4 = a3;
  v5 = [(INUICKPViewControllerAllocating *)self->_allocator redundantInterfaceSections];
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __59__INUICKPCardSectionViewProvider_vetoDisplayOfCardSection___block_invoke;
    v9[3] = &unk_264B95D08;
    id v10 = v4;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v9];

    BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __59__INUICKPCardSectionViewProvider_vetoDisplayOfCardSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v7 = [v6 cardSection];
    v8 = [v7 cardSectionIdentifier];
    v9 = [*(id *)(a1 + 32) cardSectionIdentifier];
    uint64_t v10 = [v8 isEqual:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  *a4 = v10;

  return v10;
}

+ (void)requestInstanceFromDefaultAllocatorWithCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_alloc_init(INUICKPSynchronousRemoteViewControllerAllocator);
  [(INUICKPSynchronousRemoteViewControllerAllocator *)v11 setSynchronousRemoteViewControllerClass:objc_opt_class()];
  [a1 requestInstanceWithCard:v10 delegate:v9 allocator:v11 reply:v8];
}

+ (void)requestInstanceWithCard:(id)a3 delegate:(id)a4 allocator:(id)a5 reply:(id)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void (**)(void, void))v13;
  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      v15 = [v10 interactions];
      v16 = [v15 anyObject];

      if (v12 && v16)
      {
        id v17 = objc_alloc_init((Class)objc_opt_class());
        [v17 setCardSectionViewProviderDelegate:v11];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = [v11 cardSectionDisplayRequiresUserConsentForProvider:v17];
          v19 = (void *)*MEMORY[0x263F31630];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
          {
            v20 = NSNumber;
            v21 = v19;
            v22 = [v20 numberWithBool:v18];
            *(_DWORD *)buf = 138412802;
            id v31 = a1;
            __int16 v32 = 2112;
            id v33 = v11;
            __int16 v34 = 2112;
            v35 = v22;
            _os_log_impl(&dword_230990000, v21, OS_LOG_TYPE_INFO, "%@ respecting delegate %@ preference to require user consent: %@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v18 = 1;
        }
        if (objc_opt_respondsToSelector()) {
          [v12 setDelegate:v17];
        }
        [v12 setRequiresUserConsent:v18];
        v23 = INUICKPInterfaceSectionsFromCard(v10);
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __83__INUICKPCardSectionViewProvider_requestInstanceWithCard_delegate_allocator_reply___block_invoke;
        v25[3] = &unk_264B95D30;
        id v29 = a1;
        id v26 = v12;
        id v27 = v17;
        v28 = v14;
        id v24 = v17;
        [v26 performAllocationsFromInteraction:v16 initialInterfaceSections:v23 completion:v25];

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      v16 = 0;
    }
    if (v14) {
      v14[2](v14, 0);
    }
    goto LABEL_17;
  }
  if (v13) {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
LABEL_18:
}

uint64_t __83__INUICKPCardSectionViewProvider_requestInstanceWithCard_delegate_allocator_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) _viewConfigurationsFromAllocator:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    if (v2)
    {
      [*(id *)(a1 + 40) setViewConfigurations:v2];
      [*(id *)(a1 + 40) setAllocator:*(void *)(a1 + 32)];
      id v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v4 = *(void (**)(void))(v3 + 16);
    }
    v4();
  }
  return MEMORY[0x270F9A790]();
}

- (double)boundingWidthForViewControllerAllocator:(id)a3
{
  id v4 = [(INUICKPCardSectionViewProvider *)self cardSectionViewProviderDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  id v6 = [(INUICKPCardSectionViewProvider *)self cardSectionViewProviderDelegate];
  [v6 boundingWidthForProvider:self];
  double v8 = v7;

  return v8;
}

+ (id)_viewConfigurationsFromAllocator:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [v3 allocatedViewControllers];
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138412290;
    long long v20 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        id v11 = objc_alloc_init(MEMORY[0x263F315F8]);
        id v12 = [v3 viewControllersByInitialInterfaceSection];
        id v13 = [v12 allKeysForObject:v10];
        v14 = [v13 firstObject];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v14 cardSection];
          [v11 setCardSection:v15];
        }
        else
        {
          v16 = *MEMORY[0x263F31630];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            id v27 = v14;
            _os_log_error_impl(&dword_230990000, v16, OS_LOG_TYPE_ERROR, "Interface section is not a card interface section\n    Interface section: %@", buf, 0xCu);
          }
        }
        id v17 = objc_msgSend(v10, "view", v20);
        [v11 setCardSectionView:v17];

        if ([v10 conformsToProtocol:&unk_26E53E808]) {
          uint64_t v18 = v10;
        }
        else {
          uint64_t v18 = 0;
        }
        [v11 setCardSectionViewController:v18];
        [v4 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  return v4;
}

- (CRCard)card
{
  return self->_card;
}

- (NSArray)viewConfigurations
{
  return self->_viewConfigurations;
}

- (void)setViewConfigurations:(id)a3
{
}

- (INUICKPViewControllerAllocating)allocator
{
  return self->_allocator;
}

- (void)setAllocator:(id)a3
{
}

- (CRKCardSectionViewProviderDelegate)cardSectionViewProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardSectionViewProviderDelegate);
  return (CRKCardSectionViewProviderDelegate *)WeakRetained;
}

- (void)setCardSectionViewProviderDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionViewProviderDelegate);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

@end