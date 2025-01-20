@interface HDClientAuthorizationOracle
- (BOOL)clientHasAuthorizationForAllTypes;
- (BOOL)isAuthorizationStatusDeterminedForTypes:(id)a3 error:(id *)a4;
- (BOOL)isAuthorizedToReadObject:(id)a3 error:(id *)a4;
- (BOOL)performReadAuthorizationTransactionWithError:(id *)a3 handler:(id)a4;
- (HDClientAuthorizationOracle)init;
- (HDClientAuthorizationOracle)initWithSourceBundleIdentifier:(id)a3 entitlements:(id)a4 profile:(id)a5;
- (id)_unrestrictedAuthorizationForTypes:(uint64_t)a1;
- (id)additionalAuthorizationPredicateForObjectType:(id)a3 error:(id *)a4;
- (id)filteredObjectsForReadAuthorization:(id)a3 anchor:(id)a4 error:(id *)a5;
- (id)readAuthorizationStatusForType:(id)a3 error:(id *)a4;
- (id)readAuthorizationStatusesForTypes:(id)a3 error:(id *)a4;
- (uint64_t)_isAuthorizedToReadDataTypeForObject:(void *)a3 anchor:(void *)a4 authorizationStatus:;
- (void)authorizationStatusForType:(id)a3 completion:(id)a4;
- (void)beginAuthorizationRequestDelegateTransactionWithSessionIdentifier:(id)a3 clientProcess:(id)a4 completion:(id)a5;
- (void)createRecalibrateEstimatesRequestRecordForSampleType:(id)a3 sourceEntity:(id)a4 effectiveDate:(id)a5 handler:(id)a6;
- (void)endAuthorizationRequestDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4;
- (void)enqueueAuthorizationRequestToWriteTypes:(id)a3 readTypes:(id)a4 authorizationNeededHandler:(id)a5 requestCompletionHandler:(id)a6;
- (void)enqueueObjectAuthorizationRequestWithContext:(id)a3 sourceEntity:(id)a4 promptIfNeeded:(BOOL)a5 authorizationNeededHandler:(id)a6 completion:(id)a7;
- (void)handleAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 requestCompletionHandler:(id)a5;
- (void)handleAuthorizationRequestsWithPromptHandler:(id)a3 requestCompletionHandler:(id)a4;
- (void)handleObjectAuthorizationRequestsWithPromptHandler:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)performIfAuthorizedToDeleteObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6;
- (void)performIfAuthorizedToDeleteObjectsWithTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6;
- (void)performIfAuthorizedToReadObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6;
- (void)performIfAuthorizedToReadTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6;
- (void)performIfAuthorizedToSaveObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6;
- (void)performIfAuthorizedToSaveObjectsWithTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6;
- (void)updateDefaultAuthorizationStatusesForSource:(id)a3 completion:(id)a4;
@end

@implementation HDClientAuthorizationOracle

- (HDClientAuthorizationOracle)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HDClientAuthorizationOracle)initWithSourceBundleIdentifier:(id)a3 entitlements:(id)a4 profile:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HDClientAuthorizationOracle;
  v11 = [(HDClientAuthorizationOracle *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_profile, a5);
    uint64_t v13 = [v8 copy];
    sourceBundleIdentifier = v12->_sourceBundleIdentifier;
    v12->_sourceBundleIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_entitlements, a4);
    v12->_clientHasPrivateEntitlement = [(_HKEntitlements *)v12->_entitlements hasEntitlement:*MEMORY[0x1E4F2A548]];
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    authorizationRequestIdentifiers = v12->_authorizationRequestIdentifiers;
    v12->_authorizationRequestIdentifiers = v15;

    uint64_t v17 = HKCreateSerialDispatchQueue();
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;
  }
  return v12;
}

- (void)invalidate
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_invalidated, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    if (self)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__HDClientAuthorizationOracle__invalidate__block_invoke;
      block[3] = &unk_1E62F3208;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

- (BOOL)clientHasAuthorizationForAllTypes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_sourceBundleIdentifier isEqualToString:*MEMORY[0x1E4F2BF50]]) {
    return 0;
  }
  v3 = [HDKeyValueDomain alloc];
  uint64_t v4 = [(HDKeyValueDomain *)v3 initWithCategory:5 domainName:*MEMORY[0x1E4F2BF40] profile:self->_profile];
  uint64_t v5 = *MEMORY[0x1E4F2BF48];
  id v12 = 0;
  v6 = [(HDKeyValueDomain *)v4 numberForKey:v5 error:&v12];
  id v7 = v12;
  id v8 = v7;
  if (v6)
  {
    BOOL v9 = [v6 integerValue] == 1;
  }
  else
  {
    if (v7)
    {
      _HKInitializeLogging();
      id v10 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v14 = self;
        __int16 v15 = 2114;
        v16 = v8;
        _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch authorization status for all types: %{public}@", buf, 0x16u);
      }
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)filteredObjectsForReadAuthorization:(id)a3 anchor:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v9))
    {
LABEL_3:
      id v10 = v7;
      goto LABEL_30;
    }
  }
  else if (v9)
  {
    goto LABEL_3;
  }
  id v27 = v8;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v28 = v7;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * v16), "hd_sampleType", v27);
        v18 = [v11 objectForKeyedSubscript:v17];

        if (!v18)
        {
          id v33 = 0;
          v19 = [(HDClientAuthorizationOracle *)self readAuthorizationStatusForType:v17 error:&v33];
          id v20 = v33;
          v21 = v20;
          if (v19) {
            BOOL v22 = 1;
          }
          else {
            BOOL v22 = v20 == 0;
          }
          if (v22)
          {
            if (v19) {
              [v11 setObject:v19 forKeyedSubscript:v17];
            }
          }
          else
          {
            _HKInitializeLogging();
            v23 = *MEMORY[0x1E4F29EF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v39 = self;
              __int16 v40 = 2114;
              v41 = v17;
              _os_log_error_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find read authorization status for type: %{public}@", buf, 0x16u);
            }
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v14);
  }

  id v8 = v27;
  if (!self->_sourceBundleIdentifier)
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v39 = self;
      _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@: No client source bundle identifier while filtering samples", buf, 0xCu);
    }
  }
  if (objc_msgSend(v11, "count", v27))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __80__HDClientAuthorizationOracle_filteredObjectsForReadAuthorization_anchor_error___block_invoke;
    v29[3] = &unk_1E62F8918;
    id v30 = v11;
    v31 = self;
    id v32 = v8;
    objc_msgSend(v12, "hk_filter:", v29);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v28;

LABEL_30:

  return v10;
}

uint64_t __80__HDClientAuthorizationOracle_filteredObjectsForReadAuthorization_anchor_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "hd_sampleType");
  uint64_t v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
  uint64_t v6 = -[HDClientAuthorizationOracle _isAuthorizedToReadDataTypeForObject:anchor:authorizationStatus:](*(void *)(a1 + 40), v3, *(void **)(a1 + 48), v5);

  return v6;
}

- (uint64_t)_isAuthorizedToReadDataTypeForObject:(void *)a3 anchor:(void *)a4 authorizationStatus:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (a1)
  {
    int v11 = [v9 canRead];
    if ([v10 authorizationMode] == 1)
    {
      uint64_t v12 = [v8 longLongValue];
      uint64_t v13 = [v10 objectLimitAnchor];
      int v11 = v12 <= [v13 longLongValue];
    }
    uint64_t v14 = [v10 restrictedBundleIdentifier];
    if (v14)
    {
      uint64_t v15 = [v7 _source];
      uint64_t v16 = [v15 bundleIdentifier];
      char v17 = [v16 isEqualToString:v14];

      if ((v17 & 1) == 0) {
        goto LABEL_11;
      }
    }
    else if (!v11)
    {
      goto LABEL_11;
    }
    if (*(unsigned char *)(a1 + 32)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || ([v7 _requiresPrivateEntitlementForQueries] & 1) == 0)
    {
      a1 = 1;
      goto LABEL_13;
    }
LABEL_11:
    a1 = 0;
LABEL_13:
  }
  return a1;
}

