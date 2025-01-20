@interface PFCloudKitImporter
- (PFCloudKitImporter)initWithOptions:(id)a3 request:(id)a4;
- (void)dealloc;
- (void)importIfNecessaryWithCompletion:(uint64_t)a1;
- (void)processWorkItemsWithCompletion:(uint64_t)a1;
@end

@implementation PFCloudKitImporter

- (PFCloudKitImporter)initWithOptions:(id)a3 request:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PFCloudKitImporter;
  v6 = [(PFCloudKitImporter *)&v8 init];
  if (v6)
  {
    v6->_options = (PFCloudKitImporterOptions *)[a3 copy];
    v6->_request = (NSCloudKitMirroringImportRequest *)a4;
    v6->_workItemResults = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v6->_totalImportedBytes = 0;
  }
  return v6;
}

- (void)dealloc
{
  self->_options = 0;
  self->_request = 0;

  self->_workItems = 0;
  self->_workItemResults = 0;

  self->_updatedDatabaseChangeToken = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitImporter;
  [(PFCloudKitImporter *)&v3 dealloc];
}

- (void)importIfNecessaryWithCompletion:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2) {
      uint64_t v2 = *(void *)(v2 + 16);
    }
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke;
    v3[3] = &unk_1E544D4F8;
    v3[4] = v2;
    v3[5] = a1;
    v3[6] = a2;
    -[PFCloudKitStoreMonitor performBlock:](v2, (uint64_t)v3);
  }
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke(uint64_t *a1)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  v53 = a1;
  if (v2)
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = *(void *)(v3 + 16);
    if (v4)
    {
      if (([*(id *)(v4 + 64) shouldDefer] & 1) != 0 || *(unsigned char *)(v4 + 40))
      {
        v5 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v93 = *MEMORY[0x1E4F28588];
        v94 = @"The request was aborted because it was deferred by the system.";
        uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        uint64_t v7 = [v5 errorWithDomain:*MEMORY[0x1E4F281F8] code:134419 userInfo:v6];
        objc_super v8 = [NSCloudKitMirroringResult alloc];
        uint64_t v9 = a1[4];
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 48);
        }
        else {
          uint64_t v10 = 0;
        }
        v11 = [(NSCloudKitMirroringResult *)v8 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v10 success:0 madeChanges:0 error:v7];
        (*(void (**)(void))(a1[6] + 16))();

        goto LABEL_26;
      }
      uint64_t v3 = a1[5];
    }
    v48 = v2;
    uint64_t v19 = *(void *)(v3 + 8);
    if (v19) {
      v20 = *(void **)(v19 + 8);
    }
    else {
      v20 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PFCloudKitImporterFetchRecordsWorkItem alloc] initWithOptions:*(void *)(a1[5] + 8) request:*(void *)(a1[5] + 16)];
      *(void *)(a1[5] + 24) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v21, 0);
      -[PFCloudKitImporter processWorkItemsWithCompletion:](a1[5], a1[6]);
    }
    else if ([v20 databaseScope] == 2 || objc_msgSend(v20, "databaseScope") == 3)
    {
      uint64_t v87 = 0;
      v88 = &v87;
      uint64_t v89 = 0x2020000000;
      char v90 = 1;
      uint64_t v81 = 0;
      v82 = &v81;
      uint64_t v83 = 0x3052000000;
      v84 = __Block_byref_object_copy__24;
      v85 = __Block_byref_object_dispose__24;
      uint64_t v86 = 0;
      uint64_t v75 = 0;
      v76 = &v75;
      uint64_t v77 = 0x3052000000;
      v78 = __Block_byref_object_copy__24;
      v79 = __Block_byref_object_dispose__24;
      uint64_t v80 = 0;
      v22 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6;
      v74[3] = &unk_1E544B7F0;
      v74[4] = a1[5];
      v74[5] = v2;
      v74[7] = &v75;
      v74[6] = v22;
      v74[8] = &v81;
      v74[9] = &v87;
      [(NSManagedObjectContext *)v22 performBlockAndWait:v74];
      if (*((unsigned char *)v88 + 24))
      {
        v23 = objc_alloc_init(PFCloudKitImportDatabaseContext);
        id v24 = objc_alloc_init(getCloudKitCKFetchDatabaseChangesOperationClass());
        [v24 setPreviousServerChangeToken:v76[5]];
        -[NSCloudKitMirroringRequestOptions applyToOperation:]([*(id *)(a1[5] + 16) options], v24);
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_2;
        v73[3] = &unk_1E544D980;
        v73[4] = v23;
        [v24 setRecordZoneWithIDChangedBlock:v73];
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_3;
        v72[3] = &unk_1E544D980;
        v72[4] = v23;
        [v24 setRecordZoneWithIDWasDeletedBlock:v72];
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_4;
        v71[3] = &unk_1E544D980;
        v71[4] = v23;
        [v24 setRecordZoneWithIDWasPurgedBlock:v71];
        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_5;
        v70[3] = &unk_1E544D9A8;
        v70[4] = v23;
        [v24 setChangeTokenUpdatedBlock:v70];
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6;
        v69[3] = &unk_1E544D980;
        v69[4] = v23;
        [v24 setRecordZoneWithIDWasDeletedDueToUserEncryptedDataResetBlock:v69];
        objc_initWeak(&location, (id)a1[5]);
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_7;
        v66[3] = &unk_1E544D9D0;
        objc_copyWeak(&v67, &location);
        uint64_t v25 = a1[6];
        v66[4] = v23;
        v66[5] = v25;
        [v24 setFetchDatabaseChangesCompletionBlock:v66];
        [v20 addOperation:v24];

        objc_destroyWeak(&v67);
        objc_destroyWeak(&location);
      }
      else
      {
        v26 = [NSCloudKitMirroringResult alloc];
        uint64_t v27 = a1[4];
        if (v27) {
          uint64_t v28 = *(void *)(v27 + 48);
        }
        else {
          uint64_t v28 = 0;
        }
        v29 = [(NSCloudKitMirroringResult *)v26 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v28 success:0 madeChanges:0 error:v82[5]];
        (*(void (**)(void))(a1[6] + 16))();
      }
      v82[5] = 0;

      v76[5] = 0;
      _Block_object_dispose(&v75, 8);
      _Block_object_dispose(&v81, 8);
      _Block_object_dispose(&v87, 8);
    }
    else
    {
      if ([v20 databaseScope] != 1) {
        goto LABEL_26;
      }
      uint64_t v30 = a1[4];
      if (v30) {
        id WeakRetained = objc_loadWeakRetained((id *)(v30 + 32));
      }
      else {
        id WeakRetained = 0;
      }
      uint64_t v32 = [v2 configurationName];
      if (v32) {
        v33 = (__CFString *)v32;
      }
      else {
        v33 = @"PF_DEFAULT_CONFIGURATION_NAME";
      }
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v47 = WeakRetained;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      obuint64_t j = (id)objc_msgSend((id)objc_msgSend(WeakRetained, "managedObjectModel"), "entitiesForConfiguration:", v33);
      uint64_t v51 = [obj countByEnumeratingWithState:&v62 objects:v97 count:16];
      if (v51)
      {
        char v35 = 0;
        uint64_t v50 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v51; ++i)
          {
            if (*(void *)v63 != v50) {
              objc_enumerationMutation(obj);
            }
            v37 = *(void **)(*((void *)&v62 + 1) + 8 * i);
            objc_msgSend(v34, "addObject:", +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, (uint64_t)v37));
            if (v35)
            {
              char v35 = 1;
            }
            else
            {
              long long v60 = 0u;
              long long v61 = 0u;
              long long v58 = 0u;
              long long v59 = 0u;
              v38 = (void *)[v37 relationshipsByName];
              char v35 = 0;
              uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v96 count:16];
              if (v39)
              {
                uint64_t v40 = *(void *)v59;
                do
                {
                  for (uint64_t j = 0; j != v39; ++j)
                  {
                    if (*(void *)v59 != v40) {
                      objc_enumerationMutation(v38);
                    }
                    v42 = objc_msgSend((id)objc_msgSend(v37, "relationshipsByName"), "objectForKey:", *(void *)(*((void *)&v58 + 1) + 8 * j));
                    if ([v42 isToMany]
                      && objc_msgSend((id)objc_msgSend(v42, "inverseRelationship"), "isToMany"))
                    {
                      [v34 addObject:@"CDMR"];
                      char v35 = 1;
                    }
                  }
                  uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v96 count:16];
                }
                while (v39);
              }
            }
          }
          uint64_t v51 = [obj countByEnumeratingWithState:&v62 objects:v97 count:16];
        }
        while (v51);
      }
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      uint64_t v43 = [v34 countByEnumeratingWithState:&v54 objects:v95 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v55;
        do
        {
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v55 != v44) {
              objc_enumerationMutation(v34);
            }
            id v46 = [[PFCloudKitCKQueryBackedImportWorkItem alloc] initForRecordType:*(void *)(*((void *)&v54 + 1) + 8 * k) withOptions:*(void *)(v53[5] + 8) request:*(void *)(v53[5] + 16)];
            [v52 addObject:v46];
          }
          uint64_t v43 = [v34 countByEnumeratingWithState:&v54 objects:v95 count:16];
        }
        while (v43);
      }
      *(void *)(v53[5] + 24) = [v52 copy];
      -[PFCloudKitImporter processWorkItemsWithCompletion:](v53[5], v53[6]);
    }
    uint64_t v2 = v48;
  }
  else if (a1[6])
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v91 = *MEMORY[0x1E4F28588];
    uint64_t v92 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier")];
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    uint64_t v14 = [v12 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v13];
    v15 = [NSCloudKitMirroringResult alloc];
    uint64_t v16 = a1[4];
    if (v16) {
      uint64_t v17 = *(void *)(v16 + 48);
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = [(NSCloudKitMirroringResult *)v15 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v17 success:0 madeChanges:0 error:v14];
    (*(void (**)(void))(a1[6] + 16))();
  }
