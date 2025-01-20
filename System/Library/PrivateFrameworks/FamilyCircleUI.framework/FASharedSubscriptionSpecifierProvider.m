@interface FASharedSubscriptionSpecifierProvider
- (BOOL)_launchWithResourceDictionary:(id)a3;
- (BOOL)handleURL:(id)a3;
- (FASharedSubscriptionSpecifierProvider)initWithAppleAccount:(id)a3 presenter:(id)a4;
- (FASharedSubscriptionSpecifierProviderSelectionHandler)selectionHandler;
- (NSArray)specifiers;
- (NSArray)subscriptionSpecifiers;
- (NSArray)subscriptionsFamilyViewSpecifier;
- (id)_iconURLStringForService:(id)a3;
- (id)_serviceSpecifiersFromArray:(id)a3;
- (id)_sharedSubscriptionGroupSpecifier;
- (id)_sharedSubscriptionSpecifierCell:(int)a3;
- (id)_specifierNamed:(id)a3;
- (id)_valueForServiceSpecifier:(id)a3;
- (void)_addSharedSubscriptionsButtonWasTapped:(id)a3;
- (void)_delayedLoadIfNeeded;
- (void)_handleSubscriptionListResponse:(id)a3;
- (void)_loadSubscriptionServices;
- (void)_serviceSpecifierWasTapped:(id)a3;
- (void)addSubscriber:(id)a3;
- (void)reloadSpecifiers;
- (void)removeSubscriber:(id)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setSpecifiers:(id)a3;
- (void)setSubscriptionSpecifiers:(id)a3;
- (void)setSubscriptionsFamilyViewSpecifier:(id)a3;
@end

@implementation FASharedSubscriptionSpecifierProvider

- (FASharedSubscriptionSpecifierProvider)initWithAppleAccount:(id)a3 presenter:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FASharedSubscriptionSpecifierProvider;
  v9 = [(FASharedSubscriptionSpecifierProvider *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a4);
    v10->_updateSubsriptionSpecifiers = 1;
    objc_storeStrong((id *)&v10->_appleAccount, a3);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    networkActivityQueue = v10->_networkActivityQueue;
    v10->_networkActivityQueue = v11;

    [(NSOperationQueue *)v10->_networkActivityQueue setQualityOfService:33];
    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    subscribers = v10->_subscribers;
    v10->_subscribers = (NSHashTable *)v13;

    v10->_numberOfGroups = 0;
  }

  return v10;
}

- (id)_sharedSubscriptionSpecifierCell:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [MEMORY[0x263EFF980] array];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"Shared Subscriptions" value:&stru_26CA2C800 table:@"Localizable"];

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%i Subscriptions", v3);
  v9 = [MEMORY[0x263F827E8] systemImageNamed:@"arrow.clockwise"];
  v10 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SharedSubscriptions"];
  v11 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:1 edit:0];
  [v5 addObject:v10];
  [v11 setProperty:v7 forKey:*MEMORY[0x263F602D0]];
  [v11 setProperty:v8 forKey:*MEMORY[0x263F602C8]];
  [v11 setProperty:v9 forKey:*MEMORY[0x263F60140]];
  [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F60080]];
  [v11 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v11 setButtonAction:sel__addSharedSubscriptionsButtonWasTapped_];
  [v5 addObject:v11];

  return v5;
}

- (void)addSubscriber:(id)a3
{
}

- (void)removeSubscriber:(id)a3
{
}

- (id)_sharedSubscriptionGroupSpecifier
{
  return (id)[MEMORY[0x263F5FC40] groupSpecifierWithID:@"FASharedServices"];
}

- (NSArray)specifiers
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (*(_WORD *)&self->_updateSubsriptionSpecifiers)
  {
    v4 = [(FASharedSubscriptionSpecifierProvider *)self _sharedSubscriptionGroupSpecifier];
    [v3 addObject:v4];

    self->_updateSubsriptionSpecifiers = 0;
    self->_specifierState = 1;
    [(FASharedSubscriptionSpecifierProvider *)self _loadSubscriptionServices];
    v5 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];
