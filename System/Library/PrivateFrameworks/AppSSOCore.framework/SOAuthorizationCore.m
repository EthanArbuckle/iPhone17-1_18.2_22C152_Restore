@interface SOAuthorizationCore
+ (BOOL)_canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6;
+ (BOOL)_doAKshouldProcessURL:(id)a3;
+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4;
+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6;
+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 useInternalExtensions:(BOOL)a5;
+ (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
+ (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4;
- (BOOL)isUserInteractionEnabled;
- (NSDictionary)authorizationOptions;
- (OS_dispatch_queue)delegateDispatchQueue;
- (SOAuthorizationCore)init;
- (SOAuthorizationCoreDelegate)delegate;
- (SOAuthorizationRequestParametersCore)requestParametersCore;
- (id)createSecKeysFromSecKeyProxyEndpoints:(id)a3 error:(id *)a4;
- (id)debugDescription;
- (id)kerberosProfiles;
- (id)realms;
- (void)_addNoUserInterfaceToAuthorizationOptionsInRequestParameters;
- (void)_cancelAuthorization;
- (void)_finishAuthorization:(id)a3 withCredential:(id)a4 error:(id)a5;
- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6;
- (void)beginAuthorizationWithParameters:(id)a3;
- (void)beginAuthorizationWithParameters:(id)a3 completion:(id)a4;
- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)beginAuthorizationWithURL:(id)a3 httpHeaders:(id)a4 httpBody:(id)a5;
- (void)cancelAuthorization;
- (void)debugHintsWithCompletion:(id)a3;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5;
- (void)performBlockOnDelegateQueue:(id)a3;
- (void)setAuthorizationOptions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateDispatchQueue:(id)a3;
- (void)setEnableUserInteraction:(BOOL)a3;
- (void)setRequestParametersCore:(id)a3;
@end

@implementation SOAuthorizationCore

+ (BOOL)_canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  if (+[SOUtils isAppSSOServiceAvailable])
  {
    if (v6 && ([a1 _doAKshouldProcessURL:v10] & 1) != 0)
    {
      char v12 = 1;
    }
    else
    {
      v13 = +[SOConfigurationClient defaultClient];
      char v12 = [v13 willHandleURL:v10 responseCode:a4 callerBundleIdentifier:v11];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (SOAuthorizationCore)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[SOAuthorizationCore init]";
    __int16 v11 = 2112;
    char v12 = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SOAuthorizationCore;
  v4 = [(SOAuthorizationCore *)&v8 init];
  if (v4)
  {
    v5 = objc_alloc_init(SOClient);
    client = v4->_client;
    v4->_client = v5;

    v4->_enableUserInteraction = 1;
  }
  return v4;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode___block_invoke;
  v9[3] = &unk_1E6A6F050;
  id v10 = v6;
  __int16 v11 = &v14;
  id v12 = a1;
  int64_t v13 = a4;
  id v7 = v6;
  _os_activity_initiate(&dword_1D7206000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v9);

  LOBYTE(a1) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)a1;
}

uint64_t __67__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 48) canPerformAuthorizationWithURL:*(void *)(a1 + 32) responseCode:*(void *)(a1 + 56) useInternalExtensions:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 useInternalExtensions:(BOOL)a5
{
  id v8 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __89__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke;
  activity_block[3] = &unk_1E6A6F078;
  id v12 = v8;
  int64_t v13 = &v17;
  id v14 = a1;
  int64_t v15 = a4;
  BOOL v16 = a5;
  id v9 = v8;
  _os_activity_initiate(&dword_1D7206000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  LOBYTE(a4) = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return a4;
}

uint64_t __89__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 48) canPerformAuthorizationWithURL:*(void *)(a1 + 32) responseCode:*(void *)(a1 + 56) callerBundleIdentifier:0 useInternalExtensions:*(unsigned __int8 *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __112__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke;
  v15[3] = &unk_1E6A6F0A0;
  v18 = &v22;
  int64_t v19 = a4;
  id v16 = v10;
  id v17 = v11;
  BOOL v21 = a6;
  id v20 = a1;
  id v12 = v11;
  id v13 = v10;
  _os_activity_initiate(&dword_1D7206000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v15);

  LOBYTE(a4) = *((unsigned char *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return a4;
}

void __112__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = +[SOAuthorizationCore _canPerformAuthorizationWithURL:*(void *)(a1 + 32) responseCode:*(void *)(a1 + 56) callerBundleIdentifier:*(void *)(a1 + 40) useInternalExtensions:*(unsigned __int8 *)(a1 + 72)];
  v2 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5 = @"YES";
    if (*(unsigned char *)(a1 + 72)) {
      id v6 = @"YES";
    }
    else {
      id v6 = @"NO";
    }
    uint64_t v7 = *(void *)(a1 + 56);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      v5 = @"NO";
    }
    uint64_t v8 = *(void *)(a1 + 64);
    int v9 = 136316931;
    id v10 = "+[SOAuthorizationCore canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:]_block_invoke";
    __int16 v11 = 2160;
    uint64_t v12 = 1752392040;
    __int16 v13 = 2117;
    uint64_t v14 = v3;
    __int16 v15 = 1024;
    int v16 = v7;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    __int16 v19 = 2114;
    id v20 = v6;
    __int16 v21 = 2114;
    uint64_t v22 = v5;
    __int16 v23 = 2112;
    uint64_t v24 = v8;
    _os_log_debug_impl(&dword_1D7206000, v2, OS_LOG_TYPE_DEBUG, "%s %{sensitive, mask.hash}@, responseCode = %d, callerBundleIdentifier = %{public}@, useInternalExtensions = %{public}@, uint64_t result = %{public}@ on %@", (uint8_t *)&v9, 0x4Eu);
  }
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
  v12[3] = &unk_1E6A6F0C8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  _os_activity_initiate(&dword_1D7206000, "getAuthorizationHintsWithURL", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

void __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_2;
  v4[3] = &unk_1E6A6EE70;
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  [v2 getAuthorizationHintsWithURL:v1 responseCode:v3 completion:v4];
}

