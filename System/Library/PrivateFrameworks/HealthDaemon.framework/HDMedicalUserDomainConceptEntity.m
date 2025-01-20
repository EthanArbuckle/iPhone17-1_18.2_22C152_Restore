@interface HDMedicalUserDomainConceptEntity
+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)supportsSyncStore:(id)a3;
+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (Class)userDomainConceptClass;
+ (Class)userDomainConceptSemanticIdentifierClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_recursiveSQLForMappedUDCs;
+ (id)databaseTable;
+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4;
+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3;
+ (id)predicateMatchingSemanticIdentifier:(id)a3;
+ (id)privateDataEntities;
+ (id)privateSubEntities;
+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6;
+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (void)_bindRecursiveMappedUDCStatement:(_DWORD *)a3 bindingIndex:;
@end

@implementation HDMedicalUserDomainConceptEntity

+ (id)databaseTable
{
  return @"medical_user_domain_concepts";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 2;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_68;
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

+ (id)privateSubEntities
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
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
  v15 = [(HDEntityEncoder *)[_HDMedicalUserDomainConceptEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)privateDataEntities
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 protectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__HDMedicalUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E62F33F8;
  id v14 = v9;
  int64_t v15 = a4;
  id v11 = v9;
  LOBYTE(a6) = [v10 executeCachedStatementForKey:&insertConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey_0 error:a6 SQLGenerator:&__block_literal_global_170 bindingHandler:v13 enumerationHandler:0];

  return (char)a6;
}

__CFString *__106__HDMedicalUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO medical_user_domain_concepts (udc_id, country_code) VALUES (?, ?)";
}

void __106__HDMedicalUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  id v3 = [*(id *)(a1 + 32) countryCode];
  HDSQLiteBindFoundationValueToStatement();
}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  v10 = [a5 protectedDatabase];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__HDMedicalUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v13[3] = &unk_1E62F33F8;
  id v14 = v9;
  int64_t v15 = a4;
  id v11 = v9;
  LOBYTE(a6) = [v10 executeCachedStatementForKey:&updateConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey_0 error:a6 SQLGenerator:&__block_literal_global_313_1 bindingHandler:v13 enumerationHandler:0];

  return (char)a6;
}

__CFString *__106__HDMedicalUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"UPDATE medical_user_domain_concepts SET (country_code) = (?) WHERE udc_id = ?";
}

uint64_t __106__HDMedicalUserDomainConceptEntity_updateConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  v4 = [*(id *)(a1 + 32) countryCode];
  HDSQLiteBindStringToStatement();

  sqlite3_int64 v5 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, 2, v5);
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = [v12 daemon];
  int64_t v15 = [v14 behavior];
  int v16 = [v15 supportsOntology];

  if (v16)
  {
    v17 = [v12 ontologyDatabase];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __133__HDMedicalUserDomainConceptEntity_willDeleteConcreteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke;
    v20[3] = &unk_1E62F4A30;
    id v21 = v11;
    id v22 = v12;
    char v18 = [v17 performTransactionWithDatabaseTransaction:v13 error:a8 transactionHandler:v20];
  }
  else
  {
    char v18 = 1;
  }

  return v18;
}

