@interface CloudKitUploadController
+ (void)unregisterCloudKitUploadActivities;
- (BOOL)logUploadRequiresConsent:(id)a3;
- (BOOL)shouldDeferFromCloudKitError:(id)a3;
- (BOOL)validateCaseAttachmentsForDiagnosticCaseStorage:(id)a3 record:(id)a4;
- (CloudKitUploadController)initWithWorkspace:(id)a3;
- (OS_dispatch_queue)queue;
- (id)_fetchCasesInternal:(id)a3 limit:(unint64_t)a4;
- (id)_fetchRecentPendingCaseSummariesInternal:(id)a3 limit:(unint64_t)a4;
- (id)currentCloudKitContainerForEnvironment:(int64_t)a3;
- (id)fetchCaseSummariesWithIdentifiers:(id)a3;
- (id)fetchCasesWithIdentifiers:(id)a3 limit:(unint64_t)a4;
- (id)fetchRecentCasesPendingUpload:(unint64_t)a3;
- (id)fetchRecentPendingCaseSummaries:(unint64_t)a3;
- (id)locallyFilterCases:(id)a3;
- (id)processCloudkitDecisionServiceResponse:(id)a3;
- (id)randomlySelectCasesFrom:(id)a3 maximum:(unint64_t)a4;
- (id)uploadOperationWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 allowCellular:(BOOL)a5 activity:(id)a6;
- (void)_save;
- (void)ckcodeDecisionService:(id)a3 response:(id)a4;
- (void)configureCaseSummaryDiscretionaryActivityCriteria:(id)a3;
- (void)configureLogUploadDiscretionaryActivityCriteria:(id)a3;
- (void)configureWorkspace:(id)a3;
- (void)deferXPCActivity:(id)a3;
- (void)filterCasesPendingUpload:(id)a3 activity:(id)a4 reply:(id)a5;
- (void)filterCasesViaCloudkitDecisionService:(id)a3 activity:(id)a4 response:(id)a5;
- (void)finishXPCActivity:(id)a3;
- (void)operationCompletedWithID:(id)a3 savedRecords:(id)a4 deletedRecords:(id)a5 error:(id)a6 activity:(id)a7;
- (void)performSubmissionOfCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4;
- (void)performSubmissionOfRecentCaseSummaries:(unint64_t)a3 reply:(id)a4;
- (void)performUploadDecisionForCaseIdentifiers:(id)a3 reply:(id)a4;
- (void)performUploadForCaseIdentifiers:(id)a3;
- (void)performUploadForRecentCases:(unint64_t)a3;
- (void)recordOperationCompleteForOperationID:(id)a3 completionTime:(id)a4 success:(BOOL)a5;
- (void)registerCaseSummaryActivities;
- (void)registerCloudKitUploadActivities;
- (void)registerLogUploadActivities;
- (void)save;
- (void)startPeriodicSummaryTask:(id)a3;
- (void)startPeriodicUploadTask:(id)a3;
- (void)submitCaseSummaries:(id)a3 activity:(id)a4;
- (void)submitCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4;
- (void)submitRecentCaseSummaries:(unint64_t)a3 reply:(id)a4;
- (void)uploadCasesWithIdentifiers:(id)a3;
- (void)uploadDecisionWithIdentifiers:(id)a3 reply:(id)a4;
- (void)uploadDiagnosticCases:(id)a3 activity:(id)a4;
- (void)uploadMostRecentCases:(unint64_t)a3;
- (void)uploadToCloudKitContainer:(id)a3 withRecords:(id)a4 activity:(id)a5;
@end

@implementation CloudKitUploadController

- (CloudKitUploadController)initWithWorkspace:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CloudKitUploadController;
  v5 = [(CloudKitUploadController *)&v14 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.autobugcapture.CKUpload", v6);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = v5->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __46__CloudKitUploadController_initWithWorkspace___block_invoke;
    v11[3] = &unk_263FC3430;
    v12 = v5;
    id v13 = v4;
    dispatch_sync(v9, v11);
  }
  return v5;
}

uint64_t __46__CloudKitUploadController_initWithWorkspace___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureWorkspace:*(void *)(a1 + 40)];
}

- (void)configureWorkspace:(id)a3
{
  id v4 = a3;
  v5 = uploadLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "Configuring CoreData workspace", v14, 2u);
  }

  v6 = (AnalyticsWorkspace *)[v4 copy];
  workspace = self->_workspace;
  self->_workspace = v6;

  v8 = [[DiagnosticCaseStorageAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
  caseStorageAnalytics = self->_caseStorageAnalytics;
  self->_caseStorageAnalytics = v8;

  v10 = [[DiagnosticCaseSummaryAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
  caseSummaryAnalytics = self->_caseSummaryAnalytics;
  self->_caseSummaryAnalytics = v10;

  v12 = [[UploadRecordAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
  uploadRecordAnalytics = self->_uploadRecordAnalytics;
  self->_uploadRecordAnalytics = v12;
}

- (id)_fetchCasesInternal:(id)a3 limit:(unint64_t)a4
{
  v5 = (void *)MEMORY[0x263F08A98];
  id v6 = a3;
  dispatch_queue_t v7 = objc_msgSend(v5, "predicateWithFormat:", @"uploadState == %d", 0);
  v8 = (void *)MEMORY[0x263F08A98];
  v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-604800.0];
  v10 = [v8 predicateWithFormat:@"timeStamp >= %@", v9];

  v11 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"caseDampeningType == %d", 0);
  v12 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"caseClosureType == %d OR caseClosureType == %d OR caseClosureType == %d", 1, 5, 2);
  id v13 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseAttachments != nil"];
  objc_super v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"attachmentsIncomplete != %@", MEMORY[0x263EFFA88]];
  v15 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v10, v11, v12, v13, v14, v6, 0);

  v16 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v15];
  caseStorageAnalytics = self->_caseStorageAnalytics;
  v18 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"timeStamp" ascending:0];
  v19 = [(ObjectAnalytics *)caseStorageAnalytics fetchEntitiesFreeForm:v16 sortDesc:v18 limit:a4];

  return v19;
}

- (id)fetchRecentCasesPendingUpload:(unint64_t)a3
{
  return [(CloudKitUploadController *)self _fetchCasesInternal:0 limit:a3];
}

- (id)fetchCasesWithIdentifiers:(id)a3 limit:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v13 length])
        {
          objc_super v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", v13];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v15 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v7];
  }
  else
  {
    v15 = 0;
  }
  v16 = [(CloudKitUploadController *)self _fetchCasesInternal:v15 limit:a4];

  return v16;
}

- (void)_save
{
  v3 = uploadLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Saving...", v4, 2u);
  }

  [(AnalyticsWorkspace *)self->_workspace save];
}

- (void)save
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__6;
  long long v19 = __Block_byref_object_dispose__6;
  id v20 = 0;
  v3 = uploadLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Scheduling delayed save", buf, 2u);
  }

  id v4 = v16[5];
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = (void *)v16[5];
    v16[5] = 0;
  }
  dispatch_source_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  id v7 = (void *)v16[5];
  v16[5] = (uint64_t)v6;

  id v8 = v16[5];
  dispatch_time_t v9 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
  uint64_t v10 = v16[5];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __32__CloudKitUploadController_save__block_invoke;
  handler[3] = &unk_263FC3808;
  handler[4] = self;
  handler[5] = &v15;
  dispatch_source_set_event_handler(v10, handler);
  uint64_t v11 = v16[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __32__CloudKitUploadController_save__block_invoke_2;
  v12[3] = &unk_263FC51F0;
  v12[4] = &v15;
  dispatch_source_set_cancel_handler(v11, v12);
  dispatch_activate((dispatch_object_t)v16[5]);
  _Block_object_dispose(&v15, 8);
}

uint64_t __32__CloudKitUploadController_save__block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  v2 = *(void **)(a1 + 32);

  return [v2 _save];
}

void __32__CloudKitUploadController_save__block_invoke_2(uint64_t a1)
{
  v2 = uploadLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Cancelling delay timer", v5, 2u);
  }

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

- (id)locallyFilterCases:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    id v27 = [MEMORY[0x263EFF980] array];
    v5 = uploadLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "Locally filtering cases ineligible for uploading...", buf, 2u);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id obj = v6;
      id v26 = v4;
      char v9 = 0;
      uint64_t v10 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v13 = [v12 uploadRecord];
          if (!v13)
          {
            objc_super v14 = uploadLogHandle();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v15 = [v12 caseID];
              *(_DWORD *)buf = 138412290;
              v34 = v15;
              _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Creating new upload record for case %@", buf, 0xCu);
            }
            id v13 = [(ObjectAnalytics *)self->_uploadRecordAnalytics createEntity];
            [v13 setCaseStorage:v12];
            char v9 = 1;
          }
          BOOL v16 = (int)[v13 uploadState] >= 1 && objc_msgSend(v13, "uploadState") != 4;
          uint64_t v17 = [v13 operationID];

          if (v16 || v17)
          {
            long long v18 = uploadLogHandle();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              long long v19 = [v12 caseID];
              if (v16) {
                id v20 = "Yes";
              }
              else {
                id v20 = "No";
              }
              int v21 = [v13 uploadState];
              *(_DWORD *)buf = 138544130;
              v22 = "No";
              if (v17) {
                v22 = "Yes";
              }
              v34 = v19;
              __int16 v35 = 2080;
              v36 = v20;
              __int16 v37 = 1024;
              int v38 = v21;
              __int16 v39 = 2080;
              v40 = v22;
              _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "Skipping case %{public}@ as it's already uploading, or has been uploaded. (alreadyScheduled: %s(%d), hasOperation: %s)", buf, 0x26u);
            }
          }
          else if ([(CloudKitUploadController *)self validateCaseAttachmentsForDiagnosticCaseStorage:v12 record:v13])
          {
            [v27 addObject:v12];
          }
          else
          {
            [v12 setUploadState:3];
            [v13 setUploadState:1];
            uint64_t v23 = uploadLogHandle();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v24 = [v12 caseID];
              *(_DWORD *)buf = 138543362;
              v34 = v24;
              _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEFAULT, "Case %{public}@ is missing required files. Marked as ineligible for upload.)", buf, 0xCu);
            }
            char v9 = 1;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v8);

      if (v9) {
        [(CloudKitUploadController *)self save];
      }
      id v4 = v26;
    }
    else
    {
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void)filterCasesPendingUpload:(id)a3 activity:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  if ([v8 count])
  {
    uint64_t v11 = [(CloudKitUploadController *)self locallyFilterCases:v8];
    if ([v11 count])
    {
      if (v9 && xpc_activity_should_defer((xpc_activity_t)v9))
      {
        v12 = uploadLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "Stopping before decision server check due to activity deferral", buf, 2u);
        }

        [(CloudKitUploadController *)self deferXPCActivity:v9];
        v10[2](v10, 0);
      }
      else
      {
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke;
        v15[3] = &unk_263FC5218;
        id v16 = v9;
        uint64_t v17 = self;
        long long v19 = v10;
        id v18 = v11;
        [(CloudKitUploadController *)self filterCasesViaCloudkitDecisionService:v18 activity:v16 response:v15];
      }
    }
    else
    {
      objc_super v14 = uploadLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Skipping decision service check since the pruned cases list is empty", buf, 2u);
      }

      ((void (**)(id, void *))v10)[2](v10, v11);
    }
  }
  else
  {
    id v13 = uploadLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Skipping decision service check since we received an empty case list", buf, 2u);
    }

    ((void (**)(id, id))v10)[2](v10, v8);
  }
}

