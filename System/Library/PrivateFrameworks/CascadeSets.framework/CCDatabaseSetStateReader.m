@interface CCDatabaseSetStateReader
+ (id)persistedKeyValueForKey:(id)a3 database:(id)a4 error:(id *)a5;
- (BOOL)_enumerateProvenanceRecordsFromCommand:(id)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)constructStateVectorsFromDatabaseOutContent:(id *)a3 outMetaContent:(id *)a4 outDeviceMapping:(id *)a5 error:(id *)a6;
- (BOOL)enumerateProvenanceRecordsForStateVector:(id)a3 withType:(unsigned __int8)a4 selectAtomsInState:(unsigned __int8)a5 skipOverAtomsInState:(unsigned __int8)a6 deviceMapping:(id)a7 error:(id *)a8 usingBlock:(id)a9;
- (CCDatabaseSetStateReader)initWithDatabaseAccess:(id)a3;
- (id)_createProvenanceSelectCommandFromDeviceRowIdToClockValues:(id)a3 type:(unsigned __int8)a4 state:(unsigned __int8)a5 columns:(id)a6;
- (id)constructDeviceMapping:(id *)a3;
- (id)fetchContentRecordFromContentHash:(id)a3;
- (id)itemInstanceCount:(id *)a3;
- (id)lastDeltaDate:(id *)a3;
- (id)localDeviceIdentifier:(id *)a3;
- (id)provenanceRecordEnumeratorForContentDeltaVector:(id)a3 metaContentDeltaVector:(id)a4 seenContentBuilder:(id)a5 seenMetaContentBuilder:(id)a6 deviceMapping:(id)a7 error:(id *)a8;
- (id)resourceVersion:(id *)a3;
- (id)sharedItemCount:(id *)a3;
- (void)_resolveSequenceNumberRangesOfDeltaVector:(id)a3 appendToCriteria:(id)a4 seenStateVectorBuilder:(id)a5 deviceMapping:(id)a6 type:(unsigned __int8)a7;
@end

@implementation CCDatabaseSetStateReader

uint64_t __67__CCDatabaseSetStateReader_persistedKeyValueForKey_database_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  return 1;
}

+ (id)persistedKeyValueForKey:(id)a3 database:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[CCDatabaseSelect builderWithTableName:@"keyvalue"];
  v10 = +[CCSQLCommandCriterion criterionWithColumnName:@"key" EQUALSColumnValue:v7];
  [v9 setCommandCriterion:v10];
  v11 = [v9 build];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  uint64_t v12 = objc_opt_class();
  v19[4] = &v21;
  id v20 = 0;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __67__CCDatabaseSetStateReader_persistedKeyValueForKey_database_error___block_invoke;
  v19[3] = &unk_26527A070;
  char v13 = [v8 enumerateRecordResultsOfSelect:v11 recordClass:v12 error:&v20 usingBlock:v19];
  id v14 = v20;
  if (v14) {
    char v15 = 0;
  }
  else {
    char v15 = v13;
  }
  if (v15)
  {
    id v16 = (id)v22[5];
  }
  else
  {
    v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[CCDatabaseSetStateReader persistedKeyValueForKey:database:error:]();
    }

    CCSetError(a5, v14);
    id v16 = 0;
  }

  _Block_object_dispose(&v21, 8);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandCache, 0);

  objc_storeStrong((id *)&self->_databaseAccess, 0);
}

- (CCDatabaseSetStateReader)initWithDatabaseAccess:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CCDatabaseSetStateReader;
  v6 = [(CCDatabaseSetStateReader *)&v13 init];
  id v7 = v6;
  if (!v6) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v6->_databaseAccess, a3);
  if (v7->_databaseAccess)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
    commandCache = v7->_commandCache;
    v7->_commandCache = (NSMutableDictionary *)v8;

LABEL_4:
    v10 = v7;
    goto LABEL_8;
  }
  v11 = __biome_log_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetStateReader initWithDatabaseAccess:](v11);
  }

  v10 = 0;
LABEL_8:

  return v10;
}