LABEL_3:
    [v3 addObject:v5];
    goto LABEL_4;
  }
  uint64_t v13 = [(FASharedServicesResponse *)self->_sharedSubscriptionResponse services];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v29 = [(FASharedSubscriptionSpecifierProvider *)self _sharedSubscriptionGroupSpecifier];
    [v3 addObject:v29];

    self->_specifierState = 2;
    v30 = (void *)MEMORY[0x263F5FC40];
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = [v31 localizedStringForKey:@"FAILED_TO_LOAD_SERVICES" value:&stru_26CA2C800 table:@"Localizable"];
    v5 = [v30 preferenceSpecifierNamed:v32 target:0 set:0 get:0 detail:0 cell:-1 edit:0];

    [v5 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    goto LABEL_3;
  }
  p_specifiers = &self->_specifiers;
  specifiers = self->_specifiers;
  if (!specifiers || ![(NSArray *)specifiers count] || self->_specifierState != 3)
  {
    self->_specifierState = 3;
    objc_super v16 = [(FASharedServicesResponse *)self->_sharedSubscriptionResponse serviceGroups];
    uint64_t v17 = [v16 count];

    if (v17)
    {
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = [(FASharedServicesResponse *)self->_sharedSubscriptionResponse serviceGroups];
      uint64_t v18 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(obj);
            }
            v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x263F5FC40];
            v24 = [v22 headerText];
            v25 = [v22 footerText];
            v26 = [v23 groupSpecifierWithHeader:v24 footer:v25];
            [v3 addObject:v26];

            ++self->_numberOfGroups;
            v27 = [v22 services];
            v28 = [(FASharedSubscriptionSpecifierProvider *)self _serviceSpecifiersFromArray:v27];
            [v3 addObjectsFromArray:v28];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v19);
      }

      goto LABEL_5;
    }
    v33 = _FALogSystem();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v33, OS_LOG_TYPE_DEFAULT, "No groups, kickin it old school.", buf, 2u);
    }

    v34 = [(FASharedSubscriptionSpecifierProvider *)self _sharedSubscriptionGroupSpecifier];
    [v3 addObject:v34];

    v5 = [(FASharedServicesResponse *)self->_sharedSubscriptionResponse services];
    v35 = [(FASharedSubscriptionSpecifierProvider *)self _serviceSpecifiersFromArray:v5];
    [v3 addObjectsFromArray:v35];

LABEL_4:
LABEL_5:
    uint64_t v6 = [v3 copy];
    v9 = self->_specifiers;
    id v7 = &self->_specifiers;
    p_super = &v9->super;
    *id v7 = (NSArray *)v6;
    p_specifiers = v7;
    goto LABEL_6;
  }
  p_super = _FALogSystem();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2189F0000, p_super, OS_LOG_TYPE_DEFAULT, "Returning existing specifiers.", buf, 2u);
  }
LABEL_6:

  v11 = *p_specifiers;
  return v11;
}

- (id)_serviceSpecifiersFromArray:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__FASharedSubscriptionSpecifierProvider__serviceSpecifiersFromArray___block_invoke;
  v5[3] = &unk_264349860;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "fa_map:", v5);
  return v3;
}

