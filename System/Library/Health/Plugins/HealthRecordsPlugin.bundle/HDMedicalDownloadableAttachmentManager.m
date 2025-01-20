@interface HDMedicalDownloadableAttachmentManager
- (BOOL)_addAttachmentAndMarkAvailableForAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_addAttachmentForMedicalDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_beginOrResumeDownloadingAttachmentsWithError:(id *)a3;
- (BOOL)_downloadAllowed;
- (BOOL)_indexDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_indexDownloadableAttachmentsWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5;
- (BOOL)_processAndIndexDownloadableAttachmentsWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5;
- (BOOL)_processDownloadableAttachmentsWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5;
- (BOOL)_reconcileDownloadableAttachmentToHKAttachmentForMedicalRecordWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_reconcileHKAttachmentForDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_removeLocalFileForAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_saveInlineDataIfNeededForDownloadableAttachment:(id)a3 error:(id *)a4;
- (BOOL)_saveInlineDataToTempFile:(id)a3 error:(id *)a4;
- (BOOL)_unitTesting_skippedAttachmentDownload;
- (BOOL)_unitTesting_triggerDownloadableAttachmentDidChange:(id)a3 error:(id *)a4;
- (BOOL)_updateNextRetryDateForAttachmentWithIdentifier:(id)a3 nextRetryDate:(id)a4 error:(id *)a5;
- (BOOL)_updateNextRetryDateForFailedDownloadForAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_updateNextRetryDateForFailedIndexingForAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_updateNextRetryDateForFailedProcessingForAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)insertDownloadableAttachment:(id)a3 error:(id *)a4;
- (BOOL)markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 error:(id *)a5;
- (BOOL)markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 error:(id *)a5;
- (BOOL)processDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeAllAttachmentsFromMedicalRecord:(id)a3 error:(id *)a4;
- (BOOL)removeDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 error:(id *)a7;
- (BOOL)updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 error:(id *)a6;
- (BOOL)updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 error:(id *)a5;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDMedicalDownloadableAttachmentManager)initWithProfileExtension:(id)a3;
- (HKObserverSet)stateChangeListeners;
- (id)_applyBackoffStrategyForRetryCount:(int64_t)a3 now:(id)a4;
- (id)_attachmentIdentifierForClinicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)_attachmentIdentifierForMedicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)_backOffPredicateWithCompareDate:(id)a3;
- (id)_backOffPredicateWithPredicate:(id)a3;
- (id)_clinicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)_determineUTType:(id)a3 error:(id *)a4;
- (id)_downloadableAttachmentBatchPredicateWithIdentifiers:(id)a3;
- (id)_downloadableAttachmentsAwaitingDownloadPredicate;
- (id)_downloadableAttachmentsFailedDownloadWithoutErrorPredicateWithCompareDate:(id)a3;
- (id)_downloadableAttachmentsForMedicalRecordPredicateWithIdentifier:(id)a3;
- (id)_downloadableAttachmentsForMedicalRecordWithIdentifier:(id)a3 error:(id *)a4;
- (id)_downloadableAttachmentsPredicateWithPredicate:(id)a3 downloadableAttachmentIdentifiers:(id)a4;
- (id)_downloadableAttachmentsReadyToIndexPredicate;
- (id)_downloadableAttachmentsReadyToIndexWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5;
- (id)_downloadableAttachmentsReadyToProcessPredicate;
- (id)_downloadableAttachmentsReadyToProcessWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5;
- (id)_fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:(id)a3 downloadableAttachmentIdentifiers:(id)a4 backOff:(BOOL)a5 error:(id *)a6;
- (id)_fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:(id)a3 error:(id *)a4;
- (id)_fetchDownloadableAttachmentsForPredicate:(id)a3 downloadableAttachmentIdentifiers:(id)a4 error:(id *)a5;
- (id)_indexingAttachmentsFailedWithoutErrorPredicateWithCompareDate:(id)a3;
- (id)_medicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5;
- (id)_processingAttachmentsFailedWithoutErrorPredicateWithCompareDate:(id)a3;
- (id)extractionServiceClientCreateIfNecessary;
- (id)fetchAttachmentWithIdentifier:(id)a3 error:(id *)a4;
- (id)profileWithError:(id *)a3;
- (id)unitTesting_didFinishIndexingNotification;
- (void)_callDownloaderWithDownloadableAttachments:(id)a3 shouldRequestMore:(BOOL)a4;
- (void)_downloadableAttachmentDidChange:(id)a3;
- (void)addDownloadableAttachmentStateObserver:(id)a3;
- (void)downloadableAttachmentDidChange:(id)a3;
- (void)notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5;
- (void)removeDownloadableAttachmentStateObserver:(id)a3;
- (void)runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3;
- (void)setStateChangeListeners:(id)a3;
- (void)setUnitTesting_didFinishIndexingNotification:(id)a3;
- (void)set_unitTesting_skippedAttachmentDownload:(BOOL)a3;
@end

@implementation HDMedicalDownloadableAttachmentManager

- (HDMedicalDownloadableAttachmentManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDMedicalDownloadableAttachmentManager;
  v5 = [(HDMedicalDownloadableAttachmentManager *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profileExtension, v4);
    *(void *)&v6->_query_lock._os_unfair_lock_opaque = 0;
    id v7 = objc_alloc((Class)HKObserverSet);
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = (HKObserverSet *)[v7 initWithName:v9 loggingCategory:HKLogHealthRecords];
    stateChangeListeners = v6->_stateChangeListeners;
    v6->_stateChangeListeners = v10;
  }
  return v6;
}

- (id)profileWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v5 = [WeakRetained profile];

  if (v5) {
    id v6 = v5;
  }
  else {
    +[NSError hk_assignError:a3, 3, @"No profile found for %@", objc_opt_class() code format];
  }

  return v5;
}

- (id)extractionServiceClientCreateIfNecessary
{
  p_service_client_lock = &self->_service_client_lock;
  os_unfair_lock_lock(&self->_service_client_lock);
  extractionServiceClient = self->_extractionServiceClient;
  if (!extractionServiceClient)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v6 = [WeakRetained createHealthRecordsXPCServiceClient];
    id v7 = self->_extractionServiceClient;
    self->_extractionServiceClient = v6;

    extractionServiceClient = self->_extractionServiceClient;
  }
  v8 = extractionServiceClient;
  os_unfair_lock_unlock(p_service_client_lock);

  return v8;
}

- (BOOL)_downloadAllowed
{
  id v8 = 0;
  v2 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:&v8];
  id v3 = v8;
  if (v2)
  {
    id v4 = [v2 daemon];
    v5 = [v4 behavior];
    unsigned int v6 = [v5 healthAppNotInstalled] ^ 1;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B31EC();
    }
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_downloadableAttachmentsAwaitingDownloadPredicate
{
  id v3 = HDMedicalDownloadAttachmentPredicateForErrorStatus(1);
  v11[0] = v3;
  id v4 = HDMedicalDownloadAttachmentPredicateForStatus(1);
  v11[1] = v4;
  v5 = HDMedicalDownloadAttachmentPredicateForStatus(0);
  v11[2] = v5;
  unsigned int v6 = +[NSDate now];
  id v7 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsFailedDownloadWithoutErrorPredicateWithCompareDate:v6];
  v11[3] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:4];
  v9 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v8];

  return v9;
}

- (id)_downloadableAttachmentsFailedDownloadWithoutErrorPredicateWithCompareDate:(id)a3
{
  id v3 = a3;
  id v4 = HDMedicalDownloadAttachmentPredicateForStatus(2);
  v11[0] = v4;
  uint64_t v5 = HDMedicalDownloadableAttachmentEntityPropertyLastUpdatedDate;
  unsigned int v6 = [v3 dateByAddingTimeInterval:-600.0];

  id v7 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5 lessThanValue:v6];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  v9 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

- (id)_downloadableAttachmentsReadyToProcessPredicate
{
  id v3 = HDMedicalDownloadAttachmentPredicateForErrorStatus(3);
  id v4 = HDMedicalDownloadAttachmentPredicateForErrorStatus(2);
  uint64_t v5 = HDMedicalDownloadAttachmentPredicateForStatus(3);
  unsigned int v6 = HDMedicalDownloadAttachmentPredicateForStatus(7);
  id v7 = +[NSDate now];
  id v8 = [(HDMedicalDownloadableAttachmentManager *)self _processingAttachmentsFailedWithoutErrorPredicateWithCompareDate:v7];
  v12[4] = v8;
  v9 = +[NSArray arrayWithObjects:v12 count:5];
  v10 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v9];

  return v10;
}

- (id)_processingAttachmentsFailedWithoutErrorPredicateWithCompareDate:(id)a3
{
  id v3 = a3;
  id v4 = HDMedicalDownloadAttachmentPredicateForStatus(10);
  v20[0] = v4;
  uint64_t v5 = HDMedicalDownloadableAttachmentEntityPropertyLastUpdatedDate;
  unsigned int v6 = [v3 dateByAddingTimeInterval:-600.0];
  id v7 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5 lessThanValue:v6];
  v20[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v20 count:2];
  v9 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  v10 = HDMedicalDownloadAttachmentPredicateForStatus(8);
  v19[0] = v10;
  v11 = [v3 dateByAddingTimeInterval:-600.0];

  v12 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5 lessThanValue:v11];
  v19[1] = v12;
  objc_super v13 = +[NSArray arrayWithObjects:v19 count:2];
  v14 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v13];

  v18[0] = v9;
  v18[1] = v14;
  v15 = +[NSArray arrayWithObjects:v18 count:2];
  v16 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v15];

  return v16;
}

