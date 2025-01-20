@interface INCExtensionProxy
+ (void)initialize;
- (BOOL)_extensionProcessHasEntitlement:(id)a3;
- (BOOL)_isExtensionBeingDebugged;
- (BOOL)_isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:(id)a3;
- (BOOL)_shouldForwardToAppWithIntent:(id)a3 intentResponse:(id)a4;
- (BOOL)shouldCache;
- (BOOL)shouldResetRequestAfterHandle;
- (INCExtensionConnection)_connection;
- (NSExtension)_extension;
- (NSValue)_auditTokenValue;
- (_INExtensionContextVending)_vendorRemote;
- (id)_initWithConnection:(id)a3 extension:(id)a4 vendorRemote:(id)a5 auditTokenValue:(id)a6;
- (id)_processIntent:(id)a3 intentResponse:(id)a4 withCacheItems:(id)a5;
- (id)imageCachingHandler;
- (id)imageProcessingHandler;
- (id)responseHandler;
- (void)_issueSandboxExtensionsForFileURLsIfNeededToIntent:(id)a3;
- (void)confirmIntentWithCompletionHandler:(id)a3;
- (void)getDefaultValueForParameterNamed:(id)a3 completionHandler:(id)a4;
- (void)getOptionsForParameterNamed:(id)a3 completionHandler:(id)a4;
- (void)getOptionsForParameterNamed:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)handleIntentWithCompletionHandler:(id)a3;
- (void)prewarmAppWithIntent:(id)a3 completionHandler:(id)a4;
- (void)resolveIntentSlotKeyPath:(id)a3 completionHandler:(id)a4;
- (void)resolveIntentSlotKeyPaths:(id)a3 completionHandler:(id)a4;
- (void)setImageCachingHandler:(id)a3;
- (void)setImageProcessingHandler:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setShouldCache:(BOOL)a3;
- (void)setShouldResetRequestAfterHandle:(BOOL)a3;
- (void)startSendingUpdatesToObserver:(id)a3;
- (void)stopSendingUpdates;
@end

@implementation INCExtensionProxy

- (id)_initWithConnection:(id)a3 extension:(id)a4 vendorRemote:(id)a5 auditTokenValue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)INCExtensionProxy;
  v15 = [(INCExtensionProxy *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_extension, a4);
    objc_storeStrong((id *)&v16->_vendorRemote, a5);
    objc_storeStrong((id *)&v16->_connection, a3);
    objc_storeStrong((id *)&v16->_auditTokenValue, a6);
    v16->_shouldCache = 1;
  }

  return v16;
}

- (NSExtension)_extension
{
  return self->_extension;
}

- (INCExtensionConnection)_connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong(&self->_imageProcessingHandler, 0);
  objc_storeStrong(&self->_imageCachingHandler, 0);
  objc_storeStrong((id *)&self->_auditTokenValue, 0);
  objc_storeStrong((id *)&self->_vendorRemote, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (BOOL)_isExtensionBeingDebugged
{
  v2 = [(INCExtensionProxy *)self _extension];
  v3 = [v2 _plugIn];
  unint64_t v4 = ((unint64_t)[v3 userElection] >> 8) & 1;

  return v4;
}

- (void)setImageProcessingHandler:(id)a3
{
}

- (void)setResponseHandler:(id)a3
{
}

- (void)resolveIntentSlotKeyPaths:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(INCExtensionProxy *)self _connection];
  v9 = [v8 _transaction];

  v10 = [v9 currentIntent];
  [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v10];
  id v11 = [[INCExtensionTransactionState alloc] initWithType:1 intent:v10 intentResponse:0 userActivities:0];
  [v9 setState:v11];

  [(INCExtensionConnection *)self->_connection _startRequestTimerWithExtensionProxy:self];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F30648]) initWithIntent:v10 parameterNames:v7];

  id v13 = [(INCExtensionProxy *)self _connection];
  [v13 requestTimeoutInterval];
  objc_msgSend(v12, "setRequestTimeout:");

  vendorRemote = self->_vendorRemote;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke;
  v16[3] = &unk_1E62BB860;
  v16[4] = self;
  id v17 = v6;
  id v15 = v6;
  [v12 executeRemotelyWithVendorRemote:vendorRemote completionHandler:v16];
}

- (void)_issueSandboxExtensionsForFileURLsIfNeededToIntent:(id)a3
{
  auditTokenValue = self->_auditTokenValue;
  if (auditTokenValue)
  {
    memset(v5, 0, sizeof(v5));
    id v4 = a3;
    [(NSValue *)auditTokenValue getValue:v5 size:32];
    INIssueSandboxExtensionsForFileURLEnumerableToProcess();
  }
}

void __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = [v3 isSuccess];
  v5 = [v3 updatedIntent];
  id v6 = [v3 parameterResolutionResults];

  id v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[INCExtensionProxy resolveIntentSlotKeyPaths:completionHandler:]_block_invoke";
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s Received slot resolution results from vendor remote: %@", buf, 0x16u);
  }
  v8 = [*(id *)(a1 + 32) responseHandler];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) responseHandler];
    v9[2]();
  }
  v10 = [*(id *)(a1 + 32) _connection];
  id v11 = [v10 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke_26;
  block[3] = &unk_1E62BB838;
  char v19 = v4;
  id v12 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v16 = v5;
  id v17 = v6;
  id v18 = v12;
  id v13 = v6;
  id v14 = v5;
  dispatch_async(v11, block);
}

