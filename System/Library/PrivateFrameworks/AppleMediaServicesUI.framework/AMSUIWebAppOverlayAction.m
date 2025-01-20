@interface AMSUIWebAppOverlayAction
- (AMSMutableBinaryPromise)storeKitOverlayPromise;
- (AMSUIWebAppOverlayAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)_shouldUseStoreKit;
- (BOOL)dismiss;
- (NSString)appIdentifier;
- (NSString)campaignToken;
- (NSString)customProductPageIdentifier;
- (NSString)latestReleaseID;
- (NSString)providerToken;
- (SKOverlay)presentationOverlay;
- (id)_determineScene;
- (id)_dismissOverlay;
- (id)_dismissStoreKitOverlay;
- (id)_presentOverlayWithAppIdentifier:(id)a3;
- (id)_presentStoreKitOverlayWithAppIdentifier:(id)a3;
- (id)runAction;
- (void)setAppIdentifier:(id)a3;
- (void)setCampaignToken:(id)a3;
- (void)setCustomProductPageIdentifier:(id)a3;
- (void)setDismiss:(BOOL)a3;
- (void)setLatestReleaseID:(id)a3;
- (void)setPresentationOverlay:(id)a3;
- (void)setProviderToken:(id)a3;
- (void)setStoreKitOverlayPromise:(id)a3;
- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4;
- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4;
- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4;
@end

@implementation AMSUIWebAppOverlayAction

- (AMSUIWebAppOverlayAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)AMSUIWebAppOverlayAction;
  v7 = [(AMSUIWebAction *)&v26 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"dismiss"];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 objectForKeyedSubscript:@"dismiss"];
      v7->_dismiss = [v9 BOOLValue];
    }
    else
    {
      v7->_dismiss = 0;
    }

    v10 = [v6 objectForKeyedSubscript:@"appIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }

    appIdentifier = v7->_appIdentifier;
    v7->_appIdentifier = v11;

    v13 = [v6 objectForKeyedSubscript:@"campaignToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }

    campaignToken = v7->_campaignToken;
    v7->_campaignToken = v14;

    v16 = [v6 objectForKeyedSubscript:@"providerToken"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }

    providerToken = v7->_providerToken;
    v7->_providerToken = v17;

    v19 = [v6 objectForKeyedSubscript:@"customProductPageIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }

    customProductPageIdentifier = v7->_customProductPageIdentifier;
    v7->_customProductPageIdentifier = v20;

    v22 = [v6 objectForKeyedSubscript:@"latestReleaseID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }

    latestReleaseID = v7->_latestReleaseID;
    v7->_latestReleaseID = v23;
  }
  return v7;
}

- (id)runAction
{
  if ([(AMSUIWebAppOverlayAction *)self dismiss])
  {
    if ([(AMSUIWebAppOverlayAction *)self _shouldUseStoreKit]) {
      [(AMSUIWebAppOverlayAction *)self _dismissStoreKitOverlay];
    }
    else {
    v4 = [(AMSUIWebAppOverlayAction *)self _dismissOverlay];
    }
  }
  else
  {
    v3 = [(AMSUIWebAppOverlayAction *)self appIdentifier];
    if ([v3 length])
    {
      if ([(AMSUIWebAppOverlayAction *)self _shouldUseStoreKit]) {
        [(AMSUIWebAppOverlayAction *)self _presentStoreKitOverlayWithAppIdentifier:v3];
      }
      else {
      v4 = [(AMSUIWebAppOverlayAction *)self _presentOverlayWithAppIdentifier:v3];
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x263F27B58];
      id v6 = AMSError();
      v4 = [v5 promiseWithError:v6];
    }
  }
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__3;
  v10[4] = __Block_byref_object_dispose__3;
  v11 = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__AMSUIWebAppOverlayAction_runAction__block_invoke;
  v9[3] = &unk_2643E4718;
  v9[4] = v11;
  v9[5] = v10;
  [v4 addFinishBlock:v9];
  v7 = [v4 promiseAdapter];
  _Block_object_dispose(v10, 8);

  return v7;
}

void __37__AMSUIWebAppOverlayAction_runAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPresentationOverlay:0];
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (void)storeOverlay:(id)a3 didFailToLoadWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(AMSUIWebAppOverlayAction *)self storeKitOverlayPromise];
  [v6 finishWithError:v5];
}

- (void)storeOverlay:(id)a3 didFinishPresentation:(id)a4
{
  id v4 = [(AMSUIWebAppOverlayAction *)self storeKitOverlayPromise];
  [v4 finishWithSuccess];
}

