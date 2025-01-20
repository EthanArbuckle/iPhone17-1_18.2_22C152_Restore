@interface PFCloudKitExportContext
- (BOOL)checkForObjectsNeedingExportInStore:(id)a3 andReturnCount:(unint64_t *)a4 withManagedObjectContext:(id)a5 error:(id *)a6;
- (BOOL)modifyRecordsOperationFinishedForStore:(uint64_t)a3 withSavedRecords:(uint64_t)a4 deletedRecordIDs:(uint64_t)a5 operationError:(void *)a6 managedObjectContext:(void *)a7 error:;
- (BOOL)processAnalyzedHistoryInStore:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (PFCloudKitExportContext)initWithOptions:(id)a3;
- (uint64_t)currentBatchExceedsThresholds:(uint64_t)result;
- (uint64_t)insertRecordMetadataForObjectIDsInBatch:(void *)a3 inManagedObjectContext:(uint64_t)a4 withPendingTransactionNumber:(void *)a5 error:;
- (void)dealloc;
- (void)newOperationBySerializingDirtyObjectsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:;
@end

@implementation PFCloudKitExportContext

- (PFCloudKitExportContext)initWithOptions:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PFCloudKitExportContext;
  v4 = [(PFCloudKitExportContext *)&v6 init];
  if (v4)
  {
    v4->_options = (PFCloudKitExporterOptions *)a3;
    v4->_totalBytes = 0;
    v4->_totalRecords = 0;
    v4->_totalRecordIDs = 0;
    v4->_writtenAssetURLs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v4;
}

- (void)dealloc
{
  self->_options = 0;
  self->_writtenAssetURLs = 0;
  v3.receiver = self;
  v3.super_class = (Class)PFCloudKitExportContext;
  [(PFCloudKitExportContext *)&v3 dealloc];
}

- (BOOL)processAnalyzedHistoryInStore:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__50;
  v22 = __Block_byref_object_dispose__50;
  uint64_t v23 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke;
  v17[3] = &unk_1E544C808;
  v17[4] = a3;
  v17[5] = a4;
  v17[7] = &v18;
  v17[8] = &v24;
  v17[6] = self;
  [a4 performBlockAndWait:v17];
  if (!*((unsigned char *)v25 + 24))
  {
    id v8 = (id)v19[5];
    if (v8)
    {
      if (a5) {
        *a5 = v8;
      }
    }
    else
    {
      uint64_t v9 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      v16 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        __int16 v30 = 1024;
        int v31 = 690;
        _os_log_fault_impl(&dword_18AB82000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v19[5] = 0;
  char v6 = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);
  return v6;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3052000000;
  v72 = __Block_byref_object_copy__50;
  v73 = __Block_byref_object_dispose__50;
  uint64_t v74 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3052000000;
  v66 = __Block_byref_object_copy__50;
  v67 = __Block_byref_object_dispose__50;
  uint64_t v68 = 0;
  v2 = (void *)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateLastHistoryTokenKey", *(void *)(a1 + 32), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    objc_super v3 = (void *)MEMORY[0x18C127630](*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v4 = __ckLoggingOverride;
    uint64_t v5 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Unable to read the last history token: %@"];
    _NSCoreDataLog(v4 != 0, v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke");
    id v12 = 0;
  }
  else
  {
    id v12 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "transformedValue"), "storeTokens"), "objectForKey:", objc_msgSend(*(id *)(a1 + 32), "identifier"));
    if (!v12) {
      id v12 = (id)[objc_alloc(NSNumber) initWithInt:0];
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v70[5] = (uint64_t)v14;
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v64[5] = (uint64_t)v15;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    uint64_t v62 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x2020000000;
    v58[3] = 0;
    uint64_t v18 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKHistoryAnalyzerState entityPath]);
    [(NSFetchRequest *)v18 setReturnsObjectsAsFaults:0];
    [(NSFetchRequest *)v18 setPropertiesToFetch:&unk_1ED7E9988];
    [(NSFetchRequest *)v18 setFetchBatchSize:200];
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2;
    v56[3] = &unk_1E544F4E8;
    v19 = *(void **)(a1 + 40);
    v56[4] = *(void *)(a1 + 32);
    v56[5] = v16;
    v56[10] = &v63;
    v56[11] = v58;
    v56[12] = &v69;
    v56[13] = &v59;
    v56[6] = v17;
    v56[7] = v13;
    long long v57 = *(_OWORD *)(a1 + 56);
    v56[8] = v19;
    v56[9] = v12;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v18, v19, (uint64_t)v56);
    uint64_t v21 = *(void *)(a1 + 64);
    if (*(unsigned char *)(*(void *)(v21 + 8) + 24))
    {
      if (!v60[3]) {
        goto LABEL_9;
      }
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_3;
      v49[3] = &unk_1E544F4C0;
      long long v50 = *(_OWORD *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 56);
      v52 = &v69;
      uint64_t v53 = v22;
      v49[4] = v12;
      id v51 = v17;
      v54 = &v59;
      uint64_t v55 = v21;
      uint64_t v20 = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v49];
      uint64_t v21 = *(void *)(a1 + 64);
      if (*(unsigned char *)(*(void *)(v21 + 8) + 24))
      {
LABEL_9:
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_4;
        v42[3] = &unk_1E544F4C0;
        long long v43 = *(_OWORD *)(a1 + 32);
        uint64_t v23 = *(void *)(a1 + 56);
        v45 = &v63;
        uint64_t v46 = v23;
        v42[4] = v12;
        id v44 = v16;
        v47 = v58;
        uint64_t v48 = v21;
        uint64_t v20 = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v42];
      }
    }
    uint64_t v24 = (void *)MEMORY[0x18C127630](v20);
    if ((unint64_t)__ckLoggingOverride >= 0x10) {
      uint64_t v25 = 16;
    }
    else {
      uint64_t v25 = __ckLoggingOverride;
    }
    uint64_t v26 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Finished processing analyzed history with %lu metadata objects to create, %lu deleted rows without metadata."];
    [v17 count];
    [v16 count];
    _NSCoreDataLog(v25, v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke_5");
    uint64_t v33 = *(void *)(a1 + 64);
    if (*(unsigned char *)(*(void *)(v33 + 8) + 24))
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_6;
      v36[3] = &unk_1E544F600;
      v36[4] = v17;
      uint64_t v35 = *(void *)(a1 + 48);
      uint64_t v34 = *(void *)(a1 + 56);
      uint64_t v40 = v33;
      uint64_t v41 = v34;
      int8x16_t v37 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
      uint64_t v38 = v35;
      id v39 = v12;
      +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v36];
    }
    _Block_object_dispose(v58, 8);
    _Block_object_dispose(&v59, 8);
  }
  else
  {
    id v13 = 0;
    id v16 = 0;
    id v17 = 0;
  }

  v70[5] = 0;
  v64[5] = 0;

  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v69, 8);
}

uint64_t __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v4 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) = result;
    goto LABEL_39;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (!v7) {
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v49;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v49 != v9) {
        objc_enumerationMutation(a2);
      }
      uint64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * v10);
      id v12 = (void *)[v11 analyzedObjectID];
      if (!v12)
      {
        [*(id *)(a1 + 64) deleteObject:v11];
        goto LABEL_22;
      }
      id v13 = v12;
      id v14 = NSNumber;
      uint64_t v15 = _sqlEntityForEntityDescription([*(id *)(a1 + 32) model], objc_msgSend(v12, "entity"));
      if (v15) {
        uint64_t v16 = *(unsigned int *)(v15 + 184);
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v17 = [v14 numberWithUnsignedInt:v16];
      uint64_t v18 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "_referenceData64"));
      if ([v11 finalChangeType] == 2)
      {
        id v19 = (id)[*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) objectForKey:v17];
        if (!v19)
        {
          id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setObject:v19 forKey:v17];
        }
        [v19 addObject:v18];

        [*(id *)(a1 + 40) addObject:v13];
        uint64_t v20 = *(void *)(a1 + 88);
      }
      else
      {
        if ([v11 finalChangeType] && objc_msgSend(v11, "finalChangeType") != 1)
        {
          uint64_t v22 = [NSString stringWithUTF8String:"Unhandled persistent history change type: %@"];
          _NSCoreDataLog(17, v22, v23, v24, v25, v26, v27, v28, (uint64_t)v11);
          uint64_t v29 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v53 = v11;
            _os_log_fault_impl(&dword_18AB82000, v29, OS_LOG_TYPE_FAULT, "CoreData: Unhandled persistent history change type: %@", buf, 0xCu);
          }
          goto LABEL_21;
        }
        id v21 = (id)[*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) objectForKey:v17];
        if (!v21)
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setObject:v21 forKey:v17];
        }
        [v21 addObject:v18];

        [*(id *)(a1 + 48) addObject:v13];
        uint64_t v20 = *(void *)(a1 + 104);
      }
      ++*(void *)(*(void *)(v20 + 8) + 24);
LABEL_21:
      [*(id *)(a1 + 56) addObject:v13];
LABEL_22:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v30 = [a2 countByEnumeratingWithState:&v48 objects:v54 count:16];
    uint64_t v8 = v30;
  }
  while (v30);