- (void)authorizationStatusForType:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __69__HDClientAuthorizationOracle_authorizationStatusForType_completion___block_invoke;
  char v17 = &unk_1E62F8940;
  v19 = self;
  id v20 = v7;
  id v18 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  uint64_t v12 = &v14;
  if (self)
  {
    uint64_t v13 = [(HDProfile *)self->_profile database];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__HDClientAuthorizationOracle__authorizationStatusForTypes_completion___block_invoke;
    v21[3] = &unk_1E62F4E40;
    v21[4] = self;
    id v22 = v11;
    v23 = v12;
    [v13 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:0 block:v21];
  }
}

void __69__HDClientAuthorizationOracle_authorizationStatusForType_completion___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    id v3 = [a2 objectForKeyedSubscript:a1[4]];
    uint64_t v4 = [v3 integerValue];

    uint64_t v5 = a1[6];
    if (a1[5] && (unint64_t)(v4 - 101) <= 3) {
      uint64_t v6 = qword_1BD326A80[v4 - 101];
    }
    else {
      uint64_t v6 = 0;
    }
    id v8 = [NSNumber numberWithInteger:v6];
    (*(void (**)(uint64_t, id, void))(v5 + 16))(v5, v8, 0);
  }
  else
  {
    id v7 = *(void (**)(void))(a1[6] + 16);
    v7();
  }
}

void __71__HDClientAuthorizationOracle__authorizationStatusForTypes_completion___block_invoke(void *a1)
{
  char v2 = [*(id *)(a1[4] + 8) authorizationManager];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[4] + 16);
  id v7 = 0;
  uint64_t v5 = [v2 authorizationStatusForTypes:v3 bundleIdentifier:v4 error:&v7];
  id v6 = v7;

  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)performReadAuthorizationTransactionWithError:(id *)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = [(HDProfile *)self->_profile database];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke;
  v10[3] = &unk_1E62F8050;
  v10[4] = self;
  id v11 = v6;
  id v8 = v6;
  LOBYTE(a3) = +[HDHealthEntity performReadTransactionWithHealthDatabase:v7 error:a3 block:v10];

  return (char)a3;
}

uint64_t __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke_2;
  v12[3] = &unk_1E62F8968;
  uint64_t v6 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v6;
  id v7 = v5;
  id v8 = _Block_copy(v12);
  uint64_t v10 = (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v8, a3, v9);

  return v10;
}

uint64_t __84__HDClientAuthorizationOracle_performReadAuthorizationTransactionWithError_handler___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = objc_msgSend(v7, "hd_sampleType");
  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  if (!v10)
  {
    uint64_t v10 = [*(id *)(a1 + 40) readAuthorizationStatusForType:v9 error:a4];
    if (!v10)
    {
LABEL_7:
      uint64_t v14 = 0;
      goto LABEL_16;
    }
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v9];
  }
  if (![v10 canRead]) {
    goto LABEL_7;
  }
  id v11 = [v10 restrictedBundleIdentifier];
  if (v11)
  {
    uint64_t v12 = [v7 _source];
    id v13 = [v12 bundleIdentifier];
    uint64_t v14 = [v13 isEqualToString:v11];
  }
  else
  {
    uint64_t v14 = ([v10 authorizationMode] != 1
        || v8
        && (uint64_t v15 = [v8 longLongValue],
            [v10 objectLimitAnchor],
            uint64_t v16 = objc_claimAutoreleasedReturnValue(),
            uint64_t v17 = [v16 longLongValue],
            v16,
            v15 <= v17))
       && (*(unsigned char *)(*(void *)(a1 + 40) + 32)
        || ([v7 _requiresPrivateEntitlementForQueries] & 1) == 0);
  }

LABEL_16:
  return v14;
}

- (id)additionalAuthorizationPredicateForObjectType:(id)a3 error:(id *)a4
{
  uint64_t v4 = [(HDClientAuthorizationOracle *)self readAuthorizationStatusForType:a3 error:a4];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 authorizationPredicate];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)readAuthorizationStatusForType:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 252, @"Invalid parameter not satisfying: %@", @"type != nil" object file lineNumber description];
  }
  id v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v7];
  uint64_t v9 = [(HDClientAuthorizationOracle *)self readAuthorizationStatusesForTypes:v8 error:a4];

  uint64_t v10 = [v9 objectForKeyedSubscript:v7];

  return v10;
}

- (id)readAuthorizationStatusesForTypes:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = v7;
  if (!v7 || ![v7 count])
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 260, @"Invalid parameter not satisfying: %@", @"types != nil && types.count > 0" object file lineNumber description];
  }
  BOOL v9 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v9))
    {
LABEL_29:
      v25 = -[HDClientAuthorizationOracle _unrestrictedAuthorizationForTypes:]((uint64_t)self, v8);
      goto LABEL_30;
    }
  }
  else if (v9)
  {
    goto LABEL_29;
  }
  if ((objc_msgSend(v8, "hk_containsObjectPassingTest:", &__block_literal_global_46) & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v10 = +[HDAuthorizationEntity readAuthorizationStatusesByTypeForBundleIdentifier:self->_sourceBundleIdentifier types:v8 profile:self->_profile error:a4];
  id v11 = (void *)[v10 mutableCopy];

  if (v11)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v30;
    uint64_t v28 = *MEMORY[0x1E4F2A958];
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
        [v17 code];
        if ((HKDataTypeRequiresAuthorization() & 1) == 0
          || ([v17 code], HKDataTypeRequiresPerObjectAuthorization()))
        {
          uint64_t v18 = +[HDReadAuthorizationStatus unrestrictedReadAuthorizationStatus];
          goto LABEL_15;
        }
        id v20 = self;
        entitlements = self->_entitlements;
        id v22 = [v17 identifier];
        LODWORD(entitlements) = [(_HKEntitlements *)entitlements arrayEntitlement:v28 containsString:v22];

        if (entitlements)
        {
          v19 = +[HDReadAuthorizationStatus unrestrictedReadAuthorizationStatus];
          self = v20;
          goto LABEL_16;
        }
        v23 = [v11 objectForKeyedSubscript:v17];

        self = v20;
        if (!v23)
        {
          uint64_t v18 = +[HDReadAuthorizationStatus notDerminedReadAuthorizationStatus];
LABEL_15:
          v19 = (void *)v18;
LABEL_16:
          [v11 setObject:v19 forKeyedSubscript:v17];
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v24 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v14 = v24;
      if (!v24)
      {
LABEL_24:

        v25 = (void *)[v11 copy];
        goto LABEL_26;
      }
    }
  }
  v25 = 0;
LABEL_26:

LABEL_30:

  return v25;
}