LABEL_26:
}

- (void)processWorkItemsWithCompletion:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = (void *)MEMORY[0x18C127630]();
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v5 = 16;
    }
    else {
      uint64_t v5 = __ckLoggingOverride;
    }
    uint64_t v6 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Processing work items: %@"];
    _NSCoreDataLog(v5, v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[PFCloudKitImporter processWorkItemsWithCompletion:]");
    uint64_t v13 = *(void **)(a1 + 8);
    if (v13) {
      uint64_t v13 = (void *)v13[2];
    }
    uint64_t v14 = v13;
    if ([*(id *)(a1 + 24) count]
      && (id v15 = (id)[*(id *)(a1 + 24) objectAtIndex:0],
          uint64_t v16 = (void *)[*(id *)(a1 + 24) mutableCopy],
          [v16 removeObjectAtIndex:0],
          *(id *)(a1 + 24),
          *(void *)(a1 + 24) = [v16 copy],
          v16,
          v15))
    {
      uint64_t v17 = v21;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke;
      v21[3] = &unk_1E544BE90;
      v21[4] = v14;
      v21[5] = a1;
      v21[6] = v15;
      v18 = &v22;
    }
    else
    {
      id v15 = 0;
      uint64_t v17 = v19;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_4;
      v19[3] = &unk_1E544D4F8;
      v19[4] = v14;
      v19[5] = a1;
      v18 = &v20;
    }
    uint64_t *v18 = a2;
    -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v14, (uint64_t)v17);
  }
}

