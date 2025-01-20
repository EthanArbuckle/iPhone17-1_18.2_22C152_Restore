@interface NSSQLiteAdapter
+ (NSSQLiteStatement)generateStatementForCheckingMulticolumnConstraint:(void *)a3 onObjects:(void *)a4 usingSQLCore:;
+ (NSSQLiteStatement)generateStatementForCheckingUniqueProperties:(void *)a3 onObjects:(void *)a4 usingSQLCore:;
- (NSSQLiteAdapter)initWithSQLCore:(id)a3;
- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(__CFString *)a3 inManyToMany:;
- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(void *)a3 inToMany:;
- (NSSQLiteStatement)newComplexPrimaryKeyUpdateStatementForEntity:(uint64_t)a1;
- (NSSQLiteStatement)newCopyAndInsertStatementForManyToMany:(__CFString *)a3 toManyToMany:(uint64_t)a4 intermediateTableName:(int)a5 invertColumns:;
- (NSSQLiteStatement)newCorrelationDeleteStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationInsertStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationMasterReorderStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationMasterReorderStatementPart2ForRelationship:(void *)a1;
- (NSSQLiteStatement)newCorrelationReorderStatementForRelationship:(void *)a1;
- (NSSQLiteStatement)newCreateIndexStatementForColumnWithName:(uint64_t)a1 inTableWithName:(uint64_t)a2;
- (NSSQLiteStatement)newCreatePrimaryKeyTableStatement;
- (NSSQLiteStatement)newCreateTableStatementForEntity:(__CFString *)a1;
- (NSSQLiteStatement)newCreateTableStatementForManyToMany:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newCreateTempTableStatementForEntity:(void *)a3 withAttributesToConstrain:;
- (NSSQLiteStatement)newDropIndexStatementForColumn:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newDropIndexStatementForColumnWithName:(uint64_t)a3 inTableWithName:;
- (NSSQLiteStatement)newDropTableStatementForTableNamed:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newDropTableStatementOrFailForTableNamed:(NSSQLiteStatement *)result;
- (NSSQLiteStatement)newPrimaryKeyInitializeStatementForEntity:(uint64_t)a3 withInitialMaxPK:;
- (NSSQLiteStatement)newRenameTableStatementFrom:(uint64_t)a3 to:;
- (NSSQLiteStatement)newSimplePrimaryKeyUpdateStatementForEntity:(NSSQLiteStatement *)result;
- (__CFString)typeStringForColumn:(__CFString *)result;
- (id)newCreateIndexStatementsForEntity:(char)a3 defaultIndicesOnly:;
- (id)newCreateTriggersForEntity:(void *)a3 existingRtreeTables:;
- (id)newDropIndexStatementsForEntity:(char)a3 defaultIndicesOnly:;
- (id)sqlCore;
- (uint64_t)_generateFragmentsForEntity:(void *)a1 inArray:(void *)a2;
- (uint64_t)_newStatementForFetchRequestContext:(uint64_t)a1 ignoreInheritance:(void *)a2 countOnly:(int)a3 nestingLevel:(int)a4;
- (uint64_t)generateBatchDeleteUpdateHistoryStatementEntity:(uint64_t)a3 andRelationship:(int)a4 useInverse:;
- (uint64_t)generateBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:;
- (uint64_t)generateCorrelationTableTriggerStatementsForRelationship:(uint64_t)a1 existing:(void *)a2 correlationTableTriggers:(const __CFDictionary *)a3 error:(uint64_t *)a4;
- (uint64_t)generateDeleteHistoryTriggerForEntity:(uint64_t)a1 error:(void *)a2;
- (uint64_t)generateDeleteStatementsForRequest:(uint64_t *)a3 error:;
- (uint64_t)generateDropBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:;
- (uint64_t)generateTriggerForEntity:(const __CFDictionary *)a3 alreadyCreated:(const __CFDictionary *)a4 correlations:(const __CFDictionary *)a5 batchHistory:(void *)a6 fragments:(uint64_t *)a7 error:;
- (uint64_t)newConstrainedValuesUpdateStatementWithRow:(void *)a1;
- (uint64_t)newCountStatementWithFetchRequestContext:(uint64_t)a1;
- (uint64_t)newDeleteStatementWithRow:(void *)a1;
- (uint64_t)newInsertStatementWithRow:(void *)a1;
- (uint64_t)newSelectStatementWithFetchRequest:(int)a3 ignoreInheritance:;
- (uint64_t)newSelectStatementWithFetchRequestContext:(int)a3 ignoreInheritance:;
- (uint64_t)newStatementWithEntity:(uint64_t)result;
- (uint64_t)newStatementWithSQLString:(uint64_t)result;
- (uint64_t)newUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:;
- (uint64_t)sqlTypeForExpressionConstantValue:(uint64_t)result;
- (void)_useModel:(uint64_t)a1;
- (void)dealloc;
- (void)generateBatchDeleteUpdateHistoryTriggerForEntity:(void *)a1 andRelationship:(void *)a2 batchHistory:(void *)a3 error:(const __CFDictionary *)a4;
- (void)newGeneratorWithStatement:(void *)result;
@end

@implementation NSSQLiteAdapter

- (uint64_t)sqlTypeForExpressionConstantValue:(uint64_t)result
{
  if (result)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return 4;
    }
    if ([a2 isNSNumber])
    {
      v3 = (char *)[a2 objCType];
      if (!v3) {
        return 2;
      }
      unsigned int v4 = *v3 - 66;
      if (v4 <= 0x31)
      {
        if (((1 << v4) & 0x2008200020083) != 0) {
          return 1;
        }
        if (((1 << v4) & 0x840000008400) != 0) {
          return 2;
        }
        if (((1 << v4) & 0x1400000000) != 0) {
          return 7;
        }
      }
      return 6;
    }
    if ([a2 isNSString]) {
      return 6;
    }
    if ([a2 isNSDate])
    {
      return 8;
    }
    else if ([a2 isNSData])
    {
      return 10;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        return 12;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          return 11;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)newStatementWithEntity:(uint64_t)result
{
  if (result)
  {
    if (!a2) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"entity required" userInfo:0]);
    }
    v3 = [NSSQLiteStatement alloc];
    return (uint64_t)[(NSSQLiteStatement *)v3 initWithEntity:a2];
  }
  return result;
}

- (void)_useModel:(uint64_t)a1
{
  if (a1)
  {
    if (*(void **)(a1 + 16) != a2)
    {
      id v4 = a2;

      *(void *)(a1 + 16) = a2;
    }
  }
}

- (uint64_t)newCountStatementWithFetchRequestContext:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id v4 = (void *)[a2 request];
  if (!v4) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing fetch request" userInfo:0]);
  }
  if (!_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v4 entity])) {
    return 0;
  }

  return -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:](a1, a2, 0, 1);
}

- (uint64_t)newUpdateStatementWithRow:(uint64_t)a3 originalRow:(const __CFBitVector *)a4 withMask:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    v16 = @"empty row";
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  if (!a3)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    v20 = @"objectID";
    v21[0] = [(id)a2 objectID];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v16 = @"missing original";
    v14 = v18;
    uint64_t v15 = v19;
LABEL_16:
    objc_exception_throw((id)[v14 exceptionWithName:v15 reason:v16 userInfo:v17]);
  }
  if (*(unsigned char *)(a2 + 16)) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v9 = -[NSSQLiteAdapter newStatementWithEntity:]((uint64_t)a1, v8);
  v10 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, v9);
  -[_NSSQLGenerator prepareUpdateStatementWithRow:originalRow:withMask:]((uint64_t)v10, a2, a3, a4);
  if (v10)
  {
    v11 = (void *)v10[3];
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    v11 = 0;
    if (v9)
    {
LABEL_9:
      v12 = *(void **)(v9 + 32);
      if (v12 != v11)
      {

        *(void *)(v9 + 32) = [v11 copy];
      }
    }
  }

  return v9;
}

- (void)newGeneratorWithStatement:(void *)result
{
  if (result)
  {
    if (!a2) {
      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"statement required" userInfo:0]);
    }
    uint64_t v3 = (uint64_t)result;
    id v4 = [_NSSQLGenerator alloc];
    return -[_NSSQLGenerator initWithStatement:forAdapter:](v4, a2, v3);
  }
  return result;
}

- (id)sqlCore
{
  return self->_sqlCore;
}

- (NSSQLiteAdapter)initWithSQLCore:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSSQLiteAdapter;
  id v4 = [(NSSQLiteAdapter *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_sqlCore = (NSSQLCore *)a3;
    v4->_model = (NSSQLModel *)(id)[a3 model];
    memset(&v7, 0, sizeof(v7));
    v7.copyDescription = *(CFDictionaryCopyDescriptionCallBack *)(MEMORY[0x1E4F1D530] + 24);
    v5->_cachedDeleteTriggersByEntity = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 4, &v7, MEMORY[0x1E4F1D540]);
    v5->_lock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (uint64_t)_newStatementForFetchRequestContext:(uint64_t)a1 ignoreInheritance:(void *)a2 countOnly:(int)a3 nestingLevel:(int)a4
{
  objc_super v8 = (void *)MEMORY[0x18C127630]();
  uint64_t v9 = (void *)[a2 request];
  v10 = [[NSSQLGenerator alloc] initWithPersistentStore:*(void *)(a1 + 8)];
  if (v10) {
    uint64_t v11 = -[NSSQLGenerator newSQLStatementForRequest:ignoreInheritance:countOnly:nestingLevel:nestIsWhereScoped:requestContext:]((uint64_t)v10, v9, a3, a4, 0, 0, (uint64_t)a2);
  }
  else {
    uint64_t v11 = 0;
  }
  return v11;
}

- (uint64_t)newSelectStatementWithFetchRequestContext:(int)a3 ignoreInheritance:
{
  if (!a1) {
    return 0;
  }
  v6 = (void *)[a2 request];
  if (!v6) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing fetch request" userInfo:0]);
  }
  if (!_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v6 entity])) {
    return 0;
  }

  return -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:](a1, a2, a3, 0);
}

- (uint64_t)newStatementWithSQLString:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = [NSSQLiteStatement alloc];
    return (uint64_t)[(NSSQLiteStatement *)v3 initWithEntity:0 sqlString:a2];
  }
  return result;
}

- (uint64_t)generateDeleteStatementsForRequest:(uint64_t *)a3 error:
{
  v128[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v6 = (void *)[(id)a2 request];
  CFDictionaryKeyCallBacks v7 = (void *)-[NSSQLBatchDeleteRequestContext fetchRequestForObjectsToDelete](a2);
  uint64_t v8 = [v6 resultType];
  uint64_t v9 = v8;
  if (a2)
  {
    if (v8 == 1)
    {
      v10 = *(void **)(a2 + 112);
      if (v10)
      {
        if (![v10 count]) {
          return NSArray_EmptyArray;
        }
        [v7 setPredicate:objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"SELF IN %@", *(void *)(a2 + 112))];
        [v7 setSortDescriptors:0];
        [v7 setFetchOffset:0];
        goto LABEL_7;
      }
      goto LABEL_124;
    }
  }
  else if (v8 == 1)
  {
LABEL_124:
    if (a3)
    {
      v20 = 0;
      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:&unk_1ED7E23C0];
      return (uint64_t)v20;
    }
    return 0;
  }