LABEL_28:
  uint64_t result = [*(id *)(a1 + 64) hasChanges];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 64) save:*(void *)(*(void *)(a1 + 112) + 8) + 40];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    }
  }
  uint64_t v32 = *(void *)(a1 + 120);
  if (*(unsigned char *)(*(void *)(v32 + 8) + 24))
  {
    uint64_t v33 = *(void *)(a1 + 104);
    if (*(void *)(*(void *)(v33 + 8) + 24) >= 0x1F4uLL)
    {
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_24;
      v47[3] = &unk_1E544F4C0;
      uint64_t v34 = *(void *)(a1 + 96);
      uint64_t v35 = *(void *)(a1 + 32);
      uint64_t v36 = *(void *)(a1 + 64);
      v47[4] = *(void *)(a1 + 72);
      v47[5] = v35;
      uint64_t v37 = *(void *)(a1 + 112);
      v47[8] = v34;
      v47[9] = v37;
      uint64_t v38 = *(void *)(a1 + 48);
      v47[6] = v36;
      v47[7] = v38;
      v47[10] = v33;
      v47[11] = v32;
      uint64_t result = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v47];
      uint64_t v32 = *(void *)(a1 + 120);
    }
    uint64_t v39 = *(void *)(a1 + 88);
    if (*(void *)(*(void *)(v39 + 8) + 24) >= 0x1F4uLL)
    {
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2_38;
      v46[3] = &unk_1E544F4C0;
      uint64_t v40 = *(void *)(a1 + 80);
      uint64_t v41 = *(void *)(a1 + 64);
      uint64_t v42 = *(void *)(a1 + 32);
      uint64_t v43 = *(void *)(a1 + 40);
      v46[4] = *(void *)(a1 + 72);
      v46[5] = v42;
      uint64_t v44 = *(void *)(a1 + 112);
      v46[8] = v40;
      v46[9] = v44;
      v46[6] = v41;
      v46[7] = v43;
      v46[10] = v39;
      v46[11] = v32;
      uint64_t result = +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v46];
      uint64_t v32 = *(void *)(a1 + 120);
    }
  }
  uint64_t v4 = a4;
  if (!*(unsigned char *)(*(void *)(v32 + 8) + 24)) {
LABEL_39:
  }
    unsigned char *v4 = 1;
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_24(uint64_t a1)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"needsUpload";
  v5[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  v4[1] = @"needsCloudDelete";
  v5[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC28]];
  v4[2] = @"pendingExportTransactionNumber";
  v5[2] = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 32)];
  id v2 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3], *(void *)(a1 + 40), *(void *)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v2)
  {
    [*(id *)(a1 + 56) minusSet:v2];

    id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_2_38(uint64_t a1)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"needsUpload";
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  v6[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  v5[1] = @"needsCloudDelete";
  v6[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:v2];
  v5[2] = @"pendingExportTransactionNumber";
  v6[2] = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 32)];
  id v3 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3], *(void *)(a1 + 40), *(void *)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v3)
  {
    [*(id *)(a1 + 56) minusSet:v3];

    id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_3(uint64_t a1)
{
  void v5[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"needsUpload";
  v5[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  v4[1] = @"needsCloudDelete";
  v5[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC28]];
  v4[2] = @"pendingExportTransactionNumber";
  v5[2] = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 32)];
  id v2 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3], *(void *)(a1 + 40), *(void *)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v2)
  {
    [*(id *)(a1 + 56) minusSet:v2];

    id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_4(uint64_t a1)
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"needsUpload";
  uint64_t v2 = MEMORY[0x1E4F1CC38];
  v6[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  v5[1] = @"needsCloudDelete";
  v6[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:v2];
  v5[2] = @"pendingExportTransactionNumber";
  v6[2] = [MEMORY[0x1E4F28C68] expressionForConstantValue:*(void *)(a1 + 32)];
  id v3 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3], *(void *)(a1 + 40), *(void *)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  if (v3)
  {
    [*(id *)(a1 + 56) minusSet:v3];

    id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = result;
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    return *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  return result;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_6(uint64_t a1)
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v79 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v77 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  while (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (![*(id *)(a1 + 32) count])
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        uint64_t v4 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
        if (v4)
        {
          uint64_t v71 = *(void *)v111;
LABEL_8:
          uint64_t v5 = 0;
          uint64_t v73 = v4;
          while (1)
          {
            if (*(void *)v111 != v71) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void *)(*((void *)&v110 + 1) + 8 * v5);
            uint64_t v7 = (void *)[obj objectForKey:v6];
            uint64_t v75 = v5;
            long long v108 = 0u;
            long long v109 = 0u;
            long long v106 = 0u;
            long long v107 = 0u;
            uint64_t v8 = [v7 countByEnumeratingWithState:&v106 objects:v127 count:16];
            if (v8)
            {
              uint64_t v9 = *(void *)v107;
LABEL_13:
              uint64_t v10 = 0;
              while (1)
              {
                if (*(void *)v107 != v9) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v11 = *(void *)(*((void *)&v106 + 1) + 8 * v10);
                id v12 = (void *)MEMORY[0x18C127630]();
                uint64_t v13 = [v7 objectForKey:v11];
                id v14 = +[NSFetchRequest fetchRequestWithEntityName:v11];
                -[NSFetchRequest setPredicate:](v14, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF IN %@", v13]);
                [(NSFetchRequest *)v14 setFetchBatchSize:500];
                uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
                if (v15) {
                  uint64_t v16 = *(void **)(v15 + 16);
                }
                else {
                  uint64_t v16 = 0;
                }
                int v17 = [v16 preserveLegacyRecordMetadataBehavior];
                char v18 = v17;
                if (v17
                  && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName"), "objectForKey:", v11), "propertiesByName"), "objectForKey:", @"ckRecordID"))
                {
                  v126 = @"ckRecordID";
                  -[NSFetchRequest setPropertiesToFetch:](v14, "setPropertiesToFetch:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v126 count:1]);
                }
                id v19 = *(void **)(a1 + 40);
                v103[0] = MEMORY[0x1E4F143A8];
                v103[1] = 3221225472;
                v103[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_8;
                v103[3] = &unk_1E544F538;
                char v105 = v18;
                uint64_t v20 = *(void *)(a1 + 64);
                v103[4] = v6;
                v103[5] = v20;
                int8x16_t v104 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
                v103[6] = v19;
                +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v14, v19, (uint64_t)v103);
                int v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
                if (!v21) {
                  break;
                }
                if (v8 == ++v10)
                {
                  uint64_t v22 = [v7 countByEnumeratingWithState:&v106 objects:v127 count:16];
                  uint64_t v8 = v22;
                  if (v22) {
                    goto LABEL_13;
                  }
                  break;
                }
              }
            }
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
              break;
            }
            uint64_t v5 = v75 + 1;
            if (v75 + 1 == v73)
            {
              uint64_t v4 = [obj countByEnumeratingWithState:&v110 objects:v128 count:16];
              if (v4) {
                goto LABEL_8;
              }
              goto LABEL_29;
            }
          }
        }
      }
      break;
    }
    uint64_t v2 = [*(id *)(a1 + 32) anyObject];
    [*(id *)(a1 + 32) removeObject:v2];
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_7;
    v114[3] = &unk_1E544F510;
    uint64_t v3 = *(void *)(a1 + 32);
    v114[4] = *(void *)(a1 + 40);
    v114[5] = v2;
    long long v115 = *(_OWORD *)(a1 + 48);
    int8x16_t v120 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    id v116 = obj;
    uint64_t v117 = v3;
    id v118 = v77;
    id v119 = v79;
    +[_PFRoutines wrapBlockInGuardedAutoreleasePool:v114];
  }
LABEL_29:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if ([v79 count])
    {
      v124[0] = @"needsUpload";
      v125[0] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
      v124[1] = @"needsCloudDelete";
      v125[1] = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
      id v23 = +[NSCKRecordMetadata batchUpdateMetadataMatchingEntityIdsAndPKs:withUpdates:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, v79, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v125 forKeys:v124 count:2], *(void *)(a1 + 48), *(void *)(a1 + 40), (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
      if (v23)
      {
        [v77 minusSet:v23];
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        id v24 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      }
    }
    if ([*(id *)(a1 + 40) hasChanges]
      && ([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 80) + 8) + 40] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v25 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    && (+[NSCKHistoryAnalyzerState purgeAnalyzedHistoryFromStore:withManagedObjectContext:error:]((uint64_t)NSCKHistoryAnalyzerState, *(void *)(a1 + 48), *(void **)(a1 + 40), (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    id v26 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  }

  [*(id *)(a1 + 40) reset];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    if (objc_msgSend((id)+[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey", *(void *)(a1 + 48), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 80) + 8) + 40), "BOOLValue")&& ((uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8)) == 0 ? (v28 = 0) : (v28 = *(void **)(v27 + 8)), objc_msgSend(v28, "databaseScope") == 2|| ((v29 = *(void *)(*(void *)(a1 + 56) + 8)) == 0 ? (v30 = 0) : (v30 = *(void **)(v29 + 8)), objc_msgSend(v30, "databaseScope") == 1)))
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v31) {
        uint64_t v32 = *(void **)(v31 + 8);
      }
      else {
        uint64_t v32 = 0;
      }
      id v68 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", [v32 databaseScope]);
      uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v33) {
        uint64_t v34 = *(void **)(v33 + 8);
      }
      else {
        uint64_t v34 = 0;
      }
      if (+[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v68, [v34 databaseScope], *(void *)(a1 + 48), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 80) + 8) + 40))
      {
        uint64_t v97 = 0;
        v98 = &v97;
        uint64_t v99 = 0x3052000000;
        v100 = __Block_byref_object_copy__50;
        v101 = __Block_byref_object_dispose__50;
        uint64_t v102 = 0;
        id v78 = (id)[*(id *)(a1 + 48) model];
        uint64_t v69 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "ancillarySQLModels"), "objectForKey:", @"NSPersistentStoreMirroringDelegateOptionKey"), "entityNamed:", @"NSCKRecordMetadata");
        uint64_t v35 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinator"), "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(*(id *)(a1 + 48), "configurationName"));
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v70 = v35;
        uint64_t v76 = [v35 countByEnumeratingWithState:&v93 objects:v123 count:16];
        if (v76)
        {
          uint64_t v74 = *(void *)v94;
LABEL_56:
          uint64_t v36 = 0;
          while (1)
          {
            if (*(void *)v94 != v74) {
              objc_enumerationMutation(v70);
            }
            uint64_t v83 = v36;
            uint64_t v37 = *(void **)(*((void *)&v93 + 1) + 8 * v36);
            id obja = (id)MEMORY[0x18C127630]();
            uint64_t v38 = objc_msgSend(v78, "entityNamed:", objc_msgSend(v37, "name"));
            if (!v38 || *(void *)(v38 + 160)) {
              goto LABEL_88;
            }
            v92[0] = MEMORY[0x1E4F143A8];
            v92[1] = 3221225472;
            v92[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_9;
            v92[3] = &unk_1E544F560;
            v92[6] = &v97;
            v92[4] = v38;
            v92[5] = v69;
            uint64_t v39 = [[NSSQLBlockRequestContext alloc] initWithBlock:v92 context:*(void *)(a1 + 40) sqlCore:*(void *)(a1 + 48)];
            -[NSSQLCore dispatchRequest:withRetries:](*(void *)(a1 + 48), v39, 0);
            v80 = v39;
            id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v90 = 0u;
            long long v91 = 0u;
            long long v88 = 0u;
            long long v89 = 0u;
            id v84 = (id)v98[5];
            uint64_t v41 = [v84 countByEnumeratingWithState:&v88 objects:v122 count:16];
            if (v41)
            {
              uint64_t v42 = 0;
              uint64_t v43 = *(void *)v89;
              id v44 = v40;
LABEL_63:
              uint64_t v45 = 0;
              unint64_t v46 = v42 + 1;
              uint64_t v72 = v41 + v42;
              while (1)
              {
                if (*(void *)v89 != v43) {
                  objc_enumerationMutation(v84);
                }
                v47 = *(void **)(*((void *)&v88 + 1) + 8 * v45);
                long long v48 = (void *)MEMORY[0x18C127630]();
                if ([v47 count] != 2)
                {

                  v66 = (void *)MEMORY[0x1E4F1CA00];
                  uint64_t v67 = [NSString stringWithFormat:@"Unexpected number of items in the pk / ent array: %@", v47];
                  objc_exception_throw((id)[v66 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v67 userInfo:0]);
                }
                long long v49 = objc_msgSend(*(id *)(a1 + 48), "newObjectIDForEntity:pk:", _sqlCoreLookupSQLEntityForEntityID(*(void **)(a1 + 48), objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", 1), "unsignedLongValue")), objc_msgSend((id)objc_msgSend(v47, "objectAtIndexedSubscript:", 0), "integerValue"));
                [v44 addObject:v49];

                if (!(v46 % 0x64))
                {
                  if (-[PFCloudKitExportContext insertRecordMetadataForObjectIDsInBatch:inManagedObjectContext:withPendingTransactionNumber:error:](*(void *)(a1 + 56), v44, *(void **)(a1 + 40), *(void *)(a1 + 64), (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)))
                  {
                    if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 80) + 8) + 40] & 1) == 0)
                    {
                      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
                      id v50 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
                    }

                    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  }
                  else
                  {
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
                    id v51 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
                  }
                  [*(id *)(a1 + 40) reset];
                }
                int v52 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
                if (!v52) {
                  break;
                }
                ++v45;
                ++v46;
                if (v41 == v45)
                {
                  uint64_t v41 = [v84 countByEnumeratingWithState:&v88 objects:v122 count:16];
                  uint64_t v42 = v72;
                  if (v41) {
                    goto LABEL_63;
                  }
                  break;
                }
              }
            }
            else
            {
              id v44 = v40;
            }
            if ([v44 count]
              && (-[PFCloudKitExportContext insertRecordMetadataForObjectIDsInBatch:inManagedObjectContext:withPendingTransactionNumber:error:](*(void *)(a1 + 56), v44, *(void **)(a1 + 40), *(void *)(a1 + 64), (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) & 1) == 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
              id v53 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            }
            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
              && [*(id *)(a1 + 40) hasChanges])
            {
              if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 80) + 8) + 40] & 1) == 0)
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
                id v54 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
              }
              [*(id *)(a1 + 40) reset];
            }

            if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
            {
LABEL_88:

              v98[5] = 0;
              int v55 = 1;
            }
            else
            {
              int v55 = 0;
            }
            if (!v55) {
              break;
            }
            uint64_t v36 = v83 + 1;
            if (v83 + 1 == v76)
            {
              uint64_t v56 = [v70 countByEnumeratingWithState:&v93 objects:v123 count:16];
              uint64_t v76 = v56;
              if (v56) {
                goto LABEL_56;
              }
              break;
            }
          }
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
        {
          uint64_t v57 = +[NSCKMetadataEntry entryForKey:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMetadataEntry, @"NSCloudKitMirroringDelegateScanForRowsMissingFromHistoryKey", *(void *)(a1 + 48), *(void **)(a1 + 40), *(void *)(*(void *)(a1 + 80) + 8) + 40);
          if (v57)
          {
            [*(id *)(a1 + 40) deleteObject:v57];
          }
          else
          {
            v60 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            if (v60)
            {
              id v61 = v60;
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
            }
          }
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
            && ([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 80) + 8) + 40] & 1) == 0)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
            id v62 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          }
        }

        v98[5] = 0;
        _Block_object_dispose(&v97, 8);
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        id v59 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      }
    }
    else if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v58 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v63 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath]);
    -[NSFetchRequest setPredicate:](v63, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsCloudDelete == 1"]);
    [(NSFetchRequest *)v63 setFetchBatchSize:500];
    [(NSFetchRequest *)v63 setReturnsObjectsAsFaults:0];
    uint64_t v121 = *(void *)(a1 + 48);
    -[NSFetchRequest setAffectedStores:](v63, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1]);
    v85[0] = MEMORY[0x1E4F143A8];
    v85[1] = 3221225472;
    v85[2] = __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_10;
    v85[3] = &unk_1E544F588;
    int8x16_t v64 = *(int8x16_t *)(a1 + 40);
    int8x16_t v65 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    int8x16_t v86 = vextq_s8(v64, v64, 8uLL);
    int8x16_t v87 = v65;
    +[_PFRoutines efficientlyEnumerateManagedObjectsInFetchRequest:usingManagedObjectContext:andApplyBlock:]((uint64_t)_PFRoutines, v63, (void *)v64.i64[0], (uint64_t)v85);
  }
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_7(uint64_t a1)
{
  v65[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) existingObjectWithID:*(void *)(a1 + 40) error:*(void *)(*(void *)(a1 + 96) + 8) + 40];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = +[PFCloudKitSerializer createSetOfObjectIDsRelatedToObject:]((uint64_t)PFCloudKitSerializer, v2);
    if (![v4 count])
    {
LABEL_48:
      objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v3, objc_msgSend(v3, "hasChanges"));
      goto LABEL_49;
    }
    id v5 = +[NSCKRecordZoneMetadata fetchZoneIDsAssignedToObjectsWithIDs:v4 fromStore:*(void *)(a1 + 48) inContext:*(void *)(a1 + 32) error:*(void *)(*(void *)(a1 + 96) + 8) + 40];
    uint64_t v6 = v5;
    if (!v5)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
      id v16 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
