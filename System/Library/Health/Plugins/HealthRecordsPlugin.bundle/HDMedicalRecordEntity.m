@interface HDMedicalRecordEntity
+ (BOOL)_enumerateEntitiesWithOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)_insertMedicalRecords:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_insertOrReplaceMedicalRecord:(id)a3 existingRecord:(id)a4 accountIdentifier:(id)a5 profile:(id)a6 didInsert:(BOOL *)a7 didUpdate:(BOOL *)a8 error:(id *)a9;
+ (Class)medicalRecordEntityForDataTypeCode:(id)a3;
+ (id)_existingMedicalRecord:(id)a3 originalFHIRResourceRowID:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7;
+ (id)_medicalRecordProvenanceForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_medicalRecordsWithPredicate:(id)a3 withoutConceptIndex:(BOOL)a4 excludeSignedClinicalDataRecords:(BOOL)a5 database:(id)a6 profile:(id)a7 error:(id *)a8;
+ (id)_predicateForRecordsWithOriginalFHIRResourceROWID:(id)a3;
+ (id)medicalRecordWithSourceBundleIdentifier:(id)a3 FHIRIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)processMedicalRecordsInExtractionResult:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)processMedicalRecordsInExtractionResultItem:(id)a3 accountIdentifier:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7;
- (BOOL)_updateOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5;
@end

@implementation HDMedicalRecordEntity

+ (id)medicalRecordWithSourceBundleIdentifier:(id)a3 FHIRIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1DB94;
  v30 = sub_1DBA4;
  id v31 = 0;
  v13 = [v12 database];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1DBAC;
  v20[3] = &unk_112468;
  id v25 = a1;
  id v14 = v10;
  id v21 = v14;
  id v15 = v12;
  id v22 = v15;
  id v16 = v11;
  id v23 = v16;
  v24 = &v26;
  LODWORD(a6) = [a1 performReadTransactionWithHealthDatabase:v13 error:a6 block:v20];

  if (a6) {
    v17 = (void *)v27[5];
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  _Block_object_dispose(&v26, 8);

  return v18;
}

+ (id)processMedicalRecordsInExtractionResult:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  _HKInitializeLogging();
  v13 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = NSStringFromClass((Class)a1);
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
  id v16 = [v12 database];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1DFA4;
  v30[3] = &unk_112468;
  id v35 = a1;
  id v31 = v10;
  id v32 = v11;
  id v33 = v12;
  v34 = buf;
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_1E10C;
  uint64_t v26 = &unk_112490;
  id v17 = v31;
  id v27 = v17;
  id v18 = v32;
  id v28 = v18;
  id v19 = v33;
  id v29 = v19;
  unsigned int v20 = [a1 performWriteTransactionWithHealthDatabase:v16 error:a6 block:v30 inaccessibilityHandler:&v23];

  if (v20)
  {
    id v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", *(void *)(*(void *)&buf[8] + 24), v23, v24, v25, v26, v27, v28);
  }
  else
  {
    id v21 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v21;
}