LABEL_7:
  uint64_t v11 = [v7 entity];
  uint64_t v12 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)v11);
  v13 = (void *)v12;
  if (a3 && !v12)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    v125[0] = @"Reason";
    v125[1] = @"Model Configuration";
    v126[0] = [NSString stringWithFormat:@"NSBatchDeleteRequest could not locate an Entity for entity name '%@'", objc_msgSend((id)v11, "name")];
    uint64_t v15 = [*(id *)(a1 + 8) configurationName];
    v16 = @"Default";
    if (v15) {
      v16 = (__CFString *)v15;
    }
    v126[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v126 forKeys:v125 count:2];
    *a3 = [v14 errorWithDomain:*MEMORY[0x1E4F281F8] code:134060 userInfo:v17];
  }
  v18 = (unsigned char *)-[NSSQLiteAdapter newSelectStatementWithFetchRequest:ignoreInheritance:](a1, v7, 0);
  uint64_t v19 = v18;
  if (!v18) {
    goto LABEL_22;
  }
  if (v18[40])
  {

    return [MEMORY[0x1E4F1CA48] array];
  }
  v21 = (void *)[v18 sqlString];
  uint64_t v23 = [v21 rangeOfString:@"t0.Z_ENT, "];
  if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
    v21 = objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v23, v22, &stru_1ED787880);
  }
  uint64_t v25 = [v21 rangeOfString:@"0, "];
  if (v25 != 0x7FFFFFFFFFFFFFFFLL) {
    v21 = objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v25, v24, &stru_1ED787880);
  }
  if (v21) {
    uint64_t v26 = [NSString stringWithFormat:@"DELETE FROM %@ WHERE Z_PK IN (%@)", objc_msgSend(v13, "tableName", v25), v21];
  }
  else {
LABEL_22:
  }
    uint64_t v26 = [NSString stringWithFormat:@"DELETE FROM %@", objc_msgSend(v13, "tableName")];
  v27 = (NSString *)v26;
  v91 = [[NSSQLiteStatement alloc] initWithEntity:v13];
  if (v91)
  {
    sqlString = v91->_sqlString;
    if (sqlString != v27)
    {

      v91->_sqlString = (NSString *)[(NSString *)v27 copy];
    }
    if (v9 == 2) {
      v91->_trackChangedRowCount = 1;
    }
  }
  if (v19)
  {
    -[NSSQLiteStatement setBindIntarrays:]((uint64_t)v91, (void *)[v19 bindIntarrays]);
    -[NSSQLiteAdapter _useModel:]((uint64_t)v91, (void *)[v19 bindVariables]);
  }
  if (v11)
  {
    if ((*(unsigned char *)(v11 + 120) & 4) != 0)
    {
      v29 = *(const void **)(v11 + 72);
    }
    else
    {
      do
      {
        v29 = (const void *)v11;
        uint64_t v11 = [(id)v11 superentity];
      }
      while (v11);
    }
  }
  else
  {
    v29 = 0;
  }
  os_unfair_lock_lock_with_options();
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), v29);
  id v31 = Value;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
  id v32 = Value;
  if (v32)
  {
    v20 = (void *)[MEMORY[0x1E4F1CA48] array];
    objc_msgSend(v20, "addObject:", objc_msgSend(v32, "firstObject"));
    [v20 addObject:v91];
    objc_msgSend(v20, "addObject:", objc_msgSend(v32, "lastObject"));
  }
  else
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v35 = *(void *)(a1 + 16);
    if (v35) {
      v36 = *(void **)(v35 + 32);
    }
    else {
      v36 = 0;
    }
    CFIndex v37 = [v36 count];
    CFAllocatorRef v38 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDictionaryRef cf = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v37, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v39 = *(void *)(a1 + 16);
    if (v39) {
      v40 = *(void **)(v39 + 32);
    }
    else {
      v40 = 0;
    }
    CFIndex v41 = [v40 count];
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(v38, v41, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v42 = *(void *)(a1 + 8);
    if (v42 && (*(unsigned char *)(v42 + 201) & 4) != 0)
    {
      uint64_t v44 = *(void *)(a1 + 16);
      if (v44) {
        v45 = *(void **)(v44 + 32);
      }
      else {
        v45 = 0;
      }
      CFIndex v46 = [v45 count];
      CFDictionaryRef v43 = CFDictionaryCreateMutable(v38, v46, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    else
    {
      CFDictionaryRef v43 = 0;
    }
    CFDictionaryRef v87 = v43;
    int v88 = -[NSSQLiteAdapter generateTriggerForEntity:alreadyCreated:correlations:batchHistory:fragments:error:](a1, (uint64_t)v29, cf, Mutable, v43, 0, a3);
    if (v88)
    {
      if (!a2 || !*(unsigned char *)(a2 + 83))
      {
        id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([(__CFDictionary *)cf count])
        {
          if (a2) {
            objc_setProperty_nonatomic((id)a2, v48, @"ZQ_BATCH_DELETE_MARSHALLING", 88);
          }
          id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          v116[0] = MEMORY[0x1E4F143A8];
          v116[1] = 3221225472;
          v116[2] = __82__NSSQLiteAdapter__generateExternalDataRefStatementsForEntities_inRequestContext___block_invoke;
          v116[3] = &unk_1E544DE70;
          v116[4] = a1;
          v116[5] = @"ZQ_BATCH_DELETE_MARSHALLING";
          v116[6] = v49;
          v116[7] = v50;
          [(__CFDictionary *)cf enumerateKeysAndObjectsUsingBlock:v116];
          if ([v49 count])
          {
            v51 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"CREATE TEMP TABLE ZQ_BATCH_DELETE_MARSHALLING(refToDelete)"];
            [v49 insertObject:v51 atIndex:0];

            [v47 addObject:v49];
            [v47 addObject:v50];
            v52 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"SELECT refToDelete FROM ZQ_BATCH_DELETE_MARSHALLING"];
            v128[0] = v52;
            objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v128, 1));

            v53 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:@"DROP TABLE ZQ_BATCH_DELETE_MARSHALLING"];
            v127 = v53;
            objc_msgSend(v47, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v127, 1));
          }
        }
        if (a2) {
          objc_setProperty_nonatomic((id)a2, v48, v47, 128);
        }
      }
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      v54 = (void *)[(__CFDictionary *)cf allValues];
      uint64_t v55 = [v54 countByEnumeratingWithState:&v112 objects:v124 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v113;
        do
        {
          for (uint64_t i = 0; i != v55; ++i)
          {
            if (*(void *)v113 != v56) {
              objc_enumerationMutation(v54);
            }
            v58 = *(void **)(*((void *)&v112 + 1) + 8 * i);
            if ((void *)[MEMORY[0x1E4F1CA98] null] != v58) {
              objc_msgSend(v33, "addObject:", objc_msgSend(v58, "firstObject"));
            }
          }
          uint64_t v55 = [v54 countByEnumeratingWithState:&v112 objects:v124 count:16];
        }
        while (v55);
      }
      long long v110 = 0u;
      long long v111 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      v59 = (void *)[(__CFDictionary *)Mutable allValues];
      uint64_t v60 = [v59 countByEnumeratingWithState:&v108 objects:v123 count:16];
      if (v60)
      {
        uint64_t v61 = *(void *)v109;
        do
        {
          for (uint64_t j = 0; j != v60; ++j)
          {
            if (*(void *)v109 != v61) {
              objc_enumerationMutation(v59);
            }
            v63 = *(void **)(*((void *)&v108 + 1) + 8 * j);
            if ((void *)[MEMORY[0x1E4F1CA98] null] != v63) {
              objc_msgSend(v33, "addObject:", objc_msgSend(v63, "firstObject"));
            }
          }
          uint64_t v60 = [v59 countByEnumeratingWithState:&v108 objects:v123 count:16];
        }
        while (v60);
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v64 = (void *)[(__CFDictionary *)v87 allValues];
      uint64_t v65 = [v64 countByEnumeratingWithState:&v104 objects:v122 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v105;
        do
        {
          for (uint64_t k = 0; k != v65; ++k)
          {
            if (*(void *)v105 != v66) {
              objc_enumerationMutation(v64);
            }
            v68 = *(void **)(*((void *)&v104 + 1) + 8 * k);
            if ((void *)[MEMORY[0x1E4F1CA98] null] != v68) {
              objc_msgSend(v33, "addObject:", objc_msgSend(v68, "firstObject"));
            }
          }
          uint64_t v65 = [v64 countByEnumeratingWithState:&v104 objects:v122 count:16];
        }
        while (v65);
      }
      [0 addObject:v91];
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      v69 = (void *)[(__CFDictionary *)cf allValues];
      uint64_t v70 = [v69 countByEnumeratingWithState:&v100 objects:v121 count:16];
      if (v70)
      {
        uint64_t v71 = *(void *)v101;
        do
        {
          for (uint64_t m = 0; m != v70; ++m)
          {
            if (*(void *)v101 != v71) {
              objc_enumerationMutation(v69);
            }
            v73 = *(void **)(*((void *)&v100 + 1) + 8 * m);
            if ((void *)[MEMORY[0x1E4F1CA98] null] != v73) {
              objc_msgSend(v34, "addObject:", objc_msgSend(v73, "lastObject"));
            }
          }
          uint64_t v70 = [v69 countByEnumeratingWithState:&v100 objects:v121 count:16];
        }
        while (v70);
      }
      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      v74 = (void *)[(__CFDictionary *)Mutable allValues];
      uint64_t v75 = [v74 countByEnumeratingWithState:&v96 objects:v120 count:16];
      if (v75)
      {
        uint64_t v76 = *(void *)v97;
        do
        {
          for (uint64_t n = 0; n != v75; ++n)
          {
            if (*(void *)v97 != v76) {
              objc_enumerationMutation(v74);
            }
            v78 = *(void **)(*((void *)&v96 + 1) + 8 * n);
            if ((void *)[MEMORY[0x1E4F1CA98] null] != v78) {
              objc_msgSend(v34, "addObject:", objc_msgSend(v78, "lastObject"));
            }
          }
          uint64_t v75 = [v74 countByEnumeratingWithState:&v96 objects:v120 count:16];
        }
        while (v75);
      }
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      v79 = (void *)[(__CFDictionary *)v87 allValues];
      uint64_t v80 = [v79 countByEnumeratingWithState:&v92 objects:v119 count:16];
      if (v80)
      {
        uint64_t v81 = *(void *)v93;
        do
        {
          for (iuint64_t i = 0; ii != v80; ++ii)
          {
            if (*(void *)v93 != v81) {
              objc_enumerationMutation(v79);
            }
            v83 = *(void **)(*((void *)&v92 + 1) + 8 * ii);
            if ((void *)[MEMORY[0x1E4F1CA98] null] != v83) {
              objc_msgSend(v34, "addObject:", objc_msgSend(v83, "lastObject"));
            }
          }
          uint64_t v80 = [v79 countByEnumeratingWithState:&v92 objects:v119 count:16];
        }
        while (v80);
      }
    }
    if (cf) {
      CFRelease(cf);
    }
    if (Mutable) {
      CFRelease(Mutable);
    }
    if (v87) {
      CFRelease(v87);
    }
    v84 = (void *)[MEMORY[0x1E4F1CA48] array];
    v20 = v84;
    if (v88)
    {
      [v84 addObject:v33];
      v118 = v91;
      objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v118, 1));
      [v20 addObject:v34];
      v117[0] = v33;
      v117[1] = v34;
      v85 = (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:2];
      os_unfair_lock_lock_with_options();
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 24), v85, v29);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    }
  }
  return (uint64_t)v20;
}

- (uint64_t)newSelectStatementWithFetchRequest:(int)a3 ignoreInheritance:
{
  if (!a1) {
    return 0;
  }
  uint64_t v6 = MEMORY[0x18C127630]();
  if (!a2) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"missing fetch request" userInfo:0]);
  }
  CFDictionaryKeyCallBacks v7 = (void *)v6;
  if (_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[a2 entity]))
  {
    uint64_t v8 = [[NSSQLFetchRequestContext alloc] initWithRequest:a2 context:0 sqlCore:0];
    uint64_t v9 = -[NSSQLiteAdapter _newStatementForFetchRequestContext:ignoreInheritance:countOnly:nestingLevel:](a1, v8, a3, 0);
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

- (NSSQLiteStatement)newDropTableStatementForTableNamed:(NSSQLiteStatement *)result
{
  if (result)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"DROP TABLE IF EXISTS "];
    [v3 appendString:a2];
    id v4 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v3];

    return v4;
  }
  return result;
}

- (uint64_t)newInsertStatementWithRow:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v5 = -[NSSQLiteAdapter newStatementWithEntity:]((uint64_t)a1, v4);
  uint64_t v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, v5);
  CFDictionaryKeyCallBacks v7 = v6;
  if (v6)
  {
    -[_NSSQLGenerator prepareInsertStatementWithRow:includeConstraints:includeOnConflict:onConflictKeys:]((uint64_t)v6, a2, 0, 0, (void *)NSArray_EmptyArray);
    uint64_t v8 = (void *)v7[3];
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v5)
    {
LABEL_8:
      uint64_t v9 = *(void **)(v5 + 32);
      if (v9 != v8)
      {

        *(void *)(v5 + 32) = [v8 copy];
      }
    }
  }

  return v5;
}

uint64_t __88__NSSQLiteAdapter_generateTriggerStatementsForEntity_usingRelationshipCleanupSQL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 firstObject];
  uint64_t v5 = [a3 firstObject];

  return [v4 compare:v5];
}

- (NSSQLiteStatement)newCreateTempTableStatementForEntity:(void *)a3 withAttributesToConstrain:
{
  uint64_t v3 = 0;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    if (*(void *)(a2 + 160))
    {
      return 0;
    }
    else
    {
      CFDictionaryKeyCallBacks v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CREATE TEMP TABLE "];
      [v7 appendString:-[NSSQLEntity tempTableName](a2)];
      id v34 = v7;
      objc_msgSend(v7, "appendString:", @"(");
      uint64_t v8 = a2;
      uint64_t v32 = a2;
      while (v8)
      {
        uint64_t v9 = v8;
        uint64_t v8 = *(void *)(v8 + 168);
        if (v8 == v9)
        {
          v10 = a3;
          uint64_t v11 = *(void **)(v9 + 72);
          goto LABEL_9;
        }
      }
      v10 = a3;
      uint64_t v11 = 0;
LABEL_9:
      uint64_t v12 = (void *)[v11 sortedArrayUsingFunction:sortColumnsByType context:0 hint:0];
      uint64_t v13 = [v12 count];
      if (v13)
      {
        uint64_t v14 = v13;
        for (uint64_t i = 0; i != v14; ++i)
        {
          v16 = (_WORD *)[v12 objectAtIndex:i];
          if (i) {
            [v34 appendString:@", "];
          }
          if ([v16 propertyType] != 1
            || !v16
            || (uint64_t v17 = @"%@ %@ UNIQUE", (v16[16] & 2) == 0))
          {
            uint64_t v17 = @"%@ %@";
          }
          objc_msgSend(v34, "appendFormat:", v17, objc_msgSend(v16, "columnName"), -[NSSQLiteAdapter typeStringForColumn:](a1, v16));
        }
      }
      if (!v10) {
        v10 = *(void **)(v32 + 216);
      }
      if ([v10 count])
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v18 = [v10 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          obuint64_t j = v10;
          uint64_t v33 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v40 != v33) {
                objc_enumerationMutation(obj);
              }
              v21 = *(void **)(*((void *)&v39 + 1) + 8 * j);
              uint64_t v22 = objc_msgSend((id)objc_msgSend(v21, "valueForKey:", @"columnName"), "componentsJoinedByString:", @"_");
              uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @", CONSTRAINT %@ UNIQUE ("), v22;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              uint64_t v24 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v36;
                char v27 = 1;
                do
                {
                  for (uint64_t k = 0; k != v25; ++k)
                  {
                    if (*(void *)v36 != v26) {
                      objc_enumerationMutation(v21);
                    }
                    v29 = *(void **)(*((void *)&v35 + 1) + 8 * k);
                    if ((v27 & 1) == 0) {
                      [v23 appendString:@", "];
                    }
                    objc_msgSend(v23, "appendString:", objc_msgSend(v29, "columnName"));
                    char v27 = 0;
                  }
                  uint64_t v25 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
                  char v27 = 0;
                }
                while (v25);
              }
              [v23 appendString:@""]);
              [v34 appendString:v23];
            }
            uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
          }
          while (v19);
        }
      }
      else
      {
        [v34 appendString:@" "];
      }
      [v34 appendString:@" "]);
      uint64_t v3 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v34];
    }
  }
  return v3;
}

- (__CFString)typeStringForColumn:(__CFString *)result
{
  if (result)
  {
    int v3 = [a2 sqlType];
    if ((v3 & 0xFE) == 2)
    {
      result = @"INTEGER";
      if (a2)
      {
        if (a2[24] == 2) {
          return @"INTEGER PRIMARY KEY";
        }
      }
    }
    else
    {
      return NSSQLiteAdapter_typeStringForSQLType(v3);
    }
  }
  return result;
}

- (void)dealloc
{
  cachedDeleteTriggersByEntity = self->_cachedDeleteTriggersByEntity;
  if (cachedDeleteTriggersByEntity)
  {
    CFRelease(cachedDeleteTriggersByEntity);
    self->_cachedDeleteTriggersByEntity = 0;
  }
  self->_sqlCore = 0;

  self->_model = 0;
  v4.receiver = self;
  v4.super_class = (Class)NSSQLiteAdapter;
  [(NSSQLiteAdapter *)&v4 dealloc];
}

uint64_t __82__NSSQLiteAdapter__generateExternalDataRefStatementsForEntities_inRequestContext___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)a2;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t result = -[NSEntityDescription _hasAttributesWithExternalDataReferences](a2);
  if (result)
  {
    uint64_t v4 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(*(void *)(a1 + 32) + 8), v2);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t result = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (result)
    {
      uint64_t v5 = result;
      unint64_t v6 = 0x1E4F29000uLL;
      uint64_t v7 = *(void *)v22;
      uint64_t v18 = *(void *)v22;
      uint64_t v19 = v2;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v8);
          if ([v9 _propertyType] == 2 && objc_msgSend(v9, "storesBinaryDataExternally"))
          {
            uint64_t v10 = [v9 name];
            if (v4) {
              uint64_t v11 = (void *)[*(id *)(v4 + 40) objectForKey:v10];
            }
            else {
              uint64_t v11 = 0;
            }
            uint64_t v12 = objc_msgSend((id)objc_msgSend((id)v4, "rootEntity"), "tableName");
            if (v4 && !*(void *)(v4 + 160)) {
              uint64_t v13 = &stru_1ED787880;
            }
            else {
              uint64_t v13 = (__CFString *)[*(id *)(v6 + 24) stringWithFormat:@"_%@", objc_msgSend((id)v4, "name")];
            }
            unint64_t v14 = v6;
            uint64_t v15 = [v11 columnName];
            v16 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v4, objc_msgSend(*(id *)(v6 + 24), "stringWithFormat:", @"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_EDR_%@_%@%@ BEFORE DELETE ON %@ FOR EACH ROW WHEN OLD.%@ IS NOT NULL BEGIN INSERT INTO %@ VALUES (OLD.%@); END",
                      v12,
                      v15,
                      v13,
                      v12,
                      v15,
                      *(void *)(a1 + 40),
                      v15));
            [*(id *)(a1 + 48) addObject:v16];

            uint64_t v17 = -[NSSQLiteStatement initWithEntity:sqlString:]([NSSQLiteStatement alloc], "initWithEntity:sqlString:", v4, [*(id *)(v14 + 24) stringWithFormat:@"DROP TRIGGER IF EXISTS ZQ_EDR_%@_%@%@", v12, v15, v13]);
            [*(id *)(a1 + 56) addObject:v17];

            unint64_t v6 = v14;
            uint64_t v7 = v18;
            v2 = v19;
          }
          ++v8;
        }
        while (v5 != v8);
        uint64_t result = [v2 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)newDeleteStatementWithRow:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2 || (*(unsigned char *)(a2 + 16) & 1) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v5 = -[NSSQLiteAdapter newStatementWithEntity:]((uint64_t)a1, v4);
  unint64_t v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, v5);
  -[_NSSQLGenerator prepareDeleteStatementWithRow:]((uint64_t)v6, a2);
  if (v6)
  {
    uint64_t v7 = (void *)v6[3];
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (v5)
    {
LABEL_8:
      uint64_t v8 = *(void **)(v5 + 32);
      if (v8 != v7)
      {

        *(void *)(v5 + 32) = [v7 copy];
      }
    }
  }

  return v5;
}

