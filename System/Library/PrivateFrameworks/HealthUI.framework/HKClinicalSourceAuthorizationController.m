@interface HKClinicalSourceAuthorizationController
- (BOOL)_shouldUpdateDisplayReadAuthorizationAnchorDateWhenCommittingWithMode:(int64_t)a3;
- (BOOL)allTypesEnabled;
- (BOOL)anyDeterminedTypeAllowsReading;
- (BOOL)anyTypeEnabled;
- (BOOL)anyTypeRequested;
- (BOOL)isTypeEnabled:(id)a3;
- (HKAuthorizationStore)authorizationStore;
- (HKClinicalSourceAuthorizationController)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4 source:(id)a5 typesRequestedForReading:(id)a6;
- (HKHealthRecordsStore)healthRecordsStore;
- (HKHealthStore)healthStore;
- (HKSource)source;
- (NSArray)orderedTypesForReading;
- (NSDate)displayReadAuthorizationAnchorDate;
- (NSError)fetchError;
- (NSMutableSet)typesEnabledForReading;
- (NSSet)typesForReading;
- (NSSet)typesRequestedForReading;
- (id)_authorizationModesWithMode:(int64_t)a3 types:(id)a4;
- (id)_authorizationStatusesWithTypes:(id)a3;
- (id)_fetchAllClinicalAuthorizationRecordsWithError:(id *)a3;
- (id)_orderTypes:(id)a3;
- (id)_unitTesting_reminderRegistryCompletion;
- (int64_t)_authorizationStatusWithType:(id)a3;
- (int64_t)authorizationModeForSource;
- (void)_commitModeConfirmationAlertRegistrationShouldDisplay:(BOOL)a3;
- (void)_setAuthorizationStatuses:(id)a3 modes:(id)a4 shouldUpdateAnchor:(BOOL)a5;
- (void)_unitTesting_setReminderRegistryCompletion:(id)a3;
- (void)_updateDisplayReadAuthorizationAnchorDateIfNeededForCommittingModes:(id)a3;
- (void)_updateReminderRegistrationIfNeededForCommittingModes:(id)a3 anyTypeEnabled:(BOOL)a4;
- (void)commitAllTypesAndUpdateAuthorizationAnchorWithMode:(int64_t)a3;
- (void)reload;
- (void)setAnyDeterminedTypeAllowsReading:(BOOL)a3;
- (void)setAuthorizationModeForSource:(int64_t)a3;
- (void)setDisplayReadAuthorizationAnchorDate:(id)a3;
- (void)setEnabled:(BOOL)a3 forType:(id)a4 commit:(BOOL)a5;
- (void)setEnabledForAllTypes:(BOOL)a3;
- (void)setFetchError:(id)a3;
- (void)setTypesForReading:(id)a3;
@end

@implementation HKClinicalSourceAuthorizationController

- (HKClinicalSourceAuthorizationController)initWithHealthStore:(id)a3 healthRecordsStore:(id)a4 source:(id)a5 typesRequestedForReading:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKClinicalSourceAuthorizationController;
  v15 = [(HKClinicalSourceAuthorizationController *)&v27 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v16->_healthRecordsStore, a4);
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F2AC68]) initWithHealthStore:v11];
    authorizationStore = v16->_authorizationStore;
    v16->_authorizationStore = (HKAuthorizationStore *)v17;

    uint64_t v19 = [v13 copy];
    source = v16->_source;
    v16->_source = (HKSource *)v19;

    uint64_t v21 = [v14 copy];
    typesRequestedForReading = v16->_typesRequestedForReading;
    v16->_typesRequestedForReading = (NSSet *)v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    typesEnabledForReading = v16->_typesEnabledForReading;
    v16->_typesEnabledForReading = v23;

    orderedTypesForReading = v16->_orderedTypesForReading;
    v16->_orderedTypesForReading = (NSArray *)MEMORY[0x1E4F1CBF0];

    [(HKClinicalSourceAuthorizationController *)v16 reload];
  }

  return v16;
}

