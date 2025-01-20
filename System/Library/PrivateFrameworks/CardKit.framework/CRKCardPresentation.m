@interface CRKCardPresentation
+ (void)initialize;
+ (void)registerProvider:(id)a3;
+ (void)unregisterProvider:(id)a3;
- (BOOL)cardSectionDisplayRequiresUserConsentForProvider:(id)a3;
- (BOOL)debugModeEnabled;
- (CRCard)card;
- (CRKCardPresentation)init;
- (CRKCardPresentationConfiguration)configuration;
- (CRKCardPresentationDelegate)delegate;
- (CRKCardViewControlling)cardViewController;
- (double)boundingWidthForProvider:(id)a3;
- (id)_cardSectionViewControllerForCardSection:(id)a3;
- (id)defaultFeedbackDelegateForProvider:(id)a3;
- (int64_t)cardSectionViewLoader:(id)a3 compareCardSectionViewProviderOne:(id)a4 providerTwo:(id)a5;
- (int64_t)semanticContentAttributeForCardFactory:(id)a3;
- (void)_configureWithRequestedCard:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_establishParsecSessionIfNeeded:(id)a3;
- (void)_fullyConfigureWithRequestedCard:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_loadAndRegisterBundleProviders:(id)a3;
- (void)_updateViewConfigurationsDebugMode:(BOOL)a3;
- (void)cardViewController:(id)a3 requestCardSectionViewSourceForCard:(id)a4 reply:(id)a5;
- (void)configureWithCardRequest:(id)a3 completion:(id)a4;
- (void)configureWithContent:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)setConfiguration:(id)a3;
- (void)setConfiguration:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDebugModeEnabled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)transitionAnimator:(id)a3 willTransitionFromCardViewController:(id)a4 toCardViewController:(id)a5 withAnimationCoordinator:(id)a6;
@end

@implementation CRKCardPresentation

+ (void)initialize
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___CRKCardPresentation;
  objc_msgSendSuper2(&v8, sel_initialize);
  CRLogInitIfNeeded();
  v2 = objc_alloc_init(_CRKBuiltInProvider);
  v3 = +[CRKIdentifiedProviderRegistry sharedInstance];
  [v3 registerIdentifiedProvider:v2];

  v4 = [MEMORY[0x263F31620] sharedInstance];
  v5 = objc_opt_new();
  [v4 registerIdentifiedService:v5];

  v6 = [MEMORY[0x263F1C920] mainScreen];
  v7 = +[_CRKImageLoader sharedInstanceWithInitialDelegate:v6];

  if (([v7 active] & 1) == 0) {
    [v7 setActive:1];
  }
}

- (CRKCardPresentation)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRKCardPresentation;
  v2 = [(CRKCardPresentation *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(_CRKCardSectionViewLoader);
    cardSectionViewLoader = v2->_cardSectionViewLoader;
    v2->_cardSectionViewLoader = v3;

    [(_CRKCardSectionViewLoader *)v2->_cardSectionViewLoader setDelegate:v2];
    v5 = (CRProtocolRestrictedInvocationChain *)objc_alloc_init(MEMORY[0x263F31698]);
    cardViewControllerDelegateChain = v2->_cardViewControllerDelegateChain;
    v2->_cardViewControllerDelegateChain = v5;

    [(CRProtocolRestrictedInvocationChain *)v2->_cardViewControllerDelegateChain setRestrictingProtocol:&unk_26D85C9C8];
    [(CRProtocolRestrictedInvocationChain *)v2->_cardViewControllerDelegateChain addChainedObject:v2];
  }
  return v2;
}