void __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(_xpc_activity_s **)(a1 + 32);
  if (v7 && xpc_activity_should_defer(v7))
  {
    id v8 = uploadLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Stopping log uploads due to activity deferral", (uint8_t *)&buf, 2u);
    }

    [*(id *)(a1 + 40) deferXPCActivity:*(void *)(a1 + 32)];
    id v9 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_87;
    block[3] = &unk_263FC2E88;
    id v10 = *(id *)(a1 + 56);
    id v42 = 0;
    id v43 = v10;
    dispatch_async(v9, block);

    id v11 = v43;
    goto LABEL_30;
  }
  if (v6)
  {
    v12 = [v6 domain];
    if ([v12 isEqualToString:*MEMORY[0x263F08438]])
    {
      uint64_t v13 = [v6 code];

      if (v13 == 89)
      {
        objc_super v14 = uploadLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEFAULT, "CloudKit cancelled the decision service operation. Ending upload task.", (uint8_t *)&buf, 2u);
        }
        uint64_t v15 = 0;
LABEL_22:

        id v26 = *(NSObject **)(*(void *)(a1 + 40) + 8);
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_89;
        v38[3] = &unk_263FC2E88;
        id v27 = *(id *)(a1 + 56);
        id v39 = v15;
        id v40 = v27;
        id v11 = v15;
        dispatch_async(v26, v38);

        goto LABEL_30;
      }
    }
    else
    {
    }
    id v20 = uploadLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_ERROR, "Decision service responded with an error: %@", (uint8_t *)&buf, 0xCu);
    }

    int v21 = *(void **)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = +[ABCAdministrator sharedInstance];
    v24 = [v23 configurationManager];
    uint64_t v15 = objc_msgSend(v21, "randomlySelectCasesFrom:maximum:", v22, objc_msgSend(v24, "cloudKitFallbackMaximumLogCount"));

    objc_super v14 = uploadLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [v15 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEFAULT, "Proceeding to upload %ld cases with only local filtering", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_22;
  }
  id v16 = [v5 objectForKeyedSubscript:@"summary"];
  uint64_t v17 = v16;
  if (v16)
  {
    if ([v16 BOOLValue])
    {
      id v18 = *(id *)(a1 + 48);
      long long v19 = uploadLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEFAULT, "Decision service permitted upload for ALL cases.", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      long long v31 = uploadLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_DEFAULT, "Decision service declined upload for ALL cases.", (uint8_t *)&buf, 2u);
      }

      id v18 = 0;
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__6;
    v49 = __Block_byref_object_dispose__6;
    id v50 = objc_alloc_init(MEMORY[0x263EFF980]);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_2;
    v37[3] = &unk_263FC3CC0;
    v37[4] = &buf;
    [v5 enumerateKeysAndObjectsUsingBlock:v37];
    v28 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:*(void *)(*((void *)&buf + 1) + 40)];
    id v18 = [*(id *)(a1 + 48) filteredArrayUsingPredicate:v28];
    long long v29 = uploadLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = [v18 count];
      *(_DWORD *)v44 = 134217984;
      uint64_t v45 = v30;
      _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_DEFAULT, "Decision service permitted upload for %ld cases.", v44, 0xCu);
    }

    _Block_object_dispose(&buf, 8);
  }
  long long v32 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_96;
  v34[3] = &unk_263FC2E88;
  id v33 = *(id *)(a1 + 56);
  id v35 = v18;
  id v36 = v33;
  id v11 = v18;
  dispatch_async(v32, v34);

LABEL_30:
}

uint64_t __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_87(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 isEqualToString:@"summary"] & 1) == 0)
    {
      if ([v6 BOOLValue])
      {
        uint64_t v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", v5];
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v7];
        id v8 = uploadLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          id v10 = v5;
          _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEBUG, " Adding predicate for caseID == %@", buf, 0xCu);
        }
      }
      else
      {
        uint64_t v7 = uploadLogHandle();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          id v10 = v5;
          _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, " Skipping caseID %@ (server denied)", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __68__CloudKitUploadController_filterCasesPendingUpload_activity_reply___block_invoke_96(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)logUploadRequiresConsent:(id)a3
{
  id v3 = a3;
  id v4 = +[ABCAdministrator sharedInstance];
  id v5 = [v4 configurationManager];
  char v6 = [v5 autoBugCaptureUploadPreapproved];

  if (v6) {
    char v7 = 0;
  }
  else {
    char v7 = [v3 hasSuffix:@".pcapng"];
  }

  return v7;
}

- (id)randomlySelectCasesFrom:(id)a3 maximum:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = v5;
  if (a4)
  {
    if ([v5 count] >= a4)
    {
      id v7 = [MEMORY[0x263EFF980] array];
      uint32_t v8 = [v6 count];
      id v9 = uploadLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        unint64_t v20 = a4;
        __int16 v21 = 1024;
        uint32_t v22 = v8;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Randomly choosing %ld out of %d cases for upload", buf, 0x12u);
      }

      if ([v7 count] < a4)
      {
        uint64_t v10 = 3 * v8 + 2;
        while (1)
        {
          uint64_t v11 = [v6 objectAtIndex:arc4random_uniform(v8)];
          int v12 = [v7 containsObject:v11];
          uint64_t v13 = uploadLogHandle();
          BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
          if (v12)
          {
            if (v14)
            {
              uint64_t v15 = [v11 caseID];
              *(_DWORD *)long long buf = 138412290;
              unint64_t v20 = (unint64_t)v15;
              _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "Already chose case %@, skipping...", buf, 0xCu);
            }
          }
          else
          {
            if (v14)
            {
              id v16 = [v11 caseID];
              *(_DWORD *)long long buf = 138412290;
              unint64_t v20 = (unint64_t)v16;
              _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "Selecting case %@ for upload", buf, 0xCu);
            }
            [v7 addObject:v11];
          }
          if (!--v10) {
            break;
          }

          if ([v7 count] >= a4) {
            goto LABEL_22;
          }
        }
        uint64_t v17 = uploadLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134217984;
          unint64_t v20 = 3 * v8;
          _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_ERROR, "Randomization retry count exceeded reasonable threshold (%ld). Bailing out!", buf, 0xCu);
        }
      }
    }
    else
    {
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }
LABEL_22:

  return v7;
}

- (BOOL)validateCaseAttachmentsForDiagnosticCaseStorage:(id)a3 record:(id)a4
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint32_t v8 = uploadLogHandle();
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v6 caseID];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v62 = (uint64_t)v10;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "Preflighting attachments for case %@", buf, 0xCu);
    }
    context = (void *)MEMORY[0x21050CEB0]();
    uint64_t v11 = [v6 caseAttachments];
    int v12 = +[DiagnosticCase attachmentsFromStringRepresentation:v11];

    v53 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v13 = [v7 fileURLs];

    id v49 = v6;
    if (v13)
    {
      id v14 = [v7 fileURLs];
      [v14 removeAllObjects];
    }
    else
    {
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v7 setFileURLs:v14];
    }

    [v7 setTotalBytes:0];
    id v50 = v7;
    [v7 setNumberOfFiles:0];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v60 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v57;
      uint64_t v51 = *MEMORY[0x263EFF688];
      unint64_t v20 = 0x263EFF000uLL;
      id v52 = v16;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint32_t v22 = [*(id *)(v20 + 2608) URLWithString:*(void *)(*((void *)&v56 + 1) + 8 * v21)];
          uint64_t v23 = [v22 lastPathComponent];
          if (![(CloudKitUploadController *)self logUploadRequiresConsent:v23])
          {
            uint64_t v25 = self;
            id v26 = [v22 path];
            int v27 = [v53 fileExistsAtPath:v26];

            v28 = uploadLogHandle();
            v24 = v28;
            if (v27)
            {
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                long long v29 = [v22 absoluteString];
                *(_DWORD *)long long buf = 138412290;
                uint64_t v62 = (uint64_t)v29;
                _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_INFO, "  Attachment file exists: %@", buf, 0xCu);
              }
              id v54 = 0;
              id v55 = 0;
              int v30 = [v22 getResourceValue:&v55 forKey:v51 error:&v54];
              v24 = v55;
              id v31 = v54;
              long long v32 = uploadLogHandle();
              id v33 = v32;
              if (v30)
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  uint64_t v34 = [v24 integerValue];
                  *(_DWORD *)long long buf = 134217984;
                  uint64_t v62 = v34;
                  _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_INFO, "  File size is: %ld", buf, 0xCu);
                }

                if ([v24 integerValue])
                {
                  objc_msgSend(v50, "setTotalBytes:", objc_msgSend(v50, "totalBytes") + -[NSObject unsignedIntegerValue](v24, "unsignedIntegerValue"));
                  objc_msgSend(v50, "setNumberOfFiles:", (__int16)(objc_msgSend(v50, "numberOfFiles") + 1));
                  id v35 = v50;
                  goto LABEL_31;
                }
                __int16 v37 = uploadLogHandle();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl(&dword_209DBA000, v37, OS_LOG_TYPE_INFO, "  Ignoring attachment with zero file size.", buf, 2u);
                }
              }
              else
              {
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v62 = (uint64_t)v31;
                  _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEFAULT, "  Error getting file size: %@", buf, 0xCu);
                }

                objc_msgSend(v50, "setNumberOfFiles:", (__int16)(objc_msgSend(v50, "numberOfFiles") + 1));
                id v35 = v50;