id __69__FASharedSubscriptionSpecifierProvider__serviceSpecifiersFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = a2;
  v5 = [v4 displayLabel];
  uint64_t v6 = [v3 preferenceSpecifierNamed:v5 target:*(void *)(a1 + 32) set:0 get:sel__valueForServiceSpecifier_ detail:0 cell:2 edit:0];

  id v7 = [v4 subLabel];
  [v6 setProperty:v7 forKey:*MEMORY[0x263F602C8]];

  [v6 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
  [v6 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F601A8]];
  id v8 = NSURL;
  v9 = [*(id *)(a1 + 32) _iconURLStringForService:v4];
  v10 = [v8 URLWithString:v9];

  [v6 setProperty:v10 forKey:*MEMORY[0x263F601B0]];
  [v6 setControllerLoadAction:sel__serviceSpecifierWasTapped_];
  [v6 setUserInfo:v4];
  v11 = [v4 name];
  [v6 setIdentifier:v11];

  v12 = NSURL;
  uint64_t v13 = [v4 actionURLString];

  uint64_t v14 = [v12 URLWithString:v13];
  [v6 setProperty:v14 forKey:@"FASharedServicesSpecifierActionURLKey"];

  return v6;
}

- (id)_iconURLStringForService:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSListController *)self->_presenter view];
  uint64_t v6 = [v5 window];
  id v7 = [v6 screen];
  [v7 scale];
  int v9 = (int)v8;

  switch(v9)
  {
    case 3:
      uint64_t v10 = [v4 iconURLStringx3];
      goto LABEL_7;
    case 2:
      uint64_t v10 = [v4 iconURLStringx2];
      goto LABEL_7;
    case 1:
      uint64_t v10 = [v4 iconURLString];
LABEL_7:
      v11 = (void *)v10;
      goto LABEL_11;
  }
  v11 = [v4 iconURLStringx3];
  v12 = _FALogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[FASharedSubscriptionSpecifierProvider _iconURLStringForService:](v12);
  }

LABEL_11:
  uint64_t v13 = _FALogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v9;
    _os_log_impl(&dword_2189F0000, v13, OS_LOG_TYPE_DEFAULT, "Returning service image at scale - %d", (uint8_t *)v15, 8u);
  }

  return v11;
}

- (void)_serviceSpecifierWasTapped:(id)a3
{
  p_selectionHandler = &self->_selectionHandler;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_selectionHandler);
  [WeakRetained didSelectSpecifier:v4];
}

- (id)_valueForServiceSpecifier:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[FASharedSubscriptionSpecifierProvider _valueForServiceSpecifier:]();
  }

  uint64_t v6 = [v4 detailLabel];

  return v6;
}

- (void)_loadSubscriptionServices
{
  if (!self->_isLoadingSpecifiers)
  {
    self->_isLoadingSpecifiers = 1;
    self->_specifierState = 1;
    networkActivityQueue = self->_networkActivityQueue;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke;
    v3[3] = &unk_2643489F8;
    v3[4] = self;
    [(NSOperationQueue *)networkActivityQueue addOperationWithBlock:v3];
  }
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke(uint64_t a1)
{
  v2 = _FASignpostLogSystem();
  os_signpost_id_t v3 = _FASignpostCreate(v2);
  uint64_t v5 = v4;

  uint64_t v6 = _FASignpostLogSystem();
  id v7 = v6;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2189F0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FetchFamilySubscriptions", " enableTelemetry=YES ", buf, 2u);
  }

  double v8 = _FASignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_cold_1();
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_99;
  aBlock[3] = &unk_264349888;
  aBlock[5] = v3;
  aBlock[6] = v5;
  aBlock[4] = *(void *)(a1 + 32);
  int v9 = _Block_copy(aBlock);
  uint64_t v10 = objc_opt_new();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2;
  v12[3] = &unk_264349468;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v11 = v9;
  [v10 fetchAAURLConfigurationWithCompletion:v12];
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_99(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  unint64_t Nanoseconds = _FASignpostGetNanoseconds(a1[5], a1[6]);
  uint64_t v5 = _FASignpostLogSystem();
  uint64_t v6 = v5;
  os_signpost_id_t v7 = a1[5];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v16) = [v3 statusCode];
    _os_signpost_emit_with_name_impl(&dword_2189F0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "FetchFamilySubscriptions", " StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d ", buf, 8u);
  }

  double v8 = _FASignpostLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    double v10 = (double)Nanoseconds / 1000000000.0;
    uint64_t v11 = a1[5];
    int v12 = [v3 statusCode];
    *(_DWORD *)buf = 134218496;
    uint64_t v16 = v11;
    __int16 v17 = 2048;
    double v18 = v10;
    __int16 v19 = 1026;
    int v20 = v12;
    _os_log_debug_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEBUG, "END [%lld] %fs:FetchFamilySubscriptions  StatusCode=%{public,signpost.telemetry:number1,name=StatusCode}d ", buf, 0x1Cu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_100;
  v13[3] = &unk_264348AE0;
  v13[4] = a1[4];
  id v14 = v3;
  id v9 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v13);
}

