@interface CSFAvailability
+ (BOOL)supportsSecureCoding;
+ (id)_availabilityGivenUnavailabilityReasons:(int64_t)a3;
+ (id)_descriptionForUnavailabilityReasons:(int64_t)a3;
+ (id)currentAvailability;
+ (id)dispatchQueue;
+ (id)generateRequestID;
+ (int64_t)_syncUnavailabilityReasonsWithRequestID:(id)a3;
+ (void)_currentAvailabilityWithFeatureObject:(id)a3 completionHandler:(id)a4;
+ (void)_handleFeatureResponseWithFeatureObject:(id)a3 error:(id)a4 reasons:(int64_t)a5 shouldBypassEligibility:(BOOL)a6 requestID:(id)a7 completionHandler:(id)a8;
+ (void)currentAvailability;
+ (void)currentAvailabilityWithCompletionHandler:(id)a3;
- (BOOL)deviceHasEnoughStorage;
- (BOOL)shouldShowGM;
- (BOOL)unableToFetchAvailability;
- (CSFAvailability)initWithCoder:(id)a3;
- (CSFAvailability)initWithStatus:(int64_t)a3 withUnavailabilityReasons:(int64_t)a4;
- (id)description;
- (int64_t)status;
- (int64_t)unavailabiltyReasons;
- (void)encodeWithCoder:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUnavailabiltyReasons:(int64_t)a3;
@end

@implementation CSFAvailability

+ (id)dispatchQueue
{
  if (dispatchQueue_onceToken[0] != -1) {
    dispatch_once(dispatchQueue_onceToken, &__block_literal_global);
  }
  v2 = (void *)dispatchQueue_queue;
  return v2;
}

