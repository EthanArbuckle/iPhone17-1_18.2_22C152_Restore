@interface CCSetVersionedMergeable
- (BOOL)mergeDelta:(id)a3 fromDevice:(id)a4;
- (BOOL)mergeDeltas:(id)a3 error:(id *)a4;
- (CCSetVersionedMergeable)initWithSet:(id)a3 readAccess:(id)a4 donateServiceProvider:(id)a5 mergeableDeltasFileURL:(id)a6;
- (id)mergeableDeltaAfterStateVector:(id)a3 atomBatchVersion:(unsigned __int8)a4;
- (id)mergeableDeltasForMetadata:(id)a3 atomBatchVersion:(unsigned __int8)a4 error:(id *)a5;
- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4;
- (id)stateVector;
- (void)stateVector;
@end

@implementation CCSetVersionedMergeable

- (CCSetVersionedMergeable)initWithSet:(id)a3 readAccess:(id)a4 donateServiceProvider:(id)a5 mergeableDeltasFileURL:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CCSetVersionedMergeable;
  v15 = [(CCSetVersionedMergeable *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_set, a3);
    uint64_t v17 = [objc_alloc(MEMORY[0x263F316F0]) initWithDatabaseAccess:v12];
    stateReader = v16->_stateReader;
    v16->_stateReader = (CCDatabaseSetStateReader *)v17;

    objc_storeStrong((id *)&v16->_donateServiceProvider, a5);
    uint64_t v19 = [v11 encodedDescriptors];
    encodedSetDescriptors = v16->_encodedSetDescriptors;
    v16->_encodedSetDescriptors = (NSString *)v19;

    objc_storeStrong((id *)&v16->_mergeableDeltasFileURL, a6);
  }

  return v16;
}

- (id)mergeableDeltaAfterStateVector:(id)a3 atomBatchVersion:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!v6) {
    id v6 = (id)objc_opt_new();
  }
  v7 = [(CCSetVersionedMergeable *)self stateVector];
  v8 = (void *)[v6 mutableCopy];
  v9 = [v7 clockVector];
  [v8 intersectVector:v9];

  v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v16 = [(CCSetVersionedMergeable *)self description];
    *(_DWORD *)buf = 138412802;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = v16;
    _os_log_debug_impl(&dword_249B69000, v10, OS_LOG_TYPE_DEBUG, "remote stateVector %@, interestected stateVector %@, %@", buf, 0x20u);
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263EFD728]) initWithPreviousStateVector:v8 currentStateVector:v7];
  id v12 = (void *)[objc_alloc(MEMORY[0x263EFD720]) initWithVectors:v11];
  uint64_t v17 = 0;
  id v13 = [(CCSetVersionedMergeable *)self mergeableDeltasForMetadata:v12 atomBatchVersion:v4 error:&v17];
  id v14 = [v13 firstObject];

  return v14;
}

- (BOOL)mergeDelta:(id)a3 fromDevice:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke;
  v34[3] = &unk_265278288;
  v37 = &v38;
  id v9 = v6;
  id v35 = v9;
  v10 = v8;
  v36 = v10;
  id v11 = (void *)MEMORY[0x24C5B0C10](v34);
  id v12 = (void *)MEMORY[0x263F317A0];
  uint64_t v13 = [(CCSet *)self->_set itemType];
  id v14 = [(CCSet *)self->_set descriptors];
  donateServiceProvider = self->_donateServiceProvider;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_6;
  v31[3] = &unk_2652782B0;
  v31[4] = self;
  id v16 = v11;
  id v33 = v16;
  id v17 = v9;
  id v32 = v17;
  [v12 remoteCRDTSetDonationWithItemType:v13 forAccount:0 fromDevice:v7 descriptors:v14 serviceProvider:donateServiceProvider completion:v31];

  dispatch_time_t v18 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v10, v18))
  {
    id v19 = __biome_log_for_category();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[CCSetVersionedMergeable mergeDelta:fromDevice:](v19, v20, v21, v22, v23, v24, v25, v26);
    }

    BOOL v27 = 0;
  }
  else
  {
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      set = self->_set;
      *(_DWORD *)buf = 138412546;
      v43 = set;
      __int16 v44 = 2112;
      id v45 = v7;
      _os_log_impl(&dword_249B69000, v28, OS_LOG_TYPE_DEFAULT, "Completed merge of atom batch for set %@ from device %@", buf, 0x16u);
    }

    BOOL v27 = *((unsigned char *)v39 + 24) != 0;
  }

  _Block_object_dispose(&v38, 8);
  return v27;
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [*(id *)(a1 + 32) fileURL];
  id v7 = 0;
  [v3 removeItemAtURL:v4 error:&v7];
  id v5 = v7;

  if (v5)
  {
    id v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_cold_1((id *)(a1 + 32), (uint64_t)v5, v6);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_6_cold_2(a1);
    }

    goto LABEL_8;
  }
  if (([v5 mergeDelta:*(void *)(a1 + 40)] & 1) == 0)
  {
LABEL_8:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_9;
  }
  id v12 = 0;
  char v8 = [v5 finish:&v12];
  id v9 = v12;
  if (v8)
  {
    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_6_cold_1(a1);
    }

    v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();

