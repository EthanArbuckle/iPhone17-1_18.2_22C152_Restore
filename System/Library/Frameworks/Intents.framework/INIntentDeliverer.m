@interface INIntentDeliverer
+ (void)initialize;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)_updateIntent:(id)a3 intentSlotDescription:(id)a4 resolutionResultDataProvider:(id)a5;
- (INExtensionContextIntentResponseObserver)getCarPowerLevelObserver;
- (INExtensionContextIntentResponseObserver)getRideStatusObserver;
- (INIntentDeliverer)initWithQueue:(id)a3 auditToken:(id *)a4;
- (INIntentDeliveringDelegate)delegate;
- (OS_dispatch_queue)queue;
- (id)_processIntentResponseCompletionHandlerWithIntent:(id)a3 completion:(id)a4;
- (id)_processOptionsForIntent:(id)a3 parameterNamed:(id)a4 completionHandler:(id)a5;
- (id)_processResolutionDataProviderForIntent:(id)a3 intentSlotDescription:(id)a4 updateIntent:(BOOL)a5 completion:(id)a6;
- (void)_deliverIntent:(id)a3 withBlock:(id)a4;
- (void)_invokeIntentHandlerMethodForIntent:(id)a3 intentHandler:(id)a4 parameterNamed:(id)a5 keyForSelectors:(id)a6 executionHandler:(id)a7 unimplementedHandler:(id)a8;
- (void)_processDefaultValue:(id)a3 forIntent:(id)a4 parameterNamed:(id)a5 completionHandler:(id)a6;
- (void)_processIntent:(id)a3 intentResponse:(id)a4 completion:(id)a5;
- (void)_resolveIntentParameter:(id)a3 forIntent:(id)a4 intentHandler:(id)a5 updateIntent:(BOOL)a6 withCompletion:(id)a7;
- (void)_startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4 fromConnection:(id)a5 completionHandler:(id)a6;
- (void)_stopSendingUpdatesForIntent:(id)a3 fromConnection:(id)a4 completionHandler:(id)a5;
- (void)confirmIntent:(id)a3 withCompletion:(id)a4;
- (void)getIntentParameterDefaultValue:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6;
- (void)getParameterOptionsForParameterNamed:(id)a3 intent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6;
- (void)getSupportsParameterOptionsForParameterNamed:(id)a3 intent:(id)a4 completionHandler:(id)a5;
- (void)handleIntent:(id)a3 withCompletion:(id)a4;
- (void)resolveIntentParameter:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)resolveIntentParameters:(id)a3 forIntent:(id)a4 completionBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setGetCarPowerLevelObserver:(id)a3;
- (void)setGetRideStatusObserver:(id)a3;
- (void)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4 completionHandler:(id)a5;
- (void)stopSendingUpdatesForIntent:(id)a3 completionHandler:(id)a4;
@end

@implementation INIntentDeliverer

- (void)_processIntent:(id)a3 intentResponse:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    objc_msgSend(v9, "_intents_prepareResponse");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2;
    v11[3] = &unk_1E551DEC8;
    id v12 = v9;
    id v13 = v8;
    v14 = self;
    id v15 = v10;
    INImageProxyInjectionUtilitiesInjectProxiesIntoObjectWithContinuationHandler(v12, 0x21u, 1, 0, &__block_literal_global_100381, v11, 180.0, 180.0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getCarPowerLevelObserver, 0);
  objc_storeStrong((id *)&self->_getRideStatusObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setGetCarPowerLevelObserver:(id)a3
{
}

- (INExtensionContextIntentResponseObserver)getCarPowerLevelObserver
{
  return self->_getCarPowerLevelObserver;
}

- (void)setGetRideStatusObserver:(id)a3
{
}

- (INExtensionContextIntentResponseObserver)getRideStatusObserver
{
  return self->_getRideStatusObserver;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setDelegate:(id)a3
{
}

- (INIntentDeliveringDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (INIntentDeliveringDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_stopSendingUpdatesForIntent:(id)a3 fromConnection:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__INIntentDeliverer__stopSendingUpdatesForIntent_fromConnection_completionHandler___block_invoke;
  v14[3] = &unk_1E551DF40;
  id v15 = v8;
  v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(INIntentDeliverer *)self _deliverIntent:v13 withBlock:v14];
}

void __83__INIntentDeliverer__stopSendingUpdatesForIntent_fromConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    long long v3 = [*(id *)(a1 + 40) getRideStatusObserver];
    [v3 setObserver:0 forConnection:*(void *)(a1 + 48)];

    v4 = [*(id *)(a1 + 40) getRideStatusObserver];
    v5 = [v4 remoteObservers];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      [v12 stopSendingUpdatesForGetRideStatus:*(void *)(a1 + 32)];
      [*(id *)(a1 + 40) setGetRideStatusObserver:0];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v7 = [*(id *)(a1 + 40) getCarPowerLevelObserver];
      [v7 setObserver:0 forConnection:*(void *)(a1 + 48)];

      id v8 = [*(id *)(a1 + 40) getCarPowerLevelObserver];
      id v9 = [v8 remoteObservers];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        [v12 stopSendingUpdatesForGetCarPowerLevelStatus:*(void *)(a1 + 32)];
        [*(id *)(a1 + 40) setGetCarPowerLevelObserver:0];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      [v12 stopSendingUpdatesForIntent:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 56)];
    }
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (v11) {
    (*(void (**)(void))(v11 + 16))();
  }
}

- (void)_startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4 fromConnection:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = v13;
  if (v11)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __95__INIntentDeliverer__startSendingUpdatesForIntent_toObserver_fromConnection_completionHandler___block_invoke;
    v15[3] = &unk_1E551DF18;
    id v16 = v10;
    id v17 = v12;
    id v18 = self;
    id v19 = v11;
    id v20 = v14;
    [(INIntentDeliverer *)self _deliverIntent:v16 withBlock:v15];
  }
  else if (v13)
  {
    (*((void (**)(id))v13 + 2))(v13);
  }
}

