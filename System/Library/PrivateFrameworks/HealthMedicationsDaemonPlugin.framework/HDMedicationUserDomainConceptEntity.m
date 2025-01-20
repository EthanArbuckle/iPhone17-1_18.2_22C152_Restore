@interface HDMedicationUserDomainConceptEntity
+ (BOOL)encodesCodableUserDomainConceptSubclassData;
+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6;
+ (BOOL)supportsHidingSemanticDuplicates;
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
+ (id)privateSubEntities;
+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (int64_t)protectionClass;
+ (uint64_t)_isMedicationArchived:(void *)a3 transaction:(uint64_t)a4 error:;
+ (uint64_t)_isMedicationScheduled:(void *)a3 transaction:(uint64_t)a4 error:;
@end

@implementation HDMedicationUserDomainConceptEntity

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 1;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions;
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
  v15 = [(HDEntityEncoder *)[_HDMedicationUserDomainConceptEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)privateDataEntities
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (id)databaseTable
{
  return @"medication_user_domain_concepts";
}

+ (id)foreignKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"udc_id";
  v2 = [MEMORY[0x1E4F65C20] defaultForeignKey];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)privateSubEntities
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)insertConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  v8 = objc_msgSend(a5, "protectedDatabase", a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __109__HDMedicationUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2;
  v10[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v10[4] = a4;
  LOBYTE(a6) = [v8 executeCachedStatementForKey:&insertConcreteUserDomainConcept_userDomainConceptID_transaction_error__statementKey error:a6 SQLGenerator:&__block_literal_global_1 bindingHandler:v10 enumerationHandler:0];

  return (char)a6;
}

__CFString *__109__HDMedicationUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke()
{
  return @"INSERT OR REPLACE INTO medication_user_domain_concepts (udc_id) VALUES (?)";
}

uint64_t __109__HDMedicationUserDomainConceptEntity_insertConcreteUserDomainConcept_userDomainConceptID_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

+ (BOOL)updateConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (BOOL)willDeleteConcreteUserDomainConcept:(id)a3 userDomainConceptID:(int64_t)a4 syncProvenance:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  v15 = [v12 UUID];
  v16 = [v13 dataManager];
  uint64_t v17 = objc_opt_class();
  v18 = HDMedicationDoseEventEntityPredicateForMedicationUUID();
  LODWORD(v17) = [v16 deleteDataObjectsOfClass:v17 predicate:v18 limit:*MEMORY[0x1E4F65DE0] deletedSampleCount:0 notifyObservers:1 generateDeletedObjects:1 recursiveDeleteAuthorizationBlock:0 error:a8];

  if (v17
    && +[HDMedicationScheduleEntity updateMedicationSchedulesToBeDeletedWithMedicationUUID:v15 profile:v13 transaction:v14 error:a8])
  {
    v19 = [v13 healthMedicationsProfileExtension];
    v20 = [v19 medicationScheduleManager];

    [v20 rescheduleMedicationsSynchronously:a5 == 0];
    v21 = [v12 firstConceptIdentifier];

    if (!v21) {
      goto LABEL_7;
    }
    v22 = [v12 firstConceptIdentifier];
    v23 = HDDismissedDrugInteractionResultPredicateForDrugClassAncestorIdentifier(v22);

    v24 = [v14 database];
    LODWORD(v22) = +[HDHealthEntity deleteEntitiesWithPredicate:v23 healthDatabase:v24 error:a8];

    if (v22)
    {
      v25 = [v12 firstConceptIdentifier];
      v38[0] = v25;
      v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
      v27 = HDDismissedPregnancyLactationInteractionPredicateForMedicationIdentifiersAndInteractionTypes(v26, 0);

      v28 = [v14 database];
      BOOL v29 = +[HDHealthEntity deleteEntitiesWithPredicate:v27 healthDatabase:v28 error:a8];

      if (v29)
      {
        v30 = [v12 semanticIdentifier];
        v31 = [v30 stringValue];
        v37 = v31;
        v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        v36 = HDDismissedRemoteScheduleUnavailableRecordsForMedicationSemanticIdentifiers((uint64_t)v32);

        v33 = [v14 database];
        BOOL v34 = +[HDHealthEntity deleteEntitiesWithPredicate:v36 healthDatabase:v33 error:a8];

        if (!v34)
        {
LABEL_11:

          goto LABEL_12;
        }
LABEL_7:
        LOBYTE(v34) = 1;
        goto LABEL_11;
      }
      v23 = v27;
    }

    LOBYTE(v34) = 0;
    goto LABEL_11;
  }
  LOBYTE(v34) = 0;
LABEL_12:

  return v34;
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
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 UUID];

  if (v4)
  {
    v5 = [v3 UUID];
    v6 = HDUserDomainConceptEntityPredicateForConceptUUID();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F65D08];
    v5 = [v3 typeIdentifier];
    v8 = HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
    v13[0] = v8;
    v9 = [v3 medicalCoding];
    v10 = HDUserDomainConceptEntityPredicateForMedicalCoding();
    v13[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v6 = [v7 predicateMatchingAllPredicates:v11];
  }
  return v6;
}

+ (id)newUserDomainConceptForRefreshWithCodingCollection:(id)a3 propertyCollection:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F66B80];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithCodingCollection:v7 supplementalPropertyCollection:v6];

  return v8;
}

+ (BOOL)encodesCodableUserDomainConceptSubclassData
{
  return 0;
}