- (id)responseHandler
{
  return self->_responseHandler;
}

void __65__INCExtensionProxy_resolveIntentSlotKeyPaths_completionHandler___block_invoke_26(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    v2 = [*(id *)(a1 + 32) _connection];
    [v2 setIntent:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) _connection];
  if ([v5 _cancelRequestTimer])
  {
    uint64_t v3 = *(void *)(a1 + 56);

    if (v3)
    {
      char v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
      v4();
    }
  }
  else
  {
  }
}

- (id)imageProcessingHandler
{
  return self->_imageProcessingHandler;
}

- (void)setImageCachingHandler:(id)a3
{
}

- (id)imageCachingHandler
{
  return self->_imageCachingHandler;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (NSValue)_auditTokenValue
{
  return self->_auditTokenValue;
}

- (_INExtensionContextVending)_vendorRemote
{
  return self->_vendorRemote;
}

- (BOOL)_isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(INCExtensionProxy *)self _connection];
  id v6 = [v5 _transaction];

  id v7 = [v6 currentIntent];
  v8 = [(INCExtensionProxy *)self _extension];
  v9 = objc_msgSend(v8, "_intents_intentsRestrictedWhileProtectedDataUnavailable");
  v10 = [v7 _className];
  if (![v9 containsObject:v10])
  {

    goto LABEL_5;
  }
  int v11 = INIsDeviceLocked();

  if (!v11)
  {
LABEL_5:
    BOOL v13 = 0;
    goto LABEL_6;
  }
  id v12 = [(INCExtensionConnection *)self->_connection _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__INCExtensionProxy__isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler___block_invoke;
  block[3] = &unk_1E62BBAB0;
  id v16 = v4;
  dispatch_async(v12, block);

  BOOL v13 = 1;
LABEL_6:

  return v13;
}

void __91__INCExtensionProxy__isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = (id)[objc_alloc(MEMORY[0x1E4F304F0]) _initWithCode:5 userActivity:0];
    [v2 _setRequiresProtectedData:1];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (id)_processIntent:(id)a3 intentResponse:(id)a4 withCacheItems:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (void *)*MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    int v11 = [v7 backingStore];
    *(_DWORD *)buf = 136315394;
    v39 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]";
    __int16 v40 = 2112;
    id v41 = v11;
    _os_log_impl(&dword_1BC57D000, v10, OS_LOG_TYPE_INFO, "%s intentResponse.backingStore = %@", buf, 0x16u);
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = dispatch_group_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v8;
  uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        dispatch_group_enter(v12);
        id v18 = (void *)MEMORY[0x1E4F306F8];
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke;
        v29[3] = &unk_1E62BBA88;
        id v30 = v27;
        v31 = self;
        v32 = v12;
        [v18 deserializeCacheItem:v17 completion:v29];
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);
  }

  dispatch_time_t v19 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v12, v19))
  {
    v20 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]";
      __int16 v40 = 2112;
      id v41 = v25;
      _os_log_error_impl(&dword_1BC57D000, v20, OS_LOG_TYPE_ERROR, "%s Image caching timed out for intent:%@", buf, 0x16u);
    }
  }
  if ([(INCExtensionProxy *)self shouldCache])
  {
    v21 = [MEMORY[0x1E4F30318] sharedCache];
    objc_msgSend(v24, "_intents_updateContainerWithCache:", v21);
  }
  __int16 v22 = (void *)[v27 copy];

  return v22;
}

void __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v3];
    int v4 = [*(id *)(a1 + 40) shouldCache];
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  int v4 = [*(id *)(a1 + 40) shouldCache];
  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    if (v4)
    {
      v9 = [MEMORY[0x1E4F30318] sharedCache];
      [v9 addCacheableObject:v3];
    }
    goto LABEL_9;
  }
  if (!v4)
  {
LABEL_9:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    goto LABEL_10;
  }
  id v6 = v3;
  id v7 = [*(id *)(a1 + 40) imageProcessingHandler];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) imageProcessingHandler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke_2;
    v12[3] = &unk_1E62BBA60;
    id v13 = *(id *)(a1 + 48);
    ((void (**)(void, id, void *))v8)[2](v8, v6, v12);
  }
  else
  {
    v10 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]_block_invoke";
      _os_log_error_impl(&dword_1BC57D000, v10, OS_LOG_TYPE_ERROR, "%s Image caching handler is not set", buf, 0xCu);
    }
    int v11 = [MEMORY[0x1E4F30318] sharedCache];
    [v11 addCacheableObject:v6];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

LABEL_10:
}