void __95__INIntentDeliverer__startSendingUpdatesForIntent_toObserver_fromConnection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (*(void *)(a1 + 40))
    {
      v4 = [*(id *)(a1 + 48) getRideStatusObserver];

      v5 = *(void **)(a1 + 48);
      if (v4)
      {
        uint64_t v6 = [*(id *)(a1 + 48) getRideStatusObserver];
LABEL_11:
        id v9 = v6;
        [v6 setObserver:*(void *)(a1 + 56) forConnection:*(void *)(a1 + 40)];

        goto LABEL_22;
      }
      id v13 = objc_alloc_init(INExtensionContextIntentResponseObserver);
      [v5 setGetRideStatusObserver:v13];

      v14 = [*(id *)(a1 + 48) getRideStatusObserver];
      [v14 setObserver:*(void *)(a1 + 56) forConnection:*(void *)(a1 + 40)];

      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = [*(id *)(a1 + 48) getRideStatusObserver];
      [v3 startSendingUpdatesForGetRideStatus:v15 toObserver:v16];
LABEL_21:

      goto LABEL_22;
    }
    id v11 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v21 = 136315138;
    v22 = "-[INIntentDeliverer _startSendingUpdatesForIntent:toObserver:fromConnection:completionHandler:]_block_invoke";
    id v12 = "%s Attemping to start getting ride status update without the caller connection. Request is ignored.";
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (*(void *)(a1 + 40))
    {
      v7 = [*(id *)(a1 + 48) getCarPowerLevelObserver];

      id v8 = *(void **)(a1 + 48);
      if (v7)
      {
        uint64_t v6 = [*(id *)(a1 + 48) getCarPowerLevelObserver];
        goto LABEL_11;
      }
      id v17 = objc_alloc_init(INExtensionContextIntentResponseObserver);
      [v8 setGetCarPowerLevelObserver:v17];

      id v18 = [*(id *)(a1 + 48) getCarPowerLevelObserver];
      [v18 setObserver:*(void *)(a1 + 56) forConnection:*(void *)(a1 + 40)];

      uint64_t v19 = *(void *)(a1 + 32);
      id v16 = [*(id *)(a1 + 48) getCarPowerLevelObserver];
      [v3 startSendingUpdatesForGetCarPowerLevelStatus:v19 toObserver:v16];
      goto LABEL_21;
    }
    id v11 = INSiriLogContextIntents;
    if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    int v21 = 136315138;
    v22 = "-[INIntentDeliverer _startSendingUpdatesForIntent:toObserver:fromConnection:completionHandler:]_block_invoke";
    id v12 = "%s Attemping to start getting car battery level update without the caller connection. Request is ignored.";
LABEL_18:
    _os_log_fault_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v21, 0xCu);
    goto LABEL_22;
  }
  if (objc_opt_respondsToSelector()) {
    [v3 startSendingUpdatesForIntent:*(void *)(a1 + 32) toObserver:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
  }
LABEL_22:
  uint64_t v20 = *(void *)(a1 + 64);
  if (v20) {
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v10);
  }
}

- (void)_deliverIntent:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__INIntentDeliverer__deliverIntent_withBlock___block_invoke;
    block[3] = &unk_1E551DEF0;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, block);
  }
}

void __46__INIntentDeliverer__deliverIntent_withBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 intentDeliverer:*(void *)(a1 + 32) deliverIntent:*(void *)(a1 + 40) withBlock:*(void *)(a1 + 48)];
}

void __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "-[INIntentDeliverer _processIntent:intentResponse:completion:]_block_invoke_2";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v6;
      _os_log_error_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_ERROR, "%s Error injecting image proxies into intent response %@: %@", buf, 0x20u);
    }
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v9 = v5;
  if ((isKindOfClass & 1) == 0) {
    id v9 = *(void **)(a1 + 32);
  }
  id v10 = v9;
  memset(buf, 0, 32);
  id v11 = [*(id *)(a1 + 40) _metadata];
  id v12 = [v11 auditTokenData];
  v34 = v5;
  uint64_t v32 = a1;
  if (v12)
  {
    id v13 = [*(id *)(a1 + 40) _metadata];
    v14 = [v13 auditTokenData];
    uint64_t v15 = v14;
    if (v14) {
      objc_msgSend(v14, "if_auditToken");
    }
    else {
      memset(buf, 0, 32);
    }
  }
  else
  {
    id v16 = *(void **)(a1 + 48);
    if (v16) {
      [v16 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
  }
  v33 = v6;

  v45[0] = *(_OWORD *)buf;
  v45[1] = *(_OWORD *)&buf[16];
  INIssueSandboxExtensionsForFileURLEnumerableToProcess(v10, v45);
  uint64_t v17 = objc_opt_class();
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_136;
  v42[3] = &__block_descriptor_64_e15_B16__0__NSURL_8l;
  long long v43 = *(_OWORD *)buf;
  long long v44 = *(_OWORD *)&buf[16];
  objc_msgSend(v10, "_intents_enumerateObjectsOfClass:withBlock:", v17, v42);
  id v18 = +[INCache sharedCache];
  uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v20 = objc_msgSend(v10, "_intents_cacheableObjects");
  uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v26 = [v25 cacheIdentifier];
        v27 = [v18 cacheableObjectForIdentifier:v26];

        if (v27) {
          v28 = v27;
        }
        else {
          v28 = v25;
        }
        [v19 addObject:v28];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v22);
  }

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2_139;
  v35[3] = &unk_1E551F768;
  id v29 = *(id *)(v32 + 56);
  id v36 = v10;
  id v37 = v29;
  id v30 = v10;
  +[INSerializedCacheItem serializeCacheableObjects:v19 completion:v35];
}

uint64_t __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28B50];
  id v3 = a2;
  v4 = [v2 mainBundle];
  id v5 = [v4 bundleIdentifier];
  [v3 _setBundleIdentifier:v5];

  return 1;
}

uint64_t __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_136(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 isFileURL];
  if (v4)
  {
    long long v5 = *(_OWORD *)(a1 + 48);
    v7[0] = *(_OWORD *)(a1 + 32);
    v7[1] = v5;
    INFileURLSetAssociatedAuditToken(v3, v7);
  }

  return v4;
}

void __62__INIntentDeliverer__processIntent_intentResponse_completion___block_invoke_2_139(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    long long v5 = v4;
    int v10 = 136315394;
    id v11 = "-[INIntentDeliverer _processIntent:intentResponse:completion:]_block_invoke_2";
    __int16 v12 = 2048;
    uint64_t v13 = [v3 count];
    _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s Sending %tu serialized cache items.", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v8 = a1 + 32;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v8 + 8);
  id v9 = [MEMORY[0x1E4F1CAD0] setWithSet:v3];
  (*(void (**)(uint64_t, uint64_t, void, void *, void))(v7 + 16))(v7, v6, 0, v9, 0);
}

