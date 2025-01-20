@interface HMBLocalSQLQueryTable
+ (id)logCategory;
- (BOOL)finalized;
- (BOOL)prepareWithError:(id *)a3;
- (Class)modelClass;
- (HMBLocalSQLContext)context;
- (HMBLocalSQLQueryTable)initWithContext:(id)a3 queryModel:(Class)a4;
- (HMBSQLQueryStatement)selectAll;
- (HMBSQLStatement)deleteAll;
- (HMBSQLStatement)deleteRecord;
- (HMBSQLStatement)updateRecord;
- (NSArray)columnFields;
- (NSArray)columnNames;
- (NSMutableSet)userQueries;
- (NSString)dropTableSQL;
- (NSString)modelType;
- (id)buildQueriableFieldsForModel:(id)a3;
- (id)performQueryOn:(id)a3 properties:(id)a4 filter:(id)a5;
- (unint64_t)_deleteAllQueriesForZoneRow:(unint64_t)a3 error:(id *)a4;
- (unint64_t)_deleteQueryForRecordRow:(unint64_t)a3 error:(id *)a4;
- (unint64_t)_updateQueryForZoneRow:(unint64_t)a3 recordRow:(unint64_t)a4 encodedColumns:(id)a5 error:(id *)a6;
- (void)dealloc;
- (void)finalize;
- (void)setFinalized:(BOOL)a3;
@end

@implementation HMBLocalSQLQueryTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userQueries, 0);
  objc_storeStrong((id *)&self->_deleteRecord, 0);
  objc_storeStrong((id *)&self->_updateRecord, 0);
  objc_storeStrong((id *)&self->_deleteAll, 0);
  objc_storeStrong((id *)&self->_dropTableSQL, 0);
  objc_storeStrong((id *)&self->_selectAll, 0);
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_columnFields, 0);
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_destroyWeak((id *)&self->_context);
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (NSMutableSet)userQueries
{
  return self->_userQueries;
}

- (HMBSQLStatement)deleteRecord
{
  return self->_deleteRecord;
}

- (HMBSQLStatement)updateRecord
{
  return self->_updateRecord;
}

- (HMBSQLStatement)deleteAll
{
  return self->_deleteAll;
}

- (NSString)dropTableSQL
{
  return self->_dropTableSQL;
}

- (HMBSQLQueryStatement)selectAll
{
  return self->_selectAll;
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (NSArray)columnFields
{
  return self->_columnFields;
}

- (NSString)modelType
{
  return self->_modelType;
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (HMBLocalSQLContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  return (HMBLocalSQLContext *)WeakRetained;
}

- (void)finalize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(HMBLocalSQLQueryTable *)self finalized]) {
    _HMFPreconditionFailure();
  }
  v3 = (void *)MEMORY[0x1D944CB30]();
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D4693000, v5, OS_LOG_TYPE_INFO, "%{public}@Finalizing table", (uint8_t *)&v14, 0xCu);
  }
  v7 = [(HMBLocalSQLQueryTable *)v4 deleteAll];
  [v7 finalize];

  v8 = [(HMBLocalSQLQueryTable *)v4 deleteRecord];
  [v8 finalize];

  v9 = [(HMBLocalSQLQueryTable *)v4 updateRecord];
  [v9 finalize];

  v10 = [(HMBLocalSQLQueryTable *)v4 selectAll];
  [v10 finalize];

  v11 = [(HMBLocalSQLQueryTable *)v4 userQueries];
  v12 = [v11 allObjects];
  [v12 enumerateObjectsUsingBlock:&__block_literal_global_1266];

  v13 = [(HMBLocalSQLQueryTable *)v4 userQueries];
  [v13 removeAllObjects];

  [(HMBLocalSQLQueryTable *)v4 setFinalized:1];
}

uint64_t __33__HMBLocalSQLQueryTable_finalize__block_invoke(uint64_t a1, void *a2)
{
  return [a2 finalize];
}