- (uint64_t)generateTriggerForEntity:(const __CFDictionary *)a3 alreadyCreated:(const __CFDictionary *)a4 correlations:(const __CFDictionary *)a5 batchHistory:(void *)a6 fragments:(uint64_t *)a7 error:
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    if ((*(unsigned char *)(a2 + 120) & 4) != 0)
    {
      unint64_t v14 = *(void **)(a2 + 72);
    }
    else
    {
      uint64_t v13 = (void *)a2;
      do
      {
        unint64_t v14 = v13;
        uint64_t v13 = (void *)[v13 superentity];
      }
      while (v13);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if (CFDictionaryGetValue(a3, (const void *)a2)) {
    return 1;
  }
  CFDictionarySetValue(a3, (const void *)a2, (const void *)[MEMORY[0x1E4F1CA98] null]);
  v122 = a6;
  if (a6) {
    id v16 = a6;
  }
  else {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v124 = v16;
  v133 = objc_msgSend((id)objc_msgSend((id)a2, "superentity"), "relationshipsByName");
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  v123 = (void *)a2;
  uint64_t v17 = objc_msgSend((id)objc_msgSend((id)a2, "relationshipsByName"), "allValues");
  uint64_t v18 = [v17 countByEnumeratingWithState:&v139 objects:v144 count:16];
  CFDictionaryRef v126 = a5;
  CFDictionaryRef theDict = a3;
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v134 = *(void *)v140;
    uint64_t v131 = a1;
    v127 = a7;
    v129 = v17;
    do
    {
      uint64_t v20 = 0;
      uint64_t v125 = v19;
      do
      {
        if (*(void *)v140 != v134) {
          objc_enumerationMutation(v17);
        }
        long long v21 = *(void **)(*((void *)&v139 + 1) + 8 * v20);
        if (([v21 isTransient] & 1) == 0
          && !objc_msgSend(v133, "objectForKey:", objc_msgSend(v21, "name")))
        {
          long long v22 = (void *)[v21 entity];
          long long v23 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), v22);
          if (!v23
            || ((long long v24 = v23,
                 uint64_t v25 = [v23 model],
                 uint64_t v26 = [*(id *)(a1 + 8) model],
                 uint64_t v27 = [v22 managedObjectModel],
                 uint64_t v28 = [*(id *)(a1 + 8) configurationName],
                 !v27)
             || (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v27 + 24) + 24), "objectForKey:", v28), "containsObject:", objc_msgSend(v22, "name")) & 1) == 0)&& v25 == v26)
          {
            long long v93 = v127;
            if (v127)
            {
              long long v94 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v95 = *MEMORY[0x1E4F281F8];
              *(void *)&long long v151 = @"Reason";
              v150[0] = [NSString stringWithFormat:@"Entity named:%@ not found for relationship named:%@", objc_msgSend(v22, "name"), objc_msgSend(v21, "name")];
              *((void *)&v151 + 1) = @"MissingEntity";
              v150[1] = [NSString stringWithFormat:@"%@.%@", objc_msgSend(v22, "name"), v22];
              *(void *)&long long v152 = @"Relationship";
              v150[2] = [NSString stringWithFormat:@"Name: %@ Destination Entity:%@", objc_msgSend(v21, "name"), objc_msgSend((id)objc_msgSend(v21, "destinationEntity"), "name")];
              long long v96 = (void *)MEMORY[0x1E4F1C9E8];
              long long v97 = v150;
              long long v98 = &v151;
              goto LABEL_134;
            }
LABEL_136:
            uint64_t v15 = 0;
LABEL_137:
            v74 = v124;
            goto LABEL_138;
          }
          uint64_t v29 = objc_msgSend(v24[5], "objectForKey:", objc_msgSend(v21, "name"));
          uint64_t v30 = [v21 destinationEntity];
          v130 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)v30);
          if (!v130
            || ((uint64_t v31 = [v130 model],
                 uint64_t v32 = [*(id *)(v131 + 8) model],
                 uint64_t v33 = [(id)v30 managedObjectModel],
                 uint64_t v34 = [*(id *)(v131 + 8) configurationName],
                 !v33)
             || (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(v33 + 24) + 24), "objectForKey:", v34), "containsObject:", objc_msgSend((id)v30, "name")) & 1) == 0)&& v31 == v32)
          {
            long long v93 = v127;
            if (!v127) {
              goto LABEL_136;
            }
            long long v94 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v95 = *MEMORY[0x1E4F281F8];
            v148[0] = @"Reason";
            v149[0] = [NSString stringWithFormat:@"Entity named:%@ not found for relationship named:%@", objc_msgSend((id)v30, "name"), objc_msgSend(v21, "name")];
            v148[1] = @"MissingEntity";
            v149[1] = [NSString stringWithFormat:@"%@.%@", objc_msgSend((id)v30, "name"), v30];
            v148[2] = @"Relationship";
            v149[2] = [NSString stringWithFormat:@"Name: %@ Destination Entity:%@", objc_msgSend(v21, "name"), objc_msgSend((id)objc_msgSend(v21, "entity"), "name")];
            long long v96 = (void *)MEMORY[0x1E4F1C9E8];
            long long v97 = v149;
            long long v98 = (long long *)v148;
LABEL_134:
            uint64_t v99 = [v96 dictionaryWithObjects:v97 forKeys:v98 count:3];
            long long v100 = v94;
            uint64_t v101 = v95;
LABEL_135:
            *long long v93 = [v100 errorWithDomain:v101 code:134060 userInfo:v99];
            goto LABEL_136;
          }
          long long v35 = (void *)[v21 inverseRelationship];
          if (v29) {
            uint64_t v36 = *(void *)(v29 + 56);
          }
          else {
            uint64_t v36 = 0;
          }
          uint64_t v17 = v129;
          if (v35) {
            int v37 = [v35 isOptional] ^ 1;
          }
          else {
            int v37 = 0;
          }
          uint64_t v38 = [v21 deleteRule];
          uint64_t v39 = v38;
          if (v38 == 2)
          {
            if (v29 && *(unsigned char *)(v29 + 24) == 7)
            {
              uint64_t v40 = [[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE Z_PK = OLD.%@", objc_msgSend(v130, "tableName"), objc_msgSend((id)v29, "columnName"), 0];
              goto LABEL_50;
            }
            if (v36 && *(unsigned char *)(v36 + 24) == 7)
            {
              id v42 = [NSString alloc];
              uint64_t v43 = [v130 tableName];
              uint64_t v113 = [(id)v36 columnName];
              uint64_t v112 = v43;
              uint64_t v44 = v42;
LABEL_49:
              uint64_t v40 = [v44 initWithFormat:@"DELETE FROM %@ WHERE %@ = OLD.Z_PK", v112, v113, 0];
LABEL_50:
              id v47 = (void *)v40;
              if (v30) {
                goto LABEL_51;
              }
LABEL_70:
              id v50 = 0;
LABEL_56:
              uint64_t v49 = v131;
            }
            else
            {
              if (v29 && *(unsigned char *)(v29 + 24) == 9)
              {
                if (!-[NSSQLiteAdapter generateCorrelationTableTriggerStatementsForRelationship:existing:correlationTableTriggers:error:](v131, v21, a4, v127))goto LABEL_136; {
                id v45 = [NSString alloc];
                }
                uint64_t v46 = [(id)v29 correlationTableName];
                uint64_t v113 = [(id)v29 columnName];
                uint64_t v112 = v46;
                uint64_t v44 = v45;
                goto LABEL_49;
              }
              id v47 = 0;
              if (!v30) {
                goto LABEL_70;
              }
LABEL_51:
              if ((*(unsigned char *)(v30 + 120) & 4) != 0)
              {
                id v50 = *(const void **)(v30 + 72);
                goto LABEL_56;
              }
              v48 = (void *)v30;
              uint64_t v49 = v131;
              do
              {
                id v50 = v48;
                v48 = (void *)[v48 superentity];
              }
              while (v48);
            }
            if (!CFDictionaryContainsKey(theDict, v50)
              && (-[NSSQLiteAdapter generateTriggerForEntity:alreadyCreated:correlations:batchHistory:fragments:error:](v49, v30, theDict, a4, v126, 0, v127) & 1) == 0)
            {

              goto LABEL_136;
            }
LABEL_59:
            uint64_t v17 = v129;
LABEL_60:
            if (v47)
            {
              v51 = &unk_1ED7E2AB8;
              if (v39 == 2) {
                v51 = &unk_1ED7E2AA0;
              }
              v145[0] = v51;
              v145[1] = v47;
              uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v145 count:2];

              a5 = v126;
              a3 = theDict;
              if (!v15) {
                goto LABEL_137;
              }
              goto LABEL_88;
            }
LABEL_87:
            uint64_t v15 = (uint64_t)&unk_1ED7E98E0;
            a5 = v126;
            a3 = theDict;
LABEL_88:
            a1 = v131;
            a7 = v127;
            uint64_t v19 = v125;
            if ((unint64_t)[(id)v15 count] >= 2) {
              [v124 addObject:v15];
            }
            goto LABEL_90;
          }
          if (!v38) {
            goto LABEL_87;
          }
          if (v38 != 1)
          {
            long long v93 = v127;
            if (!v127) {
              goto LABEL_136;
            }
            long long v103 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v104 = *MEMORY[0x1E4F281F8];
            v147[0] = @"Delete rule is not supported for batch deletes";
            v146[0] = @"Reason";
            v146[1] = @"Relationship";
            v147[1] = [NSString stringWithFormat:@"%@.%@", objc_msgSend((id)objc_msgSend(v21, "entity"), "name"), objc_msgSend(v21, "name")];
            uint64_t v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v147 forKeys:v146 count:2];
            long long v100 = v103;
            uint64_t v101 = v104;
            goto LABEL_135;
          }
          if (v29 && *(unsigned char *)(v29 + 24) == 7)
          {
            if (v37)
            {
              uint64_t v17 = v129;
              uint64_t v41 = [[NSString alloc] initWithFormat:@"SELECT RAISE(FAIL, 'Batch delete failed due to mandatory OTO nullify inverse on %@/%@') FROM %@ WHERE Z_PK = OLD.%@", objc_msgSend(v22, "name"), objc_msgSend(v21, "name"), objc_msgSend(v130, "tableName"), objc_msgSend((id)v29, "columnName"), 0];
LABEL_82:
              id v47 = (void *)v41;
              goto LABEL_60;
            }
            if (!v36 || *(unsigned char *)(v36 + 24) != 7)
            {
              if ([(id)v36 isToMany])
              {
                id v47 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@", objc_msgSend(v130, "tableName"), objc_msgSend((id)v29, "columnName"), 0];
                v62 = *(unsigned char **)(v131 + 8);
                if (v62 && (v62[201] & 4) != 0)
                {
                  v63 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:](v62, v130, v29, 0);
                  uint64_t v64 = [[NSString alloc] initWithFormat:@"%@; %@", v63, v47];

                  id v47 = (void *)v64;
                }
                goto LABEL_60;
              }
              goto LABEL_87;
            }
            uint64_t v56 = *(void *)(v36 + 72);
            id v57 = [NSString alloc];
            uint64_t v58 = [v130 tableName];
            uint64_t v59 = [(id)v36 columnName];
            if (v56)
            {
              uint64_t v60 = [*(id *)(v36 + 72) columnName];
              uint64_t v114 = [(id)v36 columnName];
              uint64_t v115 = 0;
              uint64_t v61 = [v57 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = NULL, %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK", v58, v59, v60];
            }
            else
            {
              uint64_t v114 = 0;
              uint64_t v61 = [v57 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK", v58, v59, objc_msgSend((id)v36, "columnName")];
            }
          }
          else
          {
            if (!v36 || *(unsigned char *)(v36 + 24) != 7)
            {
              if (v29 && *(unsigned char *)(v29 + 24) == 9)
              {
                if (!-[NSSQLiteAdapter generateCorrelationTableTriggerStatementsForRelationship:existing:correlationTableTriggers:error:](v131, v21, a4, v127))goto LABEL_136; {
                if (v37)
                }
                {
                  uint64_t v52 = [(id)v29 correlationTableName];
                  uint64_t v53 = [(id)v29 columnName];
                  uint64_t v54 = [(id)v36 columnName];
                  uint64_t v55 = [[NSString alloc] initWithFormat:@"WITH ZCTE_INTERMEDIATE AS (SELECT %@, %@ FROM %@ WHERE %@ = OLD.Z_PK) SELECT RAISE(FAIL, 'Batch delete failed due to mandatory MTM nullify inverse on %@/%@') FROM ZCTE_INTERMEDIATE T0 WHERE (0 == (SELECT COUNT(*) FROM %@ T1 where T1.%@ = T0.%@ and T1.%@ != OLD.Z_PK))", v53, v54, v52, v53, objc_msgSend(v22, "name"), objc_msgSend(v21, "name"), v52, v54, v54, v53, 0];
                }
                else
                {
                  uint64_t v55 = [[NSString alloc] initWithFormat:@"DELETE FROM %@ WHERE %@ = OLD.Z_PK", objc_msgSend((id)v29, "correlationTableName"), objc_msgSend((id)v29, "columnName"), 0, v114, v115, v116, v117, v118, v119, v120, v121];
                }
                id v47 = (void *)v55;
                goto LABEL_59;
              }
              goto LABEL_87;
            }
            if (v37)
            {
              uint64_t v17 = v129;
              uint64_t v41 = [[NSString alloc] initWithFormat:@"SELECT RAISE(FAIL, 'Batch delete failed due to manadatory OTM nullify inverse on %@/%@') FROM %@ WHERE %@ = OLD.Z_PK", objc_msgSend(v22, "name"), objc_msgSend(v21, "name"), objc_msgSend(v130, "tableName"), objc_msgSend((id)v36, "columnName"), 0];
              goto LABEL_82;
            }
            if ([v21 isOrdered])
            {
              uint64_t v17 = v129;
              uint64_t v41 = [[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ SET %@ = NULL, %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK", objc_msgSend(v130, "tableName"), objc_msgSend((id)v36, "columnName"), objc_msgSend(*(id *)(v36 + 80), "columnName"), objc_msgSend((id)v36, "columnName"), 0];
              goto LABEL_82;
            }
            uint64_t v65 = *(void *)(v36 + 72);
            id v66 = [NSString alloc];
            uint64_t v67 = [v130 tableName];
            uint64_t v68 = [(id)v36 columnName];
            if (v65)
            {
              uint64_t v69 = [*(id *)(v36 + 72) columnName];
              uint64_t v114 = [(id)v36 columnName];
              uint64_t v115 = 0;
              uint64_t v61 = [v66 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = NULL, %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK", v67, v68, v69];
            }
            else
            {
              uint64_t v114 = 0;
              uint64_t v61 = [v66 initWithFormat:@"UPDATE OR FAIL %@ SET %@ = NULL, Z_OPT = (Z_OPT + 1) WHERE %@ = OLD.Z_PK", v67, v68, objc_msgSend((id)v36, "columnName")];
            }
          }
          id v47 = (void *)v61;
          uint64_t v70 = *(unsigned char **)(v131 + 8);
          if (v70 && (v70[201] & 4) != 0) {
            -[NSSQLiteAdapter generateBatchDeleteUpdateHistoryTriggerForEntity:andRelationship:batchHistory:error:](v70, v130, (void *)v36, v126);
          }
          goto LABEL_60;
        }
LABEL_90:
        ++v20;
      }
      while (v20 != v19);
      uint64_t v71 = [v17 countByEnumeratingWithState:&v139 objects:v144 count:16];
      uint64_t v19 = v71;
    }
    while (v71);
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  v72 = (void *)[v123 subentities];
  uint64_t v73 = [v72 countByEnumeratingWithState:&v135 objects:v143 count:16];
  v74 = v124;
  if (v73)
  {
    uint64_t v75 = v73;
    uint64_t v76 = *(void *)v136;
    while (2)
    {
      for (uint64_t i = 0; i != v75; ++i)
      {
        if (*(void *)v136 != v76) {
          objc_enumerationMutation(v72);
        }
        if (!-[NSSQLiteAdapter generateTriggerForEntity:alreadyCreated:correlations:batchHistory:fragments:error:](a1, *(void *)(*((void *)&v135 + 1) + 8 * i), a3, a4, a5, v124, a7))
        {
          uint64_t v15 = 0;
          goto LABEL_138;
        }
      }
      uint64_t v75 = [v72 countByEnumeratingWithState:&v135 objects:v143 count:16];
      if (v75) {
        continue;
      }
      break;
    }
  }
  if (!v122)
  {
    if ([v124 count])
    {
      v78 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), v123);
      uint64_t v79 = [v78 tableName];
      id v80 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      [v124 sortUsingComparator:&__block_literal_global_18];
      long long v153 = 0u;
      long long v154 = 0u;
      long long v151 = 0u;
      long long v152 = 0u;
      uint64_t v81 = [v124 countByEnumeratingWithState:&v151 objects:v150 count:16];
      if (v81)
      {
        uint64_t v82 = v81;
        uint64_t v83 = *(void *)v152;
        do
        {
          for (uint64_t j = 0; j != v82; ++j)
          {
            if (*(void *)v152 != v83) {
              objc_enumerationMutation(v124);
            }
            objc_msgSend(v80, "appendString:", objc_msgSend(*(id *)(*((void *)&v151 + 1) + 8 * j), "lastObject"));
            [v80 appendString:@"; "];
          }
          uint64_t v82 = [v124 countByEnumeratingWithState:&v151 objects:v150 count:16];
        }
        while (v82);
      }
      v85 = (NSString *)[NSString stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_TRIGGER AFTER DELETE ON %@ FOR EACH ROW BEGIN %@ END", v79, v79, v80];

      v86 = [[NSSQLiteStatement alloc] initWithEntity:v78];
      CFDictionaryRef v87 = v86;
      if (v86)
      {
        sqlString = v86->_sqlString;
        if (sqlString != v85)
        {

          v87->_sqlString = (NSString *)[(NSString *)v85 copy];
        }
      }
      v89 = (NSString *)[NSString stringWithFormat:@"DROP TRIGGER IF EXISTS ZQ_%@_TRIGGER", v79];
      v90 = [[NSSQLiteStatement alloc] initWithEntity:v78];
      v91 = v90;
      a3 = theDict;
      if (v90)
      {
        long long v92 = v90->_sqlString;
        if (v92 != v89)
        {

          v91->_sqlString = (NSString *)[(NSString *)v89 copy];
        }
      }
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v87, v91, 0);

      a5 = v126;
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    }

    if (!v15) {
      return v15;
    }
    if ([(id)v15 count])
    {
      Value = (void *)CFDictionaryGetValue(a3, v14);
      if ((void *)[MEMORY[0x1E4F1CA98] null] == Value) {
        CFDictionarySetValue(a3, v14, (const void *)v15);
      }
      else {
        [Value addObjectsFromArray:v15];
      }
    }
    if (a5)
    {
      uint64_t v106 = *(void *)(a1 + 8);
      long long v107 = v106
           ? (void *)[*(id *)(v106 + 240) objectForKey:@"NSPersistentHistoryTrackingEntitiesToInclude"]: 0;
      if (objc_msgSend(v107, "containsObject:", objc_msgSend(v14, "name")))
      {
        uint64_t v108 = objc_msgSend((id)objc_msgSend(v14, "managedObjectModel"), "_modelsReferenceIDOffset");
        if (v108 != +[_PFPersistentHistoryModel ancillaryEntityOffset])
        {
          long long v109 = (const void *)-[NSSQLiteAdapter generateDeleteHistoryTriggerForEntity:error:](a1, v14);
          long long v110 = (void *)CFDictionaryGetValue(a5, v14);
          uint64_t v111 = [MEMORY[0x1E4F1CA98] null];
          if (!v110 || (void *)v111 == v110) {
            CFDictionarySetValue(a5, v14, v109);
          }
          else {
            [v110 addObjectsFromArray:v109];
          }
        }
      }
    }
    v74 = 0;
  }
  uint64_t v15 = 1;
