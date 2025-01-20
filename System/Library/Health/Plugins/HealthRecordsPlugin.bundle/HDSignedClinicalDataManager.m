@interface HDSignedClinicalDataManager
- (BOOL)deleteSignedClinicalDataRecord:(id)a3 error:(id *)a4;
- (BOOL)isReextractingSignedClinicalDataRecordWithSyncIdentifier:(id)a3;
- (HDHealthRecordsIngestionServiceClient)XPCServiceClient;
- (HDHealthRecordsProfileExtension)profileExtension;
- (HDSignedClinicalDataManager)initWithProfileExtension:(id)a3;
- (OS_dispatch_queue)privateQueue;
- (id)_groupRecordsByAccount:(id)a3 error:(id *)a4;
- (id)_storeDataFromClinicalItem:(id)a3 existingAccountIdentifier:(id)a4 insertOriginalRecords:(BOOL)a5 accountEntityMap:(id)a6 numOriginalRecordsInserted:(unint64_t *)a7 numDuplicateRecords:(unint64_t *)a8 transaction:(id)a9 error:(id *)a10;
- (id)resultWithUpdatedSignedClinicalDataRecordsInParsingResult:(id)a3;
- (id)signedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)signedClinicalRecordBackingMedicalRecord:(id)a3 error:(id *)a4;
- (id)storeDataFromParsingResult:(id)a3 existingAccountIdentifier:(id)a4 insertOriginalRecords:(BOOL)a5 allRecordsWereDuplicates:(BOOL *)a6 error:(id *)a7;
- (int64_t)extractionVersion;
- (void)_scheduleExtractionWithReason:(id)a3;
- (void)_scheduleExtractionWithReason:(id)a3 ignoreExtractionVersion:(BOOL)a4;
- (void)_serialQueue_didReceiveOriginalSyncEntities;
- (void)_serialQueue_performProtectedDataAvailableChecks;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)didCompleteReExtractionWithCompletion:(id)a3 numExtracted:(id)a4 errorReturned:(id)a5;
- (void)didReceiveOriginalSignedClinicalDataRecordSyncEntities;
- (void)extractUnextractedOriginalRecordsWithReason:(id)a3 ignoreExtractionVersion:(BOOL)a4 completion:(id)a5;
- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4;
- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)profileDidBecomeReady:(id)a3;
- (void)reextractOriginalSignedClinicalDataRecords:(id)a3 completion:(id)a4;
- (void)reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)reverifySignatureForRecord:(id)a3 completion:(id)a4;
- (void)storeSignedClinicalData:(id)a3 completion:(id)a4;
- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)updateIssuerTitlesUsingRegistry:(id)a3;
@end

@implementation HDSignedClinicalDataManager

- (HDSignedClinicalDataManager)initWithProfileExtension:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDSignedClinicalDataManager;
  v5 = [(HDSignedClinicalDataManager *)&v15 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialDispatchQueue();
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v6;

    v5->_ivarLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    originalSyncIdentifiersBeingStored = v5->_originalSyncIdentifiersBeingStored;
    v5->_originalSyncIdentifiersBeingStored = v8;

    objc_storeWeak((id *)&v5->_profileExtension, v4);
    uint64_t v10 = [v4 createHealthRecordsIngestionServiceClient];
    XPCServiceClient = v5->_XPCServiceClient;
    v5->_XPCServiceClient = (HDHealthRecordsIngestionServiceClient *)v10;

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_profileExtension);
    v13 = [WeakRetained profile];
    [v13 registerProfileReadyObserver:v5 queue:v5->_serialQueue];
  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained profile];
  v5 = [v4 daemon];
  uint64_t v6 = [v5 ontologyUpdateCoordinator];
  v7 = [v6 importer];
  [v7 removeOntologyShardImporterObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)HDSignedClinicalDataManager;
  [(HDSignedClinicalDataManager *)&v8 dealloc];
}

- (void)parseSignedClinicalData:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  _HKInitializeLogging();
  uint64_t v10 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B0160(v10);
  }
  XPCServiceClient = self->_XPCServiceClient;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_61690;
  v13[3] = &unk_113AF8;
  v13[4] = self;
  id v14 = v9;
  id v12 = v9;
  [(HDHealthRecordsIngestionServiceClient *)XPCServiceClient parseSignedClinicalData:v8 options:a4 completion:v13];
}

- (void)storeSignedClinicalData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B0338(v8);
  }
  XPCServiceClient = self->_XPCServiceClient;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_61860;
  v11[3] = &unk_113AF8;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [(HDHealthRecordsIngestionServiceClient *)XPCServiceClient parseSignedClinicalData:v6 options:2 completion:v11];
}

