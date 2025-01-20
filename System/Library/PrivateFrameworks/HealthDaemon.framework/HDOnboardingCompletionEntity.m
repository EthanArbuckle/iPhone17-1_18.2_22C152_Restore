@interface HDOnboardingCompletionEntity
+ (BOOL)deleteAllCompletionsForFeatureIdentifier:(id)a3 syncIdentity:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)enumerateAllOnboardingCompletionsWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_insertEntityWithUUID:(void *)a3 featureIdentifier:(uint64_t)a4 version:(void *)a5 completionDate:(void *)a6 countryCode:(uint64_t)a7 countryCodeProvenance:(void *)a8 modificationDate:(char)a9 deleted:(uint64_t)a10 syncProvenance:(uint64_t)a11 syncIdentity:(void *)a12 transaction:(uint64_t)a13 error:;
+ (id)_onboardingCompletionsForHighestVersion:(void *)a3 featureIdentifier:(void *)a4 transaction:(uint64_t)a5 error:;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)insertCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)insertOnboardingCompletion:(id)a3 syncIdentity:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (id)onboardingCompletionsForHighestVersionOfFeatureIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)onboardingCompletionsForLowestVersionOfFeatureIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (int64_t)protectionClass;
- (id)onboardingCompletionWithTransaction:(id)a3 error:(id *)a4;
@end

@implementation HDOnboardingCompletionEntity

+ (id)onboardingCompletionsForHighestVersionOfFeatureIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDOnboardingCompletionEntity _onboardingCompletionsForHighestVersion:featureIdentifier:transaction:error:]((uint64_t)a1, 1, a3, a4, (uint64_t)a5);
}

+ (id)_onboardingCompletionsForHighestVersion:(void *)a3 featureIdentifier:(void *)a4 transaction:(uint64_t)a5 error:
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  self;
  uint64_t v9 = a2 ^ 1u;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"feature_identifier" value:v8 comparisonType:1];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __108__HDOnboardingCompletionEntity__onboardingCompletionsForHighestVersion_featureIdentifier_transaction_error___block_invoke;
  v32[3] = &unk_1E62FF0C0;
  id v29 = v10;
  id v33 = v29;
  id v12 = v7;
  id v13 = v11;
  v14 = v32;
  v15 = @"version";
  v16 = self;
  v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" value:MEMORY[0x1E4F1CC28] comparisonType:1];
  if (v13)
  {
    uint64_t v18 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v17 otherPredicate:v13];

    v17 = (void *)v18;
  }
  v19 = objc_msgSend(v12, "databaseForEntityClass:", v16, v29);
  v20 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"version" entityClass:v16 ascending:v9];

  v37[0] = v20;
  v21 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:v16 ascending:v9];
  v37[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v23 = [v16 queryWithDatabase:v19 predicate:v17 limit:0 orderingTerms:v22 groupBy:0];

  v24 = HDOnboardingCompletionEntityAllProperties();
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __150__HDOnboardingCompletionEntity__enumerateAllOnboardingCompletionModelsWithTransaction_predicate_orderedByProperty_ascending_error_enumerationHandler___block_invoke;
  v34[3] = &unk_1E62F87F8;
  id v35 = v14;
  v36 = v16;
  v25 = v14;
  int v26 = [v23 enumerateProperties:v24 error:a5 enumerationHandler:v34];

  v27 = 0;
  if (v26) {
    v27 = (void *)[v30 copy];
  }

  return v27;
}

+ (id)onboardingCompletionsForLowestVersionOfFeatureIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDOnboardingCompletionEntity _onboardingCompletionsForHighestVersion:featureIdentifier:transaction:error:]((uint64_t)a1, 0, a3, a4, (uint64_t)a5);
}

