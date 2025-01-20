@interface HMBLocalSQLContext
+ (id)logCategory;
+ (id)openWithURL:(id)a3 error:(id *)a4;
+ (void)unlinkDatastoreAt:(id)a3 everything:(BOOL)a4;
- (BOOL)_deleteBlockWithRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteBlocksWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteIndexSentinelsWithModelType:(id)a3 error:(id *)a4;
- (BOOL)_deleteIndexSentinelsWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteItemWithRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteItemWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteItemWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 externalID:(id)a5 error:(id *)a6;
- (BOOL)_deleteItemsWithBlockRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteNullBlocksWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteNullItemsWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteNullItemsWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5;
- (BOOL)_deleteRecordWithRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 error:(id *)a5;
- (BOOL)_deleteRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 error:(id *)a5;
- (BOOL)_deleteRecordsWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteZombieRecordsWithZoneRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_deleteZoneWithRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_insertIndexSentinelWithZoneRow:(unint64_t)a3 modelType:(id)a4 error:(id *)a5;
- (BOOL)_resetOutputForRecordsWithBlockRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_selectRecordsWithZoneRow:(unint64_t)a3 modelType:(id)a4 returning:(unint64_t)a5 error:(id *)a6 handler:(id)a7;
- (BOOL)_updateBlockWithRow:(unint64_t)a3 options:(id)a4 error:(id *)a5;
- (BOOL)_updateItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 externalID:(id)a6 externalData:(id)a7 modelEncoding:(unint64_t)a8 modelData:(id)a9 error:(id *)a10;
- (BOOL)_updateRecordWithRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6;
- (BOOL)_updateRecordWithRow:(unint64_t)a3 modelEncoding:(unint64_t)a4 modelData:(id)a5 modelSchema:(id)a6 error:(id *)a7;
- (BOOL)_updateRecordWithRow:(unint64_t)a3 modelType:(id)a4 modelSchema:(id)a5 error:(id *)a6;
- (BOOL)_updateRecordWithRow:(unint64_t)a3 pushBlockRow:(id)a4 pushData:(id)a5 pushEncoding:(unint64_t)a6 error:(id *)a7;
- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6;
- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 externalData:(id)a5 error:(id *)a6;
- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 pushEncoding:(unint64_t)a5 pushData:(id)a6 pushBlockRow:(id)a7 error:(id *)a8;
- (BOOL)_updateRecordsClearPushWithPushBlockRow:(unint64_t)a3 error:(id *)a4;
- (BOOL)_updateZoneWithRow:(unint64_t)a3 replication:(id)a4 error:(id *)a5;
- (BOOL)initializeNewlyCreatedDatabaseWithError:(id *)a3;
- (BOOL)prepareTablesWithError:(id *)a3;
- (BOOL)prepareWithError:(id *)a3;
- (BOOL)sqlBlockWithActivity:(id)a3 error:(id *)a4 block:(id)a5;
- (BOOL)sqlTransactionWithActivity:(id)a3 error:(id *)a4 block:(id)a5;
- (HMBLocalSQLContext)initWithURL:(id)a3;
- (HMBSQLQueryStatement)selectAllRecordParentModelIDRows;
- (HMBSQLQueryStatement)selectAllRecordParentModelIDTypeRows;
- (HMBSQLQueryStatement)selectAllRecordRows;
- (HMBSQLQueryStatement)selectAllRecordTypeRows;
- (HMBSQLQueryStatement)selectReadyInputBlocks;
- (HMBSQLQueryStatement)selectReadyRollbackBlocks;
- (NSDictionary)queryTables;
- (NSMapTable)queryContextsByClass;
- (NSMutableDictionary)queryContextsByModelType;
- (id)_fetchAllZones:(id *)a3;
- (id)_selectBlockWithRow:(unint64_t)a3 error:(id *)a4;
- (id)_selectIndexSentinelForZoneRow:(unint64_t)a3 modelType:(id)a4 error:(id *)a5;
- (id)_selectItemsWithBlockRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5;
- (id)_selectItemsWithBlockRow:(unint64_t)a3 rowGreaterThan:(unint64_t)a4 limit:(unint64_t)a5 returning:(unint64_t)a6 error:(id *)a7;
- (id)_selectReadyBlocksWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5;
- (id)_selectRecordModelIDWithZoneRow:(unint64_t)a3 externalID:(id)a4 error:(id *)a5;
- (id)_selectRecordWithRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5;
- (id)_selectRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 returning:(unint64_t)a5 error:(id *)a6;
- (id)_selectRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 returning:(unint64_t)a5 error:(id *)a6;
- (id)_selectRecordWithZoneRow:(unint64_t)a3 parentModelID:(id)a4 modelType:(id)a5 returning:(unint64_t)a6 error:(id *)a7;
- (id)_selectRecordsWithBlockRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5;
- (id)_selectRecordsWithZoneRow:(unint64_t)a3 modelType:(id)a4 returning:(unint64_t)a5 error:(id *)a6;
- (id)_selectRecordsWithZoneRow:(unint64_t)a3 parentModelID:(id)a4 returning:(unint64_t)a5 error:(id *)a6;
- (id)_selectRecordsWithZoneRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5;
- (id)_selectZoneWithRow:(unint64_t)a3 error:(id *)a4;
- (id)flush:(BOOL)a3;
- (id)selectAllRecordsWithZoneRow:(unint64_t)a3 returning:(unint64_t)a4;
- (id)sqlBlockWithActivity:(id)a3 block:(id)a4;
- (id)sqlTransactionWithActivity:(id)a3 block:(id)a4;
- (int64_t)migrateFromSchemaVersion:(int64_t)a3 error:(id *)a4;
- (int64_t)migrateToSchema01WithError:(id *)a3;
- (unint64_t)_clearPushForRecordRow:(unint64_t)a3 expectedOutputBlockRow:(unint64_t)a4 error:(id *)a5;
- (unint64_t)_deleteRecordWithRow:(unint64_t)a3 expectedOutputBlockRow:(unint64_t)a4 error:(id *)a5;
- (unint64_t)_insertBlockWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5;
- (unint64_t)_insertBlockWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 options:(id)a5 items:(id)a6 error:(id *)a7;
- (unint64_t)_insertDeletionItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelID:(id)a6 error:(id *)a7;
- (unint64_t)_insertDeletionItemsWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelType:(id)a6 error:(id *)a7;
- (unint64_t)_insertDeletionItemsWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 parentModelID:(id)a6 error:(id *)a7;
- (unint64_t)_insertItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 externalID:(id)a6 externalData:(id)a7 modelEncoding:(unint64_t)a8 modelData:(id)a9 error:(id *)a10;
- (unint64_t)_insertItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelType:(id)a6 error:(id *)a7;
- (unint64_t)_insertRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelID:(id)a6 parentModelID:(id)a7 modelType:(id)a8 modelEncoding:(unint64_t)a9 modelData:(id)a10 modelSchema:(id)a11 pushEncoding:(unint64_t)a12 pushData:(id)a13 pushBlockRow:(id)a14 error:(id *)a15;
- (unint64_t)_insertZoneWithIdentification:(id)a3 name:(id)a4 error:(id *)a5;
- (void)finalize;
- (void)reloadSQLQueryMetadata;
- (void)setQueryContextsByClass:(id)a3;
- (void)setQueryContextsByModelType:(id)a3;
- (void)setQueryTables:(id)a3;
- (void)setSelectAllRecordParentModelIDRows:(id)a3;
- (void)setSelectAllRecordParentModelIDTypeRows:(id)a3;
- (void)setSelectAllRecordRows:(id)a3;
- (void)setSelectAllRecordTypeRows:(id)a3;
- (void)setSelectReadyInputBlocks:(id)a3;
- (void)setSelectReadyRollbackBlocks:(id)a3;
@end

@implementation HMBLocalSQLContext

- (BOOL)prepareTablesWithError:(id *)a3
{
  v92[2] = *MEMORY[0x1E4F143B8];
  if (!__reloadSQLQueryMetadata(self, a3)) {
    return 0;
  }
  v5 = [(HMBLocalSQLContext *)self queryTables];
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke;
  v82[3] = &unk_1E69EB170;
  v82[4] = self;
  [v5 enumerateKeysAndObjectsUsingBlock:v82];

  v92[0] = @"CREATE TABLE IF NOT EXISTS index_sentinel(                 store_id            INTEGER NOT NULL, type                TEXT NOT NULL, CONSTRAINT fk_index_sentinel FOREIGN KEY (store_id) REFERENCES store_v2 (id) ON DELETE CASCADE);";
  v92[1] = @"CREATE UNIQUE INDEX IF NOT EXISTS index_sentinel_unique ON index_sentinel (store_id, type);";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v92 count:2];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v78 objects:v91 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v79;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v79 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v78 + 1) + 8 * i) UTF8String];
        id v77 = 0;
        BOOL v12 = [(HMBSQLContext *)self runSQLite3:v11 error:&v77];
        v13 = (HMBLocalSQLQueryTable *)v77;
        v14 = v13;
        if (!v12)
        {
          v47 = (void *)MEMORY[0x1D944CB30]();
          v48 = self;
          v49 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v84 = v50;
            __int16 v85 = 2112;
            v86 = v14;
            _os_log_impl(&dword_1D4693000, v49, OS_LOG_TYPE_ERROR, "%{public}@Adding sentinel table failed: %@", buf, 0x16u);
          }
          if (a3)
          {
            v14 = v14;
            BOOL v46 = 0;
            *a3 = v14;
          }
          else
          {
            BOOL v46 = 0;
          }
          v30 = v6;
          goto LABEL_49;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v78 objects:v91 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  v57 = a3;
  id v58 = v6;

  v15 = +[HMBModel hmbModelClassesWithQueries];
  v16 = [MEMORY[0x1E4F1CA80] set];
  v17 = [(HMBLocalSQLContext *)self queryTables];
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_51;
  v74[3] = &unk_1E69EB1C0;
  id v59 = v15;
  id v75 = v59;
  id v18 = v16;
  id v76 = v18;
  [v17 enumerateKeysAndObjectsUsingBlock:v74];

  long long v73 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v70 = 0u;
  v14 = (HMBLocalSQLQueryTable *)v18;
  uint64_t v19 = [(HMBLocalSQLQueryTable *)v14 countByEnumeratingWithState:&v70 objects:v90 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v71;
    while (2)
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v71 != v21) {
          objc_enumerationMutation(v14);
        }
        v23 = [NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", *(void *)(*((void *)&v70 + 1) + 8 * j)];
        uint64_t v24 = [(HMBLocalSQLQueryTable *)v23 UTF8String];
        id v69 = 0;
        BOOL v25 = [(HMBSQLContext *)self runSQLite3:v24 error:&v69];
        v26 = (HMBLocalSQLQueryTable *)v69;
        if (!v25)
        {
          v51 = (void *)MEMORY[0x1D944CB30]();
          v52 = self;
          v53 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v54 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v84 = v54;
            __int16 v85 = 2112;
            v86 = v26;
            _os_log_impl(&dword_1D4693000, v53, OS_LOG_TYPE_ERROR, "%{public}@Failed to clean up queryable table: %@", buf, 0x16u);
          }
          v35 = v26;
          obuint64_t j = v14;
LABEL_44:
          id v6 = v58;
          if (v57) {
            id *v57 = v26;
          }

          BOOL v46 = 0;
          goto LABEL_47;
        }
      }
      uint64_t v20 = [(HMBLocalSQLQueryTable *)v14 countByEnumeratingWithState:&v70 objects:v90 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  v27 = (void *)MEMORY[0x1D944CB30]();
  v28 = self;
  v29 = HMFGetOSLogHandle();
  v30 = v59;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    v31 = HMFGetLogIdentifier();
    v32 = [v59 hmbDescription];
    *(_DWORD *)buf = 138543618;
    v84 = v31;
    __int16 v85 = 2112;
    v86 = v32;
    _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Preparing query contexts for %@", buf, 0x16u);
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = (HMBLocalSQLQueryTable *)v59;
  uint64_t v63 = [(HMBLocalSQLQueryTable *)obj countByEnumeratingWithState:&v65 objects:v89 count:16];
  if (v63)
  {
    uint64_t v62 = *(void *)v66;
    v60 = v28;
    while (2)
    {
      for (uint64_t k = 0; k != v63; ++k)
      {
        if (*(void *)v66 != v62) {
          objc_enumerationMutation(obj);
        }
        v34 = *(HMBLocalSQLQueryTable **)(*((void *)&v65 + 1) + 8 * k);
        v35 = [[HMBLocalSQLQueryTable alloc] initWithContext:v28 queryModel:v34];
        id v64 = 0;
        BOOL v36 = [(HMBLocalSQLQueryTable *)v35 prepareWithError:&v64];
        v26 = (HMBLocalSQLQueryTable *)v64;
        v37 = (void *)MEMORY[0x1D944CB30]();
        v38 = v28;
        v39 = HMFGetOSLogHandle();
        v40 = v39;
        if (!v36)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v55 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v84 = v55;
            __int16 v85 = 2112;
            v86 = v34;
            __int16 v87 = 2112;
            v88 = v26;
            _os_log_impl(&dword_1D4693000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare query context for %@: %@", buf, 0x20u);
          }
          v23 = v26;
          goto LABEL_44;
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          v41 = HMFGetLogIdentifier();
          v42 = [(HMBLocalSQLQueryTable *)v35 modelType];
          *(_DWORD *)buf = 138543618;
          v84 = v41;
          __int16 v85 = 2112;
          v86 = v42;
          _os_log_impl(&dword_1D4693000, v40, OS_LOG_TYPE_DEBUG, "%{public}@Prepared query context for %@", buf, 0x16u);

          v28 = v60;
        }

        v43 = [(HMBLocalSQLContext *)v38 queryContextsByClass];
        [v43 setObject:v35 forKey:v34];

        v44 = [(HMBLocalSQLContext *)v38 queryContextsByModelType];
        v45 = [(HMBLocalSQLQueryTable *)v35 modelType];
        [v44 setObject:v35 forKey:v45];
      }
      BOOL v46 = 1;
      uint64_t v63 = [(HMBLocalSQLQueryTable *)obj countByEnumeratingWithState:&v65 objects:v89 count:16];
      if (v63) {
        continue;
      }
      break;
    }
    id v6 = v58;
LABEL_47:
    v30 = v59;
  }
  else
  {
    BOOL v46 = 1;
    id v6 = v58;
  }

