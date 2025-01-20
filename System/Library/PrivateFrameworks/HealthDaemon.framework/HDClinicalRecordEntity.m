@interface HDClinicalRecordEntity
+ (BOOL)isConcreteEntity;
+ (const)columnDefinitionsWithCount:(unint64_t *)a3;
+ (id)_clinicalRecordForSampleType:(id)a3 predicate:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_predicateForRecordWithFHIRResourceIdentifier:(id)a3;
+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6;
+ (id)clinicalRecordWithAttachmentObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)databaseTable;
+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7;
+ (id)existingClinicalRecordCreatedFromResourceWithIdentifier:(id)a3 basePredicate:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)foreignKeys;
+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7;
+ (id)joinClausesForProperty:(id)a3;
@end

@implementation HDClinicalRecordEntity

+ (id)databaseTable
{
  return @"clinical_record_samples";
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 12;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_86;
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

+ (id)joinClausesForProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"originalFHIRResource.id"])
  {
    v5 = (void *)MEMORY[0x1E4F65D38];
    v6 = +[HDSQLiteSchemaEntity disambiguatedDatabaseTable];
    v7 = [v5 leftJoinClauseFromTable:v6 toTargetEntity:objc_opt_class() as:@"originalFHIRResource" localReference:@"original_fhir_resource_rowid" targetKey:*MEMORY[0x1E4F65C70]];

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, 0);
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HDClinicalRecordEntity;
    v8 = objc_msgSendSuper2(&v10, sel_joinClausesForProperty_, v4);
  }

  return v8;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  v46[12] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = objc_opt_class();
  if (([v15 isEqual:objc_opt_class()] & 1) == 0)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HDClinicalRecordEntity.m", 95, @"Subclasses must override %s", "+[HDClinicalRecordEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");
  }
  v46[0] = @"data_id";
  v46[1] = @"display_name";
  v46[2] = @"fhir_resource_fhir_version_major";
  v46[3] = @"fhir_resource_fhir_version_minor";
  v46[4] = @"fhir_resource_fhir_version_patch";
  v46[5] = @"fhir_resource_resource_type";
  v46[6] = @"fhir_resource_identifier";
  v46[7] = @"fhir_resource_data";
  v46[8] = @"fhir_resource_source_url";
  v46[9] = @"fhir_resource_last_updated_date";
  v46[10] = @"original_fhir_resource_rowid";
  v46[11] = @"original_signed_clinical_data_rowid";
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:12];
  v17 = [v12 metadata];
  uint64_t v18 = *MEMORY[0x1E4F2BB68];
  v19 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F2BB68]];

  if (v19)
  {
    v20 = [v12 metadata];
    v21 = [v20 objectForKeyedSubscript:v18];
    uint64_t v22 = [v21 longLongValue];

    if (v22)
    {
      uint64_t v23 = 0;
LABEL_10:
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __88__HDClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke;
      v39[3] = &unk_1E63092E8;
      id v33 = v14;
      id v40 = v33;
      id v41 = v12;
      uint64_t v42 = v22;
      uint64_t v43 = v23;
      SEL v44 = a2;
      id v45 = a1;
      v34 = [a1 insertOrReplaceEntity:1 database:v13 properties:v16 error:a7 bindingHandler:v39];
      if (v34) {
        v35 = v33;
      }
      else {
        v35 = 0;
      }
      id v36 = v35;

      goto LABEL_17;
    }
  }
  v24 = [v12 metadata];
  uint64_t v25 = *MEMORY[0x1E4F2BB70];
  v26 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F2BB70]];

  if (v26)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F29128]);
    v28 = [v12 metadata];
    v29 = [v28 objectForKeyedSubscript:v25];
    v30 = (void *)[v27 initWithUUIDString:v29];

    v31 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityWithSyncIdentifier:v30 database:v13 error:a7];
    if (!v31)
    {

      goto LABEL_16;
    }
    v32 = v31;
    uint64_t v23 = [v31 persistentID];

    if (v23)
    {
      uint64_t v22 = 0;
      goto LABEL_10;
    }
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 118, @"No OrignalFHIRResource or OriginalSignedClinicalDataRecord ROWID provided for FK on insert");
LABEL_16:
  id v36 = 0;
