@interface SKProductRemoteViewTask
+ (id)_unavailableErrorWithUserInfo:(id)a3;
+ (id)_unknownErrorWithUserInfo:(id)a3;
- (BOOL)_isProductUnavailableError:(id)a3;
- (BOOL)_isViewControllerDescendant:(id)a3 ofViewController:(id)a4;
- (SKProductRemoteViewTask)initWithStoreController:(id)a3;
- (id)_hostApplicationIdentifier;
- (id)_keyProfileForProductLookup;
- (id)_productIDFromParameters:(id)a3;
- (int64_t)extensionControllerState;
- (void)_addChildController:(id)a3 toController:(id)a4;
- (void)_addConfigurationAction:(id)a3 needsEntitlement:(BOOL)a4;
- (void)_didReceiveExtensionRemoteViewController:(id)a3;
- (void)_dismissProductViewControllerWithResult:(int64_t)a3;
- (void)_displayItemIfNeeded;
- (void)_executeConfigurationActionsForExtension:(id)a3;
- (void)_executeConfigurationActionsForUIService:(id)a3;
- (void)_finishWithResult:(int64_t)a3;
- (void)_killExtensionIfNecessary;
- (void)_loadUIServiceIfNecessaryWithCompletion:(id)a3;
- (void)_showErrorController;
- (void)_showExtensionFromUIService;
- (void)_showExtensionWithID:(id)a3;
- (void)dealloc;
- (void)finishImmediately;
- (void)loadProductWithPageDictionary:(id)a3 completionBlock:(id)a4;
- (void)loadProductWithRequest:(id)a3 completionBlock:(id)a4;
- (void)loadProductWithURL:(id)a3 completionBlock:(id)a4;
- (void)lookupProductWithParameters:(id)a3 completion:(id)a4;
- (void)performLookupWithIdentifier:(NSString *)a3 parameters:(NSDictionary *)a4 logKey:(NSString *)a5 keyProfile:(NSString *)a6 completionHandler:(id)a7;
- (void)performLookupWithURL:(NSURL *)a3 logKey:(NSString *)a4 keyProfile:(NSString *)a5 completionHandler:(id)a6;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)productPageRemoteViewController:(id)a3 didTerminateWithError:(id)a4;
- (void)productPageRemoteViewController:(id)a3 finishWithResult:(unint64_t)a4 completion:(id)a5;
- (void)productPageRemoteViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4;
- (void)productPageRemoteViewControllerLoadDidFinish:(id)a3;
- (void)setAdditionalBuyParameters:(id)a3;
- (void)setAffiliateIdentifier:(id)a3;
- (void)setAskToBuy:(BOOL)a3;
- (void)setCancelButtonTitle:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setHostBundleIdentifier:(id)a3;
- (void)setPresentationStyle:(id)a3;
- (void)setPreview:(id)a3;
- (void)setProductPageStyle:(id)a3;
- (void)setPromptString:(id)a3;
- (void)setRightBarButtonTitle:(id)a3;
- (void)setScriptContextDictionary:(id)a3;
- (void)setShowsRightBarButton:(BOOL)a3;
- (void)setShowsStoreButton:(id)a3;
- (void)setUsageContext:(id)a3;
- (void)setVisibleInClientWindow:(id)a3;
- (void)storeProductViewControllerWillDisappear;
- (void)storeProductViewControllerWillDismiss;
@end

@implementation SKProductRemoteViewTask

- (SKProductRemoteViewTask)initWithStoreController:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SKProductRemoteViewTask;
  v5 = [(SKProductRemoteViewTask *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_storeController, v4);
    v6->_isAskToBuy = 0;
    extensionID = v6->_extensionID;
    v6->_extensionID = 0;

    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    v10 = [v9 componentsSeparatedByString:@"-"];
    uint64_t v11 = [v10 firstObject];
    logKey = v6->_logKey;
    v6->_logKey = (NSString *)v11;

    cachedParameters = v6->_cachedParameters;
    v6->_cachedParameters = 0;

    lookupResult = v6->_lookupResult;
    v6->_lookupResult = 0;

    lookupError = v6->_lookupError;
    v6->_lookupError = 0;

    v6->_isFetchingExtension = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    entitledConfigurationActions = v6->_entitledConfigurationActions;
    v6->_entitledConfigurationActions = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    configurationActions = v6->_configurationActions;
    v6->_configurationActions = v18;

    hostApplicationOverride = v6->_hostApplicationOverride;
    v6->_hostApplicationOverride = 0;

    *(_WORD *)&v6->_isPreview = 0;
    v6->_visibleInClientWindow = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_opt_class();
      v22 = v6->_logKey;
      *(_DWORD *)buf = 138543618;
      v27 = v21;
      __int16 v28 = 2114;
      v29 = v22;
      id v23 = v21;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Start.", buf, 0x16u);
    }
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = logKey;
    id v5 = v3;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Dealloc", buf, 0x16u);
  }
  extensionRemoteCardContainerViewController = self->_extensionRemoteCardContainerViewController;
  self->_extensionRemoteCardContainerViewController = 0;

  [(SKProductRemoteViewTask *)self _killExtensionIfNecessary];
  v7.receiver = self;
  v7.super_class = (Class)SKProductRemoteViewTask;
  [(SKProductRemoteViewTask *)&v7 dealloc];
}

- (void)_dismissProductViewControllerWithResult:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = logKey;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Finishing controller.", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SKProductRemoteViewTask__dismissProductViewControllerWithResult___block_invoke;
  v7[3] = &unk_1E5FAAB70;
  v7[4] = self;
  v7[5] = a3;
  [WeakRetained dismissViewControllerAnimated:1 completion:v7];
}