- (id)_fetchAllClinicalAuthorizationRecordsWithError:(id *)a3
{
  uint64_t v26 = 0;
  objc_super v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  id v25 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v6 = [(HKClinicalSourceAuthorizationController *)self authorizationStore];
  v7 = [(HKClinicalSourceAuthorizationController *)self source];
  v8 = [v7 bundleIdentifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke;
  v16[3] = &unk_1E6D53330;
  v18 = &v20;
  uint64_t v19 = &v26;
  v9 = v5;
  uint64_t v17 = v9;
  [v6 fetchAuthorizationRecordsForBundleIdentifier:v8 completion:v16];

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = objc_msgSend((id)v27[5], "hk_filter:", &__block_literal_global_28);
  id v11 = (void *)v27[5];
  v27[5] = v10;

  id v12 = (id)v21[5];
  id v13 = v12;
  if (v12)
  {
    if (a3) {
      *a3 = v12;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v14 = (id)v27[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v5;
  id v16 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke_279(uint64_t a1, void *a2)
{
  return [a2 isClinicalType];
}

- (void)reload
{
  [(HKClinicalSourceAuthorizationController *)self setAnyDeterminedTypeAllowsReading:0];
  [(HKClinicalSourceAuthorizationController *)self setAuthorizationModeForSource:1];
  [(HKClinicalSourceAuthorizationController *)self setDisplayReadAuthorizationAnchorDate:0];
  [(HKClinicalSourceAuthorizationController *)self setFetchError:0];
  id v24 = 0;
  v3 = [(HKClinicalSourceAuthorizationController *)self _fetchAllClinicalAuthorizationRecordsWithError:&v24];
  id v4 = v24;
  [(HKClinicalSourceAuthorizationController *)self setFetchError:v4];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v7 = [(HKClinicalSourceAuthorizationController *)self typesRequestedForReading];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __49__HKClinicalSourceAuthorizationController_reload__block_invoke;
  v18 = &unk_1E6D53378;
  BOOL v23 = v7 == 0;
  id v8 = v7;
  id v19 = v8;
  uint64_t v20 = self;
  id v9 = v6;
  id v21 = v9;
  id v10 = v5;
  id v22 = v10;
  [v3 enumerateKeysAndObjectsUsingBlock:&v15];
  uint64_t v11 = (NSSet *)objc_msgSend(v9, "copy", v15, v16, v17, v18);
  typesForReading = self->_typesForReading;
  self->_typesForReading = v11;

  objc_storeStrong((id *)&self->_typesEnabledForReading, v5);
  if (v3)
  {
    uint64_t v13 = [(HKClinicalSourceAuthorizationController *)self _orderTypes:v9];
    orderedTypesForReading = self->_orderedTypesForReading;
    self->_orderedTypesForReading = v13;
  }
  else
  {
    orderedTypesForReading = self->_orderedTypesForReading;
    self->_orderedTypesForReading = 0;
  }
}

void __49__HKClinicalSourceAuthorizationController_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 status];
  uint64_t v7 = v6;
  if (*(unsigned char *)(a1 + 64) || v6 != 100 || [*(id *)(a1 + 32) containsObject:v9])
  {
    [v5 status];
    if (HKAuthorizationStatusAllowsReading()) {
      [*(id *)(a1 + 40) setAnyDeterminedTypeAllowsReading:1];
    }
    if (v7 != 100)
    {
      objc_msgSend(*(id *)(a1 + 40), "setAuthorizationModeForSource:", objc_msgSend(v5, "mode"));
      id v8 = [v5 anchorLimitModifiedDate];
      [*(id *)(a1 + 40) setDisplayReadAuthorizationAnchorDate:v8];
    }
    [*(id *)(a1 + 48) addObject:v9];
    if ([v5 readingEnabled]) {
      [*(id *)(a1 + 56) addObject:v9];
    }
  }
}

- (id)_orderTypes:(id)a3
{
  healthStore = self->_healthStore;
  id v4 = a3;
  id v5 = +[HKDisplayTypeController sharedInstanceForHealthStore:healthStore];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HKClinicalSourceAuthorizationController__orderTypes___block_invoke;
  aBlock[3] = &unk_1E6D533A0;
  id v12 = v5;
  id v6 = v5;
  uint64_t v7 = _Block_copy(aBlock);
  id v8 = [v4 allObjects];

  id v9 = [v8 sortedArrayUsingComparator:v7];

  return v9;
}

uint64_t __55__HKClinicalSourceAuthorizationController__orderTypes___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = [v5 displayTypeForObjectType:a2];
  id v8 = [*(id *)(a1 + 32) displayTypeForObjectType:v6];

  id v9 = [v7 localization];
  id v10 = [v9 displayName];
  uint64_t v11 = [v8 localization];
  id v12 = [v11 displayName];
  uint64_t v13 = [v10 localizedCaseInsensitiveCompare:v12];

  return v13;
}

- (BOOL)isTypeEnabled:(id)a3
{
  id v5 = a3;
  id v6 = [(HKClinicalSourceAuthorizationController *)self typesForReading];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKClinicalSourceAuthorizationController.m", 158, @"Invalid parameter not satisfying: %@", @"[self.typesForReading containsObject:type]" object file lineNumber description];
  }
  id v8 = [(HKClinicalSourceAuthorizationController *)self typesEnabledForReading];
  char v9 = [v8 containsObject:v5];

  return v9;
}

- (void)setEnabled:(BOOL)a3 forType:(id)a4 commit:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v13 = a4;
  id v8 = [(HKClinicalSourceAuthorizationController *)self typesEnabledForReading];
  char v9 = v8;
  if (!v6)
  {
    [v8 removeObject:v13];
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v8 addObject:v13];
  if (v5)
  {
LABEL_5:
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v13, 0);
    uint64_t v11 = [(HKClinicalSourceAuthorizationController *)self _authorizationStatusesWithTypes:v10];
    id v12 = [(HKClinicalSourceAuthorizationController *)self _authorizationModesWithMode:[(HKClinicalSourceAuthorizationController *)self authorizationModeForSource] types:v10];
    [(HKClinicalSourceAuthorizationController *)self _setAuthorizationStatuses:v11 modes:v12 shouldUpdateAnchor:0];
  }
