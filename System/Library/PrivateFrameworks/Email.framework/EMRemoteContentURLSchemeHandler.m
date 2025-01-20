@interface EMRemoteContentURLSchemeHandler
+ (id)dataTaskForRequest:(id)a3 withSchemePrefix:(id)a4 session:(id)a5 scheduler:(id)a6 allowProxying:(BOOL)a7 cancelationToken:(id *)a8 completionHandler:(id)a9;
- (BOOL)allowProxying;
- (EMRemoteContentURLSchemeHandler)initWithSession:(id)a3 schemePrefix:(id)a4 allowProxying:(BOOL)a5;
- (NSString)remoteContentHTTPSScheme;
- (NSString)remoteContentHTTPScheme;
- (NSString)schemePrefix;
- (void)setOnWebViewConfiguration:(id)a3;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation EMRemoteContentURLSchemeHandler

- (EMRemoteContentURLSchemeHandler)initWithSession:(id)a3 schemePrefix:(id)a4 allowProxying:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EMRemoteContentURLSchemeHandler;
  v11 = [(EMRemoteContentURLSchemeHandler *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_schemePrefix, a4);
    uint64_t v13 = [MEMORY[0x1E4F60F28] mainThreadScheduler];
    scheduler = v12->_scheduler;
    v12->_scheduler = (EFScheduler *)v13;

    objc_storeStrong((id *)&v12->_session, a3);
    v12->_allowProxying = a5;
  }

  return v12;
}

- (NSString)remoteContentHTTPScheme
{
  return [(NSString *)self->_schemePrefix stringByAppendingString:@"http"];
}

- (NSString)remoteContentHTTPSScheme
{
  return [(NSString *)self->_schemePrefix stringByAppendingString:@"https"];
}

- (void)setOnWebViewConfiguration:(id)a3
{
  id v7 = a3;
  v4 = [(EMRemoteContentURLSchemeHandler *)self remoteContentHTTPScheme];
  [v7 setURLSchemeHandler:self forURLScheme:v4];

  v5 = [(EMRemoteContentURLSchemeHandler *)self remoteContentHTTPSScheme];
  [v7 setURLSchemeHandler:self forURLScheme:v5];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  [v7 _setAllowedNetworkHosts:v6];
}

+ (id)dataTaskForRequest:(id)a3 withSchemePrefix:(id)a4 session:(id)a5 scheduler:(id)a6 allowProxying:(BOOL)a7 cancelationToken:(id *)a8 completionHandler:(id)a9
{
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v36 = a6;
  id v17 = a9;
  v35 = v15;
  id v18 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  v19 = objc_msgSend(v14, "mutableCopy", v18, v17, v16);
  v20 = [v14 URL];
  v21 = objc_msgSend(v20, "ef_urlByRemovingPrefixFromScheme:", v15);
  [v19 setURL:v21];

  if (a8) {
    *a8 = v18;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke;
  v40[3] = &unk_1E63E5FA0;
  id v22 = v16;
  id v41 = v22;
  id v23 = v19;
  v24 = v18;
  id v25 = v23;
  id v42 = v23;
  BOOL v46 = v10;
  id v26 = v24;
  id v43 = v26;
  id v27 = v36;
  id v44 = v27;
  id v28 = v17;
  id v45 = v28;
  v29 = (void (**)(void, void))MEMORY[0x1C18A2160](v40);
  id v30 = objc_alloc_init(MEMORY[0x1E4F60E18]);
  v31 = v30;
  if (v10)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_4;
    v37[3] = &unk_1E63E51E0;
    id v38 = v30;
    v39 = v29;
    EMPrivacyProxyIsDisabledForNetwork(v37);

    v32 = v38;
  }
  else
  {
    v32 = v29[2](v29, 0);
    [v31 finishWithResult:v32];
  }

  v33 = [v31 future];

  return v33;
}

id __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_2;
  v9[3] = &unk_1E63E5F78;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  id v7 = [v4 dataTaskWithRequest:v5 isSynthetic:0 allowProxying:v6 failOpen:a2 completionHandler:v9];
  [*(id *)(a1 + 48) addCancelable:v7];

  return v7;
}

void __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (([*(id *)(a1 + 32) isCanceled] & 1) == 0)
  {
    id v10 = *(void **)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    id v15 = __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_3;
    id v16 = &unk_1E63E5F50;
    id v20 = *(id *)(a1 + 48);
    id v17 = v7;
    id v18 = v8;
    id v19 = v9;
    id v12 = [v11 performCancelableBlock:&v13];
    objc_msgSend(v10, "addCancelable:", v12, v13, v14, v15, v16);
  }
}

uint64_t __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void __138__EMRemoteContentURLSchemeHandler_dataTaskForRequest_withSchemePrefix_session_scheduler_allowProxying_cancelationToken_completionHandler___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithResult:");
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = _os_activity_create(&dword_1BEFDB000, "-[EMRemoteContentURLSchemeHandler webView:startURLSchemeTask:]", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v6, &state);
  id v7 = [v5 request];
  id v8 = [v7 URL];
  id v9 = [v8 scheme];
  char v10 = objc_msgSend(v9, "ef_hasCaseInsensitivePrefix:", self->_schemePrefix);

  if (v10)
  {
    id v11 = self->_scheduler;
    id v12 = objc_opt_class();
    schemePrefix = self->_schemePrefix;
    session = self->_session;
    BOOL v15 = [(EMRemoteContentURLSchemeHandler *)self allowProxying];
    id v29 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke;
    v27[3] = &unk_1E63E5FC8;
    id v16 = v5;
    id v28 = v16;
    id v17 = [v12 dataTaskForRequest:v7 withSchemePrefix:schemePrefix session:session scheduler:v11 allowProxying:v15 cancelationToken:&v29 completionHandler:v27];
    id v18 = v29;
    objc_setAssociatedObject(v16, &kTokenKey, v18, (void *)0x301);
    [v17 addSuccessBlock:&__block_literal_global_44];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_3;
    v23[3] = &unk_1E63E49F8;
    id v19 = v18;
    id v24 = v19;
    id v20 = v11;
    id v25 = v20;
    id v26 = v16;
    [v17 addFailureBlock:v23];

    v21 = v28;
  }
  else
  {
    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F289B0];
    id v19 = [v7 URL];
    v32[0] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    v21 = [v22 errorWithDomain:*MEMORY[0x1E4F289A0] code:-1000 userInfo:v20];
    [v5 didFailWithError:v21];
  }

  os_activity_scope_leave(&state);
}

void __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  if (v7)
  {
    [v9 didReceiveResponse:v7];
    [*(id *)(a1 + 32) didReceiveData:v10];
    [*(id *)(a1 + 32) didFinish];
  }
  else
  {
    [v9 didFailWithError:v8];
  }
}

uint64_t __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 resume];
}

void __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_4;
  id v11 = &unk_1E63E6018;
  id v12 = *(id *)(a1 + 48);
  id v6 = v3;
  id v13 = v6;
  id v7 = [v5 performCancelableBlock:&v8];
  objc_msgSend(v4, "addCancelable:", v7, v8, v9, v10, v11);
}

uint64_t __62__EMRemoteContentURLSchemeHandler_webView_startURLSchemeTask___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id object = a4;
  v4 = objc_getAssociatedObject(object, &kTokenKey);
  [v4 cancel];
  objc_setAssociatedObject(object, &kTokenKey, 0, (void *)0x301);
}

- (NSString)schemePrefix
{
  return self->_schemePrefix;
}

- (BOOL)allowProxying
{
  return self->_allowProxying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_schemePrefix, 0);
}

@end