BOOL __133__HDMedicalUserDomainConceptEntity_willDeleteConcreteUserDomainConcept_userDomainConceptID_syncProvenance_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDMedicalUserDomainConceptGenerator remapMedicalRecordsIfNeededForUserDomainConcept:*(void *)(a1 + 32) shouldExcludeExistingConcept:1 profile:*(void *)(a1 + 40) ontologyTransaction:a2 error:a3];
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
  v18[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 UUID];

  if (v4)
  {
    sqlite3_int64 v5 = [v3 UUID];
    v6 = HDUserDomainConceptEntityPredicateForConceptUUID((uint64_t)v5, 1);
  }
  else
  {
    v7 = [v3 countryCode];

    v8 = (void *)MEMORY[0x1E4F65D08];
    sqlite3_int64 v5 = [v3 typeIdentifier];
    uint64_t v9 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier(v5);
    v10 = (void *)v9;
    if (v7)
    {
      v17[0] = v9;
      id v11 = [v3 medicalCoding];
      id v12 = HDUserDomainConceptEntityPredicateForMedicalCoding(v11);
      v17[1] = v12;
      id v13 = [v3 countryCode];
      id v14 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"country_code" equalToValue:v13];
      v17[2] = v14;
      int64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
      v6 = [v8 predicateMatchingAllPredicates:v15];
    }
    else
    {
      v18[0] = v9;
      id v11 = [v3 medicalCoding];
      id v12 = HDUserDomainConceptEntityPredicateForMedicalCoding(v11);
      v18[1] = v12;
      id v13 = [MEMORY[0x1E4F65D48] isNullPredicateWithProperty:@"country_code"];
      v18[2] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
      v6 = [v8 predicateMatchingAllPredicates:v14];
    }
  }

  return v6;
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  sqlite3_int64 v5 = (objc_class *)MEMORY[0x1E4F2B1B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  uint64_t v9 = (void *)[v8 initWithCategoryTypes:MEMORY[0x1E4F1CBF0] countryCode:0 codingCollection:v7 propertyCollection:v6];

  return v9;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 firstOntologyCoding];
  sqlite3_int64 v5 = [v3 firstAdhocCoding];
  id v6 = v4;
  if ((v4 || (id v6 = v5) != 0)
    && (HDUserDomainConceptEntityPredicateForMedicalCoding(v6), (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = (void *)v7;
    v20 = (void *)MEMORY[0x1E4F65D08];
    v23 = v5;
    uint64_t v9 = (void *)MEMORY[0x1E4F65D00];
    id v22 = [v3 UUID];
    id v21 = [v9 predicateWithProperty:@"uuid" notEqualToValue:v22];
    v24[0] = v21;
    v10 = (void *)MEMORY[0x1E4F65D00];
    id v11 = NSNumber;
    id v12 = [v3 identifier];
    id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "code"));
    id v14 = [v10 predicateWithProperty:@"type" equalToValue:v13];
    v24[1] = v14;
    v24[2] = v8;
    int64_t v15 = [v3 countryCode];
    int v16 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"country_code" equalToValue:v15];
    v24[3] = v16;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    char v18 = [v20 predicateMatchingAllPredicates:v17];

    sqlite3_int64 v5 = v23;
  }
  else
  {
    char v18 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  return v18;
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return +[HDUserDomainConceptCollapser collapseUserDomainConcept:a3 with:a4 profile:a5 transaction:a6 error:a7];
}

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  return +[HDUserDomainConceptOntologyContentRefresher refreshOntologyContentForUserDomainConcept:a3 profile:a4 transaction:a5 error:a6];
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return [a3 syncStoreType] != 1;
}

+ (id)pruneWithProfile:(id)a3 nowDate:(id)a4 limit:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__138;
  v28 = __Block_byref_object_dispose__138;
  id v29 = 0;
  id v12 = [v10 database];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__HDMedicalUserDomainConceptEntity_pruneWithProfile_nowDate_limit_error___block_invoke;
  v18[3] = &unk_1E6305B38;
  id v21 = &v24;
  id v22 = a1;
  id v13 = v10;
  id v19 = v13;
  id v14 = v11;
  id v20 = v14;
  unint64_t v23 = a5;
  LODWORD(a6) = [a1 performWriteTransactionWithHealthDatabase:v12 error:a6 block:v18];

  if (a6) {
    int64_t v15 = (void *)v25[5];
  }
  else {
    int64_t v15 = 0;
  }
  id v16 = v15;

  _Block_object_dispose(&v24, 8);

  return v16;
}