LABEL_138:

  return v15;
}

- (uint64_t)generateCorrelationTableTriggerStatementsForRelationship:(uint64_t)a1 existing:(void *)a2 correlationTableTriggers:(const __CFDictionary *)a3 error:(uint64_t *)a4
{
  unint64_t v6 = a2;
  v47[2] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[a2 entity]);
  uint64_t v9 = [v6 name];
  if (!v8 || (v10 = [v8[5] objectForKey:v9]) == 0 || (uint64_t v11 = (__CFString *)v10, !*(void *)(v10 + 64)))
  {
    unint64_t v6 = (void *)[v6 inverseRelationship];
    uint64_t v8 = (id *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v6 entity]);
    uint64_t v12 = [v6 name];
    if (v8) {
      uint64_t v11 = (__CFString *)[v8[5] objectForKey:v12];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  if (CFDictionaryGetValue(a3, v6)) {
    return 1;
  }
  id v42 = a4;
  uint64_t v13 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), (void *)[v6 destinationEntity]);
  unint64_t v14 = (void *)[v6 inverseRelationship];
  uint64_t v15 = [v6 deleteRule];
  uint64_t v16 = [v14 deleteRule];
  uint64_t v41 = [(__CFString *)v11 correlationTableName];
  if (v15 == 1)
  {
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@ ; ",
            [v13 tableName],
            -[NSSQLManyToMany inverseColumnName](v11),
            0);
    uint64_t v18 = *(unsigned char **)(a1 + 8);
    if (v18 && (v18[201] & 4) != 0)
    {
      uint64_t v19 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:](v18, v13, (uint64_t)v11, 1);
      uint64_t v20 = [[NSString alloc] initWithFormat:@"%@; %@", v19, v17];

      uint64_t v17 = v20;
    }
  }
  else
  {
    if (v15 != 2)
    {
      if (v42)
      {
        uint64_t v23 = *MEMORY[0x1E4F281F8];
        v46[0] = @"Reason";
        v46[1] = @"Relationship";
        v47[0] = @"Delete rule is not supported for batch deletes";
        v47[1] = v6;
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v23, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
        uint64_t result = 0;
        *id v42 = v24;
        return result;
      }
      return 0;
    }
    uint64_t v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM %@ WHERE Z_PK = OLD.%@ ; ",
            [v13 tableName],
            -[NSSQLManyToMany inverseColumnName](v11),
            0);
  }
  if (v16 != 1)
  {
    if (v16 == 2)
    {
      uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"DELETE FROM %@ WHERE Z_PK = OLD.%@ ; ",
              [v8 tableName],
              [(__CFString *)v11 columnName],
              0);
      goto LABEL_16;
    }
    if (v42)
    {
      uint64_t v33 = *MEMORY[0x1E4F281F8];
      v44[0] = @"Reason";
      v44[1] = @"Relationship";
      v45[0] = @"Delete rule is not supported for batch deletes";
      v45[1] = v14;
      *id v42 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v33, 134060, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
    }

    return 0;
  }
  uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"UPDATE OR FAIL %@ SET Z_OPT = (Z_OPT + 1) WHERE Z_PK = OLD.%@ ; ",
          [v8 tableName],
          [(__CFString *)v11 columnName],
          0);
  uint64_t v26 = *(unsigned char **)(a1 + 8);
  if (v26)
  {
    uint64_t v22 = v41;
    if ((v26[201] & 4) != 0)
    {
      uint64_t v27 = (void *)-[NSSQLiteAdapter generateBatchDeleteUpdateHistoryStatementEntity:andRelationship:useInverse:](v26, v8, (uint64_t)v11, 0);
      uint64_t v28 = [[NSString alloc] initWithFormat:@"%@; %@", v27, v21];

      uint64_t v21 = v28;
    }
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v22 = v41;
LABEL_22:
  if (v17 | v21)
  {
    id v29 = objc_alloc(MEMORY[0x1E4F28E78]);
    uint64_t v30 = &stru_1ED787880;
    if (v17) {
      uint64_t v31 = (__CFString *)v17;
    }
    else {
      uint64_t v31 = &stru_1ED787880;
    }
    if (v21) {
      uint64_t v30 = (__CFString *)v21;
    }
    uint64_t v32 = (NSString *)[v29 initWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_TRIGGER AFTER DELETE ON %@ FOR EACH ROW BEGIN %@%@ END", v22, v22, v31, v30, 0];
  }
  else
  {
    uint64_t v32 = 0;
  }
  uint64_t v34 = [[NSSQLiteStatement alloc] initWithEntity:v8];
  long long v35 = v34;
  if (v34)
  {
    sqlString = v34->_sqlString;
    if (sqlString != v32)
    {

      v35->_sqlString = (NSString *)[(NSString *)v32 copy];
    }
  }

  int v37 = (NSString *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS ZQ_%@_TRIGGER", v22, 0];
  uint64_t v38 = [[NSSQLiteStatement alloc] initWithEntity:v8];
  uint64_t v39 = v38;
  if (v38)
  {
    uint64_t v40 = v38->_sqlString;
    if (v40 != v37)
    {

      v39->_sqlString = (NSString *)[(NSString *)v37 copy];
    }
  }

  v43[0] = v35;
  v43[1] = v39;
  CFDictionarySetValue(a3, v6, (const void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2]);

  return 1;
}

- (uint64_t)generateBatchDeleteUpdateHistoryStatementEntity:(uint64_t)a3 andRelationship:(int)a4 useInverse:
{
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = (void *)[*(id *)(v7 + 40) objectForKey:@"COLUMNS"];
    uint64_t v10 = (void *)[*(id *)(v8 + 40) objectForKey:@"ENTITYPK"];
    uint64_t v11 = (void *)[*(id *)(v8 + 40) objectForKey:@"ENTITY"];
    uint64_t v46 = (void *)[*(id *)(v8 + 40) objectForKey:@"CHANGETYPE"];
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v46 = 0;
  }
  id v45 = v10;
  uint64_t v47 = [[NSString alloc] initWithFormat:@"ON CONFLICT(%@, %@) DO UPDATE SET %@ = NSPersistentHistoryBatchDeleteUpdateTriggerDataBlobOperator(%@, excluded.%@)", objc_msgSend(v10, "columnName"), objc_msgSend(v11, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v9, "columnName")];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (uint64_t v12 = (void *)a3, a4))
  {
    if (a3) {
      uint64_t v12 = *(void **)(a3 + 56);
    }
    else {
      uint64_t v12 = 0;
    }
  }
  uint64_t v13 = [v12 name];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a3)
    {
      if ([*(id *)(a3 + 56) isToMany]
        && *(void *)(a3 + 72)
        && objc_msgSend((id)objc_msgSend((id)a3, "propertyDescription"), "deleteRule") == 1)
      {
        unint64_t v14 = *(void **)(a3 + 56);
        if (v14) {
          unint64_t v14 = (void *)[v14 propertyDescription];
        }
        if ([v14 deleteRule] == 1)
        {
          uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(OLD.%@, '%@'))", objc_msgSend(*(id *)(a3 + 72), "columnName"), v13];
          uint64_t v16 = (void *)[[NSString alloc] initWithFormat:@"WHERE OLD.%@ > 0 AND OLD.%@ > 0", objc_msgSend((id)a3, "columnName"), objc_msgSend(*(id *)(a3 + 72), "columnName")];
          id v43 = [NSString alloc];
          uint64_t v42 = -[NSSQLEntity tempTableName](v8);
          if (v8) {
            uint64_t v17 = *(void **)(v8 + 136);
          }
          else {
            uint64_t v17 = 0;
          }
          uint64_t v44 = [v17 columnName];
          uint64_t v18 = [v10 columnName];
          uint64_t v19 = [v11 columnName];
          uint64_t v20 = [v46 columnName];
          uint64_t v21 = [v9 columnName];
          if (v8) {
            uint64_t v22 = *(unsigned int *)(v8 + 184);
          }
          else {
            uint64_t v22 = 0;
          }
          uint64_t v39 = v21;
          uint64_t v23 = (void *)v47;
          uint64_t v24 = [v43 initWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, OLD.%@, OLD.%@, %ld, %@ %@ %@", v42, v44, v18, v19, v20, v39, v22, objc_msgSend((id)a3, "columnName"), objc_msgSend(*(id *)(a3 + 72), "columnName"), 1, v15, v16, v47];
          goto LABEL_31;
        }
      }
    }
    else
    {
      [0 isToMany];
    }
  }
  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(%@.Z_ENT, '%@'))", objc_msgSend(a2, "tableName"), v13];
  id v25 = [NSString alloc];
  uint64_t v26 = [a2 tableName];
  if (a4) {
    uint64_t v27 = -[NSSQLManyToMany inverseColumnName]((__CFString *)a3);
  }
  else {
    uint64_t v27 = (__CFString *)[(id)a3 columnName];
  }
  uint64_t v16 = (void *)[v25 initWithFormat:@"FROM %@ WHERE Z_PK = OLD.%@", v26, v27];
  id v28 = [NSString alloc];
  uint64_t v29 = -[NSSQLEntity tempTableName](v8);
  if (v8) {
    uint64_t v30 = *(void **)(v8 + 136);
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v31 = [v30 columnName];
  uint64_t v32 = [v45 columnName];
  uint64_t v33 = [v11 columnName];
  uint64_t v34 = [v46 columnName];
  uint64_t v35 = [v9 columnName];
  if (v8) {
    uint64_t v36 = *(unsigned int *)(v8 + 184);
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v23 = (void *)v47;
  uint64_t v24 = [v28 initWithFormat:@"INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, Z_PK, Z_ENT, %ld, %@ %@ %@", v29, v31, v32, v33, v34, v35, v36, 1, v15, v16, v47, v40, v41];
LABEL_31:
  uint64_t v37 = v24;

  return v37;
}

- (uint64_t)newConstrainedValuesUpdateStatementWithRow:(void *)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"empty row" userInfo:0]);
  }
  if (*(unsigned char *)(a2 + 16)) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(*(void *)(a2 + 40) + 16) _storeInfo1];
  }
  uint64_t v5 = -[NSSQLiteAdapter newStatementWithEntity:]((uint64_t)a1, v4);
  unint64_t v6 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, v5);
  -[_NSSQLGenerator prepareConstrainedValuesUpdateStatementWithRow:]((uint64_t)v6, a2);
  if (v6)
  {
    uint64_t v7 = (void *)v6[3];
    if (v5) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (v5)
    {
LABEL_8:
      uint64_t v8 = *(void **)(v5 + 32);
      if (v8 != v7)
      {

        *(void *)(v5 + 32) = [v7 copy];
      }
    }
  }

  return v5;
}