void __66__INCExtensionProxy__processIntent_intentResponse_withCacheItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[INCExtensionProxy _processIntent:intentResponse:withCacheItems:]_block_invoke_2";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_error_impl(&dword_1BC57D000, v4, OS_LOG_TYPE_ERROR, "%s Error processing image : %@", (uint8_t *)&v5, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_extensionProcessHasEntitlement:(id)a3
{
  memset(v6, 0, sizeof(v6));
  auditTokenValue = self->_auditTokenValue;
  id v4 = a3;
  [(NSValue *)auditTokenValue getValue:v6 size:32];
  LOBYTE(auditTokenValue) = INProcessHasEntitlement();

  return (char)auditTokenValue;
}

- (BOOL)_shouldForwardToAppWithIntent:(id)a3 intentResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 _shouldForwardIntentToApp]
    && ([v7 _type] == 1
     || [(INCExtensionProxy *)self _extensionProcessHasEntitlement:*MEMORY[0x1E4F300E0]]))
  {
    char v8 = 1;
  }
  else if ([v7 _intentResponseCode] == 4)
  {
    char v8 = [v6 _shouldForwardToAppOnSucccess];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)prewarmAppWithIntent:(id)a3 completionHandler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, id))a4;
  id v7 = objc_msgSend(a3, "_intents_launchIdForCurrentPlatform");
  v22[1] = 0;
  INExtractAppInfoFromSiriLaunchId();
  id v8 = 0;

  v22[0] = 0;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v8 allowPlaceholder:0 error:v22];
  id v10 = v22[0];
  if (v10)
  {
    int v11 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[INCExtensionProxy prewarmAppWithIntent:completionHandler:]";
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_error_impl(&dword_1BC57D000, v11, OS_LOG_TYPE_ERROR, "%s Unable to create application record: %@", buf, 0x16u);
    }
    v6[2](v6, 0, v10);
  }
  else
  {
    uint64_t v12 = *MEMORY[0x1E4FA7120];
    v23[0] = *MEMORY[0x1E4F625F8];
    v23[1] = v12;
    v24[0] = MEMORY[0x1E4F1CC38];
    id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v9, "supportsMultiwindow"));
    v24[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

    uint64_t v15 = [(INCExtensionProxy *)self _connection];
    uint64_t v16 = [v15 _queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke;
    block[3] = &unk_1E62BBC18;
    id v19 = v14;
    id v20 = v8;
    v21 = v6;
    id v17 = v14;
    dispatch_async(v16, block);
  }
}

void __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F629E0] serviceWithDefaultShellEndpoint];
  id v3 = [MEMORY[0x1E4F629C8] optionsWithDictionary:*(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _OWORD v5[2] = __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke_2;
  v5[3] = &unk_1E62BBA38;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v2 openApplication:v4 withOptions:v3 completion:v5];
}

uint64_t __60__INCExtensionProxy_prewarmAppWithIntent_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopSendingUpdates
{
  id v3 = [(INCExtensionProxy *)self _connection];
  id v7 = [v3 _transaction];

  uint64_t v4 = [v7 currentIntent];
  [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v4];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F30780]) initWithIntent:v4];
  id v6 = [(INCExtensionProxy *)self _connection];
  [v6 requestTimeoutInterval];
  objc_msgSend(v5, "setRequestTimeout:");

  [v5 executeRemotelyWithVendorRemote:self->_vendorRemote completionHandler:&__block_literal_global_59];
}

- (void)startSendingUpdatesToObserver:(id)a3
{
  id v4 = a3;
  int v5 = [(INCExtensionProxy *)self _connection];
  id v11 = [v5 _transaction];

  id v6 = [v11 currentIntent];
  [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v6];
  id v7 = objc_alloc(MEMORY[0x1E4F30768]);
  id v8 = [(INCExtensionProxy *)self _connection];
  uint64_t v9 = (void *)[v7 initWithIntent:v6 endpointProvider:v8 observer:v4];

  id v10 = [(INCExtensionProxy *)self _connection];
  [v10 requestTimeoutInterval];
  objc_msgSend(v9, "setRequestTimeout:");

  [v9 executeRemotelyWithVendorRemote:self->_vendorRemote completionHandler:&__block_literal_global_754];
}

