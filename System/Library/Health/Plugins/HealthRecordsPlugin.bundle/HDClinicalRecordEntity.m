@interface HDClinicalRecordEntity
+ (BOOL)_clinicalRecord:(id)a3 equivalentTo:(id)a4;
+ (BOOL)_enumerateEntitiesWithOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)_insertClinicalRecords:(id)a3 clinicalExternalID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_insertOrReplaceClinicalRecord:(id)a3 existingEntity:(id)a4 clinicalExternalID:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)_clinicalRecordsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_existingClinicalRecord:(id)a3 originalFHIRResourceRowID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_predicateForRecordsWithOriginalFHIRResourceROWID:(id)a3;
+ (id)clinicalRecordWithResourceIdentifier:(id)a3 source:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)processClinicalRecordsInExtractionResult:(id)a3 clinicalExternalID:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)processClinicalRecordsInExtractionResultItem:(id)a3 clinicalExternalID:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7;
- (BOOL)_updateOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5;
- (id)_fetchIdentifierFromDatabase:(id)a3 error:(id *)a4;
@end

@implementation HDClinicalRecordEntity

+ (id)processClinicalRecordsInExtractionResult:(id)a3 clinicalExternalID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _HKInitializeLogging();
  v13 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = NSStringFromClass((Class)a1);
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ processing extraction result %{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v37 = 0;
  v16 = [v12 database];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_79378;
  v30[3] = &unk_112468;
  id v35 = a1;
  id v31 = v10;
  id v32 = v11;
  id v33 = v12;
  v34 = buf;
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_794E0;
  v26 = &unk_112490;
  id v17 = v31;
  id v27 = v17;
  id v18 = v32;
  id v28 = v18;
  id v19 = v33;
  id v29 = v19;
  unsigned int v20 = [a1 performWriteTransactionWithHealthDatabase:v16 error:a6 block:v30 inaccessibilityHandler:&v23];

  if (v20)
  {
    v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(void *)(*(void *)&buf[8] + 24), v23, v24, v25, v26, v27, v28);
  }
  else
  {
    v21 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v21;
}