- (BOOL)constructStateVectorsFromDatabaseOutContent:(id *)a3 outMetaContent:(id *)a4 outDeviceMapping:(id *)a5 error:(id *)a6
{
  v11 = [(CCDatabaseSetStateReader *)self constructDeviceMapping:a6];
  if (v11)
  {
    if (a3) {
      uint64_t v12 = [[CCDatabaseSetStateVectorBuilder alloc] initWithDeviceMapping:v11 missingAtomsImplied:1];
    }
    else {
      uint64_t v12 = 0;
    }
    v22 = a4;
    uint64_t v23 = a5;
    if (a4) {
      id v14 = [[CCDatabaseSetStateVectorBuilder alloc] initWithDeviceMapping:v11 missingAtomsImplied:1];
    }
    else {
      id v14 = 0;
    }
    char v15 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
    id v16 = [v15 build];
    v17 = (void *)MEMORY[0x24C5B1100]();
    id v27 = 0;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __110__CCDatabaseSetStateReader_constructStateVectorsFromDatabaseOutContent_outMetaContent_outDeviceMapping_error___block_invoke;
    v24[3] = &unk_265279FD0;
    v18 = v12;
    v25 = v18;
    v19 = v14;
    id v26 = v19;
    BOOL v13 = [(CCDatabaseSetStateReader *)self _enumerateProvenanceRecordsFromCommand:v16 error:&v27 usingBlock:v24];
    id v20 = v27;

    if (v13)
    {
      if (a3)
      {
        *a3 = [(CCDatabaseSetStateVectorBuilder *)v18 build];
      }
      if (v22)
      {
        id *v22 = [(CCDatabaseSetStateVectorBuilder *)v19 build];
      }
      if (v23) {
        *uint64_t v23 = v11;
      }
    }
    else
    {
      CCSetError(a6, v20);
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void __110__CCDatabaseSetStateReader_constructStateVectorsFromDatabaseOutContent_outMetaContent_outDeviceMapping_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v23 = v3;
  if (*(void *)(a1 + 32))
  {
    v4 = [v3 contentSequenceNumber];
    id v5 = [v23 contentSequenceNumberEndOfRun];
    uint64_t v6 = CCDatabaseSetClockValueRange(v4, v5);
    uint64_t v8 = v7;

    v9 = [v23 contentState];
    uint64_t v10 = CCDatabaseSetAtomState(v9);

    v11 = *(void **)(a1 + 32);
    uint64_t v12 = [v23 deviceRowId];
    objc_msgSend(v11, "addClockValueRange:withAtomState:forDeviceRowId:", v6, v8, v10, v12);

    id v3 = v23;
  }
  if (*(void *)(a1 + 40))
  {
    BOOL v13 = [v23 metaContentSequenceNumber];

    id v3 = v23;
    if (v13)
    {
      id v14 = [v23 metaContentSequenceNumber];
      char v15 = [v23 metaContentSequenceNumberEndOfRun];
      uint64_t v16 = CCDatabaseSetClockValueRange(v14, v15);
      uint64_t v18 = v17;

      v19 = [v23 metaContentState];
      uint64_t v20 = CCDatabaseSetAtomState(v19);

      uint64_t v21 = *(void **)(a1 + 40);
      v22 = [v23 deviceRowId];
      objc_msgSend(v21, "addClockValueRange:withAtomState:forDeviceRowId:", v16, v18, v20, v22);

      id v3 = v23;
    }
  }
}

- (BOOL)enumerateProvenanceRecordsForStateVector:(id)a3 withType:(unsigned __int8)a4 selectAtomsInState:(unsigned __int8)a5 skipOverAtomsInState:(unsigned __int8)a6 deviceMapping:(id)a7 error:(id *)a8 usingBlock:(id)a9
{
  unsigned int v34 = a5;
  unsigned int v31 = a4;
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v35 = a7;
  id v32 = a9;
  v36 = v11;
  uint64_t v12 = [v11 clockVector];
  uint64_t v13 = [v12 timestampCount];

  if (v13)
  {
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    uint64_t v56 = 0;
    v33 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = [v36 allSiteIdentifiers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v50 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v19 = [v35 deviceRowIdForSiteIdentifier:v18];
          uint64_t v20 = objc_opt_new();
          v44[0] = MEMORY[0x263EF8330];
          v44[1] = 3221225472;
          v44[2] = __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke;
          v44[3] = &unk_265279FF8;
          char v47 = v34;
          unsigned __int8 v48 = a6;
          id v21 = v20;
          id v45 = v21;
          v46 = &v53;
          [v36 enumerateClockValuesForSiteIdentifier:v18 usingBlock:v44];
          [v33 setObject:v21 forKeyedSubscript:v19];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v15);
    }

    if ((unint64_t)v54[3] < 0x1F5)
    {
      id v24 = v33;
      v25 = (void *)MEMORY[0x24C5B1320](v32);
    }
    else
    {
      v22 = objc_opt_new();
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_5;
      v42[3] = &unk_26527A020;
      id v23 = v22;
      id v43 = v23;
      [v33 enumerateKeysAndObjectsUsingBlock:v42];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2;
      v37[3] = &unk_26527A048;
      id v38 = v33;
      char v40 = v31;
      char v41 = v34;
      id v39 = v32;
      id v24 = v23;
      v25 = (void *)MEMORY[0x24C5B1320](v37);
    }
    id v27 = [(CCDatabaseSetStateReader *)self _createProvenanceSelectCommandFromDeviceRowIdToClockValues:v24 type:v31 state:v34 columns:0];
    if (v27) {
      BOOL v26 = [(CCDatabaseSetStateReader *)self _enumerateProvenanceRecordsFromCommand:v27 error:a8 usingBlock:v25];
    }
    else {
      BOOL v26 = 0;
    }

    _Block_object_dispose(&v53, 8);
  }
  else
  {
    BOOL v26 = 1;
  }

  return v26;
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (*(unsigned __int8 *)(a1 + 48) == a5 || *(unsigned __int8 *)(a1 + 49) == a5)
  {
    objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", a2, a3);
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v10 = *(unsigned __int8 *)(a1 + 48);
      int v11 = 134218752;
      uint64_t v12 = a2;
      __int16 v13 = 2048;
      uint64_t v14 = a2 + a3;
      __int16 v15 = 1024;
      int v16 = a5;
      __int16 v17 = 1024;
      int v18 = v10;
      _os_log_debug_impl(&dword_249B92000, v9, OS_LOG_TYPE_DEBUG, "Enumerating clock value (%lu - %lu) which is in state %u when expecting to enumerate clock values in state %u", (uint8_t *)&v11, 0x22u);
    }
  }
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_new();
  if ([v5 count]) {
    objc_msgSend(v6, "addIndexesInRange:", objc_msgSend(v5, "firstIndex"), objc_msgSend(v5, "lastIndex") - objc_msgSend(v5, "firstIndex") + 1);
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 deviceRowId];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (*(unsigned char *)(a1 + 48) == 1)
  {
    id v7 = [v3 metaContentState];
    uint64_t v8 = [v3 metaContentSequenceNumber];
    v9 = [v3 metaContentSequenceNumberEndOfRun];
  }
  else
  {
    if (*(unsigned char *)(a1 + 48))
    {
      __int16 v15 = __biome_log_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2_cold_1(a1 + 48, v15, v16, v17, v18, v19, v20, v21);
      }

      id v7 = 0;
      goto LABEL_16;
    }
    id v7 = [v3 contentState];
    uint64_t v8 = [v3 contentSequenceNumber];
    v9 = [v3 contentSequenceNumberEndOfRun];
  }
  int v10 = v9;
  uint64_t v11 = CCDatabaseSetClockValueRange(v8, v9);
  uint64_t v13 = v12;

  int v14 = *(unsigned __int8 *)(a1 + 49);
  if (v14 != 2)
  {
    if (v14 != 1
      || [v7 unsignedIntValue] != 1
      || (objc_msgSend(v6, "containsIndexesInRange:", v11, v13) & 1) == 0)
    {
      goto LABEL_16;
    }
LABEL_15:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if ([v7 unsignedIntValue] == 2
    && objc_msgSend(v6, "intersectsIndexesInRange:", v11, v13))
  {
    goto LABEL_15;
  }
LABEL_16:
}

