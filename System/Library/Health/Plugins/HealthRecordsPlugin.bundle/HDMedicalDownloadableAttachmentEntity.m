@interface HDMedicalDownloadableAttachmentEntity
+ (BOOL)_attachmentMatchesDownloadableAttachment:(id)a3 hdAttachment:(id)a4;
+ (BOOL)_checkForObsoleteDownloadableAttachmentsForMedicalRecord:(id)a3 extractedDownloadableAttachments:(id)a4 medicalObjectIdentifier:(id)a5 clinicalObjectIdentifier:(id)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)_deleteAttachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)_deleteAttachmentsWithMedicalRecordIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)_markAvailableAndClearInlineDataForAttachmentWithIdentifier:(id)a3 attachmentIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_processClinicalNotesType:(id)a3 medicalRecord:(id)a4 clinicalRecord:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)_reconcileExistingAttachmentsIfFoundForDownloadableAttachment:(id)a3 medicalRecord:(id)a4 clinicalRecord:(id)a5 attachment:(id *)a6 profile:(id)a7 error:(id *)a8;
+ (BOOL)_updateHKAttachmentIdentifierForAttachmentWithIdentifier:(id)a3 attachmentIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)_updateWithExistingAttachmentIfFoundForDownloadableAttachment:(id)a3 medicalRecord:(id)a4 clinicalRecord:(id)a5 profile:(id)a6 error:(id *)a7;
+ (BOOL)deleteAttachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)enumerateAttachmentsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6;
+ (BOOL)insertAttachment:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)insertOrUpdateAttachment:(id)a3 shouldReplace:(BOOL)a4 profile:(id)a5 error:(id *)a6;
+ (BOOL)updateAttachment:(id)a3 profile:(id)a4 error:(id *)a5;
+ (BOOL)updateAttachmentWithIdentifier:(id)a3 properties:(id)a4 profile:(id)a5 error:(id *)a6 bindingHandler:(id)a7;
+ (id)_attachmentEntityForIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5;
+ (id)_attachmentRefsForDownloadableAttachment:(id)a3 attachmentObjectIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_attachmentsAfterRelinkingFromClinicalRecord:(id)a3 toClinicalRecord:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_attachmentsAfterRelinkingFromMedicalRecord:(id)a3 toMedicalRecord:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_attachmentsForDownloadableAttachment:(id)a3 attachmentObjectIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (id)_checkForExistingDownloadableAttachment:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)_insertOrUpdateAttachment:(id)a3 shouldReplace:(BOOL)a4 databaseTransaction:(id)a5 error:(id *)a6;
+ (id)_predicateForDownloadableAttachmentsWithMedicalRecordIdentifier:(id)a3;
+ (id)_propertiesForEntity;
+ (id)attachmentForRow:(HDSQLiteRow *)a3;
+ (id)attachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
+ (id)processMedicalDownloadableAttachmentsInExtractionResult:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6;
+ (void)_removeDuplicateAttachments:(id)a3 profile:(id)a4;
@end

@implementation HDMedicalDownloadableAttachmentEntity

+ (BOOL)insertAttachment:(id)a3 profile:(id)a4 error:(id *)a5
{
  return [a1 insertOrUpdateAttachment:a3 shouldReplace:0 profile:a4 error:a5];
}

+ (BOOL)updateAttachment:(id)a3 profile:(id)a4 error:(id *)a5
{
  return [a1 insertOrUpdateAttachment:a3 shouldReplace:1 profile:a4 error:a5];
}

+ (BOOL)insertOrUpdateAttachment:(id)a3 shouldReplace:(BOOL)a4 profile:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [[HDInsertOrUpdateMedicalDownloadableAttachmentOperation alloc] initWithAttachment:v10 shouldReplace:v7];

  LOBYTE(a6) = [(HDInsertOrUpdateMedicalDownloadableAttachmentOperation *)v11 performOrJournalWithProfile:v9 error:a6];
  return (char)a6;
}

+ (id)processMedicalDownloadableAttachmentsInExtractionResult:(id)a3 accountIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
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
  v30[2] = sub_7E38C;
  v30[3] = &unk_112468;
  id v31 = v10;
  id v35 = a1;
  id v32 = v12;
  id v33 = v11;
  v34 = buf;
  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_7ECAC;
  v26 = &unk_112490;
  id v17 = v31;
  id v27 = v17;
  id v18 = v33;
  id v28 = v18;
  id v19 = v32;
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