LABEL_49:
  return v46;
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v6 columnNames];
    BOOL v12 = [v11 allObjects];
    v13 = [v12 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEBUG, "%{public}@Query Table: %@ <%@>", buf, 0x20u);
  }
  v14 = [v6 indexes];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_45;
  v15[3] = &unk_1E69EB148;
  v15[4] = *(void *)(a1 + 32);
  [v14 enumerateKeysAndObjectsUsingBlock:v15];
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_51(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_2;
  v11[3] = &unk_1E69EB198;
  id v10 = v7;
  id v12 = v10;
  v13 = &v15;
  uint64_t v14 = a4;
  [v9 enumerateObjectsUsingBlock:v11];
  if (!*((unsigned char *)v16 + 24)) {
    [*(id *)(a1 + 40) addObject:v10];
  }

  _Block_object_dispose(&v15, 8);
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_2(void *a1, Class aClass)
{
  v3 = (void *)a1[4];
  v4 = NSString;
  id v5 = NSStringFromClass(aClass);
  id v6 = [v4 stringWithFormat:@"queryable_%@", v5];
  LODWORD(v3) = [v3 isEqualToString:v6];

  if (v3)
  {
    id v7 = (unsigned char *)a1[6];
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *id v7 = 1;
  }
}

void __56__HMBLocalSQLContext_Queryable__prepareTablesWithError___block_invoke_45(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1D944CB30]();
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = HMFGetLogIdentifier();
    uint64_t v11 = [v6 columns];
    id v12 = [v11 componentsJoinedByString:@", "];
    int v13 = 138543874;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    id v16 = v5;
    __int16 v17 = 2112;
    char v18 = v12;
    _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_DEBUG, "%{public}@    %@ <%@>", (uint8_t *)&v13, 0x20u);
  }
}

- (void)reloadSQLQueryMetadata
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__HMBLocalSQLContext_Queryable__reloadSQLQueryMetadata__block_invoke;
  v3[3] = &unk_1E69EB758;
  v3[4] = self;
  id v2 = [(HMBLocalSQLContext *)self sqlBlockWithActivity:0 block:v3];
}

uint64_t __55__HMBLocalSQLContext_Queryable__reloadSQLQueryMetadata__block_invoke(uint64_t a1)
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryContextsByModelType, 0);
  objc_storeStrong((id *)&self->_queryContextsByClass, 0);
  objc_storeStrong((id *)&self->_queryTables, 0);
  objc_storeStrong((id *)&self->_selectAllRecordParentModelIDTypeRows, 0);
  objc_storeStrong((id *)&self->_selectAllRecordParentModelIDRows, 0);
  objc_storeStrong((id *)&self->_selectAllRecordTypeRows, 0);
  objc_storeStrong((id *)&self->_selectAllRecordRows, 0);
  objc_storeStrong((id *)&self->_selectReadyRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_selectReadyInputBlocks, 0);
}

- (void)setQueryContextsByModelType:(id)a3
{
}

- (NSMutableDictionary)queryContextsByModelType
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setQueryContextsByClass:(id)a3
{
}

- (NSMapTable)queryContextsByClass
{
  return (NSMapTable *)objc_getProperty(self, a2, 104, 1);
}

- (void)setQueryTables:(id)a3
{
}

- (NSDictionary)queryTables
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSelectAllRecordParentModelIDTypeRows:(id)a3
{
}

- (void)setSelectAllRecordParentModelIDRows:(id)a3
{
}

- (void)setSelectAllRecordTypeRows:(id)a3
{
}

- (void)setSelectAllRecordRows:(id)a3
{
}

- (void)setSelectReadyRollbackBlocks:(id)a3
{
}

- (void)setSelectReadyInputBlocks:(id)a3
{
}

- (id)flush:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__HMBLocalSQLContext_flush___block_invoke;
  v5[3] = &unk_1E69EB958;
  v5[4] = self;
  BOOL v6 = a3;
  v3 = [(HMBLocalSQLContext *)self sqlTransactionWithActivity:0 block:v5];
  return v3;
}

id __28__HMBLocalSQLContext_flush___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = v3;
  BOOL v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v35 = v7;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@removing all records and transactions from local", buf, 0xCu);
  }
  id v32 = 0;
  [v5 runSQLite3:"DELETE FROM transaction_v2" error:&v32];
  id v8 = v32;
  id v31 = v8;
  [v5 runSQLite3:"DELETE FROM record_v2" error:&v31];
  id v9 = v31;

  id v30 = v9;
  [v5 runSQLite3:"DELETE FROM block_v2" error:&v30];
  id v10 = v30;

  id v29 = v10;
  [v5 runSQLite3:"DELETE FROM index_sentinel" error:&v29];
  id v11 = v29;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = [*(id *)(a1 + 32) queryContextsByClass];
  int v13 = [v12 keyEnumerator];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      char v18 = v11;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        id v19 = [*(id *)(*((void *)&v25 + 1) + 8 * v17) dropTableSQL];
        uint64_t v20 = [v19 UTF8String];
        id v24 = v18;
        [v5 runSQLite3:v20 error:&v24];
        id v11 = v24;

        ++v17;
        char v18 = v11;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v15);
  }

  if (*(unsigned char *)(a1 + 40))
  {
    id v23 = v11;
    [v5 runSQLite3:"DELETE FROM store_v2" error:&v23];
    id v21 = v23;

    id v11 = v21;
  }

  return v11;
}

- (BOOL)_deleteIndexSentinelsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__HMBLocalSQLContext__deleteIndexSentinelsWithZoneRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteIndexSentinelsStoreString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __61__HMBLocalSQLContext__deleteIndexSentinelsWithZoneRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_deleteIndexSentinelsWithModelType:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v7 = deleteIndexSentinelsString;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HMBLocalSQLContext__deleteIndexSentinelsWithModelType_error___block_invoke;
  v11[3] = &unk_1E69EBA40;
  id v8 = v6;
  id v12 = v8;
  int v13 = self;
  uint64_t v14 = &v16;
  uint64_t v15 = a4;
  id v9 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v7 block:v11];
  LOBYTE(a4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)a4;
}

id __63__HMBLocalSQLContext__deleteIndexSentinelsWithModelType_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void **)(a1 + 32);
  id v7 = 0;
  hmbBindStringSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execAndSetError(*(void **)(a1 + 40), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (id)_selectIndexSentinelForZoneRow:(unint64_t)a3 modelType:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__7521;
  id v24 = __Block_byref_object_dispose__7522;
  id v25 = 0;
  uint64_t v9 = selectIndexSentinelString;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HMBLocalSQLContext__selectIndexSentinelForZoneRow_modelType_error___block_invoke;
  v15[3] = &unk_1E69EBA40;
  unint64_t v19 = a3;
  id v10 = v8;
  id v16 = v10;
  uint64_t v17 = self;
  uint64_t v18 = &v20;
  char v11 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v9 block:v15];
  id v12 = v11;
  if (a5) {
    *a5 = v11;
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

id __69__HMBLocalSQLContext__selectIndexSentinelForZoneRow_modelType_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[7];
  id v18 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v18);
  id v5 = v18;
  id v6 = (void *)a1[4];
  id v17 = v5;
  hmbBindStringSQLite3(a2, 2, v6, &v17);
  id v7 = v17;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__HMBLocalSQLContext__selectIndexSentinelForZoneRow_modelType_error___block_invoke_2;
  v15[3] = &unk_1E69EBA18;
  id v8 = (void *)a1[5];
  void v15[4] = a1[6];
  id v16 = v7;
  char v9 = [v8 fetchSQLite3One:a2 error:&v16 block:v15];
  id v10 = v16;

  id v11 = 0;
  if ((v9 & 1) == 0)
  {
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    id v11 = v10;
  }

  return v11;
}

uint64_t __69__HMBLocalSQLContext__selectIndexSentinelForZoneRow_modelType_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", sqlite3_column_int64(a2, 0));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (BOOL)_insertIndexSentinelWithZoneRow:(unint64_t)a3 modelType:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v9 = insertIndexSentinelString;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__HMBLocalSQLContext__insertIndexSentinelWithZoneRow_modelType_error___block_invoke;
  v13[3] = &unk_1E69EBA90;
  unint64_t v17 = a3;
  id v10 = v8;
  id v14 = v10;
  uint64_t v15 = self;
  id v16 = &v19;
  id v18 = a5;
  id v11 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v9 block:v13];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)a5;
}

id __70__HMBLocalSQLContext__insertIndexSentinelWithZoneRow_modelType_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v10 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v10);
  id v5 = v10;
  id v6 = *(void **)(a1 + 32);
  id v9 = v5;
  hmbBindStringSQLite3(a2, 2, v6, &v9);
  id v7 = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execAndSetError(*(void **)(a1 + 40), a2, v7, *(void **)(a1 + 64));
  return v7;
}

- (BOOL)_deleteNullItemsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__HMBLocalSQLContext__deleteNullItemsWithZoneRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteNullItemsString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __56__HMBLocalSQLContext__deleteNullItemsWithZoneRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_deleteNullItemsWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HMBLocalSQLContext__deleteNullItemsWithZoneRow_type_error___block_invoke;
  v8[3] = &unk_1E69EB890;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = self;
  v8[5] = &v9;
  v8[8] = a5;
  id v5 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteNullItemsTypeString block:v8];
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __61__HMBLocalSQLContext__deleteNullItemsWithZoneRow_type_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v10 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v10);
  id v5 = v10;
  sqlite3_int64 v6 = *(void *)(a1 + 56);
  id v9 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v9);
  id v7 = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v7, *(void **)(a1 + 64));
  return v7;
}

- (id)_selectItemsWithBlockRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__7521;
  uint64_t v19 = __Block_byref_object_dispose__7522;
  id v20 = [MEMORY[0x1E4F1CA48] array];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HMBLocalSQLContext__selectItemsWithBlockRow_returning_error___block_invoke;
  v14[3] = &unk_1E69EBAB8;
  v14[6] = a3;
  v14[7] = a4;
  v14[4] = self;
  v14[5] = &v15;
  id v9 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectItemsBlockString block:v14];
  id v10 = v9;
  uint64_t v11 = (void *)v16[5];
  if (a5 && !v11)
  {
    *a5 = v9;
    uint64_t v11 = (void *)v16[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v15, 8);
  return v12;
}

id __63__HMBLocalSQLContext__selectItemsWithBlockRow_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__HMBLocalSQLContext__selectItemsWithBlockRow_returning_error___block_invoke_2;
  v14[3] = &unk_1E69EBAE0;
  sqlite3_int64 v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v14[5] = a1[7];
  id v15 = v5;
  v14[4] = v7;
  char v8 = [v6 fetchSQLite3:a2 error:&v15 block:v14];
  id v9 = v15;

  id v10 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    id v10 = v9;
  }

  return v10;
}

uint64_t __63__HMBLocalSQLContext__selectItemsWithBlockRow_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowItem alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (id)_selectItemsWithBlockRow:(unint64_t)a3 rowGreaterThan:(unint64_t)a4 limit:(unint64_t)a5 returning:(unint64_t)a6 error:(id *)a7
{
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__7521;
  id v23 = __Block_byref_object_dispose__7522;
  id v24 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a5];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HMBLocalSQLContext__selectItemsWithBlockRow_rowGreaterThan_limit_returning_error___block_invoke;
  v18[3] = &unk_1E69EB930;
  v18[6] = a3;
  v18[7] = a4;
  v18[8] = a5;
  v18[9] = a6;
  v18[4] = self;
  v18[5] = &v19;
  id v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectItemsBlockLimitString block:v18];
  id v14 = v13;
  id v15 = (void *)v20[5];
  if (a7 && !v15)
  {
    *a7 = v13;
    id v15 = (void *)v20[5];
  }
  id v16 = v15;

  _Block_object_dispose(&v19, 8);
  return v16;
}

