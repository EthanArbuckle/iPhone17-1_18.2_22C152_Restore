@interface DKSyncCloudKitKnowledgeStorage
@end

@implementation DKSyncCloudKitKnowledgeStorage

uint64_t __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke()
{
  uint64_t v0 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_cloud_kit", @"unrecoverable_decryption_error");
  v1 = (void *)_handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounter;
  _handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorCounter = v0;

  uint64_t v2 = +[_DKEventStatsCounter counterInCollection:withEventName:]((uint64_t)_DKEventStatsCounter, @"coreduet_cloud_kit", @"unrecoverable_decryption_error_repeat");
  uint64_t v3 = _handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorRepeatCounter;
  _handleAnySpecialnessWithOperationError__unrecoverableDecryptionErrorRepeatCounter = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

uint64_t __49___DKSyncCloudKitKnowledgeStorage_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __69___DKSyncCloudKitKnowledgeStorage_finishStartBecauseCloudIsAvailable__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  -[_DKSyncCloudKitKnowledgeStorage unregisterUpdateSourceDeviceIdentifiersPeriodicJob](v3);
  -[_DKSyncCloudKitKnowledgeStorage finishStartOrError:](*(void *)(a1 + 32), v4);
}

uint64_t __75___DKSyncCloudKitKnowledgeStorage_startShouldUpdateSourceDeviceIdentifiers__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_2();
    }
LABEL_7:

    goto LABEL_8;
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setBool:1 forKey:@"DidRegisterDatabaseChangesSubscription"];
  if ([v6 count] != 1)
  {
    v8 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_1();
    }
    goto LABEL_7;
  }
LABEL_8:
}

void __67___DKSyncCloudKitKnowledgeStorage__cloudSyncAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_6;
  }
  if ((*(unsigned char *)(v2 + 152) & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v3 = +[_DKCloudUtilities isSyncAvailableAndEnabled];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v3)
  {
    if (v2)
    {
LABEL_5:
      if (*(unsigned char *)(v2 + 152)) {
        return;
      }
    }
LABEL_6:
    if (+[_DKCloudUtilities isSyncAvailableAndEnabled])
    {
      id v4 = *(id **)(a1 + 32);
      -[_DKSyncCloudKitKnowledgeStorage finishStartBecauseCloudIsAvailable](v4);
    }
    return;
  }
  if (v2) {
    *(unsigned char *)(v2 + 152) = 0;
  }
  id v5 = +[_CDObservationCenter sharedInstance];
  [v5 postNotificationName:@"_DKCloudTransportAvailablityChangedNotification" userInfo:0 sender:*(void *)(a1 + 32)];
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_87(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v4);

  if (v3)
  {
    id v5 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_87_cold_1();
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_88;
  v8[3] = &unk_1E560DB58;
  v8[4] = v6;
  v8[5] = v7;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v11 = *(id *)(a1 + 64);
  -[_DKSyncCloudKitKnowledgeStorage _createZoneWithZoneID:completion:](v6, v7, v8);
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = +[_CDLogging syncChannel];
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_88_cold_1(a1, v3, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [(id)objc_opt_class() description];
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      _os_log_impl(&dword_18ECEB000, v6, OS_LOG_TYPE_INFO, "%{public}@: Recreated zone %{public}@ due to unrecoverable decryption error", buf, 0x16u);
    }
    if ([*(id *)(a1 + 40) isEqual:*(void *)(a1 + 48)]) {
      [*(id *)(*(void *)(a1 + 32) + 16) setBool:1 forKey:@"HaveCreatedMyZone"];
    }
  }
  [*(id *)(a1 + 56) addObject:*(void *)(a1 + 40)];
  uint64_t v9 = [*(id *)(a1 + 56) count];
  if (v9 == [*(id *)(a1 + 64) count])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_89;
    v10[3] = &unk_1E560D578;
    v10[4] = *(void *)(a1 + 32);
    +[_DKSyncSerializer performAsyncBlock:v10];
  }
}

uint64_t __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_89(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [(id)objc_opt_class() description];
    *(_DWORD *)buf = 138543362;
    v12 = v3;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "%{public}@: Fetching source device identifiers after handling unrecoverable decryption errors", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_90;
  uint64_t v9 = &unk_1E560D730;
  uint64_t v10 = v4;
  return -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:]();
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[_CDLogging syncChannel];
  uint64_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_90_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v5 = [(id)objc_opt_class() description];
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_INFO, "%{public}@: Done fetching source device identifiers after handling unrecoverable decryption errors", (uint8_t *)&v6, 0xCu);
  }
}