uint64_t __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_100(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSubscriptionListResponse:*(void *)(a1 + 40)];
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 urlForEndpoint:@"getFamilySubscriptions"];
  if (!v3)
  {
    uint64_t v4 = _FALogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_2(v4);
    }
  }
  uint64_t v5 = _FALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_1();
  }

  uint64_t v6 = [FASharedServicesRequest alloc];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
  double v8 = [v3 absoluteString];
  id v9 = [(FASharedServicesRequest *)v6 initWithAppleAccount:v7 urlString:v8];

  double v10 = (void *)[objc_alloc(MEMORY[0x263F25938]) initWithRequest:v9 handler:*(void *)(a1 + 40)];
  uint64_t v11 = _FALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v12 = 0;
    _os_log_impl(&dword_2189F0000, v11, OS_LOG_TYPE_DEFAULT, "Fetching family subscriptions.", v12, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 56) addOperation:v10];
}

- (NSArray)subscriptionSpecifiers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  p_subscriptionSpecifiers = &self->_subscriptionSpecifiers;
  if (![(NSArray *)self->_subscriptionSpecifiers count])
  {
    uint64_t v4 = [(FASharedSubscriptionSpecifierProvider *)self specifiers];
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v6 = v5;
    if (!self->_isLoadingSpecifiers)
    {
      __int16 v19 = (id *)p_subscriptionSpecifiers;
      int v20 = v5;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v18 = v4;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v7);
            }
            int v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            id v13 = [v12 identifier];
            if ([v13 isEqual:@"ICLOUD_STORAGE"])
            {
            }
            else
            {
              id v14 = [v12 identifier];
              char v15 = [v14 isEqual:@"SHARE_MY_LOCATION"];

              if ((v15 & 1) == 0) {
                [v20 addObject:v12];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v9);
      }

      p_subscriptionSpecifiers = (NSArray **)v19;
      uint64_t v6 = v20;
      objc_storeStrong(v19, v20);
      uint64_t v4 = v18;
    }
  }
  uint64_t v16 = *p_subscriptionSpecifiers;
  return v16;
}

- (NSArray)subscriptionsFamilyViewSpecifier
{
  v2 = self;
  uint64_t v30 = *MEMORY[0x263EF8340];
  subscriptionsFamilyViewSpecifier = self->_subscriptionsFamilyViewSpecifier;
  if (!subscriptionsFamilyViewSpecifier || ![(NSArray *)subscriptionsFamilyViewSpecifier count])
  {
    uint64_t v4 = [(FASharedSubscriptionSpecifierProvider *)v2 specifiers];
    id v5 = v4;
    if (!v2->_isLoadingSpecifiers)
    {
      long long v23 = v2;
      uint64_t v6 = [v4 count] - v2->_numberOfGroups;
      long long v21 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id obj = v5;
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      long long v22 = v5;
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(obj);
            }
            int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            id v13 = objc_msgSend(v12, "identifier", v21);
            int v14 = [v13 isEqual:@"ICLOUD_STORAGE"];

            if (v14)
            {
              uint64_t v6 = (v6 - 1);
              [v7 addObject:v12];
            }
            char v15 = [v12 identifier];
            int v16 = [v15 isEqual:@"SHARE_MY_LOCATION"];

            if (v16)
            {
              uint64_t v6 = (v6 - 1);
              [v7 addObject:v12];
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v9);
      }

      v2 = v23;
      __int16 v17 = [(FASharedSubscriptionSpecifierProvider *)v23 _sharedSubscriptionSpecifierCell:v6];
      [(NSArray *)v21 addObjectsFromArray:v17];

      [(NSArray *)v21 addObjectsFromArray:v7];
      double v18 = v23->_subscriptionsFamilyViewSpecifier;
      v23->_subscriptionsFamilyViewSpecifier = v21;

      id v5 = v22;
    }
  }
  __int16 v19 = v2->_subscriptionsFamilyViewSpecifier;
  return v19;
}