+ (BOOL)supportsHidingSemanticDuplicates
{
  return 1;
}

+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 transaction:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 displayNameComponents];
  uint64_t v11 = [v8 loggingUnit];
  id v12 = objc_alloc(MEMORY[0x1E4F2B200]);
  id v13 = [v8 semanticIdentifier];
  id v14 = [v13 stringValue];
  uint64_t v15 = [v12 initWithSemanticIdentifierString:v14];

  id v16 = objc_alloc(MEMORY[0x1E4F2ACE8]);
  uint64_t v17 = [v10 fullDisplayName];
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  v19 = (void *)[v16 initWithText:v17 codings:v18];

  v20 = (void *)v11;
  v21 = v9;

  id v22 = objc_alloc(MEMORY[0x1E4F2B1C8]);
  v23 = (void *)v15;
  uint64_t v24 = v15;
  v25 = v10;
  v26 = (void *)[v22 initWithIdentifier:v24 displayNameComponents:v10 loggingUnit:v20 components:MEMORY[0x1E4F1CBF0] codingCollection:v19];
  v27 = (void *)+[HDMedicationUserDomainConceptEntity _isMedicationArchived:transaction:error:]((uint64_t)a1, v8, v21, (uint64_t)a6);
  if (v27)
  {
    uint64_t v28 = +[HDMedicationUserDomainConceptEntity _isMedicationScheduled:transaction:error:]((uint64_t)a1, v8, v21, (uint64_t)a6);
    if (v28)
    {
      uint64_t v29 = v28;
      v30 = v25;
      v37 = v21;
      v31 = v20;
      v32 = (void *)MEMORY[0x1E4F2B6A8];
      v33 = [v8 userSpecifiedName];
      v27 = [v32 userTrackedMedicationWithNickname:v33 isArchived:v27 == (void *)1 hasSchedule:v29 == 1 medication:v26 device:0];

      if (a4) {
        *a4 = v27;
      }

      LOBYTE(v27) = 1;
      v20 = v31;
      v21 = v37;
      v25 = v30;
    }
    else
    {
      LOBYTE(v27) = 0;
    }
  }

  return (char)v27;
}

+ (uint64_t)_isMedicationArchived:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = (void *)MEMORY[0x1E4F65D08];
  id v9 = [v7 UUID];

  v10 = HDUserDomainConceptEntityPredicateForConceptUUID();
  uint64_t v11 = [MEMORY[0x1E4F65C28] predicateForElementsOfListType:2];
  id v12 = [v8 compoundPredicateWithPredicate:v10 otherPredicate:v11];

  id v13 = [MEMORY[0x1E4F65C28] countOfUserDomainConceptsMatchingPredicate:v12 options:0 transaction:v6 error:a4];

  if (v13)
  {
    if ([v13 intValue]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

+ (uint64_t)_isMedicationScheduled:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  id v8 = (void *)MEMORY[0x1E4F65D08];
  id v9 = HDMedicationSchedulePredicateForDeleted(0, 1);
  v10 = [v7 semanticIdentifier];

  uint64_t v11 = [v10 stringValue];
  id v12 = HDMedicationSchedulePredicateForMedicationIdentifier((uint64_t)v11);
  id v13 = [v8 compoundPredicateWithPredicate:v9 otherPredicate:v12];

  uint64_t v14 = [v6 protectedDatabase];

  uint64_t v15 = +[HDSQLiteEntity countDistinctForProperty:@"uuid" predicate:v13 database:v14 error:a4];

  if (v15)
  {
    if ((int)[v15 intValue] > 0) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }

  return v16;
}

+ (id)predicateMatchingSemanticDuplicatesOf:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 firstOntologyCoding];
  if (v4 && (HDUserDomainConceptEntityPredicateForMedicalCoding(), (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = (void *)v5;
    v20 = (void *)MEMORY[0x1E4F65D08];
    id v7 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v8 = *MEMORY[0x1E4F65A58];
    v21 = [v3 UUID];
    id v9 = [v7 predicateWithProperty:v8 notEqualToValue:v21];
    v22[0] = v9;
    v10 = (void *)MEMORY[0x1E4F65D00];
    uint64_t v11 = *MEMORY[0x1E4F65A50];
    id v12 = (void *)MEMORY[0x1E4F28ED0];
    id v13 = [v3 semanticIdentifier];
    uint64_t v14 = [v13 typeIdentifier];
    uint64_t v15 = objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v14, "code"));
    uint64_t v16 = [v10 predicateWithProperty:v11 equalToValue:v15];
    v22[1] = v16;
    v22[2] = v6;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
    id v18 = [v20 predicateMatchingAllPredicates:v17];
  }
  else
  {
    id v18 = [MEMORY[0x1E4F65D58] falsePredicate];
  }

  return v18;
}

+ (id)deduplicateUserDomainConcept:(id)a3 with:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  return +[HDUserDomainConceptCollapser collapseUserDomainConcept:a3 with:a4 profile:a5 transaction:a6 error:a7];
}

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [a1 evaluateIsCanonicalConcept:v12 entityClass:a1 transaction:v11 error:a6];
  if (v13 == 1)
  {
    id v14 = +[HDUserDomainConceptOntologyContentRefresher refreshOntologyContentForUserDomainConcept:v12 profile:v10 transaction:v11 error:a6];
  }
  else
  {
    if (v13 == 2) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = 0;
    }
    id v14 = v15;
  }
  uint64_t v16 = v14;

  return v16;
}

@end