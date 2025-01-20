@interface HDClinicalIngestionExtractionOperation
- (BOOL)_processClinicalRecordsInExtractionResult:(id)a3 error:(id *)a4;
- (BOOL)_processMedicalDownloadableAttachmentsInExtractionResult:(id)a3 error:(id *)a4;
- (BOOL)_processMedicalRecordsInExtractionResult:(id)a3 error:(id *)a4;
- (BOOL)_updateAccountLastExtractedRowID:(id)a3 extractionRulesVersion:(id)a4 profile:(id)a5 error:(id *)a6;
- (HDClinicalIngestionExtractionOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5;
- (NSError)extractionError;
- (NSNumber)batchSize;
- (id)_extractionBatchWithRulesVersion:(id)a3 error:(id *)a4;
- (id)_lookupDisplayNameForExtractedItemUnit:(id)a3;
- (id)_processFHIRResourcesInExtractionResult:(id)a3 error:(id *)a4;
- (id)unitTest_didCompleteExtractionFromResource;
- (unint64_t)countOfExtractedClinicalRecords;
- (unint64_t)countOfExtractedMedicalRecords;
- (unint64_t)countOfExtractedResources;
- (unint64_t)countOfInsertedMedicalRecords;
- (unint64_t)countOfUpdatedMedicalRecords;
- (void)_cancelWithError:(id)a3;
- (void)_didCompleteExtractionWithRequest:(id)a3 result:(id)a4 highestRowID:(id)a5 extractionRulesVersion:(id)a6 profile:(id)a7 error:(id)a8;
- (void)_setDocument:(id)a3;
- (void)main;
- (void)setBatchSize:(id)a3;
- (void)setCountOfExtractedClinicalRecords:(unint64_t)a3;
- (void)setCountOfExtractedMedicalRecords:(unint64_t)a3;
- (void)setCountOfExtractedResources:(unint64_t)a3;
- (void)setCountOfInsertedMedicalRecords:(unint64_t)a3;
- (void)setCountOfUpdatedMedicalRecords:(unint64_t)a3;
- (void)setExtractionError:(id)a3;
- (void)setUnitTest_didCompleteExtractionFromResource:(id)a3;
@end

@implementation HDClinicalIngestionExtractionOperation

- (HDClinicalIngestionExtractionOperation)initWithTask:(id)a3 account:(id)a4 nextOperation:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HDClinicalIngestionExtractionOperation;
  v5 = [(HDClinicalIngestionPerAccountOperation *)&v8 initWithTask:a3 account:a4 nextOperation:a5];
  v6 = v5;
  if (v5) {
    [(HDClinicalIngestionExtractionOperation *)v5 setBatchSize:&off_11CF18];
  }
  return v6;
}

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AB450(v3, self);
  }
  v4 = [(HDClinicalIngestionOperation *)self profile];
  v5 = [v4 database];
  unsigned __int8 v6 = [v5 isProtectedDataAvailable];

  if (v6)
  {
    v7 = [(HDClinicalIngestionOperation *)self task];
    objc_super v8 = [v7 healthRecordsServiceClient];

    id v44 = 0;
    v9 = [v8 rulesVersionForFHIRDocumentExtractionWithError:&v44];
    id v10 = v44;
    v11 = v10;
    if (v9)
    {
      id v43 = 0;
      v12 = [(HDClinicalIngestionExtractionOperation *)self _extractionBatchWithRulesVersion:v9 error:&v43];
      id v13 = v43;
      v14 = [v12 document];

      if (v14)
      {
        v15 = [v12 highestRowID];

        if (v15)
        {
          v35 = v11;
          v16 = [v12 document];
          v17 = [v16 resourceObjects];
          id v18 = [v17 count];

          if (v18)
          {
            id v19 = objc_alloc((Class)HDExtractionRequest);
            v20 = [v12 document];
            v21 = [v20 resourceObjects];
            id v22 = [v19 initWithResources:v21];

            HDCreateSerialUtilityDispatchQueue();
            v23 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
            extractionResponseQueue = self->_extractionResponseQueue;
            self->_extractionResponseQueue = v23;

            +[NSDate timeIntervalSinceReferenceDate];
            uint64_t v26 = v25;
            dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_194CC;
            v36[3] = &unk_1121A8;
            uint64_t v41 = v26;
            v36[4] = self;
            id v37 = v22;
            id v38 = v12;
            id v39 = v4;
            dispatch_semaphore_t v40 = v27;
            v28 = v27;
            id v29 = v22;
            [v8 executeFHIRExtractionRequest:v29 completion:v36];
            dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
          }
          else
          {
            _HKInitializeLogging();
            v32 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
              sub_AB3B8(v32, self);
            }
            v33 = [v12 highestRowID];
            id v42 = 0;
            unsigned __int8 v34 = [(HDClinicalIngestionExtractionOperation *)self _updateAccountLastExtractedRowID:v33 extractionRulesVersion:v9 profile:v4 error:&v42];
            id v29 = v42;

            if ((v34 & 1) == 0) {
              [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v13];
            }
          }

          v11 = v35;
        }
        else
        {
          v31 = +[NSError hk_error:100 description:@"Failed to receive highest ROWID for documents to extract, will be unable to set anchor"];
          [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v31];
        }
      }
      else
      {
        [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v13];
      }
    }
    else
    {
      if (v10)
      {
        id v30 = v10;
      }
      else
      {
        id v30 = +[NSError hk_error:100 description:@"Failed to retrieve extraction rules version"];
      }
      id v13 = v30;
      [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v30];
    }
  }
  else
  {
    objc_super v8 = +[NSError hk_protectedDataInaccessibilityError];
    [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v8];
  }
}