uint64_t __32__CSFAvailability_dispatchQueue__block_invoke()
{
  dispatchQueue_queue = (uint64_t)dispatch_queue_create("com.apple.csf.availability", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)generateRequestID
{
  v2 = objc_opt_new();
  v3 = [v2 UUIDString];
  v4 = [v3 substringToIndex:8];

  return v4;
}

+ (id)currentAvailability
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [a1 generateRequestID];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = 0;
  uint64_t v26 = [a1 _syncUnavailabilityReasonsWithRequestID:v3];
  v4 = dispatch_group_create();
  if (+[GMBypass gmEligibilityBypass])
  {
    v5 = _CSFGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v3;
      __int16 v29 = 2080;
      v30 = "+[CSFAvailability currentAvailability]";
      _os_log_impl(&dword_1A8C7F000, v5, OS_LOG_TYPE_DEFAULT, "[%@] %s Eligibility bypass is set to YES. Skipping ramp eligibility checks.", buf, 0x16u);
    }
  }
  else
  {
    v6 = _CSFGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v3;
      __int16 v29 = 2080;
      v30 = "+[CSFAvailability currentAvailability]";
      _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s Checking for device eligibility from feature cache.", buf, 0x16u);
    }

    v5 = +[CSFFeatureManager cachedFeatureObjectWithId:@"cloud.llm"];
    if (v5)
    {
      v7 = _CSFGetLogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v3;
        __int16 v29 = 2080;
        v30 = "+[CSFAvailability currentAvailability]";
        _os_log_impl(&dword_1A8C7F000, v7, OS_LOG_TYPE_DEFAULT, "[%@] %s Found feature in cache. Checking if user has been granted access.", buf, 0x16u);
      }

      if ([v5 canUse])
      {
        v8 = _CSFGetLogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v3;
          __int16 v29 = 2080;
          v30 = "+[CSFAvailability currentAvailability]";
          _os_log_impl(&dword_1A8C7F000, v8, OS_LOG_TYPE_DEFAULT, "[%@] %s User has been granted access.", buf, 0x16u);
        }
      }
      else
      {
        v10 = _CSFGetLogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v28 = v3;
          __int16 v29 = 2080;
          v30 = "+[CSFAvailability currentAvailability]";
          _os_log_impl(&dword_1A8C7F000, v10, OS_LOG_TYPE_DEFAULT, "[%@] %s User has not been granted access.", buf, 0x16u);
        }

        v24[3] |= 0x10uLL;
      }
    }
    else
    {
      v9 = _CSFGetLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v3;
        __int16 v29 = 2080;
        v30 = "+[CSFAvailability currentAvailability]";
        _os_log_impl(&dword_1A8C7F000, v9, OS_LOG_TYPE_DEFAULT, "[%@] %s Unable to fetch device availability as no cached feature object was found.", buf, 0x16u);
      }

      v24[3] |= 0x100uLL;
      +[CSFFeatureManager requestFeatureWithId:@"cloud.llm" completion:&__block_literal_global_7];
    }
    v11 = _CSFGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v3;
      __int16 v29 = 2080;
      v30 = "+[CSFAvailability currentAvailability]";
      _os_log_impl(&dword_1A8C7F000, v11, OS_LOG_TYPE_DEFAULT, "[%@] %s Getting device asset status.", buf, 0x16u);
    }

    dispatch_group_enter(v4);
    v12 = +[Assets shared];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __38__CSFAvailability_currentAvailability__block_invoke_9;
    v19[3] = &unk_1E5D5E668;
    id v20 = v3;
    v22 = &v23;
    v21 = v4;
    [v12 assetStatusWithCompletionHandler:v19];
  }
  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v4, v13))
  {
    v14 = _CSFGetLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[CSFAvailability currentAvailability]();
    }

    uint64_t v15 = v24[3] | 0x20;
    v24[3] = v15;
  }
  else
  {
    uint64_t v15 = v24[3];
  }
  v16 = [a1 _availabilityGivenUnavailabilityReasons:v15];
  v17 = _CSFGetLogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v28 = v3;
    __int16 v29 = 2080;
    v30 = "+[CSFAvailability currentAvailability]";
    __int16 v31 = 2114;
    v32 = v16;
    _os_log_impl(&dword_1A8C7F000, v17, OS_LOG_TYPE_DEFAULT, "[%@] %s Returning result: %{public}@", buf, 0x20u);
  }

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __38__CSFAvailability_currentAvailability__block_invoke_9(uint64_t a1, int a2, int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v6 = _CSFGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      v8 = @"YES";
    }
    else {
      v8 = @"NO";
    }
    uint64_t v11 = v7;
    __int16 v12 = 2080;
    dispatch_time_t v13 = "+[CSFAvailability currentAvailability]_block_invoke";
    if (a3) {
      v9 = @"YES";
    }
    else {
      v9 = @"NO";
    }
    __int16 v14 = 2114;
    uint64_t v15 = v8;
    __int16 v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s Received device asset status - assetsFinishedDownloading? %{public}@, hasEnoughStorage? %{public}@", (uint8_t *)&v10, 0x2Au);
  }

  if ((a2 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x20uLL;
  }
  if ((a3 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x40uLL;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (void)_currentAvailabilityWithFeatureObject:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 generateRequestID];
  v9 = _CSFGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v20 = v8;
    __int16 v21 = 2080;
    v22 = "+[CSFAvailability _currentAvailabilityWithFeatureObject:completionHandler:]";
    _os_log_impl(&dword_1A8C7F000, v9, OS_LOG_TYPE_DEFAULT, "[%@] %s request received.", buf, 0x16u);
  }

  int v10 = +[CSFAvailability dispatchQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__CSFAvailability__currentAvailabilityWithFeatureObject_completionHandler___block_invoke;
  v14[3] = &unk_1E5D5E6B8;
  id v17 = v7;
  id v18 = a1;
  id v15 = v8;
  id v16 = v6;
  id v11 = v6;
  id v12 = v7;
  id v13 = v8;
  dispatch_async(v10, v14);
}

void __75__CSFAvailability__currentAvailabilityWithFeatureObject_completionHandler___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v16 = [a1[7] _syncUnavailabilityReasonsWithRequestID:a1[4]];
  if (+[GMBypass gmEligibilityBypass])
  {
    v2 = _CSFGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v18 = v3;
      __int16 v19 = 2080;
      id v20 = "+[CSFAvailability _currentAvailabilityWithFeatureObject:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1A8C7F000, v2, OS_LOG_TYPE_DEFAULT, "[%@] %s Eligibility bypass is set to YES. Skipping ramp eligibility checks.", buf, 0x16u);
    }

    [a1[7] _handleFeatureResponseWithFeatureObject:0 error:0 reasons:v14[3] shouldBypassEligibility:1 requestID:a1[4] completionHandler:a1[6]];
  }
  else
  {
    v4 = _CSFGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = a1[4];
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2080;
      id v20 = "+[CSFAvailability _currentAvailabilityWithFeatureObject:completionHandler:]_block_invoke";
      _os_log_impl(&dword_1A8C7F000, v4, OS_LOG_TYPE_DEFAULT, "[%@] %s Getting device asset status.", buf, 0x16u);
    }

    id v6 = +[Assets shared];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__CSFAvailability__currentAvailabilityWithFeatureObject_completionHandler___block_invoke_18;
    v7[3] = &unk_1E5D5E690;
    id v8 = a1[4];
    id v11 = &v13;
    id v12 = a1[7];
    id v9 = a1[5];
    id v10 = a1[6];
    [v6 assetStatusWithCompletionHandler:v7];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __75__CSFAvailability__currentAvailabilityWithFeatureObject_completionHandler___block_invoke_18(uint64_t a1, int a2, int a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = _CSFGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v13 = 138413058;
    if (a2) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    uint64_t v14 = v7;
    __int16 v15 = 2080;
    if (a3) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    uint64_t v16 = "+[CSFAvailability _currentAvailabilityWithFeatureObject:completionHandler:]_block_invoke";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2114;
    id v20 = v9;
    _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s Received device asset status - assetsFinishedDownloading? %{public}@, hasEnoughStorage? %{public}@", (uint8_t *)&v13, 0x2Au);
  }

  if ((a2 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x20uLL;
  }
  if ((a3 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= 0x40uLL;
  }
  id v10 = _CSFGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v13 = 138412546;
    uint64_t v14 = v11;
    __int16 v15 = 2080;
    uint64_t v16 = "+[CSFAvailability _currentAvailabilityWithFeatureObject:completionHandler:]_block_invoke";
    _os_log_impl(&dword_1A8C7F000, v10, OS_LOG_TYPE_DEFAULT, "[%@] %s getting feature for availability check.", (uint8_t *)&v13, 0x16u);
  }

  return [*(id *)(a1 + 64) _handleFeatureResponseWithFeatureObject:*(void *)(a1 + 40) error:0 reasons:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) shouldBypassEligibility:0 requestID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 48)];
}