LABEL_31:
                __int16 v37 = [v35 fileURLs];
                [v37 addObject:v22];
              }

              id v16 = v52;
            }
            else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              id v36 = [v22 absoluteString];
              *(_DWORD *)long long buf = 138412290;
              uint64_t v62 = (uint64_t)v36;
              _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_ERROR, "Attachment file at path %@ does not exist.", buf, 0xCu);
            }
            self = v25;
            unint64_t v20 = 0x263EFF000;
            goto LABEL_34;
          }
          v24 = uploadLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_DEFAULT, "Privacy sensitive log content cannot be uploaded.", buf, 2u);
          }
LABEL_34:

          ++v21;
        }
        while (v18 != v21);
        uint64_t v38 = [v16 countByEnumeratingWithState:&v56 objects:v60 count:16];
        uint64_t v18 = v38;
      }
      while (v38);
    }

    id v7 = v50;
    id v39 = [v50 fileURLs];
    uint64_t v40 = [v39 count];
    uint64_t v41 = [v16 count];

    BOOL v15 = v40 == v41;
    if (v40 == v41)
    {
      [v50 setPreflightResult:1];
      id v42 = uploadLogHandle();
      id v43 = v53;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v42, OS_LOG_TYPE_INFO, "Preflight successful: all files for this case are available", buf, 2u);
      }
      id v6 = v49;
      goto LABEL_50;
    }
    v44 = [v50 fileURLs];
    uint64_t v45 = [v44 count];

    id v43 = v53;
    if (v45)
    {
      [v50 setPreflightResult:2];
      id v42 = uploadLogHandle();
      id v6 = v49;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        v46 = "Preflight failed: some files for this case are unavailable";
LABEL_49:
        _os_log_impl(&dword_209DBA000, v42, OS_LOG_TYPE_ERROR, v46, buf, 2u);
      }
    }
    else
    {
      [v50 setPreflightResult:3];
      id v42 = uploadLogHandle();
      id v6 = v49;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        v46 = "Preflight failed: all files for this case are unavailable";
        goto LABEL_49;
      }
    }
LABEL_50:

    goto LABEL_51;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Cannot validate attachments for a nil caseStorage!", buf, 2u);
  }

  BOOL v15 = 0;
LABEL_51:

  return v15;
}

- (void)recordOperationCompleteForOperationID:(id)a3 completionTime:(id)a4 success:(BOOL)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"operationID == %@", v8];
    uploadRecordAnalytics = self->_uploadRecordAnalytics;
    int v12 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"startTime" ascending:1];
    uint64_t v13 = [(ObjectAnalytics *)uploadRecordAnalytics fetchEntitiesFreeForm:v10 sortDesc:v12 limit:0];

    id v14 = uploadLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218242;
      *(void *)&uint8_t buf[4] = [v13 count];
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v8;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Found %ld records with matching operationID %@", buf, 0x16u);
    }

    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v21 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __89__CloudKitUploadController_recordOperationCompleteForOperationID_completionTime_success___block_invoke;
    v15[3] = &unk_263FC5240;
    BOOL v19 = a5;
    id v16 = v9;
    uint64_t v18 = buf;
    id v17 = v8;
    [v13 enumerateObjectsUsingBlock:v15];
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      [(CloudKitUploadController *)self save];
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    uint64_t v10 = uploadLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Not expecting a nil operation ID!", buf, 2u);
    }
  }
}

void __89__CloudKitUploadController_recordOperationCompleteForOperationID_completionTime_success___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 setOperationID:0];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 4;
    }
    [v4 setUploadState:v5];
    if (*(unsigned char *)(a1 + 56))
    {
      id v6 = [v4 caseStorage];
      [v6 setUploadState:4];
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      id v8 = v4;
    }
    else
    {
      -[NSObject setStartTime:](v4, "setStartTime:");
      id v8 = v4;
      uint64_t v7 = 0;
    }
    [v8 setFinishTime:v7];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    int v12 = uploadLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "Recording completion for upload record %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    id v4 = uploadLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = *(void *)(a1 + 40);
      int v13 = 138412546;
      id v14 = v10;
      __int16 v15 = 2112;
      uint64_t v16 = v11;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_ERROR, "Unexpected class %@ for object with operationID %@ (expecting UploadRecord)", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (id)currentCloudKitContainerForEnvironment:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = +[ABCAdministrator sharedInstance];
  uint64_t v5 = [v4 configurationManager];
  id v6 = [v5 cloudKitContainerIdentifier];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:v6 environment:a3];
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v7];
  id v9 = uploadLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = "Production";
    if (a3 == 2) {
      uint64_t v10 = "Sandbox";
    }
    int v12 = 138412546;
    int v13 = v6;
    __int16 v14 = 2080;
    __int16 v15 = v10;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Returning CKContainer with identifier \"%@\" in the %s environment", (uint8_t *)&v12, 0x16u);
  }

  return v8;
}

- (id)uploadOperationWithRecordsToSave:(id)a3 recordIDsToDelete:(id)a4 allowCellular:(BOOL)a5 activity:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  uint64_t v10 = (objc_class *)MEMORY[0x263EFD748];
  id v11 = a4;
  id v12 = a3;
  int v13 = (void *)[[v10 alloc] initWithRecordsToSave:v12 recordIDsToDelete:v11];

  __int16 v14 = +[ABCAdministrator sharedInstance];
  __int16 v15 = [v14 configurationManager];
  uint64_t v16 = [v15 cloudKitPrefersAnonymous];
  uint64_t v17 = [v13 configuration];
  [v17 setPreferAnonymousRequests:v16];

  uint64_t v18 = [v13 configuration];
  [v18 setAllowsCellularAccess:v6];

  BOOL v19 = [v13 configuration];
  [v19 setAutomaticallyRetryNetworkFailures:1];

  unint64_t v20 = [v13 configuration];
  [v20 setDiscretionaryNetworkBehavior:0];

  char v21 = +[ABCAdministrator sharedInstance];
  uint64_t v22 = [v21 configurationManager];
  [v22 cloudKitTimeoutIntervalForResource];
  double v24 = v23;
  uint64_t v25 = [v13 configuration];
  [v25 setTimeoutIntervalForResource:v24];

  id v26 = +[ABCAdministrator sharedInstance];
  int v27 = [v26 configurationManager];
  [v27 cloudKitTimeoutIntervalForRequest];
  double v29 = v28;
  int v30 = [v13 configuration];
  [v30 setTimeoutIntervalForRequest:v29];

  if (v9)
  {
    id v31 = [v13 configuration];
    [v31 setXpcActivity:v9];
  }

  return v13;
}