id __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  id result = (id)-[NSManagedObject currentChangeToken](+[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, [v3 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 64) + 8) + 40), "currentChangeToken");
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v5 = (void *)MEMORY[0x18C127630]();
    uint64_t v6 = __ckLoggingOverride;
    uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch metadata for database: %@"];
    _NSCoreDataLog(v6 != 0, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitImporter importIfNecessaryWithCompletion:]_block_invoke");
    id result = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 8) addObject:a2];
  }
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 16) addObject:a2];
  }
  return result;
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 24) addObject:a2];
  }
  return result;
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_5(uint64_t a1, char *newValue)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    objc_setProperty_nonatomic(v2, newValue, newValue, 40);
  }
}

uint64_t __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_6(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    return [*(id *)(v2 + 32) addObject:a2];
  }
  return result;
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = *(id *)(a1 + 32);
  uint64_t v10 = v8;
  if (WeakRetained)
  {
    if (v8) {
      objc_setProperty_nonatomic(v8, v9, a2, 40);
    }
    uint64_t v11 = WeakRetained[1];
    if (v11) {
      uint64_t v12 = *(NSObject **)(v11 + 32);
    }
    else {
      uint64_t v12 = 0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_8;
    v14[3] = &unk_1E544BE90;
    v14[4] = WeakRetained;
    v14[5] = v10;
    uint64_t v13 = *(void *)(a1 + 40);
    v14[6] = a4;
    v14[7] = v13;
    dispatch_async(v12, v14);
  }
}

void __54__PFCloudKitImporter_importIfNecessaryWithCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(id *)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    v21 = v2;
    if (v4)
    {
      uint64_t v5 = (void *)MEMORY[0x18C127630]();
      BOOL v6 = __ckLoggingOverride != 0;
      uint64_t v7 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Database fetch for request: %@ failed with error: %@"];
      _NSCoreDataLog(v6, v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]");
      uint64_t v2 = v21;
      if (!v3) {
        goto LABEL_12;
      }
      uint64_t v14 = [NSCloudKitMirroringResult alloc];
      uint64_t v15 = v21[1];
      if (v15 && (uint64_t v16 = *(void *)(v15 + 16)) != 0) {
        uint64_t v17 = *(void *)(v16 + 48);
      }
      else {
        uint64_t v17 = 0;
      }
      v18 = [(NSCloudKitMirroringResult *)v14 initWithRequest:v21[2] storeIdentifier:v17 success:0 madeChanges:0 error:v4];
      (*(void (**)(uint64_t, NSCloudKitMirroringResult *))(v3 + 16))(v3, v18);
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 40);
      uint64_t v20 = (void *)v2[1];
      if (v20) {
        uint64_t v20 = (void *)v20[2];
      }
      v18 = v20;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke;
      v22[3] = &unk_1E544BE90;
      v22[4] = v18;
      v22[5] = v21;
      v22[6] = v19;
      v22[7] = v3;
      -[PFCloudKitStoreMonitor performBlock:]((uint64_t)v18, (uint64_t)v22);
    }

    uint64_t v2 = v21;
  }
LABEL_12:
}

