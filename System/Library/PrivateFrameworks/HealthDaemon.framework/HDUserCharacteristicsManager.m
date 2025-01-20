@interface HDUserCharacteristicsManager
- (BOOL)_setUserCharacteristic:(id)a3 forType:(id)a4 shouldInsertSample:(BOOL)a5 updateProfileAndSync:(BOOL)a6 error:(id *)a7;
- (BOOL)setUserCharacteristic:(id)a3 forType:(id)a4 error:(id *)a5;
- (HDUserCharacteristicsManager)initWithProfile:(id)a3;
- (double)restingCaloriesFromTotalCalories:(double)a3 timeInterval:(double)a4 authorizedToRead:(BOOL)a5;
- (id)_getCardioFitnessMedicationsStatusWithError:(void *)a1;
- (id)_mostRecentSampleOfType:(void *)a3 beforeDate:(uint64_t)a4 error:;
- (id)_userCharacteristicForType:(uint64_t)a3 entity:(uint64_t)a4 error:;
- (id)diagnosticDescription;
- (id)modificationDateForCharacteristicWithType:(id)a3 error:(id *)a4;
- (id)userCharacteristicForType:(id)a3 error:(id *)a4;
- (void)_queue_updateCharacteristicsAndUserProfile;
- (void)_queue_updateCharacteristicsAndUserProfileWithDate:(uint64_t)a1;
- (void)_queue_updateFitnessModeDefaultAndNotifyIfNecessary;
- (void)_updateHasWatchOnAccountWithRandomDelayAndResetIfNecessary:(uint64_t)a1;
- (void)_userCharacteristicsDidChangeShouldUpdateUserProfile:(int)a3 shouldSync:;
- (void)addProfileObserver:(id)a3;
- (void)cloudSyncManager:(id)a3 didUpdateSyncEnabled:(BOOL)a4;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didReceiveAuthKitDeviceListChangeNotification:(id)a3;
- (void)didReceiveDayChangeNotification:(id)a3;
- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)removeProfileObserver:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4;
- (void)unitTest_updateCharacteristicsAndUserProfileWithDate:(id)a3 completion:(id)a4;
@end

@implementation HDUserCharacteristicsManager

- (id)userCharacteristicForType:(id)a3 error:(id *)a4
{
  return -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:]((uint64_t)self, a3, 0, (uint64_t)a4);
}

- (id)_userCharacteristicForType:(uint64_t)a3 entity:(uint64_t)a4 error:
{
  if (a1)
  {
    v6 = (id *)(a1 + 8);
    id v7 = a2;
    id WeakRetained = objc_loadWeakRetained(v6);
    v9 = +[HDProtectedKeyValueEntity userCharacteristicForType:v7 profile:WeakRetained entity:a3 error:a4];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4 && self->_needsUpdateAfterUnlock)
  {
    -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile]((uint64_t)self);
  }
}

- (void)addProfileObserver:(id)a3
{
  id v4 = a3;
  [(HDUserCharacteristicsProfileObserver *)self->_observers registerObserver:v4];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 48);
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v4 + 24);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke_2;
    v7[3] = &unk_1E62F8760;
    v7[4] = v4;
    id v8 = v2;
    [v6 notifyObserver:v5 handler:v7];
  }
}

uint64_t __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 1;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__37;
  v29 = __Block_byref_object_dispose__37;
  id v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_2;
  aBlock[3] = &unk_1E62F8688;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v23 = &v31;
  v24 = &v25;
  aBlock[4] = v6;
  id v22 = v7;
  id v8 = (void (**)(void *, void, void *, void *))_Block_copy(aBlock);
  v9 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A8]];
  v8[2](v8, *MEMORY[0x1E4F22158], v9, &__block_literal_global_44);

  v10 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298B8]];
  v8[2](v8, *MEMORY[0x1E4F22148], v10, &__block_literal_global_360);

  v11 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F2B9F8]];
  v8[2](v8, *MEMORY[0x1E4F22170], v11, &__block_literal_global_364_0);

  v12 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F2BA08]];
  v8[2](v8, *MEMORY[0x1E4F22168], v12, &__block_literal_global_367);

  v13 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298C8]];
  v8[2](v8, *MEMORY[0x1E4F22160], v13, &__block_literal_global_369);

  v14 = *(void **)(a1 + 32);
  v15 = (id *)(v26 + 5);
  id obj = (id)v26[5];
  v16 = -[HDUserCharacteristicsManager _getCardioFitnessMedicationsStatusWithError:](v14, &obj);
  objc_storeStrong(v15, obj);
  if (v16)
  {
    [*(id *)(a1 + 40) setObject:v16 forKey:*MEMORY[0x1E4F22150]];
    if (!a3) {
      goto LABEL_7;
    }
  }
  else
  {
    *((unsigned char *)v32 + 24) = 0;
    if (!a3) {
      goto LABEL_7;
    }
  }
  v17 = (void *)v26[5];
  if (v17) {
    *a3 = v17;
  }
LABEL_7:
  uint64_t v18 = *((unsigned __int8 *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

void __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v10 + 40);
    v11 = [v9 userCharacteristicForType:a3 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
LABEL_10:

      goto LABEL_11;
    }
    if (v11)
    {
      if (v8)
      {
        v8[2](v8, v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12) {
          goto LABEL_7;
        }
      }
      else
      {
        id v12 = v11;
      }
      [*(id *)(a1 + 40) setObject:v12 forKey:v7];

      goto LABEL_10;
    }
LABEL_7:
    [*(id *)(a1 + 40) removeObjectForKey:v7];
    goto LABEL_10;
  }
LABEL_11:
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 integerValue] == 3)
  {

    id v2 = &unk_1F17EB3A0;
  }

  return v2;
}

uint64_t __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = NSNumber;
  if ([a2 integerValue] == 2) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 0;
  }

  return [v2 numberWithInteger:v3];
}

uint64_t __73__HDUserCharacteristicsManager__queue_alertObserversDidUpdateUserProfile__block_invoke(uint64_t a1, void *a2)
{
  return [a2 userCharacteristicsManager:*(void *)(a1 + 32) didUpdateUserProfile:*(void *)(a1 + 40)];
}