void __67__SKProductRemoteViewTask__dismissProductViewControllerWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 8);
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
  id v5 = WeakRetained;
  if (v3) {
    [WeakRetained _didFinishWithResult:*(void *)(a1 + 40)];
  }
  else {
    [WeakRetained _didFinish];
  }
}

- (void)lookupProductWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
  int v9 = [WeakRetained _isInvalidSubclass];

  if (!v9)
  {
    __int16 v10 = [(SKProductRemoteViewTask *)self _productIDFromParameters:v6];
    if (v10)
    {
      self->_didLoad = 0;
      objc_initWeak(&location, self);
      uint64_t v11 = (void *)[(NSString *)self->_logKey copy];
      uint64_t v12 = [(SKProductRemoteViewTask *)self _keyProfileForProductLookup];
      v13 = (NSDictionary *)[v6 copy];
      cachedParameters = self->_cachedParameters;
      self->_cachedParameters = v13;

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke;
      v16[3] = &unk_1E5FAAB98;
      objc_copyWeak(&v18, &location);
      id v17 = v7;
      [(SKProductRemoteViewTask *)self performLookupWithIdentifier:v10 parameters:v6 logKey:v11 keyProfile:v12 completionHandler:v16];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:5 userInfo:0];
      if (v7) {
        (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v15);
      }
    }
    goto LABEL_9;
  }
  if (v7)
  {
    __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
LABEL_9:
  }
}

void __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained(WeakRetained + 18);
    int v10 = [v9 _isInvalidSubclass];

    if (!v10)
    {
      if (!v5 || v6)
      {
        objc_storeStrong(v8 + 8, a3);
        uint64_t v33 = *(void *)(a1 + 32);
        if (v33)
        {
          id v23 = *(void (**)(void))(v33 + 16);
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v11 = [v5 deepLinkURL];
        if (v11)
        {
          uint64_t v12 = (void *)v11;
          v13 = [MEMORY[0x1E4FB1438] sharedApplication];
          v14 = [v5 deepLinkURL];
          char v15 = [v13 canOpenURL:v14];

          if ((v15 & 1) == 0)
          {
            BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v34) {
              __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
            }
            v42 = +[SKProductRemoteViewTask _unknownErrorWithUserInfo:0];
            objc_storeStrong(v8 + 8, v42);
            uint64_t v43 = *(void *)(a1 + 32);
            if (v43) {
              (*(void (**)(uint64_t, void, void *))(v43 + 16))(v43, 0, v42);
            }

            goto LABEL_21;
          }
        }
        uint64_t v16 = [v5 deepLinkURL];
        id v17 = v8[9];
        v8[9] = (id)v16;

        uint64_t v18 = [v5 resultDictionary];
        id v19 = v8[7];
        v8[7] = (id)v18;

        *((unsigned char *)v8 + 8) = [v5 isEntitled];
        uint64_t v20 = [v5 extensionBundleID];
        id v21 = v8[2];
        v8[2] = (id)v20;

        uint64_t v22 = *(void *)(a1 + 32);
        if (v22)
        {
          id v23 = *(void (**)(void))(v22 + 16);
LABEL_15:
          v23();
        }
      }
LABEL_21:
      [v8 _displayItemIfNeeded];
      goto LABEL_22;
    }
  }
  else
  {
    BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v24) {
      __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  if (*(void *)(a1 + 32))
  {
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
LABEL_22:
}

- (int64_t)extensionControllerState
{
  int64_t result = (int64_t)self->_extensionRemoteCardContainerViewController;
  if (result) {
    return [(id)result didDisappear];
  }
  return result;
}

- (void)storeProductViewControllerWillDisappear
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];
  int v5 = [@"com.apple.Spotlight" isEqualToString:v4];

  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      logKey = self->_logKey;
      *(_DWORD *)id v9 = 138543618;
      *(void *)&v9[4] = v6;
      *(_WORD *)&v9[12] = 2114;
      *(void *)&v9[14] = logKey;
      id v8 = v6;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Disappearing.", v9, 0x16u);
    }
    [(SKProductRemoteViewTask *)self finishImmediately];
  }
}

- (void)storeProductViewControllerWillDismiss
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = objc_opt_class();
    logKey = self->_logKey;
    *(_DWORD *)id v9 = 138543618;
    *(void *)&v9[4] = v3;
    *(_WORD *)&v9[12] = 2114;
    *(void *)&v9[14] = logKey;
    id v5 = v3;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Will dismiss.", v9, 0x16u);
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", *(_OWORD *)v9, *(void *)&v9[16], v10);
  id v7 = [v6 bundleIdentifier];
  int v8 = [@"com.apple.Spotlight" isEqualToString:v7];

  if (v8) {
    [(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController dismissViewControllerAnimated:1 completion:&__block_literal_global_12];
  }
}

void __64__SKProductRemoteViewTask_storeProductViewControllerWillDismiss__block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Did dismiss.", v0, 2u);
  }
}

- (void)setPresentationStyle:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SKProductRemoteViewTask_setPresentationStyle___block_invoke;
  v6[3] = &unk_1E5FAABC0;
  id v7 = v4;
  id v5 = v4;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v6 needsEntitlement:0];
}

uint64_t __48__SKProductRemoteViewTask_setPresentationStyle___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  if (a3) {
    return [a3 setPresentationStyle:*(void *)(result + 32)];
  }
  return result;
}

- (void)setPreview:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  self->_isPreview = [v4 BOOLValue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__SKProductRemoteViewTask_setPreview___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:0];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __38__SKProductRemoteViewTask_setPreview___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __38__SKProductRemoteViewTask_setPreview___block_invoke_cold_1();
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = v6;
LABEL_7:
    [v9 setPreview:v8];
  }
}

