@interface VSAccountManager
- (BOOL)viewServiceRequestOperation:(id)a3 shouldAuthenticateAccountProviderWithIdentifier:(id)a4;
- (VSAccountManager)init;
- (VSAccountManagerResult)enqueueAccountMetadataRequest:(VSAccountMetadataRequest *)request completionHandler:(void *)completionHandler;
- (VSLinkedOnOrAfterChecker)linkedOnOrAfterChecker;
- (VSPrivacyInfoCenter)privacyInfoCenter;
- (VSSecurityTask)securityTask;
- (VSViewServiceRequestCenter)requestCenter;
- (id)_enqueueViewServiceRequest:(id)a3 completionHandler:(id)a4;
- (id)delegate;
- (void)checkAccessStatusWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler;
- (void)setDelegate:(id)delegate;
- (void)setLinkedOnOrAfterChecker:(id)a3;
- (void)setPrivacyInfoCenter:(id)a3;
- (void)setRequestCenter:(id)a3;
- (void)setSecurityTask:(id)a3;
- (void)viewServiceRequestOperation:(id)a3 dismissViewController:(id)a4;
- (void)viewServiceRequestOperation:(id)a3 presentViewController:(id)a4;
@end

@implementation VSAccountManager

- (VSAccountManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)VSAccountManager;
  v2 = [(VSAccountManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = +[VSSecurityTask currentSecurityTask];
    securityTask = v2->_securityTask;
    v2->_securityTask = (VSSecurityTask *)v3;

    uint64_t v5 = +[VSPrivacyInfoCenter sharedPrivacyInfoCenter];
    privacyInfoCenter = v2->_privacyInfoCenter;
    v2->_privacyInfoCenter = (VSPrivacyInfoCenter *)v5;

    uint64_t v7 = +[VSViewServiceRequestCenter sharedViewServiceRequestCenter];
    requestCenter = v2->_requestCenter;
    v2->_requestCenter = (VSViewServiceRequestCenter *)v7;

    v9 = objc_alloc_init(VSLinkedOnOrAfterChecker);
    linkedOnOrAfterChecker = v2->_linkedOnOrAfterChecker;
    v2->_linkedOnOrAfterChecker = v9;
  }
  return v2;
}

- (void)viewServiceRequestOperation:(id)a3 presentViewController:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v12 = "VSAccountManagerDelegate";
    __int16 v13 = 2080;
    v14 = "accountManager:presentViewController:";
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will call -[%s %s]", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__VSAccountManager_viewServiceRequestOperation_presentViewController___block_invoke;
  v9[3] = &unk_1E6BD2C38;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  __70__VSAccountManager_viewServiceRequestOperation_presentViewController___block_invoke((uint64_t)v9);
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v12 = "VSAccountManagerDelegate";
    __int16 v13 = 2080;
    v14 = "accountManager:presentViewController:";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Did call -[%s %s]", buf, 0x16u);
  }
}

void __70__VSAccountManager_viewServiceRequestOperation_presentViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accountManager:*(void *)(a1 + 32) presentViewController:*(void *)(a1 + 40)];
}

- (void)viewServiceRequestOperation:(id)a3 dismissViewController:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v12 = "VSAccountManagerDelegate";
    __int16 v13 = 2080;
    v14 = "accountManager:dismissViewController:";
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will call -[%s %s]", buf, 0x16u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__VSAccountManager_viewServiceRequestOperation_dismissViewController___block_invoke;
  v9[3] = &unk_1E6BD2C38;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  __70__VSAccountManager_viewServiceRequestOperation_dismissViewController___block_invoke((uint64_t)v9);
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v12 = "VSAccountManagerDelegate";
    __int16 v13 = 2080;
    v14 = "accountManager:dismissViewController:";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Did call -[%s %s]", buf, 0x16u);
  }
}

void __70__VSAccountManager_viewServiceRequestOperation_dismissViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accountManager:*(void *)(a1 + 32) dismissViewController:*(void *)(a1 + 40)];
}