void __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke(void *a1)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (v2)
  {
    uint64_t v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](a1[4]);
    uint64_t v4 = *(void *)(a1[5] + 8);
    if (v4) {
      uint64_t v5 = *(void **)(v4 + 8);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [v5 databaseScope];
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x2020000000;
    char v86 = 1;
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x3052000000;
    uint64_t v80 = __Block_byref_object_copy__24;
    uint64_t v81 = __Block_byref_object_dispose__24;
    uint64_t v82 = 0;
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_2;
    v76[3] = &unk_1E544D9F8;
    v76[4] = v2;
    v76[5] = v3;
    v76[6] = a1[6];
    v76[7] = &v83;
    v76[8] = &v77;
    v76[9] = v6;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v76];
    if (*((unsigned char *)v84 + 24))
    {
      BOOL v7 = -[PFCloudKitImportDatabaseContext hasWorkToDo](a1[6]);
      uint64_t v8 = (void *)MEMORY[0x18C127630]();
      unint64_t v9 = __ckLoggingOverride;
      if (!v7)
      {
        uint64_t v41 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Import request finished with no work to do: %@"];
        if (v9 >= 0x10) {
          uint64_t v48 = 16;
        }
        else {
          uint64_t v48 = v9;
        }
        _NSCoreDataLog(v48, v41, v42, v43, v44, v45, v46, v47, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke");
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_3;
        v75[3] = &unk_1E544D1D8;
        uint64_t v49 = a1[6];
        v75[4] = a1[5];
        v75[5] = v2;
        v75[6] = v3;
        v75[7] = v49;
        v75[8] = &v83;
        v75[9] = &v77;
        [(NSManagedObjectContext *)v3 performBlockAndWait:v75];
        if (a1[7])
        {
          uint64_t v50 = [NSCloudKitMirroringResult alloc];
          uint64_t v51 = a1[4];
          if (v51) {
            uint64_t v52 = *(void *)(v51 + 48);
          }
          else {
            uint64_t v52 = 0;
          }
          v53 = [(NSCloudKitMirroringResult *)v50 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v52 success:1 madeChanges:0 error:0];
          (*(void (**)(void))(a1[7] + 16))();
        }
        goto LABEL_74;
      }
      uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Import request finished: %@ - %@"];
      if (v9 >= 0x10) {
        uint64_t v17 = 16;
      }
      else {
        uint64_t v17 = v9;
      }
      _NSCoreDataLog(v17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke");
      v18 = (void *)a1[6];
      if (v18) {
        v18 = (void *)v18[5];
      }
      *(void *)(a1[5] + 40) = v18;
      uint64_t v19 = (void *)a1[5];
      if (v19)
      {
        uint64_t v20 = a1[6];
        uint64_t v72 = a1[7];
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v73 = v3;
        uint64_t v74 = v20;
        if (v20)
        {
          if (![*(id *)(v20 + 8) count])
          {
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
LABEL_47:
            long long v56 = *(void **)(v20 + 16);
LABEL_48:
            uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v107 count:16];
            if (v57)
            {
              uint64_t v58 = *(void *)v96;
              do
              {
                for (uint64_t i = 0; i != v57; ++i)
                {
                  if (*(void *)v96 != v58) {
                    objc_enumerationMutation(v56);
                  }
                  long long v60 = [[PFCloudKitImporterZoneDeletedWorkItem alloc] initWithDeletedRecordZoneID:*(void *)(*((void *)&v95 + 1) + 8 * i) options:v19[1] request:v19[2]];
                  [v21 addObject:v60];
                }
                uint64_t v57 = [v56 countByEnumeratingWithState:&v95 objects:v107 count:16];
              }
              while (v57);
            }
            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            if (v74) {
              long long v61 = *(void **)(v74 + 24);
            }
            else {
              long long v61 = 0;
            }
            uint64_t v62 = [v61 countByEnumeratingWithState:&v91 objects:v106 count:16];
            if (v62)
            {
              uint64_t v63 = *(void *)v92;
              do
              {
                for (uint64_t j = 0; j != v62; ++j)
                {
                  if (*(void *)v92 != v63) {
                    objc_enumerationMutation(v61);
                  }
                  long long v65 = [[PFCloudKitImporterZonePurgedWorkItem alloc] initWithPurgedRecordZoneID:*(void *)(*((void *)&v91 + 1) + 8 * j) options:v19[1] request:v19[2]];
                  [v21 addObject:v65];
                }
                uint64_t v62 = [v61 countByEnumeratingWithState:&v91 objects:v106 count:16];
              }
              while (v62);
            }
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            if (v74) {
              v66 = *(void **)(v74 + 32);
            }
            else {
              v66 = 0;
            }
            uint64_t v67 = [v66 countByEnumeratingWithState:&v87 objects:v105 count:16];
            if (v67)
            {
              uint64_t v68 = *(void *)v88;
              do
              {
                for (uint64_t k = 0; k != v67; ++k)
                {
                  if (*(void *)v88 != v68) {
                    objc_enumerationMutation(v66);
                  }
                  v70 = [[PFCloudKitImporterZoneDeletedWorkItem alloc] initWithDeletedRecordZoneID:*(void *)(*((void *)&v87 + 1) + 8 * k) options:v19[1] request:v19[2]];
                  [v21 addObject:v70];
                }
                uint64_t v67 = [v66 countByEnumeratingWithState:&v87 objects:v105 count:16];
              }
              while (v67);
            }
            uint64_t v3 = v73;
            v19[3] = [v21 copy];
            -[PFCloudKitImporter processWorkItemsWithCompletion:]((uint64_t)v19, v72);

            goto LABEL_74;
          }
          uint64_t v22 = *(void **)(v20 + 8);
        }
        else
        {
          if (![0 count])
          {
            long long v56 = 0;
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            goto LABEL_48;
          }
          uint64_t v22 = 0;
          uint64_t v20 = 0;
        }
        if ((unint64_t)[v22 count] < 0x191)
        {
          long long v54 = [PFCloudKitImporterZoneChangedWorkItem alloc];
          if (v20) {
            long long v55 = *(void **)(v20 + 8);
          }
          else {
            long long v55 = 0;
          }
          v23 = -[PFCloudKitImporterZoneChangedWorkItem initWithChangedRecordZoneIDs:options:request:](v54, "initWithChangedRecordZoneIDs:options:request:", [v55 allObjects], v19[1], v19[2]);
          [v21 addObject:v23];
        }
        else
        {
          v23 = (PFCloudKitImporterZoneChangedWorkItem *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v101 = 0u;
          long long v102 = 0u;
          long long v99 = 0u;
          long long v100 = 0u;
          if (v20) {
            id v24 = *(void **)(v20 + 8);
          }
          else {
            id v24 = 0;
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v99 objects:v108 count:16];
          v71 = v2;
          if (v25)
          {
            uint64_t v26 = *(void *)v100;
            do
            {
              for (uint64_t m = 0; m != v25; ++m)
              {
                if (*(void *)v100 != v26) {
                  objc_enumerationMutation(v24);
                }
                [(PFCloudKitImporterZoneChangedWorkItem *)v23 addObject:*(void *)(*((void *)&v99 + 1) + 8 * m)];
                if ([(PFCloudKitImporterZoneChangedWorkItem *)v23 count] == 400)
                {
                  uint64_t v28 = [[PFCloudKitImporterZoneChangedWorkItem alloc] initWithChangedRecordZoneIDs:v23 options:v19[1] request:v19[2]];
                  [v21 addObject:v28];

                  v23 = (PFCloudKitImporterZoneChangedWorkItem *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
                }
              }
              uint64_t v25 = [v24 countByEnumeratingWithState:&v99 objects:v108 count:16];
            }
            while (v25);
          }
          uint64_t v2 = v71;
          uint64_t v20 = v74;
          if ([(PFCloudKitImporterZoneChangedWorkItem *)v23 count])
          {
            v29 = [[PFCloudKitImporterZoneChangedWorkItem alloc] initWithChangedRecordZoneIDs:v23 options:v19[1] request:v19[2]];
            [v21 addObject:v29];
          }
        }

        long long v97 = 0u;
        long long v98 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        if (!v20)
        {
          long long v56 = 0;
          goto LABEL_48;
        }
        goto LABEL_47;
      }
    }
    else
    {
      v37 = [NSCloudKitMirroringResult alloc];
      uint64_t v38 = a1[4];
      if (v38) {
        uint64_t v39 = *(void *)(v38 + 48);
      }
      else {
        uint64_t v39 = 0;
      }
      uint64_t v40 = [(NSCloudKitMirroringResult *)v37 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v39 success:0 madeChanges:0 error:v78[5]];
      (*(void (**)(void))(a1[7] + 16))();
    }
LABEL_74:

    v78[5] = 0;
    _Block_object_dispose(&v77, 8);
    _Block_object_dispose(&v83, 8);
    goto LABEL_75;
  }
  uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v103 = *MEMORY[0x1E4F28588];
  uint64_t v104 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier")];
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
  uint64_t v32 = [v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v31];
  v33 = [NSCloudKitMirroringResult alloc];
  uint64_t v34 = a1[4];
  if (v34) {
    uint64_t v35 = *(void *)(v34 + 48);
  }
  else {
    uint64_t v35 = 0;
  }
  v36 = [(NSCloudKitMirroringResult *)v33 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v35 success:0 madeChanges:0 error:v32];
  (*(void (**)(void))(a1[7] + 16))();

LABEL_75:
}

id __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_2(uint64_t a1)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v20[0] = 0;
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsImport = YES AND database.databaseScopeNuuint64_t m = %@ AND (needsNewShareInvitation = NO OR needsNewShareInvitation = NULL)", objc_msgSend(NSNumber, "numberWithInteger:", *(void *)(a1 + 72))]);
  v22[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1]);
  [(NSFetchRequest *)v2 setReturnsObjectsAsFaults:0];
  uint64_t v3 = (void *)[*(id *)(a1 + 40) executeFetchRequest:v2 error:v20];
  uint64_t v4 = v3;
  if (v3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id result = (id)[v3 countByEnumeratingWithState:&v16 objects:v21 count:16];
    id v6 = result;
    if (result)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v8);
          uint64_t v10 = -[NSCKRecordZoneMetadata createRecordZoneID](v9);
          if ([v9 needsImport])
          {
            uint64_t v11 = *(void *)(a1 + 48);
            uint64_t v12 = v11 ? *(void **)(v11 + 16) : 0;
            if (([v12 containsObject:v10] & 1) == 0)
            {
              uint64_t v13 = *(void *)(a1 + 48);
              if (v13) {
                uint64_t v14 = *(void **)(v13 + 24);
              }
              else {
                uint64_t v14 = 0;
              }
              if (([v14 containsObject:v10] & 1) == 0)
              {
                uint64_t v15 = *(void *)(a1 + 48);
                if (v15) {
                  [*(id *)(v15 + 8) addObject:v10];
                }
              }
            }
          }

          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id result = (id)[v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
        id v6 = result;
      }
      while (result);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id result = v20[0];
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
  }
  return result;
}