- (void)dealloc
{
  cardViewController = self->_cardViewController;
  if (cardViewController && self->_loadedCardViewControllerProvider)
  {
    objc_initWeak(&location, cardViewController);
    objc_initWeak(&from, self->_loadedCardViewControllerProvider);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__CRKCardPresentation_dealloc__block_invoke;
    v6[3] = &unk_26470EA28;
    objc_copyWeak(&v7, &location);
    objc_copyWeak(&v8, &from);
    v4 = (void (**)(void))MEMORY[0x22A6282E0](v6);
    if ([MEMORY[0x263F08B88] isMainThread]) {
      v4[2](v4);
    }
    else {
      dispatch_sync(MEMORY[0x263EF83A0], v4);
    }

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  v5.receiver = self;
  v5.super_class = (Class)CRKCardPresentation;
  [(CRKCardPresentation *)&v5 dealloc];
}

void __30__CRKCardPresentation_dealloc__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v3 unregisterCardViewController:v4];
    }

    id WeakRetained = v4;
  }
}

- (void)setConfiguration:(id)a3
{
}

- (void)setConfiguration:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke;
  v12[3] = &unk_26470EAC8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  BOOL v15 = a4;
  id v10 = v9;
  id v11 = v8;
  [(CRKCardPresentation *)self _establishParsecSessionIfNeeded:v12];
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *MEMORY[0x263F31630];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_224F73000, v4, OS_LOG_TYPE_INFO, "Parsec session is established", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, *(id *)(a1 + 32));
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_135;
  v11[3] = &unk_26470EAA0;
  objc_copyWeak(&v14, buf);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  char v15 = *(unsigned char *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(buf);
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_135(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[6] isEqual:*(void *)(a1 + 32)])
    {
      uint64_t v5 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v6;
        _os_log_impl(&dword_224F73000, v5, OS_LOG_TYPE_DEFAULT, "Input configuration %@ matches current configuration. Returning early.", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      objc_storeStrong(v4 + 6, *(id *)(a1 + 32));
      uint64_t v8 = [*(id *)(a1 + 32) cardRequest];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_136;
      v9[3] = &unk_26470EA78;
      objc_copyWeak(&v11, v2);
      char v12 = *(unsigned char *)(a1 + 56);
      id v10 = *(id *)(a1 + 40);
      [v8 startWithReply:v9];

      objc_destroyWeak(&v11);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, void, void))(v7 + 16))(v7, 0, 0);
    }
  }
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_136(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_2;
  block[3] = &unk_26470EA50;
  id v11 = v5;
  id v7 = v5;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  char v15 = *(unsigned char *)(a1 + 48);
  id v8 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v8;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_2(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) card];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    [WeakRetained _fullyConfigureWithRequestedCard:v2 animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = *MEMORY[0x263F31628];
      uint64_t v7 = *(void *)(a1 + 40);
      if (v7)
      {
        uint64_t v10 = *MEMORY[0x263F08608];
        v11[0] = v7;
        id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      }
      else
      {
        id v8 = 0;
      }
      id v9 = [v5 errorWithDomain:v6 code:401 userInfo:v8];
      (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 1, v9);

      if (v7) {
    }
      }
  }
}

- (CRCard)card
{
  v2 = [(CRKCardPresentation *)self cardViewController];
  id v3 = [v2 card];

  return (CRCard *)v3;
}

- (void)configureWithContent:(id)a3 completion:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F31618];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initWithContent:v8 format:0];

  [(CRKCardPresentation *)self configureWithCardRequest:v9 completion:v7];
}

- (void)configureWithCardRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CRKCardPresentationConfiguration alloc] initWithCardRequest:v7];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CRKCardPresentation_configureWithCardRequest_completion___block_invoke;
  v10[3] = &unk_26470EAF0;
  id v11 = v6;
  id v9 = v6;
  [(CRKCardPresentation *)self setConfiguration:v8 animated:0 completion:v10];
}

uint64_t __59__CRKCardPresentation_configureWithCardRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

+ (void)registerProvider:(id)a3
{
  id v3 = a3;
  id v4 = +[CRKIdentifiedProviderRegistry sharedInstance];
  [v4 registerIdentifiedProvider:v3];
}

+ (void)unregisterProvider:(id)a3
{
  id v3 = a3;
  id v4 = +[CRKIdentifiedProviderRegistry sharedInstance];
  [v4 unregisterIdentifiedProvider:v3];
}

