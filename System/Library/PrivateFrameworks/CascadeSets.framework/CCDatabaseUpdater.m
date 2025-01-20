@interface CCDatabaseUpdater
+ (BOOL)_writeRecordWithKey:(id)a3 stringValue:(id)a4 integerValue:(id)a5 dataValue:(id)a6 onConflictType:(int64_t)a7 database:(id)a8;
+ (BOOL)compactContiguousRunsOfDeletesInDatabase:(id)a3 deletedCount:(unint64_t *)a4 shouldDefer:(id)a5;
+ (BOOL)insertOrUpdateLastDeltaDate:(id)a3 database:(id)a4;
+ (BOOL)insertOrUpdateLastMaintenanceDate:(id)a3 database:(id)a4;
+ (BOOL)insertOrUpdateLocalDeviceIdentifier:(id)a3 database:(id)a4;
+ (BOOL)insertOrUpdateRowsModified:(unint64_t)a3 database:(id)a4;
+ (BOOL)insertResourceVersion:(id)a3 database:(id)a4;
+ (id)selectLocalHighestContentSequenceNumberInDatabase:(id)a3 error:(id *)a4;
+ (id)selectLocalHighestMetaContentSequenceNumberInDatabase:(id)a3 error:(id *)a4;
+ (id)selectRowsModifiedCountInDatabase:(id)a3 error:(id *)a4;
+ (id)selectSetValidityHashInDatabase:(id)a3 error:(id *)a4;
+ (id)selectSetVersionInDatabase:(id)a3 error:(id *)a4;
- (BOOL)_deleteSourceItemIdHash:(id)a3 outProvenanceRowId:(id *)a4;
- (BOOL)_enumerateLocalInstancesSelectingOnlyUnmodified:(BOOL)a3 usingBlock:(id)a4;
- (BOOL)_insertContent:(id)a3 contentHash:(id)a4 outSequenceNumber:(id *)a5;
- (BOOL)_insertContentIfNotExists:(id)a3 contentHash:(id)a4;
- (BOOL)_insertDeviceReturningRowId:(id *)a3;
- (BOOL)_insertLocalInstanceForItemWithSourceItemIdHash:(id)a3 provenanceRowId:(id)a4;
- (BOOL)_insertMetaContent:(id)a3 instanceHash:(id)a4 outSequenceNumber:(id *)a5 outIsDuplicate:(BOOL *)a6;
- (BOOL)_insertNewProvenanceAndTombstonePriorProvenanceRow:(id)a3 outInsertedProvenanceRowId:(id *)a4 instanceHash:(id)a5 contentHash:(id)a6 contentSequenceNumber:(id)a7 metaContentSequenceNumber:(id)a8 contentChanged:(BOOL)a9;
- (BOOL)_insertProvenanceForItemWithContentHash:(id)a3 contentSequenceNumber:(id)a4 metaContentSequenceNumber:(id)a5 instanceHash:(id)a6 onDeviceRowId:(id)a7 insertedRowId:(id *)a8;
- (BOOL)_registerDevice;
- (BOOL)_registerSetVersionAndValidity;
- (BOOL)_selectDeviceRowId:(id *)a3 options:(unsigned __int8 *)a4;
- (BOOL)_selectLocalDeviceProvenenceWithContentHash:(id)a3 outSequenceNumber:(id *)a4;
- (BOOL)_selectLocalInstanceCount:(id *)a3;
- (BOOL)_selectMetaContentWithInstanceHash:(id)a3 outRecord:(id *)a4;
- (BOOL)_selectProvenanceWithContentHash:(id)a3 outLocalInstancePresent:(BOOL *)a4 outRemoteContentPresent:(BOOL *)a5;
- (BOOL)_selectProvenenceWithRowId:(id)a3 outInstanceHash:(id *)a4 outContentHash:(id *)a5;
- (BOOL)_tombstoneMetaContentWithProvenanceRowId:(id)a3 tombstoneContentIfNoLongerPresent:(BOOL)a4;
- (BOOL)_updateLastDelta;
- (BOOL)_updateLocalHighestSequenceNumbers;
- (BOOL)_updateLocalInstanceRowId:(id)a3 provenanceRowId:(id)a4;
- (BOOL)_updateSetVersionAndValidity;
- (BOOL)deleteAllLocalInstances;
- (BOOL)deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord;
- (BOOL)deleteSourceItemIdHash:(id)a3;
- (BOOL)enumerateUnmodifiedLocalInstancesUsingBlock:(id)a3;
- (BOOL)finish:(BOOL *)a3;
- (BOOL)insertContent:(id)a3 contentHash:(id)a4 sequenceNumber:(id)a5 onDeviceRowId:(id)a6;
- (BOOL)insertItemWithSourceItemIdHash:(id)a3 instanceHash:(id)a4 contentHash:(id)a5 metaContent:(id)a6 content:(id)a7 isDuplicate:(BOOL *)a8;
- (BOOL)selectProvenanceWithContentSequenceNumber:(id)a3 onDeviceRowId:(id)a4 outProvenanceRowId:(id *)a5;
- (BOOL)selectSourceItemIdHash:(id)a3 outLocalInstanceRowId:(id *)a4 outProvenanceRowId:(id *)a5 outInstanceHash:(id *)a6 outContentHash:(id *)a7 outContentSequenceNumber:(id *)a8 isDuplicate:(BOOL *)a9;
- (BOOL)tombstoneContentSequenceNumbersInRange:(_NSRange)a3 forDeviceRowId:(id)a4;
- (BOOL)updateContent:(id)a3 andMetaContent:(id)a4 localInstanceRowId:(id)a5 priorProvenanceRowId:(id)a6 contentHash:(id)a7 instanceHash:(id)a8 isDuplicate:(BOOL *)a9;
- (BOOL)updateMetaContent:(id)a3 localInstanceRowId:(id)a4 provenanceRowId:(id)a5 priorInstanceHash:(id)a6 instanceHash:(id)a7 contentHash:(id)a8 contentSequenceNumber:(id)a9 isDuplicate:(BOOL *)a10;
- (CCDatabaseUpdater)initWithDatabase:(id)a3 device:(id)a4 request:(id)a5 startTimeMicros:(int64_t)a6;
- (NSNumber)deviceRowId;
- (NSNumber)priorValidityHash;
- (NSNumber)setHash;
- (NSNumber)updateValidityHash;
- (id)_incrementLocalHighestContentSequenceNumber;
- (id)_incrementLocalHighestMetaContentSequenceNumber;
- (id)description;
- (unint64_t)priorVersion;
- (unint64_t)updateVersion;
- (unsigned)localInstanceAddedCount;
- (unsigned)localInstanceRemovedCount;
- (unsigned)localInstanceUpdatedCount;
- (unsigned)modifiedRowCount;
- (unsigned)priorLocalInstanceCount;
- (unsigned)sharedItemAddedCount;
- (unsigned)sharedItemProvenanceUpdatedCount;
- (unsigned)sharedItemRemovedCount;
- (void)_incrementLocalHighestContentSequenceNumber;
- (void)_incrementLocalHighestMetaContentSequenceNumber;
- (void)_registerDevice;
- (void)_registerSetVersionAndValidity;
- (void)_updateLastDelta;
- (void)_updateLocalHighestSequenceNumbers;
- (void)_updateSetVersionAndValidity;
- (void)deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord;
@end

@implementation CCDatabaseUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceRowId, 0);
  objc_storeStrong((id *)&self->_priorValidityHash, 0);
  objc_storeStrong((id *)&self->_setHash, 0);
  objc_storeStrong((id *)&self->_updateValidityHash, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_localHighestMetaContentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_localHighestContentSequenceNumber, 0);
  objc_storeStrong((id *)&self->_commandCache, 0);
  objc_storeStrong((id *)&self->_versionNumber, 0);
  objc_storeStrong((id *)&self->_encodedDescriptors, 0);
  objc_storeStrong((id *)&self->_itemTypeNumber, 0);
  objc_storeStrong((id *)&self->_startTimeMicros, 0);
  objc_storeStrong((id *)&self->_requestDescription, 0);

  objc_storeStrong((id *)&self->_database, 0);
}

- (unsigned)priorLocalInstanceCount
{
  return self->_priorLocalInstanceCount;
}

+ (BOOL)insertOrUpdateRowsModified:(unint64_t)a3 database:(id)a4
{
  v6 = NSNumber;
  id v7 = a4;
  v8 = [v6 numberWithUnsignedInteger:a3];
  LOBYTE(a1) = [a1 _writeRecordWithKey:@"rowsModified" stringValue:0 integerValue:v8 dataValue:0 onConflictType:2 database:v7];

  return (char)a1;
}

- (CCDatabaseUpdater)initWithDatabase:(id)a3 device:(id)a4 request:(id)a5 startTimeMicros:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v40.receiver = self;
  v40.super_class = (Class)CCDatabaseUpdater;
  v14 = [(CCDatabaseUpdater *)&v40 init];
  if (!v14) {
    goto LABEL_22;
  }
  uint64_t v15 = [v13 description];
  requestDescription = v14->_requestDescription;
  v14->_requestDescription = (NSString *)v15;

  if (!v13)
  {
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:]();
    }
    goto LABEL_24;
  }
  objc_storeStrong((id *)&v14->_database, a3);
  if (!v14->_database)
  {
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:]();
    }
    goto LABEL_24;
  }
  uint64_t v17 = [v13 encodedDescriptors];
  encodedDescriptors = v14->_encodedDescriptors;
  v14->_encodedDescriptors = (NSString *)v17;

  if (!v14->_encodedDescriptors)
  {
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:]();
    }
    goto LABEL_24;
  }
  uint64_t v19 = [v12 identifier];
  deviceId = v14->_deviceId;
  v14->_deviceId = (NSString *)v19;

  if (!v14->_deviceId)
  {
    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater initWithDatabase:device:request:startTimeMicros:].cold.4();
    }
    goto LABEL_24;
  }
  v14->_deviceOptions = [v12 options];
  uint64_t v21 = [v13 version];
  v14->_updateVersion = v21;
  uint64_t v22 = [NSNumber numberWithUnsignedLongLong:v21];
  versionNumber = v14->_versionNumber;
  v14->_versionNumber = (NSNumber *)v22;

  v24 = [v13 validity];
  if (v24)
  {
    v25 = [v13 validity];
    uint64_t v26 = CCHash64String(v25);
    updateValidityHash = v14->_updateValidityHash;
    v14->_updateValidityHash = (NSNumber *)v26;
  }
  else
  {
    v25 = v14->_updateValidityHash;
    v14->_updateValidityHash = (NSNumber *)&unk_26FDCD5B0;
  }

  uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v13, "itemType"));
  itemTypeNumber = v14->_itemTypeNumber;
  v14->_itemTypeNumber = (NSNumber *)v29;

  uint64_t v31 = [NSNumber numberWithLongLong:a6];
  startTimeMicros = v14->_startTimeMicros;
  v14->_startTimeMicros = (NSNumber *)v31;

  uint64_t v33 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:18];
  commandCache = v14->_commandCache;
  v14->_commandCache = (NSMutableDictionary *)v33;

  if (![(CCDatabaseUpdater *)v14 _registerDevice]
    || ![(CCDatabaseUpdater *)v14 _registerSetVersionAndValidity])
  {
    v28 = 0;
LABEL_24:

    v37 = 0;
    goto LABEL_25;
  }
  id v39 = 0;
  BOOL v35 = [(CCDatabaseUpdater *)v14 _selectLocalInstanceCount:&v39];
  v36 = v39;
  v28 = v36;
  if (!v35 || !v36) {
    goto LABEL_24;
  }
  v14->_priorLocalInstanceCount = [v36 unsignedIntValue];

LABEL_22:
  v37 = v14;
LABEL_25:

  return v37;
}

- (BOOL)_selectLocalInstanceCount:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = +[CCDatabaseSelect builderWithTableName:@"instance"];
  [v5 setCount:1];
  v6 = [v5 build];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  id v19 = 0;
  database = self->_database;
  v12[5] = &v14;
  id v13 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke;
  v12[3] = &unk_26527ACD8;
  v12[4] = self;
  int v8 = [(CCDatabaseReadWriteAccess *)database enumerateRowResultsOfSelect:v6 error:&v13 usingBlock:v12];
  id v9 = v13;
  if (v8)
  {
    *a3 = (id) v15[5];
  }
  else
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [(CCDatabaseUpdater *)self description];
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:]();
    }
  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BOOL)_registerDevice
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  unsigned __int8 v18 = 0;
  id v17 = 0;
  BOOL v3 = [(CCDatabaseUpdater *)self _selectDeviceRowId:&v17 options:&v18];
  id v4 = v17;
  v5 = (NSNumber *)v17;
  v6 = v5;
  if (!v3) {
    goto LABEL_9;
  }
  BOOL v7 = v5 == 0;
  if (!v5)
  {
    int v8 = __biome_log_for_category();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(CCDatabaseUpdater *)(uint64_t)self _registerDevice];
    }

    id v16 = 0;
    BOOL v9 = [(CCDatabaseUpdater *)self _insertDeviceReturningRowId:&v16];
    v10 = (NSNumber *)v16;
    v6 = v10;
    if (v9)
    {
      v6 = v10;
      p_super = &self->_deviceRowId->super.super;
      self->_deviceRowId = v6;
LABEL_12:

      goto LABEL_13;
    }