- (id)_extractionBatchWithRulesVersion:(id)a3 error:(id *)a4
{
  if (self->_document)
  {
    id v5 = a3;
    unsigned __int8 v6 = [[HDFHIRResourceExtractionBatch alloc] initWithDocument:self->_document rulesVersion:v5];
  }
  else
  {
    id v8 = a3;
    v9 = [(HDClinicalIngestionExtractionOperation *)self batchSize];
    if (v9)
    {
      id v10 = [(HDClinicalIngestionExtractionOperation *)self batchSize];
      id v11 = [v10 integerValue];
    }
    else
    {
      id v11 = (id)kHDSQLiteQueryNoLimit;
    }

    id v5 = [(HDClinicalIngestionPerAccountOperation *)self account];
    v12 = [v5 identifier];
    id v13 = [(HDClinicalIngestionOperation *)self profile];
    unsigned __int8 v6 = +[HDOriginalFHIRResourceEntity resourceExtractionBatchForAccountIdentifier:v12 extractionRulesVersion:v8 batchSize:v11 profile:v13 error:a4];
  }

  return v6;
}

- (void)_didCompleteExtractionWithRequest:(id)a3 result:(id)a4 highestRowID:(id)a5 extractionRulesVersion:(id)a6 profile:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  _HKInitializeLogging();
  v20 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_AB5A8(v20, self);
  }
  id v21 = objc_retainBlock(self->_unitTest_didCompleteExtractionFromResource);
  id v22 = v21;
  if (v21) {
    (*((void (**)(id))v21 + 2))(v21);
  }
  if (v15)
  {
    v54 = v19;
    v55 = v22;
    id v56 = v18;
    id v57 = v17;
    id v58 = v16;
    v59 = v14;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v60 = v15;
    v23 = [v15 allUnits];
    id v24 = [v23 countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v67;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v67 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(__CFString **)(*((void *)&v66 + 1) + 8 * i);
          id v29 = [(__CFString *)v28 clinicalRecord];
          if (v29)
          {
            id v30 = [(HDClinicalIngestionExtractionOperation *)self _lookupDisplayNameForExtractedItemUnit:v28];
            if (v30)
            {
              [v29 _setDisplayName:v30];
            }
            else
            {
              _HKInitializeLogging();
              v31 = (void *)HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
              {
                v32 = v31;
                v33 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
                *(_DWORD *)buf = 138543618;
                v71 = v33;
                __int16 v72 = 2114;
                CFStringRef v73 = v28;
                _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "%{public}@ did not receive a display name for item %{public}@", buf, 0x16u);
              }
            }
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v25);
    }

    id v34 = objc_alloc_init((Class)NSMutableArray);
    v35 = [(HDClinicalPostExtractionOperation *)[HDClinicalPostExtractionReferenceRangeStatusOperation alloc] initWithExtractionResult:v60];
    [v34 addObject:v35];
    id v14 = v59;
    id v18 = v56;
    id v17 = v57;
    if ([v34 count])
    {
      _HKInitializeLogging();
      v36 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v36;
        CFStringRef v38 = (const __CFString *)[v34 count];
        id v39 = (char *)[v34 count];
        *(_DWORD *)buf = 138543874;
        if (v39 == (unsigned char *)&dword_0 + 1) {
          CFStringRef v40 = &stru_1152E8;
        }
        else {
          CFStringRef v40 = @"s";
        }
        v71 = self;
        __int16 v72 = 2048;
        CFStringRef v73 = v38;
        __int16 v74 = 2114;
        CFStringRef v75 = v40;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ running %lu post extraction operation%{public}@", buf, 0x20u);
      }
      id v41 = objc_alloc_init((Class)NSOperationQueue);
      [v41 addOperations:v34 waitUntilFinished:1];
      _HKInitializeLogging();
      id v42 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v43 = v42;
        if ([v34 count] == (char *)&dword_0 + 1) {
          CFStringRef v44 = &stru_1152E8;
        }
        else {
          CFStringRef v44 = @"s";
        }
        *(_DWORD *)buf = 138543618;
        v71 = self;
        __int16 v72 = 2114;
        CFStringRef v73 = v44;
        _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ finished running post extraction operation%{public}@", buf, 0x16u);
      }
    }
    v45 = [v59 resources];
    -[HDClinicalIngestionExtractionOperation setCountOfExtractedResources:](self, "setCountOfExtractedResources:", [v45 count]);

    id v65 = v54;
    v46 = [(HDClinicalIngestionExtractionOperation *)self _processFHIRResourcesInExtractionResult:v60 error:&v65];
    id v19 = v65;

    if (v46)
    {

      id v64 = 0;
      unsigned int v47 = [(HDClinicalIngestionExtractionOperation *)self _processMedicalRecordsInExtractionResult:v46 error:&v64];
      id v48 = v64;
      id v19 = v48;
      id v16 = v58;
      if (v47)
      {

        id v63 = 0;
        unsigned int v49 = [(HDClinicalIngestionExtractionOperation *)self _processClinicalRecordsInExtractionResult:v46 error:&v63];
        id v50 = v63;
        id v19 = v50;
        if (v49)
        {

          id v62 = 0;
          unsigned int v51 = [(HDClinicalIngestionExtractionOperation *)self _processMedicalDownloadableAttachmentsInExtractionResult:v46 error:&v62];
          id v52 = v62;
          id v19 = v52;
          if (v51)
          {

            id v61 = 0;
            unsigned __int8 v53 = [(HDClinicalIngestionExtractionOperation *)self _updateAccountLastExtractedRowID:v58 extractionRulesVersion:v57 profile:v56 error:&v61];
            id v19 = v61;
            if (v53) {
              goto LABEL_40;
            }
          }
        }
      }
    }
    else
    {
      id v16 = v58;
    }
    [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v19];
