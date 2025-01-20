@interface HKSourceAuthorizationController
- (BOOL)_parentTypeDisabledForType:(id)a3 inSection:(int64_t)a4;
- (BOOL)allTypesEnabled;
- (BOOL)allTypesEnabledInSection:(int64_t)a3;
- (BOOL)anyTypeEnabled;
- (BOOL)anyTypeRequested;
- (BOOL)isRequestingDocumentAuthorization;
- (BOOL)isTypeEnabled:(id)a3 inSection:(int64_t)a4;
- (BOOL)isUpdatingAllTypes;
- (HKHealthStore)healthStore;
- (HKSource)source;
- (HKSourceAuthorizationController)initWithHealthStore:(id)a3 source:(id)a4 typesForSharing:(id)a5 typesForReading:(id)a6;
- (HKSourceAuthorizationControllerDelegate)delegate;
- (NSArray)orderedTypesForReading;
- (NSArray)orderedTypesForSharing;
- (NSDictionary)requestedDocumentAuths;
- (NSMutableSet)typesEnabledForReading;
- (NSMutableSet)typesEnabledForSharing;
- (NSSet)requestedTypesForReading;
- (NSSet)requestedTypesForSharing;
- (id)_enabledSubTypesForType:(id)a3 inSection:(int64_t)a4;
- (id)_enabledTypesInSection:(int64_t)a3;
- (id)_sortedTypes:(id)a3;
- (id)objectAuthorizationStatusesForDocuments;
- (id)typesInSection:(int64_t)a3;
- (int64_t)_authorizationStatusWithType:(id)a3;
- (unint64_t)countOfTypesInSection:(int64_t)a3;
- (void)_reloadDocumentAuthorizationRecords;
- (void)_reloadTypeAuthorizationRecords;
- (void)_setAuthorizationStatuses:(id)a3;
- (void)_updateAuthorizationStatusWithTypes:(id)a3;
- (void)commitAuthorizationStatuses;
- (void)commitObjectAuthorizationStatuses:(id)a3;
- (void)reload;
- (void)resetObjectAuthorizationStatuses;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3 forAllTypesInSection:(int64_t)a4 commit:(BOOL)a5;
- (void)setEnabled:(BOOL)a3 forType:(id)a4 inSection:(int64_t)a5 commit:(BOOL)a6;
- (void)setIsUpdatingAllTypes:(BOOL)a3;
- (void)setOrderedTypesForReading:(id)a3;
- (void)setOrderedTypesForSharing:(id)a3;
- (void)setRequestedDocumentAuths:(id)a3;
- (void)setRequestedTypesForReading:(id)a3;
- (void)setRequestedTypesForSharing:(id)a3;
- (void)setTypesEnabledForReading:(id)a3;
- (void)setTypesEnabledForSharing:(id)a3;
@end

@implementation HKSourceAuthorizationController

- (HKSourceAuthorizationController)initWithHealthStore:(id)a3 source:(id)a4 typesForSharing:(id)a5 typesForReading:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"HKSourceAuthorizationController.m", 41, @"Invalid parameter not satisfying: %@", @"healthStore != nil" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"HKSourceAuthorizationController.m", 42, @"Invalid parameter not satisfying: %@", @"source != nil" object file lineNumber description];

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)HKSourceAuthorizationController;
  v16 = [(HKSourceAuthorizationController *)&v28 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_healthStore, a3);
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F2AC68]) initWithHealthStore:v12];
    authorizationStore = v17->_authorizationStore;
    v17->_authorizationStore = (HKAuthorizationStore *)v18;

    objc_storeStrong((id *)&v17->_source, a4);
    uint64_t v20 = [v14 copy];
    requestedTypesForSharing = v17->_requestedTypesForSharing;
    v17->_requestedTypesForSharing = (NSSet *)v20;

    uint64_t v22 = [v15 copy];
    requestedTypesForReading = v17->_requestedTypesForReading;
    v17->_requestedTypesForReading = (NSSet *)v22;

    requestedDocumentAuths = v17->_requestedDocumentAuths;
    v17->_requestedDocumentAuths = 0;

    v17->_isUpdatingAllTypes = 0;
    [(HKSourceAuthorizationController *)v17 reload];
  }

  return v17;
}