- (void)uploadToCloudKitContainer:(id)a3 withRecords:(id)a4 activity:(id)a5
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v94 = a3;
  id v7 = a4;
  id v8 = (_xpc_activity_s *)a5;
  id v9 = uploadLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "Resetting outstanding operation count to zero", buf, 2u);
  }

  self->_outstandingOperationCount = 0;
  self->_aggregateOperationResult = 1;
  uint64_t v10 = uploadLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v7 count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v119 = v11;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Ready to upload %ld cases", buf, 0xCu);
  }

  long long v115 = 0u;
  long long v116 = 0u;
  long long v114 = 0u;
  long long v113 = 0u;
  id obj = v7;
  uint64_t v93 = [obj countByEnumeratingWithState:&v113 objects:v136 count:16];
  if (v93)
  {
    unint64_t v13 = 0x263EFF000uLL;
    uint64_t v92 = *(void *)v114;
    *(void *)&long long v12 = 134217984;
    long long v87 = v12;
    v91 = v8;
    while (2)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v114 != v92) {
          objc_enumerationMutation(obj);
        }
        v105 = *(void **)(*((void *)&v113 + 1) + 8 * v14);
        if (v8 && xpc_activity_should_defer(v8))
        {
          v86 = uploadLogHandle();
          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_209DBA000, v86, OS_LOG_TYPE_DEFAULT, "Stopping log uploads due to activity defer", buf, 2u);
          }

          [(CloudKitUploadController *)self deferXPCActivity:v8];
          goto LABEL_57;
        }
        uint64_t v100 = v14;
        id v102 = objc_alloc_init(*(Class *)(v13 + 2432));
        __int16 v15 = +[SystemProperties sharedInstance];
        unsigned int v98 = [v15 npiDevice];

        uint64_t v16 = (void *)[objc_alloc(MEMORY[0x263EFD7C8]) initWithRecordType:@"ABCCase"];
        v101 = +[SystemProperties sharedInstance];
        id v17 = objc_alloc_init(*(Class *)(v13 + 2432));
        uint64_t v18 = [v105 caseStorage];
        BOOL v19 = [v18 caseID];
        [v16 setObject:v19 forKeyedSubscript:@"caseID"];

        unint64_t v20 = [v105 caseStorage];
        char v21 = [v20 caseGroupID];
        [v16 setObject:v21 forKeyedSubscript:@"caseGroupID"];

        uint64_t v22 = [v105 caseStorage];
        double v23 = [v22 timeStamp];
        [v16 setObject:v23 forKeyedSubscript:@"caseDetectionTime"];

        double v24 = [v105 caseStorage];
        uint64_t v25 = [v24 caseDomain];
        [v16 setObject:v25 forKeyedSubscript:@"caseDomain"];

        id v26 = [v16 objectForKeyedSubscript:@"caseDomain"];

        v103 = v17;
        if (v26)
        {
          int v27 = [v16 objectForKeyedSubscript:@"caseDomain"];
          [v17 addObject:v27];
        }
        else
        {
          [v17 addObject:&stru_26BDE2C70];
        }
        double v28 = objc_msgSend(v105, "caseStorage", v87);
        double v29 = [v28 caseType];
        [v16 setObject:v29 forKeyedSubscript:@"caseType"];

        int v30 = [v16 objectForKeyedSubscript:@"caseType"];

        if (v30)
        {
          id v31 = [v16 objectForKeyedSubscript:@"caseType"];
          [v17 addObject:v31];
        }
        else
        {
          [v17 addObject:&stru_26BDE2C70];
        }
        long long v32 = [v105 caseStorage];
        id v33 = [v32 caseSubtype];
        [v16 setObject:v33 forKeyedSubscript:@"caseSubtype"];

        uint64_t v34 = [v16 objectForKeyedSubscript:@"caseSubtype"];

        if (v34)
        {
          id v35 = [v16 objectForKeyedSubscript:@"caseSubtype"];
          id v36 = v17;
          [v17 addObject:v35];
        }
        else
        {
          id v36 = v17;
          [v17 addObject:&stru_26BDE2C70];
        }
        __int16 v37 = [v105 caseStorage];
        uint64_t v38 = [v37 caseSubtypeContext];
        [v16 setObject:v38 forKeyedSubscript:@"caseSubtypeContext"];

        id v39 = [v16 objectForKeyedSubscript:@"caseSubtypeContext"];

        if (v39)
        {
          uint64_t v40 = [v16 objectForKeyedSubscript:@"caseSubtypeContext"];
          [v36 addObject:v40];
        }
        else
        {
          [v36 addObject:&stru_26BDE2C70];
        }
        uint64_t v41 = [v105 caseStorage];
        id v42 = [v41 caseDetectedProcess];
        [v16 setObject:v42 forKeyedSubscript:@"caseProcess"];

        id v43 = [v16 objectForKeyedSubscript:@"caseProcess"];

        if (v43)
        {
          v44 = [v16 objectForKeyedSubscript:@"caseProcess"];
          [v36 addObject:v44];
        }
        else
        {
          [v36 addObject:&stru_26BDE2C70];
        }
        uint64_t v45 = [v36 componentsJoinedByString:@"^"];
        [v16 setObject:v45 forKeyedSubscript:@"caseSignature"];

        v46 = [v105 caseStorage];
        uint64_t v47 = [v46 buildVersion];
        v48 = v47;
        if (v47)
        {
          id v49 = v47;
        }
        else
        {
          id v49 = [v101 buildVersion];
        }
        id v50 = v49;

        [v16 setObject:v50 forKeyedSubscript:@"build"];
        if ((unint64_t)[v50 length] >= 4)
        {
          uint64_t v51 = [v50 substringToIndex:3];
          [v16 setObject:v51 forKeyedSubscript:@"buildPrefix"];
        }
        id v52 = [v105 caseStorage];
        v53 = [v52 buildVariant];
        v104 = v16;
        v97 = v50;
        if (v53)
        {
          [v16 setObject:v53 forKeyedSubscript:@"buildVariant"];
        }
        else
        {
          id v54 = [v101 buildVariant];
          [v104 setObject:v54 forKeyedSubscript:@"buildVariant"];

          uint64_t v16 = v104;
        }

        id v55 = [v101 buildPlatform];
        [v16 setObject:v55 forKeyedSubscript:@"buildPlatform"];

        long long v56 = [v101 productType];
        [v16 setObject:v56 forKeyedSubscript:@"deviceModel"];

        long long v57 = [v101 deviceClassString];
        [v16 setObject:v57 forKeyedSubscript:@"deviceCategory"];

        long long v58 = uploadLogHandle();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          v90 = [v104 objectForKeyedSubscript:@"caseID"];
          v96 = [v104 objectForKeyedSubscript:@"caseDomain"];
          long long v59 = [v104 objectForKeyedSubscript:@"caseType"];
          v60 = [v104 objectForKeyedSubscript:@"caseSubtype"];
          v61 = [v104 objectForKeyedSubscript:@"caseSubtypeContext"];
          v89 = [v104 objectForKeyedSubscript:@"caseProcess"];
          uint64_t v62 = [v104 objectForKeyedSubscript:@"build"];
          uint64_t v63 = [v104 objectForKeyedSubscript:@"buildVariant"];
          v64 = [v104 objectForKeyedSubscript:@"deviceModel"];
          *(_DWORD *)long long buf = 138414338;
          uint64_t v119 = (uint64_t)v90;
          __int16 v120 = 2112;
          v121 = v96;
          __int16 v122 = 2112;
          v123 = v59;
          __int16 v124 = 2112;
          v125 = v60;
          __int16 v126 = 2112;
          v127 = v61;
          __int16 v128 = 2112;
          v129 = v89;
          __int16 v130 = 2112;
          v131 = v62;
          __int16 v132 = 2112;
          v133 = v63;
          __int16 v134 = 2112;
          v135 = v64;
          _os_log_impl(&dword_209DBA000, v58, OS_LOG_TYPE_DEBUG, "Creating case record for %@ : [%@/%@/%@/%@/%@] (%@/%@/%@)", buf, 0x5Cu);
        }
        v65 = [MEMORY[0x263EFF980] array];
        v66 = [MEMORY[0x263EFF980] array];
        long long v109 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        v67 = [v105 fileURLs];
        uint64_t v68 = [v67 countByEnumeratingWithState:&v109 objects:v117 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v110;
          do
          {
            for (uint64_t i = 0; i != v69; ++i)
            {
              if (*(void *)v110 != v70) {
                objc_enumerationMutation(v67);
              }
              v72 = *(void **)(*((void *)&v109 + 1) + 8 * i);
              v73 = uploadLogHandle();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v119 = (uint64_t)v72;
                _os_log_impl(&dword_209DBA000, v73, OS_LOG_TYPE_INFO, "Creating asset for attachment %@", buf, 0xCu);
              }

              v74 = (void *)[objc_alloc(MEMORY[0x263EFD5E0]) initWithFileURL:v72];
              [v65 addObject:v74];
              v75 = [v72 lastPathComponent];
              [v66 addObject:v75];
            }
            uint64_t v69 = [v67 countByEnumeratingWithState:&v109 objects:v117 count:16];
          }
          while (v69);
        }

        v76 = uploadLogHandle();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v77 = [v65 count];
          *(_DWORD *)long long buf = v87;
          uint64_t v119 = v77;
          _os_log_impl(&dword_209DBA000, v76, OS_LOG_TYPE_DEBUG, "Adding %ld assets to case record", buf, 0xCu);
        }

        [v104 setObject:v65 forKeyedSubscript:@"attachments"];
        [v104 setObject:v66 forKeyedSubscript:@"attachmentFilenames"];
        [v102 addObject:v104];
        v78 = [(CloudKitUploadController *)self uploadOperationWithRecordsToSave:v102 recordIDsToDelete:0 allowCellular:v98 activity:v91];
        v79 = [v78 operationID];
        [v105 setOperationID:v79];

        [v105 setAllowsCellular:v98];
        v80 = [v78 operationID];
        v106[0] = MEMORY[0x263EF8330];
        v106[1] = 3221225472;
        v106[2] = __75__CloudKitUploadController_uploadToCloudKitContainer_withRecords_activity___block_invoke;
        v106[3] = &unk_263FC5268;
        v106[4] = self;
        id v107 = v80;
        v108 = v91;
        id v99 = v80;
        [v78 setModifyRecordsCompletionBlock:v106];
        v81 = [MEMORY[0x263EFF910] date];
        [v105 setStartTime:v81];

        [v105 setUploadState:2];
        v82 = +[ABCAdministrator sharedInstance];
        v83 = [v82 configurationManager];
        if ([v83 cloudKitSandboxEnvironment]) {
          uint64_t v84 = 2;
        }
        else {
          uint64_t v84 = 1;
        }
        id v8 = v91;
        [v105 setEnvironment:v84];

        ++self->_outstandingOperationCount;
        v85 = [v94 publicCloudDatabase];
        [v85 addOperation:v78];

        uint64_t v14 = v100 + 1;
        unint64_t v13 = 0x263EFF000;
      }
      while (v100 + 1 != v93);
      uint64_t v93 = [obj countByEnumeratingWithState:&v113 objects:v136 count:16];
      if (v93) {
        continue;
      }
      break;
    }
  }
LABEL_57:

  [(CloudKitUploadController *)self save];
}

void __75__CloudKitUploadController_uploadToCloudKitContainer_withRecords_activity___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  uint64_t v10 = uploadLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Completion callback for CloudKit upload operations", v11, 2u);
  }

  [*(id *)(a1 + 32) operationCompletedWithID:*(void *)(a1 + 40) savedRecords:v9 deletedRecords:v8 error:v7 activity:*(void *)(a1 + 48)];
}