BOOL __73__HDMedicalUserDomainConceptEntity_pruneWithProfile_nowDate_limit_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 32);
  id v9 = a2;
  id v10 = v6;
  self;
  id v11 = v9;
  uint64_t v12 = self;
  id v13 = [v11 protectedDatabase];
  uint64_t v47 = MEMORY[0x1E4F143A8];
  uint64_t v48 = 3221225472;
  v49 = __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke;
  v50 = &__block_descriptor_40_e15___NSString_8__0l;
  id v51 = (id)v12;
  uint64_t v59 = MEMORY[0x1E4F143A8];
  uint64_t v60 = 3221225472;
  v61 = __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2;
  v62 = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
  id v63 = (id)v12;
  uint64_t v64 = v7;
  LOBYTE(v12) = [v13 executeCachedStatementForKey:&_clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error__statementKey error:a3 SQLGenerator:&v47 bindingHandler:&v59 enumerationHandler:0];

  if ((v12 & 1) == 0)
  {

    id v16 = 0;
    goto LABEL_7;
  }
  id v14 = NSNumber;
  int64_t v15 = [v11 protectedDatabase];
  objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "getChangesCount"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_7:
    id v25 = 0;
    goto LABEL_8;
  }
  uint64_t v17 = [v16 integerValue];
  if (v7 > v17)
  {
    uint64_t v45 = v7 - v17;
    id v40 = v8;
    id v41 = v8;
    id v18 = v11;
    id v43 = v10;
    uint64_t v19 = self;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    id v20 = [v18 protectedDatabase];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke;
    v54[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v54[4] = v19;
    uint64_t v59 = MEMORY[0x1E4F143A8];
    uint64_t v60 = 3221225472;
    v61 = __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_2;
    v62 = &unk_1E62F3618;
    uint64_t v64 = v19;
    id v44 = v43;
    id v63 = v44;
    uint64_t v65 = v45;
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_3;
    v50 = &unk_1E6305B60;
    v53 = &v55;
    id v21 = v41;
    id v51 = v21;
    id v22 = v18;
    id v52 = v22;
    int v23 = [v20 executeCachedStatementForKey:&_tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error__statementKey error:a3 SQLGenerator:v54 bindingHandler:&v59 enumerationHandler:&v47];

    if (v23)
    {
      uint64_t v24 = [NSNumber numberWithInteger:v56[3]];
    }
    else
    {
      uint64_t v24 = 0;
    }

    _Block_object_dispose(&v55, 8);
    if (v24)
    {
      uint64_t v29 = [v24 integerValue];
      uint64_t v30 = v45 - v29;
      if (v45 > v29)
      {
        uint64_t v39 = v29;
        v42 = v24;
        id v31 = v22;
        id v46 = v44;
        v32 = self;
        v33 = [v31 protectedDatabase];
        uint64_t v47 = MEMORY[0x1E4F143A8];
        uint64_t v48 = 3221225472;
        v49 = __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke;
        v50 = &__block_descriptor_40_e15___NSString_8__0l;
        id v51 = v32;
        uint64_t v59 = MEMORY[0x1E4F143A8];
        uint64_t v60 = 3221225472;
        v61 = __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2;
        v62 = &unk_1E62F3618;
        id v34 = v46;
        id v63 = v34;
        uint64_t v64 = (uint64_t)v32;
        uint64_t v65 = v30;
        int v35 = [v33 executeCachedStatementForKey:&_markNewUnmappedUDCsWithTransaction_nowDate_limit_error__statementKey error:a3 SQLGenerator:&v47 bindingHandler:&v59 enumerationHandler:0];

        v36 = 0;
        if (v35)
        {
          v37 = NSNumber;
          v38 = [v31 protectedDatabase];
          v36 = objc_msgSend(v37, "numberWithInt:", objc_msgSend(v38, "getChangesCount"));
        }
        if (v36)
        {
          objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v36, "integerValue") + v39);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v25 = 0;
        }
        id v8 = v40;
        uint64_t v24 = v42;

        goto LABEL_22;
      }
      id v25 = v24;
    }
    else
    {
      id v25 = 0;
    }
    id v8 = v40;
