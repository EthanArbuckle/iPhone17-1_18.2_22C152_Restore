@interface LiveFSMounterClientHelper
- (NSString)providerName;
- (id)destroyDomain:(id)a3;
- (void)LiveMounterClientCreateDomain:(id)a3 displayName:(id)a4 how:(int)a5 storageName:(id)a6 reply:(id)a7;
- (void)createDomain:(id)a3 displayName:(id)a4 how:(int)a5 reply:(id)a6;
- (void)createDomain:(id)a3 how:(int)a4 reply:(id)a5;
- (void)internalSetProviderName:(id)a3;
- (void)setProviderName:(id)a3;
@end

@implementation LiveFSMounterClientHelper

- (void)createDomain:(id)a3 how:(int)a4 reply:(id)a5
{
}

- (void)LiveMounterClientCreateDomain:(id)a3 displayName:(id)a4 how:(int)a5 storageName:(id)a6 reply:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__1;
  v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  v17 = (void *)[objc_alloc(MEMORY[0x263F05590]) initWithIdentifier:v12 displayName:v13 pathRelativeToDocumentStorage:v14 hidden:(a5 >> 7) & 1];
  v18 = (void *)[objc_alloc(MEMORY[0x263F055B8]) _initWithProviderIdentifier:self->_providerName];
  v19 = livefs_std_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    providerName = self->_providerName;
    *(_DWORD *)buf = 136315906;
    v37 = "-[LiveFSMounterClientHelper LiveMounterClientCreateDomain:displayName:how:storageName:reply:]";
    __int16 v38 = 2112;
    id v39 = v12;
    __int16 v40 = 2112;
    id v41 = v13;
    __int16 v42 = 2112;
    v43 = providerName;
    _os_log_impl(&dword_22CE49000, v19, OS_LOG_TYPE_DEFAULT, "%s : LiveMounterClientCreateDomain: name(%@), displayName(%@) providerName(%@)", buf, 0x2Au);
  }

  if ((a5 & 0x20) != 0) {
    [v17 setContainsPhotos:1];
  }
  if ((a5 & 0x1000) != 0) {
    [v17 setErasable:1];
  }
  if ((a5 & 0x800) != 0) {
    [v17 setReadOnly:1];
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke;
  v27[3] = &unk_264934600;
  v29 = &v30;
  v21 = v16;
  v28 = v21;
  [v18 addDomain:v17 completionHandler:v27];
  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v22 = v31[5];
  if ((a5 & 1) == 0 || v22)
  {
    v23 = v18;
  }
  else
  {
    v23 = (void *)[objc_alloc(MEMORY[0x263F055B8]) _initWithProviderIdentifier:self->_providerName domain:v17];

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2;
    v25[3] = &unk_264934628;
    v24 = v21;
    v26 = v24;
    [v23 setConnected:1 completionHandler:v25];
    dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);

    uint64_t v22 = v31[5];
  }
  v15[2](v15, v22);

  _Block_object_dispose(&v30, 8);
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = livefs_std_log();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    uint64_t v13 = 0;
    _os_log_impl(&dword_22CE49000, v5, OS_LOG_TYPE_DEFAULT, "setConnected:completionHandler: returned %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)createDomain:(id)a3 displayName:(id)a4 how:(int)a5 reply:(id)a6
{
}

- (id)destroyDomain:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F05590]) initWithIdentifier:v4 displayName:v4 pathRelativeToDocumentStorage:v4];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F055B8]) _initWithProviderIdentifier:self->_providerName];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__LiveFSMounterClientHelper_destroyDomain___block_invoke;
  v11[3] = &unk_264934600;
  uint64_t v13 = &v14;
  uint64_t v8 = v5;
  int v12 = v8;
  [v7 removeDomain:v6 completionHandler:v11];
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __43__LiveFSMounterClientHelper_destroyDomain___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    dispatch_semaphore_t v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__LiveFSMounterClientHelper_destroyDomain___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)internalSetProviderName:(id)a3
{
}

- (NSString)providerName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setProviderName:(id)a3
{
}

- (void).cxx_destruct
{
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22CE49000, a2, a3, "LiveMounterClientCreateDomain: addDomain returned error: %@", a5, a6, a7, a8, 2u);
}

void __93__LiveFSMounterClientHelper_LiveMounterClientCreateDomain_displayName_how_storageName_reply___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22CE49000, a2, a3, "setConnected:completionHandler: returned %@", a5, a6, a7, a8, 2u);
}

void __43__LiveFSMounterClientHelper_destroyDomain___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22CE49000, a2, a3, "RemoveDomain returned error: %@", a5, a6, a7, a8, 2u);
}

@end