+ (id)processClinicalRecordsInExtractionResultItem:(id)a3 clinicalExternalID:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v52 = a4;
  id v13 = a5;
  id v53 = a6;
  v14 = [v12 originalFHIRResource];
  v15 = [v14 existingRowID];

  if (!v15)
  {
    v43 = [v12 originalFHIRResource];
    +[NSError hk_assignError:a7, 3, @"cannot process extraction result item for a resource that doesn't know its ROWID. Resource: %@", v43 code format];

    v42 = 0;
    goto LABEL_28;
  }
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_79A90;
  v62[3] = &unk_1143D0;
  id v63 = v13;
  id v17 = v16;
  id v64 = v17;
  if ([a1 _enumerateEntitiesWithOriginalFHIRResourceROWID:v15 database:v63 error:a7 enumerationHandler:v62])
  {
    v51 = a7;
    id v45 = v13;
    id v46 = v12;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = [v12 units];
    id v55 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    uint64_t v18 = 0;
    if (v55)
    {
      uint64_t v54 = *(void *)v59;
      uint64_t v48 = _HKPrivateMetadataKeyOriginalFHIRResourceROWID;
      id v49 = a1;
      v50 = v17;
      while (2)
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v59 != v54) {
            objc_enumerationMutation(obj);
          }
          unsigned int v20 = [*(id *)(*((void *)&v58 + 1) + 8 * i) clinicalRecord];
          if (v20)
          {
            v21 = v20;
            v22 = [v20 metadata];
            id v23 = [v22 mutableCopy];
            uint64_t v24 = v23;
            uint64_t v56 = v18;
            if (v23) {
              id v25 = v23;
            }
            else {
              id v25 = objc_alloc_init((Class)NSMutableDictionary);
            }
            v26 = v25;

            id v27 = v15;
            [v26 setObject:v15 forKeyedSubscript:v48];
            [v21 _setMetadata:v26];
            id v28 = objc_alloc((Class)HKFHIRIdentifier);
            id v29 = [v21 FHIRResource];
            v30 = [v29 resourceType];
            id v31 = [v21 FHIRResource];
            id v32 = [v31 identifier];
            id v33 = [v28 initWithResourceType:v30 identifier:v32];

            id v17 = v50;
            v34 = [v50 objectForKeyedSubscript:v33];
            a1 = v49;
            LODWORD(v28) = [v49 _insertOrReplaceClinicalRecord:v21 existingEntity:v34 clinicalExternalID:v52 profile:v53 error:v51];

            if (!v28)
            {

              v42 = 0;
              id v13 = v45;
              id v12 = v46;
              v15 = v27;
              goto LABEL_27;
            }
            uint64_t v18 = v56 + 1;
            [v50 removeObjectForKey:v33];

            v15 = v27;
          }
        }
        id v55 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v55) {
          continue;
        }
        break;
      }
    }

    id v13 = v45;
    if ([v17 count])
    {
      uint64_t v35 = v18;
      v36 = [v17 allValues];
      uint64_t v37 = objc_msgSend(v36, "hk_mapToSet:", &stru_114410);

      v38 = +[HDSQLiteContainsPredicate containsPredicateWithProperty:HDSQLEntityPropertyPersistentID values:v37];
      uint64_t v57 = 0;
      v39 = [v53 dataManager];
      unsigned int v40 = [v39 deleteDataObjectsOfClass:a1 predicate:v38 limit:kHDSQLiteQueryNoLimit deletedSampleCount:&v57 notifyObservers:1 generateDeletedObjects:1 recursiveDeleteAuthorizationBlock:0 error:v51];

      if (!v40)
      {

        v42 = 0;
        goto LABEL_26;
      }
      _HKInitializeLogging();
      v41 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        id v66 = a1;
        __int16 v67 = 2048;
        uint64_t v68 = v57;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "%{public}@ deleted %lu obsolete clinical record entities", buf, 0x16u);
      }

      uint64_t v18 = v35;
    }
    v42 = +[NSNumber numberWithUnsignedInteger:v18];
LABEL_26:
    id v12 = v46;
    goto LABEL_27;
  }
  v42 = 0;
LABEL_27:

LABEL_28:

  return v42;
}

