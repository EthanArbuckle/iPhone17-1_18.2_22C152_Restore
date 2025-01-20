@interface HDUserDomainConceptEntity
+ (BOOL)_removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:(void *)a3 transaction:(uint64_t)a4 error:;
+ (BOOL)deleteUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)encodesCodableUserDomainConceptSubclassData;
+ (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9;
+ (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7;
+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertPrivateDataEnitiesForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)retrievePrivateDataEntitiesForUserDomainConcept:(id)a3 persistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)supportsHidingSemanticDuplicates;
+ (BOOL)supportsSyncStore:(id)a3;
+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)updateLinksTargetingUserDomainConceptUUID:(id)a3 toTargetUserDomainConceptUUID:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (BOOL)updatePrivateDataEnitiesForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8;
+ (Class)userDomainConceptClass;
+ (Class)userDomainConceptSemanticIdentifierClass;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_linkCollectionToPersistGivenLinkCollection:(void *)a3 transaction:(uint64_t)a4 error:;
+ (id)_userDomainConceptWithPersistentID:(void *)a3 encoder:(void *)a4 transaction:(void *)a5 error:;
+ (id)createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:(id)a3 additionalProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)databaseTable;
+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (id)defaultForeignKey;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)ignoreHiddenConceptsPredicate;
+ (id)joinClausesForProperty:(id)a3;
+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4;
+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3;
+ (id)predicateMatchingSemanticIdentifier:(id)a3;
+ (id)privateDataEntities;
+ (id)privateSubEntities;
+ (id)propertyForSyncAnchor;
+ (id)propertyForSyncIdentity;
+ (id)propertyForSyncProvenance;
+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (int64_t)evaluateIsCanonicalConcept:(id)a3 entityClass:(Class)a4 transaction:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (int64_t)storeUserDomainConcept:(id)a3 method:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7;
+ (int64_t)storeUserDomainConcept:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7 profile:(id)a8 transaction:(id)a9 error:(id *)a10;
+ (uint64_t)_enumerateLinkCollectionsContainingTargetUUID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:;
+ (uint64_t)_inflateLinkCollection:(uint64_t)a3 row:(uint64_t)a4 error:;
+ (uint64_t)_storeUserDomainConcept:(uint64_t)a3 method:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 syncVersion:(void *)a7 profile:(void *)a8 transaction:(void *)a9 error:;
+ (uint64_t)_updateLinkCollection:(uint64_t)a3 userDomainConceptID:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(void *)a6 transaction:(uint64_t)a7 error:;
+ (uint64_t)_updateLinkCollectionDataByRemovingTargetUUID:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 transaction:(uint64_t)a6 error:;
+ (void)_bindToStatement:(int)a3 index:(void *)a4 linkCollection:;
+ (void)_notifyObserversForUserDomainConcept:(int)a3 update:(void *)a4 profile:(void *)a5 transaction:;
@end

@implementation HDUserDomainConceptEntity

+ (id)databaseTable
{
  return @"user_domain_concepts";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 15;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_93;
}

+ (id)privateSubEntities
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];

  return v2;
}

+ (id)joinClausesForProperty:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 containsString:@"||"])
  {
    id v5 = 0;
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v6 = +[HDUserDomainConceptEntityRegistry sharedInstance];
    v7 = [v6 registeredUserDomainConceptEntityClasses];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      v10 = &selRef_startFakingWithHKWorkoutActivityType_;
      uint64_t v11 = *(void *)v50;
      v39 = v7;
      id v40 = v4;
      id v38 = a1;
      uint64_t v42 = *(void *)v50;
LABEL_5:
      uint64_t v12 = 0;
      v37 = v10[411];
      uint64_t v41 = v9;
      while (1)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(id *)(*((void *)&v49 + 1) + 8 * v12);
        if ([v13 hasColumnWithName:v4]) {
          break;
        }
        if ([v4 rangeOfString:@"."] != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v46 = v12;
          id v14 = v4;
          uint64_t v15 = self;
          v16 = [v14 componentsSeparatedByString:@"."];
          if ([v16 count] != 2)
          {
            v31 = [MEMORY[0x1E4F28B00] currentHandler];
            [v31 handleFailureInMethod:v37, v15, @"HDUserDomainConceptEntity.m", 193, @"Invalid parameter not satisfying: %@", @"[components count] == 2" object file lineNumber description];

            uint64_t v9 = v41;
          }
          v17 = [v16 firstObject];
          v45 = v16;
          v47 = [v16 lastObject];
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v44 = v13;
          v18 = [v13 privateSubEntities];
          id v5 = (id)[v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
          if (v5)
          {
            v43 = (void *)v15;
            uint64_t v19 = *(void *)v54;
            while (2)
            {
              for (i = 0; i != v5; i = (char *)i + 1)
              {
                if (*(void *)v54 != v19) {
                  objc_enumerationMutation(v18);
                }
                v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
                v22 = [v21 joinClausesForProperty:v14];
                v23 = [v21 databaseTable];
                if ([v23 isEqualToString:v17]) {
                  char v24 = [v21 hasColumnWithName:v47];
                }
                else {
                  char v24 = 0;
                }

                if ((v24 & 1) != 0 || v22)
                {
                  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
                  if (v43 != v44)
                  {
                    v25 = (void *)MEMORY[0x1E4F65D38];
                    v26 = [v43 disambiguatedDatabaseTable];
                    v27 = [v25 leftJoinClauseFromTable:v26 toTargetEntity:v44 as:0 localReference:@"udc_id" targetKey:@"udc_id"];

                    [v5 addObject:v27];
                  }
                  v7 = v39;
                  if ([v21 hasColumnWithName:@"udc_id"])
                  {
                    v28 = (void *)MEMORY[0x1E4F65D38];
                    v29 = [v44 disambiguatedDatabaseTable];
                    v30 = [v28 leftJoinClauseFromTable:v29 toTargetEntity:v21 as:0 localReference:@"udc_id" targetKey:@"udc_id"];

                    [v5 addObject:v30];
                  }
                  [v5 unionSet:v22];

                  id v4 = v40;
                  a1 = v38;
                  goto LABEL_30;
                }
              }
              id v5 = (id)[v18 countByEnumeratingWithState:&v53 objects:v58 count:16];
              if (v5) {
                continue;
              }
              break;
            }
            v7 = v39;
            id v4 = v40;
            a1 = v38;
LABEL_30:
            uint64_t v9 = v41;
          }

          uint64_t v11 = v42;
          uint64_t v12 = v46;
          if (v5) {
            goto LABEL_41;
          }
        }
        if (++v12 == v9)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v49 objects:v57 count:16];
          v10 = &selRef_startFakingWithHKWorkoutActivityType_;
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_40;
        }
      }
      if (v13) {
        BOOL v32 = v13 == a1;
      }
      else {
        BOOL v32 = 1;
      }
      if (!v32)
      {
        v33 = (void *)MEMORY[0x1E4F65D38];
        v34 = [a1 disambiguatedDatabaseTable];
        v35 = [v33 leftJoinClauseFromTable:v34 toTargetEntity:v13 as:0 localReference:@"udc_id" targetKey:@"udc_id"];

        id v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v35];

LABEL_41:
        goto LABEL_42;
      }
    }
LABEL_40:

    v48.receiver = a1;
    v48.super_class = (Class)&OBJC_METACLASS___HDUserDomainConceptEntity;
    objc_msgSendSuper2(&v48, sel_joinClausesForProperty_, v4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_42:

  return v5;
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x1E4F65C70]])
  {
    id v5 = NSString;
    v6 = [a1 disambiguatedDatabaseTable];
    id v7 = [v5 stringWithFormat:@"%@.%@", v6, @"udc_id"];
  }
  else
  {
    id v8 = v4;
    self;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = +[HDUserDomainConceptEntityRegistry sharedInstance];
    v10 = [v9 registeredUserDomainConceptEntityClasses];

    id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 hasColumnWithName:v8])
          {
            id v11 = v14;
            goto LABEL_13;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    id v15 = v11;
    if (v15)
    {
      v16 = NSString;
      v17 = [v15 disambiguatedDatabaseTable];
      id v7 = [v16 stringWithFormat:@"%@.%@", v17, v8];
    }
    else
    {
      id v7 = v8;
    }
  }

  return v7;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)defaultForeignKey
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F65D20]) initWithEntityClass:a1 property:@"udc_id" deletionAction:2];

  return v2;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDEntityEncoder *)[_HDUserDomainConceptEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)propertyForSyncProvenance
{
  return @"sync_provenance";
}