+ (BOOL)_processClinicalNotesType:(id)a3 medicalRecord:(id)a4 clinicalRecord:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v27 = 0;
  id v16 = [a1 _checkForExistingDownloadableAttachment:v12 profile:v15 error:&v27];
  id v17 = v27;
  if (!v17)
  {
    if (v16)
    {
      if (v13) {
        goto LABEL_6;
      }
    }
    else
    {
      id v26 = 0;
      uint64_t v19 = [a1 insertAttachment:v12 profile:v15 error:&v26];
      id v20 = v26;
      if ((v19 & 1) == 0)
      {
        _HKInitializeLogging();
        v21 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = v21;
          v25 = [a1 debugDescription];
          *(_DWORD *)buf = 138543874;
          id v29 = v25;
          __int16 v30 = 2114;
          id v31 = v12;
          __int16 v32 = 2114;
          id v33 = v20;
          _os_log_error_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "%{public}@ failed to store downloadable attachment %{public}@, will discard. Error: %{public}@", buf, 0x20u);
        }
        id v22 = v20;
        if (v22)
        {
          if (a7) {
            *a7 = v22;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v16 = 0;
        goto LABEL_18;
      }
      id v16 = v12;

      if (v13)
      {
LABEL_6:
        unsigned __int8 v18 = [a1 _updateWithExistingAttachmentIfFoundForDownloadableAttachment:v16 medicalRecord:v13 clinicalRecord:v14 profile:v15 error:a7];
        goto LABEL_19;
      }
    }
    unsigned __int8 v18 = 1;
    goto LABEL_19;
  }
  if (!a7)
  {
    _HKLogDroppedError();
LABEL_18:
    unsigned __int8 v18 = 0;
    goto LABEL_19;
  }
  unsigned __int8 v18 = 0;
  *a7 = v17;
LABEL_19:

  return v18;
}

+ (id)_checkForExistingDownloadableAttachment:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 accountIdentifier];

  if (v10)
  {
    id v11 = [v8 medicalRecordIdentifier];
    id v12 = [a1 _predicateForDownloadableAttachmentsWithMedicalRecordIdentifier:v11];

    id v13 = [v8 webURL];

    if (v13)
    {
      id v14 = [v8 webURL];
      id v15 = [v14 absoluteString];
      id v16 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyWebURL equalToValue:v15];
    }
    else
    {
      uint64_t v19 = [v8 inlineDataChecksum];

      if (!v19) {
        goto LABEL_13;
      }
      id v14 = [v8 inlineDataChecksum];
      id v16 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyInlineDataChecksum equalToValue:v14];
    }

    if (v16)
    {
      id v20 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v12 otherPredicate:v16];
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x3032000000;
      v40 = sub_7F3D4;
      v41 = sub_7F3E4;
      id v42 = objc_alloc_init((Class)NSMutableArray);
      v35[4] = &v37;
      id v36 = 0;
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_7F3EC;
      v35[3] = &unk_1144A0;
      +[HDMedicalDownloadableAttachmentEntity enumerateAttachmentsWithPredicate:v20 profile:v9 error:&v36 enumerationHandler:v35];
      id v21 = v36;
      id v22 = v21;
      if (v21)
      {
        id v23 = v21;
        uint64_t v24 = v23;
        if (a5) {
          *a5 = v23;
        }
        else {
          _HKLogDroppedError();
        }

        unsigned __int8 v18 = 0;
      }
      else
      {
        if ((unint64_t)[(id)v38[5] count] >= 2)
        {
          id v26 = [v8 webURL];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            __int16 v32 = [v8 inlineDataChecksum];
            BOOL v33 = v32 == 0;

            if (!v33)
            {
              _HKInitializeLogging();
              v34 = HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
                sub_B2888(v34);
              }
            }
          }
          else
          {
            _HKInitializeLogging();
            id v28 = HKLogHealthRecords;
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              id v29 = [v8 webURL];
              __int16 v30 = [v29 absoluteString];
              sub_B28CC(v30, buf, v28, v29);
            }
          }
        }
        unsigned __int8 v18 = [(id)v38[5] firstObject];
      }
      _Block_object_dispose(&v37, 8);

LABEL_25:
      goto LABEL_26;
    }
LABEL_13:
    _HKInitializeLogging();
    v25 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
      sub_B27E4(v25, a1);
    }
    +[NSError hk_assignError:a5 code:3 format:@"HKMedicalDownloadableAttachment has neither a webURL nor an inlineDataChecksum"];
    unsigned __int8 v18 = 0;
    goto LABEL_25;
  }
  _HKInitializeLogging();
  id v17 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
    sub_B2740(v17, a1);
  }
  +[NSError hk_assignError:a5 code:3 format:@"HKMedicalDownloadableAttachment has no accountIdentifier"];
  unsigned __int8 v18 = 0;
LABEL_26:

  return v18;
}

+ (BOOL)_updateWithExistingAttachmentIfFoundForDownloadableAttachment:(id)a3 medicalRecord:(id)a4 clinicalRecord:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a6;
  id v26 = 0;
  LODWORD(a4) = [a1 _reconcileExistingAttachmentsIfFoundForDownloadableAttachment:v12 medicalRecord:a4 clinicalRecord:a5 attachment:&v26 profile:v13 error:a7];
  id v14 = v26;
  id v15 = v14;
  if (a4)
  {
    if (!v14)
    {
LABEL_11:
      BOOL v21 = 1;
      goto LABEL_12;
    }
    id v16 = [v12 metadata];
    id v17 = [v16 objectForKeyedSubscript:HKMedicalDownloadableAttachmentMetadataNeedsReIndexingKey];

    if (!v17
      && ([v12 status] == (char *)&dword_4 + 2
       || [v12 status] == (char *)&dword_4 + 1
       || [v12 status] == (char *)&dword_8 + 1))
    {
      id v22 = [v15 identifier];
      id v23 = [v12 attachmentIdentifier];
      unsigned __int8 v24 = [v22 isEqual:v23];

      if (v24) {
        goto LABEL_11;
      }
      unsigned __int8 v18 = [v12 identifier];
      uint64_t v19 = [v15 identifier];
      unsigned __int8 v20 = [a1 _updateHKAttachmentIdentifierForAttachmentWithIdentifier:v18 attachmentIdentifier:v19 profile:v13 error:a7];
    }
    else
    {
      unsigned __int8 v18 = [v12 identifier];
      uint64_t v19 = [v15 identifier];
      unsigned __int8 v20 = [a1 _markAvailableAndClearInlineDataForAttachmentWithIdentifier:v18 attachmentIdentifier:v19 profile:v13 error:a7];
    }
    BOOL v21 = v20;
  }
  else
  {
    BOOL v21 = 0;
  }