uint64_t __108__HDOnboardingCompletionEntity__onboardingCompletionsForHighestVersion_featureIdentifier_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) lastObject];
  if (v4 && (uint64_t v5 = [v3 version], v5 != objc_msgSend(v4, "version")))
  {
    uint64_t v6 = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t __150__HDOnboardingCompletionEntity__enumerateAllOnboardingCompletionModelsWithTransaction_predicate_orderedByProperty_ascending_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  v4 = _OnboardingCompletionFromRow(a3, (uint64_t)&v10);
  id v5 = v10;
  if (v4)
  {
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    id v7 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpectedly unable to load onboarding completion: %{public}@", buf, 0x16u);
    }
    uint64_t v6 = 1;
  }

  return v6;
}

+ (BOOL)enumerateAllOnboardingCompletionsWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a4;
  uint64_t v12 = [a3 databaseForEntityClass:a1];
  uint64_t v13 = *MEMORY[0x1E4F65C70];
  id v14 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:*MEMORY[0x1E4F65C70] entityClass:a1 ascending:1];
  v23[0] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  v16 = [a1 queryWithDatabase:v12 predicate:v11 limit:0 orderingTerms:v15 groupBy:0];

  v17 = HDOnboardingCompletionEntityAllProperties();
  uint64_t v18 = [v17 arrayByAddingObject:v13];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __116__HDOnboardingCompletionEntity_enumerateAllOnboardingCompletionsWithTransaction_predicate_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E62F4138;
  id v22 = v10;
  id v19 = v10;
  LOBYTE(a5) = [v16 enumerateProperties:v18 error:a5 enumerationHandler:v21];

  return (char)a5;
}

uint64_t __116__HDOnboardingCompletionEntity_enumerateAllOnboardingCompletionsWithTransaction_predicate_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsInt64();
  id v7 = _OnboardingCompletionFromRow(a3, a4);
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v8;
}

+ (id)insertOnboardingCompletion:(id)a3 syncIdentity:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  v54[4] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = v10;
  id v13 = v11;
  id v14 = self;
  uint64_t v15 = [v12 countryCode];
  if (v15 && (v16 = (void *)v15, uint64_t v17 = [v12 countryCodeProvenance], v16, !v17))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a6, 3, @"Country code provenance must be set when saving a country code");
  }
  else
  {
    int64_t v48 = a4;
    id v49 = a1;
    id v50 = v12;
    v51 = a6;
    id v18 = v12;
    [v18 featureIdentifier];
    id v19 = v52 = v13;
    uint64_t v20 = [v18 version];
    v21 = [v18 countryCode];
    uint64_t v22 = [v18 countryCodeProvenance];

    v23 = (void *)MEMORY[0x1E4F65D08];
    v24 = (void *)MEMORY[0x1E4F65D00];
    id v25 = v21;
    int v26 = [v24 predicateWithProperty:@"feature_identifier" value:v19 comparisonType:1];
    v54[0] = v26;
    v27 = (void *)MEMORY[0x1E4F65D00];
    v28 = [NSNumber numberWithInteger:v20];
    id v29 = [v27 predicateWithProperty:@"version" value:v28 comparisonType:1];

    v54[1] = v29;
    v30 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"country_code" value:v25 comparisonType:1];

    v54[2] = v30;
    v31 = (void *)MEMORY[0x1E4F65D00];
    v32 = [NSNumber numberWithInteger:v22];
    id v33 = [v31 predicateWithProperty:@"country_code_provenance" value:v32 comparisonType:1];

    v54[3] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:4];
    id v35 = [v23 predicateMatchingAllPredicates:v34];

    id v13 = v52;
    v36 = [v52 databaseForEntityClass:v14];
    id v53 = 0;
    v37 = [v14 anyInDatabase:v36 predicate:v35 error:&v53];
    id v38 = v53;

    if (v37 || !v38)
    {
      if (!v37)
      {

        v39 = [v18 UUID];
        v40 = [v18 featureIdentifier];
        uint64_t v41 = [v18 version];
        v42 = [v18 completionDate];
        v43 = [v18 countryCode];
        uint64_t v44 = [v18 countryCodeProvenance];
        v45 = [MEMORY[0x1E4F1C9C8] date];
        v46 = +[HDOnboardingCompletionEntity _insertEntityWithUUID:featureIdentifier:version:completionDate:countryCode:countryCodeProvenance:modificationDate:deleted:syncProvenance:syncIdentity:transaction:error:]((uint64_t)v49, v39, v40, v41, v42, v43, v44, v45, 0, 0, v48, v52, (uint64_t)v51);

        id v12 = v50;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", v51, 115, @"The user has already completed onboarding for this feature, version, and country");
    }
    else if (v51)
    {
      id *v51 = v38;
    }
    else
    {
      _HKLogDroppedError();
    }
    id v12 = v50;
  }
  v46 = 0;