LABEL_9:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  objc_storeStrong((id *)&self->_deviceRowId, v4);
  if (self->_deviceOptions != v18)
  {
    p_super = __biome_log_for_category();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      deviceRowId = self->_deviceRowId;
      deviceId = self->_deviceId;
      int deviceOptions = self->_deviceOptions;
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = deviceRowId;
      __int16 v21 = 2112;
      uint64_t v22 = deviceId;
      __int16 v23 = 1024;
      int v24 = v18;
      __int16 v25 = 1024;
      int v26 = deviceOptions;
      _os_log_error_impl(&dword_249B92000, p_super, OS_LOG_TYPE_ERROR, "Row %@ for deviceId: %@ has device options value %i inconsistent with expected: %i", buf, 0x22u);
    }
    goto LABEL_12;
  }
  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_enumerateLocalInstancesSelectingOnlyUnmodified:(BOOL)a3 usingBlock:(id)a4
{
  BOOL v4 = a3;
  v26[1] = *MEMORY[0x263EF8340];
  v6 = (uint64_t (**)(id, void *))a4;
  BOOL v7 = +[CCDatabaseSelect builderWithTableName:@"instance"];
  if (v4)
  {
    int v8 = +[CCSQLCommandCriterion criterionWithColumnName:@"modified" LESSTHANColumnValue:self->_startTimeMicros];
    [v7 setCommandCriterion:v8];
  }
  v26[0] = @"source_item_id_hash";
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  [v7 setColumns:v9];

  v10 = [v7 build];
  database = self->_database;
  id v25 = 0;
  id v12 = [(CCDatabaseReadWriteAccess *)database enumeratorForRowResultsOfSelect:v10 error:&v25];
  id v13 = v25;
  if (!v12)
  {
    uint64_t v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:]();
    }
LABEL_18:
    BOOL v21 = 0;
    goto LABEL_24;
  }
  uint64_t v14 = [v12 next];
  if (!v14)
  {
LABEL_14:
    id v19 = objc_msgSend(v12, "error", v24);

    if (!v19)
    {
      BOOL v21 = 1;
      goto LABEL_24;
    }
    uint64_t v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:]();
    }

    goto LABEL_18;
  }
  id v24 = v13;
  while (1)
  {
    uint64_t v15 = (void *)MEMORY[0x24C5B1100]();
    if (![v14 count])
    {
      goto LABEL_14;
    }
    if ([v14 count] != 1) {
      break;
    }
    id v16 = [v14 numberValueAtColumnIndex:0];
    char v17 = v6[2](v6, v16);

    if ((v17 & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v18 = [v12 next];

    uint64_t v14 = v18;
    if (!v18) {
      goto LABEL_14;
    }
  }
  uint64_t v22 = __biome_log_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[CCDatabaseUpdater _enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:]();
  }

LABEL_23:
  BOOL v21 = 0;
LABEL_24:

  return v21;
}

uint64_t __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  BOOL v7 = v6;
  uint64_t v8 = 1;
  *a4 = 1;
  if (v6)
  {
    if ([v6 count])
    {
      if ([v7 count] == 6)
      {
        uint64_t v9 = [v7 numberValueAtColumnIndex:0];
        uint64_t v10 = *(void *)(a1[4] + 8);
        id v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        uint64_t v8 = 1;
        uint64_t v12 = [v7 numberValueAtColumnIndex:1];
        uint64_t v13 = *(void *)(a1[5] + 8);
        uint64_t v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;

        uint64_t v15 = [v7 numberValueAtColumnIndex:2];
        uint64_t v16 = *(void *)(a1[6] + 8);
        char v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        uint64_t v18 = [v7 numberValueAtColumnIndex:3];
        uint64_t v19 = *(void *)(a1[7] + 8);
        uint64_t v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        uint64_t v21 = [v7 numberValueAtColumnIndex:4];
        uint64_t v22 = *(void *)(a1[8] + 8);
        __int16 v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;

        uint64_t v24 = [v7 numberValueAtColumnIndex:5];
        uint64_t v25 = *(void *)(a1[9] + 8);
        int v26 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v24;
      }
      else
      {
        uint64_t v27 = __biome_log_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke_cold_1();
        }

        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }

  return v8;
}

BOOL __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *a4 = 1;
  uint64_t v7 = [v6 count];
  if (v7 == 2)
  {
    uint64_t v8 = [v6 numberValueAtColumnIndex:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = [v6 numberValueAtColumnIndex:1];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v11 unsignedCharValue];
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke_cold_1();
    }
  }

  return v7 == 2;
}

BOOL __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  *a4 = 1;
  uint64_t v7 = [v6 count];
  if (v7 == 1)
  {
    uint64_t v8 = [v6 numberValueAtColumnIndex:0];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_1(a1 + 40, a1);
    }
  }
  else
  {
    id v11 = __biome_log_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_2();
    }
  }

  return v7 == 1;
}

- (BOOL)_registerSetVersionAndValidity
{
  BOOL v3 = objc_opt_class();
  database = self->_database;
  id v14 = 0;
  v5 = [v3 selectSetVersionInDatabase:database error:&v14];
  id v6 = v14;
  self->_priorVersion = [v5 unsignedIntegerValue];

  if (v6)
  {
    uint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater _registerSetVersionAndValidity]();
    }
LABEL_7:

    return 0;
  }
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = self->_database;
  id v13 = 0;
  uint64_t v10 = [v8 selectSetValidityHashInDatabase:v9 error:&v13];
  id v6 = v13;
  priorValidityHash = self->_priorValidityHash;
  self->_priorValidityHash = v10;

  if (v6)
  {
    uint64_t v7 = __biome_log_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater _registerSetVersionAndValidity]();
    }
    goto LABEL_7;
  }
  return [(CCDatabaseUpdater *)self _updateSetVersionAndValidity];
}

- (BOOL)_updateSetVersionAndValidity
{
  if ([(id)objc_opt_class() _writeRecordWithKey:@"sourceVersion" stringValue:0 integerValue:self->_versionNumber dataValue:0 onConflictType:2 database:self->_database])
  {
    if ([(id)objc_opt_class() _writeRecordWithKey:@"sourceValidityHash" stringValue:0 integerValue:self->_updateValidityHash dataValue:0 onConflictType:2 database:self->_database])return 1; {
    BOOL v4 = __biome_log_for_category();
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CCDatabaseUpdater *)self _updateSetVersionAndValidity];
    }
  }
  else
  {
    BOOL v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CCDatabaseUpdater *)self _updateSetVersionAndValidity];
    }
  }

  return 0;
}

- (BOOL)_selectDeviceRowId:(id *)a3 options:(unsigned __int8 *)a4
{
  v28[2] = *MEMORY[0x263EF8340];
  uint64_t v7 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_id" EQUALSColumnValue:self->_deviceId];
  uint64_t v8 = +[CCDatabaseSelect builderWithTableName:@"device"];
  [v8 setCommandCriterion:v7];
  v28[0] = @"device_row_id";
  v28[1] = @"options";
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  [v8 setColumns:v9];

  uint64_t v10 = [v8 build];
  uint64_t v22 = 0;
  __int16 v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__11;
  int v26 = __Block_byref_object_dispose__11;
  id v27 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  database = self->_database;
  v16[6] = &v18;
  id v17 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke;
  v16[3] = &unk_26527ACB0;
  v16[4] = self;
  v16[5] = &v22;
  int v12 = [(CCDatabaseReadWriteAccess *)database enumerateRowResultsOfSelect:v10 error:&v17 usingBlock:v16];
  id v13 = v17;
  if (v12)
  {
    *a3 = (id) v23[5];
    *a4 = *((unsigned char *)v19 + 24);
  }
  else
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [(CCDatabaseUpdater *)self description];
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:]();
    }
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

+ (BOOL)_writeRecordWithKey:(id)a3 stringValue:(id)a4 integerValue:(id)a5 dataValue:(id)a6 onConflictType:(int64_t)a7 database:(id)a8
{
  v34[4] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  v34[0] = @"key";
  v34[1] = @"string_value";
  v34[2] = @"integer_value";
  v34[3] = @"data_value";
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  uint64_t v18 = +[CCDatabaseInsert builderWithTableName:@"keyvalue" columnNames:v17];

  v33[0] = v12;
  uint64_t v19 = v13;
  if (!v13)
  {
    uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  }
  v33[1] = v19;
  uint64_t v20 = v14;
  if (!v14)
  {
    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
  }
  v33[2] = v20;
  char v21 = v15;
  if (!v15)
  {
    char v21 = [MEMORY[0x263EFF9D0] null];
  }
  v33[3] = v21;
  uint64_t v22 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v33, 4, a7);
  [v18 setColumnValues:v22];

  if (v15)
  {
    if (v14) {
      goto LABEL_9;
    }
LABEL_16:

    if (v13) {
      goto LABEL_10;
    }
LABEL_17:

    goto LABEL_10;
  }

  if (!v14) {
    goto LABEL_16;
  }
LABEL_9:
  if (!v13) {
    goto LABEL_17;
  }
LABEL_10:
  __int16 v23 = +[CCDatabaseOnConflict onConflictWithType:v30];
  [v18 setOnConflict:v23];

  id v32 = 0;
  uint64_t v24 = [v18 buildWithError:&v32];
  id v25 = v32;
  id v26 = v25;
  char v27 = 0;
  if (v24)
  {
    if (!v25)
    {
      id v31 = 0;
      char v27 = [v16 executeCommand:v24 error:&v31];
      id v26 = v31;
      if (v26) {
        char v27 = 0;
      }
    }
  }

  return v27;
}

- (BOOL)selectSourceItemIdHash:(id)a3 outLocalInstanceRowId:(id *)a4 outProvenanceRowId:(id *)a5 outInstanceHash:(id *)a6 outContentHash:(id *)a7 outContentSequenceNumber:(id *)a8 isDuplicate:(BOOL *)a9
{
  v77[1] = *MEMORY[0x263EF8340];
  id v34 = a3;
  v77[0] = v34;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:1];
  id v11 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD6D0];
  if ([v11 updateParameters:v10])
  {
    uint64_t v12 = (uint64_t)v11;
LABEL_5:
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__11;
    v71 = __Block_byref_object_dispose__11;
    id v72 = 0;
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__11;
    v65 = __Block_byref_object_dispose__11;
    id v66 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__11;
    v59 = __Block_byref_object_dispose__11;
    id v60 = 0;
    uint64_t v49 = 0;
    v50 = &v49;
    uint64_t v51 = 0x3032000000;
    v52 = __Block_byref_object_copy__11;
    v53 = __Block_byref_object_dispose__11;
    id v54 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__11;
    v47 = __Block_byref_object_dispose__11;
    id v48 = 0;
    uint64_t v37 = 0;
    v38 = &v37;
    uint64_t v39 = 0x3032000000;
    objc_super v40 = __Block_byref_object_copy__11;
    v41 = __Block_byref_object_dispose__11;
    id v42 = 0;
    database = self->_database;
    v35[9] = &v37;
    id v36 = 0;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke;
    v35[3] = &unk_26527AD00;
    v35[4] = &v67;
    v35[5] = &v61;
    v35[6] = &v55;
    v35[7] = &v49;
    v35[8] = &v43;
    char v22 = [(CCDatabaseReadWriteAccess *)database enumerateRowResultsOfSelect:v12 error:&v36 usingBlock:v35];
    id v23 = v36;
    if (v22)
    {
      if (v62[5])
      {
        if (a4) {
          *a4 = (id) v68[5];
        }
        if (a5) {
          *a5 = (id) v62[5];
        }
        if (a6) {
          *a6 = (id) v50[5];
        }
        if (a7) {
          *a7 = (id) v44[5];
        }
        if (a8) {
          *a8 = (id) v38[5];
        }
        if ([(id)v56[5] isEqual:self->_startTimeMicros])
        {
          uint64_t v24 = __biome_log_for_category();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            id v25 = [(CCDatabaseUpdater *)self description];
            -[CCDatabaseUpdater selectSourceItemIdHash:outLocalInstanceRowId:outProvenanceRowId:outInstanceHash:outContentHash:outContentSequenceNumber:isDuplicate:]((uint64_t)v34, v25, (uint64_t)v73);
          }

          if (a9) {
            *a9 = 1;
          }
        }
      }
    }
    else
    {
      id v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        [(CCDatabaseUpdater *)self description];
        objc_claimAutoreleasedReturnValue();
        -[CCDatabaseUpdater _selectDeviceRowId:options:]();
      }
    }
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v49, 8);

    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
    id v13 = (void *)v12;
    goto LABEL_26;
  }
  id v13 = +[CCDatabaseSelect builderWithTableName:@"instance"];
  id v14 = +[CCSQLCommandJoinCriterion criterionWithColumnName:@"provenance_row_id" onTable:@"instance" EQUALSColumnName:@"provenance_row_id" comparingTableName:@"provenance"];
  id v15 = [[CCSQLCommandJoinTable alloc] initWithTable:@"provenance" joinCriterion:v14];
  v76 = v15;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v76 count:1];
  [v13 setJoinWithType:1 tables:v16];

  id v17 = [v10 objectAtIndex:0];
  uint64_t v18 = +[CCSQLCommandCriterion criterionWithColumnName:@"source_item_id_hash" onTable:@"instance" EQUALSColumnValue:v17];

  [v13 setCommandCriterion:v18];
  v75[0] = @"rowid";
  v75[1] = @"provenance_row_id";
  v75[2] = @"modified";
  v75[3] = @"instance_hash";
  v75[4] = @"content_hash";
  v75[5] = @"content_sequence_number";
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v75 count:6];
  v74[0] = @"instance";
  v74[1] = @"instance";
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
  [v13 setColumns:v19 withTablePrefixes:v20];

  uint64_t v12 = [v13 build];

  if (v12)
  {
    [(NSMutableDictionary *)self->_commandCache setObject:v12 forKey:&unk_26FDCD6D0];

    goto LABEL_5;
  }
  v28 = __biome_log_for_category();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:]();
  }

  id v23 = 0;
  char v22 = 0;