- (BOOL)viewServiceRequestOperation:(id)a3 shouldAuthenticateAccountProviderWithIdentifier:(id)a4
{
  id v5 = a4;
  v6 = [(VSAccountManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 accountManager:self shouldAuthenticateAccountProviderWithIdentifier:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)checkAccessStatusWithOptions:(NSDictionary *)options completionHandler:(void *)completionHandler
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v6 = options;
  char v7 = completionHandler;
  v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v36 = "-[VSAccountManager checkAccessStatusWithOptions:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  VSRequireUsageInfoPlistKey();
  if (v6)
  {
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The options parameter must not be nil."];
    if (v7) {
      goto LABEL_5;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
LABEL_5:
  [(NSDictionary *)v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9];
  v9 = [(VSAccountManager *)self securityTask];
  id v34 = 0;
  int v10 = VSCheckEntitlementForTask(v9, &v34);
  id v11 = v34;

  if (v10)
  {
    objc_super v12 = [(VSAccountManager *)self privacyInfoCenter];
    uint64_t v13 = [v12 accountAccessStatus];
    uint64_t v14 = v13;
    if ((unint64_t)(v13 - 1) < 3)
    {
      uint64_t v15 = [(VSAccountManager *)self requestCenter];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_90;
      v28[3] = &unk_1E6BD3010;
      uint64_t v30 = v14;
      v29 = v7;
      id v16 = (id)[v15 enqueueCompletionHandlerBlock:v28];

      v17 = v29;
LABEL_15:

      goto LABEL_16;
    }
    if (!v13)
    {
      v17 = objc_alloc_init(VSViewServiceRequest);
      v21 = [(NSDictionary *)v6 objectForKey:@"VSCheckAccessOptionPrompt"];
      uint64_t v22 = [v21 BOOLValue];

      [(VSViewServiceRequest *)v17 setAllowsPrivacyUI:v22];
      [(VSViewServiceRequest *)v17 setRequiresPrivacyUI:v22];
      v23 = [(VSAccountManager *)self linkedOnOrAfterChecker];
      -[VSViewServiceRequest setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:](v17, "setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:", [v23 shouldPerformBehavior:2]);

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2;
      v31[3] = &unk_1E6BD2E18;
      id v32 = v12;
      id v33 = v7;
      id v24 = [(VSAccountManager *)self _enqueueViewServiceRequest:v17 completionHandler:v31];

      goto LABEL_15;
    }
  }
  else
  {
    v18 = VSErrorLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[VSAccountManager checkAccessStatusWithOptions:completionHandler:]((uint64_t)v11, v18);
    }

    v19 = [(VSAccountManager *)self requestCenter];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_91;
    v25[3] = &unk_1E6BD2C88;
    id v27 = v7;
    id v26 = v11;
    id v20 = (id)[v19 enqueueCompletionHandlerBlock:v25];

    objc_super v12 = v27;
  }
LABEL_16:
}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v4 = a3;
  if ([@"VSCheckAccessOptionPrompt" isEqual:v7])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (CFTypeID v5 = CFGetTypeID(v4), v5 != CFBooleanGetTypeID())) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported value %@ for %@ option", v4, v7 format];
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported option: %@", v7, v6 format];
  }
}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v12 = "-[VSAccountManager checkAccessStatusWithOptions:completionHandler:]_block_invoke_2";
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_84;
  v7[3] = &unk_1E6BD2CD8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v5 = v3;
  __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_84((uint64_t)v7);
  uint64_t v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v12 = "-[VSAccountManager checkAccessStatusWithOptions:completionHandler:]_block_invoke_4";
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
  }
}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_84(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountAccessStatus];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2_85;
  v7[3] = &unk_1E6BD2FC0;
  id v3 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = v2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_3;
  v4[3] = &unk_1E6BD2FE8;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = v2;
  [v3 unwrapObject:v7 error:v4];
}

uint64_t __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_2_85(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

uint64_t __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), a2);
}

void __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_90(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 3)
  {
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = VSPublicError(0, 0, 0);
  }
  id v3 = (id)v2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __67__VSAccountManager_checkAccessStatusWithOptions_completionHandler___block_invoke_91(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)_enqueueViewServiceRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VSAccountManager *)self privacyInfoCenter];
  uint64_t v9 = [(VSAccountManager *)self requestCenter];
  uint64_t v10 = [v8 accountAccessStatus];
  if ((unint64_t)(v10 - 1) < 2)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke;
    v18[3] = &unk_1E6BD2DC8;
    objc_super v12 = &v19;
    id v19 = v7;
    uint64_t v13 = [v9 enqueueCompletionHandlerBlock:v18];
LABEL_6:

    if (v13) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (!v10 || v10 == 3)
  {
    id v11 = [(VSAccountManager *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_2;
    v15[3] = &unk_1E6BD2E18;
    objc_super v12 = &v16;
    id v16 = v8;
    id v17 = v7;
    uint64_t v13 = [v9 enqueueRequest:v6 withAccountManagerDelegate:v11 operationDelegate:self completionHandler:v15];

    goto LABEL_6;
  }
LABEL_7:
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The result parameter must not be nil."];
  uint64_t v13 = 0;
LABEL_8:

  return v13;
}

void __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke(uint64_t a1)
{
  VSPublicError(0, 0, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[VSFailable failableWithError:v4];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);
}

void __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_3;
  v9[3] = &unk_1E6BD3038;
  id v10 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v11 = v3;
  id v12 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_4;
  v6[3] = &unk_1E6BD3060;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v5 unwrapObject:v9 error:v6];
}