void __70__PFCloudKitImporter_databaseFetchFinishWithContext_error_completion___block_invoke_3(uint64_t a1)
{
  v17[5] = *MEMORY[0x1E4F143B8];
  v17[0] = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 8);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, [v3 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v17);
  uint64_t v5 = v4;
  if (!v4
    || ((uint64_t v6 = *(void *)(a1 + 56)) == 0 ? (v7 = 0) : (v7 = *(void *)(v6 + 40)),
        [(NSManagedObject *)v4 setCurrentChangeToken:v7],
        -[NSManagedObject setLastFetchDate:](v5, "setLastFetchDate:", [MEMORY[0x1E4F1C9C8] date]),
        ([*(id *)(a1 + 48) save:v17] & 1) == 0))
  {
    uint64_t v8 = (void *)MEMORY[0x18C127630]();
    uint64_t v9 = __ckLoggingOverride;
    uint64_t v10 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Error fetching database metadata update for request: %@\n%@"];
    _NSCoreDataLog(v9 != 0, v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[PFCloudKitImporter databaseFetchFinishWithContext:error:completion:]_block_invoke_3");
  }
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke(void *a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    uint64_t v4 = a1[4];
  }
  else
  {
    uint64_t v4 = 0;
    id WeakRetained = 0;
  }
  uint64_t v5 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](v4);
  if (v5)
  {
    uint64_t v6 = (void *)a1[5];
    if (v6)
    {
      uint64_t v7 = v6[2];
      if (v7)
      {
        if (([*(id *)(v7 + 64) shouldDefer] & 1) != 0 || *(unsigned char *)(v7 + 40))
        {
          uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v31 = *MEMORY[0x1E4F28588];
          v32[0] = @"The request was aborted because it was deferred by the system.";
          uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
          uint64_t v10 = [v8 errorWithDomain:*MEMORY[0x1E4F281F8] code:134419 userInfo:v9];
          uint64_t v11 = [NSCloudKitMirroringResult alloc];
          uint64_t v12 = a1[4];
          if (v12) {
            uint64_t v13 = *(void *)(v12 + 48);
          }
          else {
            uint64_t v13 = 0;
          }
          uint64_t v14 = [(NSCloudKitMirroringResult *)v11 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v13 success:0 madeChanges:0 error:v10];
          (*(void (**)(void))(a1[7] + 16))();

          goto LABEL_16;
        }
        uint64_t v6 = (void *)a1[5];
      }
    }
    objc_initWeak(&location, v6);
    v23 = (void *)a1[6];
    uint64_t v22 = a1 + 6;
    uint64_t v24 = *((void *)v22 - 2);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_2;
    v25[3] = &unk_1E544DA20;
    objc_copyWeak(&v27, &location);
    long long v26 = *v22;
    [v23 doWorkForStore:v5 inMonitor:v24 completion:v25];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
  uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v29 = *MEMORY[0x1E4F28588];
  uint64_t v30 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(a1[5] + 16), "requestIdentifier")];
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v16];
  long long v18 = [NSCloudKitMirroringResult alloc];
  uint64_t v19 = a1[4];
  if (v19) {
    uint64_t v20 = *(void *)(v19 + 48);
  }
  else {
    uint64_t v20 = 0;
  }
  id v21 = [(NSCloudKitMirroringResult *)v18 initWithRequest:*(void *)(a1[5] + 16) storeIdentifier:v20 success:0 madeChanges:0 error:v17];
  (*(void (**)(void))(a1[7] + 16))();