- (void)setVisibleInClientWindow:(id)a3
{
  id v4 = a3;
  self->_visibleInClientWindow = [v4 BOOLValue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__SKProductRemoteViewTask_setVisibleInClientWindow___block_invoke;
  v6[3] = &unk_1E5FAABC0;
  id v7 = v4;
  id v5 = v4;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v6 needsEntitlement:0];
}

void __52__SKProductRemoteViewTask_setVisibleInClientWindow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = v7;
  if (v7 || (id v6 = v5) != 0) {
    [v6 setVisibleInClientWindow:*(void *)(a1 + 32)];
  }
}

- (void)_addConfigurationAction:(id)a3 needsEntitlement:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (self->_extensionRemoteViewController)
  {
    if (v4 && !self->_isClientEntitled)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:]();
      }
      uint64_t v8 = (void (*)(void))v7[2];
    }
    else
    {
      uint64_t v8 = (void (*)(void))v6[2];
    }
    v8();
  }
  else if (self->_uiServiceRemoteViewController)
  {
    id v9 = (void *)[(NSString *)self->_logKey copy];
    objc_initWeak(&location, self);
    uiServiceRemoteViewController = self->_uiServiceRemoteViewController;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke;
    v16[3] = &unk_1E5FAAC10;
    objc_copyWeak(&v18, &location);
    id v11 = v9;
    id v17 = v11;
    uint64_t v12 = [(_UIRemoteViewController *)uiServiceRemoteViewController serviceViewControllerProxyWithErrorHandler:v16];
    ((void (*)(void *, void, void *))v7[2])(v7, 0, v12);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    configurationActions = self->_configurationActions;
    if (configurationActions && !v4 || (configurationActions = self->_entitledConfigurationActions) != 0 && v4)
    {
      v14 = (void *)[v6 copy];
      char v15 = _Block_copy(v14);
      [(NSMutableArray *)configurationActions addObject:v15];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      -[SKProductRemoteViewTask _addConfigurationAction:needsEntitlement:]();
    }
  }
}

void __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1();
  }
}

- (void)_executeConfigurationActionsForUIService:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_entitledConfigurationActions;
  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  entitledConfigurationActions = self->_entitledConfigurationActions;
  self->_entitledConfigurationActions = v6;

  uint64_t v8 = self->_configurationActions;
  id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  configurationActions = self->_configurationActions;
  self->_configurationActions = v9;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v5;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = v8;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * v20) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * v20));
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (void)_executeConfigurationActionsForExtension:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_entitledConfigurationActions;
  id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  entitledConfigurationActions = self->_entitledConfigurationActions;
  self->_entitledConfigurationActions = v6;

  uint64_t v8 = self->_configurationActions;
  id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  configurationActions = self->_configurationActions;
  self->_configurationActions = v9;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = v5;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * i) + 16))();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = v8;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v21 + 1) + 8 * j) + 16))(*(void *)(*((void *)&v21 + 1) + 8 * j));
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v18);
  }
}

- (void)_displayItemIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke;
  block[3] = &unk_1E5FA9A08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  id v3 = [WeakRetained presentingViewController];

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    id v5 = [v4 presentedViewController];

    if (!v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v6 + 24))
      {
        id v7 = objc_loadWeakRetained((id *)(v6 + 144));
        int v8 = [v7 _isInvalidSubclass];

        uint64_t v9 = *(void *)(a1 + 32);
        if (v8)
        {
          [(id)v9 _dismissProductViewControllerWithResult:0];
        }
        else if (*(void *)(v9 + 72))
        {
          id v10 = (void *)[*(id *)(v9 + 72) copy];
          objc_initWeak(&location, *(id *)(a1 + 32));
          id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke_2;
          v14[3] = &unk_1E5FAAC38;
          id v12 = v10;
          id v15 = v12;
          objc_copyWeak(&v16, &location);
          [v11 dismissViewControllerAnimated:1 completion:v14];

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
        else if (*(void *)(v9 + 16))
        {
          objc_msgSend((id)v9, "_showExtensionWithID:");
        }
        else if (*(void *)(v9 + 64) {
               && (v13 = objc_msgSend((id)v9, "_isProductUnavailableError:"), uint64_t v9 = *(void *)(a1 + 32), !v13))
        }
        {
          [(id)v9 _showErrorController];
        }
        else
        {
          [(id)v9 _showExtensionFromUIService];
        }
      }
    }
  }
}

void __47__SKProductRemoteViewTask__displayItemIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:&__block_literal_global_32];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finishWithResult:3];
}

- (BOOL)_isViewControllerDescendant:(id)a3 ofViewController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  int v8 = v7;
  id v9 = v7;
  if (v7)
  {
    id v9 = v7;
    if (v7 != v6)
    {
      id v9 = v7;
      do
      {
        id v10 = v9;
        id v9 = [v9 parentViewController];
      }
      while (v9 && v9 != v6);
    }
  }

  return v9 == v6;
}

- (BOOL)_isProductUnavailableError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:@"ASDErrorDomain"]) {
      BOOL v6 = [v4 code] == 512;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_showErrorController
{
  self->_isFetchingExtension = 1;
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__SKProductRemoteViewTask__showErrorController__block_invoke;
  v3[3] = &unk_1E5FAAC88;
  objc_copyWeak(&v4, &location);
  [(SKProductRemoteViewTask *)self _loadUIServiceIfNecessaryWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__SKProductRemoteViewTask__showErrorController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = WeakRetained;
  if (v3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__SKProductRemoteViewTask__showErrorController__block_invoke_2;
    v7[3] = &unk_1E5FAAC60;
    objc_copyWeak(&v8, v4);
    [v3 showErrorPageWithCompletion:v7];
    objc_destroyWeak(&v8);
  }
  else if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 24) = 0;
  }
}

