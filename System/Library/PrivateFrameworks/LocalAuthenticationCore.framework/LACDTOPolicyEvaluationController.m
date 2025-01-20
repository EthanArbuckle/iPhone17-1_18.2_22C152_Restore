@interface LACDTOPolicyEvaluationController
- (BOOL)_checkDeviceHasBeenUnlockedSinceBoot;
- (BOOL)_verifyHasRequiredOptions:(id)a3 forPolicy:(int64_t)a4 error:(id *)a5;
- (BOOL)canProcessRequest:(id)a3;
- (LACDTOPolicyEvaluationController)initWithEnvironment:(id)a3 evaluationIdentifierFactory:(id)a4 device:(id)a5;
- (id)_errorCodesToFilterForOptions:(id)a3;
- (id)_mapResult:(id)a3 filterCodes:(id)a4;
- (id)_updateEvaluationOptions:(id)a3 environment:(id)a4;
- (void)_evaluateRequest:(id)a3 completion:(id)a4;
- (void)_evaluateRequest:(id)a3 environment:(id)a4 completion:(id)a5;
- (void)_forEachObserver:(id)a3;
- (void)_notifyObserversAboutEvaluation:(id)a3;
- (void)_notifyObserversAboutEvaluation:(id)a3 result:(id)a4;
- (void)addObserver:(id)a3;
- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5;
- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)removeObserver:(id)a3;
@end

@implementation LACDTOPolicyEvaluationController

- (LACDTOPolicyEvaluationController)initWithEnvironment:(id)a3 evaluationIdentifierFactory:(id)a4 device:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9) {
    -[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:]();
  }
  v12 = v11;
  v20.receiver = self;
  v20.super_class = (Class)LACDTOPolicyEvaluationController;
  v13 = [(LACDTOPolicyEvaluationController *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_environment, a3);
    uint64_t v15 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v14->_observers;
    v14->_observers = (NSHashTable *)v15;

    objc_storeStrong((id *)&v14->_device, a5);
    objc_storeStrong((id *)&v14->_evaluationIdentifierFactory, a4);
    uint64_t v17 = objc_opt_new();
    pendingRequests = v14->_pendingRequests;
    v14->_pendingRequests = (NSMutableDictionary *)v17;
  }
  return v14;
}

- (BOOL)canProcessRequest:(id)a3
{
  return 1;
}

- (void)processRequest:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__LACDTOPolicyEvaluationController_processRequest_configuration_completion___block_invoke;
  v13[3] = &unk_2653B6770;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  id v14 = v11;
  id v12 = v10;
  id v15 = v12;
  [(LACDTOPolicyEvaluationController *)self _evaluateRequest:v11 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__LACDTOPolicyEvaluationController_processRequest_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = (void *)*((void *)WeakRetained + 5);
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
    [v8 setObject:v10 forKeyedSubscript:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)postProcessRequest:(id)a3 result:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  pendingRequests = self->_pendingRequests;
  id v11 = NSNumber;
  id v12 = (void (**)(id, id))a5;
  v13 = objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v8, "identifier"));
  id v14 = [(NSMutableDictionary *)pendingRequests objectForKeyedSubscript:v13];

  if (v14)
  {
    id v15 = v9;
    id v16 = [v8 options];
    uint64_t v17 = [NSNumber numberWithInteger:1062];
    v18 = [v16 objectForKeyedSubscript:v17];

    if ([v18 BOOLValue])
    {
      v19 = [v8 options];
      objc_super v20 = [(LACDTOPolicyEvaluationController *)self _errorCodesToFilterForOptions:v19];

      uint64_t v21 = [(LACDTOPolicyEvaluationController *)self _mapResult:v15 filterCodes:v20];

      id v15 = (id)v21;
    }
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    v28 = __73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke;
    v29 = &unk_2653B6798;
    id v22 = v14;
    id v30 = v22;
    id v31 = v15;
    id v23 = v15;
    v24 = __73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke((uint64_t)&v26);
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:result:](self, "_notifyObserversAboutEvaluation:result:", v22, v24, v26, v27);

    v12[2](v12, v23);
    id v12 = (void (**)(id, id))v18;
  }
  else
  {
    v25 = LACLogDTOEvaluation();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[LACDTOPolicyEvaluationController postProcessRequest:result:completion:](v8, v25);
    }

    v12[2](v12, v9);
  }
}