- (HDUserCharacteristicsManager)initWithProfile:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HDUserCharacteristicsManager.m", 103, @"Invalid parameter not satisfying: %@", @"profile != nil" object file lineNumber description];
  }
  v26.receiver = self;
  v26.super_class = (Class)HDUserCharacteristicsManager;
  uint64_t v6 = [(HDUserCharacteristicsManager *)&v26 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_profile, v5);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v7->_needsUpdateAfterUnlock = 1;
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E4F29E08], (CFStringRef)*MEMORY[0x1E4F2BEE8], &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      uint64_t v11 = [NSNumber numberWithBool:AppBooleanValue != 0];
      hasWatchOnAccount = v7->_hasWatchOnAccount;
      v7->_hasWatchOnAccount = (NSNumber *)v11;
    }
    else
    {
      hasWatchOnAccount = v7->_hasWatchOnAccount;
      v7->_hasWatchOnAccount = 0;
    }

    id v13 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = HKLogInfrastructure();
    uint64_t v17 = [v13 initWithName:v15 loggingCategory:v16];
    observers = v7->_observers;
    v7->_observers = (HDUserCharacteristicsProfileObserver *)v17;

    v19 = [v5 daemon];
    v20 = [v19 behavior];
    v7->_shouldUpdateQuantityCharacteristics = [v20 supportsComputedUserCharacteristicCaching];

    id WeakRetained = objc_loadWeakRetained((id *)&v7->_profile);
    [WeakRetained registerProfileReadyObserver:v7 queue:v7->_queue];

    id v22 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v22 addObject:v7];
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
  [v3 removeObject:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained database];
  [v5 removeProtectedDataObserver:self];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = QuantityCharacteristicTypes();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
        id v12 = objc_loadWeakRetained((id *)&self->_profile);
        id v13 = [v12 dataManager];
        v14 = [v11 _relatedQuantityType];
        [v13 removeObserver:self forDataType:v14];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  id v15 = objc_loadWeakRetained((id *)&self->_profile);
  v16 = [v15 dataManager];
  uint64_t v17 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A0]];
  uint64_t v18 = [v17 _relatedCategoryType];
  [v16 removeObserver:self forDataType:v18];

  if (self)
  {
    if (notify_is_valid_token(self->_significantTimeChangeNotificationToken)) {
      notify_cancel(self->_significantTimeChangeNotificationToken);
    }
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 removeObserver:self name:*MEMORY[0x1E4F1C2E0] object:0];
  }
  id v20 = objc_loadWeakRetained((id *)&self->_profile);
  v21 = [v20 daemon];
  id v22 = [v21 behavior];
  char v23 = [v22 isAppleWatch];

  if ((v23 & 1) == 0)
  {
    id v24 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v25 = [v24 nanoSyncManager];
    [v25 removeObserver:self];

    id v26 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v27 = [v26 cloudSyncManager];
    [v27 removeObserver:self];
  }
  v28.receiver = self;
  v28.super_class = (Class)HDUserCharacteristicsManager;
  [(HDUserCharacteristicsManager *)&v28 dealloc];
}

- (id)modificationDateForCharacteristicWithType:(id)a3 error:(id *)a4
{
  p_profile = &self->_profile;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  uint64_t v8 = +[HDProtectedKeyValueEntity modificationDateForCharacteristicWithType:v6 profile:WeakRetained error:a4];

  return v8;
}

- (BOOL)setUserCharacteristic:(id)a3 forType:(id)a4 error:(id *)a5
{
  return [(HDUserCharacteristicsManager *)self _setUserCharacteristic:a3 forType:a4 shouldInsertSample:1 updateProfileAndSync:1 error:a5];
}

- (BOOL)_setUserCharacteristic:(id)a3 forType:(id)a4 shouldInsertSample:(BOOL)a5 updateProfileAndSync:(BOOL)a6 error:(id *)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v13;
    _os_log_debug_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEBUG, "Setting user characteristic for type %@", buf, 0xCu);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke;
  aBlock[3] = &unk_1E62F85C0;
  id v32 = v12;
  id v15 = v13;
  id v33 = v15;
  uint64_t v34 = self;
  BOOL v35 = a5;
  id v16 = v12;
  uint64_t v17 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v19 = [WeakRetained database];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_2;
  v26[3] = &unk_1E62F85E8;
  BOOL v30 = a6;
  id v27 = v15;
  objc_super v28 = self;
  id v29 = v17;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_4;
  v24[3] = &unk_1E62F8610;
  id v25 = v29;
  id v20 = v29;
  id v21 = v15;
  BOOL v22 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v19 error:a7 block:v26 inaccessibilityHandler:v24];

  return v22;
}

uint64_t __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
  BOOL v7 = +[HDProtectedKeyValueEntity setUserCharacteristic:v4 forType:v5 profile:WeakRetained error:a2];

  if (!v7) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 56)) {
    return 1;
  }
  uint64_t v8 = [*(id *)(a1 + 40) _relatedSampleForInsertionWithCharacteristicValue:*(void *)(a1 + 32)];
  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
    uint64_t v10 = [v9 dataProvenanceManager];
    uint64_t v11 = [v10 defaultLocalDataProvenance];

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 8));
      id v13 = [v12 dataManager];
      v17[0] = v8;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      uint64_t v15 = [v13 insertDataObjects:v14 withProvenance:v11 creationDate:a2 error:2.22507386e-308];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a2, 100, @"Failed to get local device data provenance");
      uint64_t v15 = 0;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  return v15;
}

uint64_t __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 56))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_3;
    v10[3] = &unk_1E62F31C0;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    [a2 onCommit:v10 orRollback:0];
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a3, a3, a4);
}

void __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) code];
  int v4 = (unint64_t)(v2 - 64) <= 0x27 && ((1 << (v2 - 64)) & 0x8000700003) != 0 || v2 == 218;
  uint64_t v5 = *(void *)(a1 + 40);

  -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:](v5, v4, 1);
}

- (void)_userCharacteristicsDidChangeShouldUpdateUserProfile:(int)a3 shouldSync:
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v5 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __96__HDUserCharacteristicsManager__userCharacteristicsDidChangeShouldUpdateUserProfile_shouldSync___block_invoke;
      block[3] = &unk_1E62F3208;
      block[4] = a1;
      dispatch_async(v5, block);
    }
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v7 = v6;
    if (a3) {
      [v6 postNotificationName:@"HDUserCharacteristicsShouldSyncNotification" object:a1];
    }
    [v7 postNotificationName:@"HDUserCharacteristicsDidChangeNotification" object:a1];
    notify_post((const char *)*MEMORY[0x1E4F2BF80]);
  }
}

uint64_t __109__HDUserCharacteristicsManager__setUserCharacteristic_forType_shouldInsertSample_updateProfileAndSync_error___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)restingCaloriesFromTotalCalories:(double)a3 timeInterval:(double)a4 authorizedToRead:(BOOL)a5
{
  if (a5)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F2B2C0], "characteristicTypeForIdentifier:", *MEMORY[0x1E4F2B9F8], a3);
    id v23 = 0;
    uint64_t v8 = [(HDUserCharacteristicsManager *)self userCharacteristicForType:v7 error:&v23];
    id v9 = v23;

    double v10 = 0.0;
    if (v9) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v8 == 0;
    }
    if (!v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F2B618] unitFromString:@"kg"];
      [v8 doubleValueForUnit:v12];
      double v10 = v13;
    }
    id v22 = v9;
    v14 = -[HDUserCharacteristicsManager _getCardioFitnessMedicationsStatusWithError:](self, &v22);
    id v15 = v22;

    uint64_t v16 = 0;
    if (v14 && !v15) {
      uint64_t v16 = [v14 BOOLValue];
    }
  }
  else
  {
    uint64_t v16 = 0;
    double v10 = 0.0;
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F221C8]) initWithAge:0 gender:0 height:v16 weight:0.0 condition:0.0 betaBlockerUse:v10];
  uint64_t v18 = [MEMORY[0x1E4F22238] computeRestingCaloriesAtRate:1 user:v17 duration:a4];
  [v18 doubleValue];
  double v20 = v19 / 1000.0;

  return v20;
}