- (BOOL)_updateIntent:(id)a3 intentSlotDescription:(id)a4 resolutionResultDataProvider:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = v9;
  BOOL v11 = 0;
  if (v7 && v8 && v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = v10;
        uint64_t v25 = [v24 resolutionResultCode];
        if ((unint64_t)(v25 - 1) >= 4 && v25 != 6)
        {
          if (v25)
          {
            v26 = 0;
          }
          else
          {
            v26 = [v24 resolvedValue];
          }

LABEL_48:
          v34 = objc_msgSend(v8, "facadePropertyName", (void)v42);
          uint64_t v35 = objc_msgSend(v7, "_intents_setterForPropertyWithName:", v34);

          if (v35)
          {
            if (v26 || ![v8 isEnum])
            {
              id v37 = [v8 facadePropertyName];
              [v7 setValue:v26 forKey:v37];
            }
            else
            {
              id v36 = [v8 facadePropertyName];
              [v7 setValue:&unk_1EDBA7978 forKey:v36];

              v26 = 0;
            }
            BOOL v11 = 1;
            goto LABEL_57;
          }
          long long v38 = (void *)INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
          {
            long long v40 = v38;
            long long v41 = [v8 facadePropertyName];
            *(_DWORD *)buf = 136315394;
            v47 = "-[INIntentDeliverer _updateIntent:intentSlotDescription:resolutionResultDataProvider:]";
            __int16 v48 = 2114;
            v49 = v41;
            _os_log_error_impl(&dword_18CB2F000, v40, OS_LOG_TYPE_ERROR, "%s Setter for property %{public}@ is not defined or invalid", buf, 0x16u);
          }
LABEL_56:
          BOOL v11 = 0;
LABEL_57:

          goto LABEL_58;
        }
      }
      v26 = 0;
      goto LABEL_56;
    }
    id v12 = v10;
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v43 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend(v19, "resolutionResultCode", (void)v42);
          if (v20)
          {
            if ((unint64_t)(v20 - 1) < 4 || v20 == 6)
            {
              char v27 = 1;
              goto LABEL_27;
            }
          }
          else
          {
            uint64_t v22 = [v19 resolvedValue];

            if (v22)
            {
              uint64_t v23 = [v19 resolvedValue];
              [v13 addObject:v23];
            }
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v42 objects:v50 count:16];
        char v27 = 0;
      }
      while (v16);
    }
    else
    {
      char v27 = 0;
    }
LABEL_27:

    v28 = [v8 facadePropertyName];
    if ([v7 _isValidKey:v28])
    {
      id v29 = [v8 facadePropertyName];
      id v30 = [v7 valueForKey:v29];

      id v31 = v30;
      if (v31)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v32 = v31;
        }
        else {
          uint64_t v32 = 0;
        }
LABEL_34:
        id v33 = v32;

        if (v27)
        {
LABEL_35:
          v26 = 0;
          goto LABEL_38;
        }
        if ([v13 count])
        {
          v26 = (void *)[v13 copy];
        }
        else
        {
          if (!v33 || [v33 count]) {
            goto LABEL_35;
          }
          v26 = (void *)MEMORY[0x1E4F1CBF0];
        }
LABEL_38:

        if (v27) {
          goto LABEL_56;
        }
        goto LABEL_48;
      }
    }
    else
    {

      id v31 = 0;
    }
    uint64_t v32 = 0;
    goto LABEL_34;
  }
LABEL_58:

  return v11;
}

- (void)_processDefaultValue:(id)a3 forIntent:(id)a4 parameterNamed:(id)a5 completionHandler:(id)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void (**)(void, void, void))v12;
  if (v9)
  {
    id v14 = [v10 _intentInstanceDescription];
    uint64_t v15 = [v14 slotByName:v11];

    v61 = v15;
    uint64_t v16 = [v15 codableAttribute];
    if (!v16)
    {
      uint64_t v17 = [v10 _codableDescription];
      uint64_t v16 = [v17 attributeByName:v11];
    }
    Class v18 = (Class)[v16 objectClass];
    id v19 = v16;
    if (v19)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
    }
    else
    {
      uint64_t v20 = 0;
    }
    id v21 = v20;

    if (v18 == (Class)objc_opt_class() && v21)
    {
      uint64_t v22 = [v21 codableDescription];
      uint64_t v23 = [v22 className];
      Class v18 = NSClassFromString(v23);
    }
    v60 = v21;
    if (!v18)
    {
      v46 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1000 userInfo:0];
      ((void (**)(void, void, void *))v13)[2](v13, 0, v46);

      id v47 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Undefined parameter class" userInfo:0];
      objc_exception_throw(v47);
    }
    id v24 = objc_alloc_init(INJSONEncoder);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v56 = v11;
      id v57 = v10;
      v59 = v13;
      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v58 = v9;
      id v26 = v9;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v63 objects:v67 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v64 != v29) {
              objc_enumerationMutation(v26);
            }
            id v31 = *(void **)(*((void *)&v63 + 1) + 8 * i);
            if (([v31 isMemberOfClass:v18] & 1) == 0)
            {
              long long v38 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1001 userInfo:0];
              ((void (**)(void, void, void *))v59)[2](v59, 0, v38);

              long long v39 = (void *)MEMORY[0x1E4F1CA00];
              uint64_t v40 = *MEMORY[0x1E4F1C3B8];
              long long v41 = NSString;
              long long v42 = (objc_class *)objc_opt_class();
              long long v43 = NSStringFromClass(v42);
              long long v44 = [v41 stringWithFormat:@"Unexpected class %@", v43];
              id v45 = [v39 exceptionWithName:v40 reason:v44 userInfo:0];

              objc_exception_throw(v45);
            }
            uint64_t v32 = INObjectWithTypedObject(v31, v19);
            if (v32)
            {
              id v33 = [(INJSONEncoder *)v24 encodeObject:v32 withCodableAttribute:v19];
              objc_msgSend(v25, "if_addObjectIfNonNil:", v33);
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v63 objects:v67 count:16];
        }
        while (v28);
      }

      id v10 = v57;
      if ([v25 count]) {
        v34 = (void *)[v25 copy];
      }
      else {
        v34 = 0;
      }
      uint64_t v13 = v59;

      id v9 = v58;
      id v11 = v56;
      if (!v34)
      {
LABEL_32:
        v13[2](v13, 0, 0);
        goto LABEL_33;
      }
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __int16 v48 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1001 userInfo:0];
        ((void (**)(void, void, void *))v13)[2](v13, 0, v48);

        v49 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v50 = *MEMORY[0x1E4F1C3B8];
        uint64_t v51 = NSString;
        v52 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v52);
        v54 = [v51 stringWithFormat:@"Unexpected class %@", v53];
        id v55 = [v49 exceptionWithName:v50 reason:v54 userInfo:0];

        objc_exception_throw(v55);
      }
      uint64_t v35 = INObjectWithTypedObject(v9, v19);
      v34 = [(INJSONEncoder *)v24 encodeObject:v35 withCodableAttribute:v19];

      if (!v34) {
        goto LABEL_32;
      }
    }
    id v62 = 0;
    id v36 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v34 requiringSecureCoding:1 error:&v62];
    id v37 = v62;
    ((void (**)(void, void *, id))v13)[2](v13, v36, v37);