LABEL_26:

  return v22;
}

+ (id)selectSetValidityHashInDatabase:(id)a3 error:(id *)a4
{
  BOOL v4 = +[CCDatabaseSetStateReader persistedKeyValueForKey:@"sourceValidityHash" database:a3 error:a4];
  v5 = [v4 integerValue];

  return v5;
}

+ (id)selectRowsModifiedCountInDatabase:(id)a3 error:(id *)a4
{
  BOOL v4 = +[CCDatabaseSetStateReader persistedKeyValueForKey:@"rowsModified" database:a3 error:a4];
  v5 = [v4 integerValue];

  return v5;
}

+ (id)selectSetVersionInDatabase:(id)a3 error:(id *)a4
{
  BOOL v4 = +[CCDatabaseSetStateReader persistedKeyValueForKey:@"sourceVersion" database:a3 error:a4];
  v5 = [v4 integerValue];

  return v5;
}

- (unsigned)modifiedRowCount
{
  return self->_modifiedRowCount;
}

- (BOOL)enumerateUnmodifiedLocalInstancesUsingBlock:(id)a3
{
  return [(CCDatabaseUpdater *)self _enumerateLocalInstancesSelectingOnlyUnmodified:1 usingBlock:a3];
}

- (BOOL)finish:(BOOL *)a3
{
  BOOL v5 = [(CCDatabaseUpdater *)self _updateLocalHighestSequenceNumbers];
  if (!v5) {
    return v5;
  }
  if (!self->_localInstanceAddedCount
    && !self->_localInstanceRemovedCount
    && !self->_localInstanceUpdatedCount
    && !self->_sharedItemAddedCount
    && !self->_sharedItemRemovedCount)
  {
    BOOL v6 = self->_sharedItemProvenanceUpdatedCount != 0;
    if (!a3) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  BOOL v6 = 1;
  if (a3) {
LABEL_8:
  }
    *a3 = v6;
LABEL_9:
  if (!v6 || (BOOL v5 = [(CCDatabaseUpdater *)self _updateLastDelta])) {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)_updateLocalHighestSequenceNumbers
{
  if (self->_localHighestContentSequenceNumber)
  {
    if (([(id)objc_opt_class() _writeRecordWithKey:@"localHighestContent" stringValue:0 integerValue:self->_localHighestContentSequenceNumber dataValue:0 onConflictType:2 database:self->_database] & 1) == 0)
    {
      BOOL v4 = __biome_log_for_category();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(CCDatabaseUpdater *)self _updateLocalHighestSequenceNumbers];
      }
      goto LABEL_12;
    }
    ++self->_modifiedRowCount;
  }
  if (!self->_localHighestMetaContentSequenceNumber) {
    return 1;
  }
  if ([(id)objc_opt_class() _writeRecordWithKey:@"localHighestMetaContent" stringValue:0 integerValue:self->_localHighestMetaContentSequenceNumber dataValue:0 onConflictType:2 database:self->_database])
  {
    ++self->_modifiedRowCount;
    return 1;
  }
  BOOL v4 = __biome_log_for_category();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    [(CCDatabaseUpdater *)self _updateLocalHighestSequenceNumbers];
  }
LABEL_12:

  return 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"request: %@, startTimeMicros: %@", self->_requestDescription, self->_startTimeMicros];
}

- (BOOL)deleteAllLocalInstances
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CCDatabaseUpdater_deleteAllLocalInstances__block_invoke;
  v5[3] = &unk_26527AC38;
  v5[4] = self;
  v5[5] = &v6;
  BOOL v3 = [(CCDatabaseUpdater *)self _enumerateLocalInstancesSelectingOnlyUnmodified:0 usingBlock:v5];
  if (v3) {
    self->_localInstanceRemovedCount += *((_DWORD *)v7 + 6);
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__CCDatabaseUpdater_deleteAllLocalInstances__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteSourceItemIdHash:a2];
}

- (BOOL)deleteSourceItemIdHash:(id)a3
{
  id v9 = 0;
  BOOL v4 = [(CCDatabaseUpdater *)self _deleteSourceItemIdHash:a3 outProvenanceRowId:&v9];
  id v5 = v9;
  uint64_t v6 = v5;
  if (v4)
  {
    if (v5) {
      BOOL v7 = [(CCDatabaseUpdater *)self _tombstoneMetaContentWithProvenanceRowId:v5 tombstoneContentIfNoLongerPresent:1];
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_deleteSourceItemIdHash:(id)a3 outProvenanceRowId:(id *)a4
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v27[0] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
  uint64_t v8 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD5C8];
  if ([v8 updateParameters:v7])
  {
    id v9 = v8;
    goto LABEL_5;
  }
  id v9 = +[CCDatabaseDelete builderWithTableName:@"instance"];
  uint64_t v10 = [v7 objectAtIndex:0];
  id v11 = +[CCSQLCommandCriterion criterionWithColumnName:@"source_item_id_hash" onTable:@"instance" EQUALSColumnValue:v10];

  [v9 setCommandCriterion:v11];
  id v26 = @"provenance_row_id";
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
  [v9 setReturningColumns:v12];

  uint64_t v13 = [v9 build];

  if (v13)
  {
    [(NSMutableDictionary *)self->_commandCache setObject:v13 forKey:&unk_26FDCD5C8];

    id v9 = (void *)v13;
LABEL_5:
    database = self->_database;
    id v22 = 0;
    id v23 = 0;
    char v15 = [(CCDatabaseReadWriteAccess *)database executeCommand:v9 error:&v23 returningRow:&v22];
    id v16 = v23;
    id v17 = v22;
    id v11 = v17;
    if (v15)
    {
      if (v17)
      {
        ++self->_modifiedRowCount;
        ++self->_localInstanceRemovedCount;
        if (a4)
        {
          *a4 = [v17 numberValueAtColumnIndex:0];
        }
      }
      else
      {
        uint64_t v20 = __biome_log_for_category();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v6;
          _os_log_impl(&dword_249B92000, v20, OS_LOG_TYPE_DEFAULT, "No item exists with sourceItemIdHash: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:]();
      }
    }
    goto LABEL_18;
  }
  uint64_t v19 = __biome_log_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:]();
  }

  id v16 = 0;
  char v15 = 0;
LABEL_18:

  return v15;
}

- (BOOL)_tombstoneMetaContentWithProvenanceRowId:(id)a3 tombstoneContentIfNoLongerPresent:(BOOL)a4
{
  BOOL v4 = a4;
  v103[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v103[0] = &unk_26FDCD5E0;
  v103[1] = v6;
  BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:2];
  uint64_t v8 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD5F8];
  if ([v8 updateParameters:v7])
  {
    BOOL v89 = v4;
    id v9 = v8;
  }
  else
  {
    uint64_t v10 = [v7 objectAtIndex:1];
    id v9 = +[CCSQLCommandCriterion criterionWithColumnName:@"provenance_row_id" EQUALSColumnValue:v10];

    id v11 = +[CCDatabaseUpdate builderWithTableName:@"provenance"];
    uint64_t v12 = [v7 objectAtIndex:0];
    [v11 setValue:v12 forColumn:@"metacontent_state"];

    [v11 setCommandCriterion:v9];
    v102[0] = @"instance_hash";
    v102[1] = @"content_hash";
    v102[2] = @"content_sequence_number";
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v102 count:3];
    [v11 setReturningColumns:v13];

    uint64_t v14 = [v11 build];

    if (!v14)
    {
      uint64_t v33 = __biome_log_for_category();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();
      }
      id v17 = 0;
      goto LABEL_19;
    }
    BOOL v89 = v4;
    [(NSMutableDictionary *)self->_commandCache setObject:v14 forKey:&unk_26FDCD5F8];

    id v9 = (void *)v14;
  }
  database = self->_database;
  id v96 = 0;
  id v97 = 0;
  char v16 = [(CCDatabaseReadWriteAccess *)database executeCommand:v9 error:&v97 returningRow:&v96];
  id v17 = v97;
  id v18 = v96;
  id v11 = v18;
  if (v16)
  {
    v85 = v9;
    ++self->_modifiedRowCount;
    uint64_t v19 = [v18 numberValueAtColumnIndex:0];
    uint64_t v20 = [v11 numberValueAtColumnIndex:1];
    char v21 = [v11 numberValueAtColumnIndex:2];
    uint64_t v101 = v19;
    uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v101 count:1];

    id v23 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD610];
    v86 = (void *)v22;
    v84 = v19;
    if (([v23 updateParameters:v22] & 1) == 0)
    {
      uint64_t v24 = v20;
      id v25 = v6;
      id v26 = +[CCSQLCommandCriterion criterionWithColumnName:@"instance_hash" EQUALSColumnValue:v19];
      char v27 = +[CCDatabaseDelete builderWithTableName:@"metacontent"];
      [v27 setCommandCriterion:v26];
      uint64_t v28 = [v27 build];

      if (!v28)
      {
        BOOL v35 = __biome_log_for_category();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:]();
        }

        id v23 = 0;
        BOOL v32 = 0;
        id v6 = v25;
        uint64_t v20 = v24;
        uint64_t v33 = v84;
        goto LABEL_28;
      }
      [(NSMutableDictionary *)self->_commandCache setObject:v28 forKey:&unk_26FDCD610];

      id v23 = (void *)v28;
      id v6 = v25;
      uint64_t v20 = v24;
    }
    uint64_t v29 = self->_database;
    id v95 = v17;
    char v30 = [(CCDatabaseReadWriteAccess *)v29 executeCommand:v23 error:&v95];
    id v31 = v95;

    if (v30)
    {
      ++self->_modifiedRowCount;
      if (v89)
      {
        __int16 v94 = 0;
        if (![(CCDatabaseUpdater *)self _selectProvenanceWithContentHash:v20 outLocalInstancePresent:(char *)&v94 + 1 outRemoteContentPresent:&v94])
        {
          BOOL v32 = 0;
          goto LABEL_30;
        }
        if (HIBYTE(v94))
        {
          BOOL v32 = 1;
LABEL_30:
          uint64_t v33 = v84;
          id v36 = v86;
LABEL_31:
          id v17 = v31;
          goto LABEL_32;
        }
        v81 = v31;
        id v83 = v6;
        deviceRowId = self->_deviceRowId;
        v100[0] = &unk_26FDCD5E0;
        v100[1] = deviceRowId;
        v100[2] = v21;
        v100[3] = &unk_26FDCD610;
        v100[4] = &unk_26FDCD5E0;
        uint64_t v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v100 count:5];

        objc_super v40 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD628];
        v90 = v39;
        if ([v40 updateParameters:v39])
        {
          v41 = v40;
        }
        else
        {
          v78 = v20;
          v79 = v23;
          v76 = v40;
          id v42 = [v39 objectAtIndex:1];
          v87 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v42];

          uint64_t v43 = [v39 objectAtIndex:2];
          uint64_t v44 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_sequence_number" EQUALSColumnValue:v43];

          uint64_t v45 = [v39 objectAtIndex:3];
          uint64_t v46 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_state" EQUALSColumnValue:v45];

          v47 = [v39 objectAtIndex:4];
          uint64_t v48 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_state" EQUALSColumnValue:v47];

          v99[0] = v87;
          v99[1] = v44;
          v77 = (void *)v44;
          uint64_t v49 = (void *)v46;
          v99[2] = v46;
          v99[3] = v48;
          v75 = (void *)v48;
          v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:4];
          uint64_t v51 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v50];

          v52 = +[CCDatabaseUpdate builderWithTableName:@"provenance"];
          v53 = [v39 objectAtIndex:0];
          [v52 setValue:v53 forColumn:@"content_state"];

          id v54 = (void *)v51;
          [v52 setCommandCriterion:v51];
          v41 = [v52 build];

          if (v41)
          {
            [(NSMutableDictionary *)self->_commandCache setObject:v41 forKey:&unk_26FDCD628];
            id v23 = v79;
          }
          else
          {
            uint64_t v55 = __biome_log_for_category();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
              -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();
            }

            id v23 = v79;
            id v54 = (void *)v51;
          }

          uint64_t v20 = v78;
          if (!v41)
          {
            BOOL v32 = 0;
            id v36 = v90;
            id v6 = v83;
            uint64_t v33 = v84;
            id v31 = v81;
            goto LABEL_31;
          }
        }
        v56 = self->_database;
        id v93 = v81;
        char v57 = [(CCDatabaseReadWriteAccess *)v56 executeCommand:v41 error:&v93];
        id v58 = v93;

        if ((v57 & 1) == 0)
        {
          uint64_t v63 = __biome_log_for_category();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
            -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.4();
          }

          BOOL v32 = 0;
          id v36 = v90;
          goto LABEL_54;
        }
        v59 = v20;
        id v60 = self->_database;
        id v92 = v58;
        int v61 = [(CCDatabaseReadWriteAccess *)v60 rowsModified:&v92];
        id v62 = v92;

        if (v61 < 0)
        {
          v64 = __biome_log_for_category();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
            -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:]();
          }

          BOOL v32 = 0;
          goto LABEL_53;
        }
        self->_modifiedRowCount += v61;
        if ((_BYTE)v94)
        {
          ++self->_sharedItemProvenanceUpdatedCount;
          BOOL v32 = 1;
LABEL_53:
          id v36 = v90;
          id v58 = v62;
          uint64_t v20 = v59;
LABEL_54:
          uint64_t v33 = v84;
LABEL_55:

          id v31 = v58;
          id v6 = v83;
          goto LABEL_31;
        }
        v80 = v23;
        v82 = v41;
        v98 = v59;
        uint64_t v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v98 count:1];

        id v66 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD5E0];
        uint64_t v88 = v65;
        if ([v66 updateParameters:v65])
        {
          uint64_t v67 = v66;
        }
        else
        {
          uint64_t v67 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_hash" EQUALSColumnValue:v59];
          v68 = +[CCDatabaseDelete builderWithTableName:@"content"];
          [v68 setCommandCriterion:v67];
          uint64_t v69 = [v68 build];

          if (!v69)
          {
            v74 = __biome_log_for_category();
            id v23 = v80;
            v41 = v82;
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
              -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:]();
            }

            BOOL v32 = 0;
            goto LABEL_66;
          }
          [(NSMutableDictionary *)self->_commandCache setObject:v69 forKey:&unk_26FDCD5E0];

          uint64_t v67 = (void *)v69;
        }
        v41 = v82;
        v70 = self->_database;
        id v91 = v62;
        char v71 = [(CCDatabaseReadWriteAccess *)v70 executeCommand:v67 error:&v91];
        id v72 = v91;

        if (v71)
        {
          ++self->_sharedItemRemovedCount;
          ++self->_modifiedRowCount;
          BOOL v32 = 1;
        }
        else
        {
          v73 = __biome_log_for_category();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
            -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:]();
          }

          BOOL v32 = 0;
        }
        id v62 = v72;
        id v23 = v80;