- (void)setDebugModeEnabled:(BOOL)a3
{
  if (self->_debugModeEnabled != a3)
  {
    self->_debugModeEnabled = a3;
    -[CRKCardPresentation _updateViewConfigurationsDebugMode:](self, "_updateViewConfigurationsDebugMode:");
  }
}

- (void)_updateViewConfigurationsDebugMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(_CRKCardSectionViewLoader *)self->_cardSectionViewLoader _allViewConfigurations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _setDebugModeEnabled:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)_cardSectionViewControllerForCardSection:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(_CRKCardSectionViewLoader *)self->_cardSectionViewLoader cardSectionShouldBeDisplayed:v4])
  {
    uint64_t v5 = [(_CRKCardSectionViewLoader *)self->_cardSectionViewLoader viewConfigurationForCardSection:v4];
    uint64_t v6 = [v5 _cardKitCardSectionViewController];

    if (v6) {
      goto LABEL_8;
    }
    uint64_t v7 = [(CRKCardPresentation *)self cardViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v9 = [(CRKCardPresentation *)self cardViewController];
      uint64_t v6 = [v9 _cardSectionViewControllerForCardSection:v4];

      goto LABEL_8;
    }
  }
  else
  {
    long long v10 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
    {
      cardSectionViewLoader = self->_cardSectionViewLoader;
      int v13 = 138412802;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      v16 = cardSectionViewLoader;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_224F73000, v10, OS_LOG_TYPE_DEFAULT, "%@ not returning card section view controller because provider manager %@ marked card section %@ ineligble for display", (uint8_t *)&v13, 0x20u);
    }
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (void)_loadAndRegisterBundleProviders:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v11 = self;
    _os_log_impl(&dword_224F73000, v5, OS_LOG_TYPE_INFO, "Loading and registering bundle providers if necessary: %@", buf, 0xCu);
  }
  uint64_t v6 = +[_CRKProviderBundleManager sharedInstance];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__CRKCardPresentation__loadAndRegisterBundleProviders___block_invoke;
  v8[3] = &unk_26470EB18;
  id v9 = v4;
  id v7 = v4;
  [v6 getProviderBundlesWithCompletion:v8];
}

void __55__CRKCardPresentation__loadAndRegisterBundleProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      uint64_t v8 = *(void (**)(void))(v7 + 16);
LABEL_13:
      v8();
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = +[CRKIdentifiedProviderRegistry sharedInstance];
          [v14 registerIdentifiedProvider:v13];
        }
        uint64_t v10 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    if (v15)
    {
      uint64_t v8 = *(void (**)(void))(v15 + 16);
      goto LABEL_13;
    }
  }
}

- (void)_fullyConfigureWithRequestedCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(CRKCardPresentation *)self configuration];
  int v11 = [v10 loadsBundleProviders];

  if (v11)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke;
    v12[3] = &unk_26470EB68;
    id v14 = v9;
    objc_copyWeak(&v15, &location);
    id v13 = v8;
    BOOL v16 = v6;
    [(CRKCardPresentation *)self _loadAndRegisterBundleProviders:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(CRKCardPresentation *)self _configureWithRequestedCard:v8 animated:v6 completion:v9];
  }
}

