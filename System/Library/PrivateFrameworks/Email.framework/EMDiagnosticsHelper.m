@interface EMDiagnosticsHelper
+ (id)log;
- (EFCancelable)diagnosticInfoProviderToken;
- (EFLocked)providers;
- (EMDiagnosticsHelper)initWithDaemonInterface:(id)a3;
- (EMObjectID)providerObjectID;
- (id)registerDiagnosticFileProvider:(id)a3;
- (unint64_t)source;
- (void)dealloc;
- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setDiagnosticInfoProviderToken:(id)a3;
- (void)setProviders:(id)a3;
- (void)setSource:(unint64_t)a3;
@end

@implementation EMDiagnosticsHelper

uint64_t __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (EMDiagnosticsHelper)initWithDaemonInterface:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EMDiagnosticsHelper;
  v5 = [(EMDiagnosticsHelper *)&v16 init];
  if (v5)
  {
    v6 = [[EMObjectID alloc] initAsEphemeralID:1];
    providerObjectID = v5->_providerObjectID;
    v5->_providerObjectID = v6;

    v8 = [v4 diagnosticInfoGatherer];
    uint64_t v9 = [v8 registerDiagnosticInfoProvider:v5];
    diagnosticInfoProviderToken = v5->_diagnosticInfoProviderToken;
    v5->_diagnosticInfoProviderToken = (EFCancelable *)v9;

    v5->_source = 0;
    id v11 = objc_alloc(MEMORY[0x1E4F60DA0]);
    v12 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    uint64_t v13 = [v11 initWithObject:v12];
    providers = v5->_providers;
    v5->_providers = (EFLocked *)v13;
  }
  return v5;
}

- (id)registerDiagnosticFileProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EMDiagnosticsHelper log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl(&dword_1BEFDB000, v5, OS_LOG_TYPE_DEFAULT, "Registering a diagnostic file provider: %@", buf, 0xCu);
  }

  v6 = [(EMDiagnosticsHelper *)self providers];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke;
  v14[3] = &unk_1E63E33A8;
  id v7 = v4;
  id v15 = v7;
  [v6 performWhileLocked:v14];

  id v8 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_2;
  v11[3] = &unk_1E63E3298;
  objc_copyWeak(&v13, (id *)buf);
  id v9 = v7;
  id v12 = v9;
  [v8 addCancelationBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);

  return v8;
}

- (EFLocked)providers
{
  return self->_providers;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__EMDiagnosticsHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_13 != -1) {
    dispatch_once(&log_onceToken_13, block);
  }
  v2 = (void *)log_log_13;
  return v2;
}

- (EMObjectID)providerObjectID
{
  return self->_providerObjectID;
}

void __26__EMDiagnosticsHelper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_13;
  log_log_13 = (uint64_t)v1;
}

- (void)dealloc
{
  id v3 = [(EMDiagnosticsHelper *)self diagnosticInfoProviderToken];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)EMDiagnosticsHelper;
  [(EMDiagnosticsHelper *)&v4 dealloc];
}

void __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = [WeakRetained providers];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_3;
    v5[3] = &unk_1E63E33A8;
    id v6 = *(id *)(a1 + 32);
    [v4 performWhileLocked:v5];
  }
}

uint64_t __54__EMDiagnosticsHelper_registerDiagnosticFileProvider___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (void)provideDiagnosticsAt:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  v23 = (void (**)(id, id, void))a5;
  if (a4)
  {
    v10 = [(EMDiagnosticsHelper *)self providers];
    v21 = [v10 getObject];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v21;
    uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v14), "messageListItemsForDiagnosticsHelper:", self, v21, v22);
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v26;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v26 != v18) {
                  objc_enumerationMutation(v16);
                }
                v20 = [*(id *)(*((void *)&v25 + 1) + 8 * v19) displayMessageObjectID];
                [v11 addObject:v20];

                ++v19;
              }
              while (v17 != v19);
              uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v17);
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }

    [(EMDiagnosticsHelper *)self setSource:0];
    v23[2](v23, v11, 0);

    id v9 = obj;
  }
  else
  {
    id v8 = +[EMDiagnosticsHelper log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v36 = a4;
      _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "Skipping visible message source diagnostics because options are: %lu", buf, 0xCu);
    }

    id v9 = [MEMORY[0x1E4F1CAD0] set];
    v23[2](v23, v9, 0);
  }
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (EFCancelable)diagnosticInfoProviderToken
{
  return self->_diagnosticInfoProviderToken;
}

- (void)setDiagnosticInfoProviderToken:(id)a3
{
}

- (void)setProviders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providers, 0);
  objc_storeStrong((id *)&self->_diagnosticInfoProviderToken, 0);
  objc_storeStrong((id *)&self->_providerObjectID, 0);
}

@end