void __47__SKProductRemoteViewTask__showErrorController__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[24] = 0;
  }
}

- (void)_loadUIServiceIfNecessaryWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  uiServiceRemoteViewController = self->_uiServiceRemoteViewController;
  if (uiServiceRemoteViewController)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_40;
    v11[3] = &unk_1E5FAAC10;
    id v7 = &v13;
    objc_copyWeak(&v13, &location);
    id v12 = v5;
    id v8 = [(_UIRemoteViewController *)uiServiceRemoteViewController serviceViewControllerProxyWithErrorHandler:v11];
    v4[2](v4, v8);
    id v9 = &v12;
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke;
    v14[3] = &unk_1E5FAACB0;
    id v7 = &v18;
    objc_copyWeak(&v18, &location);
    uint64_t v17 = v4;
    id v15 = v5;
    id v16 = self;
    id v10 = +[_UIRemoteViewController requestViewController:@"ServiceProductPageViewController" fromServiceWithBundleIdentifier:@"com.apple.ios.StoreKitUIService" connectionHandler:v14];
    id v9 = (id *)&v17;
    id v8 = v15;
  }

  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v9 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_10;
  }
  if (!v6 || v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_cold_1();
    }
    goto LABEL_9;
  }
  objc_storeStrong(WeakRetained + 17, a2);
  id v10 = v9[17];
  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
  [v10 setProductViewController:v11];

  id v12 = v9[17];
  id v13 = objc_loadWeakRetained(v9 + 18);
  [v9 _addChildController:v12 toController:v13];

  uint64_t v14 = *(void **)(*(void *)(a1 + 40) + 136);
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_38;
  uint64_t v20 = &unk_1E5FAAC10;
  objc_copyWeak(&v22, (id *)(a1 + 56));
  id v21 = *(id *)(a1 + 32);
  id v15 = [v14 serviceViewControllerProxyWithErrorHandler:&v17];
  id v16 = v15;
  if (*(void *)(*(void *)(a1 + 40) + 40)) {
    objc_msgSend(v15, "setHostBundleIdentifier:", v17, v18, v19, v20);
  }
  objc_msgSend(v9, "_executeConfigurationActionsForUIService:", v16, v17, v18, v19, v20);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

  objc_destroyWeak(&v22);
LABEL_10:
}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1();
  }
}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1();
  }
}

- (void)_addChildController:(id)a3 toController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v5 addChildViewController:v6];
  id v7 = [v5 view];
  id v8 = [v6 view];
  [v7 addSubview:v8];

  id v9 = [v6 view];
  id v10 = [v5 view];

  [v10 bounds];
  objc_msgSend(v9, "setFrame:");

  id v11 = [v6 view];

  [v11 setAutoresizingMask:18];
}

- (void)_showExtensionWithID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_didLoad)
    {
      if (!self->_isPreview)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
        [WeakRetained presentViewController:self->_extensionRemoteCardContainerViewController animated:1 completion:&__block_literal_global_42];
      }
    }
    else
    {
      self->_isFetchingExtension = 1;
      if (self->_extensionRemoteContainerViewController)
      {
        [(SKProductRemoteViewTask *)self _killExtensionIfNecessary];
        id v6 = [(_UIRemoteViewController *)self->_extensionRemoteViewController disconnect];
        extensionRemoteViewController = self->_extensionRemoteViewController;
        self->_extensionRemoteViewController = 0;

        [(_UIResilientRemoteViewContainerViewController *)self->_extensionRemoteContainerViewController invalidate];
        extensionRemoteContainerViewController = self->_extensionRemoteContainerViewController;
        self->_extensionRemoteContainerViewController = 0;

        id v9 = [NSNumber numberWithBool:self->_visibleInClientWindow];
        [(SKProductRemoteViewTask *)self setVisibleInClientWindow:v9];
      }
      id v19 = 0;
      id v10 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v4 error:&v19];
      id v11 = v19;
      if (v10)
      {
        objc_storeStrong((id *)&self->_productPageExtension, v10);
        objc_initWeak(&location, self);
        id v12 = (void *)[(NSString *)self->_logKey copy];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_45;
        v14[3] = &unk_1E5FAAD00;
        void v14[4] = self;
        id v15 = v10;
        objc_copyWeak(&v17, &location);
        id v16 = v12;
        id v13 = v12;
        dispatch_async(MEMORY[0x1E4F14428], v14);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[SKProductRemoteViewTask _showExtensionWithID:]();
        }
        [(SKProductRemoteViewTask *)self _showErrorController];
        self->_isFetchingExtension = 0;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[SKProductRemoteViewTask _showExtensionWithID:]();
  }
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_45(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB2260];
  uint64_t v3 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2;
  v7[3] = &unk_1E5FAACD8;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 48);
  uint64_t v4 = [v2 instantiateWithExtension:v3 completion:v7];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v4;

  objc_destroyWeak(&v9);
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v12 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong((id *)WeakRetained + 11, a2);
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_2();
      }
    }
    else if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 32);
        int v14 = 138543618;
        id v15 = v12;
        __int16 v16 = 2114;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Completed loading extension.", (uint8_t *)&v14, 0x16u);
      }
      [v12 _didReceiveExtensionRemoteViewController:v9];
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_1();
    }
    v12[24] = 0;
    v12[26] = 1;
  }
}

