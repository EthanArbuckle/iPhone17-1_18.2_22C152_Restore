@interface HDMedicalRecordEntity
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_latestDateForProperty:(void *)a3 sampleTypes:(void *)a4 profile:(uint64_t)a5 error:;
+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)checkConstraints;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)joinClausesForProperty:(id)a3;
+ (id)latestCreationDateWithProfile:(id)a3 error:(id *)a4;
+ (id)latestModifiedDateWithProfile:(id)a3 error:(id *)a4;
+ (id)medicalRecordWithAttachmentObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)orderingTermForSortDescriptor:(id)a3;
- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
@end

@implementation HDMedicalRecordEntity

+ (id)databaseTable
{
  return @"medical_records";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_74;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v54[13] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v42 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDMedicalRecordEntity.m", 96, @"Subclasses must override %s", "+[HDMedicalRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  SEL v43 = a2;
  v54[0] = @"data_id";
  v54[1] = @"note";
  v54[2] = @"entered_in_error";
  v54[3] = @"modified_date";
  v54[4] = @"fhir_identifier";
  v54[5] = @"original_fhir_resource_rowid";
  v54[6] = @"original_signed_clinical_data_rowid";
  v54[7] = @"locale";
  v54[8] = @"extraction_version";
  v54[9] = @"sort_date";
  v54[10] = @"sort_date_key_path";
  v54[11] = @"country";
  v54[12] = @"state";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:13];
  v17 = [v12 FHIRIdentifier];

  id v44 = v13;
  v18 = v14;
  if (v17)
  {
    v19 = [v12 FHIRIdentifier];
    v20 = [v19 stringValue];
  }
  else
  {
    v20 = 0;
  }
  v21 = [v12 metadata];
  uint64_t v22 = *MEMORY[0x1E4F2BB68];
  v23 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F2BB68]];

  if (v23)
  {
    v24 = a7;
    id v25 = [v12 metadata];
    v26 = [v25 objectForKeyedSubscript:v22];
    uint64_t v27 = [v26 longLongValue];
    uint64_t v28 = 0;
LABEL_8:

    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __87__HDMedicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
    v45[3] = &unk_1E6306A30;
    id v29 = v18;
    id v46 = v29;
    id v47 = v12;
    id v48 = v20;
    uint64_t v49 = v27;
    v30 = v44;
    uint64_t v50 = v28;
    SEL v51 = v43;
    id v52 = a1;
    v31 = [a1 insertOrReplaceEntity:1 database:v44 properties:v16 error:v24 bindingHandler:v45];
    if (v31) {
      v32 = v29;
    }
    else {
      v32 = 0;
    }
    id v33 = v32;

    goto LABEL_12;
  }
  v35 = [v12 originIdentifier];
  v36 = [v35 signedClinicalDataRecordIdentifier];

  if (v36)
  {
    v24 = a7;
    v37 = [v12 originIdentifier];
    v38 = [v37 signedClinicalDataRecordIdentifier];
    id v53 = 0;
    v26 = +[HDOriginalSignedClinicalDataRecordEntity entityWithSyncIdentifier:v38 database:v44 error:&v53];
    id v25 = v53;

    if (!v26)
    {
      if (v25)
      {
        if (v24) {
          id *v24 = v25;
        }
        else {
          _HKLogDroppedError();
        }
      }
      else
      {
        v39 = (void *)MEMORY[0x1E4F28C58];
        v40 = [v12 originIdentifier];
        v41 = [v40 signedClinicalDataRecordIdentifier];
        objc_msgSend(v39, "hk_assignError:code:format:", v24, 118, @"Original signed clinical data record with sync identifier %@ does not exist", v41);
      }
      v30 = v44;

      id v33 = 0;
      goto LABEL_12;
    }
    uint64_t v28 = [v26 persistentID];
    uint64_t v27 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 100, @"Attempting to save a medical record without an origin.");
  id v33 = 0;
  v30 = v44;
LABEL_12:

  return v33;
}