LABEL_66:

        id v58 = v62;
        uint64_t v20 = v59;
        uint64_t v33 = v84;
        id v36 = (void *)v88;
        goto LABEL_55;
      }
      BOOL v32 = 1;
    }
    else
    {
      id v34 = __biome_log_for_category();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater _deleteSourceItemIdHash:outProvenanceRowId:]();
      }

      BOOL v32 = 0;
    }
    id v17 = v31;
    uint64_t v33 = v84;
LABEL_28:
    id v36 = v86;
LABEL_32:

    BOOL v7 = v36;
    id v9 = v85;
    goto LABEL_33;
  }
  uint64_t v33 = __biome_log_for_category();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.8();
  }
LABEL_19:
  BOOL v32 = 0;
LABEL_33:

  return v32;
}

- (BOOL)tombstoneContentSequenceNumbersInRange:(_NSRange)a3 forDeviceRowId:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v37[5] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:location];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:length + location - 1];
  deviceRowId = self->_deviceRowId;
  v37[0] = &unk_26FDCD5E0;
  v37[1] = deviceRowId;
  v37[2] = v8;
  v37[3] = v9;
  id v34 = (void *)v9;
  v37[4] = &unk_26FDCD610;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:5];
  uint64_t v12 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD640];
  if ([v12 updateParameters:v11])
  {
    uint64_t v13 = v12;
  }
  else
  {
    int v31 = length;
    id v33 = v7;
    uint64_t v14 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v7];
    char v15 = [v11 objectAtIndex:2];
    char v16 = [v11 objectAtIndex:3];
    uint64_t v17 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_sequence_number" BETWEENLowerColumnValue:v15 ANDUpperColumnValue:v16];

    id v18 = [v11 objectAtIndex:4];
    uint64_t v19 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_state" EQUALSColumnValue:v18];

    BOOL v32 = (void *)v14;
    v36[0] = v14;
    v36[1] = v17;
    char v30 = (void *)v17;
    v36[2] = v19;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
    char v21 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v20];

    uint64_t v22 = +[CCDatabaseUpdate builderWithTableName:@"provenance"];
    id v23 = [v11 objectAtIndex:0];
    [v22 setValue:v23 forColumn:@"content_state"];

    [v22 setCommandCriterion:v21];
    uint64_t v13 = [v22 build];

    if (v13)
    {
      [(NSMutableDictionary *)self->_commandCache setObject:v13 forKey:&unk_26FDCD640];
    }
    else
    {
      uint64_t v24 = __biome_log_for_category();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();
      }
    }
    LODWORD(length) = v31;

    id v7 = v33;
    if (!v13)
    {
      id v27 = 0;
      char v26 = 0;
      goto LABEL_15;
    }
  }
  database = self->_database;
  id v35 = 0;
  char v26 = [(CCDatabaseReadWriteAccess *)database executeCommand:v13 error:&v35];
  id v27 = v35;
  if (v26)
  {
    self->_sharedItemRemovedCount += length;
    self->_modifiedRowCount += length;
  }
  else
  {
    uint64_t v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater tombstoneContentSequenceNumbersInRange:forDeviceRowId:]();
    }
  }
LABEL_15:

  return v26;
}

- (BOOL)deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord
{
  v23[2] = *MEMORY[0x263EF8340];
  BOOL v3 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
  BOOL v4 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_hash" onTable:@"content" EQUALSColumnName:@"content_hash" onTable:@"provenance"];
  v23[0] = v4;
  uint64_t v5 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_state" EQUALSColumnValue:&unk_26FDCD610];
  v23[1] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  id v7 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v6];

  [v3 setCommandCriterion:v7];
  uint64_t v8 = +[CCDatabaseDelete builderWithTableName:@"content"];
  uint64_t v9 = [v3 build];
  uint64_t v10 = +[CCSQLCommandCriterion criterionWithNOTEXISTSSubQuery:v9];
  [v8 setCommandCriterion:v10];

  id v11 = [v8 build];
  database = self->_database;
  id v22 = 0;
  LOBYTE(v5) = [(CCDatabaseReadWriteAccess *)database executeCommand:v11 error:&v22];
  id v13 = v22;
  if (v5)
  {
    uint64_t v14 = self->_database;
    id v21 = v13;
    int v15 = [(CCDatabaseReadWriteAccess *)v14 rowsModified:&v21];
    id v16 = v21;

    if (v15 < 0)
    {
      uint64_t v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord]();
      }

      BOOL v17 = 0;
    }
    else
    {
      self->_modifiedRowCount += v15;
      BOOL v17 = 1;
    }
    id v13 = v16;
  }
  else
  {
    id v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord]();
    }

    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)compactContiguousRunsOfDeletesInDatabase:(id)a3 deletedCount:(unint64_t *)a4 shouldDefer:(id)a5
{
  v122[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_249B92000, v7, OS_LOG_TYPE_DEFAULT, "Starting database tombstone compaction operation", buf, 2u);
  }

  uint64_t v8 = [[CCDatabaseSetStateReader alloc] initWithDatabaseAccess:v6];
  id v110 = 0;
  id v111 = 0;
  id v108 = 0;
  id v109 = 0;
  BOOL v9 = [(CCDatabaseSetStateReader *)v8 constructStateVectorsFromDatabaseOutContent:&v111 outMetaContent:&v110 outDeviceMapping:&v109 error:&v108];
  id v10 = v111;
  id v11 = v110;
  id v12 = v109;
  id v13 = v108;
  uint64_t v14 = v13;
  if (v9)
  {
    __int16 v94 = v10;
    id v95 = v8;
    v79 = a4;
    v82 = v13;
    v90 = v12;
    id v91 = v11;
    int v15 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_state" EQUALSColumnValue:&unk_26FDCD5E0];
    uint64_t v16 = +[CCSQLCommandCriterion criterionWithColumnName:EQUALSColumnValue:](CCSQLCommandCriterion, "criterionWithColumnName:EQUALSColumnValue:");
    BOOL v17 = +[CCDatabaseUpdate builderWithTableName:](CCDatabaseUpdate, "builderWithTableName:");
    id v18 = [MEMORY[0x263EFF9D0] null];
    uint64_t v19 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_sequence_number" ISNOTColumnValue:v18];

    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
    uint64_t v21 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_sequence_number" ISNOTColumnValue:v20];

    id v83 = (void *)v19;
    v122[0] = v19;
    v122[1] = v21;
    BOOL v89 = (void *)v21;
    id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v122 count:2];
    uint64_t v23 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v22];

    id v92 = v15;
    id v93 = (void *)v16;
    v121[0] = v15;
    v121[1] = v16;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:2];
    uint64_t v25 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v24];

    v87 = (void *)v25;
    uint64_t v88 = (void *)v23;
    v120[0] = v25;
    v120[1] = v23;
    char v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:2];
    id v27 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v26];
    [v17 setCommandCriterion:v27];

    uint64_t v28 = [MEMORY[0x263EFF9D0] null];
    [v17 setValue:v28 forColumn:@"content_sequence_number_end_of_run"];

    uint64_t v29 = [MEMORY[0x263EFF9D0] null];
    [v17 setValue:v29 forColumn:@"metacontent_sequence_number_end_of_run"];

    v84 = v17;
    char v30 = [v17 build];
    int v31 = __biome_log_for_category();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.5(v30);
    }

    id v107 = 0;
    char v32 = [v6 executeCommand:v30 error:&v107];
    v85 = v30;
    id v86 = v107;
    if ((v32 & 1) == 0)
    {
      id v66 = __biome_log_for_category();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.4();
      }
      char v60 = 0;
      id v12 = v90;
      id v11 = v91;
      uint64_t v65 = v92;
      uint64_t v67 = (void *)v19;
      v68 = v84;
      uint64_t v14 = v82;
      goto LABEL_31;
    }
    v103[0] = MEMORY[0x263EF8330];
    v103[1] = 3221225472;
    v103[2] = __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke;
    v103[3] = &unk_26527AC60;
    id v33 = v90;
    v104 = v33;
    id v34 = v15;
    v105 = v34;
    id v78 = v6;
    id v35 = v6;
    id v106 = v35;
    [v94 enumerateAllClockValuesUsingBlock:v103];
    v98[0] = MEMORY[0x263EF8330];
    v98[1] = 3221225472;
    v98[2] = __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_32;
    v98[3] = &unk_26527AC88;
    v99 = v33;
    id v36 = v34;
    v100 = v36;
    id v37 = v93;
    id v101 = v37;
    id v71 = v35;
    id v102 = v71;
    [v91 enumerateAllClockValuesUsingBlock:v98];
    v38 = [MEMORY[0x263EFF9D0] null];
    uint64_t v39 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_sequence_number_end_of_run" ISColumnValue:v38];

    objc_super v40 = [MEMORY[0x263EFF9D0] null];
    uint64_t v41 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_sequence_number_end_of_run" ISColumnValue:v40];

    v119[0] = v39;
    v119[1] = v41;
    id v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:2];
    uint64_t v43 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v42];

    v76 = (void *)v43;
    v77 = (void *)v41;
    v118[0] = v41;
    v118[1] = v43;
    uint64_t v44 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:2];
    uint64_t v45 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v44];

    v117[0] = v36;
    v117[1] = v37;
    uint64_t v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:2];
    uint64_t v47 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v46];

    v74 = (void *)v47;
    v75 = (void *)v45;
    v116[0] = v47;
    v116[1] = v45;
    uint64_t v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:2];
    uint64_t v49 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v48];

    id v50 = v39;
    uint64_t v51 = [MEMORY[0x263EFF9D0] null];
    uint64_t v52 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_state" ISColumnValue:v51];

    v115[0] = v36;
    v115[1] = v52;
    v73 = (void *)v52;
    v80 = v50;
    v115[2] = v50;
    v53 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:3];
    uint64_t v54 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v53];

    v114[0] = v49;
    v114[1] = v54;
    id v72 = (void *)v54;
    uint64_t v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:2];
    uint64_t v56 = +[CCSQLCommandCriterion criterionWithORSubCriteria:v55];

    char v57 = +[CCDatabaseDelete builderWithTableName:@"provenance"];
    v81 = (void *)v56;
    [v57 setCommandCriterion:v56];
    id v58 = [v57 build];
    v59 = __biome_log_for_category();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:](v58);
    }

    id v97 = 0;
    char v60 = [v71 executeCommand:v58 error:&v97];
    id v61 = v97;
    uint64_t v14 = v82;
    if ((v60 & 1) == 0)
    {
      uint64_t v69 = __biome_log_for_category();
      uint64_t v8 = v95;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
        +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:]();
      }
      goto LABEL_30;
    }
    id v96 = v82;
    unsigned int v62 = [v71 rowsModified:&v96];
    id v63 = v96;

    uint64_t v8 = v95;
    if ((v62 & 0x80000000) != 0)
    {
      v64 = __biome_log_for_category();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
        +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:]();
      }
      unsigned int v62 = 0;
    }
    else
    {
      if (!v62)
      {
LABEL_26:
        uint64_t v14 = v63;
        if (v79) {
          unint64_t *v79 = v62;
        }
        uint64_t v69 = __biome_log_for_category();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          unsigned int v113 = v62;
          _os_log_impl(&dword_249B92000, v69, OS_LOG_TYPE_DEFAULT, "Finished database tombstone compaction operation with deleted count: %u", buf, 8u);
        }
LABEL_30:
        id v12 = v90;
        id v11 = v91;

        id v66 = v104;
        id v6 = v78;
        uint64_t v65 = v92;
        uint64_t v67 = v83;
        v68 = v84;
LABEL_31:

        id v10 = v94;
        goto LABEL_32;
      }
      v64 = __biome_log_for_category();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v113 = v62;
        _os_log_impl(&dword_249B92000, v64, OS_LOG_TYPE_DEFAULT, "Deleted %u tombstone(s) from the database.", buf, 8u);
      }
    }

    goto LABEL_26;
  }
  uint64_t v65 = __biome_log_for_category();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
    +[CCDatabaseUpdater compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:].cold.6();
  }
  char v60 = 0;