void __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke(uint64_t *a1)
{
  if ([(id)a1[4] associateWithCompletedOperation:a1[5]])
  {
    id v2 = *(void **)(a1[6] + 56);
    uint64_t v3 = a1[4];
    [v2 submitEventMetric:v3];
  }
  else
  {
    uint64_t v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke_cold_1();
    }
  }
}

void __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
}

uint64_t __86___DKSyncCloudKitKnowledgeStorage_performUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v7);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2;
  v10[3] = &unk_1E560DBA8;
  objc_copyWeak(&v15, (id *)(a1 + 56));
  objc_copyWeak(&v16, (id *)(a1 + 64));
  v10[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v11 = v8;
  id v9 = v6;
  id v12 = v9;
  id v14 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 40);
  +[_DKSyncSerializer performSyncBlock:v10];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = objc_loadWeakRetained((id *)(a1 + 80));
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 metrics];
    id v6 = [v5 cloudKitMetrics];
    uint64_t v7 = [v6 startDate];

    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 160) syncType];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v9, 4, v7, v8, [*(id *)(a1 + 40) count] == 0);
  }
  id v10 = *(id *)(a1 + 48);
  if (*(void *)(a1 + 48))
  {
    if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, *(void **)(a1 + 48)) & 1) == 0)
    {
      uint64_t v11 = [*(id *)(a1 + 40) count];
      id v12 = +[_CDLogging syncChannel];
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      if (v11)
      {
        if (v13) {
          __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_2();
        }
      }
      else if (v13)
      {
        __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_1();
      }
    }
    uint64_t v14 = -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](WeakRetained, *(void **)(a1 + 48));

    -[_DKSyncCloudKitKnowledgeStorage scheduleRetryUpdateSourceDeviceIdentifiers]((uint64_t)WeakRetained);
    id v10 = (id)v14;
  }
  id v15 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
  if ([*(id *)(a1 + 40) count])
  {
    id v16 = *(void **)(a1 + 40);
    v17 = *(void (***)(void, void))(a1 + 64);
LABEL_18:
    -[_DKSyncCloudKitKnowledgeStorage updateSourceDeviceIdentifiersWithRecordZonesByZoneID:completion:](WeakRetained, v16, v17);
    goto LABEL_19;
  }
  char v18 = [*(id *)(*(void *)(a1 + 32) + 120) containsObject:v15];
  v17 = *(void (***)(void, void))(a1 + 64);
  if ((v18 & 1) == 0)
  {
    id v16 = (void *)MEMORY[0x1E4F1CC08];
    goto LABEL_18;
  }
  if (v17) {
    ((void (**)(void, id))v17)[2](*(void *)(a1 + 64), v10);
  }
LABEL_19:
}

void __99___DKSyncCloudKitKnowledgeStorage_updateSourceDeviceIdentifiersWithRecordZonesByZoneID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __99___DKSyncCloudKitKnowledgeStorage_updateSourceDeviceIdentifiersWithRecordZonesByZoneID_completion___block_invoke_cold_1(a1, v3, v4);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setBool:1 forKey:@"HaveCreatedMyZone"];
  }
  -[_DKSyncCloudKitKnowledgeStorage finishUpdatingSourceDeviceIdentifiersWithZoneIDsBySourceDeviceID:orError:completion:](*(void *)(a1 + 32), *(void **)(a1 + 48), v3, *(void **)(a1 + 56));
}

uint64_t __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2;
  id v6 = &unk_1E560D730;
  uint64_t v7 = v1;
  return -[_DKSyncCloudKitKnowledgeStorage performUpdateSourceDeviceIdentifiersWithCompletion:]();
}

void __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v2 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2_cold_1();
    }
  }
}

void __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v10);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke_2;
  v14[3] = &unk_1E560DC20;
  objc_copyWeak(&v20, (id *)(a1 + 64));
  uint64_t v11 = *(void **)(a1 + 40);
  v14[4] = *(void *)(a1 + 32);
  id v15 = v11;
  id v12 = v7;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v19 = *(id *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  +[_DKSyncSerializer performSyncBlock:v14];

  objc_destroyWeak(&v20);
}