- (void)operationCompletedWithID:(id)a3 savedRecords:(id)a4 deletedRecords:(id)a5 error:(id)a6 activity:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  __int16 v15 = [MEMORY[0x263EFF910] date];
  uint64_t v16 = uploadLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v36 = [v12 count];
    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "Upload operation complete for %ld records", buf, 0xCu);
  }

  if (v13)
  {
    id v17 = [v13 userInfo];
    uint64_t v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263EFD4C8]];

    if (v18)
    {
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke;
      v33[3] = &unk_263FC3B80;
      uint64_t v34 = v11;
      [v18 enumerateKeysAndObjectsUsingBlock:v33];
      BOOL v19 = v34;
    }
    else
    {
      BOOL v19 = uploadLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v36 = (uint64_t)v11;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "Failed upload operation %@ with error: %@", buf, 0x16u);
      }
    }

    BOOL v20 = [(CloudKitUploadController *)self shouldDeferFromCloudKitError:v13];
  }
  else
  {
    BOOL v20 = 0;
  }
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_181;
  block[3] = &unk_263FC5290;
  void block[4] = self;
  id v30 = v11;
  id v31 = v15;
  BOOL v32 = v13 == 0;
  id v22 = v15;
  id v23 = v11;
  dispatch_async(queue, block);
  if (v14 && v20) {
    [(CloudKitUploadController *)self deferXPCActivity:v14];
  }
  double v24 = self->_queue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_2;
  v26[3] = &unk_263FC4228;
  BOOL v28 = v13 == 0;
  v26[4] = self;
  id v27 = v14;
  id v25 = v14;
  dispatch_async(v24, v26);
}

void __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = uploadLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to upload record %@ with error %@", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_181(uint64_t a1)
{
  return [*(id *)(a1 + 32) recordOperationCompleteForOperationID:*(void *)(a1 + 40) completionTime:*(void *)(a1 + 48) success:*(unsigned __int8 *)(a1 + 56)];
}

void __96__CloudKitUploadController_operationCompletedWithID_savedRecords_deletedRecords_error_activity___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  --*(void *)(*(void *)(a1 + 32) + 48);
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(v2 + 56);
  if (v3) {
    char v3 = *(unsigned char *)(a1 + 48) != 0;
  }
  *(unsigned char *)(v2 + 56) = v3;
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 48);
  id v5 = uploadLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6)
    {
LABEL_7:

      return;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 48);
    int v17 = 134217984;
    uint64_t v18 = v7;
    uint64_t v8 = "Waiting for %ld outstanding operations...";
    int v9 = v5;
    uint32_t v10 = 12;
LABEL_6:
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, v10);
    goto LABEL_7;
  }
  if (v6)
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "No more outstanding CKOperations remaining", (uint8_t *)&v17, 2u);
  }

  int v11 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56);
  id v12 = uploadLogHandle();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (!v13) {
      goto LABEL_16;
    }
    LOWORD(v17) = 0;
    id v14 = "All upload operations completed successfully.";
  }
  else
  {
    if (!v13) {
      goto LABEL_16;
    }
    LOWORD(v17) = 0;
    id v14 = "All upload operations completed, but one or more operations failed with an error.";
  }
  _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v17, 2u);
LABEL_16:

  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = uploadLogHandle();
  id v5 = v16;
  if (!v15)
  {
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    LOWORD(v17) = 0;
    uint64_t v8 = "XPC activity not set for this CKOperation";
    int v9 = v5;
    uint32_t v10 = 2;
    goto LABEL_6;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "Ready to set activity state to Done", (uint8_t *)&v17, 2u);
  }

  [*(id *)(a1 + 32) finishXPCActivity:*(void *)(a1 + 40)];
}

- (BOOL)shouldDeferFromCloudKitError:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 domain];
  uint64_t v5 = *MEMORY[0x263EFD498];
  if ([v4 isEqualToString:*MEMORY[0x263EFD498]])
  {
    uint64_t v6 = [v3 code];

    if (v6 == 20)
    {
      uint64_t v7 = [v3 userInfo];
      uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F08608]];

      int v9 = [v8 domain];
      int v10 = [v9 isEqualToString:v5];

      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v11 = [v8 code];
      LOBYTE(v10) = v11 != 130;
      if (v11 == 130)
      {
        id v12 = uploadLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        __int16 v17 = 0;
        BOOL v13 = "Activity passed to CloudKit is not in the expected Continue state";
        id v14 = (uint8_t *)&v17;
      }
      else
      {
        if ([v8 code] != 131)
        {
          LOBYTE(v10) = 0;
          goto LABEL_13;
        }
        id v12 = uploadLogHandle();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_9;
        }
        __int16 v16 = 0;
        BOOL v13 = "CloudKit informed us to defer the current activity";
        id v14 = (uint8_t *)&v16;
      }
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
LABEL_9:

      goto LABEL_13;
    }
  }
  else
  {
  }
  LOBYTE(v10) = 0;
LABEL_14:

  return v10;
}

- (void)deferXPCActivity:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = (_xpc_activity_s *)a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 3)
    {
      uint64_t v5 = uploadLogHandle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        id v12 = v4;
        uint64_t v6 = "Activity state is already set to defer (%p)";
        uint64_t v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_INFO;
LABEL_10:
        _os_log_impl(&dword_209DBA000, v7, v8, v6, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      BOOL v9 = xpc_activity_set_state(v4, 3);
      int v10 = uploadLogHandle();
      uint64_t v5 = v10;
      if (v9)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 134217984;
          id v12 = v4;
          uint64_t v6 = "Set activity state to DEFER (%p)";
          uint64_t v7 = v5;
          os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
          goto LABEL_10;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134217984;
        id v12 = v4;
        uint64_t v6 = "Unable to set activity state to DEFER! (%p)";
        uint64_t v7 = v5;
        os_log_type_t v8 = OS_LOG_TYPE_ERROR;
        goto LABEL_10;
      }
    }
  }
}

- (void)finishXPCActivity:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (_xpc_activity_s *)a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if (xpc_activity_get_state(v3) == 4)
    {
      BOOL v5 = xpc_activity_set_state(v4, 5);
      uint64_t v6 = uploadLogHandle();
      uint64_t v7 = v6;
      if (v5)
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 134217984;
          uint64_t v13 = v4;
          os_log_type_t v8 = "Set activity state to DONE (%p)";
          BOOL v9 = v7;
          os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_10:
          uint32_t v11 = 12;
          goto LABEL_11;
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v12 = 134217984;
        uint64_t v13 = v4;
        os_log_type_t v8 = "Unable to set activity state to DONE! (%p)";
        BOOL v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v7 = uploadLogHandle();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        os_log_type_t v8 = "XPC activity is not in Continue state. Will not change the state to DONE";
        BOOL v9 = v7;
        os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
        uint32_t v11 = 2;
LABEL_11:
        _os_log_impl(&dword_209DBA000, v9, v10, v8, (uint8_t *)&v12, v11);
      }
    }
  }
}

- (void)uploadDiagnosticCases:(id)a3 activity:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (_xpc_activity_s *)a4;
  if ([v6 count])
  {
    if (v7 && xpc_activity_should_defer(v7))
    {
      os_log_type_t v8 = uploadLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Will not start log uploads due to activity defer", buf, 2u);
      }

      [(CloudKitUploadController *)self deferXPCActivity:v7];
    }
    else
    {
      BOOL v9 = uploadLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218242;
        *(void *)&uint8_t buf[4] = [v6 count];
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "Will attempt to upload %ld cases: %@", buf, 0x16u);
      }

      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      __int16 v17 = __Block_byref_object_copy__6;
      uint64_t v18 = __Block_byref_object_dispose__6;
      id v19 = [MEMORY[0x263EFF980] array];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __59__CloudKitUploadController_uploadDiagnosticCases_activity___block_invoke;
      v15[3] = &unk_263FC3E20;
      void v15[4] = self;
      v15[5] = buf;
      [v6 enumerateObjectsUsingBlock:v15];
      os_log_type_t v10 = +[ABCAdministrator sharedInstance];
      uint32_t v11 = [v10 configurationManager];
      if ([v11 cloudKitSandboxEnvironment]) {
        uint64_t v12 = 2;
      }
      else {
        uint64_t v12 = 1;
      }
      uint64_t v13 = [(CloudKitUploadController *)self currentCloudKitContainerForEnvironment:v12];

      [(CloudKitUploadController *)self uploadToCloudKitContainer:v13 withRecords:*(void *)(*(void *)&buf[8] + 40) activity:v7];
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    uint64_t v14 = uploadLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "No cases were requested to be uploaded (empty list)", buf, 2u);
    }

    if (v7) {
      [(CloudKitUploadController *)self finishXPCActivity:v7];
    }
  }
}

void __59__CloudKitUploadController_uploadDiagnosticCases_activity___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 uploadRecord];
  if (!v3)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 40) createEntity];
    [v3 setCaseStorage:v6];
  }
  uint64_t v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  BOOL v5 = [v6 uploadRecord];
  [v4 addObject:v5];
}

- (void)performUploadForCaseIdentifiers:(id)a3
{
  uint64_t v4 = [(CloudKitUploadController *)self fetchCasesWithIdentifiers:a3 limit:0];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__CloudKitUploadController_performUploadForCaseIdentifiers___block_invoke;
  v5[3] = &unk_263FC4680;
  v5[4] = self;
  [(CloudKitUploadController *)self filterCasesPendingUpload:v4 activity:0 reply:v5];
}

uint64_t __60__CloudKitUploadController_performUploadForCaseIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) uploadDiagnosticCases:a2 activity:0];
}

- (void)performUploadForRecentCases:(unint64_t)a3
{
  uint64_t v4 = [(CloudKitUploadController *)self fetchRecentCasesPendingUpload:a3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__CloudKitUploadController_performUploadForRecentCases___block_invoke;
  v5[3] = &unk_263FC4680;
  v5[4] = self;
  [(CloudKitUploadController *)self filterCasesPendingUpload:v4 activity:0 reply:v5];
}

uint64_t __56__CloudKitUploadController_performUploadForRecentCases___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) uploadDiagnosticCases:a2 activity:0];
}

- (void)performUploadDecisionForCaseIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = [(CloudKitUploadController *)self fetchCasesWithIdentifiers:a3 limit:0];
  [(CloudKitUploadController *)self filterCasesViaCloudkitDecisionService:v7 activity:0 response:v6];
}

- (void)performSubmissionOfRecentCaseSummaries:(unint64_t)a3 reply:(id)a4
{
  os_log_type_t v8 = (void (**)(id, void *))a4;
  id v6 = [(CloudKitUploadController *)self fetchRecentPendingCaseSummaries:a3];
  [(CloudKitUploadController *)self submitCaseSummaries:v6 activity:0];
  if (v8)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Sent submit request for %ld case summaries", objc_msgSend(v6, "count"));
    v8[2](v8, v7);
  }
}

- (void)performSubmissionOfCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  os_log_type_t v8 = (void (**)(id, void *))a4;
  id v6 = [(CloudKitUploadController *)self fetchCaseSummariesWithIdentifiers:a3];
  [(CloudKitUploadController *)self submitCaseSummaries:v6 activity:0];
  if (v8)
  {
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Sent submit request for %ld case summaries", objc_msgSend(v6, "count"));
    v8[2](v8, v7);
  }
}

- (void)startPeriodicUploadTask:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CloudKitUploadController *)self fetchRecentCasesPendingUpload:0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__CloudKitUploadController_startPeriodicUploadTask___block_invoke;
  v7[3] = &unk_263FC4608;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CloudKitUploadController *)self filterCasesPendingUpload:v5 activity:v6 reply:v7];
}

uint64_t __52__CloudKitUploadController_startPeriodicUploadTask___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) uploadDiagnosticCases:a2 activity:*(void *)(a1 + 40)];
}

- (void)startPeriodicSummaryTask:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[ABCAdministrator sharedInstance];
  id v6 = [v5 configurationManager];
  -[CloudKitUploadController fetchRecentPendingCaseSummaries:](self, "fetchRecentPendingCaseSummaries:", [v6 maxCaseSummaryPerSubmission]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  [(CloudKitUploadController *)self submitCaseSummaries:v7 activity:v4];
}

- (void)ckcodeDecisionService:(id)a3 response:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [(ObjectAnalytics *)self->_caseStorageAnalytics createTemporaryEntity];
  [v6 setCaseDomain:@"TestDomain"];
  [v6 setCaseType:@"TestType"];
  [v6 setCaseSubtypeContext:@"TestSubType"];
  [v6 setCaseSubtypeContext:@"TestSubtypeContext"];
  [v6 setCaseDetectedProcess:@"symptomsd"];
  id v7 = [MEMORY[0x263F08C38] UUID];
  id v8 = [v7 UUIDString];
  [v6 setCaseID:v8];

  v13[0] = v6;
  BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__CloudKitUploadController_ckcodeDecisionService_response___block_invoke;
  v11[3] = &unk_263FC51A0;
  id v12 = v5;
  id v10 = v5;
  [(CloudKitUploadController *)self filterCasesViaCloudkitDecisionService:v9 activity:0 response:v11];
}

uint64_t __59__CloudKitUploadController_ckcodeDecisionService_response___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)filterCasesViaCloudkitDecisionService:(id)a3 activity:(id)a4 response:(id)a5
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = uploadLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v81 = [v7 count];
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "CloudkitDecisionService request for %ld cases", buf, 0xCu);
  }

  uint32_t v11 = uploadLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v81 = (uint64_t)v7;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "  Cases: %{private}@", buf, 0xCu);
  }

  if ([v7 count])
  {
    uint64_t v63 = v9;
    v64 = v8;
    id v12 = +[SystemProperties sharedInstance];
    uint64_t v13 = objc_alloc_init(ABCPbSigGrantRequest);
    [(ABCPbSigGrantRequest *)v13 setVer:1];
    uint64_t v14 = [v12 productType];
    [(ABCPbSigGrantRequest *)v13 setDeviceModel:v14];

    uint64_t v15 = [v12 buildPlatform];
    v72 = v13;
    [(ABCPbSigGrantRequest *)v13 setBuildPlatform:v15];

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v65 = v7;
    id obj = v7;
    uint64_t v16 = [obj countByEnumeratingWithState:&v76 objects:v94 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v77;
      p_vtable = &OBJC_METACLASS___DiagCollectionServiceImpl.vtable;
      uint64_t v67 = *(void *)v77;
      uint64_t v68 = v12;
      do
      {
        uint64_t v20 = 0;
        uint64_t v69 = v17;
        do
        {
          if (*(void *)v77 != v18) {
            objc_enumerationMutation(obj);
          }
          char v21 = *(void **)(*((void *)&v76 + 1) + 8 * v20);
          id v22 = objc_alloc_init((Class)(p_vtable + 102));
          id v23 = [v21 caseDomain];
          [v22 setDomain:v23];

          double v24 = [v21 caseType];
          [v22 setType:v24];

          id v25 = [v21 caseSubtype];
          [v22 setSubtype:v25];

          id v26 = [v21 caseSubtypeContext];
          [v22 setSubtypeContext:v26];

          id v27 = [v21 caseDetectedProcess];
          [v22 setProcess:v27];

          BOOL v28 = [v21 caseID];
          [v22 setCaseIdentifier:v28];

          double v29 = [v12 buildVariant];
          [v22 setBuildVariant:v29];

          id v30 = [v12 buildVersion];
          [v22 setBuild:v30];

          id v31 = [v21 caseGroupID];
          uint64_t v32 = [v31 length];

          if (v32)
          {
            id v33 = [v21 caseGroupID];
            [v22 setCaseGroupIdentifier:v33];
          }
          uint64_t v34 = [v21 uploadRecord];
          uint64_t v35 = [v34 totalBytes];

          if (v35 >= 1)
          {
            uint64_t v36 = [v21 uploadRecord];
            objc_msgSend(v22, "setLogSizeTotal:", objc_msgSend(v36, "totalBytes") >> 10);
          }
          [(ABCPbSigGrantRequest *)v72 addSigRequest:v22];
          __int16 v37 = uploadLogHandle();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            id v38 = [v21 caseID];
            uint64_t v39 = [v21 caseGroupID];
            uint64_t v40 = (void *)v39;
            uint64_t v41 = @"(no grpID)";
            if (v39) {
              uint64_t v41 = (__CFString *)v39;
            }
            v71 = v41;
            id v42 = [v21 caseDomain];
            id v43 = [v21 caseType];
            v44 = [v21 caseSubtype];
            uint64_t v45 = [v21 caseSubtypeContext];
            v46 = [v21 caseDetectedProcess];
            *(_DWORD *)long long buf = 138479363;
            uint64_t v81 = (uint64_t)v38;
            __int16 v82 = 2113;
            v83 = v71;
            __int16 v84 = 2113;
            v85 = v42;
            __int16 v86 = 2113;
            long long v87 = v43;
            __int16 v88 = 2113;
            v89 = v44;
            __int16 v90 = 2113;
            v91 = v45;
            __int16 v92 = 2113;
            uint64_t v93 = v46;
            _os_log_impl(&dword_209DBA000, v37, OS_LOG_TYPE_DEBUG, "Processed case: %{private}@/%{private}@ {%{private}@/%{private}@/%{private}@/%{private}@/%{private}@}", buf, 0x48u);

            uint64_t v18 = v67;
            p_vtable = (void **)(&OBJC_METACLASS___DiagCollectionServiceImpl + 24);

            uint64_t v17 = v69;
            id v12 = v68;
          }
          ++v20;
        }
        while (v17 != v20);
        uint64_t v17 = [obj countByEnumeratingWithState:&v76 objects:v94 count:16];
      }
      while (v17);
    }

    uint64_t v47 = +[ABCAdministrator sharedInstance];
    v48 = [v47 configurationManager];
    if ([v48 cloudKitSandboxEnvironment]) {
      uint64_t v49 = 2;
    }
    else {
      uint64_t v49 = 1;
    }

    id v50 = [(CloudKitUploadController *)self currentCloudKitContainerForEnvironment:v49];
    uint64_t v51 = (void *)MEMORY[0x21050CEB0]();
    id v52 = +[ABCAdministrator sharedInstance];
    v53 = [v52 configurationManager];
    id v54 = [v53 cloudKitInvernessService];

    id v55 = (void *)[objc_alloc(MEMORY[0x263EFD600]) initWithServiceName:v54 functionName:@"grantRequest" responseClass:objc_opt_class()];
    [v55 setRequest:v72];
    [v55 setDestinationServer:0];
    long long v56 = +[ABCAdministrator sharedInstance];
    long long v57 = [v56 configurationManager];
    uint64_t v58 = [v57 cloudKitPrefersAnonymous];
    long long v59 = [v55 configuration];
    [v59 setPreferAnonymousRequests:v58];

    v60 = [v55 configuration];
    [v60 setAllowsCellularAccess:1];

    id v8 = v64;
    if (v64)
    {
      v61 = [v55 configuration];
      [v61 setXpcActivity:v64];
    }
    v73[0] = MEMORY[0x263EF8330];
    v73[1] = 3221225472;
    v73[2] = __84__CloudKitUploadController_filterCasesViaCloudkitDecisionService_activity_response___block_invoke;
    v73[3] = &unk_263FC52B8;
    v73[4] = self;
    id v74 = v64;
    id v9 = v63;
    id v75 = v63;
    [v55 setCodeOperationCompletionBlock:v73];
    uint64_t v62 = [v50 publicCloudDatabase];
    [v62 addOperation:v55];

    id v7 = v65;
    goto LABEL_29;
  }
  if (v9)
  {
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    (*((void (**)(id, void, void *))v9 + 2))(v9, MEMORY[0x263EFFA78], v12);
LABEL_29:
  }
}