LABEL_40:

    id v22 = v55;
    goto LABEL_41;
  }
  [(HDClinicalIngestionExtractionOperation *)self _cancelWithError:v19];
LABEL_41:
}

- (id)_lookupDisplayNameForExtractedItemUnit:(id)a3
{
  id v4 = a3;
  id v5 = [v4 medicalRecord];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    v7 = [v5 medicalRecordCodings];
    id v8 = +[HKMedicalCodingCollection collectionWithCodings:v7];

    v9 = +[HKConceptSynthesizer bestDisplayNameForCodingCollection:v8];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v6 fallbackDisplayString];
    }
    id v16 = v11;
  }
  else
  {
    _HKInitializeLogging();
    v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
      id v15 = HKSensitiveLogItem();
      int v18 = 138543618;
      id v19 = v14;
      __int16 v20 = 2114;
      id v21 = v15;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ no medical record available to look up display string for item %{public}@", (uint8_t *)&v18, 0x16u);
    }
    id v16 = 0;
  }

  return v16;
}

- (id)_processFHIRResourcesInExtractionResult:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unsigned __int8 v6 = [v5 items];
  v7 = objc_msgSend(v6, "hk_map:", &stru_1121E8);

  id v42 = 0;
  id v8 = [(HDClinicalIngestionPerAccountOperation *)self account];
  v9 = [(HDClinicalIngestionOperation *)self profile];
  id v10 = [v9 currentSyncIdentityPersistentID];
  id v11 = [(HDClinicalIngestionOperation *)self profile];
  id v41 = 0;
  unsigned __int8 v12 = +[HDOriginalFHIRResourceEntity insertOrUpdateResourceObjects:v7 upsertedResourceObjectPairs:&v42 account:v8 syncProvenance:0 syncIdentity:v10 profile:v11 error:&v41 inaccessibilityHandler:0];
  id v35 = v42;
  id v13 = v41;

  if (v12)
  {
    v32 = v7;
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v33 = v5;
    id obj = [v5 items];
    id v15 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v38 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_1A300;
          v36[3] = &unk_112210;
          v36[4] = v19;
          uint64_t v20 = objc_msgSend(v35, "hk_firstObjectPassingTest:", v36);
          if (!v20)
          {
            _HKInitializeLogging();
            v28 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
              sub_AB688(v28, v19, v35);
            }

            id v26 = 0;
            goto LABEL_17;
          }
          id v21 = (void *)v20;
          id v22 = objc_alloc((Class)HDExtractionResultItem);
          v23 = [v21 databaseResource];
          id v24 = [v19 units];
          id v25 = objc_msgSend(v22, "initWithOriginalFHIRResource:units:flags:", v23, v24, objc_msgSend(v19, "flags"));

          [v14 addObject:v25];
        }
        id v16 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v26 = [objc_alloc((Class)HDExtractionResult) initWithItems:v14];