+ (void)currentAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 generateRequestID];
  id v6 = _CSFGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v15 = v5;
    __int16 v16 = 2080;
    __int16 v17 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]";
    _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s request received.", buf, 0x16u);
  }

  uint64_t v7 = +[CSFAvailability dispatchQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke;
  block[3] = &unk_1E5D5E730;
  id v12 = v4;
  id v13 = a1;
  id v11 = v5;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v16 = [*(id *)(a1 + 48) _syncUnavailabilityReasonsWithRequestID:*(void *)(a1 + 32)];
  if (+[GMBypass gmEligibilityBypass])
  {
    v2 = _CSFGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v3;
      __int16 v19 = 2080;
      id v20 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A8C7F000, v2, OS_LOG_TYPE_DEFAULT, "[%@] %s Eligibility bypass is set to YES. Skipping ramp eligibility checks.", buf, 0x16u);
    }

    [*(id *)(a1 + 48) _handleFeatureResponseWithFeatureObject:0 error:0 reasons:v14[3] shouldBypassEligibility:1 requestID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = _CSFGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v5;
      __int16 v19 = 2080;
      id v20 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1A8C7F000, v4, OS_LOG_TYPE_DEFAULT, "[%@] %s Getting device asset status.", buf, 0x16u);
    }

    id v6 = +[Assets shared];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_19;
    v8[3] = &unk_1E5D5E708;
    id v9 = *(id *)(a1 + 32);
    id v11 = &v13;
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    id v10 = v7;
    [v6 assetStatusWithCompletionHandler:v8];
  }
  _Block_object_dispose(&v13, 8);
}

