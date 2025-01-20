@interface FedStatsPluginUserProofingConsentChecker
- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4;
@end

@implementation FedStatsPluginUserProofingConsentChecker

- (id)checkConsentForClientIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([&unk_2700127C8 containsObject:v5])
  {
    v6 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[FedStatsPluginUserProofingConsentChecker checkConsentForClientIdentifier:error:](v6);
    }

    id v7 = objc_alloc_init(MEMORY[0x263F36650]);
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    id v27 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __82__FedStatsPluginUserProofingConsentChecker_checkConsentForClientIdentifier_error___block_invoke;
    v18 = &unk_2653123F0;
    v20 = &v22;
    v21 = &v28;
    v9 = v8;
    v19 = v9;
    [v7 fetchUserConsent:&v15];
    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v9, v10))
    {
      v11 = objc_msgSend(NSString, "stringWithFormat:", @"User consent check failed after %u seconds", 15, v15, v16, v17, v18);
      if (a4)
      {
        *a4 = +[FedStatsPluginError errorWithCode:300 description:v11];
      }

      id v12 = 0;
    }
    else
    {
      v13 = (void *)v29[5];
      if (a4 && !v13)
      {
        *a4 = +[FedStatsPluginError errorWithCode:300 underlyingError:v23[5] description:@"Cannot access CoreIDVUI consent manager"];
        v13 = (void *)v29[5];
      }
      id v12 = v13;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    id v12 = (id)MEMORY[0x263EFFA88];
  }

  return v12;
}

intptr_t __82__FedStatsPluginUserProofingConsentChecker_checkConsentForClientIdentifier_error___block_invoke(void *a1, uint64_t a2, void *a3)
{
  if (a3)
  {
    uint64_t v4 = [a3 copy];
    uint64_t v5 = a1[5];
  }
  else
  {
    uint64_t v4 = [NSNumber numberWithBool:a2 == 0];
    uint64_t v5 = a1[6];
  }
  uint64_t v6 = *(void *)(v5 + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v4;

  dispatch_semaphore_t v8 = a1[4];
  return dispatch_semaphore_signal(v8);
}

- (void)checkConsentForClientIdentifier:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24DF73000, log, OS_LOG_TYPE_DEBUG, "Performing user consent for Mead data access", v1, 2u);
}

@end