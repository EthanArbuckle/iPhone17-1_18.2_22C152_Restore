@interface CSLPRFDefaultAppDataProvider
- (CSLPRFAppDataProviderDelegate)delegate;
- (CSLPRFDefaultAppDataProvider)init;
- (void)applicationLibrary:(id)a3 didAddApplications:(id)a4;
- (void)applicationLibrary:(id)a3 didRemoveApplications:(id)a4;
- (void)applicationLibrary:(id)a3 didUpdateApplications:(id)a4;
- (void)dealloc;
- (void)loadAppsWithCompletion:(id)a3;
- (void)loadAppsWithCompletion:(id)a3 completionQueue:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CSLPRFDefaultAppDataProvider

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_applicationLibrary, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFAppDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFAppDataProviderDelegate *)WeakRetained;
}

- (void)applicationLibrary:(id)a3 didUpdateApplications:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataProviderDidChange:self];
}

- (void)applicationLibrary:(id)a3 didRemoveApplications:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataProviderDidChange:self];
}

- (void)applicationLibrary:(id)a3 didAddApplications:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dataProviderDidChange:self];
}

- (void)loadAppsWithCompletion:(id)a3
{
}

- (void)loadAppsWithCompletion:(id)a3 completionQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_didLoadApps = 1;
  os_unfair_lock_unlock(&self->_lock);
  applicationLibrary = self->_applicationLibrary;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__CSLPRFDefaultAppDataProvider_loadAppsWithCompletion_completionQueue___block_invoke;
  v11[3] = &unk_264A0B650;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [(CSLPRFApplicationLibrary *)applicationLibrary allApplicationsWithCompletion:v11];
}

void __71__CSLPRFDefaultAppDataProvider_loadAppsWithCompletion_completionQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CSLPRFDefaultAppDataProvider_loadAppsWithCompletion_completionQueue___block_invoke_2;
  v7[3] = &unk_264A0B628;
  v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __71__CSLPRFDefaultAppDataProvider_loadAppsWithCompletion_completionQueue___block_invoke_2(uint64_t a1)
{
  v1 = NSDictionary;
  id v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_3642);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v1 dictionaryWithObjects:v3 forKeys:v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

uint64_t __71__CSLPRFDefaultAppDataProvider_loadAppsWithCompletion_completionQueue___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)dealloc
{
  [(CSLPRFApplicationLibrary *)self->_applicationLibrary removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)CSLPRFDefaultAppDataProvider;
  [(CSLPRFDefaultAppDataProvider *)&v3 dealloc];
}

- (CSLPRFDefaultAppDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSLPRFDefaultAppDataProvider;
  uint64_t v2 = [(CSLPRFDefaultAppDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[CSLPRFApplicationLibrary sharedLibraryForLocation:0];
    applicationLibrary = v2->_applicationLibrary;
    v2->_applicationLibrary = (CSLPRFApplicationLibrary *)v3;

    [(CSLPRFApplicationLibrary *)v2->_applicationLibrary addObserver:v2];
  }
  return v2;
}

@end