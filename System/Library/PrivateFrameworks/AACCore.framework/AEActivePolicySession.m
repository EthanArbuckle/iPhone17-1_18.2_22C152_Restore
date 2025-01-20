@interface AEActivePolicySession
+ (id)sessionWithPolicyStore:(id)a3 performancePrimitives:(id)a4 invalidationRouter:(id)a5 activations:(id)a6 persistentDeactivations:(id)a7 queue:(id)a8;
- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 invalidationRouter:(void *)a5 activations:(void *)a6 persistentDeactivations:(void *)a7 queue:;
- (id)invalidationHandler;
- (void)deactivateWithCompletion:(id)a3;
- (void)invalidationRouter:(id)a3 didReceiveInvalidationError:(id)a4;
- (void)runRemainingActivations:(void *)a3 remainingDeactivations:(uint64_t)a4 currentEvent:(void *)a5 errors:(void *)a6 completion:;
- (void)setInvalidationHandler:(id)a3;
- (void)validateProducedPersistentDeactivations:(uint64_t)a3 currentEvent:;
@end

@implementation AEActivePolicySession

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 invalidationRouter:(void *)a5 activations:(void *)a6 persistentDeactivations:(void *)a7 queue:
{
  id v25 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)AEActivePolicySession;
    v19 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v19;
    if (v19)
    {
      objc_storeStrong(v19 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a4);
      uint64_t v20 = [v16 copy];
      id v21 = a1[6];
      a1[6] = (id)v20;

      uint64_t v22 = [v17 copy];
      id v23 = a1[7];
      a1[7] = (id)v22;

      objc_storeStrong(a1 + 5, a7);
    }
  }

  return a1;
}

+ (id)sessionWithPolicyStore:(id)a3 performancePrimitives:(id)a4 invalidationRouter:(id)a5 activations:(id)a6 persistentDeactivations:(id)a7 queue:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = -[AEActivePolicySession initWithPolicyStore:performancePrimitives:invalidationRouter:activations:persistentDeactivations:queue:]((id *)[AEActivePolicySession alloc], v18, v17, v16, v15, v14, v13);

  [v16 setRouterDelegate:v19];
  return v19;
}