- (id)_downloadableAttachmentsReadyToIndexPredicate
{
  id v3 = HDMedicalDownloadAttachmentPredicateForErrorStatus(4);
  id v4 = HDMedicalDownloadAttachmentPredicateForStatus(9);
  uint64_t v5 = +[NSDate now];
  unsigned int v6 = [(HDMedicalDownloadableAttachmentManager *)self _indexingAttachmentsFailedWithoutErrorPredicateWithCompareDate:v5];
  v10[2] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:3];
  id v8 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v7];

  return v8;
}

- (id)_indexingAttachmentsFailedWithoutErrorPredicateWithCompareDate:(id)a3
{
  id v3 = a3;
  id v4 = HDMedicalDownloadAttachmentPredicateForStatus(5);
  v11[0] = v4;
  uint64_t v5 = HDMedicalDownloadableAttachmentEntityPropertyLastUpdatedDate;
  unsigned int v6 = [v3 dateByAddingTimeInterval:-600.0];

  id v7 = +[HDSQLiteComparisonPredicate predicateWithProperty:v5 lessThanValue:v6];
  v11[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v11 count:2];
  v9 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v9;
}

- (id)_backOffPredicateWithCompareDate:(id)a3
{
  uint64_t v3 = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
  id v4 = a3;
  uint64_t v5 = +[HDSQLiteNullPredicate isNullPredicateWithProperty:v3];
  v10[0] = v5;
  unsigned int v6 = +[HDSQLiteComparisonPredicate predicateWithProperty:v3 lessThanValue:v4];

  v10[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v10 count:2];
  id v8 = +[HDSQLiteCompoundPredicate predicateMatchingAnyPredicates:v7];

  return v8;
}

- (id)_backOffPredicateWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSDate now];
  unsigned int v6 = [(HDMedicalDownloadableAttachmentManager *)self _backOffPredicateWithCompareDate:v5];
  id v7 = +[HDSQLiteCompoundPredicate compoundPredicateWithPredicate:v4 otherPredicate:v6];

  return v7;
}

- (id)_downloadableAttachmentBatchPredicateWithIdentifiers:(id)a3
{
  return +[HDSQLiteCompoundPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyIdentifier equalToValues:a3];
}

- (id)_downloadableAttachmentsForMedicalRecordPredicateWithIdentifier:(id)a3
{
  return +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyMedicalRecordUUID equalToValue:a3];
}

- (id)_downloadableAttachmentsPredicateWithPredicate:(id)a3 downloadableAttachmentIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = v6;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  if (v7 && [v7 count])
  {
    v9 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentBatchPredicateWithIdentifiers:v7];
    uint64_t v10 = [v8 arrayByAddingObject:v9];

    id v8 = (void *)v10;
  }
  v11 = +[HDSQLiteCompoundPredicate predicateMatchingAllPredicates:v8];

  return v11;
}

- (id)_fetchDownloadableAttachmentsForPredicate:(id)a3 downloadableAttachmentIdentifiers:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a5];
  if (v10)
  {
    v11 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsPredicateWithPredicate:v8 downloadableAttachmentIdentifiers:v9];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_89504;
    v15[3] = &unk_1145A8;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    id v16 = v12;
    if (+[HDMedicalDownloadableAttachmentEntity enumerateAttachmentsWithPredicate:v11 profile:v10 error:a5 enumerationHandler:v15])
    {
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_downloadableAttachmentsForMedicalRecordWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
  if (v7)
  {
    id v8 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsForMedicalRecordPredicateWithIdentifier:v6];
    id v9 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v18 = HDMedicalDownloadableAttachmentEntityPropertyIdentifier;
    uint64_t v10 = +[NSArray arrayWithObjects:&v18 count:1];
    v11 = [v7 database];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_896E8;
    v16[3] = &unk_114888;
    id v12 = v9;
    id v17 = v12;
    unsigned int v13 = +[HDMedicalDownloadableAttachmentEntity enumerateProperties:v10 withPredicate:v8 healthDatabase:v11 error:a4 enumerationHandler:v16];

    if (v13) {
      id v14 = v12;
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

- (id)_fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:(id)a3 error:(id *)a4
{
  return [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:a3 downloadableAttachmentIdentifiers:0 backOff:1 error:a4];
}

- (id)_fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:(id)a3 downloadableAttachmentIdentifiers:(id)a4 backOff:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  os_unfair_lock_lock(&self->_query_lock);
  id v12 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsAwaitingDownloadPredicate];
  if (v7)
  {
    uint64_t v13 = [(HDMedicalDownloadableAttachmentManager *)self _backOffPredicateWithPredicate:v12];

    id v12 = (void *)v13;
  }
  id v14 = [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsForPredicate:v12 downloadableAttachmentIdentifiers:v11 error:a6];
  if (v14)
  {
    os_unfair_lock_t lock = &self->_query_lock;
    int v15 = [v10 intValue];
    if (v15 <= (int)[&off_11D2F0 intValue]) {
      id v16 = (_UNKNOWN **)v10;
    }
    else {
      id v16 = &off_11D2F0;
    }
    id v17 = v16;
    id v18 = objc_alloc_init((Class)NSMutableArray);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v37 = v14;
    id obj = v14;
    id v19 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v40;
      id v34 = v11;
      id v35 = v10;
      v33 = v12;
LABEL_9:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(obj);
        }
        v23 = *(void **)(*((void *)&v39 + 1) + 8 * v22);
        if (objc_msgSend(v23, "status", v33, v34, v35) == (char *)&dword_0 + 1 || !objc_msgSend(v23, "status"))
        {
          v24 = [v23 identifier];
          unsigned __int8 v25 = [(HDMedicalDownloadableAttachmentManager *)self updateStatusAndClearErrorForAttachmentWithIdentifier:v24 status:2 error:a6];

          if ((v25 & 1) == 0) {
            break;
          }
        }
        if ([v23 errorStatus] == (char *)&dword_0 + 1)
        {
          v26 = [v23 identifier];
          unsigned __int8 v27 = [(HDMedicalDownloadableAttachmentManager *)self _updateNextRetryDateForFailedDownloadForAttachmentWithIdentifier:v26 error:a6];

          if ((v27 & 1) == 0) {
            break;
          }
        }
        v28 = [v23 identifier];
        v29 = [(HDMedicalDownloadableAttachmentManager *)self fetchAttachmentWithIdentifier:v28 error:a6];

        if (!v29)
        {
          os_unfair_lock_unlock(lock);
          id v31 = 0;
          goto LABEL_26;
        }
        [v18 addObject:v29];
        id v30 = [v18 count];
        if (v30 == (id)(int)[v17 intValue])
        {
          os_unfair_lock_unlock(lock);
          id v31 = v18;
LABEL_26:

LABEL_27:
          id v11 = v34;
          id v10 = v35;
          id v12 = v33;
          id v14 = v37;

          goto LABEL_28;
        }

        if (v20 == (id)++v22)
        {
          id v20 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
          id v11 = v34;
          id v10 = v35;
          id v12 = v33;
          if (v20) {
            goto LABEL_9;
          }
          goto LABEL_21;
        }
      }
      os_unfair_lock_unlock(lock);
      id v31 = 0;
      goto LABEL_27;
    }
LABEL_21:

    os_unfair_lock_unlock(lock);
    id v31 = v18;
    id v14 = v37;
LABEL_28:
  }
  else
  {
    os_unfair_lock_unlock(&self->_query_lock);
    id v31 = 0;
  }

  return v31;
}

- (id)_downloadableAttachmentsReadyToProcessWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  p_query_os_unfair_lock_t lock = &self->_query_lock;
  os_unfair_lock_lock(&self->_query_lock);
  id v10 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsReadyToProcessPredicate];
  if (v6)
  {
    uint64_t v11 = [(HDMedicalDownloadableAttachmentManager *)self _backOffPredicateWithPredicate:v10];

    id v10 = (void *)v11;
  }
  id v12 = [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsForPredicate:v10 downloadableAttachmentIdentifiers:v8 error:a5];
  if (v12)
  {
    id v13 = objc_alloc_init((Class)NSMutableArray);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v34;
      id v31 = v10;
      id v32 = v8;
      os_unfair_lock_t lock = &self->_query_lock;
      id v30 = v12;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v34 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v19, "status", lock) == (char *)&dword_4 + 3)
          {
            id v20 = [v19 identifier];
            unsigned int v21 = [(HDMedicalDownloadableAttachmentManager *)self updateStatusAndClearErrorForAttachmentWithIdentifier:v20 status:10 error:a5];

            if (!v21) {
              goto LABEL_19;
            }
          }
          if ([v19 status] == (char *)&dword_0 + 3)
          {
            uint64_t v22 = [v19 identifier];
            unsigned int v23 = [(HDMedicalDownloadableAttachmentManager *)self updateStatusAndClearErrorForAttachmentWithIdentifier:v22 status:8 error:a5];

            if (!v23) {
              goto LABEL_19;
            }
          }
          if ([v19 errorStatus] == (char *)&dword_0 + 2
            || [v19 errorStatus] == (char *)&dword_0 + 3)
          {
            v24 = [v19 identifier];
            unsigned int v25 = [(HDMedicalDownloadableAttachmentManager *)self _updateNextRetryDateForFailedProcessingForAttachmentWithIdentifier:v24 error:a5];

            if (!v25)
            {
LABEL_19:
              os_unfair_lock_unlock(lock);

              id v27 = 0;
              id v10 = v31;
              id v8 = v32;
              id v12 = v30;
              goto LABEL_20;
            }
          }
          v26 = [v19 identifier];
          [v13 addObject:v26];
        }
        id v16 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
        id v10 = v31;
        id v8 = v32;
        p_query_os_unfair_lock_t lock = lock;
        id v12 = v30;
        if (v16) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_unlock(p_query_lock);
    id v27 = v13;