LABEL_17:

  return v36;
}

void __88__HDClinicalRecordEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1C1879E80](a2, @"data_id", [*(id *)(a1 + 32) longLongValue]);
  id v4 = [*(id *)(a1 + 40) displayName];
  MEMORY[0x1C1879EC0](a2, @"display_name", v4);

  v5 = [*(id *)(a1 + 40) FHIRResource];
  v6 = [v5 FHIRVersion];
  MEMORY[0x1C1879E80](a2, @"fhir_resource_fhir_version_major", [v6 majorVersion]);

  v7 = [*(id *)(a1 + 40) FHIRResource];
  v8 = [v7 FHIRVersion];
  MEMORY[0x1C1879E80](a2, @"fhir_resource_fhir_version_minor", [v8 minorVersion]);

  v9 = [*(id *)(a1 + 40) FHIRResource];
  objc_super v10 = [v9 FHIRVersion];
  MEMORY[0x1C1879E80](a2, @"fhir_resource_fhir_version_patch", [v10 patchVersion]);

  v11 = [*(id *)(a1 + 40) FHIRResource];
  id v12 = [v11 resourceType];
  MEMORY[0x1C1879EC0](a2, @"fhir_resource_resource_type", v12);

  id v13 = [*(id *)(a1 + 40) FHIRResource];
  id v14 = [v13 identifier];
  MEMORY[0x1C1879EC0](a2, @"fhir_resource_identifier", v14);

  v15 = [*(id *)(a1 + 40) FHIRResource];
  v16 = [v15 data];
  MEMORY[0x1C1879E30](a2, @"fhir_resource_data", v16);

  v17 = [*(id *)(a1 + 40) FHIRResource];
  uint64_t v18 = [v17 sourceURL];
  v19 = [v18 absoluteString];
  MEMORY[0x1C1879EC0](a2, @"fhir_resource_source_url", v19);

  v20 = [*(id *)(a1 + 40) FHIRResource];
  v21 = [v20 lastUpdatedDate];
  MEMORY[0x1C1879E40](a2, @"fhir_resource_last_updated_date", v21);

  if (*(uint64_t *)(a1 + 48) >= 1)
  {
    MEMORY[0x1C1879E90](a2, @"original_signed_clinical_data_rowid");
    JUMPOUT(0x1C1879E80);
  }
  if (*(uint64_t *)(a1 + 56) >= 1)
  {
    MEMORY[0x1C1879E80](a2, @"original_signed_clinical_data_rowid");
    JUMPOUT(0x1C1879E90);
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 72) file:@"HDClinicalRecordEntity.m" lineNumber:164 description:@"No OrignalFHIRResource or OriginalSignedClinicalDataRecord ROWID provided for FK on insert"];
}

+ (id)clinicalRecordWithAttachmentObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v22 = 0;
  id v23 = 0;
  id v21 = 0;
  char v9 = [MEMORY[0x1E4F2AC08] componentsFromAttachmentObjectIdentifier:a3 sampleTypeIdentifier:&v23 bundleIdentifier:&v22 FHIRIdentifier:&v21];
  id v10 = v23;
  id v11 = v22;
  id v12 = v21;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 2000, @"Failed parse attachment objectIdentifier into components");
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = v18;
    if (v18)
    {
      if (a5)
      {
        id v14 = v18;
        v17 = 0;
        *a5 = v14;
      }
      else
      {
        _HKLogDroppedError();
        v17 = 0;
      }
      id v13 = v14;
      goto LABEL_19;
    }
    id v13 = 0;
    goto LABEL_14;
  }
  id v13 = [MEMORY[0x1E4F2B448] clinicalTypeForIdentifier:v10];
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Invalid clinicalType identifier: %@", v10);
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v19;
    if (v19)
    {
      if (a5)
      {
        id v15 = v19;
        v17 = 0;
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
        v17 = 0;
      }
      id v14 = v15;
    }
    else
    {
      id v14 = 0;
      v17 = 0;
    }
    goto LABEL_18;
  }
  id v14 = [a1 predicateForObjectsFromLocalSourceWithBundleIdentifier:v11 profile:v8 error:a5];
  if (!v14)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_19;
  }
  id v15 = [a1 _predicateForRecordWithFHIRResourceIdentifier:v12];
  v16 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v14 otherPredicate:v15];
  v17 = [a1 _clinicalRecordForSampleType:v13 predicate:v16 profile:v8 error:a5];