LABEL_32:

  return v60;
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  v27[3] = *MEMORY[0x263EF8340];
  if (a6 == 2 && a4)
  {
    id v9 = a2;
    id v10 = +[CCDatabaseUpdate builderWithTableName:@"provenance"];
    id v11 = [*(id *)(a1 + 32) deviceRowIdForSiteIdentifier:v9];

    id v12 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v11];
    id v13 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v14 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_sequence_number" EQUALSColumnValue:v13];

    int v15 = [MEMORY[0x263EFF9D0] null];
    [v10 setValue:v15 forColumn:@"content_hash"];

    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
    [v10 setValue:v16 forColumn:@"instance_hash"];

    BOOL v17 = [NSNumber numberWithUnsignedInteger:a3 + a4];
    [v10 setValue:v17 forColumn:@"content_sequence_number_end_of_run"];

    v27[0] = v12;
    v27[1] = v14;
    void v27[2] = *(void *)(a1 + 40);
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:3];
    uint64_t v19 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v18];
    [v10 setCommandCriterion:v19];

    uint64_t v20 = [v10 build];
    uint64_t v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_2(v20);
    }

    id v22 = *(void **)(a1 + 48);
    id v26 = 0;
    char v23 = [v22 executeCommand:v20 error:&v26];
    id v24 = v26;
    if ((v23 & 1) == 0)
    {
      uint64_t v25 = __biome_log_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_1();
      }
    }
  }
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_32(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  v28[4] = *MEMORY[0x263EF8340];
  if (a6 == 2 && a4)
  {
    id v9 = a2;
    id v10 = +[CCDatabaseUpdate builderWithTableName:@"provenance"];
    id v11 = [*(id *)(a1 + 32) deviceRowIdForSiteIdentifier:v9];

    id v12 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v11];
    id v13 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v14 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_sequence_number" EQUALSColumnValue:v13];

    int v15 = [MEMORY[0x263EFF9D0] null];
    [v10 setValue:v15 forColumn:@"content_hash"];

    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
    [v10 setValue:v16 forColumn:@"instance_hash"];

    BOOL v17 = [NSNumber numberWithUnsignedInteger:a3 + a4];
    [v10 setValue:v17 forColumn:@"metacontent_sequence_number_end_of_run"];

    v28[0] = v12;
    v28[1] = v14;
    uint64_t v18 = *(void *)(a1 + 48);
    v28[2] = *(void *)(a1 + 40);
    void v28[3] = v18;
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
    uint64_t v20 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v19];
    [v10 setCommandCriterion:v20];

    uint64_t v21 = [v10 build];
    id v22 = __biome_log_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_32_cold_2(v21);
    }

    char v23 = *(void **)(a1 + 56);
    id v27 = 0;
    char v24 = [v23 executeCommand:v21 error:&v27];
    id v25 = v27;
    if ((v24 & 1) == 0)
    {
      id v26 = __biome_log_for_category();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_32_cold_1();
      }
    }
  }
}

- (BOOL)_insertDeviceReturningRowId:(id *)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  v31[0] = @"device_id";
  v31[1] = @"options";
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
  id v6 = +[CCDatabaseInsert builderWithTableName:@"device" columnNames:v5];

  v30[0] = self->_deviceId;
  id v7 = [NSNumber numberWithUnsignedChar:self->_deviceOptions];
  v30[1] = v7;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  [v6 setColumnValues:v8];

  uint64_t v29 = @"device_row_id";
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  [v6 setReturningColumns:v9];

  id v22 = 0;
  id v10 = [v6 buildWithError:&v22];
  id v11 = v22;
  database = self->_database;
  id v20 = 0;
  id v21 = v11;
  char v13 = [(CCDatabaseReadWriteAccess *)database executeCommand:v10 error:&v21 returningRow:&v20];
  id v14 = v21;

  id v15 = v20;
  uint64_t v16 = v15;
  if (v13)
  {
    *a3 = [v15 numberValueAtColumnIndex:0];
    ++self->_modifiedRowCount;
  }
  else
  {
    BOOL v17 = __biome_log_for_category();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [(CCDatabaseUpdater *)self description];
      *(_DWORD *)buf = 138412802;
      char v24 = v10;
      __int16 v25 = 2112;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_error_impl(&dword_249B92000, v17, OS_LOG_TYPE_ERROR, "Insert %@ failed. %@ error: %@", buf, 0x20u);
    }
  }

  return v13;
}

- (BOOL)insertItemWithSourceItemIdHash:(id)a3 instanceHash:(id)a4 contentHash:(id)a5 metaContent:(id)a6 content:(id)a7 isDuplicate:(BOOL *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v28 = 0;
  LODWORD(a6) = [(CCDatabaseUpdater *)self _insertMetaContent:a6 instanceHash:v15 outSequenceNumber:&v28 outIsDuplicate:a8];
  id v18 = v28;
  if (a6)
  {
    id v27 = 0;
    BOOL v19 = [(CCDatabaseUpdater *)self _insertContent:v17 contentHash:v16 outSequenceNumber:&v27];
    id v20 = v27;
    if (v19)
    {
      deviceRowId = self->_deviceRowId;
      id v26 = 0;
      BOOL v22 = [(CCDatabaseUpdater *)self _insertProvenanceForItemWithContentHash:v16 contentSequenceNumber:v20 metaContentSequenceNumber:v18 instanceHash:v15 onDeviceRowId:deviceRowId insertedRowId:&v26];
      id v23 = v26;
      BOOL v24 = v22
         && [(CCDatabaseUpdater *)self _insertLocalInstanceForItemWithSourceItemIdHash:v14 provenanceRowId:v23];
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)insertContent:(id)a3 contentHash:(id)a4 sequenceNumber:(id)a5 onDeviceRowId:(id)a6
{
  v35[4] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(CCDatabaseUpdater *)self _insertContentIfNotExists:a3 contentHash:v10])
  {
    v35[0] = v12;
    v35[1] = v10;
    v35[2] = v11;
    v35[3] = &unk_26FDCD610;
    char v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];
    id v14 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD658];
    if ([v14 updateParameters:v13])
    {
      id v15 = 0;
      id v16 = v14;
    }
    else
    {
      v34[0] = @"device_row_id";
      v34[1] = @"content_hash";
      v34[2] = @"content_sequence_number";
      v34[3] = @"content_state";
      id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
      id v16 = +[CCDatabaseInsert builderWithTableName:@"provenance" columnNames:v18];

      [v16 setColumnValues:v13];
      id v27 = 0;
      uint64_t v19 = [v16 buildWithError:&v27];
      id v15 = v27;

      if (!v19)
      {
        id v23 = __biome_log_for_category();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          __int16 v25 = [(CCDatabaseUpdater *)self description];
          *(_DWORD *)buf = 138412802;
          uint64_t v29 = v13;
          __int16 v30 = 2112;
          int v31 = v25;
          __int16 v32 = 2112;
          id v33 = v15;
          _os_log_error_impl(&dword_249B92000, v23, OS_LOG_TYPE_ERROR, "Failed to build provenance with params: {%@}, %@ error: %@", buf, 0x20u);
        }
        goto LABEL_13;
      }
      [(NSMutableDictionary *)self->_commandCache setObject:v19 forKey:&unk_26FDCD658];

      id v16 = (void *)v19;
    }
    id v20 = v15;
    database = self->_database;
    id v26 = v15;
    int v22 = [(CCDatabaseReadWriteAccess *)database executeCommand:v16 error:&v26];
    id v15 = v26;

    if (v22)
    {
      ++self->_modifiedRowCount;
      BOOL v17 = 1;
LABEL_14:

      goto LABEL_15;
    }
    id v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:]();
    }
LABEL_13:

    BOOL v17 = 0;
    goto LABEL_14;
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)_insertMetaContent:(id)a3 instanceHash:(id)a4 outSequenceNumber:(id *)a5 outIsDuplicate:(BOOL *)a6
{
  v46[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  v46[0] = v11;
  v46[1] = v10;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:2];
  char v13 = [(CCDatabaseUpdater *)self _incrementLocalHighestMetaContentSequenceNumber];
  if (v13)
  {
    id v33 = a6;
    id v14 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD670];
    if ([v14 updateParameters:v12])
    {
      id v15 = 0;
    }
    else
    {
      id v32 = v10;
      v45[0] = @"instance_hash";
      v45[1] = @"metacontent";
      BOOL v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
      id v18 = +[CCDatabaseInsert builderWithTableName:@"metacontent" columnNames:v17];

      [v18 setColumnValues:v12];
      id v36 = 0;
      uint64_t v19 = [v18 buildWithError:&v36];
      id v15 = v36;

      if (!v19)
      {
        id v27 = __biome_log_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = [(CCDatabaseUpdater *)self description];
          *(_DWORD *)buf = 138412802;
          id v38 = v12;
          __int16 v39 = 2112;
          id v40 = v29;
          __int16 v41 = 2112;
          id v42 = v15;
          _os_log_error_impl(&dword_249B92000, v27, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);
        }
        id v14 = 0;
        BOOL v16 = 0;
        id v10 = v32;
        goto LABEL_25;
      }
      [(NSMutableDictionary *)self->_commandCache setObject:v19 forKey:&unk_26FDCD670];

      id v14 = (void *)v19;
      id v10 = v32;
    }
    id v20 = v15;
    database = self->_database;
    id v35 = v15;
    int v22 = [(CCDatabaseReadWriteAccess *)database executeCommand:v14 error:&v35];
    id v15 = v35;

    if (v22)
    {
      ++self->_modifiedRowCount;
      if (a5) {
        *a5 = v13;
      }
      BOOL v16 = 1;
    }
    else
    {
      id v23 = __biome_log_for_category();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:]();
      }

      if (CCDatabaseUnderlyingError(v15) == 1555)
      {
        if (v33) {
          *id v33 = 1;
        }
        id v34 = 0;
        BOOL v24 = [(CCDatabaseUpdater *)self _selectMetaContentWithInstanceHash:v11 outRecord:&v34];
        id v25 = v34;
        if (v24)
        {
          id v26 = __biome_log_for_category();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            __int16 v30 = [v25 instanceHash];
            int v31 = [v25 metaContent];
            *(_DWORD *)buf = 138413058;
            id v38 = v11;
            __int16 v39 = 2112;
            id v40 = v10;
            __int16 v41 = 2112;
            id v42 = v30;
            __int16 v43 = 2112;
            uint64_t v44 = v31;
            _os_log_error_impl(&dword_249B92000, v26, OS_LOG_TYPE_ERROR, "Attempt to insert:\n\n\t{instanceHash: %@ metaContent: %@}\n\ncollided with existing record:\n\n\t{instanceHash: %@ metaContent: %@}", buf, 0x2Au);
          }
        }
      }
      BOOL v16 = 0;
    }
LABEL_25:

    goto LABEL_26;
  }
  id v15 = 0;
  BOOL v16 = 0;
LABEL_26:

  return v16;
}