+ (id)propertyForSyncAnchor
{
  return @"sync_anchor";
}

+ (id)propertyForSyncIdentity
{
  return @"sync_identity";
}

+ (int64_t)storeUserDomainConcept:(id)a3 method:(int64_t)a4 syncProvenance:(int64_t)a5 syncIdentity:(int64_t)a6 syncVersion:(id)a7 profile:(id)a8 transaction:(id)a9 error:(id *)a10
{
  return +[HDUserDomainConceptEntity _storeUserDomainConcept:method:syncProvenance:syncIdentity:syncVersion:profile:transaction:error:]((uint64_t)a1, a3, a4, a5, a6, *(void *)&a7, a8, a9, a10);
}

+ (uint64_t)_storeUserDomainConcept:(uint64_t)a3 method:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(uint64_t)a6 syncVersion:(void *)a7 profile:(void *)a8 transaction:(void *)a9 error:
{
  uint64_t v234 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = self;
  uint64_t v205 = a5;
  objc_msgSend(v14, "setHealthd_use_only_syncEntityIdentity:", a5);
  id v214 = 0;
  id v18 = v14;
  id v211 = v15;
  id v19 = v16;
  uint64_t v200 = v17;
  long long v20 = self;
  id v21 = v18;
  id v212 = v19;
  uint64_t v22 = self;
  v213 = v21;
  v23 = [v21 linkCollection];
  if (v23)
  {
    uint64_t v24 = +[HDUserDomainConceptEntity _linkCollectionToPersistGivenLinkCollection:transaction:error:](v22, v23, v212, (uint64_t)&v214);

    if (!v24)
    {
      v25 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }
  v26 = [v212 protectedDatabase];
  *(void *)&long long v220 = MEMORY[0x1E4F143A8];
  *((void *)&v220 + 1) = 3221225472;
  *(void *)&long long v221 = __104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke;
  *((void *)&v221 + 1) = &__block_descriptor_40_e15___NSString_8__0l;
  *(void *)&long long v222 = v22;
  *(void *)buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke_2;
  v230 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630BC00;
  id v27 = v213;
  *(void *)v231 = v27;
  *(void *)&v231[16] = a4;
  *(void *)&v231[24] = v205;
  uint64_t v232 = v22;
  id v28 = v24;
  *(void *)&v231[8] = v28;
  if (![v26 executeCachedStatementForKey:&_insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error__statementKey error:&v214 SQLGenerator:&v220 bindingHandler:buf enumerationHandler:0])goto LABEL_9; {
  if ((int)[v26 getChangesCount] < 1)
  }
  {
    v29 = (void *)MEMORY[0x1E4F28C58];
    v30 = [v27 UUID];
    objc_msgSend(v29, "hk_assignError:code:format:", &v214, 115, @"Duplicate User Domain Concept with UUID %@", v30);

LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  v25 = [v26 lastInsertRowID];
LABEL_10:

LABEL_11:
  if (!v25) {
    goto LABEL_24;
  }
  if (![v213 isDeleted]
    || ([v213 UUID],
        v31 = objc_claimAutoreleasedReturnValue(),
        int v32 = +[HDUserDomainConceptEntity _updateLinkCollectionDataByRemovingTargetUUID:syncProvenance:syncIdentity:transaction:error:]((uint64_t)v20, v31, a4, v205, v212, (uint64_t)&v214), v31, v32))
  {
    uint64_t v33 = [v25 longLongValue];
    if ([v20 insertPrivateDataEnitiesForUserDomainConcept:v213 userDomainConceptID:v33 transaction:v212 error:&v214])
    {
      v34 = [v211 daemon];
      v35 = [v34 userDomainConceptEntityRegistry];
      v36 = [v213 identifier];
      v37 = (void *)[v35 userDomainConceptEntityClassForTypeIdentifier:v36];

      if (!v37 || v37 == objc_opt_class())
      {
        int v32 = 1;
        goto LABEL_25;
      }
      id v38 = v213;
      id v39 = v212;
      self;
      if (![v37 insertConcreteUserDomainConcept:v38 userDomainConceptID:v33 transaction:v39 error:&v214]|| !objc_msgSend(v37, "insertPrivateDataEnitiesForUserDomainConcept:userDomainConceptID:transaction:error:", v38, v33, v39, &v214))
      {
        goto LABEL_61;
      }
      if (![v37 supportsHidingSemanticDuplicates]) {
        goto LABEL_59;
      }
      id v40 = v38;
      id v41 = v39;
      uint64_t v42 = self;
      uint64_t v43 = [v42 evaluateIsCanonicalConcept:v40 entityClass:v37 transaction:v41 error:&v214];
      if (!v43) {
        goto LABEL_60;
      }
      if (v43 == 2)
      {
        v44 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:2 version:1 BOOLValue:1];
        BOOL v45 = +[HDUserDomainConceptPropertyEntity insertDeviceLocalProperty:v44 userDomainConceptID:v33 transaction:v41 error:&v214];

        if (!v45) {
          goto LABEL_61;
        }
LABEL_59:
        int v32 = 1;
LABEL_62:

        goto LABEL_25;
      }
      if (+[HDUserDomainConceptEntity _removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:transaction:error:]((uint64_t)v42, v33, v41, (uint64_t)&v214))
      {
        id v208 = v41;
        id v210 = v40;
        v80 = self;
        v81 = (void *)MEMORY[0x1E4F65D08];
        v82 = [v37 predicateMatchingSemanticDuplicatesOf:v210];

        v83 = [v80 ignoreHiddenConceptsPredicate];
        v202 = [v81 compoundPredicateWithPredicate:v82 otherPredicate:v83];

        id v198 = [v208 databaseForEntityClass:v80];
        id v84 = objc_alloc_init(MEMORY[0x1E4F65D68]);
        [v84 setEntityClass:v80];
        [v84 setPredicate:v202];
        [v84 setReturnsDistinctEntities:1];
        v85 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v198 descriptor:v84];
        v86 = (void *)[objc_alloc(MEMORY[0x1E4F2B638]) initWithType:2 version:1 BOOLValue:1];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __92__HDUserDomainConceptEntity__hideSemanticDuplicatesOfConcept_entityClass_transaction_error___block_invoke;
        v230 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E62FE248;
        *(void *)v231 = v86;
        *(void *)&v231[8] = v208;
        id v87 = v208;
        id v88 = v86;
        LODWORD(v208) = [v85 enumeratePersistentIDsAndProperties:MEMORY[0x1E4F1CBF0] error:&v214 enumerationHandler:buf];

        if (v208) {
          goto LABEL_59;
        }
      }
      else
      {
LABEL_60:
      }
LABEL_61:
      int v32 = 0;
      goto LABEL_62;
    }
LABEL_24:
    int v32 = 0;
  }
LABEL_25:

  id v46 = v214;
  v207 = v46;
  if (v32)
  {
    +[HDUserDomainConceptEntity _notifyObserversForUserDomainConcept:update:profile:transaction:](v200, v213, 0, v211, v212);
    uint64_t v47 = 1;
    goto LABEL_152;
  }
  char v48 = objc_msgSend(v46, "hk_isDuplicateObjectError");
  if (a3 == 1) {
    char v49 = 0;
  }
  else {
    char v49 = v48;
  }
  if ((v49 & 1) == 0)
  {
    id v59 = v207;
    v60 = v59;
    if (v59)
    {
      if (a9) {
        *a9 = v59;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v47 = 0;
    goto LABEL_152;
  }
  long long v50 = v213;
  if (a3 != 2) {
    goto LABEL_87;
  }
  long long v51 = v50;
  id v52 = v212;
  id v53 = v211;
  self;
  id v54 = [v51 UUID];
  id v201 = v53;
  id v55 = v52;
  long long v56 = self;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v230 = __Block_byref_object_copy__185;
  *(void *)v231 = __Block_byref_object_dispose__185;
  *(void *)&v231[8] = 0;
  v57 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" value:v54 comparisonType:1];
  *(void *)&long long v220 = MEMORY[0x1E4F143A8];
  *((void *)&v220 + 1) = 3221225472;
  *(void *)&long long v221 = __82__HDUserDomainConceptEntity__userDomainConceptWithUUID_profile_transaction_error___block_invoke;
  *((void *)&v221 + 1) = &unk_1E6307400;
  *(void *)&long long v222 = buf;
  if ([v56 enumerateUserDomainConceptsWithPredicate:v57 profile:v201 transaction:v55 error:a9 enumerationHandler:&v220])v58 = *(void **)(*(void *)&buf[8] + 40); {
  else
  }
    v58 = 0;
  id v61 = v58;

  _Block_object_dispose(buf, 8);
  v62 = v61;
  if (v61)
  {
    v197 = v51;
    id v63 = v61;
    id v195 = v55;
    uint64_t v64 = self;
    if ([v63 isDeleted])
    {
      v65 = (uint64_t (*)(uint64_t, uint64_t))v63;
      uint64_t v66 = 1;
LABEL_82:

      v62 = v61;
      goto LABEL_83;
    }
    if ([v197 isDeleted])
    {
      _HKInitializeLogging();
      v67 = HKLogHealthOntology();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544642;
        *(void *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v63;
        *(_WORD *)&buf[22] = 2114;
        v230 = v197;
        *(_WORD *)v231 = 2048;
        *(void *)&v231[2] = a4;
        *(_WORD *)&v231[10] = 2048;
        *(void *)&v231[12] = (int)a6;
        *(_WORD *)&v231[20] = 2048;
        *(void *)&v231[22] = a6 >> 32;
        _os_log_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@: replace %{public}@ with %{public}@. sync_provenance=%ld, syncVersion=(%ld, %ld)", buf, 0x3Eu);
      }

      v65 = v197;
      uint64_t v66 = 2;
      goto LABEL_82;
    }
    v68 = v197;
    id v69 = v63;
    uint64_t v183 = self;
    id v193 = v69;
    v189 = v68;
    [v189 modificationTimestamp];
    double v71 = v70;
    [v193 modificationTimestamp];
    if (v71 <= v72)
    {
      uint64_t v66 = 1;
      v191 = (uint64_t (*)(uint64_t, uint64_t))v193;
      v73 = v189;
    }
    else
    {

      v73 = v193;
      uint64_t v66 = 2;
      v191 = v189;
    }
    v187 = v73;
    if (SHIDWORD(a6) > 3)
    {
      v77 = (uint64_t (*)(uint64_t, uint64_t))[v191 copyUserDomainConceptByMergingInConcept:v73];
LABEL_75:
      v94 = v191;
      if (v77 != v191)
      {
        _HKInitializeLogging();
        v95 = HKLogHealthOntology();
        BOOL v96 = os_log_type_enabled(v95, OS_LOG_TYPE_INFO);

        if (v96)
        {
          v97 = HKLogHealthOntology();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v183;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v191;
            *(_WORD *)&buf[22] = 2114;
            v230 = v77;
            _os_log_impl(&dword_1BCB7D000, v97, OS_LOG_TYPE_INFO, "%{public}@: Update UDC %{public}@ -> %{public}@", buf, 0x20u);
          }
        }
        uint64_t v66 = 3;
        v94 = v77;
      }
      v65 = v94;

      goto LABEL_82;
    }
    obuint64_t j = v193;
    v185 = v191;
    id v74 = v73;
    v75 = v189;
    self;
    v76 = [v74 propertyCollection];

    v77 = (uint64_t (*)(uint64_t, uint64_t))[v185 copyUserDomainConceptByMergingInPropertyCollection:v76];
    if (v185 != v75)
    {
LABEL_74:

      goto LABEL_75;
    }
    v179 = [obj linkCollection];
    v78 = [v75 linkCollection];
    v177 = v78;
    if (v78)
    {
      v79 = [v78 links];
      v174 = [v179 collectionByMergingInLegacyArrayOfLinks:v79];
    }
    else
    {
      v174 = [v179 collectionByRemovingAllLinks];
    }
    v89 = v177;
    if (v179) {
      v89 = v174;
    }
    id v175 = v89;
    id v90 = [v77 linkCollection];
    if (v175 == v90)
    {
    }
    else
    {
      v91 = [v77 linkCollection];
      if (v91)
      {
        v92 = [v77 linkCollection];
        char v172 = [v175 isEqual:v92];

        if (v172) {
          goto LABEL_73;
        }
      }
      else
      {
      }
      v93 = [v77 modificationCopy];

      [v93 _setLinkCollection:v175];
      v77 = (uint64_t (*)(uint64_t, uint64_t))v93;
    }
LABEL_73:

    goto LABEL_74;
  }
  v65 = 0;
  uint64_t v66 = 1;
LABEL_83:

  long long v50 = v65;
  if (!v65)
  {
    uint64_t v47 = 0;
    goto LABEL_151;
  }
  if (v66 == 1)
  {
    uint64_t v47 = 3;
    goto LABEL_151;
  }
  if (v66 == 3)
  {
    uint64_t v205 = [v201 currentSyncIdentityPersistentID];
    a4 = 0;
    long long v50 = v65;
  }
LABEL_87:
  v98 = v50;
  id v99 = v211;
  id v100 = v212;
  v173 = self;
  v101 = v98;
  id v180 = v99;
  id v102 = v100;
  uint64_t v176 = self;
  v103 = v101;
  id v188 = v102;
  self;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v230 = __Block_byref_object_copy__185;
  *(void *)v231 = __Block_byref_object_dispose__185;
  *(void *)&v231[8] = 0;
  v104 = [v188 protectedDatabase];
  *(void *)&long long v220 = MEMORY[0x1E4F143A8];
  *((void *)&v220 + 1) = 3221225472;
  *(void *)&long long v221 = __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_2;
  *((void *)&v221 + 1) = &unk_1E62F43C8;
  *(void *)&long long v222 = v103;
  uint64_t v215 = MEMORY[0x1E4F143A8];
  uint64_t v216 = 3221225472;
  v217 = __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_3;
  v218 = &unk_1E62F3640;
  v219 = (void **)buf;
  id v199 = (id)v222;
  if ([v104 executeCachedStatementForKey:&_userDomainConceptIDForUserDomainConcept_transaction_error__statementKey error:a9 SQLGenerator:&__block_literal_global_471 bindingHandler:&v220 enumerationHandler:&v215])v105 = *(void **)(*(void *)&buf[8] + 40); {
  else
  }
    v105 = 0;
  id v178 = v105;

  _Block_object_dispose(buf, 8);
  if (!v178)
  {
    id v206 = 0;
    goto LABEL_135;
  }
  v106 = [v199 linkCollection];
  if (v106)
  {
    uint64_t v107 = +[HDUserDomainConceptEntity _linkCollectionToPersistGivenLinkCollection:transaction:error:](v176, v106, v188, (uint64_t)a9);

    if (!v107)
    {
      id v108 = 0;
      id v206 = 0;
      goto LABEL_134;
    }
  }
  else
  {
    uint64_t v107 = 0;
  }
  v168 = (void *)v107;
  if (![v199 isDeleted]) {
    goto LABEL_127;
  }
  uint64_t v196 = [v178 longLongValue];
  id v170 = v180;
  id v171 = v188;
  self;
  v184 = [v171 databaseForEntityClass:objc_opt_class()];
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  v109 = [v170 daemon];
  v110 = [v109 userDomainConceptEntityRegistry];
  id obja = [v110 registeredUserDomainConceptEntityClasses];

  uint64_t v190 = [obja countByEnumeratingWithState:&v220 objects:buf count:16];
  if (!v190) {
    goto LABEL_126;
  }
  uint64_t v186 = *(void *)v221;
  while (2)
  {
    for (uint64_t i = 0; i != v190; ++i)
    {
      if (*(void *)v221 != v186) {
        objc_enumerationMutation(obja);
      }
      v112 = *(objc_class **)(*((void *)&v220 + 1) + 8 * i);
      if (v112 != (objc_class *)objc_opt_class())
      {
        v113 = (void *)[[v112 alloc] initWithPersistentID:v196];
        if (![v113 existsInDatabase:v184])
        {
LABEL_123:

          continue;
        }
        id v203 = v171;
        id v192 = v170;
        uint64_t v114 = self;
        v115 = [(objc_class *)v112 entityEncoderForProfile:v192 transaction:v203 purpose:1 encodingOptions:0 authorizationFilter:0];

        v116 = +[HDUserDomainConceptEntity _userDomainConceptWithPersistentID:encoder:transaction:error:](v114, v196, v115, v203, a9);

        if (v116)
        {
          [(objc_class *)v112 userDomainConceptClass];
          if (objc_opt_isKindOfClass())
          {
            id v194 = v116;
            goto LABEL_110;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a9, 3, @"Concept of class %@ should not be inflated for entity %@", objc_opt_class(), v112);
        }
        id v194 = 0;
LABEL_110:

        if (!v194
          || ![(objc_class *)v112 willDeleteConcreteUserDomainConcept:v194 userDomainConceptID:v196 syncProvenance:a4 profile:v192 transaction:v203 error:a9])
        {
LABEL_132:

          goto LABEL_133;
        }
        if ([(objc_class *)v112 supportsHidingSemanticDuplicates])
        {
          id v169 = v194;
          id v117 = v203;
          self;
          id v118 = v117;
          self;
          v224 = 0;
          v225 = &v224;
          uint64_t v226 = 0x2020000000;
          char v227 = 0;
          v119 = HDUserDomainConceptPropertyEntityPredicateForPropertiesWithType(2, 1);
          v120 = (void *)MEMORY[0x1E4F65D00];
          v121 = [NSNumber numberWithLongLong:v196];
          v122 = [v120 predicateWithProperty:@"udc_id" equalToValue:v121];

          v123 = [MEMORY[0x1E4F65D08] compoundPredicateWithPredicate:v122 otherPredicate:v119];
          v228 = @"number_value";
          v124 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v228 count:1];
          v125 = [v118 database];
          uint64_t v215 = MEMORY[0x1E4F143A8];
          uint64_t v216 = 3221225472;
          v217 = __95__HDUserDomainConceptEntity__isConceptHiddenFromEnumerationWithPersistentID_transaction_error___block_invoke;
          v218 = &unk_1E630BBB0;
          v219 = &v224;
          BOOL v126 = +[HDHealthEntity enumerateProperties:v124 withPredicate:v123 healthDatabase:v125 error:a9 enumerationHandler:&v215];

          if (v126)
          {
            if (*((unsigned char *)v225 + 24)) {
              uint64_t v127 = 1;
            }
            else {
              uint64_t v127 = 2;
            }
          }
          else
          {
            uint64_t v127 = 0;
          }

          _Block_object_dispose(&v224, 8);
          if (v127 == 2)
          {
            id v128 = v118;
            id v129 = v169;
            self;
            v130 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
            v131 = (void *)MEMORY[0x1E4F65D08];
            v132 = [(objc_class *)v112 predicateMatchingSemanticDuplicatesOf:v129];

            v224 = v132;
            v225 = v130;
            v133 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v224 count:2];
            v134 = [v131 predicateMatchingAllPredicates:v133];

            v135 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"creation_date" entityClass:objc_opt_class() ascending:1];
            uint64_t v136 = [v128 protectedDatabase];
            v228 = v135;
            v137 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v228 count:1];
            v138 = +[HDSQLiteEntity queryWithDatabase:v136 predicate:v134 limit:1 orderingTerms:v137 groupBy:0];

            uint64_t v215 = MEMORY[0x1E4F143A8];
            uint64_t v216 = 3221225472;
            v217 = __163__HDUserDomainConceptEntity__findNewDeviceLocalCanonicalConceptForConceptThatWillBeDeletedWithPersistentID_entityClass_conceptThatWillBeDeleted_transaction_error___block_invoke;
            v218 = &unk_1E62F4CC0;
            v219 = (void **)v128;
            id v139 = v128;
            LOBYTE(v136) = [v138 enumeratePersistentIDsAndProperties:MEMORY[0x1E4F1CBF0] error:a9 enumerationHandler:&v215];

            if ((v136 & 1) == 0) {
              goto LABEL_132;
            }
          }
          else
          {

            if (v127 != 1) {
              goto LABEL_132;
            }
          }
        }

        goto LABEL_123;
      }
    }
    uint64_t v190 = [obja countByEnumeratingWithState:&v220 objects:buf count:16];
    if (v190) {
      continue;
    }
    break;
  }