LABEL_47:

      goto LABEL_48;
    }
    id v55 = v5;
    uint64_t v56 = v3;
    if ([v5 count])
    {
      if ([v6 count] == 1)
      {
        id v7 = (id)[v6 anyObject];
LABEL_26:
        id v40 = v7;
        goto LABEL_28;
      }
      if ((unint64_t)[v6 count] < 2)
      {
        id v40 = 0;
        goto LABEL_28;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F281F8];
      uint64_t v62 = *MEMORY[0x1E4F28588];
      uint64_t v63 = [NSString stringWithFormat:@"Object graph corruption detected. Objects related to '%@' are assigned to multiple zones: %@", *(void *)(a1 + 40), v6];
      uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v37 = &v63;
      uint64_t v38 = &v62;
    }
    else
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      if (v17) {
        char v18 = *(void **)(v17 + 8);
      }
      else {
        char v18 = 0;
      }
      if ([v18 databaseScope] != 3)
      {
        uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
        if (v41) {
          uint64_t v42 = *(void **)(v41 + 8);
        }
        else {
          uint64_t v42 = 0;
        }
        id v7 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", [v42 databaseScope]);
        goto LABEL_26;
      }
      id v19 = (void *)MEMORY[0x18C127630]();
      BOOL v20 = __ckLoggingOverride != 0;
      uint64_t v21 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: %@ - Failed to assign an object to a record zone. This usually means the object exists in a shared database and must be assigned to a zone using -[%@ %@]: %@"];
      uint64_t v22 = *(void *)(a1 + 48);
      id v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      id v54 = NSStringFromSelector(sel_shareManagedObjects_toShare_completion_);
      id v53 = v24;
      _NSCoreDataLog(v20, v21, v25, v26, v27, v28, v29, v30, (uint64_t)"-[PFCloudKitExportContext processAnalyzedHistoryInStore:inManagedObjectContext:error:]_block_invoke_7");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
      id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v32 = *MEMORY[0x1E4F281F8];
      uint64_t v64 = *MEMORY[0x1E4F28588];
      uint64_t v33 = NSString;
      uint64_t v34 = (objc_class *)objc_opt_class();
      uint64_t v35 = NSStringFromClass(v34);
      v65[0] = [v33 stringWithFormat:@"Failed to assign an object to a record zone. This usually means the object exists in a shared database and must be assigned to a zone using -[%@ %@]: %@", v35, NSStringFromSelector(sel_shareManagedObjects_toShare_completion_), objc_msgSend(v3, "objectID"), v22, v53, v54, v3];
      uint64_t v36 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v37 = v65;
      uint64_t v38 = &v64;
    }
    uint64_t v39 = objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 134060, objc_msgSend(v36, "dictionaryWithObjects:forKeys:count:", v37, v38, 1));
    id v40 = 0;
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) = v39;
LABEL_28:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
    {
      id v43 = (id)[*(id *)(a1 + 64) objectForKey:v40];
      if (!v43)
      {
        id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [*(id *)(a1 + 64) setObject:v43 forKey:v40];
      }
      id v44 = (id)objc_msgSend(v43, "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "entityName"));
      if (!v44)
      {
        id v44 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
        objc_msgSend(v43, "setObject:forKey:", v44, objc_msgSend(*(id *)(a1 + 40), "entityName"));
      }
      [v44 addObject:*(void *)(a1 + 40)];

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      uint64_t v45 = [v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v58 != v47) {
              objc_enumerationMutation(v4);
            }
            long long v49 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            if ([*(id *)(a1 + 72) containsObject:v49])
            {
              [*(id *)(a1 + 72) removeObject:v49];
              id v50 = (id)[*(id *)(a1 + 64) objectForKey:v40];
              if (!v50)
              {
                id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                [*(id *)(a1 + 64) setObject:v50 forKey:v40];
              }
              id v51 = (id)objc_msgSend(v50, "objectForKey:", objc_msgSend(v49, "entityName"));
              if (!v51)
              {
                id v51 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                objc_msgSend(v50, "setObject:forKey:", v51, objc_msgSend(v49, "entityName"));
              }
              [v51 addObject:v49];
            }
          }
          uint64_t v46 = [v4 countByEnumeratingWithState:&v57 objects:v61 count:16];
        }
        while (v46);
      }
    }

    uint64_t v6 = v55;
    uint64_t v3 = v56;
    goto LABEL_47;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) code] == 133000
    && (uint64_t v8 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) domain],
        [v8 isEqualToString:*MEMORY[0x1E4F281F8]]))
  {
    *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) = 0;
    [*(id *)(a1 + 80) addObject:*(void *)(a1 + 40)];
    uint64_t v9 = NSNumber;
    uint64_t v10 = _sqlEntityForEntityDescription([*(id *)(a1 + 48) model], objc_msgSend(*(id *)(a1 + 40), "entity"));
    if (v10) {
      uint64_t v11 = *(unsigned int *)(v10 + 184);
    }
    else {
      uint64_t v11 = 0;
    }
    uint64_t v12 = [v9 numberWithUnsignedInt:v11];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "_referenceData64"));
    id v14 = (id)[*(id *)(a1 + 88) objectForKey:v12];
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(a1 + 88) setObject:v14 forKey:v12];
    }
    [v14 addObject:v13];
  }
  else
  {
    id v15 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
  }