- (id)_getCardioFitnessMedicationsStatusWithError:(void *)a1
{
  if (a1)
  {
    int v4 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F2BA00]];
    id v10 = 0;
    uint64_t v5 = [a1 userCharacteristicForType:v4 error:&v10];
    id v6 = v10;

    if (v5) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = v6 == 0;
    }
    if (v7)
    {
      uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "integerValue") != 0);
    }
    else if (a2)
    {
      uint64_t v8 = 0;
      *a2 = v6;
    }
    else
    {
      _HKLogDroppedError();
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t __96__HDUserCharacteristicsManager__userCharacteristicsDidChangeShouldUpdateUserProfile_shouldSync___block_invoke(uint64_t a1)
{
  return -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile](*(void *)(a1 + 32));
}

- (void)_queue_updateCharacteristicsAndUserProfile
{
  if (a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
    -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfileWithDate:](a1, v2);
  }
}

- (void)_queue_updateCharacteristicsAndUserProfileWithDate:(uint64_t)a1
{
  uint64_t v123 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a2;
    uint64_t v96 = a1;
    int v4 = (id *)(a1 + 8);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v6 = [WeakRetained database];

    BOOL v7 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    [(HDMutableDatabaseTransactionContext *)v7 setCacheScope:1];
    id v8 = [(HDDatabaseTransactionContext *)v7 copyForWritingProtectedData];

    id v9 = (void *)MEMORY[0x1E4F1C9A8];
    id v10 = v3;
    BOOL v11 = objc_msgSend(v9, "hk_gregorianCalendarWithLocalTimeZone");
    uint64_t v12 = [v11 startOfDayForDate:v10];

    double v13 = [v11 dateByAddingUnit:16 value:1 toDate:v12 options:0];
    v14 = [v11 startOfDayForDate:v13];

    id v15 = _HKActivityCacheDateComponentsFromDate();
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)_HKCacheIndexFromDateComponents()];

    *(void *)&long long v97 = 0;
    *((void *)&v97 + 1) = &v97;
    *(void *)&long long v98 = 0x2020000000;
    BYTE8(v98) = 0;
    id v103 = 0;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v116 = __84__HDUserCharacteristicsManager__queue_updateActivityMoveModeCharacteristicWithDate___block_invoke;
    v117 = &unk_1E62F5CB0;
    id v118 = (id)a1;
    id v17 = v16;
    id v119 = v17;
    v120 = &v97;
    LODWORD(v16) = [v6 performTransactionWithContext:v8 error:&v103 block:&buf inaccessibilityHandler:0];
    id v18 = v103;
    double v19 = v18;
    if (v16)
    {
      if (*(unsigned char *)(*((void *)&v97 + 1) + 24)) {
        -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:](a1, 0, 1);
      }
      *(unsigned char *)(a1 + 56) = 0;
    }
    else if (objc_msgSend(v18, "hk_isDatabaseAccessibilityError"))
    {
      *(unsigned char *)(a1 + 56) = 1;
    }
    else
    {
      _HKInitializeLogging();
      double v20 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
      {
        LODWORD(keyExistsAndHasValidFormat) = 138543362;
        *(void *)((char *)&keyExistsAndHasValidFormat + 4) = v19;
        _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "Error updating user activity move mode characteristic: %{public}@", (uint8_t *)&keyExistsAndHasValidFormat, 0xCu);
      }
    }

    _Block_object_dispose(&v97, 8);
    id v21 = objc_loadWeakRetained(v4);
    uint64_t v22 = [v21 profileType];

    if (v22 == 1)
    {
      id v23 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A0]];
      *(void *)&long long v97 = 0;
      id v24 = -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](a1, v23, 0, (uint64_t)&v97);
      id v25 = (id)v97;

      if (v24 || !v25)
      {
        if (v24) {
          uint64_t v27 = [v24 integerValue];
        }
        else {
          uint64_t v27 = 1;
        }
        LOBYTE(keyExistsAndHasValidFormat) = 0;
        CFStringRef v28 = (const __CFString *)*MEMORY[0x1E4F29630];
        CFStringRef v29 = (const __CFString *)*MEMORY[0x1E4F2BEE8];
        CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue((CFStringRef)*MEMORY[0x1E4F29630], (CFStringRef)*MEMORY[0x1E4F2BEE8], (Boolean *)&keyExistsAndHasValidFormat);
        if (!(_BYTE)keyExistsAndHasValidFormat || AppIntegerValue != v27)
        {
          CFPreferencesSetAppValue(v28, (CFPropertyListRef)[NSNumber numberWithInteger:v27], v29);
          _HKInitializeLogging();
          long long v31 = (void *)*MEMORY[0x1E4F29F28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
          {
            id v32 = v31;
            id v33 = HKActivityMoveModeToString();
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v33;
            _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "Activity Move Mode defaults value changed to %{public}@! Posting notification!", (uint8_t *)&buf, 0xCu);
          }
          notify_post((const char *)*MEMORY[0x1E4F29638]);
        }
      }
      else
      {
        _HKInitializeLogging();
        id v26 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v25;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "Error reading activity move mode characteristic for defaults update: %@", (uint8_t *)&buf, 0xCu);
        }
        if (objc_msgSend(v25, "hk_isDatabaseAccessibilityError")) {
          *(unsigned char *)(a1 + 56) = 1;
        }
      }
    }
    if (*(unsigned char *)(a1 + 32))
    {
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v36 = objc_loadWeakRetained(v4);
      id v37 = [v36 database];

      uint64_t v38 = QuantityCharacteristicTypes();
      *(void *)&long long keyExistsAndHasValidFormat = 0;
      *((void *)&keyExistsAndHasValidFormat + 1) = &keyExistsAndHasValidFormat;
      uint64_t v111 = 0x2020000000;
      LOBYTE(v112) = 0;
      uint64_t v39 = a1;
      v40 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v40 setCacheScope:1];
      id v107 = 0;
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v116 = __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke;
      v117 = &unk_1E62F8710;
      id v41 = v38;
      id v118 = v41;
      id v119 = (id)a1;
      v42 = (long long *)v34;
      v120 = v42;
      id v43 = v35;
      id v121 = v43;
      p_long long keyExistsAndHasValidFormat = &keyExistsAndHasValidFormat;
      BOOL v44 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v37 context:v40 error:&v107 block:&buf];
      id v45 = v107;
      v46 = v45;
      id v103 = 0;
      v104 = &v103;
      uint64_t v105 = 0x2020000000;
      char v106 = 0;
      if (!v44) {
        goto LABEL_84;
      }
      if (!*(unsigned char *)(*((void *)&keyExistsAndHasValidFormat + 1) + 24)) {
        goto LABEL_32;
      }
      id v102 = v45;
      *(void *)&long long v97 = MEMORY[0x1E4F143A8];
      *((void *)&v97 + 1) = 3221225472;
      *(void *)&long long v98 = __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke_2;
      *((void *)&v98 + 1) = &unk_1E62F8710;
      *(void *)&long long v99 = v41;
      *((void *)&v99 + 1) = v42;
      *(void *)&long long v100 = a1;
      *((void *)&v100 + 1) = v43;
      v101 = &v103;
      BOOL v47 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v37 context:v40 error:&v102 block:&v97];
      id v48 = v102;

      if (*((unsigned char *)v104 + 24)) {
        -[HDUserCharacteristicsManager _userCharacteristicsDidChangeShouldUpdateUserProfile:shouldSync:](a1, 1, 1);
      }

      v46 = v48;
      uint64_t v39 = a1;
      if (v47)
      {
LABEL_32:
        *(unsigned char *)(v39 + 56) = 0;
      }
      else
      {
LABEL_84:
        if (objc_msgSend(v46, "hk_isDatabaseAccessibilityError"))
        {
          *(unsigned char *)(a1 + 56) = 1;
        }
        else
        {
          _HKInitializeLogging();
          v49 = *MEMORY[0x1E4F29F28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v108 = 138543362;
            v109 = v46;
            _os_log_error_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_ERROR, "Error updating user characteristics quantity: %{public}@", v108, 0xCu);
          }
        }
      }
      _Block_object_dispose(&v103, 8);

      _Block_object_dispose(&keyExistsAndHasValidFormat, 8);
    }
    id v50 = objc_loadWeakRetained(v4);
    uint64_t v51 = [v50 profileType];

    if (v51 != 1)
    {
      *(unsigned char *)(a1 + 56) = 0;
      return;
    }
    v95 = [MEMORY[0x1E4F22238] userProfile];
    if (v95) {
      v52 = v95;
    }
    else {
      v52 = (void *)MEMORY[0x1E4F1CC08];
    }
    v53 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v52];
    v93 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    [(HDMutableDatabaseTransactionContext *)v93 setCacheScope:1];
    id v54 = objc_loadWeakRetained(v4);
    v55 = [v54 database];
    id v103 = 0;
    *(void *)&long long keyExistsAndHasValidFormat = MEMORY[0x1E4F143A8];
    *((void *)&keyExistsAndHasValidFormat + 1) = 3221225472;
    uint64_t v111 = (uint64_t)__56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke;
    v112 = &unk_1E62F2AE0;
    uint64_t v113 = a1;
    id v94 = v53;
    id v114 = v94;
    BOOL v56 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v55 context:v93 error:&v103 block:&keyExistsAndHasValidFormat];
    id v92 = v103;

    if (v56)
    {
      *(unsigned char *)(a1 + 56) = 0;
      uint64_t v57 = [MEMORY[0x1E4F1C9C8] date];
      v58 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v57;

      uint64_t v59 = [v94 copy];
      v60 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v59;

      if ([v95 isEqualToDictionary:v94])
      {
        id v61 = v92;
      }
      else
      {
        id v63 = objc_loadWeakRetained(v4);
        v64 = [v63 daemon];
        v65 = [v64 behavior];
        int v66 = [v65 isAppleInternalInstall];

        if (v66)
        {
          if (v95)
          {
            id v67 = v95;
            id v68 = v94;
            id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            id v70 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            v71 = [v67 allKeys];
            [v70 addObjectsFromArray:v71];

            v72 = [v68 allKeys];
            [v70 addObjectsFromArray:v72];

            long long v99 = 0u;
            long long v100 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            id v73 = v70;
            uint64_t v74 = [v73 countByEnumeratingWithState:&v97 objects:&buf count:16];
            if (v74)
            {
              uint64_t v75 = *(void *)v98;
              do
              {
                for (uint64_t i = 0; i != v74; ++i)
                {
                  if (*(void *)v98 != v75) {
                    objc_enumerationMutation(v73);
                  }
                  uint64_t v77 = *(void *)(*((void *)&v97 + 1) + 8 * i);
                  v78 = [v67 objectForKeyedSubscript:v77];
                  uint64_t v79 = [v68 objectForKeyedSubscript:v77];
                  v80 = (void *)v79;
                  if (v78 != (void *)v79 && (!v79 || ([v78 isEqual:v79] & 1) == 0)) {
                    [v69 addObject:v77];
                  }
                }
                uint64_t v74 = [v73 countByEnumeratingWithState:&v97 objects:&buf count:16];
              }
              while (v74);
            }
          }
          else
          {
            id v69 = [v94 allKeys];
          }
          if ([v69 count])
          {
            v82 = NSString;
            v83 = [v69 componentsJoinedByString:@", "];
            v81 = [v82 stringWithFormat:@"(%@)", v83];
          }
          else
          {
            v81 = 0;
          }
        }
        else
        {
          v81 = 0;
        }
        _HKInitializeLogging();
        v84 = (os_log_t *)MEMORY[0x1E4F29F28];
        v85 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG))
        {
          v91 = &stru_1F1728D60;
          if (v81) {
            v91 = v81;
          }
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v91;
          _os_log_debug_impl(&dword_1BCB7D000, v85, OS_LOG_TYPE_DEBUG, "Updating changed user profile keys %{public}@", (uint8_t *)&buf, 0xCu);
        }
        *(void *)&long long v97 = v92;
        char v86 = [MEMORY[0x1E4F22238] setUserProfile:v94 error:&v97];
        id v61 = (id)v97;

        if ((v86 & 1) == 0)
        {
          _HKInitializeLogging();
          v87 = *v84;
          if (os_log_type_enabled(*v84, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138543362;
            *(void *)((char *)&buf + 4) = v61;
            _os_log_error_impl(&dword_1BCB7D000, v87, OS_LOG_TYPE_ERROR, "Error setting CoreMotion user profile: %{public}@", (uint8_t *)&buf, 0xCu);
          }
        }
      }
      id v88 = *(id *)(v96 + 48);
      v89 = *(void **)(v96 + 24);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v116 = __73__HDUserCharacteristicsManager__queue_alertObserversDidUpdateUserProfile__block_invoke;
      v117 = &unk_1E62F8760;
      id v118 = (id)v96;
      id v119 = v88;
      id v90 = v88;
      [v89 notifyObservers:&buf];

      goto LABEL_76;
    }
    if (objc_msgSend(v92, "hk_isDatabaseAccessibilityError"))
    {
      *(unsigned char *)(a1 + 56) = 1;
    }
    else
    {
      _HKInitializeLogging();
      v62 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        id v61 = v92;
        *(void *)((char *)&buf + 4) = v92;
        _os_log_error_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_ERROR, "Error updating user characteristics values: %{public}@", (uint8_t *)&buf, 0xCu);
        goto LABEL_76;
      }
    }
    id v61 = v92;