LABEL_14:

  return v46;
}

+ (id)_insertEntityWithUUID:(void *)a3 featureIdentifier:(uint64_t)a4 version:(void *)a5 completionDate:(void *)a6 countryCode:(uint64_t)a7 countryCodeProvenance:(void *)a8 modificationDate:(char)a9 deleted:(uint64_t)a10 syncProvenance:(uint64_t)a11 syncIdentity:(void *)a12 transaction:(uint64_t)a13 error:
{
  id v17 = a2;
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a12;
  v23 = self;
  v24 = [v22 databaseForEntityClass:v23];

  id v25 = HDOnboardingCompletionEntityAllProperties();
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __200__HDOnboardingCompletionEntity__insertEntityWithUUID_featureIdentifier_version_completionDate_countryCode_countryCodeProvenance_modificationDate_deleted_syncProvenance_syncIdentity_transaction_error___block_invoke;
  v35[3] = &unk_1E62FF0E8;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v39 = v20;
  id v40 = v21;
  uint64_t v41 = a4;
  char v45 = a9;
  uint64_t v42 = a7;
  uint64_t v43 = a10;
  uint64_t v44 = a11;
  id v26 = v21;
  id v27 = v20;
  id v28 = v19;
  id v29 = v18;
  id v30 = v17;
  v31 = [v23 insertOrReplaceEntity:1 database:v24 properties:v25 error:a13 bindingHandler:v35];

  return v31;
}

+ (id)insertCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v72 = a6;
  v62 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v82 objects:v90 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v83;
    v63 = v12;
    id v64 = v11;
    v78 = a7;
    uint64_t v66 = *(void *)v83;