- (void)reload
{
  [(HKSourceAuthorizationController *)self _reloadTypeAuthorizationRecords];
  [(HKSourceAuthorizationController *)self _reloadDocumentAuthorizationRecords];
}

- (void)_reloadDocumentAuthorizationRecords
{
  v3 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
  authorizationStore = self->_authorizationStore;
  v5 = [(HKSource *)self->_source bundleIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke;
  v6[3] = &unk_1E6D55820;
  v6[4] = self;
  [(HKAuthorizationStore *)authorizationStore fetchAuthorizationStatusesForDocumentType:v3 bundleIdentifier:v5 completion:v6];
}

void __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke_cold_1((uint64_t)v6, v7);
    }
  }
  [*(id *)(a1 + 32) setRequestedDocumentAuths:v5];
}

- (void)_reloadTypeAuthorizationRecords
{
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__25;
  v34 = __Block_byref_object_dispose__25;
  id v35 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  authorizationStore = self->_authorizationStore;
  id v5 = [(HKSource *)self->_source bundleIdentifier];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke;
  v27[3] = &unk_1E6D56588;
  v29 = &v30;
  v27[4] = self;
  id v6 = v3;
  objc_super v28 = v6;
  [(HKAuthorizationStore *)authorizationStore fetchAuthorizationRecordsForBundleIdentifier:v5 completion:v27];

  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [MEMORY[0x1E4F1CA48] array];
  v9 = [MEMORY[0x1E4F1CA80] set];
  typesEnabledForSharing = self->_typesEnabledForSharing;
  self->_typesEnabledForSharing = v9;

  v11 = [MEMORY[0x1E4F1CA80] set];
  typesEnabledForReading = self->_typesEnabledForReading;
  self->_typesEnabledForReading = v11;

  id v13 = (void *)v31[5];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_294;
  v23 = &unk_1E6D565B0;
  v24 = self;
  id v14 = v7;
  id v25 = v14;
  id v15 = v8;
  id v26 = v15;
  [v13 enumerateKeysAndObjectsUsingBlock:&v20];
  -[HKSourceAuthorizationController _sortedTypes:](self, "_sortedTypes:", v14, v20, v21, v22, v23, v24);
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedTypesForSharing = self->_orderedTypesForSharing;
  self->_orderedTypesForSharing = v16;

  uint64_t v18 = [(HKSourceAuthorizationController *)self _sortedTypes:v15];
  orderedTypesForReading = self->_orderedTypesForReading;
  self->_orderedTypesForReading = v18;

  _Block_object_dispose(&v30, 8);
}

void __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  if (v7)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_cold_1(a1, v8);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 status];
  if (([v10 isClinicalType] & 1) == 0)
  {
    if (v6 == 100 || (uint64_t v7 = *(void *)(a1 + 32), !*(void *)(v7 + 88)) || !*(void *)(v7 + 80))
    {
      if ([v5 requestedSharing])
      {
        v8 = *(void **)(*(void *)(a1 + 32) + 80);
        if (!v8 || [v8 containsObject:v10])
        {
          [*(id *)(a1 + 40) addObject:v10];
          if (HKAuthorizationStatusAllowsSharing()) {
            [*(id *)(*(void *)(a1 + 32) + 64) addObject:v10];
          }
        }
      }
      if ([v5 requestedReading])
      {
        v9 = *(void **)(*(void *)(a1 + 32) + 88);
        if (!v9 || [v9 containsObject:v10])
        {
          [*(id *)(a1 + 48) addObject:v10];
          if (HKAuthorizationStatusAllowsReading()) {
            [*(id *)(*(void *)(a1 + 32) + 72) addObject:v10];
          }
        }
      }
    }
  }
}