LABEL_12:

  return v21;
}

+ (BOOL)_reconcileExistingAttachmentsIfFoundForDownloadableAttachment:(id)a3 medicalRecord:(id)a4 clinicalRecord:(id)a5 attachment:(id *)a6 profile:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v19 = [v15 attachmentObjectIdentifier];
  unsigned __int8 v20 = [a1 _attachmentsForDownloadableAttachment:v14 attachmentObjectIdentifier:v19 profile:v17 error:a8];

  if (!v20)
  {
    LOBYTE(v22) = 0;
    goto LABEL_32;
  }
  [v18 addObjectsFromArray:v20];
  v40 = v15;
  if (v16)
  {
    BOOL v21 = [v16 attachmentObjectIdentifier];
    id v22 = [a1 _attachmentsForDownloadableAttachment:v14 attachmentObjectIdentifier:v21 profile:v17 error:a8];

    if (!v22)
    {
      id v15 = v40;
      goto LABEL_32;
    }
    [v18 addObjectsFromArray:v22];

    id v15 = v40;
  }
  if ((unint64_t)[v18 count] > 1)
  {
    id v23 = objc_msgSend(v18, "hk_firstSortedObjectWithComparison:", &stru_1144E0);
    [v18 removeObject:v23];
    if (a6) {
      *a6 = v23;
    }
    if ([v18 count])
    {
      unsigned __int8 v24 = [v18 allObjects];
      [a1 _removeDuplicateAttachments:v24 profile:v17];

      id v15 = v40;
    }
    v25 = [v15 attachmentObjectIdentifier];
    id v26 = [a1 _attachmentRefsForDownloadableAttachment:v14 attachmentObjectIdentifier:v25 profile:v17 error:a8];

    uint64_t v37 = v26;
    uint64_t v39 = v23;
    if (v26)
    {
      if ([v26 count])
      {
        id v15 = v40;
        if (!v16)
        {
          LOBYTE(v22) = 1;
          goto LABEL_30;
        }
LABEL_24:
        id v29 = [v16 attachmentObjectIdentifier];
        __int16 v30 = [a1 _attachmentRefsForDownloadableAttachment:v14 attachmentObjectIdentifier:v29 profile:v17 error:a8];

        id v15 = v40;
        if (!v30) {
          goto LABEL_28;
        }
        if ([v30 count]) {
          goto LABEL_27;
        }
        id v31 = [v17 attachmentManager];
        __int16 v32 = [v39 hkAttachment];
        BOOL v33 = [v16 attachmentObjectIdentifier];
        v34 = [v31 addReferenceWithAttachment:v32 toObjectWithIdentifier:v33 schemaIdentifier:HKAttachmentClinicalRecordSchemaIdentifier metadata:0 error:a8];

        id v15 = v40;
        if (v34) {
LABEL_27:
        }
          LOBYTE(v22) = 1;
        else {
LABEL_28:
        }
          LOBYTE(v22) = 0;

        goto LABEL_30;
      }
      id v36 = [v17 attachmentManager];
      id v22 = [v23 hkAttachment];
      BOOL v27 = [v40 attachmentObjectIdentifier];
      id v28 = [v36 addReferenceWithAttachment:v22 toObjectWithIdentifier:v27 schemaIdentifier:HKAttachmentClinicalRecordSchemaIdentifier metadata:0 error:a8];

      LOBYTE(v22) = v28 != 0;
      if (v16)
      {
        id v15 = v40;
        if (v28) {
          goto LABEL_24;
        }
LABEL_30:

        goto LABEL_32;
      }
    }
    else
    {
      LOBYTE(v22) = 0;
    }
    id v15 = v40;
    goto LABEL_30;
  }
  if (a6 && [v18 count] == (char *)&dword_0 + 1)
  {
    v38 = [v18 allObjects];
    *a6 = [v38 firstObject];
    LOBYTE(v22) = 1;
  }
  else
  {
    LOBYTE(v22) = 1;
  }
LABEL_32:

  return (char)v22;
}

+ (id)_attachmentsForDownloadableAttachment:(id)a3 attachmentObjectIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = [v11 attachmentManager];

  uint64_t v15 = HKAttachmentClinicalRecordSchemaIdentifier;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_7FB94;
  v20[3] = &unk_114508;
  id v23 = a1;
  id v21 = v10;
  id v16 = v13;
  id v22 = v16;
  id v17 = v10;
  LODWORD(a6) = [v14 attachmentReferencesForObjectIdentifier:v12 schemaIdentifier:v15 error:a6 enumerationHandler:v20];

  if (a6) {
    id v18 = v16;
  }
  else {
    id v18 = 0;
  }

  return v18;
}