LABEL_9:
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (1)
    {
      if (*(void *)v10 != v7) {
        objc_enumerationMutation(v4);
      }
      if (!--v6)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (!v6) {
          break;
        }
      }
    }
  }

  return 1;
}

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  return [(CCSetVersionedMergeable *)self mergeableDeltasForMetadata:a3 atomBatchVersion:3 error:a4];
}

- (id)mergeableDeltasForMetadata:(id)a3 atomBatchVersion:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v5 = a4;
  v64[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  char v8 = [v7 vectors];
  long long v9 = [v8 contents];
  uint64_t v10 = [v9 timestampCount];

  if (!v10)
  {
    long long v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:].cold.4((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  cachedDeviceMapping = self->_cachedDeviceMapping;
  if (cachedDeviceMapping)
  {
    id v19 = cachedDeviceMapping;
    id v20 = 0;
  }
  else
  {
    stateReader = self->_stateReader;
    id v63 = 0;
    id v19 = [(CCDatabaseSetStateReader *)stateReader constructDeviceMapping:&v63];
    id v20 = v63;
  }
  uint64_t v22 = self->_cachedDeviceMapping;
  self->_cachedDeviceMapping = v19;

  if (self->_cachedDeviceMapping)
  {
    id v23 = objc_alloc(MEMORY[0x263EFD730]);
    uint64_t v24 = NSString;
    uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[CCSet itemType](self->_set, "itemType"));
    uint64_t v26 = [v24 stringWithFormat:@"(%@,%@)", v25, self->_encodedSetDescriptors];
    uint64_t v27 = [v23 initWithName:v26];

    id v28 = objc_alloc(MEMORY[0x263F327E8]);
    LOBYTE(v25) = objc_opt_respondsToSelector();

    if (v25)
    {
      mergeableDeltasFileURL = self->_mergeableDeltasFileURL;
      v30 = NSString;
      v31 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[CCSet itemType](self->_set, "itemType"));
      id v32 = [MEMORY[0x263F08C38] UUID];
      id v33 = [v32 UUIDString];
      v34 = [v30 stringWithFormat:@"%@-%@.batch", v31, v33];
      [(NSURL *)mergeableDeltasFileURL URLByAppendingPathComponent:v34];
      v36 = id v35 = (void *)v27;

      v37 = v35;
      uint64_t v38 = (void *)[objc_alloc(MEMORY[0x263F327E8]) initWriterWithMergeableValueID:v35 metadata:v7 formatVersion:v5 fileURL:v36 error:0];
    }
    else
    {
      v37 = (void *)v27;
      uint64_t v38 = (void *)[objc_alloc(MEMORY[0x263F327E8]) initWriterWithMergeableValueID:v27 metadata:v7 formatVersion:v5 error:0];
    }
    v47 = self->_stateReader;
    v48 = [v7 vectors];
    v49 = [v48 contents];
    v50 = self->_cachedDeviceMapping;
    id v62 = v20;
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke;
    v60[3] = &unk_265278300;
    v60[4] = self;
    id v51 = v38;
    id v61 = v51;
    [(CCDatabaseSetStateReader *)v47 enumerateProvenanceRecordsForStateVector:v49 withType:0 selectAtomsInState:1 skipOverAtomsInState:2 deviceMapping:v50 error:&v62 usingBlock:v60];
    id v52 = v62;

    id v59 = v52;
    [v51 finishWritingWithError:&v59];
    id v20 = v59;

    if (v51)
    {
      id v58 = 0;
      v53 = (void *)[objc_alloc(MEMORY[0x263EFD718]) initWithAtomBatch:v51 error:&v58];
      id v54 = v58;
      if (v54)
      {
        v55 = __biome_log_for_category();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
          -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:]((uint64_t)v51);
        }

        CCSetError();
        uint64_t v46 = (void *)MEMORY[0x263EFFA68];
      }
      else
      {
        v64[0] = v53;
        uint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:1];
      }
    }
    else
    {
      v56 = __biome_log_for_category();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:]((uint64_t)v20, v56);
      }

      CCSetError();
      uint64_t v46 = 0;
    }
  }
  else
  {
    v39 = __biome_log_for_category();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[CCSetVersionedMergeable mergeableDeltasForMetadata:atomBatchVersion:error:]((uint64_t)v20, v39, v40, v41, v42, v43, v44, v45);
    }

    CCSetError();
    uint64_t v46 = 0;
  }

  return v46;
}