LABEL_49:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)
    && (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "insertedObjects"), "count") >= 0x1F4)
  {
    if ([*(id *)(a1 + 32) save:*(void *)(*(void *)(a1 + 96) + 8) + 40])
    {
      [*(id *)(a1 + 32) reset];
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
      id v52 = *(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    }
  }
}

uint64_t __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_8(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(a2);
          }
          id v11 = +[NSCKRecordMetadata insertMetadataForObject:*(void *)(*((void *)&v15 + 1) + 8 * v10) setRecordName:*(unsigned __int8 *)(a1 + 72) inZoneWithID:*(void *)(a1 + 32) recordNamePrefix:0 error:*(void *)(*(void *)(a1 + 56) + 8) + 40];
          if (v11)
          {
            uint64_t v12 = v11;
            [v11 setNeedsUpload:1];
            [v12 setNeedsCloudDelete:0];
            [v12 setPendingExportTransactionNumber:*(void *)(a1 + 40)];
          }
          else
          {
            id v13 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
            *a4 = 1;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [a2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }
    uint64_t result = [*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 56) + 8) + 40];
    if ((result & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      uint64_t result = (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *a4 = 1;
    }
  }
  else
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t result = a3;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

id __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v3 = *(void *)(a2 + 24);
  }
  else {
    uint64_t v3 = 0;
  }
  id result = -[NSSQLiteConnection createArrayOfPrimaryKeysAndEntityIDsForRowsWithoutRecordMetadataWithEntity:metadataEntity:](v3, *(void **)(a1 + 32), *(id **)(a1 + 40));
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (uint64_t)insertRecordMetadataForObjectIDsInBatch:(void *)a3 inManagedObjectContext:(uint64_t)a4 withPendingTransactionNumber:(void *)a5 error:
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v48 = 0;
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "lastObject"), "entity");
  if (v9)
  {
    if ((*(unsigned char *)(v9 + 120) & 4) != 0)
    {
      uint64_t v10 = *(void **)(v9 + 72);
    }
    else
    {
      do
      {
        uint64_t v10 = (void *)v9;
        uint64_t v9 = [(id)v9 superentity];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", [v10 name]);
  -[NSFetchRequest setPredicate:](v11, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF in %@", a2]);
  uint64_t v12 = (void *)[a3 executeFetchRequest:v11 error:&v48];
  if (!v12)
  {
    id v30 = v48;
    goto LABEL_28;
  }
  id v13 = v12;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v41 = a5;
    uint64_t v16 = *(void *)v45;
    char v42 = 1;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v45 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v44 + 1) + 8 * v17);
        id v19 = (void *)MEMORY[0x18C127630]();
        uint64_t v20 = *(void *)(a1 + 8);
        if (v20) {
          uint64_t v21 = *(void **)(v20 + 8);
        }
        else {
          uint64_t v21 = 0;
        }
        id v22 = +[PFCloudKitSerializer defaultRecordZoneIDForDatabaseScope:](PFCloudKitSerializer, "defaultRecordZoneIDForDatabaseScope:", [v21 databaseScope]);
        uint64_t v23 = *(void *)(a1 + 8);
        if (v23) {
          id v24 = *(void **)(v23 + 16);
        }
        else {
          id v24 = 0;
        }
        id v25 = +[NSCKRecordMetadata insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:](NSCKRecordMetadata, "insertMetadataForObject:setRecordName:inZoneWithID:recordNamePrefix:error:", v18, [v24 preserveLegacyRecordMetadataBehavior], v22, 0, &v48);
        if (v25)
        {
          uint64_t v26 = v25;
          [v25 setNeedsUpload:1];
          [v26 setPendingExportTransactionNumber:a4];
          [v26 setPendingExportChangeTypeNumber:&unk_1ED7E2BF0];
        }
        else
        {
          id v27 = v48;
          char v42 = 0;
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v28 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
      uint64_t v15 = v28;
    }
    while (v28);
    a5 = v41;
    if ((v42 & 1) == 0)
    {
LABEL_28:
      id v31 = v48;
      if (v31)
      {
        if (a5)
        {
          uint64_t v29 = 0;
          *a5 = v31;
          goto LABEL_34;
        }
      }
      else
      {
        uint64_t v32 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
        _NSCoreDataLog(17, v32, v33, v34, v35, v36, v37, v38, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
        uint64_t v39 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v50 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
          __int16 v51 = 1024;
          int v52 = 1366;
          _os_log_fault_impl(&dword_18AB82000, v39, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      uint64_t v29 = 0;
      goto LABEL_34;
    }
  }
  uint64_t v29 = 1;
LABEL_34:

  return v29;
}

void __86__PFCloudKitExportContext_processAnalyzedHistoryInStore_inManagedObjectContext_error___block_invoke_10(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v8 = [a2 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(a2);
          }
          uint64_t v12 = (void *)[*(id *)(*((void *)&v27 + 1) + 8 * i) createRecordIDForMovedRecord];
          [v7 addObject:v12];
        }
        uint64_t v9 = [a2 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v9);
    }
    id v13 = +[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingRelatingRecords:andRelatingRecordIDs:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, MEMORY[0x1E4F1CBF0], v7, *(void *)(a1 + 32), *(void **)(a1 + 40), (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
    if (!v13) {
      goto LABEL_18;
    }
    uint64_t v14 = v13;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      uint64_t v18 = MEMORY[0x1E4F1CC28];
      uint64_t v19 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          [v21 setIsUploaded:v18];
          [v21 setNeedsDelete:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v16);
    }
    if (([*(id *)(a1 + 40) save:*(void *)(*(void *)(a1 + 48) + 8) + 40] & 1) == 0)
    {
LABEL_18:
      id v22 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      *a4 = 1;
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)newOperationBySerializingDirtyObjectsInStore:(void *)a3 inManagedObjectContext:(void *)a4 error:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3052000000;
  uint64_t v35 = __Block_byref_object_copy__50;
  uint64_t v36 = __Block_byref_object_dispose__50;
  uint64_t v37 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3052000000;
  long long v29 = __Block_byref_object_copy__50;
  long long v30 = __Block_byref_object_dispose__50;
  uint64_t v31 = 0;
  uint64_t v8 = objc_alloc_init(PFCloudKitOperationBatch);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke;
  v25[3] = &unk_1E544F5B0;
  v25[4] = a2;
  v25[5] = a1;
  v25[10] = &v38;
  v25[11] = &v26;
  v25[6] = a3;
  v25[7] = v8;
  v25[8] = v9;
  v25[9] = &v32;
  [a3 performBlockAndWait:v25];
  uint64_t v10 = (void *)a1[5];
  uint64_t v11 = v27[5];
  if (v11) {
    id v12 = (id)[*(id *)(v11 + 40) copy];
  }
  else {
    id v12 = 0;
  }
  [v10 addObjectsFromArray:v12];
  id v13 = 0;
  if (*((unsigned char *)v39 + 24) && v8)
  {
    uint64_t v14 = [(NSMutableArray *)v8->_records count];
    if ([(NSMutableSet *)v8->_deletedRecordIDs count] + v14)
    {
      id v13 = objc_msgSend(objc_alloc(getCloudKitCKModifyRecordsOperationClass()), "initWithRecordsToSave:recordIDsToDelete:", v8->_records, -[NSMutableSet allObjects](v8->_deletedRecordIDs, "allObjects"));
      a1[2] += v8->_sizeInBytes;
      a1[3] += [(NSMutableArray *)v8->_records count];
      a1[4] += [(NSMutableSet *)v8->_deletedRecordIDs count];
    }
    else
    {
      id v13 = 0;
    }
  }

  v27[5] = 0;
  if (!*((unsigned char *)v39 + 24))
  {
    id v15 = (id)v33[5];
    if (v15)
    {
      if (a4) {
        *a4 = v15;
      }
    }
    else
    {
      uint64_t v16 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v16, v17, v18, v19, v20, v21, v22, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      long long v23 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v43 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        __int16 v44 = 1024;
        int v45 = 1039;
        _os_log_fault_impl(&dword_18AB82000, v23, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }

    id v13 = 0;
  }

  v33[5] = 0;
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
  return v13;
}

void __101__PFCloudKitExportContext_newOperationBySerializingDirtyObjectsInStore_inManagedObjectContext_error___block_invoke(uint64_t a1)
{
  v205[1] = *MEMORY[0x1E4F143B8];
  id v1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordMetadata entityPath]);
  [(NSFetchRequest *)v2 setReturnsObjectsAsFaults:0];
  v205[0] = *(void *)(a1 + 32);
  -[NSFetchRequest setAffectedStores:](v2, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v205 count:1]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 32);
  }
  else {
    uint64_t v4 = 0;
  }
  [(NSFetchRequest *)v2 setFetchLimit:v4];
  [(NSFetchRequest *)v2 setPropertiesToFetch:&unk_1ED7E99A0];
  -[NSFetchRequest setPredicate:](v2, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsUpload = YES"]);
  id v5 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v2 error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
  uint64_t v6 = v5;
  if (v5)
  {
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v188 objects:v204 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v189;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v189 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v188 + 1) + 8 * i);
          uint64_t v11 = (void *)MEMORY[0x18C127630]();
          id v12 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v10);
          [v1 addObject:v12];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v188 objects:v204 count:16];
      }
      while (v7);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    id v13 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    v158 = objc_alloc_init(PFCloudKitMetadataCache);
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v14) {
      uint64_t v15 = *(void *)(v14 + 16);
    }
    else {
      uint64_t v15 = 0;
    }
    if (-[PFCloudKitMetadataCache cacheMetadataForObjectsWithIDs:andRecordsWithIDs:inStore:withManagedObjectContext:mirroringOptions:error:]((id *)&v158->super.isa, v1, MEMORY[0x1E4F1CBF0], *(void **)(a1 + 32), *(void **)(a1 + 48), v15, (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)))
    {
      uint64_t v16 = [PFCloudKitSerializer alloc];
      uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v17) {
        uint64_t v18 = *(void *)(v17 + 16);
      }
      else {
        uint64_t v18 = 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = [(PFCloudKitSerializer *)v16 initWithMirroringOptions:v18 metadataCache:v158 recordNamePrefix:0];
      long long v184 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      uint64_t v152 = [v6 countByEnumeratingWithState:&v184 objects:v203 count:16];
      if (v152)
      {
        uint64_t v151 = *(void *)v185;
        uint64_t v148 = *MEMORY[0x1E4F281F8];
LABEL_21:
        uint64_t v155 = 0;
        while (1)
        {
          if (*(void *)v185 != v151) {
            objc_enumerationMutation(v6);
          }
          uint64_t v19 = *(void **)(*((void *)&v184 + 1) + 8 * v155);
          context = (void *)MEMORY[0x18C127630]();
          v154 = -[NSCKRecordMetadata createObjectIDForLinkedRow](v19);
          uint64_t v156 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, [v154 entity]);
          uint64_t v20 = (void *)-[NSCKRecordMetadata createRecordID](v19);
          uint64_t v21 = [v20 zoneID];
          if (v158
            && (uint64_t v21 = [(NSMutableSet *)v158->_mutableZoneIDs containsObject:v21], v21))
          {
            if ([v19 needsCloudDelete])
            {
              -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v20, v156);
            }
            else
            {
              uint64_t v32 = (void *)[*(id *)(a1 + 48) existingObjectWithID:v154 error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
              uint64_t v33 = v32;
              if (v32)
              {
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v32, "objectID"), "persistentStore"), "identifier"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "identifier")))
                {
                  id v149 = objc_alloc_init(MEMORY[0x1E4F28B28]);
                  uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
                  if (v34) {
                    id obj = -[PFCloudKitSerializer newCKRecordsFromObject:fullyMaterializeRecords:includeRelationships:error:](v34, v33, 0, 1, (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
                  }
                  else {
                    id obj = 0;
                  }
                  objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v33, objc_msgSend(v33, "hasChanges"));
                  if (obj)
                  {
                    long long v182 = 0u;
                    long long v183 = 0u;
                    long long v180 = 0u;
                    long long v181 = 0u;
                    uint64_t v35 = [obj countByEnumeratingWithState:&v180 objects:v202 count:16];
                    if (v35)
                    {
                      uint64_t v36 = *(void *)v181;
LABEL_39:
                      uint64_t v37 = 0;
                      while (1)
                      {
                        if (*(void *)v181 != v36) {
                          objc_enumerationMutation(obj);
                        }
                        uint64_t v38 = *(void *)(a1 + 56);
                        uint64_t v39 = v38 ? *(void **)(v38 + 8) : 0;
                        uint64_t v40 = *(void **)(*((void *)&v180 + 1) + 8 * v37);
                        if (objc_msgSend(v39, "containsObject:", objc_msgSend(v40, "recordID"))) {
                          -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), (void *)[v40 recordID], v156);
                        }
                        else {
                          -[PFCloudKitOperationBatch addRecord:](*(void *)(a1 + 56), v40);
                        }
                        if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)))break; {
                        if (v35 == ++v37)
                        }
                        {
                          uint64_t v41 = [obj countByEnumeratingWithState:&v180 objects:v202 count:16];
                          uint64_t v35 = v41;
                          if (v41) {
                            goto LABEL_39;
                          }
                          break;
                        }
                      }
                    }
                  }
                  else
                  {
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
                    id v44 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                  }
                  long long v178 = 0u;
                  long long v179 = 0u;
                  long long v176 = 0u;
                  long long v177 = 0u;
                  int v45 = (void *)[v19 moveReceipts];
                  uint64_t v46 = [v45 countByEnumeratingWithState:&v176 objects:v201 count:16];
                  if (v46)
                  {
                    uint64_t v47 = *(void *)v177;
                    do
                    {
                      for (uint64_t j = 0; j != v46; ++j)
                      {
                        if (*(void *)v177 != v47) {
                          objc_enumerationMutation(v45);
                        }
                        long long v49 = *(void **)(*((void *)&v176 + 1) + 8 * j);
                        if ([v49 needsCloudDelete])
                        {
                          if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)))goto LABEL_69; {
                          id v50 = (void *)[v49 createRecordIDForMovedRecord];
                          }
                          -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v50, v156);
                          objc_msgSend(*(id *)(a1 + 64), "addObject:", objc_msgSend(v49, "objectID"));
                        }
                      }
                      uint64_t v46 = [v45 countByEnumeratingWithState:&v176 objects:v201 count:16];
                    }
                    while (v46);
                  }