+ (id)processMedicalRecordsInExtractionResultItem:(id)a3 accountIdentifier:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v57 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [v12 originalFHIRResource];
  id v16 = [v15 existingRowID];

  if (!v16)
  {
    v38 = [v12 originalFHIRResource];
    +[NSError hk_assignError:a7, 3, @"cannot process extraction result item for a resource that doesn't know its ROWID. Resource: %@", v38 code format];

    v39 = 0;
    goto LABEL_32;
  }
  id v17 = [a1 _predicateForRecordsWithOriginalFHIRResourceROWID:v16];
  id v18 = [a1 _medicalRecordsWithPredicate:v17 withoutConceptIndex:1 excludeSignedClinicalDataRecords:0 database:v13 profile:v14 error:a7];
  if (v18)
  {
    id v53 = a1;
    v54 = a7;
    v49 = v18;
    v50 = v17;
    v55 = v14;
    v56 = v16;
    id v47 = v13;
    id v19 = objc_msgSend(v18, "hk_mapToDictionary:", &stru_1124D0);
    id v20 = [v19 mutableCopy];

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v48 = v12;
    id obj = [v12 units];
    id v21 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = 0;
      uint64_t v24 = *(void *)v59;
      uint64_t v52 = _HKPrivateMetadataKeyOriginalFHIRResourceROWID;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v59 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          id v27 = [v26 medicalRecord];
          if (v27)
          {
            id v28 = v27;
            id v29 = [v27 metadata];
            id v30 = [v29 mutableCopy];
            id v31 = v30;
            if (v30) {
              id v32 = v30;
            }
            else {
              id v32 = objc_alloc_init((Class)NSMutableDictionary);
            }
            v34 = v32;

            [v34 setObject:v56 forKeyedSubscript:v52];
            [v28 _setMetadata:v34];
            id v35 = [v28 FHIRIdentifier];
            if (!v35)
            {
              +[NSError hk_assignError:v54, 3, @"nil FHIR identifier on %@", v28 code format];
LABEL_29:

              v39 = 0;
              id v13 = v47;
              id v12 = v48;
              id v14 = v55;
              goto LABEL_30;
            }
            v36 = [v20 objectForKeyedSubscript:v35];
            unsigned int v37 = [v53 _insertOrReplaceMedicalRecord:v28 existingRecord:v36 accountIdentifier:v57 profile:v55 didInsert:0 didUpdate:0 error:v54];

            if (!v37) {
              goto LABEL_29;
            }
            ++v23;
            [v20 removeObjectForKey:v35];
          }
          else
          {
            _HKInitializeLogging();
            id v33 = HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v63 = v26;
              _os_log_fault_impl(&dword_0, v33, OS_LOG_TYPE_FAULT, "HDMedicalRecordEntity unexpectedly found nil medicalRecord on HDExtractionResultItemUnit: %{public}@", buf, 0xCu);
            }
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v23 = 0;
    }

    id v13 = v47;
    id v12 = v48;
    id v14 = v55;
    if ([v20 count])
    {
      v40 = [v55 dataManager];
      v41 = [v20 allValues];
      unsigned int v42 = [v40 deleteDataObjects:v41 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:v54];

      v39 = 0;
      if (!v42)
      {
LABEL_30:

        id v16 = v56;
        id v18 = v49;
        id v17 = v50;
        goto LABEL_31;
      }
      _HKInitializeLogging();
      v43 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
      {
        v44 = v43;
        id v45 = [v20 count];
        *(_DWORD *)buf = 138543618;
        id v63 = v53;
        __int16 v64 = 2048;
        id v65 = v45;
        _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "%{public}@ deleted %lu obsolete medical records", buf, 0x16u);
      }
    }
    v39 = +[NSNumber numberWithUnsignedInteger:v23];
    goto LABEL_30;
  }
  v39 = 0;
LABEL_31:

LABEL_32:

  return v39;
}