- (id)_sortedTypes:(id)a3
{
  dispatch_semaphore_t v3 = [MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  [v3 sortUsingComparator:&__block_literal_global_79];
  v4 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v4;
}

uint64_t __48__HKSourceAuthorizationController__sortedTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_msgSend(a2, "hk_localizedName");
  uint64_t v6 = objc_msgSend(v4, "hk_localizedName");

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (BOOL)isRequestingDocumentAuthorization
{
  orderedTypesForReading = self->_orderedTypesForReading;
  dispatch_semaphore_t v3 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
  LOBYTE(orderedTypesForReading) = [(NSArray *)orderedTypesForReading indexOfObject:v3] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)orderedTypesForReading;
}

- (unint64_t)countOfTypesInSection:(int64_t)a3
{
  dispatch_semaphore_t v3 = [(HKSourceAuthorizationController *)self typesInSection:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (id)typesInSection:(int64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v4 = 48;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    return v5;
  }
  if (a3 == 6)
  {
    uint64_t v4 = 56;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (id)objectAuthorizationStatusesForDocuments
{
  return self->_requestedDocumentAuths;
}

- (void)commitObjectAuthorizationStatuses:(id)a3
{
  authorizationStore = self->_authorizationStore;
  source = self->_source;
  uint64_t v6 = self;
  id v7 = a3;
  v8 = [(HKSource *)source bundleIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke;
  v9[3] = &unk_1E6D512C8;
  v9[4] = v6;
  [(HKAuthorizationStore *)authorizationStore setObjectAuthorizationStatuses:v7 forObjectType:0 bundleIdentifier:v8 sessionIdentifier:0 completion:v9];
}

void __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke_cold_1(a1, v6);
    }
  }
  [*(id *)(a1 + 32) _reloadDocumentAuthorizationRecords];
}

- (void)resetObjectAuthorizationStatuses
{
  uint64_t v3 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
  authorizationStore = self->_authorizationStore;
  id v5 = [(HKSource *)self->_source bundleIdentifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke;
  v6[3] = &unk_1E6D512C8;
  v6[4] = self;
  [(HKAuthorizationStore *)authorizationStore resetAllObjectAuthorizationStatusForBundleIdentifier:v5 objectType:v3 completion:v6];
}

void __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = (void *)*MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke_cold_1(a1, v6);
    }
  }
  [*(id *)(a1 + 32) _reloadDocumentAuthorizationRecords];
}

- (BOOL)isTypeEnabled:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKSourceAuthorizationController *)self _enabledTypesInSection:a4];
  LOBYTE(self) = [v7 containsObject:v6];

  return (char)self;
}

- (void)setEnabled:(BOOL)a3 forType:(id)a4 inSection:(int64_t)a5 commit:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a3;
  id v10 = a4;
  v11 = [(HKSourceAuthorizationController *)self _enabledTypesInSection:a5];
  id v12 = [MEMORY[0x1E4F1CA80] setWithObject:v10];
  if (v8)
  {
    if ([(HKSourceAuthorizationController *)self _parentTypeDisabledForType:v10 inSection:a5]&& !self->_isUpdatingAllTypes)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke;
      v19[3] = &unk_1E6D565F8;
      v19[4] = self;
      id v20 = v10;
      int64_t v21 = a5;
      dispatch_async(MEMORY[0x1E4F14428], v19);

      goto LABEL_12;
    }
    [v11 addObject:v10];
    if (!v6) {
      goto LABEL_12;
    }
LABEL_9:
    [(HKSourceAuthorizationController *)self _updateAuthorizationStatusWithTypes:v12];
    goto LABEL_12;
  }
  id v13 = [(HKSourceAuthorizationController *)self _enabledSubTypesForType:v10 inSection:a5];
  if ([v13 count] && !self->_isUpdatingAllTypes)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke_2;
    block[3] = &unk_1E6D52CF0;
    block[4] = self;
    id v16 = v13;
    id v17 = v10;
    int64_t v18 = a5;
    id v14 = v13;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_12;
  }
  [v11 removeObject:v10];

  if (v6) {
    goto LABEL_9;
  }
LABEL_12:
}

void __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) parentType];
  [v4 authorizationController:v2 parentTypeIsDisabled:v3 forType:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
}

void __71__HKSourceAuthorizationController_setEnabled_forType_inSection_commit___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 authorizationController:*(void *)(a1 + 32) subTypesEnabled:*(void *)(a1 + 40) forType:*(void *)(a1 + 48) inSection:*(void *)(a1 + 56)];
}