LABEL_126:

  v140 = [v199 UUID];
  int v141 = +[HDUserDomainConceptEntity _updateLinkCollectionDataByRemovingTargetUUID:syncProvenance:syncIdentity:transaction:error:](v176, v140, a4, v205, v171, (uint64_t)a9);

  if (v141)
  {
LABEL_127:
    v142 = [v188 protectedDatabase];
    *(void *)&long long v220 = MEMORY[0x1E4F143A8];
    *((void *)&v220 + 1) = 3221225472;
    *(void *)&long long v221 = __112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke;
    *((void *)&v221 + 1) = &__block_descriptor_40_e15___NSString_8__0l;
    *(void *)&long long v222 = v176;
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2;
    v230 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E630BC28;
    *(void *)v231 = v199;
    *(void *)&v231[24] = a4;
    uint64_t v232 = v205;
    uint64_t v233 = v176;
    id v108 = v168;
    *(void *)&v231[8] = v108;
    id v143 = v178;
    *(void *)&v231[16] = v143;
    if ([v142 executeCachedStatementForKey:&_updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error__statementKey error:a9 SQLGenerator:&v220 bindingHandler:buf enumerationHandler:0])v144 = v143; {
    else
    }
      v144 = 0;
    id v206 = v144;
  }
  else
  {
LABEL_133:
    id v206 = 0;
    id v108 = v168;
  }
