@interface LNClientConnection
+ ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken;
+ (void)performWithoutTimeout:(id)a3;
- (LNAppContext)appContext;
- (LNClientConnection)initWithConnection:(id)a3 connectionListener:(id)a4 queue:(id)a5 appContext:(id)a6;
- (LNConnectionListener)connectionListener;
- (NSMapTable)performActionOperations;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (void)createAsyncIteratorForSequence:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)enqueuePerformActionOperation:(id)a3;
- (void)exportTransientEntities:(id)a3 withConfiguration:(id)a4 completionHandler:(id)a5;
- (void)fetchActionAppContextFromAction:(id)a3 completionHandler:(id)a4;
- (void)fetchActionForAppShortcutIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchActionForAutoShortcutPhrase:(id)a3 completionHandler:(id)a4;
- (void)fetchActionOutputValueWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3;
- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchDisplayRepresentationForActions:(id)a3 completionHandler:(id)a4;
- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4;
- (void)fetchOptionsDefaultValuesForAction:(id)a3 completionHandler:(id)a4;
- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 completionHandler:(id)a9;
- (void)fetchParameterOptionDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(id)a5 completionHandler:(id)a6;
- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5;
- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4;
- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3;
- (void)fetchSuggestedActionsWithSiriLanguageCode:(id)a3 completionHandler:(id)a4;
- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5;
- (void)fetchURLForEnumWithIdentifier:(id)a3 caseIdentifier:(id)a4 completionHandler:(id)a5;
- (void)fetchURLsForEnumWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchValueForPropertyWithIdentifier:(id)a3 entity:(id)a4 completionHandler:(id)a5;
- (void)fetchViewActionsWithCompletionHandler:(id)a3;
- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4;
- (void)getListenerEndpointForBundleIdentifier:(id)a3 action:(id)a4 completionHandler:(id)a5;
- (void)getListenerEndpointWithCompletionHandler:(id)a3;
- (void)nextAsyncIteratorResults:(id)a3 completionHandler:(id)a4;
- (void)performAction:(id)a3 options:(id)a4 executor:(id)a5 completionHandler:(id)a6;
- (void)performAllEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4;
- (void)performConfigurableQuery:(id)a3 completionHandler:(id)a4;
- (void)performPropertyQuery:(id)a3 completionHandler:(id)a4;
- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4;
- (void)performSuggestedResultsQueryWithEntityType:(id)a3 completionHandler:(id)a4;
- (void)releaseAsyncSequence:(id)a3 completionHandler:(id)a4;
- (void)removePerformActionOperation:(id)a3;
- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3;
- (void)updateConnectionContext:(id)a3 completionHandler:(id)a4;
- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5;
@end

@implementation LNClientConnection

uint64_t __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appContext];
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 80);
  v7 = NSNumber;
  uint64_t v8 = *(void *)(a1 + 40);
  v9 = [*(id *)(a1 + 32) xpcConnection];
  v10 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_264CA9078;
  v12[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 88);
  [v2 fetchOptionsForAction:v8 actionMetadata:v11 parameterMetadata:v3 optionsProviderReference:v4 searchTerm:v5 localeIdentifier:v6 connectionIdentifier:v10 completionHandler:v12];
}

- (void)updateConnectionContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(LNClientConnection *)self appContext];
  v9 = [(LNClientConnection *)self xpcConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke;
  v11[3] = &unk_264CA91E0;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 updateContextForConnection:v9 context:v7 completionHandler:v11];
}

void __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) appContext];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = NSNumber;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) xpcConnection];
  uint64_t v8 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_264CA90F0;
  v9[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 64);
  [v2 fetchParameterOptionDefaultValueForAction:v6 actionMetadata:v3 parameterIdentifier:v4 connectionIdentifier:v8 completionHandler:v9];
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (LNAppContext)appContext
{
  return self->_appContext;
}

- (void)dealloc
{
  uint64_t v3 = getLNLogCategoryExecution();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23624D000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating client connection", buf, 2u);
  }

  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v4.receiver = self;
  v4.super_class = (Class)LNClientConnection;
  [(LNClientConnection *)&v4 dealloc];
}