- (void)handleIntentWithCompletionHandler:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(INCExtensionProxy *)self _connection];
  id v6 = [v5 _transaction];

  id v7 = [v6 currentIntent];
  if ([v7 _executionContext] != 9
    || ![(INCExtensionProxy *)self _isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:v4])
  {
    id v8 = (void *)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      id v10 = [v7 backingStore];
      *(_DWORD *)buf = 136315394;
      id v30 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]";
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_1BC57D000, v9, OS_LOG_TYPE_INFO, "%s intent.backingStore = %@", buf, 0x16u);
    }
    [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v7];
    id v11 = [[INCExtensionTransactionState alloc] initWithType:4 intent:v7 intentResponse:0 userActivities:0];
    [v6 setState:v11];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke;
    v25[3] = &unk_1E62BB978;
    v25[4] = self;
    id v12 = v7;
    id v26 = v12;
    id v27 = v6;
    id v13 = v4;
    id v28 = v13;
    uint64_t v14 = (void *)MEMORY[0x1C1872DC0](v25);
    [(INCExtensionConnection *)self->_connection _startRequestTimerWithExtensionProxy:self];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F30498]) initWithIntent:v12];
    uint64_t v16 = [(INCExtensionProxy *)self _connection];
    [v16 requestTimeoutInterval];
    objc_msgSend(v15, "setRequestTimeout:");

    vendorRemote = self->_vendorRemote;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E62BB9F0;
    v20[4] = self;
    id v21 = v12;
    id v22 = v15;
    id v23 = v13;
    id v24 = v14;
    id v18 = v14;
    id v19 = v15;
    [v19 executeRemotelyWithVendorRemote:vendorRemote completionHandler:v20];
  }
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  int v5 = [*(id *)(a1 + 32) _processIntent:*(void *)(a1 + 40) intentResponse:v10 withCacheItems:a3];
  id v6 = *(void **)(a1 + 48);
  id v7 = [[INCExtensionTransactionState alloc] initWithType:5 intent:*(void *)(a1 + 40) intentResponse:v10 userActivities:v5];
  [v6 setState:v7];

  id v8 = [*(id *)(a1 + 32) _connection];
  if ([v8 _cancelRequestTimer])
  {
    uint64_t v9 = *(void *)(a1 + 56);

    if (v9) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
  }
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_2(id *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 intentResponse];
  int v5 = [v3 error];
  id v6 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke_2";
    __int16 v25 = 2112;
    id v26 = v4;
    _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Received handle response from vendor remote: %@", buf, 0x16u);
  }
  id v7 = [a1[4] responseHandler];

  if (v7)
  {
    id v8 = [a1[4] responseHandler];
    v8[2]();
  }
  uint64_t v9 = [a1[4] _connection];
  id v10 = [v9 _queue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_51;
  v14[3] = &unk_1E62BB9C8;
  id v15 = v5;
  id v16 = a1[5];
  id v21 = a1[7];
  id v17 = a1[4];
  id v18 = v4;
  id v19 = a1[6];
  id v22 = a1[8];
  id v20 = v3;
  id v11 = v3;
  id v12 = v4;
  id v13 = v5;
  dispatch_async(v10, v14);
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_51(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      id v24 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      uint64_t v28 = v2;
      _os_log_error_impl(&dword_1BC57D000, v3, OS_LOG_TYPE_ERROR, "%s Got error when vendor remote is trying to handle intent %@: %{public}@", buf, 0x20u);
    }
    uint64_t v4 = *(void *)(a1 + 80);
    if (v4)
    {
      int v5 = [[INCExtensionError alloc] initWithErrorCode:1399 underlyingError:*(void *)(a1 + 32)];
      (*(void (**)(uint64_t, void, INCExtensionError *))(v4 + 16))(v4, 0, v5);
    }
    return;
  }
  if ([*(id *)(a1 + 48) _shouldForwardToAppWithIntent:*(void *)(a1 + 40) intentResponse:*(void *)(a1 + 56)])
  {
    [*(id *)(a1 + 64) setAllowsScenelessAppLaunch:0];
    id v6 = objc_msgSend(*(id *)(a1 + 40), "_intents_launchIdForCurrentPlatform");
    uint64_t v22 = 0;
    INExtractAppInfoFromSiriLaunchId();
    id v7 = 0;

    if (v7
      && ([*(id *)(a1 + 48) _vendorRemote],
          id v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v8))
    {
      uint64_t v9 = (INCExtensionError *)[objc_alloc(MEMORY[0x1E4F302C0]) initWithBundleIdentifier:v7 intentForwardingAction:*(void *)(a1 + 64)];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_53;
      v17[3] = &unk_1E62BB9A0;
      id v18 = *(id *)(a1 + 40);
      id v19 = *(id *)(a1 + 32);
      id v20 = *(id *)(a1 + 80);
      id v21 = *(id *)(a1 + 88);
      [(INCExtensionError *)v9 deliverIntentForwardingActionWithResponseHandler:v17];
    }
    else
    {
      id v12 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        id v24 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke";
        __int16 v25 = 2112;
        uint64_t v26 = v15;
        _os_log_error_impl(&dword_1BC57D000, v12, OS_LOG_TYPE_ERROR, "%s No application id was found to handle intent %@", buf, 0x16u);
      }
      uint64_t v13 = *(void *)(a1 + 80);
      if (!v13) {
        goto LABEL_18;
      }
      uint64_t v9 = [[INCExtensionError alloc] initWithErrorCode:1315 underlyingError:0];
      (*(void (**)(uint64_t, void, INCExtensionError *))(v13 + 16))(v13, 0, v9);
    }

LABEL_18:
    return;
  }
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = [*(id *)(a1 + 72) cacheItems];
  (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v11);
}

void __55__INCExtensionProxy_handleIntentWithCompletionHandler___block_invoke_53(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    int v5 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = a1[4];
      uint64_t v13 = a1[5];
      int v14 = 136315650;
      uint64_t v15 = "-[INCExtensionProxy handleIntentWithCompletionHandler:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_error_impl(&dword_1BC57D000, v5, OS_LOG_TYPE_ERROR, "%s Got error when application is trying to handle intent %@: %{public}@", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v6 = a1[6];
    if (v6)
    {
      id v7 = [INCExtensionError alloc];
      id v8 = [v3 error];
      uint64_t v9 = [(INCExtensionError *)v7 initWithErrorCode:1399 underlyingError:v8];
      (*(void (**)(uint64_t, void, INCExtensionError *))(v6 + 16))(v6, 0, v9);
    }
  }
  else
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = [v3 intentResponse];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
  }
}