+ (id)_attachmentRefsForDownloadableAttachment:(id)a3 attachmentObjectIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  id v14 = [v11 attachmentManager];

  uint64_t v15 = HKAttachmentClinicalRecordSchemaIdentifier;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_7FD40;
  v20[3] = &unk_114508;
  id v23 = a1;
  id v21 = v10;
  id v16 = v13;
  id v22 = v16;
  id v17 = v10;
  LODWORD(a6) = [v14 attachmentReferencesForObjectIdentifier:v12 schemaIdentifier:v15 error:a6 enumerationHandler:v20];

  if (a6) {
    id v18 = v16;
  }
  else {
    id v18 = 0;
  }

  return v18;
}

+ (BOOL)_attachmentMatchesDownloadableAttachment:(id)a3 hdAttachment:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v6 metadata];
  id v8 = [v7 objectForKeyedSubscript:HKMedicalDownloadableAttachmentMetadataWebURLKey];

  id v9 = [v5 webURL];
  id v10 = v9;
  if (v9 && v8)
  {
    id v11 = [v5 webURL];
    id v12 = [v11 absoluteString];
    unsigned __int8 v13 = [v12 isEqualToString:v8];

    if (v13)
    {
      unsigned __int8 v14 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  uint64_t v15 = [v6 metadata];
  id v16 = [v15 objectForKeyedSubscript:HKMedicalDownloadableAttachmentMetadataInlineDataChecksumKey];

  id v17 = [v5 inlineDataChecksum];
  unsigned __int8 v14 = 0;
  if (v17 && v16)
  {
    id v18 = [v5 inlineDataChecksum];
    unsigned __int8 v14 = [v18 isEqual:v16];
  }
LABEL_10:

  return v14;
}

+ (void)_removeDuplicateAttachments:(id)a3 profile:(id)a4
{
  id v5 = a3;
  id v15 = a4;
  id v6 = [v15 attachmentManager];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v5;
  id v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v7)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v8);
        uint64_t v22 = 0;
        id v23 = &v22;
        uint64_t v24 = 0x3032000000;
        v25 = sub_7F3D4;
        id v26 = sub_7F3E4;
        id v27 = objc_alloc_init((Class)NSMutableArray);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_801EC;
        v21[3] = &unk_114530;
        v21[4] = &v22;
        [v6 attachmentReferencesForAttachment:v9 error:0 enumerationHandler:v21];
        uint64_t v10 = v23[5];
        id v20 = 0;
        unsigned __int8 v11 = [v6 removeAttachmentReferences:v10 error:&v20];
        id v12 = v20;
        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          unsigned __int8 v13 = HKLogHealthRecords;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          {
            id v17 = [a1 debugDescription];
            unsigned __int8 v14 = [v12 localizedDescription];
            *(_DWORD *)buf = 138543619;
            BOOL v33 = v17;
            __int16 v34 = 2113;
            id v35 = v14;
            _os_log_fault_impl(&dword_0, v13, OS_LOG_TYPE_FAULT, "%{public}@ HDAttachmentManager.removeAttachmentReferences failed removing duplicate HKAttachment with error %{private}@", buf, 0x16u);
          }
        }

        _Block_object_dispose(&v22, 8);
        id v8 = (char *)v8 + 1;
      }
      while (v7 != v8);
      id v7 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v7);
  }
}