- (void)reextractOriginalSignedClinicalDataRecords:(id)a3 completion:(id)a4
{
  id v43 = a3;
  id v44 = a4;
  v45 = objc_msgSend(v43, "hk_filter:", &stru_113B38);
  _HKInitializeLogging();
  id v6 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [v45 count];
    *(_WORD *)&buf[22] = 2048;
    id v67 = [v43 count];
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: reextractOriginalSignedClinicalDataRecords is about to process %lu active out of %lu total records", buf, 0x20u);
  }
  if ([v45 count])
  {
    id v56 = 0;
    v42 = [(HDSignedClinicalDataManager *)self _groupRecordsByAccount:v45 error:&v56];
    id v41 = v56;
    if (v42)
    {
      group = dispatch_group_create();
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2810000000;
      id v67 = &unk_ED979;
      int v68 = 0;
      id v46 = objc_alloc_init((Class)NSMutableArray);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v10 = v42;
      id v11 = [v10 countByEnumeratingWithState:&v52 objects:v65 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v53;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v53 != v12) {
              objc_enumerationMutation(v10);
            }
            id v14 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            objc_super v15 = [v10 objectForKeyedSubscript:v14];
            dispatch_group_enter(group);
            _HKInitializeLogging();
            v16 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG))
            {
              v17 = v16;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                v19 = self;
                v20 = (objc_class *)objc_opt_class();
                v21 = NSStringFromClass(v20);
                XPCServiceClient = v19->_XPCServiceClient;
                *(_DWORD *)v59 = 138543874;
                id v60 = v21;
                __int16 v61 = 2114;
                v62 = XPCServiceClient;
                __int16 v63 = 2114;
                id v64 = v14;
                _os_log_debug_impl(&dword_0, v17, OS_LOG_TYPE_DEBUG, "%{public}@: reextractOriginalSignedClinicalDataRecords calling out to XPC client %{public}@ for account %{public}@", v59, 0x20u);

                self = v19;
              }
            }
            v18 = self->_XPCServiceClient;
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472;
            v48[2] = sub_62180;
            v48[3] = &unk_113B60;
            v48[4] = self;
            v48[5] = v14;
            v51 = buf;
            id v49 = v46;
            v50 = group;
            [(HDHealthRecordsIngestionServiceClient *)v18 processOriginalSignedClinicalDataRecords:v15 options:0 completion:v48];
          }
          id v11 = [v10 countByEnumeratingWithState:&v52 objects:v65 count:16];
        }
        while (v11);
      }

      dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)&buf[8] + 32));
      id v23 = [v46 copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)&buf[8] + 32));
      if ([v23 count])
      {
        v24 = [v23 firstObject];
        if ((unint64_t)[v23 count] >= 2)
        {
          NSErrorUserInfoKey v57 = NSMultipleUnderlyingErrorsKey;
          id v58 = v23;
          v25 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
          uint64_t v26 = +[NSError errorWithDomain:HKErrorDomain code:100 userInfo:v25];

          v24 = (void *)v26;
        }
        _HKInitializeLogging();
        v27 = HKLogHealthRecords;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          v30 = HKSensitiveLogItem();
          sub_B0664(v29, v30, (uint64_t)v59, v27);
        }

        [(HDSignedClinicalDataManager *)self didCompleteReExtractionWithCompletion:v44 numExtracted:0 errorReturned:v24];
      }
      else
      {
        _HKInitializeLogging();
        v36 = HKLogHealthRecords;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          v37 = (objc_class *)objc_opt_class();
          NSStringFromClass(v37);
          id v38 = (id)objc_claimAutoreleasedReturnValue();
          v39 = (HDHealthRecordsIngestionServiceClient *)[v45 count];
          id v40 = [v10 count];
          *(_DWORD *)v59 = 138543874;
          id v60 = v38;
          __int16 v61 = 2048;
          v62 = v39;
          __int16 v63 = 2048;
          id v64 = v40;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "%{public}@: reextractOriginalSignedClinicalDataRecords successfully processed %lu records for %lu accounts", v59, 0x20u);
        }
        v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v45 count]);
        [(HDSignedClinicalDataManager *)self didCompleteReExtractionWithCompletion:v44 numExtracted:v24 errorReturned:0];
      }

      _Block_object_dispose(buf, 8);
    }
    else
    {
      _HKInitializeLogging();
      v35 = (void *)HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B05A0(v35);
      }
      [(HDSignedClinicalDataManager *)self didCompleteReExtractionWithCompletion:v44 numExtracted:0 errorReturned:v41];
    }
  }
  else
  {
    _HKInitializeLogging();
    v31 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v32 = v31;
      v33 = (objc_class *)objc_opt_class();
      v34 = NSStringFromClass(v33);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v34;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: reextractOriginalSignedClinicalDataRecords got 0 records, I'm done", buf, 0xCu);
    }
    [(HDSignedClinicalDataManager *)self didCompleteReExtractionWithCompletion:v44 numExtracted:&off_11D1E8 errorReturned:0];
  }
}

- (void)didCompleteReExtractionWithCompletion:(id)a3 numExtracted:(id)a4 errorReturned:(id)a5
{
}

- (BOOL)isReextractingSignedClinicalDataRecordWithSyncIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"HDSignedClinicalDataManager.m", 217, @"Invalid parameter not satisfying: %@", @"syncIdentifier" object file lineNumber description];
  }
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  unsigned __int8 v7 = [(NSMutableSet *)self->_originalSyncIdentifiersBeingStored containsObject:v5];
  os_unfair_lock_unlock(p_ivarLock);

  return v7;
}

- (id)signedClinicalRecordBackingMedicalRecord:(id)a3 error:(id *)a4
{
  p_profileExtension = &self->_profileExtension;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profileExtension);
  id v8 = [WeakRetained profile];

  id v9 = +[HDSignedClinicalDataRecordEntity signedClinicalRecordBackingMedicalRecord:v6 profile:v8 error:a4];

  return v9;
}

- (void)didReceiveOriginalSignedClinicalDataRecordSyncEntities
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_62630;
  block[3] = &unk_113B88;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (id)resultWithUpdatedSignedClinicalDataRecordsInParsingResult:(id)a3
{
  id v4 = a3;
  id v5 = [(HDSignedClinicalDataManager *)self profileExtension];
  id v6 = [v5 createSignedClinicalDataRegistry];

  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = [v4 items];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_6278C;
  v19 = &unk_113BB0;
  id v20 = v7;
  id v21 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = objc_msgSend(v8, "hk_map:", &v16);

  id v12 = objc_alloc((Class)HKSignedClinicalDataParsingResult);
  id v13 = objc_msgSend(v4, "options", v16, v17, v18, v19);

  id v14 = [v12 initWithItems:v11 options:v13];

  return v14;
}

- (id)storeDataFromParsingResult:(id)a3 existingAccountIdentifier:(id)a4 insertOriginalRecords:(BOOL)a5 allRecordsWereDuplicates:(BOOL *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [v12 items];
  id v15 = [v14 count];

  if (v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v38 = [WeakRetained profile];

    uint64_t v52 = 0;
    long long v53 = &v52;
    uint64_t v54 = 0x2020000000;
    uint64_t v55 = 0;
    uint64_t v48 = 0;
    id v49 = &v48;
    uint64_t v50 = 0x2020000000;
    uint64_t v51 = 0;
    id v17 = objc_alloc_init((Class)NSMutableArray);
    v18 = [v38 database];
    id v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_62D64;
    v39[3] = &unk_113BD8;
    id v19 = v12;
    id v40 = v19;
    id v41 = self;
    BOOL v46 = a5;
    id v42 = v13;
    id v44 = &v52;
    v45 = &v48;
    id v20 = v17;
    id v43 = v20;
    LOBYTE(v17) = +[HDOriginalSignedClinicalDataRecordEntity performWriteTransactionWithHealthDatabase:v18 error:&v47 block:v39 inaccessibilityHandler:&stru_113BF8];
    id v21 = v47;

    if (v17)
    {
      _HKInitializeLogging();
      v22 = HKLogHealthRecords;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        id v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = NSStringFromSelector(a2);
        uint64_t v26 = v53[3];
        uint64_t v27 = v49[3];
        *(_DWORD *)buf = 138544130;
        id v57 = v24;
        __int16 v58 = 2114;
        v59 = v25;
        __int16 v60 = 2048;
        uint64_t v61 = v26;
        __int16 v62 = 2048;
        uint64_t v63 = v27;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ succeeded, %lu new records inserted, %lu records were already in the database (duplicates)", buf, 0x2Au);
      }
      if (a6)
      {
        uint64_t v28 = v49[3];
        if (v28) {
          LOBYTE(v28) = v53[3] == 0;
        }
        *a6 = v28;
      }
      id v29 = objc_msgSend(v19, "copyWithItems:", v20, a6);
    }
    else
    {
      id v34 = v21;
      v35 = v34;
      if (v34)
      {
        if (a7) {
          *a7 = v34;
        }
        else {
          _HKLogDroppedError();
        }
      }

      id v29 = 0;
    }

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(&v52, 8);
  }
  else
  {
    _HKInitializeLogging();
    v30 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
    {
      v31 = v30;
      v32 = (objc_class *)objc_opt_class();
      v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138543362;
      id v57 = v33;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: storeDataFromParsingResult got 0 records, I'm done", buf, 0xCu);
    }
    id v29 = v12;
  }

  return v29;
}