- (void)_didReceiveExtensionRemoteViewController:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_extensionRemoteViewController, a3);
  id v6 = objc_alloc_init(ServiceCardContainerViewController);
  extensionRemoteCardContainerViewController = self->_extensionRemoteCardContainerViewController;
  self->_extensionRemoteCardContainerViewController = v6;

  id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
  id v9 = [(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController view];
  [v9 setTintColor:v8];

  [(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController setRemoteViewController:v5];
  [(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController setChildViewController:self->_extensionRemoteContainerViewController];
  id v10 = [(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController presentationController];
  [v10 setDelegate:self];

  if (self->_isPreview)
  {
    id v11 = self->_extensionRemoteCardContainerViewController;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
    [(SKProductRemoteViewTask *)self _addChildController:v11 toController:WeakRetained];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
    [WeakRetained presentViewController:self->_extensionRemoteCardContainerViewController animated:1 completion:&__block_literal_global_51];
  }

  [v5 setDelegate:self];
  [(SKProductRemoteViewTask *)self _executeConfigurationActionsForExtension:self->_extensionRemoteViewController];
  uint64_t v13 = (void *)[(NSString *)self->_logKey copy];
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2;
  v19[3] = &unk_1E5FAAC10;
  objc_copyWeak(&v21, &location);
  id v14 = v13;
  id v20 = v14;
  id v15 = [v5 serviceViewControllerProxyWithErrorHandler:v19];
  if (v15 && self->_lookupResult && self->_cachedParameters)
  {
    __int16 v16 = [(SKProductRemoteViewTask *)self _hostApplicationIdentifier];
    if (v16) {
      [(SKProductPageRemoteViewController *)self->_extensionRemoteViewController setupWithClientBundleID:v16 bagType:0];
    }
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F4DCF8]) initWithLookupDictionary:self->_lookupResult];
    uint64_t v18 = (void *)[(NSDictionary *)self->_cachedParameters mutableCopy];
    [v18 removeObjectForKey:@"id"];
    [v15 clientLookupItemDidLoad:v17 parameters:v18];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2(uint64_t a1, void *a2)
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2_cold_1(a1, a2);
  }
}

- (void)_showExtensionFromUIService
{
  if (self->_cachedParameters && self->_lookupResult)
  {
    uint64_t v3 = -[SKProductRemoteViewTask _productIDFromParameters:](self, "_productIDFromParameters:");
    if (v3)
    {
      self->_isFetchingExtension = 1;
      uint64_t v4 = (void *)[(NSDictionary *)self->_cachedParameters copy];
      id v5 = (void *)[(NSDictionary *)self->_lookupResult copy];
      id v6 = (void *)[(NSString *)self->_logKey copy];
      objc_initWeak(&location, self);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke;
      v10[3] = &unk_1E5FAAD28;
      objc_copyWeak(&v15, &location);
      id v7 = v5;
      id v11 = v7;
      id v12 = v3;
      id v8 = v4;
      id v13 = v8;
      id v9 = v6;
      id v14 = v9;
      [(SKProductRemoteViewTask *)self _loadUIServiceIfNecessaryWithCompletion:v10];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      [(SKProductRemoteViewTask *)self _dismissProductViewControllerWithResult:0];
    }
  }
}

void __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = WeakRetained;
  if (v3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke_2;
    v10[3] = &unk_1E5FAAC60;
    objc_copyWeak(&v11, (id *)(a1 + 64));
    [v3 showPageForLookupResult:v6 productID:v7 parameters:v8 logKey:v9 completion:v10];
    objc_destroyWeak(&v11);
  }
  else if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 24) = 0;
  }
}

void __54__SKProductRemoteViewTask__showExtensionFromUIService__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[24] = 0;
  }
}

- (void)_killExtensionIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_productPageExtension)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      logKey = self->_logKey;
      int v4 = 138543618;
      id v5 = self;
      __int16 v6 = 2114;
      uint64_t v7 = logKey;
      _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Killing extension.", (uint8_t *)&v4, 0x16u);
    }
    if (self->_extensionRequest) {
      -[NSExtension cancelExtensionRequestWithIdentifier:](self->_productPageExtension, "cancelExtensionRequestWithIdentifier:");
    }
    [(NSExtension *)self->_productPageExtension _kill:9];
  }
}

- (id)_keyProfileForProductLookup
{
  if (self->_isAskToBuy) {
    return @"product-dv";
  }
  else {
    return @"lockup-dv";
  }
}

- (id)_productIDFromParameters:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"id"];
  if (!v3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v3 length]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v3 integerValue])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKProductRemoteViewTask _productIDFromParameters:]();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v3 stringValue], (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKProductRemoteViewTask _productIDFromParameters:]();
    }
LABEL_10:
    id v4 = 0;
  }
LABEL_11:

  return v4;
}

- (void)_finishWithResult:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = logKey;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Finishing.", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  extensionRemoteCardContainerViewController = self->_extensionRemoteCardContainerViewController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__SKProductRemoteViewTask__finishWithResult___block_invoke;
  v7[3] = &unk_1E5FAAD50;
  objc_copyWeak(v8, (id *)buf);
  v8[1] = (id)a3;
  [(ServiceCardContainerViewController *)extensionRemoteCardContainerViewController dismissViewControllerAnimated:1 completion:v7];
  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

void __45__SKProductRemoteViewTask__finishWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v6 = 0;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Remote controller dismissed.", v6, 2u);
  }
  if (WeakRetained)
  {
    int v3 = *((unsigned __int8 *)WeakRetained + 8);
    id v4 = objc_loadWeakRetained(WeakRetained + 18);
    id v5 = v4;
    if (v3) {
      [v4 _didFinishWithResult:*(void *)(a1 + 40)];
    }
    else {
      [v4 _didFinish];
    }
  }
}