+ (BOOL)_checkForObsoleteDownloadableAttachmentsForMedicalRecord:(id)a3 extractedDownloadableAttachments:(id)a4 medicalObjectIdentifier:(id)a5 clinicalObjectIdentifier:(id)a6 profile:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v54 = a5;
  id v53 = a6;
  id v15 = a7;
  v48 = v13;
  v50 = [a1 _predicateForDownloadableAttachmentsWithMedicalRecordIdentifier:v13];
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_7F3D4;
  v70 = sub_7F3E4;
  id v71 = objc_alloc_init((Class)NSMutableArray);
  id v65 = 0;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_807DC;
  v62[3] = &unk_114558;
  id v16 = v14;
  id v63 = v16;
  v64 = &v66;
  +[HDMedicalDownloadableAttachmentEntity enumerateAttachmentsWithPredicate:v50 profile:v15 error:&v65 enumerationHandler:v62];
  id v17 = v65;
  v47 = v16;
  if (v17)
  {
    id v18 = v17;
    id v19 = v18;
    if (a8)
    {
      BOOL v20 = 0;
      *a8 = v18;
    }
    else
    {
      _HKLogDroppedError();
      BOOL v20 = 0;
    }
    id v21 = v19;
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v19 = (id)v67[5];
    id v22 = [v19 countByEnumeratingWithState:&v58 objects:v78 count:16];
    if (v22)
    {
      id obj = v19;
      uint64_t v23 = *(void *)v59;
      uint64_t v52 = HKAttachmentClinicalRecordSchemaIdentifier;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v59 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          id v26 = [v25 attachmentIdentifier];
          BOOL v27 = v26 == 0;

          if (!v27)
          {
            long long v28 = [v15 attachmentManager];
            if (v54)
            {
              long long v29 = [v25 attachmentIdentifier];
              id v57 = 0;
              unsigned __int8 v30 = [v28 removeAllReferencesWithAttachmentIdentifier:v29 objectIdentifier:v54 schemaIdentifier:v52 error:&v57];
              id v31 = v57;

              if ((v30 & 1) == 0)
              {
                _HKInitializeLogging();
                __int16 v32 = HKLogHealthRecords;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v39 = [a1 debugDescription];
                  uint64_t v40 = [v25 attachmentIdentifier];
                  *(_DWORD *)buf = 138543875;
                  v73 = v39;
                  __int16 v74 = 2114;
                  uint64_t v75 = v40;
                  __int16 v76 = 2113;
                  id v77 = v31;
                  v45 = (void *)v40;
                  _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove HKAttachmentReferences for medicalRecord from HKAttachment with identifier %{public}@. Error: %{private}@", buf, 0x20u);
                }
              }
            }
            if (v53)
            {
              BOOL v33 = [v25 attachmentIdentifier];
              id v56 = 0;
              unsigned __int8 v34 = [v28 removeAllReferencesWithAttachmentIdentifier:v33 objectIdentifier:v53 schemaIdentifier:v52 error:&v56];
              id v35 = v56;

              if ((v34 & 1) == 0)
              {
                _HKInitializeLogging();
                id v36 = HKLogHealthRecords;
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v41 = [a1 debugDescription];
                  uint64_t v42 = [v25 attachmentIdentifier];
                  *(_DWORD *)buf = 138543875;
                  v73 = v41;
                  __int16 v74 = 2114;
                  uint64_t v75 = v42;
                  __int16 v76 = 2113;
                  id v77 = v35;
                  v46 = (void *)v42;
                  _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "%{public}@ failed to remove HKAttachmentReferencesfor clinicalRecord from HKAttachment with identifier %{public}@. Error: %{private}@", buf, 0x20u);
                }
              }
            }
          }
          uint64_t v37 = [v25 identifier];
          id v55 = 0;
          [a1 deleteAttachmentWithIdentifier:v37 profile:v15 error:&v55];
          id v38 = v55;

          if (v38)
          {
            id v43 = v38;
            id v21 = v43;
            if (a8) {
              *a8 = v43;
            }
            else {
              _HKLogDroppedError();
            }

            BOOL v20 = 0;
            goto LABEL_34;
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v58 objects:v78 count:16];
        BOOL v20 = 1;
        if (v22) {
          continue;
        }
        break;
      }
      id v21 = 0;
LABEL_34:
      id v19 = obj;
    }
    else
    {
      id v21 = 0;
      BOOL v20 = 1;
    }
  }

  _Block_object_dispose(&v66, 8);
  return v20;
}

+ (BOOL)_markAvailableAndClearInlineDataForAttachmentWithIdentifier:(id)a3 attachmentIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a4;
  v17[0] = HDMedicalDownloadableAttachmentEntityPropertyAttachmentUUID;
  v17[1] = HDMedicalDownloadableAttachmentEntityPropertyStatus;
  v17[2] = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
  v17[3] = HDMedicalDownloadableAttachmentEntityPropertyLastError;
  v17[4] = HDMedicalDownloadableAttachmentEntityPropertyInlineData;
  v17[5] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
  v17[6] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[NSArray arrayWithObjects:v17 count:7];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_80BB0;
  v15[3] = &unk_111B40;
  id v16 = v9;
  id v13 = v9;
  LOBYTE(a6) = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v11 properties:v12 profile:v10 error:a6 bindingHandler:v15];

  return (char)a6;
}

+ (BOOL)_updateHKAttachmentIdentifierForAttachmentWithIdentifier:(id)a3 attachmentIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9 = a4;
  uint64_t v17 = HDMedicalDownloadableAttachmentEntityPropertyAttachmentUUID;
  id v10 = a5;
  id v11 = a3;
  id v12 = +[NSArray arrayWithObjects:&v17 count:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_80DC0;
  v15[3] = &unk_111B40;
  id v16 = v9;
  id v13 = v9;
  LOBYTE(a6) = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v11 properties:v12 profile:v10 error:a6 bindingHandler:v15];

  return (char)a6;
}

+ (BOOL)_deleteAttachmentsWithMedicalRecordIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 _predicateForDownloadableAttachmentsWithMedicalRecordIdentifier:v8];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = sub_7F3D4;
  BOOL v27 = sub_7F3E4;
  id v28 = objc_alloc_init((Class)NSMutableArray);
  v21[4] = &v23;
  id v22 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_8102C;
  v21[3] = &unk_1144A0;
  +[HDMedicalDownloadableAttachmentEntity enumerateAttachmentsWithPredicate:v10 profile:v9 error:&v22 enumerationHandler:v21];
  id v11 = v22;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = (id)v24[5];
  id v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(a1, "deleteAttachmentWithIdentifier:profile:error:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v15), v9, a5, (void)v17);
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v17 objects:v29 count:16];
    }
    while (v13);
  }

  _Block_object_dispose(&v23, 8);
  return 1;
}