uint64_t __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) updateAccountAccessStatusWithResponse:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

void __65__VSAccountManager__enqueueViewServiceRequest_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v5 = [*(id *)(a1 + 32) updateAccountAccessStatusWithError:a2];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[VSFailable failableWithError:v5];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

- (VSAccountManagerResult)enqueueAccountMetadataRequest:(VSAccountMetadataRequest *)request completionHandler:(void *)completionHandler
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = request;
  id v7 = completionHandler;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v26 = "-[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  VSRequireUsageInfoPlistKey();
  if (v6)
  {
    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The request parameter must not be nil."];
    if (v7) {
      goto LABEL_5;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
LABEL_5:
  uint64_t v9 = [(VSAccountManager *)self securityTask];
  id v24 = 0;
  int v10 = VSCheckEntitlementForTask(v9, &v24);
  id v11 = v24;

  if (v10)
  {
    id v12 = objc_alloc_init(VSViewServiceRequest);
    [(VSViewServiceRequest *)v12 setAccountMetadataRequest:v6];
    uint64_t v13 = [(VSAccountManager *)self linkedOnOrAfterChecker];
    -[VSViewServiceRequest setShouldInferFeaturedProviders:](v12, "setShouldInferFeaturedProviders:", [v13 shouldPerformBehavior:1] ^ 1);

    [(VSViewServiceRequest *)v12 setAllowsPrivacyUI:[(VSAccountMetadataRequest *)v6 isInterruptionAllowed]];
    [(VSViewServiceRequest *)v12 setRequiresPrivacyUI:0];
    uint64_t v14 = [(VSAccountManager *)self delegate];
    [(VSViewServiceRequest *)v12 setCanVetoAuthentication:objc_opt_respondsToSelector() & 1];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke;
    v22[3] = &unk_1E6BD30B0;
    id v23 = v7;
    uint64_t v15 = [(VSAccountManager *)self _enqueueViewServiceRequest:v12 completionHandler:v22];
  }
  else
  {
    id v16 = VSErrorLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]((uint64_t)v11, v16);
    }

    id v17 = [(VSAccountManager *)self requestCenter];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_101;
    v19[3] = &unk_1E6BD2C88;
    v21 = v7;
    id v20 = v11;
    uint64_t v15 = [v17 enqueueCompletionHandlerBlock:v19];

    id v12 = v21;
  }

  if (!v15) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The managerResult parameter must not be nil."];
  }

  return (VSAccountManagerResult *)v15;
}

void __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_99;
  v7[3] = &unk_1E6BD2E90;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v5 = v3;
  __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_99((uint64_t)v7);
  id v6 = VSDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[VSAccountManager enqueueAccountMetadataRequest:completionHandler:]_block_invoke_4";
    _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
  }
}

void __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_99(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6BD3088;
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_3;
  v3[3] = &unk_1E6BD2DA0;
  id v4 = *(id *)(a1 + 40);
  [v2 unwrapObject:v5 error:v3];
}

void __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 accountMetadata];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__VSAccountManager_enqueueAccountMetadataRequest_completionHandler___block_invoke_101(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (VSSecurityTask)securityTask
{
  return self->_securityTask;
}

- (void)setSecurityTask:(id)a3
{
}

- (VSPrivacyInfoCenter)privacyInfoCenter
{
  return self->_privacyInfoCenter;
}

- (void)setPrivacyInfoCenter:(id)a3
{
}

- (VSViewServiceRequestCenter)requestCenter
{
  return self->_requestCenter;
}

- (void)setRequestCenter:(id)a3
{
}

- (VSLinkedOnOrAfterChecker)linkedOnOrAfterChecker
{
  return self->_linkedOnOrAfterChecker;
}

- (void)setLinkedOnOrAfterChecker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedOnOrAfterChecker, 0);
  objc_storeStrong((id *)&self->_requestCenter, 0);
  objc_storeStrong((id *)&self->_privacyInfoCenter, 0);
  objc_storeStrong((id *)&self->_securityTask, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)checkAccessStatusWithOptions:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Check access caller process lacks entitlement: %@", (uint8_t *)&v2, 0xCu);
}

- (void)enqueueAccountMetadataRequest:(uint64_t)a1 completionHandler:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Metadata request caller process lacks entitlement: %@", (uint8_t *)&v2, 0xCu);
}

@end