- (void)deactivateWithCompletion:(id)a3
{
  id v4 = a3;
  if (self)
  {
    [(AEInvalidationRouter *)self->_invalidationRouter setRouterMode:0];
    performancePrimitives = self->_performancePrimitives;
  }
  else
  {
    [0 setRouterMode:0];
    performancePrimitives = 0;
  }
  v6 = performancePrimitives;
  v7 = [(AEPerformancePrimitives *)v6 beginIntervalWithCategory:@"Totals" name:@"Deactivate Session"];

  if (self)
  {
    v8 = self->_activation;
    persistentDeactivations = self->_persistentDeactivations;
  }
  else
  {
    v8 = 0;
    persistentDeactivations = 0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__AEActivePolicySession_deactivateWithCompletion___block_invoke;
  v11[3] = &unk_264EA3948;
  v11[4] = self;
  v11[5] = v7;
  id v12 = v4;
  id v10 = v4;
  -[AEActivePolicySession runRemainingActivations:remainingDeactivations:currentEvent:errors:completion:]((uint64_t)self, v8, persistentDeactivations, 3, MEMORY[0x263EFFA68], v11);
}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    v6 = *(void **)(v5 + 32);
  }
  else {
    v6 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2;
  v9[3] = &unk_264EA3920;
  uint64_t v7 = *(void *)(a1 + 32);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v7;
  id v12 = *(id *)(a1 + 48);
  id v8 = v4;
  [v6 fetchCapturedErrorWithCompletion:v9];
}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) endInterval];
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = objc_msgSend(v4, "ae_adding:", v3);

    uint64_t v5 = (void *)v6;
  }
  uint64_t v7 = AECoreLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D508000, v7, OS_LOG_TYPE_DEFAULT, "Finished running deactivations", buf, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    v9 = *(void **)(v8 + 16);
  }
  else {
    v9 = 0;
  }
  char v10 = [v9 hasPersistentData];
  uint64_t v11 = AECoreLog();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_1(v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D508000, v12, OS_LOG_TYPE_DEFAULT, "No scratchpads are left after running deactivations. Cleaning up all state…", buf, 2u);
    }

    id v13 = *(void **)(a1 + 48);
    if (v13) {
      id v13 = (void *)v13[2];
    }
    id v21 = 0;
    id v14 = v13;
    char v15 = [v14 cleanUpPolicyStoreWithError:&v21];
    id v12 = v21;

    if ((v15 & 1) == 0)
    {
      id v16 = AECoreLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_2(v12);
      }

      uint64_t v17 = objc_msgSend(v5, "ae_adding:", v12);

      uint64_t v5 = (void *)v17;
    }
  }

  if ([v5 count])
  {
    uint64_t v18 = *MEMORY[0x263F083F0];
    v23[0] = AEPolicySessionFailedToDeactivateSubsystemsKey;
    v23[1] = v18;
    v24[0] = v5;
    v24[1] = v5;
    v19 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    uint64_t v20 = AECoreErrorUserInfo(101, v19);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)runRemainingActivations:(void *)a3 remainingDeactivations:(uint64_t)a4 currentEvent:(void *)a5 errors:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    if ([v11 count])
    {
      if (a4 >= 6)
      {
LABEL_8:
        v14[2](v14, v13);
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v15 = [v12 count];
      if (a4 > 5 || !v15) {
        goto LABEL_8;
      }
    }
    v46[4] = a4;
    v47[0] = 0;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke;
    v46[3] = &__block_descriptor_40_e30_B16__0___AEPolicyActivation__8l;
    v35 = objc_msgSend(v11, "ae_split:includeBlock:", v47, v46);
    id v36 = v11;
    id v34 = v47[0];
    id v45 = 0;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_2;
    v44[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v44[4] = a4;
    v33 = objc_msgSend(v12, "ae_split:includeBlock:", &v45, v44);
    id v32 = v45;
    id v16 = [AEActivationPool alloc];
    v37 = v13;
    id v17 = v12;
    uint64_t v18 = *(void **)(a1 + 16);
    v19 = *(void **)(a1 + 24);
    id v20 = *(id *)(a1 + 32);
    id v21 = v19;
    id v22 = v18;
    id v23 = [v20 invalidationHandler];
    v24 = -[AEActivationPool initWithPolicyStore:performancePrimitives:invalidationHandler:activations:queue:]((id *)&v16->super.isa, v22, v21, v23, v34, *(void **)(a1 + 40));

    id v25 = [AEDeactivationPool alloc];
    objc_super v26 = *(void **)(a1 + 16);
    v27 = *(void **)(a1 + 40);
    id v28 = *(id *)(a1 + 24);
    id v29 = v26;
    p_isa = (id *)&v25->super.isa;
    id v12 = v17;
    id v13 = v37;
    v31 = -[AEDeactivationPool initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:](p_isa, v29, v28, v32, v27);

    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_3;
    v38[3] = &unk_264EA39C0;
    uint64_t v43 = a4;
    v38[4] = a1;
    v38[5] = v31;
    id v39 = v37;
    v40 = v33;
    v41 = v35;
    v42 = v14;
    -[AEActivationPool activateWithCompletion:](v24, v38);

    id v11 = v36;
  }
LABEL_9:
}

BOOL __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 event] == *(void *)(a1 + 32);
}

BOOL __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = -[AEPersistentDeactivation deactivation](a2);
  BOOL v4 = [v3 event] == *(void *)(a1 + 32);

  return v4;
}

void __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  -[AEActivePolicySession validateProducedPersistentDeactivations:currentEvent:](*(void *)(a1 + 32), v5, *(void *)(a1 + 80));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_4;
  v13[3] = &unk_264EA3998;
  uint64_t v7 = *(void *)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  id v15 = v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 56);
  id v17 = v5;
  char v10 = *(void **)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v18 = v8;
  uint64_t v20 = v9;
  id v19 = v10;
  id v11 = v5;
  id v12 = v6;
  -[AEDeactivationPool deactivateWithCompletion:](v7, v13);
}