void __84__CloudKitUploadController_filterCasesViaCloudkitDecisionService_activity_response___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = uploadLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "CKCode Error: %@", buf, 0xCu);
    }

    if ([*(id *)(a1 + 32) shouldDeferFromCloudKitError:v6] && *(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "deferXPCActivity:");
      id v8 = (void *)MEMORY[0x263F087E8];
      uint64_t v9 = *MEMORY[0x263F08438];
      uint64_t v21 = *MEMORY[0x263F08320];
      id v22 = @"CloudKit cancelled the operation";
      id v10 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v11 = [v8 errorWithDomain:v9 code:89 userInfo:v10];
    }
    else
    {
      id v11 = v6;
    }
    id v12 = 0;
  }
  else
  {
    uint64_t v13 = uploadLogHandle();
    uint64_t v14 = v13;
    if (v5)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Received response from Decision Server", buf, 2u);
      }

      id v12 = [*(id *)(a1 + 32) processCloudkitDecisionServiceResponse:v5];
      id v11 = 0;
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "Received a nil response from CKCode", buf, 2u);
      }

      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = *MEMORY[0x263F08438];
      uint64_t v19 = *MEMORY[0x263F08320];
      uint64_t v20 = @"CKCode responded with a nil payload";
      uint64_t v17 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v11 = [v15 errorWithDomain:v16 code:91 userInfo:v17];

      id v12 = &unk_26BDF5830;
    }
  }
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v12, v11);
  }
}

- (id)processCloudkitDecisionServiceResponse:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = uploadLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138477827;
    id v34 = v3;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "grantResponse: %{private}@", buf, 0xCu);
  }

  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  int v6 = [v3 globalDecision];
  if (!v6)
  {
    uint64_t v7 = MEMORY[0x263EFFA80];
    goto LABEL_7;
  }
  if (v6 == 1)
  {
    uint64_t v7 = MEMORY[0x263EFFA88];
LABEL_7:
    [v5 setObject:v7 forKeyedSubscript:@"summary"];
    goto LABEL_25;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v28 = v3;
  id v8 = [v3 sigResponses];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v14 = uploadLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138477827;
          id v34 = v13;
          _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "  sigResponse: %{private}@", buf, 0xCu);
        }

        uint64_t v15 = [v13 caseIdentifier];
        if (v15 && (v16 = (void *)v15, int v17 = [v13 hasDecision], v16, v17))
        {
          uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "decision"));
          uint64_t v19 = [v13 caseIdentifier];
          [v5 setObject:v18 forKeyedSubscript:v19];
        }
        else
        {
          uint64_t v18 = uploadLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = [v13 caseIdentifier];
            int v21 = [v13 hasDecision];
            *(_DWORD *)long long buf = 138478083;
            id v22 = "missing";
            if (v21) {
              id v22 = "present";
            }
            id v34 = v20;
            __int16 v35 = 2080;
            uint64_t v36 = v22;
            _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, " sigResponse is missing an identifier (%{private}@) and/or decision (%s)", buf, 0x16u);
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v10);
  }

  id v3 = v28;
LABEL_25:
  id v23 = [v3 status];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    uint64_t v25 = [v3 status];
    id v26 = (void *)[v25 copy];
    [v5 setObject:v26 forKeyedSubscript:@"status"];
  }

  return v5;
}

- (id)fetchCaseSummariesWithIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 length])
        {
          id v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseID == %@", v11];
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    uint64_t v13 = [MEMORY[0x263F08730] orPredicateWithSubpredicates:v5];
    uint64_t v14 = [(CloudKitUploadController *)self _fetchRecentPendingCaseSummariesInternal:v13 limit:0];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)fetchRecentPendingCaseSummaries:(unint64_t)a3
{
  return [(CloudKitUploadController *)self _fetchRecentPendingCaseSummariesInternal:0 limit:a3];
}

- (id)_fetchRecentPendingCaseSummariesInternal:(id)a3 limit:(unint64_t)a4
{
  v16[2] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"caseSummaryState == %d", 0);
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x263F08730];
    v16[0] = v6;
    v16[1] = v7;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    id v11 = [v9 andPredicateWithSubpredicates:v10];
  }
  else
  {
    id v11 = v7;
  }
  caseSummaryAnalytics = self->_caseSummaryAnalytics;
  uint64_t v13 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"caseCreatedTime" ascending:0];
  uint64_t v14 = [(ObjectAnalytics *)caseSummaryAnalytics fetchEntitiesFreeForm:v11 sortDesc:v13 limit:a4];

  return v14;
}

- (void)submitCaseSummaries:(id)a3 activity:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = summaryLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v38 = [v6 count];
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Submission request for %ld cases", buf, 0xCu);
  }

  uint64_t v9 = summaryLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138477827;
    uint64_t v38 = (uint64_t)v6;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Cases: %{private}@", buf, 0xCu);
  }

  if ([v6 count])
  {
    if (v7 && xpc_activity_should_defer((xpc_activity_t)v7))
    {
      uint64_t v10 = summaryLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: xpc deferral, cannot prepare request", buf, 2u);
      }

      [(CloudKitUploadController *)self deferXPCActivity:v7];
    }
    else
    {
      uint64_t v11 = +[DiagnosticCaseSummaryAnalytics pbRequestForCases:v6];
      id v12 = +[ABCAdministrator sharedInstance];
      uint64_t v13 = [v12 configurationManager];
      if ([v13 cloudKitSandboxEnvironment]) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }

      id v33 = [(CloudKitUploadController *)self currentCloudKitContainerForEnvironment:v14];
      context = (void *)MEMORY[0x21050CEB0]();
      uint64_t v15 = +[ABCAdministrator sharedInstance];
      long long v16 = [v15 configurationManager];
      long long v17 = [v16 cloudKitInvernessService];

      long long v18 = summaryLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v38 = (uint64_t)v17;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: Inverness Service: %@", buf, 0xCu);
      }

      long long v19 = (void *)[objc_alloc(MEMORY[0x263EFD600]) initWithServiceName:v17 functionName:@"submitCaseSummary" responseClass:objc_opt_class()];
      uint64_t v20 = (void *)v11;
      [v19 setRequest:v11];
      [v19 setDestinationServer:0];
      uint64_t v21 = +[ABCAdministrator sharedInstance];
      id v22 = [v21 configurationManager];
      uint64_t v23 = [v22 cloudKitPrefersAnonymous];
      uint64_t v24 = [v19 configuration];
      [v24 setPreferAnonymousRequests:v23];

      uint64_t v25 = [v19 configuration];
      [v25 setAllowsCellularAccess:1];

      if (v7)
      {
        id v26 = [v19 configuration];
        [v26 setXpcActivity:v7];
      }
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke;
      v34[3] = &unk_263FC52E0;
      void v34[4] = self;
      id v27 = v7;
      id v35 = v27;
      id v36 = v6;
      [v19 setCodeOperationCompletionBlock:v34];
      id v28 = v20;
      if (v7 && xpc_activity_should_defer((xpc_activity_t)v27))
      {
        long long v29 = summaryLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: xpc deferral, cannot schedule CK operation", buf, 2u);
        }

        [(CloudKitUploadController *)self deferXPCActivity:v27];
        id v28 = v20;
        long long v30 = v33;
      }
      else
      {
        long long v30 = v33;
        long long v31 = [v33 publicCloudDatabase];
        [v31 addOperation:v19];
      }
    }
  }
  else if (v7)
  {
    [(CloudKitUploadController *)self finishXPCActivity:v7];
  }
}

void __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = summaryLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: CKCode Error: %@", buf, 0xCu);
    }

    if ([*(id *)(a1 + 32) shouldDeferFromCloudKitError:v6] && *(void *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "deferXPCActivity:");
      uint64_t v8 = summaryLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        uint64_t v9 = "DiagnosticCaseSummaryLog: CloudKit cancelled the operation";
LABEL_15:
        uint64_t v15 = v8;
        uint32_t v16 = 2;
LABEL_18:
        _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_ERROR, v9, buf, v16);
        goto LABEL_19;
      }
      goto LABEL_19;
    }
  }
  else
  {
    if (!v5)
    {
      uint64_t v8 = summaryLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        uint64_t v9 = "DiagnosticCaseSummaryLog: Received a nil response from CKCode";
        goto LABEL_15;
      }
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v10 = [v5 status];
    int v11 = [v10 isEqualToString:@"SUCCESS"];

    id v12 = summaryLogHandle();
    uint64_t v8 = v12;
    if (!v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138477827;
        id v20 = v5;
        uint64_t v9 = "DiagnosticCaseSummaryLog: Unsuccessful response: %{private}@";
        uint64_t v15 = v8;
        uint32_t v16 = 12;
        goto LABEL_18;
      }
      goto LABEL_19;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138477827;
      id v20 = v5;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Successful response: %{private}@", buf, 0xCu);
    }

    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(NSObject **)(v13 + 8);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke_245;
    v17[3] = &unk_263FC3430;
    v17[4] = v13;
    id v18 = *(id *)(a1 + 48);
    dispatch_async(v14, v17);
  }
LABEL_20:
  if (*(void *)(a1 + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "finishXPCActivity:");
  }
}

uint64_t __57__CloudKitUploadController_submitCaseSummaries_activity___block_invoke_245(uint64_t a1)
{
  uint64_t v2 = summaryLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Ready to update submitted case summary records", v4, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) updateSubmittedCases:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) save];
}

- (void)configureLogUploadDiscretionaryActivityCriteria:(id)a3
{
  id v3 = a3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81A0], 300);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8240], (const char *)*MEMORY[0x263EF8250]);
  id v4 = +[SystemProperties sharedInstance];
  int v5 = [v4 npiDevice];

  if (v5)
  {
    id v6 = uploadLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Applying NPI scheduling criteria for log upload activity", v11, 2u);
    }

    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81F0]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81C0], *MEMORY[0x263EF8200]);
    id v7 = (const char *)*MEMORY[0x263EF8180];
    uint64_t v8 = v3;
    BOOL v9 = 1;
  }
  else
  {
    int64_t v10 = *MEMORY[0x263EF81E8];
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81D8], *MEMORY[0x263EF81E8]);
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81C0], v10);
    id v7 = (const char *)*MEMORY[0x263EF8180];
    uint64_t v8 = v3;
    BOOL v9 = 0;
  }
  xpc_dictionary_set_BOOL(v8, v7, v9);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82C8], 1);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF8258], 20971520);
}