+ (id)clinicalRecordWithResourceIdentifier:(id)a3 source:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [a4 bundleIdentifier];
  id v13 = [a1 predicateForObjectsFromLocalSourceWithBundleIdentifier:v12 profile:v11 error:a6];

  if (v13)
  {
    v14 = [a1 existingClinicalRecordCreatedFromResourceWithIdentifier:v10 basePredicate:v13 profile:v11 error:a6];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (BOOL)_insertOrReplaceClinicalRecord:(id)a3 existingEntity:(id)a4 clinicalExternalID:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = [v13 metadata];
  uint64_t v18 = [v17 objectForKeyedSubscript:_HKPrivateMetadataKeyOriginalFHIRResourceROWID];

  if (!v18)
  {
    v44 = +[NSAssertionHandler currentHandler];
    [v44 handleFailureInMethod:a2 object:a1 file:@"HDClinicalRecordEntity+HealthRecordsPlugin.m" lineNumber:166 description:@"Clinical records without the original FHIR resource ROWID in their metadata cannot be inserted"];
  }
  id v19 = [v13 FHIRResource];

  if (v19)
  {
    if (v14)
    {
      unsigned int v20 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 persistentID]);
      id v59 = 0;
      id v21 = [a1 objectWithID:v20 encodingOptions:0 profile:v16 error:&v59];
      id v22 = v59;

      if (!v21)
      {
        id v22 = v22;
        if (v22)
        {
          if (a7) {
            *a7 = v22;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v23 = 0;
        unsigned __int8 v24 = 0;
        goto LABEL_33;
      }
      if ([a1 _clinicalRecord:v21 equivalentTo:v13])
      {
        id v23 = 0;
        unsigned __int8 v24 = 1;
LABEL_33:

        goto LABEL_34;
      }
      id v50 = a1;
      id obj = v22;
      id v58 = 0;
      id v23 = +[HDMedicalDownloadableAttachmentEntity _attachmentsAfterRelinkingFromClinicalRecord:v21 toClinicalRecord:v13 profile:v16 error:&v58];
      id v25 = v58;
      v26 = v21;
      if (!v23)
      {
        _HKInitializeLogging();
        id v27 = HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B222C((uint64_t)v50, (uint64_t)v25, v27);
        }
      }
      id v48 = v16;
      id v28 = [v16 dataManager];
      id v66 = v21;
      +[NSArray arrayWithObjects:&v66 count:1];
      v30 = id v29 = v25;
      unsigned int v31 = [v28 deleteDataObjects:v30 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:a7];

      if (!v31)
      {
        unsigned __int8 v24 = 0;
        id v16 = v48;
        id v21 = v26;
        id v22 = obj;
        goto LABEL_33;
      }

      id v16 = v48;
    }
    else
    {
      id v50 = a1;
      id v23 = 0;
    }
    id v65 = v13;
    id v32 = +[NSArray arrayWithObjects:&v65 count:1];
    unsigned __int8 v24 = [v50 _insertClinicalRecords:v32 clinicalExternalID:v15 profile:v16 error:a7];

    id v22 = [v16 attachmentManager];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v21 = v23;
    id v33 = [v21 countByEnumeratingWithState:&v54 objects:v64 count:16];
    if (v33)
    {
      id v34 = v33;
      unsigned __int8 v45 = v24;
      id obja = v21;
      id v47 = v14;
      id v49 = v16;
      id v46 = v15;
      uint64_t v35 = *(void *)v55;
      do
      {
        v36 = 0;
        do
        {
          if (*(void *)v55 != v35) {
            objc_enumerationMutation(obja);
          }
          uint64_t v37 = [*(id *)(*((void *)&v54 + 1) + 8 * (void)v36) hkAttachment];
          v38 = [v13 attachmentObjectIdentifier];
          v39 = [v13 attachmentSchemaIdentifier];
          id v53 = 0;
          unsigned int v40 = [v22 addReferenceWithAttachment:v37 toObjectWithIdentifier:v38 schemaIdentifier:v39 metadata:0 error:&v53];
          id v41 = v53;

          if (!v40)
          {
            _HKInitializeLogging();
            v42 = HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              id v61 = v50;
              __int16 v62 = 2114;
              id v63 = v41;
              _os_log_error_impl(&dword_0, v42, OS_LOG_TYPE_ERROR, "%{public}@ Failed to recreate HKAttachmentReference for clinical records being re-inserted, ignoring and continuing. Error: %{public}@", buf, 0x16u);
            }
          }

          v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        id v34 = [obja countByEnumeratingWithState:&v54 objects:v64 count:16];
      }
      while (v34);
      id v21 = obja;
      id v23 = obja;
      id v15 = v46;
      id v14 = v47;
      id v16 = v49;
      unsigned __int8 v24 = v45;
    }
    else
    {
      id v23 = v21;
    }
    goto LABEL_33;
  }
  +[NSError hk_assignError:a7, 3, @"Clinical records with a nil FHIR resource are invalid, not inserting %@", v13 code format];
  unsigned __int8 v24 = 0;
LABEL_34:

  return v24;
}