LABEL_69:
                }
              }
              else
              {
                char v42 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                if (v42)
                {
                  if (objc_msgSend((id)objc_msgSend(v42, "domain"), "isEqualToString:", v148)
                    && [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code] == 133000)
                  {
                    [v19 setNeedsCloudDelete:1];
                    -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v20, v156);
                    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
                  }
                  else
                  {
                    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
                    id v43 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                  }
                }
              }
            }
          }
          else
          {
            uint64_t v22 = (void *)MEMORY[0x18C127630](v21);
            unint64_t v23 = __ckLoggingOverride;
            uint64_t v24 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Ignoring dirty metadata for record in immutable zone: %@"];
            uint64_t v31 = v23 >= 3 ? 3 : v23;
            _NSCoreDataLog(v31, v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[PFCloudKitExportContext newOperationBySerializingDirtyObjectsInStore:inManagedObjectContext:error:]_block_invoke");
            [v19 setNeedsUpload:0];
            [v19 setNeedsCloudDelete:0];
          }

          if ([*(id *)(a1 + 48) hasChanges])
          {
            uint64_t v51 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "insertedObjects"), "count");
            uint64_t v52 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "updatedObjects"), "count");
            if ((unint64_t)(v52
                                  + v51
                                  + objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "deletedObjects"), "count")) >= 0xC9
              && ([*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 72) + 8) + 40] & 1) == 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
              id v53 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            }
          }
          [*(id *)(a1 + 48) refreshAllObjects];
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
            int v54 = -[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56))? 5: 0;
          }
          else {
            int v54 = 5;
          }
          if (v54) {
            break;
          }
          if (++v155 == v152)
          {
            uint64_t v55 = [v6 countByEnumeratingWithState:&v184 objects:v203 count:16];
            uint64_t v152 = v55;
            if (v55) {
              goto LABEL_21;
            }
            break;
          }
        }
      }
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        if ((-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)) & 1) == 0)
        {
          uint64_t v56 = (void *)+[NSCKMirroredRelationship fetchMirroredRelationshipsMatchingPredicate:fromStore:inManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, [MEMORY[0x1E4F28F60] predicateWithFormat:@"isUploaded = NO"], *(void *)(a1 + 32), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 72) + 8) + 40);
          if (v56)
          {
            v157 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "persistentStoreCoordinator"), "managedObjectModel");
            long long v174 = 0u;
            long long v175 = 0u;
            long long v172 = 0u;
            long long v173 = 0u;
            uint64_t v57 = [v56 countByEnumeratingWithState:&v172 objects:v200 count:16];
            if (v57)
            {
              uint64_t v58 = *(void *)v173;
LABEL_89:
              uint64_t v59 = 0;
              while (1)
              {
                if (*(void *)v173 != v58) {
                  objc_enumerationMutation(v56);
                }
                long long v60 = *(void **)(*((void *)&v172 + 1) + 8 * v59);
                if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)))break; {
                id v61 = -[NSCKMirroredRelationship createRecordID](v60);
                }
                uint64_t v62 = [v61 zoneID];
                if (v158
                  && (uint64_t v62 = [(NSMutableSet *)v158->_mutableZoneIDs containsObject:v62],
                      (v62 & 1) != 0))
                {
                  uint64_t v63 = *(void *)(a1 + 56);
                  if (v63) {
                    uint64_t v64 = *(void **)(v63 + 32);
                  }
                  else {
                    uint64_t v64 = 0;
                  }
                  if (([v64 containsObject:v61] & 1) == 0)
                  {
                    uint64_t v65 = *(void *)(a1 + 56);
                    v66 = v65 ? *(void **)(v65 + 8) : 0;
                    if (([v66 containsObject:v61] & 1) == 0)
                    {
                      if ([v60 needsDelete])
                      {
                        -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v61, @"CDMR");
                      }
                      else
                      {
                        uint64_t v76 = -[NSCKMirroredRelationship createRecordIDForRecord](v60);
                        id v77 = -[NSCKMirroredRelationship createRecordIDForRelatedRecord](v60);
                        id v78 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v157, "entitiesByName"), "objectForKeyedSubscript:", objc_msgSend(v60, "cdEntityName")), "relationshipsByName"), "objectForKeyedSubscript:", objc_msgSend(v60, "relationshipName"));
                        id v79 = -[PFMirroredManyToManyRelationshipV2 initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:]([PFMirroredManyToManyRelationshipV2 alloc], "initWithRecordID:forRecordWithID:relatedToRecordWithID:byRelationship:withInverse:andType:", v61, v76, v77, v78, [v78 inverseRelationship], 0);
                        v80 = (void *)[objc_alloc((Class)getCloudKitCKRecordClass[0]()) initWithRecordType:@"CDMR" recordID:v61];
                        uint64_t v81 = *(void *)(*(void *)(a1 + 40) + 8);
                        if (v81) {
                          v82 = *(void **)(v81 + 16);
                        }
                        else {
                          v82 = 0;
                        }
                        int v83 = [v82 useDeviceToDeviceEncryption];
                        uint64_t v84 = (uint64_t)v80;
                        if (v83) {
                          uint64_t v84 = objc_msgSend(v80, "encryptedValueStore", v80);
                        }
                        [(PFMirroredManyToManyRelationshipV2 *)v79 populateRecordValues:v84];
                        -[PFCloudKitOperationBatch addRecord:](*(void *)(a1 + 56), v80);
                      }
                    }
                  }
                }
                else
                {
                  uint64_t v67 = (void *)MEMORY[0x18C127630](v62);
                  uint64_t v68 = __ckLoggingOverride;
                  uint64_t v69 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Ignoring update to dirty mirrored relationship because the zone is not mutable: %@"];
                  _NSCoreDataLog(v68 != 0, v69, v70, v71, v72, v73, v74, v75, (uint64_t)"-[PFCloudKitExportContext newOperationBySerializingDirtyObjectsInStore:inManagedObjectContext:error:]_block_invoke");
                  [v60 setIsUploaded:MEMORY[0x1E4F1CC38]];
                }

                if (v57 == ++v59)
                {
                  uint64_t v85 = [v56 countByEnumeratingWithState:&v172 objects:v200 count:16];
                  uint64_t v57 = v85;
                  if (v85) {
                    goto LABEL_89;
                  }
                  break;
                }
              }
            }
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
            id v135 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          }
        }
        uint64_t v136 = *(void *)(a1 + 56);
        if (v136) {
          v137 = *(void **)(v136 + 8);
        }
        else {
          v137 = 0;
        }
        id v138 = +[NSCKMirroredRelationship markRelationshipsForDeletedRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, (void *)[v137 allObjects], *(void *)(a1 + 32), *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
        v139 = v138;
        if (v138)
        {
          long long v170 = 0u;
          long long v171 = 0u;
          long long v168 = 0u;
          long long v169 = 0u;
          uint64_t v140 = [v138 countByEnumeratingWithState:&v168 objects:v199 count:16];
          if (v140)
          {
            uint64_t v141 = *(void *)v169;
LABEL_177:
            uint64_t v142 = 0;
            while (1)
            {
              if (*(void *)v169 != v141) {
                objc_enumerationMutation(v139);
              }
              v143 = *(void **)(*((void *)&v168 + 1) + 8 * v142);
              if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)))break; {
              uint64_t v144 = *(void *)(a1 + 56);
              }
              if (v144) {
                v145 = *(void **)(v144 + 8);
              }
              else {
                v145 = 0;
              }
              if (([v145 containsObject:v143] & 1) == 0) {
                -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v143, @"CDMR");
              }
              if (v140 == ++v142)
              {
                uint64_t v146 = [v139 countByEnumeratingWithState:&v168 objects:v199 count:16];
                uint64_t v140 = v146;
                if (v146) {
                  goto LABEL_177;
                }
                break;
              }
            }
          }
        }
        else
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
          id v147 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      id v86 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
  }
  else
  {
    v158 = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    && (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)) & 1) == 0)
  {
    int8x16_t v87 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
    -[NSFetchRequest setPredicate:](v87, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsShareUpdate = YES OR needsShareDelete = YES"]);
    [(NSFetchRequest *)v87 setPropertiesToFetch:&unk_1ED7E99B8];
    long long v88 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v87 error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
    long long v89 = v88;
    if (v88)
    {
      long long v166 = 0u;
      long long v167 = 0u;
      long long v164 = 0u;
      long long v165 = 0u;
      uint64_t v90 = [v88 countByEnumeratingWithState:&v164 objects:v198 count:16];
      if (v90)
      {
        uint64_t v91 = *(void *)v165;
        do
        {
          uint64_t v92 = 0;
          do
          {
            if (*(void *)v165 != v91) {
              objc_enumerationMutation(v89);
            }
            long long v93 = *(void **)(*((void *)&v164 + 1) + 8 * v92);
            long long v94 = (char *)-[NSCKRecordZoneMetadata createRecordZoneID](v93);
            if (![v93 encodedShareData])
            {
              uint64_t v95 = [NSString stringWithUTF8String:"Zone metadata is missing it's encoded share data but is marked for a mutation: %@ - %@"];
              _NSCoreDataLog(17, v95, v96, v97, v98, v99, v100, v101, (uint64_t)v94);
              uint64_t v102 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v195 = v94;
                __int16 v196 = 2112;
                v197 = v93;
                _os_log_fault_impl(&dword_18AB82000, v102, OS_LOG_TYPE_FAULT, "CoreData: Zone metadata is missing it's encoded share data but is marked for a mutation: %@ - %@", buf, 0x16u);
              }
            }
            uint64_t v103 = *(void *)(*(void *)(a1 + 40) + 8);
            if (v103 && (uint64_t v104 = *(void *)(v103 + 16)) != 0) {
              uint64_t v105 = *(void *)(v104 + 136);
            }
            else {
              uint64_t v105 = 0;
            }
            long long v106 = -[PFCloudKitArchivingUtilities shareFromEncodedData:inZoneWithID:error:](v105, (void *)[v93 encodedShareData], v94, (void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
            if (!v106)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
              id v117 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

              goto LABEL_149;
            }
            if ([v93 needsShareUpdate])
            {
              -[PFCloudKitOperationBatch addRecord:](*(void *)(a1 + 56), v106);
              if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)))goto LABEL_148; {
            }
              }
            else if ([v93 needsShareDelete])
            {
              -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), (void *)[v106 recordID], objc_msgSend(v106, "recordType"));
              if (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)))
              {
LABEL_148:

                goto LABEL_149;
              }
            }
            else
            {
              uint64_t v107 = [NSString stringWithUTF8String:"Fetched dirty zone that didn't need a share update or delete: %@"];
              _NSCoreDataLog(17, v107, v108, v109, v110, v111, v112, v113, (uint64_t)v93);
              v114 = __pflogFaultLog;
              if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v195 = (char *)v93;
                _os_log_fault_impl(&dword_18AB82000, v114, OS_LOG_TYPE_FAULT, "CoreData: Fetched dirty zone that didn't need a share update or delete: %@", buf, 0xCu);
              }
            }

            ++v92;
          }
          while (v90 != v92);
          uint64_t v115 = [v89 countByEnumeratingWithState:&v164 objects:v198 count:16];
          uint64_t v90 = v115;
        }
        while (v115);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      id v116 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
  }
