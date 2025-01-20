@interface HDCloudSyncOperationConfiguration
- (BOOL)canceled;
- (BOOL)rebaseProhibited;
- (BOOL)satisfiesOperationTagDependencies:(id)a3 error:(id *)a4;
- (CKOperationGroup)operationGroup;
- (HDAssertion)accessibilityAssertion;
- (HDCloudSyncCachedCloudState)cachedCloudState;
- (HDCloudSyncComputedState)computedState;
- (HDCloudSyncContext)context;
- (HDCloudSyncOperationConfiguration)initWithRepository:(id)a3 operationGroup:(id)a4 syncContainerPrefix:(id)a5 context:(id)a6 accessibilityAssertion:(id)a7 syncIdentifier:(id)a8 syncDate:(id)a9;
- (HDCloudSyncRepository)repository;
- (NSDate)syncDate;
- (NSDictionary)analyticsDictionary;
- (NSSet)finishedOperationTags;
- (NSString)shortProfileIdentifier;
- (NSString)shortSyncIdentifier;
- (NSString)syncContainerPrefix;
- (NSUUID)syncIdentifier;
- (id)descriptionForSignpost;
- (id)pushStoreWithIdentifier:(id)a3 container:(id)a4 error:(id *)a5;
- (id)pushStoresForContainer:(id)a3 error:(id *)a4;
- (void)cancelAllOperations;
- (void)didFinishOperationTag:(id)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setComputedState:(id)a3;
@end

@implementation HDCloudSyncOperationConfiguration

- (HDCloudSyncOperationConfiguration)initWithRepository:(id)a3 operationGroup:(id)a4 syncContainerPrefix:(id)a5 context:(id)a6 accessibilityAssertion:(id)a7 syncIdentifier:(id)a8 syncDate:(id)a9
{
  id v16 = a3;
  id v50 = a4;
  id v17 = a5;
  id obj = a6;
  id v18 = a6;
  id v49 = a7;
  id v19 = a8;
  id v20 = a9;
  v51 = v18;
  if (([v18 options] & 8) != 0 && (objc_msgSend(v18, "options") & 0x40) != 0)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"HDCloudSyncOperationConfiguration.m", 74, @"Invalid parameter not satisfying: %@", @"!((context.options & HKCloudSyncOptionRebase) && (context.options & HKCloudSyncOptionRebaseProhibited))" object file lineNumber description];
  }
  v52.receiver = self;
  v52.super_class = (Class)HDCloudSyncOperationConfiguration;
  v21 = [(HDCloudSyncOperationConfiguration *)&v52 init];
  v22 = v21;
  v23 = v16;
  v24 = v17;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_repository, a3);
    objc_storeStrong((id *)&v22->_operationGroup, a4);
    uint64_t v25 = [v17 copy];
    syncContainerPrefix = v22->_syncContainerPrefix;
    v22->_syncContainerPrefix = (NSString *)v25;

    objc_storeStrong((id *)&v22->_context, obj);
    objc_storeStrong((id *)&v22->_accessibilityAssertion, a7);
    uint64_t v27 = [v19 copy];
    syncIdentifier = v22->_syncIdentifier;
    v22->_syncIdentifier = (NSUUID *)v27;

    uint64_t v29 = [v20 copy];
    syncDate = v22->_syncDate;
    v22->_syncDate = (NSDate *)v29;

    v31 = [v19 UUIDString];
    uint64_t v32 = [v31 substringToIndex:4];
    shortSyncIdentifier = v22->_shortSyncIdentifier;
    v22->_shortSyncIdentifier = (NSString *)v32;

    v34 = [v23 profile];
    v35 = [v34 profileIdentifier];
    v36 = [v35 identifier];
    [v36 UUIDString];
    v38 = v37 = v23;
    uint64_t v39 = [v38 substringToIndex:4];
    shortProfileIdentifier = v22->_shortProfileIdentifier;
    v22->_shortProfileIdentifier = (NSString *)v39;

    v23 = v37;
    v41 = [[HDCloudSyncCachedCloudState alloc] initWithRepository:v22->_repository accessibilityAssertion:v22->_accessibilityAssertion];
    cachedCloudState = v22->_cachedCloudState;
    v22->_cachedCloudState = v41;

    v43 = objc_alloc_init(HDCloudSyncComputedState);
    computedState = v22->_computedState;
    v22->_computedState = v43;
  }
  return v22;
}