id __84__HMBLocalSQLContext__selectItemsWithBlockRow_rowGreaterThan_limit_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v21 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v21);
  id v5 = v21;
  sqlite3_int64 v6 = a1[7];
  id v20 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v20);
  id v7 = v20;

  sqlite3_int64 v8 = a1[8];
  id v19 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v19);
  id v9 = v19;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__HMBLocalSQLContext__selectItemsWithBlockRow_rowGreaterThan_limit_returning_error___block_invoke_2;
  v17[3] = &unk_1E69EBAE0;
  id v10 = (void *)a1[4];
  uint64_t v11 = a1[5];
  v17[5] = a1[9];
  id v18 = v9;
  v17[4] = v11;
  LOBYTE(v7) = [v10 fetchSQLite3:a2 error:&v18 block:v17];
  id v12 = v18;

  id v13 = 0;
  if ((v7 & 1) == 0)
  {
    uint64_t v14 = *(void *)(a1[5] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    id v13 = v12;
  }

  return v13;
}

uint64_t __84__HMBLocalSQLContext__selectItemsWithBlockRow_rowGreaterThan_limit_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowItem alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (BOOL)_deleteItemWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 externalID:(id)a5 error:(id *)a6
{
  id v10 = a5;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v11 = deleteItemStoreExternalString;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HMBLocalSQLContext__deleteItemWithZoneRow_type_externalID_error___block_invoke;
  v15[3] = &unk_1E69EB908;
  unint64_t v19 = a3;
  unint64_t v20 = a4;
  id v12 = v10;
  id v16 = v12;
  uint64_t v17 = self;
  id v18 = &v22;
  id v21 = a6;
  id v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v11 block:v15];
  LOBYTE(a6) = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v22, 8);
  return (char)a6;
}

id __67__HMBLocalSQLContext__deleteItemWithZoneRow_type_externalID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v13 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v13);
  id v5 = v13;
  sqlite3_int64 v6 = *(void *)(a1 + 64);
  id v12 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v12);
  id v7 = v12;

  sqlite3_int64 v8 = *(void **)(a1 + 32);
  id v11 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v11);
  id v9 = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execAndSetError(*(void **)(a1 + 40), a2, v9, *(void **)(a1 + 72));
  return v9;
}

- (BOOL)_deleteItemWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HMBLocalSQLContext__deleteItemWithZoneRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteItemsStoreString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __51__HMBLocalSQLContext__deleteItemWithZoneRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_deleteItemsWithBlockRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HMBLocalSQLContext__deleteItemsWithBlockRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteItemsBlockString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __53__HMBLocalSQLContext__deleteItemsWithBlockRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_deleteItemWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMBLocalSQLContext__deleteItemWithRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteItemString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __47__HMBLocalSQLContext__deleteItemWithRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_updateItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 externalID:(id)a6 externalData:(id)a7 modelEncoding:(unint64_t)a8 modelData:(id)a9 error:(id *)a10
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v19 = updateItemString;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __113__HMBLocalSQLContext__updateItemWithZoneRow_blockRow_type_externalID_externalData_modelEncoding_modelData_error___block_invoke;
  v25[3] = &unk_1E69EB8B8;
  unint64_t v31 = a3;
  unint64_t v32 = a4;
  unint64_t v33 = a5;
  id v20 = v16;
  id v26 = v20;
  id v21 = v17;
  id v27 = v21;
  unint64_t v34 = a8;
  id v22 = v18;
  id v28 = v22;
  id v29 = self;
  id v30 = &v36;
  v35 = a10;
  id v23 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v19 block:v25];
  LOBYTE(self) = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v36, 8);
  return (char)self;
}

id __113__HMBLocalSQLContext__updateItemWithZoneRow_blockRow_type_externalID_externalData_modelEncoding_modelData_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 72);
  id v25 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v25);
  id v5 = v25;
  sqlite3_int64 v6 = *(void *)(a1 + 80);
  id v24 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v24);
  id v7 = v24;

  sqlite3_int64 v8 = *(void *)(a1 + 88);
  id v23 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v23);
  id v9 = v23;

  uint64_t v10 = *(void **)(a1 + 32);
  id v22 = v9;
  hmbBindDataSQLite3(a2, 4, v10, &v22);
  id v11 = v22;

  id v12 = *(void **)(a1 + 40);
  id v21 = v11;
  hmbBindDataSQLite3(a2, 5, v12, &v21);
  id v13 = v21;

  sqlite3_int64 v14 = *(void *)(a1 + 96);
  id v20 = v13;
  hmbBindIntSQLite3(a2, 6, v14, &v20);
  id v15 = v20;

  id v16 = *(void **)(a1 + 48);
  id v19 = v15;
  hmbBindDataSQLite3(a2, 7, v16, &v19);
  id v17 = v19;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = __execAndSetError(*(void **)(a1 + 56), a2, v17, *(void **)(a1 + 104));
  return v17;
}

- (unint64_t)_insertItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelType:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v13 = insertDeletionItemsForRecordsOfTypeString;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__HMBLocalSQLContext__insertItemWithZoneRow_blockRow_type_modelType_error___block_invoke;
  v18[3] = &unk_1E69EB8E0;
  unint64_t v22 = a3;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v14 = v12;
  id v19 = v14;
  id v20 = self;
  id v21 = &v26;
  id v25 = a7;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v13 block:v18];
  unint64_t v16 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v16;
}

id __75__HMBLocalSQLContext__insertItemWithZoneRow_blockRow_type_modelType_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = *(void *)(a1 + 64);
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  sqlite3_int64 v8 = *(void *)(a1 + 72);
  id v14 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v14);
  id v9 = v14;

  uint64_t v10 = *(void **)(a1 + 32);
  id v13 = v9;
  hmbBindStringSQLite3(a2, 4, v10, &v13);
  id v11 = v13;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 40), (uint64_t)a2, v11, *(void **)(a1 + 80));
  return v11;
}

- (unint64_t)_insertDeletionItemsWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 parentModelID:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v13 = insertDeletionItemsForRecordsWithParentUUIDString;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__HMBLocalSQLContext__insertDeletionItemsWithZoneRow_blockRow_type_parentModelID_error___block_invoke;
  v18[3] = &unk_1E69EB8E0;
  unint64_t v22 = a3;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v14 = v12;
  id v19 = v14;
  id v20 = self;
  id v21 = &v26;
  id v25 = a7;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v13 block:v18];
  unint64_t v16 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v16;
}

id __88__HMBLocalSQLContext__insertDeletionItemsWithZoneRow_blockRow_type_parentModelID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = *(void *)(a1 + 64);
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  sqlite3_int64 v8 = *(void *)(a1 + 72);
  id v14 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v14);
  id v9 = v14;

  uint64_t v10 = *(void **)(a1 + 32);
  id v13 = v9;
  hmbBindUUIDSQLite3(a2, 4, v10, &v13);
  id v11 = v13;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 40), (uint64_t)a2, v11, *(void **)(a1 + 80));
  return v11;
}

- (unint64_t)_insertDeletionItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelID:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v13 = insertDeletionItemsForRecordWithUUIDString;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__HMBLocalSQLContext__insertDeletionItemWithZoneRow_blockRow_type_modelID_error___block_invoke;
  v18[3] = &unk_1E69EB8E0;
  unint64_t v22 = a3;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v14 = v12;
  id v19 = v14;
  id v20 = self;
  id v21 = &v26;
  id v25 = a7;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v13 block:v18];
  unint64_t v16 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v16;
}

id __81__HMBLocalSQLContext__insertDeletionItemWithZoneRow_blockRow_type_modelID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = *(void *)(a1 + 64);
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  sqlite3_int64 v8 = *(void *)(a1 + 72);
  id v14 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v14);
  id v9 = v14;

  uint64_t v10 = *(void **)(a1 + 32);
  id v13 = v9;
  hmbBindUUIDSQLite3(a2, 4, v10, &v13);
  id v11 = v13;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 40), (uint64_t)a2, v11, *(void **)(a1 + 80));
  return v11;
}

- (unint64_t)_insertDeletionItemsWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 modelType:(id)a6 error:(id *)a7
{
  id v12 = a6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  uint64_t v13 = insertDeletionItemsForRecordsOfTypeString;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__HMBLocalSQLContext__insertDeletionItemsWithZoneRow_blockRow_type_modelType_error___block_invoke;
  v18[3] = &unk_1E69EB8E0;
  unint64_t v22 = a3;
  unint64_t v23 = a4;
  unint64_t v24 = a5;
  id v14 = v12;
  id v19 = v14;
  id v20 = self;
  id v21 = &v26;
  id v25 = a7;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v13 block:v18];
  unint64_t v16 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v16;
}

id __84__HMBLocalSQLContext__insertDeletionItemsWithZoneRow_blockRow_type_modelType_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = *(void *)(a1 + 64);
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  sqlite3_int64 v8 = *(void *)(a1 + 72);
  id v14 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v14);
  id v9 = v14;

  uint64_t v10 = *(void **)(a1 + 32);
  id v13 = v9;
  hmbBindStringSQLite3(a2, 4, v10, &v13);
  id v11 = v13;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 40), (uint64_t)a2, v11, *(void **)(a1 + 80));
  return v11;
}

- (unint64_t)_insertItemWithZoneRow:(unint64_t)a3 blockRow:(unint64_t)a4 type:(unint64_t)a5 externalID:(id)a6 externalData:(id)a7 modelEncoding:(unint64_t)a8 modelData:(id)a9 error:(id *)a10
{
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v19 = insertItemString;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __113__HMBLocalSQLContext__insertItemWithZoneRow_blockRow_type_externalID_externalData_modelEncoding_modelData_error___block_invoke;
  v26[3] = &unk_1E69EB8B8;
  unint64_t v32 = a3;
  unint64_t v33 = a4;
  unint64_t v34 = a5;
  id v20 = v16;
  id v27 = v20;
  id v21 = v17;
  id v28 = v21;
  unint64_t v35 = a8;
  id v22 = v18;
  id v29 = v22;
  id v30 = self;
  unint64_t v31 = &v37;
  uint64_t v36 = a10;
  id v23 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v19 block:v26];
  unint64_t v24 = v38[3];

  _Block_object_dispose(&v37, 8);
  return v24;
}

id __113__HMBLocalSQLContext__insertItemWithZoneRow_blockRow_type_externalID_externalData_modelEncoding_modelData_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 72);
  id v25 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v25);
  id v5 = v25;
  sqlite3_int64 v6 = *(void *)(a1 + 80);
  id v24 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v24);
  id v7 = v24;

  sqlite3_int64 v8 = *(void *)(a1 + 88);
  id v23 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v23);
  id v9 = v23;

  uint64_t v10 = *(void **)(a1 + 32);
  id v22 = v9;
  hmbBindDataSQLite3(a2, 4, v10, &v22);
  id v11 = v22;

  id v12 = *(void **)(a1 + 40);
  id v21 = v11;
  hmbBindDataSQLite3(a2, 5, v12, &v21);
  id v13 = v21;

  sqlite3_int64 v14 = *(void *)(a1 + 96);
  id v20 = v13;
  hmbBindIntSQLite3(a2, 6, v14, &v20);
  id v15 = v20;

  id v16 = *(void **)(a1 + 48);
  id v19 = v15;
  hmbBindDataSQLite3(a2, 7, v16, &v19);
  id v17 = v19;

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 56), (uint64_t)a2, v17, *(void **)(a1 + 104));
  return v17;
}

- (unint64_t)_insertBlockWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 options:(id)a5 items:(id)a6 error:(id *)a7
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a5;
  id v11 = a6;
  id v38 = 0;
  unint64_t v30 = a3;
  unint64_t v31 = self;
  unint64_t v12 = a4;
  unint64_t v32 = [(HMBLocalSQLContext *)self _insertBlockWithZoneRow:a3 type:a4 error:&v38];
  id v13 = v38;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v11;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    obuint64_t j = v14;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v20 = [v19 externalID];
        id v21 = [v19 externalData];
        uint64_t v22 = [v19 modelEncoding];
        id v23 = [v19 modelData];
        id v33 = v13;
        [(HMBLocalSQLContext *)v31 _insertItemWithZoneRow:v30 blockRow:v32 type:v12 externalID:v20 externalData:v21 modelEncoding:v22 modelData:v23 error:&v33];
        id v24 = v33;

        if (v24)
        {
          if (a7) {
            *a7 = v24;
          }
          id v14 = obj;

          unint64_t v32 = 0;
          id v25 = v28;
          goto LABEL_15;
        }
        id v13 = 0;
      }
      id v14 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      id v13 = 0;
      id v24 = 0;
      if (v16) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v24 = v13;
  }

  id v25 = v28;
  [(HMBLocalSQLContext *)v31 _updateBlockWithRow:v32 options:v28 error:a7];
LABEL_15:

  return v32;
}

- (BOOL)_deleteNullBlocksWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HMBLocalSQLContext__deleteNullBlocksWithZoneRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteNullBlocksString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __57__HMBLocalSQLContext__deleteNullBlocksWithZoneRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (id)_selectBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  char v11 = __Block_byref_object_copy__7521;
  unint64_t v12 = __Block_byref_object_dispose__7522;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMBLocalSQLContext__selectBlockWithRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[6] = a3;
  v7[7] = a4;
  v7[4] = self;
  v7[5] = &v8;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectBlockString block:v7];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

id __48__HMBLocalSQLContext__selectBlockWithRow_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  hmbBindIntSQLite3(a2, 1, a1[6], (void *)a1[7]);
  uint64_t v4 = a1[7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__HMBLocalSQLContext__selectBlockWithRow_error___block_invoke_2;
  v10[3] = &unk_1E69EBA18;
  id v5 = (void *)a1[4];
  v10[4] = a1[5];
  if ([v5 fetchSQLite3One:a2 error:v4 block:v10])
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(a1[5] + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    id v6 = *(id *)a1[7];
  }
  return v6;
}