LABEL_149:
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)
    && (-[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56)) & 1) == 0)
  {
    id v118 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath]);
    uint64_t v193 = *(void *)(a1 + 32);
    -[NSFetchRequest setAffectedStores:](v118, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v193 count:1]);
    uint64_t v119 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v119) {
      uint64_t v120 = *(void *)(v119 + 32);
    }
    else {
      uint64_t v120 = 0;
    }
    [(NSFetchRequest *)v118 setFetchLimit:v120];
    [(NSFetchRequest *)v118 setRelationshipKeyPathsForPrefetching:&unk_1ED7E99D0];
    -[NSFetchRequest setPredicate:](v118, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"(needsCloudDelete == 1) AND !(SELF IN %@)", *(void *)(a1 + 64)]);
    [(NSFetchRequest *)v118 setReturnsObjectsAsFaults:0];
    uint64_t v121 = (void *)[*(id *)(a1 + 48) executeFetchRequest:v118 error:*(void *)(*(void *)(a1 + 72) + 8) + 40];
    v122 = v121;
    if (v121)
    {
      long long v162 = 0u;
      long long v163 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      uint64_t v123 = [v121 countByEnumeratingWithState:&v160 objects:v192 count:16];
      if (v123)
      {
        uint64_t v124 = *(void *)v161;
LABEL_156:
        uint64_t v125 = 0;
        while (1)
        {
          if (*(void *)v161 != v124) {
            objc_enumerationMutation(v122);
          }
          v126 = *(void **)(*((void *)&v160 + 1) + 8 * v125);
          v127 = (void *)MEMORY[0x18C127630]();
          char v128 = -[PFCloudKitExportContext currentBatchExceedsThresholds:](*(void *)(a1 + 40), *(void *)(a1 + 56));
          if ((v128 & 1) == 0)
          {
            uint64_t v129 = (void *)[v126 createRecordIDForMovedRecord];
            v130 = -[NSCKRecordMetadata createObjectIDForLinkedRow]((void *)[v126 recordMetadata]);
            uint64_t v131 = +[PFCloudKitSerializer recordTypeForEntity:]((uint64_t)PFCloudKitSerializer, [v130 entity]);
            -[PFCloudKitOperationBatch addDeletedRecordID:forRecordOfType:](*(void *)(a1 + 56), v129, v131);
          }
          if (v128) {
            break;
          }
          if (v123 == ++v125)
          {
            uint64_t v123 = [v122 countByEnumeratingWithState:&v160 objects:v192 count:16];
            if (v123) {
              goto LABEL_156;
            }
            break;
          }
        }
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
      id v132 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
  {
    if ([*(id *)(a1 + 48) hasChanges])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 72) + 8) + 40];
      v133 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (v133) {
        id v134 = v133;
      }
    }
  }
}