- (id)_fetchIdentifierFromDatabase:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  unsigned int v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_7A364;
  id v23 = sub_7A374;
  id v24 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_7A364;
  id v17 = sub_7A374;
  id v18 = 0;
  v25[0] = HDClinicalRecordEntityPropertyFHIRResourceResourceType;
  v25[1] = HDClinicalRecordEntityPropertyFHIRResourceIdentifier;
  v7 = +[NSArray arrayWithObjects:v25 count:2];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_7A37C;
  v12[3] = &unk_114438;
  v12[4] = &v19;
  v12[5] = &v13;
  LOBYTE(self) = [(HDClinicalRecordEntity *)self getValuesForProperties:v7 database:v6 handler:v12];

  if (self)
  {
    id v8 = (id)v20[5];
  }
  else
  {
    id v9 = (id)v14[5];
    id v10 = v9;
    if (v9)
    {
      if (a4) {
        *a4 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v8 = 0;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);

  return v8;
}

+ (BOOL)_clinicalRecord:(id)a3 equivalentTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v7 = [v5 displayName];
  uint64_t v8 = [v6 displayName];
  if (v7 == (void *)v8)
  {

    goto LABEL_7;
  }
  id v9 = (void *)v8;
  id v10 = [v6 displayName];
  if (!v10)
  {
LABEL_29:

    goto LABEL_30;
  }
  id v11 = [v5 displayName];
  id v12 = [v6 displayName];
  unsigned int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
LABEL_7:
    v7 = [v5 FHIRResource];
    id v9 = [v6 FHIRResource];
    if ((v7 != 0) == (v9 == 0)) {
      goto LABEL_28;
    }
    id v14 = [v7 resourceType];
    uint64_t v15 = [v9 resourceType];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      id v16 = (void *)v15;
      uint64_t v17 = [v9 resourceType];
      if (!v17) {
        goto LABEL_27;
      }
      id v18 = (void *)v17;
      uint64_t v19 = [v7 resourceType];
      unsigned int v20 = [v9 resourceType];
      unsigned int v21 = [v19 isEqualToString:v20];

      if (!v21) {
        goto LABEL_28;
      }
    }
    id v14 = [v7 identifier];
    uint64_t v22 = [v9 identifier];
    if (v14 == (void *)v22)
    {
    }
    else
    {
      id v16 = (void *)v22;
      uint64_t v23 = [v9 identifier];
      if (!v23) {
        goto LABEL_27;
      }
      id v24 = (void *)v23;
      id v25 = [v7 identifier];
      v26 = [v9 identifier];
      unsigned int v27 = [v25 isEqualToString:v26];

      if (!v27) {
        goto LABEL_28;
      }
    }
    id v14 = [v7 sourceURL];
    uint64_t v28 = [v9 sourceURL];
    if (v14 == (void *)v28)
    {
    }
    else
    {
      id v16 = (void *)v28;
      uint64_t v29 = [v9 sourceURL];
      if (!v29) {
        goto LABEL_27;
      }
      v30 = (void *)v29;
      unsigned int v31 = [v7 sourceURL];
      id v32 = [v9 sourceURL];
      unsigned int v33 = [v31 isEqual:v32];

      if (!v33) {
        goto LABEL_28;
      }
    }
    id v14 = [v7 data];
    uint64_t v34 = [v9 data];
    if (v14 == (void *)v34)
    {

LABEL_32:
      LOBYTE(v10) = 1;
      goto LABEL_29;
    }
    id v16 = (void *)v34;
    uint64_t v35 = [v9 data];
    if (v35)
    {
      v36 = (void *)v35;
      uint64_t v37 = [v7 data];
      v38 = [v9 data];
      unsigned __int8 v39 = [v37 isEqual:v38];

      if (v39) {
        goto LABEL_32;
      }
LABEL_28:
      LOBYTE(v10) = 0;
      goto LABEL_29;
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_5:
  LOBYTE(v10) = 0;
LABEL_30:

  return (char)v10;
}

+ (id)_predicateForRecordsWithOriginalFHIRResourceROWID:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDClinicalRecordEntityPropertyOriginalFHIRResourceROWID equalToValue:a3];
}