LABEL_6:
}

- (void)setEnabledForAllTypes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(HKClinicalSourceAuthorizationController *)self typesForReading];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(HKClinicalSourceAuthorizationController *)self setEnabled:v3 forType:*(void *)(*((void *)&v10 + 1) + 8 * v9++) commit:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)commitAllTypesAndUpdateAuthorizationAnchorWithMode:(int64_t)a3
{
  -[HKClinicalSourceAuthorizationController setAuthorizationModeForSource:](self, "setAuthorizationModeForSource:");
  BOOL v5 = [(HKClinicalSourceAuthorizationController *)self typesForReading];
  if (v5)
  {
    uint64_t v6 = [(HKClinicalSourceAuthorizationController *)self _authorizationModesWithMode:a3 types:v5];
    uint64_t v7 = [(HKClinicalSourceAuthorizationController *)self _authorizationStatusesWithTypes:v5];
    [(HKClinicalSourceAuthorizationController *)self _setAuthorizationStatuses:v7 modes:v6 shouldUpdateAnchor:1];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v8 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      -[HKClinicalSourceAuthorizationController commitAllTypesAndUpdateAuthorizationAnchorWithMode:](v8);
    }
  }
}

- (BOOL)_shouldUpdateDisplayReadAuthorizationAnchorDateWhenCommittingWithMode:(int64_t)a3
{
  return a3 != 0;
}