- (LNClientConnection)initWithConnection:(id)a3 connectionListener:(id)a4 queue:(id)a5 appContext:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)LNClientConnection;
  v15 = [(LNClientConnection *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a5);
    objc_storeStrong((id *)&v16->_appContext, a6);
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    v17 = LNConnectionClientXPCInterface();
    [(NSXPCConnection *)v16->_xpcConnection setRemoteObjectInterface:v17];

    v18 = LNConnectionHostXPCInterface();
    [(NSXPCConnection *)v16->_xpcConnection setExportedInterface:v18];

    v19 = (void *)[objc_alloc(MEMORY[0x263F521E0]) initWithValue:v16];
    [(NSXPCConnection *)v16->_xpcConnection setExportedObject:v19];

    [(NSXPCConnection *)v16->_xpcConnection resume];
    uint64_t v20 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    performActionOperations = v16->_performActionOperations;
    v16->_performActionOperations = (NSMapTable *)v20;

    objc_storeWeak((id *)&v16->_connectionListener, v12);
    v22 = v16;
  }

  return v16;
}

uint64_t __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchParameterOptionDefaultValueForAction:(id)a3 actionMetadata:(id)a4 parameterIdentifier:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke;
  block[3] = &unk_264CA9118;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__LNClientConnection_updateConnectionContext_completionHandler___block_invoke_2;
  v7[3] = &unk_264CA91B8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __117__LNClientConnection_fetchParameterOptionDefaultValueForAction_actionMetadata_parameterIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)getListenerEndpointWithCompletionHandler:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  objc_super v4 = (void (**)(id, void *, void *, void))a3;
  id v5 = [(LNClientConnection *)self connectionListener];

  if (v5)
  {
    id v6 = [(LNClientConnection *)self connectionListener];
    id v7 = [v6 xpcListener];
    id v8 = [v7 endpoint];
    id v9 = (void *)MEMORY[0x263EFF8F8];
    id v10 = [MEMORY[0x263F08AB0] processInfo];
    id v11 = v10;
    if (v10) {
      objc_msgSend(v10, "if_auditToken");
    }
    else {
      memset(v15, 0, sizeof(v15));
    }
    id v14 = objc_msgSend(v9, "if_dataWithAuditToken:", v15);
    v4[2](v4, v8, v14, 0);
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F51D80];
    uint64_t v16 = *MEMORY[0x263F08320];
    id v6 = [NSString stringWithFormat:@"Unable to request listener endpoint because the connection listener is unset."];
    v17[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v8 = [v12 errorWithDomain:v13 code:2301 userInfo:v7];
    ((void (**)(id, void *, void *, void *))v4)[2](v4, 0, 0, v8);
    id v11 = v4;
  }
}

- (LNConnectionListener)connectionListener
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connectionListener);

  return (LNConnectionListener *)WeakRetained;
}

- (void)fetchOptionsForAction:(id)a3 actionMetadata:(id)a4 parameterMetadata:(id)a5 optionsProviderReference:(id)a6 searchTerm:(id)a7 localeIdentifier:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __148__LNClientConnection_fetchOptionsForAction_actionMetadata_parameterMetadata_optionsProviderReference_searchTerm_localeIdentifier_completionHandler___block_invoke;
  v29[3] = &unk_264CA90A0;
  v29[4] = self;
  id v30 = v15;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v34 = v19;
  id v35 = v20;
  id v36 = v21;
  id v22 = v21;
  id v23 = v20;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v15;
  dispatch_async(MEMORY[0x263EF83A0], v29);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionListener);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performActionOperations, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_appContext, 0);
}

- (NSMapTable)performActionOperations
{
  return self->_performActionOperations;
}

- (void)releaseAsyncSequence:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = NSNumber;
  id v10 = [(LNClientConnection *)self xpcConnection];
  id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__LNClientConnection_releaseAsyncSequence_completionHandler___block_invoke;
  v13[3] = &unk_264CA91E0;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v8 releaseAsyncSequence:v7 connectionIdentifier:v11 completionHandler:v13];
}