LABEL_134:

LABEL_135:
  v145 = v206;
  if (!v206
    || (uint64_t v146 = [v206 longLongValue],
        int v147 = [v173 updatePrivateDataEnitiesForUserDomainConcept:v199 userDomainConceptID:v146 syncProvenance:a4 profile:v180 transaction:v188 error:a9], v145 = v206, !v147))
  {

LABEL_149:
    uint64_t v47 = 0;
    goto LABEL_150;
  }
  id v199 = v199;
  id v204 = v180;
  id v148 = v188;
  self;
  if (![v199 isDeleted])
  {
    v160 = [v204 daemon];
    v161 = [v160 userDomainConceptEntityRegistry];
    v162 = [v199 identifier];
    v163 = (void *)[v161 userDomainConceptEntityClassForTypeIdentifier:v162];

    if (!v163 || v163 == objc_opt_class()) {
      goto LABEL_157;
    }
    id v164 = v199;
    id v165 = v204;
    id v166 = v148;
    self;
    if ([v163 updateConcreteUserDomainConcept:v164 userDomainConceptID:v146 transaction:v166 error:a9])
    {
      int v167 = [v163 updatePrivateDataEnitiesForUserDomainConcept:v164 userDomainConceptID:v146 syncProvenance:a4 profile:v165 transaction:v166 error:a9];

      if (v167)
      {
LABEL_157:

        goto LABEL_158;
      }
    }
    else
    {
    }
    uint64_t v47 = 0;
    long long v50 = (uint64_t (*)(uint64_t, uint64_t))v164;
    goto LABEL_151;
  }
  long long v222 = 0u;
  long long v223 = 0u;
  long long v220 = 0u;
  long long v221 = 0u;
  v149 = [v204 daemon];
  v150 = [v149 userDomainConceptEntityRegistry];
  v151 = [v150 registeredUserDomainConceptEntityClasses];

  uint64_t v152 = [v151 countByEnumeratingWithState:&v220 objects:buf count:16];
  if (v152)
  {
    uint64_t v153 = *(void *)v221;
    while (2)
    {
      for (uint64_t j = 0; j != v152; ++j)
      {
        if (*(void *)v221 != v153) {
          objc_enumerationMutation(v151);
        }
        v155 = *(objc_class **)(*((void *)&v220 + 1) + 8 * j);
        if (v155 != (objc_class *)objc_opt_class())
        {
          v156 = (void *)[[v155 alloc] initWithPersistentID:v146];
          v157 = [v148 protectedDatabase];
          int v158 = [v156 deleteFromDatabase:v157 error:a9];

          if (!v158)
          {

            goto LABEL_149;
          }
        }
      }
      uint64_t v152 = [v151 countByEnumeratingWithState:&v220 objects:buf count:16];
      if (v152) {
        continue;
      }
      break;
    }
  }