+ (BOOL)_insertOrReplaceMedicalRecord:(id)a3 existingRecord:(id)a4 accountIdentifier:(id)a5 profile:(id)a6 didInsert:(BOOL *)a7 didUpdate:(BOOL *)a8 error:(id *)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = v18;
  BOOL v20 = v16 != 0;
  BOOL v60 = v16 != 0;
  SEL v61 = a2;
  if (v16)
  {
    long long v58 = a7;
    unsigned int v21 = [v15 enteredInError];
    if (v21)
    {
      id v22 = [v16 UUID];
      id v70 = 0;
      unsigned __int8 v23 = +[HDMedicalDownloadableAttachmentEntity _deleteAttachmentsWithMedicalRecordIdentifier:v22 profile:v19 error:&v70];
      id v24 = v70;

      id obj = 0;
      if ((v23 & 1) == 0)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_ABD8C();
        }
        id obj = 0;
      }
    }
    else
    {
      if ([v16 isEquivalent:v15])
      {
        id v27 = [v15 extractionVersion];
        if ((uint64_t)v27 <= (uint64_t)[v16 extractionVersion])
        {
          [v15 enteredInError];
          char v33 = 0;
          BOOL v20 = 0;
          id obj = 0;
          a7 = v58;
          goto LABEL_36;
        }
      }
      id v69 = 0;
      uint64_t v28 = +[HDMedicalDownloadableAttachmentEntity _attachmentsAfterRelinkingFromMedicalRecord:v16 toMedicalRecord:v15 profile:v19 error:&v69];
      id v24 = v69;
      id obj = (id)v28;
      if (!v28)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_ABDF4();
        }
      }
    }

    id v29 = [v19 dataManager];
    id v77 = v16;
    id v30 = +[NSArray arrayWithObjects:&v77 count:1];
    unsigned int v31 = [v29 deleteDataObjects:v30 restrictedSourceEntities:0 failIfNotFound:1 recursiveDeleteAuthorizationBlock:0 error:a9];

    if (!v31) {
      goto LABEL_31;
    }
    id v25 = v19;
    int v26 = v21 ^ 1;
    a7 = v58;
    BOOL v20 = v16 != 0;
  }
  else
  {
    id v25 = v18;
    id obj = 0;
    int v26 = 1;
  }
  unsigned int v32 = [v15 enteredInError];
  char v33 = 0;
  if (v26 && !v32)
  {
    v34 = [v15 metadata];
    id v35 = [v34 objectForKeyedSubscript:_HKPrivateMetadataKeyOriginalFHIRResourceROWID];

    id v19 = v25;
    if (!v35)
    {
      id v53 = +[NSAssertionHandler currentHandler];
      [v53 handleFailureInMethod:v61 object:a1 file:@"HDMedicalRecordEntity+HealthRecordsPlugin.m" lineNumber:247 description:@"Medical records without the original FHIR resource ROWID in their metadata cannot be inserted"];
    }
    id v76 = v15;
    v36 = +[NSArray arrayWithObjects:&v76 count:1];
    unsigned int v37 = [a1 _insertMedicalRecords:v36 accountIdentifier:v17 profile:v25 error:a9];

    if (v37)
    {
      long long v59 = a7;
      v38 = [v25 attachmentManager];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v39 = obj;
      id v40 = [v39 countByEnumeratingWithState:&v65 objects:v75 count:16];
      id obj = v39;
      if (v40)
      {
        id v41 = v40;
        v54 = v25;
        v55 = a8;
        id v56 = v17;
        id v57 = v16;
        uint64_t v42 = *(void *)v66;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v66 != v42) {
              objc_enumerationMutation(obj);
            }
            v44 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "hkAttachment", v54, v55, v56, v57);
            id v45 = [v15 attachmentObjectIdentifier];
            v46 = [v15 attachmentSchemaIdentifier];
            id v64 = 0;
            id v47 = [v38 addReferenceWithAttachment:v44 toObjectWithIdentifier:v45 schemaIdentifier:v46 metadata:0 error:&v64];
            id v48 = v64;

            if (!v47)
            {
              _HKInitializeLogging();
              v49 = HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543619;
                id v72 = a1;
                __int16 v73 = 2113;
                id v74 = v48;
                _os_log_error_impl(&dword_0, v49, OS_LOG_TYPE_ERROR, "%{public}@ Failed to recreate HKAttachmentReference for medical records being re-inserted with error: %{private}@", buf, 0x16u);
              }
            }
          }
          id v41 = [obj countByEnumeratingWithState:&v65 objects:v75 count:16];
        }
        while (v41);

        char v33 = 1;
        id v17 = v56;
        id v16 = v57;
        id v19 = v54;
        a8 = v55;
      }
      else
      {

        char v33 = 1;
      }
      a7 = v59;
      BOOL v20 = v60;
      goto LABEL_36;
    }
LABEL_31:
    BOOL v50 = 0;
    v51 = obj;
    goto LABEL_41;
  }
  id v19 = v25;
LABEL_36:
  if (a7) {
    *a7 = v33 & !v20;
  }
  v51 = obj;
  if (a8) {
    *a8 = v20 & v33;
  }
  BOOL v50 = 1;
LABEL_41:

  return v50;
}

+ (BOOL)_insertMedicalRecords:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 count])
  {
    id v13 = [a1 _medicalRecordProvenanceForAccountIdentifier:v11 profile:v12 error:a6];
    if (v13)
    {
      id v14 = [v12 dataManager];
      id v15 = [v10 firstObject];
      [v15 _creationTimestamp];
      unsigned __int8 v16 = objc_msgSend(v14, "insertDataObjects:withProvenance:creationDate:error:", v10, v13, a6);
    }
    else
    {
      unsigned __int8 v16 = 0;
    }
  }
  else
  {
    +[NSError hk_assignError:a6 code:3 description:@"No records given"];
    unsigned __int8 v16 = 0;
  }

  return v16;
}

+ (BOOL)_enumerateEntitiesWithOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [a1 _predicateForRecordsWithOriginalFHIRResourceROWID:a3];
  id v13 = [a1 queryWithDatabase:v11 predicate:v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1EE60;
  v16[3] = &unk_1124F8;
  id v17 = v10;
  id v14 = v10;
  LOBYTE(a5) = [v13 enumeratePersistentIDsAndProperties:0 error:a5 enumerationHandler:v16];

  return (char)a5;
}

- (BOOL)_updateOriginalFHIRResourceROWID:(id)a3 database:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v15 = HDMedicalRecordEntityPropertyOriginalFHIRResourceROWID;
  id v9 = a4;
  id v10 = +[NSArray arrayWithObjects:&v15 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1F074;
  v13[3] = &unk_111B40;
  id v14 = v8;
  id v11 = v8;
  LOBYTE(a5) = [(HDMedicalRecordEntity *)self updateProperties:v10 database:v9 error:a5 bindingHandler:v13];

  return (char)a5;
}