void __61__LNClientConnection_releaseAsyncSequence_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__LNClientConnection_releaseAsyncSequence_completionHandler___block_invoke_2;
  v7[3] = &unk_264CA91B8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61__LNClientConnection_releaseAsyncSequence_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)nextAsyncIteratorResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = NSNumber;
  id v10 = [(LNClientConnection *)self xpcConnection];
  id v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__LNClientConnection_nextAsyncIteratorResults_completionHandler___block_invoke;
  v13[3] = &unk_264CA8FD8;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [v8 nextAsyncIteratorResults:v7 connectionIdentifier:v11 completionHandler:v13];
}

void __65__LNClientConnection_nextAsyncIteratorResults_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__LNClientConnection_nextAsyncIteratorResults_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __65__LNClientConnection_nextAsyncIteratorResults_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)createAsyncIteratorForSequence:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LNClientConnection *)self appContext];
  id v12 = NSNumber;
  id v13 = [(LNClientConnection *)self xpcConnection];
  id v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__LNClientConnection_createAsyncIteratorForSequence_options_completionHandler___block_invoke;
  v16[3] = &unk_264CA92A8;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [v11 createAsyncIteratorForSequence:v10 options:v9 connectionIdentifier:v14 completionHandler:v16];
}

void __79__LNClientConnection_createAsyncIteratorForSequence_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__LNClientConnection_createAsyncIteratorForSequence_options_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __79__LNClientConnection_createAsyncIteratorForSequence_options_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)updateProperties:(id)a3 withQuery:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LNClientConnection *)self appContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke;
  v13[3] = &unk_264CA91E0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateProperties:v10 withQuery:v9 completionHandler:v13];
}

void __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke_2;
  v7[3] = &unk_264CA91B8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __67__LNClientConnection_updateProperties_withQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getListenerEndpointForBundleIdentifier:(id)a3 action:(id)a4 completionHandler:(id)a5
{
  v29[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [(LNClientConnection *)self appContext];
    id v12 = [(LNClientConnection *)self xpcConnection];
    id v13 = v12;
    if (v12) {
      [v12 auditToken];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    id v17 = [(LNClientConnection *)self xpcConnection];
    uint64_t v18 = [v17 hash];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke;
    v25[3] = &unk_264CA9258;
    v25[4] = self;
    id v26 = v10;
    [v11 fetchActionListenerEndpoint:v9 auditToken:v27 connectionIdentifier:v18 completionHandler:v25];
  }
  else
  {
    id v14 = [MEMORY[0x263F52090] sharedProvider];
    id v15 = [v14 delegate];

    if (v15)
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_3;
      v23[3] = &unk_264CA9280;
      id v24 = v10;
      [v15 provideListenerEndpointForBundleIdentifier:v8 completionHandler:v23];
      id v16 = v24;
    }
    else
    {
      id v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F51D80];
      uint64_t v28 = *MEMORY[0x263F08320];
      id v16 = [NSString stringWithFormat:@"The requested process is unable to mediate connection to %@", v8];
      v29[0] = v16;
      id v21 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v22 = [v19 errorWithDomain:v20 code:2300 userInfo:v21];
      (*((void (**)(id, void, void, void, void *))v10 + 2))(v10, 0, 0, 0, v22);
    }
  }
}

void __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_3(uint64_t a1, void *a2, _OWORD *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (a3)
  {
    long long v9 = a3[1];
    v10[0] = *a3;
    v10[1] = v9;
    objc_msgSend(MEMORY[0x263EFF8F8], "if_dataWithAuditToken:", v10);
    a3 = (_OWORD *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__LNClientConnection_getListenerEndpointForBundleIdentifier_action_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) listenerEndpoint];
  id v3 = [*(id *)(a1 + 32) auditTokenData];
  objc_super v4 = [*(id *)(a1 + 32) resolvedAction];
  (*(void (**)(uint64_t, id, void *, void *, void))(v2 + 16))(v2, v5, v3, v4, *(void *)(a1 + 40));
}

