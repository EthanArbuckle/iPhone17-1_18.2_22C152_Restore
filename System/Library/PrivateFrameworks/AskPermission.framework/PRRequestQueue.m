@interface PRRequestQueue
+ (id)defaultRequestQueue;
- (NSString)identifier;
- (PRRequestDelegate)delegate;
- (id)_pushToken;
- (void)_attemptLocalApprovalForStorePurchaseRequestWithAdamID:(unint64_t)a3 completionHandler:(id)a4;
- (void)_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:(unint64_t)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation PRRequestQueue

+ (id)defaultRequestQueue
{
  if (defaultRequestQueue_ap_once_token___COUNTER__ != -1) {
    dispatch_once(&defaultRequestQueue_ap_once_token___COUNTER__, &__block_literal_global_0);
  }
  v2 = (void *)defaultRequestQueue_ap_once_object___COUNTER__;
  return v2;
}

uint64_t __37__PRRequestQueue_defaultRequestQueue__block_invoke()
{
  defaultRequestQueue_ap_once_object___COUNTER__ = objc_alloc_init(PRRequestQueue);
  return MEMORY[0x270F9A758]();
}

- (void)_attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = [v6 stringValue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __99__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier_completionHandler___block_invoke;
  v9[3] = &unk_26474E6C0;
  id v10 = v5;
  id v8 = v5;
  +[APRequestHandler localApproveRequestWithItemIdentifier:v7 completion:v9];
}

uint64_t __99__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithItemIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, a2 == 0, a2);
}

- (void)_attemptLocalApprovalForStorePurchaseRequestWithAdamID:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  v7 = [v6 stringValue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __91__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithAdamID_completionHandler___block_invoke;
  v9[3] = &unk_26474E6C0;
  id v10 = v5;
  id v8 = v5;
  +[APRequestHandler localApproveRequestWithItemIdentifier:v7 completion:v9];
}

uint64_t __91__PRRequestQueue__attemptLocalApprovalForStorePurchaseRequestWithAdamID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, BOOL, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 1, a2 == 0, a2);
}

- (id)_pushToken
{
  return 0;
}

- (PRRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end