- (BOOL)_insertContent:(id)a3 contentHash:(id)a4 outSequenceNumber:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v16 = 0;
  BOOL v10 = [(CCDatabaseUpdater *)self _selectLocalDeviceProvenenceWithContentHash:v9 outSequenceNumber:&v16];
  id v11 = v16;
  id v12 = v11;
  if (v10)
  {
    if (v11)
    {
      *a5 = v11;
      BOOL v13 = 1;
    }
    else
    {
      id v14 = [(CCDatabaseUpdater *)self _incrementLocalHighestContentSequenceNumber];
      if (v14
        && [(CCDatabaseUpdater *)self _insertContentIfNotExists:v8 contentHash:v9])
      {
        *a5 = v14;
        BOOL v13 = 1;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)_insertContentIfNotExists:(id)a3 contentHash:(id)a4
{
  v36[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v36[0] = v7;
  v36[1] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  id v9 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD688];
  if ([v9 updateParameters:v8])
  {
    id v10 = 0;
    id v11 = v9;
  }
  else
  {
    v35[0] = @"content_hash";
    v35[1] = @"content";
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    id v11 = +[CCDatabaseInsert builderWithTableName:@"content" columnNames:v12];

    [v11 setColumnValues:v8];
    BOOL v13 = +[CCDatabaseOnConflict onConflictWithType:1];
    [v11 setOnConflict:v13];

    id v28 = 0;
    uint64_t v14 = [v11 buildWithError:&v28];
    id v10 = v28;

    if (!v14)
    {
      id v21 = __biome_log_for_category();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v25 = [(CCDatabaseUpdater *)self description];
        *(_DWORD *)buf = 138412802;
        __int16 v30 = v8;
        __int16 v31 = 2112;
        id v32 = v25;
        __int16 v33 = 2112;
        id v34 = v10;
        _os_log_error_impl(&dword_249B92000, v21, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);
      }
      goto LABEL_13;
    }
    [(NSMutableDictionary *)self->_commandCache setObject:v14 forKey:&unk_26FDCD688];

    id v11 = (void *)v14;
  }
  id v15 = v10;
  database = self->_database;
  id v27 = v10;
  char v17 = [(CCDatabaseReadWriteAccess *)database executeCommand:v11 error:&v27];
  id v10 = v27;

  if ((v17 & 1) == 0)
  {
    id v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:]();
    }
LABEL_13:

    BOOL v22 = 0;
    goto LABEL_20;
  }
  id v18 = self->_database;
  id v26 = v10;
  int v19 = [(CCDatabaseReadWriteAccess *)v18 rowsModified:&v26];
  id v20 = v26;

  if (v19 < 0)
  {
    id v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater _insertContentIfNotExists:contentHash:]();
    }

    BOOL v22 = 0;
  }
  else
  {
    if (v19)
    {
      self->_modifiedRowCount += v19;
      ++self->_sharedItemAddedCount;
    }
    else
    {
      ++self->_sharedItemProvenanceUpdatedCount;
    }
    BOOL v22 = 1;
  }
  id v10 = v20;
LABEL_20:

  return v22;
}

- (BOOL)_insertProvenanceForItemWithContentHash:(id)a3 contentSequenceNumber:(id)a4 metaContentSequenceNumber:(id)a5 instanceHash:(id)a6 onDeviceRowId:(id)a7 insertedRowId:(id *)a8
{
  v50[7] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  int v19 = v18;
  if (v15)
  {
    id v36 = a8;
    id v37 = v16;
    v50[0] = v18;
    v50[1] = v14;
    id v38 = v14;
    v50[2] = v17;
    v50[3] = v15;
    v50[4] = &unk_26FDCD610;
    v50[5] = v16;
    v50[6] = &unk_26FDCD610;
    id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:7];
    id v21 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD6A0];
    if ([v21 updateParameters:v20])
    {
      BOOL v22 = 0;
    }
    else
    {
      v49[0] = @"device_row_id";
      v49[1] = @"content_hash";
      v49[2] = @"instance_hash";
      v49[3] = @"content_sequence_number";
      v49[4] = @"content_state";
      v49[5] = @"metacontent_sequence_number";
      v49[6] = @"metacontent_state";
      BOOL v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:7];
      id v25 = +[CCDatabaseInsert builderWithTableName:@"provenance" columnNames:v24];

      [v25 setColumnValues:v20];
      uint64_t v48 = @"provenance_row_id";
      id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
      [v25 setReturningColumns:v26];

      id v41 = 0;
      uint64_t v27 = [v25 buildWithError:&v41];
      BOOL v22 = v41;

      if (!v27)
      {
        __int16 v31 = __biome_log_for_category();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v35 = [(CCDatabaseUpdater *)self description];
          *(_DWORD *)buf = 138412802;
          __int16 v43 = v20;
          __int16 v44 = 2112;
          uint64_t v45 = v35;
          __int16 v46 = 2112;
          uint64_t v47 = v22;
          _os_log_error_impl(&dword_249B92000, v31, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);
        }
        char v23 = 0;
        id v21 = v25;
        goto LABEL_17;
      }
      [(NSMutableDictionary *)self->_commandCache setObject:v27 forKey:&unk_26FDCD6A0];

      id v21 = (void *)v27;
    }
    id v28 = v22;
    database = self->_database;
    id v39 = 0;
    id v40 = v22;
    char v23 = [(CCDatabaseReadWriteAccess *)database executeCommand:v21 error:&v40 returningRow:&v39];
    BOOL v22 = v40;

    __int16 v30 = v39;
    __int16 v31 = v30;
    if (v23)
    {
      id *v36 = [v30 numberValueAtColumnIndex:0];
      ++self->_modifiedRowCount;
    }
    else
    {
      id v32 = __biome_log_for_category();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        id v34 = [(CCDatabaseUpdater *)self description];
        *(_DWORD *)buf = 138412802;
        __int16 v43 = v21;
        __int16 v44 = 2112;
        uint64_t v45 = v34;
        __int16 v46 = 2112;
        uint64_t v47 = v22;
        _os_log_error_impl(&dword_249B92000, v32, OS_LOG_TYPE_ERROR, "Insert %@ failed. %@ error: %@", buf, 0x20u);
      }
    }
LABEL_17:

    id v16 = v37;
    id v14 = v38;
    goto LABEL_18;
  }
  BOOL v22 = __biome_log_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseUpdater _insertProvenanceForItemWithContentHash:contentSequenceNumber:metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:](self, v22);
  }
  char v23 = 0;
LABEL_18:

  return v23;
}

- (BOOL)_insertLocalInstanceForItemWithSourceItemIdHash:(id)a3 provenanceRowId:(id)a4
{
  v30[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v30[0] = v6;
  v30[1] = v7;
  void v30[2] = self->_startTimeMicros;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  id v9 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD6B8];
  if ([v9 updateParameters:v8])
  {
    id v10 = 0;
    id v11 = v9;
  }
  else
  {
    v29[0] = @"source_item_id_hash";
    v29[1] = @"provenance_row_id";
    v29[2] = @"modified";
    id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:3];
    id v11 = +[CCDatabaseInsert builderWithTableName:@"instance" columnNames:v12];

    [v11 setColumnValues:v8];
    id v22 = 0;
    uint64_t v13 = [v11 buildWithError:&v22];
    id v10 = v22;

    if (!v13)
    {
      id v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v20 = [(CCDatabaseUpdater *)self description];
        *(_DWORD *)buf = 138412802;
        BOOL v24 = v8;
        __int16 v25 = 2112;
        id v26 = v20;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_error_impl(&dword_249B92000, v18, OS_LOG_TYPE_ERROR, "Failed to build Insert with params: {%@}, %@ error: %@", buf, 0x20u);
      }
      goto LABEL_11;
    }
    [(NSMutableDictionary *)self->_commandCache setObject:v13 forKey:&unk_26FDCD6B8];

    id v11 = (void *)v13;
  }
  id v14 = v10;
  database = self->_database;
  id v21 = v10;
  int v16 = [(CCDatabaseReadWriteAccess *)database executeCommand:v11 error:&v21];
  id v10 = v21;

  if (!v16)
  {
    id v18 = __biome_log_for_category();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater insertContent:contentHash:sequenceNumber:onDeviceRowId:]();
    }
LABEL_11:

    BOOL v17 = 0;
    goto LABEL_12;
  }
  *(int32x2_t *)&self->_modifiedRowCount = vadd_s32(*(int32x2_t *)&self->_modifiedRowCount, (int32x2_t)0x100000001);
  BOOL v17 = 1;
LABEL_12:

  return v17;
}

+ (BOOL)insertOrUpdateLastMaintenanceDate:(id)a3 database:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v6 = NSNumber;
  id v7 = a4;
  [a3 timeIntervalSinceReferenceDate];
  id v8 = objc_msgSend(v6, "numberWithDouble:");
  LOBYTE(a1) = [a1 _writeRecordWithKey:@"lastMaintenanceDate" stringValue:0 integerValue:v8 dataValue:0 onConflictType:2 database:v7];

  return (char)a1;
}

+ (BOOL)insertOrUpdateLocalDeviceIdentifier:(id)a3 database:(id)a4
{
  if (a3) {
    return [a1 _writeRecordWithKey:@"localDeviceIdentifier" stringValue:a3 integerValue:0 dataValue:0 onConflictType:2 database:a4];
  }
  else {
    return 0;
  }
}

+ (BOOL)insertResourceVersion:(id)a3 database:(id)a4
{
  if (a3) {
    return [a1 _writeRecordWithKey:@"resourceVersion" stringValue:0 integerValue:a3 dataValue:0 onConflictType:3 database:a4];
  }
  else {
    return 0;
  }
}

+ (BOOL)insertOrUpdateLastDeltaDate:(id)a3 database:(id)a4
{
  return [a1 _writeRecordWithKey:@"lastDeltaDate" stringValue:0 integerValue:a3 dataValue:0 onConflictType:2 database:a4];
}

- (BOOL)selectProvenanceWithContentSequenceNumber:(id)a3 onDeviceRowId:(id)a4 outProvenanceRowId:(id *)a5
{
  v29[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_sequence_number" EQUALSColumnValue:v8];
  id v11 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v9];
  v29[0] = v10;
  v29[1] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  uint64_t v13 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v12];

  id v14 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
  [v14 setCommandCriterion:v13];
  id v15 = [v14 build];
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__11;
  __int16 v27 = __Block_byref_object_dispose__11;
  id v28 = 0;
  database = self->_database;
  uint64_t v17 = objc_opt_class();
  v21[4] = &v23;
  id v22 = 0;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __96__CCDatabaseUpdater_selectProvenanceWithContentSequenceNumber_onDeviceRowId_outProvenanceRowId___block_invoke;
  v21[3] = &unk_26527A070;
  char v18 = [(CCDatabaseReadWriteAccess *)database enumerateRecordResultsOfSelect:v15 recordClass:v17 error:&v22 usingBlock:v21];
  id v19 = v22;
  if (a5)
  {
    *a5 = [(id)v24[5] provenanceRowId];
  }
  _Block_object_dispose(&v23, 8);

  return v18;
}

uint64_t __96__CCDatabaseUpdater_selectProvenanceWithContentSequenceNumber_onDeviceRowId_outProvenanceRowId___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  return 1;
}

- (BOOL)_selectProvenenceWithRowId:(id)a3 outInstanceHash:(id *)a4 outContentHash:(id *)a5
{
  v36[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v36[0] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:1];
  id v10 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD6E8];
  if ([v10 updateParameters:v9])
  {
    uint64_t v11 = (uint64_t)v10;
LABEL_5:
    uint64_t v29 = 0;
    __int16 v30 = &v29;
    uint64_t v31 = 0x3032000000;
    id v32 = __Block_byref_object_copy__11;
    __int16 v33 = __Block_byref_object_dispose__11;
    id v34 = 0;
    uint64_t v23 = 0;
    BOOL v24 = &v23;
    uint64_t v25 = 0x3032000000;
    id v26 = __Block_byref_object_copy__11;
    __int16 v27 = __Block_byref_object_dispose__11;
    id v28 = 0;
    database = self->_database;
    void v21[5] = &v23;
    id v22 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke;
    v21[3] = &unk_26527AD28;
    v21[4] = &v29;
    char v16 = [(CCDatabaseReadWriteAccess *)database enumerateRowResultsOfSelect:v11 error:&v22 usingBlock:v21];
    id v17 = v22;
    if (v16)
    {
      if (a4) {
        *a4 = (id) v30[5];
      }
      if (a5) {
        *a5 = (id) v24[5];
      }
    }
    else
    {
      char v18 = __biome_log_for_category();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [(CCDatabaseUpdater *)self description];
        objc_claimAutoreleasedReturnValue();
        -[CCDatabaseUpdater _selectDeviceRowId:options:]();
      }
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    id v12 = (void *)v11;
    goto LABEL_14;
  }
  id v12 = +[CCSQLCommandCriterion criterionWithColumnName:@"provenance_row_id" EQUALSColumnValue:v8];
  uint64_t v13 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
  [v13 setCommandCriterion:v12];
  v35[0] = @"instance_hash";
  v35[1] = @"content_hash";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  [v13 setColumns:v14];

  uint64_t v11 = [v13 build];

  if (v11)
  {
    [(NSMutableDictionary *)self->_commandCache setObject:v11 forKey:&unk_26FDCD6E8];

    goto LABEL_5;
  }
  id v20 = __biome_log_for_category();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:]();
  }

  id v17 = 0;
  char v16 = 0;
