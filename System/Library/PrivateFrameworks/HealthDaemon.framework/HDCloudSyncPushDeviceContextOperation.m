@interface HDCloudSyncPushDeviceContextOperation
- (id)_describeRecord:(void *)a3 ckRecord:;
- (id)_describeRecords:(uint64_t)a1;
- (void)_requestTapToRadarWithDescription:(uint64_t)a1;
- (void)_updateRecordsAdd:(void *)a3 recordIDsToDelete:(void *)a4 completion:;
- (void)main;
@end

@implementation HDCloudSyncPushDeviceContextOperation

- (void)main
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1A320];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [v4 repository];
  v6 = [v5 syncCircleIdentifier];
  v40 = objc_msgSend(v3, "hd_contextSyncZoneIDForSyncCircleIdentifier:", v6);

  v7 = [(HDCloudSyncOperation *)self profile];
  v8 = [v7 syncIdentityManager];
  v9 = [v8 currentSyncIdentity];
  v10 = [v9 identity];

  v11 = [(HDCloudSyncOperation *)self configuration];
  v12 = [v11 cachedCloudState];
  v13 = [(HDCloudSyncOperation *)self configuration];
  v14 = [v13 repository];
  v15 = [v14 primaryCKContainer];
  v16 = [v15 containerIdentifier];
  id v51 = 0;
  v17 = [v12 contextSyncZoneForContainerID:v16 error:&v51];
  id v18 = v51;

  if (v17)
  {
    id v50 = 0;
    v19 = [v17 recordsForClass:objc_opt_class() error:&v50];
    id v20 = v50;
    if (v19)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke;
      v48[3] = &unk_1E62F3E98;
      v48[4] = self;
      id v21 = v10;
      id v49 = v21;
      v22 = objc_msgSend(v19, "hk_filter:", v48);
      if ((unint64_t)[v22 count] < 2)
      {
        v31 = [v22 firstObject];
        v32 = [(HDCloudSyncOperation *)self configuration];
        v33 = [v32 repository];
        [v33 cloudSyncShimProvider];
        v34 = v39 = v10;
        [v34 contextSyncShim];
        v37 = v22;
        v36 = id v35 = v20;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_2;
        v41[3] = &unk_1E62F3F10;
        v41[4] = self;
        v42 = v31;
        id v43 = v40;
        id v44 = v19;
        id v24 = v31;
        [v36 lookupOrCreateLocalDeviceContextWithCompletion:v41];

        id v20 = v35;
        v22 = v37;

        v10 = v39;
        v30 = v42;
      }
      else
      {
        v23 = +[HDCloudSyncDeviceContextRecord recordIDWithZoneID:v40 syncIdentity:v21];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_283;
        v46[3] = &unk_1E62F3EC0;
        id v24 = v23;
        id v47 = v24;
        v25 = objc_msgSend(v22, "hk_map:", v46);
        _HKInitializeLogging();
        v26 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v53 = self;
          _os_log_error_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Multiple device contexts for same identity", buf, 0xCu);
        }
        if (+[HDCloudSyncTapToRadar isTapToRadarAllowed])
        {
          id v38 = v24;
          v27 = NSString;
          v28 = -[HDCloudSyncPushDeviceContextOperation _describeRecords:]((uint64_t)self, v19);
          v29 = [v27 stringWithFormat:@"Found multiple device context records for local sync identity in the cloud sync cache: \n %@", v28];
          -[HDCloudSyncPushDeviceContextOperation _requestTapToRadarWithDescription:]((uint64_t)self, v29);

          id v24 = v38;
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_290;
        v45[3] = &unk_1E62F3170;
        v45[4] = self;
        -[HDCloudSyncPushDeviceContextOperation _updateRecordsAdd:recordIDsToDelete:completion:](self, 0, v25, v45);

        v30 = v47;
      }
    }
    else
    {
      [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v20];
    }
  }
  else
  {
    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 724, @"Context zone not present.");
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:0 error:v18];
  }
}

uint64_t __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  v3 = [a2 deviceContextWithError:&v10];
  id v4 = v10;
  if (v3)
  {
    v5 = [v3 syncIdentity];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 40)];
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context record: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

id __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_283(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 recordID];
  LOBYTE(a1) = [v4 isEqual:*(void *)(a1 + 32)];

  if (a1)
  {
    v5 = 0;
  }
  else
  {
    v5 = [v3 recordID];
  }

  return v5;
}

- (id)_describeRecords:(uint64_t)a1
{
  if (a1)
  {
    v2 = (objc_class *)MEMORY[0x1E4F28E78];
    id v3 = a2;
    id v4 = objc_alloc_init(v2);
    objc_msgSend(v4, "hk_appendComponentsJoinedByString:container:componentGenerator:", @"\n", v3, &__block_literal_global_329);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_requestTapToRadarWithDescription:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v5 = [v4 BOOLForKey:*MEMORY[0x1E4F2BEA8]];

    if ((v5 & 1) == 0)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __75__HDCloudSyncPushDeviceContextOperation__requestTapToRadarWithDescription___block_invoke;
      v6[3] = &unk_1E62F3208;
      id v7 = v3;
      +[HDCloudSyncTapToRadar showTapToRadarRequestWithTitle:@"Health Cloud Sync Encountered an unexpected error" message:@"Please file a radar." proceed:v6 disable:&__block_literal_global_8 completion:&__block_literal_global_322];
    }
  }
}

