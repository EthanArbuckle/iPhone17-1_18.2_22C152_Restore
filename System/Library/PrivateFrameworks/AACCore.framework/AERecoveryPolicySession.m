@interface AERecoveryPolicySession
- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 persistentDeactivations:(void *)a5 queue:;
- (void)deactivateWithCompletion:(id)a3;
- (void)deactivateWithRemainingPersistentDeactivations:(uint64_t)a3 currentEvent:(void *)a4 errors:(void *)a5 completion:;
@end

@implementation AERecoveryPolicySession

- (id)initWithPolicyStore:(void *)a3 performancePrimitives:(void *)a4 persistentDeactivations:(void *)a5 queue:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)AERecoveryPolicySession;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      uint64_t v14 = [v12 copy];
      id v15 = a1[1];
      a1[1] = (id)v14;

      objc_storeStrong(a1 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (void)deactivateWithCompletion:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self) {
    performancePrimitives = self->_performancePrimitives;
  }
  else {
    performancePrimitives = 0;
  }
  v6 = performancePrimitives;
  v7 = [(AEPerformancePrimitives *)v6 beginIntervalWithCategory:@"Totals" name:@"Deactivate Session"];

  if (self) {
    persistentDeactivations = self->_persistentDeactivations;
  }
  else {
    persistentDeactivations = 0;
  }
  v9 = persistentDeactivations;
  id v10 = [(NSArray *)v9 ae_map:&__block_literal_global_0];

  id v11 = AECoreLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    objc_super v17 = v10;
    _os_log_impl(&dword_23D508000, v11, OS_LOG_TYPE_DEFAULT, "Running recovering session with deactivations: %{public}@", buf, 0xCu);
  }

  if (self) {
    id v12 = self->_persistentDeactivations;
  }
  else {
    id v12 = 0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_5;
  v14[3] = &unk_264EA3948;
  v14[4] = v7;
  v14[5] = self;
  id v15 = v4;
  id v13 = v4;
  -[AERecoveryPolicySession deactivateWithRemainingPersistentDeactivations:currentEvent:errors:completion:]((uint64_t)self, v12, 0, MEMORY[0x263EFFA68], v14);
}

id __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = -[AEPersistentDeactivation deactivation](a2);
  v3 = [v2 identifier];

  return v3;
}

void __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  v23[2] = *MEMORY[0x263EF8340];
  id v3 = a2;
  [*(id *)(a1 + 32) endInterval];
  id v4 = v3;
  v5 = AECoreLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D508000, v5, OS_LOG_TYPE_DEFAULT, "Finished running recovery session", buf, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    v7 = *(void **)(v6 + 16);
  }
  else {
    v7 = 0;
  }
  char v8 = [v7 hasPersistentData];
  v9 = AECoreLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __50__AEActivePolicySession_deactivateWithCompletion___block_invoke_2_cold_1(v10);
    }
    id v11 = 0;
    id v12 = v4;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D508000, v10, OS_LOG_TYPE_DEFAULT, "No scratchpads are left after running deactivations. Cleaning up all state…", buf, 2u);
    }

    id v13 = *(void **)(a1 + 40);
    if (v13) {
      id v13 = (void *)v13[2];
    }
    id v20 = 0;
    uint64_t v14 = v13;
    char v15 = [v14 cleanUpPolicyStoreWithError:&v20];
    id v11 = v20;

    if (v15)
    {
      id v12 = v4;
      goto LABEL_19;
    }
    v16 = AECoreLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_5_cold_2(v11, v16);
    }

    id v12 = [v4 ae_adding:v11];
    id v10 = v4;
  }

LABEL_19:
  if ([v4 count])
  {
    uint64_t v17 = *MEMORY[0x263F083F0];
    v22[0] = AEPolicySessionFailedToDeactivateSubsystemsKey;
    v22[1] = v17;
    v23[0] = v12;
    v23[1] = v12;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v19 = AECoreErrorUserInfo(101, v18);
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)deactivateWithRemainingPersistentDeactivations:(uint64_t)a3 currentEvent:(void *)a4 errors:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    uint64_t v12 = [v9 count];
    if (a3 <= 5 && v12)
    {
      id v27 = 0;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke;
      v26[3] = &__block_descriptor_40_e34_B16__0__AEPersistentDeactivation_8l;
      v26[4] = a3;
      id v20 = objc_msgSend(v9, "ae_split:includeBlock:", &v27, v26);
      id v13 = v27;
      uint64_t v14 = [AEDeactivationPool alloc];
      char v15 = *(void **)(a1 + 16);
      v16 = *(void **)(a1 + 32);
      id v17 = *(id *)(a1 + 24);
      id v18 = v15;
      v19 = -[AEDeactivationPool initWithPolicyStore:performancePrimitives:persistentDeactivations:queue:]((id *)&v14->super.isa, v18, v17, v13, v16);

      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_2;
      v21[3] = &unk_264EA3AF0;
      v21[4] = a1;
      id v22 = v10;
      v23 = v20;
      uint64_t v25 = a3;
      id v24 = v11;
      -[AEDeactivationPool deactivateWithCompletion:]((uint64_t)v19, v21);
    }
    else
    {
      (*((void (**)(id, id))v11 + 2))(v11, v10);
    }
  }
}

BOOL __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = -[AEPersistentDeactivation deactivation](a2);
  BOOL v4 = [v3 event] == *(void *)(a1 + 32);

  return v4;
}

void __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(NSObject **)(v4 + 32);
  }
  else {
    v5 = 0;
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_3;
  v9[3] = &unk_264EA3AC8;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = v6;
  uint64_t v15 = *(void *)(a1 + 64);
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v5, v9);
}

void __105__AERecoveryPolicySession_deactivateWithRemainingPersistentDeactivations_currentEvent_errors_completion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "ae_addingItems:", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  -[AERecoveryPolicySession deactivateWithRemainingPersistentDeactivations:currentEvent:errors:completion:](*(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 72) + 1, v2, *(void *)(a1 + 64));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_performancePrimitives, 0);
  objc_storeStrong((id *)&self->_policyStore, 0);
  objc_storeStrong((id *)&self->_persistentDeactivations, 0);
}

void __52__AERecoveryPolicySession_deactivateWithCompletion___block_invoke_5_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = objc_msgSend(a1, "ae_verboseDescription");
  int v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_23D508000, a2, OS_LOG_TYPE_ERROR, "Failed to clean up policy store. Error: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end