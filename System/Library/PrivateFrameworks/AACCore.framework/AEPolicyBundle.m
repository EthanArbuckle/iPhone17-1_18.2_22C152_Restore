@interface AEPolicyBundle
- (AEPolicyBundle)initWithPolicyStore:(id)a3 performancePrimitives:(id)a4 activations:(id)a5 queue:(id)a6;
- (id)activationErrorWithErrors:(uint64_t)a1;
- (id)recoverySession;
- (void)activateSessionWithCompletion:(id)a3;
- (void)recoverWithError:(void *)a3 deactivations:(void *)a4 finalCompletion:;
- (void)runWithRemainingActivations:(void *)a3 remainingDeactivations:(void *)a4 invalidationHandler:(uint64_t)a5 currentEvent:(void *)a6 completion:;
- (void)validateProducedPersistentDeactivations:(uint64_t)a3 currentEvent:;
@end

@implementation AEPolicyBundle

- (AEPolicyBundle)initWithPolicyStore:(id)a3 performancePrimitives:(id)a4 activations:(id)a5 queue:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AEPolicyBundle;
  v15 = [(AEPolicyBundle *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_policyStore, a3);
    objc_storeStrong((id *)&v16->_performancePrimitives, a4);
    uint64_t v17 = [v13 copy];
    activations = v16->_activations;
    v16->_activations = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_queue, a6);
  }

  return v16;
}

- (void)activateSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [AEInvalidationRouter alloc];
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7 = [(AEInvalidationRouter *)v5 initWithQueue:queue];
  [(AEInvalidationRouter *)v7 setRouterMode:0];
  if (self) {
    performancePrimitives = self->_performancePrimitives;
  }
  else {
    performancePrimitives = 0;
  }
  v9 = performancePrimitives;
  v10 = [(AEPerformancePrimitives *)v9 beginIntervalWithCategory:@"Totals" name:@"Activate Session"];

  if (self) {
    activations = self->_activations;
  }
  else {
    activations = 0;
  }
  id v12 = activations;
  id v13 = [(AEInvalidationRouter *)v7 invalidationHandler];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke;
  v15[3] = &unk_264EA3678;
  v15[4] = v10;
  v15[5] = self;
  v15[6] = v7;
  id v16 = v4;
  id v14 = v4;
  -[AEPolicyBundle runWithRemainingActivations:remainingDeactivations:invalidationHandler:currentEvent:completion:]((uint64_t)self, v12, MEMORY[0x263EFFA68], v13, 0, v15);
}

void __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) endInterval];
  if ([v9 count])
  {
    v10 = -[AEPolicyBundle activationErrorWithErrors:](*(void *)(a1 + 40), v9);
    -[AEPolicyBundle recoverWithError:deactivations:finalCompletion:](*(void *)(a1 + 40), v10, v8, *(void **)(a1 + 56));
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke_2;
    v14[3] = &unk_264EA3650;
    id v11 = *(void **)(a1 + 48);
    v14[4] = *(void *)(a1 + 40);
    id v15 = v8;
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 48);
    id v18 = v12;
    uint64_t v16 = v13;
    id v17 = v7;
    [v11 fetchCapturedErrorWithCompletion:v14];
  }
}

- (id)activationErrorWithErrors:(uint64_t)a1
{
  v9[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    uint64_t v2 = *MEMORY[0x263F083F0];
    v8[0] = AEPolicySessionFailedToActivateSubsystemsKey;
    v8[1] = v2;
    v9[0] = a2;
    v9[1] = a2;
    v3 = NSDictionary;
    id v4 = a2;
    v5 = [v3 dictionaryWithObjects:v9 forKeys:v8 count:2];

    v6 = AECoreErrorUserInfo(100, v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)recoverWithError:(void *)a3 deactivations:(void *)a4 finalCompletion:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    id v9 = a3;
    v10 = [AERecoveryPolicySession alloc];
    id v11 = *(void **)(a1 + 32);
    uint64_t v14 = a1 + 8;
    id v12 = *(void **)(a1 + 8);
    uint64_t v13 = *(void **)(v14 + 8);
    id v15 = v11;
    id v16 = v13;
    id v17 = -[AERecoveryPolicySession initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v10->super.isa, v16, v15, v9, v12);

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke;
    v18[3] = &unk_264EA3780;
    id v20 = v8;
    id v19 = v7;
    [v17 deactivateWithCompletion:v18];
  }
}