- (void)_handleSubscriptionListResponse:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  self->_isLoadingSpecifiers = 0;
  if ([v5 statusCode] != 200)
  {
    uint64_t v6 = _FALogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v5 error];
      *(_DWORD *)buf = 138412290;
      id v28 = v7;
      _os_log_impl(&dword_2189F0000, v6, OS_LOG_TYPE_DEFAULT, "Failed to get subscription services %@", buf, 0xCu);
    }
  }
  uint64_t v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 responseDictionary];
    *(_DWORD *)buf = 138412546;
    id v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v9;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Received shared services response %@ - resourceDictionary: %@", buf, 0x16u);
  }
  uint64_t v10 = [v5 services];
  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = (void *)v10;
  int v12 = [(FASharedServicesResponse *)self->_sharedSubscriptionResponse services];
  id v13 = [v5 services];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    _FALogSystem();
    char v15 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, &v15->super, OS_LOG_TYPE_DEFAULT, "Response matches current subscription services; not reloading specifiers",
        buf,
        2u);
    }
  }
  else
  {
LABEL_11:
    int v16 = _FALogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v16, OS_LOG_TYPE_DEFAULT, "Response indicates changes to subscription services; reloading specifiers",
        buf,
        2u);
    }

    objc_storeStrong((id *)&self->_sharedSubscriptionResponse, a3);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    char v15 = self->_subscribers;
    uint64_t v17 = [(NSHashTable *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v15);
          }
          long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * v20);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v21, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, self->_subscriptionSpecifiers, 1, (void)v22);
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [(NSHashTable *)v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v18);
    }
  }

  [(FASharedSubscriptionSpecifierProvider *)self _delayedLoadIfNeeded];
}

- (BOOL)handleURL:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(FASharedSubscriptionSpecifierProvider *)self _launchWithResourceDictionary:v5];
  if (!v6)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "FASharedSubscriptionSpecifierProvider doesn't have the specifier, will try again upon response.", v9, 2u);
    }

    objc_storeStrong((id *)&self->_cachedResourceDictionary, a3);
  }

  return v6;
}

- (BOOL)_launchWithResourceDictionary:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 objectForKeyedSubscript:*MEMORY[0x263F3BE30]];
  if (v4)
  {
    id v5 = [(FASharedSubscriptionSpecifierProvider *)self _specifierNamed:v4];
    cachedResourceDictionary = self->_cachedResourceDictionary;
    if (cachedResourceDictionary)
    {
      uint64_t v18 = @"HookContinuationParameters";
      v19[0] = cachedResourceDictionary;
      id v7 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
      [v5 setProperty:v7 forKey:@"FASharedServicesAdditionalParameters"];
      uint64_t v8 = _FALogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[FASharedSubscriptionSpecifierProvider _launchWithResourceDictionary:]();
      }
    }
    uint64_t v9 = _FALogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v10)
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "We have the service specifier, tapping!", (uint8_t *)&v14, 2u);
      }

      [(FASharedSubscriptionSpecifierProvider *)self _serviceSpecifierWasTapped:v5];
      BOOL v11 = 1;
    }
    else
    {
      if (v10)
      {
        specifiers = self->_specifiers;
        int v14 = 138412546;
        char v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = specifiers;
        _os_log_impl(&dword_2189F0000, v9, OS_LOG_TYPE_DEFAULT, "A specifier for \"%@\" was not found in: %@", (uint8_t *)&v14, 0x16u);
      }
      BOOL v11 = 0;
      id v5 = v9;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_delayedLoadIfNeeded
{
  if (self->_cachedResourceDictionary)
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "We have a cached resource dictionary, let's try launching.", v5, 2u);
    }

    [(FASharedSubscriptionSpecifierProvider *)self _launchWithResourceDictionary:self->_cachedResourceDictionary];
    cachedResourceDictionary = self->_cachedResourceDictionary;
    self->_cachedResourceDictionary = 0;
  }
}

