@interface HDSQLiteEntity
+ (BOOL)deleteEntitiesInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5;
+ (BOOL)enumerateEntitiesInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)enumerateQueryResultsFromColumns:(id)a3 properties:(id)a4 predicate:(id)a5 groupBy:(id)a6 orderingTerms:(id)a7 limit:(int64_t)a8 database:(id)a9 error:(id *)a10 enumerationHandler:(id)a11;
+ (BOOL)hasROWID;
+ (BOOL)updateProperties:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6 bindingHandler:(id)a7;
+ (id)additionalPredicateForEnumeration;
+ (id)aggregateSingleValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6 error:(id *)a7;
+ (id)aggregateSingleValueForProperty:(id)a3 function:(id)a4 queryDescriptor:(id)a5 database:(id)a6 error:(id *)a7;
+ (id)aggregateValuesForProperty:(id)a3 functions:(id)a4 predicate:(id)a5 groupBy:(id)a6 database:(id)a7 error:(id *)a8;
+ (id)aggregateValuesForProperty:(id)a3 functions:(id)a4 queryDescriptor:(id)a5 database:(id)a6 error:(id *)a7;
+ (id)anyInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5;
+ (id)countDistinctForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)countValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)distinctProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)entityWithPersistentID:(id)a3;
+ (id)firstInDatabase:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 error:(id *)a6;
+ (id)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 properties:(id)a5 error:(id *)a6 bindingHandler:(id)a7;
+ (id)maxPersistentIDWithPredicate:(id)a3 database:(id)a4 error:(id *)a5;
+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (id)primaryKeyColumns;
+ (id)propertyValueForAnyInDatabase:(id)a3 property:(id)a4 predicate:(id)a5 error:(id *)a6;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4;
+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 orderingTerms:(id)a6 groupBy:(id)a7;
+ (id)sumValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6;
+ (int64_t)sizeOfEntityTableInDatabase:(id)a3;
- (BOOL)BOOLeanForProperty:(id)a3 database:(id)a4;
- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4;
- (BOOL)existsInDatabase:(id)a3;
- (BOOL)getValuesForProperties:(id)a3 database:(id)a4 error:(id *)a5 handler:(id)a6;
- (BOOL)getValuesForProperties:(id)a3 database:(id)a4 handler:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateProperties:(id)a3 database:(id)a4 error:(id *)a5 bindingHandler:(id)a6;
- (HDSQLiteEntity)initWithPersistentID:(int64_t)a3;
- (NSString)description;
- (id)UUIDForProperty:(id)a3 database:(id)a4;
- (id)_updateSQLForProperties:(uint64_t)a1;
- (id)dateForProperty:(id)a3 database:(id)a4;
- (id)numberForProperty:(id)a3 database:(id)a4;
- (id)stringForProperty:(id)a3 database:(id)a4;
- (id)valueForProperty:(id)a3 database:(id)a4;
- (int64_t)persistentID;
- (uint64_t)_deleteRowFromTable:(void *)a3 usingColumn:(void *)a4 database:(uint64_t)a5 error:;
- (unint64_t)hash;
@end

@implementation HDSQLiteEntity

uint64_t __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = 1;
  return [*(id *)(a1 + 32) bindToSelectStatement:a2 bindingIndex:&v3];
}

uint64_t __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1 + 32) + 8));
}

uint64_t __75__HDSQLiteEntity_updateProperties_predicate_database_error_bindingHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  HDSQLiteStatementBinder::HDSQLiteStatementBinder((uint64_t)v6, a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  HDSQLiteStatementBinder::assertAllPropertiesBound((HDSQLiteStatementBinder *)v6);
  int v5 = [*(id *)(a1 + 32) count] + 1;
  [*(id *)(a1 + 40) bindToStatement:a2 bindingIndex:&v5];
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v8);
  return std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v7);
}

uint64_t __44__HDSQLiteEntity_valueForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = HDSQLiteRow::columnAsNaturalType(this, 0);

  return MEMORY[0x270F9A758]();
}

- (unint64_t)hash
{
  return self->_persistentID;
}

+ (BOOL)deleteEntitiesInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  v6 = [a1 queryWithDatabase:a3 predicate:a4];
  LOBYTE(a5) = [v6 deleteAllEntitiesWithError:a5];

  return (char)a5;
}