void __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke_2;
  block[3] = &unk_26470EB40;
  id v6 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  char v10 = *(unsigned char *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

uint64_t __76__CRKCardPresentation__fullyConfigureWithRequestedCard_animated_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      [WeakRetained _configureWithRequestedCard:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 48)];
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5) {
        (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
      }
    }
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)_configureWithRequestedCard:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v25 = [v8 cardIdentifier];
  char v10 = +[CRKIdentifiedProviderRegistry sharedInstance];
  v26 = [v10 identifiedProviders];

  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke;
  v44[3] = &unk_26470EB90;
  v44[4] = self;
  id v11 = v8;
  id v45 = v11;
  v27 = [v26 sortedArrayUsingComparator:v44];
  uint64_t v12 = *MEMORY[0x263F31630];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v27;
    _os_log_impl(&dword_224F73000, v12, OS_LOG_TYPE_DEFAULT, "Sorted providers by card display priority\n    Providers: %@", buf, 0xCu);
  }
  id v13 = self->_cardViewController;
  objc_initWeak((id *)buf, self);
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152;
  v40[3] = &unk_26470EBB8;
  id v14 = v11;
  id v41 = v14;
  objc_copyWeak(&v43, (id *)buf);
  v42 = self;
  [v27 enumerateObjectsWithOptions:2 usingBlock:v40];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_190;
  v38[3] = &unk_26470EBE0;
  id v24 = v9;
  id v39 = v24;
  id v15 = (void *)MEMORY[0x22A6282E0](v38);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_2;
  v33[3] = &unk_26470EC30;
  objc_copyWeak(&v36, (id *)buf);
  BOOL v16 = v13;
  v34 = v16;
  BOOL v37 = a4;
  id v17 = v15;
  id v35 = v17;
  long long v18 = (void (**)(void, void))MEMORY[0x22A6282E0](v33);
  long long v19 = [(CRKCardViewControlling *)self->_cardViewController card];
  v20 = [v19 cardIdentifier];
  int v21 = [v20 isEqualToString:v25];

  if (v21)
  {
    cardSectionViewLoader = self->_cardSectionViewLoader;
    v23 = [MEMORY[0x263EFFA08] setWithArray:v26];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4;
    v28[3] = &unk_26470EC58;
    id v29 = v14;
    objc_copyWeak(&v32, (id *)buf);
    v30 = v18;
    id v31 = v17;
    [(_CRKCardSectionViewLoader *)cardSectionViewLoader _loadIdentifiedCardSectionViewProvidersFromCard:v29 identifiedProviders:v23 delegate:self completion:v28];

    objc_destroyWeak(&v32);
  }
  else
  {
    v18[2](v18, 1);
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v43);

  objc_destroyWeak((id *)buf);
}

uint64_t __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = [v8 cardPresentation:*(void *)(a1 + 32) compareCardViewControllerProviderOne:v5 providerTwo:v6];

    if (v9) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  if (objc_opt_respondsToSelector()) {
    unint64_t v10 = [v5 displayPriorityForCard:*(void *)(a1 + 40)];
  }
  else {
    unint64_t v10 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    unint64_t v11 = [v6 displayPriorityForCard:*(void *)(a1 + 40)];
  }
  else {
    unint64_t v11 = 0;
  }
  uint64_t v12 = 1;
  if (v10 <= v11) {
    uint64_t v12 = -1;
  }
  if (v10 == v11) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v12;
  }