LABEL_76:
  }
}

uint64_t __84__HDUserCharacteristicsManager__queue_updateActivityMoveModeCharacteristicWithDate___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A0]];
  id v6 = [v5 _relatedCategoryType];
  uint64_t v7 = a1[4];
  id v8 = (void *)a1[5];
  long long v31 = 0;
  if (v7)
  {
    uint64_t v9 = -[HDUserCharacteristicsManager _mostRecentSampleOfType:beforeDate:error:](v7, v6, v8, (uint64_t)&v31);
    id v10 = v31;
  }
  else
  {
    id v10 = 0;
    uint64_t v9 = 0;
  }
  id v11 = v10;
  uint64_t v12 = v11;
  if (v9 || !v11)
  {
    uint64_t v14 = a1[4];
    id v30 = 0;
    uint64_t v15 = -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](v14, v5, 0, (uint64_t)&v30);
    id v16 = v30;
    id v17 = v16;
    if (v15) {
      BOOL v18 = 1;
    }
    else {
      BOOL v18 = v16 == 0;
    }
    if (!v18)
    {
      if (a3)
      {
        uint64_t v13 = 0;
        *a3 = v16;
      }
      else
      {
        _HKLogDroppedError();
        uint64_t v13 = 0;
      }
      goto LABEL_35;
    }
    if (!(v9 | v15))
    {
      uint64_t v13 = 1;
LABEL_35:

      goto LABEL_36;
    }
    uint64_t v19 = [(id)v15 integerValue];
    if (v9)
    {
      uint64_t v20 = [(id)v9 value];
    }
    else
    {
      _HKInitializeLogging();
      id v21 = *MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "Resetting activity move mode characteristic if needed", buf, 2u);
      }
      uint64_t v20 = 1;
    }
    if (v19 == v20)
    {
      id v22 = 0;
    }
    else
    {
      _HKInitializeLogging();
      id v23 = (void *)*MEMORY[0x1E4F29F28];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v23;
        uint64_t v27 = HKActivityMoveModeToString();
        *(_DWORD *)long long buf = 138543362;
        id v33 = v27;
        _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "Updating activity move mode characteristic to %{public}@", buf, 0xCu);
      }
      id v25 = (void *)a1[4];
      CFStringRef v28 = objc_msgSend(NSNumber, "numberWithInteger:", v20, v27);
      id v29 = 0;
      LOBYTE(v25) = [v25 _setUserCharacteristic:v28 forType:v5 shouldInsertSample:0 updateProfileAndSync:0 error:&v29];
      id v22 = v29;

      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)v25;
      if ((v25 & 1) == 0)
      {
        id v22 = v22;
        if (v22)
        {
          if (a3) {
            *a3 = v22;
          }
          else {
            _HKLogDroppedError();
          }
        }

        uint64_t v13 = 0;
        goto LABEL_34;
      }
    }
    uint64_t v13 = 1;