uint64_t __48__HMBLocalSQLContext__selectBlockWithRow_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [HMBLocalSQLContextRowBlock alloc];
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 0);
  sqlite3_int64 v6 = sqlite3_column_int64(a2, 1);
  uint64_t v7 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a2 column:2];
  uint64_t v8 = [(HMBLocalSQLContextRowBlock *)v4 initWithBlockRow:v5 type:v6 options:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 0;
}

- (id)_selectReadyBlocksWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__7521;
  uint64_t v17 = __Block_byref_object_dispose__7522;
  id v18 = [MEMORY[0x1E4F1CA48] array];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__HMBLocalSQLContext__selectReadyBlocksWithZoneRow_type_error___block_invoke;
  v12[3] = &unk_1E69EB890;
  v12[6] = a3;
  v12[7] = a5;
  v12[8] = a4;
  v12[4] = self;
  v12[5] = &v13;
  id v9 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectReadyBlocksString block:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

id __63__HMBLocalSQLContext__selectReadyBlocksWithZoneRow_type_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  hmbBindIntSQLite3(a2, 1, a1[6], (void *)a1[7]);
  hmbBindIntSQLite3(a2, 2, a1[8], (void *)a1[7]);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__HMBLocalSQLContext__selectReadyBlocksWithZoneRow_type_error___block_invoke_2;
  v11[3] = &unk_1E69EBAE0;
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[8];
  sqlite3_int64 v6 = (void *)a1[4];
  void v11[4] = a1[5];
  v11[5] = v5;
  if ([v6 fetchSQLite3:a2 error:v4 block:v11])
  {
    id v7 = 0;
  }
  else
  {
    uint64_t v8 = *(void *)(a1[5] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;

    id v7 = *(id *)a1[7];
  }
  return v7;
}

uint64_t __63__HMBLocalSQLContext__selectReadyBlocksWithZoneRow_type_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [HMBLocalSQLContextRowBlock alloc];
  sqlite3_int64 v5 = sqlite3_column_int64(a2, 0);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a2 column:1];
  uint64_t v8 = [(HMBLocalSQLContextRowBlock *)v4 initWithBlockRow:v5 type:v6 options:v7];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];
  return 0;
}

- (BOOL)_updateBlockWithRow:(unint64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v9 = updateBlockString;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__HMBLocalSQLContext__updateBlockWithRow_options_error___block_invoke;
  v13[3] = &unk_1E69EBA90;
  unint64_t v17 = a3;
  id v10 = v8;
  id v14 = v10;
  uint64_t v15 = self;
  uint64_t v16 = &v19;
  id v18 = a5;
  id v11 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v9 block:v13];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)a5;
}

id __56__HMBLocalSQLContext__updateBlockWithRow_options_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v10 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v10);
  id v5 = v10;
  uint64_t v6 = *(void **)(a1 + 32);
  id v9 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v9);
  id v7 = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execAndSetError(*(void **)(a1 + 40), a2, v7, *(void **)(a1 + 64));
  return v7;
}

- (BOOL)_deleteBlocksWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HMBLocalSQLContext__deleteBlocksWithZoneRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteBlocksStoreString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __53__HMBLocalSQLContext__deleteBlocksWithZoneRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_deleteBlockWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__HMBLocalSQLContext__deleteBlockWithRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteBlockString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __48__HMBLocalSQLContext__deleteBlockWithRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (unint64_t)_insertBlockWithZoneRow:(unint64_t)a3 type:(unint64_t)a4 error:(id *)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HMBLocalSQLContext__insertBlockWithZoneRow_type_error___block_invoke;
  v8[3] = &unk_1E69EB890;
  v8[6] = a3;
  v8[7] = a4;
  v8[4] = self;
  v8[5] = &v9;
  v8[8] = a5;
  id v5 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:insertBlockString block:v8];
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

id __57__HMBLocalSQLContext__insertBlockWithZoneRow_type_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v11 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v11);
  id v5 = v11;
  sqlite3_int64 v6 = *(void *)(a1 + 56);
  id v10 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v10);
  id v7 = v10;

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 32), (uint64_t)a2, v7, *(void **)(a1 + 64));
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_updateZoneWithRow:(unint64_t)a3 replication:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v9 = updateStoreReplicationDataString;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__HMBLocalSQLContext__updateZoneWithRow_replication_error___block_invoke;
  v13[3] = &unk_1E69EBA90;
  unint64_t v17 = a3;
  id v10 = v8;
  id v14 = v10;
  uint64_t v15 = self;
  uint64_t v16 = &v19;
  id v18 = a5;
  id v11 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v9 block:v13];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)a5;
}

id __59__HMBLocalSQLContext__updateZoneWithRow_replication_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v10 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v10);
  id v5 = v10;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v9 = v5;
  hmbBindUUIDSQLite3(a2, 2, v6, &v9);
  id v7 = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execAndSetError(*(void **)(a1 + 40), a2, v7, *(void **)(a1 + 64));
  return v7;
}

- (id)_selectZoneWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7521;
  uint64_t v15 = __Block_byref_object_dispose__7522;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__HMBLocalSQLContext__selectZoneWithRow_error___block_invoke;
  v10[3] = &unk_1E69EBAB8;
  v10[6] = a3;
  v10[7] = a4;
  v10[4] = self;
  void v10[5] = &v11;
  id v5 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectStoreString block:v10];
  sqlite3_int64 v6 = v5;
  id v7 = (void *)v12[5];
  if (a4 && !v7)
  {
    *a4 = v5;
    id v7 = (void *)v12[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v11, 8);
  return v8;
}

id __47__HMBLocalSQLContext__selectZoneWithRow_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v14 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v14);
  id v5 = v14;
  uint64_t v6 = a1[7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__HMBLocalSQLContext__selectZoneWithRow_error___block_invoke_2;
  v13[3] = &unk_1E69EBA18;
  id v7 = (void *)a1[4];
  void v13[4] = a1[5];
  char v8 = [v7 fetchSQLite3One:a2 error:v6 block:v13];
  id v9 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    id v9 = v5;
  }

  return v9;
}

uint64_t __47__HMBLocalSQLContext__selectZoneWithRow_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  id v5 = [NSString hmbStringWithSQLite3Column:a2 column:1];
  uint64_t v6 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a2 column:2];
  id v7 = [[HMBLocalSQLContextRowZone alloc] initWithZoneRow:v4 name:v5 token:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [MEMORY[0x1E4F29128] hmbUUIDWithSQLite3Column:a2 column:4];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setReplication:v10];

  return 0;
}

- (id)_fetchAllZones:(id *)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__7521;
  uint64_t v15 = __Block_byref_object_dispose__7522;
  id v16 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__HMBLocalSQLContext__fetchAllZones___block_invoke;
  v10[3] = &unk_1E69EB868;
  v10[4] = self;
  void v10[5] = &v11;
  id v5 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectStoresString block:v10];
  uint64_t v6 = v5;
  id v7 = (void *)v12[5];
  if (a3 && !v7)
  {
    *a3 = v5;
    id v7 = (void *)v12[5];
  }
  id v8 = v7;

  _Block_object_dispose(&v11, 8);
  return v8;
}

id __37__HMBLocalSQLContext__fetchAllZones___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__HMBLocalSQLContext__fetchAllZones___block_invoke_2;
  v10[3] = &unk_1E69EB840;
  v10[4] = *(void *)(a1 + 40);
  id v11 = 0;
  char v4 = [v3 fetchSQLite3:a2 error:&v11 block:v10];
  id v5 = v11;
  id v6 = 0;
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;

    id v6 = v5;
  }

  return v6;
}

uint64_t __37__HMBLocalSQLContext__fetchAllZones___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = sqlite3_column_int64(a2, 0);
  id v5 = [NSString hmbStringWithSQLite3Column:a2 column:1];
  id v6 = [MEMORY[0x1E4F1C9B8] hmbDataWithSQLite3Column:a2 column:2];
  uint64_t v7 = [[HMBLocalSQLContextRowZone alloc] initWithZoneRow:v4 name:v5 token:v6];
  id v8 = [MEMORY[0x1E4F29128] hmbUUIDWithSQLite3Column:a2 column:3];
  [(HMBLocalSQLContextRowZone *)v7 setReplication:v8];

  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
  return 0;
}

- (BOOL)_deleteZoneWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__HMBLocalSQLContext__deleteZoneWithRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteStoreString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __47__HMBLocalSQLContext__deleteZoneWithRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (unint64_t)_insertZoneWithIdentification:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v10 = insertStoreString;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __63__HMBLocalSQLContext__insertZoneWithIdentification_name_error___block_invoke;
  v16[3] = &unk_1E69EB818;
  id v11 = v9;
  id v17 = v11;
  id v12 = v8;
  id v18 = v12;
  uint64_t v19 = self;
  id v20 = &v22;
  uint64_t v21 = a5;
  id v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v10 block:v16];
  unint64_t v14 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v14;
}

id __63__HMBLocalSQLContext__insertZoneWithIdentification_name_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void **)(a1 + 32);
  id v13 = 0;
  hmbBindStringSQLite3(a2, 1, v4, &v13);
  id v5 = v13;
  id v6 = *(void **)(a1 + 40);
  id v12 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v12);
  id v7 = v12;

  id v8 = [MEMORY[0x1E4F1C9B8] data];
  id v11 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v11);
  id v9 = v11;

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 48), (uint64_t)a2, v9, *(void **)(a1 + 64));
  return v9;
}

- (int64_t)migrateFromSchemaVersion:(int64_t)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)a3 >= 2)
  {
    id v6 = (void *)MEMORY[0x1D944CB30](self, a2);
    id v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      long long v37 = v9;
      __int16 v38 = 2048;
      int64_t v39 = a3;
      __int16 v40 = 2048;
      uint64_t v41 = 1;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failing database migration because the database has a later version than our current known version (%ld > %ld).", buf, 0x20u);
    }
    return 0;
  }
  if (!a3 && [(HMBLocalSQLContext *)self migrateToSchema01WithError:a4] != 3)
  {
LABEL_10:
    v34.receiver = self;
    v34.super_class = (Class)HMBLocalSQLContext;
    return [(HMBSQLContext *)&v34 migrateFromSchemaVersion:a3 error:a4];
  }
  id v12 = self;
  id v13 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F2C4CB58];
  unint64_t v14 = [(HMBSQLContext *)v12 connection];
  id v35 = 0;
  uint64_t v15 = selectSQLite3(v14, "SELECT name FROM sqlite_master WHERE type = 'table'", MEMORY[0x1E4F1CC08], &v35);
  id v16 = v35;
  if (v15)
  {
    id v17 = (void *)MEMORY[0x1E4F1CAD0];
    id v18 = objc_msgSend(v15, "na_arrayByFlattening");
    uint64_t v19 = [v17 setWithArray:v18];

    if ([v13 isSubsetOfSet:v19])
    {

      goto LABEL_10;
    }
    uint64_t v24 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v21 = v12;
    uint64_t v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      id v27 = [v19 hmbDescription];
      [v13 hmbDescription];
      id v28 = v33 = v24;
      *(_DWORD *)buf = 138543874;
      long long v37 = v26;
      __int16 v38 = 2112;
      int64_t v39 = (int64_t)v27;
      __int16 v40 = 2112;
      uint64_t v41 = (uint64_t)v28;
      _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Set of found tables: %@ does not contain all required tables: %@", buf, 0x20u);

      uint64_t v24 = v33;
    }
  }
  else
  {
    id v20 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v21 = v12;
    uint64_t v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v37 = v23;
      __int16 v38 = 2112;
      int64_t v39 = (int64_t)v16;
      _os_log_impl(&dword_1D4693000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to query all required tables: %@", buf, 0x16u);
    }
  }

  id v29 = (void *)MEMORY[0x1D944CB30]();
  unint64_t v30 = v12;
  unint64_t v31 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v32 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    long long v37 = v32;
    _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Requiring re-init after migration because all required tables do not exist", buf, 0xCu);
  }
  return 1;
}

- (void)finalize
{
  os_unfair_lock_assert_owner(&self->super._lock);
  [(HMBSQLStatement *)self->_selectReadyInputBlocks finalize];
  [(HMBSQLStatement *)self->_selectReadyRollbackBlocks finalize];
  [(HMBSQLStatement *)self->_selectAllRecordRows finalize];
  [(HMBSQLStatement *)self->_selectAllRecordTypeRows finalize];
  [(HMBSQLStatement *)self->_selectAllRecordParentModelIDRows finalize];
  [(HMBSQLStatement *)self->_selectAllRecordParentModelIDTypeRows finalize];
  uint64_t v3 = [(HMBLocalSQLContext *)self queryContextsByModelType];
  [v3 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_7542];

  sqlite3_int64 v4 = [(HMBLocalSQLContext *)self queryContextsByClass];
  [v4 removeAllObjects];

  id v5 = [(HMBLocalSQLContext *)self queryContextsByModelType];
  [v5 removeAllObjects];

  v6.receiver = self;
  v6.super_class = (Class)HMBLocalSQLContext;
  [(HMBSQLContext *)&v6 finalize];
}

uint64_t __30__HMBLocalSQLContext_finalize__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 finalize];
}