LABEL_20:
  }
  else
  {
    os_unfair_lock_unlock(&self->_query_lock);
    id v27 = 0;
  }

  return v27;
}

- (id)_downloadableAttachmentsReadyToIndexWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_query_lock);
  id v9 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsReadyToIndexPredicate];
  if (v6)
  {
    uint64_t v10 = [(HDMedicalDownloadableAttachmentManager *)self _backOffPredicateWithPredicate:v9];

    id v9 = (void *)v10;
  }
  uint64_t v11 = [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsForPredicate:v9 downloadableAttachmentIdentifiers:v8 error:a5];
  if (v11)
  {
    os_unfair_lock_t lock = &self->_query_lock;
    v28 = v9;
    id v29 = v8;
    id v12 = objc_alloc_init((Class)NSMutableArray);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v11;
    id v13 = v11;
    id v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v31;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v18, "status", lock) == (char *)&dword_8 + 1)
          {
            id v19 = [v18 identifier];
            unsigned int v20 = [(HDMedicalDownloadableAttachmentManager *)self updateStatusAndClearErrorForAttachmentWithIdentifier:v19 status:5 error:a5];

            if (!v20) {
              goto LABEL_16;
            }
          }
          if ([v18 errorStatus] == &dword_4)
          {
            unsigned int v21 = [v18 identifier];
            unsigned int v22 = [(HDMedicalDownloadableAttachmentManager *)self _updateNextRetryDateForFailedIndexingForAttachmentWithIdentifier:v21 error:a5];

            if (!v22)
            {
LABEL_16:
              os_unfair_lock_unlock(lock);

              id v24 = 0;
              goto LABEL_17;
            }
          }
          unsigned int v23 = [v18 identifier];
          [v12 addObject:v23];
        }
        id v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    os_unfair_lock_unlock(lock);
    id v24 = v12;
LABEL_17:

    id v9 = v28;
    id v8 = v29;
    uint64_t v11 = v27;
  }
  else
  {
    os_unfair_lock_unlock(&self->_query_lock);
    id v24 = 0;
  }

  return v24;
}

- (id)_applyBackoffStrategyForRetryCount:(int64_t)a3 now:(id)a4
{
  id v5 = a4;
  BOOL v6 = v5;
  if (a3 > 10)
  {
    double v7 = 604800.0;
LABEL_7:
    id v8 = [v5 dateByAddingTimeInterval:v7];
    goto LABEL_8;
  }
  if (a3 > 5)
  {
    double v7 = 302400.0;
    goto LABEL_7;
  }
  if (a3 >= 4)
  {
    double v7 = 86400.0;
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)updateRetryCountForAttachmentWithIdentifier:(id)a3 retryCount:(int64_t)a4 nextRetryDate:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a6];
  if (v12)
  {
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v15 = +[NSDate now];
      id v13 = [(HDMedicalDownloadableAttachmentManager *)self _applyBackoffStrategyForRetryCount:a4 now:v15];
    }
    v22[0] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
    v22[1] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
    uint64_t v16 = +[NSArray arrayWithObjects:v22 count:2];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    void v19[2] = sub_8A224;
    v19[3] = &unk_1134D8;
    id v20 = v13;
    int64_t v21 = a4;
    id v17 = v13;
    BOOL v14 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v10 properties:v16 profile:v12 error:a6 bindingHandler:v19];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)markDownloadCompleteForAttachmentWithIdentifier:(id)a3 fileURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a5];
  if (v10)
  {
    v16[0] = HDMedicalDownloadableAttachmentEntityPropertyFileURL;
    v16[1] = HDMedicalDownloadableAttachmentEntityPropertyStatus;
    v16[2] = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
    v16[3] = HDMedicalDownloadableAttachmentEntityPropertyLastError;
    void v16[4] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
    v16[5] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
    id v11 = +[NSArray arrayWithObjects:v16 count:6];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8A420;
    v14[3] = &unk_111B40;
    id v15 = v9;
    BOOL v12 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v8 properties:v11 profile:v10 error:a5 bindingHandler:v14];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)markDataAvailableForAttachmentWithIdentifier:(id)a3 attachmentContent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a5];
  if (v10)
  {
    v16[0] = HDMedicalDownloadableAttachmentEntityPropertyInlineData;
    v16[1] = HDMedicalDownloadableAttachmentEntityPropertyContentType;
    v16[2] = HDMedicalDownloadableAttachmentEntityPropertyStatus;
    v16[3] = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
    void v16[4] = HDMedicalDownloadableAttachmentEntityPropertyLastError;
    v16[5] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
    void v16[6] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
    id v11 = +[NSArray arrayWithObjects:v16 count:7];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8A6A0;
    v14[3] = &unk_111B40;
    id v15 = v9;
    BOOL v12 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v8 properties:v11 profile:v10 error:a5 bindingHandler:v14];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateStatusAndClearErrorForAttachmentWithIdentifier:(id)a3 status:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a5];
  if (v9)
  {
    v14[0] = HDMedicalDownloadableAttachmentEntityPropertyStatus;
    v14[1] = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
    v14[2] = HDMedicalDownloadableAttachmentEntityPropertyLastError;
    v14[3] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
    void v14[4] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
    id v10 = +[NSArray arrayWithObjects:v14 count:5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_8A91C;
    v13[3] = &unk_1148A8;
    v13[4] = a4;
    BOOL v11 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v8 properties:v10 profile:v9 error:a5 bindingHandler:v13];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)updateErrorStatusAndRetryCountForAttachmentWithIdentifier:(id)a3 errorStatus:(int64_t)a4 lastError:(id)a5 retryCount:(int64_t)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a5;
  BOOL v14 = v13;
  if ((!a4 || v13) && (a4 || !v13))
  {
    uint64_t v16 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a7];
    if (v16)
    {
      id v17 = +[NSDate now];
      id v18 = [(HDMedicalDownloadableAttachmentManager *)self _applyBackoffStrategyForRetryCount:a6 now:v17];

      v27[0] = HDMedicalDownloadableAttachmentEntityPropertyErrorStatus;
      v27[1] = HDMedicalDownloadableAttachmentEntityPropertyLastError;
      v27[2] = HDMedicalDownloadableAttachmentEntityPropertyRetryCount;
      v27[3] = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
      id v19 = +[NSArray arrayWithObjects:v27 count:4];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      void v22[2] = sub_8ABD0;
      v22[3] = &unk_113978;
      int64_t v25 = a4;
      int64_t v26 = a6;
      id v23 = v14;
      id v24 = v18;
      id v20 = v18;
      BOOL v15 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v12 properties:v19 profile:v16 error:a7 bindingHandler:v22];
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    +[NSError hk_assignError:a7 code:3 format:@"Incompatible status and lastError"];
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_updateNextRetryDateForAttachmentWithIdentifier:(id)a3 nextRetryDate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a5];
  if (v10)
  {
    uint64_t v16 = HDMedicalDownloadableAttachmentEntityPropertyNextRetryDate;
    BOOL v11 = +[NSArray arrayWithObjects:&v16 count:1];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_8ADB8;
    v14[3] = &unk_111B40;
    id v15 = v9;
    BOOL v12 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v8 properties:v11 profile:v10 error:a5 bindingHandler:v14];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_updateNextRetryDateForFailedDownloadForAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = +[NSDate now];
  id v8 = [v7 dateByAddingTimeInterval:600.0];

  LOBYTE(a4) = [(HDMedicalDownloadableAttachmentManager *)self _updateNextRetryDateForAttachmentWithIdentifier:v6 nextRetryDate:v8 error:a4];
  return (char)a4;
}

- (BOOL)_updateNextRetryDateForFailedProcessingForAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = +[NSDate now];
  id v8 = [v7 dateByAddingTimeInterval:600.0];

  LOBYTE(a4) = [(HDMedicalDownloadableAttachmentManager *)self _updateNextRetryDateForAttachmentWithIdentifier:v6 nextRetryDate:v8 error:a4];
  return (char)a4;
}

