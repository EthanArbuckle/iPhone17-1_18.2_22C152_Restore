@interface SGMessageEventDissectorTrialClientWrapper
+ (id)sharedInstance;
- (SGMessageEventDissectorTrialClientWrapper)init;
- (id)eventClassifierModelPath;
- (id)eventClassifierThreshold;
- (id)eventExtractionAssetsPath;
- (id)messageProcessingLimit;
- (id)rateLimitInterval;
- (void)updateFactors;
@end

@implementation SGMessageEventDissectorTrialClientWrapper

- (void).cxx_destruct
{
}

- (id)rateLimitInterval
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2095;
  v10 = __Block_byref_object_dispose__2096;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__SGMessageEventDissectorTrialClientWrapper_rateLimitInterval__block_invoke;
  v6[3] = &unk_1E65B5958;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: rateLimitInterval: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __62__SGMessageEventDissectorTrialClientWrapper_rateLimitInterval__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)messageProcessingLimit
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2095;
  v10 = __Block_byref_object_dispose__2096;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__SGMessageEventDissectorTrialClientWrapper_messageProcessingLimit__block_invoke;
  v6[3] = &unk_1E65B5958;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: messageProcessingLimit: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __67__SGMessageEventDissectorTrialClientWrapper_messageProcessingLimit__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)eventClassifierThreshold
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2095;
  v10 = __Block_byref_object_dispose__2096;
  id v11 = 0;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierThreshold__block_invoke;
  v6[3] = &unk_1E65B5958;
  v6[4] = &buf;
  [(_PASLock *)lock runWithLockAcquired:v6];
  id v3 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  v4 = sgEventsLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_debug_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: eventClassifierThreshold: %@", (uint8_t *)&buf, 0xCu);
  }

  return v3;
}

void __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierThreshold__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)eventClassifierModelPath
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__2095;
  v16 = __Block_byref_object_dispose__2096;
  id v17 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierModelPath__block_invoke;
  v13[3] = &unk_1E65B5958;
  v13[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v13];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  if (!v3)
  {
    v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: trialEventClassifierModelPath is nil, bailing", buf, 2u);
    }
    goto LABEL_13;
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = 0;
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v12];
  if (v12) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  v7 = sgEventsLogHandle();
  uint64_t v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v11 = @"YES";
      if (!v12) {
        id v11 = @"NO";
      }
      *(_DWORD *)long long buf = 138478083;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: No assets found at trialEventClassifierModelPath: %{private}@ isDirectory: %@", buf, 0x16u);
    }

LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138477827;
    *(void *)&buf[4] = v3;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: EventClassifierModelPath loaded with Trial %{private}@", buf, 0xCu);
  }

  id v9 = v3;
LABEL_14:

  return v9;
}

void __69__SGMessageEventDissectorTrialClientWrapper_eventClassifierModelPath__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (id)eventExtractionAssetsPath
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v15 = __Block_byref_object_copy__2095;
  v16 = __Block_byref_object_dispose__2096;
  id v17 = 0;
  lock = self->_lock;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__SGMessageEventDissectorTrialClientWrapper_eventExtractionAssetsPath__block_invoke;
  v13[3] = &unk_1E65B5958;
  v13[4] = buf;
  [(_PASLock *)lock runWithLockAcquired:v13];
  id v3 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  if (!v3)
  {
    v4 = sgEventsLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v4, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: trialEventExtractionAssetsPath is nil, bailing", buf, 2u);
    }
    goto LABEL_13;
  }
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v12 = 0;
  int v5 = [v4 fileExistsAtPath:v3 isDirectory:&v12];
  if (v12) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  v7 = sgEventsLogHandle();
  uint64_t v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v11 = @"YES";
      if (!v12) {
        id v11 = @"NO";
      }
      *(_DWORD *)long long buf = 138478083;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v11;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: No assets found at trialEventExtractionAssetsPath: %{private}@ isDirectory: %@", buf, 0x16u);
    }

LABEL_13:
    id v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138477827;
    *(void *)&buf[4] = v3;
    _os_log_debug_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEBUG, "SGMessageEventDissectorTrialClientWrapper: EventExtractionAssetsPath loaded with Trial %{private}@", buf, 0xCu);
  }

  id v9 = v3;
LABEL_14:

  return v9;
}

void __70__SGMessageEventDissectorTrialClientWrapper_eventExtractionAssetsPath__block_invoke(uint64_t a1, uint64_t a2)
{
}

- (void)updateFactors
{
  lock = self->_lock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__SGMessageEventDissectorTrialClientWrapper_updateFactors__block_invoke;
  v3[3] = &unk_1E65B5930;
  v3[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v3];
}