+ (id)anyInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  uint64_t v7 = [a1 queryWithDatabase:a3 predicate:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__HDSQLiteEntity_SQLiteQueryAdditions__anyInDatabase_predicate_error___block_invoke;
  v10[3] = &unk_2643D4FA8;
  v10[4] = &v11;
  v10[5] = a1;
  [v7 enumeratePersistentIDsAndProperties:0 error:a5 enumerationHandler:v10];
  id v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)valueForProperty:(id)a3 database:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v18[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __44__HDSQLiteEntity_valueForProperty_database___block_invoke;
  v11[3] = &unk_2643D4DC8;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (BOOL)getValuesForProperties:(id)a3 database:(id)a4 handler:(id)a5
{
  return [(HDSQLiteEntity *)self getValuesForProperties:a3 database:a4 error:0 handler:a5];
}

+ (id)aggregateValuesForProperty:(id)a3 functions:(id)a4 predicate:(id)a5 groupBy:(id)a6 database:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = objc_alloc_init(HDSQLiteQueryDescriptor);
  [(HDSQLiteQueryDescriptor *)v19 setEntityClass:a1];
  [(HDSQLiteQueryDescriptor *)v19 setPredicate:v16];
  [(HDSQLiteQueryDescriptor *)v19 setGroupBy:v17];
  v20 = [a1 aggregateValuesForProperty:v14 functions:v15 queryDescriptor:v19 database:v18 error:a8];

  return v20;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  v4 = [a1 queryWithDatabase:a3 predicate:a4 limit:0 orderingTerms:0 groupBy:0];

  return v4;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 limit:(unint64_t)a5 orderingTerms:(id)a6 groupBy:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(HDSQLiteQueryDescriptor);
  [(HDSQLiteQueryDescriptor *)v16 setEntityClass:a1];
  [(HDSQLiteQueryDescriptor *)v16 setLimitCount:a5];
  [(HDSQLiteQueryDescriptor *)v16 setOrderingTerms:v14];
  [(HDSQLiteQueryDescriptor *)v16 setPredicate:v13];
  [(HDSQLiteQueryDescriptor *)v16 setGroupBy:v15];
  id v17 = [[HDSQLiteQuery alloc] initWithDatabase:v12 descriptor:v16];

  return v17;
}

+ (id)aggregateValuesForProperty:(id)a3 functions:(id)a4 queryDescriptor:(id)a5 database:(id)a6 error:(id *)a7
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v39 = a4;
  id v13 = a5;
  id v42 = a6;
  v43 = v12;
  v44 = v13;
  uint64_t v14 = [v13 groupBy];
  v45 = (void *)v14;
  id v15 = [a1 disambiguatedSQLForProperty:v12];
  if (v14)
  {
    v40 = [a1 disambiguatedSQLForProperty:v14];
  }
  else
  {
    v40 = 0;
  }
  v38 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = v39;
  uint64_t v17 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v59 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = [NSString stringWithFormat:@"%@(%@)", *(void *)(*((void *)&v58 + 1) + 8 * i), v15];
        [v16 addObject:v20];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v17);
  }

  if (v14)
  {
    [v16 addObject:v40];
    v63[0] = v43;
    v63[1] = v14;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:2];
  }
  else
  {
    v64 = v43;
    [MEMORY[0x263EFF8C0] arrayWithObjects:&v64 count:1];
  v36 = };
  v37 = [v13 _SQLForSelectWithProperties:v36 columns:v16];
  v41 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v37];
  v21 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v35 = [obj count];
  if (v14)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v22 = obj;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v62 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v54 + 1) + 8 * j);
          v27 = [MEMORY[0x263EFF9A0] dictionary];
          [v21 setObject:v27 forKeyedSubscript:v26];
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v62 count:16];
      }
      while (v23);
    }
  }
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke;
  v52[3] = &unk_2643D4B30;
  id v28 = v44;
  id v53 = v28;
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke_2;
  v47[3] = &unk_2643D5020;
  id v29 = v45;
  id v48 = v29;
  uint64_t v51 = v35;
  id v30 = v21;
  id v49 = v30;
  id v31 = obj;
  id v50 = v31;
  if ([v42 executeSQL:v41 error:v38 bindingHandler:v52 enumerationHandler:v47]) {
    v32 = v30;
  }
  else {
    v32 = 0;
  }
  id v33 = v32;

  return v33;
}