void __68___DKSyncCloudKitKnowledgeStorage__createZoneWithZoneID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v2 = [WeakRetained metrics];
    uint64_t v3 = [v2 cloudKitMetrics];
    uint64_t v4 = [v3 startDate];

    id v5 = [MEMORY[0x1E4F1C9C8] date];
    id v6 = [*(id *)(*(void *)(a1 + 32) + 160) syncType];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v6, 8, v4, v5, [*(id *)(a1 + 40) count] == 0);
  }
  -[_DKSyncCloudKitKnowledgeStorage _storeZoneIDFromRecords:orError:](*(void *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
  uint64_t v7 = *(void *)(a1 + 72);
  if (v7) {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 56));
  }
}

void __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v10);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke_2;
  v13[3] = &unk_1E560DC70;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  uint64_t v11 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v11;
  id v17 = *(id *)(a1 + 56);
  id v12 = v9;
  id v15 = v12;
  id v16 = *(id *)(a1 + 48);
  +[_DKSyncSerializer performSyncBlock:v13];

  objc_destroyWeak(&v18);
}

uint64_t __68___DKSyncCloudKitKnowledgeStorage__deleteZoneWithZoneID_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v3 = WeakRetained;
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained metrics];
    id v5 = [v4 cloudKitMetrics];
    id v6 = [v5 startDate];

    id v7 = [MEMORY[0x1E4F1C9C8] date];
    id v8 = [*(id *)(*(void *)(a1 + 32) + 160) syncType];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v8, 8, v6, v7, [*(id *)(a1 + 40) count] == 0);

    id v3 = v11;
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (v9)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(a1 + 48));
    id v3 = v11;
  }
  return MEMORY[0x1F41817F8](v9, v3);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2;
  v5[3] = &unk_1E560DC98;
  v5[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v6 = v4;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  +[_DKSyncSerializer performSyncBlock:v5];
  objc_destroyWeak(&v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [(id)objc_opt_class() description];
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "%{public}@: Zone %{public}@ has changes.", (uint8_t *)&v9, 0x16u);
  }
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v6 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:](*(void *)(a1 + 32), 1, *(void **)(a1 + 40));
      -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:](*(void *)(a1 + 32), 1, *(void **)(a1 + 40));
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[_DKSyncCloudKitKnowledgeStorage addSourceDeviceIdentifierWithRecordZoneID:]((uint64_t)WeakRetained, *(void **)(a1 + 40));
  }
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_182(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_183;
  v5[3] = &unk_1E560DC98;
  v5[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v6 = v4;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  +[_DKSyncSerializer performSyncBlock:v5];
  objc_destroyWeak(&v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_183(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [(id)objc_opt_class() description];
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl(&dword_18ECEB000, v2, OS_LOG_TYPE_INFO, "%{public}@: Zone %{public}@ was deleted.", (uint8_t *)&v7, 0x16u);
  }
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    -[_DKSyncCloudKitKnowledgeStorage setHasZoneAdditionChanges:forZone:](*(void *)(a1 + 32), 0, v5);
    -[_DKSyncCloudKitKnowledgeStorage setHasZoneDeletionChanges:forZone:](*(void *)(a1 + 32), 0, *(void **)(a1 + 40));
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
    -[_DKSyncCloudKitKnowledgeStorage removeSourceDeviceIdentifierWithRecordZoneID:](WeakRetained, *(void **)(a1 + 40));
  }
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_184(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_185;
  v6[3] = &unk_1E560D848;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  +[_DKSyncSerializer performSyncBlock:v6];
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_185(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = +[_CDLogging syncChannel];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_185_cold_2();
    }

    objc_storeStrong((id *)(*(void *)(a1 + 40) + 128), *(id *)(a1 + 32));
    -[_DKSyncCloudKitKnowledgeStorage commitFetchDatabaseChangesServerChangeToken](*(void *)(a1 + 40));
  }
  else
  {
    if (v4) {
      __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_185_cold_1();
    }
  }
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_187(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v8);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188;
  v11[3] = &unk_1E560DD10;
  objc_copyWeak(&v17, (id *)(a1 + 64));
  v11[4] = *(void *)(a1 + 32);
  id v9 = v7;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  objc_copyWeak(&v18, (id *)(a1 + 72));
  id v14 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  +[_DKSyncSerializer performSyncBlock:v11];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained metrics];
    id v5 = [v4 cloudKitMetrics];
    id v6 = [v5 startDate];

    id v7 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 160) syncType];
    +[_DKSyncPowerlog recordWithSyncType:v8 transportType:4 startDate:v6 endDate:v7 isEmpty:0];
  }
  id v9 = *(id *)(a1 + 40);
  if (*(void *)(a1 + 40))
  {
    if (+[_DKCKError isChangeTokenExpiredError:]((uint64_t)_DKCKError, *(void **)(a1 + 40)))
    {
      id v10 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_4();
      }

      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 128);
      *(void *)(v11 + 128) = 0;

      [*(id *)(a1 + 56) removeObjectForKey:@"FetchDatabaseChangesServerChangeToken"];
      id v13 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_3();
      }
    }
    else
    {
      if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, *(void **)(a1 + 40)) & 1) == 0)
      {
        id v17 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_5();
        }
      }
      id v13 = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v18 = -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:]((id *)&v13->isa, *(void **)(a1 + 40));

      id v9 = (id)v18;
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    id v15 = +[_CDLogging syncChannel];
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v16) {
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_2();
      }

      objc_storeStrong((id *)(*(void *)(a1 + 32) + 128), *(id *)(a1 + 48));
      -[_DKSyncCloudKitKnowledgeStorage commitFetchDatabaseChangesServerChangeToken](*(void *)(a1 + 32));
    }
    else
    {
      if (v16) {
        __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_1();
      }
    }
    id v13 = objc_loadWeakRetained((id *)(a1 + 88));
    -[_DKSyncCloudKitKnowledgeStorage setPrewarmedFlag]((uint64_t)v13);
  }

  uint64_t v19 = *(void *)(a1 + 72);
  if (v19) {
    (*(void (**)(uint64_t, id))(v19 + 16))(v19, v9);
  }
}