LABEL_158:
  +[HDUserDomainConceptEntity _notifyObserversForUserDomainConcept:update:profile:transaction:](v200, v199, 1, v204, v148);
  uint64_t v47 = 2;
LABEL_150:
  long long v50 = (uint64_t (*)(uint64_t, uint64_t))v199;
LABEL_151:

LABEL_152:
  return v47;
}

+ (int64_t)storeUserDomainConcept:(id)a3 method:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  int64_t v15 = objc_msgSend(a1, "storeUserDomainConcept:method:syncProvenance:syncIdentity:syncVersion:profile:transaction:error:", v14, a4, 0, objc_msgSend(v13, "currentSyncIdentityPersistentID"), 0x400000000, v13, v12, a7);

  return v15;
}

+ (BOOL)deleteUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  _HKInitializeLogging();
  id v13 = HKLogHealthOntology();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543618;
    id v18 = a1;
    __int16 v19 = 2114;
    id v20 = v10;
    _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: deleteUserDomainConcept: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  id v14 = [v10 deletedUserDomainConcept];
  uint64_t v15 = [a1 storeUserDomainConcept:v14 method:3 profile:v12 transaction:v11 error:a6];

  return v15 != 0;
}

+ (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 enumerationHandler:(id)a9
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  id v18 = a5;
  id v19 = a3;
  id v20 = [v16 databaseForEntityClass:a1];
  id v21 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v21 setEntityClass:a1];
  [v21 setLimitCount:a4];
  [v21 setOrderingTerms:v18];

  [v21 setPredicate:v19];
  [v21 setReturnsDistinctEntities:1];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F65D60]) initWithDatabase:v20 descriptor:v21];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __135__HDUserDomainConceptEntity_enumerateUserDomainConceptsWithPredicate_limit_orderingTerms_profile_transaction_error_enumerationHandler___block_invoke;
  v27[3] = &unk_1E630BB88;
  id v28 = v15;
  id v29 = v16;
  id v30 = v17;
  id v31 = a1;
  id v23 = v17;
  id v24 = v16;
  id v25 = v15;
  LOBYTE(a8) = [v22 enumeratePersistentIDsAndProperties:&unk_1F17EAC98 error:a8 enumerationHandler:v27];

  return (char)a8;
}

uint64_t __135__HDUserDomainConceptEntity_enumerateUserDomainConceptsWithPredicate_limit_orderingTerms_profile_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = MEMORY[0x1C1879F80](a4, 0);
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F2B690]) initWithCode:HDSQLiteColumnAsInt64() schema:v8];
  HDSQLiteColumnWithNameAsInt64();
  id v10 = [*(id *)(a1 + 32) daemon];
  id v11 = [v10 userDomainConceptEntityRegistry];
  id v12 = (void *)[v11 userDomainConceptEntityClassForTypeIdentifier:v9];

  id v13 = [v12 entityEncoderForProfile:*(void *)(a1 + 32) transaction:*(void *)(a1 + 40) purpose:1 encodingOptions:0 authorizationFilter:0];
  id v14 = +[HDUserDomainConceptEntity _userDomainConceptWithPersistentID:encoder:transaction:error:](*(void *)(a1 + 56), a2, v13, *(void **)(a1 + 40), a5);
  if (v14) {
    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)_userDomainConceptWithPersistentID:(void *)a3 encoder:(void *)a4 transaction:(void *)a5 error:
{
  id v8 = a3;
  id v9 = a4;
  self;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__185;
  v34 = __Block_byref_object_dispose__185;
  id v35 = 0;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__185;
  id v28 = __Block_byref_object_dispose__185;
  id v29 = 0;
  id v10 = objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "entityClass")), "initWithPersistentID:", a2);
  id v11 = [v8 orderedProperties];
  id v12 = [v9 protectedDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__HDUserDomainConceptEntity__userDomainConceptWithPersistentID_encoder_transaction_error___block_invoke;
  v19[3] = &unk_1E630BCA0;
  id v21 = &v30;
  id v13 = v8;
  id v20 = v13;
  uint64_t v22 = &v24;
  uint64_t v23 = a2;
  LOBYTE(a2) = [v10 getValuesForProperties:v11 database:v12 error:a5 handler:v19];

  if (a2)
  {
    id v14 = (void *)v31[5];
    if (v14)
    {
      id v15 = v14;
      goto LABEL_10;
    }
    id v16 = (id)v25[5];
    id v17 = v16;
    if (v16)
    {
      if (a5) {
        *a5 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  id v15 = 0;
LABEL_10:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

+ (BOOL)enumerateUserDomainConceptsWithPredicate:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  return [a1 enumerateUserDomainConceptsWithPredicate:a3 limit:0 orderingTerms:0 profile:a4 transaction:a5 error:a6 enumerationHandler:a7];
}

+ (BOOL)updateLinksTargetingUserDomainConceptUUID:(id)a3 toTargetUserDomainConceptUUID:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v11 isEqual:v12])
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    id v16 = v11;
    id v17 = v12;
    id v18 = v14;
    id v31 = v13;
    id v19 = v13;
    id v15 = self;
    id v20 = a7;
    uint64_t v21 = [v19 currentSyncIdentityPersistentID];

    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    v34 = __94__HDUserDomainConceptEntity__updateLinksDataTargeting_toTargetUUID_profile_transaction_error___block_invoke;
    id v35 = &unk_1E630BC78;
    id v36 = v16;
    id v37 = v17;
    id v39 = v15;
    uint64_t v40 = v21;
    id v38 = v18;
    id v22 = v18;
    id v23 = v17;
    id v24 = v16;
    LODWORD(v15) = +[HDUserDomainConceptEntity _enumerateLinkCollectionsContainingTargetUUID:transaction:error:enumerationHandler:]((uint64_t)v15, v24, v22, (uint64_t)v20, &v32);

    if (v15)
    {
      id v15 = v24;
      id v25 = v23;
      id v26 = v22;
      self;
      id v27 = [v26 protectedDatabase];

      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __93__HDUserDomainConceptEntity__updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error___block_invoke_2;
      id v35 = &unk_1E62F2900;
      id v36 = v25;
      id v37 = v15;
      id v28 = v15;
      id v29 = v25;
      LOBYTE(v15) = [v27 executeCachedStatementForKey:&_updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error__statementKey error:v20 SQLGenerator:&__block_literal_global_465_0 bindingHandler:&v32 enumerationHandler:0];
    }
    id v13 = v31;
  }

  return (char)v15;
}

+ (id)privateDataEntities
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];

  return v2;
}

+ (BOOL)retrievePrivateDataEntitiesForUserDomainConcept:(id)a3 persistentID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v13 = [v10 propertyCollection];
  id v14 = [v13 properties];
  id v15 = (void *)[v12 initWithArray:v14];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = objc_msgSend(a1, "privateDataEntities", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        if (![*(id *)(*((void *)&v23 + 1) + 8 * i) retrieveDataForUserDomainConcept:v10 userDomainConceptID:a4 mutableUserDomainConceptProperties:v15 transaction:v11 error:a6])
        {
          BOOL v21 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }

  if ([v15 count])
  {
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v15];
    [v10 _setPropertyCollection:v16];
    BOOL v21 = 1;
LABEL_12:
  }
  else
  {
    BOOL v21 = 1;
  }

  return v21;
}