void __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v5 = [v3 deviceRowId];
  uint64_t v6 = [v4 siteIdentifierForDeviceRowId:v5];

  id v7 = [v3 contentSequenceNumber];
  char v8 = *(void **)(*(void *)(a1 + 32) + 24);
  long long v9 = [v3 contentHash];
  uint64_t v10 = [v8 fetchContentRecordFromContentHash:v9];

  long long v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = [v3 contentHash];
    uint64_t v17 = NSNumber;
    dispatch_time_t v18 = [v10 content];
    id v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "length"));
    *(_DWORD *)buf = 138413058;
    uint64_t v25 = v6;
    __int16 v26 = 2112;
    uint64_t v27 = v7;
    __int16 v28 = 2112;
    v29 = v16;
    __int16 v30 = 2112;
    v31 = v19;
    _os_log_debug_impl(&dword_249B69000, v11, OS_LOG_TYPE_DEBUG, "appending atom with dot %@::%@ contentHash %@ size %@", buf, 0x2Au);
  }
  uint64_t v12 = *(void **)(a1 + 40);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke_19;
  v20[3] = &unk_2652782D8;
  id v21 = v6;
  id v22 = v7;
  id v23 = v10;
  id v13 = v10;
  id v14 = v7;
  id v15 = v6;
  [v12 appendAtomWithBlock:v20];
}

void __77__CCSetVersionedMergeable_mergeableDeltasForMetadata_atomBatchVersion_error___block_invoke_19(id *a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 timestamp];
  id v4 = [v3 distributedSiteIdentifier];
  uint64_t v5 = [a1[4] identifier];
  [v4 setIdentifier:v5];

  uint64_t v6 = [v8 timestamp];
  objc_msgSend(v6, "setClock:", objc_msgSend(a1[5], "unsignedIntegerValue"));

  id v7 = [a1[6] content];
  [v8 setValue:v7];

  [v8 setVersion:1];
}

- (id)stateVector
{
  stateReader = self->_stateReader;
  id v22 = 0;
  id v23 = 0;
  id v21 = 0;
  char v4 = [(CCDatabaseSetStateReader *)stateReader constructStateVectorsFromDatabaseOutContent:&v23 outMetaContent:0 outDeviceMapping:&v22 error:&v21];
  id v5 = v23;
  id v6 = v22;
  id v7 = v22;
  id v8 = v21;
  if (v4)
  {
    objc_storeStrong((id *)&self->_cachedDeviceMapping, v6);
    id v9 = v5;
  }
  else
  {
    uint64_t v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(CCSetVersionedMergeable *)(uint64_t)v8 stateVector];
    }

    uint64_t v25 = 0;
    __int16 v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v17 = (void *)getCKDistributedTimestampStateVectorClass_softClass;
    uint64_t v28 = getCKDistributedTimestampStateVectorClass_softClass;
    if (!getCKDistributedTimestampStateVectorClass_softClass)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __getCKDistributedTimestampStateVectorClass_block_invoke;
      v24[3] = &unk_265278328;
      v24[4] = &v25;
      __getCKDistributedTimestampStateVectorClass_block_invoke((uint64_t)v24);
      uint64_t v17 = (void *)v26[3];
    }
    dispatch_time_t v18 = v17;
    _Block_object_dispose(&v25, 8);
    id v9 = objc_alloc_init(v18);
  }
  id v19 = v9;

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mergeableDeltasFileURL, 0);
  objc_storeStrong((id *)&self->_cachedDeviceMapping, 0);
  objc_storeStrong((id *)&self->_donateServiceProvider, 0);
  objc_storeStrong((id *)&self->_stateReader, 0);
  objc_storeStrong((id *)&self->_encodedSetDescriptors, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

- (void)mergeDelta:(uint64_t)a3 fromDevice:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_249B69000, a1, a3, "Timed out waiting for asynchronous donate operation. timeout=%@ seconds", a5, a6, a7, a8, 2u);
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*a1 fileURL];
  int v6 = 138412546;
  id v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_249B69000, a3, OS_LOG_TYPE_ERROR, "Failed to delete mergeable delta at URL %@ with error %@", (uint8_t *)&v6, 0x16u);
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_6_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(a1 + 32) + 8);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v1, v2, "Remote CRDT commit rejected for set: %@ error: %@ ", (void)v3, DWORD2(v3));
}

void __49__CCSetVersionedMergeable_mergeDelta_fromDevice___block_invoke_6_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(a1 + 32) + 8);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v1, v2, "Remote CRDT merge rejected for set: %@ error: %@ ", (void)v3, DWORD2(v3));
}

- (void)mergeableDeltasForMetadata:(uint64_t)a3 atomBatchVersion:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)mergeableDeltasForMetadata:(uint64_t)a1 atomBatchVersion:(NSObject *)a2 error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = 0;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_249B69000, a2, OS_LOG_TYPE_ERROR, "failed to finish writing atom batch %@ with error %@", (uint8_t *)&v2, 0x16u);
}

- (void)mergeableDeltasForMetadata:(uint64_t)a1 atomBatchVersion:error:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_8_0(&dword_249B69000, v1, v2, "unable to init a CKMergeableDelta with initWithAtomBatch:%@ error:%@", (void)v3, DWORD2(v3));
}

- (void)mergeableDeltasForMetadata:(uint64_t)a3 atomBatchVersion:(uint64_t)a4 error:(uint64_t)a5 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stateVector
{
}

@end