- (NSSQLiteStatement)newCorrelationInsertStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [[NSSQLiteStatement alloc] initWithEntity:0];
  uint64_t v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareInsertStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    unint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)[(NSString *)v6 copy];
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationDeleteStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [[NSSQLiteStatement alloc] initWithEntity:0];
  uint64_t v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareDeleteStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    unint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)[(NSString *)v6 copy];
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationMasterReorderStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [[NSSQLiteStatement alloc] initWithEntity:0];
  uint64_t v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareMasterReorderStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    unint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)[(NSString *)v6 copy];
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationMasterReorderStatementPart2ForRelationship:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [[NSSQLiteStatement alloc] initWithEntity:0];
  uint64_t v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareMasterReorderStatementPart2ForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    unint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)[(NSString *)v6 copy];
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCorrelationReorderStatementForRelationship:(void *)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [[NSSQLiteStatement alloc] initWithEntity:0];
  uint64_t v5 = -[NSSQLiteAdapter newGeneratorWithStatement:](a1, (uint64_t)v4);
  -[_NSSQLGenerator prepareReorderStatementForRelationship:]((uint64_t)v5, a2);
  if (v5)
  {
    unint64_t v6 = (NSString *)v5[3];
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if (v4)
    {
LABEL_4:
      sqlString = v4->_sqlString;
      if (sqlString != v6)
      {

        v4->_sqlString = (NSString *)[(NSString *)v6 copy];
      }
    }
  }

  return v4;
}

- (NSSQLiteStatement)newCreateTableStatementForEntity:(__CFString *)a1
{
  if (!a1) {
    return 0;
  }
  v2 = a2;
  if (!a2 || a2[20]) {
    return 0;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CREATE TABLE "];
  objc_msgSend(v5, "appendString:", objc_msgSend(v2, "tableName"));
  objc_msgSend(v5, "appendString:", @"(");
  while (v2)
  {
    unint64_t v6 = v2;
    v2 = (void *)v2[21];
    if (v2 == v6)
    {
      uint64_t v7 = (void *)v6[9];
      goto LABEL_9;
    }
  }
  uint64_t v7 = 0;
LABEL_9:
  uint64_t v8 = (void *)[v7 sortedArrayUsingFunction:sortColumnsByType context:0 hint:0];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t i = 0; i != v10; ++i)
    {
      uint64_t v12 = (unsigned char *)[v8 objectAtIndex:i];
      if (i) {
        [v5 appendString:@", "];
      }
      [v5 appendFormat:@"%@ %@", objc_msgSend(v12, "columnName"), -[NSSQLiteAdapter typeStringForColumn:](a1, v12)];
    }
  }
  [v5 appendString:@" "]);
  uint64_t v13 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v5];

  return v13;
}

- (NSSQLiteStatement)newCreatePrimaryKeyTableStatement
{
  if (result)
  {
    v1 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CREATE TABLE "];
    [v1 appendString:@"Z_PRIMARYKEY"];
    objc_msgSend(v1, "appendString:", @" (");
    [v1 appendString:@"Z_ENT"];
    [v1 appendString:@" INTEGER PRIMARY KEY, "];
    [v1 appendString:@"Z_NAME"];
    [v1 appendString:@" VARCHAR, "];
    [v1 appendString:@"Z_SUPER"];
    [v1 appendString:@" INTEGER, "];
    [v1 appendString:@"Z_MAX"];
    [v1 appendString:@" INTEGER"]);
    v2 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v1];

    return v2;
  }
  return result;
}

- (NSSQLiteStatement)newPrimaryKeyInitializeStatementForEntity:(uint64_t)a3 withInitialMaxPK:
{
  if (result)
  {
    id v5 = [NSString alloc];
    if (a2)
    {
      uint64_t v6 = *(unsigned int *)(a2 + 184);
      uint64_t v7 = [(id)a2 name];
      uint64_t v8 = *(void *)(a2 + 160);
      if (v8) {
        uint64_t v8 = *(unsigned int *)(v8 + 184);
      }
    }
    else
    {
      uint64_t v7 = [0 name];
      uint64_t v6 = 0;
      uint64_t v8 = 0;
    }
    uint64_t v9 = (void *)[v5 initWithFormat:@"INSERT INTO %@(%@, %@, %@, %@) VALUES(%u, '%@', %u, %qd)", @"Z_PRIMARYKEY", @"Z_ENT", @"Z_NAME", @"Z_SUPER", @"Z_MAX", v6, v7, v8, a3];
    uint64_t v10 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v9];

    return v10;
  }
  return result;
}

- (NSSQLiteStatement)newSimplePrimaryKeyUpdateStatementForEntity:(NSSQLiteStatement *)result
{
  if (result)
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ SET %@ = MAX((SELECT %@ FROM %@ WHERE %@ = '%@'), (SELECT CASE WHEN (SELECT COUNT(*) FROM %@)== 0 THEN 0 ELSE (SELECT MAX(%@) FROM %@) END)) WHERE %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_NAME", objc_msgSend(a2, "name"), objc_msgSend(a2, "tableName"), @"Z_PK", objc_msgSend(a2, "tableName"), @"Z_NAME", objc_msgSend(a2, "name")];
    int v3 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v2];

    return v3;
  }
  return result;
}

- (uint64_t)_generateFragmentsForEntity:(void *)a1 inArray:(void *)a2
{
  int v3 = a1;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = (id)[a1 manyToManyRelationships];
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        if (v3) {
          uint64_t v9 = (void *)v3[20];
        }
        else {
          uint64_t v9 = 0;
        }
        if ((objc_msgSend((id)objc_msgSend(v9, "manyToManyRelationships"), "containsObject:", v8) & 1) == 0)
        {
          uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"SELECT CASE WHEN (SELECT COUNT(*) FROM %@) == 0 THEN 0 ELSE (SELECT MAX (%@) FROM %@) END", objc_msgSend(v8, "correlationTableName"), objc_msgSend(v8, "columnName"), objc_msgSend(v8, "correlationTableName")];
          [a2 addObject:v10];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      uint64_t v5 = v11;
    }
    while (v11);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (v3) {
    int v3 = (void *)v3[19];
  }
  uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (result)
  {
    uint64_t v13 = result;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLiteAdapter _generateFragmentsForEntity:inArray:](*(void *)(*((void *)&v17 + 1) + 8 * v15++), a2);
      }
      while (v13 != v15);
      uint64_t result = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
      uint64_t v13 = result;
    }
    while (result);
  }
  return result;
}

- (NSSQLiteStatement)newComplexPrimaryKeyUpdateStatementForEntity:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"SELECT CASE WHEN (SELECT COUNT(*) FROM %@) == 0 THEN 0 ELSE (SELECT MAX (%@) FROM %@) END", objc_msgSend(a2, "tableName"), @"Z_PK", objc_msgSend(a2, "tableName")];
  [v3 addObject:v4];

  -[NSSQLiteAdapter _generateFragmentsForEntity:inArray:](a2, v3);
  if ([v3 count] == 1)
  {
    uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"MAX((SELECT %@ FROM %@ WHERE %@ = '%@'), (%@))", @"Z_MAX", @"Z_PRIMARYKEY", @"Z_NAME", objc_msgSend(a2, "name"), objc_msgSend(v3, "lastObject")];
  }
  else
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"MAX((SELECT %@ FROM %@ WHERE %@ = '%@'),"), CFSTR("Z_MAX"), CFSTR("Z_PRIMARYKEY"), CFSTR("Z_NAME"), objc_msgSend(a2, "name");
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      char v9 = 1;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ((v9 & 1) == 0) {
            [v5 appendString:@", "];
          }
          [v5 appendFormat:@"(%@)", v11];
          char v9 = 0;
        }
        uint64_t v7 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
        char v9 = 0;
      }
      while (v7);
    }
    [v5 appendString:@""]);
  }
  uint64_t v12 = (void *)[[NSString alloc] initWithFormat:@"UPDATE OR FAIL %@ SET %@ = (%@) WHERE %@ = '%@'", @"Z_PRIMARYKEY", @"Z_MAX", v5, @"Z_NAME", objc_msgSend(a2, "name")];

  uint64_t v13 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v12];
  return v13;
}

- (NSSQLiteStatement)newCopyAndInsertStatementForManyToMany:(__CFString *)a3 toManyToMany:(uint64_t)a4 intermediateTableName:(int)a5 invertColumns:
{
  if (result)
  {
    char v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"INSERT INTO "];
    objc_msgSend(v9, "appendString:", -[__CFString correlationTableName](a3, "correlationTableName"));
    objc_msgSend(v9, "appendString:", @" (");
    objc_msgSend(v9, "appendString:", -[__CFString columnName](a3, "columnName"));
    [v9 appendString:@", "];
    [v9 appendString:-[NSSQLManyToMany inverseColumnName](a3)];
    if (a3 && (data = a3[2].data) != 0)
    {
      [v9 appendString:@", "];
      [v9 appendString:data];
      char v11 = 0;
    }
    else
    {
      char v11 = 1;
    }
    uint64_t v12 = -[NSSQLManyToMany inverseOrderColumnName](a3);
    if (v12)
    {
      [v9 appendString:@", "];
      [v9 appendString:v12];
    }
    [v9 appendString:@" SELECT "]);
    if (a5)
    {
      [v9 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
      [v9 appendString:@", "];
      objc_msgSend(v9, "appendString:", -[__CFString columnName](a2, "columnName"));
      if (v12)
      {
        uint64_t v13 = -[NSSQLManyToMany inverseOrderColumnName](a2);
        [v9 appendString:@", "];
        if (v13)
        {
          uint64_t v14 = v9;
          long long v15 = v13;
        }
        else
        {
          long long v15 = -[NSSQLManyToMany inverseColumnName](a2);
          uint64_t v14 = v9;
        }
        [v14 appendString:v15];
      }
      if (v11) {
        goto LABEL_32;
      }
      if (!a2)
      {
        [v9 appendString:@", "];
        goto LABEL_21;
      }
      long long v19 = (__CFString *)a2[2].data;
      [v9 appendString:@", "];
      if (!v19)
      {
LABEL_21:
        uint64_t v20 = (__CFString *)[(__CFString *)a2 columnName];
LABEL_30:
        long long v22 = v20;
        long long v21 = v9;
        goto LABEL_31;
      }
LABEL_28:
      long long v21 = v9;
      long long v22 = v19;
LABEL_31:
      [v21 appendString:v22];
      goto LABEL_32;
    }
    objc_msgSend(v9, "appendString:", -[__CFString columnName](a2, "columnName"));
    [v9 appendString:@", "];
    [v9 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    if (v11)
    {
LABEL_26:
      if (!v12)
      {
LABEL_32:
        [v9 appendString:@" FROM "];
        [v9 appendString:a4];
        long long v23 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v9];

        return v23;
      }
      long long v19 = -[NSSQLManyToMany inverseOrderColumnName](a2);
      [v9 appendString:@", "];
      if (!v19)
      {
        uint64_t v20 = -[NSSQLManyToMany inverseColumnName](a2);
        goto LABEL_30;
      }
      goto LABEL_28;
    }
    if (a2)
    {
      long long v16 = a2[2].data;
      [v9 appendString:@", "];
      if (v16)
      {
        long long v17 = v9;
        uint64_t v18 = (uint64_t)v16;
LABEL_25:
        [v17 appendString:v18];
        goto LABEL_26;
      }
    }
    else
    {
      [v9 appendString:@", "];
    }
    uint64_t v18 = [(__CFString *)a2 columnName];
    long long v17 = v9;
    goto LABEL_25;
  }
  return result;
}

- (NSSQLiteStatement)newDropTableStatementOrFailForTableNamed:(NSSQLiteStatement *)result
{
  if (result)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"DROP TABLE "];
    [v3 appendString:a2];
    uint64_t v4 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v3];

    return v4;
  }
  return result;
}

- (NSSQLiteStatement)newRenameTableStatementFrom:(uint64_t)a3 to:
{
  if (result)
  {
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"ALTER TABLE "];
    [v5 appendString:a2];
    [v5 appendString:@" RENAME TO "];
    [v5 appendString:a3];
    uint64_t v6 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v5];

    return v6;
  }
  return result;
}

- (NSSQLiteStatement)newCreateTableStatementForManyToMany:(NSSQLiteStatement *)result
{
  if (result)
  {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"CREATE TABLE "];
    objc_msgSend(v3, "appendString:", -[__CFString correlationTableName](a2, "correlationTableName"));
    objc_msgSend(v3, "appendString:", @"(");
    uint64_t v4 = [(__CFString *)a2 columnName];
    if (a2) {
      int v5 = 3;
    }
    else {
      int v5 = 0;
    }
    uint64_t v6 = NSSQLiteAdapter_typeStringForSQLType(v5);
    [v3 appendFormat:@"%@ %@", v4, v6];
    [v3 appendString:@", "];
    [v3 appendFormat:@"%@ %@", -[NSSQLManyToMany inverseColumnName](a2), v6];
    if (a2)
    {
      data = a2[2].data;
      if (data)
      {
        [v3 appendString:@", "];
        [v3 appendFormat:@"%@ %@", data, NSSQLiteAdapter_typeStringForSQLType(1)];
      }
    }
    uint64_t v8 = -[NSSQLManyToMany inverseOrderColumnName](a2);
    if (v8)
    {
      char v9 = v8;
      [v3 appendString:@", "];
      [v3 appendFormat:@"%@ %@", v9, NSSQLiteAdapter_typeStringForSQLType(a2 != 0)];
    }
    objc_msgSend(v3, "appendString:", @", PRIMARY KEY (");
    objc_msgSend(v3, "appendString:", -[__CFString columnName](a2, "columnName"));
    [v3 appendString:@", "];
    [v3 appendString:-[NSSQLManyToMany inverseColumnName](a2)];
    [v3 appendString:@"]"));
    uint64_t v10 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v3];

    return v10;
  }
  return result;
}

- (NSSQLiteStatement)newCreateIndexStatementForColumnWithName:(uint64_t)a1 inTableWithName:(uint64_t)a2
{
  uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INDEX", a2, a1];
  int v5 = (void *)[[NSString alloc] initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@)", v4, a2, a1];

  uint64_t v6 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v5];
  return v6;
}