- (id)_unrestrictedAuthorizationForTypes:(uint64_t)a1
{
  if (a1)
  {
    id v2 = a2;
    uint64_t v3 = +[HDReadAuthorizationStatus unrestrictedReadAuthorizationStatus];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__HDClientAuthorizationOracle__unrestrictedAuthorizationForTypes___block_invoke;
    v7[3] = &unk_1E62F89B0;
    id v8 = v3;
    id v4 = v3;
    id v5 = objc_msgSend(v2, "hk_mapToDictionary:", v7);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __71__HDClientAuthorizationOracle_readAuthorizationStatusesForTypes_error___block_invoke(uint64_t a1, void *a2)
{
  [a2 code];

  return HKDataTypeRequiresAuthorization();
}

- (BOOL)isAuthorizedToReadObject:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_msgSend(v6, "hd_sampleType");
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = objc_msgSend(v6, "hd_sampleType");
      BOOL v9 = [v8 identifier];

      if (v9
        && ([(_HKEntitlements *)self->_entitlements arrayEntitlement:*MEMORY[0x1E4F2A958] containsString:v9] & 1) != 0)
      {
        LOBYTE(self) = 1;
LABEL_41:

        goto LABEL_42;
      }
      id v37 = 0;
      uint64_t v10 = [(HDClientAuthorizationOracle *)self readAuthorizationStatusForType:v7 error:&v37];
      id v11 = v37;
      id v12 = v11;
      if (!v10)
      {
        if (v11)
        {
          id v13 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 5, @"Failed to fetch read authorization status for object: %@", v6);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            id v12 = 0;
            id v28 = 0;
            LOBYTE(self) = 0;
LABEL_39:

            id v12 = v28;
            goto LABEL_40;
          }
        }
        if (a4) {
          *a4 = v13;
        }
        else {
          _HKLogDroppedError();
        }

        LOBYTE(self) = 0;
        if (v12) {
          goto LABEL_40;
        }
        id v28 = 0;
        id v12 = v13;
        goto LABEL_39;
      }
      if (-[HDClientAuthorizationOracle _isAuthorizedToReadDataTypeForObject:anchor:authorizationStatus:]((uint64_t)self, v6, 0, v10))
      {
        LOBYTE(self) = 1;
LABEL_40:

        goto LABEL_41;
      }
      id v14 = v6;
      uint64_t v15 = v14;
      if (!self)
      {
        id v18 = v12;
        goto LABEL_38;
      }
      id v36 = v14;
      uint64_t v16 = objc_msgSend(v14, "hd_sampleType");
      uint64_t v17 = [v16 identifier];

      if (v17
        && ([(_HKEntitlements *)self->_entitlements arrayEntitlement:*MEMORY[0x1E4F2A958] containsString:v17] & 1) != 0)
      {
        LOBYTE(self) = 1;
        id v18 = v12;
        uint64_t v15 = v36;
LABEL_37:

LABEL_38:
        id v28 = v18;
        goto LABEL_39;
      }
      v19 = [(HDProfile *)self->_profile sourceManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      id v39 = 0;
      v21 = [v19 localSourceForBundleIdentifier:sourceBundleIdentifier error:&v39];
      id v22 = v39;

      uint64_t v34 = v17;
      if (v21)
      {
        v23 = v21;
        v40[0] = v36;
        uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
        profile = self->_profile;
        id v38 = v22;
        id v33 = v23;
        v26 = +[HDObjectAuthorizationEntity authorizationRecordsForSamples:v24 sourceEntity:v23 sessionIdentifier:0 profile:profile error:&v38];
        id v35 = v38;

        id v27 = [v26 firstObject];

        if (v27)
        {
          LOBYTE(self) = [v27 status] == 2;
          id v18 = v12;
          uint64_t v15 = v36;
          v21 = v33;
LABEL_36:

          uint64_t v17 = v34;
          goto LABEL_37;
        }
        v21 = v33;
        if (v35)
        {
          id v18 = v35;

          id v27 = 0;
          LOBYTE(self) = 0;
          id v35 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 2000, @"Failed to fetch HKObjectAuthorizationRecord for object: %@, client bundle identifier: %@", v36, self->_sourceBundleIdentifier);
          id v30 = (id)objc_claimAutoreleasedReturnValue();
          long long v31 = v30;
          id v18 = v12;
          if (v30)
          {
            id v18 = v30;
          }
          id v27 = 0;
          LOBYTE(self) = 0;
          id v35 = 0;
          v21 = v33;
        }
      }
      else
      {
        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 124, @"Failed to find local source entity for client with bundle identifier: %@", self->_sourceBundleIdentifier);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v15 = v36;
          if (v29)
          {
            id v27 = v29;

            LOBYTE(self) = 0;
            id v35 = 0;
            id v18 = v27;
          }
          else
          {
            id v27 = 0;
            LOBYTE(self) = 0;
            id v35 = 0;
            id v18 = v12;
          }
          goto LABEL_36;
        }
        id v27 = v22;
        LOBYTE(self) = 0;
        id v18 = v27;
        id v35 = v27;
      }
      uint64_t v15 = v36;
      goto LABEL_36;
    }
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 1301, @"Object %@ is not a sample", v6);
  LOBYTE(self) = 0;
LABEL_42:

  return (char)self;
}

- (BOOL)isAuthorizationStatusDeterminedForTypes:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v7))
    {
LABEL_3:
      BOOL v8 = 1;
      goto LABEL_33;
    }
  }
  else if (v7)
  {
    goto LABEL_3;
  }
  BOOL v9 = [(HDProfile *)self->_profile authorizationManager];
  uint64_t v10 = [v9 authorizationStatusForTypes:v6 bundleIdentifier:self->_sourceBundleIdentifier error:a4];
  id v11 = (void *)[v10 mutableCopy];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v31 = v6;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v13) {
    goto LABEL_18;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v38;
  uint64_t v32 = *MEMORY[0x1E4F2A958];
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v38 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      objc_msgSend(v17, "code", v31);
      int v18 = HKDataTypeRequiresAuthorization();
      v19 = &unk_1F17EB3B8;
      if (v18)
      {
        objc_msgSend(v17, "code", &unk_1F17EB3B8);
        char v20 = HKDataTypeRequiresPerObjectAuthorization();
        v19 = &unk_1F17EB3B8;
        if ((v20 & 1) == 0)
        {
          entitlements = self->_entitlements;
          objc_msgSend(v17, "identifier", &unk_1F17EB3B8);
          v23 = id v22 = self;
          LOBYTE(entitlements) = [(_HKEntitlements *)entitlements arrayEntitlement:v32 containsString:v23];

          self = v22;
          v19 = &unk_1F17EB3B8;
          if ((entitlements & 1) == 0)
          {
            uint64_t v24 = [v11 objectForKeyedSubscript:v17];

            if (v24) {
              continue;
            }
            v19 = &unk_1F17EB3D0;
          }
        }
      }
      [v11 setObject:v19 forKeyedSubscript:v17];
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v42 count:16];
  }
  while (v14);
LABEL_18:

  if ([v11 count])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v25 = [v11 allValues];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v34;
      id v6 = v31;
      while (2)
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          if ((unint64_t)(objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "integerValue", v31) - 101) > 3)
          {
            BOOL v8 = 0;
            goto LABEL_31;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v27) {
          continue;
        }
        break;
      }
      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 1;
      id v6 = v31;
    }
LABEL_31:
  }
  else
  {
    BOOL v8 = 0;
    id v6 = v31;
  }

LABEL_33:
  return v8;
}

void __42__HDClientAuthorizationOracle__invalidate__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) authorizationManager];
  if ([*(id *)(*(void *)(a1 + 32) + 40) count])
  {
    id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 40) copy];
    [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
    [v6 cancelAuthorizationRequestsWithIdentifiers:v2];
  }
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"The connection to the view service was invalidated.");
    [v6 endAuthorizationDelegateTransactionWithSessionIdentifier:*(void *)(*(void *)(a1 + 32) + 56) error:v3];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 56);
    *(void *)(v4 + 56) = 0;
  }
}

uint64_t __66__HDClientAuthorizationOracle__unrestrictedAuthorizationForTypes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(a3 + 16))(a3, a2, *(void *)(a1 + 32));
}

- (void)performIfAuthorizedToReadObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_30:
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 481, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_31;
  }
  long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 480, @"Invalid parameter not satisfying: %@", @"[objects count] > 0" object file lineNumber description];

  if (!v13) {
    goto LABEL_30;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_31:
  long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 482, @"Invalid parameter not satisfying: %@", @"errorHandler != NULL" object file lineNumber description];