- (void)dealloc
{
  if ([(HMBLocalSQLQueryTable *)self finalized])
  {
    v9.receiver = self;
    v9.super_class = (Class)HMBLocalSQLQueryTable;
    [(HMBLocalSQLQueryTable *)&v9 dealloc];
  }
  else
  {
    v3 = (HMBLocalSQLQueryTable *)_HMFPreconditionFailure();
    [(HMBLocalSQLQueryTable *)v3 _updateQueryForZoneRow:v5 recordRow:v6 encodedColumns:v7 error:v8];
  }
}

- (unint64_t)_updateQueryForZoneRow:(unint64_t)a3 recordRow:(unint64_t)a4 encodedColumns:(id)a5 error:(id *)a6
{
  id v10 = a5;
  v11 = [(HMBLocalSQLQueryTable *)self updateRecord];
  v12 = (sqlite3_stmt *)[v11 statement];

  hmbBindIntSQLite3(v12, 1, a3, a6);
  hmbBindIntSQLite3(v12, 2, a4, a6);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__HMBLocalSQLQueryTable__updateQueryForZoneRow_recordRow_encodedColumns_error___block_invoke;
  v16[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v16[4] = v12;
  [v10 enumerateObjectsUsingBlock:v16];

  v13 = [(HMBLocalSQLQueryTable *)self context];
  unint64_t v14 = [v13 insertSQLite3:v12 error:a6];

  return v14;
}

void __79__HMBLocalSQLQueryTable__updateQueryForZoneRow_recordRow_encodedColumns_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v11 = a2;
  id v5 = [MEMORY[0x1E4F1CA98] null];

  unint64_t v6 = v11;
  id v7 = *(sqlite3_stmt **)(a1 + 32);
  int v8 = a3 + 3;
  if (v5 == v11)
  {
    uint64_t v13 = 0;
    objc_super v9 = (id *)&v13;
    id v10 = &v13;
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v12 = 0;
    objc_super v9 = (id *)&v12;
    id v10 = &v12;
  }
  hmbBindDataSQLite3(v7, v8, v6, v10);
}

- (id)buildQueriableFieldsForModel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v6 = [(HMBLocalSQLQueryTable *)self columnNames];
  id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

  int v8 = [(HMBLocalSQLQueryTable *)self columnNames];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__HMBLocalSQLQueryTable_buildQueriableFieldsForModel___block_invoke;
  v13[3] = &unk_1E69E98F0;
  v13[4] = self;
  id v14 = v4;
  id v15 = v7;
  id v9 = v7;
  id v10 = v4;
  [v8 enumerateObjectsUsingBlock:v13];

  id v11 = (void *)[v9 copy];
  return v11;
}

void __54__HMBLocalSQLQueryTable_buildQueriableFieldsForModel___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 columnFields];
  id v12 = [v7 objectAtIndex:a3];

  int v8 = [*(id *)(a1 + 40) hmbPropertyNamed:v6];

  id v9 = *(void **)(a1 + 48);
  if (v8)
  {
    id v10 = [v12 encodeBlock];
    id v11 = ((void (**)(void, void *))v10)[2](v10, v8);
    [v9 addObject:v11];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CA98] null];
    [v9 addObject:v10];
  }
}

- (unint64_t)_deleteAllQueriesForZoneRow:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(HMBLocalSQLQueryTable *)self deleteAll];
  int v8 = (sqlite3_stmt *)[v7 statement];

  hmbBindIntSQLite3(v8, 1, a3, a4);
  id v9 = [(HMBLocalSQLQueryTable *)self context];
  unint64_t v10 = [v9 execSQLite3:v8 error:a4];

  return v10;
}

- (unint64_t)_deleteQueryForRecordRow:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(HMBLocalSQLQueryTable *)self deleteRecord];
  int v8 = (sqlite3_stmt *)[v7 statement];

  hmbBindIntSQLite3(v8, 1, a3, a4);
  id v9 = [(HMBLocalSQLQueryTable *)self context];
  unint64_t v10 = [(HMBLocalSQLQueryTable *)self deleteRecord];
  unint64_t v11 = objc_msgSend(v9, "execSQLite3:error:", objc_msgSend(v10, "statement"), a4);

  return v11;
}