- (id)_storeDataFromClinicalItem:(id)a3 existingAccountIdentifier:(id)a4 insertOriginalRecords:(BOOL)a5 accountEntityMap:(id)a6 numOriginalRecordsInserted:(unint64_t *)a7 numDuplicateRecords:(unint64_t *)a8 transaction:(id)a9 error:(id *)a10
{
  BOOL v137 = a5;
  os_log_t v15 = (os_log_t)a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  v132 = a7;
  if (a7)
  {
    if (a8) {
      goto LABEL_3;
    }
  }
  else
  {
    v124 = +[NSAssertionHandler currentHandler];
    [v124 handleFailureInMethod:a2, self, @"HDSignedClinicalDataManager.m", 356, @"Invalid parameter not satisfying: %@", @"numOriginalRecordsInserted != NULL" object file lineNumber description];

    if (a8) {
      goto LABEL_3;
    }
  }
  v125 = +[NSAssertionHandler currentHandler];
  [v125 handleFailureInMethod:a2, self, @"HDSignedClinicalDataManager.m", 357, @"Invalid parameter not satisfying: %@", @"numDuplicateRecords != NULL" object file lineNumber description];

LABEL_3:
  v130 = a8;
  v145 = [v18 databaseForEntityClass:objc_opt_class()];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  v147 = [WeakRetained profile];

  if (v16)
  {
    id v20 = v16;
  }
  else
  {
    id v21 = [v15 originalRecord];
    id v20 = [v21 issuerIdentifier];
  }
  v22 = [v15 originalRecord];
  v146 = [v22 syncIdentifier];

  _HKInitializeLogging();
  id v23 = (void *)HKLogHealthRecords;
  id v142 = v18;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = v23;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    uint64_t v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    CFStringRef v161 = v26;
    __int16 v162 = 2114;
    v163 = v27;
    __int16 v164 = 2114;
    CFStringRef v165 = v146;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ storing parsing result for original record %{public}@", buf, 0x20u);

    id v18 = v142;
  }
  v143 = v20;
  uint64_t v28 = [v17 objectForKeyedSubscript:v20];
  v135 = v17;
  id v136 = v16;
  if (v28)
  {
LABEL_12:
    v30 = [v147 syncIdentityManager];
    v31 = [v30 currentSyncIdentity];
    v141 = [v31 identity];

    _HKInitializeLogging();
    v32 = (void *)HKLogHealthRecords;
    BOOL v33 = os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT);
    if (v137)
    {
      if (v33)
      {
        id v34 = v32;
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        CFStringRef v161 = v36;
        __int16 v162 = 2114;
        v163 = v37;
        __int16 v164 = 2114;
        CFStringRef v165 = v146;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ inserting original record %{public}@", buf, 0x20u);
      }
      id v38 = [v15 originalRecord];
      v39 = [v15 uniquenessChecksum];
      id v40 = [v38 asNewCodableRecordWithUniquenessChecksum:v39 syncIdentity:v141];

      id v157 = 0;
      id v41 = +[HDOriginalSignedClinicalDataRecordEntity insertCodableRecord:shouldReplace:accountPersistentID:syncProvenance:profile:transaction:error:](HDOriginalSignedClinicalDataRecordEntity, "insertCodableRecord:shouldReplace:accountPersistentID:syncProvenance:profile:transaction:error:", v40, 0, [v28 persistentID], 0, v147, v18, &v157);
      id v42 = (__CFString *)v157;
LABEL_25:

      if (v41)
      {
        v151 = v42;
        v59 = [v28 accountInDatabase:v145 error:&v151];
        __int16 v60 = v151;

        if (v59)
        {
          v131 = v60;
          v149[1] = _NSConcreteStackBlock;
          v149[2] = (id)3221225472;
          v149[3] = sub_641A0;
          v149[4] = &unk_112318;
          v149[5] = self;
          uint64_t v61 = v146;
          v150 = v61;
          HKWithUnfairLock();
          v149[0] = 0;
          unsigned __int8 v62 = [v41 storeSignedClinicalDataItem:v15 account:v59 profile:v147 error:v149];
          id v63 = v149[0];
          CFStringRef v64 = v61;
          v148 = (__CFString *)v64;
          HKWithUnfairLock();
          if (v62)
          {
            os_log_t log = v15;
            if (v137)
            {
              _HKInitializeLogging();
              v65 = (void *)HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_INFO))
              {
                v66 = v65;
                id v67 = (objc_class *)objc_opt_class();
                NSStringFromClass(v67);
                int v68 = (__CFString *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                CFStringRef v161 = v68;
                __int16 v162 = 2114;
                v163 = v69;
                __int16 v164 = 2114;
                CFStringRef v165 = @"com.apple.health.records.added-verifiable-record";
                __int16 v166 = 2114;
                CFStringRef v167 = v64;
                _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, "%{public}@  %{public}@ donating \"%{public}@\" event to Biome for record with sync identifier %{public}@", buf, 0x2Au);
              }
              v70 = [log originalRecord];
              [v70 sourceType];
              v71 = NSStringForSignedClinicalDataSourceType();
              +[HDClinicalBiomeSignalsManager lazilySendEvent:@"com.apple.health.records.added-verifiable-record" context:v71];
            }
            else
            {
              XPCServiceClient = self->_XPCServiceClient;
              v70 = [v15 mainRecord];
              [(HDHealthRecordsIngestionServiceClient *)XPCServiceClient didUpdateSignedClinicalDataRecord:v70];
            }

            ++*v132;
            _HKInitializeLogging();
            v95 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
            {
              v96 = v95;
              v97 = (objc_class *)objc_opt_class();
              NSStringFromClass(v97);
              v98 = (__CFString *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v99 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              CFStringRef v161 = v98;
              __int16 v162 = 2114;
              v163 = v99;
              __int16 v164 = 2114;
              CFStringRef v165 = v64;
              _os_log_impl(&dword_0, v96, OS_LOG_TYPE_DEFAULT, "%{public}@  %{public}@ did store parsing result for original record %{public}@", buf, 0x20u);
            }
            os_log_t v15 = log;
            v82 = log;
            id v18 = v142;
          }
          else
          {
            _HKInitializeLogging();
            v85 = (void *)HKLogHealthRecords;
            if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
            {
              v111 = v85;
              v112 = (objc_class *)objc_opt_class();
              NSStringFromClass(v112);
              v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v114 = (__CFString *)objc_claimAutoreleasedReturnValue();
              HKSensitiveLogItem();
              v115 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              CFStringRef v161 = v113;
              __int16 v162 = 2114;
              v163 = v114;
              __int16 v164 = 2114;
              CFStringRef v165 = v115;
              _os_log_error_impl(&dword_0, v111, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to insert signed clinical data records with error: %{public}@", buf, 0x20u);
            }
            id v86 = v63;
            v87 = v86;
            id v18 = v142;
            if (v86)
            {
              if (a10) {
                *a10 = v86;
              }
              else {
                _HKLogDroppedError();
              }
            }

            v82 = 0;
          }

          id v42 = v131;
        }
        else
        {
          _HKInitializeLogging();
          v83 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
            sub_B08E8(v83, v28);
          }
          v84 = v60;
          id v42 = v84;
          if (v84)
          {
            if (a10) {
              *a10 = v84;
            }
            else {
              _HKLogDroppedError();
            }
          }

          v82 = 0;
        }
        goto LABEL_80;
      }
      unsigned int v72 = [(__CFString *)v42 hk_isHealthKitErrorWithCode:115];
      _HKInitializeLogging();
      v73 = (void *)HKLogHealthRecords;
      if (v72)
      {
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
        {
          v138 = v73;
          v74 = (objc_class *)objc_opt_class();
          NSStringFromClass(v74);
          v133 = (__CFString *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v75 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v76 = [v15 uniquenessChecksum];
          objc_msgSend(v76, "hk_hexString");
          v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v78 = [(__CFString *)v42 localizedDescription];
          *(_DWORD *)buf = 138544130;
          CFStringRef v161 = v133;
          __int16 v162 = 2114;
          v163 = v75;
          __int16 v164 = 2114;
          CFStringRef v165 = v77;
          __int16 v166 = 2114;
          CFStringRef v167 = v78;
          _os_log_impl(&dword_0, v138, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ did not insert original SCD record with checksum %{public}@ because it's already there: %{public}@", buf, 0x2Au);

          id v18 = v142;
        }
        ++*v130;
        v79 = [v15 uniquenessChecksum];
        id v154 = 0;
        v80 = +[HDSignedClinicalDataRecordEntity signedClinicalDataRecordBackedByRecordWithUniquenessChecksum:v79 account:v28 database:v145 profile:v147 error:&v154];
        v59 = (__CFString *)v154;

        if (v80)
        {
          v81 = [v15 originalRecord];
          v82 = [v15 copyWithOriginalRecord:v81 mainRecord:v80];
        }
        else
        {
          os_log_t loga = v15;
          _HKInitializeLogging();
          v100 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v140 = v100;
            v120 = (objc_class *)objc_opt_class();
            NSStringFromClass(v120);
            v134 = (__CFString *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v122 = [v15 uniquenessChecksum];
            objc_msgSend(v122, "hk_hexString");
            v123 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            CFStringRef v161 = v134;
            __int16 v162 = 2114;
            v163 = v121;
            __int16 v164 = 2114;
            CFStringRef v165 = v123;
            __int16 v166 = 2114;
            CFStringRef v167 = v59;
            _os_log_error_impl(&dword_0, v140, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to retrieve HKSignedClinicalDataRecord given its uniqueness checksum (%{public}@) with error: %{public}@", buf, 0x2Au);

            id v18 = v142;
          }
          os_log_t v139 = [v28 UUIDForProperty:HDClinicalAccountEntityPropertyIdentifier database:v145];
          _HKInitializeLogging();
          v101 = (void *)HKLogHealthRecords;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
          {
            v102 = v101;
            v103 = (objc_class *)objc_opt_class();
            NSStringFromClass(v103);
            v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
            +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v28 persistentID]);
            v106 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            CFStringRef v161 = v104;
            __int16 v162 = 2114;
            v163 = v105;
            __int16 v164 = 2114;
            CFStringRef v165 = v106;
            _os_log_impl(&dword_0, v102, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ triggering SCD re-extraction for account entity %{public}@ and returning in error", buf, 0x20u);

            id v18 = v142;
          }
          v107 = dispatch_get_global_queue(0, 0);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_64188;
          block[3] = &unk_112318;
          block[4] = self;
          v81 = v139;
          v153 = v81;
          dispatch_async(v107, block);

          v108 = v59;
          v109 = v108;
          os_log_t v15 = loga;
          if (v108)
          {
            if (a10) {
              *a10 = v108;
            }
            else {
              _HKLogDroppedError();
            }
          }

          v82 = 0;
        }

        goto LABEL_80;
      }
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      {
        if (v137) {
          CFStringRef v116 = @"insert";
        }
        else {
          CFStringRef v116 = @"find";
        }
        v117 = v73;
        v118 = [v15 uniquenessChecksum];
        objc_msgSend(v118, "hk_hexString");
        v119 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        CFStringRef v161 = v116;
        __int16 v162 = 2114;
        v163 = v146;
        __int16 v164 = 2114;
        CFStringRef v165 = v119;
        __int16 v166 = 2114;
        CFStringRef v167 = v42;
        _os_log_fault_impl(&dword_0, v117, OS_LOG_TYPE_FAULT, "HDSignedClinicalDataManager._storeDataFromClinicalItem failed to %{public}@ original signed clinical data record with sync identifier %{public}@ and checksum %{public}@, error: %{public}@", buf, 0x2Au);
      }
      v88 = v42;
      v59 = v88;
      if (v88)
      {
        if (a10)
        {
          v59 = v88;
          v82 = 0;
          *a10 = v59;
          id v42 = v59;
LABEL_80:

          id v16 = v136;
          goto LABEL_81;
        }
        _HKLogDroppedError();
      }
      v82 = 0;
      id v42 = v59;
      goto LABEL_80;
    }
    if (v33)
    {
      id v43 = v32;
      id v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      BOOL v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      CFStringRef v161 = v45;
      __int16 v162 = 2114;
      v163 = v46;
      __int16 v164 = 2114;
      CFStringRef v165 = v146;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ retrieving original record %{public}@ by sync identifier", buf, 0x20u);
    }
    id v156 = 0;
    id v41 = +[HDOriginalSignedClinicalDataRecordEntity entityWithSyncIdentifier:v146 database:v145 error:&v156];
    id v42 = (__CFString *)v156;
    id v155 = 0;
    id v47 = (char *)[v41 updateUniquenessChecksumIfNecessaryWithItem:v15 database:v145 error:&v155];
    id v40 = v155;
    if (v47 == (unsigned char *)&dword_0 + 1)
    {
      _HKInitializeLogging();
      uint64_t v54 = (void *)HKLogHealthRecords;
      if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      long long v53 = v54;
      uint64_t v55 = (objc_class *)objc_opt_class();
      NSStringFromClass(v55);
      id v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      id v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringRef v58 = (const __CFString *)[v41 persistentID];
      *(_DWORD *)buf = 138543874;
      CFStringRef v161 = v56;
      __int16 v162 = 2114;
      v163 = v57;
      __int16 v164 = 2048;
      CFStringRef v165 = v58;
      _os_log_impl(&dword_0, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ updated uniqueness checksum during re-extraction, original SCD record ROWID %llu", buf, 0x20u);

      id v18 = v142;
    }
    else
    {
      if (v47) {
        goto LABEL_25;
      }
      _HKInitializeLogging();
      uint64_t v48 = (void *)HKLogHealthRecords;
      if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        goto LABEL_25;
      }
      logb = v48;
      id v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v126 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v50 = NSStringFromSelector(a2);
      uint64_t v51 = [v40 localizedDescription];
      *(_DWORD *)buf = 138543874;
      CFStringRef v161 = v126;
      __int16 v162 = 2114;
      v163 = (__CFString *)v50;
      uint64_t v52 = (void *)v50;
      __int16 v164 = 2114;
      CFStringRef v165 = v51;
      long long v53 = logb;
      _os_log_error_impl(&dword_0, logb, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to update uniqueness checksum, ignoring and continuing. Error: %{public}@", buf, 0x20u);

      id v18 = v142;
    }

    goto LABEL_25;
  }
  if (v16)
  {
    id v159 = 0;
    uint64_t v28 = +[HDClinicalAccountEntity existingAccountEntityWithIdentifier:v16 database:v145 error:&v159];
    id v29 = v159;
    if (v28)
    {
LABEL_11:
      [v17 setObject:v28 forKeyedSubscript:v143];

      goto LABEL_12;
    }
  }
  else
  {
    id v89 = objc_loadWeakRetained((id *)&self->_profileExtension);
    v90 = [v89 accountManager];
    v91 = [v15 originalRecord];
    id v158 = 0;
    uint64_t v28 = [v90 accountEntityForRecord:v91 createIfNecessary:1 error:&v158];
    id v29 = v158;

    id v18 = v142;
    if (v28) {
      goto LABEL_11;
    }
  }
  _HKInitializeLogging();
  v92 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
    sub_B0858(v92);
  }
  v93 = (__CFString *)v29;
  id v42 = v93;
  if (v93)
  {
    if (a10)
    {
      id v42 = v93;
      v82 = 0;
      *a10 = v42;
      uint64_t v28 = v42;
      goto LABEL_81;
    }
    _HKLogDroppedError();
  }
  v82 = 0;
  uint64_t v28 = v42;