LABEL_16:

  return v9;
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 cardViewControllerForCard:*(void *)(a1 + 32)];
    if (v8)
    {
      id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained)
      {
        unint64_t v10 = *MEMORY[0x263F31630];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 138412546;
          id v29 = v8;
          __int16 v30 = 2112;
          id v31 = v7;
          _os_log_impl(&dword_224F73000, v10, OS_LOG_TYPE_DEFAULT, "Succesfully loaded card view controller from provider\n    Card view controller: %@\n    Provider: %@", (uint8_t *)&v28, 0x16u);
        }
        objc_storeStrong(WeakRetained + 7, v8);
        objc_storeStrong(WeakRetained + 2, a2);
        unint64_t v11 = [WeakRetained delegate];
        if (objc_opt_respondsToSelector())
        {
          uint64_t v12 = [v11 cardViewControllerDelegate];
          id v13 = WeakRetained + 4;
          objc_storeWeak(WeakRetained + 4, v12);
        }
        else
        {
          id v13 = WeakRetained + 4;
          objc_storeWeak(WeakRetained + 4, 0);
        }
        id v22 = objc_loadWeakRetained(v13);
        BOOL v23 = v22 == 0;

        if (v23)
        {
          if ([v11 conformsToProtocol:&unk_26D86E2E8]) {
            id v24 = v11;
          }
          else {
            id v24 = 0;
          }
          objc_storeWeak(v13, v24);
        }
        objc_copyWeak((id *)&v28, v13);
        id v25 = objc_loadWeakRetained((id *)&v28);

        if (v25)
        {
          id v26 = WeakRetained[3];
          id v27 = objc_loadWeakRetained((id *)&v28);
          [v26 addChainedObject:v27];
        }
        [WeakRetained[3] addChainedObject:*(void *)(a1 + 40)];
        if ((objc_opt_respondsToSelector() & 1) != 0
          && [WeakRetained[3] conformsToProtocol:&unk_26D85C9C8])
        {
          [WeakRetained[7] setCardViewControllerDelegate:WeakRetained[3]];
        }
        *a4 = 1;
        objc_destroyWeak((id *)&v28);
      }
    }
    else
    {
      id v15 = *MEMORY[0x263F31630];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
        __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152_cold_1((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    id v14 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138412290;
      id v29 = v7;
      _os_log_impl(&dword_224F73000, v14, OS_LOG_TYPE_DEFAULT, "Unable to load card view controller from provider (provider does not provide card view controllers)\n    Provider: %@", (uint8_t *)&v28, 0xCu);
    }
  }
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_190(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    if (a3)
    {
      id v5 = *(void (**)(uint64_t, uint64_t, void))(v3 + 16);
      uint64_t v6 = *(void *)(a1 + 32);
      v5(v6, a2, 0);
    }
    else
    {
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F31628] code:300 userInfo:0];
      (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v7);
    }
  }
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = *(void **)(a1 + 32);
  if (v5
    && ([v5 parentViewController], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    id v7 = +[_CRKCardViewControllerTransitionAnimator sectionShuffleTransitionAnimator];
    [v7 setDelegate:WeakRetained];
    objc_initWeak(&location, WeakRetained);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained cardViewController];
    uint64_t v10 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    void v11[2] = __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_3;
    v11[3] = &unk_26470EC08;
    objc_copyWeak(&v13, &location);
    id v12 = *(id *)(a1 + 40);
    char v14 = a2;
    [v7 transitionFromCardViewController:v8 toCardViewController:v9 animated:v10 completion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(WeakRetained, "_updateViewConfigurationsDebugMode:", objc_msgSend(WeakRetained, "debugModeEnabled"));
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateViewConfigurationsDebugMode:", objc_msgSend(WeakRetained, "debugModeEnabled"));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = *MEMORY[0x263F31630];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR)) {
      __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  unint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[7] setCardSectionViewSource:WeakRetained[1]];
    if (objc_opt_respondsToSelector()) {
      [v11[2] presentation:v11 didApplyCardSectionViewSource:v11[1] toCardViewController:v11[7]];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_establishParsecSessionIfNeeded:(id)a3
{
  id v3 = a3;
  uint64_t v4 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CRKCardPresentation__establishParsecSessionIfNeeded___block_invoke;
  block[3] = &unk_26470EC80;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __55__CRKCardPresentation__establishParsecSessionIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = (id)[MEMORY[0x263F36D68] sharedSession];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (id)defaultFeedbackDelegateForProvider:(id)a3
{
  return self->_cardViewController;
}

- (BOOL)cardSectionDisplayRequiresUserConsentForProvider:(id)a3
{
  id v3 = [(CRKCardPresentation *)self configuration];
  char v4 = [v3 respectsUserConsent];

  return v4;
}

- (double)boundingWidthForProvider:(id)a3
{
  char v4 = [(CRKCardPresentation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 boundingWidthForPresentation:self];
    double Width = v5;
  }
  else
  {
    objc_opt_class();
    double Width = 0.0;
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(CRKCardPresentation *)self delegate];
      uint64_t v8 = [v7 view];
      [v8 bounds];
      double Width = CGRectGetWidth(v10);
    }
  }

  return Width;
}

- (int64_t)semanticContentAttributeForCardFactory:(id)a3
{
  char v4 = [(CRKCardPresentation *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v5 = [(CRKCardPresentation *)self delegate];
    int64_t v6 = [v5 semanticContentAttributeForCardPresentation:self];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)cardSectionViewLoader:(id)a3 compareCardSectionViewProviderOne:(id)a4 providerTwo:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [(CRKCardPresentation *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    unint64_t v11 = [(CRKCardPresentation *)self delegate];
    int64_t v12 = [v11 cardPresentation:self compareCardSectionViewProviderOne:v7 providerTwo:v8];
  }
  else
  {
    int64_t v12 = 0;
  }

  return v12;
}

- (void)transitionAnimator:(id)a3 willTransitionFromCardViewController:(id)a4 toCardViewController:(id)a5 withAnimationCoordinator:(id)a6
{
  id v12 = a4;
  id v9 = a5;
  id v10 = a6;
  unint64_t v11 = [(CRKCardPresentation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 cardPresentation:self willTransitionFromCardViewController:v12 toCardViewController:v9 withAnimationCoordinator:v10];
  }
}

- (void)cardViewController:(id)a3 requestCardSectionViewSourceForCard:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, _CRKCardSectionViewLoader *, void))a5;
  if (v10)
  {
    unint64_t v11 = [(_CRKCardSectionViewLoader *)self->_cardSectionViewLoader loadedCard];
    id v12 = [v11 cardIdentifier];
    id v13 = [v9 cardIdentifier];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      v10[2](v10, self->_cardSectionViewLoader, 0);
    }
    else
    {
      id v15 = objc_alloc_init(_CRKCardSectionViewLoader);
      uint64_t v16 = (void *)MEMORY[0x263EFFA08];
      uint64_t v17 = +[CRKIdentifiedProviderRegistry sharedInstance];
      uint64_t v18 = [v17 identifiedProviders];
      uint64_t v19 = [v16 setWithArray:v18];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __84__CRKCardPresentation_cardViewController_requestCardSectionViewSourceForCard_reply___block_invoke;
      v21[3] = &unk_26470ECA8;
      id v24 = v10;
      id v22 = v15;
      id v23 = v9;
      uint64_t v20 = v15;
      [(_CRKCardSectionViewLoader *)v20 _loadIdentifiedCardSectionViewProvidersFromCard:v23 identifiedProviders:v19 delegate:self completion:v21];
    }
  }
}

