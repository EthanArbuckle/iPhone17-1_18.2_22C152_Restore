@interface MEComposeExtensionsHelper
+ (id)log;
- (BOOL)shouldPerformSendValidation;
- (MEComposeExtensionsHelper)initWithComposeSession:(id)a3 extensionsController:(id)a4 iconReloader:(id)a5;
- (MEMailComposeExtensionDelegate)extensionDelegate;
- (void)_dispatchMailComposeSessionDidBeginForExtensions:(id)a3;
- (void)appExtensionViewControllerForExtensionIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)dispatchEmailAddressTokenIconRequestsForMailMessage:(id)a3 completionHandler:(id)a4;
- (void)extensionsMatched:(id)a3;
- (void)extensionsNoLongerMatching:(id)a3;
- (void)getAdditionalHeadersForMessage:(id)a3 completionHandler:(id)a4;
- (void)performSendValidationForMessage:(id)a3 completionHandler:(id)a4;
- (void)regenerateEmailAddressTokenChangesForSession:(id)a3 forContextUUID:(id)a4;
- (void)regenerateSecurityStatusInformationForSession:(id)a3 forContextUUID:(id)a4;
- (void)setExtensionDelegate:(id)a3;
@end

@implementation MEComposeExtensionsHelper

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__MEComposeExtensionsHelper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1) {
    dispatch_once(&log_onceToken_0, block);
  }
  v2 = (void *)log_log_0;
  return v2;
}

void __32__MEComposeExtensionsHelper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;
}

- (MEComposeExtensionsHelper)initWithComposeSession:(id)a3 extensionsController:(id)a4 iconReloader:(id)a5
{
  v40[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v39.receiver = self;
  v39.super_class = (Class)MEComposeExtensionsHelper;
  v12 = [(MEComposeExtensionsHelper *)&v39 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_composeSession, a3);
    objc_storeStrong((id *)&v13->_extensionsController, a4);
    v14 = NSString;
    v15 = [(MEComposeSession *)v13->_composeSession sessionID];
    v16 = [v14 stringWithFormat:@"com.apple.email.composeextensionrequests.%@", v15];

    id v17 = v16;
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v21 = dispatch_queue_create(v18, v20);
    extensionRequestDispatcherQueue = v13->_extensionRequestDispatcherQueue;
    v13->_extensionRequestDispatcherQueue = (OS_dispatch_queue *)v21;

    id v23 = objc_alloc(MEMORY[0x263F3B370]);
    id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v25 = [v23 initWithObject:v24];
    remoteExtensions = v13->_remoteExtensions;
    v13->_remoteExtensions = (EFLocked *)v25;

    v27 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x263F3B350]);
    extensionsObserverCancelable = v13->_extensionsObserverCancelable;
    v13->_extensionsObserverCancelable = v27;

    objc_storeWeak((id *)&v13->_extensionDelegate, v11);
    id v29 = objc_alloc(MEMORY[0x263F3B370]);
    v30 = objc_opt_new();
    uint64_t v31 = [v29 initWithObject:v30];
    shouldPerformSendValidationMap = v13->_shouldPerformSendValidationMap;
    v13->_shouldPerformSendValidationMap = (EFLocked *)v31;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    extensionsController = v13->_extensionsController;
    v40[0] = @"MEComposeSessionHandler";
    v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke;
    v36[3] = &unk_264283100;
    objc_copyWeak(&v37, &location);
    [(MEAppExtensionsController *)extensionsController registerMailAppExtensionsObserver:v13 capabilities:v34 includeDisabled:0 completion:v36];

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return v13;
}

void __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      v13 = +[MEComposeExtensionsHelper log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_cold_1((uint64_t)v10, v13);
      }
    }
    else
    {
      id v14 = WeakRetained[3];
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_9;
      v16[3] = &unk_2642830D8;
      v15 = v9;
      id v17 = v15;
      [v14 performWhileLocked:v16];
      [v12 _dispatchMailComposeSessionDidBeginForExtensions:v15];
      [v12[4] addCancelable:v8];
      v13 = v17;
    }
  }
}

uint64_t __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 addObjectsFromArray:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(EFLocked *)self->_remoteExtensions getObject];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) composeSessionInterface];
        [v7 mailComposeSessionDidEnd:self->_composeSession];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  [(EFCancelationToken *)self->_extensionsObserverCancelable cancel];
  v8.receiver = self;
  v8.super_class = (Class)MEComposeExtensionsHelper;
  [(MEComposeExtensionsHelper *)&v8 dealloc];
}

- (void)extensionsMatched:(id)a3
{
  id v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__MEComposeExtensionsHelper_extensionsMatched___block_invoke;
  v7[3] = &unk_2642830D8;
  id v6 = v4;
  id v8 = v6;
  [(EFLocked *)remoteExtensions performWhileLocked:v7];
  [(MEComposeExtensionsHelper *)self _dispatchMailComposeSessionDidBeginForExtensions:v6];
}