LABEL_17:
    v7 = v32;
    id v5 = v33;
  }
  else
  {
    _HKInitializeLogging();
    dispatch_semaphore_t v27 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v30 = v27;
      v31 = [(HDClinicalIngestionPerAccountOperation *)self debugDescription];
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      __int16 v46 = 2114;
      id v47 = v5;
      __int16 v48 = 2114;
      id v49 = v13;
      _os_log_error_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "%{public}@ failed to insert or update result %{public}@: %{public}@", buf, 0x20u);
    }
    id v26 = 0;
  }

  return v26;
}

- (BOOL)_processClinicalRecordsInExtractionResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v8 = [v7 gateway];
  v9 = [v8 externalID];
  id v10 = [(HDClinicalIngestionOperation *)self profile];
  id v11 = +[HDClinicalRecordEntity processClinicalRecordsInExtractionResult:v6 clinicalExternalID:v9 profile:v10 error:a4];

  if (v11)
  {
    _HKInitializeLogging();
    unsigned __int8 v12 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AB794(v12);
    }
    -[HDClinicalIngestionExtractionOperation setCountOfExtractedClinicalRecords:](self, "setCountOfExtractedClinicalRecords:", [v11 unsignedIntegerValue]);
  }

  return v11 != 0;
}

- (BOOL)_processMedicalRecordsInExtractionResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v8 = [v7 identifier];
  v9 = [(HDClinicalIngestionOperation *)self profile];
  id v10 = +[HDMedicalRecordEntity processMedicalRecordsInExtractionResult:v6 accountIdentifier:v8 profile:v9 error:a4];

  if (v10)
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AB830(v11);
    }
    -[HDClinicalIngestionExtractionOperation setCountOfExtractedMedicalRecords:](self, "setCountOfExtractedMedicalRecords:", [v10 unsignedIntegerValue]);
  }

  return v10 != 0;
}