void __74___DKSyncCloudKitKnowledgeStorage_configurePeerWithSourceDeviceID_zoneID___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 88) objectForKeyedSubscript:*(void *)(a1 + 40)];
    -[_DKSyncCloudKitKnowledgeStorage fastForwardPastDeletionsInNewZone:sourceDeviceID:](*(void *)(a1 + 32), v4, *(void **)(a1 + 48));
  }
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) dataForKey:@"ZoneIDsWithAdditionChanges"];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = objc_opt_class();
    id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    id v17 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v5 fromData:v2 error:&v17];
    id v7 = v17;
    uint64_t v8 = *(void **)(*(void *)v1 + 104);
    *(void *)(*(void *)v1 + 104) = v6;

    id v9 = +[_CDLogging syncChannel];
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke_cold_1();
      }

      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
      id v10 = *(NSObject **)(*(void *)v1 + 104);
      *(void *)(*(void *)v1 + 104) = v11;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(id)objc_opt_class() description];
      id v15 = [*(id *)(*(void *)v1 + 104) valueForKeyPath:@"zoneName"];
      BOOL v16 = _CDPrettyPrintCollection(v15, 0, 0, 0);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "%{public}@: Unarchived _zoneIDsWithAdditionChanges: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    id v13 = *(void **)(*(void *)v1 + 104);
    *(void *)(*(void *)v1 + 104) = v12;
  }
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 32;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) dataForKey:@"ZoneIDsWithDeletionChanges"];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v4 = objc_opt_class();
    id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    id v17 = 0;
    uint64_t v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v5 fromData:v2 error:&v17];
    id v7 = v17;
    uint64_t v8 = *(void **)(*(void *)v1 + 112);
    *(void *)(*(void *)v1 + 112) = v6;

    id v9 = +[_CDLogging syncChannel];
    id v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke_cold_1();
      }

      uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
      id v10 = *(NSObject **)(*(void *)v1 + 112);
      *(void *)(*(void *)v1 + 112) = v11;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [(id)objc_opt_class() description];
      id v15 = [*(id *)(*(void *)v1 + 112) valueForKeyPath:@"zoneName"];
      BOOL v16 = _CDPrettyPrintCollection(v15, 0, 0, 0);
      *(_DWORD *)buf = 138543618;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_INFO, "%{public}@: Unarchived _zoneIDsWithDeletionChanges: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA80] set];
    id v13 = *(void **)(*(void *)v1 + 112);
    *(void *)(*(void *)v1 + 112) = v12;
  }
}

void __116___DKSyncCloudKitKnowledgeStorage_fetchEventsFromPeer_windows_streamNames_limit_fetchOrder_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v11, v7, v8);
  }
}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v4);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_2;
  v6[3] = &unk_1E560D848;
  id v7 = *(id *)(a1 + 32);
  id v8 = v3;
  id v5 = v3;
  +[_DKSyncSerializer performSyncBlock:v6];
}