- (BOOL)rebaseProhibited
{
  return ([(HDCloudSyncContext *)self->_context options] >> 6) & 1;
}

- (id)pushStoresForContainer:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(HDCloudSyncRepository *)self->_repository cachedOwnerIdentifierForContainer:v6];
  uint64_t v8 = [v7 string];

  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = [v6 containerIdentifier];
    *(_DWORD *)buf = 138543874;
    v37 = self;
    __int16 v38 = 2114;
    uint64_t v39 = v8;
    __int16 v40 = 2114;
    v41 = v11;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Look for a local cloud sync store with owner: %{public}@, container: %{public}@", buf, 0x20u);
  }
  v12 = [v6 containerIdentifier];
  v13 = [(HDCloudSyncRepository *)self->_repository syncIdentityManager];
  v14 = [v13 currentSyncIdentity];
  v15 = [v14 identity];
  id v16 = [(HDCloudSyncRepository *)self->_repository profile];
  id v17 = [v16 legacyRepositoryProfile];
  v30 = (void *)v8;
  id v18 = +[HDCloudSyncStoreEntity storeIdentifiersForOwnerIdentifier:v8 containerIdentifier:v12 syncIdentity:v15 profile:v17 error:a4];

  id v19 = v18;
  if (v18)
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = [(HDCloudSyncOperationConfiguration *)self pushStoreWithIdentifier:*(void *)(*((void *)&v31 + 1) + 8 * i) container:v6 error:a4];
          if (!v26)
          {

            id v28 = 0;
            goto LABEL_14;
          }
          uint64_t v27 = (void *)v26;
          [v20 addObject:v26];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v35 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    id v28 = v20;
LABEL_14:
  }
  else
  {
    id v28 = 0;
  }

  return v28;
}

- (id)pushStoreWithIdentifier:(id)a3 container:(id)a4 error:(id *)a5
{
  repository = self->_repository;
  id v8 = a4;
  id v9 = a3;
  v10 = [(HDCloudSyncRepository *)repository cachedOwnerIdentifierForContainer:v8];
  id v20 = [v10 string];

  v11 = [(HDCloudSyncRepository *)self->_repository profile];
  v12 = [v11 legacyRepositoryProfile];
  syncContainerPrefix = self->_syncContainerPrefix;
  v14 = [(HDCloudSyncRepository *)self->_repository syncIdentityManager];
  v15 = [v14 currentSyncIdentity];
  id v16 = [v15 identity];
  id v17 = [v8 containerIdentifier];

  id v18 = +[HDCloudSyncStore syncStoreForProfile:v12 storeIdentifier:v9 syncCircleName:syncContainerPrefix ownerIdentifier:v20 syncIdentity:v16 containerIdentifier:v17 error:a5];

  return v18;
}

- (id)descriptionForSignpost
{
  v3 = NSString;
  [(HDCloudSyncContext *)self->_context options];
  v4 = HKCloudSyncOptionsToString();
  [(HDCloudSyncContext *)self->_context reason];
  v5 = HKCloudSyncReasonToString();
  id v6 = [(CKOperationGroup *)self->_operationGroup name];
  v7 = [v3 stringWithFormat:@"options=(%@), reason=(%@), groupName=%@, syncCircle=%@", v4, v5, v6, self->_syncContainerPrefix];

  return v7;
}