+ (id)additionalPredicateForEnumeration
{
  return 0;
}

+ (id)countValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  id v6 = [a1 aggregateSingleValueForProperty:a3 function:@"COUNT" predicate:a4 database:a5 error:a6];

  return v6;
}

+ (id)maxValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  id v6 = [a1 aggregateSingleValueForProperty:a3 function:@"MAX" predicate:a4 database:a5 error:a6];

  return v6;
}

+ (id)aggregateSingleValueForProperty:(id)a3 function:(id)a4 predicate:(id)a5 database:(id)a6 error:(id *)a7
{
  v20[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20[0] = v13;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  uint64_t v17 = [a1 aggregateValuesForProperty:v12 functions:v16 predicate:v14 groupBy:0 database:v15 error:a7];

  uint64_t v18 = [v17 objectForKeyedSubscript:v13];

  return v18;
}

uint64_t __108__HDSQLiteEntity_SQLiteQueryAdditions__aggregateValuesForProperty_functions_queryDescriptor_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 32))
  {
    int v5 = HDSQLiteColumnAsNaturalType(a2, v4);
    if (*(void *)(a1 + 56))
    {
      unint64_t v6 = 0;
      do
      {
        id v7 = HDSQLiteColumnAsNaturalType(a2, v6);
        if (v7)
        {
          id v8 = *(void **)(a1 + 40);
          id v9 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v6];
          v10 = [v8 objectForKeyedSubscript:v9];
          [v10 setObject:v7 forKeyedSubscript:v5];
        }
        ++v6;
      }
      while (v6 < *(void *)(a1 + 56));
    }
  }
  else if (v4)
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = HDSQLiteColumnAsNaturalType(a2, v11);
      if (v12)
      {
        id v13 = *(void **)(a1 + 40);
        id v14 = [*(id *)(a1 + 48) objectAtIndexedSubscript:v11];
        [v13 setObject:v12 forKeyedSubscript:v14];
      }
      ++v11;
    }
    while (v11 < *(void *)(a1 + 56));
  }
  return 1;
}

+ (id)entityWithPersistentID:(id)a3
{
  id v4 = a3;
  if (v4) {
    int v5 = objc_msgSend(objc_alloc((Class)a1), "initWithPersistentID:", objc_msgSend(v4, "longLongValue"));
  }
  else {
    int v5 = 0;
  }

  return v5;
}

+ (id)insertOrReplaceEntity:(BOOL)a3 database:(id)a4 properties:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  BOOL v10 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [a1 insertSQLForProperties:v13 shouldReplace:v10];
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  uint64_t v24 = __81__HDSQLiteEntity_insertOrReplaceEntity_database_properties_error_bindingHandler___block_invoke;
  v25 = &unk_2643D4D00;
  id v16 = v13;
  id v26 = v16;
  id v17 = v14;
  id v27 = v17;
  if ([v12 executeSQL:v15 error:a6 bindingHandler:&v22 enumerationHandler:0])
  {
    id v18 = objc_alloc((Class)a1);
    v19 = objc_msgSend(v12, "lastInsertRowID", v22, v23, v24, v25, v26);
    v20 = objc_msgSend(v18, "initWithPersistentID:", objc_msgSend(v19, "longLongValue"));
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (HDSQLiteEntity)initWithPersistentID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDSQLiteEntity;
  result = [(HDSQLiteEntity *)&v5 init];
  if (result) {
    result->_persistentID = a3;
  }
  return result;
}