LABEL_22:

    goto LABEL_8;
  }
  id v16 = v16;
  id v25 = v16;
LABEL_8:

  uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v25;

  return *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

id __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke()
{
  id v0 = [NSString alloc];
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = +[HDMedicalUserDomainConceptEntity _recursiveSQLForMappedUDCs]();
  id v3 = (void *)[v0 initWithFormat:@"DELETE FROM %@ WHERE (%@ IN (%@) SELECT %@ FROM %@) AND %@ = ? LIMIT ?"], v1, @"udc_id", v2, @"udc_id", @"recursive_mapped_concepts", @"property_type");

  return v3;
}

+ (id)_recursiveSQLForMappedUDCs
{
  self;
  id v0 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v2 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v3 = (void *)MEMORY[0x1E4F1C978];
  v4 = HKWeakConceptLinkTypes();
  sqlite3_int64 v5 = objc_msgSend(v3, "hk_arrayWithCount:generator:", objc_msgSend(v4, "count"), &__block_literal_global_341_0);
  id v6 = [v5 componentsJoinedByString:@", "];

  objc_msgSend(NSString, "stringWithFormat:", CFSTR("WITH RECURSIVE %@(%@, %@) AS (SELECT %@, %@ FROM %@ INNER JOIN %@ USING(%@) UNION SELECT %@.%@, %@.%@ FROM %@ INNER JOIN %@ USING (%@) INNER JOIN %@ ON %@.%@ = %@ WHERE %@ NOT IN (%@) UNION SELECT %@.%@, %@.%@ FROM %@ INNER JOIN %@ ON %@ = %@.%@ INNER JOIN %@ ON %@.%@ = %@.%@ WHERE %@ NOT IN (%@)"), CFSTR("recursive_mapped_concepts"), CFSTR("udc_id"), CFSTR("uuid"), CFSTR("udc_id"), CFSTR("uuid"), v0, v1, CFSTR("udc_id"), v0, CFSTR("udc_id"), v0, CFSTR("uuid"), v0, v2, CFSTR("udc_id"), CFSTR("recursive_mapped_concepts"),
    @"recursive_mapped_concepts",
    @"uuid",
    @"target_uuid",
    @"link_type",
    v6,
    v0,
    @"udc_id",
    v0,
    @"uuid",
    v0,
    v2,
    @"target_uuid",
    v0,
    @"uuid",
    @"recursive_mapped_concepts",
    @"recursive_mapped_concepts",
    @"udc_id",
    v2,
    @"udc_id",
    @"link_type",
  uint64_t v7 = v6);

  return v7;
}

uint64_t __107__HDMedicalUserDomainConceptEntity__clearPendingPruneDateForMappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v7 = 1;
  +[HDMedicalUserDomainConceptEntity _bindRecursiveMappedUDCStatement:bindingIndex:](*(void *)(a1 + 32), (uint64_t)a2, &v7);
  int v4 = v7 + 1;
  sqlite3_bind_int64(a2, v7, 1);
  sqlite3_int64 v5 = *(void *)(a1 + 40);

  return sqlite3_bind_int64(a2, v4, v5);
}

+ (void)_bindRecursiveMappedUDCStatement:(_DWORD *)a3 bindingIndex:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self;
  char v4 = 1;
  do
  {
    char v5 = v4;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = HKWeakConceptLinkTypes();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          HDSQLiteBindFoundationValueToStatement();
          ++*a3;
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    char v4 = 0;
  }
  while ((v5 & 1) != 0);
}