uint64_t __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 addObject:v4];
}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v7);

  id v8 = [v6 domain];
  if (![v8 isEqualToString:*MEMORY[0x1E4F19C40]]) {
    goto LABEL_4;
  }
  uint64_t v9 = [v6 code];

  if (v9 == 11)
  {
    id v8 = v6;
    id v6 = 0;
LABEL_4:
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4;
  v15[3] = &unk_1E560DDD8;
  id v10 = v5;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 40);
  id v16 = v10;
  uint64_t v17 = v11;
  id v18 = v12;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  objc_copyWeak(&v24, (id *)(a1 + 80));
  v25[1] = *(id *)(a1 + 96);
  id v13 = v6;
  uint64_t v14 = *(void **)(a1 + 104);
  id v21 = v13;
  v25[2] = v14;
  id v23 = *(id *)(a1 + 72);
  objc_copyWeak(v25, (id *)(a1 + 88));
  id v22 = *(id *)(a1 + 64);
  +[_DKSyncSerializer performSyncBlock:v15];

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
}

void __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_3(a1, v3 != 0, v4);
  }

  id v5 = (void *)[*(id *)(a1 + 48) copy];
  id v6 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_2(a1, v5, v6);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 112) == 1) {
      uint64_t v9 = 8;
    }
    else {
      uint64_t v9 = 4;
    }
    id v10 = [WeakRetained metrics];
    uint64_t v11 = [v10 cloudKitMetrics];
    uint64_t v12 = [v11 startDate];

    id v13 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v14 = [*(id *)(*(void *)(a1 + 40) + 160) syncType];
    +[_DKSyncPowerlog recordWithSyncType:transportType:startDate:endDate:isEmpty:](_DKSyncPowerlog, "recordWithSyncType:transportType:startDate:endDate:isEmpty:", v14, v9, v12, v13, [v5 count] == 0);
  }
  id v15 = *(void **)(a1 + 72);
  if (v15)
  {
    if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v15) & 1) == 0)
    {
      id v16 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __120___DKSyncCloudKitKnowledgeStorage_syncDownAdditionsFromCloudWithZoneID_windows_streamNames_limit_fetchOrder_completion___block_invoke_4_cold_1(a1, a1 + 72, v16);
      }
    }
    uint64_t v17 = (id *)objc_loadWeakRetained((id *)(a1 + 104));
    id v18 = -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](v17, *(void **)(a1 + 72));

    uint64_t v19 = *(void *)(a1 + 88);
    if (v19) {
      (*(void (**)(uint64_t, void, void, void *))(v19 + 16))(v19, 0, 0, v18);
    }

    id v20 = 0;
    id v21 = 0;
  }
  else
  {
    if ([v5 count])
    {
      id v22 = [_DKEventCKConverter alloc];
      id v23 = +[_DKSyncCloudKitKnowledgeStorage mySyncZoneID];
      id v24 = [(_DKEventCKConverter *)v22 initWithZoneID:v23];

      id v21 = [(_DKEventCKConverter *)v24 eventsFromRecords:v5];
      uint64_t v25 = [v5 count];
      if (v25 != [v21 count])
      {
        v26 = +[_CDLogging syncChannel];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v28 = [(id)objc_opt_class() description];
          v29 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count") - objc_msgSend(v21, "count"));
          v30 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
          uint64_t v31 = *(void *)(a1 + 56);
          int v32 = 138544130;
          v33 = v28;
          __int16 v34 = 2112;
          v35 = v29;
          __int16 v36 = 2112;
          v37 = v30;
          __int16 v38 = 2114;
          uint64_t v39 = v31;
          _os_log_debug_impl(&dword_18ECEB000, v26, OS_LOG_TYPE_DEBUG, "%{public}@: Unable to convert %@ of %@ records from %{public}@", (uint8_t *)&v32, 0x2Au);
        }
      }
    }
    else
    {
      id v21 = objc_opt_new();
    }
    id v20 = +[_DKSyncWindow completedWindowsWithSortedEvents:windows:fetchOrder:fillOrder:hitLimit:]((uint64_t)_DKSyncWindow, v21, *(void **)(a1 + 64), *(void *)(a1 + 120), 2, v3 != 0);
    uint64_t v27 = *(void *)(a1 + 88);
    if (v27) {
      (*(void (**)(uint64_t, void *, void *, void))(v27 + 16))(v27, v21, v20, 0);
    }
  }
}