- (id)constructDeviceMapping:(id *)a3
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = +[CCDatabaseSelect builderWithTableName:@"device"];
  uint64_t v6 = [v5 build];
  databaseAccess = self->_databaseAccess;
  uint64_t v8 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__CCDatabaseSetStateReader_constructDeviceMapping___block_invoke;
  v12[3] = &unk_26527A070;
  v12[4] = &v13;
  if ([(CCDatabaseReadOnlyAccess *)databaseAccess enumerateRecordResultsOfSelect:v6 recordClass:v8 error:a3 usingBlock:v12])
  {
    v9 = [CCDatabaseDeviceMapping alloc];
    int v10 = [(CCDatabaseDeviceMapping *)v9 initWithDeviceRecords:v14[5]];
  }
  else
  {
    int v10 = 0;
  }

  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __51__CCDatabaseSetStateReader_constructDeviceMapping___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

- (id)fetchContentRecordFromContentHash:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  uint64_t v6 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD460];
  if ([v6 updateParameters:v5])
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = +[CCDatabaseSelect builderWithTableName:@"content"];
    v9 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_hash" EQUALSColumnValue:v4];
    [v8 setCommandCriterion:v9];
    id v7 = [v8 build];

    if (v7)
    {
      [(NSMutableDictionary *)self->_commandCache setObject:v7 forKey:&unk_26FDCD460];
    }
    else
    {
      int v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:]();
      }
    }
  }
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__0;
  id v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  databaseAccess = self->_databaseAccess;
  uint64_t v12 = objc_opt_class();
  v18[4] = &v20;
  id v19 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __62__CCDatabaseSetStateReader_fetchContentRecordFromContentHash___block_invoke;
  v18[3] = &unk_26527A070;
  char v13 = [(CCDatabaseReadOnlyAccess *)databaseAccess enumerateRecordResultsOfSelect:v7 recordClass:v12 error:&v19 usingBlock:v18];
  id v14 = v19;
  if (v13)
  {
    id v15 = (id)v21[5];
  }
  else
  {
    uint64_t v16 = __biome_log_for_category();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:]();
    }

    id v15 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v15;
}