LACDTOMutablePolicyEvaluationResult *__73__LACDTOPolicyEvaluationController_postProcessRequest_result_completion___block_invoke(uint64_t a1)
{
  v2 = [LACDTOMutablePolicyEvaluationResult alloc];
  v3 = [*(id *)(a1 + 32) identifier];
  v4 = [(LACDTOMutablePolicyEvaluationResult *)v2 initWithIdentifier:v3];

  id v5 = [*(id *)(a1 + 40) error];
  [(LACDTOMutablePolicyEvaluationResult *)v4 setError:v5];

  v6 = [*(id *)(a1 + 40) value];
  [(LACDTOMutablePolicyEvaluationResult *)v4 setResult:v6];

  return v4;
}

- (void)_evaluateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  uint64_t v8 = [v6 policy];
  id v9 = [v6 options];
  if (![(LACDTOPolicyEvaluationController *)self canProcessRequest:v6])
  {
    id v11 = +[LACEvaluationResult resultWithNext:v6];
    v7[2](v7, 0, v11);
    goto LABEL_9;
  }
  id v21 = 0;
  BOOL v10 = [(LACDTOPolicyEvaluationController *)self _verifyHasRequiredOptions:v9 forPolicy:v8 error:&v21];
  id v11 = v21;
  if (!v10)
  {
    v13 = +[LACEvaluationResult resultWithFailure:v11];
    v7[2](v7, 0, v13);
LABEL_8:

    goto LABEL_9;
  }
  if (![(LACDTOPolicyEvaluationController *)self _checkDeviceHasBeenUnlockedSinceBoot])
  {
    v13 = +[LACError errorWithCode:-1008 subcode:1 debugDescription:@"DTO policies are not available before first unlock"];
    id v14 = +[LACEvaluationResult resultWithFailure:v13];
    v7[2](v7, 0, v14);

    goto LABEL_8;
  }
  objc_initWeak(&location, self);
  environment = self->_environment;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__LACDTOPolicyEvaluationController__evaluateRequest_completion___block_invoke;
  v15[3] = &unk_2653B67C0;
  objc_copyWeak(&v19, &location);
  v18 = v7;
  id v16 = v6;
  id v17 = v9;
  [(LACDTOEnvironmentProviding *)environment fetchEnvironmentForPolicy:v8 options:v17 completion:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_9:
}