+ (id)_attachmentsAfterRelinkingFromMedicalRecord:(id)a3 toMedicalRecord:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v57 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init((Class)NSMutableArray);
  long long v58 = v11;
  id v13 = [v11 attachmentManager];
  uint64_t v14 = [v10 attachmentObjectIdentifier];
  uint64_t v15 = HKAttachmentClinicalRecordSchemaIdentifier;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_81674;
  v68[3] = &unk_114580;
  id v16 = v12;
  id v69 = v16;
  LOBYTE(v12) = [v13 attachmentReferencesForObjectIdentifier:v14 schemaIdentifier:v15 error:a6 enumerationHandler:v68];

  if ((v12 & 1) == 0)
  {
    _HKInitializeLogging();
    long long v17 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = v17;
      uint64_t v40 = [a1 debugDescription];
      v41 = [v10 UUID];
      id v42 = *a6;
      *(_DWORD *)buf = 138543875;
      v73 = v40;
      __int16 v74 = 2114;
      uint64_t v75 = v41;
      __int16 v76 = 2113;
      id v77 = v42;
      _os_log_error_impl(&dword_0, v39, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve HDAttachments for existing medicalRecord with UUID %{public}@. Error: %{private}@", buf, 0x20u);
    }
  }
  long long v18 = [v10 UUID];
  long long v19 = [a1 _predicateForDownloadableAttachmentsWithMedicalRecordIdentifier:v18];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_81694;
  v66[3] = &unk_1145A8;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  id v67 = v20;
  if (+[HDMedicalDownloadableAttachmentEntity enumerateAttachmentsWithPredicate:v19 profile:v58 error:a6 enumerationHandler:v66])
  {
    v49 = v16;
    id v47 = a1;
    id v48 = v20;
    id v56 = a6;
    v50 = v13;
    v51 = v10;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id obj = v20;
    id v21 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v55 = *(void *)v63;
      uint64_t v53 = HDMedicalDownloadableAttachmentEntityPropertyIdentifier;
      uint64_t v54 = HKMedicalDownloadableAttachmentMetadataNeedsReIndexingKey;
      uint64_t v23 = HDMedicalDownloadableAttachmentEntityPropertyMedicalRecordUUID;
      uint64_t v24 = HDMedicalDownloadableAttachmentEntityPropertyMetadata;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v63 != v55) {
            objc_enumerationMutation(obj);
          }
          id v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          BOOL v27 = [v26 metadata];
          id v28 = v27;
          if (!v27) {
            BOOL v27 = &__NSDictionary0__struct;
          }
          id v29 = [v27 mutableCopy];

          [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:v54];
          unsigned __int8 v30 = [v26 identifier];
          id v31 = +[HDSQLiteComparisonPredicate predicateWithProperty:v53 equalToValue:v30];

          v70[0] = v23;
          v70[1] = v24;
          __int16 v32 = +[NSArray arrayWithObjects:v70 count:2];
          BOOL v33 = [v58 database];
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_816B8;
          v59[3] = &unk_1126B8;
          id v60 = v57;
          id v34 = v29;
          id v61 = v34;
          unsigned __int8 v35 = +[HDMedicalDownloadableAttachmentEntity updateProperties:v32 predicate:v31 healthDatabase:v33 error:v56 bindingHandler:v59];

          if ((v35 & 1) == 0)
          {
            _HKInitializeLogging();
            uint64_t v37 = (void *)HKLogHealthRecords;
            id v10 = v51;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v43 = v37;
              v44 = [v47 debugDescription];
              v45 = [v51 UUID];
              id v46 = *v56;
              *(_DWORD *)buf = 138543875;
              v73 = v44;
              __int16 v74 = 2114;
              uint64_t v75 = v45;
              __int16 v76 = 2113;
              id v77 = v46;
              _os_log_error_impl(&dword_0, v43, OS_LOG_TYPE_ERROR, "%{public}@ failed to update MedicalDownloadableAttachment for existing medicalRecord with UUID %{public}@. Error: %{private}@", buf, 0x20u);
            }
            id v36 = 0;
            id v16 = v49;
            id v13 = v50;
            goto LABEL_20;
          }
        }
        id v22 = [obj countByEnumeratingWithState:&v62 objects:v71 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v16 = v49;
    id v36 = v49;
    id v13 = v50;
    id v10 = v51;
LABEL_20:
    id v20 = v48;
  }
  else
  {
    id v36 = 0;
  }

  return v36;
}

+ (id)_attachmentsAfterRelinkingFromClinicalRecord:(id)a3 toClinicalRecord:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v14 = [v12 attachmentManager];
  uint64_t v15 = [v10 attachmentObjectIdentifier];
  uint64_t v16 = HKAttachmentClinicalRecordSchemaIdentifier;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_81B1C;
  v41[3] = &unk_114580;
  id v17 = v13;
  id v42 = v17;
  id v38 = v14;
  LOBYTE(v16) = [v14 attachmentReferencesForObjectIdentifier:v15 schemaIdentifier:v16 error:a6 enumerationHandler:v41];

  if ((v16 & 1) == 0)
  {
    _HKInitializeLogging();
    long long v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v29 = v18;
      unsigned __int8 v30 = [a1 debugDescription];
      id v31 = [v10 UUID];
      id v32 = *a6;
      *(_DWORD *)buf = 138543875;
      v45 = v30;
      __int16 v46 = 2114;
      id v47 = v31;
      __int16 v48 = 2113;
      id v49 = v32;
      _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve HDAttachments for existing clinicalRecord with UUID %{public}@. Error: %{private}@", buf, 0x20u);
    }
  }
  id v37 = a1;
  uint64_t v19 = HDMedicalDownloadableAttachmentEntityPropertyClinicalRecordUUID;
  uint64_t v43 = HDMedicalDownloadableAttachmentEntityPropertyClinicalRecordUUID;
  id v20 = +[NSArray arrayWithObjects:&v43 count:1];
  id v21 = [v10 UUID];
  id v22 = +[HDSQLiteComparisonPredicate predicateWithProperty:v19 equalToValue:v21];
  uint64_t v23 = [v12 database];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_81B3C;
  v39[3] = &unk_111B40;
  id v24 = v11;
  id v40 = v24;
  unsigned __int8 v25 = +[HDMedicalDownloadableAttachmentEntity updateProperties:v20 predicate:v22 healthDatabase:v23 error:a6 bindingHandler:v39];

  if (v25)
  {
    id v26 = v17;
  }
  else
  {
    _HKInitializeLogging();
    BOOL v27 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      BOOL v33 = v27;
      id v34 = [v37 debugDescription];
      unsigned __int8 v35 = [v10 UUID];
      id v36 = *a6;
      *(_DWORD *)buf = 138543875;
      v45 = v34;
      __int16 v46 = 2114;
      id v47 = v35;
      __int16 v48 = 2113;
      id v49 = v36;
      _os_log_error_impl(&dword_0, v33, OS_LOG_TYPE_ERROR, "%{public}@ failed to update MedicalDownloadableAttachment for existing clinicalRecord with UUID %{public}@. Error: %{private}@", buf, 0x20u);
    }
    id v26 = 0;
  }

  return v26;
}