LABEL_16:
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *((void *)WeakRetained + 1);
    if (v6) {
      uint64_t v7 = *(NSObject **)(v6 + 32);
    }
    else {
      uint64_t v7 = 0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_3;
    v10[3] = &unk_1E544BE90;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[4] = v5;
    v10[5] = v8;
    v10[6] = a2;
    v10[7] = v9;
    dispatch_async(v7, v10);
  }
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x18C127630]();
  id v3 = *(id *)(a1 + 32);
  if (v3)
  {
    int8x16_t v4 = *(int8x16_t *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 56);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__PFCloudKitImporter_workItemFinished_withResult_completion___block_invoke;
    v6[3] = &unk_1E544BE90;
    v6[4] = v3;
    int8x16_t v7 = vextq_s8(v4, v4, 8uLL);
    uint64_t v8 = v5;
    +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v6];
  }
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_4(uint64_t *a1)
{
  v1 = a1;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)-[PFCloudKitStoreMonitor retainedMonitoredStore](a1[4]);
  if (!v2)
  {
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v79 = *MEMORY[0x1E4F28588];
    uint64_t v80 = [NSString stringWithFormat:@"Request '%@' was cancelled because the store was removed from the coordinator.", objc_msgSend(*(id *)(v1[5] + 16), "requestIdentifier")];
    uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
    uint64_t v32 = [v30 errorWithDomain:*MEMORY[0x1E4F281F8] code:134407 userInfo:v31];
    v33 = [NSCloudKitMirroringResult alloc];
    uint64_t v34 = v1[4];
    if (v34) {
      uint64_t v35 = *(void *)(v34 + 48);
    }
    else {
      uint64_t v35 = 0;
    }
    v36 = [(NSCloudKitMirroringResult *)v33 initWithRequest:*(void *)(v1[5] + 16) storeIdentifier:v35 success:0 madeChanges:0 error:v32];
    (*(void (**)(void))(v1[6] + 16))();

    goto LABEL_48;
  }
  id v3 = -[PFCloudKitStoreMonitor newBackgroundContextForMonitoredCoordinator](v1[4]);
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 1;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3052000000;
  uint64_t v72 = __Block_byref_object_copy__24;
  v73 = __Block_byref_object_dispose__24;
  uint64_t v74 = 0;
  uint64_t v63 = 0;
  long long v64 = &v63;
  uint64_t v65 = 0x3052000000;
  v66 = __Block_byref_object_copy__24;
  uint64_t v67 = __Block_byref_object_dispose__24;
  uint64_t v68 = 0;
  if ((unint64_t)[*(id *)(v1[5] + 32) count] < 2)
  {
    if ([*(id *)(v1[5] + 32) count] == 1)
    {
      char v37 = objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "success");
      *((unsigned char *)v76 + 24) = v37;
      uint64_t v38 = objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "madeChanges");
      id v39 = (id)objc_msgSend((id)objc_msgSend(*(id *)(v1[5] + 32), "lastObject"), "error");
      void v70[5] = (uint64_t)v39;
      id v40 = (id)[*(id *)(v1[5] + 32) lastObject];
      v64[5] = (uint64_t)v40;
    }
    else
    {
      uint64_t v38 = 0;
    }
    goto LABEL_32;
  }
  long long v55 = v3;
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  int8x16_t v4 = *(void **)(v1[5] + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v59 objects:v85 count:16];
  long long v56 = v1;
  char v6 = 0;
  if (v5)
  {
    uint64_t v7 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v60 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if (([v9 success] & 1) == 0)
        {
          *((unsigned char *)v76 + 24) = 0;
          if ([v9 error])
          {
            objc_msgSend(v57, "addObject:", objc_msgSend(v9, "error"));
          }
          else
          {
            uint64_t v10 = [NSString stringWithUTF8String:"Work item result failed but did not include an error: %@"];
            _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
            uint64_t v17 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v84 = v9;
              _os_log_fault_impl(&dword_18AB82000, v17, OS_LOG_TYPE_FAULT, "CoreData: Work item result failed but did not include an error: %@", buf, 0xCu);
            }
          }
        }
        if ([v9 madeChanges]) {
          char v6 = 1;
        }
        uint64_t v18 = objc_opt_class();
        if (v18 != objc_opt_class())
        {
          uint64_t v19 = [NSString stringWithUTF8String:"The importer needs to be taught how to merge results of different types when dealing with multiple work items: %@"];
          _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)v9);
          long long v26 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v9;
            _os_log_fault_impl(&dword_18AB82000, v26, OS_LOG_TYPE_FAULT, "CoreData: The importer needs to be taught how to merge results of different types when dealing with multiple work items: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v59 objects:v85 count:16];
    }
    while (v5);
  }
  v1 = v56;
  if ((unint64_t)[v57 count] >= 2)
  {
    *((unsigned char *)v76 + 24) = 0;
    id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v81 = @"NSDetailedErrors";
    id v82 = v57;
    uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    id v29 = (id)[v27 initWithDomain:*MEMORY[0x1E4F281F8] code:134404 userInfo:v28];
LABEL_30:
    void v70[5] = (uint64_t)v29;
    goto LABEL_31;
  }
  if ([v57 count] == 1)
  {
    *((unsigned char *)v76 + 24) = 0;
    id v29 = (id)[v57 lastObject];
    goto LABEL_30;
  }