- (BOOL)initializeNewlyCreatedDatabaseWithError:(id *)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  sqlite3_int64 v4 = self;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"CREATE TABLE IF NOT EXISTS store_v2(                              id                  INTEGER PRIMARY KEY AUTOINCREMENT,                label               STRING  NOT NULL,                                 identifier_data     BLOB UNIQUE NOT NULL,                             replication_data    BLOB                                             );",
    @"CREATE TABLE IF NOT EXISTS block_v2(                              id                  INTEGER PRIMARY KEY AUTOINCREMENT,                store_v2_id         INTEGER NOT NULL CONSTRAINT fetch_store_v2_id_fkey REFERENCES store_v2 (id) ON DELETE RESTRICT,             type                INTEGER NOT NULL,                                 options_data        BLOB                                             );",
    @"CREATE TABLE IF NOT EXISTS transaction_v2(                        id                  INTEGER PRIMARY KEY AUTOINCREMENT,                store_v2_id         INTEGER NOT NULL CONSTRAINT fetch_store_v2_id_fkey REFERENCES store_v2 (id) ON DELETE RESTRICT,             block_id            INTEGER NOT NULL CONSTRAINT transaction_v2_block_v2_id_fkey REFERENCES block_v2 (id) ON DELETE RESTRICT,             type                INTEGER NOT NULL,                                 external_id         BLOB    NOT NULL,                                 external_data       BLOB,                                             model_encoding      INTEGER NOT NULL,                                 model_data          BLOB                                             );",
    @"CREATE TABLE IF NOT EXISTS record_v2(                             id                  INTEGER PRIMARY KEY AUTOINCREMENT,                store_v2_id         INTEGER NOT NULL CONSTRAINT record_v2_group_id_fkey REFERENCES store_v2 (id) ON DELETE RESTRICT,             uuid                BLOB    NOT NULL,                                 parent_uuid         BLOB    NOT NULL,                                 type                TEXT,                                             model_schema        BLOB,                                             external_id         BLOB,                                             external_data       BLOB,                                             model_encoding      INTEGER NOT NULL,                                 model_data          BLOB,                                             push_encoding       INTEGER NOT NULL,                                 push_data           BLOB,                                             push_block_id       INTEGER CONSTRAINT record_v2_block_v2_fkey REFERENCES block_v2 (id) ON DELETE RESTRICT            );",
    @"CREATE TABLE IF NOT EXISTS index_sentinel(                 store_id            INTEGER NOT NULL, type                TEXT NOT NULL, CONSTRAINT fk_index_sentinel FOREIGN KEY (store_id) REFERENCES store_v2 (id) ON DELETE CASCADE);",
    0);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v11 = -[HMBSQLContext runSQLite3:](v4, "runSQLite3:", [v10 UTF8String]);
        if (v11)
        {
          uint64_t v22 = (void *)v11;
          id v23 = (void *)MEMORY[0x1D944CB30]();
          uint64_t v24 = v4;
          uint64_t v25 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            uint64_t v26 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            v61 = v26;
            __int16 v62 = 2112;
            id v63 = v10;
            __int16 v64 = 2112;
            long long v65 = v22;
            _os_log_impl(&dword_1D4693000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize SQL table %@: %@", buf, 0x20u);
          }
          sqlite3_close([(HMBSQLContext *)v24 connection]);
          id v27 = v22;
          id v20 = v27;
          id v12 = v5;
          goto LABEL_22;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v50 objects:v66 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"CREATE UNIQUE INDEX IF NOT EXISTS transaction_v2_ukey ON transaction_v2 (store_v2_id, type, external_id);",
    @"CREATE UNIQUE INDEX IF NOT EXISTS record_v2_external_store_v2_id_ukey ON record_v2 (store_v2_id, external_id);",
    @"CREATE UNIQUE INDEX IF NOT EXISTS record_v2_uuid_store_v2_id_ukey ON record_v2 (store_v2_id, uuid);",
    @"CREATE INDEX IF NOT EXISTS block_v2_store_type ON block_v2 (store_v2_id, type, id);",
    @"CREATE INDEX IF NOT EXISTS transaction_v2_block_id ON transaction_v2 (block_id, id);",
    @"CREATE INDEX IF NOT EXISTS record_v2_push_id ON record_v2 (push_block_id, id);",
    @"CREATE INDEX IF NOT EXISTS record_v2_store ON record_v2 (store_v2_id);",
    @"CREATE INDEX IF NOT EXISTS record_v2_store_uuid ON record_v2 (store_v2_id, uuid);",
    @"CREATE INDEX IF NOT EXISTS record_v2_store_parent_uuid ON record_v2 (store_v2_id, parent_uuid);",
    @"CREATE INDEX IF NOT EXISTS record_v2_store_type_parent_uuid ON record_v2 (store_v2_id, parent_uuid, type);",
    @"CREATE INDEX IF NOT EXISTS record_v2_store_external ON record_v2 (store_v2_id, external_id);",
    @"CREATE UNIQUE INDEX IF NOT EXISTS index_sentinel_unique ON index_sentinel (store_id, type);",
    0);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:buf count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
    while (2)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(id *)(*((void *)&v46 + 1) + 8 * j);
        uint64_t v18 = -[HMBSQLContext runSQLite3:](v4, "runSQLite3:", [v17 UTF8String]);
        if (v18)
        {
          id v28 = (void *)v18;
          id v29 = (void *)MEMORY[0x1D944CB30]();
          unint64_t v30 = v4;
          unint64_t v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            unint64_t v32 = HMFGetLogIdentifier();
            *(_DWORD *)v54 = 138543874;
            v55 = v32;
            __int16 v56 = 2112;
            uint64_t v57 = (uint64_t)v17;
            __int16 v58 = 2112;
            id v59 = v28;
            _os_log_impl(&dword_1D4693000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to initialize SQL index %@: %@", v54, 0x20u);
          }
          sqlite3_close([(HMBSQLContext *)v30 connection]);
          id v20 = v28;

          uint64_t v21 = v20;
          goto LABEL_26;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v46 objects:buf count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v45 = 0;
  BOOL v19 = [(HMBSQLContext *)v4 setSchemaVersion:1 error:&v45];
  id v20 = v45;
  if (v19)
  {
    uint64_t v21 = 0;
  }
  else
  {
    __int16 v40 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v41 = v4;
    uint64_t v42 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = HMFGetLogIdentifier();
      *(_DWORD *)v54 = 138543874;
      v55 = v43;
      __int16 v56 = 2048;
      uint64_t v57 = 1;
      __int16 v58 = 2112;
      id v59 = v20;
      _os_log_impl(&dword_1D4693000, v42, OS_LOG_TYPE_ERROR, "%{public}@Failed to updated schema version to current version %lu: %@", v54, 0x20u);
    }
    sqlite3_close([(HMBSQLContext *)v41 connection]);
    id v27 = v20;
    id v20 = v27;
LABEL_22:
    uint64_t v21 = v27;
  }
LABEL_26:

  if (v21)
  {
    id v33 = (void *)MEMORY[0x1D944CB30]();
    objc_super v34 = v4;
    id v35 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = HMFGetLogIdentifier();
      long long v37 = [(HMBSQLContext *)v34 url];
      *(_DWORD *)long long v66 = 138543874;
      long long v67 = v36;
      __int16 v68 = 2112;
      id v69 = v37;
      __int16 v70 = 2112;
      long long v71 = v21;
      _os_log_impl(&dword_1D4693000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to create SQLite datastore %@: %@", v66, 0x20u);
    }
    BOOL v38 = 0;
    if (a3) {
      *a3 = v21;
    }
  }
  else
  {
    v44.receiver = v4;
    v44.super_class = (Class)HMBLocalSQLContext;
    BOOL v38 = [(HMBSQLContext *)&v44 initializeNewlyCreatedDatabaseWithError:a3];
  }

  return v38;
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMBLocalSQLContext;
  if (!-[HMBSQLContext prepareWithError:](&v13, sel_prepareWithError_)) {
    return 0;
  }
  id v12 = 0;
  BOOL v5 = [(HMBLocalSQLContext *)self prepareTablesWithError:&v12];
  id v6 = v12;
  if (!v5)
  {
    uint64_t v7 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl(&dword_1D4693000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to prepare tables: %@", buf, 0x16u);
    }
    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (HMBSQLQueryStatement)selectAllRecordParentModelIDTypeRows
{
  os_unfair_lock_assert_owner(&self->super._lock);
  selectAllRecordParentModelIDTypeRows = self->_selectAllRecordParentModelIDTypeRows;
  if (!selectAllRecordParentModelIDTypeRows)
  {
    sqlite3_int64 v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s LIMIT (%lu)", selectAllRecordParentModelIDTypeRowsString, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    BOOL v5 = [[HMBSQLQueryStatement alloc] initWithContext:self statement:v4];
    id v6 = self->_selectAllRecordParentModelIDTypeRows;
    self->_selectAllRecordParentModelIDTypeRows = v5;

    selectAllRecordParentModelIDTypeRows = self->_selectAllRecordParentModelIDTypeRows;
  }
  return selectAllRecordParentModelIDTypeRows;
}

- (HMBSQLQueryStatement)selectAllRecordParentModelIDRows
{
  os_unfair_lock_assert_owner(&self->super._lock);
  selectAllRecordParentModelIDRows = self->_selectAllRecordParentModelIDRows;
  if (!selectAllRecordParentModelIDRows)
  {
    sqlite3_int64 v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s LIMIT (%lu)", selectAllRecordParentModelIDRowsString, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    BOOL v5 = [[HMBSQLQueryStatement alloc] initWithContext:self statement:v4];
    id v6 = self->_selectAllRecordParentModelIDRows;
    self->_selectAllRecordParentModelIDRows = v5;

    selectAllRecordParentModelIDRows = self->_selectAllRecordParentModelIDRows;
  }
  return selectAllRecordParentModelIDRows;
}

- (HMBSQLQueryStatement)selectAllRecordTypeRows
{
  os_unfair_lock_assert_owner(&self->super._lock);
  selectAllRecordTypeRows = self->_selectAllRecordTypeRows;
  if (!selectAllRecordTypeRows)
  {
    sqlite3_int64 v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s LIMIT (%lu)", selectAllRecordTypeRowsString, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    BOOL v5 = [[HMBSQLQueryStatement alloc] initWithContext:self statement:v4];
    id v6 = self->_selectAllRecordTypeRows;
    self->_selectAllRecordTypeRows = v5;

    selectAllRecordTypeRows = self->_selectAllRecordTypeRows;
  }
  return selectAllRecordTypeRows;
}

- (HMBSQLQueryStatement)selectAllRecordRows
{
  os_unfair_lock_assert_owner(&self->super._lock);
  selectAllRecordRows = self->_selectAllRecordRows;
  if (!selectAllRecordRows)
  {
    sqlite3_int64 v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s LIMIT (%lu)", selectAllRecordRowsString, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    BOOL v5 = [[HMBSQLQueryStatement alloc] initWithContext:self statement:v4];
    id v6 = self->_selectAllRecordRows;
    self->_selectAllRecordRows = v5;

    selectAllRecordRows = self->_selectAllRecordRows;
  }
  return selectAllRecordRows;
}

- (HMBSQLQueryStatement)selectReadyRollbackBlocks
{
  os_unfair_lock_assert_owner(&self->super._lock);
  selectReadyRollbackBlocks = self->_selectReadyRollbackBlocks;
  if (!selectReadyRollbackBlocks)
  {
    sqlite3_int64 v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s LIMIT (%lu)", selectReadyRollbackBlocksString, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    BOOL v5 = [[HMBSQLQueryStatement alloc] initWithContext:self statement:v4];
    id v6 = self->_selectReadyRollbackBlocks;
    self->_selectReadyRollbackBlocks = v5;

    selectReadyRollbackBlocks = self->_selectReadyRollbackBlocks;
  }
  return selectReadyRollbackBlocks;
}

- (HMBSQLQueryStatement)selectReadyInputBlocks
{
  os_unfair_lock_assert_owner(&self->super._lock);
  selectReadyInputBlocks = self->_selectReadyInputBlocks;
  if (!selectReadyInputBlocks)
  {
    sqlite3_int64 v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s LIMIT (%lu)", selectReadyInputBlocksString, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect"));
    BOOL v5 = [[HMBSQLQueryStatement alloc] initWithContext:self statement:v4];
    id v6 = self->_selectReadyInputBlocks;
    self->_selectReadyInputBlocks = v5;

    selectReadyInputBlocks = self->_selectReadyInputBlocks;
  }
  return selectReadyInputBlocks;
}

- (BOOL)sqlTransactionWithActivity:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 && *a4)
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_super v13 = HMFGetLogIdentifier();
      id v14 = *a4;
      int v18 = 138543618;
      BOOL v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring SQL block request due to previous error: %@", (uint8_t *)&v18, 0x16u);
    }
    id v15 = 0;
    BOOL v16 = 0;
  }
  else
  {
    id v15 = [(HMBLocalSQLContext *)self sqlTransactionWithActivity:v8 block:v9];
    BOOL v16 = v15 == 0;
    if (a4 && v15)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a4 = v15;
    }
  }

  return v16;
}