void __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_290(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 finishWithSuccess:0 error:a2];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Multiple device contexts for same identity");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v2 finishWithSuccess:0 error:v4];
  }
}

- (void)_updateRecordsAdd:(void *)a3 recordIDsToDelete:(void *)a4 completion:
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a3;
    id v9 = a2;
    id v10 = [HDCloudSyncModifyRecordsOperation alloc];
    v11 = [a1 configuration];
    uint64_t v12 = [a1 configuration];
    __int16 v13 = [v12 repository];
    id v14 = [v13 primaryCKContainer];
    uint64_t v15 = [(HDCloudSyncModifyRecordsOperation *)v10 initWithConfiguration:v11 container:v14 recordsToSave:v9 recordIDsToDelete:v8];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke;
    v19[3] = &unk_1E62F3F60;
    v19[4] = a1;
    id v16 = v7;
    id v20 = v16;
    [(HDCloudSyncOperation *)v15 setOnError:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke_309;
    v17[3] = &unk_1E62F3F88;
    id v18 = v16;
    [(HDCloudSyncOperation *)v15 setOnSuccess:v17];
    [(HDCloudSyncOperation *)v15 start];
  }
}

void __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v8 = *(id *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      id v9 = v7;
      id v10 = v5;
      if (v8)
      {
        id v53 = 0;
        v11 = [v9 deviceContextWithError:&v53];
        id v12 = v53;
        if (v11)
        {
          __int16 v13 = [v9 record];
          id v14 = [v13 modificationDate];

          uint64_t v15 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*MEMORY[0x1E4F29608]];
          if ([v11 isEqual:v10]
            && !objc_msgSend(v14, "hk_isBeforeDate:", v15))
          {
            id v16 = 0;
          }
          else
          {
            [v9 updateDeviceContextWithContext:v10];
            id v16 = [v9 record];
          }
          id v24 = v16;

          id v8 = 0;
          id v20 = v24;
        }
        else
        {
          _HKInitializeLogging();
          v22 = *MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v9;
            *(_WORD *)&buf[22] = 2114;
            v56 = v12;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch device context from record: %{public}@, error: %{public}@", buf, 0x20u);
          }
          id v23 = v12;
          if (v23)
          {
            id v8 = v23;
            id v20 = 0;
            id v24 = v8;
          }
          else
          {
            id v8 = 0;
            id v24 = 0;
            id v20 = 0;
          }
        }
      }
      else
      {
        id v20 = 0;
      }

      id v25 = v8;
      uint64_t v21 = *(void *)(a1 + 32);
      if (v25)
      {
        v26 = v25;
        [*(id *)(a1 + 32) finishWithSuccess:0 error:v25];
LABEL_38:

        goto LABEL_39;
      }
    }
    else if (v8)
    {
      id v17 = *(id *)(a1 + 48);
      id v18 = v5;
      id v19 = [[HDCloudSyncDeviceContextRecord alloc] initInZone:v17 deviceContext:v18];

      id v20 = [v19 record];

      uint64_t v21 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v21 = 0;
      id v20 = 0;
    }
    if (v21)
    {
      v27 = (void *)MEMORY[0x1E4F1C9C8];
      double v28 = -*MEMORY[0x1E4F29600];
      id v29 = *(id *)(a1 + 56);
      v30 = [v27 dateWithTimeIntervalSinceNow:v28];
      v31 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v32 = [v31 objectForKey:*MEMORY[0x1E4F2BEB8]];

      v33 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v34 = [v33 isAppleInternalInstall];

      if (v34 && v32)
      {
        id v35 = v32;

        v30 = v35;
      }
      v36 = &off_1BD324000;
      _HKInitializeLogging();
      v37 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        id v38 = v37;
        v39 = [v30 description];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v39;
        _os_log_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_DEFAULT, "Attempting to prune device context data based on pruning date: %@", buf, 0xCu);

        v36 = &off_1BD324000;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = *((void *)v36 + 454);
      *(void *)&buf[16] = __90__HDCloudSyncPushDeviceContextOperation__recordIDsToPruneFromCurrentDeviceContextRecords___block_invoke;
      v56 = &unk_1E62F3F38;
      uint64_t v57 = v21;
      id v58 = v30;
      id v40 = v30;
      v26 = objc_msgSend(v29, "hk_mapToSet:", buf);
    }
    else
    {
      v26 = 0;
      v36 = &off_1BD324000;
    }
    _HKInitializeLogging();
    v41 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      uint64_t v43 = [v26 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v20 != 0;
      *(_WORD *)&buf[8] = 2048;
      *(void *)&buf[10] = v43;
      _os_log_impl(&dword_1BCB7D000, v42, OS_LOG_TYPE_DEFAULT, "Attempting to save %d context records, delete %lu context records", buf, 0x12u);
    }
    id v44 = *(void **)(a1 + 32);
    if (v20)
    {
      uint64_t v54 = v20;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    }
    else
    {
      v45 = 0;
    }
    v46 = [v26 allObjects];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = *((void *)v36 + 454);
    v49[2] = __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_296;
    v49[3] = &unk_1E62F3EE8;
    id v47 = *(void **)(a1 + 40);
    v49[4] = *(void *)(a1 + 32);
    id v50 = v47;
    id v48 = v20;
    id v51 = v48;
    id v52 = *(id *)(a1 + 56);
    -[HDCloudSyncPushDeviceContextOperation _updateRecordsAdd:recordIDsToDelete:completion:](v44, v45, v46, v49);

    if (v20) {
    id v20 = v48;
    }
    goto LABEL_38;
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v6];
LABEL_39:
}