uint64_t __62__CCDatabaseSetStateReader_fetchContentRecordFromContentHash___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  return 1;
}

- (BOOL)_enumerateProvenanceRecordsFromCommand:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, unsigned char *))a5;
  int v10 = [(CCDatabaseReadOnlyAccess *)self->_databaseAccess enumeratorForRowResultsOfSelect:v8 error:a4];
  uint64_t v11 = v10;
  if (v10)
  {
    char v21 = 0;
    uint64_t v12 = [v10 next];
    if (v12)
    {
      char v13 = (void *)v12;
      while (1)
      {
        id v14 = (void *)MEMORY[0x24C5B1100]();
        id v15 = [(id)objc_opt_class() recordFromDatabaseValueRow:v13];
        if (v15)
        {
          v9[2](v9, v15, &v21);
          if (v21) {
            break;
          }
        }

        uint64_t v16 = [v11 next];

        char v13 = (void *)v16;
        if (!v16) {
          goto LABEL_10;
        }
      }
    }
LABEL_10:
    id v18 = [v11 error];

    BOOL v17 = v18 == 0;
    if (v18)
    {
      id v19 = [v11 error];
      CCSetError(a4, v19);
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (id)provenanceRecordEnumeratorForContentDeltaVector:(id)a3 metaContentDeltaVector:(id)a4 seenContentBuilder:(id)a5 seenMetaContentBuilder:(id)a6 deviceMapping:(id)a7 error:(id *)a8
{
  v63[3] = *MEMORY[0x263EF8340];
  id v12 = a7;
  id v52 = a6;
  id v49 = a5;
  id v50 = a4;
  id v13 = a3;
  id v14 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
  id v15 = [NSString stringWithFormat:@"%@.%@", @"provenance", @"*"];
  v63[0] = v15;
  uint64_t v16 = [NSString stringWithFormat:@"%@.%@", @"content", @"content"];
  v63[1] = v16;
  BOOL v17 = [NSString stringWithFormat:@"%@.%@", @"metacontent", @"metacontent"];
  v63[2] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:3];
  uint64_t v55 = v14;
  [v14 setColumns:v18];

  id v19 = [CCSQLCommandJoinTable alloc];
  uint64_t v20 = +[CCSQLCommandJoinCriterion criterionWithColumnName:@"content_hash" onTable:@"provenance" EQUALSColumnName:@"content_hash" comparingTableName:@"content"];
  char v21 = [(CCSQLCommandJoinTable *)v19 initWithTable:@"content" joinCriterion:v20];
  v62[0] = v21;
  uint64_t v22 = [CCSQLCommandJoinTable alloc];
  id v23 = +[CCSQLCommandJoinCriterion criterionWithColumnName:@"instance_hash" onTable:@"provenance" EQUALSColumnName:@"instance_hash" comparingTableName:@"metacontent"];
  id v24 = [(CCSQLCommandJoinTable *)v22 initWithTable:@"metacontent" joinCriterion:v23];
  v62[1] = v24;
  id v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v62 count:2];
  [v14 setJoinWithType:2 tables:v25];

  id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(CCDatabaseSetStateReader *)self _resolveSequenceNumberRangesOfDeltaVector:v13 appendToCriteria:v26 seenStateVectorBuilder:v49 deviceMapping:v12 type:0];

  id v27 = v26;
  v54 = v26;
  [(CCDatabaseSetStateReader *)self _resolveSequenceNumberRangesOfDeltaVector:v50 appendToCriteria:v26 seenStateVectorBuilder:v52 deviceMapping:v12 type:1];

  v28 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
  v29 = [NSString stringWithFormat:@"%@.%@", @"provenance", @"content_hash"];
  v61 = v29;
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v61 count:1];
  [v28 setColumns:v30];

  unsigned int v31 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v27];
  uint64_t v53 = v28;
  [v28 setCommandCriterion:v31];

  long long v51 = [v28 build];
  unsigned __int8 v48 = [NSString stringWithFormat:@"%@.%@", @"provenance", @"content_hash"];
  id v32 = +[CCSQLCommandCriterion criterionWithColumnName:v48 INSubQuery:v51];
  v60[0] = v32;
  v33 = +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:");
  v59[0] = v33;
  unsigned int v34 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_state" EQUALSColumnValue:&unk_26FDCD490];
  v59[1] = v34;
  id v35 = [MEMORY[0x263EFF9D0] null];
  v36 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_state" ISNOTColumnValue:v35];
  v59[2] = v36;
  v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:3];
  id v38 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v37];
  id v39 = +[CCSQLCommandCriterion criterionWithNOTSubCriteria:v38];
  v60[1] = v39;
  char v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:2];
  char v41 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v40];

  [v55 setCommandCriterion:v41];
  v42 = [CCSQLCommandOrder alloc];
  v58[0] = @"content_hash";
  v58[1] = @"content_state";
  id v43 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  v44 = [(CCSQLCommandOrder *)v42 initWithOrderMode:2 columnNames:v43];

  [v55 setCommandOrder:v44];
  id v45 = [v55 build];
  v46 = [(CCDatabaseReadOnlyAccess *)self->_databaseAccess enumeratorForRowResultsOfSelect:v45 error:a8];

  return v46;
}