void __116___DKSyncCloudKitKnowledgeStorage_fetchDeletedEventIDsFromPeer_sinceDate_streamNames_limit_highPriority_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    id v8 = v10;
    if (v5)
    {
      id v8 = 0;
      id v9 = v5;
    }
    else
    {
      id v9 = 0;
    }
    (*(void (**)(uint64_t, id, void, id))(v7 + 16))(v7, v8, 0, v9);
  }
}

void __83___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v3 = [[_DKEventCKConverter alloc] initWithZoneID:*(void *)(a1 + 40)];
    uint64_t v4 = [(_DKEventCKConverter *)v3 eventIDsFromRecordIDsAndTypes:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 56);
  if (v5) {
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v4, v6);
  }
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v7);

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_2;
  v10[3] = &unk_1E560DB80;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  +[_DKSyncSerializer performSyncBlock:v10];
}

uint64_t __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  uint64_t v4 = a1[5];
  uint64_t v3 = a1[6];
  id v5 = (void *)a1[4];
  return [v5 setObject:v3 forKeyedSubscript:v4];
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  uint64_t v14 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v14);

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_4;
  v18[3] = &unk_1E560DEA0;
  id v15 = v13;
  id v19 = v15;
  id v16 = v11;
  id v20 = v16;
  objc_copyWeak(&v22, (id *)(a1 + 32));
  id v17 = v10;
  id v21 = v17;
  +[_DKSyncSerializer performSyncBlock:v18];

  objc_destroyWeak(&v22);
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_4(void **a1)
{
  uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  if (a1[4])
  {
    id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
    -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](WeakRetained, a1[4]);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a1[5]) {
      return;
    }
    id v4 = objc_loadWeakRetained(a1 + 7);
    -[_DKSyncCloudKitKnowledgeStorage _setPreviousServerChangeToken:forRecordZoneID:]((uint64_t)v4, a1[5], a1[6]);
  }
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v4);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6;
  v8[3] = &unk_1E560DEF0;
  id v5 = v3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v7;
  objc_copyWeak(v14, (id *)(a1 + 64));
  v14[1] = *(id *)(a1 + 72);
  id v12 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  +[_DKSyncSerializer performSyncBlock:v8];

  objc_destroyWeak(v14);
}

void __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_not_V2(v10);

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2;
  v13[3] = &unk_1E560DF68;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  id v11 = *(void **)(a1 + 40);
  v13[4] = *(void *)(a1 + 32);
  id v14 = v11;
  id v15 = *(id *)(a1 + 48);
  id v12 = v9;
  id v16 = v12;
  objc_copyWeak(&v20, (id *)(a1 + 80));
  id v18 = *(id *)(a1 + 64);
  id v17 = *(id *)(a1 + 56);
  +[_DKSyncSerializer performSyncBlock:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
}

void __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v2);

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained metrics];
    uint64_t v6 = [v5 cloudKitMetrics];
    id v7 = [v6 startDate];

    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = [*(id *)(*(void *)(a1 + 32) + 160) syncType];
    if ([*(id *)(a1 + 40) count]) {
      BOOL v10 = 0;
    }
    else {
      BOOL v10 = [*(id *)(a1 + 48) count] == 0;
    }
    +[_DKSyncPowerlog recordWithSyncType:v9 transportType:8 startDate:v7 endDate:v8 isEmpty:v10];
  }
  id v11 = *(id *)(a1 + 56);
  id v12 = *(void **)(a1 + 56);
  if (v12)
  {
    if ((+[_DKCKError isIgnorableError:]((uint64_t)_DKCKError, v12) & 1) == 0)
    {
      id v13 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2_cold_1();
      }
    }
    id v14 = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v15 = -[_DKSyncCloudKitKnowledgeStorage _handleAnySpecialnessWithOperationError:](v14, *(void **)(a1 + 56));

    id v11 = (id)v15;
  }
  uint64_t v16 = *(void *)(a1 + 72);
  if (v16) {
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v11);
  }
}

void __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    -[_DKSyncCloudKitKnowledgeStorage runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion:]((uint64_t)WeakRetained, *(void **)(a1 + 40));
  }
  else
  {
    id v4 = +[_CDLogging syncChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1();
    }

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      uint64_t v6 = +[_DKSyncErrors internalFailure];
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    }
  }
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[_DKSyncSerializer underlyingQueue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_3();
  }

  if (*(void *)(a1 + 40))
  {
    if ((+[_DKCKError isShouldDeferError:]((uint64_t)_DKCKError, v3) & 1) != 0
      || xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
    {
      if (xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3)) {
        goto LABEL_11;
      }
      uint64_t v6 = +[_CDLogging syncChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_2();
      }
    }
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
  }