LABEL_14:

  return v16;
}

uint64_t __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 1;
  *a4 = 1;
  if (v6)
  {
    if ([v6 count])
    {
      if ([v7 count] == 2)
      {
        uint64_t v9 = [v7 numberValueAtColumnIndex:0];
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        uint64_t v8 = 1;
        uint64_t v12 = [v7 numberValueAtColumnIndex:1];
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        id v14 = *(void **)(v13 + 40);
        *(void *)(v13 + 40) = v12;
      }
      else
      {
        id v15 = __biome_log_for_category();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke_cold_1();
        }

        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 1;
    }
  }

  return v8;
}

- (BOOL)_selectProvenanceWithContentHash:(id)a3 outLocalInstancePresent:(BOOL *)a4 outRemoteContentPresent:(BOOL *)a5
{
  v40[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v40[0] = v6;
  v40[1] = &unk_26FDCD610;
  v40[2] = &unk_26FDCD5E0;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:3];
  uint64_t v8 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD700];
  if ([v8 updateParameters:v7])
  {
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v10 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
    uint64_t v11 = [v7 objectAtIndex:0];
    __int16 v27 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_hash" EQUALSColumnValue:v11];

    uint64_t v12 = [v7 objectAtIndex:1];
    uint64_t v13 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_state" EQUALSColumnValue:v12];

    id v14 = [v7 objectAtIndex:2];
    id v15 = +[CCSQLCommandCriterion criterionWithColumnName:@"metacontent_state" ISNOTColumnValue:v14];

    v39[0] = v27;
    v39[1] = v13;
    v39[2] = v15;
    char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:3];
    id v17 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v16];

    [v10 setCommandCriterion:v17];
    id v38 = @"device_row_id";
    char v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
    [v10 setColumns:v18];

    uint64_t v9 = [v10 build];

    if (v9)
    {
      [(NSMutableDictionary *)self->_commandCache setObject:v9 forKey:&unk_26FDCD700];
    }
    else
    {
      id v19 = __biome_log_for_category();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:]();
      }
    }
    if (!v9)
    {
      id v22 = 0;
      LOBYTE(v21) = 0;
      goto LABEL_18;
    }
  }
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  database = self->_database;
  v28[6] = &v30;
  id v29 = 0;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke;
  void v28[3] = &unk_26527ACB0;
  v28[4] = self;
  void v28[5] = &v34;
  int v21 = [(CCDatabaseReadWriteAccess *)database enumerateRowResultsOfSelect:v9 error:&v29 usingBlock:v28];
  id v22 = v29;
  if (v21)
  {
    if (a4) {
      *a4 = *((unsigned char *)v35 + 24);
    }
    if (a5) {
      *a5 = *((unsigned char *)v31 + 24);
    }
  }
  else
  {
    uint64_t v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      [(CCDatabaseUpdater *)self description];
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:]();
    }
  }
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

LABEL_18:
  return v21;
}

uint64_t __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && *(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v8 = 1;
    *a4 = 1;
  }
  else if (v6 && [v6 count])
  {
    if ([v7 count] == 1)
    {
      uint64_t v9 = [v7 numberValueAtColumnIndex:0];
      if ([v9 isEqual:*(void *)(a1[4] + 168)]) {
        uint64_t v10 = a1[5];
      }
      else {
        uint64_t v10 = a1[6];
      }
      uint64_t v8 = 1;
      *(unsigned char *)(*(void *)(v10 + 8) + 24) = 1;
    }
    else
    {
      uint64_t v11 = __biome_log_for_category();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke_cold_1();
      }

      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

- (BOOL)_selectLocalDeviceProvenenceWithContentHash:(id)a3 outSequenceNumber:(id *)a4
{
  void v36[3] = *MEMORY[0x263EF8340];
  id v25 = a3;
  v36[0] = v25;
  v36[1] = &unk_26FDCD610;
  void v36[2] = self->_deviceRowId;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
  id v6 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD718];
  if ([v6 updateParameters:v5])
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = +[CCDatabaseSelect builderWithTableName:@"provenance"];
    uint64_t v9 = [v5 objectAtIndex:0];
    uint64_t v23 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_hash" EQUALSColumnValue:v9];

    uint64_t v10 = [v5 objectAtIndex:1];
    uint64_t v11 = +[CCSQLCommandCriterion criterionWithColumnName:@"content_state" EQUALSColumnValue:v10];

    uint64_t v12 = [v5 objectAtIndex:2];
    uint64_t v13 = +[CCSQLCommandCriterion criterionWithColumnName:@"device_row_id" EQUALSColumnValue:v12];

    v35[0] = v23;
    v35[1] = v11;
    void v35[2] = v13;
    id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
    id v15 = +[CCSQLCommandCriterion criterionWithANDSubCriteria:v14];

    [v8 setCommandCriterion:v15];
    uint64_t v34 = @"content_sequence_number";
    char v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
    [v8 setColumns:v16];

    id v7 = [v8 build];

    if (v7)
    {
      [(NSMutableDictionary *)self->_commandCache setObject:v7 forKey:&unk_26FDCD718];
    }
    else
    {
      id v17 = __biome_log_for_category();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseSetStateReader fetchContentRecordFromContentHash:]();
      }
    }
    if (!v7)
    {
      id v20 = 0;
      LOBYTE(v19) = 0;
      goto LABEL_16;
    }
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__11;
  uint64_t v32 = __Block_byref_object_dispose__11;
  id v33 = 0;
  database = self->_database;
  v26[4] = &v28;
  id v27 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  void v26[2] = __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke;
  v26[3] = &unk_26527AD50;
  int v19 = [(CCDatabaseReadWriteAccess *)database enumerateRowResultsOfSelect:v7 error:&v27 usingBlock:v26];
  id v20 = v27;
  if (v19)
  {
    if (a4) {
      *a4 = (id) v29[5];
    }
  }
  else
  {
    int v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [(CCDatabaseUpdater *)self description];
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:]();
    }
  }
  _Block_object_dispose(&v28, 8);

LABEL_16:
  return v19;
}

uint64_t __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 1;
  *a4 = 1;
  if (v6 && [v6 count])
  {
    if ([v7 count] == 1)
    {
      uint64_t v9 = [v7 numberValueAtColumnIndex:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      uint64_t v12 = __biome_log_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke_cold_1();
      }

      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (BOOL)_selectMetaContentWithInstanceHash:(id)a3 outRecord:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = +[CCSQLCommandCriterion criterionWithColumnName:@"instance_hash" EQUALSColumnValue:v6];
  uint64_t v8 = +[CCDatabaseSelect builderWithTableName:@"metacontent"];
  [v8 setCommandCriterion:v7];
  uint64_t v9 = [v8 build];
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__11;
  id v22 = __Block_byref_object_dispose__11;
  id v23 = 0;
  database = self->_database;
  uint64_t v11 = objc_opt_class();
  v16[4] = &v18;
  id v17 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__CCDatabaseUpdater__selectMetaContentWithInstanceHash_outRecord___block_invoke;
  v16[3] = &unk_26527A070;
  char v12 = [(CCDatabaseReadWriteAccess *)database enumerateRecordResultsOfSelect:v9 recordClass:v11 error:&v17 usingBlock:v16];
  id v13 = v17;
  if (v12)
  {
    if (a4) {
      *a4 = (id) v19[5];
    }
  }
  else
  {
    id v14 = __biome_log_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      [(CCDatabaseUpdater *)self description];
      objc_claimAutoreleasedReturnValue();
      -[CCDatabaseUpdater _selectDeviceRowId:options:]();
    }
  }
  _Block_object_dispose(&v18, 8);

  return v12;
}

uint64_t __66__CCDatabaseUpdater__selectMetaContentWithInstanceHash_outRecord___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
  return 1;
}

+ (id)selectLocalHighestContentSequenceNumberInDatabase:(id)a3 error:(id *)a4
{
  BOOL v4 = +[CCDatabaseSetStateReader persistedKeyValueForKey:@"localHighestContent" database:a3 error:a4];
  uint64_t v5 = [v4 integerValue];

  return v5;
}

+ (id)selectLocalHighestMetaContentSequenceNumberInDatabase:(id)a3 error:(id *)a4
{
  BOOL v4 = +[CCDatabaseSetStateReader persistedKeyValueForKey:@"localHighestMetaContent" database:a3 error:a4];
  uint64_t v5 = [v4 integerValue];

  return v5;
}

- (id)_incrementLocalHighestContentSequenceNumber
{
  p_localHighestContentSequenceNumber = (id *)&self->_localHighestContentSequenceNumber;
  localHighestContentSequenceNumber = self->_localHighestContentSequenceNumber;
  if (localHighestContentSequenceNumber)
  {
LABEL_2:
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSNumber unsignedIntegerValue](localHighestContentSequenceNumber, "unsignedIntegerValue") + 1);
    id v6 = *p_localHighestContentSequenceNumber;
    id *p_localHighestContentSequenceNumber = (id)v5;

    id v7 = *p_localHighestContentSequenceNumber;
    goto LABEL_7;
  }
  uint64_t v8 = objc_opt_class();
  database = self->_database;
  id v16 = 0;
  uint64_t v10 = [v8 selectLocalHighestContentSequenceNumberInDatabase:database error:&v16];
  id v11 = v16;
  char v12 = self->_localHighestContentSequenceNumber;
  self->_localHighestContentSequenceNumber = v10;

  id v13 = __biome_log_for_category();
  id v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseUpdater _incrementLocalHighestContentSequenceNumber]();
    }

    localHighestContentSequenceNumber = (NSNumber *)*p_localHighestContentSequenceNumber;
    goto LABEL_2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseUpdater _incrementLocalHighestContentSequenceNumber]();
  }

  id v7 = 0;
LABEL_7:

  return v7;
}

- (id)_incrementLocalHighestMetaContentSequenceNumber
{
  p_localHighestMetaContentSequenceNumber = (id *)&self->_localHighestMetaContentSequenceNumber;
  localHighestMetaContentSequenceNumber = self->_localHighestMetaContentSequenceNumber;
  if (localHighestMetaContentSequenceNumber)
  {
LABEL_2:
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSNumber unsignedIntegerValue](localHighestMetaContentSequenceNumber, "unsignedIntegerValue") + 1);
    id v6 = *p_localHighestMetaContentSequenceNumber;
    id *p_localHighestMetaContentSequenceNumber = (id)v5;

    id v7 = *p_localHighestMetaContentSequenceNumber;
    goto LABEL_7;
  }
  uint64_t v8 = objc_opt_class();
  database = self->_database;
  id v16 = 0;
  uint64_t v10 = [v8 selectLocalHighestMetaContentSequenceNumberInDatabase:database error:&v16];
  id v11 = v16;
  char v12 = self->_localHighestMetaContentSequenceNumber;
  self->_localHighestMetaContentSequenceNumber = v10;

  id v13 = __biome_log_for_category();
  id v14 = v13;
  if (!v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[CCDatabaseUpdater _incrementLocalHighestMetaContentSequenceNumber]();
    }

    localHighestMetaContentSequenceNumber = (NSNumber *)*p_localHighestMetaContentSequenceNumber;
    goto LABEL_2;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[CCDatabaseUpdater _incrementLocalHighestMetaContentSequenceNumber]();
  }

  id v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)_updateLastDelta
{
  char v3 = [(id)objc_opt_class() insertOrUpdateLastDeltaDate:self->_startTimeMicros database:self->_database];
  if (v3)
  {
    ++self->_modifiedRowCount;
  }
  else
  {
    BOOL v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(CCDatabaseUpdater *)self _updateLastDelta];
    }
  }
  return v3;
}

- (BOOL)updateMetaContent:(id)a3 localInstanceRowId:(id)a4 provenanceRowId:(id)a5 priorInstanceHash:(id)a6 instanceHash:(id)a7 contentHash:(id)a8 contentSequenceNumber:(id)a9 isDuplicate:(BOOL *)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v27 = 0;
  BOOL v20 = [(CCDatabaseUpdater *)self _insertMetaContent:a3 instanceHash:v17 outSequenceNumber:&v27 outIsDuplicate:a10];
  id v21 = v27;
  if (v20)
  {
    id v26 = 0;
    LOBYTE(v25) = 0;
    BOOL v22 = [(CCDatabaseUpdater *)self _insertNewProvenanceAndTombstonePriorProvenanceRow:v16 outInsertedProvenanceRowId:&v26 instanceHash:v17 contentHash:v18 contentSequenceNumber:v19 metaContentSequenceNumber:v21 contentChanged:v25];
    id v23 = v26;
    LOBYTE(v20) = 0;
    if (v22) {
      LOBYTE(v20) = [(CCDatabaseUpdater *)self _updateLocalInstanceRowId:v15 provenanceRowId:v23];
    }
  }
  return v20;
}