void __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_19(uint64_t a1, int a2, int a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = _CSFGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    if (a2) {
      id v8 = @"YES";
    }
    else {
      id v8 = @"NO";
    }
    uint64_t v17 = v7;
    __int16 v18 = 2080;
    if (a3) {
      id v9 = @"YES";
    }
    else {
      id v9 = @"NO";
    }
    __int16 v19 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
    __int16 v20 = 2114;
    uint64_t v21 = v8;
    __int16 v22 = 2114;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "[%@] %s Received device asset status - assetsFinishedDownloading? %{public}@, hasEnoughStorage? %{public}@", buf, 0x2Au);
  }

  if ((a2 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x20uLL;
  }
  if ((a3 & 1) == 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= 0x40uLL;
  }
  id v10 = _CSFGetLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v17 = v11;
    __int16 v18 = 2080;
    __int16 v19 = "+[CSFAvailability currentAvailabilityWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1A8C7F000, v10, OS_LOG_TYPE_DEFAULT, "[%@] %s getting feature for availability check.", buf, 0x16u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_20;
  v12[3] = &unk_1E5D5E6E0;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  +[CSFFeatureManager requestFeatureWithId:@"cloud.llm" completion:v12];
}

uint64_t __60__CSFAvailability_currentAvailabilityWithCompletionHandler___block_invoke_20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 56) _handleFeatureResponseWithFeatureObject:a2 error:a3 reasons:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) shouldBypassEligibility:0 requestID:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

+ (void)_handleFeatureResponseWithFeatureObject:(id)a3 error:(id)a4 reasons:(int64_t)a5 shouldBypassEligibility:(BOOL)a6 requestID:(id)a7 completionHandler:(id)a8
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  uint64_t v17 = (void (**)(id, void *))a8;
  if (!a6)
  {
    if (v15)
    {
      __int16 v18 = _CSFGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[CSFAvailability _handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:]((uint64_t)v16, v15, v18);
      }
LABEL_5:
      uint64_t v19 = 256;
LABEL_6:

      a5 |= v19;
      goto LABEL_7;
    }
    if (!v14)
    {
      __int16 v18 = _CSFGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[CSFAvailability _handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:]();
      }
      goto LABEL_5;
    }
    if (([v14 canUse] & 1) == 0)
    {
      __int16 v18 = _CSFGetLogSystem();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        +[CSFAvailability _handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:]();
      }
      uint64_t v19 = 16;
      goto LABEL_6;
    }
  }
LABEL_7:
  __int16 v20 = [a1 _availabilityGivenUnavailabilityReasons:a5];
  uint64_t v21 = _CSFGetLogSystem();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412802;
    id v23 = v16;
    __int16 v24 = 2080;
    uint64_t v25 = "+[CSFAvailability _handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:]";
    __int16 v26 = 2114;
    v27 = v20;
    _os_log_impl(&dword_1A8C7F000, v21, OS_LOG_TYPE_DEFAULT, "[%@] %s Returning result: %{public}@", (uint8_t *)&v22, 0x20u);
  }

  v17[2](v17, v20);
}

+ (int64_t)_syncUnavailabilityReasonsWithRequestID:(id)a3
{
  id v3 = a3;
  id v4 = +[CSFEligibilityFetcher current];
  if ([v4 deviceEligibile])
  {
    int64_t v5 = 0;
  }
  else
  {
    id v6 = _CSFGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[CSFAvailability _syncUnavailabilityReasonsWithRequestID:].cold.4();
    }

    int64_t v5 = 1;
  }
  if (([v4 languageEligible] & 1) == 0)
  {
    uint64_t v7 = _CSFGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CSFAvailability _syncUnavailabilityReasonsWithRequestID:]();
    }

    v5 |= 2uLL;
  }
  if (([v4 regionEligible] & 1) == 0)
  {
    id v8 = _CSFGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[CSFAvailability _syncUnavailabilityReasonsWithRequestID:]();
    }

    v5 |= 4uLL;
  }
  id v9 = +[GMOptIn shared];
  char v10 = [v9 isOptedIn];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = _CSFGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[CSFAvailability _syncUnavailabilityReasonsWithRequestID:]();
    }

    v5 |= 0x80uLL;
  }

  return v5;
}