void __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138478083;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "getAuthorizationHintsWithURL: authorizationHints = %{private}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)beginAuthorizationWithURL:(id)a3 httpHeaders:(id)a4 httpBody:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  __int16 v11 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    id v14 = "-[SOAuthorizationCore beginAuthorizationWithURL:httpHeaders:httpBody:]";
    __int16 v15 = 2112;
    int v16 = self;
    _os_log_impl(&dword_1D7206000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v13, 0x16u);
  }

  id v12 = objc_alloc_init(SOAuthorizationParametersCore);
  [(SOAuthorizationParametersCore *)v12 setUrl:v10];

  [(SOAuthorizationParametersCore *)v12 setHttpHeaders:v9];
  [(SOAuthorizationParametersCore *)v12 setHttpBody:v8];

  [(SOAuthorizationParametersCore *)v12 setUseInternalExtensions:1];
  [(SOAuthorizationCore *)self beginAuthorizationWithParameters:v12];
}

- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    uint64_t v17 = "-[SOAuthorizationCore beginAuthorizationWithOperation:url:httpHeaders:httpBody:]";
    __int16 v18 = 2112;
    __int16 v19 = self;
    _os_log_impl(&dword_1D7206000, v14, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v16, 0x16u);
  }

  __int16 v15 = objc_alloc_init(SOAuthorizationParametersCore);
  [(SOAuthorizationParametersCore *)v15 setOperation:v13];

  [(SOAuthorizationParametersCore *)v15 setUrl:v12];
  [(SOAuthorizationParametersCore *)v15 setHttpHeaders:v11];

  [(SOAuthorizationParametersCore *)v15 setHttpBody:v10];
  [(SOAuthorizationParametersCore *)v15 setUseInternalExtensions:1];
  [(SOAuthorizationCore *)self beginAuthorizationWithParameters:v15];
}

- (void)beginAuthorizationWithParameters:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__SOAuthorizationCore_beginAuthorizationWithParameters___block_invoke;
  v6[3] = &unk_1E6A6F0F0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SOAuthorizationCore *)self beginAuthorizationWithParameters:v5 completion:v6];
}

void __56__SOAuthorizationCore_beginAuthorizationWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 identifier];
  [v4 _finishAuthorization:v8 withCredential:v7 error:v6];
}

- (void)cancelAuthorization
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[SOAuthorizationCore cancelAuthorization]";
    __int16 v7 = 2112;
    id v8 = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  activity_block[2] = __42__SOAuthorizationCore_cancelAuthorization__block_invoke;
  activity_block[3] = &unk_1E6A6F118;
  void activity_block[4] = self;
  _os_activity_initiate(&dword_1D7206000, "cancelAuthorization", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __42__SOAuthorizationCore_cancelAuthorization__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelAuthorization];
}