+ (Class)medicalRecordEntityForDataTypeCode:(id)a3
{
  uint64_t v3 = qword_137180;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_137180, &stru_112518);
  }
  v5 = [(id)qword_137178 objectForKeyedSubscript:v4];

  return (Class)v5;
}

+ (id)_medicalRecordsWithPredicate:(id)a3 withoutConceptIndex:(BOOL)a4 excludeSignedClinicalDataRecords:(BOOL)a5 database:(id)a6 profile:(id)a7 error:(id *)a8
{
  BOOL v12 = a4;
  id v15 = a3;
  id v16 = a6;
  id v47 = a7;
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v46 = a1;
  id v18 = [a1 queryWithDatabase:v16 predicate:v15];
  uint64_t v44 = HDDataEntityPropertyDataID;
  v60[0] = HDDataEntityPropertyDataID;
  v60[1] = HDDataEntityPropertyType;
  v60[2] = HDSampleEntityPropertyDataType;
  id v19 = +[NSArray arrayWithObjects:v60 count:3];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1F788;
  v54[3] = &unk_112540;
  BOOL v56 = a5;
  id v20 = v17;
  id v55 = v20;
  id v45 = a8;
  unsigned int v21 = [v18 enumeratePersistentIDsAndProperties:v19 error:a8 enumerationHandler:v54];

  if (v21)
  {
    id v41 = v16;
    id v42 = v15;
    id v43 = objc_alloc_init((Class)NSMutableArray);
    SEL v39 = a2;
    if (v12)
    {
      uint64_t v58 = HDMedicalRecordEntityEncodingOptionSkipApplyingConceptIndex;
      long long v59 = &__kCFBooleanTrue;
      id v22 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    }
    else
    {
      id v22 = 0;
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v40 = v20;
    id v24 = v20;
    id v25 = [v24 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v51 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          id v30 = [v46 medicalRecordEntityForDataTypeCode:v29];
          if (!v30)
          {
            id v35 = +[NSAssertionHandler currentHandler];
            [v35 handleFailureInMethod:v39, v46, @"HDMedicalRecordEntity+HealthRecordsPlugin.m", 428, @"Unmapped data type code %@", v29 object file lineNumber description];
          }
          unsigned int v31 = [v24 objectForKeyedSubscript:v29];
          if (![v31 count])
          {
            v36 = +[NSAssertionHandler currentHandler];
            [v36 handleFailureInMethod:v39, v46, @"HDMedicalRecordEntity+HealthRecordsPlugin.m", 431, @"Should not have an empty row ID array for data type code %@", v29 object file lineNumber description];
          }
          unsigned int v32 = +[HDSQLiteContainsPredicate containsPredicateWithProperty:v44 values:v31];
          char v33 = [v30 entityEnumeratorWithProfile:v47];
          [v33 setPredicate:v32];
          if (v22) {
            [v33 addEncodingOptionsFromDictionary:v22];
          }
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_1F8C8;
          v48[3] = &unk_112568;
          id v49 = v43;
          unsigned int v34 = [v33 enumerateWithError:v45 handler:v48];

          if (!v34)
          {

            id v23 = 0;
            unsigned int v37 = v43;
            goto LABEL_22;
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v50 objects:v57 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    unsigned int v37 = v43;
    id v23 = [v43 copy];
LABEL_22:

    id v16 = v41;
    id v15 = v42;
    id v20 = v40;
  }
  else
  {
    id v23 = 0;
  }

  return v23;
}

+ (id)_predicateForRecordsWithOriginalFHIRResourceROWID:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalRecordEntityPropertyOriginalFHIRResourceROWID equalToValue:a3];
}

+ (id)_medicalRecordProvenanceForAccountIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v8 sourceManager];
  id v16 = 0;
  id v10 = [v9 privateSourceForClinicalAccountIdentifier:v7 provenance:0 createOrUpdateIfNecessary:0 nameOnCreateOrUpdate:0 error:&v16];
  id v11 = v16;

  if (v10)
  {
    BOOL v12 = [v8 dataProvenanceManager];
    id v13 = [v12 localDataProvenanceForSourceEntity:v10 version:0 deviceEntity:0];

    if (v13) {
      id v14 = v13;
    }
    else {
      +[NSError hk_assignError:a5 code:100 description:@"Failed to get provenance for medical record source entity"];
    }

    goto LABEL_12;
  }
  if (v11)
  {
    if (a5)
    {
      id v13 = 0;
      *a5 = v11;
      goto LABEL_12;
    }
    _HKLogDroppedError();
  }
  else
  {
    +[NSError hk_assignError:a5, 100, @"no matching medical record source entity is present for account with identifier %@", v7 code format];
  }
  id v13 = 0;