LABEL_4:
  BOOL v15 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  v44 = [MEMORY[0x1E4F1CA48] array];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v15))
    {
LABEL_19:
      id v19 = 0;
      goto LABEL_20;
    }
  }
  else if (v15)
  {
    goto LABEL_19;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v17)
  {

    goto LABEL_19;
  }
  uint64_t v18 = v17;
  SEL v38 = a2;
  id v39 = v13;
  v41 = v14;
  queue = v12;
  id v40 = v11;
  id v19 = 0;
  uint64_t v20 = *(void *)v55;
  char v43 = 1;
  do
  {
    v21 = v16;
    uint64_t v22 = 0;
    v23 = v19;
    do
    {
      if (*(void *)v55 != v20) {
        objc_enumerationMutation(v21);
      }
      uint64_t v24 = *(void *)(*((void *)&v54 + 1) + 8 * v22);
      v25 = [(HDProfile *)self->_profile authorizationManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      id v53 = v23;
      uint64_t v29 = [v25 isClientAuthorizedToReadObject:v24 sourceBundleIdentifier:sourceBundleIdentifier clientEntitlements:entitlements profile:profile error:&v53];
      id v19 = v53;

      if (v29 == 1) {
        [v44 addObject:v24];
      }
      else {
        char v43 = 0;
      }
      ++v22;
      v23 = v19;
    }
    while (v18 != v22);
    id v16 = v21;
    uint64_t v18 = [v21 countByEnumeratingWithState:&v54 objects:v58 count:16];
  }
  while (v18);

  if (v43)
  {
    id v13 = v39;
    id v11 = v40;
    id v14 = v41;
    id v12 = queue;
LABEL_20:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E62F4928;
    id v51 = v44;
    id v52 = v13;
    id v30 = (void (**)(void))_Block_copy(aBlock);
    id v31 = v30;
    if (v12) {
      dispatch_async(v12, v30);
    }
    else {
      v30[2](v30);
    }

    uint64_t v32 = v51;
    goto LABEL_24;
  }
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke_2;
  v45[3] = &unk_1E62F70D8;
  v45[4] = self;
  id v46 = v21;
  id v19 = v19;
  id v47 = v19;
  SEL v49 = v38;
  id v14 = v41;
  id v48 = v41;
  long long v33 = (void (**)(void))_Block_copy(v45);
  long long v34 = v33;
  id v12 = queue;
  if (queue) {
    dispatch_async(queue, v33);
  }
  else {
    v33[2](v33);
  }
  id v13 = v39;
  id v11 = v40;

  uint64_t v32 = v46;
LABEL_24:
}

void __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F2B420], "hd_sampleTypesForObjects:", *(void *)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = *(void *)(a1 + 40);
  if ([v4 count]) {
    id v3 = v4;
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __96__HDClientAuthorizationOracle_performIfAuthorizedToReadObjects_onQueue_usingBlock_errorHandler___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) daemon];
  id v3 = [v2 behavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F2B420], "hd_sampleTypesForObjects:", a1[5]);
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1[4] + 16);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      BOOL v15 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Client %@ is not read authorized for data type(s) %@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    BOOL v7 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Client %@ is not write authorized for data type(s).", buf, 0xCu);
    }
  }
  if (!a1[6])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[8], a1[4], @"HDClientAuthorizationOracle.m", 526, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToReadTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_30:
    long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 544, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_31;
  }
  long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
  [v35 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 543, @"Invalid parameter not satisfying: %@", @"[types count] > 0" object file lineNumber description];

  if (!v13) {
    goto LABEL_30;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_31:
  long long v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 545, @"Invalid parameter not satisfying: %@", @"errorHandler != NULL" object file lineNumber description];

LABEL_4:
  BOOL v15 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  v44 = [MEMORY[0x1E4F1CA48] array];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v15))
    {
LABEL_19:
      id v19 = 0;
      goto LABEL_20;
    }
  }
  else if (v15)
  {
    goto LABEL_19;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (!v17)
  {

    goto LABEL_19;
  }
  uint64_t v18 = v17;
  SEL v38 = a2;
  id v39 = v13;
  v41 = v14;
  queue = v12;
  id v40 = v11;
  id v19 = 0;
  uint64_t v20 = *(void *)v55;
  char v43 = 1;
  do
  {
    v21 = v16;
    uint64_t v22 = 0;
    v23 = v19;
    do
    {
      if (*(void *)v55 != v20) {
        objc_enumerationMutation(v21);
      }
      uint64_t v24 = *(void *)(*((void *)&v54 + 1) + 8 * v22);
      v25 = [(HDProfile *)self->_profile authorizationManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      id v53 = v23;
      uint64_t v29 = [v25 isClientAuthorizedToReadType:v24 sourceBundleIdentifier:sourceBundleIdentifier clientEntitlements:entitlements profile:profile error:&v53];
      id v19 = v53;

      if (v29 == 1) {
        [v44 addObject:v24];
      }
      else {
        char v43 = 0;
      }
      ++v22;
      v23 = v19;
    }
    while (v18 != v22);
    id v16 = v21;
    uint64_t v18 = [v21 countByEnumeratingWithState:&v54 objects:v58 count:16];
  }
  while (v18);

  if (v43)
  {
    id v13 = v39;
    id v11 = v40;
    id v14 = v41;
    id v12 = queue;
LABEL_20:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E62F3CA8;
    id v52 = v13;
    id v51 = v44;
    id v30 = (void (**)(void))_Block_copy(aBlock);
    id v31 = v30;
    if (v12) {
      dispatch_async(v12, v30);
    }
    else {
      v30[2](v30);
    }

    uint64_t v32 = v52;
    goto LABEL_24;
  }
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke_2;
  v45[3] = &unk_1E62F70D8;
  v45[4] = self;
  id v46 = v21;
  id v19 = v19;
  id v47 = v19;
  SEL v49 = v38;
  id v14 = v41;
  id v48 = v41;
  long long v33 = (void (**)(void))_Block_copy(v45);
  long long v34 = v33;
  id v12 = queue;
  if (queue) {
    dispatch_async(queue, v33);
  }
  else {
    v33[2](v33);
  }
  id v13 = v39;
  id v11 = v40;

  uint64_t v32 = v46;
LABEL_24:
}

void __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v4);
  }
  else
  {
    id v3 = *(void (**)(uint64_t, void))(v2 + 16);
    v3(v2, 0);
  }
}

uint64_t __94__HDClientAuthorizationOracle_performIfAuthorizedToReadTypes_onQueue_usingBlock_errorHandler___block_invoke_2(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) daemon];
  id v3 = [v2 behavior];
  int v4 = [v3 isAppleInternalInstall];

  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29EF8];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    uint64_t v9 = "Client %@ is not read authorized for data type(s) %@";
    uint64_t v10 = v5;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v13 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v13;
    uint64_t v9 = "Client %@ is not write authorized for data type(s).";
    uint64_t v10 = v5;
    uint32_t v11 = 12;
  }
  _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_5:
  if (!a1[6])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[8], a1[4], @"HDClientAuthorizationOracle.m", 591, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToSaveObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_27:
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 608, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 607, @"Invalid parameter not satisfying: %@", @"[objects count] > 0" object file lineNumber description];

  if (!v13) {
    goto LABEL_27;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_28:
  long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 609, @"Invalid parameter not satisfying: %@", @"errorHandler != NULL" object file lineNumber description];

