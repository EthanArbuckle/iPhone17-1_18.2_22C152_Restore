@interface HMBModelIndexedQuery
+ (id)queryWithSQLPredicate:(id)a3 ascending:(BOOL)a4 indexedProperties:(id)a5 arguments:(id)a6;
- (BOOL)hasExpectedIndexes;
- (HMBModelIndexedQuery)initWithSQLPredicate:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 indexNameSuffix:(id)a6 indexedColumns:(id)a7 arguments:(id)a8;
- (NSArray)indexedColumns;
- (NSString)indexName;
- (NSString)indexNameSuffix;
@end

@implementation HMBModelIndexedQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexedColumns, 0);
  objc_storeStrong((id *)&self->_indexNameSuffix, 0);
}

- (NSArray)indexedColumns
{
  return self->_indexedColumns;
}

- (NSString)indexNameSuffix
{
  return self->_indexNameSuffix;
}

- (BOOL)hasExpectedIndexes
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!+[HMBSQLStatement explainStatements])
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  v3 = NSString;
  v4 = [(HMBModelIndexedQuery *)self indexName];
  v5 = [v3 stringWithFormat:@"INDEX %@", v4];

  v6 = [(HMBModelQuery *)self preparedQueries];
  v7 = [v6 objectEnumerator];

  uint64_t v8 = [v7 nextObject];
  if (!v8) {
    goto LABEL_12;
  }
  v9 = (void *)v8;
  while (1)
  {
    v10 = [v9 queryPlans];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke;
    v22[3] = &unk_1E69EA738;
    id v11 = v5;
    id v23 = v11;
    v24 = self;
    char v12 = objc_msgSend(v10, "na_any:", v22);

    if ((v12 & 1) == 0) {
      break;
    }

    uint64_t v13 = [v7 nextObject];

    v9 = (void *)v13;
    if (!v13) {
      goto LABEL_10;
    }
  }
  v14 = (void *)MEMORY[0x1D944CB30]();
  v15 = self;
  v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = HMFGetLogIdentifier();
    v18 = sqlite3_sql((sqlite3_stmt *)[v9 statement]);
    *(_DWORD *)buf = 138543874;
    v26 = v17;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2080;
    v30 = v18;
    _os_log_impl(&dword_1D4693000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@Didn't find reference to %@ in query plan for %s:", buf, 0x20u);
  }
  v19 = [v9 queryPlans];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_174;
  v21[3] = &unk_1E69EA760;
  v21[4] = v15;
  [v19 enumerateObjectsUsingBlock:v21];

LABEL_10:
  return v12;
}

uint64_t __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 detail];
  int v5 = [v4 containsString:*(void *)(a1 + 32)];

  v6 = [*(id *)(a1 + 40) indexedColumns];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_2;
  v9[3] = &unk_1E69EA710;
  id v10 = v3;
  id v7 = v3;
  LODWORD(v4) = objc_msgSend(v6, "na_allObjectsPassTest:", v9);

  return v5 & v4;
}

void __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_174(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1D944CB30]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = (int)[v3 row];
    uint64_t v9 = (int)[v3 parent];
    id v10 = [v3 detail];
    int v11 = 138544130;
    char v12 = v7;
    __int16 v13 = 2048;
    uint64_t v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    __int16 v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_1D4693000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@    %lu.%lu %@", (uint8_t *)&v11, 0x2Au);
  }
}

uint64_t __42__HMBModelIndexedQuery_hasExpectedIndexes__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 detail];
  id v5 = objc_msgSend(v4, "componentsSeparatedByString:", @"(");
  v6 = [v5 lastObject];

  uint64_t v7 = [v6 containsString:v3];
  return v7;
}

- (NSString)indexName
{
  id v3 = NSString;
  v4 = NSStringFromClass([(HMBModelQuery *)self modelClass]);
  id v5 = [(HMBModelIndexedQuery *)self indexNameSuffix];
  v6 = [v3 stringWithFormat:@"qi_%@_%@", v4, v5];

  return (NSString *)v6;
}

- (HMBModelIndexedQuery)initWithSQLPredicate:(id)a3 initialSequence:(id)a4 maximumRowsPerSelect:(unint64_t)a5 indexNameSuffix:(id)a6 indexedColumns:(id)a7 arguments:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HMBModelIndexedQuery;
  uint64_t v16 = [(HMBModelQuery *)&v22 initWithSQLPredicate:a3 initialSequence:a4 maximumRowsPerSelect:a5 arguments:a8];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    indexNameSuffix = v16->_indexNameSuffix;
    v16->_indexNameSuffix = (NSString *)v17;

    uint64_t v19 = [v15 copy];
    indexedColumns = v16->_indexedColumns;
    v16->_indexedColumns = (NSArray *)v19;
  }
  return v16;
}

+ (id)queryWithSQLPredicate:(id)a3 ascending:(BOOL)a4 indexedProperties:(id)a5 arguments:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v10)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  char v12 = v11;
  if (!v11)
  {
LABEL_12:
    uint64_t v19 = (HMBModelFiniteQuery *)_HMFPreconditionFailure();
    return [(HMBModelFiniteQuery *)v19 sqlSelectStatementForModelType:v21];
  }
  unint64_t v13 = +[HMBSQLQueryIterator maximumRowsPerSelect];
  if (v8) {
    id v14 = &unk_1F2C4CA68;
  }
  else {
    id v14 = &unk_1F2C4CA80;
  }
  id v15 = [v10 componentsJoinedByString:@"_"];
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count") + 2);
  [v16 addObject:@"_store_id"];
  [v16 addObjectsFromArray:v10];
  [v16 addObject:@"_record_id"];
  uint64_t v17 = [[HMBModelIndexedQuery alloc] initWithSQLPredicate:v9 initialSequence:v14 maximumRowsPerSelect:v13 indexNameSuffix:v15 indexedColumns:v16 arguments:v12];

  return v17;
}

@end