void __45__HDCloudSyncPushDeviceContextOperation_main__block_invoke_296(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (v3)
  {
    id v4 = [v3 domain];
    if (![v4 isEqualToString:*MEMORY[0x1E4F19C40]] || objc_msgSend(v15, "code") != 14) {
      goto LABEL_11;
    }
    BOOL v5 = +[HDCloudSyncTapToRadar isTapToRadarAllowed];

    id v3 = v15;
    if (!v5) {
      goto LABEL_12;
    }
    id v6 = [v15 userInfo];
    id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    if (!v4) {
      goto LABEL_11;
    }
    id v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F19DD8]] && objc_msgSend(v4, "code") == 2004)
    {
      id v8 = [v4 userInfo];
      id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F19C68]];
      int v10 = [v9 isEqualToString:@"record to insert already exists"];

      if (!v10)
      {
LABEL_11:

        id v3 = v15;
        goto LABEL_12;
      }
      v11 = NSString;
      id v12 = *(void **)(a1 + 32);
      id v7 = -[HDCloudSyncPushDeviceContextOperation _describeRecord:ckRecord:](v12, *(void **)(a1 + 40), *(void **)(a1 + 48));
      __int16 v13 = -[HDCloudSyncPushDeviceContextOperation _describeRecords:](*(void *)(a1 + 32), *(void **)(a1 + 56));
      id v14 = [v11 stringWithFormat:@"Encountered a CloudKit constraint violation. Very likely attempted to create a device context for local sync identity while it already exists. \n Error: %@ \n Conflicting record: %@ \n Existing records: %@", v15, v7, v13];
      -[HDCloudSyncPushDeviceContextOperation _requestTapToRadarWithDescription:]((uint64_t)v12, v14);
    }
    goto LABEL_11;
  }
LABEL_12:
  [*(id *)(a1 + 32) finishWithSuccess:v3 == 0 error:v3];
}

- (id)_describeRecord:(void *)a3 ckRecord:
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (a1)
  {
    if (v5)
    {
      a1 = [v5 printDescription];
    }
    else
    {
      id v8 = [v6 recordID];
      a1 = [v8 recordName];
    }
  }

  return a1;
}

id __90__HDCloudSyncPushDeviceContextOperation__recordIDsToPruneFromCurrentDeviceContextRecords___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v18 = 0;
  id v4 = [v3 deviceContextWithError:&v18];
  id v5 = v18;
  if (v4)
  {
    id v6 = [v4 syncIdentity];
    id v7 = [*(id *)(a1 + 32) profile];
    id v8 = [v7 syncIdentityManager];
    id v9 = [v8 currentSyncIdentity];
    int v10 = [v9 identity];
    char v11 = [v6 isEqual:v10];

    if ((v11 & 1) == 0)
    {
      id v12 = [v3 record];
      __int16 v13 = [v12 modificationDate];

      if (objc_msgSend(v13, "hk_isBeforeDate:", *(void *)(a1 + 40)))
      {
        id v14 = [v3 recordID];

        goto LABEL_9;
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v15 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v16;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch context record: %{public}@", buf, 0x16u);
    }
  }
  id v14 = 0;
LABEL_9:

  return v14;
}

void __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to modify records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __88__HDCloudSyncPushDeviceContextOperation__updateRecordsAdd_recordIDsToDelete_completion___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __75__HDCloudSyncPushDeviceContextOperation__requestTapToRadarWithDescription___block_invoke(uint64_t a1)
{
  return +[HDCloudSyncTapToRadar openTapToRadarWithTitle:@"[Cloud Sync] Context Sync: Encountered duplicate device context" description:*(void *)(a1 + 32)];
}

void __75__HDCloudSyncPushDeviceContextOperation__requestTapToRadarWithDescription___block_invoke_2()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setBool:1 forKey:*MEMORY[0x1E4F2BEA8]];
}

uint64_t __58__HDCloudSyncPushDeviceContextOperation__describeRecords___block_invoke(uint64_t a1, void *a2)
{
  return [a2 printDescription];
}

@end