LABEL_34:

    goto LABEL_35;
  }
  if (a3)
  {
    uint64_t v13 = 0;
    *a3 = v11;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v13 = 0;
  }
LABEL_36:

  return v13;
}

- (void)_queue_updateFitnessModeDefaultAndNotifyIfNecessary
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v2 = (id *)(a1 + 8);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    id v3 = [WeakRetained daemon];
    int v4 = [v3 behavior];
    if ([v4 isAppleWatch])
    {
    }
    else
    {
      id v5 = objc_loadWeakRetained(v2);
      id v6 = [v5 daemon];
      uint64_t v7 = [v6 behavior];
      char v8 = [v7 isiPad];

      if ((v8 & 1) == 0)
      {
        id v9 = objc_loadWeakRetained(v2);
        id v10 = [v9 nanoSyncManager];
        id v11 = [v10 pairedDevicesSnapshot];
        uint64_t v12 = [v11 allDeviceInfos];
        uint64_t v13 = [v12 count];

        if ([*(id *)(a1 + 64) BOOLValue]) {
          BOOL v14 = *(unsigned char *)(a1 + 72) != 0;
        }
        else {
          BOOL v14 = 0;
        }
        CFStringRef v15 = (const __CFString *)*MEMORY[0x1E4F2BEE8];
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"HDUserCharacteristicsForceStandalonePhoneFitnessMode", (CFStringRef)*MEMORY[0x1E4F2BEE8], 0);
        CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HDUserCharacteristicsForceFitnessMode", v15, 0);
        CFIndex v18 = AppIntegerValue;
        uint64_t v19 = 2;
        if (v14) {
          uint64_t v19 = 3;
        }
        if (v13) {
          unsigned int v20 = 0;
        }
        else {
          unsigned int v20 = !v14;
        }
        if (v13) {
          uint64_t v19 = 1;
        }
        if (AppBooleanValue) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v20;
        }
        if (AppIntegerValue) {
          id v22 = (const char *)AppIntegerValue;
        }
        else {
          id v22 = (const char *)v19;
        }
        _HKInitializeLogging();
        id v23 = (os_log_t *)MEMORY[0x1E4F29F28];
        id v24 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void *)(a1 + 64);
          int v26 = *(unsigned __int8 *)(a1 + 72);
          *(_DWORD *)long long buf = 136316930;
          id v37 = "-[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary]";
          __int16 v38 = 1024;
          BOOL v39 = v13 != 0;
          __int16 v40 = 2112;
          uint64_t v41 = v25;
          __int16 v42 = 1024;
          int v43 = v26;
          __int16 v44 = 1024;
          BOOL v45 = AppBooleanValue != 0;
          __int16 v46 = 2048;
          CFIndex v47 = v18;
          __int16 v48 = 1024;
          int v49 = v21;
          __int16 v50 = 2048;
          uint64_t v51 = v22;
          _os_log_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_DEFAULT, "%s - hasPairedWatch %d hasWatchOnAccount %@ isCloudSyncEnabled %d isStandalonePhoneFitnessModeForced %d fitnessModeForcedValue %ld isStandalonePhoneFitnessMode %d fitnessMode %lu", buf, 0x42u);
        }
        Boolean keyExistsAndHasValidFormat = 0;
        CFStringRef v27 = (const __CFString *)*MEMORY[0x1E4F29ED8];
        BOOL v28 = CFPreferencesGetAppBooleanValue((CFStringRef)*MEMORY[0x1E4F29ED8], v15, &keyExistsAndHasValidFormat) == 0;
        if (!keyExistsAndHasValidFormat || ((v21 ^ v28) & 1) == 0)
        {
          CFPreferencesSetAppValue(v27, (CFPropertyListRef)[NSNumber numberWithBool:v21], v15);
          _HKInitializeLogging();
          id v29 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v37) = v21;
            _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "Standalone phone fitness mode default value changed to %d. Posting notification!", buf, 8u);
          }
          notify_post((const char *)*MEMORY[0x1E4F2AA38]);
        }
        Boolean v34 = 0;
        CFStringRef v30 = (const __CFString *)*MEMORY[0x1E4F29DF8];
        CFIndex v31 = CFPreferencesGetAppIntegerValue((CFStringRef)*MEMORY[0x1E4F29DF8], v15, &v34);
        if (!v34 || (const char *)v31 != v22)
        {
          CFPreferencesSetAppValue(v30, (CFPropertyListRef)[NSNumber numberWithUnsignedInteger:v22], v15);
          _HKInitializeLogging();
          id v32 = *v23;
          if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134217984;
            id v37 = v22;
            _os_log_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_DEFAULT, "Fitness mode default value changed to %lu. Posting notification!", buf, 0xCu);
          }
          notify_post((const char *)*MEMORY[0x1E4F29E00]);
        }
      }
    }
  }
}