- (BOOL)_updateNextRetryDateForFailedIndexingForAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = +[NSDate now];
  id v8 = [v7 dateByAddingTimeInterval:600.0];

  LOBYTE(a4) = [(HDMedicalDownloadableAttachmentManager *)self _updateNextRetryDateForAttachmentWithIdentifier:v6 nextRetryDate:v8 error:a4];
  return (char)a4;
}

- (BOOL)insertDownloadableAttachment:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
  if (v7) {
    BOOL v8 = +[HDMedicalDownloadableAttachmentEntity insertAttachment:v6 profile:v7 error:a4];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)fetchAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
  if (v7)
  {
    BOOL v8 = +[HDMedicalDownloadableAttachmentEntity attachmentWithIdentifier:v6 profile:v7 error:a4];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)removeDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  double v7 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
  if (v7) {
    BOOL v8 = +[HDMedicalDownloadableAttachmentEntity deleteAttachmentWithIdentifier:v6 profile:v7 error:a4];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)runMedicalDownloadableAttachmentPipelineWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  [(HDMedicalDownloadableAttachmentManager *)self set_unitTesting_skippedAttachmentDownload:0];
  unsigned __int8 v5 = [(HDMedicalDownloadableAttachmentManager *)self _downloadAllowed];
  _HKInitializeLogging();
  id v6 = HKLogHealthRecords;
  BOOL v7 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v22 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Start HKMedicalDownloadableAttachments Pipeline", buf, 0xCu);
    }
    _HKInitializeLogging();
    BOOL v8 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v22 = self;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: reconcile HKMedicalDownloadableAttachments", buf, 0xCu);
    }
    id v20 = 0;
    unsigned __int8 v9 = [(HDMedicalDownloadableAttachmentManager *)self _reconcileDownloadableAttachmentToHKAttachmentForMedicalRecordWithIdentifier:0 error:&v20];
    id v10 = v20;
    if ((v9 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B33AC();
      }
    }
    _HKInitializeLogging();
    BOOL v11 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v22 = self;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Begin with processing / indexing for HKMedicalDownloadableAttachments already downloaded", buf, 0xCu);
    }
    id v19 = 0;
    unsigned __int8 v12 = [(HDMedicalDownloadableAttachmentManager *)self _processAndIndexDownloadableAttachmentsWithIdentifiers:0 backOff:1 error:&v19];
    id v13 = v19;
    _HKInitializeLogging();
    BOOL v14 = HKLogHealthRecords;
    if (v12)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v22 = self;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed processing / indexing for HKMedicalDownloadableAttachments. Continue to Downloading.", buf, 0xCu);
      }
      id v18 = 0;
      unsigned __int8 v15 = [(HDMedicalDownloadableAttachmentManager *)self _beginOrResumeDownloadingAttachmentsWithError:&v18];
      id v16 = v18;
      _HKInitializeLogging();
      id v17 = HKLogHealthRecords;
      if (v15)
      {
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          unsigned int v22 = self;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed initiating _beginOrResumeDownloadingAttachmentsWithError", buf, 0xCu);
        }
        v4[2](v4, 1, 0);
      }
      else
      {
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B325C();
        }
        ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v16);
      }
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B3304();
      }
      ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v13);
    }
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v22 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Download is not allowed. HKMedicalDownloadableAttachments Pipeline will not run.", buf, 0xCu);
    }
    [(HDMedicalDownloadableAttachmentManager *)self set_unitTesting_skippedAttachmentDownload:1];
    v4[2](v4, 1, 0);
  }
}

- (void)notifyDownloadingCompleteAndRequestMoreWithIdentifiers:(id)a3 requestBatchSize:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if ([v8 count])
  {
    id v21 = 0;
    unsigned __int8 v11 = [(HDMedicalDownloadableAttachmentManager *)self _processAndIndexDownloadableAttachmentsWithIdentifiers:v8 backOff:0 error:&v21];
    id v12 = v21;
    if ((v11 & 1) == 0)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B3570();
      }
    }
    _HKInitializeLogging();
    id v13 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = self;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: processing / indexing attempt completed for batch", buf, 0xCu);
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B34FC();
    }
  }
  if ([v9 isEqualToNumber:&off_11D308])
  {
    _HKInitializeLogging();
    BOOL v14 = HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = self;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: no more attachments requested by the downloader", buf, 0xCu);
    }
    v10[2](v10, &__NSArray0__struct, 0);
  }
  else
  {
    id v20 = 0;
    unsigned __int8 v15 = [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:v9 error:&v20];
    id v16 = v20;
    _HKInitializeLogging();
    id v17 = (void *)HKLogHealthRecords;
    if (v15)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = v17;
        id v19 = [v15 count];
        *(_DWORD *)buf = 138543618;
        id v23 = self;
        __int16 v24 = 2048;
        id v25 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: sending %lu attachments to the downloader", buf, 0x16u);
      }
      v10[2](v10, v15, 0);
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B3454();
      }
      ((void (**)(id, void *, id))v10)[2](v10, 0, v16);
    }
  }
}

- (BOOL)_beginOrResumeDownloadingAttachmentsWithError:(id *)a3
{
  id v4 = [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:&off_11D2F0 error:a3];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    if ([v4 count])
    {
      [(HDMedicalDownloadableAttachmentManager *)self _callDownloaderWithDownloadableAttachments:v5 shouldRequestMore:1];
    }
    else
    {
      _HKInitializeLogging();
      id v6 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = self;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: no attachments awaiting download at this time", (uint8_t *)&v8, 0xCu);
      }
    }
  }

  return v5 != 0;
}

- (void)_callDownloaderWithDownloadableAttachments:(id)a3 shouldRequestMore:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)HKClinicalDocumentDownloader);
  _HKInitializeLogging();
  int v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v15 = self;
    __int16 v16 = 2048;
    id v17 = [v6 count];
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: calling downloader with %lu attachments", buf, 0x16u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_8BA74;
  v13[3] = &unk_1139C8;
  v13[4] = self;
  [v7 beginOrResumeDownloadingAttachments:v6 shouldRequestMore:v4 completion:v13];
  _HKInitializeLogging();
  id v10 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v11 = v10;
    id v12 = [v6 count];
    *(_DWORD *)buf = 138543618;
    unsigned __int8 v15 = self;
    __int16 v16 = 2048;
    id v17 = v12;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: called downloader with %lu attachments", buf, 0x16u);
  }
}

- (BOOL)_processAndIndexDownloadableAttachmentsWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(HDMedicalDownloadableAttachmentManager *)self _processDownloadableAttachmentsWithIdentifiers:v8 backOff:v6 error:a5])
  {
    BOOL v9 = [(HDMedicalDownloadableAttachmentManager *)self _indexDownloadableAttachmentsWithIdentifiers:v8 backOff:v6 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_processDownloadableAttachmentsWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5
{
  unsigned __int8 v5 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsReadyToProcessWithIdentifiers:a3 backOff:a4 error:a5];
  if (v5)
  {
    _HKInitializeLogging();
    BOOL v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)buf = 138543618;
      v37 = self;
      __int16 v38 = 2048;
      id v39 = [v5 count];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Start processing %lu HKMedicalDownloadableAttachments", buf, 0x16u);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v8)
    {
      id v9 = v8;
      int v29 = 0;
      int v10 = 0;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          _HKInitializeLogging();
          BOOL v14 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v37 = self;
            __int16 v38 = 2114;
            id v39 = v13;
            _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Begin processing processDownloadableAttachmentWithIdentifier for HKMedicalDownloadableAttachment with 'identifier': %{public}@", buf, 0x16u);
          }
          id v31 = 0;
          unsigned __int8 v15 = [(HDMedicalDownloadableAttachmentManager *)self processDownloadableAttachmentWithIdentifier:v13 error:&v31];
          id v16 = v31;
          _HKInitializeLogging();
          id v17 = HKLogHealthRecords;
          if (v15)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              v37 = self;
              __int16 v38 = 2114;
              id v39 = v13;
              _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "%{public}@: Finished processing HKMedicalDownloadableAttachment with 'identifier': %{public}@", buf, 0x16u);
            }
            ++v10;
          }
          else
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v18 = v17;
              id v19 = [v16 localizedDescription];
              id v20 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543874;
              v37 = self;
              __int16 v38 = 2114;
              id v39 = v13;
              __int16 v40 = 2114;
              long long v41 = v20;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@: processDownloadableAttachmentWithIdentifier for HKMedicalDownloadableAttachment with 'identifier': %{public}@ failed with error %{public}@", buf, 0x20u);
            }
            ++v29;
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v9);
    }
    else
    {
      int v29 = 0;
      int v10 = 0;
    }

    _HKInitializeLogging();
    id v21 = (void *)HKLogHealthRecords;
    unsigned __int8 v5 = v27;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = v21;
      id v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      __int16 v24 = (HDMedicalDownloadableAttachmentManager *)objc_claimAutoreleasedReturnValue();
      id v25 = [obj count];
      *(_DWORD *)buf = 138544130;
      v37 = v24;
      __int16 v38 = 2048;
      id v39 = v25;
      __int16 v40 = 2048;
      long long v41 = (void *)v10;
      __int16 v42 = 2048;
      uint64_t v43 = v29;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed processing %lu HKMedicalDownloadableAttachments: with %lu records successfully processed and %lu errors", buf, 0x2Au);
    }
  }

  return v5 != 0;
}