LABEL_11:
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
  id v8 = +[_CDLogging syncChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1();
  }
}

void __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v1 = [(id)objc_opt_class() description];
  uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v0, "count"));
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_4_5(&dword_18ECEB000, v3, v4, "%{public}@: Incorrect number of saved subscriptions (%@): %@", v5, v6, v7, v8, v9);
}

void __71___DKSyncCloudKitKnowledgeStorage__registerDatabaseChangesSubscription__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to save database subscription: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_87_cold_1()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Ignoring error while deleting zone: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __75___DKSyncCloudKitKnowledgeStorage__handleAnySpecialnessWithOperationError___block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_10() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed fetching source device identifiers after handling unrecoverable decryption errors: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __97___DKSyncCloudKitKnowledgeStorage__queueOperationForPrivateCloudDatabase_dependent_policy_error___block_invoke_cold_1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to associate event metric with operation", v3, v4, v5, v6, v7);
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_42() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to fetch record zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __96___DKSyncCloudKitKnowledgeStorage__performThrottledUpdateSourceDeviceIdentifiersWithCompletion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_42() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to fetch some record zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __77___DKSyncCloudKitKnowledgeStorage_scheduleRetryUpdateSourceDeviceIdentifiers__block_invoke_2_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: After retrying, successfully fetched record zones", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_185_cold_1()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Ignoring empty token %{public}@", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_185_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_45(&dword_18ECEB000, v1, v2, "%{public}@: Holding token %{public}@: %@", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Ignoring empty token %{public}@", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_45(&dword_18ECEB000, v1, v2, "%{public}@: Holding token %{public}@: %@", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_3()
{
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Resetting token %{public}@", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_4()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Change token %{public}@ expired", v3, v4, v5, v6, v7);
}

void __67___DKSyncCloudKitKnowledgeStorage_fetchChangedZonesWithCompletion___block_invoke_2_188_cold_5()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_42() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to fetch changed zones: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneAdditionChangesForZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to unarchive _zoneIDsWithAdditionChanges: %@", v3, v4, v5, v6, v7);
}

void __65___DKSyncCloudKitKnowledgeStorage_hasZoneDeletionChangesForZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to unarchive _zoneIDsWithDeletionChanges: %@", v3, v4, v5, v6, v7);
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Exceeded maximum retries, unable to sync down deletions for %@", v3, v4, v5, v6, v7);
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_5_3();
  a23 = v26;
  a24 = v27;
  OUTLINED_FUNCTION_2_0();
  v28 = [(id)OUTLINED_FUNCTION_37() description];
  v29 = [*v25 domain];
  [*v25 code];
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_31(&dword_18ECEB000, v24, v30, "%{public}@: Failed to sync down deletions for %@: %{public}@:%lld (%@)", &a9);

  OUTLINED_FUNCTION_4_4();
}