- (void)exportTransientEntities:(id)a3 withConfiguration:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LNClientConnection *)self appContext];
  id v12 = NSNumber;
  id v13 = [(LNClientConnection *)self xpcConnection];
  id v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "hash"));
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke;
  v16[3] = &unk_264CA9140;
  v16[4] = self;
  id v17 = v8;
  id v15 = v8;
  [v11 exportTransientEntities:v10 withConfiguration:v9 connectionIdentifier:v14 completionHandler:v16];
}

void __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __82__LNClientConnection_exportTransientEntities_withConfiguration_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchURLsForEnumWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __71__LNClientConnection_fetchURLsForEnumWithIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_264CA90C8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchURLsForEnumWithIdentifier:v7 completionHandler:v10];
}

void __71__LNClientConnection_fetchURLsForEnumWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__LNClientConnection_fetchURLsForEnumWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__LNClientConnection_fetchURLsForEnumWithIdentifier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchURLForEnumWithIdentifier:(id)a3 caseIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LNClientConnection *)self appContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_264CA9230;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 fetchURLForEnumWithIdentifier:v10 caseIdentifier:v9 completionHandler:v13];
}

void __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__LNClientConnection_fetchURLForEnumWithIdentifier_caseIdentifier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchEntityURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke;
  v10[3] = &unk_264CA9230;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchEntityURL:v7 completionHandler:v10];
}

void __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __55__LNClientConnection_fetchEntityURL_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchValueForPropertyWithIdentifier:(id)a3 entity:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LNClientConnection *)self appContext];
  id v12 = [(LNClientConnection *)self xpcConnection];
  id v13 = v12;
  if (v12) {
    [v12 auditToken];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  id v14 = [(LNClientConnection *)self xpcConnection];
  uint64_t v15 = [v14 hash];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke;
  v17[3] = &unk_264CA9140;
  v17[4] = self;
  id v18 = v8;
  id v16 = v8;
  [v11 fetchValueForPropertyWithIdentifier:v10 entity:v9 auditToken:v19 connectionIdentifier:v15 completionHandler:v17];
}

void __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__LNClientConnection_fetchValueForPropertyWithIdentifier_entity_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LNClientConnection *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke;
  v7[3] = &unk_264CA8FD8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAppShortcutParametersWithCompletionHandler:v7];
}

void __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v12 = v5;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

void __70__LNClientConnection_fetchAppShortcutParametersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    id v9 = [v2 objectAtIndexedSubscript:0];
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:1];
    id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:2];
    (*(void (**)(uint64_t, id, void *, void *, void))(v3 + 16))(v3, v9, v4, v5, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void (**)(uint64_t, void, void, void, uint64_t))(v3 + 16);
    uint64_t v8 = *(void *)(a1 + 48);
    v7(v8, 0, 0, 0, v6);
  }
}

- (void)updateAppShortcutParametersWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LNClientConnection *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke;
  v7[3] = &unk_264CA91E0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 updateAppShortcutParametersWithCompletionHandler:v7];
}

void __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_264CA91B8;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __71__LNClientConnection_updateAppShortcutParametersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)fetchStateForAppIntentIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_264CA90C8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchStateForAppIntentIdentifiers:v7 completionHandler:v10];
}

void __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__LNClientConnection_fetchStateForAppIntentIdentifiers_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchActionForAppShortcutIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_264CA9190;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchActionForAppShortcutIdentifier:v7 completionHandler:v10];
}

void __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __76__LNClientConnection_fetchActionForAppShortcutIdentifier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchActionForAutoShortcutPhrase:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke;
  v10[3] = &unk_264CA9168;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchActionForAutoShortcutPhrase:v7 completionHandler:v10];
}

void __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__LNClientConnection_fetchActionForAutoShortcutPhrase_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchActionAppContextFromAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke;
  v10[3] = &unk_264CA90F0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchActionAppContextForAction:v7 completionHandler:v10];
}

