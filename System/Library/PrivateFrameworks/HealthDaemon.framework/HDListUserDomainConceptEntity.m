@interface HDListUserDomainConceptEntity
+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (Class)userDomainConceptClass;
+ (Class)userDomainConceptSemanticIdentifierClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)databaseTable;
+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4;
+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3;
+ (id)predicateMatchingSemanticIdentifier:(id)a3;
+ (id)privateDataEntities;
+ (int64_t)protectionClass;
@end

@implementation HDListUserDomainConceptEntity

+ (id)databaseTable
{
  return @"list_user_domain_concepts";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 3;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_64;
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"udc_id";
  v2 = +[HDUserDomainConceptEntity defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [(HDEntityEncoder *)[_HDListUserDomainConceptEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)privateDataEntities
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 protectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__HDListUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E62F33F8;
  id v14 = v9;
  int64_t v15 = a4;
  id v11 = v9;
  LOBYTE(a6) = [v10 executeCachedStatementForKey:&insertConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_153 bindingHandler:v13 enumerationHandler:0];

  return (char)a6;
}

__CFString *__103__HDListUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO list_user_domain_concepts (udc_id, list_type, list_name) VALUES (?, ?, ?)";
}

void __103__HDListUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, [*(id *)(a1 + 32) listType]);
  id v4 = [*(id *)(a1 + 32) listName];
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 protectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __103__HDListUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E62F33F8;
  id v14 = v9;
  int64_t v15 = a4;
  id v11 = v9;
  LOBYTE(a6) = [v10 executeCachedStatementForKey:&updateConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_310_0 bindingHandler:v13 enumerationHandler:0];

  return (char)a6;
}

__CFString *__103__HDListUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"UPDATE list_user_domain_concepts SET (list_type, list_name) = (?, ?) WHERE udc_id = ?";
}

uint64_t __103__HDListUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, [*(id *)(a1 + 32) listType]);
  id v4 = [*(id *)(a1 + 32) listName];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_int64 v5 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 3, v5);
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  _HKInitializeLogging();
  id v12 = HKLogHealthOntology();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138413058;
    id v15 = a1;
    __int16 v16 = 2112;
    id v17 = v11;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 2048;
    int64_t v21 = a5;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%@ will delete list UDC %@, udc_id=%ld, sync_provenance=%ld", (uint8_t *)&v14, 0x2Au);
  }

  return 1;
}

+ (Class)userDomainConceptClass
{
  return (Class)objc_opt_class();
}

+ (Class)userDomainConceptSemanticIdentifierClass
{
  return (Class)objc_opt_class();
}

+ (id)predicateMatchingSemanticIdentifier:(id)a3
{
  uint64_t v3 = [a3 listType];

  return HDListUserDomainConceptEntityPredicateForListType(v3, 1);
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  return 0;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F65D08];
  id v4 = (void *)MEMORY[0x1E4F65D00];
  id v5 = a3;
  v6 = [v5 UUID];
  v7 = [v4 predicateWithProperty:@"uuid" notEqualToValue:v6];
  v8 = (void *)MEMORY[0x1E4F65D00];
  id v9 = NSNumber;
  v10 = objc_msgSend(v5, "identifier", v7);
  id v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "code"));
  id v12 = [v8 predicateWithProperty:@"type" equalToValue:v11];
  v21[1] = v12;
  id v13 = (void *)MEMORY[0x1E4F65D00];
  int v14 = NSNumber;
  uint64_t v15 = [v5 listType];

  __int16 v16 = [v14 numberWithUnsignedInteger:v15];
  id v17 = [v13 predicateWithProperty:@"list_type" equalToValue:v16];
  v21[2] = v17;
  __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  int64_t v19 = [v3 predicateMatchingAllPredicates:v18];

  return v19;
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return +[HDUserDomainConceptCollapser collapseUserDomainConcept:a3 with:a4 profile:a5 transaction:a6 error:a7];
}

@end