- (BOOL)_indexDownloadableAttachmentsWithIdentifiers:(id)a3 backOff:(BOOL)a4 error:(id *)a5
{
  unsigned __int8 v5 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsReadyToIndexWithIdentifiers:a3 backOff:a4 error:a5];
  if (v5)
  {
    _HKInitializeLogging();
    BOOL v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)buf = 138543618;
      v37 = self;
      __int16 v38 = 2048;
      id v39 = [v5 count];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Start initiating indexing %lu HKMedicalDownloadableAttachments", buf, 0x16u);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v27 = v5;
    id obj = v5;
    id v8 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v8)
    {
      id v9 = v8;
      int v29 = 0;
      int v10 = 0;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          _HKInitializeLogging();
          BOOL v14 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543618;
            v37 = self;
            __int16 v38 = 2114;
            id v39 = v13;
            _os_log_debug_impl(&dword_0, v14, OS_LOG_TYPE_DEBUG, "%{public}@: Begin _indexDownloadableAttachmentWithIdentifier for HKMedicalDownloadableAttachment with 'identifier': %{public}@", buf, 0x16u);
          }
          id v31 = 0;
          unsigned __int8 v15 = [(HDMedicalDownloadableAttachmentManager *)self _indexDownloadableAttachmentWithIdentifier:v13 error:&v31];
          id v16 = v31;
          _HKInitializeLogging();
          id v17 = HKLogHealthRecords;
          if (v15)
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              v37 = self;
              __int16 v38 = 2114;
              id v39 = v13;
              _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "%{public}@: indexing initiated for HKMedicalDownloadableAttachment with 'identifier': %{public}@", buf, 0x16u);
            }
            ++v10;
          }
          else
          {
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              id v18 = v17;
              id v19 = [v16 localizedDescription];
              id v20 = HKSensitiveLogItem();
              *(_DWORD *)buf = 138543874;
              v37 = self;
              __int16 v38 = 2114;
              id v39 = v13;
              __int16 v40 = 2114;
              long long v41 = v20;
              _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@: _indexDownloadableAttachmentWithIdentifier for HKMedicalDownloadableAttachment with 'identifier': %{public}@ failed with error %{public}@", buf, 0x20u);
            }
            ++v29;
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
      }
      while (v9);
    }
    else
    {
      int v29 = 0;
      int v10 = 0;
    }

    _HKInitializeLogging();
    id v21 = (void *)HKLogHealthRecords;
    unsigned __int8 v5 = v27;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = v21;
      id v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      __int16 v24 = (HDMedicalDownloadableAttachmentManager *)objc_claimAutoreleasedReturnValue();
      id v25 = [obj count];
      *(_DWORD *)buf = 138544130;
      v37 = v24;
      __int16 v38 = 2048;
      id v39 = v25;
      __int16 v40 = 2048;
      long long v41 = (void *)v10;
      __int16 v42 = 2048;
      uint64_t v43 = v29;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed initiating indexing %lu HKMedicalDownloadableAttachments: with %lu records successfully initiating and %lu errors", buf, 0x2Au);
    }
  }

  return v5 != 0;
}