LABEL_4:
  BOOL v15 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v15))
    {
LABEL_16:
      id v19 = 0;
      goto LABEL_17;
    }
  }
  else if (v15)
  {
    goto LABEL_16;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v17)
  {

    goto LABEL_16;
  }
  uint64_t v18 = v17;
  SEL v37 = a2;
  SEL v38 = v14;
  id v39 = v13;
  id v40 = v12;
  id v41 = v11;
  id v19 = 0;
  uint64_t v20 = *(void *)v51;
  LOBYTE(v14) = 1;
  do
  {
    uint64_t v21 = 0;
    uint64_t v22 = v19;
    do
    {
      if (*(void *)v51 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * v21);
      uint64_t v24 = [(HDProfile *)self->_profile authorizationManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      id v49 = v22;
      uint64_t v28 = [v24 isClientAuthorizedToWriteObject:v23 sourceBundleIdentifier:sourceBundleIdentifier clientEntitlements:entitlements profile:profile error:&v49];
      id v19 = v49;

      LODWORD(v14) = (v28 == 1) & v14;
      ++v21;
      uint64_t v22 = v19;
    }
    while (v18 != v21);
    uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
  }
  while (v18);

  if (v14)
  {
    id v12 = v40;
    id v11 = v41;
    id v14 = v38;
    id v13 = v39;
LABEL_17:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E62F2F20;
    id v48 = v13;
    uint64_t v29 = (void (**)(void))_Block_copy(aBlock);
    id v30 = v29;
    if (v12) {
      dispatch_async(v12, v29);
    }
    else {
      v29[2](v29);
    }

    id v31 = v48;
    goto LABEL_21;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke_2;
  v42[3] = &unk_1E62F70D8;
  v42[4] = self;
  id v43 = v16;
  id v19 = v19;
  id v44 = v19;
  id v14 = v38;
  SEL v46 = v37;
  id v45 = v38;
  uint64_t v32 = (void (**)(void))_Block_copy(v42);
  long long v33 = v32;
  id v12 = v40;
  id v11 = v41;
  id v13 = v39;
  if (v40) {
    dispatch_async(v40, v32);
  }
  else {
    v32[2](v32);
  }

  id v31 = v43;
LABEL_21:
}

uint64_t __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  HDSetHealthInUseDefaultWithReason(@"Saving objects to the database.");
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __96__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjects_onQueue_usingBlock_errorHandler___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  HDSetHealthInUseDefaultWithReason(@"Saving objects to the database.");
  uint64_t v2 = [*(id *)(a1[4] + 8) daemon];
  id v3 = [v2 behavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F2B420], "hd_sampleTypesForObjects:", a1[5]);
    _HKInitializeLogging();
    BOOL v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1[4] + 16);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      BOOL v15 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Client %@ is not write authorized for data type(s) %@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Client %@ is not write authorized for data type(s).", buf, 0xCu);
    }
  }
  if (!a1[6])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[8], a1[4], @"HDClientAuthorizationOracle.m", 652, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToSaveObjectsWithTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_27:
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 670, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_28;
  }
  long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
  [v34 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 669, @"Invalid parameter not satisfying: %@", @"[types count] > 0" object file lineNumber description];

  if (!v13) {
    goto LABEL_27;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_28:
  long long v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 671, @"Invalid parameter not satisfying: %@", @"errorHandler != NULL" object file lineNumber description];

LABEL_4:
  BOOL v15 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v15))
    {
LABEL_16:
      id v19 = 0;
      goto LABEL_17;
    }
  }
  else if (v15)
  {
    goto LABEL_16;
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  long long v50 = 0u;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (!v17)
  {

    goto LABEL_16;
  }
  uint64_t v18 = v17;
  SEL v37 = a2;
  SEL v38 = v14;
  id v39 = v13;
  id v40 = v12;
  id v41 = v11;
  id v19 = 0;
  uint64_t v20 = *(void *)v51;
  LOBYTE(v14) = 1;
  do
  {
    uint64_t v21 = 0;
    uint64_t v22 = v19;
    do
    {
      if (*(void *)v51 != v20) {
        objc_enumerationMutation(v16);
      }
      uint64_t v23 = *(void *)(*((void *)&v50 + 1) + 8 * v21);
      uint64_t v24 = [(HDProfile *)self->_profile authorizationManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      id v49 = v22;
      uint64_t v28 = [v24 isClientAuthorizedToWriteType:v23 sourceBundleIdentifier:sourceBundleIdentifier clientEntitlements:entitlements profile:profile error:&v49];
      id v19 = v49;

      LODWORD(v14) = (v28 == 1) & v14;
      ++v21;
      uint64_t v22 = v19;
    }
    while (v18 != v21);
    uint64_t v18 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
  }
  while (v18);

  if (v14)
  {
    id v12 = v40;
    id v11 = v41;
    id v14 = v38;
    id v13 = v39;
LABEL_17:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke;
    aBlock[3] = &unk_1E62F2F20;
    id v48 = v13;
    uint64_t v29 = (void (**)(void))_Block_copy(aBlock);
    id v30 = v29;
    if (v12) {
      dispatch_async(v12, v29);
    }
    else {
      v29[2](v29);
    }

    id v31 = v48;
    goto LABEL_21;
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2;
  v42[3] = &unk_1E62F70D8;
  v42[4] = self;
  id v43 = v16;
  id v19 = v19;
  id v44 = v19;
  id v14 = v38;
  SEL v46 = v37;
  id v45 = v38;
  uint64_t v32 = (void (**)(void))_Block_copy(v42);
  long long v33 = v32;
  id v12 = v40;
  id v11 = v41;
  id v13 = v39;
  if (v40) {
    dispatch_async(v40, v32);
  }
  else {
    v32[2](v32);
  }

  id v31 = v43;
LABEL_21:
}

uint64_t __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  HDSetHealthInUseDefaultWithReason(@"Saving objects to the database.");
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

uint64_t __105__HDClientAuthorizationOracle_performIfAuthorizedToSaveObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  HDSetHealthInUseDefaultWithReason(@"Saving objects to the database.");
  uint64_t v2 = [*(id *)(a1[4] + 8) daemon];
  id v3 = [v2 behavior];
  int v4 = [v3 isAppleInternalInstall];

  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29EF8];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    uint64_t v9 = "Client %@ is not write authorized for data type(s) %@";
    uint64_t v10 = v5;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v13 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v13;
    uint64_t v9 = "Client %@ is not write authorized for data type(s).";
    uint64_t v10 = v5;
    uint32_t v11 = 12;
  }
  _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_5:
  if (!a1[6])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[8], a1[4], @"HDClientAuthorizationOracle.m", 713, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToDeleteObjects:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 731, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 730, @"Invalid parameter not satisfying: %@", @"[objects count] > 0" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 732, @"Invalid parameter not satisfying: %@", @"errorHandler != NULL" object file lineNumber description];

