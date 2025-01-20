@interface DNDSMutableModeAssertionStore
- (id)copyWithZone:(_NSZone *)a3;
- (void)downgradeAssertionsIfNeededForSyncToPairedDevice:(id)a3 dataSource:(id)a4 syncManager:(id)a5;
- (void)filterForSyncToPairedDevice:(id)a3 clientDetailsProvider:(id)a4;
- (void)resolveSourcesForSyncFromPairedDevice:(id)a3;
- (void)sanitizeDatesForThreshold:(id)a3;
- (void)setAssertions:(id)a3;
- (void)setInvalidationRequests:(id)a3;
- (void)setInvalidations:(id)a3;
- (void)unresolveSourcesForSyncToPairedDevice:(id)a3;
- (void)updateConfigurationModificationDatesWithDataSource:(id)a3 syncManager:(id)a4;
@end

@implementation DNDSMutableModeAssertionStore

- (void)setAssertions:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  assertions = self->super._assertions;
  self->super._assertions = v4;
  MEMORY[0x1F41817F8](v4, assertions);
}

- (void)setInvalidations:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  invalidations = self->super._invalidations;
  self->super._invalidations = v4;
  MEMORY[0x1F41817F8](v4, invalidations);
}

- (void)setInvalidationRequests:(id)a3
{
  v4 = (NSArray *)[a3 copy];
  invalidationRequests = self->super._invalidationRequests;
  self->super._invalidationRequests = v4;
  MEMORY[0x1F41817F8](v4, invalidationRequests);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [DNDSModeAssertionStore alloc];
  return [(DNDSModeAssertionStore *)v4 _initWithStore:self];
}

- (void)filterForSyncToPairedDevice:(id)a3 clientDetailsProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(DNDSModeAssertionStore *)self assertions];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke;
  v29[3] = &unk_1E6974548;
  id v9 = v7;
  id v30 = v9;
  id v10 = v6;
  id v31 = v10;
  v11 = objc_msgSend(v8, "bs_filter:", v29);

  [(DNDSMutableModeAssertionStore *)self setAssertions:v11];
  v12 = [(DNDSModeAssertionStore *)self invalidations];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_2;
  v26[3] = &unk_1E6974570;
  id v13 = v9;
  id v27 = v13;
  id v14 = v10;
  id v28 = v14;
  v15 = objc_msgSend(v12, "bs_filter:", v26);

  [(DNDSMutableModeAssertionStore *)self setInvalidations:v15];
  v16 = [(DNDSModeAssertionStore *)self invalidationRequests];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_3;
  v23 = &unk_1E6974598;
  id v24 = v13;
  id v25 = v14;
  id v17 = v14;
  id v18 = v13;
  v19 = objc_msgSend(v16, "bs_filter:", &v20);

  -[DNDSMutableModeAssertionStore setInvalidationRequests:](self, "setInvalidationRequests:", v19, v20, v21, v22, v23);
}

uint64_t __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 source];
  id v6 = [v5 clientIdentifier];
  id v7 = [v4 clientDetailsForIdentifier:v6];

  if ([v7 isSyncSuppressedClient])
  {
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = [v3 source];
    id v10 = [v9 deviceIdentifier];
    v11 = [*(id *)(a1 + 40) deviceIdentifier];
    if ([v10 isEqualToString:v11])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isIOS14SyncSuppressedClient])
    {
      uint64_t v8 = [*(id *)(a1 + 40) isIOS14EraOS] ^ 1;
    }
    else
    {
      uint64_t v8 = 1;
    }
  }
  return v8;
}

uint64_t __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 assertion];
  id v6 = [v5 source];
  id v7 = [v6 clientIdentifier];
  uint64_t v8 = [v3 clientDetailsForIdentifier:v7];

  uint64_t v9 = [v4 reason];
  if (v9 == 1 || ([v8 isSyncSuppressedClient] & 1) != 0)
  {
    uint64_t v10 = 0;
  }
  else if ([v8 isIOS14SyncSuppressedClient])
  {
    uint64_t v10 = [*(id *)(a1 + 40) isIOS14EraOS] ^ 1;
  }
  else
  {
    uint64_t v10 = 1;
  }

  return v10;
}