- (void)productPageRemoteViewController:(id)a3 finishWithResult:(unint64_t)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v12 = 138543618;
    uint64_t v13 = self;
    __int16 v14 = 2114;
    id v15 = logKey;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product page finished.", (uint8_t *)&v12, 0x16u);
  }
  if (a4 > 3) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = qword_1B01E3628[a4];
  }
  [(SKProductRemoteViewTask *)self _finishWithResult:v11];
}

- (void)productPageRemoteViewControllerLoadDidFinish:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    logKey = self->_logKey;
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = logKey;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "[%{public}@][%{public}@]: Product page finished loading.", (uint8_t *)&v7, 0x16u);
  }
  __int16 v6 = [(_UIResilientRemoteViewContainerViewController *)self->_extensionRemoteContainerViewController remoteViewController];
  [(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController setRemoteViewController:v6];

  if (![(SKProductRemoteViewTask *)self _isViewControllerDescendant:self->_extensionRemoteContainerViewController ofViewController:self->_extensionRemoteCardContainerViewController])[(ServiceCardContainerViewController *)self->_extensionRemoteCardContainerViewController setChildViewController:self->_extensionRemoteContainerViewController]; {
}
  }

- (void)productPageRemoteViewController:(id)a3 userDidInteractWithProduct:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v9 = 138543618;
    id v10 = self;
    __int16 v11 = 2114;
    int v12 = logKey;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Product page user did interact with product.", (uint8_t *)&v9, 0x16u);
  }
  if (a4 >= 3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKProductRemoteViewTask productPageRemoteViewController:userDidInteractWithProduct:]();
    }
  }
  else if (self->_isClientEntitled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_storeController);
    [WeakRetained _userDidInteractWithProduct:a4];
  }
}

- (void)productPageRemoteViewController:(id)a3 didTerminateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[SKProductRemoteViewTask productPageRemoteViewController:didTerminateWithError:]();
  }
  id v8 = [(_UIResilientRemoteViewContainerViewController *)self->_extensionRemoteContainerViewController remoteViewController];

  if (v8 == v6) {
    [(SKProductRemoteViewTask *)self _finishWithResult:1];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    logKey = self->_logKey;
    int v5 = 138543618;
    id v6 = self;
    __int16 v7 = 2114;
    id v8 = logKey;
    _os_log_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@][%{public}@]: Presentation controller dismissed.", (uint8_t *)&v5, 0x16u);
  }
  [(SKProductRemoteViewTask *)self _finishWithResult:1];
}

- (void)loadProductWithPageDictionary:(id)a3 completionBlock:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[SKProductRemoteViewTask loadProductWithPageDictionary:completionBlock:]();
  }
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:0 userInfo:0];
  v4[2](v4, 0, v5);
}

- (void)loadProductWithRequest:(id)a3 completionBlock:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[SKProductRemoteViewTask loadProductWithRequest:completionBlock:]();
  }
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:0 userInfo:0];
  v4[2](v4, 0, v5);
}

- (void)loadProductWithURL:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    id v8 = [(SKProductRemoteViewTask *)self _keyProfileForProductLookup];
    logKey = self->_logKey;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__SKProductRemoteViewTask_loadProductWithURL_completionBlock___block_invoke;
    v11[3] = &unk_1E5FAAB98;
    objc_copyWeak(&v13, &location);
    id v12 = v7;
    [(SKProductRemoteViewTask *)self performLookupWithURL:v6 logKey:logKey keyProfile:v8 completionHandler:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[SKProductRemoteViewTask loadProductWithURL:completionBlock:]();
    }
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:5 userInfo:0];
    if (v7) {
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
    }
  }
}

void __62__SKProductRemoteViewTask_loadProductWithURL_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      objc_storeStrong(WeakRetained + 8, a3);
      uint64_t v33 = *(void *)(a1 + 32);
      if (v33)
      {
        long long v23 = *(void (**)(void))(v33 + 16);
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v9 = [v5 deepLinkURL];
      if (v9)
      {
        id v10 = (void *)v9;
        __int16 v11 = [MEMORY[0x1E4FB1438] sharedApplication];
        id v12 = [v5 deepLinkURL];
        char v13 = [v11 canOpenURL:v12];

        if ((v13 & 1) == 0)
        {
          BOOL v34 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v34) {
            __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_2(v34, v35, v36, v37, v38, v39, v40, v41);
          }
          v42 = +[SKProductRemoteViewTask _unknownErrorWithUserInfo:0];
          objc_storeStrong(v8 + 8, v42);
          uint64_t v43 = *(void *)(a1 + 32);
          if (v43) {
            (*(void (**)(uint64_t, void, void *))(v43 + 16))(v43, 0, v42);
          }

          goto LABEL_20;
        }
      }
      uint64_t v14 = [v5 deepLinkURL];
      id v15 = v8[9];
      v8[9] = (id)v14;

      uint64_t v16 = [v5 resultDictionary];
      id v17 = v8[7];
      v8[7] = (id)v16;

      *((unsigned char *)v8 + 8) = [v5 isEntitled];
      uint64_t v18 = [v5 extensionBundleID];
      id v19 = v8[2];
      id v8[2] = (id)v18;

      uint64_t v20 = [v5 parameters];
      id v21 = v8[6];
      v8[6] = (id)v20;

      uint64_t v22 = *(void *)(a1 + 32);
      if (v22)
      {
        long long v23 = *(void (**)(void))(v22 + 16);
LABEL_14:
        v23();
      }
    }