+ (id)_predicateForDownloadableAttachmentsWithMedicalRecordIdentifier:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyMedicalRecordUUID equalToValue:a3];
}

+ (id)attachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_7F3D4;
  id v22 = sub_7F3E4;
  id v23 = 0;
  id v10 = [v9 database];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_81D24;
  v14[3] = &unk_1139F0;
  id v17 = a1;
  id v11 = v8;
  id v15 = v11;
  uint64_t v16 = &v18;
  [a1 performReadTransactionWithHealthDatabase:v10 error:a5 block:v14];

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

+ (BOOL)enumerateAttachmentsWithPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [a1 _propertiesForEntity];
  uint64_t v14 = [v11 database];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_81F8C;
  v17[3] = &unk_1145F8;
  id v18 = v10;
  id v19 = a1;
  id v15 = v10;
  LOBYTE(a5) = [a1 enumerateProperties:v13 withPredicate:v12 healthDatabase:v14 error:a5 enumerationHandler:v17];

  return (char)a5;
}

+ (BOOL)updateAttachmentWithIdentifier:(id)a3 properties:(id)a4 profile:(id)a5 error:(id *)a6 bindingHandler:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  id v15 = [a4 mutableCopy];
  [v15 addObject:HDMedicalDownloadableAttachmentEntityPropertyLastUpdatedDate];
  uint64_t v16 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyIdentifier equalToValue:v14];

  id v17 = [v13 database];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_82190;
  v20[3] = &unk_114620;
  id v21 = v12;
  id v18 = v12;
  LOBYTE(a6) = [a1 updateProperties:v15 predicate:v16 healthDatabase:v17 error:a6 bindingHandler:v20];

  return (char)a6;
}

+ (BOOL)deleteAttachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[HDDeleteMedicalDownloadableAttachmentOperation alloc] initWithAttachmentIdentifier:v8];

  LOBYTE(a5) = [(HDDeleteMedicalDownloadableAttachmentOperation *)v9 performOrJournalWithProfile:v7 error:a5];
  return (char)a5;
}

+ (id)_propertiesForEntity
{
  v4[0] = HDMedicalDownloadableAttachmentEntityPropertyIdentifier;
  v4[1] = HDMedicalDownloadableAttachmentEntityPropertyMedicalRecordUUID;
  v4[2] = HDMedicalDownloadableAttachmentEntityPropertyClinicalRecordUUID;
  v4[3] = HDMedicalDownloadableAttachmentEntityPropertyAccountIdentifier;
  v4[4] = HDMedicalDownloadableAttachmentEntityPropertyFHIRVersion;
  v4[5] = HDMedicalDownloadableAttachmentEntityPropertyType;
  v4[6] = HDMedicalDownloadableAttachmentEntityPropertyStatus;
  v4[7] = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
  v4[8] = HDMedicalDownloadableAttachmentEntityPropertyTitle;
  v4[9] = HDMedicalDownloadableAttachmentEntityPropertyWebURL;
  v4[10] = HDMedicalDownloadableAttachmentEntityPropertySizeInBytes;
  v4[11] = HDMedicalDownloadableAttachmentEntityPropertyContentType;
  v4[12] = HDMedicalDownloadableAttachmentEntityPropertyLocale;
  v4[13] = HDMedicalDownloadableAttachmentEntityPropertyExpectedHash;
  v4[14] = HDMedicalDownloadableAttachmentEntityPropertyCreationDate;
  v4[15] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
  v4[16] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
  v4[17] = HDMedicalDownloadableAttachmentEntityPropertyLastUpdatedDate;
  v4[18] = HDMedicalDownloadableAttachmentEntityPropertyLastError;
  v4[19] = HDMedicalDownloadableAttachmentEntityPropertyFileURL;
  v4[20] = HDMedicalDownloadableAttachmentEntityPropertyInlineData;
  v4[21] = HDMedicalDownloadableAttachmentEntityPropertyInlineDataChecksum;
  v4[22] = HDMedicalDownloadableAttachmentEntityPropertyAttachmentUUID;
  v4[23] = HDMedicalDownloadableAttachmentEntityPropertyMetadata;
  v2 = +[NSArray arrayWithObjects:v4 count:24];

  return v2;
}