void __58__SGMessageEventDissectorTrialClientWrapper_updateFactors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)v3[4];
  v3[4] = &unk_1F25356B8;

  int v5 = (void *)v3[5];
  void v3[5] = &unk_1F25356D0;

  int v6 = (void *)v3[3];
  v3[3] = &unk_1F2536648;

  v7 = sgEventsLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v48) = 0;
    _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating factors", (uint8_t *)&v48, 2u);
  }

  if ([*(id *)(a1 + 32) refreshEnrollmentInformationForNamespace:@"SMS_FILTER_INEN_CLASSIFICATION"] & 1) != 0|| (objc_msgSend(*(id *)(a1 + 32), "refreshRolloutIdentifiersForNamespace:", @"SMS_FILTER_INEN_CLASSIFICATION"))
  {
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"trialEventExtractionAssets" withNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION"];
    uint64_t v9 = [v8 directoryValue];
    if (v9
      && (v10 = (void *)v9,
          [v8 directoryValue],
          id v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v11 hasPath],
          v11,
          v10,
          v12))
    {
      v13 = sgEventsLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [v8 directoryValue];
        v15 = [v14 path];
        int v48 = 138477827;
        v49 = v15;
        _os_log_impl(&dword_1CA650000, v13, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialEventExtractionAssetsPath from trial: %{private}@", (uint8_t *)&v48, 0xCu);
      }
      v16 = [v8 directoryValue];
      uint64_t v17 = [v16 path];
      uint64_t v18 = (void *)v3[1];
      v3[1] = v17;
    }
    else
    {
      v16 = sgEventsLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v48) = 0;
        _os_log_error_impl(&dword_1CA650000, v16, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialEventExtractionAssetsPath", (uint8_t *)&v48, 2u);
      }
    }

    v19 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"trialEventClassifierModel" withNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION"];
    uint64_t v20 = [v19 directoryValue];
    if (v20
      && (v21 = (void *)v20,
          [v19 directoryValue],
          v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v22 hasPath],
          v22,
          v21,
          v23))
    {
      v24 = sgEventsLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = [v19 directoryValue];
        v26 = [v25 path];
        int v48 = 138477827;
        v49 = v26;
        _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialEventClassifierModelPath from trial: %{private}@", (uint8_t *)&v48, 0xCu);
      }
      v27 = [v19 directoryValue];
      uint64_t v28 = [v27 path];
      v29 = (void *)v3[2];
      v3[2] = v28;
    }
    else
    {
      v27 = sgEventsLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v48) = 0;
        _os_log_error_impl(&dword_1CA650000, v27, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialEventClassifierModelPath", (uint8_t *)&v48, 2u);
      }
    }

    v30 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"trialEventClassifierThreshold" withNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION"];
    v31 = sgEventsLogHandle();
    v32 = v31;
    if (v30)
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        [v30 doubleValue];
        int v48 = 134217984;
        v49 = v33;
        _os_log_impl(&dword_1CA650000, v32, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialEventClassifierThreshold from trial: %.02f", (uint8_t *)&v48, 0xCu);
      }

      v34 = NSNumber;
      [v30 doubleValue];
      uint64_t v35 = objc_msgSend(v34, "numberWithDouble:");
      v32 = v3[3];
      v3[3] = v35;
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1CA650000, v32, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialEventClassifierThreshold", (uint8_t *)&v48, 2u);
    }

    v36 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"trialEventExtractionMessageProcessingLimit" withNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION"];
    v37 = sgEventsLogHandle();
    v38 = v37;
    if (v36)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        [v36 doubleValue];
        int v48 = 134217984;
        v49 = v39;
        _os_log_impl(&dword_1CA650000, v38, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialMessageProcessingLimit from trial: %.02f", (uint8_t *)&v48, 0xCu);
      }

      v40 = NSNumber;
      [v36 doubleValue];
      uint64_t v41 = objc_msgSend(v40, "numberWithDouble:");
      v38 = v3[4];
      v3[4] = v41;
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1CA650000, v38, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialMessageProcessingLimit", (uint8_t *)&v48, 2u);
    }

    v42 = [*(id *)(*(void *)(a1 + 32) + 8) levelForFactor:@"trialEventExtractionRateLimitInterval" withNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION"];
    v43 = sgEventsLogHandle();
    v44 = v43;
    if (v42)
    {
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        [v42 doubleValue];
        int v48 = 134217984;
        v49 = v45;
        _os_log_impl(&dword_1CA650000, v44, OS_LOG_TYPE_DEFAULT, "SGMessageEventDissectorTrialClientWrapper: Updating trialRateLimitInterval from trial: %.02f", (uint8_t *)&v48, 0xCu);
      }

      v46 = NSNumber;
      [v42 doubleValue];
      uint64_t v47 = objc_msgSend(v46, "numberWithDouble:");
      v44 = v3[5];
      void v3[5] = v47;
    }
    else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1CA650000, v44, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: TRILevel is nil for trialRateLimitInterval", (uint8_t *)&v48, 2u);
    }
  }
  else
  {
    uint64_t v8 = sgEventsLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v48) = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "SGMessageEventDissectorTrialClientWrapper: No active Trial deployment found", (uint8_t *)&v48, 2u);
    }
  }
}

- (SGMessageEventDissectorTrialClientWrapper)init
{
  v13.receiver = self;
  v13.super_class = (Class)SGMessageEventDissectorTrialClientWrapper;
  v2 = [(SGTrialClientWrapper *)&v13 initWithClientIdentifier:245];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    [(SGMessageEventDissectorTrialClientWrapper *)v2 updateFactors];
    id location = 0;
    objc_initWeak(&location, v2);
    triClient = v2->super._triClient;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__SGMessageEventDissectorTrialClientWrapper_init__block_invoke;
    v10[3] = &unk_1E65B9F68;
    objc_copyWeak(&v11, &location);
    id v8 = (id)[(TRIClient *)triClient addUpdateHandlerForNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION" usingBlock:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __49__SGMessageEventDissectorTrialClientWrapper_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    v2 = [MEMORY[0x1E4FB0098] clientWithIdentifier:245];
    id v3 = [v2 levelForFactor:@"trialEventExtractionAssets" withNamespaceName:@"SMS_FILTER_INEN_CLASSIFICATION"];
    uint64_t v4 = [v3 directoryValue];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      int v6 = [v3 directoryValue];
      int v7 = [v6 hasPath];

      if (v7)
      {
        [v8[1] refresh];
        [v8 updateFactors];
      }
    }

    WeakRetained = v8;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2, &__block_literal_global_2152);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_2153;
  return v2;
}

void __59__SGMessageEventDissectorTrialClientWrapper_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_2153;
  sharedInstance__pasExprOnceResult_2153 = v1;
}

@end