- (BOOL)_parentTypeDisabledForType:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 parentType];

  if (v7)
  {
    BOOL v8 = [(HKSourceAuthorizationController *)self typesInSection:a4];
    v9 = [v6 parentType];
    char v10 = [v8 containsObject:v9];

    v11 = [v6 parentType];
    int v12 = ![(HKSourceAuthorizationController *)self isTypeEnabled:v11 inSection:a4];

    char v13 = v10 & v12;
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)_enabledSubTypesForType:(id)a3 inSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(HKSourceAuthorizationController *)self _enabledTypesInSection:a4];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__HKSourceAuthorizationController__enabledSubTypesForType_inSection___block_invoke;
  v11[3] = &unk_1E6D56620;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 objectsPassingTest:v11];

  return v9;
}

uint64_t __69__HKSourceAuthorizationController__enabledSubTypesForType_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 parentType];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)allTypesEnabled
{
  BOOL v3 = [(HKSourceAuthorizationController *)self allTypesEnabledInSection:6];
  if (v3)
  {
    LOBYTE(v3) = [(HKSourceAuthorizationController *)self allTypesEnabledInSection:4];
  }
  return v3;
}

- (BOOL)allTypesEnabledInSection:(int64_t)a3
{
  if (a3 == 6)
  {
    uint64_t v4 = 56;
    uint64_t v5 = 72;
    goto LABEL_5;
  }
  if (a3 == 4)
  {
    uint64_t v4 = 48;
    uint64_t v5 = 64;
LABEL_5:
    uint64_t v6 = [*(id *)((char *)&self->super.isa + v5) count];
    return v6 == [*(id *)((char *)&self->super.isa + v4) count];
  }
  return 0;
}

- (BOOL)anyTypeEnabled
{
  return [(NSMutableSet *)self->_typesEnabledForReading count]
      || [(NSMutableSet *)self->_typesEnabledForSharing count] != 0;
}

- (BOOL)anyTypeRequested
{
  BOOL v3 = [(HKSourceAuthorizationController *)self orderedTypesForReading];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(HKSourceAuthorizationController *)self orderedTypesForSharing];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3 forAllTypesInSection:(int64_t)a4 commit:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_isUpdatingAllTypes = 1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = -[HKSourceAuthorizationController typesInSection:](self, "typesInSection:", a4, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [(HKSourceAuthorizationController *)self setEnabled:v7 forType:*(void *)(*((void *)&v14 + 1) + 8 * v13++) inSection:a4 commit:v5];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  self->_isUpdatingAllTypes = 0;
}

- (void)commitAuthorizationStatuses
{
  id v3 = [MEMORY[0x1E4F1CA80] set];
  [v3 addObjectsFromArray:self->_orderedTypesForSharing];
  [v3 addObjectsFromArray:self->_orderedTypesForReading];
  [(HKSourceAuthorizationController *)self _updateAuthorizationStatusWithTypes:v3];
}

- (int64_t)_authorizationStatusWithType:(id)a3
{
  typesEnabledForSharing = self->_typesEnabledForSharing;
  id v5 = a3;
  uint64_t v6 = [(NSMutableSet *)typesEnabledForSharing containsObject:v5];
  uint64_t v7 = [(NSMutableSet *)self->_typesEnabledForReading containsObject:v5];

  return MEMORY[0x1F40E7D58](v6, v7);
}

- (void)_updateAuthorizationStatusWithTypes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKSourceAuthorizationController _authorizationStatusWithType:](self, "_authorizationStatusWithType:", v11, (void)v13));
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  [(HKSourceAuthorizationController *)self _setAuthorizationStatuses:v5];
}