- (id)debugDescription
{
  v2 = +[SOConfigurationClient defaultClient];
  uint64_t v3 = [v2 configuration];
  id v4 = [v3 description];

  return v4;
}

+ (BOOL)_doAKshouldProcessURL:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    int v5 = [MEMORY[0x1E4F4EF90] shouldProcessURL:v4];
  }
  else {
    int v5 = 0;
  }
  id v6 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v10 = "+[SOAuthorizationCore _doAKshouldProcessURL:]";
    __int16 v11 = 2160;
    id v8 = @"NO";
    uint64_t v12 = 1752392040;
    __int16 v13 = 2117;
    int v9 = 136316163;
    if (v5) {
      id v8 = @"YES";
    }
    id v14 = v4;
    __int16 v15 = 2112;
    int v16 = v8;
    __int16 v17 = 2112;
    id v18 = a1;
    _os_log_debug_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEBUG, "%s URL = %{sensitive, mask.hash}@, uint64_t result = %@ on %@", (uint8_t *)&v9, 0x34u);
  }

  return v5;
}

- (void)_cancelAuthorization
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1D7206000, v0, v1, "%@ already finished => ignoring cancel request", v2, v3, v4, v5, v6);
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint8_t v6 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v21 = a2;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "cancelAuthorizationWithCompletion: success = %d, error = %{public}@", buf, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    id v8 = *(void **)(a1 + 32);
    __int16 v7 = (id *)(a1 + 32);
    id v9 = v8;
    objc_sync_enter(v9);
    if (*((void *)*v7 + 2))
    {
      id v10 = SO_LOG_SOAuthorizationCore();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __43__SOAuthorizationCore__cancelAuthorization__block_invoke_cold_1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);
      }

      __int16 v17 = (void *)*((void *)*v7 + 2);
      *((void *)*v7 + 2) = 0;

      objc_sync_exit(v9);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __43__SOAuthorizationCore__cancelAuthorization__block_invoke_16;
      v19[3] = &unk_1E6A6F118;
      v19[4] = *v7;
      id v18 = (void *)MEMORY[0x1D946AAF0](v19);
      [*v7 performBlockOnDelegateQueue:v18];
    }
    else
    {
      objc_sync_exit(v9);
    }
  }
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_16(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = SO_LOG_SOAuthorizationCore();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __43__SOAuthorizationCore__cancelAuthorization__block_invoke_16_cold_2();
      }

      [v2 authorizationDidCancel:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v4 = SO_LOG_SOAuthorizationCore();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__SOAuthorizationCore__cancelAuthorization__block_invoke_16_cold_1();
    }
  }
}

- (void)_finishAuthorization:(id)a3 withCredential:(id)a4 error:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    requestParametersCore = self->_requestParametersCore;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 136316675;
    v27 = "-[SOAuthorizationCore _finishAuthorization:withCredential:error:]";
    __int16 v28 = 2114;
    id v29 = v8;
    __int16 v30 = 2113;
    id v31 = v9;
    __int16 v32 = 2114;
    id v33 = v10;
    __int16 v34 = 2114;
    v35 = requestParametersCore;
    __int16 v36 = 2114;
    id v37 = WeakRetained;
    __int16 v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_1D7206000, v11, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, credentialCore = %{private}@, error = %{public}@, requestParametersCore = %{public}@, delegate = %{public}@ on %@", buf, 0x48u);
  }
  uint64_t v14 = self;
  objc_sync_enter(v14);
  uint64_t v15 = v14->_requestParametersCore;
  if (v15)
  {
    v14->_requestParametersCore = 0;

    objc_sync_exit(v14);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke;
    int v21 = &unk_1E6A6F168;
    __int16 v22 = v14;
    id v23 = v10;
    id v24 = v9;
    id v25 = v8;
    uint64_t v16 = (void *)MEMORY[0x1D946AAF0](&v18);
    -[SOAuthorizationCore performBlockOnDelegateQueue:](v14, "performBlockOnDelegateQueue:", v16, v18, v19, v20, v21, v22);
  }
  else
  {
    __int16 v17 = SO_LOG_SOAuthorizationCore();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[SOAuthorizationCore _finishAuthorization:withCredential:error:]();
    }

    objc_sync_exit(v14);
  }
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v4 = (void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      if (+[SOErrorHelper error:v3 hasCode:-2])
      {
        if (objc_opt_respondsToSelector())
        {
          id v5 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_10();
          }

          [v2 authorizationDidCancel:*(void *)(a1 + 32)];
        }
        goto LABEL_53;
      }
      if (+[SOErrorHelper error:*v4 hasCode:-5])
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_25;
          }
          goto LABEL_26;
        }
      }
      else
      {
        if (!+[SOErrorHelper error:*v4 hasCode:-9])
        {
          if (objc_opt_respondsToSelector())
          {
            id v23 = SO_LOG_SOAuthorizationCore();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_13(a1 + 40, v23, v24, v25, v26, v27, v28, v29);
            }

            [v2 authorization:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
          }
          goto LABEL_53;
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
LABEL_25:
          }
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_11();
LABEL_26:

          [v2 authorizationDidNotHandle:*(void *)(a1 + 32)];
        }
      }