- (NSSQLiteStatement)newDropIndexStatementForColumn:(NSSQLiteStatement *)result
{
  if (result)
  {
    int v3 = result;
    uint64_t v4 = [a2 columnName];
    uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "entity"), "tableName");
    return -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:](v3, v4, v5);
  }
  return result;
}

- (NSSQLiteStatement)newDropIndexStatementForColumnWithName:(uint64_t)a3 inTableWithName:
{
  if (result)
  {
    int v3 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INDEX", a3, a2];
    uint64_t v4 = (void *)[[NSString alloc] initWithFormat:@"DROP INDEX IF EXISTS %@", v3];

    uint64_t v5 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v4];
    return v5;
  }
  return result;
}

- (uint64_t)generateBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:
{
  id v4 = [(NSSQLIndex *)[NSSQLBinaryIndex alloc] initForIndexDescription:a2 sqlEntity:a3];
  uint64_t v5 = [v4 generateStatementsForStore:*(void *)(a1 + 8)];

  return v5;
}

- (uint64_t)generateDropBinaryIndexStatementsForIndex:(uint64_t)a3 onEntity:
{
  id v4 = [(NSSQLIndex *)[NSSQLBinaryIndex alloc] initForIndexDescription:a2 sqlEntity:a3];
  uint64_t v5 = [v4 dropStatementsForStore:*(void *)(a1 + 8)];

  return v5;
}

- (id)newCreateIndexStatementsForEntity:(char)a3 defaultIndicesOnly:
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  int v3 = (void *)a2;
  if (!a2)
  {
    id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_4;
  }
  uint64_t v4 = *(void *)(a2 + 160);
  id v74 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
LABEL_4:
    char v70 = 0;
    goto LABEL_18;
  }
  while (v3)
  {
    uint64_t v5 = v3;
    int v3 = (void *)v3[21];
    if (v3 == v5)
    {
      uint64_t v6 = (void *)v5[9];
      goto LABEL_8;
    }
  }
  uint64_t v6 = 0;
LABEL_8:
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v90 objects:v97 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v91 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        char v11 = (void *)MEMORY[0x18C127630]();
        if ([v10 propertyType] == 3)
        {
          uint64_t v12 = -[NSSQLiteAdapter newCreateIndexStatementForColumnWithName:inTableWithName:]([v10 columnName], objc_msgSend((id)objc_msgSend(v10, "entity"), "tableName"));
          [v74 addObject:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v90 objects:v97 count:16];
    }
    while (v7);
  }
  char v70 = 1;
  int v3 = (void *)a2;
LABEL_18:
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t v13 = (void *)[v3 manyToManyRelationships];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v14)
  {
    uint64_t v75 = *(void *)v87;
    obuint64_t j = v13;
    do
    {
      uint64_t v76 = v14;
      for (uint64_t j = 0; j != v76; ++j)
      {
        if (*(void *)v87 != v75) {
          objc_enumerationMutation(obj);
        }
        long long v16 = *(__CFString **)(*((void *)&v86 + 1) + 8 * j);
        long long v17 = (void *)MEMORY[0x18C127630]();
        if (v16)
        {
          if (v16[2].isa)
          {
            if ([(__CFString *)v16 entity] == a2)
            {
              if (v16[2].isa)
              {
                uint64_t v41 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INDEX", -[__CFString correlationTableName](v16, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v16)];
                uint64_t v42 = (void *)[[NSString alloc] initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@)", v41, -[__CFString correlationTableName](v16, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v16), -[__CFString columnName](v16, "columnName")];

                id v43 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v42];
                if (v43)
                {
                  [v74 addObject:v43];
                }
              }
            }
          }
          if (objc_msgSend((id)-[__CFString propertyDescription](v16, "propertyDescription"), "isOrdered"))
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[__CFString propertyDescription](v16, "propertyDescription"), "userInfo"), "objectForKey:", @"NSRelationshipDescriptionOrderKeyIndexOption"), "BOOLValue"))
            {
              id v18 = [NSString alloc];
              uint64_t v19 = [(__CFString *)v16 correlationTableName];
              uint64_t v20 = [(__CFString *)v16 columnName];
              long long v21 = -[NSSQLManyToMany inverseColumnName](v16);
              long long v22 = (void *)[v18 initWithFormat:@"%@_%@_%@_%@_INDEX", v19, v20, v21, -[NSSQLManyToMany inverseOrderColumnName](v16)];
              id v23 = [NSString alloc];
              uint64_t v24 = [(__CFString *)v16 correlationTableName];
              uint64_t v25 = [(__CFString *)v16 columnName];
              uint64_t v26 = -[NSSQLManyToMany inverseColumnName](v16);
              uint64_t v27 = (void *)[v23 initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@, %@)", v22, v24, v25, v26, -[NSSQLManyToMany inverseOrderColumnName](v16)];
              id v28 = [NSString alloc];
              uint64_t v29 = [(__CFString *)v16 correlationTableName];
              uint64_t v30 = [(__CFString *)v16 columnName];
              uint64_t v31 = -[NSSQLManyToMany inverseOrderColumnName](v16);
              uint64_t v32 = (void *)[v28 initWithFormat:@"%@_%@_%@_%@_INDEX", v29, v30, v31, -[NSSQLManyToMany inverseColumnName](v16)];
              id v33 = [NSString alloc];
              uint64_t v34 = [(__CFString *)v16 correlationTableName];
              uint64_t v35 = [(__CFString *)v16 columnName];
              uint64_t v36 = -[NSSQLManyToMany inverseOrderColumnName](v16);
              uint64_t v37 = (void *)[v33 initWithFormat:@"CREATE INDEX IF NOT EXISTS %@ ON %@ (%@, %@, %@)", v32, v34, v35, v36, -[NSSQLManyToMany inverseColumnName](v16)];
              uint64_t v38 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v27];
              uint64_t v39 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v37];
              uint64_t v40 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v38, v39, 0);

              if (v40)
              {
                [v74 addObjectsFromArray:v40];
              }
            }
          }
        }
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v86 objects:v96 count:16];
    }
    while (v14);
  }
  char v44 = v70 ^ 1;
  if (!a2) {
    char v44 = 1;
  }
  if ((v44 & 1) == 0)
  {
    id v45 = *(void **)(a2 + 152);
    if (v45)
    {
      if ([v45 count])
      {
        uint64_t v46 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a2, "entityDescription"), "userInfo"), "objectForKey:", @"_NSEntityOmitSubentityColumnIndex");
        uint64_t v47 = v46;
        if (!v46
          || ![v46 isNSString]
          || (v48 = (void *)[v47 lowercaseString], (uint64_t v49 = v48) == 0)
          || ([v48 isEqualToString:@"yes"] & 1) == 0
          && ([v49 isEqualToString:@"1"] & 1) == 0)
        {
          id v50 = -[NSSQLiteAdapter newCreateIndexStatementForColumnWithName:inTableWithName:]([*(id *)(a2 + 136) columnName], objc_msgSend((id)objc_msgSend(*(id *)(a2 + 136), "entity"), "tableName"));
          [v74 addObject:v50];
        }
      }
    }
  }
  if ((a3 & 1) == 0)
  {
    v51 = (void *)[(id)a2 entityDescription];
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    uint64_t v52 = (void *)[v51 indexes];
    uint64_t v53 = [v52 countByEnumeratingWithState:&v82 objects:v95 count:16];
    if (v53)
    {
      uint64_t v54 = *(void *)v83;
      do
      {
        uint64_t v55 = 0;
        do
        {
          if (*(void *)v83 != v54) {
            objc_enumerationMutation(v52);
          }
          uint64_t v56 = *(void **)(*((void *)&v82 + 1) + 8 * v55);
          id v57 = (void *)MEMORY[0x18C127630]();
          if (objc_msgSend((id)objc_msgSend(v56, "elements"), "count"))
          {
            uint64_t v58 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v56, "elements"), "firstObject"), "collationType");
            if (v58 == 1)
            {
              if (a2) {
                uint64_t v60 = objc_msgSend(*(id *)(a2 + 232), "objectForKey:", objc_msgSend(v56, "name"));
              }
              else {
                uint64_t v60 = 0;
              }
              uint64_t v59 = [v60 generateStatementsForStore:*(void *)(a1 + 8)];
            }
            else
            {
              if (v58) {
                goto LABEL_62;
              }
              uint64_t v59 = -[NSSQLiteAdapter generateBinaryIndexStatementsForIndex:onEntity:](a1, (uint64_t)v56, a2);
            }
            if (v59) {
              [v74 addObjectsFromArray:v59];
            }
          }
LABEL_62:
          ++v55;
        }
        while (v53 != v55);
        uint64_t v61 = [v52 countByEnumeratingWithState:&v82 objects:v95 count:16];
        uint64_t v53 = v61;
      }
      while (v61);
    }
    v62 = (void *)[v51 _uniquenessConstraintsAsFetchIndexes];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v63)
    {
      uint64_t v64 = *(void *)v79;
      do
      {
        for (uint64_t k = 0; k != v63; ++k)
        {
          if (*(void *)v79 != v64) {
            objc_enumerationMutation(v62);
          }
          uint64_t v66 = *(void *)(*((void *)&v78 + 1) + 8 * k);
          uint64_t v67 = (void *)MEMORY[0x18C127630]();
          uint64_t v68 = -[NSSQLiteAdapter generateBinaryIndexStatementsForIndex:onEntity:](a1, v66, a2);
          if (v68) {
            [v74 addObjectsFromArray:v68];
          }
        }
        uint64_t v63 = [v62 countByEnumeratingWithState:&v78 objects:v94 count:16];
      }
      while (v63);
    }
  }
  return v74;
}

- (id)newDropIndexStatementsForEntity:(char)a3 defaultIndicesOnly:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    goto LABEL_4;
  }
  uint64_t v5 = *(void *)(a2 + 160);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
LABEL_4:
    char v46 = 0;
    goto LABEL_19;
  }
  uint64_t v6 = a2;
  while (v6)
  {
    uint64_t v7 = v6;
    uint64_t v6 = *(void *)(v6 + 168);
    if (v6 == v7)
    {
      uint64_t v8 = *(void **)(v7 + 72);
      goto LABEL_9;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v62 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([v12 propertyType] == 3)
        {
          uint64_t v13 = -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:](a1, [v12 columnName], objc_msgSend((id)objc_msgSend(v12, "entity"), "tableName"));
          [v48 addObject:v13];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v9);
  }
  char v46 = 1;
LABEL_19:
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v14 = (void *)[(id)a2 manyToManyRelationships];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v58;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v58 != v16) {
          objc_enumerationMutation(v14);
        }
        id v18 = *(__CFString **)(*((void *)&v57 + 1) + 8 * v17);
        if (v18)
        {
          if (v18[2].isa)
          {
            if ([*(id *)(*((void *)&v57 + 1) + 8 * v17) entity] == a2)
            {
              if (v18[2].isa)
              {
                uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"%@_%@_INDEX", -[__CFString correlationTableName](v18, "correlationTableName"), -[NSSQLManyToMany inverseColumnName](v18)];
                uint64_t v20 = (void *)[[NSString alloc] initWithFormat:@"DROP INDEX IF EXISTS %@", v19];

                long long v21 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v20];
                if (v21)
                {
                  [v48 addObject:v21];
                }
              }
            }
          }
        }
        ++v17;
      }
      while (v15 != v17);
      uint64_t v22 = [v14 countByEnumeratingWithState:&v57 objects:v67 count:16];
      uint64_t v15 = v22;
    }
    while (v22);
  }
  char v23 = v46 ^ 1;
  if (!a2) {
    char v23 = 1;
  }
  if ((v23 & 1) == 0)
  {
    uint64_t v24 = *(void **)(a2 + 152);
    if (v24)
    {
      if ([v24 count])
      {
        uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a2, "entityDescription"), "userInfo"), "objectForKey:", @"_NSEntityOmitSubentityColumnIndex");
        uint64_t v26 = v25;
        if (!v25
          || ![v25 isNSString]
          || (uint64_t v27 = (void *)[v26 lowercaseString], (v28 = v27) == 0)
          || ([v27 isEqualToString:@"yes"] & 1) == 0
          && ([v28 isEqualToString:@"1"] & 1) == 0)
        {
          uint64_t v29 = -[NSSQLiteAdapter newDropIndexStatementForColumnWithName:inTableWithName:](a1, [*(id *)(a2 + 136) columnName], objc_msgSend((id)objc_msgSend(*(id *)(a2 + 136), "entity"), "tableName"));
          [v48 addObject:v29];
        }
      }
    }
  }
  if ((a3 & 1) == 0)
  {
    uint64_t v30 = (void *)[(id)a2 entityDescription];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v31 = (void *)[v30 indexes];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v54;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v54 != v33) {
            objc_enumerationMutation(v31);
          }
          uint64_t v35 = *(void **)(*((void *)&v53 + 1) + 8 * v34);
          if (objc_msgSend((id)objc_msgSend(v35, "elements"), "count"))
          {
            uint64_t v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v35, "elements"), "firstObject"), "collationType");
            if (v36 == 1)
            {
              if (a2) {
                uint64_t v38 = objc_msgSend(*(id *)(a2 + 232), "objectForKey:", objc_msgSend(v35, "name"));
              }
              else {
                uint64_t v38 = 0;
              }
              uint64_t v37 = [v38 dropStatementsForStore:a1->_entity];
            }
            else
            {
              if (v36) {
                goto LABEL_59;
              }
              uint64_t v37 = -[NSSQLiteAdapter generateDropBinaryIndexStatementsForIndex:onEntity:]((uint64_t)a1, (uint64_t)v35, a2);
            }
            if (v37) {
              [v48 addObjectsFromArray:v37];
            }
          }
LABEL_59:
          ++v34;
        }
        while (v32 != v34);
        uint64_t v39 = [v31 countByEnumeratingWithState:&v53 objects:v66 count:16];
        uint64_t v32 = v39;
      }
      while (v39);
    }
    uint64_t v40 = (void *)[v30 _uniquenessConstraintsAsFetchIndexes];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v65 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v50 != v42) {
            objc_enumerationMutation(v40);
          }
          uint64_t v44 = -[NSSQLiteAdapter generateDropBinaryIndexStatementsForIndex:onEntity:]((uint64_t)a1, *(void *)(*((void *)&v49 + 1) + 8 * j), a2);
          if (v44) {
            [v48 addObjectsFromArray:v44];
          }
        }
        uint64_t v41 = [v40 countByEnumeratingWithState:&v49 objects:v65 count:16];
      }
      while (v41);
    }
  }
  return v48;
}