- (void)_updateDisplayReadAuthorizationAnchorDateIfNeededForCommittingModes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) integerValue];
        if (v10 >= 2)
        {
          long long v12 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKClinicalSourceAuthorizationController.m", 219, @"Invalid mode: %ld", v10);
        }
        if ([(HKClinicalSourceAuthorizationController *)self _shouldUpdateDisplayReadAuthorizationAnchorDateWhenCommittingWithMode:v10])
        {
          id v11 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
          [(HKClinicalSourceAuthorizationController *)self setDisplayReadAuthorizationAnchorDate:v11];

          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_updateReminderRegistrationIfNeededForCommittingModes:(id)a3 anyTypeEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (![v7 count])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"HKClinicalSourceAuthorizationController.m", 233, @"Invalid parameter not satisfying: %@", @"modes.count > 0" object file lineNumber description];
  }
  memset(v12, 0, sizeof(v12));
  if ([v7 countByEnumeratingWithState:v12 objects:v13 count:16])
  {
    unint64_t v8 = [**((id **)&v12[0] + 1) integerValue];
    if (v8 < 2) {
      goto LABEL_7;
    }
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HKClinicalSourceAuthorizationController.m", 238, @"Invalid mode: %ld", v8);
  }
  unint64_t v8 = 1;
LABEL_7:
  if (v8) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v4;
  }
  [(HKClinicalSourceAuthorizationController *)self _commitModeConfirmationAlertRegistrationShouldDisplay:v10];
}

- (void)_commitModeConfirmationAlertRegistrationShouldDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HKClinicalSourceAuthorizationController *)self healthRecordsStore];
  uint64_t v6 = [(HKClinicalSourceAuthorizationController *)self source];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke;
  v8[3] = &unk_1E6D533C8;
  BOOL v9 = v3;
  v8[4] = self;
  id v7 = _Block_copy(v8);
  if (v3) {
    [v5 registerAppSourceForClinicalUnlimitedAuthorizationModeConfirmation:v6 completion:v7];
  }
  else {
    [v5 deregisterAppSourceFromClinicalUnlimitedAuthorizationModeConfirmation:v6 completion:v7];
  }
}

void __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = objc_msgSend(*(id *)(a1 + 32), "_unitTesting_reminderRegistryCompletion");
  uint64_t v14 = (void *)v13;
  if (v13) {
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  }
}

- (BOOL)allTypesEnabled
{
  BOOL v3 = [(HKClinicalSourceAuthorizationController *)self typesEnabledForReading];
  BOOL v4 = [(HKClinicalSourceAuthorizationController *)self typesForReading];
  char v5 = [v3 isEqualToSet:v4];

  return v5;
}

- (BOOL)anyTypeEnabled
{
  v2 = [(HKClinicalSourceAuthorizationController *)self typesEnabledForReading];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)anyTypeRequested
{
  v2 = [(HKClinicalSourceAuthorizationController *)self typesForReading];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (int64_t)_authorizationStatusWithType:(id)a3
{
  uint64_t v3 = [(NSMutableSet *)self->_typesEnabledForReading containsObject:a3];
  return MEMORY[0x1F40E7D58](0, v3);
}

- (id)_authorizationModesWithMode:(int64_t)a3 types:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", a3, (void)v15);
        [v6 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_authorizationStatusesWithTypes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKClinicalSourceAuthorizationController _authorizationStatusWithType:](self, "_authorizationStatusWithType:", v11, (void)v14));
        [v5 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_setAuthorizationStatuses:(id)a3 modes:(id)a4 shouldUpdateAnchor:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v41;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v11);
        }
        if (([*(id *)(*((void *)&v40 + 1) + 8 * v14) isClinicalType] & 1) == 0)
        {
          long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
          [v15 handleFailureInMethod:a2, self, @"HKClinicalSourceAuthorizationController.m", 328, @"Invalid parameter not satisfying: %@", @"type.isClinicalType" object file lineNumber description];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v12);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v16 = v10;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v37;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v16);
        }
        if (([*(id *)(*((void *)&v36 + 1) + 8 * v19) isClinicalType] & 1) == 0)
        {
          uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
          [v20 handleFailureInMethod:a2, self, @"HKClinicalSourceAuthorizationController.m", 332, @"Invalid parameter not satisfying: %@", @"type.isClinicalType" object file lineNumber description];
        }
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v17);
  }

  dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v22 = [(HKClinicalSourceAuthorizationController *)self authorizationStore];
  BOOL v23 = [(HKClinicalSourceAuthorizationController *)self source];
  id v24 = [v23 bundleIdentifier];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke;
  v29[3] = &unk_1E6D533F0;
  id v31 = &v32;
  id v25 = v21;
  v30 = v25;
  [v22 setAuthorizationStatuses:v11 authorizationModes:v16 forBundleIdentifier:v24 options:v5 completion:v29];

  dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v33 + 24))
  {
    uint64_t v26 = [v16 allValues];
    objc_super v27 = [(HKClinicalSourceAuthorizationController *)self source];
    int v28 = [v27 _isApplication];

    if (v28) {
      [(HKClinicalSourceAuthorizationController *)self _updateReminderRegistrationIfNeededForCommittingModes:v26 anyTypeEnabled:[(HKClinicalSourceAuthorizationController *)self anyTypeEnabled]];
    }
    if (v5) {
      [(HKClinicalSourceAuthorizationController *)self _updateDisplayReadAuthorizationAnchorDateIfNeededForCommittingModes:v26];
    }
  }
  _Block_object_dispose(&v32, 8);
}