LABEL_33:
    goto LABEL_34;
  }
  (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
LABEL_34:
}

- (id)_processOptionsForIntent:(id)a3 parameterNamed:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  char v21 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__INIntentDeliverer__processOptionsForIntent_parameterNamed_completionHandler___block_invoke;
  v15[3] = &unk_1E551DE60;
  id v18 = v9;
  id v19 = v20;
  id v16 = v7;
  id v17 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  uint64_t v13 = (void *)MEMORY[0x192F984C0](v15);

  _Block_object_dispose(v20, 8);

  return v13;
}

void __79__INIntentDeliverer__processOptionsForIntent_parameterNamed_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[INIntentDeliverer _processOptionsForIntent:parameterNamed:completionHandler:]_block_invoke";
    __int16 v47 = 2112;
    id v48 = v5;
    __int16 v49 = 2112;
    id v50 = v6;
    _os_log_impl(&dword_18CB2F000, v7, OS_LOG_TYPE_INFO, "%s Completion handler called with objectCollection: %@, error: %@", buf, 0x20u);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3B8];
    id v30 = @"This completion handler should be called only once";
    goto LABEL_27;
  }
  if (!v6)
  {
    if (!v5)
    {
      id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      goto LABEL_16;
    }
    id v11 = [*(id *)(a1 + 32) _intentInstanceDescription];
    id v12 = [v11 slotByName:*(void *)(a1 + 40)];

    uint64_t v13 = [v12 codableAttribute];
    if (!v13)
    {
      id v14 = [*(id *)(a1 + 32) _codableDescription];
      uint64_t v13 = [v14 attributeByName:*(void *)(a1 + 40)];
    }
    Class v15 = (Class)[v13 objectClass];
    id v16 = v13;
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
    id v21 = v17;

    if (v15 == (Class)objc_opt_class() && v21)
    {
      uint64_t v22 = [v21 codableDescription];
      uint64_t v23 = [v22 className];
      Class v15 = NSClassFromString(v23);
    }
    if (v15)
    {
      id v42 = 0;
      id v24 = [v5 _untypedObjectCollectionWithItemClass:v15 codableAttribute:v16 error:&v42];
      id v25 = v42;
      if (!v24)
      {
        uint64_t v34 = *(void *)(a1 + 48);
        uint64_t v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1001 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v34 + 16))(v34, 0, v35);

        id v36 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v37 = *MEMORY[0x1E4F1C3B8];
        long long v38 = [v25 userInfo];
        long long v39 = [v38 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];
        id v40 = [v36 exceptionWithName:v37 reason:v39 userInfo:0];

        objc_exception_throw(v40);
      }
      id v41 = 0;
      id v26 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v24 requiringSecureCoding:1 error:&v41];
      id v27 = v41;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;

      goto LABEL_24;
    }
    uint64_t v31 = *(void *)(a1 + 48);
    uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1000 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v31 + 16))(v31, 0, v32);

    uint64_t v28 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v29 = *MEMORY[0x1E4F1C3B8];
    id v30 = @"Undefined parameter class";
LABEL_27:
    id v33 = [v28 exceptionWithName:v29 reason:v30 userInfo:0];
    objc_exception_throw(v33);
  }
  id v8 = [v6 domain];
  int v9 = [v8 isEqualToString:@"_INExtensionContextErrorDomain"];

  if (v9)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_16:
    v10();
    goto LABEL_24;
  }
  id v18 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v43 = *MEMORY[0x1E4F28A50];
  id v44 = v6;
  id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  uint64_t v20 = [v18 errorWithDomain:@"_INExtensionContextErrorDomain" code:1004 userInfo:v19];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_24:
}

- (id)_processResolutionDataProviderForIntent:(id)a3 intentSlotDescription:(id)a4 updateIntent:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke;
  v18[3] = &unk_1E551DE38;
  id v22 = v12;
  uint64_t v23 = v25;
  id v19 = v10;
  id v20 = v11;
  BOOL v24 = a5;
  id v21 = self;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = (void *)MEMORY[0x192F984C0](v18);

  _Block_object_dispose(v25, 8);

  return v16;
}

void __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[INIntentDeliverer _processResolutionDataProviderForIntent:intentSlotDescription:updateIntent:completion:]_block_invoke";
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Completion handler called with %@", buf, 0x16u);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This completion handler should be called only once" userInfo:0];
    objc_exception_throw(v14);
  }
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke_116;
    v15[3] = &unk_1E551DE38;
    id v16 = v5;
    id v8 = *(id *)(a1 + 40);
    char v21 = *(unsigned char *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(a1 + 56);
    id v17 = v8;
    uint64_t v18 = v9;
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 64);
    id v19 = v11;
    uint64_t v20 = v12;
    [v3 transformResolutionResultForIntent:v16 intentSlotDescription:v6 withOptionsProvider:v7 completion:v15];

    id v13 = v16;
  }
  else
  {
    id v13 = [[INExtensionContextSlotResolutionResult alloc] initWithResult:1 data:0];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
}

void __107__INIntentDeliverer__processResolutionDataProviderForIntent_intentSlotDescription_updateIntent_completion___block_invoke_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v11 = 0;
    uint64_t v6 = [v3 resolutionResultDataForIntent:v4 intentSlotDescription:v5 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = v7;
LABEL_8:
      uint64_t v9 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (!*(unsigned char *)(a1 + 72))
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v8 = 0;
  uint64_t v9 = [*(id *)(a1 + 48) _updateIntent:*(void *)(a1 + 32) intentSlotDescription:*(void *)(a1 + 40) resolutionResultDataProvider:v3] ^ 1;
LABEL_9:
  id v10 = [[INExtensionContextSlotResolutionResult alloc] initWithResult:v9 data:v6];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
}

- (id)_processIntentResponseCompletionHandlerWithIntent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  char v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__INIntentDeliverer__processIntentResponseCompletionHandlerWithIntent_completion___block_invoke;
  v12[3] = &unk_1E551DE10;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v15 = v16;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x192F984C0](v12);

  _Block_object_dispose(v16, 8);

  return v10;
}