- (NSDictionary)analyticsDictionary
{
  v19[10] = *MEMORY[0x1E4F143B8];
  v18[0] = @"reason";
  id v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDCloudSyncContext reason](self->_context, "reason"));
  v19[0] = v17;
  v18[1] = @"options";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HDCloudSyncContext options](self->_context, "options"));
  v19[1] = v3;
  v18[2] = @"group";
  uint64_t v4 = [(CKOperationGroup *)self->_operationGroup name];
  v5 = (void *)v4;
  id v6 = @"<none>";
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  syncContainerPrefix = self->_syncContainerPrefix;
  v19[2] = v6;
  v19[3] = syncContainerPrefix;
  v18[3] = @"syncContainerPrefix";
  v18[4] = @"syncIdentifier";
  id v8 = [(NSUUID *)self->_syncIdentifier UUIDString];
  v19[4] = v8;
  v18[5] = @"expectedSendSize";
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[CKOperationGroup expectedSendSize](self->_operationGroup, "expectedSendSize"));
  v19[5] = v9;
  v18[6] = @"expectedReceiveSize";
  v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[CKOperationGroup expectedReceiveSize](self->_operationGroup, "expectedReceiveSize"));
  v19[6] = v10;
  v18[7] = @"hasAccessibilityAssertion";
  v11 = [NSNumber numberWithInt:self->_accessibilityAssertion != 0];
  v19[7] = v11;
  v18[8] = @"manateeEnabled";
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HDCloudSyncRepository repositorySettings](self->_repository, "repositorySettings") & 1);
  v19[8] = v12;
  v18[9] = @"primaryContainer";
  v13 = [(HDCloudSyncRepository *)self->_repository primaryCKContainer];
  v14 = [v13 containerIdentifier];
  v19[9] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:10];

  return (NSDictionary *)v15;
}

- (void)cancelAllOperations
{
}

- (NSSet)finishedOperationTags
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableSet *)self->_finishedTags copy];
  os_unfair_lock_unlock(p_lock);
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }
  id v6 = v5;

  return (NSSet *)v6;
}

- (void)didFinishOperationTag:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  finishedTags = self->_finishedTags;
  if (!finishedTags)
  {
    id v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v6 = self->_finishedTags;
    self->_finishedTags = v5;

    finishedTags = self->_finishedTags;
  }
  [(NSMutableSet *)finishedTags addObject:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)satisfiesOperationTagDependencies:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (([(NSMutableSet *)self->_finishedTags containsObject:v13] & 1) == 0)
        {
          if (!v10) {
            id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v10 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    id v10 = 0;
  }

  os_unfair_lock_unlock(&self->_lock);
  uint64_t v14 = [v10 count];
  if (v14) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 734, @"Operation dependencies not satisifed: %@", v10);
  }

  return v14 == 0;
}

- (HDCloudSyncRepository)repository
{
  return self->_repository;
}

- (CKOperationGroup)operationGroup
{
  return self->_operationGroup;
}

- (NSString)syncContainerPrefix
{
  return self->_syncContainerPrefix;
}

- (HDCloudSyncContext)context
{
  return self->_context;
}

- (HDAssertion)accessibilityAssertion
{
  return self->_accessibilityAssertion;
}

- (NSUUID)syncIdentifier
{
  return self->_syncIdentifier;
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (NSString)shortSyncIdentifier
{
  return self->_shortSyncIdentifier;
}

- (NSString)shortProfileIdentifier
{
  return self->_shortProfileIdentifier;
}

- (HDCloudSyncCachedCloudState)cachedCloudState
{
  return self->_cachedCloudState;
}

- (HDCloudSyncComputedState)computedState
{
  return (HDCloudSyncComputedState *)objc_getProperty(self, a2, 104, 1);
}

- (void)setComputedState:(id)a3
{
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedState, 0);
  objc_storeStrong((id *)&self->_cachedCloudState, 0);
  objc_storeStrong((id *)&self->_shortProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_shortSyncIdentifier, 0);
  objc_storeStrong((id *)&self->_syncDate, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_accessibilityAssertion, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_syncContainerPrefix, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_repository, 0);

  objc_storeStrong((id *)&self->_finishedTags, 0);
}

@end