LABEL_53:
      __int16 v36 = SO_LOG_SOAuthorizationCore();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
        __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_2();
      }

      id v37 = *(void **)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 56);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_37;
      v41[3] = &unk_1E6A6F140;
      v41[4] = v37;
      [v37 finishAuthorization:v38 completion:v41];
      goto LABEL_56;
    }
    __int16 v7 = *(void **)(a1 + 48);
    if (!v7)
    {
      if (objc_opt_respondsToSelector())
      {
        uint64_t v19 = SO_LOG_SOAuthorizationCore();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_3();
        }

        [v2 authorizationDidComplete:*(void *)(a1 + 32)];
      }
      goto LABEL_53;
    }
    id v8 = [v7 secKeyProxyEndpoints];

    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_53;
      }
      id v9 = *(void **)(a1 + 32);
      id v10 = [*(id *)(a1 + 48) secKeyProxyEndpoints];
      id v42 = 0;
      uint64_t v11 = [v9 createSecKeysFromSecKeyProxyEndpoints:v10 error:&v42];
      id v12 = v42;

      if (v11)
      {
        uint64_t v13 = objc_alloc_init(SOAuthorizationResultCore);
        uint64_t v14 = [*(id *)(a1 + 48) httpAuthorizationHeaders];
        [(SOAuthorizationResultCore *)v13 setHttpAuthorizationHeaders:v14];

        uint64_t v15 = [*(id *)(a1 + 48) httpResponse];
        [(SOAuthorizationResultCore *)v13 setHttpResponse:v15];

        uint64_t v16 = [*(id *)(a1 + 48) httpBody];
        [(SOAuthorizationResultCore *)v13 setHttpBody:v16];

        [(SOAuthorizationResultCore *)v13 setPrivateKeys:v11];
        __int16 v17 = SO_LOG_SOAuthorizationCore();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_9();
        }

        [v2 authorization:*(void *)(a1 + 32) didCompleteWithAuthorizationResult:v13];
      }
      else
      {
        __int16 v34 = SO_LOG_SOAuthorizationCore();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_8();
        }

        if (objc_opt_respondsToSelector())
        {
          v35 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_7();
          }

          [v2 authorization:*(void *)(a1 + 32) didCompleteWithError:v12];
        }
      }
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 48) httpAuthorizationHeaders];

      if (v20)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_53;
        }
        int v21 = SO_LOG_SOAuthorizationCore();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_6();
        }

        uint64_t v22 = *(void *)(a1 + 32);
        id v12 = [*(id *)(a1 + 48) httpAuthorizationHeaders];
        [v2 authorization:v22 didCompleteWithHTTPAuthorizationHeaders:v12];
      }
      else
      {
        __int16 v30 = [*(id *)(a1 + 48) httpResponse];

        if (v30)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_53;
          }
          id v31 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_5();
          }

          uint64_t v32 = *(void *)(a1 + 32);
          id v12 = [*(id *)(a1 + 48) httpResponse];
          id v33 = [*(id *)(a1 + 48) httpBody];
          [v2 authorization:v32 didCompleteWithHTTPResponse:v12 httpBody:v33];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_53;
          }
          v39 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_4();
          }

          uint64_t v40 = *(void *)(a1 + 32);
          id v12 = +[SOErrorHelper errorWithCode:-1000 message:@"Invalid credential"];
          [v2 authorization:v40 didCompleteWithError:v12];
        }
      }
    }

    goto LABEL_53;
  }
  uint8_t v6 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_1();
  }

