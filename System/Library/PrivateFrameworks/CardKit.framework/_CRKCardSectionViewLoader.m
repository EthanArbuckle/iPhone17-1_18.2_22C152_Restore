@interface _CRKCardSectionViewLoader
- (BOOL)cardSectionShouldBeDisplayed:(id)a3;
- (CRCard)loadedCard;
- (NSMutableSet)identifiedCardSectionViewProviders;
- (_CRKCardSectionViewLoader)init;
- (_CRKCardSectionViewLoaderDelegate)delegate;
- (id)_allViewConfigurations;
- (id)_viewConfigurationForCardSection:(id)a3 providerIdentifier:(id)a4;
- (id)viewConfigurationForCardSection:(id)a3;
- (void)_loadIdentifiedCardSectionViewProvidersFromCard:(id)a3 identifiedProviders:(id)a4 delegate:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
- (void)setLoadedCard:(id)a3;
@end

@implementation _CRKCardSectionViewLoader

- (_CRKCardSectionViewLoader)init
{
  v10.receiver = self;
  v10.super_class = (Class)_CRKCardSectionViewLoader;
  v2 = [(_CRKCardSectionViewLoader *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers = v2->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers;
    v2->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    identifiedCardSectionViewProviders = v2->_identifiedCardSectionViewProviders;
    v2->_identifiedCardSectionViewProviders = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    vetoingProviderIdentifiersByVetoedCardSectionIdentifiers = v2->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
    v2->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers = v7;
  }
  return v2;
}

- (void)_loadIdentifiedCardSectionViewProvidersFromCard:(id)a3 identifiedProviders:(id)a4 delegate:(id)a5 completion:(id)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v21 = a4;
  id v22 = a5;
  id v11 = a6;
  v12 = v11;
  if (v10)
  {
    v20 = v11;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 0;
    objc_initWeak(&location, self);
    v13 = dispatch_group_create();
    v14 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v10;
      _os_log_impl(&dword_224F73000, v14, OS_LOG_TYPE_DEFAULT, "Loading card section view providers for card\n    Card: %@", buf, 0xCu);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v15 = v21;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            dispatch_group_enter(v13);
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke;
            v28[3] = &unk_26470F0F0;
            objc_copyWeak(&v31, &location);
            v28[4] = v19;
            v30 = v37;
            v29 = v13;
            [v19 requestIdentifiedCardSectionViewProviderForCard:v10 delegate:v22 reply:v28];

            objc_destroyWeak(&v31);
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v16);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_5;
    block[3] = &unk_26470F118;
    objc_copyWeak(&v27, &location);
    id v24 = v10;
    id v25 = v20;
    v26 = v37;
    dispatch_group_notify(v13, MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    _Block_object_dispose(v37, 8);
    v12 = v20;
  }
  else if (v11)
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
}

- (id)viewConfigurationForCardSection:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && [(_CRKCardSectionViewLoader *)self cardSectionShouldBeDisplayed:v4])
  {
    v5 = [(NSMutableSet *)self->_identifiedCardSectionViewProviders allObjects];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke;
    v24[3] = &unk_26470F140;
    v24[4] = self;
    id v6 = v4;
    id v25 = v6;
    v7 = [v5 sortedArrayUsingComparator:v24];

    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke_14;
    id v21 = &unk_26470F168;
    id v22 = self;
    id v8 = v6;
    id v23 = v8;
    uint64_t v9 = [v7 indexOfObjectWithOptions:2 passingTest:&v18];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        -[_CRKCardSectionViewLoader viewConfigurationForCardSection:]((uint64_t)v8, v10);
      }
      id v11 = 0;
    }
    else
    {
      v12 = objc_msgSend(v7, "objectAtIndex:", v9, v18, v19, v20, v21, v22);
      v13 = [v12 providerIdentifier];

      v14 = [(NSMutableDictionary *)self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers objectForKey:v13];
      id v15 = [v8 cardSectionIdentifier];
      id v11 = [v14 objectForKey:v15];

      uint64_t v16 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v11;
        __int16 v28 = 2112;
        id v29 = v8;
        __int16 v30 = 2112;
        id v31 = v13;
        _os_log_impl(&dword_224F73000, v16, OS_LOG_TYPE_DEFAULT, "Found highest priority view configuration for card section\n    View configuration: %@\n    Card section: %@\n    Provider identifier: %@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (BOOL)cardSectionShouldBeDisplayed:(id)a3
{
  vetoingProviderIdentifiersByVetoedCardSectionIdentifiers = self->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
  id v4 = [a3 cardSectionIdentifier];
  v5 = [(NSMutableDictionary *)vetoingProviderIdentifiersByVetoedCardSectionIdentifiers objectForKey:v4];
  LOBYTE(vetoingProviderIdentifiersByVetoedCardSectionIdentifiers) = v5 == 0;

  return (char)vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
}

- (id)_allViewConfigurations
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) allValues];
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_viewConfigurationForCardSection:(id)a3 providerIdentifier:(id)a4
{
  id v4 = 0;
  if (a3 && a4)
  {
    cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers = self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers;
    id v7 = a3;
    id v8 = [(NSMutableDictionary *)cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers objectForKey:a4];
    uint64_t v9 = [v7 cardSectionIdentifier];

    id v4 = [v8 objectForKey:v9];
  }

  return v4;
}

- (NSMutableSet)identifiedCardSectionViewProviders
{
  return self->_identifiedCardSectionViewProviders;
}

- (_CRKCardSectionViewLoaderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_CRKCardSectionViewLoaderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRCard)loadedCard
{
  return self->_loadedCard;
}

- (void)setLoadedCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedCard, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifiedCardSectionViewProviders, 0);
  objc_storeStrong((id *)&self->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers, 0);

  objc_storeStrong((id *)&self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers, 0);
}

- (void)viewConfigurationForCardSection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224F73000, a2, OS_LOG_TYPE_ERROR, "Couldn't find a view configuration for card section\n    Card section: %@", (uint8_t *)&v2, 0xCu);
}

@end