- (BOOL)getValuesForProperties:(id)a3 database:(id)a4 error:(id *)a5 handler:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v34 = a4;
  id v33 = a6;
  unint64_t v11 = objc_opt_class();
  uint64_t v35 = objc_msgSend((id)objc_msgSend(v11, "entityClassForEnumeration", v10), "disambiguatedDatabaseTable");
  id v12 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"SELECT "];
  id v31 = self;
  v32 = a5;
  id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v46;
    char v16 = 1;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * i);
        v19 = [v11 disambiguatedSQLForProperty:v18];
        if ((v16 & 1) == 0) {
          [v12 appendString:@", "];
        }
        [v12 appendString:v19];
        v20 = [v11 joinClausesForProperty:v18];
        if ([v20 count]) {
          [v36 unionSet:v20];
        }

        char v16 = 0;
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v50 count:16];
      char v16 = 0;
    }
    while (v14);
  }

  [v12 appendString:@" FROM "];
  [v12 appendString:v35];
  long long v44 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  id v21 = v36;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        [v12 appendString:@" "];
        id v26 = [v25 SQLJoinClause];
        [v12 appendString:v26];
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v22);
  }

  [v12 appendString:@" WHERE "];
  [v12 appendString:v35];
  [v12 appendString:@".ROWID = ?;"];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke;
  v40[3] = &unk_2643D4B30;
  v40[4] = v31;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __64__HDSQLiteEntity_getValuesForProperties_database_error_handler___block_invoke_2;
  v37[3] = &unk_2643D4DA0;
  id v27 = v13;
  id v38 = v27;
  id v28 = v33;
  id v39 = v28;
  char v29 = [v34 executeSQL:v12 error:v32 bindingHandler:v40 enumerationHandler:v37];

  return v29;
}

+ (BOOL)updateProperties:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  char v16 = [a1 updateSQLForProperties:v12 predicate:v13];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __75__HDSQLiteEntity_updateProperties_predicate_database_error_bindingHandler___block_invoke;
  v21[3] = &unk_2643D4D50;
  id v17 = v12;
  id v22 = v17;
  id v18 = v15;
  id v24 = v18;
  id v19 = v13;
  id v23 = v19;
  LOBYTE(a6) = [v14 executeSQL:v16 error:a6 bindingHandler:v21 enumerationHandler:0];

  return (char)a6;
}

+ (BOOL)enumerateEntitiesInDatabase:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  unint64_t v11 = [a1 queryWithDatabase:a3 predicate:a4];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __103__HDSQLiteEntity_SQLiteQueryAdditions__enumerateEntitiesInDatabase_predicate_error_enumerationHandler___block_invoke;
  v14[3] = &unk_2643D4FD0;
  id v16 = a1;
  id v12 = v10;
  id v15 = v12;
  LOBYTE(a5) = [v11 enumeratePersistentIDsAndProperties:0 error:a5 enumerationHandler:v14];

  return (char)a5;
}

uint64_t __81__HDSQLiteEntity_insertOrReplaceEntity_database_properties_error_bindingHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  HDSQLiteStatementBinder::HDSQLiteStatementBinder((uint64_t)v4, a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  HDSQLiteStatementBinder::assertAllPropertiesBound((HDSQLiteStatementBinder *)v4);
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v6);
  return std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v5);
}

uint64_t __103__HDSQLiteEntity_SQLiteQueryAdditions__enumerateEntitiesInDatabase_predicate_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPersistentID:a2];
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v4;
}

uint64_t __70__HDSQLiteEntity_SQLiteQueryAdditions__anyInDatabase_predicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 40)) initWithPersistentID:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HDSQLiteEntity *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4->_persistentID == self->_persistentID;
  }

  return v5;
}

uint64_t __95__HDSQLiteEntity_SQLiteQueryAdditions__propertyValueForAnyInDatabase_property_predicate_error___block_invoke(uint64_t a1, int a2, int a3, HDSQLiteRow *this)
{
  uint64_t v5 = HDSQLiteRow::columnAsNaturalType(this, 0);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  return 0;
}

uint64_t __86__HDSQLiteEntity_SQLiteQueryAdditions__firstInDatabase_predicate_orderingTerms_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [objc_alloc(*(Class *)(a1 + 40)) initWithPersistentID:a2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

uint64_t __43__HDSQLiteEntity_dateForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = HDSQLiteRow::columnAsDate(this, 0);

  return MEMORY[0x270F9A758]();
}