- (BOOL)sqlBlockWithActivity:(id)a3 error:(id *)a4 block:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (a4 && *a4)
  {
    id v10 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_super v13 = HMFGetLogIdentifier();
      id v14 = *a4;
      int v18 = 138543618;
      BOOL v19 = v13;
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_1D4693000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring SQL block request due to previous error: %@", (uint8_t *)&v18, 0x16u);
    }
    id v15 = 0;
    BOOL v16 = 0;
  }
  else
  {
    id v15 = [(HMBLocalSQLContext *)self sqlBlockWithActivity:v8 block:v9];
    BOOL v16 = v15 == 0;
    if (a4 && v15)
    {
      id v15 = v15;
      BOOL v16 = 0;
      *a4 = v15;
    }
  }

  return v16;
}

- (id)sqlTransactionWithActivity:(id)a3 block:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__HMBLocalSQLContext_sqlTransactionWithActivity_block___block_invoke;
  v11[3] = &unk_1E69EB7D0;
  id v12 = v6;
  v10.receiver = self;
  v10.super_class = (Class)HMBLocalSQLContext;
  id v7 = v6;
  id v8 = [(HMBSQLContext *)&v10 sqlTransactionWithActivity:a3 block:v11];

  return v8;
}

uint64_t __55__HMBLocalSQLContext_sqlTransactionWithActivity_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sqlBlockWithActivity:(id)a3 block:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HMBLocalSQLContext_sqlBlockWithActivity_block___block_invoke;
  v11[3] = &unk_1E69EB7D0;
  id v12 = v6;
  v10.receiver = self;
  v10.super_class = (Class)HMBLocalSQLContext;
  id v7 = v6;
  id v8 = [(HMBSQLContext *)&v10 sqlBlockWithActivity:a3 block:v11];

  return v8;
}

uint64_t __49__HMBLocalSQLContext_sqlBlockWithActivity_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (HMBLocalSQLContext)initWithURL:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalSQLContext;
  uint64_t v3 = [(HMBSQLContext *)&v9 initWithURL:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    queryContextsByClass = v3->_queryContextsByClass;
    v3->_queryContextsByClass = (NSMapTable *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    queryContextsByModelType = v3->_queryContextsByModelType;
    v3->_queryContextsByModelType = (NSMutableDictionary *)v6;
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t23 != -1) {
    dispatch_once(&logCategory__hmf_once_t23, &__block_literal_global_101);
  }
  id v2 = (void *)logCategory__hmf_once_v24;
  return v2;
}

uint64_t __33__HMBLocalSQLContext_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v24;
  logCategory__hmf_once_uint64_t v24 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)openWithURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = +[HMBSQLFile openContextWithURL:v5 usingSubclass:objc_opt_class() error:a4];

  return v6;
}

+ (void)unlinkDatastoreAt:(id)a3 everything:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 absoluteString];
  id v8 = NSString;
  objc_super v9 = [v7 lastPathComponent];
  objc_super v10 = [v8 stringWithFormat:@"^%@(?:|-shm|-wal)(\\..*)?$", v9];

  id v46 = 0;
  uint64_t v11 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v10 options:0 error:&v46];
  id v12 = v46;
  if (v12)
  {
    id v13 = v12;
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = a1;
    BOOL v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v49 = v17;
      __int16 v50 = 2112;
      id v51 = v13;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@unable to compile expression: %@", buf, 0x16u);
    }
  }
  else
  {
    __int16 v40 = v10;
    int v18 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v19 = [v7 stringByDeletingLastPathComponent];
    id v45 = 0;
    __int16 v20 = [v18 contentsOfDirectoryAtPath:v19 error:&v45];
    id v13 = v45;
    id v21 = (void *)[v20 mutableCopy];

    int64_t v39 = v21;
    if (v13)
    {
      uint64_t v22 = (void *)MEMORY[0x1D944CB30]();
      id v23 = a1;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        long long v49 = v25;
        __int16 v50 = 2112;
        id v51 = v19;
        __int16 v52 = 2112;
        id v53 = v13;
        _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@unable to get files in %@ (%@)", buf, 0x20u);
      }
    }
    else
    {
      long long v37 = v7;
      id v38 = v6;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v26 = v21;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v42 != v29) {
              objc_enumerationMutation(v26);
            }
            unint64_t v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            unint64_t v32 = objc_msgSend(v11, "firstMatchInString:options:range:", v31, 0, 0, objc_msgSend(v31, "length"));
            id v33 = v32;
            if (v32)
            {
              [v32 rangeAtIndex:1];
              if (v34 || v4)
              {
                long long v36 = [v19 stringByAppendingPathComponent:v31];
                [v18 removeItemAtPath:v36 error:0];
              }
            }
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v41 objects:v47 count:16];
        }
        while (v28);
      }

      id v7 = v37;
      id v6 = v38;
      id v13 = 0;
    }

    objc_super v10 = v40;
  }
}

- (BOOL)_resetOutputForRecordsWithBlockRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__HMBLocalSQLContext_Record___resetOutputForRecordsWithBlockRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:updateRecordsClearPushString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __71__HMBLocalSQLContext_Record___resetOutputForRecordsWithBlockRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (id)selectAllRecordsWithZoneRow:(unint64_t)a3 returning:(unint64_t)a4
{
  sqlite3_int64 v4 = [[HMBLocalSQLIteratorRowRecord alloc] initWithSQLContext:self zoneRow:a3 returning:a4];
  return v4;
}

- (id)_selectRecordsWithBlockRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7742;
  int v18 = __Block_byref_object_dispose__7743;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__HMBLocalSQLContext_Record___selectRecordsWithBlockRow_returning_error___block_invoke;
  v13[3] = &unk_1E69EBAB8;
  v13[6] = a3;
  v13[7] = a4;
  void v13[4] = self;
  void v13[5] = &v14;
  objc_super v9 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectRecordsPushBlockString block:v13];
  uint64_t v10 = v9;
  if (a5) {
    *a5 = v9;
  }
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

id __73__HMBLocalSQLContext_Record___selectRecordsWithBlockRow_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__HMBLocalSQLContext_Record___selectRecordsWithBlockRow_returning_error___block_invoke_2;
  v14[3] = &unk_1E69EBAE0;
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v14[5] = a1[7];
  id v15 = v5;
  v14[4] = v7;
  char v8 = [v6 fetchSQLite3:a2 error:&v15 block:v14];
  id v9 = v15;

  id v10 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    id v10 = v9;
  }

  return v10;
}

uint64_t __73__HMBLocalSQLContext_Record___selectRecordsWithBlockRow_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (id)_selectRecordsWithZoneRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__7742;
  int v18 = __Block_byref_object_dispose__7743;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_returning_error___block_invoke;
  v13[3] = &unk_1E69EBAB8;
  v13[6] = a3;
  v13[7] = a4;
  void v13[4] = self;
  void v13[5] = &v14;
  id v9 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectRecordsString block:v13];
  id v10 = v9;
  if (a5) {
    *a5 = v9;
  }
  id v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

id __72__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_returning_error___block_invoke_2;
  v14[3] = &unk_1E69EBAE0;
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  v14[5] = a1[7];
  id v15 = v5;
  v14[4] = v7;
  char v8 = [v6 fetchSQLite3:a2 error:&v15 block:v14];
  id v9 = v15;

  id v10 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    id v10 = v9;
  }

  return v10;
}

uint64_t __72__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (BOOL)_selectRecordsWithZoneRow:(unint64_t)a3 modelType:(id)a4 returning:(unint64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v14 = selectRecordsOfTypeString;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error_handler___block_invoke;
  v21[3] = &unk_1E69EBB58;
  unint64_t v26 = a3;
  id v15 = v12;
  id v22 = v15;
  id v23 = self;
  uint64_t v25 = &v28;
  unint64_t v27 = a5;
  id v16 = v13;
  id v24 = v16;
  id v17 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v14 block:v21];
  int v18 = v17;
  if (a6) {
    *a6 = v17;
  }
  char v19 = *((unsigned char *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v19;
}

id __90__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v2 = a2;
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  id v6 = *(void **)(a1 + 32);
  id v15 = v5;
  hmbBindStringSQLite3(v2, 2, v6, &v15);
  id v7 = v15;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error_handler___block_invoke_2;
  v11[3] = &unk_1E69EBB30;
  uint64_t v13 = *(void *)(a1 + 72);
  id v14 = v7;
  char v8 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  LOBYTE(v2) = [v8 fetchSQLite3:v2 error:&v14 block:v11];
  id v9 = v14;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v2;
  return v9;
}

uint64_t __90__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  sqlite3_int64 v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return 0;
}

- (id)_selectRecordsWithZoneRow:(unint64_t)a3 modelType:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__7742;
  unint64_t v27 = __Block_byref_object_dispose__7743;
  id v28 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = selectRecordsOfTypeString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error___block_invoke;
  v17[3] = &unk_1E69EBA90;
  unint64_t v21 = a3;
  id v12 = v10;
  id v18 = v12;
  char v19 = self;
  unint64_t v22 = a5;
  __int16 v20 = &v23;
  uint64_t v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v11 block:v17];
  id v14 = v13;
  if (a6) {
    *a6 = v13;
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

id __82__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[7];
  id v19 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v19);
  id v5 = v19;
  id v6 = (void *)a1[4];
  id v18 = v5;
  hmbBindStringSQLite3(a2, 2, v6, &v18);
  id v7 = v18;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error___block_invoke_2;
  v16[3] = &unk_1E69EBAE0;
  char v8 = (void *)a1[5];
  uint64_t v9 = a1[6];
  v16[5] = a1[8];
  id v17 = v7;
  void v16[4] = v9;
  char v10 = [v8 fetchSQLite3:a2 error:&v17 block:v16];
  id v11 = v17;

  id v12 = 0;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    id v12 = v11;
  }

  return v12;
}

uint64_t __82__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_modelType_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (id)_selectRecordWithZoneRow:(unint64_t)a3 parentModelID:(id)a4 modelType:(id)a5 returning:(unint64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  char v31 = __Block_byref_object_copy__7742;
  unint64_t v32 = __Block_byref_object_dispose__7743;
  id v33 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v14 = selectRecordsParentUUIDTypeString;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __95__HMBLocalSQLContext_Record___selectRecordWithZoneRow_parentModelID_modelType_returning_error___block_invoke;
  v21[3] = &unk_1E69EBB08;
  unint64_t v26 = a3;
  id v15 = v13;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  id v24 = self;
  unint64_t v27 = a6;
  uint64_t v25 = &v28;
  id v17 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v14 block:v21];
  id v18 = v17;
  if (a7) {
    *a7 = v17;
  }
  id v19 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v19;
}

id __95__HMBLocalSQLContext_Record___selectRecordWithZoneRow_parentModelID_modelType_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[8];
  id v21 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v21);
  id v5 = v21;
  id v6 = (void *)a1[4];
  id v20 = v5;
  hmbBindStringSQLite3(a2, 2, v6, &v20);
  id v7 = v20;

  char v8 = (void *)a1[5];
  id v19 = v7;
  hmbBindUUIDSQLite3(a2, 3, v8, &v19);
  id v9 = v19;

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __95__HMBLocalSQLContext_Record___selectRecordWithZoneRow_parentModelID_modelType_returning_error___block_invoke_2;
  v17[3] = &unk_1E69EBAE0;
  char v10 = (void *)a1[6];
  uint64_t v11 = a1[7];
  v17[5] = a1[9];
  id v18 = v9;
  void v17[4] = v11;
  LOBYTE(v7) = [v10 fetchSQLite3:a2 error:&v18 block:v17];
  id v12 = v18;

  id v13 = 0;
  if ((v7 & 1) == 0)
  {
    uint64_t v14 = *(void *)(a1[7] + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;

    id v13 = v12;
  }

  return v13;
}

uint64_t __95__HMBLocalSQLContext_Record___selectRecordWithZoneRow_parentModelID_modelType_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (id)_selectRecordsWithZoneRow:(unint64_t)a3 parentModelID:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__7742;
  unint64_t v27 = __Block_byref_object_dispose__7743;
  id v28 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v11 = selectRecordsParentUUIDString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __86__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_parentModelID_returning_error___block_invoke;
  v17[3] = &unk_1E69EBA90;
  unint64_t v21 = a3;
  id v12 = v10;
  id v18 = v12;
  id v19 = self;
  unint64_t v22 = a5;
  id v20 = &v23;
  id v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v11 block:v17];
  uint64_t v14 = v13;
  if (a6) {
    *a6 = v13;
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

id __86__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_parentModelID_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[7];
  id v19 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v19);
  id v5 = v19;
  id v6 = (void *)a1[4];
  id v18 = v5;
  hmbBindUUIDSQLite3(a2, 2, v6, &v18);
  id v7 = v18;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_parentModelID_returning_error___block_invoke_2;
  v16[3] = &unk_1E69EBAE0;
  char v8 = (void *)a1[5];
  uint64_t v9 = a1[6];
  v16[5] = a1[8];
  id v17 = v7;
  void v16[4] = v9;
  char v10 = [v8 fetchSQLite3:a2 error:&v17 block:v16];
  id v11 = v17;

  id v12 = 0;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    id v12 = v11;
  }

  return v12;
}

uint64_t __86__HMBLocalSQLContext_Record___selectRecordsWithZoneRow_parentModelID_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];

  return 0;
}