- (void)_updateHasWatchOnAccountWithRandomDelayAndResetIfNecessary:(uint64_t)a1
{
  if (a1)
  {
    signed int v4 = arc4random_uniform(0x12Cu);
    dispatch_time_t v5 = dispatch_time(0, 1000000000 * v4);
    id v6 = *(NSObject **)(a1 + 16);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__HDUserCharacteristicsManager__updateHasWatchOnAccountWithRandomDelayAndResetIfNecessary___block_invoke;
    v7[3] = &unk_1E62F8638;
    char v8 = a2;
    v7[4] = a1;
    dispatch_after(v5, v6, v7);
  }
}

void __91__HDUserCharacteristicsManager__updateHasWatchOnAccountWithRandomDelayAndResetIfNecessary___block_invoke(uint64_t a1)
{
  v53[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 64);
    *(void *)(v2 + 64) = 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
    id v6 = [WeakRetained daemon];
    uint64_t v7 = [v6 behavior];
    char v8 = [v7 isAppleWatch];

    if ((v8 & 1) == 0)
    {
      CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F2BEE8];
      id v10 = (void *)CFPreferencesCopyAppValue(@"HasWatchOnAccountLastFetchDate", (CFStringRef)*MEMORY[0x1E4F2BEE8]);
      id v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = [v11 dateByAddingTimeInterval:-28800.0];

      int v13 = objc_msgSend(v10, "hk_isAfterDate:", v12);
      if (*(void *)(v4 + 64) && v13)
      {
        _HKInitializeLogging();
        BOOL v14 = *MEMORY[0x1E4F29F28];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[HDUserCharacteristicsManager _queue_updateHasWatchOnAccount]";
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v10;
          _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%s not updating has watch on account; last fetch %{public}@",
            buf,
            0x16u);
        }
      }
      else
      {
        CFStringRef v15 = [MEMORY[0x1E4F4EF40] sharedInstance];
        id v16 = [v15 primaryAuthKitAccount];

        id v17 = objc_msgSend(v16, "aa_altDSID");

        if (v17)
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
          id v19 = objc_alloc_init(MEMORY[0x1E4F4F018]);
          unsigned int v20 = objc_msgSend(v16, "aa_altDSID");
          [v19 setAltDSID:v20];

          v53[0] = @"watchOS";
          uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
          [v19 setOperatingSystems:v21];

          id v32 = v18;
          uint64_t v33 = 0;
          uint64_t v39 = 0;
          __int16 v40 = &v39;
          uint64_t v41 = 0x2020000000;
          char v42 = 1;
          Boolean v34 = &v33;
          uint64_t v35 = 0x3032000000;
          id v36 = __Block_byref_object_copy__37;
          id v37 = __Block_byref_object_dispose__37;
          id v38 = (id)MEMORY[0x1E4F1CC28];
          dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
          *(void *)long long buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke;
          __int16 v48 = &unk_1E62F8660;
          uint64_t v49 = v4;
          uint64_t v51 = &v39;
          uint64_t v52 = &v33;
          id v23 = v22;
          __int16 v50 = v23;
          [v18 deviceListWithContext:v19 completion:buf];
          dispatch_time_t v24 = dispatch_time(0, 10000000000);
          if (dispatch_semaphore_wait(v23, v24))
          {
            _HKInitializeLogging();
            uint64_t v25 = *MEMORY[0x1E4F29F28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)block = 138543362;
              *(void *)&block[4] = v4;
              _os_log_error_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch device list; semaphore timed out",
                block,
                0xCu);
            }
          }
          else if (*((unsigned char *)v40 + 24))
          {
            _HKInitializeLogging();
            int v26 = *MEMORY[0x1E4F29F28];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v27 = *(void *)(v4 + 64);
              BOOL v28 = (void *)v34[5];
              *(_DWORD *)block = 136315650;
              *(void *)&block[4] = "-[HDUserCharacteristicsManager _queue_updateHasWatchOnAccount]";
              *(_WORD *)&block[12] = 2114;
              *(void *)&block[14] = v27;
              *(_WORD *)&block[22] = 2114;
              __int16 v44 = v28;
              _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%s fetched has watch on account; %{public}@ -> %{public}@",
                block,
                0x20u);
            }
            [MEMORY[0x1E4F1C9C8] date];
            v29 = id v18 = v32;
            CFPreferencesSetAppValue(@"HasWatchOnAccountLastFetchDate", v29, v9);

            CFStringRef v30 = *(NSObject **)(v4 + 16);
            *(void *)block = MEMORY[0x1E4F143A8];
            *(void *)&block[8] = 3221225472;
            *(void *)&block[16] = __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke_352;
            __int16 v44 = &unk_1E62F6E80;
            uint64_t v45 = v4;
            __int16 v46 = &v33;
            dispatch_async(v30, block);
          }

          _Block_object_dispose(&v33, 8);
          _Block_object_dispose(&v39, 8);
        }
      }
    }
  }
  uint64_t v31 = *(void *)(a1 + 32);

  -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary](v31);
}

void __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 && v6)
  {
    _HKInitializeLogging();
    char v8 = (void *)*MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      CFStringRef v15 = v8;
      id v16 = [v7 localizedDescription];
      int v17 = 138543618;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      unsigned int v20 = v16;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch device list: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  CFStringRef v9 = NSNumber;
  id v10 = [v5 deviceList];
  uint64_t v11 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "count") != 0);
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __62__HDUserCharacteristicsManager__queue_updateHasWatchOnAccount__block_invoke_352(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 64);
  if (v3)
  {
    int v4 = [v3 BOOLValue];
    if (v4 == [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) BOOLValue]) {
      return;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 64), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E4F29E08], *(CFPropertyListRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (CFStringRef)*MEMORY[0x1E4F2BEE8]);
  uint64_t v5 = *(void *)(a1 + 32);

  -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary](v5);
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_357(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C9A8];
  id v3 = a2;
  int v4 = [v2 currentCalendar];
  uint64_t v5 = [v4 dateFromComponents:v3];

  id v6 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v7 = [v4 components:4 fromDate:v5 toDate:v6 options:0];

  char v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "year"));

  return v8;
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_2_361(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F2B618];
  id v3 = a2;
  int v4 = [v2 gramUnitWithMetricPrefix:9];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  if (v6 <= 2.22044605e-16)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithDouble:v6];
  }

  return v7;
}

id __56__HDUserCharacteristicsManager__queue_updateUserProfile__block_invoke_3_365(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F2B618];
  id v3 = a2;
  int v4 = [v2 meterUnit];
  [v3 doubleValueForUnit:v4];
  double v6 = v5;

  if (v6 <= 2.22044605e-16)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithDouble:v6];
  }

  return v7;
}