- (id)performQueryOn:(id)a3 properties:(id)a4 filter:(id)a5
{
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1CA48];
  id v10 = a5;
  id v11 = a3;
  id v12 = [v9 array];
  uint64_t v13 = [(HMBLocalSQLQueryTable *)self columnNames];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __58__HMBLocalSQLQueryTable_performQueryOn_properties_filter___block_invoke;
  v20[3] = &unk_1E69E98F0;
  id v21 = v8;
  id v22 = v12;
  v23 = self;
  id v14 = v12;
  id v15 = v8;
  [v13 enumerateObjectsUsingBlock:v20];

  uint64_t v16 = [HMBLocalZoneQueryResultFilter alloc];
  v17 = [(HMBLocalSQLQueryTable *)self selectAll];
  v18 = [(HMBLocalZoneQueryResultFilter *)v16 initWithLocalZone:v11 statement:v17 columns:v14 filter:v10];

  return v18;
}

void __58__HMBLocalSQLQueryTable_performQueryOn_properties_filter___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id v5 = *(void **)(a1 + 32);
  if (!v5 || [v5 containsObject:v12])
  {
    id v6 = *(void **)(a1 + 40);
    id v7 = [HMBLocalZoneQueryResultColumnTuple alloc];
    uint64_t v8 = (a3 + 1);
    id v9 = [*(id *)(a1 + 48) columnFields];
    id v10 = [v9 objectAtIndex:a3];
    id v11 = [(HMBLocalZoneQueryResultColumnTuple *)v7 initWithName:v12 offset:v8 modelField:v10];
    [v6 addObject:v11];
  }
}