LABEL_3:
    uint64_t v16 = 0;
    uint64_t v73 = v14;
    while (1)
    {
      if (*(void *)v83 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v82 + 1) + 8 * v16);
      id v81 = 0;
      char v18 = [v17 isValidWithError:&v81];
      id v19 = v81;
      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        id v30 = *MEMORY[0x1E4F29F18];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          id v87 = a1;
          __int16 v88 = 2114;
          id v89 = v19;
          _os_log_error_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Skipping invalid codable: %{public}@", buf, 0x16u);
        }
        goto LABEL_34;
      }
      id v20 = [v11 syncIdentityManager];
      id v21 = [v20 legacySyncIdentity];

      if ([v17 hasSyncIdentity])
      {
        id v22 = [v17 syncIdentity];
        id v80 = v19;
        id v23 = +[HDSyncIdentity syncIdentityWithCodable:v22 error:&v80];
        id v24 = v80;
        id v25 = v19;
        id v19 = v24;

        if (!v23)
        {
          _HKInitializeLogging();
          v55 = *MEMORY[0x1E4F29F18];
          uint64_t v14 = v73;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v87 = v19;
            _os_log_fault_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          id v23 = 0;
          goto LABEL_32;
        }
        id v26 = [v11 syncIdentityManager];
        id v79 = v19;
        uint64_t v27 = [v26 concreteIdentityForIdentity:v23 shouldCreate:1 transaction:v72 error:&v79];
        id v28 = v79;

        if (!v27)
        {
          _HKInitializeLogging();
          v56 = *MEMORY[0x1E4F29F18];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v87 = v28;
            _os_log_fault_impl(&dword_1BCB7D000, v56, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          id v21 = 0;
          id v19 = v28;
          uint64_t v15 = v66;
          uint64_t v14 = v73;
          a7 = v78;
          id v11 = v64;
          goto LABEL_32;
        }

        id v21 = (void *)v27;
        id v19 = v28;
        a7 = v78;
        id v29 = v64;
      }
      else
      {
        id v29 = v11;
      }
      v76 = v21;
      v31 = [v21 entity];
      uint64_t v75 = [v31 persistentID];
      id v32 = v17;
      id v33 = v72;
      uint64_t v34 = self;
      LODWORD(v35) = [v32 deleted];
      uint64_t v36 = [v32 decodedUUID];
      id v37 = (void *)v36;
      v77 = v19;
      if (v36)
      {
        v70 = (void *)v36;
        v71 = v31;
        v67 = v33;
        uint64_t v68 = v34;
        if (v35)
        {
          id v38 = v33;
          char v39 = v35;
          id v40 = v37;
          uint64_t v41 = self;
          uint64_t v42 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" value:v40 comparisonType:1];

          uint64_t v35 = [v38 databaseForEntityClass:v41];
          uint64_t v43 = v78;
          uint64_t v44 = [v41 anyInDatabase:v35 predicate:v42 error:v78];

          LOBYTE(v35) = v39;
          char v45 = [v44 onboardingCompletionWithTransaction:v38 error:v78];

          id v69 = [v45 featureIdentifier];

          v74 = &stru_1F1728D60;
        }
        else
        {
          int64_t v48 = [v32 featureIdentifier];
          id v69 = (id)[v48 copy];

          v74 = [v32 featureIdentifier];
          uint64_t v43 = v78;
        }
        uint64_t v49 = [v32 version];
        id v50 = [v32 decodedCompletionDate];
        v51 = [v32 countryCode];
        uint64_t v52 = [v32 countryCodeProvenance];
        id v53 = [v32 decodedModificationDate];
        uint64_t v60 = (uint64_t)v43;
        id v33 = v67;
        v54 = +[HDOnboardingCompletionEntity _insertEntityWithUUID:featureIdentifier:version:completionDate:countryCode:countryCodeProvenance:modificationDate:deleted:syncProvenance:syncIdentity:transaction:error:](v68, v70, v74, v49, v50, v51, v52, v53, v35, a4, v75, v67, v60);

        if ((v35 & 1) == 0) {
        BOOL v47 = v54 != 0;
        }

        id v11 = v64;
        uint64_t v15 = v66;
        uint64_t v14 = v73;
        v31 = v71;
        id v37 = v70;
        v46 = v69;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"Cannot insert codable without UUID");
        v46 = 0;
        BOOL v47 = 0;
        id v11 = v29;
        uint64_t v15 = v66;
        uint64_t v14 = v73;
      }

      id v23 = v46;
      if (!v47)
      {

        id v12 = v63;
        v58 = 0;
        v57 = v62;
        goto LABEL_38;
      }
      id v12 = v63;
      id v21 = v76;
      if (v23)
      {
        [v62 addObject:v23];
        id v19 = v77;
        a7 = v78;
LABEL_32:

        goto LABEL_33;
      }
      id v19 = v77;
      a7 = v78;
LABEL_33:

LABEL_34:
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v82 objects:v90 count:16];
        if (v14) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v57 = v62;
  v58 = (void *)[v62 copy];
LABEL_38:

  return v58;
}

