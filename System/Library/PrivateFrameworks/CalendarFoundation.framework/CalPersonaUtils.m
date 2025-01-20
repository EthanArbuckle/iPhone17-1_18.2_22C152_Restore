@interface CalPersonaUtils
+ (BOOL)performBlockAsPersonaWithIdentifier:(id)a3 block:(id)a4;
+ (id)personalPersonaIdentifier;
@end

@implementation CalPersonaUtils

+ (id)personalPersonaIdentifier
{
  if (canFetchPersonas_onceToken != -1) {
    dispatch_once(&canFetchPersonas_onceToken, &__block_literal_global_13);
  }
  if (canFetchPersonas_canFetchPersonas)
  {
    uint64_t v10 = 0;
    v11 = (id *)&v10;
    uint64_t v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__3;
    v14 = __Block_byref_object_dispose__3;
    id v15 = 0;
    os_unfair_lock_lock((os_unfair_lock_t)&personalPersonaIdentifier_lock);
    if (personalPersonaIdentifier_personalPersonaIdentifier)
    {
      objc_storeStrong(v11 + 5, (id)personalPersonaIdentifier_personalPersonaIdentifier);
      os_unfair_lock_unlock((os_unfair_lock_t)&personalPersonaIdentifier_lock);
    }
    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&personalPersonaIdentifier_lock);
      dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
      v4 = [MEMORY[0x1E4FB36F8] sharedManager];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __44__CalPersonaUtils_personalPersonaIdentifier__block_invoke;
      v7[3] = &unk_1E56CDC88;
      v9 = &v10;
      v5 = v3;
      v8 = v5;
      [v4 fetchPersonaWithType:0 CompletionHandler:v7];

      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    }
    id v2 = v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

void __44__CalPersonaUtils_personalPersonaIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4FB3738]];
  v7 = +[CalFoundationLogSubsystem defaultCategory];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_190D88000, v8, OS_LOG_TYPE_INFO, "Fetched personal persona identifier %{public}@", (uint8_t *)&v9, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&personalPersonaIdentifier_lock);
    objc_storeStrong((id *)&personalPersonaIdentifier_personalPersonaIdentifier, v6);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)&personalPersonaIdentifier_lock);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__CalPersonaUtils_personalPersonaIdentifier__block_invoke_cold_1((uint64_t)v5, v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)performBlockAsPersonaWithIdentifier:(id)a3 block:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, NSObject *))a4;
  v7 = [MEMORY[0x1E4FB36F8] sharedManager];
  v8 = [v7 currentPersona];

  id v35 = 0;
  int v9 = (void *)[v8 copyCurrentPersonaContextWithError:&v35];
  id v10 = v35;
  if (v9)
  {
    uint64_t v11 = [v8 generateAndRestorePersonaContextWithPersonaUniqueString:v5];

    uint64_t v12 = [MEMORY[0x1E4FB36F8] sharedManager];
    v13 = [v12 currentPersona];

    BOOL v14 = v11 == 0;
    id v15 = +[CalFoundationLogSubsystem defaultCategory];
    v16 = v15;
    if (v11)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:]();
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "isEnterprisePersona"));
      *(_DWORD *)buf = 138543874;
      id v37 = v5;
      __int16 v38 = 2114;
      id v39 = v17;
      __int16 v40 = 2112;
      v41 = v13;
      _os_log_impl(&dword_190D88000, v16, OS_LOG_TYPE_INFO, "Generated and restored persona context with persona identifier = %{public}@, is current persona enterprise persona = %{public}@, current persona = %@", buf, 0x20u);
    }
    v18 = [v13 userPersonaUniqueString];
    char v19 = [v5 isEqualToString:v18];

    if ((v19 & 1) == 0)
    {
      v20 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:](v13, (uint64_t)v5, v20);
      }

      BOOL v14 = 0;
    }
    v6[2](v6, v13);
    id v10 = [v8 restorePersonaWithSavedPersonaContext:v9];

    if (v10)
    {
      v21 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = NSNumber;
        v33 = [MEMORY[0x1E4FB36F8] sharedManager];
        v31 = [v33 currentPersona];
        v29 = objc_msgSend(v22, "numberWithBool:", objc_msgSend(v31, "isEnterprisePersona"));
        v23 = [MEMORY[0x1E4FB36F8] sharedManager];
        v24 = [v23 currentPersona];
        *(_DWORD *)buf = 138544130;
        id v37 = v5;
        __int16 v38 = 2112;
        id v39 = v10;
        __int16 v40 = 2114;
        v41 = v29;
        __int16 v42 = 2112;
        v43 = v24;
        _os_log_error_impl(&dword_190D88000, v21, OS_LOG_TYPE_ERROR, "Error restoring saved persona context from persona identifier = %{public}@: %@. is current persona enterprise persona = %{public}@, current persona = %@", buf, 0x2Au);
      }
    }
    else
    {
      v21 = +[CalFoundationLogSubsystem defaultCategory];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v25 = NSNumber;
        v34 = [MEMORY[0x1E4FB36F8] sharedManager];
        v32 = [v34 currentPersona];
        v30 = objc_msgSend(v25, "numberWithBool:", objc_msgSend(v32, "isEnterprisePersona"));
        v26 = [MEMORY[0x1E4FB36F8] sharedManager];
        v27 = [v26 currentPersona];
        *(_DWORD *)buf = 138543874;
        id v37 = v5;
        __int16 v38 = 2114;
        id v39 = v30;
        __int16 v40 = 2112;
        v41 = v27;
        _os_log_impl(&dword_190D88000, v21, OS_LOG_TYPE_INFO, "Restored persona context from persona identifier = %{public}@, is current persona enterprise persona = %{public}@, current persona = %@", buf, 0x20u);
      }
    }
  }
  else
  {
    v13 = +[CalFoundationLogSubsystem defaultCategory];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[CalPersonaUtils performBlockAsPersonaWithIdentifier:block:]();
    }
    BOOL v14 = 0;
  }

  return v14;
}

void __44__CalPersonaUtils_personalPersonaIdentifier__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_190D88000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch personal persona identifier: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)performBlockAsPersonaWithIdentifier:block:.cold.1()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Could not get saved persona context. error = %@, current persona = %@");
}

+ (void)performBlockAsPersonaWithIdentifier:(NSObject *)a3 block:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 userPersonaUniqueString];
  int v6 = 138543618;
  v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_190D88000, a3, OS_LOG_TYPE_ERROR, "Current pesona identifier is %{public}@ after trying to switch to persona %{public}@", (uint8_t *)&v6, 0x16u);
}

+ (void)performBlockAsPersonaWithIdentifier:block:.cold.3()
{
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_190D88000, v0, v1, "Error generating and restoring persona context with persona identifier = %{public}@: %@");
}

@end