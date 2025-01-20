@interface SGStructuredEventTrialClientWrapper
+ (id)sharedInstance;
- (BOOL)foundInMailNotifications;
- (SGStructuredEventTrialClientWrapper)init;
- (id)baseModelName;
- (id)engineConfig;
- (id)notificationsAllowListOverride;
- (id)structuredEventInputMapping;
- (id)structuredEventOutputMapping;
- (id)supportedProviders;
- (void)updateFactors;
@end

@implementation SGStructuredEventTrialClientWrapper

- (void).cxx_destruct
{
}

- (id)notificationsAllowListOverride
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if ([(SGStructuredEventTrialClientWrapper *)self foundInMailNotifications])
  {
    v4[0] = *MEMORY[0x1E4F5DC28];
    v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)foundInMailNotifications
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__SGStructuredEventTrialClientWrapper_foundInMailNotifications__block_invoke;
  v7[3] = &unk_1E65B8718;
  v7[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v7];
  int v3 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = @"NO";
    if (v3) {
      v6 = @"YES";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: foundInMailNotifications: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3 != 0;
}

uint64_t __63__SGStructuredEventTrialClientWrapper_foundInMailNotifications__block_invoke(uint64_t result, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(unsigned char *)(a2 + 40);
  return result;
}

- (id)structuredEventOutputMapping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__15404;
  v12 = __Block_byref_object_dispose__15405;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__SGStructuredEventTrialClientWrapper_structuredEventOutputMapping__block_invoke;
  v8[3] = &unk_1E65B8718;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: structuredEventOutputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __67__SGStructuredEventTrialClientWrapper_structuredEventOutputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)structuredEventInputMapping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__15404;
  v12 = __Block_byref_object_dispose__15405;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SGStructuredEventTrialClientWrapper_structuredEventInputMapping__block_invoke;
  v8[3] = &unk_1E65B8718;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: structuredEventInputMapping list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __66__SGStructuredEventTrialClientWrapper_structuredEventInputMapping__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)engineConfig
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__15404;
  v12 = __Block_byref_object_dispose__15405;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SGStructuredEventTrialClientWrapper_engineConfig__block_invoke;
  v8[3] = &unk_1E65B8718;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: engineConfig list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __51__SGStructuredEventTrialClientWrapper_engineConfig__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)supportedProviders
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__15404;
  v12 = __Block_byref_object_dispose__15405;
  id v13 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__SGStructuredEventTrialClientWrapper_supportedProviders__block_invoke;
  v8[3] = &unk_1E65B8718;
  v8[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v8];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [v3 count];
    v7 = @"YES";
    if (!v6) {
      v7 = @"NO";
    }
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGStructuredEventTrialClientWrapper: supportedProviders list loaded with Trial: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __57__SGStructuredEventTrialClientWrapper_supportedProviders__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)baseModelName
{
  return @"StructuredEventModel";
}