- (void)_resolveSequenceNumberRangesOfDeltaVector:(id)a3 appendToCriteria:(id)a4 seenStateVectorBuilder:(id)a5 deviceMapping:(id)a6 type:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v47 = a4;
  id v45 = a5;
  id v48 = a6;
  id v12 = [v11 removals];
  id v13 = [v12 allSiteIdentifiers];
  id v14 = (void *)[v13 mutableCopy];

  v46 = v11;
  id v15 = [v11 contents];
  uint64_t v16 = [v15 allSiteIdentifiers];
  [v14 unionSet:v16];

  if (!v7)
  {
    BOOL v17 = CCDatabaseColumnContentSequenceNumber;
    id v18 = CCDatabaseColumnContentState;
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    BOOL v17 = CCDatabaseColumnMetaContentSequenceNumber;
    id v18 = CCDatabaseColumnMetaContentState;
LABEL_5:
    id v19 = *v18;
    uint64_t v20 = *v17;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_30;
    v53[3] = &unk_26527A0C0;
    v42 = v19;
    v54 = v42;
    char v41 = v20;
    uint64_t v55 = v41;
    char v21 = (void (**)(void, void, void, void))MEMORY[0x24C5B1320](v53);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v43 = v14;
    id obj = v14;
    uint64_t v22 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v50 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v27 = [v48 deviceRowIdForSiteIdentifier:v26];
          if (v27)
          {
            id v28 = objc_alloc_init(MEMORY[0x263F089C8]);
            id v29 = objc_alloc_init(MEMORY[0x263F089C8]);
            v30 = [v46 removals];
            __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke((uint64_t)v30, v30, v26, v28, v29);

            [v45 addClockValueSet:v29 withAtomState:2 forDeviceRowId:v27];
            unsigned int v31 = [v46 contents];
            __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke((uint64_t)v31, v31, v26, v28, v29);

            if ([v28 count])
            {
              id v32 = ((void (**)(void, void *, id, uint64_t))v21)[2](v21, v27, v28, 1);
              [v47 addObject:v32];
            }
            if ([v29 count])
            {
              v33 = ((void (**)(void, void *, id, uint64_t))v21)[2](v21, v27, v29, 2);
              [v47 addObject:v33];
            }
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v23);
    }

    unsigned int v34 = v42;
    id v14 = v43;
    goto LABEL_21;
  }
  unsigned int v34 = __biome_log_for_category();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetStateReader _resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:](v7, v34, v35, v36, v37, v38, v39, v40);
  }