void __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __72__LNClientConnection_fetchActionAppContextFromAction_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSuggestedFocusActionsForActionMetadata:(id)a3 suggestionContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(LNClientConnection *)self appContext];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke;
  v13[3] = &unk_264CA8FD8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 fetchSuggestedFocusActionsForActionMetadata:v10 suggestionContext:v9 completionHandler:v13];
}

void __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __102__LNClientConnection_fetchSuggestedFocusActionsForActionMetadata_suggestionContext_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSuggestedActionsForStartWorkoutAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke;
  v10[3] = &unk_264CA8FD8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchSuggestedActionsForStartWorkoutAction:v7 completionHandler:v10];
}

void __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__LNClientConnection_fetchSuggestedActionsForStartWorkoutAction_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSuggestedActionsWithSiriLanguageCode:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke;
  v10[3] = &unk_264CA8FD8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchSuggestedActionsWithSiriLanguageCode:v7 completionHandler:v10];
}

void __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __82__LNClientConnection_fetchSuggestedActionsWithSiriLanguageCode_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchSuggestedActionsFromViewWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LNClientConnection *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke;
  v7[3] = &unk_264CA8FD8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchSuggestedActionsFromViewWithCompletionHandler:v7];
}

void __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__LNClientConnection_fetchSuggestedActionsFromViewWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchActionOutputValueWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = [(LNClientConnection *)self xpcConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_264CA9140;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v8 fetchActionOutputValueForConnection:v9 withIdentifier:v7 completionHandler:v11];
}

void __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__LNClientConnection_fetchActionOutputValueWithIdentifier_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchOptionsDefaultValuesForAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke;
  block[3] = &unk_264CA9208;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appContext];
  id v3 = NSNumber;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) xpcConnection];
  id v6 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_2;
  v7[3] = &unk_264CA90F0;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 48);
  [v2 fetchOptionsDefaultValuesForAction:v4 connectionIdentifier:v6 completionHandler:v7];
}

void __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_3;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __75__LNClientConnection_fetchOptionsDefaultValuesForAction_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchStructuredDataWithTypeIdentifier:(int64_t)a3 forEntityIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(LNClientConnection *)self appContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_264CA90C8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 fetchStructuredDataWithTypeIdentifier:a3 forEntityIdentifiers:v9 completionHandler:v12];
}

void __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __99__LNClientConnection_fetchStructuredDataWithTypeIdentifier_forEntityIdentifiers_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performAction:(id)a3 options:(id)a4 executor:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [LNPerformActionExecutorDelegateProxy alloc];
  uint64_t v15 = [(LNClientConnection *)self xpcConnection];
  id v16 = [(LNPerformActionExecutorDelegateProxy *)v14 initWithConnection:v15 interface:v11];

  id v17 = [LNPerformActionOperation alloc];
  uint64_t v20 = MEMORY[0x263EF8330];
  uint64_t v21 = 3221225472;
  id v22 = __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke;
  id v23 = &unk_264CA9050;
  id v24 = self;
  id v25 = v10;
  id v18 = v10;
  id v19 = [(LNPerformActionOperation *)v17 initWithAction:v13 options:v12 client:v16 completionHandler:&v20];

  -[LNClientConnection enqueuePerformActionOperation:](self, "enqueuePerformActionOperation:", v19, v20, v21, v22, v23, v24);
}

void __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__LNClientConnection_performAction_options_executor_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchDestinationMDMAccountIdentifierForAction:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke;
  v10[3] = &unk_264CA9028;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchDestinationMDMAccountIdentifierForAction:v7 completionHandler:v10];
}

void __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __86__LNClientConnection_fetchDestinationMDMAccountIdentifierForAction_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performAllEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = [(LNClientConnection *)self xpcConnection];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  id v11 = NSNumber;
  id v12 = [(LNClientConnection *)self xpcConnection];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _OWORD v15[2] = __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v15[3] = &unk_264CA9000;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v8 performAllEntitiesQueryWithEntityMangledTypeName:v7 auditToken:v17 connectionIdentifier:v13 completionHandler:v15];
}