- (BOOL)prepareWithError:(id *)a3
{
  uint64_t v198 = *MEMORY[0x1E4F143B8];
  v168 = [(HMBLocalSQLQueryTable *)self context];
  id v4 = [v168 queryTables];
  id v5 = [NSString stringWithFormat:@"queryable_%@", self->_modelType];
  v173 = [v4 objectForKeyedSubscript:v5];

  if (v173)
  {
    id v6 = (void *)MEMORY[0x1E4F1CA80];
    id v7 = [(HMBLocalSQLQueryTable *)self columnNames];
    uint64_t v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v8 count];
    id v10 = [v173 columnNames];
    uint64_t v11 = [v10 count];

    if (v9 == v11)
    {
      id v12 = [v173 columnNames];
      [v8 minusSet:v12];

      BOOL v13 = [v8 count] != 0;
    }
    else
    {
      BOOL v13 = 1;
    }
  }
  else
  {
    BOOL v13 = 1;
  }
  v172 = [(objc_class *)[(HMBLocalSQLQueryTable *)self modelClass] hmbQueries];
  v174[0] = MEMORY[0x1E4F143A8];
  v174[1] = 3221225472;
  v174[2] = __42__HMBLocalSQLQueryTable_prepareWithError___block_invoke;
  v174[3] = &unk_1E69E9918;
  v174[4] = self;
  [v172 enumerateObjectsUsingBlock:v174];
  if (!v13) {
    goto LABEL_31;
  }
  id v14 = self;
  v169 = [(HMBLocalSQLQueryTable *)v14 context];
  id v15 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F2C4CB40];
  uint64_t v16 = [(HMBLocalSQLQueryTable *)v14 columnNames];
  uint64_t v181 = MEMORY[0x1E4F143A8];
  uint64_t v182 = 3221225472;
  v183 = ____buildTableForClass_block_invoke;
  v184 = &unk_1E69E9980;
  id v166 = v15;
  id v185 = v166;
  [v16 enumerateObjectsUsingBlock:&v181];

  v17 = (void *)MEMORY[0x1D944CB30]();
  v18 = v14;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = HMFGetLogIdentifier();
    id v21 = [(HMBLocalSQLQueryTable *)v18 modelType];
    id v22 = [v166 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v20;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    *(_WORD *)&buf[22] = 2112;
    v193 = v22;
    _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Creating index table for %@ model (fields: %@)", buf, 0x20u);
  }
  v23 = NSString;
  v24 = [(HMBLocalSQLQueryTable *)v18 modelType];
  v25 = [NSString stringWithFormat:@"queryable_%@", v24];
  v26 = [v23 stringWithFormat:@"DROP TABLE IF EXISTS %@;", v25];

  v27 = NSString;
  v28 = [(HMBLocalSQLQueryTable *)v18 modelType];
  uint64_t v29 = [v27 stringWithFormat:@"DELETE FROM index_sentinel WHERE type = '%@'", v28];;

  id v163 = (id) v29;
  uint64_t v30 = [v163 UTF8String];
  id v177 = 0;
  LOBYTE(v29) = [v169 runSQLite3:v30 error:&v177];
  id v31 = v177;
  if ((v29 & 1) == 0)
  {
    v32 = (void *)MEMORY[0x1D944CB30]();
    v33 = v18;
    v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1D4693000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to clean up sentinel table (not fatal): %@", buf, 0x16u);
    }
  }
  id v162 = v26;
  uint64_t v36 = [v162 UTF8String];
  *(void *)v189 = v31;
  char v37 = [v169 runSQLite3:v36 error:v189];
  id v38 = *(id *)v189;

  if ((v37 & 1) == 0)
  {
    v39 = (void *)MEMORY[0x1D944CB30]();
    v40 = v18;
    v41 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      v42 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v42;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v38;
      _os_log_impl(&dword_1D4693000, v41, OS_LOG_TYPE_INFO, "%{public}@Failed to clean up sentinel index table (not fatal): %@", buf, 0x16u);
    }
  }
  v43 = NSString;
  v44 = [(HMBLocalSQLQueryTable *)v18 modelType];
  uint64_t v45 = [NSString stringWithFormat:@"queryable_%@", v44];
  v46 = [v166 componentsJoinedByString:@", "];
  v47 = [(HMBLocalSQLQueryTable *)v18 modelType];
  v48 = [NSString stringWithFormat:@"queryable_%@", v47];
  objc_msgSend(v43, "stringWithFormat:", @"CREATE TABLE %@ (%@, CONSTRAINT fk_%@ FOREIGN KEY (_record_id) REFERENCES record_v2 (id) ON DELETE CASCADE);",
    v45,
    v46,
  v49 = v48);

  id v50 = v49;
  uint64_t v51 = [v50 UTF8String];
  id v176 = v38;
  LOBYTE(v45) = [v169 runSQLite3:v51 error:&v176];
  id v52 = v176;

  if (v45)
  {
    v53 = NSString;
    v54 = [(HMBLocalSQLQueryTable *)v18 modelType];
    v55 = [NSString stringWithFormat:@"qu_%@", v54];
    v56 = [(HMBLocalSQLQueryTable *)v18 modelType];
    v57 = [NSString stringWithFormat:@"queryable_%@", v56];
    objc_msgSend(v53, "stringWithFormat:", @"CREATE UNIQUE INDEX IF NOT EXISTS %@ ON %@ (_store_id, _record_id);",
      v55,
    v58 = v57);

    id v59 = v58;
    uint64_t v60 = [v59 UTF8String];
    id v175 = v52;
    int v61 = [v169 runSQLite3:v60 error:&v175];
    id v62 = v175;

    if ((v61 & 1) == 0)
    {
      context = (void *)MEMORY[0x1D944CB30]();
      v63 = v18;
      v64 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        v65 = HMFGetLogIdentifier();
        v66 = [(HMBLocalSQLQueryTable *)v63 modelType];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v65;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v66;
        *(_WORD *)&buf[22] = 2112;
        v193 = v62;
        _os_log_impl(&dword_1D4693000, v64, OS_LOG_TYPE_ERROR, "%{public}@Failed to create index for query table for %@: %@", buf, 0x20u);
      }
      if (a3) {
        *a3 = v62;
      }
    }

    id v52 = v62;
  }
  else
  {
    v67 = (void *)MEMORY[0x1D944CB30]();
    v68 = v18;
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v70 = HMFGetLogIdentifier();
      v71 = [(HMBLocalSQLQueryTable *)v68 modelType];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v71;
      *(_WORD *)&buf[22] = 2112;
      v193 = v52;
      _os_log_impl(&dword_1D4693000, v69, OS_LOG_TYPE_ERROR, "%{public}@Failed to create query table for %@: %@", buf, 0x20u);
    }
    if (a3)
    {
      id v52 = v52;
      int v61 = 0;
      *a3 = v52;
    }
    else
    {
      int v61 = 0;
    }
  }

  if (!v61)
  {
    BOOL v159 = 0;
  }
  else
  {
LABEL_31:
    v72 = self;
    id v170 = v172;
    v73 = [(HMBLocalSQLQueryTable *)v72 context];
    v74 = [v73 queryTables];
    v75 = [(HMBLocalSQLQueryTable *)v72 modelType];
    v76 = [NSString stringWithFormat:@"queryable_%@", v75];
    v77 = [v74 objectForKey:v76];
    v78 = [v77 indexes];
    v79 = (void *)[v78 mutableCopy];

    if (!v79)
    {
      v79 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    v80 = (void *)MEMORY[0x1E4F1CAD0];
    v81 = objc_msgSend(v170, "na_map:", &__block_literal_global_181);
    v167 = [v80 setWithArray:v81];

    v82 = NSString;
    v83 = [(HMBLocalSQLQueryTable *)v72 modelType];
    v84 = [v82 stringWithFormat:@"qu_%@", v83];

    v85 = (void *)MEMORY[0x1E4F1CAD0];
    v86 = [v79 allKeys];
    v87 = [v85 setWithArray:v86];
    v165 = objc_msgSend(v87, "na_setByRemovingObjectsFromSet:", v167);

    uint64_t v181 = MEMORY[0x1E4F143A8];
    uint64_t v182 = 3221225472;
    v183 = ____updateIndexesForClass_block_invoke_2;
    v184 = &unk_1E69E99C8;
    id v88 = v84;
    id v185 = v88;
    id v89 = v73;
    id v186 = v89;
    v90 = v72;
    v187 = v90;
    id v91 = v79;
    id v188 = v91;
    [v165 enumerateObjectsUsingBlock:&v181];
    id v177 = 0;
    v178 = &v177;
    uint64_t v179 = 0x2020000000;
    char v180 = 0;
    v92 = [v91 objectForKey:v88];
    LODWORD(v84) = v92 == 0;

    if (v84)
    {
      *((unsigned char *)v178 + 24) = 1;
      v93 = NSString;
      v94 = [(HMBLocalSQLQueryTable *)v90 modelType];
      v95 = [NSString stringWithFormat:@"queryable_%@", v94];
      v96 = [v93 stringWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (_store_id, _record_id)", v88, v95];

      id v97 = v96;
      v98 = objc_msgSend(v89, "runSQLite3:", objc_msgSend(v97, "UTF8String"));
      v99 = (void *)MEMORY[0x1D944CB30]();
      v100 = v90;
      HMFGetOSLogHandle();
      v101 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        v102 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v102;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v97;
        _os_log_impl(&dword_1D4693000, v101, OS_LOG_TYPE_INFO, "%{public}@Creating generic index: %@", buf, 0x16u);
      }
      if (v98)
      {
        v103 = (void *)MEMORY[0x1D944CB30]();
        v104 = v100;
        HMFGetOSLogHandle();
        v105 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          v106 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v106;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v97;
          *(_WORD *)&buf[22] = 2112;
          v193 = v98;
          _os_log_impl(&dword_1D4693000, v105, OS_LOG_TYPE_ERROR, "%{public}@Unable to create generic index %@: %@", buf, 0x20u);
        }
      }
    }
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____updateIndexesForClass_block_invoke_193;
    v193 = &unk_1E69E99F0;
    v107 = (HMBLocalSQLQueryTable *)v91;
    v194 = v107;
    v108 = v90;
    v195 = v108;
    id v109 = v89;
    id v196 = v109;
    v197 = &v177;
    [v170 enumerateObjectsUsingBlock:buf];
    if (*((unsigned char *)v178 + 24))
    {
      v110 = NSString;
      v111 = [(HMBLocalSQLQueryTable *)v108 modelType];
      v112 = [v110 stringWithFormat:@"DELETE FROM index_sentinel WHERE type = '%@'", v111];;

      id v113 = v112;
      v114 = objc_msgSend(v109, "runSQLite3:", objc_msgSend(v113, "UTF8String"));
      if (v114)
      {
        v115 = (void *)MEMORY[0x1D944CB30]();
        v116 = v108;
        HMFGetOSLogHandle();
        v117 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
        {
          v118 = HMFGetLogIdentifier();
          *(_DWORD *)v189 = 138543618;
          *(void *)&v189[4] = v118;
          __int16 v190 = 2112;
          v191 = v114;
          _os_log_impl(&dword_1D4693000, v117, OS_LOG_TYPE_INFO, "%{public}@Failed to remove sentinel table (not fatal): %@", v189, 0x16u);
        }
      }
    }
    _Block_object_dispose(&v177, 8);

    v119 = v108;
    v120 = (void *)MEMORY[0x1E4F1CA48];
    id v121 = v170;
    v122 = [(HMBLocalSQLQueryTable *)v119 columnNames];
    v123 = objc_msgSend(v120, "arrayWithCapacity:", objc_msgSend(v122, "count"));

    v124 = [(HMBLocalSQLQueryTable *)v119 columnNames];
    uint64_t v181 = MEMORY[0x1E4F143A8];
    uint64_t v182 = 3221225472;
    v183 = ____prepareStatementsForClass_block_invoke;
    v184 = &unk_1E69E9980;
    id v185 = v123;
    id v171 = v123;
    [v124 enumerateObjectsUsingBlock:&v181];

    v125 = [(HMBLocalSQLQueryTable *)v119 columnNames];
    v126 = [v125 componentsJoinedByString:@", "];

    v127 = [v171 componentsJoinedByString:@", "];
    v128 = NSString;
    v129 = [(HMBLocalSQLQueryTable *)v119 modelType];
    v130 = [NSString stringWithFormat:@"queryable_%@", v129];
    v131 = [v128 stringWithFormat:@"DELETE FROM %@ WHERE _store_id=?1", v130];

    v132 = NSString;
    v133 = [(HMBLocalSQLQueryTable *)v119 modelType];
    v134 = [NSString stringWithFormat:@"queryable_%@", v133];
    v135 = [v132 stringWithFormat:@"DELETE FROM %@ where _record_id=?1", v134];

    v136 = NSString;
    v137 = [(HMBLocalSQLQueryTable *)v119 modelType];
    v138 = [NSString stringWithFormat:@"queryable_%@", v137];
    uint64_t v139 = [v136 stringWithFormat:@"DROP TABLE IF EXISTS %@;", v138];
    dropTableSQL = v119->_dropTableSQL;
    v119->_dropTableSQL = (NSString *)v139;

    v141 = NSString;
    v142 = [(HMBLocalSQLQueryTable *)v119 modelType];
    v143 = [NSString stringWithFormat:@"queryable_%@", v142];
    v144 = [v141 stringWithFormat:@"INSERT OR REPLACE INTO %@ (_store_id, _record_id, %@) values(?1, ?2, %@)", v143, v126, v127];

    v145 = NSString;
    v146 = [(HMBLocalSQLQueryTable *)v119 modelType];
    v147 = [NSString stringWithFormat:@"queryable_%@", v146];
    v148 = [v145 stringWithFormat:@"SELECT _record_id, %@ FROM %@ WHERE _store_id = :_store_id AND _record_id > :_sequence_offset ORDER BY _record_id LIMIT (%lu)", v126, v147, +[HMBSQLQueryIterator maximumRowsPerSelect](HMBSQLQueryIterator, "maximumRowsPerSelect")];

    v149 = [(HMBLocalSQLQueryTable *)v119 context];
    v119->_finalized = 0;
    v150 = [[HMBSQLStatement alloc] initWithContext:v149 statement:v131];
    deleteAll = v119->_deleteAll;
    v119->_deleteAll = v150;

    v152 = [[HMBSQLStatement alloc] initWithContext:v149 statement:v135];
    deleteRecord = v119->_deleteRecord;
    v119->_deleteRecord = v152;

    v154 = [[HMBSQLStatement alloc] initWithContext:v149 statement:v144];
    updateRecord = v119->_updateRecord;
    v119->_updateRecord = v154;

    v156 = [[HMBSQLQueryStatement alloc] initWithContext:v149 statement:v148];
    selectAll = v119->_selectAll;
    v119->_selectAll = v156;

    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = ____prepareStatementsForClass_block_invoke_2;
    v193 = &unk_1E69E9918;
    v194 = v119;
    v158 = v119;
    [v121 enumerateObjectsUsingBlock:buf];

    BOOL v159 = 1;
  }

  return v159;
}