void __48__AEPolicyBundle_activateSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v20[0] = a2;
    id v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = a2;
    v6 = [v4 arrayWithObjects:v20 count:1];
    id v7 = -[AEPolicyBundle activationErrorWithErrors:](v3, v6);

    -[AEPolicyBundle recoverWithError:deactivations:finalCompletion:](*(void *)(a1 + 32), v7, *(void **)(a1 + 40), *(void **)(a1 + 64));
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      id v9 = *(void **)(v8 + 16);
    }
    else {
      id v9 = 0;
    }
    v10 = *(void **)(a1 + 32);
    if (v10) {
      v10 = (void *)v10[4];
    }
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    if (v13) {
      uint64_t v15 = *(void *)(v13 + 8);
    }
    else {
      uint64_t v15 = 0;
    }
    id v16 = v10;
    id v17 = v9;
    id v18 = 0;
    id v19 = +[AEActivePolicySession sessionWithPolicyStore:v17 performancePrimitives:v16 invalidationRouter:v11 activations:v12 persistentDeactivations:v14 queue:v15];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)runWithRemainingActivations:(void *)a3 remainingDeactivations:(void *)a4 invalidationHandler:(uint64_t)a5 currentEvent:(void *)a6 completion:
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = a6;
  if (a1)
  {
    if ([v11 count])
    {
      if (a5 >= 3)
      {
LABEL_8:
        v14[2](v14, v11, v12, MEMORY[0x263EFFA68]);
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v15 = [v12 count];
      if (a5 > 2 || !v15) {
        goto LABEL_8;
      }
    }
    v47[4] = a5;
    v48[0] = 0;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke;
    v47[3] = &__block_descriptor_40_e30_B16__0___AEPolicyActivation__8l;
    v34 = objc_msgSend(v11, "ae_split:includeBlock:", v48, v47);
    id v33 = v48[0];
    id v46 = 0;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_2;
    v45[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v45[4] = a5;
    v32 = objc_msgSend(v12, "ae_split:includeBlock:", &v46, v45);
    id v31 = v46;
    id v16 = [AEActivationPool alloc];
    v36 = v14;
    id v17 = v13;
    id v19 = *(void **)(a1 + 8);
    id v18 = *(void **)(a1 + 16);
    id v35 = v11;
    id v20 = v12;
    id v21 = *(id *)(a1 + 32);
    id v22 = v18;
    v23 = -[AEActivationPool initWithPolicyStore:performancePrimitives:invalidationHandler:activations:queue:]((id *)&v16->super.isa, v22, v21, v17, v33, v19);

    v24 = [AEDeactivationPool alloc];
    v26 = *(void **)(a1 + 8);
    v25 = *(void **)(a1 + 16);
    id v27 = *(id *)(a1 + 32);
    id v28 = v25;
    v29 = v26;
    id v12 = v20;
    id v11 = v35;
    v30 = -[AEDeactivationPool initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v24->super.isa, v28, v27, v31, v29);

    id v13 = v17;
    uint64_t v14 = v36;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_3;
    v37[3] = &unk_264EA3758;
    v37[4] = a1;
    uint64_t v44 = a5;
    id v38 = v12;
    v39 = v30;
    v40 = v32;
    v41 = v34;
    v42 = v36;
    id v43 = v13;
    -[AEActivationPool activateWithCompletion:](v23, v37);
  }
LABEL_9:
}

- (id)recoverySession
{
  uint64_t v2 = self;
  if (self) {
    self = (AEPolicyBundle *)self->_policyStore;
  }
  if ([(AEPolicyBundle *)self exists])
  {
    if (v2) {
      activations = v2->_activations;
    }
    else {
      activations = 0;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __33__AEPolicyBundle_recoverySession__block_invoke;
    v12[3] = &unk_264EA36A0;
    v12[4] = v2;
    id v4 = [(NSArray *)activations ae_map:v12];
    id v5 = [AERecoveryPolicySession alloc];
    if (v2)
    {
      v6 = v2->_policyStore;
      id v7 = v2->_performancePrimitives;
      queue = v2->_queue;
    }
    else
    {
      id v7 = 0;
      v6 = 0;
      queue = 0;
    }
    id v9 = -[AERecoveryPolicySession initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v5->super.isa, v6, v7, v4, queue);
  }
  else
  {
    v10 = AECoreLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D508000, v10, OS_LOG_TYPE_DEFAULT, "Policy store does not exist. Skipping recovery session.", buf, 2u);
    }

    id v9 = 0;
  }
  return v9;
}