- (id)newCreateTriggersForEntity:(void *)a3 existingRtreeTables:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "entityDescription"), "attributesByName"), "allValues");
  uint64_t v5 = [v4 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    uint64_t v31 = v4;
    uint64_t v32 = a2;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * v7);
        if (objc_msgSend(v8, "_propertyType", v31, v32) != 6)
        {
          if (objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", @"NSTriggerKey"))
          {
            uint64_t v9 = [v8 name];
            if (a2) {
              uint64_t v10 = (void *)[a2[5] objectForKey:v9];
            }
            else {
              uint64_t v10 = 0;
            }
            uint64_t v44 = 0;
            uint64_t v46 = 0;
            uint64_t v47 = &v46;
            uint64_t v48 = 0x3052000000;
            long long v49 = __Block_byref_object_copy__471;
            long long v50 = __Block_byref_object_dispose__472;
            uint64_t v51 = 0;
            char v11 = +[NSSQLAttributeExtensionFactory newExtensionsForAttribute:error:]((uint64_t)NSSQLAttributeExtensionFactory, v10, &v44);
            uint64_t v12 = v11;
            if (v11)
            {
              if ([v11 count])
              {
                *(void *)&long long v40 = MEMORY[0x1E4F143A8];
                *((void *)&v40 + 1) = 3221225472;
                *(void *)&long long v41 = __72__NSSQLiteAdapter_createSQLStatementsForTriggerAttribute_withSQLEntity___block_invoke;
                *((void *)&v41 + 1) = &unk_1E544DE98;
                *(void *)&long long v42 = &v46;
                [v12 enumerateObjectsUsingBlock:&v40];
              }
              else
              {
                id v20 = objc_alloc_init(MEMORY[0x1E4F1C978]);
                v47[5] = (uint64_t)v20;
              }
            }
            if (!v47[5])
            {
              id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              uint64_t v24 = v23;
              if (v44) {
                [v23 setObject:v44 forKey:*MEMORY[0x1E4F28A50]];
              }
              id v25 = (id)[v24 copy];

              id v26 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134060, @"Invalid trigger configuration.", v25);
              objc_exception_throw(v26);
            }

            id v14 = (id)v47[5];
            _Block_object_dispose(&v46, 8);
            if (v14) {
              goto LABEL_34;
            }
            goto LABEL_35;
          }
          if (![v8 attributeType]
            && objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", @"_NSLocationAttributeDerivedComponents"))
          {
            uint64_t v44 = 0;
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v8, "userInfo"), "objectForKey:", @"_NSLocationAttributeDerivedComponents");
            if (!v13) {
              goto LABEL_45;
            }
            uint64_t v34 = -[NSSQLLocationAttributeRTreeExtension initWithObjectFromUserInfo:onAttributeNamed:onEntity:]([NSSQLLocationAttributeRTreeExtension alloc], "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v13, [v8 name], a2);
            if (!v34 || ([a3 containsObject:v34->_rtreeTableName] & 1) != 0)
            {

LABEL_45:
              id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v28 = v27;
              if (v44) {
                [v27 setObject:v44 forKey:*MEMORY[0x1E4F28A50]];
              }
              id v29 = (id)[v28 copy];

              id v30 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F1C3C8], 134060, @"Invalid location index configuration.", v29);
              objc_exception_throw(v30);
            }
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if ([(NSSQLLocationAttributeRTreeExtension *)v34 validate:&v44])
            {
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              uint64_t v15 = [(NSSQLLocationAttributeRTreeExtension *)v34 insertSQLStrings];
              uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v40 objects:&v46 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v41 != v17) {
                      objc_enumerationMutation(v15);
                    }
                    uint64_t v19 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:*(void *)(*((void *)&v40 + 1) + 8 * i)];
                    if (v19) {
                      [v14 addObject:v19];
                    }
                  }
                  uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v40 objects:&v46 count:16];
                }
                while (v16);
              }
            }

            uint64_t v4 = v31;
            a2 = v32;
            if (!v14) {
              goto LABEL_45;
            }
LABEL_34:
            [v35 addObjectsFromArray:v14];
LABEL_35:
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v21 = [v4 countByEnumeratingWithState:&v36 objects:v45 count:16];
      uint64_t v5 = v21;
    }
    while (v21);
  }
  return v35;
}

- (void)generateBatchDeleteUpdateHistoryTriggerForEntity:(void *)a1 andRelationship:(void *)a2 batchHistory:(void *)a3 error:(const __CFDictionary *)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = (void *)[*(id *)(v5 + 40) objectForKey:@"COLUMNS"];
    uint64_t v8 = (void *)[*(id *)(v6 + 40) objectForKey:@"ENTITYPK"];
    uint64_t v9 = (void *)[*(id *)(v6 + 40) objectForKey:@"ENTITY"];
    uint64_t v33 = (void *)[*(id *)(v6 + 40) objectForKey:@"CHANGETYPE"];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v33 = 0;
  }
  id v35 = a3;
  long long v38 = (void *)[[NSString alloc] initWithFormat:@"(SELECT NSPersistentHistoryBatchDeleteUpdateTrigger(Z_ENT, '%@'))", objc_msgSend(a3, "name")];
  uint64_t v34 = v9;
  uint64_t v10 = (void *)[[NSString alloc] initWithFormat:@"ON CONFLICT(%@, %@) DO UPDATE SET %@ = NSPersistentHistoryBatchDeleteUpdateTriggerDataBlobOperator(%@, excluded.%@)", objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v7, "columnName"), objc_msgSend(v7, "columnName"), objc_msgSend(v7, "columnName")];
  char v11 = (void *)[[NSString alloc] initWithFormat:@"FROM %@ WHERE Z_PK = OLD.Z_PK", objc_msgSend(a2, "tableName")];
  id v12 = [NSString alloc];
  uint64_t v13 = -[NSSQLEntity tempTableName](v6);
  if (v6) {
    id v14 = *(void **)(v6 + 136);
  }
  else {
    id v14 = 0;
  }
  uint64_t v15 = [v14 columnName];
  uint64_t v16 = [v8 columnName];
  uint64_t v17 = [v34 columnName];
  uint64_t v18 = [v33 columnName];
  uint64_t v19 = [v7 columnName];
  if (v6) {
    uint64_t v20 = *(unsigned int *)(v6 + 184);
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = objc_msgSend(v12, "initWithFormat:", @"INSERT INTO %@ (%@, %@, %@, %@, %@) SELECT %u, Z_PK, Z_ENT, %ld, %@ %@ %@;",
                  v13,
                  v15,
                  v16,
                  v17,
                  v18,
                  v19,
                  v20,
                  1,
                  v38,
                  v11,
                  v10);

  uint64_t v22 = (NSString *)[NSString stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_%@_HISTORYBATCHDELETEUPDATE_TRIGGER AFTER UPDATE OF %@ ON %@ FOR EACH ROW BEGIN %@ END", objc_msgSend(a2, "tableName"), objc_msgSend(v35, "columnName"), objc_msgSend(v35, "columnName"), objc_msgSend(a2, "tableName"), v21];
  id v23 = [[NSSQLiteStatement alloc] initWithEntity:a2];
  uint64_t v24 = v23;
  if (v23)
  {
    sqlString = v23->_sqlString;
    if (sqlString != v22)
    {

      v24->_sqlString = (NSString *)[(NSString *)v22 copy];
    }
  }
  id v26 = (NSString *)[[NSString alloc] initWithFormat:@"DROP TRIGGER IF EXISTS ZQ_%@_%@_HISTORYBATCHDELETEUPDATE_TRIGGER", objc_msgSend(a2, "tableName"), objc_msgSend(v35, "columnName")];
  id v27 = [[NSSQLiteStatement alloc] initWithEntity:a2];
  long long v39 = v27;
  if (v27)
  {
    id v28 = v27->_sqlString;
    if (v28 != v26)
    {

      v39->_sqlString = (NSString *)[(NSString *)v26 copy];
    }
  }

  id v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v24, v39, 0);
  id v30 = (const void *)[NSString stringWithFormat:@"%@-%@", objc_msgSend(a2, "name"), objc_msgSend(v35, "name")];
  Value = (void *)CFDictionaryGetValue(a4, v30);
  uint64_t v32 = [MEMORY[0x1E4F1CA98] null];
  if (!Value || (void *)v32 == Value) {
    CFDictionarySetValue(a4, v30, v29);
  }
  else {
    [Value addObjectsFromArray:v29];
  }
}

- (uint64_t)generateDeleteHistoryTriggerForEntity:(uint64_t)a1 error:(void *)a2
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _sqlCoreLookupSQLEntityForEntityDescription(*(void **)(a1 + 8), a2);
  uint64_t v48 = [(id)v3 tableName];
  if (v3)
  {
    uint64_t v50 = [*(id *)(v3 + 136) columnName];
    uint64_t v4 = *(void **)(v3 + 128);
  }
  else
  {
    uint64_t v50 = [0 columnName];
    uint64_t v4 = 0;
  }
  uint64_t v47 = [v4 columnName];
  uint64_t v49 = v3;
  uint64_t v5 = (void *)+[_PFPersistentHistoryModel _tombstonesColumnsForEntity:]((uint64_t)_PFPersistentHistoryModel, v3);
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "ancillarySQLModels"), "objectForKey:", @"NSPersistentHistoryTrackingKey"), "entityNamed:", @"CHANGE");
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = (void *)[*(id *)(v6 + 40) objectForKey:@"ENTITYPK"];
    uint64_t v9 = (void *)[*(id *)(v7 + 40) objectForKey:@"ENTITY"];
    uint64_t v10 = (void *)[*(id *)(v7 + 40) objectForKey:@"CHANGETYPE"];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"INSERT OR REPLACE INTO %@ ", -[NSSQLEntity tempTableName](v7)];
  id v12 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v46 = (void *)v11;
  if (v7) {
    uint64_t v13 = *(void **)(v7 + 136);
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = (void *)[v12 initWithFormat:@"%@, %@, %@, %@", objc_msgSend(v13, "columnName"), objc_msgSend(v8, "columnName"), objc_msgSend(v9, "columnName"), objc_msgSend(v10, "columnName")];
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v5 count])
  {
    uint64_t v16 = [v5 count];
    v63[3] = v16;
    if (v49) {
      uint64_t v17 = *(unsigned int *)(v49 + 184);
    }
    else {
      uint64_t v17 = 0;
    }
    [v15 setObject:v5, objc_msgSend(NSString, "stringWithFormat:", @"%d", v17) forKey];
  }
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3052000000;
  v61[3] = __Block_byref_object_copy__28;
  v61[4] = __Block_byref_object_dispose__28;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke;
  v60[3] = &unk_1E544DE48;
  v60[4] = v15;
  v60[5] = &v62;
  v60[6] = v61;
  v61[5] = v60;
  __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke((uint64_t)v60, v49);
  if (v63[3])
  {
    unsigned int v18 = 1;
    do
      [v14 appendFormat:@", Z%@%u", @"TOMBSTONE", v18 - 1];
    while (v63[3] > (unint64_t)v18++);
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (v7) {
    uint64_t v21 = *(unsigned int *)(v7 + 184);
  }
  else {
    uint64_t v21 = 0;
  }
  uint64_t v22 = (void *)[v20 initWithFormat:@"SELECT %d, %@, %@, %ld", v21, v47, v50, 2];
  if (v63[3])
  {
    uint64_t v23 = [v5 count];
    uint64_t v24 = v63[3];
    if (v23 == v24)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      uint64_t v25 = [v5 countByEnumeratingWithState:&v56 objects:v67 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v57 != v26) {
              objc_enumerationMutation(v5);
            }
            [v22 appendFormat:@", OLD.%@", *(void *)(*((void *)&v56 + 1) + 8 * i)];
          }
          uint64_t v25 = [v5 countByEnumeratingWithState:&v56 objects:v67 count:16];
        }
        while (v25);
      }
    }
    else if (v24)
    {
      unint64_t v28 = 0;
      int v29 = 0;
      do
      {
        int v51 = v29;
        [v22 appendFormat:@", CASE %@ ", v50];
        id v30 = v14;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v31 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v31; ++j)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(v15);
              }
              uint64_t v34 = *(void *)(*((void *)&v52 + 1) + 8 * j);
              id v35 = (void *)[v15 objectForKey:v34];
              if ([v35 count] > v28) {
                [v22 appendFormat:@"WHEN %@ THEN (SELECT %@) ", v34, objc_msgSend(v35, "objectAtIndexedSubscript:", v28)];
              }
            }
            uint64_t v31 = [v15 countByEnumeratingWithState:&v52 objects:v66 count:16];
          }
          while (v31);
        }
        [v22 appendFormat:@"ELSE NULL "];
        id v14 = v30;
        [v22 appendFormat:@"END "];
        unint64_t v28 = (v51 + 1);
        int v29 = v51 + 1;
      }
      while (v63[3] > v28);
    }
  }
  [v46 appendFormat:@"(%@) %@ FROM %@ WHERE %@ = OLD.%@;", v14, v22, v48, v47, v47];

  long long v36 = (NSString *)[NSString stringWithFormat:@"CREATE TEMPORARY TRIGGER IF NOT EXISTS ZQ_%@_HISTORYBATCHDELETE_TRIGGER BEFORE DELETE ON %@ FOR EACH ROW BEGIN %@ END", v48, v48, v46];
  long long v37 = [[NSSQLiteStatement alloc] initWithEntity:v49];
  long long v38 = v37;
  if (v37)
  {
    sqlString = v37->_sqlString;
    if (sqlString != v36)
    {

      v38->_sqlString = (NSString *)[(NSString *)v36 copy];
    }
  }
  long long v40 = (NSString *)[NSString stringWithFormat:@"DROP TRIGGER IF EXISTS ZQ_%@_HISTORYBATCHDELETE_TRIGGER", v48];
  long long v41 = [[NSSQLiteStatement alloc] initWithEntity:v49];
  long long v42 = v41;
  if (v41)
  {
    long long v43 = v41->_sqlString;
    if (v43 != v40)
    {

      v42->_sqlString = (NSString *)[(NSString *)v40 copy];
    }
  }
  uint64_t v44 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v38, v42, 0);

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(&v62, 8);
  return v44;
}

uint64_t __63__NSSQLiteAdapter_generateDeleteHistoryTriggerForEntity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)+[_PFPersistentHistoryModel _tombstonesColumnsForEntity:]((uint64_t)_PFPersistentHistoryModel, a2);
  if ([v4 count])
  {
    uint64_t v5 = v2 ? *(unsigned int *)(v2 + 184) : 0;
    [*(id *)(a1 + 32) setObject:v4, objc_msgSend(NSString, "stringWithFormat:", @"%d", v5) forKey];
    if ((unint64_t)[v4 count] > *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count];
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if (v2) {
    uint64_t v2 = *(void *)(v2 + 152);
  }
  uint64_t result = [(id)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation((id)v2);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        ++v9;
      }
      while (v7 != v9);
      uint64_t result = [(id)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(void *)a3 inToMany:
{
  if (result)
  {
    uint64_t v5 = [a3 sourceEntity];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(unsigned int *)(v5 + 184);
      uint64_t v8 = (void *)[a3 destinationEntity];
      uint64_t v9 = *(void **)(v6 + 152);
    }
    else
    {
      uint64_t v8 = (void *)[a3 destinationEntity];
      uint64_t v7 = 0;
      uint64_t v9 = 0;
    }
    uint64_t v10 = [v9 count];
    if (a3) {
      long long v11 = (void *)a3[7];
    }
    else {
      long long v11 = 0;
    }
    uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "foreignKey"), "columnName");
    if (v10)
    {
      if (v11) {
        long long v13 = (void *)v11[9];
      }
      else {
        long long v13 = 0;
      }
      uint64_t v14 = [v13 columnName];
    }
    else
    {
      uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v7);
    }
    uint64_t v15 = v14;
    if (v11) {
      uint64_t v16 = (void *)v11[10];
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [v16 columnName];
    uint64_t v18 = [v8 tableName];
    uint64_t v19 = (void *)[[NSString alloc] initWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE Z_PK = %u", v12, v15, v17, v18, objc_msgSend(a2, "_referenceData64")];
    id v20 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:v19];

    return v20;
  }
  return result;
}