uint64_t __108__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__filterForSyncToPairedDevice_clientDetailsProvider___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v4 source];
  id v6 = [v5 clientIdentifier];
  id v7 = [v3 clientDetailsForIdentifier:v6];

  uint64_t v8 = [v4 reason];
  if (v8 == 1 || ([v7 isSyncSuppressedClient] & 1) != 0)
  {
    uint64_t v9 = 0;
  }
  else if ([v7 isIOS14SyncSuppressedClient])
  {
    uint64_t v9 = [*(id *)(a1 + 40) isIOS14EraOS] ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)unresolveSourcesForSyncToPairedDevice:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSModeAssertionStore *)self assertions];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke;
  v18[3] = &unk_1E69745C0;
  id v6 = v4;
  id v19 = v6;
  id v7 = objc_msgSend(v5, "bs_compactMap:", v18);

  [(DNDSMutableModeAssertionStore *)self setAssertions:v7];
  uint64_t v8 = [(DNDSModeAssertionStore *)self invalidations];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_2;
  v16[3] = &unk_1E69745E8;
  id v9 = v6;
  id v17 = v9;
  uint64_t v10 = objc_msgSend(v8, "bs_mapNoNulls:", v16);

  [(DNDSMutableModeAssertionStore *)self setInvalidations:v10];
  v11 = [(DNDSModeAssertionStore *)self invalidationRequests];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_3;
  v14[3] = &unk_1E6974610;
  id v15 = v9;
  id v12 = v9;
  id v13 = objc_msgSend(v11, "bs_mapNoNulls:", v14);

  [(DNDSMutableModeAssertionStore *)self setInvalidationRequests:v13];
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceIdentifier];
  v5 = [v3 resolveWithExpectedRemoteDeviceIdentifier:v4 localDeviceIdentifier:0 remoteDeviceIdentifier:@"dr"];

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceIdentifier];
  v5 = [v3 resolveWithExpectedRemoteDeviceIdentifier:v4 localDeviceIdentifier:0 remoteDeviceIdentifier:@"dr"];

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__unresolveSourcesForSyncToPairedDevice___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceIdentifier];
  v5 = [v3 resolveWithExpectedRemoteDeviceIdentifier:v4 localDeviceIdentifier:0 remoteDeviceIdentifier:@"dr"];

  return v5;
}

- (void)resolveSourcesForSyncFromPairedDevice:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSModeAssertionStore *)self assertions];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke;
  v18[3] = &unk_1E69745C0;
  id v6 = v4;
  id v19 = v6;
  id v7 = objc_msgSend(v5, "bs_compactMap:", v18);

  [(DNDSMutableModeAssertionStore *)self setAssertions:v7];
  uint64_t v8 = [(DNDSModeAssertionStore *)self invalidations];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_2;
  v16[3] = &unk_1E69745E8;
  id v9 = v6;
  id v17 = v9;
  uint64_t v10 = objc_msgSend(v8, "bs_mapNoNulls:", v16);

  [(DNDSMutableModeAssertionStore *)self setInvalidations:v10];
  v11 = [(DNDSModeAssertionStore *)self invalidationRequests];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_3;
  v14[3] = &unk_1E6974610;
  id v15 = v9;
  id v12 = v9;
  id v13 = objc_msgSend(v11, "bs_mapNoNulls:", v14);

  [(DNDSMutableModeAssertionStore *)self setInvalidationRequests:v13];
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceIdentifier];
  v5 = [v3 resolveWithExpectedRemoteDeviceIdentifier:@"dr" localDeviceIdentifier:v4 remoteDeviceIdentifier:0];

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceIdentifier];
  v5 = [v3 resolveWithExpectedRemoteDeviceIdentifier:@"dr" localDeviceIdentifier:v4 remoteDeviceIdentifier:0];

  return v5;
}

id __96__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__resolveSourcesForSyncFromPairedDevice___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 deviceIdentifier];
  v5 = [v3 resolveWithExpectedRemoteDeviceIdentifier:@"dr" localDeviceIdentifier:v4 remoteDeviceIdentifier:0];

  return v5;
}

- (void)updateConfigurationModificationDatesWithDataSource:(id)a3 syncManager:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(DNDSModeAssertionStore *)self assertions];
  uint64_t v8 = (void *)[v7 mutableCopy];

  if ([v8 count])
  {
    unint64_t v9 = 0;
    do
    {
      uint64_t v10 = [v8 objectAtIndexedSubscript:v9];
      v11 = [v10 source];
      id v12 = [v11 deviceIdentifier];

      if (!v12)
      {
        uint64_t v13 = [v14 syncManager:v6 updateOutboundModeAssertion:v10];

        [v8 setObject:v13 atIndexedSubscript:v9];
        uint64_t v10 = (void *)v13;
      }

      ++v9;
    }
    while (v9 < [v8 count]);
  }
  [(DNDSMutableModeAssertionStore *)self setAssertions:v8];
}