- (id)dateForProperty:(id)a3 database:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v18[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__HDSQLiteEntity_dateForProperty_database___block_invoke;
  v11[3] = &unk_2643D4DC8;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (id)propertyValueForAnyInDatabase:(id)a3 property:(id)a4 predicate:(id)a5 error:(id *)a6
{
  v22[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  unint64_t v11 = [a1 queryWithDatabase:a3 predicate:a5 limit:0 orderingTerms:0 groupBy:0];
  v22[0] = v10;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __95__HDSQLiteEntity_SQLiteQueryAdditions__propertyValueForAnyInDatabase_property_predicate_error___block_invoke;
  v15[3] = &unk_2643D4FF8;
  v15[4] = &v16;
  [v11 enumeratePersistentIDsAndProperties:v12 error:a6 enumerationHandler:v15];

  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

+ (id)firstInDatabase:(id)a3 predicate:(id)a4 orderingTerms:(id)a5 error:(id *)a6
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  id v8 = [a1 queryWithDatabase:a3 predicate:a4 limit:1 orderingTerms:a5 groupBy:0];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__HDSQLiteEntity_SQLiteQueryAdditions__firstInDatabase_predicate_orderingTerms_error___block_invoke;
  v11[3] = &unk_2643D4FA8;
  v11[4] = &v12;
  void v11[5] = a1;
  [v8 enumeratePersistentIDsAndProperties:0 error:a6 enumerationHandler:v11];
  id v9 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v9;
}

+ (BOOL)hasROWID
{
  return 1;
}

+ (id)primaryKeyColumns
{
  return 0;
}

- (id)_updateSQLForProperties:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && [v3 count])
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [v4 objectAtIndexedSubscript:0];
    id v7 = (void *)[v5 entityForProperty:v6];

    id v8 = objc_msgSend(v4, "hk_map:", &__block_literal_global_405);
    id v9 = NSString;
    id v10 = [v7 disambiguatedDatabaseTable];
    unint64_t v11 = [v8 componentsJoinedByString:@", "];
    uint64_t v12 = [v9 stringWithFormat:@"UPDATE %@ SET %@ WHERE %@ = ?", v10, v11, @"ROWID"];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __42__HDSQLiteEntity__updateSQLForProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = [NSString stringWithFormat:@"%@ = ?", a2];

  return v2;
}

+ (int64_t)sizeOfEntityTableInDatabase:(id)a3
{
  id v3 = a3;
  uint64_t v4 = NSString;
  uint64_t v5 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"SELECT SUM(\"pgsize\") FROM \"dbstat\" WHERE name=\"%@\"", v5);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v10[4] = &v12;
  id v11 = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HDSQLiteEntity_sizeOfEntityTableInDatabase___block_invoke;
  v10[3] = &unk_2643D4D28;
  [v3 executeSQL:v6 error:&v11 bindingHandler:0 enumerationHandler:v10];
  id v7 = v11;
  int64_t v8 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v8;
}

uint64_t __46__HDSQLiteEntity_sizeOfEntityTableInDatabase___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64(a2) / 1024;
  return 1;
}

- (BOOL)updateProperties:(id)a3 database:(id)a4 error:(id *)a5 bindingHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = -[HDSQLiteEntity _updateSQLForProperties:]((uint64_t)self, v10);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __65__HDSQLiteEntity_updateProperties_database_error_bindingHandler___block_invoke;
  v17[3] = &unk_2643D4D50;
  id v14 = v10;
  id v18 = v14;
  id v15 = v12;
  id v19 = self;
  id v20 = v15;
  LOBYTE(a5) = [v11 executeSQL:v13 error:a5 bindingHandler:v17 enumerationHandler:0];

  return (char)a5;
}

uint64_t __65__HDSQLiteEntity_updateProperties_database_error_bindingHandler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  HDSQLiteStatementBinder::HDSQLiteStatementBinder((uint64_t)v5, (uint64_t)a2, *(void **)(a1 + 32));
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  HDSQLiteStatementBinder::assertAllPropertiesBound((HDSQLiteStatementBinder *)v5);
  sqlite3_bind_int64(a2, [*(id *)(a1 + 32) count] + 1, objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v7);
  return std::__hash_table<std::__hash_value_type<char const*,int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Hash,HDSQLiteRow::_Comparison,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,int>,HDSQLiteRow::_Comparison,HDSQLiteRow::_Hash,true>,std::allocator<std::__hash_value_type<char const*,int>>>::~__hash_table((uint64_t)&v6);
}

- (BOOL)deleteFromDatabase:(id)a3 error:(id *)a4
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __43__HDSQLiteEntity_deleteFromDatabase_error___block_invoke;
  v5[3] = &unk_2643D4D78;
  v5[4] = self;
  return [a3 performTransactionWithType:1 error:a4 usingBlock:v5];
}