uint64_t __47__MEComposeExtensionsHelper_extensionsMatched___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObjectsFromArray:*(void *)(a1 + 32)];
}

- (void)extensionsNoLongerMatching:(id)a3
{
  id v4 = a3;
  remoteExtensions = self->_remoteExtensions;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__MEComposeExtensionsHelper_extensionsNoLongerMatching___block_invoke;
  v8[3] = &unk_2642830D8;
  id v6 = v4;
  id v9 = v6;
  [(EFLocked *)remoteExtensions performWhileLocked:v8];
  v7 = [(MEComposeExtensionsHelper *)self extensionDelegate];
  [v7 reloadEmailAddressTokenIcons];
}

uint64_t __56__MEComposeExtensionsHelper_extensionsNoLongerMatching___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectsInArray:*(void *)(a1 + 32)];
}

- (void)_dispatchMailComposeSessionDidBeginForExtensions:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  extensionRequestDispatcherQueue = self->_extensionRequestDispatcherQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke;
  block[3] = &unk_264283088;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(extensionRequestDispatcherQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v13 != v4) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          v7 = [v6 interfaceForExtensionCapability:@"MEComposeSessionHandler"];
          v11[0] = MEMORY[0x263EF8330];
          v11[1] = 3221225472;
          v11[2] = __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_2;
          v11[3] = &unk_264283128;
          v11[4] = WeakRetained;
          v11[5] = v6;
          [v7 addSuccessBlock:v11];

          id v8 = [v6 interfaceForExtensionCapability:@"MEComposeSessionHandler"];
          v10[0] = MEMORY[0x263EF8330];
          v10[1] = 3221225472;
          v10[2] = __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15;
          v10[3] = &unk_264283150;
          v10[4] = WeakRetained;
          [v8 addFailureBlock:v10];
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v3);
    }
  }
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[MEComposeExtensionsHelper log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_2164DB000, v4, OS_LOG_TYPE_DEFAULT, "ComposeSession:%@ Dispatchin mailComposeSessionDidBegin for extension %@", (uint8_t *)&v9, 0x16u);
  }

  [v3 mailComposeSessionDidBegin:*(void *)(*(void *)(a1 + 32) + 8)];
  v7 = [*(id *)(a1 + 32) extensionDelegate];
  [v7 reloadEmailAddressTokenIcons];

  id v8 = [*(id *)(a1 + 40) extensionHostContext];
  [v8 setComposeExtensionHostDelegate:*(void *)(a1 + 32)];
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MEComposeExtensionsHelper log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (void)dispatchEmailAddressTokenIconRequestsForMailMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  extensionRequestDispatcherQueue = self->_extensionRequestDispatcherQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke;
  block[3] = &unk_2642831C8;
  objc_copyWeak(&v17, &location);
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(extensionRequestDispatcherQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v19 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (id *)WeakRetained;
    id v17 = [*((id *)WeakRetained + 3) getObject];
    [v3[1] setMailMessage:*(void *)(a1 + 32)];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v17;
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v25 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v8 = [MEMORY[0x263F3B398] promise];
          int v9 = [v7 synchronousComposeSessionInterface];
          uint64_t v10 = v19[1];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_2;
          v21[3] = &unk_2642831A0;
          v21[4] = v7;
          id v22 = *(id *)(a1 + 40);
          id v11 = v8;
          id v23 = v11;
          [v9 session:v10 annotateAddressesWithCompletionHandler:v21];

          id v12 = [v11 future];
          id v20 = 0;
          id v13 = (id)[v12 resultWithTimeout:&v20 error:3.0];
          id v14 = v20;

          if (v14)
          {
            id v15 = +[MEComposeExtensionsHelper log];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = v19[1];
              *(_DWORD *)buf = 138412546;
              id v29 = v7;
              __int16 v30 = 2112;
              uint64_t v31 = v16;
              _os_log_error_impl(&dword_2164DB000, v15, OS_LOG_TYPE_ERROR, "Extension:%@ timeout when requesting address annotations for session %@", buf, 0x16u);
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_3;
  v17[3] = &unk_264283178;
  v17[4] = *(void *)(a1 + 32);
  id v3 = objc_msgSend(a2, "ef_mapValues:", v17);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
        if (!v9)
        {
          int v9 = objc_opt_new();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:");
        }
        uint64_t v10 = [v3 objectForKeyedSubscript:v8];
        [v9 addObject:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }

  id v11 = *(void **)(a1 + 48);
  id v12 = [MEMORY[0x263EFF9D0] null];
  [v11 finishWithResult:v12];
}

id __99__MEComposeExtensionsHelper_dispatchEmailAddressTokenIconRequestsForMailMessage_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) displayName];
  [v3 setOriginatorExtensionDisplayName:v4];

  return v3;
}

