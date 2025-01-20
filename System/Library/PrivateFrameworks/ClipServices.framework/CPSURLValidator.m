@interface CPSURLValidator
- (CPSURLValidator)initWithRequest:(id)a3;
- (void)_validateURL:(id)a3 forBundleID:(id)a4 policy:(id)a5 completion:(id)a6;
- (void)validateWithCompletion:(id)a3;
@end

@implementation CPSURLValidator

- (CPSURLValidator)initWithRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSURLValidator;
  v6 = [(CPSURLValidator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = v7;
  }

  return v7;
}

- (void)validateWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    request = self->_request;
    v7 = v5;
    v8 = [(CPSValidationRequest *)request urls];
    v9 = [(CPSValidationRequest *)self->_request bundleIdentifiers];
    *(_DWORD *)buf = 138478083;
    v14 = v8;
    __int16 v15 = 2113;
    v16 = v9;
    _os_log_impl(&dword_21559C000, v7, OS_LOG_TYPE_INFO, "Client requests validation for URLs: %{private}@, bundleIDs: %{private}@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__CPSURLValidator_validateWithCompletion___block_invoke;
  v11[3] = &unk_26424EE50;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  +[CPSClipInvocationPolicy requestAccountPolicyWithCompletion:v11];
}

void __42__CPSURLValidator_validateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEligible] & 1) != 0 || (objc_msgSend(v3, "isRecoverable"))
  {
    id v4 = dispatch_group_create();
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    v6 = [*(id *)(*(void *)(a1 + 32) + 8) urls];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [*(id *)(*(void *)(a1 + 32) + 8) urls];
        id v10 = [v9 objectAtIndexedSubscript:v8];

        v11 = [*(id *)(*(void *)(a1 + 32) + 8) bundleIdentifiers];
        id v12 = [v11 objectAtIndexedSubscript:v8];

        dispatch_group_enter(v4);
        v13 = *(void **)(a1 + 32);
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __42__CPSURLValidator_validateWithCompletion___block_invoke_2;
        v21[3] = &unk_26424EE28;
        id v22 = v10;
        id v23 = v12;
        id v24 = v5;
        v25 = v4;
        id v14 = v12;
        id v15 = v10;
        [v13 _validateURL:v15 forBundleID:v14 policy:v3 completion:v21];

        ++v8;
        v16 = [*(id *)(*(void *)(a1 + 32) + 8) urls];
        unint64_t v17 = [v16 count];
      }
      while (v8 < v17);
    }
    dispatch_time_t v18 = dispatch_time(0, 5000000000);
    dispatch_group_wait(v4, v18);
    v19 = [[CPSValidationResult alloc] initWithRequest:*(void *)(*(void *)(a1 + 32) + 8) response:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v20 = [CPSValidationResult alloc];
    id v4 = [(CPSValidationResult *)v20 initWithRequest:*(void *)(*(void *)(a1 + 32) + 8) response:MEMORY[0x263EFFA78]];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __42__CPSURLValidator_validateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 invocationPolicy];
  if ([v4 isEligible])
  {

LABEL_4:
    uint64_t v7 = [v3 clipBundleID];
    [*(id *)(a1 + 48) setObject:v7 forKeyedSubscript:*(void *)(a1 + 32)];

    goto LABEL_5;
  }
  id v5 = [v3 invocationPolicy];
  char v6 = [v5 isRecoverable];

  if (v6) {
    goto LABEL_4;
  }
  unint64_t v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138478083;
    uint64_t v12 = v9;
    __int16 v13 = 2113;
    uint64_t v14 = v10;
    _os_log_impl(&dword_21559C000, v8, OS_LOG_TYPE_INFO, "Failed validation for URL: %{private}@, bundleID: %{private}@", (uint8_t *)&v11, 0x16u);
  }
LABEL_5:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)_validateURL:(id)a3 forBundleID:(id)a4 policy:(id)a5 completion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  __int16 v13 = objc_alloc_init(CPSClipMetadata);
  [(CPSClipMetadata *)v13 setClipRequestURL:v12];

  [(CPSClipMetadata *)v13 setClipBundleID:v11];
  [(CPSClipMetadata *)v13 setInvocationPolicy:v10];

  uint64_t v14 = +[CPSSessionManager sharedManager];
  uint64_t v15 = [v14 appInfoFetcher];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__CPSURLValidator__validateURL_forBundleID_policy_completion___block_invoke;
  v18[3] = &unk_26424EE78;
  v19 = v13;
  id v20 = v9;
  v16 = v13;
  id v17 = v9;
  [v15 lookUpClipMetadataByBundleID:v11 sourceBundleID:0 downloadIconIfNeeded:0 skipCaching:0 completionHandler:v18];
}

uint64_t __62__CPSURLValidator__validateURL_forBundleID_policy_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3)
  {
    [*(id *)(a1 + 32) _updateWithAMSMetadata:a2];
    id v4 = [*(id *)(a1 + 32) invocationPolicy];
    if ([v4 isEligible])
    {

LABEL_6:
      uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_8;
    }
    id v5 = [*(id *)(a1 + 32) invocationPolicy];
    char v6 = [v5 isRecoverable];

    if (v6) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_8:

  return v7();
}

- (void).cxx_destruct
{
}

@end