- (BOOL)processDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDMedicalDownloadableAttachmentManager *)self fetchAttachmentWithIdentifier:v6 error:a4];
  id v8 = v7;
  if (!v7) {
    goto LABEL_22;
  }
  if ([v7 status] == (char *)&dword_8 + 2)
  {
    id v26 = 0;
    unsigned __int8 v9 = [(HDMedicalDownloadableAttachmentManager *)self _saveInlineDataIfNeededForDownloadableAttachment:v8 error:&v26];
    id v10 = v26;
    if (v9)
    {
      id v25 = 0;
      unsigned int v11 = [(HDMedicalDownloadableAttachmentManager *)self updateStatusAndClearErrorForAttachmentWithIdentifier:v6 status:8 error:&v25];
      id v12 = v25;
      id v13 = v12;
      if (v11)
      {

        goto LABEL_6;
      }
      _HKInitializeLogging();
      id v16 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        unsigned int v22 = v16;
        id v23 = [v13 localizedDescription];
        __int16 v24 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v28 = self;
        __int16 v29 = 2114;
        id v30 = v6;
        __int16 v31 = 2114;
        long long v32 = v24;
        _os_log_error_impl(&dword_0, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed update status for attachment %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v17 = v13;
      if (v17)
      {
        if (a4) {
          *a4 = v17;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      unsigned __int8 v15 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v19 = v15;
        id v20 = [v10 localizedDescription];
        id v21 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v28 = self;
        __int16 v29 = 2114;
        id v30 = v6;
        __int16 v31 = 2114;
        long long v32 = v21;
        _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save inlineData to file for attachment %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v10 = v10;
      if (v10)
      {
        if (a4) {
          *a4 = v10;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
LABEL_22:
    BOOL v14 = 0;
    goto LABEL_23;
  }
LABEL_6:
  BOOL v14 = [(HDMedicalDownloadableAttachmentManager *)self _addAttachmentAndMarkAvailableForAttachmentWithIdentifier:v6 error:a4];
LABEL_23:

  return v14;
}

- (BOOL)_saveInlineDataIfNeededForDownloadableAttachment:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 status] == (char *)&dword_8 + 2)
  {
    id v7 = [v6 inlineData];

    if (!v7)
    {
      +[NSError hk_assignError:a4 code:3 format:@"HKMedicalDownloadableAttachment status is 'InlineDataAvailable' but 'inlineData' field is nil"];
LABEL_17:
      BOOL v12 = 0;
      goto LABEL_18;
    }
  }
  if ([v6 status] != (char *)&dword_8 + 2) {
    goto LABEL_7;
  }
  id v8 = [v6 inlineData];

  if (!v8) {
    goto LABEL_7;
  }
  id v24 = 0;
  unsigned __int8 v9 = [(HDMedicalDownloadableAttachmentManager *)self _saveInlineDataToTempFile:v6 error:&v24];
  id v10 = v24;
  unsigned int v11 = v10;
  if ((v9 & 1) == 0)
  {
    id v13 = [v6 identifier];
    id v23 = 0;
    unsigned __int8 v14 = -[HDMedicalDownloadableAttachmentManager updateErrorStatusAndRetryCountForAttachmentWithIdentifier:errorStatus:lastError:retryCount:error:](self, "updateErrorStatusAndRetryCountForAttachmentWithIdentifier:errorStatus:lastError:retryCount:error:", v13, 2, v11, (char *)[v6 retryCount] + 1, &v23);
    id v15 = v23;

    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      id v16 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v19 = v16;
        id v20 = [v6 identifier];
        id v21 = [v15 localizedDescription];
        unsigned int v22 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        id v26 = self;
        __int16 v27 = 2114;
        v28 = v20;
        __int16 v29 = 2114;
        id v30 = v22;
        _os_log_error_impl(&dword_0, v19, OS_LOG_TYPE_ERROR, "%{public}@: Failed update error status for attachment %{public}@. Error: %{public}@", buf, 0x20u);
      }
    }
    id v17 = v11;
    if (v17)
    {
      if (a4) {
        *a4 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    goto LABEL_17;
  }

LABEL_7:
  BOOL v12 = 1;
LABEL_18:

  return v12;
}

- (BOOL)_saveInlineDataToTempFile:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 contentType];
  id v8 = +[UTType typeWithMIMEType:v7];

  unsigned __int8 v9 = [v8 preferredFilenameExtension];
  if (v9)
  {
    id v10 = [v6 identifier];
    unsigned int v11 = [v10 UUIDString];
    uint64_t v12 = [v11 stringByAppendingPathExtension:v9];

    id v13 = +[HKClinicalStorageLocations downloadableAttachmentsDirectory];
    id v26 = (void *)v12;
    unsigned __int8 v14 = [v13 URLByAppendingPathComponent:v12];
    id v15 = [v6 inlineData];
    id v29 = 0;
    unsigned __int8 v16 = +[HKClinicalStorageLocations storeData:v15 inLocalFileAtURL:v14 error:&v29];
    id v17 = v29;

    if (v16)
    {
      id v18 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
      if (v18)
      {
        uint64_t v30 = HDMedicalDownloadableAttachmentEntityPropertyFileURL;
        +[NSArray arrayWithObjects:&v30 count:1];
        id v19 = v25 = v13;
        id v20 = [v6 identifier];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_8CBC0;
        v27[3] = &unk_111B40;
        id v28 = v14;
        BOOL v21 = +[HDMedicalDownloadableAttachmentEntity updateAttachmentWithIdentifier:v20 properties:v19 profile:v18 error:a4 bindingHandler:v27];

        id v13 = v25;
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      id v23 = v17;
      id v18 = v23;
      if (v23)
      {
        if (a4)
        {
          id v18 = v23;
          BOOL v21 = 0;
          *a4 = v18;
          goto LABEL_11;
        }
        _HKLogDroppedError();
      }
    }
    BOOL v21 = 0;
    goto LABEL_11;
  }
  unsigned int v22 = [v6 contentType];
  +[NSError hk_assignError:a4, 125, @"ContentType not supported: %@", v22 code format];

  BOOL v21 = 0;
LABEL_12:

  return v21;
}

- (BOOL)_removeLocalFileForAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  unsigned __int8 v5 = -[HDMedicalDownloadableAttachmentManager fetchAttachmentWithIdentifier:error:](self, "fetchAttachmentWithIdentifier:error:", a3);
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 fileURL];
    unsigned __int8 v8 = +[HKClinicalStorageLocations removeLocalFileAtURL:v7 error:a4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_addAttachmentAndMarkAvailableForAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v23 = 0;
  BOOL v7 = [(HDMedicalDownloadableAttachmentManager *)self _addAttachmentForMedicalDownloadableAttachmentWithIdentifier:v6 error:&v23];
  id v8 = v23;
  if (v7)
  {
    [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentDidChange:v6];
    id v21 = 0;
    unsigned __int8 v9 = [(HDMedicalDownloadableAttachmentManager *)self _removeLocalFileForAttachmentWithIdentifier:v6 error:&v21];
    id v10 = v21;
    unsigned int v11 = v10;
    if ((v9 & 1) == 0)
    {
      if (v10)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
          sub_B36E0();
        }
      }
    }
  }
  else
  {
    uint64_t v12 = [(HDMedicalDownloadableAttachmentManager *)self fetchAttachmentWithIdentifier:v6 error:a4];
    unsigned int v11 = v12;
    if (v12)
    {
      id v22 = 0;
      unsigned __int8 v13 = -[HDMedicalDownloadableAttachmentManager updateErrorStatusAndRetryCountForAttachmentWithIdentifier:errorStatus:lastError:retryCount:error:](self, "updateErrorStatusAndRetryCountForAttachmentWithIdentifier:errorStatus:lastError:retryCount:error:", v6, 3, v8, (char *)[v12 retryCount] + 1, &v22);
      id v14 = v22;
      if ((v13 & 1) == 0)
      {
        _HKInitializeLogging();
        id v15 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          id v18 = v15;
          id v19 = [v14 localizedDescription];
          id v20 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543874;
          id v25 = self;
          __int16 v26 = 2114;
          id v27 = v6;
          __int16 v28 = 2114;
          id v29 = v20;
          _os_log_error_impl(&dword_0, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed update error status for attachment %{public}@. Error: %{public}@", buf, 0x20u);
        }
      }
      id v16 = v8;
      if (v16)
      {
        if (a4) {
          *a4 = v16;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }

  return v7;
}

- (BOOL)_addAttachmentForMedicalDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  BOOL v7 = -[HDMedicalDownloadableAttachmentManager fetchAttachmentWithIdentifier:error:](self, "fetchAttachmentWithIdentifier:error:", a3);
  id v8 = v7;
  if (!v7) {
    goto LABEL_16;
  }
  if ([v7 status] == &dword_8)
  {
    unsigned __int8 v9 = [v8 fileURL];
    if (!v9)
    {
      +[NSError hk_assignError:a4 code:3 format:@"HKMedicalDownloadableAttachment fileURL cannot be nil when creating an HKAttachment"];
      BOOL v22 = 0;
LABEL_60:

      goto LABEL_61;
    }
    id v10 = +[NSFileHandle fileHandleForReadingFromURL:v9 error:a4];
    if (!v10)
    {
      BOOL v22 = 0;
LABEL_59:

      goto LABEL_60;
    }
    uint64_t v11 = [(HDMedicalDownloadableAttachmentManager *)self _determineUTType:v8 error:a4];
    uint64_t v12 = (void *)v11;
    if (!v11)
    {
      BOOL v22 = 0;
LABEL_58:

      goto LABEL_59;
    }
    v67 = (void *)v11;
    unsigned __int8 v13 = v10;
    id v14 = [v8 medicalRecordIdentifier];
    location = (id *)&self->_profileExtension;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v16 = [WeakRetained profile];
    uint64_t v17 = [(HDMedicalDownloadableAttachmentManager *)self _attachmentIdentifierForMedicalRecordWithUUID:v14 profile:v16 error:a4];

    v68 = (void *)v17;
    if (!v17)
    {
      BOOL v22 = 0;
      id v10 = v13;
      uint64_t v12 = v67;
LABEL_57:

      goto LABEL_58;
    }
    id v18 = objc_alloc_init((Class)NSMutableDictionary);
    id v19 = [v8 webURL];

    if (v19)
    {
      id v20 = [v8 webURL];
      id v21 = [v20 absoluteString];
      [v18 setObject:v21 forKeyedSubscript:HKMedicalDownloadableAttachmentMetadataWebURLKey];

      id v10 = v13;
    }
    else
    {
      id v23 = [v8 inlineDataChecksum];

      id v10 = v13;
      if (!v23) {
        goto LABEL_23;
      }
      id v20 = [v8 inlineDataChecksum];
      [v18 setObject:v20 forKeyedSubscript:HKMedicalDownloadableAttachmentMetadataInlineDataChecksumKey];
    }

LABEL_23:
    v64 = v18;
    if ([v18 count] != (char *)&dword_0 + 1)
    {
      v57 = +[NSAssertionHandler currentHandler];
      v58 = [v8 identifier];
      [v57 handleFailureInMethod:a2, self, @"HDMedicalDownloadableAttachmentManager.m", 1092, @"MedicalDownloadableAttachment with identifier: %@, should have webURL xor inlineDataChecksum", v58 object file lineNumber description];
    }
    id v24 = [v8 metadata];
    uint64_t v25 = HKMedicalDownloadableAttachmentMetadataOriginalCreationDateKey;
    __int16 v26 = [v24 objectForKeyedSubscript:HKMedicalDownloadableAttachmentMetadataOriginalCreationDateKey];

    id v27 = v64;
    if (v26)
    {
      __int16 v28 = [v8 metadata];
      id v29 = [v28 objectForKeyedSubscript:v25];
      [v64 setObject:v29 forKeyedSubscript:v25];
    }
    id v30 = objc_loadWeakRetained(location);
    __int16 v31 = [v30 profile];
    long long v32 = [v31 attachmentManager];

    uint64_t v33 = [v8 title];
    long long v34 = (void *)v33;
    if (v33) {
      CFStringRef v35 = (const __CFString *)v33;
    }
    else {
      CFStringRef v35 = &stru_1152E8;
    }
    long long v36 = [v67 identifier];
    id v70 = 0;
    uint64_t v61 = HKAttachmentClinicalRecordSchemaIdentifier;
    v63 = v32;
    uint64_t v37 = objc_msgSend(v32, "addAttachmentWithName:contentTypeIdentifier:fileHandle:toObjectWithIdentifier:schemaIdentifier:attachmentMetadata:referenceMetadata:error:", v35, v36, v10, v68, 0, &v70);
    id v38 = v70;

    id v39 = (void *)v37;
    if (v37)
    {
      __int16 v40 = [v8 clinicalRecordIdentifier];

      if (!v40)
      {
        _HKInitializeLogging();
        v52 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v53 = v52;
          v54 = [v8 identifier];
          *(_DWORD *)buf = 138543618;
          v72 = self;
          __int16 v73 = 2114;
          v74 = v54;
          _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "%{public}@: downloadable attachment with identifier %{public}@ has no clinicalRecordIdentifier", buf, 0x16u);

          id v27 = v64;
        }
        BOOL v22 = 1;
        uint64_t v12 = v67;
        v51 = v63;
        goto LABEL_56;
      }
      v60 = (void *)v37;
      long long v41 = [v8 clinicalRecordIdentifier];
      id v42 = objc_loadWeakRetained(location);
      uint64_t v43 = [v42 profile];
      uint64_t v44 = [(HDMedicalDownloadableAttachmentManager *)self _attachmentIdentifierForClinicalRecordWithUUID:v41 profile:v43 error:a4];

      locationa = (id *)v44;
      if (!v44)
      {
        BOOL v22 = 0;
        uint64_t v12 = v67;
        v51 = v63;
        id v27 = v64;
        id v39 = v60;
LABEL_55:

        goto LABEL_56;
      }
      id v39 = v60;
      v45 = [v60 attachment];
      id v69 = v38;
      uint64_t v46 = [v63 addReferenceWithAttachment:v45 toObjectWithIdentifier:v44 schemaIdentifier:v61 metadata:0 error:&v69];
      id v62 = v69;

      v59 = (void *)v46;
      if (v46)
      {
        id v47 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
        if (v47)
        {
          v48 = [v8 identifier];
          v49 = [v60 attachment];
          v50 = [v49 identifier];
          BOOL v22 = +[HDMedicalDownloadableAttachmentEntity _markAvailableAndClearInlineDataForAttachmentWithIdentifier:v48 attachmentIdentifier:v50 profile:v47 error:a4];

          id v39 = v60;
          v51 = v63;
          id v27 = v64;
          uint64_t v12 = v67;
LABEL_54:

          id v38 = v62;
          goto LABEL_55;
        }
        BOOL v22 = 0;
        uint64_t v12 = v67;
      }
      else
      {
        id v55 = v62;
        id v47 = v55;
        uint64_t v12 = v67;
        if (v55)
        {
          v51 = v63;
          id v27 = v64;
          if (a4)
          {
            id v47 = v55;
            BOOL v22 = 0;
            *a4 = v47;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v22 = 0;
          }
          goto LABEL_54;
        }
        BOOL v22 = 0;
      }
      v51 = v63;
      id v27 = v64;
      goto LABEL_54;
    }
    if (v38)
    {
      id v38 = v38;
      uint64_t v12 = v67;
      v51 = v63;
    }
    else
    {
      id v38 = +[NSError hk_error:2000 format:@"HKMedicalDownloadableAttachment failed to add HKAttachment for unknown reason"];
      uint64_t v12 = v67;
      v51 = v63;
      if (!v38)
      {
LABEL_47:
        BOOL v22 = 0;
LABEL_56:

        goto LABEL_57;
      }
    }
    if (a4) {
      *a4 = v38;
    }
    else {
      _HKLogDroppedError();
    }

    goto LABEL_47;
  }
  if ([v8 status] != (char *)&dword_8 + 1 && objc_msgSend(v8, "status") != (char *)&dword_4 + 2)
  {
    +[NSError hk_assignError:a4 code:3 format:@"HKMedicalDownloadableAttachment must have status 'ProcessingComplete' to create an HKAttachment"];
LABEL_16:
    BOOL v22 = 0;
    goto LABEL_61;
  }
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B3788();
  }
  BOOL v22 = 1;
