@interface HDStateOfMindEntity
+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4;
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_PredicateForProperty:(void *)a3 matchingValues:(uint64_t)a4 inEntityClass:;
+ (id)codableObjectsFromObjectCollection:(id)a3;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)predicateForDomain:(int64_t)a3;
+ (id)predicateForDomains:(id)a3;
+ (id)predicateForLabel:(int64_t)a3;
+ (id)predicateForLabels:(id)a3;
+ (id)predicateForReflectiveInterval:(int64_t)a3;
+ (id)predicateForReflectiveInterval:(int64_t)a3 equals:(BOOL)a4;
+ (id)predicateForValence:(double)a3 comparisonType:(int64_t)a4;
+ (id)privateSubEntities;
+ (int64_t)protectionClass;
@end

@implementation HDStateOfMindEntity

+ (id)databaseTable
{
  return @"state_of_mind_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_87;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"data_id";
  v2 = +[HDDataEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)privateSubEntities
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDStateOfMindEntity.m", 81, @"Subclasses must override %s", "+[HDStateOfMindEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__HDStateOfMindEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
  v25[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v25[4] = a1;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __85__HDStateOfMindEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v22[3] = &unk_1E62F2900;
  id v23 = v14;
  id v24 = v12;
  id v16 = v12;
  id v17 = v14;
  if ([v13 executeCachedStatementForKey:&insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_4 error:a7 SQLGenerator:v25 bindingHandler:v22 enumerationHandler:0])v18 = v17; {
  else
  }
    v18 = 0;
  id v19 = v18;

  return v19;
}

id __85__HDStateOfMindEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1)
{
  v1 = NSString;
  v2 = [*(id *)(a1 + 32) disambiguatedDatabaseTable];
  v3 = [v1 stringWithFormat:@"INSERT OR REPLACE INTO %@ (%@, %@, %@, %@) VALUES (?, ?, ?, ?)", v2, @"data_id", @"reflective_interval", @"valence", @"context", 0];

  return v3;
}

void __85__HDStateOfMindEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) longLongValue]);
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 40) reflectiveInterval]);
  [*(id *)(a1 + 40) valence];
  sqlite3_bind_double(a2, 3, v4);
  v5 = [*(id *)(a1 + 40) context];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 40) context];
    sqlite3_bind_text(a2, 4, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_bind_null(a2, 4);
  }
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  return (id)[a3 stateOfMindLogs];
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3) {
    [a4 addStateOfMindLogs:a3];
  }
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDStateOfMindEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)predicateForValence:(double)a3 comparisonType:(int64_t)a4
{
  v5 = [NSNumber numberWithDouble:a3];
  id v6 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"valence" value:v5 comparisonType:a4];

  return v6;
}

+ (id)predicateForReflectiveInterval:(int64_t)a3
{
  return (id)[a1 predicateForReflectiveInterval:a3 equals:1];
}

+ (id)predicateForReflectiveInterval:(int64_t)a3 equals:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [NSNumber numberWithInteger:a3];
  if (v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  v7 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"reflective_interval" value:v5 comparisonType:v6];

  return v7;
}

+ (id)predicateForLabel:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithInteger:a3];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = +[HDStateOfMindEntity predicateForLabels:v4];

  return v5;
}

+ (id)predicateForLabels:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[HDStateOfMindEntity _PredicateForProperty:matchingValues:inEntityClass:]((uint64_t)HDStateOfMindEntity, @"label", v3, v4);

  return v5;
}

+ (id)_PredicateForProperty:(void *)a3 matchingValues:(uint64_t)a4 inEntityClass:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v8 setEntityClass:a4];
  v9 = [MEMORY[0x1E4F65D10] containsPredicateWithProperty:v7 values:v6];

  [v8 setPredicate:v9];
  v10 = (void *)MEMORY[0x1E4F65D00];
  v14[0] = @"data_id";
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = [v10 predicateWithProperty:@"data_id" comparisonType:7 subqueryDescriptor:v8 subqueryProperties:v11];

  return v12;
}

+ (id)predicateForDomain:(int64_t)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [NSNumber numberWithInteger:a3];
  v7[0] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = +[HDStateOfMindEntity predicateForDomains:v4];

  return v5;
}

+ (id)predicateForDomains:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  v5 = +[HDStateOfMindEntity _PredicateForProperty:matchingValues:inEntityClass:]((uint64_t)HDStateOfMindEntity, @"domain", v3, v4);

  return v5;
}

@end