void __84__CRKCardPresentation_cardViewController_requestCardSectionViewSourceForCard_reply___block_invoke(void *a1, int a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[6];
  if (a2)
  {
    uint64_t v3 = a1[4];
    char v4 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v5 = a1[6];
    v4(v5, v3, 0);
  }
  else
  {
    int64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v7 = *MEMORY[0x263F31628];
    uint64_t v11 = *MEMORY[0x263F07F80];
    id v8 = [NSString stringWithFormat:@"Failed to load card section view controllers from card: %@", a1[5], 0];
    v12[0] = v8;
    id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v10 = [v6 errorWithDomain:v7 code:300 userInfo:v9];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v10);
  }
}

- (CRKCardPresentationConfiguration)configuration
{
  return self->_configuration;
}

- (CRKCardViewControlling)cardViewController
{
  return self->_cardViewController;
}

- (CRKCardPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKCardPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)debugModeEnabled
{
  return self->_debugModeEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cardViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_externalCardViewControllerDelegate);
  objc_storeStrong((id *)&self->_cardViewControllerDelegateChain, 0);
  objc_storeStrong((id *)&self->_loadedCardViewControllerProvider, 0);

  objc_storeStrong((id *)&self->_cardSectionViewLoader, 0);
}

void __60__CRKCardPresentation_setConfiguration_animated_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_152_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__CRKCardPresentation__configureWithRequestedCard_animated_completion___block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end