LABEL_61:

  return v22;
}

- (id)_attachmentIdentifierForMedicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  unsigned __int8 v5 = [(HDMedicalDownloadableAttachmentManager *)self _medicalRecordWithUUID:a3 profile:a4 error:a5];
  id v6 = v5;
  if (v5)
  {
    BOOL v7 = [v5 attachmentObjectIdentifier];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_medicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v13 = HDMedicalRecordEntityEncodingOptionSkipApplyingConceptIndex;
  id v14 = &__kCFBooleanTrue;
  id v8 = a4;
  unsigned __int8 v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v10 = +[HDClinicalNoteRecordEntity objectWithUUID:v7 encodingOptions:v9 profile:v8 error:a5];

  if (v10) {
    id v11 = v10;
  }
  else {
    +[NSError hk_assignError:a5, 118, @"Medical Record with UUID: %@ not found in database.", v7, v13, v14 code format];
  }

  return v10;
}

- (id)_clinicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[HDClinicalRecordEntity objectWithUUID:v7 encodingOptions:0 profile:a4 error:a5];
  unsigned __int8 v9 = v8;
  if (v8) {
    id v10 = v8;
  }
  else {
    +[NSError hk_assignError:a5, 118, @"Clinical Record with UUID: %@ not found in database.", v7 code format];
  }

  return v9;
}

- (id)_attachmentIdentifierForClinicalRecordWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = +[HDClinicalRecordEntity objectWithUUID:v7 encodingOptions:0 profile:a4 error:a5];
  unsigned __int8 v9 = v8;
  if (v8)
  {
    id v10 = [v8 attachmentObjectIdentifier];
  }
  else
  {
    +[NSError hk_assignError:a5, 118, @"Clinical Record with UUID: %@ not found in database.", v7 code format];
    id v10 = 0;
  }

  return v10;
}

- (id)_determineUTType:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 contentType];

  if (v6)
  {
    id v7 = [v5 contentType];
    id v8 = +[UTType typeWithMIMEType:v7];

    if (v8)
    {
      id v8 = v8;
      unsigned __int8 v9 = v8;
    }
    else
    {
      uint64_t v14 = objc_opt_class();
      id v15 = [v5 contentType];
      +[NSError hk_assignError:a4, 3, @"%@ Failed to create UTType from contentType '%@'", v14, v15 code format];

      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    id v10 = [v5 webURL];
    id v11 = [v10 lastPathComponent];
    id v8 = [v11 pathExtension];

    uint64_t v12 = +[UTType typeWithFilenameExtension:v8];
    unsigned __int8 v9 = v12;
    if (v12)
    {
      id v13 = v12;
    }
    else
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = [v5 identifier];
      +[NSError hk_assignError:a4, 3, @"%@ contentType not found for HKMedicalDownloadableAttachment identifier %@", v16, v17 code format];
    }
  }

  return v9;
}