void __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x1E4F29EF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29EF8], OS_LOG_TYPE_ERROR)) {
      __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (HKSource)source
{
  return self->_source;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (NSArray)orderedTypesForReading
{
  return self->_orderedTypesForReading;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (int64_t)authorizationModeForSource
{
  return self->_authorizationModeForSource;
}

- (void)setAuthorizationModeForSource:(int64_t)a3
{
  self->_authorizationModeForSource = a3;
}

- (BOOL)anyDeterminedTypeAllowsReading
{
  return self->_anyDeterminedTypeAllowsReading;
}

- (void)setAnyDeterminedTypeAllowsReading:(BOOL)a3
{
  self->_anyDeterminedTypeAllowsReading = a3;
}

- (NSDate)displayReadAuthorizationAnchorDate
{
  return self->_displayReadAuthorizationAnchorDate;
}

- (void)setDisplayReadAuthorizationAnchorDate:(id)a3
{
}

- (HKHealthRecordsStore)healthRecordsStore
{
  return self->_healthRecordsStore;
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (NSSet)typesForReading
{
  return self->_typesForReading;
}

- (void)setTypesForReading:(id)a3
{
}

- (NSSet)typesRequestedForReading
{
  return self->_typesRequestedForReading;
}

- (NSMutableSet)typesEnabledForReading
{
  return self->_typesEnabledForReading;
}

- (id)_unitTesting_reminderRegistryCompletion
{
  return self->__unitTesting_reminderRegistryCompletion;
}

- (void)_unitTesting_setReminderRegistryCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__unitTesting_reminderRegistryCompletion, 0);
  objc_storeStrong((id *)&self->_typesEnabledForReading, 0);
  objc_storeStrong((id *)&self->_typesRequestedForReading, 0);
  objc_storeStrong((id *)&self->_typesForReading, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
  objc_storeStrong((id *)&self->_healthRecordsStore, 0);
  objc_storeStrong((id *)&self->_displayReadAuthorizationAnchorDate, 0);
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_orderedTypesForReading, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

void __90__HKClinicalSourceAuthorizationController__fetchAllClinicalAuthorizationRecordsWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)commitAllTypesAndUpdateAuthorizationAnchorWithMode:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E0B26000, log, OS_LOG_TYPE_ERROR, "Unable to commit clinical source authorization determinations: no types for reading", v1, 2u);
}

void __97__HKClinicalSourceAuthorizationController__commitModeConfirmationAlertRegistrationShouldDisplay___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __94__HKClinicalSourceAuthorizationController__setAuthorizationStatuses_modes_shouldUpdateAnchor___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end