- (id)_specifierNamed:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_specifiers;
  id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v9, "identifier", (void)v13);
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)reloadSpecifiers
{
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "Requesting shared subscription services", v7, 2u);
  }

  sharedSubscriptionResponse = self->_sharedSubscriptionResponse;
  self->_sharedSubscriptionResponse = 0;

  subscriptionsFamilyViewSpecifier = self->_subscriptionsFamilyViewSpecifier;
  self->_subscriptionsFamilyViewSpecifier = 0;

  subscriptionSpecifiers = self->_subscriptionSpecifiers;
  self->_subscriptionSpecifiers = 0;

  self->_numberOfGroups = 0;
  [(FASharedSubscriptionSpecifierProvider *)self _loadSubscriptionServices];
}

- (void)_addSharedSubscriptionsButtonWasTapped:(id)a3
{
  id v5 = [[FASharedSubscriptionsViewController alloc] initWithAppleAccount:self->_appleAccount sharedSubscriptionSpecifierProvider:self];
  id v4 = [(PSListController *)self->_presenter navigationController];
  [v4 pushViewController:v5 animated:1];
}

- (void)setSpecifiers:(id)a3
{
}

- (FASharedSubscriptionSpecifierProviderSelectionHandler)selectionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionHandler);
  return (FASharedSubscriptionSpecifierProviderSelectionHandler *)WeakRetained;
}

- (void)setSelectionHandler:(id)a3
{
}

- (void)setSubscriptionSpecifiers:(id)a3
{
}

- (void)setSubscriptionsFamilyViewSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsFamilyViewSpecifier, 0);
  objc_storeStrong((id *)&self->_subscriptionSpecifiers, 0);
  objc_destroyWeak((id *)&self->_selectionHandler);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_storeStrong((id *)&self->_cachedResourceDictionary, 0);
  objc_storeStrong((id *)&self->_networkActivityQueue, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_sharedSubscriptionResponse, 0);
  objc_storeStrong((id *)&self->_appleAccount, 0);
  objc_storeStrong((id *)&self->_spinnerCell, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

- (void)_iconURLStringForService:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "We did not recieve a valid screen scale - defaulting to 3x image url", v1, 2u);
}

- (void)_valueForServiceSpecifier:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2189F0000, v0, v1, "Value for service specifier: %@", v2, v3, v4, v5, v6);
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2189F0000, v0, v1, "BEGIN [%lld]: FetchFamilySubscriptions  enableTelemetry=YES ", v2, v3, v4, v5, v6);
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2189F0000, v0, v1, "Grabbed shared subscription URL string: %@", v2, v3, v4, v5, v6);
}

void __66__FASharedSubscriptionSpecifierProvider__loadSubscriptionServices__block_invoke_2_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_2189F0000, log, OS_LOG_TYPE_ERROR, "No URL string found for family subscriptions.", v1, 2u);
}

- (void)_launchWithResourceDictionary:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2189F0000, v0, v1, "Adding hook continuation params %@", v2, v3, v4, v5, v6);
}

@end