- (void)confirmIntentWithCompletionHandler:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(INCExtensionProxy *)self _connection];
  uint64_t v6 = [v5 _transaction];

  id v7 = [v6 currentIntent];
  if ([v7 _executionContext] != 9
    || ![(INCExtensionProxy *)self _isIntentRestrictedWhileProtectedDataUnavailableWithCompletionHandler:v4])
  {
    [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v7];
    id v8 = [[INCExtensionTransactionState alloc] initWithType:2 intent:v7 intentResponse:0 userActivities:0];
    [v6 setState:v8];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke;
    v32[3] = &unk_1E62BB8D8;
    v32[4] = self;
    id v9 = v7;
    id v33 = v9;
    id v35 = v4;
    id v34 = v6;
    uint64_t v10 = (void (**)(void, void))MEMORY[0x1C1872DC0](v32);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [v9 privatePlayMediaIntentData];
      uint64_t v12 = [v11 shouldSuppressCommonWholeHouseAudioRoutes];
      int v13 = [v12 BOOLValue];

      if (!v13)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_34;
        v29[3] = &unk_1E62BB928;
        uint64_t v15 = v10;
        id v31 = v15;
        id v16 = v9;
        id v30 = v16;
        uint64_t v17 = (void (**)(void, void))MEMORY[0x1C1872DC0](v29);
        __int16 v18 = [v16 airPlayRouteIds];
        if ([v18 count])
        {
          ((void (**)(void, void *))v17)[2](v17, v18);
        }
        else
        {
          uint64_t v19 = [v16 hashedRouteUIDs];
          if ([v19 count])
          {
            uint64_t v20 = *MEMORY[0x1E4F30240];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v37 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]";
              __int16 v38 = 2112;
              v39 = v19;
              _os_log_impl(&dword_1BC57D000, v20, OS_LOG_TYPE_INFO, "%s Have encryptedAirPlayRouteIds: %@, will attempt decoding", buf, 0x16u);
            }
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_46;
            v26[3] = &unk_1E62BB950;
            id v21 = (id *)&v27;
            __int16 v27 = v17;
            uint64_t v22 = (id *)&v28;
            uint64_t v28 = v15;
            INCDecodeHashedRouteUIDs(v19, v26);
          }
          else
          {
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            void v23[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_48;
            v23[3] = &unk_1E62BB950;
            id v21 = (id *)&v24;
            id v24 = v17;
            uint64_t v22 = (id *)&v25;
            __int16 v25 = v15;
            __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_48((uint64_t)v23, 0, 0);
          }
        }
        goto LABEL_17;
      }
      int v14 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v37 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]";
        _os_log_debug_impl(&dword_1BC57D000, v14, OS_LOG_TYPE_DEBUG, "%s Suppressing route setting due to intent-based flag", buf, 0xCu);
      }
    }
    v10[2](v10, 0);