LABEL_56:
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_37(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint8_t v6 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543874;
    uint64_t v9 = v7;
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_debug_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ has finished (success: %d, error: %{public}@)", (uint8_t *)&v8, 0x1Cu);
  }
}

- (SOAuthorizationCoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SOAuthorizationCoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateDispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegateDispatchQueue:(id)a3
{
}

- (NSDictionary)authorizationOptions
{
  return self->_authorizationOptions;
}

- (void)setAuthorizationOptions:(id)a3
{
}

- (BOOL)isUserInteractionEnabled
{
  return self->_enableUserInteraction;
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  self->_enableUserInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationOptions, 0);
  objc_storeStrong((id *)&self->_delegateDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestParametersCore, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (SOAuthorizationRequestParametersCore)requestParametersCore
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_requestParametersCore;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestParametersCore:(id)a3
{
  uint64_t v4 = (SOAuthorizationRequestParametersCore *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestParametersCore = obj->_requestParametersCore;
  obj->_requestParametersCore = v4;

  objc_sync_exit(obj);
}

- (void)beginAuthorizationWithParameters:(id)a3 completion:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  int v8 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = [v6 identifier];
    int v21 = [v6 operation];
    uint64_t v9 = [v6 url];
    __int16 v10 = [v6 httpHeaders];
    int v11 = [v6 httpBody];
    __int16 v12 = [v6 auditTokenData];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL enableUserInteraction = self->_enableUserInteraction;
    *(_DWORD *)buf = 136317699;
    uint64_t v26 = "-[SOAuthorizationCore(Core) beginAuthorizationWithParameters:completion:]";
    __int16 v27 = 2114;
    uint64_t v28 = v22;
    __int16 v29 = 2114;
    __int16 v30 = v21;
    __int16 v31 = 2160;
    uint64_t v32 = 1752392040;
    __int16 v33 = 2117;
    __int16 v34 = v9;
    __int16 v35 = 2113;
    __int16 v36 = v10;
    __int16 v37 = 2113;
    uint64_t v38 = v11;
    __int16 v39 = 2114;
    uint64_t v40 = v12;
    __int16 v41 = 2114;
    id v42 = WeakRetained;
    __int16 v43 = 1024;
    BOOL v44 = enableUserInteraction;
    __int16 v45 = 2112;
    v46 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, operation = %{public}@, url = %{sensitive, mask.hash}@, httpHeaders = %{private}@, httpBody = %{private}@, auditToken = %{public}@, delegate = %{public}@, enableUI = %d on %@", buf, 0x6Cu);
  }
  uint64_t v15 = self;
  objc_sync_enter(v15);
  if (v15->_requestParametersCore)
  {
    uint64_t v16 = SO_LOG_SOAuthorizationCore();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = (const char *)v15;
      _os_log_impl(&dword_1D7206000, v16, OS_LOG_TYPE_DEFAULT, "%@ is already authorizing => ignoring a new authorization request", buf, 0xCu);
    }

    if (v7)
    {
      __int16 v17 = [NSString stringWithFormat:@"%@ is already authorizing => ignoring a new authorization request", v15];
      uint64_t v18 = +[SOErrorHelper silentInternalErrorWithMessage:v17];
      v7[2](v7, 0, v18);
    }
    objc_sync_exit(v15);
  }
  else
  {
    uint64_t v19 = [[SOAuthorizationRequestParametersCore alloc] initWithAuthorizationParametersCore:v6];
    requestParametersCore = v15->_requestParametersCore;
    v15->_requestParametersCore = v19;

    [(SOAuthorizationRequestParametersCore *)v15->_requestParametersCore setAuthorizationOptions:v15->_authorizationOptions];
    [(SOAuthorizationRequestParametersCore *)v15->_requestParametersCore setEnableUserInteraction:v15->_enableUserInteraction];
    objc_sync_exit(v15);

    if (!v15->_enableUserInteraction) {
      [(SOAuthorizationCore *)v15 _addNoUserInterfaceToAuthorizationOptionsInRequestParameters];
    }
    activity_block[0] = MEMORY[0x1E4F143A8];
    activity_block[1] = 3221225472;
    activity_block[2] = __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke;
    activity_block[3] = &unk_1E6A6F190;
    void activity_block[4] = v15;
    uint64_t v24 = v7;
    _os_activity_initiate(&dword_1D7206000, "beginAuthorizationWithParameters", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

void __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 8);
  uint64_t v3 = *(void *)(v1 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke_2;
  v4[3] = &unk_1E6A6EE98;
  id v5 = *(id *)(a1 + 40);
  [v2 performAuthorizationWithRequestParameters:v3 completion:v4];
}

void __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138478083;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "performAuthorizationWithRequestParameters: credential = %{private}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = (SOAuthorizationRequestParametersCore *)a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOAuthorizationCore(Core) beginAuthorizationWithRequestParameters:completion:](v6, (uint64_t)self, v8);
  }

  requestParametersCore = self->_requestParametersCore;
  self->_requestParametersCore = v6;
  id v10 = v6;

  if (!self->_enableUserInteraction) {
    [(SOAuthorizationCore *)self _addNoUserInterfaceToAuthorizationOptionsInRequestParameters];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__SOAuthorizationCore_Core__beginAuthorizationWithRequestParameters_completion___block_invoke;
  v12[3] = &unk_1E6A6F190;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  _os_activity_initiate(&dword_1D7206000, "beginAuthorizationWithParameters", OS_ACTIVITY_FLAG_DEFAULT, v12);
}

uint64_t __80__SOAuthorizationCore_Core__beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) beginAuthorizationWithRequestParameters:*(void *)(*(void *)(a1 + 32) + 16) completion:*(void *)(a1 + 40)];
}