- (void)updateFactors
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E65B86F0;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "SGStructuredEventTrialClientWrapper: Updating factors", buf, 2u);
  }

  [*(id *)(a1 + 32) refreshEnrollmentInformationForNamespace:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  v5 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"StructuredEventModel.mlmodelc" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  uint64_t v6 = [v5 fileValue];
  if (v6
    && (v7 = (void *)v6,
        [v5 fileValue],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 hasPath],
        v8,
        v7,
        v9))
  {
    uint64_t v10 = [*(id *)(a1 + 32) modelPathForCurrentEnrollment];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v12 = [v11 fileExistsAtPath:v10];

      if ((v12 & 1) == 0)
      {
        v65 = *(void **)(a1 + 32);
        v26 = [v5 fileValue];
        v38 = [v26 path];
        [v65 uncompressModelAndUpdateFactors:v38 destinationPath:v10];
        goto LABEL_43;
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(NSObject **)(v13 + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke_41;
    block[3] = &unk_1E65BEF88;
    block[4] = v13;
    dispatch_async(v14, block);
  }
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"supportedProviders" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  uint64_t v15 = [v10 fileValue];
  if (v15)
  {
    v16 = (void *)v15;
    v17 = [v10 fileValue];
    int v18 = [v17 hasPath];

    if (v18)
    {
      v19 = (void *)MEMORY[0x1E4F93B50];
      v20 = [v10 fileValue];
      v21 = [v20 path];
      id v78 = 0;
      v22 = [v19 dictionaryWithPath:v21 error:&v78];
      id v23 = v78;

      if (v22)
      {
        id v24 = v22;
        v25 = *((void *)v3 + 1);
        *((void *)v3 + 1) = v24;
      }
      else
      {
        v25 = sgEventsLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v66 = [v10 fileValue];
          v67 = [v66 path];
          *(_DWORD *)long long buf = 138412546;
          v81 = v67;
          __int16 v82 = 2112;
          id v83 = v23;
          _os_log_error_impl(&dword_1CA650000, v25, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist for %@ : %@", buf, 0x16u);
        }
      }
    }
  }
  v26 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"engineConfig" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  uint64_t v27 = [v26 fileValue];
  if (v27)
  {
    v28 = (void *)v27;
    v29 = [v26 fileValue];
    int v30 = [v29 hasPath];

    if (v30)
    {
      v31 = (void *)MEMORY[0x1E4F93B50];
      v32 = [v26 fileValue];
      v33 = [v32 path];
      id v77 = 0;
      v34 = [v31 dictionaryWithPath:v33 error:&v77];
      id v35 = v77;

      if (v34)
      {
        id v36 = v34;
        v37 = *((void *)v3 + 2);
        *((void *)v3 + 2) = v36;
      }
      else
      {
        v37 = sgEventsLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v68 = [v26 fileValue];
          v69 = [v68 path];
          *(_DWORD *)long long buf = 138412546;
          v81 = v69;
          __int16 v82 = 2112;
          id v83 = v35;
          _os_log_error_impl(&dword_1CA650000, v37, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist for %@ : %@", buf, 0x16u);
        }
      }
    }
  }
  v38 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"structuredEventInputMapping" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  uint64_t v39 = [v38 fileValue];
  if (v39)
  {
    v40 = (void *)v39;
    v41 = [v38 fileValue];
    int v42 = [v41 hasPath];

    if (v42)
    {
      v43 = (void *)MEMORY[0x1E4F93B50];
      v44 = [v38 fileValue];
      v45 = [v44 path];
      id v76 = 0;
      v46 = [v43 dictionaryWithPath:v45 error:&v76];
      id v47 = v76;

      if (v46)
      {
        id v48 = v46;
        v49 = *((void *)v3 + 3);
        *((void *)v3 + 3) = v48;
      }
      else
      {
        v49 = sgEventsLogHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v74 = [v38 fileValue];
          v70 = [v74 path];
          *(_DWORD *)long long buf = 138412546;
          v81 = v70;
          __int16 v82 = 2112;
          id v83 = v47;
          _os_log_error_impl(&dword_1CA650000, v49, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist content for %@: %@", buf, 0x16u);
        }
      }
    }
  }
  v50 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"structuredEventOutputMapping" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  uint64_t v51 = [v50 fileValue];
  if (v51)
  {
    v52 = (void *)v51;
    v53 = [v50 fileValue];
    int v54 = [v53 hasPath];

    if (v54)
    {
      v73 = v5;
      v55 = (void *)MEMORY[0x1E4F93B50];
      v56 = [v50 fileValue];
      v57 = [v56 path];
      id v75 = 0;
      v58 = [v55 dictionaryWithPath:v57 error:&v75];
      id v59 = v75;

      if (v58)
      {
        id v60 = v58;
        v61 = *((void *)v3 + 4);
        *((void *)v3 + 4) = v60;
      }
      else
      {
        v61 = sgRemindersLogHandle();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          v72 = [v50 fileValue];
          v71 = [v72 path];
          *(_DWORD *)long long buf = 138412546;
          v81 = v71;
          __int16 v82 = 2112;
          id v83 = v59;
          _os_log_error_impl(&dword_1CA650000, v61, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: Unable to load plplist content for %@: %@", buf, 0x16u);
        }
      }

      v5 = v73;
    }
  }
  v62 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"foundInMailNotifications" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
  v63 = v62;
  if (v62)
  {
    *((unsigned char *)v3 + 40) = [v62 BOOLeanValue];
  }
  else
  {
    v64 = sgEventsLogHandle();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v64, OS_LOG_TYPE_ERROR, "SGStructuredEventTrialClientWrapper: TRILevel is nil for foundInMailNotifications", buf, 2u);
    }
  }
LABEL_43:
}

uint64_t __52__SGStructuredEventTrialClientWrapper_updateFactors__block_invoke_41(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanExperimentModelsFromTrialModelsFolder];
}

- (SGStructuredEventTrialClientWrapper)init
{
  v13.receiver = self;
  v13.super_class = (Class)SGStructuredEventTrialClientWrapper;
  v2 = [(SGTrialClientWrapper *)&v13 initWithClientIdentifier:106];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    [(SGStructuredEventTrialClientWrapper *)v2 updateFactors];
    id location = 0;
    objc_initWeak(&location, v2);
    triClient = v2->super._triClient;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__SGStructuredEventTrialClientWrapper_init__block_invoke;
    v10[3] = &unk_1E65B9F68;
    objc_copyWeak(&v11, &location);
    id v8 = (id)[(TRIClient *)triClient addUpdateHandlerForNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS" usingBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __43__SGStructuredEventTrialClientWrapper_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4FB0098] clientWithIdentifier:106];
    v2 = [v1 levelForFactor:@"StructuredEventModel.mlmodelc" withNamespaceName:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
    uint64_t v3 = [v2 fileValue];
    if (v3
      && (v4 = (void *)v3,
          [v2 fileValue],
          uint64_t v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 hasPath],
          v5,
          v4,
          v6))
    {
      v7 = [WeakRetained modelPathForTriClient:v1 andNamespace:@"PRODUCTIVITY_INTELLIGENCE_STRUCTURED_EVENTS"];
      if (v7)
      {
        id v8 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v9 = [v8 fileExistsAtPath:v7];

        if ((v9 & 1) == 0)
        {
          uint64_t v10 = [v2 fileValue];
          id v11 = [v10 path];
          [WeakRetained uncompressModelAndUpdateFactors:v11 destinationPath:v7];
        }
      }
    }
    else
    {
      [WeakRetained[1] refresh];
      [WeakRetained updateFactors];
    }
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_15450 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_15450, &__block_literal_global_15451);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_15452;
  return v2;
}

void __53__SGStructuredEventTrialClientWrapper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_15452;
  sharedInstance__pasExprOnceResult_15452 = v1;
}

@end