- (void)configureCaseSummaryDiscretionaryActivityCriteria:(id)a3
{
  id v3 = a3;
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF81A0], 90);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82A0], 1);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8288]);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF8180], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82D0], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x263EF82C8], 0);
  xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x263EF8258], 10240);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x263EF8240], (const char *)*MEMORY[0x263EF8250]);
  id v4 = +[SystemProperties sharedInstance];
  int v5 = [v4 npiDevice];

  if (v5)
  {
    id v6 = uploadLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "Applying NPI scheduling criteria for case summary activity", v9, 2u);
    }

    id v7 = (const char *)*MEMORY[0x263EF81D8];
    int64_t v8 = *MEMORY[0x263EF81F0];
  }
  else
  {
    id v7 = (const char *)*MEMORY[0x263EF81D8];
    int64_t v8 = 6 * *MEMORY[0x263EF81F0];
  }
  xpc_dictionary_set_int64(v3, v7, v8);
}

- (void)registerCloudKitUploadActivities
{
  [(CloudKitUploadController *)self registerLogUploadActivities];
  id v3 = +[ABCAdministrator sharedInstance];
  id v4 = [v3 configurationManager];
  int v5 = [v4 caseSummaryEnabled];

  if (v5)
  {
    [(CloudKitUploadController *)self registerCaseSummaryActivities];
  }
}

- (void)registerLogUploadActivities
{
  id v3 = uploadLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Registering periodic CloudKit upload activity", buf, 2u);
  }

  id v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __55__CloudKitUploadController_registerLogUploadActivities__block_invoke;
  handler[3] = &unk_263FC43C8;
  handler[4] = self;
  xpc_activity_register("com.apple.autobugcapture.logupload.discretionary", v4, handler);
}

void __55__CloudKitUploadController_registerLogUploadActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (!state)
  {
    int64_t v8 = uploadLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Checking in to discretionary CloudKit upload activity", buf, 2u);
    }

    BOOL v9 = xpc_activity_copy_criteria(v3);
    int64_t v10 = uploadLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)long long buf = 138412290;
        xpc_object_t v21 = v9;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Activty already has criteria set %@", buf, 0xCu);
      }

      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      [*(id *)(a1 + 32) configureLogUploadDiscretionaryActivityCriteria:v12];
      if (xpc_equal(v9, v12)) {
        goto LABEL_23;
      }
      uint64_t v13 = uploadLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        xpc_activity_set_criteria(v3, v12);
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v14 = "Existing activity criteria was different from the default criteria. Replacing with defaults";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 2;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Setting activity criteria to defaults", buf, 2u);
      }

      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      [*(id *)(a1 + 32) configureLogUploadDiscretionaryActivityCriteria:v12];
      uint64_t v13 = uploadLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_22;
      }
      *(_DWORD *)long long buf = 138412290;
      xpc_object_t v21 = v12;
      uint64_t v14 = "Activity criteria set to %@";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
      uint32_t v17 = 12;
    }
    _os_log_impl(&dword_209DBA000, v15, v16, v14, buf, v17);
    goto LABEL_22;
  }
  if (state == 2)
  {
    int v5 = uploadLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      xpc_object_t v21 = v3;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Ready to run discretionary CloudKit upload activity (%p)", buf, 0xCu);
    }

    if (xpc_activity_set_state(v3, 4))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(NSObject **)(v6 + 8);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __55__CloudKitUploadController_registerLogUploadActivities__block_invoke_248;
      v18[3] = &unk_263FC3430;
      v18[4] = v6;
      long long v19 = v3;
      dispatch_async(v7, v18);

      goto LABEL_25;
    }
    BOOL v9 = uploadLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Unable to set activity state to CONTINUE!", buf, 2u);
    }
LABEL_24:
  }
LABEL_25:
}

uint64_t __55__CloudKitUploadController_registerLogUploadActivities__block_invoke_248(uint64_t a1)
{
  return [*(id *)(a1 + 32) startPeriodicUploadTask:*(void *)(a1 + 40)];
}

- (void)registerCaseSummaryActivities
{
  id v3 = summaryLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Registering periodic submission activity", buf, 2u);
  }

  id v4 = (void *)*MEMORY[0x263EF8188];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke;
  handler[3] = &unk_263FC43C8;
  handler[4] = self;
  xpc_activity_register("com.apple.autobugcapture.caseSummary.discretionary", v4, handler);
}

void __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (!state)
  {
    int64_t v8 = summaryLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Checking in to discretionary submission activity", buf, 2u);
    }

    BOOL v9 = xpc_activity_copy_criteria(v3);
    int64_t v10 = summaryLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_DWORD *)long long buf = 138412290;
        xpc_object_t v21 = v9;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: submission activity already has criteria set %@", buf, 0xCu);
      }

      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      [*(id *)(a1 + 32) configureCaseSummaryDiscretionaryActivityCriteria:v12];
      if (xpc_equal(v9, v12)) {
        goto LABEL_23;
      }
      uint64_t v13 = summaryLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_22:

        xpc_activity_set_criteria(v3, v12);
LABEL_23:

        goto LABEL_24;
      }
      *(_WORD *)long long buf = 0;
      uint64_t v14 = "DiagnosticCaseSummaryLog: Existing submission activity criteria was different from the default criteria. Rep"
            "lacing with defaults";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      uint32_t v17 = 2;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Setting submission activity criteria to defaults", buf, 2u);
      }

      xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
      [*(id *)(a1 + 32) configureCaseSummaryDiscretionaryActivityCriteria:v12];
      uint64_t v13 = summaryLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_22;
      }
      *(_DWORD *)long long buf = 138412290;
      xpc_object_t v21 = v12;
      uint64_t v14 = "DiagnosticCaseSummaryLog: Submission activity criteria set to %@";
      uint64_t v15 = v13;
      os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
      uint32_t v17 = 12;
    }
    _os_log_impl(&dword_209DBA000, v15, v16, v14, buf, v17);
    goto LABEL_22;
  }
  if (state == 2)
  {
    int v5 = summaryLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      xpc_object_t v21 = v3;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Ready to run discretionary submission activity (%p)", buf, 0xCu);
    }

    if (xpc_activity_set_state(v3, 4))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      id v7 = *(NSObject **)(v6 + 8);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke_251;
      v18[3] = &unk_263FC3430;
      v18[4] = v6;
      long long v19 = v3;
      dispatch_async(v7, v18);

      goto LABEL_25;
    }
    BOOL v9 = summaryLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "DiagnosticCaseSummaryLog: Unable to set activity state to CONTINUE!", buf, 2u);
    }
LABEL_24:
  }
LABEL_25:
}

uint64_t __57__CloudKitUploadController_registerCaseSummaryActivities__block_invoke_251(uint64_t a1)
{
  return [*(id *)(a1 + 32) startPeriodicSummaryTask:*(void *)(a1 + 40)];
}

+ (void)unregisterCloudKitUploadActivities
{
  uint64_t v2 = uploadLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEFAULT, "Unregistering periodic CloudKit upload activity", buf, 2u);
  }

  xpc_activity_unregister("com.apple.autobugcapture.logupload.discretionary");
  id v3 = summaryLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Unregistering CloudKit submission activity", v4, 2u);
  }

  xpc_activity_unregister("com.apple.autobugcapture.caseSummary.discretionary");
}

- (void)uploadMostRecentCases:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = uploadLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v9 = a3;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "received request to upload recent %ld cases", buf, 0xCu);
  }

  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CloudKitUploadController_uploadMostRecentCases___block_invoke;
  v7[3] = &unk_263FC3158;
  v7[4] = self;
  void v7[5] = a3;
  dispatch_async(queue, v7);
}

uint64_t __50__CloudKitUploadController_uploadMostRecentCases___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUploadForRecentCases:*(void *)(a1 + 40)];
}

- (void)uploadCasesWithIdentifiers:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = uploadLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v4;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "received request to upload cases: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__CloudKitUploadController_uploadCasesWithIdentifiers___block_invoke;
  v8[3] = &unk_263FC3430;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __55__CloudKitUploadController_uploadCasesWithIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUploadForCaseIdentifiers:*(void *)(a1 + 40)];
}

- (void)uploadDecisionWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = uploadLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEBUG, "received request to request upload decision for cases: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CloudKitUploadController_uploadDecisionWithIdentifiers_reply___block_invoke;
  block[3] = &unk_263FC2F28;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __64__CloudKitUploadController_uploadDecisionWithIdentifiers_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performUploadDecisionForCaseIdentifiers:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)submitCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = uploadLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: received request to submit cases: %@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CloudKitUploadController_submitCaseSummariesWithIdentifiers_reply___block_invoke;
  block[3] = &unk_263FC2F28;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(queue, block);
}

uint64_t __69__CloudKitUploadController_submitCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSubmissionOfCaseSummariesWithIdentifiers:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)submitRecentCaseSummaries:(unint64_t)a3 reply:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = uploadLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 134217984;
    unint64_t v14 = a3;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "DiagnosticCaseSummaryLog: received request to submit recent %ld cases", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CloudKitUploadController_submitRecentCaseSummaries_reply___block_invoke;
  block[3] = &unk_263FC5308;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(queue, block);
}

uint64_t __60__CloudKitUploadController_submitRecentCaseSummaries_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSubmissionOfRecentCaseSummaries:*(void *)(a1 + 48) reply:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRecordAnalytics, 0);
  objc_storeStrong((id *)&self->_caseSummaryAnalytics, 0);
  objc_storeStrong((id *)&self->_caseStorageAnalytics, 0);
  objc_storeStrong((id *)&self->_workspace, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end