LABEL_4:
  BOOL v15 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v15))
    {
LABEL_6:
      char v16 = 0;
      id v17 = 0;
LABEL_21:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke;
      aBlock[3] = &unk_1E62F89D8;
      id v49 = v13;
      char v50 = v16;
      long long v33 = (void (**)(void))_Block_copy(aBlock);
      long long v34 = v33;
      if (v12) {
        dispatch_async(v12, v33);
      }
      else {
        v33[2](v33);
      }

      long long v35 = v49;
      goto LABEL_25;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  id v42 = v13;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v21 = v11;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v22)
  {

    id v17 = 0;
    char v16 = 1;
    id v13 = v42;
    goto LABEL_21;
  }
  uint64_t v23 = v22;
  SEL v38 = a2;
  id v39 = v14;
  id v40 = v12;
  id v41 = v11;
  id v17 = 0;
  uint64_t v24 = *(void *)v53;
  LOBYTE(v14) = 1;
  do
  {
    uint64_t v25 = 0;
    uint64_t v26 = v17;
    do
    {
      if (*(void *)v53 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v27 = *(void *)(*((void *)&v52 + 1) + 8 * v25);
      uint64_t v28 = [(HDProfile *)self->_profile authorizationManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      id v51 = v26;
      uint64_t v32 = [v28 isClientAuthorizedToWriteObject:v27 sourceBundleIdentifier:sourceBundleIdentifier clientEntitlements:entitlements profile:profile error:&v51];
      id v17 = v51;

      LODWORD(v14) = (v32 == 1) & v14;
      ++v25;
      uint64_t v26 = v17;
    }
    while (v23 != v25);
    uint64_t v23 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
  }
  while (v23);

  if (v14)
  {
    char v16 = 1;
    id v12 = v40;
    id v11 = v41;
    id v13 = v42;
    id v14 = v39;
    goto LABEL_21;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke_2;
  v43[3] = &unk_1E62F70D8;
  v43[4] = self;
  id v44 = v21;
  id v17 = v17;
  id v45 = v17;
  id v14 = v39;
  SEL v47 = v38;
  id v46 = v39;
  long long v36 = (void (**)(void))_Block_copy(v43);
  SEL v37 = v36;
  id v12 = v40;
  id v11 = v41;
  if (v40) {
    dispatch_async(v40, v36);
  }
  else {
    v36[2](v36);
  }
  id v13 = v42;

  long long v35 = v44;
LABEL_25:
}

uint64_t __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __98__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjects_onQueue_usingBlock_errorHandler___block_invoke_2(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) daemon];
  id v3 = [v2 behavior];
  int v4 = [v3 isAppleInternalInstall];

  if (v4)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F2B420], "hd_sampleTypesForObjects:", a1[5]);
    _HKInitializeLogging();
    BOOL v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1[4] + 16);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      BOOL v15 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Client %@ is not delete authorized for data type(s) %@", buf, 0x16u);
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1[4] + 16);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Client %@ is not delete authorized for data type(s).", buf, 0xCu);
    }
  }
  if (!a1[6])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[8], a1[4], @"HDClientAuthorizationOracle.m", 776, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)performIfAuthorizedToDeleteObjectsWithTypes:(id)a3 onQueue:(id)a4 usingBlock:(id)a5 errorHandler:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 count])
  {
    if (v13) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 794, @"Invalid parameter not satisfying: %@", @"block != NULL" object file lineNumber description];

    if (v14) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 793, @"Invalid parameter not satisfying: %@", @"[types count] > 0" object file lineNumber description];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 795, @"Invalid parameter not satisfying: %@", @"errorHandler != NULL" object file lineNumber description];

LABEL_4:
  BOOL v15 = [(HDClientAuthorizationOracle *)self clientHasAuthorizationForAllTypes];
  if (self)
  {
    if (([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] | v15))
    {
LABEL_6:
      char v16 = 0;
      id v17 = 0;
LABEL_21:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke;
      aBlock[3] = &unk_1E62F89D8;
      id v49 = v13;
      char v50 = v16;
      long long v33 = (void (**)(void))_Block_copy(aBlock);
      long long v34 = v33;
      if (v12) {
        dispatch_async(v12, v33);
      }
      else {
        v33[2](v33);
      }

      long long v35 = v49;
      goto LABEL_25;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  id v42 = v13;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v21 = v11;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
  if (!v22)
  {

    id v17 = 0;
    char v16 = 1;
    id v13 = v42;
    goto LABEL_21;
  }
  uint64_t v23 = v22;
  SEL v38 = a2;
  id v39 = v14;
  id v40 = v12;
  id v41 = v11;
  id v17 = 0;
  uint64_t v24 = *(void *)v53;
  LOBYTE(v14) = 1;
  do
  {
    uint64_t v25 = 0;
    uint64_t v26 = v17;
    do
    {
      if (*(void *)v53 != v24) {
        objc_enumerationMutation(v21);
      }
      uint64_t v27 = *(void *)(*((void *)&v52 + 1) + 8 * v25);
      uint64_t v28 = [(HDProfile *)self->_profile authorizationManager];
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      entitlements = self->_entitlements;
      profile = self->_profile;
      id v51 = v26;
      uint64_t v32 = [v28 isClientAuthorizedToWriteType:v27 sourceBundleIdentifier:sourceBundleIdentifier clientEntitlements:entitlements profile:profile error:&v51];
      id v17 = v51;

      LODWORD(v14) = (v32 == 1) & v14;
      ++v25;
      uint64_t v26 = v17;
    }
    while (v23 != v25);
    uint64_t v23 = [v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
  }
  while (v23);

  if (v14)
  {
    char v16 = 1;
    id v12 = v40;
    id v11 = v41;
    id v13 = v42;
    id v14 = v39;
    goto LABEL_21;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2;
  v43[3] = &unk_1E62F70D8;
  v43[4] = self;
  id v44 = v21;
  id v17 = v17;
  id v45 = v17;
  id v14 = v39;
  SEL v47 = v38;
  id v46 = v39;
  long long v36 = (void (**)(void))_Block_copy(v43);
  SEL v37 = v36;
  id v12 = v40;
  id v11 = v41;
  if (v40) {
    dispatch_async(v40, v36);
  }
  else {
    v36[2](v36);
  }
  id v13 = v42;

  long long v35 = v44;
LABEL_25:
}

uint64_t __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __107__HDClientAuthorizationOracle_performIfAuthorizedToDeleteObjectsWithTypes_onQueue_usingBlock_errorHandler___block_invoke_2(void *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) daemon];
  id v3 = [v2 behavior];
  int v4 = [v3 isAppleInternalInstall];

  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29EF8];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR);
  if (v4)
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412546;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    uint64_t v9 = "Client %@ is not delete authorized for data type(s) %@";
    uint64_t v10 = v5;
    uint32_t v11 = 22;
  }
  else
  {
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v13 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v13;
    uint64_t v9 = "Client %@ is not delete authorized for data type(s).";
    uint64_t v10 = v5;
    uint32_t v11 = 12;
  }
  _os_log_error_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_5:
  if (!a1[6])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a1[8], a1[4], @"HDClientAuthorizationOracle.m", 840, @"Invalid parameter not satisfying: %@", @"error != nil" object file lineNumber description];
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

- (void)enqueueObjectAuthorizationRequestWithContext:(id)a3 sourceEntity:(id)a4 promptIfNeeded:(BOOL)a5 authorizationNeededHandler:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v17 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (self
    && [(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]])
  {
    BOOL v15 = [v17 samples];
    (*((void (**)(id, void, void *, void))v14 + 2))(v14, 0, v15, 0);
  }
  else
  {
    BOOL v15 = [(HDProfile *)self->_profile authorizationManager];
    id v16 = (id)[v15 enqueueObjectAuthorizationRequestForBundleIdentifier:self->_sourceBundleIdentifier context:v17 promptIfNeeded:v9 authorizationNeededHandler:v13 completion:v14];
  }
}

- (void)handleObjectAuthorizationRequestsWithPromptHandler:(id)a3 completion:(id)a4
{
  profile = self->_profile;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HDProfile *)profile authorizationManager];
  [v9 handleObjectAuthorizationRequestsForBundleIdentifier:self->_sourceBundleIdentifier promptHandler:v8 completion:v7];
}

- (void)createRecalibrateEstimatesRequestRecordForSampleType:(id)a3 sourceEntity:(id)a4 effectiveDate:(id)a5 handler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, uint64_t))a6;
  if (!v13)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = @"Effective date cannot be nil.";
LABEL_14:
    uint64_t v28 = objc_msgSend(v17, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v18, a2, v19);
LABEL_17:
    uint64_t v29 = (void *)v28;
    v14[2](v14, 0, v28);

    goto LABEL_18;
  }
  BOOL v15 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v16 = [v13 compare:v15];

  if (v16 == 1)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Effective date (%@) cannot be in the future.", v13);
    uint64_t v28 = LABEL_16:;
    goto LABEL_17;
  }
  if (!v11)
  {
    id v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = @"Sample type cannot be nil.";
    goto LABEL_14;
  }
  if (([v11 allowsRecalibrationForEstimates] & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Estimate recalibration is not supported for %@.", v11);
    goto LABEL_16;
  }
  if (!self
    || ([(_HKEntitlements *)self->_entitlements hasEntitlement:*MEMORY[0x1E4F29728]] & 1) == 0)
  {
    uint64_t v20 = [(HDProfile *)self->_profile authorizationManager];
    id v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v11];
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    id v33 = 0;
    uint64_t v23 = [v20 authorizationStatusForTypes:v21 bundleIdentifier:sourceBundleIdentifier error:&v33];
    id v24 = v33;

    uint64_t v25 = [v23 objectForKey:v11];
    uint64_t v26 = v25;
    if (v25)
    {
      if ([v25 integerValue] == 101)
      {

        goto LABEL_12;
      }
      id v30 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 4, @"Client %@ is not authorized to read and share %@.", self->_sourceBundleIdentifier, v11);
      v14[2](v14, 0, (uint64_t)v30);
    }
    else
    {
      v14[2](v14, 0, (uint64_t)v24);
    }

    goto LABEL_18;
  }