- (void)regenerateEmailAddressTokenChangesForSession:(id)a3 forContextUUID:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[MEComposeExtensionsHelper log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MEComposeExtensionsHelper *)self extensionDelegate];
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_2164DB000, v5, OS_LOG_TYPE_DEFAULT, "MEMailComposeExtensionsHelper[%@]: Ivoking %@ to reload address token icons.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(MEComposeExtensionsHelper *)self extensionDelegate];
  [v7 reloadEmailAddressTokenIcons];
}

- (void)regenerateSecurityStatusInformationForSession:(id)a3 forContextUUID:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[MEComposeExtensionsHelper log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(MEComposeExtensionsHelper *)self extensionDelegate];
    int v8 = 138412546;
    int v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_2164DB000, v5, OS_LOG_TYPE_DEFAULT, "MEMailComposeExtensionsHelper[%@]: Ivoking %@ to reload message security status information.", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(MEComposeExtensionsHelper *)self extensionDelegate];
  [v7 reloadCanSignAndEncryptControls];
}

- (void)performSendValidationForMessage:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)shouldPerformSendValidation
{
  return 0;
}

- (void)getAdditionalHeadersForMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x263EFF9A0] dictionary];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  extensionRequestDispatcherQueue = self->_extensionRequestDispatcherQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke;
  block[3] = &unk_2642831C8;
  objc_copyWeak(&v17, &location);
  id v15 = v8;
  id v16 = v7;
  id v14 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(extensionRequestDispatcherQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v19 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (id *)WeakRetained;
    id v17 = [*((id *)WeakRetained + 3) getObject];
    [v3[1] setMailMessage:*(void *)(a1 + 32)];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v17;
    uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v25 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          int v8 = [MEMORY[0x263F3B398] promise];
          int v9 = [v7 synchronousComposeSessionInterface];
          uint64_t v10 = v19[1];
          v21[0] = MEMORY[0x263EF8330];
          v21[1] = 3221225472;
          v21[2] = __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke_2;
          v21[3] = &unk_2642831F0;
          id v22 = *(id *)(a1 + 40);
          id v11 = v8;
          id v23 = v11;
          [v9 session:v10 getAdditionalHeadersWithCompletion:v21];

          id v12 = [v11 future];
          id v20 = 0;
          id v13 = (id)[v12 resultWithTimeout:&v20 error:3.0];
          id v14 = v20;

          if (v14)
          {
            id v15 = +[MEComposeExtensionsHelper log];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              uint64_t v16 = v19[1];
              *(_DWORD *)buf = 138412546;
              id v29 = v7;
              __int16 v30 = 2112;
              uint64_t v31 = v16;
              _os_log_error_impl(&dword_2164DB000, v15, OS_LOG_TYPE_ERROR, "Extension:%@ timeout when fetching additional headers for session %@", buf, 0x16u);
            }
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __78__MEComposeExtensionsHelper_getAdditionalHeadersForMessage_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addEntriesFromDictionary:");
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [MEMORY[0x263EFF9D0] null];
  [v3 finishWithResult:v4];
}

- (void)appExtensionViewControllerForExtensionIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(EFLocked *)self->_remoteExtensions getObject];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_264283040;
  id v9 = v6;
  id v16 = v9;
  uint64_t v10 = objc_msgSend(v8, "ef_firstObjectPassingTest:", v15);
  composeSession = self->_composeSession;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke_2;
  v13[3] = &unk_264283218;
  id v12 = v7;
  id v14 = v12;
  [v10 getMailComposeExtensionViewControllerForSession:composeSession hostDelegate:self completionHandler:v13];
}

uint64_t __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 extensionID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __96__MEComposeExtensionsHelper_appExtensionViewControllerForExtensionIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (MEMailComposeExtensionDelegate)extensionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extensionDelegate);
  return (MEMailComposeExtensionDelegate *)WeakRetained;
}

- (void)setExtensionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionDelegate);
  objc_storeStrong((id *)&self->_shouldPerformSendValidationMap, 0);
  objc_storeStrong((id *)&self->_extensionRequestDispatcherQueue, 0);
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);
  objc_storeStrong((id *)&self->_composeSession, 0);
}

void __86__MEComposeExtensionsHelper_initWithComposeSession_extensionsController_iconReloader___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2164DB000, a2, OS_LOG_TYPE_ERROR, "Failed to register for app extensions changes error:%@", (uint8_t *)&v2, 0xCu);
}

void __78__MEComposeExtensionsHelper__dispatchMailComposeSessionDidBeginForExtensions___block_invoke_15_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_2164DB000, log, OS_LOG_TYPE_ERROR, "ComposeSession:%@ Failed to fetch the compose session interface due to %@", (uint8_t *)&v4, 0x16u);
}

@end