- (NSSQLiteStatement)generateSQLStatmentForSourcesAndOrderKeysForDestination:(__CFString *)a3 inManyToMany:
{
  if (result)
  {
    uint64_t v5 = [(__CFString *)a3 sourceEntity];
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      uint64_t v7 = *(unsigned int *)(v5 + 184);
      uint64_t v5 = *(void *)(v5 + 152);
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v8 = [(id)v5 count];
    uint64_t v9 = [(__CFString *)a3 correlationTableName];
    uint64_t v10 = [v6 tableName];
    uint64_t v11 = [(__CFString *)a3 columnName];
    uint64_t v12 = -[NSSQLManyToMany inverseOrderColumnName](a3);
    if (v8)
    {
      if (v6) {
        long long v13 = (void *)v6[17];
      }
      else {
        long long v13 = 0;
      }
      uint64_t v14 = [NSString stringWithFormat:@"T1.%@", objc_msgSend(v13, "columnName")];
      uint64_t v15 = [[NSString alloc] initWithFormat:@"SELECT T0.%@, %@, T0.%@ from %@ T0 JOIN %@ T1 on t0.%@ = t1.Z_PK where T0.%@ = %u", v11, v14, v12, v9, v10, v11, -[NSSQLManyToMany inverseColumnName](a3), objc_msgSend(a2, "_referenceData64")];
    }
    else
    {
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v7);
      uint64_t v15 = [[NSString alloc] initWithFormat:@"SELECT %@, %@, %@ FROM %@ WHERE %@ = %u", v11, v16, v12, v9, -[NSSQLManyToMany inverseColumnName](a3), objc_msgSend(a2, "_referenceData64"), v19, v20];
    }
    uint64_t v17 = (void *)v15;
    uint64_t v18 = [[NSSQLiteStatement alloc] initWithEntity:v6 sqlString:v15];

    return v18;
  }
  return result;
}

+ (NSSQLiteStatement)generateStatementForCheckingUniqueProperties:(void *)a3 onObjects:(void *)a4 usingSQLCore:
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  self;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "entity");
  if (v6)
  {
    if ((*(unsigned char *)(v6 + 120) & 4) != 0)
    {
      uint64_t v7 = *(void **)(v6 + 72);
    }
    else
    {
      do
      {
        uint64_t v7 = (void *)v6;
        uint64_t v6 = [(id)v6 superentity];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  long long v60 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a4, v7);
  id v8 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (objc_msgSend((id)objc_msgSend(v7, "subentities"), "count")) {
    uint64_t v9 = @"Z_PK, Z_ENT";
  }
  else {
    uint64_t v9 = @"Z_PK";
  }
  uint64_t v10 = (void *)[v8 initWithString:v9];
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v65 = [a2 countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v82;
    long long v63 = v10;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v82 != v64) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void *)(*((void *)&v81 + 1) + 8 * i);
        if (!v12) {
          goto LABEL_29;
        }
        int v13 = *(unsigned __int8 *)(v12 + 24);
        if (v13 != 7)
        {
          if (v13 == 1)
          {
            uint64_t v62 = i;
            uint64_t v14 = (void *)[(id)v12 propertyDescription];
            uint64_t v67 = [v14 name];
            uint64_t v15 = (void *)v12;
            uint64_t v16 = [(id)v12 columnName];
            uint64_t v17 = v14;
            uint64_t v18 = [v14 entity];
            [v10 appendFormat:@", %@", v16];
            uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%@ IN ("), v16;
            long long v77 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            uint64_t v20 = [a3 countByEnumeratingWithState:&v77 objects:v91 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v78;
              char v23 = 1;
              do
              {
                uint64_t v24 = a3;
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v78 != v22) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v26 = *(void **)(*((void *)&v77 + 1) + 8 * j);
                  if (objc_msgSend((id)objc_msgSend(v26, "entity"), "isKindOfEntity:", v18))
                  {
                    if ((v23 & 1) == 0) {
                      [v19 appendString:@", "];
                    }
                    [v19 appendString:@"? "];
                    id v27 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:]([NSSQLBindVariable alloc], "initWithValue:sqlType:propertyDescription:", [v26 valueForKey:v67], objc_msgSend(v15, "sqlType"), v17);
                    [v68 addObject:v27];

                    char v23 = 0;
                  }
                }
                a3 = v24;
                uint64_t v21 = [v24 countByEnumeratingWithState:&v77 objects:v91 count:16];
              }
              while (v21);
            }
            [v19 appendString:@""]);
            [v66 addObject:v19];

            uint64_t i = v62;
            uint64_t v10 = v63;
            continue;
          }
LABEL_29:
          uint64_t v28 = [NSString stringWithUTF8String:"Unsupported property type for unique attribute on entity '%@': %@"];
          uint64_t v29 = [v60 name];
          _NSCoreDataLog(17, v28, v30, v31, v32, v33, v34, v35, v29);
          long long v36 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            uint64_t v37 = [v60 name];
            *(_DWORD *)buf = 138412546;
            uint64_t v87 = v37;
            __int16 v88 = 2112;
            uint64_t v89 = v12;
            _os_log_fault_impl(&dword_18AB82000, v36, OS_LOG_TYPE_FAULT, "CoreData: Unsupported property type for unique attribute on entity '%@': %@", buf, 0x16u);
          }
          continue;
        }
        long long v38 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * i) propertyDescription];
        uint64_t v39 = [v38 name];
        uint64_t v40 = [(id)v12 columnName];
        uint64_t v41 = [v38 entity];
        [v10 appendFormat:@", %@", v40];
        long long v42 = *(void **)(v12 + 72);
        if (v42) {
          [v10 appendFormat:@", %@", objc_msgSend(v42, "columnName")];
        }
        long long v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"%@ IN ("), v40;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v44 = [a3 countByEnumeratingWithState:&v73 objects:v90 count:16];
        if (v44)
        {
          uint64_t v45 = v44;
          uint64_t v46 = *(void *)v74;
          char v47 = 1;
          do
          {
            for (uint64_t k = 0; k != v45; ++k)
            {
              if (*(void *)v74 != v46) {
                objc_enumerationMutation(a3);
              }
              uint64_t v49 = *(void **)(*((void *)&v73 + 1) + 8 * k);
              if (objc_msgSend((id)objc_msgSend(v49, "entity"), "isKindOfEntity:", v41))
              {
                if ((v47 & 1) == 0) {
                  [v43 appendString:@", "];
                }
                [v43 appendString:@"? "];
                uint64_t v50 = -[NSSQLBindVariable initWithInt64:sqlType:]([NSSQLBindVariable alloc], "initWithInt64:sqlType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v49, "valueForKey:", v39), "objectID"), "_referenceData64"), 2);
                [v68 addObject:v50];

                char v47 = 0;
              }
            }
            uint64_t v45 = [a3 countByEnumeratingWithState:&v73 objects:v90 count:16];
          }
          while (v45);
        }
        [v43 appendString:@""]);
        [v66 addObject:v43];

        uint64_t v10 = v63;
      }
      uint64_t v65 = [a2 countByEnumeratingWithState:&v81 objects:v92 count:16];
    }
    while (v65);
  }
  int v51 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"SELECT %@ FROM %@ WHERE ("), v10, objc_msgSend(v60, "tableName");

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v52 = [v66 countByEnumeratingWithState:&v69 objects:v85 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v70;
    char v55 = 1;
    do
    {
      for (uint64_t m = 0; m != v53; ++m)
      {
        if (*(void *)v70 != v54) {
          objc_enumerationMutation(v66);
        }
        uint64_t v57 = *(void *)(*((void *)&v69 + 1) + 8 * m);
        if ((v55 & 1) == 0) {
          [v51 appendString:@" OR "];
        }
        [v51 appendFormat:@"%@", v57];
        char v55 = 0;
      }
      uint64_t v53 = [v66 countByEnumeratingWithState:&v69 objects:v85 count:16];
      char v55 = 0;
    }
    while (v53);
  }

  [v51 appendString:@""]);
  long long v58 = [[NSSQLiteStatement alloc] initWithEntity:v60 sqlString:v51];

  -[NSSQLiteAdapter _useModel:]((uint64_t)v58, v68);
  return v58;
}

+ (NSSQLiteStatement)generateStatementForCheckingMulticolumnConstraint:(void *)a3 onObjects:(void *)a4 usingSQLCore:
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  self;
  id v59 = a3;
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "lastObject"), "entity");
  if (v6)
  {
    if ((*(unsigned char *)(v6 + 120) & 4) != 0)
    {
      uint64_t v7 = *(void **)(v6 + 72);
    }
    else
    {
      do
      {
        uint64_t v7 = (void *)v6;
        uint64_t v6 = [(id)v6 superentity];
      }
      while (v6);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v48 = (void *)_sqlCoreLookupSQLEntityForEntityDescription(a4, v7);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  uint64_t v9 = [a2 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v65;
  char v12 = 1;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v65 != v11) {
        objc_enumerationMutation(a2);
      }
      uint64_t v14 = *(unsigned __int8 **)(*((void *)&v64 + 1) + 8 * i);
      if ((v12 & 1) == 0) {
        [v8 appendString:@", "];
      }
      if (v14)
      {
        int v15 = v14[24];
        if (v15 != 1)
        {
          if (v15 != 7) {
            goto LABEL_18;
          }
          uint64_t v14 = (unsigned __int8 *)[v14 foreignKey];
        }
        objc_msgSend(v8, "appendString:", objc_msgSend(v14, "columnName"));
      }
LABEL_18:
      char v12 = 0;
    }
    uint64_t v10 = [a2 countByEnumeratingWithState:&v64 objects:v73 count:16];
    char v12 = 0;
  }
  while (v10);
LABEL_20:
  id v16 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (objc_msgSend((id)objc_msgSend(v7, "subentities"), "count")) {
    uint64_t v17 = @"Z_PK, Z_ENT";
  }
  else {
    uint64_t v17 = @"Z_PK";
  }
  uint64_t v18 = objc_msgSend(v16, "initWithFormat:", @"SELECT %@, %@ FROM %@ WHERE Z_PK IN ("), v17, v8, objc_msgSend(v48, "tableName");

  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v52 = [a2 countByEnumeratingWithState:&v60 objects:v72 count:16];
  if (!v52)
  {
    [v18 appendString:@""]);
    goto LABEL_72;
  }
  char v54 = 1;
  uint64_t v50 = v18;
  uint64_t v51 = *(void *)v61;
  while (2)
  {
    uint64_t v19 = 0;
    while (2)
    {
      if (*(void *)v61 != v51) {
        objc_enumerationMutation(a2);
      }
      uint64_t v20 = *(unsigned __int8 **)(*((void *)&v60 + 1) + 8 * v19);
      self;
      uint64_t v21 = (void *)[v20 propertyDescription];
      uint64_t v22 = [v21 entity];
      long long v58 = v21;
      uint64_t v57 = [v21 name];
      BOOL v23 = v20 != 0;
      uint64_t v55 = v19;
      if (!v20)
      {
        id v27 = 0;
        uint64_t v56 = 0;
        goto LABEL_33;
      }
      int v24 = v20[24];
      uint64_t v25 = [v20 columnName];
      if (v24 == 7)
      {
        uint64_t v26 = v20;
        if (v20[24] == 3) {
          uint64_t v26 = (unsigned __int8 *)[v20 toOneRelationship];
        }
        uint64_t v56 = objc_msgSend((id)objc_msgSend(v26, "propertyDescription"), "name");
        id v27 = (void *)[v20 foreignKey];
LABEL_33:
        uint64_t v28 = [v27 columnName];
      }
      else
      {
        uint64_t v28 = v25;
        BOOL v23 = 0;
        uint64_t v56 = 0;
      }
      uint64_t v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"SELECT Z_PK FROM %@ WHERE %@ IN ("), objc_msgSend((id)objc_msgSend(v20, "entity"), "tableName"), v28;
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v31 = [v20 sqlType];
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      uint64_t v32 = [v59 countByEnumeratingWithState:&v68 objects:v75 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v69;
        char v35 = 1;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v69 != v34) {
              objc_enumerationMutation(v59);
            }
            uint64_t v37 = *(void **)(*((void *)&v68 + 1) + 8 * j);
            if (objc_msgSend((id)objc_msgSend(v37, "entity"), "isKindOfEntity:", v22))
            {
              if ((v35 & 1) == 0) {
                [v29 appendString:@", "];
              }
              if (v30)
              {
                [v29 appendString:@"?"];
                long long v38 = [NSSQLBindVariable alloc];
                if (v23) {
                  uint64_t v39 = -[NSSQLBindVariable initWithInt64:sqlType:](v38, "initWithInt64:sqlType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v37, "valueForKey:", v56), "objectID"), "_referenceData64"), 2);
                }
                else {
                  uint64_t v39 = -[NSSQLBindVariable initWithValue:sqlType:propertyDescription:](v38, "initWithValue:sqlType:propertyDescription:", [v37 valueForKey:v57], v31, v58);
                }
                uint64_t v40 = (void *)v39;
                [v30 addObject:v39];
              }
              char v35 = 0;
            }
          }
          uint64_t v33 = [v59 countByEnumeratingWithState:&v68 objects:v75 count:16];
        }
        while (v33);
        [v29 appendString:@""]);
        if (v35)
        {
          uint64_t v41 = 0;
          uint64_t v18 = v50;
          goto LABEL_54;
        }
        uint64_t v42 = v55;
        if (v30)
        {
          v74[0] = v29;
          v74[1] = v30;
          long long v43 = (void *)MEMORY[0x1E4F1C978];
          uint64_t v44 = 2;
        }
        else
        {
          v74[0] = v29;
          long long v43 = (void *)MEMORY[0x1E4F1C978];
          uint64_t v44 = 1;
        }
        uint64_t v41 = (void *)[v43 arrayWithObjects:v74 count:v44];
        uint64_t v18 = v50;
      }
      else
      {
        [v29 appendString:@""]);
        uint64_t v41 = 0;
LABEL_54:
        uint64_t v42 = v55;
      }

      if (v41)
      {
        if ((v54 & 1) == 0) {
          [v18 appendString:@" INTERSECT "];
        }
        objc_msgSend(v18, "appendString:", objc_msgSend(v41, "objectAtIndex:", 0));
        if ((unint64_t)[v41 count] >= 2) {
          objc_msgSend(v49, "addObjectsFromArray:", objc_msgSend(v41, "objectAtIndex:", 1));
        }
        char v54 = 0;
      }
      uint64_t v19 = v42 + 1;
      if (v19 != v52) {
        continue;
      }
      break;
    }
    uint64_t v45 = [a2 countByEnumeratingWithState:&v60 objects:v72 count:16];
    uint64_t v52 = v45;
    if (v45) {
      continue;
    }
    break;
  }
  [v18 appendString:@""]);
  if (v54)
  {
LABEL_72:
    uint64_t v46 = 0;
    goto LABEL_73;
  }
  uint64_t v46 = [[NSSQLiteStatement alloc] initWithEntity:v48 sqlString:v18];
LABEL_73:

  -[NSSQLiteAdapter _useModel:]((uint64_t)v46, v49);
  return v46;
}

void __72__NSSQLiteAdapter_createSQLStatementsForTriggerAttribute_withSQLEntity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = objc_msgSend(a2, "insertSQLStrings", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [[NSSQLiteStatement alloc] initWithEntity:0 sqlString:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        if (v10) {
          [v4 addObject:v10];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [v4 copy];
}

@end