void __64__LACDTOPolicyEvaluationController__evaluateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      uint64_t v8 = +[LACEvaluationResult resultWithFailure:v5];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v9 = *(void **)(a1 + 32);
      BOOL v10 = [WeakRetained _updateEvaluationOptions:*(void *)(a1 + 40) environment:v11];
      [v9 updateOptions:v10];

      [v7 _evaluateRequest:*(void *)(a1 + 32) environment:v11 completion:*(void *)(a1 + 48)];
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (BOOL)_verifyHasRequiredOptions:(id)a3 forPolicy:(int64_t)a4 error:(id *)a5
{
  v47[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a4 == 1026
    && ([NSNumber numberWithInteger:1000],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:v8],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 BOOLValue],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    id v12 = (void *)MEMORY[0x263EFF9A0];
    v13 = [NSNumber numberWithInteger:1066];
    v46 = v13;
    v47[0] = objc_opt_class();
    id v14 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
    id v15 = [v12 dictionaryWithDictionary:v14];

    id v16 = [NSNumber numberWithInteger:1000];
    id v17 = [v7 objectForKeyedSubscript:v16];

    if (!v17 || ([v17 BOOLValue] & 1) == 0)
    {
      v18 = [NSNumber numberWithInteger:2];
      v44[0] = v18;
      v45[0] = objc_opt_class();
      id v19 = [NSNumber numberWithInteger:1064];
      v44[1] = v19;
      v45[1] = objc_opt_class();
      objc_super v20 = [NSNumber numberWithInteger:1063];
      v44[2] = v20;
      v45[2] = objc_opt_class();
      id v21 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
      [v15 addEntriesFromDictionary:v21];
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [v15 allKeys];
    uint64_t v22 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      v36 = a5;
      v37 = v17;
      uint64_t v24 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v27 = [v7 objectForKeyedSubscript:v26];
          if (!v27) {
            goto LABEL_17;
          }
          v28 = (void *)v27;
          v29 = [v7 objectForKeyedSubscript:v26];
          id v30 = [v15 objectForKeyedSubscript:v26];
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
LABEL_17:
            v32 = [v15 objectForKeyedSubscript:v26];
            v33 = NSStringFromClass(v32);

            v34 = [NSString stringWithFormat:@"Missing required option (%d) with type '%@'", objc_msgSend(v26, "integerValue"), v33];
            if (v36)
            {
              id *v36 = +[LACError errorWithCode:-1001 debugDescription:v34];
            }

            BOOL v11 = 0;
            id v17 = v37;
            goto LABEL_21;
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
        BOOL v11 = 1;
        id v17 = v37;
        if (v23) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
LABEL_21:
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (id)_updateEvaluationOptions:(id)a3 environment:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  uint64_t v8 = [v6 dictionaryWithDictionary:v7];
  id v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isDTOEnabled"));
  char v10 = [NSNumber numberWithInteger:1078];
  [v8 setObject:v9 forKeyedSubscript:v10];

  BOOL v11 = [NSNumber numberWithInteger:1037];
  id v12 = [v7 objectForKeyedSubscript:v11];

  if (!v12)
  {
    int v13 = [v5 isDTOEnabled];

    if (!v13) {
      goto LABEL_5;
    }
    BOOL v11 = +[LACLocalizationUtils encodeLocalizationKey:@"ENTER_PASSCODE" shouldUseDeviceVariant:1];
    id v12 = [NSNumber numberWithInteger:1037];
    [v8 setObject:v11 forKeyedSubscript:v12];
  }

LABEL_5:
  if (([v5 allowsAuthenticationFallbacks] & 1) == 0)
  {
    id v14 = [NSNumber numberWithInteger:1024];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v14];

    id v15 = [NSNumber numberWithInteger:1067];
    [v8 setObject:&unk_270431FC8 forKeyedSubscript:v15];
  }
  if (([v5 allowsGracePeriodUI] & 1) == 0)
  {
    id v16 = [NSNumber numberWithInteger:1073];
    [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v16];
  }
  id v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isGracePeriodActive"));
  v18 = [NSNumber numberWithInteger:1082];
  [v8 setObject:v17 forKeyedSubscript:v18];

  return v8;
}

- (void)_evaluateRequest:(id)a3 environment:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(id, void *, void *))a5;
  uint64_t v11 = [v8 policy];
  id v12 = [v8 options];
  int v13 = [v8 client];
  evaluationIdentifierFactory = self->_evaluationIdentifierFactory;
  id v15 = [NSNumber numberWithInteger:1066];
  id v16 = [v12 objectForKeyedSubscript:v15];
  id v17 = [(LACDTOPolicyEvaluationIdentifierFactory *)evaluationIdentifierFactory evaluationIdentifierForClient:v13 ratchetIdentifier:v16];

  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke;
  id v31 = &unk_2653B67E8;
  id v18 = v17;
  id v32 = v18;
  uint64_t v35 = v11;
  id v19 = v12;
  id v33 = v19;
  id v20 = v9;
  id v34 = v20;
  id v21 = __76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke(&v28);
  -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:](self, "_notifyObserversAboutEvaluation:", v21, v28, v29);
  uint64_t v22 = [v8 payload];
  uint64_t v23 = (void *)[v22 mutableCopy];
  uint64_t v24 = v23;
  if (v23) {
    id v25 = v23;
  }
  else {
    id v25 = (id)objc_opt_new();
  }
  uint64_t v26 = v25;

  [v26 setObject:v18 forKeyedSubscript:@"kLAEvaluationRequestPayloadKeyDTORequestIdentifier"];
  [v26 setObject:v20 forKeyedSubscript:@"kLAEvaluationRequestPayloadKeyDTOEnvironment"];
  [v8 updatePayload:v26];
  uint64_t v27 = +[LACEvaluationResult resultWithNext:v8];
  v10[2](v10, v21, v27);
}