+ (id)_insertOrUpdateAttachment:(id)a3 shouldReplace:(BOOL)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = [v10 accountIdentifier];

  if (v12)
  {
    id v13 = [v11 databaseForEntityClass:a1];
    if (v8)
    {
      id v14 = [v10 identifier];
      id v15 = [a1 _attachmentEntityForIdentifier:v14 databaseTransaction:v11 error:a6];

      if (!v15)
      {
        id v19 = [v10 identifier];
        id v20 = +[NSError hk_error:118, @"Failed to find a downloadable attachment with identifier: %@", v19 format];
        if (v20)
        {
          if (a6) {
            *a6 = v20;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v17 = 0;
        goto LABEL_6;
      }
    }
    uint64_t v16 = [a1 _propertiesForEntity];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_82648;
    v21[3] = &unk_111B40;
    id v22 = v10;
    id v17 = [a1 insertOrReplaceEntity:v8 database:v13 properties:v16 error:a6 bindingHandler:v21];

LABEL_6:
    goto LABEL_8;
  }
  +[NSError hk_assignError:a6 code:3 description:@"downloadable attachments without an account identifier cannot be stored"];
  id v17 = 0;
LABEL_8:

  return v17;
}

+ (id)attachmentForRow:(HDSQLiteRow *)a3
{
  id v32 = HDSQLiteColumnWithNameAsUUID();
  id v31 = HDSQLiteColumnWithNameAsUUID();
  unsigned __int8 v30 = HDSQLiteColumnWithNameAsUUID();
  id v29 = HDSQLiteColumnWithNameAsUUID();
  unsigned __int8 v25 = HDSQLiteColumnWithNameAsString();
  id v24 = +[HKFHIRVersion versionFromVersionString:](HKFHIRVersion, "versionFromVersionString:");
  uint64_t v22 = HDSQLiteColumnWithNameAsInteger();
  uint64_t v21 = HDSQLiteColumnWithNameAsInteger();
  uint64_t v20 = HDSQLiteColumnWithNameAsInteger();
  id v28 = HDSQLiteColumnWithNameAsString();
  BOOL v27 = HDSQLiteColumnWithNameAsURL();
  v3 = HDSQLiteColumnWithNameAsString();
  id v26 = +[NSLocale localeWithLocaleIdentifier:v3];

  id v19 = HDSQLiteColumnWithNameAsNumber();
  id v18 = HDSQLiteColumnWithNameAsString();
  id v17 = HDSQLiteColumnWithNameAsData();
  uint64_t v16 = HDSQLiteColumnWithNameAsDate();
  uint64_t v15 = HDSQLiteColumnWithNameAsInteger();
  v4 = HDSQLiteColumnWithNameAsDate();
  id v5 = HDSQLiteColumnWithNameAsDate();
  objc_opt_class();
  id v6 = HDSQLiteColumnWithNameAsObject();
  id v7 = HDSQLiteColumnWithNameAsString();

  if (v7)
  {
    BOOL v8 = HDSQLiteColumnWithNameAsString();
    id v7 = +[NSURL fileURLWithPath:v8];
  }
  id v14 = HDSQLiteColumnWithNameAsData();
  id v9 = HDSQLiteColumnWithNameAsData();
  id v10 = HDSQLiteColumnWithNameAsUUID();
  id v11 = +[NSDictionary hk_secureCodingClasses];
  id v12 = HDSQLiteColumnWithNameAsObjectWithClasses();

  id v23 = objc_msgSend(objc_alloc((Class)HKMedicalDownloadableAttachment), "initWithIdentifier:medicalRecordIdentifier:clinicalRecordIdentifier:accountIdentifier:FHIRVersion:type:status:errorStatus:title:webURL:sizeInBytes:contentType:locale:expectedHash:creationDate:retryCount:nextRetryDate:lastUpdatedDate:lastError:fileURL:inlineData:inlineDataChecksum:attachmentIdentifier:metadata:", v32, v31, v30, v29, v24, v22, v21, v20, v28, v27, v19, v18, v26, v17, v16,
          v15,
          v4,
          v5,
          v6,
          v7,
          v14,
          v9,
          v10,
          v12);

  return v23;
}

+ (id)_attachmentEntityForIdentifier:(id)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  uint64_t v8 = HDMedicalDownloadableAttachmentEntityPropertyIdentifier;
  id v9 = a4;
  id v10 = +[HDSQLiteComparisonPredicate predicateWithProperty:v8 equalToValue:a3];
  id v11 = [v9 databaseForEntityClass:a1];

  id v12 = [a1 anyInDatabase:v11 predicate:v10 error:a5];

  return v12;
}

+ (BOOL)_deleteAttachmentWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  uint64_t v8 = HDMedicalDownloadableAttachmentEntityPropertyIdentifier;
  id v9 = a4;
  id v10 = +[HDSQLiteComparisonPredicate predicateWithProperty:v8 equalToValue:a3];
  id v11 = [v9 database];

  LOBYTE(a5) = [a1 deleteEntitiesWithPredicate:v10 healthDatabase:v11 error:a5];
  return (char)a5;
}

@end