LABEL_18:
LABEL_19:

  return v17;
}

+ (id)attachmentObjectIdentifierForSampleWithUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(id)objc_opt_class() objectWithUUID:v9 encodingOptions:0 profile:v8 error:a6];

  id v11 = [v10 attachmentObjectIdentifier];

  return v11;
}

+ (id)existingClinicalRecordCreatedFromResourceWithIdentifier:(id)a3 basePredicate:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [a1 _predicateForRecordWithFHIRResourceIdentifier:v10];
  id v14 = [MEMORY[0x1E4F65D58] compoundPredicateWithPredicate:v11 otherPredicate:v13];
  id v15 = (void *)MEMORY[0x1E4F2AD10];
  v16 = [v10 resourceType];
  v17 = [v15 sampleTypesForResourceType:v16 error:a6];

  if (v17)
  {
    v28 = v13;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v26 = v11;
      id v27 = v10;
      uint64_t v21 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [a1 _clinicalRecordForSampleType:*(void *)(*((void *)&v29 + 1) + 8 * i) predicate:v14 profile:v12 error:a6];
          if (v23)
          {
            v24 = (void *)v23;
            goto LABEL_12;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v20) {
          continue;
        }
        break;
      }
      v24 = 0;
LABEL_12:
      id v11 = v26;
      id v10 = v27;
    }
    else
    {
      v24 = 0;
    }

    id v13 = v28;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (id)_clinicalRecordForSampleType:(id)a3 predicate:(id)a4 profile:(id)a5 error:(id *)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = +[HDSampleEntity samplesWithType:v10 profile:a5 encodingOptions:0 predicate:a4 limit:0 anchor:0 error:a6];
  id v12 = v11;
  if (v11 && [v11 count])
  {
    if ((unint64_t)[v12 count] >= 2)
    {
      _HKInitializeLogging();
      id v13 = *MEMORY[0x1E4F29F38];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F38], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v17 = a1;
        __int16 v18 = 2114;
        id v19 = v10;
        _os_log_fault_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_FAULT, "%{public}@ Unexpectedly found more than 1 clinical record for clinical sampleType %{public}@!", buf, 0x16u);
      }
    }
    id v14 = [v12 firstObject];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (id)_predicateForRecordWithFHIRResourceIdentifier:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F65D00];
  id v4 = a3;
  v5 = [v4 resourceType];
  v6 = [v3 predicateWithProperty:@"fhir_resource_resource_type" equalToValue:v5];

  v7 = (void *)MEMORY[0x1E4F65D00];
  id v8 = [v4 identifier];

  id v9 = [v7 predicateWithProperty:@"fhir_resource_identifier" equalToValue:v8];

  id v10 = (void *)MEMORY[0x1E4F65D08];
  v14[0] = v9;
  v14[1] = v6;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  id v12 = [v10 predicateMatchingAllPredicates:v11];

  return v12;
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(HDEntityEncoder *)[_HDClinicalRecordEntityEncoder alloc] initWithHealthEntityClass:objc_opt_class() profile:v14 transaction:v13 purpose:a5 encodingOptions:v12 authorizationFilter:v11];

  return v15;
}

@end