LABEL_81:

  return v82;
}

- (id)signedClinicalDataGroupBackingMedicalRecord:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v11 = [WeakRetained profile];

  if ((a4 & 1) == 0)
  {
    id v12 = 0;
    id v13 = 0;
    goto LABEL_4;
  }
  id v101 = 0;
  id v12 = +[HDSignedClinicalDataRecordEntity signedClinicalRecordBackingMedicalRecord:v9 profile:v11 error:&v101];
  id v13 = v101;
  if (v12)
  {
LABEL_4:
    if ((a4 & 2) != 0)
    {
      aSelector = a2;
      id v100 = v13;
      id v17 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityBackingMedicalRecord:v9 profile:v11 error:&v100];
      id v18 = v100;

      if (!v17)
      {
        _HKInitializeLogging();
        id v24 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          uint64_t v54 = v24;
          uint64_t v55 = (objc_class *)objc_opt_class();
          id v56 = NSStringFromClass(v55);
          id v57 = NSStringFromSelector(aSelector);
          CFStringRef v58 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543874;
          v103 = v56;
          __int16 v104 = 2114;
          v105 = v57;
          __int16 v106 = 2114;
          v107 = v58;
          _os_log_error_impl(&dword_0, v54, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch original record entity backing medical record with error: %{public}@", buf, 0x20u);
        }
        id v25 = v18;
        goto LABEL_57;
      }
      id v99 = v18;
      uint64_t v19 = [v17 existingDerivedMedicalRecordsOnProfile:v11 excludeMainRecord:1 error:&v99];
      id v13 = v99;

      if (!v19)
      {
        _HKInitializeLogging();
        uint64_t v26 = (void *)HKLogHealthRecords;
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
          v59 = v26;
          __int16 v60 = (objc_class *)objc_opt_class();
          uint64_t v61 = NSStringFromClass(v60);
          unsigned __int8 v62 = NSStringFromSelector(aSelector);
          id v63 = HKSensitiveLogItem();
          *(_DWORD *)buf = 138543874;
          v103 = v61;
          __int16 v104 = 2114;
          v105 = v62;
          __int16 v106 = 2114;
          v107 = v63;
          _os_log_error_impl(&dword_0, v59, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch medical records backed by medical record with error: %{public}@", buf, 0x20u);
        }
        id v13 = v13;
        if (v13)
        {
          if (a5) {
            *a5 = v13;
          }
          else {
            _HKLogDroppedError();
          }
        }

        goto LABEL_81;
      }
      os_log_t v15 = (void *)v19;
      v91 = a5;
      if ((a4 & 4) == 0)
      {
        id v14 = 0;
LABEL_31:
        if ((a4 & 8) == 0)
        {
          id v16 = 0;
          goto LABEL_48;
        }
        id v20 = v13;
        goto LABEL_34;
      }
      id v20 = v13;
    }
    else
    {
      if ((a4 & 4) == 0)
      {
        if ((a4 & 8) == 0)
        {
          id v14 = 0;
          os_log_t v15 = 0;
          id v16 = 0;
          id v17 = 0;
LABEL_48:
          id v23 = [objc_alloc((Class)HKSignedClinicalDataGroup) initWithOptions:a4 mainRecord:v12 medicalRecords:v15 clinicalRecords:v14 QRRepresentation:v16];

          goto LABEL_83;
        }
        id v96 = v13;
        id v17 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityBackingMedicalRecord:v9 profile:v11 error:&v96];
        id v20 = v96;

        if (v17)
        {
          v91 = a5;
          aSelector = a2;
          os_log_t v15 = 0;
          id v14 = 0;
LABEL_34:
          id v89 = v9;
          if (v12)
          {
            v88 = v15;
            id v90 = v12;
            goto LABEL_45;
          }
          id v95 = v20;
          uint64_t v34 = [v17 signedClinicalDataRecordWithProfile:v11 error:&v95];
          id v35 = v95;

          id v90 = (id)v34;
          if (v34)
          {
            v88 = v15;
            id v20 = v35;
LABEL_45:
            id v94 = v20;
            uint64_t v36 = [v17 rawContentOnProfile:v11 error:&v94];
            id v37 = v94;

            id v38 = (void *)v36;
            if (v36)
            {
              v87 = v14;
              id v93 = v37;
              +[HKSignedClinicalDataQRRepresentation representationForRawContent:sourceType:error:](HKSignedClinicalDataQRRepresentation, "representationForRawContent:sourceType:error:", v36, [v90 sourceType], &v93);
              id v16 = v39 = (void *)v36;
              id v13 = v93;

              if (v16)
              {

                os_log_t v15 = v88;
                id v9 = v89;
                id v14 = v87;
                goto LABEL_48;
              }
              id v38 = v39;
              _HKInitializeLogging();
              id v44 = (void *)HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
              {
                v76 = v44;
                v77 = (objc_class *)objc_opt_class();
                v78 = NSStringFromClass(v77);
                v79 = NSStringFromSelector(aSelector);
                v80 = HKSensitiveLogItem();
                *(_DWORD *)buf = 138543874;
                v103 = v78;
                __int16 v104 = 2114;
                v105 = v79;
                __int16 v106 = 2114;
                v107 = v80;
                _os_log_error_impl(&dword_0, v76, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to create QR code representation from JWS data with error: %{public}@", buf, 0x20u);
              }
              id v13 = v13;
              id v14 = v87;
              id v42 = v88;
              if (v13)
              {
                id v41 = v91;
LABEL_66:
                v45 = v90;
                if (v41)
                {
                  id v13 = v13;
                  *id v41 = v13;
                }
                else
                {
                  _HKLogDroppedError();
                }
                goto LABEL_78;
              }
            }
            else
            {
              _HKInitializeLogging();
              id v40 = (void *)HKLogHealthRecords;
              if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
              {
                v70 = v40;
                v71 = (objc_class *)objc_opt_class();
                unsigned int v72 = NSStringFromClass(v71);
                v73 = NSStringFromSelector(aSelector);
                v74 = HKSensitiveLogItem();
                *(_DWORD *)buf = 138543874;
                v103 = v72;
                __int16 v104 = 2114;
                v105 = v73;
                __int16 v106 = 2114;
                v107 = v74;
                _os_log_error_impl(&dword_0, v70, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch raw content with error: %{public}@", buf, 0x20u);

                id v38 = 0;
              }
              id v13 = v37;
              if (v13)
              {
                id v41 = v91;
                id v42 = v88;
                goto LABEL_66;
              }
              id v42 = v88;
            }
            v45 = v90;
LABEL_78:

            id v23 = 0;
            id v9 = v89;
            goto LABEL_83;
          }
          _HKInitializeLogging();
          BOOL v46 = (void *)HKLogHealthRecords;
          id v9 = v89;
          if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
          {
            v81 = v46;
            v82 = (objc_class *)objc_opt_class();
            v83 = NSStringFromClass(v82);
            NSStringFromSelector(aSelector);
            v85 = v84 = v15;
            id v86 = HKSensitiveLogItem();
            *(_DWORD *)buf = 138543874;
            v103 = v83;
            __int16 v104 = 2114;
            v105 = v85;
            __int16 v106 = 2114;
            v107 = v86;
            _os_log_error_impl(&dword_0, v81, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch SCD record backing medical record with error: %{public}@", buf, 0x20u);

            os_log_t v15 = v84;
          }
          id v47 = v35;
          id v13 = v47;
          if (v47)
          {
            if (v91) {
              id *v91 = v47;
            }
            else {
              _HKLogDroppedError();
            }
          }

          goto LABEL_82;
        }
        _HKInitializeLogging();
        id v43 = (void *)HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          goto LABEL_56;
        }
        id v29 = v43;
        v75 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v75);
        v32 = NSStringFromSelector(a2);
        BOOL v33 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v103 = v31;
        __int16 v104 = 2114;
        v105 = v32;
        __int16 v106 = 2114;
        v107 = v33;
        goto LABEL_89;
      }
      id v98 = v13;
      id v17 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityBackingMedicalRecord:v9 profile:v11 error:&v98];
      id v20 = v98;

      if (!v17)
      {
        _HKInitializeLogging();
        uint64_t v28 = (void *)HKLogHealthRecords;
        if (!os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
        {
LABEL_56:
          id v25 = v20;
LABEL_57:
          id v13 = v25;
          if (v25)
          {
            if (a5) {
              *a5 = v25;
            }
            else {
              _HKLogDroppedError();
            }
          }

          id v23 = 0;
          id v17 = v12;
          goto LABEL_83;
        }
        id v29 = v28;
        v30 = (objc_class *)objc_opt_class();
        v31 = NSStringFromClass(v30);
        v32 = NSStringFromSelector(a2);
        BOOL v33 = HKSensitiveLogItem();
        *(_DWORD *)buf = 138543874;
        v103 = v31;
        __int16 v104 = 2114;
        v105 = v32;
        __int16 v106 = 2114;
        v107 = v33;
LABEL_89:
        _os_log_error_impl(&dword_0, v29, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch original record entity backing medical record with error: %{public}@", buf, 0x20u);

        goto LABEL_56;
      }
      v91 = a5;
      aSelector = a2;
      os_log_t v15 = 0;
    }
    id v97 = v20;
    id v14 = [v17 existingDerivedClinicalRecordsOnProfile:v11 error:&v97];
    id v13 = v97;

    if (v14) {
      goto LABEL_31;
    }
    _HKInitializeLogging();
    uint64_t v27 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v64 = v27;
      v65 = (objc_class *)objc_opt_class();
      NSStringFromClass(v65);
      id v67 = v66 = v15;
      int v68 = NSStringFromSelector(aSelector);
      v69 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      v103 = v67;
      __int16 v104 = 2114;
      v105 = v68;
      __int16 v106 = 2114;
      v107 = v69;
      _os_log_error_impl(&dword_0, v64, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch clinical records backed by medical record with error: %{public}@", buf, 0x20u);

      os_log_t v15 = v66;
    }
    id v13 = v13;
    if (v13)
    {
      if (v91) {
        id *v91 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }

LABEL_81:
LABEL_82:
    id v23 = 0;
    goto LABEL_83;
  }
  _HKInitializeLogging();
  id v21 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
  {
    id v49 = v21;
    uint64_t v50 = (objc_class *)objc_opt_class();
    uint64_t v51 = NSStringFromClass(v50);
    uint64_t v52 = NSStringFromSelector(a2);
    long long v53 = HKSensitiveLogItem();
    *(_DWORD *)buf = 138543874;
    v103 = v51;
    __int16 v104 = 2114;
    v105 = v52;
    __int16 v106 = 2114;
    v107 = v53;
    _os_log_error_impl(&dword_0, v49, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to fetch main record backing medical record with error: %{public}@", buf, 0x20u);
  }
  id v22 = v13;
  id v17 = v22;
  if (v22)
  {
    if (a5)
    {
      id v17 = v22;
      id v23 = 0;
      *a5 = v17;
      id v13 = v17;
      goto LABEL_83;
    }
    _HKLogDroppedError();
  }
  id v23 = 0;
  id v13 = v17;
LABEL_83:

  return v23;
}

- (BOOL)deleteSignedClinicalDataRecord:(id)a3 error:(id *)a4
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v9 = [WeakRetained profile];

  id v10 = [v7 originIdentifier];
  id v11 = [v10 signedClinicalDataRecordIdentifier];

  if (v11)
  {
    id v27 = 0;
    id v12 = +[HDOriginalSignedClinicalDataRecordEntity existingEntityWithSyncIdentifier:v11 profile:v9 error:&v27];
    id v13 = v27;
    if (v12)
    {
      id v26 = 0;
      unsigned __int8 v14 = [v12 deleteOriginalAndDerivedRecordsOnProfile:v9 error:&v26];
      id v15 = v26;
      id v16 = v15;
      if ((v14 & 1) == 0)
      {
        id v16 = v15;
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
      goto LABEL_19;
    }
    _HKInitializeLogging();
    id v18 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR))
    {
      id v21 = v18;
      id v22 = (objc_class *)objc_opt_class();
      id v23 = NSStringFromClass(v22);
      id v24 = NSStringFromSelector(a2);
      id v25 = HKSensitiveLogItem();
      *(_DWORD *)buf = 138543874;
      id v29 = v23;
      __int16 v30 = 2114;
      v31 = v24;
      __int16 v32 = 2114;
      BOOL v33 = v25;
      _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@ failed to retrieve original signed clinical data record: %{public}@", buf, 0x20u);
    }
    id v19 = v13;
    id v16 = v19;
    if (v19)
    {
      if (a4)
      {
        id v16 = v19;
        unsigned __int8 v14 = 0;
        *a4 = v16;
LABEL_19:

        goto LABEL_20;
      }
      _HKLogDroppedError();
    }
    unsigned __int8 v14 = 0;
    goto LABEL_19;
  }
  _HKInitializeLogging();
  id v17 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT)) {
    sub_B09A0(v17);
  }
  HKSensitiveLogItem();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  +[NSError hk_assignError:a4, 3, @"cannot delete record %@ because it doesn't have a sync identifier", v13 code format];
  unsigned __int8 v14 = 0;
