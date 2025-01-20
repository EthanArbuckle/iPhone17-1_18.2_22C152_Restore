@interface HMBModelCountMatchesQuery
+ (id)queryWithSQLPredicate:(id)a3 indexedProperties:(id)a4 arguments:(id)a5;
- (id)countMatchesOn:(id)a3 arguments:(id)a4 error:(id *)a5;
- (id)sqlSelectStatementForModelType:(id)a3;
@end

@implementation HMBModelCountMatchesQuery

- (id)sqlSelectStatementForModelType:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = [(HMBModelQuery *)self sqlPredicate];
  v7 = [v4 stringWithFormat:@"SELECT count('X') FROM queryable_%@, record_v2 WHERE _store_id = :_store_id AND _record_id == id AND model_data IS NOT NULL AND %@ LIMIT 1", v5, v6];

  return v7;
}

- (id)countMatchesOn:(id)a3 arguments:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMBModelQuery *)self preparedQueries];
  v11 = [v8 sql];
  v12 = [v10 objectForKey:v11];

  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  v13 = __encodeArguments(self, v12, v9);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  v14 = [v12 arguments];
  v15 = objc_msgSend(v14, "hmf_numberForKey:", @"_store_id");

  if (!v15)
  {
LABEL_10:
    id result = (id)_HMFPreconditionFailure();
    __break(1u);
    return result;
  }
  v16 = [v8 sql];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke;
  v24[3] = &unk_1E69EAD08;
  id v17 = v12;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v19 = v15;
  id v27 = v19;
  id v20 = v8;
  id v28 = v20;
  v29 = &v30;
  int v21 = [v16 sqlBlockWithActivity:0 error:a5 block:v24];

  if (v21)
  {
    v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:v31[3]];
  }
  else
  {
    v22 = 0;
  }

  _Block_object_dispose(&v30, 8);
  return v22;
}

id __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 statement];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = [*(id *)(a1 + 48) intValue];
  uint64_t v8 = [*(id *)(a1 + 56) zoneRow];
  id v15 = 0;
  +[HMBLocalZoneQueryResult bindPropertiesToStatement:v5 arguments:v6 zoneBindRowOffset:v7 zoneRow:v8 error:&v15];
  id v9 = v15;
  uint64_t v10 = [*(id *)(a1 + 32) statement];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke_2;
  v13[3] = &unk_1E69EBA18;
  v13[4] = *(void *)(a1 + 64);
  id v14 = v9;
  [v4 fetchSQLite3One:v10 error:&v14 block:v13];

  id v11 = v14;
  return v11;
}

uint64_t __60__HMBModelCountMatchesQuery_countMatchesOn_arguments_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(a2, 0);
  return 0;
}

+ (id)queryWithSQLPredicate:(id)a3 indexedProperties:(id)a4 arguments:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v8)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  uint64_t v10 = v9;
  if (!v9)
  {
LABEL_9:
    id v15 = (HMBMirrorOutputTuple *)_HMFPreconditionFailure();
    [(HMBMirrorOutputTuple *)v15 .cxx_destruct];
    return result;
  }
  id v11 = [v8 componentsJoinedByString:@"_"];
  v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count") + 1);
  [v12 addObject:@"_store_id"];
  [v12 addObjectsFromArray:v8];
  v13 = [(HMBModelIndexedQuery *)[HMBModelCountMatchesQuery alloc] initWithSQLPredicate:v7 initialSequence:0 maximumRowsPerSelect:1 indexNameSuffix:v11 indexedColumns:v12 arguments:v10];

  return v13;
}

@end