LABEL_31:

  uint64_t v38 = v6 & 1;
  id v3 = v55;
LABEL_32:
  if (*((unsigned char *)v76 + 24))
  {
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_73;
    v58[3] = &unk_1E544BBF0;
    v58[4] = v1[5];
    v58[5] = v2;
    v58[6] = v3;
    v58[7] = &v75;
    v58[8] = &v69;
    v58[9] = &v63;
    [(NSManagedObjectContext *)v3 performBlockAndWait:v58];

    id v3 = 0;
  }
  if (!v64[5])
  {
    uint64_t v41 = [NSCloudKitMirroringResult alloc];
    uint64_t v42 = v1[4];
    if (v42) {
      uint64_t v43 = *(void *)(v42 + 48);
    }
    else {
      uint64_t v43 = 0;
    }
    uint64_t v44 = [(NSCloudKitMirroringResult *)v41 initWithRequest:*(void *)(v1[5] + 16) storeIdentifier:v43 success:*((unsigned __int8 *)v76 + 24) madeChanges:v38 error:v70[5]];
    v64[5] = v44;
  }
  uint64_t v45 = [PFCloudKitImportedRecordBytesMetric alloc];
  uint64_t v46 = v1[5];
  if (v46 && (uint64_t v47 = *(void *)(v46 + 8)) != 0) {
    uint64_t v48 = *(void **)(v47 + 24);
  }
  else {
    uint64_t v48 = 0;
  }
  uint64_t v49 = -[PFCloudKitSizeMetric initWithContainerIdentifier:](v45, "initWithContainerIdentifier:", [v48 containerIdentifier]);
  -[PFCloudKitSizeMetric addByteSize:]((uint64_t)v49, *(void *)(v1[5] + 48));
  uint64_t v50 = v1[5];
  if (v50 && (uint64_t v51 = *(void *)(v50 + 8)) != 0 && (v52 = *(void *)(v51 + 24)) != 0) {
    uint64_t v53 = *(void *)(v52 + 72);
  }
  else {
    uint64_t v53 = 0;
  }
  -[PFCloudKitMetricsClient logMetric:](v53, v49);

  uint64_t v54 = v1[6];
  if (v54) {
    (*(void (**)(uint64_t, uint64_t))(v54 + 16))(v54, v64[5]);
  }

  v64[5] = 0;
  void v70[5] = 0;
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
LABEL_48:
}

