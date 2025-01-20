@interface FABuyStorageHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_completionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_invokeBuyStorageWithServerAttributes:(id)a3 completion:(id)a4;
- (void)manager:(id)a3 didCompleteWithError:(id)a4;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)managerDidCancel:(id)a3;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FABuyStorageHook

- (BOOL)shouldMatchElement:(id)a3
{
  v3 = [a3 name];
  char v4 = [v3 isEqualToString:@"family:buyStorage"];

  return v4;
}

- (BOOL)shouldMatchModel:(id)a3
{
  v3 = [a3 clientInfo];
  char v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F25C10]];
  char v5 = [v4 isEqualToString:@"family:buyStorage"];

  return v5;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 clientInfo];
  [(FABuyStorageHook *)self _invokeBuyStorageWithServerAttributes:v7 completion:v6];
}

- (void)_invokeBuyStorageWithServerAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  if (self->_loadingStorage)
  {
    id v7 = _FALogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2189F0000, v7, OS_LOG_TYPE_DEFAULT, "Already loading storage. Bailing", buf, 2u);
    }
  }
  else
  {
    self->_loadingStorage = 1;
    v8 = _Block_copy(a4);
    id completion = self->_completion;
    self->_id completion = v8;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [WeakRetained presentationContextForHook:self];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (ICQUICloudStorageOffersManager *)objc_alloc_init(MEMORY[0x263F88A68]);
      storageOffersManager = self->_storageOffersManager;
      self->_storageOffersManager = v11;

      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setDelegate:self];
      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager setShouldOfferFamilySharePlansOnly:1];
      v13 = [v6 objectForKeyedSubscript:@"requiredStorageThreshold"];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        v15 = [v6 objectForKeyedSubscript:@"requiredStorageThreshold"];
        -[ICQUICloudStorageOffersManager setRequiredStorageThreshold:](self->_storageOffersManager, "setRequiredStorageThreshold:", [v15 longLongValue]);
      }
      [(ICQUICloudStorageOffersManager *)self->_storageOffersManager beginFlowWithNavigationController:v7 modally:1];
    }
    else
    {
      v16 = _FALogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_2189F0000, v16, OS_LOG_TYPE_DEFAULT, "Unable to present buy storage, we need a navigation controller", v20, 2u);
      }

      v17 = (void (**)(id, void, void *))self->_completion;
      if (v17)
      {
        v18 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F3BDB8] code:-1000 userInfo:0];
        v17[2](v17, 0, v18);

        id v19 = self->_completion;
        self->_id completion = 0;
      }
    }
  }
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
}

- (void)manager:(id)a3 didCompleteWithError:(id)a4
{
}

- (void)managerDidCancel:(id)a3
{
}

- (void)_completionWithSuccess:(BOOL)a3 error:(id)a4
{
  self->_loadingStorage = 0;
  id completion = (void (**)(id, BOOL, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, a4);
    id completion = (void (**)(id, BOOL, id))self->_completion;
  }
  self->_id completion = 0;
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_storageOffersManager, 0);
}

@end