LABEL_20:
    [v8 _displayItemIfNeeded];
    goto LABEL_21;
  }
  BOOL v24 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  if (v24) {
    __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
  }
  if (*(void *)(a1 + 32))
  {
    v32 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"SKErrorDomain" code:0 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
LABEL_21:
}

- (void)setAdditionalBuyParameters:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setAdditionalBuyParameters:v8];
  }
}

- (void)setAffiliateIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setAffiliateIdentifier:v8];
  }
}

- (void)setClientIdentifier:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setClientIdentifier:v8];
  }
}

- (void)setHostBundleIdentifier:(id)a3
{
}

- (id)_hostApplicationIdentifier
{
  if (self->_isClientEntitled && (hostApplicationOverride = self->_hostApplicationOverride) != 0)
  {
    int v3 = hostApplicationOverride;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28B50] mainBundle];
    int v3 = [v4 bundleIdentifier];
  }

  return v3;
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setCancelButtonTitle:v8];
  }
}

- (void)setRightBarButtonTitle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setRightBarButtonTitle:v8];
  }
}

- (void)setShowsRightBarButton:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke;
  v7[3] = &unk_1E5FAAD78;
  objc_copyWeak(&v9, &location);
  id v6 = v5;
  id v8 = v6;
  BOOL v10 = a3;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v7 needsEntitlement:1];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke_cold_1(a1);
    }
    [v5 setShowsRightBarButton:*(unsigned __int8 *)(a1 + 48)];
  }
  else if (v6)
  {
    id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    [v7 setShowsRightBarButton:v8];
  }
}

- (void)setPromptString:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __43__SKProductRemoteViewTask_setPromptString___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __43__SKProductRemoteViewTask_setPromptString___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __43__SKProductRemoteViewTask_setPromptString___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setPromptString:v8];
  }
}

- (void)setProductPageStyle:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setProductPageStyle:v8];
  }
}

- (void)setShowsStoreButton:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke_cold_1(a1);
    }
    objc_msgSend(v5, "setShowsStoreButton:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  }
  else if (v6)
  {
    [v6 setShowsStoreButton:*(void *)(a1 + 40)];
  }
}

- (void)setScriptContextDictionary:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setScriptContextDictionary:v8];
  }
}

- (void)setUsageContext:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __43__SKProductRemoteViewTask_setUsageContext___block_invoke;
  v8[3] = &unk_1E5FAABE8;
  objc_copyWeak(&v11, &location);
  id v6 = v5;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v8 needsEntitlement:1];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __43__SKProductRemoteViewTask_setUsageContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __43__SKProductRemoteViewTask_setUsageContext___block_invoke_cold_1(a1);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    id v6 = v5;
    goto LABEL_7;
  }
  if (v6)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    [v6 setUsageContext:v8];
  }
}

- (void)setAskToBuy:(BOOL)a3
{
  self->_isAskToBuy = a3;
  objc_initWeak(&location, self);
  id v5 = (void *)[(NSString *)self->_logKey copy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__SKProductRemoteViewTask_setAskToBuy___block_invoke;
  v7[3] = &unk_1E5FAAD78;
  objc_copyWeak(&v9, &location);
  id v6 = v5;
  id v8 = v6;
  BOOL v10 = a3;
  [(SKProductRemoteViewTask *)self _addConfigurationAction:v7 needsEntitlement:1];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __39__SKProductRemoteViewTask_setAskToBuy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      __39__SKProductRemoteViewTask_setAskToBuy___block_invoke_cold_1(a1);
    }
    [v5 setAskToBuy:*(unsigned __int8 *)(a1 + 48)];
  }
  else if (v6)
  {
    id v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    [v7 setAskToBuy:v8];
  }
}

- (void)finishImmediately
{
}

void __44__SKProductRemoteViewTask_finishImmediately__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v4 = a3;
  id v5 = v6;
  if (v6 || (id v5 = v4) != 0) {
    [v5 finishImmediately];
  }
}

+ (id)_unavailableErrorWithUserInfo:(id)a3
{
  int v3 = (objc_class *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithDomain:@"SKErrorDomain" code:5 userInfo:v4];

  return v5;
}

+ (id)_unknownErrorWithUserInfo:(id)a3
{
  int v3 = (objc_class *)MEMORY[0x1E4F28C58];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithDomain:@"SKErrorDomain" code:0 userInfo:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storeController);
  objc_storeStrong((id *)&self->_uiServiceRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRemoteCardContainerViewController, 0);
  objc_storeStrong((id *)&self->_extensionRemoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionRemoteContainerViewController, 0);
  objc_storeStrong((id *)&self->_configurationActions, 0);
  objc_storeStrong((id *)&self->_entitledConfigurationActions, 0);
  objc_storeStrong((id *)&self->_extensionRequest, 0);
  objc_storeStrong((id *)&self->_productPageExtension, 0);
  objc_storeStrong((id *)&self->_deepLinkURL, 0);
  objc_storeStrong((id *)&self->_lookupError, 0);
  objc_storeStrong((id *)&self->_lookupResult, 0);
  objc_storeStrong((id *)&self->_cachedParameters, 0);
  objc_storeStrong((id *)&self->_hostApplicationOverride, 0);
  objc_storeStrong((id *)&self->_logKey, 0);

  objc_storeStrong((id *)&self->_extensionID, 0);
}

- (void)performLookupWithIdentifier:(NSString *)a3 parameters:(NSDictionary *)a4 logKey:(NSString *)a5 keyProfile:(NSString *)a6 completionHandler:(id)a7
{
  id v12 = _Block_copy(a7);
  char v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  uint64_t v14 = a3;
  id v15 = a4;
  uint64_t v16 = a5;
  id v17 = a6;
  uint64_t v18 = self;

  sub_1B014BBB4((uint64_t)&unk_1E9B1BE08, (uint64_t)v13);
}