LABEL_20:

  return v14;
}

- (void)reverifySignatureForRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t, void))a4;
  if ([v6 signatureStatus] == (char *)&dword_0 + 2)
  {
    v7[2](v7, 1, 2, 0);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
    id v9 = [WeakRetained profile];

    id v28 = 0;
    id v10 = +[HDOriginalSignedClinicalDataRecordEntity codableOriginalRecordForHKRecord:v6 profile:v9 error:&v28];
    id v11 = v28;
    _HKInitializeLogging();
    id v12 = (void *)HKLogHealthRecords;
    if (v10)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        unsigned __int8 v14 = (objc_class *)objc_opt_class();
        id v15 = NSStringFromClass(v14);
        XPCServiceClient = self->_XPCServiceClient;
        *(_DWORD *)buf = 138543618;
        __int16 v30 = v15;
        __int16 v31 = 2114;
        __int16 v32 = XPCServiceClient;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: reverifySignatureForRecord calling out to XPC client %{public}@", buf, 0x16u);
      }
      id v17 = [v10 asOriginalSignedClinicalDataRecord];
      id v18 = self->_XPCServiceClient;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_6532C;
      v23[3] = &unk_113C60;
      v23[4] = self;
      id v27 = v7;
      id v24 = v6;
      id v25 = v10;
      id v26 = v9;
      [(HDHealthRecordsIngestionServiceClient *)v18 reverifySignatureForRecord:v17 options:0 completion:v23];
    }
    else
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
      {
        id v19 = v12;
        id v20 = (objc_class *)objc_opt_class();
        id v21 = NSStringFromClass(v20);
        HKSensitiveLogItem();
        id v22 = (HDHealthRecordsIngestionServiceClient *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        __int16 v30 = v21;
        __int16 v31 = 2114;
        __int16 v32 = v22;
        __int16 v33 = 2114;
        id v34 = v11;
        _os_log_fault_impl(&dword_0, v19, OS_LOG_TYPE_FAULT, "%{public}@: reverifySignatureForRecord cannot verify signature for record %{public}@ because the original record couldn't be retrieved: %{public}@", buf, 0x20u);
      }
      ((void (**)(id, uint64_t, uint64_t, id))v7)[2](v7, 0, 1, v11);
    }
  }
}