void __200__HDOnboardingCompletionEntity__insertEntityWithUUID_featureIdentifier_version_completionDate_countryCode_countryCodeProvenance_modificationDate_deleted_syncProvenance_syncIdentity_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879EF0](a2, @"uuid", *(void *)(a1 + 32));
  MEMORY[0x1C1879EC0](a2, @"feature_identifier", *(void *)(a1 + 40));
  MEMORY[0x1C1879E80](a2, @"version", *(void *)(a1 + 72));
  MEMORY[0x1C1879E40](a2, @"completion_date", *(void *)(a1 + 48));
  MEMORY[0x1C1879EC0](a2, @"country_code", *(void *)(a1 + 56));
  MEMORY[0x1C1879E80](a2, @"country_code_provenance", *(void *)(a1 + 80));
  MEMORY[0x1C1879E40](a2, @"mod_date", *(void *)(a1 + 64));
  MEMORY[0x1C1879E20](a2, @"deleted", *(unsigned __int8 *)(a1 + 104));
  MEMORY[0x1C1879E80](a2, @"sync_provenance", *(void *)(a1 + 88));

  JUMPOUT(0x1C1879E80);
}

+ (BOOL)deleteAllCompletionsForFeatureIdentifier:(id)a3 syncIdentity:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"feature_identifier" equalToValue:a3];
  id v11 = [v9 databaseForEntityClass:a1];
  id v12 = [a1 queryWithDatabase:v11 predicate:v10];

  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = @"uuid";
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __104__HDOnboardingCompletionEntity_deleteAllCompletionsForFeatureIdentifier_syncIdentity_transaction_error___block_invoke;
  void v37[3] = &unk_1E62FE2E0;
  id v15 = v13;
  id v38 = v15;
  uint64_t v36 = a6;
  LODWORD(v13) = [v12 enumerateProperties:v14 error:a6 enumerationHandler:v37];

  if (v13)
  {
    id v16 = v15;
    id v34 = v9;
    self;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v16;
    uint64_t v17 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    BOOL v18 = 1;
    if (v17)
    {
      uint64_t v19 = v17;
      id v30 = v12;
      v31 = v10;
      id v32 = v9;
      uint64_t v20 = *(void *)v40;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v40 != v20) {
            objc_enumerationMutation(obj);
          }
          id v22 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v23 = v34;
          id v24 = v22;
          uint64_t v25 = self;
          id v26 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
          uint64_t v27 = [MEMORY[0x1E4F1C9C8] date];
          id v28 = +[HDOnboardingCompletionEntity _insertEntityWithUUID:featureIdentifier:version:completionDate:countryCode:countryCodeProvenance:modificationDate:deleted:syncProvenance:syncIdentity:transaction:error:](v25, v24, &stru_1F1728D60, 0, v26, 0, 0, v27, 1, 0, a4, v23, (uint64_t)v36);

          if (!v28)
          {
            BOOL v18 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v19) {
          continue;
        }
        break;
      }
      BOOL v18 = 1;
LABEL_13:
      id v10 = v31;
      id v9 = v32;
      id v12 = v30;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

uint64_t __104__HDOnboardingCompletionEntity_deleteAllCompletionsForFeatureIdentifier_syncIdentity_transaction_error___block_invoke(uint64_t a1)
{
  v2 = HDSQLiteColumnWithNameAsUUID();
  [*(id *)(a1 + 32) addObject:v2];

  return 1;
}

- (id)onboardingCompletionWithTransaction:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__84;
  uint64_t v17 = __Block_byref_object_dispose__84;
  id v18 = 0;
  id v7 = HDOnboardingCompletionEntityAllProperties();
  uint64_t v8 = [v6 databaseForEntity:self];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__HDOnboardingCompletionEntity_onboardingCompletionWithTransaction_error___block_invoke;
  v12[3] = &unk_1E62F8848;
  v12[4] = &v13;
  LODWORD(a4) = [(HDSQLiteEntity *)self getValuesForProperties:v7 database:v8 error:a4 handler:v12];

  if (a4) {
    id v9 = (void *)v14[5];
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __74__HDOnboardingCompletionEntity_onboardingCompletionWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = _OnboardingCompletionFromRow(a3, 0);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [(HDEntityEncoder *)[HDOnboardingCompletionEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)databaseTable
{
  return @"onboarding_completions";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_47;
}

@end