void __42__HMBLocalSQLQueryTable_prepareWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setModelClass:", objc_msgSend(v2, "modelClass"));
}

- (HMBLocalSQLQueryTable)initWithContext:(id)a3 queryModel:(Class)a4
{
  id v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)HMBLocalSQLQueryTable;
  id v7 = [(HMBLocalSQLQueryTable *)&v36 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_context, v6);
    objc_storeStrong((id *)&v8->_modelClass, a4);
    uint64_t v9 = NSStringFromClass(a4);
    modelType = v8->_modelType;
    v8->_modelType = (NSString *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA80] set];
    userQueries = v8->_userQueries;
    v8->_userQueries = (NSMutableSet *)v11;

    v8->_finalized = 1;
    BOOL v13 = [(objc_class *)a4 hmbProperties];
    id v14 = [MEMORY[0x1E4F1CA80] set];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke;
    v34[3] = &unk_1E69EA080;
    id v35 = v14;
    id v15 = v14;
    [v13 enumerateKeysAndObjectsUsingBlock:v34];
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v18 = [v15 allObjects];
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    uint64_t v29 = __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke_2;
    uint64_t v30 = &unk_1E69E98F0;
    id v31 = v13;
    id v32 = v16;
    id v33 = v17;
    id v19 = v17;
    id v20 = v16;
    id v21 = v13;
    [v18 enumerateObjectsUsingBlock:&v27];

    uint64_t v22 = objc_msgSend(v19, "copy", v27, v28, v29, v30);
    columnNames = v8->_columnNames;
    v8->_columnNames = (NSArray *)v22;

    uint64_t v24 = [v20 copy];
    columnFields = v8->_columnFields;
    v8->_columnFields = (NSArray *)v24;
  }
  return v8;
}

void __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 encodeBlock];

  if (v5) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __52__HMBLocalSQLQueryTable_initWithContext_queryModel___block_invoke_2(id *a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = objc_msgSend(a1[4], "objectForKey:");
  if (v3)
  {
    id v4 = (void *)v3;
    [a1[5] addObject:v3];
    [a1[6] addObject:v7];
  }
  else
  {
    id v5 = (void *)_HMFPreconditionFailure();
    +[HMBLocalSQLQueryTable logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t18 != -1) {
    dispatch_once(&logCategory__hmf_once_t18, &__block_literal_global_20);
  }
  v2 = (void *)logCategory__hmf_once_v19;
  return v2;
}

uint64_t __36__HMBLocalSQLQueryTable_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v19;
  logCategory__hmf_once_id v19 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end