- (id)_selectRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__7742;
  unint64_t v27 = __Block_byref_object_dispose__7743;
  id v28 = 0;
  uint64_t v11 = selectRecordExternalString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__HMBLocalSQLContext_Record___selectRecordWithZoneRow_externalID_returning_error___block_invoke;
  v17[3] = &unk_1E69EBA90;
  unint64_t v21 = a3;
  id v12 = v10;
  id v18 = v12;
  id v19 = self;
  id v20 = &v23;
  unint64_t v22 = a5;
  uint64_t v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v11 block:v17];
  uint64_t v14 = v13;
  if (a6) {
    *a6 = v13;
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

id __82__HMBLocalSQLContext_Record___selectRecordWithZoneRow_externalID_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[7];
  id v19 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v19);
  id v5 = v19;
  id v6 = (void *)a1[4];
  id v18 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v18);
  id v7 = v18;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__HMBLocalSQLContext_Record___selectRecordWithZoneRow_externalID_returning_error___block_invoke_2;
  v16[3] = &unk_1E69EBA68;
  char v8 = (void *)a1[5];
  uint64_t v9 = a1[8];
  void v16[4] = a1[6];
  v16[5] = v9;
  id v17 = v7;
  int v10 = [v8 fetchSQLite3One:a2 error:&v17 block:v16];
  id v11 = v17;

  id v12 = 0;
  if (v10)
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    id v12 = v11;
  }

  return v12;
}

uint64_t __82__HMBLocalSQLContext_Record___selectRecordWithZoneRow_externalID_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (id)_selectRecordWithRow:(unint64_t)a3 returning:(unint64_t)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__7742;
  id v15 = __Block_byref_object_dispose__7743;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__HMBLocalSQLContext_Record___selectRecordWithRow_returning_error___block_invoke;
  v10[3] = &unk_1E69EBAB8;
  v10[4] = self;
  void v10[5] = &v11;
  void v10[6] = a3;
  v10[7] = a4;
  id v6 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:selectRecordString block:v10];
  id v7 = v6;
  if (a5) {
    *a5 = v6;
  }
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

id __67__HMBLocalSQLContext_Record___selectRecordWithRow_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__HMBLocalSQLContext_Record___selectRecordWithRow_returning_error___block_invoke_2;
  v14[3] = &unk_1E69EBA68;
  id v6 = (void *)a1[4];
  uint64_t v7 = a1[7];
  v14[4] = a1[5];
  v14[5] = v7;
  id v15 = v5;
  char v8 = [v6 fetchSQLite3One:a2 error:&v15 block:v14];
  id v9 = v15;

  id v10 = 0;
  if ((v8 & 1) == 0)
  {
    uint64_t v11 = *(void *)(a1[5] + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = 0;

    id v10 = v9;
  }

  return v10;
}

uint64_t __67__HMBLocalSQLContext_Record___selectRecordWithRow_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (id)_selectRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 returning:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  unint64_t v26 = __Block_byref_object_copy__7742;
  unint64_t v27 = __Block_byref_object_dispose__7743;
  id v28 = 0;
  uint64_t v11 = selectRecordUUIDString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HMBLocalSQLContext_Record___selectRecordWithZoneRow_modelID_returning_error___block_invoke;
  v17[3] = &unk_1E69EBA90;
  unint64_t v21 = a3;
  id v12 = v10;
  id v18 = v12;
  id v19 = self;
  id v20 = &v23;
  unint64_t v22 = a5;
  uint64_t v13 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v11 block:v17];
  uint64_t v14 = v13;
  if (a6) {
    *a6 = v13;
  }
  id v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

id __79__HMBLocalSQLContext_Record___selectRecordWithZoneRow_modelID_returning_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[7];
  id v19 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v19);
  id v5 = v19;
  id v6 = (void *)a1[4];
  id v18 = v5;
  hmbBindUUIDSQLite3(a2, 2, v6, &v18);
  id v7 = v18;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__HMBLocalSQLContext_Record___selectRecordWithZoneRow_modelID_returning_error___block_invoke_2;
  v16[3] = &unk_1E69EBA68;
  char v8 = (void *)a1[5];
  uint64_t v9 = a1[8];
  void v16[4] = a1[6];
  v16[5] = v9;
  id v17 = v7;
  char v10 = [v8 fetchSQLite3One:a2 error:&v17 block:v16];
  id v11 = v17;

  id v12 = 0;
  if ((v10 & 1) == 0)
  {
    uint64_t v13 = *(void *)(a1[6] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    id v12 = v11;
  }

  return v12;
}

uint64_t __79__HMBLocalSQLContext_Record___selectRecordWithZoneRow_modelID_returning_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [[HMBLocalSQLContextRowRecord alloc] initWithStatement:a2 returning:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (id)_selectRecordModelIDWithZoneRow:(unint64_t)a3 externalID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__7742;
  id v24 = __Block_byref_object_dispose__7743;
  id v25 = 0;
  uint64_t v9 = selectRecordUUIDExternalString;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HMBLocalSQLContext_Record___selectRecordModelIDWithZoneRow_externalID_error___block_invoke;
  v15[3] = &unk_1E69EBA40;
  unint64_t v19 = a3;
  id v10 = v8;
  id v16 = v10;
  id v17 = self;
  id v18 = &v20;
  id v11 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v9 block:v15];
  id v12 = v11;
  if (a5) {
    *a5 = v11;
  }
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

id __79__HMBLocalSQLContext_Record___selectRecordModelIDWithZoneRow_externalID_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[7];
  id v18 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v18);
  id v5 = v18;
  id v6 = (void *)a1[4];
  id v17 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v17);
  id v7 = v17;

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__HMBLocalSQLContext_Record___selectRecordModelIDWithZoneRow_externalID_error___block_invoke_2;
  v15[3] = &unk_1E69EBA18;
  id v8 = (void *)a1[5];
  void v15[4] = a1[6];
  id v16 = v7;
  char v9 = [v8 fetchSQLite3One:a2 error:&v16 block:v15];
  id v10 = v16;

  id v11 = 0;
  if ((v9 & 1) == 0)
  {
    uint64_t v12 = *(void *)(a1[6] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    id v11 = v10;
  }

  return v11;
}

uint64_t __79__HMBLocalSQLContext_Record___selectRecordModelIDWithZoneRow_externalID_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [MEMORY[0x1E4F29128] hmbUUIDWithSQLite3Column:a2 column:0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (BOOL)_deleteZombieRecordsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  id v7 = prepareSQLite3([(HMBSQLContext *)self connection], "DELETE FROM record_v2 WHERE store_v2_id = ?1 AND (model_encoding = 0 OR model_data IS NULL) AND (push_block_id IS NULL OR push_block_id NOT IN (SELECT id FROM block_v2))", &v18);
  id v8 = v18;
  id v9 = v8;
  if (v7)
  {
    id v17 = v8;
    hmbBindIntSQLite3(v7, 1, a3, &v17);
    id v10 = v17;

    BOOL v11 = __execAndSetError(self, v7, v10, a4);
    sqlite3_finalize(v7);
    id v9 = v10;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944CB30]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@unable to prepare SQL statement: %@", buf, 0x16u);
    }
    if (a4)
    {
      id v9 = v9;
      BOOL v11 = 0;
      *a4 = v9;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (BOOL)_deleteRecordsWithZoneRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = 0;
  id v7 = prepareSQLite3([(HMBSQLContext *)self connection], "DELETE FROM record_v2 WHERE store_v2_id=?1;",
         &v18);
  id v8 = v18;
  id v9 = v8;
  if (v7)
  {
    id v17 = v8;
    hmbBindIntSQLite3(v7, 1, a3, &v17);
    id v10 = v17;

    BOOL v11 = __execAndSetError(self, v7, v10, a4);
    sqlite3_finalize(v7);
    id v9 = v10;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1D944CB30]();
    id v13 = self;
    uint64_t v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@unable to prepare SQL statement: %@", buf, 0x16u);
    }
    if (a4)
    {
      id v9 = v9;
      BOOL v11 = 0;
      *a4 = v9;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)_clearPushForRecordRow:(unint64_t)a3 expectedOutputBlockRow:(unint64_t)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__HMBLocalSQLContext_Record___clearPushForRecordRow_expectedOutputBlockRow_error___block_invoke;
  v10[3] = &unk_1E69EBAB8;
  void v10[6] = a3;
  v10[7] = a4;
  v10[4] = self;
  void v10[5] = &v11;
  id v6 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:updateRecordClearPushExpectedString block:v10];
  id v7 = v6;
  if (a5) {
    *a5 = v6;
  }
  unint64_t v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v8;
}

id __82__HMBLocalSQLContext_Record___clearPushForRecordRow_expectedOutputBlockRow_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = a1[7];
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  if (v7)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    id v8 = v7;
  }
  else
  {
    id v9 = (void *)a1[4];
    id v14 = 0;
    uint64_t v10 = [v9 execSQLite3:a2 error:&v14];
    id v11 = v14;
    uint64_t v12 = v11;
    if (!v10)
    {
      if (!v11) {
        *(void *)(*(void *)(a1[5] + 8) + 24) = 1;
      }
      *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = 2;
    if (*(void *)(*(void *)(a1[5] + 8) + 24)) {
      id v8 = 0;
    }
    else {
      id v8 = v11;
    }
  }
  return v8;
}

- (unint64_t)_deleteRecordWithRow:(unint64_t)a3 expectedOutputBlockRow:(unint64_t)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HMBLocalSQLContext_Record___deleteRecordWithRow_expectedOutputBlockRow_error___block_invoke;
  v10[3] = &unk_1E69EBAB8;
  void v10[6] = a3;
  v10[7] = a4;
  v10[4] = self;
  void v10[5] = &v11;
  sqlite3_int64 v6 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteRecordBlockString block:v10];
  id v7 = v6;
  if (a5) {
    *a5 = v6;
  }
  unint64_t v8 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v8;
}

id __80__HMBLocalSQLContext_Record___deleteRecordWithRow_expectedOutputBlockRow_error___block_invoke(void *a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = a1[6];
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = a1[7];
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  if (v7)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    id v8 = v7;
  }
  else
  {
    id v9 = (void *)a1[4];
    id v14 = 0;
    uint64_t v10 = [v9 execSQLite3:a2 error:&v14];
    id v11 = v14;
    uint64_t v12 = v11;
    if (!v10)
    {
      if (!v11) {
        *(void *)(*(void *)(a1[5] + 8) + 24) = 1;
      }
      *(void *)(*(void *)(a1[5] + 8) + 24) = 0;
    }
    *(void *)(*(void *)(a1[5] + 8) + 24) = 2;
    if (*(void *)(*(void *)(a1[5] + 8) + 24)) {
      id v8 = 0;
    }
    else {
      id v8 = v11;
    }
  }
  return v8;
}

- (BOOL)_deleteRecordWithRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__HMBLocalSQLContext_Record___deleteRecordWithRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:deleteRecordString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __57__HMBLocalSQLContext_Record___deleteRecordWithRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_deleteRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v21 = 0;
  id v9 = prepareSQLite3([(HMBSQLContext *)self connection], "DELETE FROM record_v2 WHERE store_v2_id=?1 AND external_id=?2;",
         &v21);
  id v10 = v21;
  id v11 = v10;
  if (v9)
  {
    id v20 = v10;
    hmbBindIntSQLite3(v9, 1, a3, &v20);
    id v12 = v20;

    id v19 = v12;
    hmbBindDataSQLite3(v9, 2, v8, &v19);
    id v11 = v19;

    BOOL v13 = __execAndSetError(self, v9, v11, a5);
    sqlite3_finalize(v9);
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D944CB30]();
    id v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_ERROR, "%{public}@unable to prepare SQL statement: %@", buf, 0x16u);
    }
    if (a5)
    {
      id v11 = v11;
      BOOL v13 = 0;
      *a5 = v11;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (BOOL)_deleteRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v9 = deleteRecordUUIDString;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__HMBLocalSQLContext_Record___deleteRecordWithZoneRow_modelID_error___block_invoke;
  v13[3] = &unk_1E69EBA90;
  unint64_t v17 = a3;
  id v10 = v8;
  id v14 = v10;
  id v15 = self;
  id v16 = &v19;
  id v18 = a5;
  id v11 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v9 block:v13];
  LOBYTE(a5) = *((unsigned char *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)a5;
}

id __69__HMBLocalSQLContext_Record___deleteRecordWithZoneRow_modelID_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 56);
  id v10 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v10);
  id v5 = v10;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v9 = v5;
  hmbBindUUIDSQLite3(a2, 2, v6, &v9);
  id v7 = v9;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = __execAndSetError(*(void **)(a1 + 40), a2, v7, *(void **)(a1 + 64));
  return v7;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 modelType:(id)a4 modelSchema:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v12 = updateRecordTypeString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__HMBLocalSQLContext_Record___updateRecordWithRow_modelType_modelSchema_error___block_invoke;
  v17[3] = &unk_1E69EBB08;
  unint64_t v22 = a3;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v20 = self;
  uint64_t v21 = &v24;
  uint64_t v23 = a6;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v12 block:v17];
  LOBYTE(a6) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)a6;
}