- (BOOL)_updateAccountLastExtractedRowID:(id)a3 extractionRulesVersion:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(HDClinicalIngestionOperation *)self profile];
  id v14 = [v13 database];

  id v15 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v16 = [v15 identifier];

  LOBYTE(a6) = +[HDClinicalAccountEntity updateAccountLastExtractedRowID:v12 rulesVersion:v11 identifier:v16 profile:v10 healthDatabase:v14 error:a6];
  return (char)a6;
}

- (BOOL)_processMedicalDownloadableAttachmentsInExtractionResult:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HDClinicalIngestionPerAccountOperation *)self account];
  id v8 = [v7 identifier];
  v9 = [(HDClinicalIngestionOperation *)self profile];
  id v10 = +[HDMedicalDownloadableAttachmentEntity processMedicalDownloadableAttachmentsInExtractionResult:v6 accountIdentifier:v8 profile:v9 error:a4];

  if (v10)
  {
    _HKInitializeLogging();
    id v11 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_AB8CC(v11);
    }
  }

  return 1;
}

- (void)_cancelWithError:(id)a3
{
  [(HDClinicalIngestionExtractionOperation *)self setExtractionError:a3];

  [(HDClinicalIngestionExtractionOperation *)self cancel];
}

- (void)_setDocument:(id)a3
{
}

- (NSNumber)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(id)a3
{
}

- (unint64_t)countOfExtractedResources
{
  return self->_countOfExtractedResources;
}

- (void)setCountOfExtractedResources:(unint64_t)a3
{
  self->_countOfExtractedResources = a3;
}

- (unint64_t)countOfExtractedClinicalRecords
{
  return self->_countOfExtractedClinicalRecords;
}

- (void)setCountOfExtractedClinicalRecords:(unint64_t)a3
{
  self->_countOfExtractedClinicalRecords = a3;
}

- (unint64_t)countOfExtractedMedicalRecords
{
  return self->_countOfExtractedMedicalRecords;
}

- (void)setCountOfExtractedMedicalRecords:(unint64_t)a3
{
  self->_countOfExtractedMedicalRecords = a3;
}

- (unint64_t)countOfInsertedMedicalRecords
{
  return self->_countOfInsertedMedicalRecords;
}

- (void)setCountOfInsertedMedicalRecords:(unint64_t)a3
{
  self->_countOfInsertedMedicalRecords = a3;
}

- (unint64_t)countOfUpdatedMedicalRecords
{
  return self->_countOfUpdatedMedicalRecords;
}

- (void)setCountOfUpdatedMedicalRecords:(unint64_t)a3
{
  self->_countOfUpdatedMedicalRecords = a3;
}

- (NSError)extractionError
{
  return self->_extractionError;
}

- (void)setExtractionError:(id)a3
{
}

- (id)unitTest_didCompleteExtractionFromResource
{
  return self->_unitTest_didCompleteExtractionFromResource;
}

- (void)setUnitTest_didCompleteExtractionFromResource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didCompleteExtractionFromResource, 0);
  objc_storeStrong((id *)&self->_extractionError, 0);
  objc_storeStrong((id *)&self->_batchSize, 0);
  objc_storeStrong((id *)&self->_extractionResponseQueue, 0);

  objc_storeStrong((id *)&self->_document, 0);
}

@end