LABEL_21:
}

void __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_2;
  v12[3] = &unk_26527A098;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [a2 enumerateClockValuesForSiteIdentifier:a3 usingBlock:v12];
}

uint64_t __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5 == 2)
  {
    id v5 = (id *)(result + 40);
  }
  else
  {
    if (a5 != 1) {
      return result;
    }
    id v5 = (id *)(result + 32);
  }
  return objc_msgSend(*v5, "addIndexesInRange:", a2, a3);
}

id __129__CCDatabaseSetStateReader__resolveSequenceNumberRangesOfDeltaVector_appendToCriteria_seenStateVectorBuilder_deviceMapping_type___block_invoke_30(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  v21[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:a2];
  v21[0] = v8;
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", a4, v8);
  id v11 = +[CCSQLCommandCriterion criterionWithColumnName:v9 EQUALSColumnValue:v10];
  v21[1] = v11;
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "firstIndex"));
  id v14 = NSNumber;
  uint64_t v15 = [v7 lastIndex];

  uint64_t v16 = [v14 numberWithUnsignedInteger:v15];
  BOOL v17 = +[CCSQLCommandCriterion criterionWithColumnName:v12 BETWEENLowerColumnValue:v13 ANDUpperColumnValue:v16];
  v21[2] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
  id v19 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v18];

  return v19;
}

- (id)_createProvenanceSelectCommandFromDeviceRowIdToClockValues:(id)a3 type:(unsigned __int8)a4 state:(unsigned __int8)a5 columns:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  v43[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  if (!v8)
  {
    id v11 = CCDatabaseColumnContentSequenceNumberEndOfRun;
    uint64_t v12 = CCDatabaseColumnContentSequenceNumber;
    id v13 = CCDatabaseColumnContentState;
    goto LABEL_5;
  }
  if (v8 == 1)
  {
    id v11 = CCDatabaseColumnMetaContentSequenceNumberEndOfRun;
    uint64_t v12 = CCDatabaseColumnMetaContentSequenceNumber;
    id v13 = CCDatabaseColumnMetaContentState;
LABEL_5:
    id v14 = *v13;
    uint64_t v15 = *v12;
    uint64_t v16 = *v11;
    BOOL v17 = objc_opt_new();
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke;
    v38[3] = &unk_26527A110;
    char v42 = v7;
    id v18 = v15;
    uint64_t v39 = v18;
    id v19 = v16;
    uint64_t v40 = v19;
    id v20 = v17;
    id v41 = v20;
    [v9 enumerateKeysAndObjectsUsingBlock:v38];
    if ([v20 count])
    {
      id v37 = v9;
      char v21 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
      uint64_t v22 = v21;
      if (v10) {
        [v21 setColumns:v10];
      }
      id v36 = v10;
      uint64_t v23 = [NSNumber numberWithUnsignedChar:v7];
      uint64_t v24 = +[CCSQLCommandCriterion criterionWithColumnName:v14 EQUALSColumnValue:v23];

      v43[0] = v24;
      id v25 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v20];
      v43[1] = v25;
      uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v43 count:2];
      id v27 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v26];

      [v22 setCommandCriterion:v27];
      id v28 = [v22 build];

      id v10 = v36;
      id v9 = v37;
    }
    else
    {
      id v28 = 0;
    }

    goto LABEL_14;
  }
  id v14 = __biome_log_for_category();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetStateReader _resolveSequenceNumberRangesOfDeltaVector:appendToCriteria:seenStateVectorBuilder:deviceMapping:type:](v8, v14, v29, v30, v31, v32, v33, v34);
  }
  id v28 = 0;