LABEL_17:
  }
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  [v2 _startRequestTimerWithExtensionProxy:*(void *)(a1 + 32)];

  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F30380]) initWithIntent:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) _connection];
  [v4 requestTimeoutInterval];
  objc_msgSend(v3, "setRequestTimeout:");

  int v5 = [*(id *)(a1 + 32) _vendorRemote];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E62BB8B0;
  uint64_t v6 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  id v10 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  [v3 executeRemotelyWithVendorRemote:v5 completionHandler:v7];
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_34(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if INIsHomepod() && (_os_feature_enabled_impl())
  {
    id v4 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      _os_log_debug_impl(&dword_1BC57D000, v4, OS_LOG_TYPE_DEBUG, "%s Suppressing route setting, leaving it to extension to handle", buf, 0xCu);
    }
    [*(id *)(a1 + 32) _setAirPlayRouteIds:v3];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    int v5 = (os_log_t *)MEMORY[0x1E4F30240];
    uint64_t v6 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      _os_log_debug_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_DEBUG, "%s Routing audio to airplay output devices", buf, 0xCu);
    }
    uint64_t v7 = [v3 count];
    os_signpost_id_t v8 = os_signpost_id_generate(*v5);
    id v9 = *v5;
    id v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 67240192;
      LODWORD(v16) = v7;
      _os_signpost_emit_with_name_impl(&dword_1BC57D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "INSignpostSiriAirPlayRouteSetup", " routeIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", buf, 8u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_37;
    v11[3] = &unk_1E62BB900;
    os_signpost_id_t v13 = v8;
    uint64_t v14 = v7;
    id v12 = *(id *)(a1 + 40);
    INCRouteAudioToAirplayOutputDevices(v3, v11);
  }
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      id v10 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s Have decryptedRouteUIDs: %@, will attempt to set route", (uint8_t *)&v9, 0x16u);
    }
    os_signpost_id_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    os_signpost_id_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_48(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    uint64_t v7 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      id v10 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_1BC57D000, v7, OS_LOG_TYPE_INFO, "%s Have group deviceUIDs: %@, will attempt to set route", (uint8_t *)&v9, 0x16u);
    }
    os_signpost_id_t v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    os_signpost_id_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_37(void *a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x1E4F30240];
  uint64_t v7 = (id)*MEMORY[0x1E4F30240];
  os_signpost_id_t v8 = v7;
  os_signpost_id_t v9 = a1[5];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uint64_t v10 = a1[6];
    int v14 = 67240192;
    LODWORD(v15) = v10;
    _os_signpost_emit_with_name_impl(&dword_1BC57D000, v8, OS_SIGNPOST_INTERVAL_END, v9, "INSignpostSiriAirPlayRouteSetup", " routeIdCount=%{public,signpost.telemetry:number1}d  enableTelemetry=YES ", (uint8_t *)&v14, 8u);
  }

  __int16 v11 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = @"Unsuccessfully";
    if (a2) {
      uint64_t v13 = @"Successfully";
    }
    int v14 = 136315394;
    uint64_t v15 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_debug_impl(&dword_1BC57D000, v11, OS_LOG_TYPE_DEBUG, "%s %{public}@ routed output to airplay devices, continuing to confirm intent", (uint8_t *)&v14, 0x16u);
  }
  if (a2) {
    id v12 = 0;
  }
  else {
    id v12 = v5;
  }
  (*(void (**)(void, id))(a1[4] + 16))(a1[4], v12);
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_2(id *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 intentResponse];
  id v5 = [v3 error];
  id v6 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke_2";
    __int16 v25 = 2112;
    uint64_t v26 = v4;
    _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Received confirm response from vendor remote: %@", buf, 0x16u);
  }
  uint64_t v7 = [a1[4] responseHandler];

  if (v7)
  {
    os_signpost_id_t v8 = [a1[4] responseHandler];
    v8[2]();
  }
  if ([v4 _type] == 1 && objc_msgSend(v4, "_intentResponseCode") == 4) {
    objc_msgSend(v4, "_setCode:", objc_msgSend((id)objc_opt_class(), "_codeFromIntentResponseCode:", 1));
  }
  if ([a1[5] _executionContext] == 8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setNowPlayingInfo:0];
    }
  }
  os_signpost_id_t v9 = [a1[4] _connection];
  uint64_t v10 = [v9 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_29;
  block[3] = &unk_1E62BB888;
  id v16 = v5;
  id v17 = a1[5];
  id v11 = a1[7];
  id v18 = a1[4];
  id v19 = v4;
  id v22 = v11;
  id v20 = v3;
  id v21 = a1[6];
  id v12 = v3;
  id v13 = v4;
  id v14 = v5;
  dispatch_async(v10, block);
}

void __56__INCExtensionProxy_confirmIntentWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315650;
      id v17 = "-[INCExtensionProxy confirmIntentWithCompletionHandler:]_block_invoke";
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      uint64_t v21 = v2;
      _os_log_error_impl(&dword_1BC57D000, v3, OS_LOG_TYPE_ERROR, "%s Got error when vendor remote is trying to confirm intent %@: %{public}@", buf, 0x20u);
    }
    uint64_t v4 = *(void *)(a1 + 80);
    if (v4)
    {
      id v5 = [[INCExtensionError alloc] initWithErrorCode:1399 underlyingError:*(void *)(a1 + 32)];
      (*(void (**)(uint64_t, void, INCExtensionError *))(v4 + 16))(v4, 0, v5);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 56);
    os_signpost_id_t v9 = [*(id *)(a1 + 64) cacheItems];
    id v15 = [v6 _processIntent:v7 intentResponse:v8 withCacheItems:v9];

    uint64_t v10 = *(void **)(a1 + 72);
    id v11 = [[INCExtensionTransactionState alloc] initWithType:3 intent:*(void *)(a1 + 40) intentResponse:*(void *)(a1 + 56) userActivities:v15];
    [v10 setState:v11];

    id v12 = [*(id *)(a1 + 48) _connection];
    if ([v12 _cancelRequestTimer])
    {
      uint64_t v13 = *(void *)(a1 + 80);

      if (v13) {
        (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      }
    }
    else
    {
    }
  }
}

- (void)resolveIntentSlotKeyPath:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(INCExtensionProxy *)self _connection];
  os_signpost_id_t v9 = [v8 _transaction];

  uint64_t v10 = [v9 currentIntent];
  [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v10];
  id v11 = [[INCExtensionTransactionState alloc] initWithType:1 intent:v10 intentResponse:0 userActivities:0];
  [v9 setState:v11];

  [(INCExtensionConnection *)self->_connection _startRequestTimerWithExtensionProxy:self];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F30648]) initWithIntent:v10 parameterName:v6];
  uint64_t v13 = [(INCExtensionProxy *)self _connection];
  [v13 requestTimeoutInterval];
  objc_msgSend(v12, "setRequestTimeout:");

  vendorRemote = self->_vendorRemote;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke;
  v17[3] = &unk_1E62BB810;
  id v18 = v6;
  uint64_t v19 = self;
  id v20 = v7;
  id v15 = v7;
  id v16 = v6;
  [v12 executeRemotelyWithVendorRemote:vendorRemote completionHandler:v17];
}

