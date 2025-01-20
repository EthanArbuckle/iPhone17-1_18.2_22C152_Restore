@interface HFAddAndSetupNewAccessoriesHandler
+ (id)addAndSetupNewAccessoriesForHome:(id)a3 room:(id)a4;
+ (id)sharedHandler;
- (BOOL)isAccessorySetupActive;
- (HFAddAndSetupNewAccessoriesHandler)init;
- (void)setIsAccessorySetupActive:(BOOL)a3;
@end

@implementation HFAddAndSetupNewAccessoriesHandler

- (BOOL)isAccessorySetupActive
{
  return self->_isAccessorySetupActive;
}

+ (id)sharedHandler
{
  if (qword_26AB2F018 != -1) {
    dispatch_once(&qword_26AB2F018, &__block_literal_global_76);
  }
  v2 = (void *)_MergedGlobals_245;
  return v2;
}

uint64_t __51__HFAddAndSetupNewAccessoriesHandler_sharedHandler__block_invoke()
{
  v0 = objc_alloc_init(HFAddAndSetupNewAccessoriesHandler);
  uint64_t v1 = _MergedGlobals_245;
  _MergedGlobals_245 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (HFAddAndSetupNewAccessoriesHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)HFAddAndSetupNewAccessoriesHandler;
  result = [(HFAddAndSetupNewAccessoriesHandler *)&v3 init];
  if (result) {
    result->_isAccessorySetupActive = 0;
  }
  return result;
}

+ (id)addAndSetupNewAccessoriesForHome:(id)a3 room:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x263F58190];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke;
  v16 = &unk_26408F0C8;
  id v17 = v5;
  id v18 = v6;
  id v8 = v6;
  id v9 = v5;
  v10 = [v7 futureWithBlock:&v13];
  id v11 = (id)objc_msgSend(v10, "addCompletionBlock:", &__block_literal_global_8_1, v13, v14, v15, v16);

  return v10;
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = +[HFAddAndSetupNewAccessoriesHandler sharedHandler];
  [v4 setIsAccessorySetupActive:1];

  id v5 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Calling -[HMHome addAndSetUpNewAccessoriesWithSuggestedRoomName:completionHandler:] on home: %@ room: %@", buf, 0x16u);
  }

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) name];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_2;
  v11[3] = &unk_2640938A8;
  id v12 = v3;
  id v10 = v3;
  [v8 addAndSetUpNewAccessoriesWithSuggestedRoomName:v9 completionHandler:v11];
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(v6, "hf_prettyDescription");
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "-[HMHome addAndSetUpNewAccessoriesWithSuggestedRoomName:completionHandler:] finished with error: %@, addedAccessories: %@", (uint8_t *)&v10, 0x16u);
  }
  id v9 = +[HFAddAndSetupNewAccessoriesHandler sharedHandler];
  [v9 setIsAccessorySetupActive:0];

  [*(id *)(a1 + 32) finishWithResult:v6 error:v5];
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v3 = [a3 userInfo];
    v4 = [v3 objectForKey:*MEMORY[0x263F08608]];

    if (objc_msgSend(v4, "hf_isHFErrorWithCode:", 46))
    {
      id v5 = [v4 userInfo];
      id v6 = [v5 objectForKey:@"HFErrorUserInfoOptionsKey"];

      uint64_t v7 = [v6 objectForKey:HFAppPunchoutRequestEncodedKey];
      id v15 = 0;
      id v8 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v15];
      id v9 = v15;
      int v10 = HFLogForCategory(0x3BuLL);
      id v11 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v9;
          _os_log_error_impl(&dword_20B986000, v11, OS_LOG_TYPE_ERROR, "Received HomeUIService HFErrorCodeSetupAccessoryOwnershipProofPunchoutRequired, but failed to unarchive request with error %@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v17 = v8;
          _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Received HomeUIService HFErrorCodeSetupAccessoryOwnershipProofPunchoutRequired with request %@", buf, 0xCu);
        }

        id v11 = +[HFAppPunchoutRequest handleRequest:v8];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_11;
        v13[3] = &unk_26408CDF0;
        id v14 = v8;
        id v12 = (id)[v11 addFailureBlock:v13];
      }
    }
  }
}

void __76__HFAddAndSetupNewAccessoriesHandler_addAndSetupNewAccessoriesForHome_room___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = HFLogForCategory(0x3BuLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_20B986000, v4, OS_LOG_TYPE_ERROR, "Failed to handle request %@ with error %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)setIsAccessorySetupActive:(BOOL)a3
{
  self->_isAccessorySetupActive = a3;
}

@end