void __116___DKSyncCloudKitKnowledgeStorage_syncDownDeletionsFromCloudWithZoneID_deletedRecordIDsAndTypes_attempt_completion___block_invoke_6_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  OUTLINED_FUNCTION_5_3();
  a23 = v26;
  a24 = v27;
  OUTLINED_FUNCTION_2_0();
  v28 = [(id)OUTLINED_FUNCTION_37() description];
  v29 = [*v25 domain];
  [*v25 code];
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_31(&dword_18ECEB000, v24, v30, "%{public}@: Error to sync down deletions for %@: %{public}@:%lld (%@)", &a9);

  OUTLINED_FUNCTION_4_4();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchAdditionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v28;
  a28 = v29;
  uint64_t v31 = v30;
  v33 = v32;
  v35 = v34;
  __int16 v36 = [(id)OUTLINED_FUNCTION_41() description];
  v37 = -[NSDate dk_localtimeString](v33);
  [v35[5] me];
  __int16 v38 = &stru_1EDDE58B8;
  uint64_t v39 = [(id)OUTLINED_FUNCTION_25() identifier];
  uint64_t v40 = [v35[5] model];
  if (v40)
  {
    v41 = NSString;
    [v35[5] model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    __int16 v38 = [v41 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_31(&dword_18ECEB000, v31, v42, "%{public}@: Found additions high water mark %@ for %{public}@peer %{public}@%{public}@", &a11);
  if (v40)
  {
  }
  OUTLINED_FUNCTION_30();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchAdditionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v28;
  a28 = v29;
  uint64_t v31 = v30;
  v33 = v32;
  v35 = v34;
  __int16 v36 = [(id)OUTLINED_FUNCTION_41() description];
  [v35[5] me];
  v37 = &stru_1EDDE58B8;
  __int16 v38 = [(id)OUTLINED_FUNCTION_25() identifier];
  uint64_t v39 = [v35[5] model];
  if (v39)
  {
    uint64_t v40 = NSString;
    [v35[5] model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    v37 = [v40 stringWithFormat:@" (%@)"];
  }
  v41 = -[NSDate dk_localtimeString](v33);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_31(&dword_18ECEB000, v31, v42, "%{public}@: Found no additions high water mark for %{public}@peer %{public}@%{public}@, using %@", &a11);
  if (v39)
  {
  }
  OUTLINED_FUNCTION_30();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchDeletionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v28;
  a28 = v29;
  uint64_t v31 = v30;
  v33 = v32;
  v35 = v34;
  __int16 v36 = [(id)OUTLINED_FUNCTION_41() description];
  v37 = -[NSDate dk_localtimeString](v33);
  [v35[5] me];
  __int16 v38 = &stru_1EDDE58B8;
  uint64_t v39 = [(id)OUTLINED_FUNCTION_25() identifier];
  uint64_t v40 = [v35[5] model];
  if (v40)
  {
    v41 = NSString;
    [v35[5] model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    __int16 v38 = [v41 stringWithFormat:@" (%@)"];
  }
  OUTLINED_FUNCTION_18_0();
  OUTLINED_FUNCTION_31(&dword_18ECEB000, v31, v42, "%{public}@: Found deletions high water mark %@ for %{public}@peer %{public}@%{public}@", &a11);
  if (v40)
  {
  }
  OUTLINED_FUNCTION_30();
}

void __95___DKSyncCloudKitKnowledgeStorage_fetchDeletionsHighWaterMarkWithPeer_highPriority_completion___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint8_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_26();
  a27 = v28;
  a28 = v29;
  uint64_t v31 = v30;
  v33 = v32;
  v35 = v34;
  __int16 v36 = [(id)OUTLINED_FUNCTION_41() description];
  [v35[5] me];
  v37 = &stru_1EDDE58B8;
  __int16 v38 = [(id)OUTLINED_FUNCTION_25() identifier];
  uint64_t v39 = [v35[5] model];
  if (v39)
  {
    uint64_t v40 = NSString;
    [v35[5] model];
    objc_claimAutoreleasedReturnValue();
    OUTLINED_FUNCTION_43();
    v37 = [v40 stringWithFormat:@" (%@)"];
  }
  v41 = -[NSDate dk_localtimeString](v33);
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_31(&dword_18ECEB000, v31, v42, "%{public}@: Found no deletions high water mark for %{public}@peer %{public}@%{public}@, using %@", &a11);
  if (v39)
  {
  }
  OUTLINED_FUNCTION_30();
}

void __95___DKSyncCloudKitKnowledgeStorage_syncUpToCloudWithRecordsToSave_recordIDsToDelete_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_6();
  [(id)OUTLINED_FUNCTION_16(*MEMORY[0x1E4F143B8]) description];
  objc_claimAutoreleasedReturnValue();
  [(id)OUTLINED_FUNCTION_42() domain];
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_5_2(&dword_18ECEB000, v2, v3, "%{public}@: Failed to sync to the cloud: %{public}@:%lld (%@)", v4, v5, v6, v7, v8);
}

void __98___DKSyncCloudKitKnowledgeStorage_registerUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to run periodic job: %{public}@", v3, v4, v5, v6, v7);
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_1()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Finished cleanup for periodic job: %{public}@", v3, v4, v5, v6, v7);
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_2()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "%{public}@: Failed to defer activity for periodic job: %{public}@", v3, v4, v5, v6, v7);
}

void __93___DKSyncCloudKitKnowledgeStorage_runUpdateSourceDeviceIdentifiersPeriodicJobWithCompletion___block_invoke_cold_3()
{
  uint64_t v0 = [(id)OUTLINED_FUNCTION_12() description];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Done running periodic job: %{public}@", v3, v4, v5, v6, v7);
}

@end