uint64_t __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v25 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v25)
  {
    char v22 = 1;
    goto LABEL_32;
  }
  uint64_t v21 = a3;
  uint64_t v24 = *(void *)v30;
  char v22 = 1;
  do
  {
    uint64_t v5 = 0;
    do
    {
      if (*(void *)v30 != v24) {
        objc_enumerationMutation(obj);
      }
      double v6 = *(void **)(*((void *)&v29 + 1) + 8 * v5);
      uint64_t v7 = objc_msgSend(v6, "_relatedQuantityType", v21);
      uint64_t v8 = *(void *)(a1 + 40);
      BOOL v28 = 0;
      if (v8)
      {
        CFStringRef v9 = -[HDUserCharacteristicsManager _mostRecentSampleOfType:beforeDate:error:](v8, v7, 0, (uint64_t)&v28);
        id v10 = v28;
      }
      else
      {
        id v10 = 0;
        CFStringRef v9 = 0;
      }
      id v11 = v10;
      uint64_t v12 = [v9 quantity];
      if (v9)
      {
        [*(id *)(a1 + 48) setObject:v9 forKeyedSubscript:v6];
      }
      else if (v11)
      {
        char v22 = 0;
        void *v21 = v11;
        int v18 = 2;
        goto LABEL_25;
      }
      uint64_t v13 = *(void *)(a1 + 40);
      id v26 = 0;
      id v27 = 0;
      uint64_t v14 = -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](v13, v6, (uint64_t)&v27, (uint64_t)&v26);
      id v15 = v27;
      id v16 = v26;
      int v17 = v16;
      if (v15)
      {
        [*(id *)(a1 + 56) setObject:v15 forKeyedSubscript:v6];
      }
      else if (v16)
      {
        if (v21)
        {
          char v22 = 0;
          void *v21 = v16;
        }
        else
        {
          _HKLogDroppedError();
          char v22 = 0;
        }
        int v18 = 2;
        goto LABEL_24;
      }
      if (v12 == v14 || v14 && ([v12 isEqual:v14] & 1) != 0)
      {
        int v18 = 0;
      }
      else
      {
        int v18 = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      }
LABEL_24:

LABEL_25:
      if (v18) {
        goto LABEL_32;
      }
      ++v5;
    }
    while (v25 != v5);
    uint64_t v19 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    uint64_t v25 = v19;
  }
  while (v19);
LABEL_32:

  return v22 & 1;
}

uint64_t __68__HDUserCharacteristicsManager__queue_updateQuantityCharacteristics__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v31)
  {
    BOOL v28 = a3;
    uint64_t v30 = *(void *)v37;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v37 != v30) {
        objc_enumerationMutation(obj);
      }
      double v6 = *(void **)(*((void *)&v36 + 1) + 8 * v5);
      uint64_t v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      long long v32 = [v7 quantity];
      uint64_t v8 = *(void *)(a1 + 48);
      id v34 = 0;
      id v35 = 0;
      CFStringRef v9 = -[HDUserCharacteristicsManager _userCharacteristicForType:entity:error:](v8, v6, (uint64_t)&v35, (uint64_t)&v34);
      id v10 = v35;
      id v11 = v34;
      uint64_t v12 = [*(id *)(a1 + 56) objectForKeyedSubscript:v6];
      uint64_t v13 = [v12 persistentID];
      uint64_t v14 = [v10 persistentID];
      if (!v11)
      {
        uint64_t v15 = v14;
        if (v13 != v14) {
          break;
        }
      }
      if (v11) {
        goto LABEL_22;
      }
      int v17 = v32;
      if (v32 != v9)
      {
        if (!v9 || ([v32 isEqual:v9] & 1) == 0)
        {
          _HKInitializeLogging();
          int v18 = *MEMORY[0x1E4F29F28];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v41 = (uint64_t)v6;
            _os_log_debug_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEBUG, "Updating quantity characteristic for %@", buf, 0xCu);
          }
          uint64_t v19 = *(void **)(a1 + 48);
          unsigned int v20 = [v7 quantity];
          id v33 = 0;
          char v21 = [v19 _setUserCharacteristic:v20 forType:v6 shouldInsertSample:0 updateProfileAndSync:0 error:&v33];
          id v11 = v33;

          uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
          if (*(unsigned char *)(v22 + 24)) {
            char v23 = 1;
          }
          else {
            char v23 = v21;
          }
          *(unsigned char *)(v22 + 24) = v23;
          if ((v21 & 1) == 0)
          {
            id v25 = v11;
            id v26 = v25;
            if (v25)
            {
              if (v28) {
                *BOOL v28 = v25;
              }
              else {
                _HKLogDroppedError();
              }
            }

            uint64_t v24 = 0;
            goto LABEL_31;
          }
          goto LABEL_22;
        }
        id v11 = 0;
      }
LABEL_23:

      if (v31 == ++v5)
      {
        uint64_t v31 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v31) {
          goto LABEL_3;
        }
        goto LABEL_25;
      }
    }
    _HKInitializeLogging();
    id v16 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218240;
      uint64_t v41 = v13;
      __int16 v42 = 2048;
      uint64_t v43 = v15;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Not updating quantity characteristic: kv row changed from %lld to %lld", buf, 0x16u);
    }
    id v11 = 0;
LABEL_22:
    int v17 = v32;
    goto LABEL_23;
  }
LABEL_25:
  uint64_t v24 = 1;
LABEL_31:

  return v24;
}

- (id)_mostRecentSampleOfType:(void *)a3 beforeDate:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    CFStringRef v9 = HDSampleEntityPredicateForStartDate(3);
  }
  else
  {
    CFStringRef v9 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v11 = +[HDSampleEntity mostRecentSampleWithType:v7 profile:WeakRetained encodingOptions:0 predicate:v9 anchor:0 error:a4];

  return v11;
}