uint64_t __43__HDSQLiteEntity_deleteFromDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v8 = -[HDSQLiteEntity _deleteRowFromTable:usingColumn:database:error:](v6, v7, @"ROWID", v5, a3);

  return v8;
}

- (uint64_t)_deleteRowFromTable:(void *)a3 usingColumn:(void *)a4 database:(uint64_t)a5 error:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if (a1)
  {
    id v12 = (void *)+[HDSQLiteSchemaEntity _copyDeleteSQLWithTableName:columnName:]((uint64_t)HDSQLiteEntity, v9, v10);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __65__HDSQLiteEntity__deleteRowFromTable_usingColumn_database_error___block_invoke;
    v15[3] = &unk_2643D4B30;
    v15[4] = a1;
    uint64_t v13 = [v11 executeSQL:v12 error:a5 bindingHandler:v15 enumerationHandler:0];
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)existsInDatabase:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [NSString alloc];
  uint64_t v6 = [(id)objc_opt_class() disambiguatedDatabaseTable];
  uint64_t v7 = (void *)[v5 initWithFormat:@"SELECT 1 FROM %@ WHERE %@ = ? LIMIT 1;", v6, @"ROWID"];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __35__HDSQLiteEntity_existsInDatabase___block_invoke;
  v10[3] = &unk_2643D4B30;
  v10[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__HDSQLiteEntity_existsInDatabase___block_invoke_2;
  v9[3] = &unk_2643D4D28;
  v9[4] = &v11;
  [v4 executeSQL:v7 error:0 bindingHandler:v10 enumerationHandler:v9];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __35__HDSQLiteEntity_existsInDatabase___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1 + 32) + 8));
}

uint64_t __35__HDSQLiteEntity_existsInDatabase___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (BOOL)BOOLeanForProperty:(id)a3 database:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v15[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__HDSQLiteEntity_BOOLeanForProperty_database___block_invoke;
  v10[3] = &unk_2643D4DC8;
  v10[4] = &v11;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v10];

  LOBYTE(self) = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return (char)self;
}

BOOL __46__HDSQLiteEntity_BOOLeanForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  BOOL result = HDSQLiteRow::columnAsBoolean(this, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)numberForProperty:(id)a3 database:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v18[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__HDSQLiteEntity_numberForProperty_database___block_invoke;
  v11[3] = &unk_2643D4DC8;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __45__HDSQLiteEntity_numberForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4 = HDSQLiteRow::columnAsNumber(this, 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return MEMORY[0x270F9A758](v4, v6);
}

- (id)stringForProperty:(id)a3 database:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v18[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__HDSQLiteEntity_stringForProperty_database___block_invoke;
  v11[3] = &unk_2643D4DC8;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __45__HDSQLiteEntity_stringForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4 = HDSQLiteRow::columnAsString(this, 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return MEMORY[0x270F9A758](v4, v6);
}

- (id)UUIDForProperty:(id)a3 database:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v18[0] = v6;
  uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __43__HDSQLiteEntity_UUIDForProperty_database___block_invoke;
  v11[3] = &unk_2643D4DC8;
  v11[4] = &v12;
  [(HDSQLiteEntity *)self getValuesForProperties:v8 database:v7 handler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

uint64_t __43__HDSQLiteEntity_UUIDForProperty_database___block_invoke(uint64_t a1, int a2, HDSQLiteRow *this)
{
  uint64_t v4 = HDSQLiteRow::columnAsUUID(this, 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return MEMORY[0x270F9A758](v4, v6);
}

uint64_t __65__HDSQLiteEntity__deleteRowFromTable_usingColumn_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1 + 32) + 8));
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteEntity;
  uint64_t v4 = [(HDSQLiteEntity *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"<%@, id:%lld>", v4, -[HDSQLiteEntity persistentID](self, "persistentID")];

  return (NSString *)v5;
}

+ (BOOL)enumerateQueryResultsFromColumns:(id)a3 properties:(id)a4 predicate:(id)a5 groupBy:(id)a6 orderingTerms:(id)a7 limit:(int64_t)a8 database:(id)a9 error:(id *)a10 enumerationHandler:(id)a11
{
  id v16 = a3;
  id v17 = a11;
  id v18 = [a1 queryWithDatabase:a9 predicate:a5 limit:a8 orderingTerms:a7 groupBy:a6];
  LOBYTE(a7) = [v18 enumerateProperties:v16 error:a10 enumerationHandler:v17];

  return (char)a7;
}

+ (id)aggregateSingleValueForProperty:(id)a3 function:(id)a4 queryDescriptor:(id)a5 database:(id)a6 error:(id *)a7
{
  v20[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20[0] = v13;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:1];
  id v17 = [a1 aggregateValuesForProperty:v12 functions:v16 queryDescriptor:v14 database:v15 error:a7];

  id v18 = [v17 objectForKeyedSubscript:v13];

  return v18;
}

+ (id)sumValueForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  uint64_t v6 = [a1 aggregateSingleValueForProperty:a3 function:@"SUM" predicate:a4 database:a5 error:a6];

  return v6;
}