- (BOOL)_indexDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDMedicalDownloadableAttachmentManager *)self fetchAttachmentWithIdentifier:v6 error:a4];
  if (v7)
  {
    id v8 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
    if (!v8)
    {
      BOOL v14 = 0;
LABEL_11:

      goto LABEL_12;
    }
    unsigned __int8 v9 = [v7 medicalRecordIdentifier];
    id v10 = [(HDMedicalDownloadableAttachmentManager *)self _medicalRecordWithUUID:v9 profile:v8 error:a4];

    if (v10)
    {
      id v11 = [v7 attachmentIdentifier];

      if (v11)
      {
        id v12 = objc_alloc((Class)HKClinicalDocumentIndexingRequest);
        id v13 = [v7 attachmentIdentifier];
        BOOL v22 = v13;
        BOOL v14 = 1;
        id v15 = +[NSArray arrayWithObjects:&v22 count:1];
        id v16 = [v12 initWithMedicalRecord:v10 attachmentIdentifiers:v15];

        uint64_t v17 = [(HDMedicalDownloadableAttachmentManager *)self extractionServiceClientCreateIfNecessary];
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        void v19[2] = sub_8DCF8;
        v19[3] = &unk_1148D0;
        void v19[4] = self;
        id v20 = v6;
        id v21 = v7;
        [v17 indexClinicalDocumentsWithRequest:v16 completion:v19];

LABEL_10:
        goto LABEL_11;
      }
      +[NSError hk_assignError:a4 code:3 format:@"HKMedicalDownloadableAttachment is missing attachmentIdentifier"];
    }
    BOOL v14 = 0;
    goto LABEL_10;
  }
  BOOL v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_reconcileDownloadableAttachmentToHKAttachmentForMedicalRecordWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
  if (v7)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
      sub_B394C();
    }
    id v40 = v6;
    if (v6)
    {
      id v8 = +[HDSQLiteComparisonPredicate predicateWithProperty:HDMedicalDownloadableAttachmentEntityPropertyMedicalRecordUUID equalToValue:v6];
    }
    else
    {
      id v8 = 0;
    }
    os_unfair_lock_lock(&self->_query_lock);
    id v10 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v58 = HDMedicalDownloadableAttachmentEntityPropertyIdentifier;
    id v11 = +[NSArray arrayWithObjects:&v58 count:1];
    id v12 = [v7 database];
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_8E4F4;
    v47[3] = &unk_114888;
    id v13 = v10;
    id v48 = v13;
    unsigned __int8 v9 = +[HDMedicalDownloadableAttachmentEntity enumerateProperties:v11 withPredicate:v8 healthDatabase:v12 error:a4 enumerationHandler:v47];

    if (v9)
    {
      id v38 = v8;
      _HKInitializeLogging();
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
        sub_B38A0();
      }
      unsigned __int8 v37 = v9;
      id v39 = v7;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v36 = v13;
      id v14 = v13;
      id v15 = [v14 countByEnumeratingWithState:&v43 objects:v57 count:16];
      id v6 = v40;
      if (v15)
      {
        id v16 = v15;
        int v17 = 0;
        LODWORD(v18) = 0;
        uint64_t v19 = *(void *)v44;
        do
        {
          int v41 = (int)v18;
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(v14);
            }
            id v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            id v42 = 0;
            unsigned __int8 v22 = [(HDMedicalDownloadableAttachmentManager *)self _reconcileHKAttachmentForDownloadableAttachmentWithIdentifier:v21 error:&v42];
            id v23 = v42;
            if ((v22 & 1) == 0)
            {
              _HKInitializeLogging();
              id v24 = HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v50 = self;
                __int16 v51 = 2114;
                id v52 = v21;
                __int16 v53 = 2114;
                id v54 = v23;
                _os_log_error_impl(&dword_0, v24, OS_LOG_TYPE_ERROR, "%{public}@: reconcileDownloadableAttachmentToHKAttachmentWithError for HKMedicalDownloadableAttachment with 'identifier': %{public}@ failed with error %{public}@", buf, 0x20u);
              }
              ++v17;
            }
          }
          p_query_os_unfair_lock_t lock = &self->_query_lock;
          LODWORD(v18) = v41 + v16;
          id v16 = [v14 countByEnumeratingWithState:&v43 objects:v57 count:16];
        }
        while (v16);
        id v18 = (void *)(int)v18;
        id v6 = v40;
      }
      else
      {
        int v17 = 0;
        id v18 = 0;
        p_query_os_unfair_lock_t lock = &self->_query_lock;
      }

      os_unfair_lock_unlock(p_query_lock);
      id v13 = v36;
      if (v17 >= 1)
      {
        _HKInitializeLogging();
        __int16 v26 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = v26;
          __int16 v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          id v29 = (HDMedicalDownloadableAttachmentManager *)objc_claimAutoreleasedReturnValue();
          id v30 = [v14 count];
          *(_DWORD *)buf = 138544130;
          v50 = v29;
          __int16 v51 = 2048;
          id v52 = v30;
          __int16 v53 = 2048;
          id v54 = v18;
          __int16 v55 = 2048;
          uint64_t v56 = v17;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: reconcileDownloadableAttachmentToHKAttachmentWithError with %lu records reconciled %lu records and encountered %lu errors", buf, 0x2Au);
        }
      }
      _HKInitializeLogging();
      __int16 v31 = (void *)HKLogHealthRecords;
      id v8 = v38;
      id v7 = v39;
      unsigned __int8 v9 = v37;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        long long v32 = v31;
        uint64_t v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        long long v34 = (HDMedicalDownloadableAttachmentManager *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v34;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: reconcileDownloadableAttachmentToHKAttachmentWithError completed", buf, 0xCu);
      }
    }
    else
    {
      os_unfair_lock_unlock(&self->_query_lock);
      id v6 = v40;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_reconcileHKAttachmentForDownloadableAttachmentWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = -[HDMedicalDownloadableAttachmentManager fetchAttachmentWithIdentifier:error:](self, "fetchAttachmentWithIdentifier:error:", a3);
  id v7 = [v6 medicalRecordIdentifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  unsigned __int8 v9 = [WeakRetained profile];
  id v10 = [(HDMedicalDownloadableAttachmentManager *)self _medicalRecordWithUUID:v7 profile:v9 error:a4];

  if (v10)
  {
    id v11 = [v6 clinicalRecordIdentifier];

    if (v11)
    {
      id v12 = [v6 clinicalRecordIdentifier];
      id v13 = objc_loadWeakRetained((id *)&self->_profileExtension);
      id v14 = [v13 profile];
      id v11 = [(HDMedicalDownloadableAttachmentManager *)self _clinicalRecordWithUUID:v12 profile:v14 error:a4];

      if (!v11) {
        goto LABEL_7;
      }
    }
    id v15 = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v16 = [v15 profile];
    unsigned int v17 = +[HDMedicalDownloadableAttachmentEntity _updateWithExistingAttachmentIfFoundForDownloadableAttachment:v6 medicalRecord:v10 clinicalRecord:v11 profile:v16 error:a4];

    if (v17)
    {
      id v18 = [v6 identifier];
      [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentDidChange:v18];

      BOOL v19 = 1;
    }
    else
    {
LABEL_7:
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)triggerAttachmentRetryForMedicalRecordWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v42 = self;
    __int16 v43 = 2112;
    id v44 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Retry HKMedicalDownloadableAttachments for medical record identifier %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  unsigned __int8 v9 = [WeakRetained ingestionManager];
  id v10 = (char *)[v9 currentIngestionState];

  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    if (![(HDMedicalDownloadableAttachmentManager *)self _reconcileDownloadableAttachmentToHKAttachmentForMedicalRecordWithIdentifier:v6 error:a4])
    {
      _HKInitializeLogging();
      id v11 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B3A30((uint64_t)self, (uint64_t)v6, v11);
      }
    }
    id v40 = 0;
    id v12 = [(HDMedicalDownloadableAttachmentManager *)self _downloadableAttachmentsForMedicalRecordWithIdentifier:v6 error:&v40];
    id v13 = v40;
    if (v12)
    {
      if (![v12 count])
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_B39C0();
        }
        +[NSError hk_assignError:a4, 3, @"%@ Retry for medical record identifier %@ failed. No HKMedicalDownloadableAttachments found.", objc_opt_class(), v6 code format];
        goto LABEL_35;
      }
      id v39 = v13;
      unsigned __int8 v14 = [(HDMedicalDownloadableAttachmentManager *)self _processAndIndexDownloadableAttachmentsWithIdentifiers:v12 backOff:0 error:&v39];
      id v15 = v39;

      if (v14)
      {
        id v38 = v15;
        id v16 = [(HDMedicalDownloadableAttachmentManager *)self _fetchDownloadableAttachmentsAwaitingDownloadWithBatchSize:&off_11D2F0 downloadableAttachmentIdentifiers:v12 backOff:0 error:&v38];
        id v13 = v38;

        char v17 = v16 != 0;
        _HKInitializeLogging();
        id v18 = (void *)HKLogHealthRecords;
        if (v16)
        {
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v19 = v18;
            id v20 = [v16 count];
            *(_DWORD *)buf = 138543618;
            id v42 = self;
            __int16 v43 = 2048;
            id v44 = v20;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Retry downloading %lu HKMedicalDownloadableAttachments", buf, 0x16u);
          }
          if ([v16 count])
          {
            [(HDMedicalDownloadableAttachmentManager *)self _callDownloaderWithDownloadableAttachments:v16 shouldRequestMore:0];
            _HKInitializeLogging();
            id v21 = HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v42 = self;
              _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: Retry downloading initiated for HKMedicalDownloadableAttachments", buf, 0xCu);
            }
          }
          _HKInitializeLogging();
          unsigned __int8 v22 = HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            id v42 = self;
            __int16 v43 = 2112;
            id v44 = v6;
            _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed initiating retry HKMedicalDownloadableAttachments for medical record identifier %@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v35 = v18;
            id v36 = [v13 localizedDescription];
            unsigned __int8 v37 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543874;
            id v42 = self;
            __int16 v43 = 2114;
            id v44 = v6;
            __int16 v45 = 2114;
            long long v46 = v37;
            _os_log_error_impl(&dword_0, v35, OS_LOG_TYPE_ERROR, "%{public}@: Retry downloading failed for medical record identifier %{public}@. Error: %{public}@", buf, 0x20u);
          }
          id v28 = v13;
          if (v28)
          {
            if (a4) {
              *a4 = v28;
            }
            else {
              _HKLogDroppedError();
            }
          }
        }
        goto LABEL_36;
      }
      _HKInitializeLogging();
      __int16 v26 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        long long v32 = v26;
        uint64_t v33 = [v15 localizedDescription];
        long long v34 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        id v42 = self;
        __int16 v43 = 2114;
        id v44 = v6;
        __int16 v45 = 2114;
        long long v46 = v34;
        _os_log_error_impl(&dword_0, v32, OS_LOG_TYPE_ERROR, "%{public}@: Retry processing / indexing failed for medical record identifier %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v25 = v15;
    }
    else
    {
      _HKInitializeLogging();
      id v24 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
      {
        id v29 = v24;
        id v30 = [v13 localizedDescription];
        __int16 v31 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        id v42 = self;
        __int16 v43 = 2114;
        id v44 = v6;
        __int16 v45 = 2114;
        long long v46 = v31;
        _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "%{public}@: Retry retrieving HKMedicalDownloadableAttachments for medical record identifier %{public}@ failed. Error: %{public}@", buf, 0x20u);
      }
      id v25 = v13;
    }
    id v13 = v25;
    if (v25)
    {
      if (a4) {
        *a4 = v25;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_35:
    char v17 = 0;
LABEL_36:

    goto LABEL_37;
  }
  _HKInitializeLogging();
  id v23 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = self;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Health Records ingestion in progress. Cannot retry at this time.", buf, 0xCu);
  }
  char v17 = 1;
LABEL_37:

  return v17;
}

- (BOOL)removeAllAttachmentsFromMedicalRecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(HDMedicalDownloadableAttachmentManager *)self profileWithError:a4];
  if (v7)
  {
    id v8 = [(HDMedicalDownloadableAttachmentManager *)self _attachmentIdentifierForMedicalRecordWithUUID:v6 profile:v7 error:a4];
    if (v8)
    {
      unsigned __int8 v9 = [v7 attachmentManager];
      unsigned __int8 v10 = [v9 removeAttachmentReferencesWithObjectIdentifier:v8 schemaIdentifier:HKAttachmentClinicalRecordSchemaIdentifier error:a4];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)_unitTesting_triggerDownloadableAttachmentDidChange:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)addDownloadableAttachmentStateObserver:(id)a3
{
}

- (void)removeDownloadableAttachmentStateObserver:(id)a3
{
}

- (void)_downloadableAttachmentDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HDMedicalDownloadableAttachmentManager *)self fetchAttachmentWithIdentifier:v4 error:0];
  if (v5)
  {
    [(HDMedicalDownloadableAttachmentManager *)self downloadableAttachmentDidChange:v5];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B3B14();
    }
  }
}

- (void)downloadableAttachmentDidChange:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B3B84();
  }
  stateChangeListeners = self->_stateChangeListeners;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8EF48;
  v7[3] = &unk_1148F8;
  id v8 = v4;
  id v6 = v4;
  [(HKObserverSet *)stateChangeListeners notifyObservers:v7];
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (HKObserverSet)stateChangeListeners
{
  return self->_stateChangeListeners;
}

- (void)setStateChangeListeners:(id)a3
{
}

- (BOOL)_unitTesting_skippedAttachmentDownload
{
  return self->__unitTesting_skippedAttachmentDownload;
}

- (void)set_unitTesting_skippedAttachmentDownload:(BOOL)a3
{
  self->__unitTesting_skippedAttachmentDownload = a3;
}

- (id)unitTesting_didFinishIndexingNotification
{
  return self->_unitTesting_didFinishIndexingNotification;
}

- (void)setUnitTesting_didFinishIndexingNotification:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didFinishIndexingNotification, 0);
  objc_storeStrong((id *)&self->_stateChangeListeners, 0);
  objc_destroyWeak((id *)&self->_profileExtension);

  objc_storeStrong((id *)&self->_extractionServiceClient, 0);
}

@end