- (void)downgradeAssertionsIfNeededForSyncToPairedDevice:(id)a3 dataSource:(id)a4 syncManager:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (([a3 supportsKettle] & 1) == 0)
  {
    uint64_t v10 = [(DNDSModeAssertionStore *)self assertions];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __130__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__downgradeAssertionsIfNeededForSyncToPairedDevice_dataSource_syncManager___block_invoke;
    id v15 = &unk_1E6974638;
    id v16 = v8;
    id v17 = v9;
    v11 = objc_msgSend(v10, "bs_map:", &v12);

    -[DNDSMutableModeAssertionStore setAssertions:](self, "setAssertions:", v11, v12, v13, v14, v15);
  }
}

id __130__DNDSMutableModeAssertionStore_DNDSModernAssertionSync__downgradeAssertionsIfNeededForSyncToPairedDevice_dataSource_syncManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isInternalScheduled])
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v6 = [v3 details];
    id v7 = [v6 modeIdentifier];
    id v8 = [v5 syncManager:v4 scheduleSettingsForModeIdentifier:v7];

    id v9 = (void *)MEMORY[0x1E4F28C18];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v12 = objc_msgSend(v9, "dnds_dateIntervalForScheduleSettings:date:calendar:", v8, v10, v11);

    uint64_t v13 = [MEMORY[0x1E4F5F638] lifetimeWithDateInterval:v12];
    id v14 = [v3 details];
    id v15 = (void *)[v14 mutableCopy];

    [v15 setLifetime:v13];
    id v16 = objc_alloc(MEMORY[0x1E4F5F600]);
    id v17 = [v3 UUID];
    id v18 = [MEMORY[0x1E4F1C9C8] date];
    id v19 = [v3 source];
    id v20 = (id)[v16 initWithUUID:v17 startDate:v18 details:v15 source:v19];
  }
  else
  {
    id v20 = v3;
  }

  return v20;
}

- (void)sanitizeDatesForThreshold:(id)a3
{
  id v4 = a3;
  v5 = [(DNDSModeAssertionStore *)self assertions];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke;
  v18[3] = &unk_1E69745C0;
  id v6 = v4;
  id v19 = v6;
  id v7 = objc_msgSend(v5, "bs_mapNoNulls:", v18);

  [(DNDSMutableModeAssertionStore *)self setAssertions:v7];
  id v8 = [(DNDSModeAssertionStore *)self invalidations];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_2;
  v16[3] = &unk_1E69745E8;
  id v9 = v6;
  id v17 = v9;
  uint64_t v10 = objc_msgSend(v8, "bs_mapNoNulls:", v16);

  [(DNDSMutableModeAssertionStore *)self setInvalidations:v10];
  v11 = [(DNDSModeAssertionStore *)self invalidationRequests];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_5;
  v14[3] = &unk_1E6974610;
  id v15 = v9;
  id v12 = v9;
  uint64_t v13 = objc_msgSend(v11, "bs_mapNoNulls:", v14);

  [(DNDSMutableModeAssertionStore *)self setInvalidationRequests:v13];
}

id __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 startDate];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1)
  {
    id v7 = DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      id v19 = v3;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Will sanitize assertion date: date=%{public}@ assertion=%{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F5F600]);
    uint64_t v10 = [v3 UUID];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v3 details];
    uint64_t v13 = [v3 source];
    uint64_t v14 = [v9 initWithUUID:v10 startDate:v11 details:v12 source:v13];

    id v3 = (id)v14;
  }
  return v3;
}

id __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 invalidationDate];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1)
  {
    id v7 = DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v16 = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      id v19 = v3;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Will sanitize invalidation date: date=%{public}@ invalidation=%{public}@", (uint8_t *)&v16, 0x16u);
    }
    id v9 = objc_alloc(MEMORY[0x1E4F5F630]);
    uint64_t v10 = [v3 assertion];
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = [v3 details];
    uint64_t v13 = [v3 source];
    uint64_t v14 = objc_msgSend(v9, "initWithAssertion:invalidationDate:details:source:reason:reasonOverride:", v10, v11, v12, v13, objc_msgSend(v3, "reason"), objc_msgSend(v3, "reasonOverride"));

    id v3 = (id)v14;
  }
  return v3;
}

id __75__DNDSMutableModeAssertionStore_DateOperations__sanitizeDatesForThreshold___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v5 = [v3 requestDate];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1)
  {
    id v7 = DNDSLogAssertionStore;
    if (os_log_type_enabled((os_log_t)DNDSLogAssertionStore, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v15 = 138543618;
      uint64_t v16 = v8;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Will sanitize invalidation request date: date=%{public}@ invalidationRequest=%{public}@", (uint8_t *)&v15, 0x16u);
    }
    id v9 = [v3 predicate];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = [v3 details];
    id v12 = [v3 source];
    uint64_t v13 = +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v9, v10, v11, v12, [v3 reason], objc_msgSend(v3, "reasonOverride"));

    id v3 = (id)v13;
  }
  return v3;
}

@end