id *__33__AEPolicyBundle_recoverySession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v4) {
    id v4 = (void *)v4[2];
  }
  id v5 = v4;
  v6 = [v3 identifier];
  id v7 = [v5 readOnlyScratchpadForIdentifier:v6];

  uint64_t v8 = AECoreLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v10 = [v3 identifier];
      int v19 = 138543362;
      id v20 = v10;
      _os_log_impl(&dword_23D508000, v8, OS_LOG_TYPE_DEFAULT, "Found scratchpad for identifier: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v8 = [v3 deactivationForScratchpad:v7];
    id v11 = AECoreLog();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        id v13 = [v3 identifier];
        int v19 = 138543362;
        id v20 = v13;
        _os_log_impl(&dword_23D508000, v11, OS_LOG_TYPE_DEFAULT, "Made deactivation for scratchpad with identifier: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v14 = [AEPersistentDeactivation alloc];
      id v11 = [v3 identifier];
      uint64_t v15 = -[AEPersistentDeactivation initWithScratchpadIdentifier:deactivation:]((id *)&v14->super.isa, v11, v8);
    }
    else
    {
      if (v12)
      {
        id v17 = [v3 identifier];
        int v19 = 138543362;
        id v20 = v17;
        _os_log_impl(&dword_23D508000, v11, OS_LOG_TYPE_DEFAULT, "Did not make a deactivation for activation with identifier: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      uint64_t v15 = 0;
    }
  }
  else
  {
    if (v9)
    {
      id v16 = [v3 identifier];
      int v19 = 138543362;
      id v20 = v16;
      _os_log_impl(&dword_23D508000, v8, OS_LOG_TYPE_DEFAULT, "Did not find scratchpad for identifier: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

BOOL __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 event] == *(void *)(a1 + 32);
}

BOOL __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = -[AEPersistentDeactivation deactivation](a2);
  BOOL v4 = [v3 event] == *(void *)(a1 + 32);

  return v4;
}

void __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  -[AEPolicyBundle validateProducedPersistentDeactivations:currentEvent:](*(void *)(a1 + 32), v5, *(void *)(a1 + 88));
  if ([v6 count])
  {
    id v7 = objc_msgSend(*(id *)(a1 + 40), "ae_addingItems:", v5);
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_4;
    v13[3] = &unk_264EA3730;
    uint64_t v8 = *(void *)(a1 + 48);
    v13[4] = *(void *)(a1 + 56);
    id v14 = v5;
    id v9 = *(id *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = v10;
    id v17 = v9;
    id v11 = *(id *)(a1 + 80);
    uint64_t v12 = *(void *)(a1 + 88);
    id v18 = v11;
    uint64_t v19 = v12;
    -[AEDeactivationPool deactivateWithCompletion:](v8, v13);
  }
}

- (void)validateProducedPersistentDeactivations:(uint64_t)a3 currentEvent:
{
  if (a1)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__AEPolicyBundle_validateProducedPersistentDeactivations_currentEvent___block_invoke;
    v6[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
    v6[4] = a3;
    BOOL v4 = objc_msgSend(a2, "ae_filter:", v6);
    if ([v4 count])
    {
      id v5 = [MEMORY[0x263F08690] currentHandler];
      [v5 handleFailureInMethod:sel_validateProducedPersistentDeactivations_currentEvent_, a1, @"AEPolicyBundle.m", 217, @"Produced deactivations that will not run: %@", v4 object file lineNumber description];
    }
  }
}

void __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "ae_addingItems:", *(void *)(a1 + 40));
  if ([v3 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 48);
    if (v5) {
      id v6 = *(NSObject **)(v5 + 8);
    }
    else {
      id v6 = 0;
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_5;
    void v9[3] = &unk_264EA3708;
    long long v10 = *(_OWORD *)(a1 + 48);
    id v11 = v4;
    id v7 = *(id *)(a1 + 72);
    uint64_t v8 = *(void *)(a1 + 80);
    id v12 = v7;
    uint64_t v14 = v8;
    id v13 = *(id *)(a1 + 64);
    dispatch_async(v6, v9);
  }
}

uint64_t __113__AEPolicyBundle_runWithRemainingActivations_remainingDeactivations_invalidationHandler_currentEvent_completion___block_invoke_5(void *a1)
{
  return -[AEPolicyBundle runWithRemainingActivations:remainingDeactivations:invalidationHandler:currentEvent:completion:](a1[4], a1[5], a1[6], a1[7], a1[9] + 1, a1[8]);
}

void __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = AECoreLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL __71__AEPolicyBundle_validateProducedPersistentDeactivations_currentEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = -[AEPersistentDeactivation deactivation](a2);
  BOOL v4 = [v3 event] <= *(void *)(a1 + 32);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_activations, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __65__AEPolicyBundle_recoverWithError_deactivations_finalCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D508000, a2, OS_LOG_TYPE_ERROR, "Failed to run deactivations during recovery session %{public}@", (uint8_t *)&v2, 0xCu);
}

@end