- (void)_addNoUserInterfaceToAuthorizationOptionsInRequestParameters
{
  uint64_t v3 = [(SOAuthorizationRequestParametersCore *)self->_requestParametersCore authorizationOptions];
  if (v3)
  {
    uint64_t v4 = [(SOAuthorizationRequestParametersCore *)self->_requestParametersCore authorizationOptions];
    id v5 = (id)[v4 mutableCopy];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  }

  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"noUserInterface"];
  [(SOAuthorizationRequestParametersCore *)self->_requestParametersCore setAuthorizationOptions:v5];
}

- (void)performBlockOnDelegateQueue:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOAuthorizationCore(Core) performBlockOnDelegateQueue:]((uint64_t)self, v5);
  }

  delegateDispatchQueue = self->_delegateDispatchQueue;
  if (delegateDispatchQueue) {
    goto LABEL_7;
  }
  if (![MEMORY[0x1E4F29060] isMainThread])
  {
    delegateDispatchQueue = MEMORY[0x1E4F14428];
LABEL_7:
    dispatch_async(delegateDispatchQueue, v4);
    goto LABEL_8;
  }
  v4[2](v4);
LABEL_8:
}

- (void)debugHintsWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SOAuthorizationCore(Core) debugHintsWithCompletion:]";
    __int16 v8 = 2112;
    int v9 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  [(SOClient *)self->_client debugHintsWithCompletion:v4];
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOAuthorizationCore(Core) finishAuthorization:completion:]((uint64_t)self, v8);
  }

  [(SOClient *)self->_client finishAuthorization:v7 completion:v6];
}

- (id)createSecKeysFromSecKeyProxyEndpoints:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SOAuthorizationCore(Core) createSecKeysFromSecKeyProxyEndpoints:error:]();
  }

  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(MEMORY[0x1E4F3B450], "createKeyFromEndpoint:error:", *(void *)(*((void *)&v18 + 1) + 8 * i), a4, (void)v18);
        if (!v13)
        {
          uint64_t v16 = SO_LOG_SOAuthorizationCore();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            -[SOAuthorizationCore(Core) createSecKeysFromSecKeyProxyEndpoints:error:]((uint64_t *)a4, v16);
          }

          id v15 = 0;
          goto LABEL_15;
        }
        uint64_t v14 = (void *)v13;
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v15 = v7;
LABEL_15:

  return v15;
}