LABEL_14:

  return v28;
}

void __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v18[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke_2;
  v13[3] = &unk_26527A0E8;
  char v17 = *(unsigned char *)(a1 + 56);
  id v14 = *(id *)(a1 + 32);
  id v8 = v7;
  id v15 = v8;
  id v16 = *(id *)(a1 + 40);
  [v6 enumerateRangesUsingBlock:v13];

  if ([v8 count])
  {
    id v9 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v5];
    v18[0] = v9;
    id v10 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v8];
    v18[1] = v10;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    uint64_t v12 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v11];

    [*(id *)(a1 + 48) addObject:v12];
  }
}

void __106__CCDatabaseSetStateReader__createProvenanceSelectCommandFromDeviceRowIdToClockValues_type_state_columns___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v29[3] = *MEMORY[0x263EF8340];
  int v6 = *(unsigned __int8 *)(a1 + 56);
  if (v6 == 2)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [MEMORY[0x263EFF9D0] null];
    uint64_t v12 = +[CCSQLCommandCriterion criterionWithColumnName:v10 ISNOTColumnValue:v11];

    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = [NSNumber numberWithUnsignedInteger:a2];
    id v15 = +[CCSQLCommandCriterion criterionWithColumnName:v13 GREATERTHANOrEqualColumnValue:v14];

    uint64_t v16 = *(void *)(a1 + 48);
    char v17 = [NSNumber numberWithUnsignedInteger:a3 + a2 - 1];
    id v18 = +[CCSQLCommandCriterion criterionWithColumnName:v16 LESSTHANOrEqualColumnValue:v17];

    id v27 = (void *)v12;
    v29[0] = v12;
    v29[1] = v15;
    v29[2] = v18;
    id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    id v20 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v19];

    uint64_t v21 = *(void *)(a1 + 32);
    uint64_t v22 = [NSNumber numberWithUnsignedInteger:a2];
    if (a3 == 1)
    {
      uint64_t v23 = +[CCSQLCommandCriterion criterionWithColumnName:v21 EQUALSColumnValue:v22];
    }
    else
    {
      id v25 = [NSNumber numberWithUnsignedInteger:a3 + a2 - 1];
      uint64_t v23 = +[CCSQLCommandCriterion criterionWithColumnName:v21 BETWEENLowerColumnValue:v22 ANDUpperColumnValue:v25];
    }
    v28[0] = v23;
    v28[1] = v20;
    uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    id v9 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v26];

    [*(id *)(a1 + 40) addObject:v9];
  }
  else
  {
    if (v6 != 1) {
      return;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = [NSNumber numberWithUnsignedInteger:a2];
    if (a3 == 1)
    {
      id v9 = +[CCSQLCommandCriterion criterionWithColumnName:v7 EQUALSColumnValue:v8];
    }
    else
    {
      uint64_t v24 = [NSNumber numberWithUnsignedInteger:a3 + a2 - 1];
      id v9 = +[CCSQLCommandCriterion criterionWithColumnName:v7 BETWEENLowerColumnValue:v8 ANDUpperColumnValue:v24];
    }
    [*(id *)(a1 + 40) addObject:v9];
  }
}