+ (BOOL)_insertClinicalRecords:(id)a3 clinicalExternalID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 count])
  {
    id v12 = [v11 sourceManager];
    id v21 = 0;
    unsigned int v13 = [v12 publicSourceForClinicalExternalIdentifier:v10 provenance:0 createOrUpdateIfNecessary:0 nameOnCreateOrUpdate:0 error:&v21];
    id v14 = v21;

    if (v13)
    {
      uint64_t v15 = [v11 dataProvenanceManager];
      id v16 = [v15 localDataProvenanceForSourceEntity:v13 version:0 deviceEntity:0];

      if (v16)
      {
        uint64_t v17 = [v11 dataManager];
        id v18 = [v9 firstObject];
        [v18 _creationTimestamp];
        unsigned __int8 v19 = objc_msgSend(v17, "insertDataObjects:withProvenance:creationDate:error:", v9, v16, a6);
      }
      else
      {
        +[NSError hk_assignError:a6 code:100 description:@"Failed to get provenance for clinical source entity"];
        unsigned __int8 v19 = 0;
      }

      goto LABEL_14;
    }
    if (v14)
    {
      if (a6)
      {
        unsigned __int8 v19 = 0;
        *a6 = v14;
LABEL_14:

        goto LABEL_15;
      }
      _HKLogDroppedError();
    }
    else
    {
      +[NSError hk_assignError:a6, 100, @"unable to insert records for account with clinicalExternalID \"%@\": no matching source entity is present", v10 code format];
    }
    unsigned __int8 v19 = 0;
    goto LABEL_14;
  }
  +[NSError hk_assignError:a6 code:3 description:@"No records given"];
  unsigned __int8 v19 = 0;
LABEL_15:

  return v19;
}