LABEL_12:
  uint64_t v27 = [(HDProfile *)self->_profile authorizationManager];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke;
  v31[3] = &unk_1E62F8A00;
  v31[4] = self;
  uint64_t v32 = v14;
  [v27 createRecalibrateEstimatesRequestRecordForSource:v12 sampleType:v11 effectiveDate:v13 handler:v31];

LABEL_18:
}

void __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v5)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(NSObject **)(v9 + 48);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke_2;
    v11[3] = &unk_1E62F31C0;
    v11[4] = v9;
    id v12 = v5;
    dispatch_async(v10, v11);
  }
  (*(void (**)(void, id, id, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v8, v6, v7);
}

void __119__HDClientAuthorizationOracle_createRecalibrateEstimatesRequestRecordForSampleType_sourceEntity_effectiveDate_handler___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  id v2 = [*(id *)(a1 + 40) sessionIdentifier];
  [v1 addObject:v2];
}

- (void)enqueueAuthorizationRequestToWriteTypes:(id)a3 readTypes:(id)a4 authorizationNeededHandler:(id)a5 requestCompletionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void, void *))a6;
  if (!v14)
  {
    id v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 942, @"Invalid parameter not satisfying: %@", @"requestCompletionHandler != NULL" object file lineNumber description];
  }
  if (![v11 count] && !objc_msgSend(v12, "count"))
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = @"Must specify types to share or read";
    goto LABEL_35;
  }
  if ([v11 count]
    && ([MEMORY[0x1E4F2B2C0] _allowAuthorizationForSharingWithTypes:v11 entitlements:self->_entitlements disallowedTypes:0] & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = @"Invalid types for sharing";
LABEL_35:
    id v39 = objc_msgSend(v21, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v22, a2, v23);
    v14[2](v14, 0, v39);

    goto LABEL_36;
  }
  if ([v12 count]
    && ([MEMORY[0x1E4F2B2C0] _allowAuthorizationForReadingWithTypes:v12 entitlements:self->_entitlements disallowedTypes:0] & 1) == 0)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = @"Invalid types for reading";
    goto LABEL_35;
  }
  char v47 = 0;
  BOOL v15 = [(HDProfile *)self->_profile profileExtensionsConformingToProtocol:&unk_1F18A8528];
  uint64_t v16 = [v15 firstObject];

  if (v16)
  {
    id v46 = 0;
    char v17 = [v16 deviceConfigurationSupportsHealthRecords:&v47 error:&v46];
    uint64_t v18 = (NSString *)v46;
    uint64_t v19 = v18;
    if ((v17 & 1) == 0)
    {
      if (v18)
      {
        _HKInitializeLogging();
        uint64_t v20 = *MEMORY[0x1E4F29EF8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v49 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Failed to determine Health Records feature availability with error: %{public}@", buf, 0xCu);
        }
      }
    }

    if (v47) {
      goto LABEL_24;
    }
  }
  else
  {
    id v24 = [(HDProfile *)self->_profile daemon];
    uint64_t v25 = [v24 behavior];
    char v26 = [v25 isAppleWatch];

    if ((v26 & 1) == 0)
    {
      _HKInitializeLogging();
      uint64_t v27 = *MEMORY[0x1E4F29EF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1BCB7D000, v27, OS_LOG_TYPE_ERROR, "Unable to get Health Records plugin", buf, 2u);
      }
    }
  }
  _HKInitializeLogging();
  uint64_t v28 = *MEMORY[0x1E4F29EF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_DEFAULT, "CHR is not supported, removing clinical types from the request", buf, 2u);
  }
  uint64_t v29 = (void *)MEMORY[0x1E4F1CAD0];
  id v30 = [MEMORY[0x1E4F2AD10] allTypes];
  id v31 = [v29 setWithArray:v30];
  uint64_t v32 = objc_msgSend(v12, "hk_minus:", v31);

  id v12 = (id)v32;
LABEL_24:
  uint64_t v33 = [v11 count];
  if (v33 + [v12 count])
  {
    _HKInitializeLogging();
    long long v36 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
    {
      sourceBundleIdentifier = self->_sourceBundleIdentifier;
      *(_DWORD *)buf = 138412290;
      id v49 = sourceBundleIdentifier;
      _os_log_impl(&dword_1BCB7D000, v36, OS_LOG_TYPE_DEFAULT, "Enqueuing authorization request for %@", buf, 0xCu);
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __133__HDClientAuthorizationOracle_enqueueAuthorizationRequestToWriteTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_407;
    block[3] = &unk_1E62F8A28;
    block[4] = self;
    id v42 = v11;
    id v43 = v12;
    id v44 = v13;
    id v45 = v14;
    dispatch_async(queue, block);
  }
  else
  {
    if (v13)
    {
      long long v34 = [MEMORY[0x1E4F29128] UUID];
      (*((void (**)(id, void *, void, void, void *))v13 + 2))(v13, v34, 0, 0, &__block_literal_global_406);
    }
    _HKInitializeLogging();
    long long v35 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_DEFAULT, "There are zero types to write and read, not creating an authorization request", buf, 2u);
    }
    v14[2](v14, 1, 0);
  }

LABEL_36:
}

void __133__HDClientAuthorizationOracle_enqueueAuthorizationRequestToWriteTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_407(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  id v3 = *(void **)(v2 + 16);
  int v4 = *(void **)(a1 + 48);
  id v5 = *(void **)(a1 + 64);
  id v6 = *(id *)(a1 + 56);
  id v7 = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E62F8A78;
  void aBlock[4] = v2;
  id v8 = v7;
  id v23 = v8;
  id v9 = v4;
  id v10 = v1;
  id v11 = v3;
  id v12 = _Block_copy(aBlock);
  if (v6)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_3;
    uint64_t v19 = &unk_1E62F8A78;
    uint64_t v20 = v2;
    id v21 = v6;
    id v13 = _Block_copy(&v16);
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_msgSend(*(id *)(v2 + 8), "authorizationManager", v16, v17, v18, v19, v20);
  BOOL v15 = [v14 enqueueAuthorizationRequestForBundleIdentifier:v11 writeTypes:v10 readTypes:v9 authorizationNeededHandler:v13 completion:v12];

  if (v15) {
    [*(id *)(v2 + 40) addObject:v15];
  }
}

void __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(NSObject **)(v9 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_2;
  block[3] = &unk_1E62F8A50;
  block[4] = v9;
  id v15 = v7;
  id v11 = *(id *)(a1 + 40);
  char v18 = a3;
  id v16 = v8;
  id v17 = v11;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(v10, block);
}