- (id)sharedItemCount:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = +[CCDatabaseSelect builderWithTableName:@"content"];
  [v5 setCount:1];
  int v6 = [v5 build];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  databaseAccess = self->_databaseAccess;
  id v18 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke;
  v15[3] = &unk_26527A138;
  id v8 = v6;
  id v16 = v8;
  char v17 = &v19;
  char v9 = [(CCDatabaseReadOnlyAccess *)databaseAccess enumerateRowResultsOfSelect:v8 error:&v18 usingBlock:v15];
  id v10 = v18;
  if (v9)
  {

    id v11 = (id)v20[5];
  }
  else
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v8 commandString];
      [(CCDatabaseSetStateReader *)v13 sharedItemCount:(uint64_t)v25];
    }

    CCSetError(a3, v10);
    id v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v11;
}

BOOL __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    uint64_t v5 = [v3 numberValueAtColumnIndex:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke_cold_1();
    }
  }
  return v4 == 1;
}

- (id)itemInstanceCount:(id *)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[CCDatabaseSelect builderWithTableName:@"metacontent"];
  [v5 setCount:1];
  uint64_t v6 = [v5 build];
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  databaseAccess = self->_databaseAccess;
  id v18 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke;
  v15[3] = &unk_26527A138;
  id v8 = v6;
  id v16 = v8;
  char v17 = &v19;
  char v9 = [(CCDatabaseReadOnlyAccess *)databaseAccess enumerateRowResultsOfSelect:v8 error:&v18 usingBlock:v15];
  id v10 = v18;
  if (v9)
  {

    id v11 = (id)v20[5];
  }
  else
  {
    uint64_t v12 = __biome_log_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v8 commandString];
      [(CCDatabaseSetStateReader *)v13 itemInstanceCount:(uint64_t)v25];
    }

    CCSetError(a3, v10);
    id v11 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v11;
}

BOOL __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    uint64_t v5 = [v3 numberValueAtColumnIndex:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    id v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke_cold_1();
    }
  }
  return v4 == 1;
}

- (id)resourceVersion:(id *)a3
{
  id v3 = [(id)objc_opt_class() persistedKeyValueForKey:@"resourceVersion" database:self->_databaseAccess error:a3];
  uint64_t v4 = [v3 integerValue];

  return v4;
}

- (id)lastDeltaDate:(id *)a3
{
  id v3 = [(id)objc_opt_class() persistedKeyValueForKey:@"lastDeltaDate" database:self->_databaseAccess error:a3];
  uint64_t v4 = [v3 integerValue];

  return v4;
}

- (id)localDeviceIdentifier:(id *)a3
{
  id v3 = [(id)objc_opt_class() persistedKeyValueForKey:@"localDeviceIdentifier" database:self->_databaseAccess error:a3];
  uint64_t v4 = [v3 stringValue];

  return v4;
}

- (void)initWithDatabaseAccess:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_249B92000, log, OS_LOG_TYPE_ERROR, "Failed to retrieve database access.", v1, 2u);
}

void __149__CCDatabaseSetStateReader_enumerateProvenanceRecordsForStateVector_withType_selectAtomsInState_skipOverAtomsInState_deviceMapping_error_usingBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fetchContentRecordFromContentHash:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Error while enumerating item content records. Error: %@", v2, v3, v4, v5, v6);
}

- (void)fetchContentRecordFromContentHash:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to build select with params: (%@}", v2, v3, v4, v5, v6);
}

- (void)_resolveSequenceNumberRangesOfDeltaVector:(uint64_t)a3 appendToCriteria:(uint64_t)a4 seenStateVectorBuilder:(uint64_t)a5 deviceMapping:(uint64_t)a6 type:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)sharedItemCount:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_249B92000, v5, OS_LOG_TYPE_ERROR, "Failed to select shared item count (%@) error: %@", v4, 0x16u);
}

void __44__CCDatabaseSetStateReader_sharedItemCount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Unexpected row (%@) returned from content select: %@");
}

- (void)itemInstanceCount:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_249B92000, v5, OS_LOG_TYPE_ERROR, "Failed to select local instance count (%@) error: %@", v4, 0x16u);
}

void __46__CCDatabaseSetStateReader_itemInstanceCount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Unexpected row (%@) returned from metacontent select: %@");
}

+ (void)persistedKeyValueForKey:database:error:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_249B92000, v0, v1, "Failed to select key value record for key: %@ error: %@");
}

@end