void __82__INIntentDeliverer__processIntentResponseCompletionHandlerWithIntent_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[INIntentDeliverer _processIntentResponseCompletionHandlerWithIntent:completion:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Completion handler called with %@", (uint8_t *)&v9, 0x16u);
  }
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"This completion handler should be called only once" userInfo:0];
    objc_exception_throw(v8);
  }
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  id v7 = INIntentResponseWithTypedIntentResponse(v3);
  [v5 _processIntent:v6 intentResponse:v7 completion:a1[6]];

  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
}

- (void)_invokeIntentHandlerMethodForIntent:(id)a3 intentHandler:(id)a4 parameterNamed:(id)a5 keyForSelectors:(id)a6 executionHandler:(id)a7 unimplementedHandler:(id)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = INTypedIntentWithIntent(a3);
  uint64_t v20 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    char v21 = v20;
    id v22 = [v19 typeName];
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[INIntentDeliverer _invokeIntentHandlerMethodForIntent:intentHandler:parameterNamed:keyForSelectors:execution"
          "Handler:unimplementedHandler:]";
    __int16 v38 = 2112;
    long long v39 = v22;
    _os_log_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_INFO, "%s _invokeIntentHandlerMethodForIntent %@", buf, 0x16u);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke;
  v30[3] = &unk_1E551DDE8;
  id v34 = v17;
  id v23 = v19;
  id v31 = v23;
  id v32 = v15;
  id v33 = v16;
  id v35 = v18;
  id v24 = v18;
  id v25 = v16;
  id v26 = v15;
  id v27 = v17;
  uint64_t v28 = MEMORY[0x192F984C0](v30);
  uint64_t v29 = (void *)v28;
  if (v14) {
    (*(void (**)(uint64_t, id))(v28 + 16))(v28, v14);
  }
  else {
    [(INIntentDeliverer *)self _deliverIntent:v23 withBlock:v28];
  }
}

void __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _intentInstanceDescription];
    uint64_t v5 = v4;
    if (*(void *)(a1 + 40))
    {
      uint64_t v6 = objc_msgSend(v4, "slotByName:");
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = [v6 facadePropertyName];
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    if (!v7) {
      goto LABEL_13;
    }
    id v8 = [v6 valueForKey:*(void *)(a1 + 48)];
    if (v8)
    {
      objc_opt_class();
      int v9 = (objc_opt_isKindOfClass() & 1) != 0 ? v8 : 0;
    }
    else
    {
      int v9 = 0;
    }
    id v10 = v9;

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke_2;
    v11[3] = &unk_1E551DDC0;
    id v12 = v3;
    id v16 = &v17;
    id v15 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 32);
    id v14 = v6;
    [v10 enumerateObjectsUsingBlock:v11];

    if (!*((unsigned char *)v18 + 24)) {
LABEL_13:
    }
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __140__INIntentDeliverer__invokeIntentHandlerMethodForIntent_intentHandler_parameterNamed_keyForSelectors_executionHandler_unimplementedHandler___block_invoke_2(uint64_t a1, NSString *aSelectorName, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (uint64_t)NSSelectorFromString(aSelectorName);
  if (result)
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
        *a4 = 1;
      }
    }
  }
  return result;
}

- (void)_resolveIntentParameter:(id)a3 forIntent:(id)a4 intentHandler:(id)a5 updateIntent:(BOOL)a6 withCompletion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v15)
  {
    if ([v13 _type] != 2)
    {
LABEL_22:
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke;
      v46[3] = &unk_1E551DD48;
      id v49 = v15;
      id v47 = v13;
      id v48 = self;
      BOOL v50 = a6;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_2;
      v40[3] = &unk_1E551DD98;
      id v41 = v12;
      id v42 = v47;
      uint64_t v43 = self;
      id v44 = v49;
      BOOL v45 = a6;
      [(INIntentDeliverer *)self _invokeIntentHandlerMethodForIntent:v42 intentHandler:v14 parameterNamed:v41 keyForSelectors:@"resolveSelectorStrings" executionHandler:v46 unimplementedHandler:v40];

      id v17 = v49;
      goto LABEL_23;
    }
    id v16 = [v13 _codableDescription];
    id v17 = [v16 attributeByName:v12];

    if (![v17 supportsResolution])
    {
LABEL_21:

      goto LABEL_22;
    }
    id v18 = [v17 relationship];
    uint64_t v19 = [v18 parentCodableAttribute];

    if (v17 && v19)
    {
      char v20 = [v17 relationship];
      uint64_t v21 = [v20 relation];

      if (v21)
      {
        id v22 = [v19 propertyName];
        uint64_t v23 = [v13 valueForKey:v22];

        id v24 = [v17 relationship];
        __int16 v38 = (void *)v23;
        LOBYTE(v23) = [v24 compareValue:v23];

        if ((v23 & 1) == 0)
        {
          id v33 = [INExtensionContextSlotResolutionResult alloc];
          id v34 = +[INIntentResolutionResult _dataForResolutionMethodUnimplemented];
          id v35 = [(INExtensionContextSlotResolutionResult *)v33 initWithResult:2 data:v34];
          (*((void (**)(id, INExtensionContextSlotResolutionResult *, void))v15 + 2))(v15, v35, 0);

          goto LABEL_17;
        }
      }
    }
    else if (!v17)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (([v17 supportsDynamicEnumeration] & 1) == 0 && objc_msgSend(v17, "modifier"))
    {
      v51[0] = 0;
      char v25 = [v13 _isValueValidForKey:v12 unsupportedReason:v51];
      id v26 = v51[0];
      id v27 = v26;
      if ((v25 & 1) == 0 && v26)
      {
        uint64_t v28 = [v13 _intentInstanceDescription];
        if (v12)
        {
          long long v39 = v28;
          id v36 = [v28 slotByName:v12];
          uint64_t v37 = [v17 unsupportedReasons];
          uint64_t v29 = +[INIntentResolutionResult unsupportedWithReason:](INIntentResolutionResult, "unsupportedWithReason:", [v37 indexOfObject:v27] + 1);
          id v30 = [INExtensionContextSlotResolutionResult alloc];
          id v31 = [v29 _dataForIntentSlotDescription:v36];
          id v32 = [(INExtensionContextSlotResolutionResult *)v30 initWithResult:1 data:v31];
          (*((void (**)(id, INExtensionContextSlotResolutionResult *, void))v15 + 2))(v15, v32, 0);

LABEL_17:
LABEL_23:

          goto LABEL_24;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_24:
}

BOOL __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (*)(id, uint64_t, uint64_t, void *))[v9 methodForSelector:a3];
  if (v12)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_103;
    id v24 = &unk_1E551DD20;
    id v26 = *(id *)(a1 + 48);
    id v13 = v9;
    id v25 = v13;
    id v14 = (void *)MEMORY[0x192F984C0](&v21);
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = objc_msgSend(*(id *)(a1 + 40), "_processResolutionDataProviderForIntent:intentSlotDescription:updateIntent:completion:", v15, v11, *(unsigned __int8 *)(a1 + 56), v14, v21, v22, v23, v24);
    v12(v13, a3, v15, v16);
  }
  else
  {
    id v17 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = v17;
      char v20 = [v11 facadePropertyName];
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = "-[INIntentDeliverer _resolveIntentParameter:forIntent:intentHandler:updateIntent:withCompletion:]_block_invoke";
      __int16 v29 = 2114;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_error_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of resolution method for facade slot name %{public}@ on intent %@", buf, 0x20u);
    }
  }

  return v12 != 0;
}