- (BOOL)updateContent:(id)a3 andMetaContent:(id)a4 localInstanceRowId:(id)a5 priorProvenanceRowId:(id)a6 contentHash:(id)a7 instanceHash:(id)a8 isDuplicate:(BOOL *)a9
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v31 = 0;
  BOOL v20 = [(CCDatabaseUpdater *)self _insertMetaContent:a4 instanceHash:v19 outSequenceNumber:&v31 outIsDuplicate:a9];
  id v21 = v31;
  if (v20)
  {
    id v30 = 0;
    BOOL v22 = [(CCDatabaseUpdater *)self _insertContent:v15 contentHash:v18 outSequenceNumber:&v30];
    id v23 = v30;
    if (v22)
    {
      id v29 = 0;
      LOBYTE(v28) = 1;
      BOOL v24 = [(CCDatabaseUpdater *)self _insertNewProvenanceAndTombstonePriorProvenanceRow:v17 outInsertedProvenanceRowId:&v29 instanceHash:v19 contentHash:v18 contentSequenceNumber:v23 metaContentSequenceNumber:v21 contentChanged:v28];
      id v25 = v29;
      BOOL v26 = v24
         && [(CCDatabaseUpdater *)self _updateLocalInstanceRowId:v16 provenanceRowId:v25];
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)_updateLocalInstanceRowId:(id)a3 provenanceRowId:(id)a4
{
  v25[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  startTimeMicros = self->_startTimeMicros;
  v25[0] = v7;
  v25[1] = startTimeMicros;
  v25[2] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  uint64_t v10 = [(NSMutableDictionary *)self->_commandCache objectForKey:&unk_26FDCD730];
  if ([v10 updateParameters:v9])
  {
    id v11 = v10;
  }
  else
  {
    char v12 = [v9 objectAtIndex:2];
    id v11 = +[CCSQLCommandCriterion criterionWithColumnName:@"rowid" EQUALSColumnValue:v12];

    id v13 = +[CCDatabaseUpdate builderWithTableName:@"instance"];
    id v14 = [v9 objectAtIndex:0];
    [v13 setValue:v14 forColumn:@"provenance_row_id"];

    id v15 = [v9 objectAtIndex:1];
    [v13 setValue:v15 forColumn:@"modified"];

    [v13 setCommandCriterion:v11];
    uint64_t v16 = [v13 build];

    if (!v16)
    {
      BOOL v22 = __biome_log_for_category();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CCDatabaseUpdater _tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:].cold.5();
      }

      id v19 = 0;
      goto LABEL_13;
    }
    [(NSMutableDictionary *)self->_commandCache setObject:v16 forKey:&unk_26FDCD730];

    id v11 = (void *)v16;
  }
  database = self->_database;
  id v24 = 0;
  int v18 = [(CCDatabaseReadWriteAccess *)database executeCommand:v11 error:&v24];
  id v19 = v24;
  if (!v18)
  {
    id v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[CCDatabaseUpdater _updateLocalInstanceRowId:provenanceRowId:]();
    }

LABEL_13:
    BOOL v20 = 0;
    goto LABEL_14;
  }
  ++self->_localInstanceUpdatedCount;
  ++self->_modifiedRowCount;
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)_insertNewProvenanceAndTombstonePriorProvenanceRow:(id)a3 outInsertedProvenanceRowId:(id *)a4 instanceHash:(id)a5 contentHash:(id)a6 contentSequenceNumber:(id)a7 metaContentSequenceNumber:(id)a8 contentChanged:(BOOL)a9
{
  id v15 = a3;
  deviceRowId = self->_deviceRowId;
  id v21 = 0;
  LODWORD(a7) = [(CCDatabaseUpdater *)self _insertProvenanceForItemWithContentHash:a6 contentSequenceNumber:a7 metaContentSequenceNumber:a8 instanceHash:a5 onDeviceRowId:deviceRowId insertedRowId:&v21];
  id v17 = v21;
  int v18 = v17;
  if (a7)
  {
    if (a4) {
      *a4 = v17;
    }
    BOOL v19 = [(CCDatabaseUpdater *)self _tombstoneMetaContentWithProvenanceRowId:v15 tombstoneContentIfNoLongerPresent:a9];
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)updateVersion
{
  return self->_updateVersion;
}

- (unint64_t)priorVersion
{
  return self->_priorVersion;
}

- (NSNumber)updateValidityHash
{
  return self->_updateValidityHash;
}

- (NSNumber)setHash
{
  return self->_setHash;
}

- (NSNumber)priorValidityHash
{
  return self->_priorValidityHash;
}

- (unsigned)localInstanceAddedCount
{
  return self->_localInstanceAddedCount;
}

- (unsigned)localInstanceUpdatedCount
{
  return self->_localInstanceUpdatedCount;
}

- (unsigned)localInstanceRemovedCount
{
  return self->_localInstanceRemovedCount;
}

- (unsigned)sharedItemAddedCount
{
  return self->_sharedItemAddedCount;
}

- (unsigned)sharedItemRemovedCount
{
  return self->_sharedItemRemovedCount;
}

- (unsigned)sharedItemProvenanceUpdatedCount
{
  return self->_sharedItemProvenanceUpdatedCount;
}

- (NSNumber)deviceRowId
{
  return self->_deviceRowId;
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "nil request", v2, v3, v4, v5, v6);
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "nil database", v2, v3, v4, v5, v6);
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "nil encodedDescriptors", v2, v3, v4, v5, v6);
}

- (void)initWithDatabase:device:request:startTimeMicros:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_249B92000, v0, v1, "nil deviceId", v2, v3, v4, v5, v6);
}

- (void)_registerDevice
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 88)) {
    uint64_t v3 = &stru_26FDBF2B8;
  }
  else {
    uint64_t v3 = @"Non-";
  }
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = [(id)a1 description];
  int v6 = 138412802;
  id v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  id v11 = v5;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "%@local deviceId: %@ not yet registered. Inserting new device record. %@", (uint8_t *)&v6, 0x20u);
}

- (void)_registerSetVersionAndValidity
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to select prior set version with error: %@", v2, v3, v4, v5, v6);
}

- (void)_deleteSourceItemIdHash:outProvenanceRowId:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Delete failed. %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)_deleteSourceItemIdHash:outProvenanceRowId:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15(v0, v1), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v3, v4, "Failed to build delete with params: {%@}, %@", v5, v6, v7, v8, v9);
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Failed to count modified rows after provenance update %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.4()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Update provenance rows for content state failed. %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_15(v0, v1), "description");
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v3, v4, "Failed to build update with params: (%@}, %@", v5, v6, v7, v8, v9);
}

- (void)_tombstoneMetaContentWithProvenanceRowId:tombstoneContentIfNoLongerPresent:.cold.8()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Update provenance for metacontent failed. %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)tombstoneContentSequenceNumbersInRange:forDeviceRowId:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Update provenance for content failed. %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)deleteContentRecordsNoLongerReferencedByAnyProvenanceRecord
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Delete dangling content records failed %@ error: %@", v4, v5, v6, v7, v8);
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to retrieve the number of tombstones being deleted, error: %@", v2, v3, v4, v5, v6);
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Delete failed. error: %@", v2, v3, v4, v5, v6);
}

+ (void)compactContiguousRunsOfDeletesInDatabase:(void *)a1 deletedCount:shouldDefer:.cold.3(void *a1)
{
  uint64_t v1 = [a1 commandString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_249B92000, v2, v3, "Delete command: %@", v4, v5, v6, v7, v8);
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to clear prior state of deletion compaction. error: %@", v2, v3, v4, v5, v6);
}

+ (void)compactContiguousRunsOfDeletesInDatabase:(void *)a1 deletedCount:shouldDefer:.cold.5(void *a1)
{
  uint64_t v1 = [a1 commandString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_249B92000, v2, v3, "Clear prior state of deletion compaction command: %@", v4, v5, v6, v7, v8);
}

+ (void)compactContiguousRunsOfDeletesInDatabase:deletedCount:shouldDefer:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to extract content and metacontent state vectors. error: %@", v2, v3, v4, v5, v6);
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Compact content sequence numbers failed. error: %@", v2, v3, v4, v5, v6);
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_cold_2(void *a1)
{
  uint64_t v1 = [a1 commandString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_249B92000, v2, v3, "Compact content sequence numbers command: %@", v4, v5, v6, v7, v8);
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_32_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Compact metacontent sequence numbers command failed. error: %@", v2, v3, v4, v5, v6);
}

void __87__CCDatabaseUpdater_compactContiguousRunsOfDeletesInDatabase_deletedCount_shouldDefer___block_invoke_32_cold_2(void *a1)
{
  uint64_t v1 = [a1 commandString];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_10_0(&dword_249B92000, v2, v3, "Compact metacontent sequence numbers command: %@", v4, v5, v6, v7, v8);
}

- (void)insertContent:contentHash:sequenceNumber:onDeviceRowId:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Insert failed. %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)_insertContentIfNotExists:contentHash:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Failed to count modified rows after insert %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)_insertProvenanceForItemWithContentHash:(void *)a1 contentSequenceNumber:(NSObject *)a2 metaContentSequenceNumber:instanceHash:onDeviceRowId:insertedRowId:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_1(&dword_249B92000, a2, v4, "contentSequenceNumber is unexpectedly nil %@", v5);
}

- (void)_selectDeviceRowId:options:.cold.1()
{
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1_0(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_2_1(&dword_249B92000, v6, v4, "Select failed. %@ error: %@", v5);
}

void __48__CCDatabaseUpdater__selectDeviceRowId_options___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = [*(id *)(v0 + 32) description];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Select device row returned invalid row: %@, %@", v4, v5, v6, v7, v8);
}

void __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(a2 + 32) description];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_13(&dword_249B92000, v3, v4, "Counted %@ item records in the database. %@", v5, v6, v7, v8, v9);
}

void __47__CCDatabaseUpdater__selectLocalInstanceCount___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0();
  uint64_t v1 = [*(id *)(v0 + 32) description];
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Select count returned invalid row: %@, %@", v4, v5, v6, v7, v8);
}

- (void)selectSourceItemIdHash:(uint64_t)a3 outLocalInstanceRowId:outProvenanceRowId:outInstanceHash:outContentHash:outContentSequenceNumber:isDuplicate:.cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_2_1(&dword_249B92000, v6, v4, "Record with sourceItemIdHash: %@ has already been updated - donated set (%@) contains items with duplicate sourceItemIdentifiers", v5);
}

void __153__CCDatabaseUpdater_selectSourceItemIdHash_outLocalInstanceRowId_outProvenanceRowId_outInstanceHash_outContentHash_outContentSequenceNumber_isDuplicate___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_249B92000, v0, v1, "Expected itemRowId and hash from select but got unexpected row: %@", v2);
}

void __79__CCDatabaseUpdater__selectProvenenceWithRowId_outInstanceHash_outContentHash___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_249B92000, v0, v1, "Expected instance hash and content hash from provenance table select but got unexpected row: %@", v2);
}

void __102__CCDatabaseUpdater__selectProvenanceWithContentHash_outLocalInstancePresent_outRemoteContentPresent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Expected deviceRowId from select but got unexpected row: %@", v2, v3, v4, v5, v6);
}

void __83__CCDatabaseUpdater__selectLocalDeviceProvenenceWithContentHash_outSequenceNumber___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_249B92000, v0, v1, "Expected sequence number from provenance table select but got unexpected row: %@", v2);
}

- (void)_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Failed to construct local instance enumerator. %@ error: %@", v4, v5, v6, v7, v8);
}

- (void)_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v2 = [v1 description];
  uint64_t v3 = [v0 error];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v4, v5, "Local instance enumeration failed. %@ error: %@", v6, v7, v8, v9, v10);
}

- (void)_enumerateLocalInstancesSelectingOnlyUnmodified:usingBlock:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_12(&dword_249B92000, v0, v1, "Expected rowId from select but got unexpected row: %@", v2);
}

- (void)_updateSetVersionAndValidity
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_1(&dword_249B92000, a2, v4, "Could not update set version - update failed. %@", v5);
}

- (void)_incrementLocalHighestContentSequenceNumber
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to select local highest content sequence number with error: %@", v2, v3, v4, v5, v6);
}

- (void)_incrementLocalHighestMetaContentSequenceNumber
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_249B92000, v0, v1, "Failed to select local highest metacontent sequence number with error: %@", v2, v3, v4, v5, v6);
}

- (void)_updateLocalHighestSequenceNumbers
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_1(&dword_249B92000, a2, v4, "Could not update local highest content sequence number - update failed. %@", v5);
}

- (void)_updateLastDelta
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_7_1(&dword_249B92000, a2, v4, "Could not update last delta date - update failed. %@", v5);
}

- (void)_updateLocalInstanceRowId:provenanceRowId:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 description];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_2(&dword_249B92000, v2, v3, "Update failed. %@ error: %@", v4, v5, v6, v7, v8);
}

@end