- (uint64_t)currentBatchExceedsThresholds:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (a2)
    {
      uint64_t v4 = [*(id *)(a2 + 24) count];
      uint64_t v5 = [*(id *)(a2 + 8) count] + v4;
    }
    else
    {
      uint64_t v5 = 0;
    }
    unint64_t v6 = *(void *)(v3 + 8);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 32);
    }
    else {
      uint64_t v7 = 0;
    }
    if (v5 == v7) {
      return 1;
    }
    if (a2)
    {
      unint64_t v8 = *(void *)(a2 + 40);
      if (!v6) {
        return v8 >= v6;
      }
    }
    else
    {
      unint64_t v8 = 0;
      if (!v6) {
        return v8 >= v6;
      }
    }
    unint64_t v6 = *(void *)(v6 + 24);
    return v8 >= v6;
  }
  return result;
}

- (BOOL)checkForObjectsNeedingExportInStore:(id)a3 andReturnCount:(unint64_t *)a4 withManagedObjectContext:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v27 = 0;
  uint64_t v10 = (void *)+[NSCKRecordMetadata countRecordMetadataInStore:matchingPredicate:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, (uint64_t)a3, [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsUpload = YES"], (uint64_t)a5, &v27);
  if (v10)
  {
    uint64_t v11 = [v10 unsignedIntegerValue];
    id v12 = (void *)+[NSCKMirroredRelationship countMirroredRelationshipsInStore:matchingPredicate:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, (uint64_t)a3, [MEMORY[0x1E4F28F60] predicateWithFormat:@"isUploaded = NO"], (uint64_t)a5, &v27);
    if (v12)
    {
      uint64_t v13 = [v12 unsignedIntegerValue];
      uint64_t v14 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMetadata entityPath]);
      -[NSFetchRequest setPredicate:](v14, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsShareUpdate = YES OR needsShareDelete = YES"]);
      [(NSFetchRequest *)v14 setResultType:4];
      v33[0] = a3;
      -[NSFetchRequest setAffectedStores:](v14, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1]);
      if (a5)
      {
        uint64_t v15 = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v14, &v27);
        if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v15 = 0;
      }
      uint64_t v16 = +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", +[NSCKRecordZoneMoveReceipt entityPath]);
      -[NSFetchRequest setPredicate:](v16, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"needsCloudDelete = YES"]);
      [(NSFetchRequest *)v16 setResultType:4];
      id v32 = a3;
      -[NSFetchRequest setAffectedStores:](v16, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1]);
      if (a5)
      {
        uint64_t v17 = -[NSManagedObjectContext _countForFetchRequest_:error:]((uint64_t)a5, v16, &v27);
        if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_7;
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      *a4 = v13 + v11 + v15 + v17;
      LOBYTE(v17) = 1;
      return v17;
    }
  }
LABEL_7:
  if (!v27)
  {
    uint64_t v18 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog(17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
    uint64_t v25 = __pflogFaultLog;
    LODWORD(v17) = os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT);
    if (!v17) {
      return v17;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
    __int16 v30 = 1024;
    int v31 = 1092;
    _os_log_fault_impl(&dword_18AB82000, v25, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
LABEL_12:
    LOBYTE(v17) = 0;
    return v17;
  }
  if (!a6) {
    goto LABEL_12;
  }
  LOBYTE(v17) = 0;
  *a6 = v27;
  return v17;
}

- (BOOL)modifyRecordsOperationFinishedForStore:(uint64_t)a3 withSavedRecords:(uint64_t)a4 deletedRecordIDs:(uint64_t)a5 operationError:(void *)a6 managedObjectContext:(void *)a7 error:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  uint64_t v24 = __Block_byref_object_copy__50;
  uint64_t v25 = __Block_byref_object_dispose__50;
  uint64_t v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke;
  v20[3] = &unk_1E544F600;
  v20[4] = a3;
  v20[5] = a2;
  v20[9] = &v27;
  v20[10] = &v21;
  v20[6] = a6;
  v20[7] = a1;
  v20[8] = a4;
  [a6 performBlockAndWait:v20];
  if (!*((unsigned char *)v28 + 24))
  {
    id v10 = (id)v22[5];
    uint64_t v11 = v22[5];
    if (v11)
    {
      if (a7) {
        *a7 = v11;
      }
    }
    else
    {
      uint64_t v12 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m");
      uint64_t v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v32 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitExportContext.m";
        __int16 v33 = 1024;
        int v34 = 1312;
        _os_log_fault_impl(&dword_18AB82000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v22[5] = 0;
  BOOL v8 = *((unsigned char *)v28 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  return v8;
}

void __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke(uint64_t a1)
{
  uint64_t v140 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v104 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    id v105 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v101 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v127 objects:v139 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v128;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v128 != v4) {
            objc_enumerationMutation(v2);
          }
          unint64_t v6 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          char v7 = +[PFCloudKitSerializer isMirroredRelationshipRecordType:]((uint64_t)PFCloudKitSerializer, (void *)[v6 recordType]);
          BOOL v8 = v105;
          if ((v7 & 1) != 0
            || (id v9 = (void *)[v6 recordType],
                int v10 = [v9 isEqualToString:getCloudKitCKRecordTypeShare()],
                BOOL v8 = obj,
                v10))
          {
            [v8 addObject:v6];
          }
          else
          {
            objc_msgSend(v104, "setObject:forKey:", v6, objc_msgSend(v6, "recordID"));
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v127 objects:v139 count:16];
      }
      while (v3);
    }
    uint64_t v102 = (void *)+[NSCKRecordMetadata createMapOfMetadataMatchingRecords:andRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 32), MEMORY[0x1E4F1CBF0], *(void **)(a1 + 40), *(void **)(a1 + 48), (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
    if (!v102)
    {
      id v43 = (void *)MEMORY[0x18C127630]();
      uint64_t v44 = __ckLoggingOverride;
      uint64_t v45 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Failed to fetch record metadata for saved records: %@\n%@"];
      _NSCoreDataLog(v44 != 0, v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]_block_invoke");
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      id v52 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      goto LABEL_38;
    }
    long long v125 = 0u;
    long long v126 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    uint64_t v11 = (void *)[v104 allKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v123 objects:v138 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v124;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v124 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v123 + 1) + 8 * v14);
          uint64_t v16 = [v104 objectForKey:v15];
          uint64_t v17 = (void *)[v102 objectForKey:v15];
          if (!v16)
          {
            uint64_t v23 = (void *)MEMORY[0x18C127630](v17);
            uint64_t v24 = __ckLoggingOverride;
            uint64_t v25 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Can't find record for recordID '%@' even though it was supposedly saved in these records: %@"];
            _NSCoreDataLog(v24 != 0, v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]_block_invoke");
LABEL_28:
            goto LABEL_31;
          }
          uint64_t v18 = v17;
          if (!v17)
          {
            uint64_t v23 = (void *)MEMORY[0x18C127630]();
            uint64_t v32 = __ckLoggingOverride;
            uint64_t v33 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"%@: Can't find metadata for recordID '%@' even though it was supposedly saved in these records: %@"];
            _NSCoreDataLog(v32 != 0, v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[PFCloudKitExportContext modifyRecordsOperationFinishedForStore:withSavedRecords:deletedRecordIDs:operationError:managedObjectContext:error:]_block_invoke");
            goto LABEL_28;
          }
          [v17 setNeedsUpload:0];
          uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
          if (v19 && (uint64_t v20 = *(void *)(v19 + 16)) != 0) {
            uint64_t v21 = *(void *)(v20 + 136);
          }
          else {
            uint64_t v21 = 0;
          }
          id v22 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v21, v16, (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
          if (v22)
          {
            [v18 setEncodedRecord:v22];
          }
          else
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
            id v40 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          }

LABEL_31:
          ++v14;
        }
        while (v12 != v14);
        uint64_t v41 = [v11 countByEnumeratingWithState:&v123 objects:v138 count:16];
        uint64_t v12 = v41;
      }
      while (v41);
    }