- (id)realms
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOAuthorizationCore(Kerberos) realms]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  client = self->_client;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__SOAuthorizationCore_Kerberos__realms__block_invoke;
  v10[3] = &unk_1E6A6F1B8;
  v10[4] = buf;
  [(SOClient *)client realmsWithCompletion:v10];
  id v5 = *(void **)(*(void *)&buf[8] + 40);
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C978] array];
    id v7 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v6;

    id v5 = *(void **)(*(void *)&buf[8] + 40);
  }
  id v8 = v5;
  _Block_object_dispose(buf, 8);

  return v8;
}

void __39__SOAuthorizationCore_Kerberos__realms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "realms = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)kerberosProfiles
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOAuthorizationCore(Kerberos) kerberosProfiles]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  client = self->_client;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__SOAuthorizationCore_Kerberos__kerberosProfiles__block_invoke;
  v10[3] = &unk_1E6A6F1B8;
  v10[4] = buf;
  [(SOClient *)client profilesWithExtensionBundleIdentifier:@"com.apple.AppSSOKerberos.KerberosExtension" completion:v10];
  id v5 = *(void **)(*(void *)&buf[8] + 40);
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C978] array];
    id v7 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v6;

    id v5 = *(void **)(*(void *)&buf[8] + 40);
  }
  id v8 = v5;
  _Block_object_dispose(buf, 8);

  return v8;
}

void __49__SOAuthorizationCore_Kerberos__kerberosProfiles__block_invoke(uint64_t a1, void *a2)
{
}

+ (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SO_LOG_SOAuthorizationCore();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "+[SOAuthorizationCore(Process) isExtensionProcessWithAuditToken:completion:]";
    __int16 v16 = 2112;
    id v17 = a1;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (isExtensionProcessWithAuditToken_completion__onceToken != -1) {
    dispatch_once(&isExtensionProcessWithAuditToken_completion__onceToken, &__block_literal_global_7);
  }
  activity_block[0] = MEMORY[0x1E4F143A8];
  activity_block[1] = 3221225472;
  long long v8 = *(_OWORD *)&a3->var0[4];
  long long v12 = *(_OWORD *)a3->var0;
  long long v13 = v8;
  activity_block[2] = __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_2;
  activity_block[3] = &unk_1E6A6F1E0;
  id v11 = v6;
  id v9 = v6;
  _os_activity_initiate(&dword_1D7206000, "isExtensionProcessWithAuditToken", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke()
{
  isExtensionProcessWithAuditToken_completion__client = objc_alloc_init(SOClient);
  return MEMORY[0x1F41817F8]();
}

void __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)isExtensionProcessWithAuditToken_completion__client;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_3;
  v5[3] = &unk_1E6A6EEE8;
  id v6 = *(id *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  [v2 isExtensionProcessWithAuditToken:v4 completion:v5];
}

uint64_t __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __93__SOAuthorizationCore_Configuration__isConfigurationActiveForExtensionIdentifier_completion___block_invoke;
  v9[3] = &unk_1E6A6F190;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  _os_activity_initiate(&dword_1D7206000, "isConfigurationActiveForExtensionIdentifier", OS_ACTIVITY_FLAG_DEFAULT, v9);
}

void __93__SOAuthorizationCore_Configuration__isConfigurationActiveForExtensionIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = +[SOConfigurationClient defaultClient];
  [v2 isConfigurationActiveForExtensionIdentifier:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1D7206000, a2, a3, "%@ still not finished => canceling now", a5, a6, a7, a8, 2u);
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_1D7206000, v0, OS_LOG_TYPE_ERROR, "canceling now - no SPI authorization delegate", v1, 2u);
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_16_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "canceling now - calling SPI authorization delegate authorizationDidCancel", v2, v3, v4, v5, v6);
}

- (void)_finishAuthorization:withCredential:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1D7206000, v0, v1, "%@ already finished => ignoring finish request", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(&dword_1D7206000, v0, OS_LOG_TYPE_ERROR, "no SPI authorization delegate", v1, 2u);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "finished SPI authorization delegate call", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorizationDidComplete", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError:", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPResponse:httpBody:", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPAuthorizationHeaders:", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError: (error = %{public}@)", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D7206000, v0, OS_LOG_TYPE_ERROR, "failed to create SecKeys from SecKeyProxyEndpoints: %{public}@", v1, 0xCu);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_9()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithAuthorizationResult:", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorizationDidCancel", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_11()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D7206000, v0, v1, "calling SPI authorization delegate authorizationDidNotHandle", v2, v3, v4, v5, v6);
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_13(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end