- (void)performLookupWithURL:(NSURL *)a3 logKey:(NSString *)a4 keyProfile:(NSString *)a5 completionHandler:(id)a6
{
  BOOL v10 = _Block_copy(a6);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  void v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  id v12 = a3;
  char v13 = a4;
  uint64_t v14 = a5;
  id v15 = self;

  sub_1B014BBB4((uint64_t)&unk_1E9B1BDB8, (uint64_t)v11);
}

void __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__SKProductRemoteViewTask_lookupProductWithParameters_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __38__SKProductRemoteViewTask_setPreview___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Set preview: %{public}@.", v1, v2, v3, v4, v5);
}

- (void)_addConfigurationAction:needsEntitlement:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Unable to add action.", v1, v2, v3, v4, v5);
}

- (void)_addConfigurationAction:needsEntitlement:.cold.2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Rejecting action for unentitled client.", v1, v2, v3, v4, v5);
}

void __68__SKProductRemoteViewTask__addConfigurationAction_needsEntitlement___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Error retrieving view service: %{public}@", v1, v2, v3, v4, v5);
}

void __67__SKProductRemoteViewTask__loadUIServiceIfNecessaryWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Could not get remote view controller: %{public}@", v1, v2, v3, v4, v5);
}

- (void)_showExtensionWithID:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Extension not provided.", v1, v2, v3, v4, v5);
}

- (void)_showExtensionWithID:.cold.2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Could not find extension: %{public}@.", v1, v2, v3, v4, v5);
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Could not get remote view controller.", v1, v2, v3, v4, v5);
}

void __48__SKProductRemoteViewTask__showExtensionWithID___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Could not instantiate extension: %{public}@.", v1, v2, v3, v4, v5);
}

void __68__SKProductRemoteViewTask__didReceiveExtensionRemoteViewController___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 40);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);

  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v5, "[%{public}@][%{public}@]: Could not get extension service proxy: %{public}@.", v6, v7, v8, v9, 2u);
}

- (void)_productIDFromParameters:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: No ID provided for product.", v1, v2, v3, v4, v5);
}

- (void)_productIDFromParameters:.cold.2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Invalid format for product ID.", v1, v2, v3, v4, v5);
}

- (void)productPageRemoteViewController:userDidInteractWithProduct:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Invalid SKProductPageExtensionInteractionType: %lu", v1, v2, v3, v4, v5);
}

- (void)productPageRemoteViewController:didTerminateWithError:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_0(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: Remote controller terminated with error: %{public}@.", v1, v2, v3, v4, v5);
}

- (void)loadProductWithPageDictionary:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10_3();
  uint64_t v1 = "-[SKProductRemoteViewTask loadProductWithPageDictionary:completionBlock:]";
  _os_log_fault_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[%{public}@][%{public}@]: Deprecated method: %{public}s.", v0, 0x20u);
}

- (void)loadProductWithRequest:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_10_3();
  uint64_t v1 = "-[SKProductRemoteViewTask loadProductWithRequest:completionBlock:]";
  _os_log_fault_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "[%{public}@][%{public}@]: Deprecated method: %{public}s.", v0, 0x20u);
}

- (void)loadProductWithURL:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1B005B000, MEMORY[0x1E4F14500], v0, "[%{public}@][%{public}@]: No URL for product lookup.", v1, v2, v3, v4, v5);
}

void __54__SKProductRemoteViewTask_setAdditionalBuyParameters___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set additional buy params: %{public}@.", v3, v4, v5, v6, v7);
}

void __50__SKProductRemoteViewTask_setAffiliateIdentifier___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set affiliate identifier: %{public}@.", v3, v4, v5, v6, v7);
}

void __47__SKProductRemoteViewTask_setClientIdentifier___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set client identifier: %{public}@.", v3, v4, v5, v6, v7);
}

void __48__SKProductRemoteViewTask_setCancelButtonTitle___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set cancel button title: %{public}@.", v3, v4, v5, v6, v7);
}

void __50__SKProductRemoteViewTask_setRightBarButtonTitle___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set right bar button title: %{public}@.", v3, v4, v5, v6, v7);
}

void __50__SKProductRemoteViewTask_setShowsRightBarButton___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[%{public}@][%{public}@]: Set shows right bar button: %{BOOL}d.", v2, 0x1Cu);
}

void __43__SKProductRemoteViewTask_setPromptString___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set prompt string: %{public}@.", v3, v4, v5, v6, v7);
}

void __47__SKProductRemoteViewTask_setProductPageStyle___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set product page style: %{public}@.", v3, v4, v5, v6, v7);
}

void __47__SKProductRemoteViewTask_setShowsStoreButton___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set shows store: %{public}@.", v3, v4, v5, v6, v7);
}

void __54__SKProductRemoteViewTask_setScriptContextDictionary___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set context dictionary: %{public}@.", v3, v4, v5, v6, v7);
}

void __43__SKProductRemoteViewTask_setUsageContext___block_invoke_cold_1(uint64_t a1)
{
  OUTLINED_FUNCTION_8_2(a1, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_3_2(&dword_1B005B000, MEMORY[0x1E4F14500], v2, "[%{public}@][%{public}@]: Set usage context: %{public}@.", v3, v4, v5, v6, v7);
}

void __39__SKProductRemoteViewTask_setAskToBuy___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_1B005B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[%{public}@][%{public}@]: Set ATB: %{BOOL}d.", v2, 0x1Cu);
}

@end