- (void)_setAuthorizationStatuses:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  authorizationStore = self->_authorizationStore;
  uint64_t v7 = [(HKSource *)self->_source bundleIdentifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke;
  v9[3] = &unk_1E6D512C8;
  dispatch_semaphore_t v10 = v5;
  uint64_t v8 = v5;
  [(HKAuthorizationStore *)authorizationStore setAuthorizationStatuses:v4 authorizationModes:MEMORY[0x1E4F1CC08] forBundleIdentifier:v7 options:0 completion:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

void __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x1E4F29EF8];
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v7 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR)) {
      __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_2((uint64_t)v5, v7);
    }
  }
  _HKInitializeLogging();
  uint64_t v8 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG)) {
    __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_1(v8);
  }
  notify_post("HKUIAuthorizationDidUpdateNotification");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_enabledTypesInSection:(int64_t)a3
{
  if (a3 == 4)
  {
    uint64_t v4 = 64;
LABEL_5:
    id v5 = *(id *)((char *)&self->super.isa + v4);
    return v5;
  }
  if (a3 == 6)
  {
    uint64_t v4 = 72;
    goto LABEL_5;
  }
  id v5 = 0;
  return v5;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKSource)source
{
  return self->_source;
}

- (HKSourceAuthorizationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSourceAuthorizationControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)orderedTypesForSharing
{
  return self->_orderedTypesForSharing;
}

- (void)setOrderedTypesForSharing:(id)a3
{
}

- (NSArray)orderedTypesForReading
{
  return self->_orderedTypesForReading;
}

- (void)setOrderedTypesForReading:(id)a3
{
}

- (NSMutableSet)typesEnabledForSharing
{
  return self->_typesEnabledForSharing;
}

- (void)setTypesEnabledForSharing:(id)a3
{
}

- (NSMutableSet)typesEnabledForReading
{
  return self->_typesEnabledForReading;
}

- (void)setTypesEnabledForReading:(id)a3
{
}

- (NSSet)requestedTypesForSharing
{
  return self->_requestedTypesForSharing;
}

- (void)setRequestedTypesForSharing:(id)a3
{
}

- (NSSet)requestedTypesForReading
{
  return self->_requestedTypesForReading;
}

- (void)setRequestedTypesForReading:(id)a3
{
}

- (NSDictionary)requestedDocumentAuths
{
  return self->_requestedDocumentAuths;
}

- (void)setRequestedDocumentAuths:(id)a3
{
}

- (BOOL)isUpdatingAllTypes
{
  return self->_isUpdatingAllTypes;
}

- (void)setIsUpdatingAllTypes:(BOOL)a3
{
  self->_isUpdatingAllTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedDocumentAuths, 0);
  objc_storeStrong((id *)&self->_requestedTypesForReading, 0);
  objc_storeStrong((id *)&self->_requestedTypesForSharing, 0);
  objc_storeStrong((id *)&self->_typesEnabledForReading, 0);
  objc_storeStrong((id *)&self->_typesEnabledForSharing, 0);
  objc_storeStrong((id *)&self->_orderedTypesForReading, 0);
  objc_storeStrong((id *)&self->_orderedTypesForSharing, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
}

void __70__HKSourceAuthorizationController__reloadDocumentAuthorizationRecords__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "failed to get object authorization records with error: %@", (uint8_t *)&v2, 0xCu);
}

void __66__HKSourceAuthorizationController__reloadTypeAuthorizationRecords__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v4, v5, "%{public}@: failed to get authorization records: %{public}@", v6, v7, v8, v9, 2u);
}

void __69__HKSourceAuthorizationController_commitObjectAuthorizationStatuses___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 source];
  uint64_t v5 = [v4 bundleIdentifier];
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v6, v7, "Failed to set status for bundleId %@ with error: %@.", v8, v9, v10, v11, v12);
}

void __67__HKSourceAuthorizationController_resetObjectAuthorizationStatuses__block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 source];
  uint64_t v5 = [v4 bundleIdentifier];
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_1(&dword_1E0B26000, v6, v7, "Failed to reset authorization for bundle id: %@ with error: %@", v8, v9, v10, v11, v12);
}

void __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E0B26000, log, OS_LOG_TYPE_DEBUG, "Posting notification from HealthPrivacyService", v1, 2u);
}

void __61__HKSourceAuthorizationController__setAuthorizationStatuses___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E0B26000, a2, OS_LOG_TYPE_ERROR, "Failed to set authorization statuses: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end