- (void)profileDidBecomeReady:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v5 = [WeakRetained cloudSyncManager];
  id v47 = 0;
  char v6 = [v5 canPerformCloudSyncWithError:&v47];
  id v7 = v47;
  self->_isCloudSyncEnabled = v6;

  objc_initWeak(&location, self);
  id v8 = objc_opt_class();
  queue = self->_queue;
  handler[0] = (id)MEMORY[0x1E4F143A8];
  handler[1] = (id)3221225472;
  handler[2] = __67__HDUserCharacteristicsManager__registerForTimeChangeNotifications__block_invoke;
  handler[3] = &unk_1E62F8738;
  v49[1] = v8;
  objc_copyWeak(v49, &location);
  notify_register_dispatch("SignificantTimeChangeNotification", &self->_significantTimeChangeNotificationToken, queue, handler);
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel_didReceiveDayChangeNotification_ name:*MEMORY[0x1E4F1C2E0] object:0];

  objc_destroyWeak(v49);
  objc_destroyWeak(&location);
  id v11 = objc_loadWeakRetained((id *)&self->_profile);
  uint64_t v12 = [v11 daemon];
  uint64_t v13 = [v12 behavior];
  char v14 = [v13 isAppleWatch];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v15 addObserver:self selector:sel_didReceiveAuthKitDeviceListChangeNotification_ name:*MEMORY[0x1E4F4EE48] object:0];
  }
  objc_initWeak(handler, self);
  id v16 = objc_alloc(MEMORY[0x1E4F2B8C8]);
  int v17 = self->_queue;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke;
  v45[3] = &unk_1E62F6BD0;
  objc_copyWeak(&v46, handler);
  int v18 = (_HKDelayedOperation *)[v16 initWithMode:0 queue:v17 delay:v45 block:3.0];
  updateOperation = self->_updateOperation;
  self->_updateOperation = v18;

  id v20 = objc_loadWeakRetained((id *)&self->_profile);
  char v21 = [v20 dataManager];
  id v22 = objc_loadWeakRetained((id *)&self->_profile);
  char v23 = [v22 daemon];
  uint64_t v24 = [v23 behavior];
  char v25 = [v24 isAppleWatch];

  if ((v25 & 1) == 0)
  {
    id v26 = [v20 nanoSyncManager];
    [v26 addObserver:self];

    id v27 = [v20 cloudSyncManager];
    [v27 addObserver:self queue:self->_queue];
  }
  if (self->_shouldUpdateQuantityCharacteristics)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    BOOL v28 = QuantityCharacteristicTypes();
    uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v42;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v28);
          }
          long long v32 = [*(id *)(*((void *)&v41 + 1) + 8 * v31) _relatedQuantityType];
          [v21 addObserver:self forDataType:v32];

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v29);
    }
  }
  id v33 = [MEMORY[0x1E4F2B2C0] characteristicTypeForIdentifier:*MEMORY[0x1E4F298A0]];
  id v34 = [v33 _relatedCategoryType];
  [v21 addObserver:self forDataType:v34];

  id v35 = [v20 database];
  [v35 addProtectedDataObserver:self queue:self->_queue];

  if (!_HDIsUnitTesting)
  {
    long long v36 = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke_2;
    block[3] = &unk_1E62F74E0;
    id v39 = v20;
    objc_copyWeak(&v40, handler);
    dispatch_async(v36, block);
    objc_destroyWeak(&v40);
  }
  objc_destroyWeak(&v46);
  objc_destroyWeak(handler);
}

void __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile]((uint64_t)WeakRetained);
}

void __54__HDUserCharacteristicsManager_profileDidBecomeReady___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) database];
  int v3 = [v2 isProtectedDataAvailable];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfile]((uint64_t)WeakRetained);
  }
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HDUserCharacteristicsManager_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__HDUserCharacteristicsManager_samplesAdded_anchor___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(v1 + 80) execute];
  }
  return result;
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__HDUserCharacteristicsManager_samplesOfTypesWereRemoved_anchor___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__HDUserCharacteristicsManager_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(v1 + 80) execute];
  }
  return result;
}

- (id)diagnosticDescription
{
  int v3 = [MEMORY[0x1E4F28E78] string];
  int v4 = v3;
  if (self->_needsUpdateAfterUnlock) {
    uint64_t v5 = "YES";
  }
  else {
    uint64_t v5 = "NO";
  }
  objc_msgSend(v3, "appendFormat:", @"Needs update after unlock: %s\n", v5);
  char v6 = HKDiagnosticStringFromDate();
  [v4 appendFormat:@"Profile last updated: %@\n", v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v8 = [WeakRetained daemon];
  CFStringRef v9 = [v8 behavior];
  int v10 = [v9 isAppleInternalInstall];

  if (v10)
  {
    lastUserProfile = self->_lastUserProfile;
    if (!lastUserProfile) {
      lastUserProfile = (NSDictionary *)&stru_1F1728D60;
    }
    [v4 appendFormat:@"Last user profile: %@", lastUserProfile];
  }

  return v4;
}

- (void)nanoSyncManager:(id)a3 pairedDevicesChanged:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__HDUserCharacteristicsManager_nanoSyncManager_pairedDevicesChanged___block_invoke;
  v8[3] = &unk_1E62F31C0;
  id v9 = v5;
  int v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __69__HDUserCharacteristicsManager_nanoSyncManager_pairedDevicesChanged___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) allDeviceInfos];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary](v4);
  }
  else
  {
    _HKInitializeLogging();
    id v5 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[HDUserCharacteristicsManager nanoSyncManager:pairedDevicesChanged:]_block_invoke";
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%s updating the watch on account state for a paired devices change", (uint8_t *)&v6, 0xCu);
    }
    -[HDUserCharacteristicsManager _updateHasWatchOnAccountWithRandomDelayAndResetIfNecessary:](*(void *)(a1 + 40), 0);
  }
}

- (void)cloudSyncManager:(id)a3 didUpdateSyncEnabled:(BOOL)a4
{
  if (self->_isCloudSyncEnabled != a4)
  {
    self->_isCloudSyncEnabled = a4;
    -[HDUserCharacteristicsManager _queue_updateFitnessModeDefaultAndNotifyIfNecessary]((uint64_t)self);
  }
}

- (void)didReceiveDayChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__HDUserCharacteristicsManager_didReceiveDayChangeNotification___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__HDUserCharacteristicsManager_didReceiveDayChangeNotification___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(v1 + 80) execute];
  }
  return result;
}

void __67__HDUserCharacteristicsManager__registerForTimeChangeNotifications__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = HKLogInfrastructure();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating age gating due to significant time change.", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained[10] execute];
  }
}

- (void)didReceiveAuthKitDeviceListChangeNotification:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HDUserCharacteristicsManager_didReceiveAuthKitDeviceListChangeNotification___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __78__HDUserCharacteristicsManager_didReceiveAuthKitDeviceListChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    uint64_t v4 = "-[HDUserCharacteristicsManager didReceiveAuthKitDeviceListChangeNotification:]_block_invoke";
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "%s updating the watch on account state for a device list change", (uint8_t *)&v3, 0xCu);
  }
  -[HDUserCharacteristicsManager _updateHasWatchOnAccountWithRandomDelayAndResetIfNecessary:](*(void *)(a1 + 32), 1);
}

uint64_t __51__HDUserCharacteristicsManager_addProfileObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 userCharacteristicsManager:*(void *)(a1 + 32) didUpdateUserProfile:*(void *)(a1 + 40)];
}

- (void)removeProfileObserver:(id)a3
{
}

- (void)unitTest_updateCharacteristicsAndUserProfileWithDate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__HDUserCharacteristicsManager_unitTest_updateCharacteristicsAndUserProfileWithDate_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __96__HDUserCharacteristicsManager_unitTest_updateCharacteristicsAndUserProfileWithDate_completion___block_invoke(uint64_t a1)
{
  -[HDUserCharacteristicsManager _queue_updateCharacteristicsAndUserProfileWithDate:](*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_hasWatchOnAccount, 0);
  objc_storeStrong((id *)&self->_lastUserProfile, 0);
  objc_storeStrong((id *)&self->_userProfileLastUpdated, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end