+ (id)userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = __Block_byref_object_copy__185;
  id v36 = __Block_byref_object_dispose__185;
  id v37 = 0;
  id v11 = [MEMORY[0x1E4F65D58] falsePredicate];
  id v12 = [MEMORY[0x1E4F2B680] semanticIdentifierFromSemanticIdentifierString:v8 profile:v9];
  if (v12)
  {
    id v13 = [v9 daemon];
    id v14 = [v13 userDomainConceptEntityRegistry];
    id v15 = [v12 typeIdentifier];
    id v16 = (void *)[v14 userDomainConceptEntityClassForTypeIdentifier:v15];

    uint64_t v17 = [v16 predicateMatchingSemanticIdentifier:v12];

    id v11 = (void *)v17;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F65D08];
  uint64_t v19 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"deleted" equalToValue:MEMORY[0x1E4F1CC28]];
  id v20 = [v18 compoundPredicateWithPredicate:v11 otherPredicate:v19];

  BOOL v21 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"creation_date" entityClass:objc_opt_class() ascending:1];
  id v22 = [v10 protectedDatabase];
  v39[0] = v21;
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
  long long v24 = +[HDSQLiteEntity queryWithDatabase:v22 predicate:v20 limit:1 orderingTerms:v23 groupBy:0];

  id v38 = @"uuid";
  long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __124__HDUserDomainConceptEntity_userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString_profile_transaction_error___block_invoke;
  v31[3] = &unk_1E630BBB0;
  v31[4] = &v32;
  int v26 = [v24 enumeratePersistentIDsAndProperties:v25 error:a6 enumerationHandler:v31];

  if (v26) {
    id v27 = (void *)v33[5];
  }
  else {
    id v27 = 0;
  }
  id v28 = v27;

  _Block_object_dispose(&v32, 8);

  return v28;
}

uint64_t __124__HDUserDomainConceptEntity_userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString_profile_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = HDSQLiteColumnWithNameAsUUID();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [a4 currentSyncIdentityPersistentID];
  id v12 = [v10 protectedDatabase];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __136__HDUserDomainConceptEntity_incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error___block_invoke_2;
  v15[3] = &unk_1E62F33F8;
  id v16 = v9;
  uint64_t v17 = v11;
  id v13 = v9;
  LOBYTE(a6) = [v12 executeCachedStatementForKey:&incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error__statementKeyUDCUpdate error:a6 SQLGenerator:&__block_literal_global_220 bindingHandler:v15 enumerationHandler:0];

  return (char)a6;
}

__CFString *__136__HDUserDomainConceptEntity_incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error___block_invoke()
{
  return @"UPDATE user_domain_concepts SET (sync_provenance, sync_identity, sync_anchor) = (?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1)) WHERE uuid = ? AND sync_provenance != ?";
}

uint64_t __136__HDUserDomainConceptEntity_incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, 0);
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  HDSQLiteBindFoundationValueToStatement();

  return sqlite3_bind_int64(a2, 4, 0);
}

+ (int64_t)evaluateIsCanonicalConcept:(id)a3 entityClass:(Class)a4 transaction:(id)a5 error:(id *)a6
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a3;
  id v12 = [v11 semanticIdentifier];
  id v13 = [(objc_class *)a4 predicateMatchingSemanticIdentifier:v12];

  id v14 = (void *)MEMORY[0x1E4F65D08];
  id v15 = [v11 creationDate];

  [v15 timeIntervalSinceReferenceDate];
  id v16 = HDUserDomainConceptEntityPredicateForConceptsWithCreationDateBefore();
  v23[0] = v16;
  v23[1] = v13;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v18 = [v14 predicateMatchingAllPredicates:v17];

  uint64_t v19 = [v10 databaseForEntityClass:a4];

  id v20 = [a1 countValueForProperty:@"udc_id" predicate:v18 database:v19 error:a6];

  if (v20)
  {
    if ([v20 longLongValue]) {
      int64_t v21 = 2;
    }
    else {
      int64_t v21 = 1;
    }
  }
  else
  {
    int64_t v21 = 0;
  }

  return v21;
}

+ (id)createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:(id)a3 additionalProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [MEMORY[0x1E4F2B170] appleOntologyCodingWithIdentifier:v11];
  id v16 = [v14 daemon];
  uint64_t v17 = [v16 userDomainConceptEntityRegistry];
  uint64_t v18 = (void *)[v17 userDomainConceptEntityClassForTypeIdentifier:v13];

  if (v12) {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F2B668]) initWithProperties:v12];
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = [MEMORY[0x1E4F2B178] collectionWithCoding:v15];
  int64_t v21 = (void *)[v18 newUserDomainConceptForRefreshWithCodingCollection:v20 propertyCollection:v19];

  if (v21)
  {
    uint64_t v35 = 0;
    id v36 = &v35;
    uint64_t v37 = 0x3032000000;
    id v38 = __Block_byref_object_copy__185;
    id v39 = __Block_byref_object_dispose__185;
    id v40 = 0;
    id v22 = [v14 database];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __165__HDUserDomainConceptEntity_createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier_additionalProperties_userDomainConceptTypeIdentifier_profile_error___block_invoke;
    v30[3] = &unk_1E630BBD8;
    uint64_t v33 = &v35;
    uint64_t v34 = v18;
    id v31 = v21;
    id v32 = v14;
    int v23 = [a1 performWriteTransactionWithHealthDatabase:v22 error:a7 block:v30];

    if (v23) {
      long long v24 = (void *)v36[5];
    }
    else {
      long long v24 = 0;
    }
    id v27 = v24;

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"%@{public}: User Domain Concept subclass entity does not currently support creating and refreshing on demand. %@{public}", a1, v18);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    int v26 = v25;
    if (v25)
    {
      if (a7) {
        *a7 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v27 = 0;
  }

  return v27;
}

uint64_t __165__HDUserDomainConceptEntity_createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier_additionalProperties_userDomainConceptTypeIdentifier_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [*(id *)(a1 + 56) refreshOntologyContentForUserDomainConcept:*(void *)(a1 + 32) profile:*(void *)(a1 + 40) transaction:a2 error:a3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

+ (id)ignoreHiddenConceptsPredicate
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F65D68]);
  [v2 setEntityClass:objc_opt_class()];
  uint64_t v3 = HDUserDomainConceptEntityPredicateForPropertyType(2);
  [v2 setPredicate:v3];

  [v2 setReturnsDistinctEntities:1];
  uint64_t v4 = (void *)MEMORY[0x1E4F65D00];
  v9[0] = @"udc_id";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  v6 = [v4 predicateWithProperty:@"udc_id" comparisonType:7 subqueryDescriptor:v2 subqueryProperties:v5];

  id v7 = [MEMORY[0x1E4F65D08] negatedPredicate:v6];

  return v7;
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
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
  uint64_t v3 = [a3 UUID];
  uint64_t v4 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"uuid" value:v3 comparisonType:1];

  return v4;
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F2B630];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithCodingCollection:v7 linkCollection:0 propertyCollection:v6];

  return v8;
}

+ (BOOL)insertPrivateDataEnitiesForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = objc_msgSend(a1, "privateDataEntities", 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        if (![*(id *)(*((void *)&v19 + 1) + 8 * i) insertDataForUserDomainConcept:v10 userDomainConceptID:a4 transaction:v11 error:a6])
        {
          BOOL v17 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_11:

  return v17;
}

+ (BOOL)updatePrivateDataEnitiesForUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v30 = a6;
  id v29 = a7;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = [a1 privateDataEntities];
  uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v35 != v28) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v13 = v31;
        id v14 = v30;
        id v15 = v29;
        self;
        if ([v13 isDeleted]
          && ![v12 willDeleteUserDomainConcept:v13 userDomainConceptID:a4 syncProvenance:a5 profile:v14 transaction:v15 error:a8])
        {
LABEL_17:

          LOBYTE(v15) = 0;
          goto LABEL_19;
        }
        id v16 = v13;
        id v17 = v15;
        self;
        if (([v16 isDeleted] & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
        {
          long long v19 = NSString;
          long long v20 = [v12 disambiguatedDatabaseTable];
          long long v21 = [v19 stringWithFormat:@"DELETE FROM %@ WHERE udc_id = ?", v20];

          long long v22 = [v17 protectedDatabase];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __111__HDUserDomainConceptEntity__deleteDataForUserDomainConcept_userDomainConceptID_entityClass_transaction_error___block_invoke;
          v38[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
          v38[4] = a4;
          char v23 = [v22 executeSQL:v21 error:a8 bindingHandler:v38 enumerationHandler:0];

          if ((v23 & 1) == 0) {
            goto LABEL_17;
          }
        }
        else
        {
          char v18 = [v12 pruneDataForUpdatedUserDomainConcept:v16 userDomainConceptID:a4 transaction:v17 error:a8];

          if ((v18 & 1) == 0) {
            goto LABEL_17;
          }
        }
        LODWORD(v15) = [v12 insertDataForUserDomainConcept:v16 userDomainConceptID:a4 transaction:v17 error:a8];

        if (!v15) {
          goto LABEL_19;
        }
      }
      LOBYTE(v15) = 1;
      uint64_t v27 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }
LABEL_19:

  return (char)v15;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F65D58], "falsePredicate", a3);
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v7 = a3;

  return v7;
}

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v6 = a3;

  return v6;
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