id __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke()
{
  id v0 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v2 = [NSString alloc];
  id v3 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  char v4 = +[HDMedicalUserDomainConceptEntity _recursiveSQLForMappedUDCs]();
  char v5 = (void *)[v2 initWithFormat:@"SELECT %@, %@ FROM %@ INNER JOIN %@ USING(%@) INNER JOIN %@ USING(%@) WHERE NOT EXISTS (%@) SELECT 1 FROM %@ WHERE %@.%@ = %@.%@ AND property_type = ? AND date_value <= ? LIMIT ?"], @"uuid", @"creation_date", v0, v3, @"udc_id", v1, @"udc_id", v4, @"recursive_mapped_concepts", @"recursive_mapped_concepts", @"udc_id", v0, @"udc_id");

  return v5;
}

uint64_t __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  int v9 = 1;
  +[HDMedicalUserDomainConceptEntity _bindRecursiveMappedUDCStatement:bindingIndex:](*(void *)(a1 + 40), (uint64_t)a2, &v9);
  int v4 = v9;
  int v5 = v9 + 1;
  sqlite3_bind_int64(a2, v9, 1);
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(a2, v5, v6);
  sqlite3_int64 v7 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, v4 + 2, v7);
}

BOOL __105__HDMedicalUserDomainConceptEntity__tombstoneOldUnmappedUDCsWithProfile_transaction_nowDate_limit_error___block_invoke_3(void *a1, uint64_t a2, uint64_t a3)
{
  ++*(void *)(*(void *)(a1[6] + 8) + 24);
  double v6 = MEMORY[0x1C1879F90](a2, 0);
  MEMORY[0x1C1879F40](a2, 1);
  sqlite3_int64 v7 = objc_msgSend(MEMORY[0x1E4F2B630], "deletedUserDomainConceptWithUUID:creationTimestamp:", v6);
  BOOL v8 = +[HDUserDomainConceptEntity storeUserDomainConcept:v7 method:3 profile:a1[4] transaction:a1[5] error:a3] != 0;

  return v8;
}

id __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke()
{
  id v0 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  v1 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
  id v5 = [NSString alloc];
  id v2 = +[HDMedicalUserDomainConceptEntity _recursiveSQLForMappedUDCs]();
  id v3 = (void *)[v5 initWithFormat:@"INSERT OR REPLACE INTO %@ (%@, %@, %@, %@, %@, %@, %@) SELECT %@, ?, ?, ?, ?, ?, ? FROM %@ WHERE (NOT EXISTS (%@) SELECT 1 FROM %@ WHERE %@.%@ = %@.%@) AND NOT EXISTS (SELECT 1 FROM %@ WHERE(%@.%@ = %@.%@ AND %@ = ?)) LIMIT ?"], v1, @"udc_id", @"category", @"property_type", @"version", @"timestamp", @"value_type", @"date_value", @"udc_id", v0, v2, @"recursive_mapped_concepts", v0, @"udc_id", @"recursive_mapped_concepts", @"udc_id",
                 v1,
                 v0,
                 @"udc_id",
                 v1,
                 @"udc_id",
                 @"property_type");

  return v3;
}

uint64_t __92__HDMedicalUserDomainConceptEntity__markNewUnmappedUDCsWithTransaction_nowDate_limit_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  double v5 = v4;
  sqlite3_bind_int64(a2, 1, 2);
  sqlite3_bind_int64(a2, 2, 1);
  sqlite3_bind_int64(a2, 3, 0);
  sqlite3_bind_double(a2, 4, v5);
  sqlite3_bind_int64(a2, 5, 5);
  int v9 = 7;
  sqlite3_bind_double(a2, 6, v5 + 2592000.0);
  +[HDMedicalUserDomainConceptEntity _bindRecursiveMappedUDCStatement:bindingIndex:](*(void *)(a1 + 40), (uint64_t)a2, &v9);
  int v6 = v9 + 1;
  sqlite3_bind_int64(a2, v9, 1);
  sqlite3_int64 v7 = *(void *)(a1 + 48);

  return sqlite3_bind_int64(a2, v6, v7);
}

__CFString *__62__HDMedicalUserDomainConceptEntity__recursiveSQLForMappedUDCs__block_invoke()
{
  return @"?";
}

@end