LACDTOMutablePolicyEvaluationRequest *__76__LACDTOPolicyEvaluationController__evaluateRequest_environment_completion___block_invoke(void *a1)
{
  v2 = [[LACDTOMutablePolicyEvaluationRequest alloc] initWithIdentifier:a1[4]];
  [(LACDTOMutablePolicyEvaluationRequest *)v2 setPolicy:a1[7]];
  [(LACDTOMutablePolicyEvaluationRequest *)v2 setOptions:a1[5]];
  [(LACDTOMutablePolicyEvaluationRequest *)v2 setEnvironment:a1[6]];
  return v2;
}

- (void)_notifyObserversAboutEvaluation:(id)a3
{
  id v4 = a3;
  id v5 = LACLogDTOEvaluation();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:]((uint64_t)v4, v5);
  }

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation___block_invoke;
  v7[3] = &unk_2653B6810;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(LACDTOPolicyEvaluationController *)self _forEachObserver:v7];
}

uint64_t __68__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 policyController:*(void *)(a1 + 32) willStartPolicyEvaluation:*(void *)(a1 + 40)];
}

- (void)_notifyObserversAboutEvaluation:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = LACLogDTOEvaluation();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[LACDTOPolicyEvaluationController _notifyObserversAboutEvaluation:result:]((uint64_t)v7, v8);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __75__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation_result___block_invoke;
  v11[3] = &unk_2653B6838;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(LACDTOPolicyEvaluationController *)self _forEachObserver:v11];
}

uint64_t __75__LACDTOPolicyEvaluationController__notifyObserversAboutEvaluation_result___block_invoke(void *a1, void *a2)
{
  return [a2 policyController:a1[4] didFinishPolicyEvaluation:a1[5] result:a1[6]];
}

- (void)_forEachObserver:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)_mapResult:(id)a3 filterCodes:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 error];
    if (v8)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v9);
            }
            if (+[LACError error:hasCode:](LACError, "error:hasCode:", v8, objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "integerValue", (void)v17)))
            {
              uint64_t v15 = LACLogDTO();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v22 = self;
                __int16 v23 = 2112;
                uint64_t v24 = v8;
                _os_log_impl(&dword_254F14000, v15, OS_LOG_TYPE_DEFAULT, "%@ mapping error %@ to success", buf, 0x16u);
              }

              id v14 = +[LACEvaluationResult resultWithSuccess:MEMORY[0x263EFFA78]];

              goto LABEL_17;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
    id v14 = v6;
LABEL_17:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_errorCodesToFilterForOptions:(id)a3
{
  v12[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [NSNumber numberWithInteger:1062];
  id v6 = [v3 objectForKeyedSubscript:v5];

  if ([v6 BOOLValue])
  {
    id v7 = [NSNumber numberWithInteger:-1011];
    v12[0] = v7;
    uint64_t v8 = [NSNumber numberWithInteger:-5];
    v12[1] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    [v4 addObjectsFromArray:v9];
  }
  uint64_t v10 = [v4 allObjects];

  return v10;
}

- (BOOL)_checkDeviceHasBeenUnlockedSinceBoot
{
  return [(LACDTODeviceInfoProvider *)self->_device hasBeenUnlockedSinceBoot];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_evaluationIdentifierFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

- (void)initWithEnvironment:evaluationIdentifierFactory:device:.cold.1()
{
  __assert_rtn("-[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:]", "LACDTOPolicyEvaluationController.m", 31, "environment != nil");
}

- (void)postProcessRequest:(void *)a1 result:(NSObject *)a2 completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 identifier];
  _os_log_error_impl(&dword_254F14000, a2, OS_LOG_TYPE_ERROR, "No pending request for rid: %i", (uint8_t *)v3, 8u);
}

- (void)_notifyObserversAboutEvaluation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "Policy evaluation will start: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_notifyObserversAboutEvaluation:(uint64_t)a1 result:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_254F14000, a2, OS_LOG_TYPE_DEBUG, "Policy evaluation did finish: %@", (uint8_t *)&v2, 0xCu);
}

@end