+ (BOOL)encodesCodableUserDomainConceptSubclassData
{
  return 1;
}

+ (BOOL)supportsHidingSemanticDuplicates
{
  return 0;
}

+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 transaction:(id)a5 error:(id *)a6
{
  if (a4) {
    *a4 = 0;
  }
  return 1;
}

+ (void)_notifyObserversForUserDomainConcept:(int)a3 update:(void *)a4 profile:(void *)a5 transaction:
{
  id v11 = a2;
  id v8 = a5;
  id v9 = a4;
  self;
  id v10 = [v9 userDomainConceptManager];

  if ([v11 isDeleted])
  {
    [v10 notifyObserversForDeletedUDC:v11 transaction:v8];
  }
  else if (a3)
  {
    [v10 notifyObserversForUpdatedUDC:v11 transaction:v8];
  }
  else
  {
    [v10 notifyObserversForAddedUDC:v11 transaction:v8];
  }
}

+ (uint64_t)_updateLinkCollectionDataByRemovingTargetUUID:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10 = a2;
  id v11 = a5;
  uint64_t v12 = self;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __121__HDUserDomainConceptEntity__updateLinkCollectionDataByRemovingTargetUUID_syncProvenance_syncIdentity_transaction_error___block_invoke;
  v17[3] = &unk_1E630BC50;
  uint64_t v20 = v12;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  uint64_t v15 = +[HDUserDomainConceptEntity _enumerateLinkCollectionsContainingTargetUUID:transaction:error:enumerationHandler:](v12, v14, v13, a6, v17);

  return v15;
}

+ (id)_linkCollectionToPersistGivenLinkCollection:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  self;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__185;
  id v17 = __Block_byref_object_dispose__185;
  id v8 = v6;
  id v18 = v8;
  id v9 = [v7 protectedDatabase];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__HDUserDomainConceptEntity__linkCollectionToPersistGivenLinkCollection_transaction_error___block_invoke_2;
  v12[3] = &unk_1E62F3640;
  v12[4] = &v13;
  if ([v9 executeCachedStatementForKey:&_linkCollectionToPersistGivenLinkCollection_transaction_error__statementKey error:a4 SQLGenerator:&__block_literal_global_441 bindingHandler:0 enumerationHandler:v12])id v10 = (id)v14[5]; {
  else
  }
    id v10 = 0;

  _Block_object_dispose(&v13, 8);

  return v10;
}

__CFString *__104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke()
{
  return @"INSERT OR IGNORE INTO user_domain_concepts (uuid, schema, type, deleted, creation_date, modification_date, major_version, minor_version, patch_version, build, sync_provenance, sync_identity, sync_anchor, link_collection_data) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1), ?)";
}

void __104__HDUserDomainConceptEntity__insertBaseUserDomainConcept_syncProvenance_syncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();

  uint64_t v5 = [*(id *)(a1 + 32) identifier];
  id v6 = [v5 schema];
  HDSQLiteBindFoundationValueToStatement();

  id v7 = [*(id *)(a1 + 32) identifier];
  sqlite3_bind_int64(a2, 3, [v7 code]);

  sqlite3_bind_int(a2, 4, [*(id *)(a1 + 32) isDeleted]);
  [*(id *)(a1 + 32) creationTimestamp];
  sqlite3_bind_double(a2, 5, v8);
  [*(id *)(a1 + 32) modificationTimestamp];
  sqlite3_bind_double(a2, 6, v9);
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 operatingSystemVersion];
    sqlite3_int64 v11 = v19;
  }
  else
  {
    sqlite3_int64 v11 = 0;
  }
  sqlite3_bind_int64(a2, 7, v11);
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    [v12 operatingSystemVersion];
    sqlite3_int64 v13 = v18;
  }
  else
  {
    sqlite3_int64 v13 = 0;
  }
  sqlite3_bind_int64(a2, 8, v13);
  id v14 = *(void **)(a1 + 32);
  if (v14)
  {
    [v14 operatingSystemVersion];
    sqlite3_int64 v15 = v17;
  }
  else
  {
    sqlite3_int64 v15 = 0;
  }
  sqlite3_bind_int64(a2, 9, v15);
  id v16 = [*(id *)(a1 + 32) build];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 11, *(void *)(a1 + 48));
  sqlite3_bind_int64(a2, 12, *(void *)(a1 + 56));
  +[HDUserDomainConceptEntity _bindToStatement:index:linkCollection:](*(void *)(a1 + 64), a2, 13, *(void **)(a1 + 40));
}

+ (void)_bindToStatement:(int)a3 index:(void *)a4 linkCollection:
{
  id v7 = a4;
  self;
  if (v7)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    HDSQLiteBindFoundationValueToStatement();
  }
  else
  {
    sqlite3_bind_null(a2, a3);
  }
}

__CFString *__91__HDUserDomainConceptEntity__linkCollectionToPersistGivenLinkCollection_transaction_error___block_invoke()
{
  return @"SELECT uuid FROM user_domain_concepts WHERE deleted = 1";
}

uint64_t __91__HDUserDomainConceptEntity__linkCollectionToPersistGivenLinkCollection_transaction_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F90](a2, 0);
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) collectionByRemovingLinksWithTargetUUID:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 1;
}

__CFString *__112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke()
{
  return @"UPDATE user_domain_concepts SET (schema, type, deleted, modification_date, major_version, minor_version, patch_version, build, sync_provenance, sync_identity, sync_anchor, link_collection_data) = (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1), ?)WHERE udc_id = ?";
}

uint64_t __112__HDUserDomainConceptEntity__updateBaseUserDomainConcept_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v4 schema];
  HDSQLiteBindFoundationValueToStatement();

  id v6 = [*(id *)(a1 + 32) identifier];
  sqlite3_bind_int64(a2, 2, [v6 code]);

  sqlite3_bind_int(a2, 3, [*(id *)(a1 + 32) isDeleted]);
  [*(id *)(a1 + 32) modificationTimestamp];
  sqlite3_bind_double(a2, 4, v7);
  double v8 = *(void **)(a1 + 32);
  if (v8)
  {
    [v8 operatingSystemVersion];
    sqlite3_int64 v9 = v18;
  }
  else
  {
    sqlite3_int64 v9 = 0;
  }
  sqlite3_bind_int64(a2, 5, v9);
  id v10 = *(void **)(a1 + 32);
  if (v10)
  {
    [v10 operatingSystemVersion];
    sqlite3_int64 v11 = v17;
  }
  else
  {
    sqlite3_int64 v11 = 0;
  }
  sqlite3_bind_int64(a2, 6, v11);
  uint64_t v12 = *(void **)(a1 + 32);
  if (v12)
  {
    [v12 operatingSystemVersion];
    sqlite3_int64 v13 = v16;
  }
  else
  {
    sqlite3_int64 v13 = 0;
  }
  sqlite3_bind_int64(a2, 7, v13);
  id v14 = [*(id *)(a1 + 32) build];
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 9, *(void *)(a1 + 56));
  sqlite3_bind_int64(a2, 10, *(void *)(a1 + 64));
  +[HDUserDomainConceptEntity _bindToStatement:index:linkCollection:](*(void *)(a1 + 72), a2, 11, *(void **)(a1 + 40));
  return sqlite3_bind_int64(a2, 12, [*(id *)(a1 + 48) longLongValue]);
}