- (id)_groupRecordsByAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v12 = [WeakRetained profile];

  id v13 = [v12 database];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_65884;
  v21[3] = &unk_113C88;
  id v22 = v6;
  id v23 = v7;
  id v24 = v8;
  id v25 = self;
  id v26 = v9;
  id v14 = v10;
  id v27 = v14;
  id v15 = v9;
  id v16 = v8;
  id v17 = v7;
  id v18 = v6;
  LODWORD(a4) = +[HDOriginalSignedClinicalDataRecordEntity performReadTransactionWithHealthDatabase:v13 error:a4 block:v21];

  if (a4) {
    id v19 = v14;
  }
  else {
    id v19 = 0;
  }

  return v19;
}

- (int64_t)extractionVersion
{
  return kHKSignedClinicalDataExtractionRulesVersion;
}

- (void)extractUnextractedOriginalRecordsWithReason:(id)a3 ignoreExtractionVersion:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(void))a5;
  _HKInitializeLogging();
  id v11 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    id v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    id v25 = v14;
    __int16 v26 = 2114;
    id v27 = v15;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@.%{public}@ starting to extract potentially unextracted SCD records with reason \"%{public}@\"", buf, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v17 = [WeakRetained profile];
  id v23 = 0;
  id v18 = +[HDOriginalSignedClinicalDataRecordEntity unextractedOriginalRecordsOnProfile:v17 extractionVersion:[(HDSignedClinicalDataManager *)self extractionVersion] ignoreExtractionVersion:v6 error:&v23];
  id v19 = v23;

  if (v18)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_65DAC;
    v21[3] = &unk_113CB0;
    id v22 = v10;
    [(HDSignedClinicalDataManager *)self reextractOriginalSignedClinicalDataRecords:v18 completion:v21];
  }
  else
  {
    unsigned __int8 v20 = objc_msgSend(v19, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    if (v20)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B0D1C();
      }
    }
    else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
    {
      sub_B0D8C();
    }
    v10[2](v10);
  }
}

- (void)reextractSignedClinicalDataRecordsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  _HKInitializeLogging();
  id v9 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    __int16 v28 = v12;
    __int16 v29 = 2114;
    __int16 v30 = v13;
    __int16 v31 = 2114;
    id v32 = v7;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@.%{public}@ starting to re-extract SCD records for account %{public}@", buf, 0x20u);
  }
  id v14 = objc_alloc_init((Class)NSMutableArray);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v16 = [WeakRetained profile];
  id v26 = 0;
  id v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_66040;
  id v24 = &unk_113CD8;
  id v17 = v14;
  id v25 = v17;
  unsigned __int8 v18 = +[HDOriginalSignedClinicalDataRecordEntity enumerateActiveCodableRecordsForAccountIdentifier:v7 profile:v16 error:&v26 block:&v21];
  id v19 = v26;

  if (v18)
  {
    -[HDSignedClinicalDataManager reextractOriginalSignedClinicalDataRecords:completion:](self, "reextractOriginalSignedClinicalDataRecords:completion:", v17, v8, v21, v22, v23, v24);
  }
  else
  {
    unsigned __int8 v20 = objc_msgSend(v19, "hk_isDatabaseAccessibilityError", v21, v22, v23, v24);
    _HKInitializeLogging();
    if (v20)
    {
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
        sub_B0DF4();
      }
    }
    else if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_FAULT))
    {
      sub_B0E64();
    }
    v8[2](v8, 0, v19);
  }
}

- (void)triggerDownloadIssuerRegistryWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543362;
    id v16 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@.triggerDownloadIssuerRegistryWithOptions starting", buf, 0xCu);
  }
  XPCServiceClient = self->_XPCServiceClient;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_661A4;
  v13[3] = &unk_113D00;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(HDHealthRecordsIngestionServiceClient *)XPCServiceClient triggerDownloadIssuerRegistryWithOptions:a3 completion:v13];
}

- (void)triggerDownloadPublicKeysWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  _HKInitializeLogging();
  id v7 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543362;
    id v16 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}@.triggerDownloadPublicKeysWithOptions starting", buf, 0xCu);
  }
  XPCServiceClient = self->_XPCServiceClient;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_66464;
  v13[3] = &unk_113D00;
  v13[4] = self;
  id v14 = v6;
  id v12 = v6;
  [(HDHealthRecordsIngestionServiceClient *)XPCServiceClient triggerDownloadPublicKeysWithOptions:a3 completion:v13];
}

- (void)updateIssuerTitlesUsingRegistry:(id)a3
{
  p_profileExtension = &self->_profileExtension;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_profileExtension);
  id v7 = [WeakRetained profile];

  id v10 = 0;
  LOBYTE(WeakRetained) = +[HDSignedClinicalDataIssuerEntity updateIssuerTitlesUsingRegistry:v5 profile:v7 error:&v10];

  id v8 = v10;
  if ((WeakRetained & 1) == 0)
  {
    _HKInitializeLogging();
    id v9 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_B1014(v9, self);
    }
  }
}

- (void)_serialQueue_didReceiveOriginalSyncEntities
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v4 = [WeakRetained profile];
  id v5 = [v4 daemon];
  id v6 = [v5 contentProtectionManager];
  unsigned int v7 = [v6 isProtectedDataAvailable];

  if (v7)
  {
    [(HDSignedClinicalDataManager *)self _scheduleExtractionWithReason:@"SCD sync entities inserted"];
  }
  else
  {
    self->_scheduleExtractionOnProtectedDataBecomingAvailable = 1;
  }
}

- (void)_serialQueue_performProtectedDataAvailableChecks
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B10C0(v3);
  }
  if (self->_scheduleExtractionOnProtectedDataBecomingAvailable)
  {
    self->_scheduleExtractionOnProtectedDataBecomingAvailable = 0;
    CFStringRef v4 = @"protected data available after extraction was requested";
LABEL_5:
    self->_didScheduleFirstExtractionAfterProfileReady = 1;
    [(HDSignedClinicalDataManager *)self _scheduleExtractionWithReason:v4];
    return;
  }
  if (!self->_didScheduleFirstExtractionAfterProfileReady)
  {
    CFStringRef v4 = @"protected data available after profile ready";
    goto LABEL_5;
  }
}

- (void)_scheduleExtractionWithReason:(id)a3
{
}

- (void)_scheduleExtractionWithReason:(id)a3 ignoreExtractionVersion:(BOOL)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_66930;
  v13[3] = &unk_113D28;
  v13[4] = self;
  id v6 = a3;
  id v14 = v6;
  BOOL v15 = a4;
  unsigned int v7 = +[HDMaintenanceOperation maintenanceOperationWithName:v6 asynchronousBlock:v13];
  _HKInitializeLogging();
  id v8 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEBUG)) {
    sub_B1150(v8, (uint64_t)self, (uint64_t)v6);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);
  id v10 = [WeakRetained profile];
  id v11 = [v10 daemon];
  id v12 = [v11 maintenanceWorkCoordinator];
  [v12 enqueueMaintenanceOperation:v7];
}

- (void)profileDidBecomeReady:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  CFStringRef v4 = [v10 database];
  [v4 addProtectedDataObserver:self queue:self->_serialQueue];

  id v5 = [v10 database];
  unsigned int v6 = [v5 isProtectedDataAvailable];

  if (v6) {
    [(HDSignedClinicalDataManager *)self _serialQueue_performProtectedDataAvailableChecks];
  }
  unsigned int v7 = [v10 daemon];
  id v8 = [v7 ontologyUpdateCoordinator];
  id v9 = [v8 importer];
  [v9 addOntologyShardImporterObserver:self queue:self->_serialQueue];
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (v4)
  {
    [(HDSignedClinicalDataManager *)self _serialQueue_performProtectedDataAvailableChecks];
  }
}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  unsigned int v6 = [v5 isEqualToString:HKOntologyShardIdentifierUniversal];

  if (v6)
  {
    [(HDSignedClinicalDataManager *)self _scheduleExtractionWithReason:@"universal ontology shard updated" ignoreExtractionVersion:1];
  }
}

- (OS_dispatch_queue)privateQueue
{
  return self->_serialQueue;
}

- (HDHealthRecordsProfileExtension)profileExtension
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profileExtension);

  return (HDHealthRecordsProfileExtension *)WeakRetained;
}

- (HDHealthRecordsIngestionServiceClient)XPCServiceClient
{
  return self->_XPCServiceClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCServiceClient, 0);
  objc_destroyWeak((id *)&self->_profileExtension);
  objc_storeStrong((id *)&self->_originalSyncIdentifiersBeingStored, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end