+ (id)maxPersistentIDWithPredicate:(id)a3 database:(id)a4 error:(id *)a5
{
  uint64_t v5 = [a1 aggregateSingleValueForProperty:@"ROWID" function:@"MAX" predicate:a3 database:a4 error:a5];

  return v5;
}

+ (id)countDistinctForProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(HDSQLiteQueryDescriptor);
  [(HDSQLiteQueryDescriptor *)v13 setEntityClass:a1];
  [(HDSQLiteQueryDescriptor *)v13 setPredicate:v11];
  id v14 = objc_alloc(MEMORY[0x263F089D8]);
  id v15 = [a1 disambiguatedSQLForProperty:v10];
  id v16 = (void *)[v14 initWithFormat:@"%@(DISTINCT %@)", @"COUNT", v15];

  v33[0] = v10;
  id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  v32 = v16;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  id v19 = [(HDSQLiteQueryDescriptor *)v13 _SQLForSelectWithProperties:v17 columns:v18];

  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  char v29 = __Block_byref_object_copy__1;
  id v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke;
  v24[3] = &unk_2643D4B30;
  id v20 = v13;
  v25 = v20;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke_2;
  v23[3] = &unk_2643D4D28;
  v23[4] = &v26;
  [v12 executeSQL:v19 error:a6 bindingHandler:v24 enumerationHandler:v23];
  id v21 = (id)v27[5];

  _Block_object_dispose(&v26, 8);

  return v21;
}

void __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = 1;
  id v3 = [*(id *)(a1 + 32) predicate];
  [v3 bindToStatement:a2 bindingIndex:&v4];
}

uint64_t __90__HDSQLiteEntity_SQLiteQueryAdditions__countDistinctForProperty_predicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = HDSQLiteColumnAsNaturalType(a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

+ (id)distinctProperty:(id)a3 predicate:(id)a4 database:(id)a5 error:(id *)a6
{
  v29[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(HDSQLiteQueryDescriptor);
  [(HDSQLiteQueryDescriptor *)v13 setEntityClass:a1];
  [(HDSQLiteQueryDescriptor *)v13 setPredicate:v11];
  [(HDSQLiteQueryDescriptor *)v13 setReturnsDistinctEntities:1];
  id v14 = [a1 disambiguatedSQLForProperty:v10];
  v29[0] = v10;
  id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
  uint64_t v28 = v14;
  id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  id v17 = [(HDSQLiteQueryDescriptor *)v13 _SQLForSelectWithProperties:v15 columns:v16];

  id v18 = [MEMORY[0x263EFF980] array];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke;
  v26[3] = &unk_2643D4B30;
  id v19 = v13;
  id v27 = v19;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke_2;
  v24[3] = &unk_2643D4B08;
  id v25 = v18;
  id v20 = v18;
  if ([v12 executeSQL:v17 error:a6 bindingHandler:v26 enumerationHandler:v24]) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }
  id v22 = v21;

  return v22;
}

void __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4 = 1;
  uint64_t v3 = [*(id *)(a1 + 32) predicate];
  [v3 bindToStatement:a2 bindingIndex:&v4];
}

uint64_t __82__HDSQLiteEntity_SQLiteQueryAdditions__distinctProperty_predicate_database_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = HDSQLiteColumnAsNaturalType(a2, 0);
  [v2 addObject:v3];

  return 1;
}

@end