id __79__HMBLocalSQLContext_Record___updateRecordWithRow_modelType_modelSchema_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v13 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v13);
  id v5 = v13;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v12 = v5;
  hmbBindStringSQLite3(a2, 2, v6, &v12);
  id v7 = v12;

  id v8 = *(void **)(a1 + 40);
  id v11 = v7;
  hmbBindUUIDSQLite3(a2, 3, v8, &v11);
  id v9 = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execAndSetError(*(void **)(a1 + 48), a2, v9, *(void **)(a1 + 72));
  return v9;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 pushBlockRow:(id)a4 pushData:(id)a5 pushEncoding:(unint64_t)a6 error:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v14 = updateRecordPushString;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __92__HMBLocalSQLContext_Record___updateRecordWithRow_pushBlockRow_pushData_pushEncoding_error___block_invoke;
  v19[3] = &unk_1E69EB9F0;
  unint64_t v24 = a3;
  unint64_t v25 = a6;
  id v15 = v13;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  unint64_t v22 = self;
  uint64_t v23 = &v27;
  uint64_t v26 = a7;
  id v17 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v14 block:v19];
  LOBYTE(a7) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)a7;
}

id __92__HMBLocalSQLContext_Record___updateRecordWithRow_pushBlockRow_pushData_pushEncoding_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = *(void *)(a1 + 72);
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  id v8 = *(void **)(a1 + 32);
  id v14 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v14);
  id v9 = v14;

  id v10 = *(void **)(a1 + 40);
  id v13 = v9;
  hmbBindIntNumberSQLite3(a2, 4, v10, &v13);
  id v11 = v13;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execAndSetError(*(void **)(a1 + 48), a2, v11, *(void **)(a1 + 80));
  return v11;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 modelEncoding:(unint64_t)a4 modelData:(id)a5 modelSchema:(id)a6 error:(id *)a7
{
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v14 = updateRecordString;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __93__HMBLocalSQLContext_Record___updateRecordWithRow_modelEncoding_modelData_modelSchema_error___block_invoke;
  v19[3] = &unk_1E69EB9F0;
  unint64_t v24 = a3;
  unint64_t v25 = a4;
  id v15 = v12;
  id v20 = v15;
  id v16 = v13;
  id v21 = v16;
  unint64_t v22 = self;
  uint64_t v23 = &v27;
  uint64_t v26 = a7;
  id v17 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v14 block:v19];
  LOBYTE(a7) = *((unsigned char *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)a7;
}

id __93__HMBLocalSQLContext_Record___updateRecordWithRow_modelEncoding_modelData_modelSchema_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v16 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v16);
  id v5 = v16;
  sqlite3_int64 v6 = *(void *)(a1 + 72);
  id v15 = v5;
  hmbBindIntSQLite3(a2, 2, v6, &v15);
  id v7 = v15;

  id v8 = *(void **)(a1 + 32);
  id v14 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v14);
  id v9 = v14;

  id v10 = *(void **)(a1 + 40);
  id v13 = v9;
  hmbBindUUIDSQLite3(a2, 4, v10, &v13);
  id v11 = v13;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execAndSetError(*(void **)(a1 + 48), a2, v11, *(void **)(a1 + 80));
  return v11;
}

- (BOOL)_updateRecordsClearPushWithPushBlockRow:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__HMBLocalSQLContext_Record___updateRecordsClearPushWithPushBlockRow_error___block_invoke;
  v7[3] = &unk_1E69EBAB8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  id v4 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:updateRecordsClearPushString block:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __76__HMBLocalSQLContext_Record___updateRecordsClearPushWithPushBlockRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 48);
  id v7 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v7);
  id v5 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = __execAndSetError(*(void **)(a1 + 32), a2, v5, *(void **)(a1 + 56));
  return v5;
}

- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 pushEncoding:(unint64_t)a5 pushData:(id)a6 pushBlockRow:(id)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v17 = updateRecordPushUUIDString;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __104__HMBLocalSQLContext_Record___updateRecordWithZoneRow_modelID_pushEncoding_pushData_pushBlockRow_error___block_invoke;
  v23[3] = &unk_1E69EB9C8;
  unint64_t v29 = a3;
  id v18 = v14;
  id v24 = v18;
  unint64_t v30 = a5;
  id v19 = v15;
  id v25 = v19;
  id v20 = v16;
  id v26 = v20;
  uint64_t v27 = self;
  id v28 = &v32;
  char v31 = a8;
  id v21 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v17 block:v23];
  LOBYTE(a8) = *((unsigned char *)v33 + 24);

  _Block_object_dispose(&v32, 8);
  return (char)a8;
}

id __104__HMBLocalSQLContext_Record___updateRecordWithZoneRow_modelID_pushEncoding_pushData_pushBlockRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 72);
  id v19 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v19);
  id v5 = v19;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v18 = v5;
  hmbBindUUIDSQLite3(a2, 2, v6, &v18);
  id v7 = v18;

  sqlite3_int64 v8 = *(void *)(a1 + 80);
  id v17 = v7;
  hmbBindIntSQLite3(a2, 3, v8, &v17);
  id v9 = v17;

  uint64_t v10 = *(void **)(a1 + 40);
  id v16 = v9;
  hmbBindDataSQLite3(a2, 4, v10, &v16);
  id v11 = v16;

  id v12 = *(void **)(a1 + 48);
  id v15 = v11;
  hmbBindIntNumberSQLite3(a2, 5, v12, &v15);
  id v13 = v15;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = __execAndSetError(*(void **)(a1 + 56), a2, v13, *(void **)(a1 + 88));
  return v13;
}

- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 modelID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v12 = updateRecordExternalUUIDString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__HMBLocalSQLContext_Record___updateRecordWithZoneRow_modelID_externalData_error___block_invoke;
  v17[3] = &unk_1E69EBB08;
  unint64_t v22 = a3;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v20 = self;
  id v21 = &v24;
  uint64_t v23 = a6;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v12 block:v17];
  LOBYTE(a6) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)a6;
}

id __82__HMBLocalSQLContext_Record___updateRecordWithZoneRow_modelID_externalData_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v13 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v13);
  id v5 = v13;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v12 = v5;
  hmbBindUUIDSQLite3(a2, 2, v6, &v12);
  id v7 = v12;

  sqlite3_int64 v8 = *(void **)(a1 + 40);
  id v11 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v11);
  id v9 = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execAndSetError(*(void **)(a1 + 48), a2, v9, *(void **)(a1 + 72));
  return v9;
}

- (BOOL)_updateRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v12 = updateRecordExternalExternalString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__HMBLocalSQLContext_Record___updateRecordWithZoneRow_externalID_externalData_error___block_invoke;
  v17[3] = &unk_1E69EBB08;
  unint64_t v22 = a3;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v20 = self;
  id v21 = &v24;
  uint64_t v23 = a6;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v12 block:v17];
  LOBYTE(a6) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)a6;
}

id __85__HMBLocalSQLContext_Record___updateRecordWithZoneRow_externalID_externalData_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v13 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v13);
  id v5 = v13;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v12 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v12);
  id v7 = v12;

  sqlite3_int64 v8 = *(void **)(a1 + 40);
  id v11 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v11);
  id v9 = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execAndSetError(*(void **)(a1 + 48), a2, v9, *(void **)(a1 + 72));
  return v9;
}

- (BOOL)_updateRecordWithRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v12 = updateRecordExternalString;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__HMBLocalSQLContext_Record___updateRecordWithRow_externalID_externalData_error___block_invoke;
  v17[3] = &unk_1E69EBB08;
  unint64_t v22 = a3;
  id v13 = v10;
  id v18 = v13;
  id v14 = v11;
  id v19 = v14;
  id v20 = self;
  id v21 = &v24;
  uint64_t v23 = a6;
  id v15 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v12 block:v17];
  LOBYTE(a6) = *((unsigned char *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  return (char)a6;
}

id __81__HMBLocalSQLContext_Record___updateRecordWithRow_externalID_externalData_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 64);
  id v13 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v13);
  id v5 = v13;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v12 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v12);
  id v7 = v12;

  sqlite3_int64 v8 = *(void **)(a1 + 40);
  id v11 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v11);
  id v9 = v11;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = __execAndSetError(*(void **)(a1 + 48), a2, v9, *(void **)(a1 + 72));
  return v9;
}

- (unint64_t)_insertRecordWithZoneRow:(unint64_t)a3 externalID:(id)a4 externalData:(id)a5 modelID:(id)a6 parentModelID:(id)a7 modelType:(id)a8 modelEncoding:(unint64_t)a9 modelData:(id)a10 modelSchema:(id)a11 pushEncoding:(unint64_t)a12 pushData:(id)a13 pushBlockRow:(id)a14 error:(id *)a15
{
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  id v28 = a14;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 0;
  uint64_t v41 = insertRecordString;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __188__HMBLocalSQLContext_Record___insertRecordWithZoneRow_externalID_externalData_modelID_parentModelID_modelType_modelEncoding_modelData_modelSchema_pushEncoding_pushData_pushBlockRow_error___block_invoke;
  v43[3] = &unk_1E69EB9A0;
  unint64_t v55 = a3;
  id v29 = v20;
  id v44 = v29;
  id v30 = v21;
  id v45 = v30;
  id v31 = v22;
  id v46 = v31;
  id v32 = v23;
  id v47 = v32;
  id v33 = v24;
  id v48 = v33;
  unint64_t v56 = a9;
  id v34 = v25;
  id v49 = v34;
  id v35 = v26;
  id v50 = v35;
  unint64_t v57 = a12;
  id v36 = v27;
  id v51 = v36;
  id v37 = v28;
  id v52 = v37;
  id v53 = self;
  uint64_t v54 = &v59;
  __int16 v58 = a15;
  id v38 = [(HMBSQLContext *)self _performBlockWithContextManagedStatementForString:v41 block:v43];
  unint64_t v39 = v60[3];

  _Block_object_dispose(&v59, 8);
  return v39;
}

id __188__HMBLocalSQLContext_Record___insertRecordWithZoneRow_externalID_externalData_modelID_parentModelID_modelType_modelEncoding_modelData_modelSchema_pushEncoding_pushData_pushBlockRow_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4 = *(void *)(a1 + 120);
  id v40 = 0;
  hmbBindIntSQLite3(a2, 1, v4, &v40);
  id v5 = v40;
  sqlite3_int64 v6 = *(void **)(a1 + 32);
  id v39 = v5;
  hmbBindDataSQLite3(a2, 2, v6, &v39);
  id v7 = v39;

  sqlite3_int64 v8 = *(void **)(a1 + 40);
  id v38 = v7;
  hmbBindDataSQLite3(a2, 3, v8, &v38);
  id v9 = v38;

  id v10 = *(void **)(a1 + 48);
  id v37 = v9;
  hmbBindUUIDSQLite3(a2, 4, v10, &v37);
  id v11 = v37;

  id v12 = *(void **)(a1 + 56);
  id v36 = v11;
  hmbBindUUIDSQLite3(a2, 5, v12, &v36);
  id v13 = v36;

  id v14 = *(void **)(a1 + 64);
  id v35 = v13;
  hmbBindStringSQLite3(a2, 6, v14, &v35);
  id v15 = v35;

  sqlite3_int64 v16 = *(void *)(a1 + 128);
  id v34 = v15;
  hmbBindIntSQLite3(a2, 7, v16, &v34);
  id v17 = v34;

  id v18 = *(void **)(a1 + 72);
  id v33 = v17;
  hmbBindDataSQLite3(a2, 8, v18, &v33);
  id v19 = v33;

  id v20 = *(void **)(a1 + 80);
  id v32 = v19;
  hmbBindUUIDSQLite3(a2, 9, v20, &v32);
  id v21 = v32;

  sqlite3_int64 v22 = *(void *)(a1 + 136);
  id v31 = v21;
  hmbBindIntSQLite3(a2, 10, v22, &v31);
  id v23 = v31;

  id v24 = *(void **)(a1 + 88);
  id v30 = v23;
  hmbBindDataSQLite3(a2, 11, v24, &v30);
  id v25 = v30;

  id v26 = *(void **)(a1 + 96);
  id v29 = v25;
  hmbBindIntNumberSQLite3(a2, 12, v26, &v29);
  id v27 = v29;

  *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = __execRowAndSetError(*(void **)(a1 + 104), (uint64_t)a2, v27, *(void **)(a1 + 144));
  return v27;
}

- (int64_t)migrateToSchema01WithError:(id *)a3
{
  -[HMBSQLContext runSQLite3:](self, "runSQLite3:", objc_msgSend(@"CREATE TABLE IF NOT EXISTS index_sentinel(                 store_id            INTEGER NOT NULL, type                TEXT NOT NULL, CONSTRAINT fk_index_sentinel FOREIGN KEY (store_id) REFERENCES store_v2 (id) ON DELETE CASCADE);",
      "UTF8String"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a3)
    {
LABEL_3:
      id v5 = v5;
      int64_t v6 = 0;
      *a3 = v5;
      goto LABEL_10;
    }
LABEL_6:
    int64_t v6 = 0;
    goto LABEL_10;
  }
  -[HMBSQLContext runSQLite3:](self, "runSQLite3:", objc_msgSend(@"CREATE UNIQUE INDEX IF NOT EXISTS index_sentinel_unique ON index_sentinel (store_id, type);",
      "UTF8String"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a3) {
      goto LABEL_3;
    }
    goto LABEL_6;
  }
  BOOL v7 = [(HMBSQLContext *)self setSchemaVersion:1 error:a3];
  id v5 = 0;
  if (v7) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 0;
  }
LABEL_10:

  return v6;
}

@end