+ (id)_availabilityGivenUnavailabilityReasons:(int64_t)a3
{
  id v4 = [CSFAvailability alloc];
  if (a3)
  {
    uint64_t v5 = 2;
    int64_t v6 = a3;
  }
  else
  {
    uint64_t v5 = 0;
    int64_t v6 = 0;
  }
  uint64_t v7 = [(CSFAvailability *)v4 initWithStatus:v5 withUnavailabilityReasons:v6];
  return v7;
}

+ (id)_descriptionForUnavailabilityReasons:(int64_t)a3
{
  __int16 v3 = a3;
  id v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 addObject:@"deviceNotCapable"];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"selectedLanguageIneligible"];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v5 addObject:@"regionIneligible"];
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v5 addObject:@"accessNotGranted"];
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v5 addObject:@"assetIsNotReady"];
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v5 addObject:@"shortOfStorage"];
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v5 addObject:@"notOptedIn"];
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_21:
  [v5 addObject:@"unableToFetchAvailability"];
  if ((v3 & 0x200) != 0) {
LABEL_10:
  }
    [v5 addObject:@"unknown"];
LABEL_11:
  int64_t v6 = NSString;
  uint64_t v7 = [v5 componentsJoinedByString:@", "];
  id v8 = [v6 stringWithFormat:@"[%@]", v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  int64_t v6 = objc_msgSend(v4, "numberWithInteger:", -[CSFAvailability status](self, "status"));
  [v5 encodeObject:v6 forKey:@"status"];

  objc_msgSend(NSNumber, "numberWithInteger:", -[CSFAvailability unavailabiltyReasons](self, "unavailabiltyReasons"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"unavailabilityReasons"];
}

- (CSFAvailability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSFAvailability;
  id v5 = [(CSFAvailability *)&v9 init];
  if (v5)
  {
    int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    -[CSFAvailability setStatus:](v5, "setStatus:", [v6 integerValue]);
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unavailabilityReasons"];
    -[CSFAvailability setUnavailabiltyReasons:](v5, "setUnavailabiltyReasons:", [v7 integerValue]);
  }
  return v5;
}

- (CSFAvailability)initWithStatus:(int64_t)a3 withUnavailabilityReasons:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSFAvailability;
  result = [(CSFAvailability *)&v7 init];
  if (result)
  {
    result->_status = a3;
    result->_unavailabiltyReasons = a4;
  }
  return result;
}

- (id)description
{
  if ([(CSFAvailability *)self status])
  {
    if ([(CSFAvailability *)self status] == 1)
    {
      __int16 v3 = @"CSFAvailability: limited";
    }
    else
    {
      id v4 = NSString;
      id v5 = +[CSFAvailability _descriptionForUnavailabilityReasons:[(CSFAvailability *)self unavailabiltyReasons]];
      __int16 v3 = [v4 stringWithFormat:@"<CSFAvailability: unavailable - %@>", v5];
    }
  }
  else
  {
    __int16 v3 = @"CSFAvailability: available";
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)status
{
  return self->_status;
}

- (int64_t)unavailabiltyReasons
{
  return self->_unavailabiltyReasons;
}

- (BOOL)shouldShowGM
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[CSFGMFeatureFlags anyFeatureEnabled])
  {
    if (![(CSFAvailability *)self status])
    {
      __int16 v3 = _CSFGetLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v8) = 0;
        _os_log_impl(&dword_1A8C7F000, v3, OS_LOG_TYPE_DEFAULT, "Availability status is available. Should show GM.", (uint8_t *)&v8, 2u);
      }
      goto LABEL_15;
    }
    if (([(CSFAvailability *)self unavailabiltyReasons] & 1) == 0
      && ([(CSFAvailability *)self unavailabiltyReasons] & 2) == 0
      && ([(CSFAvailability *)self unavailabiltyReasons] & 4) == 0)
    {
      __int16 v3 = _CSFGetLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = +[CSFAvailability _descriptionForUnavailabilityReasons:[(CSFAvailability *)self unavailabiltyReasons]];
        int v8 = 138412290;
        objc_super v9 = v4;
        _os_log_impl(&dword_1A8C7F000, v3, OS_LOG_TYPE_DEFAULT, "Availability status is unavailable but device is HW/Locale/Region eligible. Should show GM. Unavailability reasons: %@", (uint8_t *)&v8, 0xCu);
      }