void __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __89__LNClientConnection_performAllEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performSuggestedEntitiesQueryWithEntityMangledTypeName:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = [(LNClientConnection *)self xpcConnection];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  id v11 = NSNumber;
  id v12 = [(LNClientConnection *)self xpcConnection];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _OWORD v15[2] = __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke;
  v15[3] = &unk_264CA9000;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v8 performSuggestedEntitiesQueryWithEntityMangledTypeName:v7 auditToken:v17 connectionIdentifier:v13 completionHandler:v15];
}

void __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __95__LNClientConnection_performSuggestedEntitiesQueryWithEntityMangledTypeName_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performSuggestedResultsQueryWithEntityType:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = [(LNClientConnection *)self xpcConnection];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  id v11 = NSNumber;
  id v12 = [(LNClientConnection *)self xpcConnection];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _OWORD v15[2] = __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke;
  v15[3] = &unk_264CA9000;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v8 performSuggestedResultsQueryWithEntityType:v7 auditToken:v17 connectionIdentifier:v13 completionHandler:v15];
}

void __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __83__LNClientConnection_performSuggestedResultsQueryWithEntityType_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performConfigurableQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = [(LNClientConnection *)self xpcConnection];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  id v11 = NSNumber;
  id v12 = [(LNClientConnection *)self xpcConnection];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _OWORD v15[2] = __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke;
  v15[3] = &unk_264CA9000;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v8 performConfigurableQuery:v7 auditToken:v17 connectionIdentifier:v13 completionHandler:v15];
}

void __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __65__LNClientConnection_performConfigurableQuery_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)performPropertyQuery:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  id v9 = [(LNClientConnection *)self xpcConnection];
  id v10 = v9;
  if (v9) {
    [v9 auditToken];
  }
  else {
    memset(v17, 0, sizeof(v17));
  }
  id v11 = NSNumber;
  id v12 = [(LNClientConnection *)self xpcConnection];
  id v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _OWORD v15[2] = __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke;
  v15[3] = &unk_264CA9000;
  v15[4] = self;
  id v16 = v6;
  id v14 = v6;
  [v8 performQuery:v7 auditToken:v17 connectionIdentifier:v13 completionHandler:v15];
}

void __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __61__LNClientConnection_performPropertyQuery_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchViewActionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(LNClientConnection *)self appContext];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_264CA8FD8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchViewActionsWithCompletionHandler:v7];
}

void __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __60__LNClientConnection_fetchViewActionsWithCompletionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchViewEntitiesWithInteractionIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke;
  v10[3] = &unk_264CA8FD8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchViewEntitiesWithInteractionIDs:v7 completionHandler:v10];
}

void __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __76__LNClientConnection_fetchViewEntitiesWithInteractionIDs_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchDisplayRepresentationForActions:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LNClientConnection *)self appContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  _OWORD v10[2] = __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke;
  v10[3] = &unk_264CA8FD8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 fetchDisplayRepresentationForActions:v7 completionHandler:v10];
}

void __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke_2;
  block[3] = &unk_264CA9208;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __77__LNClientConnection_fetchDisplayRepresentationForActions_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)removePerformActionOperation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__LNClientConnection_removePerformActionOperation___block_invoke;
  v6[3] = &unk_264CA8FB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __51__LNClientConnection_removePerformActionOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) performActionOperations];
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 removeObjectForKey:v3];

  id v4 = *(void **)(a1 + 40);

  return [v4 setDelegate:0];
}

- (void)enqueuePerformActionOperation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __52__LNClientConnection_enqueuePerformActionOperation___block_invoke;
  v6[3] = &unk_264CA8FB0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __52__LNClientConnection_enqueuePerformActionOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) performActionOperations];
  id v3 = *(void **)(a1 + 40);
  id v4 = [v3 identifier];
  [v2 setObject:v3 forKey:v4];

  [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 32)];
  id v5 = *(void **)(a1 + 40);

  return [v5 start];
}

+ (void)performWithoutTimeout:(id)a3
{
  id v3 = (void (**)(void))a3;
  +[LNAppContext cancelTimeout];
  v3[2](v3);

  +[LNAppContext extendTimeout];
}

+ ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  return +[LNAppContext currentAuditToken];
}

@end