void __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 parameterResolutionResults];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = [v4 data];

  id v6 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[INCExtensionProxy resolveIntentSlotKeyPath:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1BC57D000, v6, OS_LOG_TYPE_INFO, "%s Received slot resolution result from vendor remote", buf, 0xCu);
  }
  id v7 = [*(id *)(a1 + 40) responseHandler];

  if (v7)
  {
    uint64_t v8 = [*(id *)(a1 + 40) responseHandler];
    v8[2]();
  }
  os_signpost_id_t v9 = [*(id *)(a1 + 40) _connection];
  uint64_t v10 = [v9 _queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke_22;
  block[3] = &unk_1E62BBC18;
  id v11 = *(void **)(a1 + 48);
  void block[4] = *(void *)(a1 + 40);
  id v14 = v5;
  id v15 = v11;
  id v12 = v5;
  dispatch_async(v10, block);
}

void __64__INCExtensionProxy_resolveIntentSlotKeyPath_completionHandler___block_invoke_22(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = [*(id *)(a1 + 32) _connection];
  if ([v6 _cancelRequestTimer])
  {
    uint64_t v2 = *(void *)(a1 + 48);

    if (v2)
    {
      id v3 = (id)*MEMORY[0x1E4F30240];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(a1 + 40);
        if (v4) {
          id v5 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30860]) initWithData:*(void *)(a1 + 40)];
        }
        else {
          id v5 = @"no data";
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v8 = "-[INCExtensionProxy resolveIntentSlotKeyPath:completionHandler:]_block_invoke";
        __int16 v9 = 2112;
        uint64_t v10 = v5;
        _os_log_impl(&dword_1BC57D000, v3, OS_LOG_TYPE_INFO, "%s resolutionResultData = %@", buf, 0x16u);
        if (v4) {
      }
        }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
  }
}

- (void)getDefaultValueForParameterNamed:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [(INCExtensionProxy *)self _connection];
    __int16 v9 = [v8 _transaction];

    uint64_t v10 = [v9 currentIntent];
    uint64_t v11 = [v10 _codableDescription];
    id v12 = [v11 attributeByName:v6];

    if ([v12 objectClass])
    {
      [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v10];
      uint64_t v13 = [[INCExtensionTransactionState alloc] initWithType:1 intent:v10 intentResponse:0 userActivities:0];
      [v9 setState:v13];

      [(INCExtensionConnection *)self->_connection _startRequestTimerWithExtensionProxy:self];
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F30450]) initWithIntent:v10 parameterName:v6];
      id v15 = [(INCExtensionProxy *)self _connection];
      [v15 requestTimeoutInterval];
      objc_msgSend(v14, "setRequestTimeout:");

      vendorRemote = self->_vendorRemote;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke;
      v18[3] = &unk_1E62BB7E8;
      v18[4] = self;
      id v19 = v6;
      id v20 = v12;
      id v21 = v7;
      [v14 executeRemotelyWithVendorRemote:vendorRemote completionHandler:v18];
    }
    else
    {
      id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1400 userInfo:0];
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v17);
    }
  }
}

void __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 archivedDefaultValue];
  id v5 = [v3 error];

  id v6 = [*(id *)(a1 + 32) _connection];
  id v7 = [v6 _queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke_2;
  v11[3] = &unk_1E62BB7C0;
  uint64_t v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v8;
  id v14 = v4;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v9 = v4;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __72__INCExtensionProxy_getDefaultValueForParameterNamed_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  int v3 = [v2 _cancelRequestTimer];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        long long v36 = "-[INCExtensionProxy getDefaultValueForParameterNamed:completionHandler:]_block_invoke_2";
        __int16 v37 = 2112;
        id v38 = v27;
        __int16 v39 = 2112;
        uint64_t v40 = v4;
        _os_log_error_impl(&dword_1BC57D000, v5, OS_LOG_TYPE_ERROR, "%s Error getting default value for parameter name: %@ - %@", buf, 0x20u);
      }
    }
    if (!*(void *)(a1 + 56))
    {
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      return;
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F30518]);
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = *(void *)(a1 + 56);
    id v33 = 0;
    id v16 = [v7 unarchivedObjectOfClasses:v14 fromData:v15 error:&v33];
    id v17 = v33;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v16, "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = v16;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v30;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(v19);
            }
            id v24 = [v6 decodeWithCodableAttribute:*(void *)(a1 + 64) from:*(void *)(*((void *)&v29 + 1) + 8 * v23)];
            objc_msgSend(v18, "if_addObjectIfNonNil:", v24);

            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v21);
      }

      __int16 v25 = (void *)[v18 copy];
      if (!v17) {
        goto LABEL_20;
      }
    }
    else
    {
      __int16 v25 = [v6 decodeWithCodableAttribute:*(void *)(a1 + 64) from:v16];
      if (!v17)
      {
LABEL_20:
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

        return;
      }
    }
    uint64_t v26 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 136315650;
      long long v36 = "-[INCExtensionProxy getDefaultValueForParameterNamed:completionHandler:]_block_invoke";
      __int16 v37 = 2112;
      id v38 = v17;
      __int16 v39 = 2112;
      uint64_t v40 = v28;
      _os_log_error_impl(&dword_1BC57D000, v26, OS_LOG_TYPE_ERROR, "%s Error unarchiving default value: %@. Parameter name: %@", buf, 0x20u);
    }
    goto LABEL_20;
  }
}