void __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = NSString;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "if_ASCIIStringByUppercasingFirstCharacter");
  id v9 = [v7 stringWithFormat:@"_intents_resolve%@WithCompletionHandler:", v8];

  SEL v10 = NSSelectorFromString(v9);
  if (objc_opt_respondsToSelector())
  {
    id v11 = (void (*)(uint64_t, SEL, void *))[*(id *)(a1 + 40) methodForSelector:v10];
    uint64_t v12 = *(void *)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_3;
    v19[3] = &unk_1E551DD70;
    id v23 = *(id *)(a1 + 56);
    id v20 = v5;
    int8x16_t v18 = *(int8x16_t *)(a1 + 40);
    id v13 = (id)v18.i64[0];
    int8x16_t v21 = vextq_s8(v18, v18, 8uLL);
    id v22 = v6;
    char v24 = *(unsigned char *)(a1 + 64);
    v11(v12, v10, v19);
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 56);
    uint64_t v15 = [INExtensionContextSlotResolutionResult alloc];
    id v16 = +[INIntentResolutionResult _dataForResolutionMethodUnimplemented];
    id v17 = [(INExtensionContextSlotResolutionResult *)v15 initWithResult:2 data:v16];
    (*(void (**)(uint64_t, INExtensionContextSlotResolutionResult *, id))(v14 + 16))(v14, v17, v5);
  }
}

void __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(unsigned __int8 *)(a1 + 72);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_4;
    v13[3] = &unk_1E551DD20;
    uint64_t v7 = *(void *)(a1 + 56);
    id v15 = *(id *)(a1 + 64);
    id v14 = *(id *)(a1 + 32);
    id v8 = [v4 _processResolutionDataProviderForIntent:v5 intentSlotDescription:v7 updateIntent:v6 completion:v13];
    ((void (**)(void, id))v8)[2](v8, v3);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 64);
    SEL v10 = [INExtensionContextSlotResolutionResult alloc];
    id v11 = +[INIntentResolutionResult _dataForResolutionMethodUnimplemented];
    uint64_t v12 = [(INExtensionContextSlotResolutionResult *)v10 initWithResult:2 data:v11];
    (*(void (**)(uint64_t, INExtensionContextSlotResolutionResult *, void))(v9 + 16))(v9, v12, *(void *)(a1 + 32));
  }
}

uint64_t __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __97__INIntentDeliverer__resolveIntentParameter_forIntent_intentHandler_updateIntent_withCompletion___block_invoke_103(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (void)getSupportsParameterOptionsForParameterNamed:(id)a3 intent:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke;
  v12[3] = &unk_1E551DCF8;
  id v13 = v8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke_2;
  v10[3] = &unk_1E551DB60;
  id v11 = v13;
  id v9 = v13;
  [(INIntentDeliverer *)self _invokeIntentHandlerMethodForIntent:a4 intentHandler:0 parameterNamed:a3 keyForSelectors:@"provideOptionsSelectorStrings" executionHandler:v12 unimplementedHandler:v10];
}

BOOL __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = objc_msgSend(a2, "methodForSelector:") != 0;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  return v3;
}

uint64_t __91__INIntentDeliverer_getSupportsParameterOptionsForParameterNamed_intent_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getParameterOptionsForParameterNamed:(id)a3 intent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke;
    v14[3] = &unk_1E551DCD0;
    id v15 = v10;
    id v16 = v11;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_2;
    v12[3] = &unk_1E551DB60;
    id v13 = v16;
    [(INIntentDeliverer *)self _invokeIntentHandlerMethodForIntent:a4 intentHandler:0 parameterNamed:a3 keyForSelectors:@"provideOptionsSelectorStrings" executionHandler:v14 unimplementedHandler:v12];
  }
}

uint64_t __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = (void (*)(id, uint64_t, id, void *))[v9 methodForSelector:a3];
  id v13 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
  uint64_t v14 = [v13 numberOfArguments];
  if (v14 == 4)
  {
    if (v12)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_94;
      v22[3] = &unk_1E551DCA8;
      id v23 = *(id *)(a1 + 40);
      v12(v9, a3, v10, v22);

      goto LABEL_7;
    }
    id v20 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      id v17 = v20;
      int8x16_t v18 = [v11 facadePropertyName];
      *(_DWORD *)buf = 136315650;
      id v25 = "-[INIntentDeliverer getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:]_block_invoke";
      __int16 v26 = 2114;
      id v27 = v18;
      __int16 v28 = 2112;
      id v29 = v10;
      uint64_t v19 = "%s Unable to find implementation of provide options method for facade parameter name %{public}@ on intent %@";
      goto LABEL_14;
    }
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  if (v14 != 5) {
    goto LABEL_11;
  }
  if (!v12)
  {
    id v16 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      id v17 = v16;
      int8x16_t v18 = [v11 facadePropertyName];
      *(_DWORD *)buf = 136315650;
      id v25 = "-[INIntentDeliverer getParameterOptionsForParameterNamed:intent:searchTerm:completionBlock:]_block_invoke";
      __int16 v26 = 2114;
      id v27 = v18;
      __int16 v28 = 2112;
      id v29 = v10;
      uint64_t v19 = "%s Unable to find implementation of provide options with search term method for facade parameter name %{publ"
            "ic}@ on intent %@";
LABEL_14:
      _os_log_error_impl(&dword_18CB2F000, v17, OS_LOG_TYPE_ERROR, v19, buf, 0x20u);

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  ((void (*)(id, uint64_t, id, void, void))v12)(v9, a3, v10, *(void *)(a1 + 32), *(void *)(a1 + 40));
LABEL_7:
  uint64_t v15 = 1;
LABEL_12:

  return v15;
}