void __53__PFCloudKitImporter_processWorkItemsWithCompletion___block_invoke_73(uint64_t a1)
{
  v15[5] = *(id *)MEMORY[0x1E4F143B8];
  v15[0] = 0;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v2) {
    id v3 = *(void **)(v2 + 8);
  }
  else {
    id v3 = 0;
  }
  int8x16_t v4 = +[NSCKDatabaseMetadata databaseMetadataForScope:forStore:inContext:error:]((uint64_t)NSCKDatabaseMetadata, [v3 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), (uint64_t)v15);
  uint64_t v5 = v4;
  if (!v4
    || (-[NSManagedObject setCurrentChangeToken:](v4, "setCurrentChangeToken:", *(void *)(*(void *)(a1 + 32) + 40)), -[NSManagedObject setLastFetchDate:](v5, "setLastFetchDate:", [MEMORY[0x1E4F1C9C8] date]), (objc_msgSend(*(id *)(a1 + 48), "save:", v15) & 1) == 0))
  {
    char v6 = (void *)MEMORY[0x18C127630]();
    uint64_t v7 = __ckLoggingOverride;
    uint64_t v8 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Error fetching database metadata update for request: %@\n%@"];
    _NSCoreDataLog(v7 != 0, v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[PFCloudKitImporter processWorkItemsWithCompletion:]_block_invoke");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v15[0];

    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
  }
}

uint64_t __61__PFCloudKitImporter_workItemFinished_withResult_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 40) success])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = *(void *)(a1 + 48);
      if (v2)
      {
        uint64_t v3 = *(void *)(v2 + 64);
        if (v3) {
          int8x16_t v4 = *(void **)(v3 + 24);
        }
        else {
          int8x16_t v4 = 0;
        }
        uint64_t v5 = [v4 unsignedIntegerValue];
      }
      else
      {
        uint64_t v5 = 0;
      }
      *(void *)(*(void *)(a1 + 32) + 48) += v5;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 56);
    return -[PFCloudKitImporter processWorkItemsWithCompletion:](v6, v7);
  }
  else
  {
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      uint64_t v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  return result;
}

@end