- (void)getOptionsForParameterNamed:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = [(INCExtensionProxy *)self _connection];
    uint64_t v12 = [v11 _transaction];

    uint64_t v13 = [v12 currentIntent];
    id v14 = [v13 _codableDescription];
    uint64_t v15 = [v14 attributeByName:v8];

    if ([v15 objectClass])
    {
      [(INCExtensionProxy *)self _issueSandboxExtensionsForFileURLsIfNeededToIntent:v13];
      id v16 = [[INCExtensionTransactionState alloc] initWithType:1 intent:v13 intentResponse:0 userActivities:0];
      [v12 setState:v16];

      [(INCExtensionConnection *)self->_connection _startRequestTimerWithExtensionProxy:self];
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F30458]) initWithIntent:v13 parameterName:v8 searchTerm:v9];
      uint64_t v18 = [(INCExtensionProxy *)self _connection];
      [v18 requestTimeoutInterval];
      objc_msgSend(v17, "setRequestTimeout:");

      vendorRemote = self->_vendorRemote;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke;
      v21[3] = &unk_1E62BB798;
      v21[4] = self;
      id v22 = v8;
      id v24 = v10;
      id v23 = v15;
      [v17 executeRemotelyWithVendorRemote:vendorRemote completionHandler:v21];
    }
    else
    {
      uint64_t v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INCExtensionErrorDomain" code:1400 userInfo:0];
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v20);
    }
  }
}

void __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 archivedObjectCollection];
  id v5 = [v3 error];

  id v6 = [*(id *)(a1 + 32) _connection];
  id v7 = [v6 _queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke_2;
  v11[3] = &unk_1E62BB7C0;
  id v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v5;
  id v13 = v8;
  id v16 = *(id *)(a1 + 56);
  id v14 = v4;
  id v15 = *(id *)(a1 + 48);
  id v9 = v4;
  id v10 = v5;
  dispatch_async(v7, v11);
}

void __78__INCExtensionProxy_getOptionsForParameterNamed_searchTerm_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  int v3 = [v2 _cancelRequestTimer];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      id v5 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
      {
        id v15 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 136315650;
        uint64_t v20 = "-[INCExtensionProxy getOptionsForParameterNamed:searchTerm:completionHandler:]_block_invoke_2";
        __int16 v21 = 2112;
        id v22 = v15;
        __int16 v23 = 2112;
        uint64_t v24 = v4;
        _os_log_error_impl(&dword_1BC57D000, v5, OS_LOG_TYPE_ERROR, "%s Error getting options for parameter: %@ - %@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    }
    else if (*(void *)(a1 + 56))
    {
      id v6 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void *)(a1 + 56);
      id v18 = 0;
      id v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:&v18];
      id v10 = v18;
      if (v10)
      {
        uint64_t v11 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
        {
          uint64_t v16 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 136315650;
          uint64_t v20 = "-[INCExtensionProxy getOptionsForParameterNamed:searchTerm:completionHandler:]_block_invoke";
          __int16 v21 = 2112;
          id v22 = v10;
          __int16 v23 = 2112;
          uint64_t v24 = v16;
          _os_log_error_impl(&dword_1BC57D000, v11, OS_LOG_TYPE_ERROR, "%s Error unarchiving options: %@. Parameter name: %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
      else
      {
        id v14 = [v9 _typedObjectCollectionWithCodableAttribute:*(void *)(a1 + 64)];
        (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      }
    }
    else
    {
      uint64_t v12 = *(void *)(a1 + 72);
      id v13 = objc_alloc(MEMORY[0x1E4F30570]);
      id v17 = (id)[v13 initWithItems:MEMORY[0x1E4F1CBF0]];
      (*(void (**)(uint64_t))(v12 + 16))(v12);
    }
  }
}

- (void)getOptionsForParameterNamed:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__INCExtensionProxy_getOptionsForParameterNamed_completionHandler___block_invoke;
    v8[3] = &unk_1E62BB768;
    id v9 = v6;
    [(INCExtensionProxy *)self getOptionsForParameterNamed:a3 searchTerm:0 completionHandler:v8];
  }
}

void __67__INCExtensionProxy_getOptionsForParameterNamed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 allItems];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)setShouldResetRequestAfterHandle:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(INCExtensionProxy *)self _connection];
  uint64_t v4 = [v5 _transaction];
  [v4 setShouldResetRequestAfterHandle:v3];
}

- (BOOL)shouldResetRequestAfterHandle
{
  uint64_t v2 = [(INCExtensionProxy *)self _connection];
  BOOL v3 = [v2 _transaction];
  char v4 = [v3 shouldResetRequestAfterHandle];

  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    INLogInitIfNeeded();
  }
}

@end