- (void)storeOverlay:(id)a3 didFinishDismissal:(id)a4
{
  id v4 = [(AMSUIWebAppOverlayAction *)self storeKitOverlayPromise];
  [v4 finishWithSuccess];
}

- (id)_determineScene
{
  uint64_t v2 = [(AMSUIWebAction *)self context];
  v3 = [v2 flowController];
  id v4 = [v3 currentContainer];
  id v5 = [v4 view];
  id v6 = [v5 window];
  v7 = [v6 windowScene];

  return v7;
}

- (id)_dismissOverlay
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing app overlay", (uint8_t *)&v11, 0x16u);
  }
  v7 = [(AMSUIWebAction *)self context];
  v8 = [v7 webPage];
  v9 = [v8 dismissAppOverlay];

  return v9;
}

- (id)_dismissStoreKitOverlay
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v3)
  {
    v3 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    id v6 = AMSLogKey();
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_21C134000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Dismissing app overlay using StoreKit", (uint8_t *)&v11, 0x16u);
  }
  v7 = objc_opt_new();
  [(AMSUIWebAppOverlayAction *)self setStoreKitOverlayPromise:v7];
  Class v8 = (Class)getSKOverlayClass[0]();
  v9 = [(AMSUIWebAppOverlayAction *)self _determineScene];
  [(objc_class *)v8 dismissOverlayInScene:v9];

  return v7;
}

- (id)_presentOverlayWithAppIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    Class v8 = AMSLogKey();
    int v13 = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    v16 = v8;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting app overlay: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v9 = [(AMSUIWebAction *)self context];
  v10 = [v9 webPage];
  int v11 = [v10 presentAppOverlayWithAdamID:v4];

  return v11;
}

- (id)_presentStoreKitOverlayWithAppIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    Class v8 = AMSLogKey();
    int v18 = 138543874;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    v21 = v8;
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting app overlay using StoreKit: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  v9 = objc_opt_new();
  [(AMSUIWebAppOverlayAction *)self setStoreKitOverlayPromise:v9];
  v10 = (void *)[objc_alloc(getSKOverlayAppConfigurationClass()) initWithAppIdentifier:v4 position:0];
  int v11 = [(AMSUIWebAppOverlayAction *)self campaignToken];
  [v10 setCampaignToken:v11];

  uint64_t v12 = [(AMSUIWebAppOverlayAction *)self providerToken];
  [v10 setProviderToken:v12];

  int v13 = [(AMSUIWebAppOverlayAction *)self customProductPageIdentifier];
  [v10 setCustomProductPageIdentifier:v13];

  uint64_t v14 = [(AMSUIWebAppOverlayAction *)self latestReleaseID];
  [v10 setLatestReleaseID:v14];

  [v10 setUserDismissible:1];
  __int16 v15 = (void *)[objc_alloc((Class)getSKOverlayClass[0]()) initWithConfiguration:v10];
  [v15 setDelegate:self];
  v16 = [(AMSUIWebAppOverlayAction *)self _determineScene];
  [v15 presentInScene:v16];

  [(AMSUIWebAppOverlayAction *)self setPresentationOverlay:v15];
  return v9;
}

- (BOOL)_shouldUseStoreKit
{
  uint64_t v2 = [MEMORY[0x263F82438] sharedApplication];
  v3 = [v2 connectedScenes];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)dismiss
{
  return self->_dismiss;
}

- (void)setDismiss:(BOOL)a3
{
  self->_dismiss = a3;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)campaignToken
{
  return self->_campaignToken;
}

- (void)setCampaignToken:(id)a3
{
}

- (NSString)providerToken
{
  return self->_providerToken;
}

- (void)setProviderToken:(id)a3
{
}

- (NSString)customProductPageIdentifier
{
  return self->_customProductPageIdentifier;
}

- (void)setCustomProductPageIdentifier:(id)a3
{
}

- (NSString)latestReleaseID
{
  return self->_latestReleaseID;
}

- (void)setLatestReleaseID:(id)a3
{
}

- (SKOverlay)presentationOverlay
{
  return self->_presentationOverlay;
}

- (void)setPresentationOverlay:(id)a3
{
}

- (AMSMutableBinaryPromise)storeKitOverlayPromise
{
  return self->_storeKitOverlayPromise;
}

- (void)setStoreKitOverlayPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeKitOverlayPromise, 0);
  objc_storeStrong((id *)&self->_presentationOverlay, 0);
  objc_storeStrong((id *)&self->_latestReleaseID, 0);
  objc_storeStrong((id *)&self->_customProductPageIdentifier, 0);
  objc_storeStrong((id *)&self->_providerToken, 0);
  objc_storeStrong((id *)&self->_campaignToken, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end