void __87__HDMedicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  v4 = [*(id *)(a1 + 40) note];
  MEMORY[0x1C1879EC0](a2, @"note", v4);

  MEMORY[0x1C1879E20](a2, @"entered_in_error", [*(id *)(a1 + 40) enteredInError]);
  v5 = [*(id *)(a1 + 40) modifiedDate];
  MEMORY[0x1C1879E40](a2, @"modified_date", v5);

  v6 = [*(id *)(a1 + 40) locale];
  v7 = [v6 localeIdentifier];
  MEMORY[0x1C1879EC0](a2, @"locale", v7);

  MEMORY[0x1C1879E80](a2, @"extraction_version", [*(id *)(a1 + 40) extractionVersion]);
  v8 = [*(id *)(a1 + 40) sortDate];
  v9 = [v8 date];
  MEMORY[0x1C1879E40](a2, @"sort_date", v9);

  v10 = [*(id *)(a1 + 40) sortDate];
  v11 = [v10 keyPath];
  MEMORY[0x1C1879EC0](a2, @"sort_date_key_path", v11);

  id v12 = [*(id *)(a1 + 40) country];
  MEMORY[0x1C1879EC0](a2, @"country", v12);

  MEMORY[0x1C1879E80](a2, @"state", [*(id *)(a1 + 40) state]);
  MEMORY[0x1C1879EC0](a2, @"fhir_identifier", *(void *)(a1 + 48));
  if (*(uint64_t *)(a1 + 56) >= 1)
  {
    MEMORY[0x1C1879E90](a2, @"original_signed_clinical_data_rowid");
    goto LABEL_5;
  }
  if (*(uint64_t *)(a1 + 64) >= 1)
  {
    MEMORY[0x1C1879E90](a2, @"original_fhir_resource_rowid");
LABEL_5:
    JUMPOUT(0x1C1879E80);
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 80) file:@"HDMedicalRecordEntity.m" lineNumber:176 description:@"No OrignalFHIRResource or OriginalSignedClinicalDataRecord ROWID provided for FK on insert"];
}

+ (id)foreignKeys
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"original_fhir_resource_rowid";
  v2 = +[HDHealthEntity defaultForeignKey];
  v6[1] = @"original_signed_clinical_data_rowid";
  v7[0] = v2;
  v3 = +[HDHealthEntity defaultForeignKey];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)checkConstraints
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = [MEMORY[0x1E4F65D70] checkConstraintWithSQL:@"(original_fhir_resource_rowid IS NOT NULL AND original_signed_clinical_data_rowid IS NULL) OR (original_fhir_resource_rowid IS NULL AND original_signed_clinical_data_rowid IS NOT NULL)"];
    v2 = [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)_latestDateForProperty:(void *)a3 sampleTypes:(void *)a4 profile:(uint64_t)a5 error:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  if (!v10)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__latestDateForProperty_sampleTypes_profile_error_, v11, @"HDMedicalRecordEntity.m", 205, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];
  }
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__146;
  id v29 = __Block_byref_object_dispose__146;
  id v30 = 0;
  id v12 = HDSampleEntityPredicateForDataTypes(v9);
  id v13 = [v10 database];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__HDMedicalRecordEntity__latestDateForProperty_sampleTypes_profile_error___block_invoke;
  v20[3] = &unk_1E6306A58;
  v24 = v11;
  id v14 = v8;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  v23 = &v25;
  char v16 = [v11 performReadTransactionWithHealthDatabase:v13 error:a5 block:v20];

  if (v16) {
    id v17 = (id)v26[5];
  }
  else {
    id v17 = 0;
  }

  _Block_object_dispose(&v25, 8);

  return v17;
}

uint64_t __74__HDMedicalRecordEntity__latestDateForProperty_sampleTypes_profile_error___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (void *)a1[7];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  id v8 = [a2 databaseForEntityClass:v5];
  id v17 = 0;
  id v9 = [v5 maxValueForProperty:v6 predicate:v7 database:v8 error:&v17];
  id v10 = v17;

  if (v9)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9C8]);
    [v9 doubleValue];
    uint64_t v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

LABEL_3:
    uint64_t v15 = 1;
    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_3;
  }
  if (a3)
  {
    uint64_t v15 = 0;
    *a3 = v10;
  }
  else
  {
    _HKLogDroppedError();
    uint64_t v15 = 0;
  }
LABEL_4:

  return v15;
}

+ (id)latestCreationDateWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 daemon];
  id v8 = [v7 behavior];
  if ([v8 futureMigrationsEnabled]) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 0;
  }

  id v10 = [MEMORY[0x1E4F2B448] medicalRecordTypesWithOptions:v9];
  id v11 = +[HDMedicalRecordEntity _latestDateForProperty:sampleTypes:profile:error:]((uint64_t)a1, @"creation_date", v10, v6, (uint64_t)a4);

  return v11;
}

+ (id)latestModifiedDateWithProfile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 daemon];
  id v8 = [v7 behavior];
  if ([v8 futureMigrationsEnabled]) {
    uint64_t v9 = 8;
  }
  else {
    uint64_t v9 = 0;
  }

  id v10 = [MEMORY[0x1E4F2B448] medicalRecordTypesWithOptions:v9];
  id v11 = +[HDMedicalRecordEntity _latestDateForProperty:sampleTypes:profile:error:]((uint64_t)a1, @"modified_date", v10, v6, (uint64_t)a4);

  return v11;
}

+ (id)medicalRecordWithAttachmentObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v33 = 0;
  id v34 = 0;
  id v32 = 0;
  char v9 = [MEMORY[0x1E4F2AC08] componentsFromAttachmentObjectIdentifier:a3 sampleTypeIdentifier:&v34 bundleIdentifier:&v33 FHIRIdentifier:&v32];
  id v10 = v34;
  id v11 = v33;
  id v12 = v32;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2000, @"Failed parse attachment objectIdentifier into components");
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v24;
    if (v24)
    {
      if (a5)
      {
        id v15 = v24;
        v23 = 0;
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
        v23 = 0;
      }
      id v14 = v15;
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  uint64_t v13 = [MEMORY[0x1E4F2B1B0] medicalTypeForIdentifier:v10];
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Invalid medicalType identifier: %@", v10);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_22:
    id v14 = 0;
    goto LABEL_23;
  }
  id v14 = (id)v13;
  id v15 = [a1 predicateForObjectsFromLocalSourceWithBundleIdentifier:v11 profile:v8 error:a5];
  if (!v15)
  {
LABEL_23:
    v23 = 0;
    goto LABEL_24;
  }
  id v16 = v12;
  id v14 = v14;
  id v17 = v8;
  id v15 = v15;
  uint64_t v28 = self;
  v31 = v16;
  id v29 = HDMedicalRecordEntityPredicateForFHIRIdentifier(v16);
  v18 = objc_msgSend(MEMORY[0x1E4F65D58], "compoundPredicateWithPredicate:otherPredicate:", v15);

  v39 = @"SkipApplyingConceptIndex";
  v40[0] = MEMORY[0x1E4F1CC38];
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
  id v30 = v17;
  v20 = +[HDSampleEntity samplesWithType:v14 profile:v17 encodingOptions:v19 predicate:v18 limit:0 anchor:0 error:a5];
  id v21 = v20;
  if (v20 && [v20 count])
  {
    if ((unint64_t)[v21 count] >= 2)
    {
      _HKInitializeLogging();
      id v22 = (void *)*MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_FAULT))
      {
        v26 = v22;
        uint64_t v27 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v28;
        __int16 v37 = 2114;
        v38 = v27;
        _os_log_fault_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_FAULT, "%{public}@ Unexpectedly found more than 1 medical record for FHIR resource %{public}@!", buf, 0x16u);
      }
    }
    v23 = [v21 firstObject];
  }
  else
  {
    v23 = 0;
  }

LABEL_24:

  return v23;
}

+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_class();
  id v15 = @"SkipApplyingConceptIndex";
  v16[0] = MEMORY[0x1E4F1CC38];
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v12 = [v10 objectWithUUID:v9 encodingOptions:v11 profile:v8 error:a6];

  uint64_t v13 = [v12 attachmentObjectIdentifier];

  return v13;
}

- (BOOL)willDeleteWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HDMedicalRecordEntity;
  return [(HDHealthEntity *)&v6 willDeleteWithProfile:a3 transaction:a4 error:a5];
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [[_HDMedicalRecordEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

+ (id)orderingTermForSortDescriptor:(id)a3
{
  id v4 = a3;
  v5 = [v4 key];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F2A000]];

  if (v6)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 ascending];
    id v10 = @"modified_date";
LABEL_5:
    uint64_t v13 = [v7 orderingTermWithProperty:v10 entityClass:v8 ascending:v9];
    goto LABEL_7;
  }
  id v11 = [v4 key];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F2A008]];

  if (v12)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F65D50];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 ascending];
    id v10 = @"sort_date";
    goto LABEL_5;
  }
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___HDMedicalRecordEntity;
  uint64_t v13 = objc_msgSendSuper2(&v16, sel_orderingTermForSortDescriptor_, v4);
LABEL_7:
  id v14 = (void *)v13;

  return v14;
}

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"user_domain_concepts.uuid"])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
    int v6 = +[HDMedicalUserDomainConceptMappingEntity joinClausesForProperty:v4];
    uint64_t v7 = (void *)[v5 initWithSet:v6];

    uint64_t v8 = (void *)MEMORY[0x1E4F65D38];
    uint64_t v9 = [a1 disambiguatedDatabaseTable];
    id v10 = [v8 innerJoinClauseFromTable:v9 toTargetEntity:objc_opt_class() as:0 localReference:@"data_id" targetKey:@"data_id"];
    [v7 addObject:v10];

    id v11 = (void *)[v7 copy];
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___HDMedicalRecordEntity;
    id v11 = objc_msgSendSuper2(&v13, sel_joinClausesForProperty_, v4);
  }

  return v11;
}

@end