- (void)validateProducedPersistentDeactivations:(uint64_t)a3 currentEvent:
{
  if (a1)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __78__AEActivePolicySession_validateProducedPersistentDeactivations_currentEvent___block_invoke;
    v6[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v6[4] = a3;
    BOOL v4 = objc_msgSend(a2, "ae_filter:", v6);
    if ([v4 count])
    {
      id v5 = [MEMORY[0x263F08690] currentHandler];
      [v5 handleFailureInMethod:sel_validateProducedPersistentDeactivations_currentEvent_, a1, @"AEActivePolicySession.m", 190, @"Produced deactivations that will not run: %@", v4 object file lineNumber description];
    }
  }
}

void __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    id v5 = *(NSObject **)(v4 + 40);
  }
  else {
    id v5 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_5;
  block[3] = &unk_264EA3970;
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v3;
  id v6 = *(void **)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 56);
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 32);
  id v17 = v7;
  uint64_t v18 = v8;
  char v10 = *(void **)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v19 = *(void *)(a1 + 72);
  uint64_t v21 = v9;
  id v20 = v10;
  id v11 = v3;
  dispatch_async(v5, block);
}

void __103__AEActivePolicySession_runRemainingActivations_remainingDeactivations_currentEvent_errors_completion___block_invoke_5(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "ae_addingItems:", *(void *)(a1 + 40));
  objc_msgSend(v2, "ae_addingItems:", *(void *)(a1 + 48));
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  id v3 = objc_msgSend(*(id *)(a1 + 56), "ae_addingItems:", *(void *)(a1 + 64));
  -[AEActivePolicySession runRemainingActivations:remainingDeactivations:currentEvent:errors:completion:](*(void *)(a1 + 72), *(void *)(a1 + 80), v3, *(void *)(a1 + 96) + 1, v4, *(void *)(a1 + 88));
}

BOOL __78__AEActivePolicySession_validateProducedPersistentDeactivations_currentEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = -[AEPersistentDeactivation deactivation](a2);
  BOOL v4 = [v3 event] <= *(void *)(a1 + 32);

  return v4;
}

- (void)setInvalidationHandler:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x23ED033D0](a3, a2);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v4;

  BOOL v6 = self->_invalidationHandler != 0;
  invalidationRouter = self->_invalidationRouter;
  [(AEInvalidationRouter *)invalidationRouter setRouterMode:v6];
}

- (void)invalidationRouter:(id)a3 didReceiveInvalidationError:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(AEActivePolicySession *)self invalidationHandler];

  if (v6)
  {
    id v7 = AECoreLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[AEActivePolicySession invalidationRouter:didReceiveInvalidationError:](v5);
    }

    uint64_t v8 = [(AEActivePolicySession *)self invalidationHandler];
    ((void (**)(void, id))v8)[2](v8, v5);
  }
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentDeactivations, 0);
  objc_storeStrong((id *)&self->_activation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidationRouter, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23D508000, log, OS_LOG_TYPE_FAULT, "Some scratchpads were not removed meaning some deactivations failed. Will reattempt to recover on next launch.", v1, 2u);
}

void __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_2(void *a1)
{
  v1 = objc_msgSend(a1, "ae_verboseDescription");
  OUTLINED_FUNCTION_0(&dword_23D508000, v2, v3, "Failed to clean up policy store. Error: %{public}@", v4, v5, v6, v7, 2u);
}

- (void)invalidationRouter:(void *)a1 didReceiveInvalidationError:.cold.1(void *a1)
{
  v1 = objc_msgSend(a1, "ae_verboseDescription");
  OUTLINED_FUNCTION_0(&dword_23D508000, v2, v3, "Active policy session encountered plugin invalidation. Reporting issue. Error: %{public}@", v4, v5, v6, v7, 2u);
}

@end