uint64_t __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 40) removeObject:a1[5]];
  uint64_t result = a1[7];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) authorizationManager];
  objc_initWeak(&location, v9);

  uint64_t v10 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_4;
  v12[3] = &unk_1E62F7308;
  objc_copyWeak(&v14, &location);
  id v11 = v7;
  id v13 = v11;
  (*(void (**)(uint64_t, id, uint64_t, id, void *))(v10 + 16))(v10, v11, a3, v8, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __158__HDClientAuthorizationOracle__queue_enqueueAuthorizationRequestForBundleIdentifier_writeTypes_readTypes_authorizationNeededHandler_requestCompletionHandler___block_invoke_4(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [WeakRetained cancelAuthorizationRequestsWithIdentifiers:v3];
}

- (void)handleAuthorizationRequestsWithPromptHandler:(id)a3 requestCompletionHandler:(id)a4
{
}

- (void)handleAuthorizationRequestsForBundleIdentifier:(id)a3 promptHandler:(id)a4 requestCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__HDClientAuthorizationOracle_handleAuthorizationRequestsForBundleIdentifier_promptHandler_requestCompletionHandler___block_invoke;
  v15[3] = &unk_1E62F7088;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __117__HDClientAuthorizationOracle_handleAuthorizationRequestsForBundleIdentifier_promptHandler_requestCompletionHandler___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) authorizationManager];
  [v2 handleAuthorizationRequestsForBundleIdentifier:a1[5] promptHandler:a1[6] completion:a1[7]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authorizationRequestIdentifiers, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

- (void)beginAuthorizationRequestDelegateTransactionWithSessionIdentifier:(id)a3 clientProcess:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"HDClientAuthorizationOracle.m", 1089, @"Invalid parameter not satisfying: %@", @"completion != NULL" object file lineNumber description];
  }
  uint64_t v12 = *MEMORY[0x1E4F29748];
  id v20 = 0;
  char v13 = [v10 hasRequiredEntitlement:v12 error:&v20];
  id v14 = v20;
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __134__HDClientAuthorizationOracle_Privileged__beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_clientProcess_completion___block_invoke;
    block[3] = &unk_1E62F4E40;
    block[4] = self;
    id v18 = v9;
    id v19 = v11;
    dispatch_async(queue, block);
  }
  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0, v14);
  }
}

void __134__HDClientAuthorizationOracle_Privileged__beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_clientProcess_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  id v4 = v2;
  id v5 = v4;
  if (v1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke;
    aBlock[3] = &unk_1E62F8AA0;
    id v16 = v4;
    id v5 = _Block_copy(aBlock);
    unsigned __int8 v6 = atomic_load((unsigned __int8 *)(v1 + 64));
    if (v6)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = objc_opt_class();
      id v9 = @"Authorization server invalidated";
    }
    else if (*(void *)(v1 + 56))
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = objc_opt_class();
      id v9 = @"There is already an open transaction";
    }
    else
    {
      if (v3)
      {
        id v11 = [*(id *)(v1 + 8) authorizationManager];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_481;
        v12[3] = &unk_1E62F8AF0;
        void v12[4] = v1;
        id v13 = v3;
        id v14 = v5;
        [v11 beginAuthorizationDelegateTransactionWithSessionIdentifier:v13 completion:v12];

        goto LABEL_7;
      }
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = objc_opt_class();
      id v9 = @"sessionIdentifier may not be nil";
    }
    id v10 = objc_msgSend(v7, "hk_errorForInvalidArgument:class:selector:format:", @"@\"\"", v8, sel__queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion_, v9);
    (*((void (**)(void *, void, void *))v5 + 2))(v5, 0, v10);

LABEL_7:
  }
}

void __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "Could not begin transaction: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_481(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E62F8AC8;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v16 = v6;
  id v17 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t __127__HDClientAuthorizationOracle_Privileged___queue_beginAuthorizationRequestDelegateTransactionWithSessionIdentifier_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 56), *(id *)(a1 + 48));
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

- (void)endAuthorizationRequestDelegateTransactionWithSessionIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = atomic_load((unsigned __int8 *)&self->_invalidated);
  if ((v8 & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__HDClientAuthorizationOracle_Privileged__endAuthorizationRequestDelegateTransactionWithSessionIdentifier_error___block_invoke;
    block[3] = &unk_1E62F30F8;
    void block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(queue, block);
  }
}

void __113__HDClientAuthorizationOracle_Privileged__endAuthorizationRequestDelegateTransactionWithSessionIdentifier_error___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[5];
  id v3 = *(void **)(a1[4] + 56);
  if (v3 == v2 || v2 && objc_msgSend(v3, "isEqual:"))
  {
    _HKInitializeLogging();
    id v4 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[5];
      int v12 = 138543362;
      uint64_t v13 = v5;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_INFO, "Ending transaction %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v6 = [*(id *)(a1[4] + 8) authorizationManager];
    [v6 endAuthorizationDelegateTransactionWithSessionIdentifier:*(void *)(a1[4] + 56) error:a1[6]];

    uint64_t v7 = a1[4];
    unsigned __int8 v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0;
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = a1[5];
      uint64_t v11 = *(void *)(a1[4] + 56);
      int v12 = 138543618;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "No active transaction to end (Ending %{public}@, but active is %{public}@)", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)updateDefaultAuthorizationStatusesForSource:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = [(_HKEntitlements *)self->_entitlements typesForReadAuthorizationOverride];
  uint64_t v7 = [(_HKEntitlements *)self->_entitlements typesForWriteAuthorizationOverride];
  unsigned __int8 v8 = [v6 setByAddingObjectsFromSet:v7];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke;
  aBlock[3] = &unk_1E62F29A0;
  id v27 = v5;
  id v9 = _Block_copy(aBlock);
  if ([v8 count])
  {
    uint64_t v10 = [(HDProfile *)self->_profile authorizationManager];
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    id v25 = 0;
    int v12 = [v10 authorizationStatusForTypes:v8 bundleIdentifier:sourceBundleIdentifier error:&v25];
    id v13 = v25;

    if (v12)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_3;
      v21[3] = &unk_1E62F8B18;
      id v15 = v6;
      id v22 = v15;
      id v16 = v7;
      id v23 = v16;
      id v17 = v14;
      id v24 = v17;
      [v12 enumerateKeysAndObjectsUsingBlock:v21];
      if ([v17 count])
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_4;
        v18[3] = &unk_1E62F2A18;
        v18[4] = self;
        id v19 = v17;
        id v20 = v9;
        [(HDClientAuthorizationOracle *)self enqueueAuthorizationRequestToWriteTypes:v16 readTypes:v15 authorizationNeededHandler:0 requestCompletionHandler:v18];
        [(HDClientAuthorizationOracle *)self handleAuthorizationRequestsWithPromptHandler:0 requestCompletionHandler:0];
      }
      else
      {
        (*((void (**)(void *, uint64_t, void))v9 + 2))(v9, 1, 0);
      }
    }
    else
    {
      (*((void (**)(void *, void, id))v9 + 2))(v9, 0, v13);
    }
  }
  else
  {
    (*((void (**)(void *, uint64_t, void))v9 + 2))(v9, 1, 0);
  }
}

void __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 32);
  id v5 = v4;
  HKDispatchAsyncOnGlobalConcurrentQueue();
}

uint64_t __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

void __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v11 = a2;
  if ([a3 integerValue] == 100)
  {
    int v5 = [a1[4] containsObject:v11];
    int v6 = [a1[5] containsObject:v11];
    uint64_t v7 = 103;
    if ((v6 & v5) != 0) {
      uint64_t v7 = 101;
    }
    uint64_t v8 = 104;
    if (v6) {
      uint64_t v8 = 102;
    }
    if (v5) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v8;
    }
    uint64_t v10 = [NSNumber numberWithInteger:v9];
    [a1[6] setObject:v10 forKeyedSubscript:v11];
  }
}

void __98__HDClientAuthorizationOracle_Privileged__updateDefaultAuthorizationStatusesForSource_completion___block_invoke_4(void *a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1[4] + 8) authorizationManager];
    [v4 setAuthorizationStatuses:a1[5] authorizationModes:MEMORY[0x1E4F1CC08] forBundleIdentifier:*(void *)(a1[4] + 16) options:2 completion:a1[6]];
  }
  else
  {
    id v3 = *(void (**)(void))(a1[6] + 16);
    v3();
  }
}

@end