void __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1002 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __92__INIntentDeliverer_getParameterOptionsForParameterNamed_intent_searchTerm_completionBlock___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v7 = *(void *)(a1 + 32);
    if (isKindOfClass)
    {
      id v8 = [[INObjectCollection alloc] initWithItems:v9];
      (*(void (**)(uint64_t, INObjectCollection *, id))(v7 + 16))(v7, v8, v5);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v5);
    }
  }
}

- (void)stopSendingUpdatesForIntent:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F29268] currentConnection];
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__INIntentDeliverer_stopSendingUpdatesForIntent_completionHandler___block_invoke;
  v13[3] = &unk_1E551DC80;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(queue, v13);
}

uint64_t __67__INIntentDeliverer_stopSendingUpdatesForIntent_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSendingUpdatesForIntent:*(void *)(a1 + 40) fromConnection:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

- (void)startSendingUpdatesForIntent:(id)a3 toObserver:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F29268] currentConnection];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__INIntentDeliverer_startSendingUpdatesForIntent_toObserver_completionHandler___block_invoke;
  block[3] = &unk_1E551DC58;
  block[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v11;
  id v21 = v10;
  id v13 = v10;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(queue, block);
}

uint64_t __79__INIntentDeliverer_startSendingUpdatesForIntent_toObserver_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startSendingUpdatesForIntent:*(void *)(a1 + 40) toObserver:*(void *)(a1 + 48) fromConnection:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

- (void)handleIntent:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke;
    v19[3] = &unk_1E551F7D0;
    id v20 = v7;
    id v9 = (void *)MEMORY[0x192F984C0](v19);
    id v10 = INTypedIntentWithIntent(v6);

    id v11 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      id v13 = [v10 typeName];
      *(_DWORD *)buf = 136315394;
      id v22 = "-[INIntentDeliverer handleIntent:withCompletion:]";
      __int16 v23 = 2112;
      char v24 = v13;
      _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s handleIntent %@", buf, 0x16u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke_87;
    v15[3] = &unk_1E551DC30;
    id v6 = v10;
    id v17 = self;
    id v18 = v9;
    id v16 = v6;
    id v14 = v9;
    [(INIntentDeliverer *)self _deliverIntent:v6 withBlock:v15];
  }
}

void __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = INSiriLogContextIntents;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      id v15 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Returning handle response with error %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    id v15 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_INFO, "%s Returning handle response %@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__INIntentDeliverer_handleIntent_withCompletion___block_invoke_87(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _intentInstanceDescription];
    uint64_t v5 = [v4 handleSelector];
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [v3 methodForSelector:v6];
        if (v7)
        {
          id v8 = (void (*)(id, uint64_t, uint64_t, void *))v7;
          uint64_t v9 = *(void *)(a1 + 32);
          id v10 = [*(id *)(a1 + 40) _processIntentResponseCompletionHandlerWithIntent:v9 completion:*(void *)(a1 + 48)];
          v8(v3, v6, v9, v10);

          goto LABEL_20;
        }
        id v12 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = *(void *)(a1 + 32);
          int v21 = 136315394;
          id v22 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
          __int16 v23 = 2112;
          uint64_t v24 = v20;
          _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of handling method for handling intent %@", (uint8_t *)&v21, 0x16u);
        }
      }
    }
    if ([*(id *)(a1 + 32) _type] == 2)
    {
      id v13 = [*(id *)(a1 + 32) _codableDescription];
      int v14 = [v13 isEligibleForWidgets];

      if (v14)
      {
        if (_os_feature_enabled_impl()) {
          uint64_t v15 = 4;
        }
        else {
          uint64_t v15 = 2;
        }
      }
      else
      {
        uint64_t v15 = 5;
      }
      id v18 = [[INIntentResponse alloc] _initWithCode:v15 userActivity:0];
    }
    else
    {
      __int16 v16 = [v4 responseName];
      id v17 = INIntentSchemaGetIntentResponseDescriptionWithName(v16);

      id v18 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v17, "facadeClass")), "_initWithCode:userActivity:", 5, 0);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      int v21 = 136315394;
      id v22 = "-[INIntentDeliverer handleIntent:withCompletion:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v19;
      _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s No handler for intent %@ provided by extension", (uint8_t *)&v21, 0x16u);
    }
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IntentsErrorDomain" code:2003 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_20:
}

- (void)confirmIntent:(id)a3 withCompletion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke;
    v19[3] = &unk_1E551F7D0;
    id v20 = v7;
    uint64_t v9 = (void *)MEMORY[0x192F984C0](v19);
    id v10 = INTypedIntentWithIntent(v6);

    id v11 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      id v12 = v11;
      id v13 = [v10 typeName];
      *(_DWORD *)buf = 136315394;
      id v22 = "-[INIntentDeliverer confirmIntent:withCompletion:]";
      __int16 v23 = 2112;
      uint64_t v24 = v13;
      _os_log_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_INFO, "%s confirmIntent %@", buf, 0x16u);
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke_84;
    v15[3] = &unk_1E551DC30;
    id v6 = v10;
    id v17 = self;
    id v18 = v9;
    id v16 = v6;
    id v14 = v9;
    [(INIntentDeliverer *)self _deliverIntent:v6 withBlock:v15];
  }
}