LABEL_12:

  return v13;
}

+ (id)_existingMedicalRecord:(id)a3 originalFHIRResourceRowID:(id)a4 database:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = HDMedicalRecordEntityPropertyOriginalFHIRResourceROWID;
  id v13 = a6;
  id v14 = a5;
  id v15 = +[HDSQLiteComparisonPredicate predicateWithProperty:v12 equalToValue:v11];
  v60[0] = v15;
  id v16 = [v10 FHIRIdentifier];
  id v17 = HDMedicalRecordEntityPredicateForFHIRIdentifier();
  v60[1] = v17;
  id v18 = +[NSArray arrayWithObjects:v60 count:2];
  id v19 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v18];

  id v49 = 0;
  id v20 = +[HDMedicalRecordEntity _medicalRecordsWithPredicate:v19 withoutConceptIndex:1 excludeSignedClinicalDataRecords:0 database:v14 profile:v13 error:&v49];

  id v21 = v49;
  if (!v20)
  {
    _HKInitializeLogging();
    id v24 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      log = v24;
      uint64_t v44 = [a1 debugDescription];
      unsigned int v34 = [v10 FHIRIdentifier];
      id v35 = [v34 identifier];
      v36 = [v10 FHIRIdentifier];
      unsigned int v37 = [v36 resourceType];
      *(_DWORD *)buf = 138544387;
      long long v51 = v44;
      __int16 v52 = 2113;
      long long v53 = v35;
      __int16 v54 = 2113;
      id v55 = v37;
      __int16 v56 = 2114;
      id v57 = v11;
      __int16 v58 = 2114;
      id v59 = v21;
      _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Error quering for medicalRecord record with identifier: %{private}@, resourceType: %{private}@, originalFHIRResourceRowID: %{public}@. Error: %{public}@ ", buf, 0x34u);

      if (v21) {
        goto LABEL_12;
      }
    }
    else if (v21)
    {
LABEL_12:
      id v23 = 0;
      goto LABEL_13;
    }
    id v25 = [a1 debugDescription];
    id v26 = [v10 FHIRIdentifier];
    uint64_t v27 = [v26 identifier];
    uint64_t v28 = [v10 FHIRIdentifier];
    uint64_t v29 = [v28 resourceType];
    +[NSError hk_assignError:a7, 2000, @"%@ Error quering for medicalRecord record with identifier: %@, resourceType: %@, originalFHIRResourceRowID: %@", v25, v27, v29, v11 code format];

LABEL_11:
    goto LABEL_12;
  }
  if (![v20 count])
  {
    id v25 = [a1 debugDescription];
    id v26 = [v10 FHIRIdentifier];
    uint64_t v27 = [v26 identifier];
    uint64_t v28 = [v10 FHIRIdentifier];
    [v28 resourceType];
    id v30 = v19;
    v32 = id v31 = v21;
    +[NSError hk_assignError:a7, 118, @"%@ No found for medicalRecord record with identifier: %@, resourceType: %@, originalFHIRResourceRowID: %@", v25, v27, v32, v11 code format];

    id v21 = v31;
    id v19 = v30;
    goto LABEL_11;
  }
  if ((unint64_t)[v20 count] >= 2)
  {
    _HKInitializeLogging();
    id v22 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
    {
      v38 = v22;
      SEL v39 = [a1 debugDescription];
      id v40 = [v10 FHIRIdentifier];
      [v40 identifier];
      v41 = id v48 = v21;
      id v42 = [v10 FHIRIdentifier];
      id v43 = [v42 resourceType];
      *(_DWORD *)buf = 138544131;
      long long v51 = v39;
      __int16 v52 = 2113;
      long long v53 = v41;
      __int16 v54 = 2113;
      id v55 = v43;
      __int16 v56 = 2114;
      id v57 = v11;
      _os_log_fault_impl(&dword_0, v38, OS_LOG_TYPE_FAULT, "%{public}@ More than one medicalRecord record found with identifier: %{private}@, resourceType: %{private}@, originalFHIRResourceRowID: %{public}@ found in the database.", buf, 0x2Au);

      id v21 = v48;
    }
  }
  id v23 = [v20 firstObject];
LABEL_13:

  return v23;
}

@end