+ (id)_clinicalRecordsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[HKClinicalType allTypes];
  id v11 = +[NSSet setWithArray:v10];
  id v12 = [a1 entityEnumeratorWithTypes:v11 profile:v9 error:a5];

  if (v12)
  {
    [v12 setPredicate:v8];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_7AB74;
    v16[3] = &unk_112568;
    id v13 = objc_alloc_init((Class)NSMutableArray);
    id v17 = v13;
    if ([v12 enumerateWithError:a5 handler:v16]) {
      id v14 = [v13 copy];
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_updateOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v15 = HDClinicalRecordEntityPropertyOriginalFHIRResourceROWID;
  id v9 = a4;
  id v10 = +[NSArray arrayWithObjects:&v15 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_7ACC8;
  v13[3] = &unk_111B40;
  id v14 = v8;
  id v11 = v8;
  LOBYTE(a5) = [(HDClinicalRecordEntity *)self updateProperties:v10 database:v9 error:a5 bindingHandler:v13];

  return (char)a5;
}

+ (BOOL)_enumerateEntitiesWithOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [a1 _predicateForRecordsWithOriginalFHIRResourceROWID:a3];
  id v13 = [a1 queryWithDatabase:v11 predicate:v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_7ADF8;
  v16[3] = &unk_1124F8;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a5) = [v13 enumeratePersistentIDsAndProperties:0 error:a5 enumerationHandler:v16];

  return (char)a5;
}

+ (id)_existingClinicalRecord:(id)a3 originalFHIRResourceRowID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v54 = a1;
  id v57 = v10;
  id v12 = [a1 _predicateForRecordsWithOriginalFHIRResourceROWID:v10];
  v69[0] = v12;
  uint64_t v13 = HDClinicalRecordEntityPropertyFHIRResourceIdentifier;
  id v14 = [v9 FHIRResource];
  uint64_t v15 = [v14 identifier];
  id v16 = +[HDSQLiteComparisonPredicate predicateWithProperty:v13 equalToValue:v15];
  v69[1] = v16;
  uint64_t v17 = HDClinicalRecordEntityPropertyFHIRResourceResourceType;
  long long v56 = v9;
  id v18 = [v9 FHIRResource];
  unsigned __int8 v19 = [v18 resourceType];
  unsigned int v20 = +[HDSQLiteComparisonPredicate predicateWithProperty:v17 equalToValue:v19];
  v69[2] = v20;
  id v21 = +[NSArray arrayWithObjects:v69 count:3];
  uint64_t v22 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v21];

  id v58 = 0;
  uint64_t v23 = +[HDClinicalRecordEntity _clinicalRecordsWithPredicate:v22 profile:v11 error:&v58];

  id v24 = v58;
  if (!v23)
  {
    _HKInitializeLogging();
    uint64_t v29 = (void *)HKLogHealthRecords;
    uint64_t v28 = v57;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v41 = v29;
      v42 = [v54 debugDescription];
      v43 = [v56 FHIRResource];
      v44 = [v43 identifier];
      unsigned __int8 v45 = [v56 FHIRResource];
      id v46 = [v45 resourceType];
      *(_DWORD *)buf = 138544387;
      long long v60 = v42;
      __int16 v61 = 2113;
      __int16 v62 = v44;
      __int16 v63 = 2113;
      id v64 = v46;
      __int16 v65 = 2114;
      id v66 = v57;
      __int16 v67 = 2114;
      id v68 = v24;
      _os_log_error_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "%{public}@ Error quering for clinical record with identifier: %{private}@, resourceType: %{private}@, originalFHIRResourceRowID: %{public}@. Error: %{public}@ ", buf, 0x34u);
    }
    id v25 = v56;
    if (!v24)
    {
      v30 = [v54 debugDescription];
      unsigned int v31 = [v56 FHIRResource];
      id v32 = [v31 identifier];
      unsigned int v33 = [v56 FHIRResource];
      uint64_t v34 = [v33 resourceType];
      +[NSError hk_assignError:a6, 2000, @"%@ Error quering for clinical record with identifier: %@, resourceType: %@, originalFHIRResourceRowID: %@", v30, v32, v34, v57 code format];

      uint64_t v28 = v57;
    }
    goto LABEL_12;
  }
  if (![v23 count])
  {
    [v54 debugDescription];
    uint64_t v35 = v55 = v24;
    id v25 = v56;
    v36 = [v56 FHIRResource];
    uint64_t v37 = [v36 identifier];
    v38 = [v56 FHIRResource];
    unsigned __int8 v39 = [v38 resourceType];
    uint64_t v28 = v57;
    +[NSError hk_assignError:a6, 118, @"%@ No found for clinical record with identifier: %@, resourceType: %@, originalFHIRResourceRowID: %@", v35, v37, v39, v57 code format];

    id v24 = v55;
LABEL_12:
    unsigned int v27 = 0;
    goto LABEL_13;
  }
  id v25 = v56;
  if ((unint64_t)[v23 count] >= 2)
  {
    _HKInitializeLogging();
    v26 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
    {
      id v47 = v26;
      id v48 = [v54 debugDescription];
      id v49 = [v56 FHIRResource];
      id v50 = [v49 identifier];
      v51 = [v56 FHIRResource];
      id v52 = [v51 resourceType];
      *(_DWORD *)buf = 138544131;
      long long v60 = v48;
      __int16 v61 = 2113;
      __int16 v62 = v50;
      __int16 v63 = 2113;
      id v64 = v52;
      __int16 v65 = 2114;
      id v66 = v57;
      _os_log_fault_impl(&dword_0, v47, OS_LOG_TYPE_FAULT, "%{public}@ More than one clinical record found with identifier: %{private}@, resourceType: %{private}@, originalFHIRResourceRowID: %{public}@ found in the database.", buf, 0x2Au);
    }
  }
  unsigned int v27 = [v23 firstObject];
  uint64_t v28 = v57;
LABEL_13:

  return v27;
}

@end