uint64_t __121__HDUserDomainConceptEntity__updateLinkCollectionDataByRemovingTargetUUID_syncProvenance_syncIdentity_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  sqlite3_int64 v9 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v9;
  id v12 = a3;
  uint64_t v13 = self;
  id v14 = [v12 collectionByRemovingLinksWithTargetUUID:v11];

  uint64_t v15 = +[HDUserDomainConceptEntity _updateLinkCollection:userDomainConceptID:syncProvenance:syncIdentity:transaction:error:](v13, v14, a2, v7, v8, v10, a4);
  return v15;
}

+ (uint64_t)_enumerateLinkCollectionsContainingTargetUUID:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 enumerationHandler:
{
  id v8 = a2;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = self;
  id v12 = [v10 protectedDatabase];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_2;
  v20[3] = &unk_1E62F43C8;
  id v21 = v8;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_3;
  v17[3] = &unk_1E62F8820;
  id v18 = v9;
  uint64_t v19 = v11;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = [v12 executeCachedStatementForKey:&_enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler__statementKey error:a4 SQLGenerator:&__block_literal_global_455 bindingHandler:v20 enumerationHandler:v17];

  return v15;
}

uint64_t __94__HDUserDomainConceptEntity__updateLinksDataTargeting_toTargetUUID_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  id v10 = *(id *)(a1 + 48);
  id v11 = v7;
  id v12 = v8;
  id v13 = a3;
  uint64_t v14 = self;
  uint64_t v15 = [v13 collectionByRetargetingLinksWithUUID:v12 withNewUUID:v11];

  uint64_t v16 = +[HDUserDomainConceptEntity _updateLinkCollection:userDomainConceptID:syncProvenance:syncIdentity:transaction:error:](v14, v15, a2, 0, v9, v10, a4);
  return v16;
}

__CFString *__112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke()
{
  return @"SELECT udc_id, link_collection_data FROM user_domain_concepts WHERE udc_id IN (SELECT DISTINCT udc_id FROM user_domain_concept_links WHERE target_uuid = ?)";
}

uint64_t __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __112__HDUserDomainConceptEntity__enumerateLinkCollectionsContainingTargetUUID_transaction_error_enumerationHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HDSQLiteColumnAsInt64();
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0;
  int v7 = +[HDUserDomainConceptEntity _inflateLinkCollection:row:error:](v6, &v12, a2, a3);
  id v8 = v12;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (uint64_t)_inflateLinkCollection:(uint64_t)a3 row:(uint64_t)a4 error:
{
  self;
  uint64_t v6 = HDSQLiteColumnWithNameAsData();
  if (v6)
  {
    int v7 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:a4];
    if (!v7)
    {
      uint64_t v9 = 0;
      goto LABEL_8;
    }
    id v8 = v7;
    if (a2) {
      *a2 = v7;
    }
  }
  uint64_t v9 = 1;
LABEL_8:

  return v9;
}

+ (uint64_t)_updateLinkCollection:(uint64_t)a3 userDomainConceptID:(uint64_t)a4 syncProvenance:(uint64_t)a5 syncIdentity:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12 = a2;
  id v13 = a6;
  uint64_t v14 = self;
  uint64_t v15 = [v13 protectedDatabase];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __117__HDUserDomainConceptEntity__updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error___block_invoke_2;
  v19[3] = &unk_1E62FA4A0;
  uint64_t v22 = a5;
  uint64_t v23 = v14;
  id v20 = v12;
  uint64_t v21 = a4;
  uint64_t v24 = a3;
  id v16 = v12;
  uint64_t v17 = [v15 executeCachedStatementForKey:&_updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error__statementKey error:a7 SQLGenerator:&__block_literal_global_460_0 bindingHandler:v19 enumerationHandler:0];

  return v17;
}

__CFString *__117__HDUserDomainConceptEntity__updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error___block_invoke()
{
  return @"UPDATE user_domain_concepts SET (modification_date, sync_provenance, sync_identity, link_collection_data, sync_anchor) = (?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM user_domain_concepts), 1)) WHERE udc_id = ?";
}

uint64_t __117__HDUserDomainConceptEntity__updateLinkCollection_userDomainConceptID_syncProvenance_syncIdentity_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  double Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 1, Current);
  sqlite3_bind_int64(a2, 2, *(void *)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 48));
  +[HDUserDomainConceptEntity _bindToStatement:index:linkCollection:](*(void *)(a1 + 56), a2, 4, *(void **)(a1 + 32));
  sqlite3_int64 v5 = *(void *)(a1 + 64);

  return sqlite3_bind_int64(a2, 5, v5);
}

__CFString *__93__HDUserDomainConceptEntity__updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error___block_invoke()
{
  return @"UPDATE OR REPLACE user_domain_concept_links SET (target_uuid) = (?) WHERE target_uuid = ?";
}

uint64_t __93__HDUserDomainConceptEntity__updateLinksMovingFromTargetUUID_toTargetUUID_transaction_error___block_invoke_2()
{
  HDSQLiteBindFoundationValueToStatement();

  return HDSQLiteBindFoundationValueToStatement();
}

void __90__HDUserDomainConceptEntity__userDomainConceptWithPersistentID_encoder_transaction_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v5 = (void *)a1[4];
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = [v5 objectForPersistentID:v6 row:a3 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

__CFString *__88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke()
{
  return @"SELECT udc_id FROM user_domain_concepts WHERE uuid = ?";
}

void __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) UUID];
  HDSQLiteBindFoundationValueToStatement();
}

uint64_t __88__HDUserDomainConceptEntity__userDomainConceptIDForUserDomainConcept_transaction_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x1C1879F70](a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  sqlite3_int64 v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1;
}

uint64_t __111__HDUserDomainConceptEntity__deleteDataForUserDomainConcept_userDomainConceptID_entityClass_transaction_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t __82__HDUserDomainConceptEntity__userDomainConceptWithUUID_profile_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  return 0;
}

+ (BOOL)_removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a3;
  self;
  BOOL v7 = +[HDUserDomainConceptPropertyEntity deleteDeviceLocalPropertiesWithType:2 userDomainConceptID:a2 transaction:v6 error:a4];

  return v7;
}

BOOL __92__HDUserDomainConceptEntity__hideSemanticDuplicatesOfConcept_entityClass_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return +[HDUserDomainConceptPropertyEntity insertDeviceLocalProperty:*(void *)(a1 + 32) userDomainConceptID:a2 transaction:*(void *)(a1 + 40) error:a5];
}

uint64_t __95__HDUserDomainConceptEntity__isConceptHiddenFromEnumerationWithPersistentID_transaction_error___block_invoke(uint64_t a1)
{
  id v2 = HDSQLiteColumnWithNameAsNumber();
  uint64_t v3 = v2;
  if (v2) {
    LOBYTE(v2) = [v2 BOOLValue];
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = (_BYTE)v2;

  return 1;
}

BOOL __163__HDUserDomainConceptEntity__findNewDeviceLocalCanonicalConceptForConceptThatWillBeDeletedWithPersistentID_entityClass_conceptThatWillBeDeleted_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return +[HDUserDomainConceptEntity _removeIsHiddenDeviceLocalPropertyForUserDomainConceptWithPersistentID:transaction:error:]((uint64_t)HDUserDomainConceptEntity, a2, *(void **)(a1 + 32), a5);
}

void __97__HDUserDomainConceptEntity__codableSubclassForForUserDomainConceptID_encoder_transaction_error___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  sqlite3_int64 v5 = (void *)a1[4];
  uint64_t v6 = a1[7];
  uint64_t v7 = *(void *)(a1[6] + 8);
  obuint64_t j = *(id *)(v7 + 40);
  uint64_t v8 = [v5 codableRepresentationForPersistentID:v6 row:a3 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[5] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

@end