LABEL_38:
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      long long v121 = 0u;
      long long v122 = 0u;
      long long v119 = 0u;
      long long v120 = 0u;
      uint64_t v53 = [obj countByEnumeratingWithState:&v119 objects:v137 count:16];
      if (v53)
      {
        uint64_t v54 = *(void *)v120;
        do
        {
          uint64_t v55 = 0;
          do
          {
            if (*(void *)v120 != v54) {
              objc_enumerationMutation(obj);
            }
            uint64_t v56 = *(void **)(*((void *)&v119 + 1) + 8 * v55);
            uint64_t v57 = objc_msgSend((id)objc_msgSend(v56, "recordID"), "zoneID");
            uint64_t v58 = *(void *)(*(void *)(a1 + 56) + 8);
            if (v58) {
              uint64_t v59 = *(void **)(v58 + 16);
            }
            else {
              uint64_t v59 = 0;
            }
            long long v60 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v57, [v59 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 80) + 8) + 40);
            if (v60)
            {
              uint64_t v61 = *(void *)(*(void *)(a1 + 56) + 8);
              if (v61
                && (uint64_t v62 = *(void *)(v61 + 16)) != 0
                && (uint64_t v63 = *(void *)(v62 + 136)) != 0
                && (id v64 = -[PFCloudKitArchivingUtilities encodeRecord:error:](v63, (uint64_t)v56, (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))) != 0)
              {
                [(NSManagedObject *)v60 setEncodedShareData:v64];
                [(NSManagedObject *)v60 setNeedsShareUpdate:0];
              }
              else
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
                id v66 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
                id v64 = 0;
              }
            }
            else
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
              id v65 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
            }
            ++v55;
          }
          while (v53 != v55);
          uint64_t v67 = [obj countByEnumeratingWithState:&v119 objects:v137 count:16];
          uint64_t v53 = v67;
        }
        while (v67);
      }
    }
    uint64_t v68 = *(void *)(a1 + 72);
    if (*(unsigned char *)(*(void *)(v68 + 8) + 24))
    {
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke_2;
      v118[3] = &unk_1E544F5D8;
      uint64_t v69 = *(void **)(a1 + 48);
      v118[4] = *(void *)(a1 + 56);
      BOOL v70 = +[NSCKMirroredRelationship updateMirroredRelationshipsMatchingRecords:forStore:withManagedObjectContext:usingBlock:error:]((uint64_t)NSCKMirroredRelationship, v105, *(void *)(a1 + 40), v69, (uint64_t)v118, (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
      uint64_t v68 = *(void *)(a1 + 72);
      if (!v70)
      {
        *(unsigned char *)(*(void *)(v68 + 8) + 24) = 0;
        id v71 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
        uint64_t v68 = *(void *)(a1 + 72);
      }
    }
    if (*(unsigned char *)(*(void *)(v68 + 8) + 24))
    {
      if ((+[NSCKMirroredRelationship purgeMirroredRelationshipsWithRecordIDs:fromStore:withManagedObjectContext:error:]((uint64_t)NSCKMirroredRelationship, *(void **)(a1 + 64), *(void *)(a1 + 40), *(void **)(a1 + 48), (void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)) & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        id v72 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      }
      uint64_t v68 = *(void *)(a1 + 72);
      if (*(unsigned char *)(*(void *)(v68 + 8) + 24))
      {
        char v73 = +[NSCKRecordMetadata purgeRecordMetadataWithRecordIDs:inStore:withManagedObjectContext:error:]((uint64_t)NSCKRecordMetadata, *(void **)(a1 + 64), *(void *)(a1 + 40), *(void **)(a1 + 48), (id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40));
        uint64_t v68 = *(void *)(a1 + 72);
        if ((v73 & 1) == 0)
        {
          *(unsigned char *)(*(void *)(v68 + 8) + 24) = 0;
          id v74 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
          uint64_t v68 = *(void *)(a1 + 72);
        }
      }
    }
    if (*(unsigned char *)(*(void *)(v68 + 8) + 24))
    {
      id v75 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      uint64_t v76 = *(void **)(a1 + 64);
      uint64_t v77 = [v76 countByEnumeratingWithState:&v114 objects:v136 count:16];
      if (v77)
      {
        uint64_t v78 = *(void *)v115;
        do
        {
          for (uint64_t j = 0; j != v77; ++j)
          {
            if (*(void *)v115 != v78) {
              objc_enumerationMutation(v76);
            }
            v80 = *(void **)(*((void *)&v114 + 1) + 8 * j);
            id v81 = (id)objc_msgSend(v75, "objectForKey:", objc_msgSend(v80, "zoneID"));
            if (!v81)
            {
              id v81 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
              objc_msgSend(v75, "setObject:forKey:", v81, objc_msgSend(v80, "zoneID"));
            }
            objc_msgSend(v81, "addObject:", objc_msgSend(v80, "recordName"));

            v82 = (void *)[v80 recordName];
            if ([v82 isEqualToString:getCloudKitCKRecordNameZoneWideShare()]) {
              [v101 addObject:v80];
            }
          }
          uint64_t v77 = [v76 countByEnumeratingWithState:&v114 objects:v136 count:16];
        }
        while (v77);
      }
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      uint64_t v83 = [v75 countByEnumeratingWithState:&v110 objects:v135 count:16];
      if (v83)
      {
        uint64_t v100 = *(void *)v111;
        while (2)
        {
          uint64_t v99 = v83;
          for (uint64_t k = 0; k != v99; ++k)
          {
            if (*(void *)v111 != v100) {
              objc_enumerationMutation(v75);
            }
            uint64_t v85 = *(void **)(*((void *)&v110 + 1) + 8 * k);
            id v86 = (id)[v75 objectForKey:v85];
            int8x16_t v87 = [[NSBatchUpdateRequest alloc] initWithEntityName:+[NSCKRecordZoneMoveReceipt entityPath]];
            -[NSBatchUpdateRequest setPredicate:](v87, "setPredicate:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"zoneName = %@ AND ownerName = %@ AND recordName in %@", objc_msgSend(v85, "zoneName"), objc_msgSend(v85, "ownerName"), v86]);
            uint64_t v134 = *(void *)(a1 + 40);
            -[NSPersistentStoreRequest setAffectedStores:](v87, "setAffectedStores:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v134 count:1]);
            id v132 = @"needsCloudDelete";
            uint64_t v133 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC28]];
            -[NSBatchUpdateRequest setPropertiesToUpdate:](v87, "setPropertiesToUpdate:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v133 forKeys:&v132 count:1]);
            [(NSBatchUpdateRequest *)v87 setResultType:0];
            if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "executeRequest:error:", v87, *(void *)(*(void *)(a1 + 80) + 8) + 40), "result"), "BOOLValue") & 1) == 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
              id v88 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
              goto LABEL_90;
            }
          }
          uint64_t v83 = [v75 countByEnumeratingWithState:&v110 objects:v135 count:16];
          if (v83) {
            continue;
          }
          break;
        }
      }
      id v86 = 0;
      int8x16_t v87 = 0;
LABEL_90:
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      uint64_t v89 = [v101 countByEnumeratingWithState:&v106 objects:v131 count:16];
      if (v89)
      {
        uint64_t v90 = *(void *)v107;
        do
        {
          uint64_t v91 = 0;
          do
          {
            if (*(void *)v107 != v90) {
              objc_enumerationMutation(v101);
            }
            uint64_t v92 = (void *)[*(id *)(*((void *)&v106 + 1) + 8 * v91) zoneID];
            uint64_t v93 = *(void *)(*(void *)(a1 + 56) + 8);
            if (v93) {
              long long v94 = *(void **)(v93 + 16);
            }
            else {
              long long v94 = 0;
            }
            uint64_t v95 = +[NSCKRecordZoneMetadata zoneMetadataForZoneID:inDatabaseWithScope:forStore:inContext:error:]((uint64_t)NSCKRecordZoneMetadata, v92, [v94 databaseScope], *(void *)(a1 + 40), *(void **)(a1 + 48), *(void *)(*(void *)(a1 + 80) + 8) + 40);
            if (!v95)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
              id v97 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
              goto LABEL_104;
            }
            [(NSManagedObject *)v95 setNeedsShareDelete:0];
            ++v91;
          }
          while (v89 != v91);
          uint64_t v96 = [v101 countByEnumeratingWithState:&v106 objects:v131 count:16];
          uint64_t v89 = v96;
        }
        while (v96);
      }
LABEL_104:
      if (([*(id *)(a1 + 48) save:*(void *)(*(void *)(a1 + 80) + 8) + 40] & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
        id v98 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      }
    }
    char v42 = v105;
  }
  else
  {
    uint64_t v102 = 0;
    id obj = 0;
    id v101 = 0;
    char v42 = 0;
    uint64_t v104 = 0;
  }
}

uint64_t __142__PFCloudKitExportContext_modifyRecordsOperationFinishedForStore_withSavedRecords_deletedRecordIDs_operationError_managedObjectContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  [a2 setIsUploaded:MEMORY[0x1E4F1CC38]];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v6 && (uint64_t v7 = *(void *)(v6 + 16)) != 0) {
    uint64_t v8 = *(void *)(v7 + 136);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = -[PFCloudKitArchivingUtilities newArchivedDataForSystemFieldsOfRecord:](v8, a3);
  [a2 setCkRecordSystemFields:v9];

  return 1;
}

@end