void __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = INSiriLogContextIntents;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_error_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_ERROR, "%s Returning confirm response with error %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_18CB2F000, v13, OS_LOG_TYPE_INFO, "%s Returning confirm response %@", (uint8_t *)&v14, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__INIntentDeliverer_confirmIntent_withCompletion___block_invoke_84(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _intentInstanceDescription];
    uint64_t v5 = [v4 confirmSelector];
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [v3 methodForSelector:v6];
        if (v7)
        {
          id v8 = (void (*)(id, uint64_t, uint64_t, void *))v7;
          uint64_t v9 = *(void *)(a1 + 32);
          id v10 = [*(id *)(a1 + 40) _processIntentResponseCompletionHandlerWithIntent:v9 completion:*(void *)(a1 + 48)];
          v8(v3, v6, v9, v10);

          goto LABEL_15;
        }
        id v12 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = *(void *)(a1 + 32);
          int v18 = 136315394;
          uint64_t v19 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
          __int16 v20 = 2112;
          uint64_t v21 = v17;
          _os_log_error_impl(&dword_18CB2F000, v12, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of confirmation method for handling intent %@", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    if ([*(id *)(a1 + 32) _type] == 2)
    {
      id v13 = [[INIntentResponse alloc] _initWithCode:1 userActivity:0];
    }
    else
    {
      int v14 = [v4 responseName];
      uint64_t v15 = INIntentSchemaGetIntentResponseDescriptionWithName(v14);

      id v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v15, "facadeClass")), "_initWithCode:userActivity:", 1, 0);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v18 = 136315394;
      uint64_t v19 = "-[INIntentDeliverer confirmIntent:withCompletion:]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v16;
      _os_log_error_impl(&dword_18CB2F000, v11, OS_LOG_TYPE_ERROR, "%s No handler for intent %@ provided by extension", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"IntentsErrorDomain" code:2003 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
LABEL_15:
}

- (void)resolveIntentParameter:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = a3;
    uint64_t v11 = INTypedIntentWithIntent(v8);

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__INIntentDeliverer_resolveIntentParameter_forIntent_completionBlock___block_invoke;
    v12[3] = &unk_1E551DC00;
    id v13 = v9;
    [(INIntentDeliverer *)self _resolveIntentParameter:v10 forIntent:v11 intentHandler:0 updateIntent:0 withCompletion:v12];

    id v8 = (id)v11;
  }
}

void __70__INIntentDeliverer_resolveIntentParameter_forIntent_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[INIntentDeliverer resolveIntentParameter:forIntent:completionBlock:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_18CB2F000, v4, OS_LOG_TYPE_INFO, "%s Returning parameter resolution result %@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [v3 data];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)resolveIntentParameters:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  id v19 = a4;
  id v7 = a5;
  if (v7)
  {
    id v18 = v7;
    id v8 = INTypedIntentWithIntent(v19);
    uint64_t v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    queue = dispatch_queue_create("INCExtensionContextBatchSlotResolutionQueue", v17);
    __int16 v9 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    char v41 = 1;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x3032000000;
    v38[3] = __Block_byref_object_copy__100459;
    v38[4] = __Block_byref_object_dispose__100460;
    id v39 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v20;
    uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v35;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * v12);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke;
          block[3] = &unk_1E551DBB0;
          id v32 = v40;
          block[4] = self;
          void block[5] = v13;
          id v30 = v8;
          uint64_t v33 = v38;
          id v31 = v9;
          dispatch_async(queue, block);

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v10);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_3;
    v24[3] = &unk_1E551DBD8;
    int v14 = v8;
    id v25 = v8;
    id v26 = v9;
    id v27 = v18;
    __int16 v28 = v40;
    id v15 = v9;
    id v16 = v14;
    dispatch_async(queue, v24);

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);

    id v7 = v18;
  }
}

void __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_2;
    v10[3] = &unk_1E551DB88;
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    long long v14 = *(_OWORD *)(a1 + 64);
    dispatch_semaphore_t v13 = v2;
    __int16 v9 = v2;
    [v3 _resolveIntentParameter:v4 forIntent:v6 intentHandler:v5 updateIntent:1 withCompletion:v10];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = INIntentWithTypedIntent(*(void **)(a1 + 32));
  id v3 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = v3;
    uint64_t v6 = [v2 typeName];
    int v10 = 136315650;
    id v11 = "-[INIntentDeliverer resolveIntentParameters:forIntent:completionBlock:]_block_invoke_3";
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_18CB2F000, v5, OS_LOG_TYPE_INFO, "%s Returning slot resolution results %@ with updated intent %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  __int16 v9 = (void *)[*(id *)(a1 + 40) copy];
  (*(void (**)(uint64_t, uint64_t, void *, void *))(v7 + 16))(v7, v8, v2, v9);
}

void __71__INIntentDeliverer_resolveIntentParameters_forIntent_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v11;
  id v7 = v5;
  if (v11)
  {
    [*(id *)(a1 + 32) setObject:v11 forKey:*(void *)(a1 + 40)];
    uint64_t v6 = v11;
  }
  if ([v6 result] == 1) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
  __int16 v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  id v10 = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)getIntentParameterDefaultValue:(id)a3 forIntent:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke;
    v12[3] = &unk_1E551DB38;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke_76;
    v10[3] = &unk_1E551DB60;
    id v11 = v14;
    [(INIntentDeliverer *)self _invokeIntentHandlerMethodForIntent:a4 intentHandler:0 parameterNamed:v13 keyForSelectors:@"defaultValueSelectorStrings" executionHandler:v12 unimplementedHandler:v10];
  }
}

BOOL __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = (void (*)(id, uint64_t, id))[v9 methodForSelector:a3];
  if (v12)
  {
    id v13 = v12(v9, a3, v10);
    [*(id *)(a1 + 32) _processDefaultValue:v13 forIntent:v10 parameterNamed:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    id v14 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v14;
      uint64_t v17 = [v11 facadePropertyName];
      int v18 = 136315650;
      id v19 = "-[INIntentDeliverer getIntentParameterDefaultValue:forIntent:completionBlock:]_block_invoke";
      __int16 v20 = 2114;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_error_impl(&dword_18CB2F000, v16, OS_LOG_TYPE_ERROR, "%s Unable to find implementation of default value method for facade slot name %{public}@ on intent %@", (uint8_t *)&v18, 0x20u);
    }
  }

  return v12 != 0;
}

void __78__INIntentDeliverer_getIntentParameterDefaultValue_forIntent_completionBlock___block_invoke_76(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"_INExtensionContextErrorDomain" code:1003 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (void)getIntentParameterOptions:(id)a3 forIntent:(id)a4 searchTerm:(id)a5 completionBlock:(id)a6
{
  if (a6)
  {
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    id v13 = [(INIntentDeliverer *)self _processOptionsForIntent:v11 parameterNamed:v12 completionHandler:a6];
    [(INIntentDeliverer *)self getParameterOptionsForParameterNamed:v12 intent:v11 searchTerm:v10 completionBlock:v13];
  }
}

- (INIntentDeliverer)initWithQueue:(id)a3 auditToken:(id *)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INIntentDeliverer;
  id v8 = [(INIntentDeliverer *)&v12 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    long long v10 = *(_OWORD *)a4->var0;
    *(_OWORD *)&v9->_auditToken.val[4] = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)v9->_auditToken.val = v10;
  }

  return v9;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

@end