LABEL_15:
      BOOL v6 = 1;
      goto LABEL_16;
    }
    __int16 v3 = _CSFGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = +[CSFAvailability _descriptionForUnavailabilityReasons:[(CSFAvailability *)self unavailabiltyReasons]];
      int v8 = 138412290;
      objc_super v9 = v5;
      _os_log_impl(&dword_1A8C7F000, v3, OS_LOG_TYPE_DEFAULT, "Should not display GM as device is not HW/Locale/Region eligible. Unavailability reasons: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    __int16 v3 = _CSFGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1A8C7F000, v3, OS_LOG_TYPE_DEFAULT, "No GM feature flags enabled. Should not show GM.", (uint8_t *)&v8, 2u);
    }
  }
  BOOL v6 = 0;
LABEL_16:

  return v6;
}

- (BOOL)deviceHasEnoughStorage
{
  return ([(CSFAvailability *)self unavailabiltyReasons] & 0x40) == 0;
}

- (BOOL)unableToFetchAvailability
{
  return ((unint64_t)[(CSFAvailability *)self unavailabiltyReasons] >> 8) & 1;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setUnavailabiltyReasons:(int64_t)a3
{
  self->_unavailabiltyReasons = a3;
}

+ (void)currentAvailability
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  v2 = "+[CSFAvailability currentAvailability]";
  _os_log_error_impl(&dword_1A8C7F000, v0, OS_LOG_TYPE_ERROR, "[%@] %s Asset status request timed out! Assuming assets not yet ready", v1, 0x16u);
}

+ (void)_handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  v2 = "+[CSFAvailability _handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:]";
  _os_log_error_impl(&dword_1A8C7F000, v0, OS_LOG_TYPE_ERROR, "[%@] %s Requested features but none were returned.", v1, 0x16u);
}

+ (void)_handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A8C7F000, v0, v1, "[%@] Server has not granted access.", v2, v3, v4, v5, v6);
}

+ (void)_handleFeatureResponseWithFeatureObject:(NSObject *)a3 error:reasons:shouldBypassEligibility:requestID:completionHandler:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2080;
  objc_super v9 = "+[CSFAvailability _handleFeatureResponseWithFeatureObject:error:reasons:shouldBypassEligibility:requestID:completionHandler:]";
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_error_impl(&dword_1A8C7F000, a3, OS_LOG_TYPE_ERROR, "[%@] %s Error requesting features: %@", (uint8_t *)&v6, 0x20u);
}

+ (void)_syncUnavailabilityReasonsWithRequestID:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A8C7F000, v0, v1, "[%@] User is not opted-in.", v2, v3, v4, v5, v6);
}

+ (void)_syncUnavailabilityReasonsWithRequestID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A8C7F000, v0, v1, "[%@] Region is ineligible.", v2, v3, v4, v5, v6);
}

+ (void)_syncUnavailabilityReasonsWithRequestID:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A8C7F000, v0, v1, "[%@] Language is ineligible.", v2, v3, v4, v5, v6);
}

+ (void)_syncUnavailabilityReasonsWithRequestID:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A8C7F000, v0, v1, "[%@] Hardware is ineligible.", v2, v3, v4, v5, v6);
}

@end