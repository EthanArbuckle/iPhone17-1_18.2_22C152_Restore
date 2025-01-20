@interface CPLCloudKitUploadBatchTask
+ (NSArray)simulateOverQuotaPhases;
- (CPLChangeBatch)batch;
- (CPLCloudKitUploadBatchTask)initWithController:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (CPLRecordTargetMapping)targetMapping;
- (NSDate)cplEnabledDate;
- (double)approximativeResourcesUploadRate;
- (void)_executeSharePlanFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_executeUnsharePlanFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_fetchPrivateRecordsFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_fetchRequestedRecordsFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_fetchSharedRecordsFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_runModernOperationsWithCurrentUserID:(id)a3;
- (void)_uploadBatchFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)_uploadRecords:(id)a3 deleteRecordIDs:(id)a4 identification:(id)a5 fromPlanner:(id)a6 uploadContext:(id)a7 updateProgress:(id)a8 completionHandler:(id)a9;
- (void)_uploadSharedBatchFromPlanner:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
- (void)setBatch:(id)a3;
- (void)setCplEnabledDate:(id)a3;
- (void)setSharedScope:(id)a3;
@end

@implementation CPLCloudKitUploadBatchTask

+ (NSArray)simulateOverQuotaPhases
{
  v4[0] = @"none";
  v4[1] = @"upload";
  v4[2] = @"sharedUpload";
  v4[3] = @"share";
  v4[4] = @"unshare";
  v2 = +[NSArray arrayWithObjects:v4 count:5];
  return (NSArray *)v2;
}

- (CPLCloudKitUploadBatchTask)initWithController:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v54 = a4;
  id v55 = a5;
  id v56 = a6;
  id v58 = a7;
  id v57 = a8;
  v71.receiver = self;
  v71.super_class = (Class)CPLCloudKitUploadBatchTask;
  v15 = [(CPLCloudKitTransportTask *)&v71 initWithController:v14];
  v16 = v15;
  if (!v15) {
    goto LABEL_55;
  }
  objc_storeStrong((id *)&v15->_scope, a4);
  objc_storeStrong((id *)&v16->_targetMapping, a5);
  if (qword_1002CEA70 != -1) {
    dispatch_once(&qword_1002CEA70, &stru_10027A158);
  }
  if (byte_1002CEA68)
  {
    v52 = +[NSUserDefaults standardUserDefaults];
    v53 = [v52 arrayForKey:@"CPLForceRejectClasses"];
    if (v53)
    {
      v17 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v53, "count"));
      autoRejectClasses = v16->_autoRejectClasses;
      v16->_autoRejectClasses = v17;

      long long v69 = 0u;
      long long v70 = 0u;
      long long v68 = 0u;
      long long v67 = 0u;
      id v19 = v53;
      id v20 = [v19 countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v68;
LABEL_8:
        uint64_t v22 = 0;
        while (1)
        {
          if (*(void *)v68 != v21) {
            objc_enumerationMutation(v19);
          }
          v23 = *(NSString **)(*((void *)&v67 + 1) + 8 * v22);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            Class v24 = NSClassFromString(v23);
            if (v24)
            {
              [(NSMutableSet *)v16->_autoRejectClasses addObject:v24];
            }
            else
            {
              uint64_t v27 = +[CPLErrors incorrectParametersErrorForParameter:v23];
              autoError = v16->_autoError;
              v16->_autoError = (NSError *)v27;
            }
          }
          else
          {
            uint64_t v25 = +[CPLErrors incorrectParametersErrorForParameter:@"CPLForceRejectClasses"];
            v26 = v16->_autoError;
            v16->_autoError = (NSError *)v25;
          }
          if (v16->_autoError) {
            break;
          }
          if (v20 == (id)++v22)
          {
            id v20 = [v19 countByEnumeratingWithState:&v67 objects:v73 count:16];
            if (v20) {
              goto LABEL_8;
            }
            break;
          }
        }
      }
    }
    if (!v16->_autoError)
    {
      v51 = [v52 arrayForKey:@"CPLForceRejectIdentifiers"];
      if (v51)
      {
        v29 = (NSMutableSet *)objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(v51, "count"));
        autoRejectRecordIdentifiers = v16->_autoRejectRecordIdentifiers;
        v16->_autoRejectRecordIdentifiers = v29;

        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v31 = v51;
        id v32 = [v31 countByEnumeratingWithState:&v63 objects:v72 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v64;
LABEL_24:
          uint64_t v34 = 0;
          while (1)
          {
            if (*(void *)v64 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v35 = *(void *)(*((void *)&v63 + 1) + 8 * v34);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [(NSMutableSet *)v16->_autoRejectRecordIdentifiers addObject:v35];
            }
            else
            {
              uint64_t v36 = +[CPLErrors incorrectParametersErrorForParameter:@"CPLForceRejectIdentifiers"];
              v37 = v16->_autoError;
              v16->_autoError = (NSError *)v36;
            }
            if (v16->_autoError) {
              break;
            }
            if (v32 == (id)++v34)
            {
              id v32 = [v31 countByEnumeratingWithState:&v63 objects:v72 count:16];
              if (v32) {
                goto LABEL_24;
              }
              break;
            }
          }
        }
      }
    }
  }
  if (byte_1002CEA69)
  {
    v38 = +[NSUserDefaults standardUserDefaults];
    v39 = [v38 objectForKey:@"CPLSimulateOverQuotaPhase"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v40 = [v39 lowercaseString];

      if ([v40 isEqualToString:@"none"])
      {
        uint64_t v41 = 0;
LABEL_49:
        v16->_simulateOverQuotaPhase = v41;
        goto LABEL_50;
      }
      if ([v40 isEqualToString:@"upload"])
      {
        uint64_t v41 = 1;
        goto LABEL_49;
      }
      if ([v40 isEqualToString:@"sharedupload"])
      {
        uint64_t v41 = 2;
        goto LABEL_49;
      }
      if ([v40 isEqualToString:@"share"])
      {
        uint64_t v41 = 3;
        goto LABEL_49;
      }
      if ([v40 isEqualToString:@"unshare"])
      {
        uint64_t v41 = 4;
        goto LABEL_49;
      }
    }
    else
    {
      v40 = v39;
    }
LABEL_50:
  }
  id v42 = objc_msgSend(v58, "copy", v51);
  id progressHandler = v16->_progressHandler;
  v16->_id progressHandler = v42;

  v44 = +[NSUserDefaults standardUserDefaults];
  unsigned int v45 = [v44 BOOLForKey:@"CPLRejectOnUploadError"];

  if (v45)
  {
    objc_initWeak(&location, v16);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_1000A2AD8;
    v59[3] = &unk_100277DF0;
    objc_copyWeak(&v61, &location);
    id v60 = v57;
    id v46 = [v59 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v46;

    objc_destroyWeak(&v61);
    objc_destroyWeak(&location);
  }
  else
  {
    id v48 = [v57 copy];
    id v49 = v16->_completionHandler;
    v16->_id completionHandler = v48;
  }
  [(CPLCloudKitTransportTask *)v16 setIsUpload:1];
  [(CPLCloudKitTransportTask *)v16 setTransportScopeMapping:v56];
LABEL_55:

  return v16;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000A2E78;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (void)_runModernOperationsWithCurrentUserID:(id)a3
{
  id v75 = a3;
  id v96 = 0;
  v77 = self;
  LOBYTE(self) = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v96];
  id v74 = v96;
  if ((self & 1) == 0 || v77->_autoError)
  {
    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_4;
  }
  v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"CPLRejectAllUploads"];

  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[CPLChangeBatch count](v77->_batch, "count"));
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    v7 = v77->_batch;
    id v8 = [(CPLChangeBatch *)v7 countByEnumeratingWithState:&v92 objects:v107 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v93;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v93 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = [*(id *)(*((void *)&v92 + 1) + 8 * i) scopedIdentifier];
          [v6 setObject:@"record is rejected for testing purpose" forKeyedSubscript:v11];
        }
        id v8 = [(CPLChangeBatch *)v7 countByEnumeratingWithState:&v92 objects:v107 count:16];
      }
      while (v8);
    }

    uint64_t v105 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    id v106 = v6;
    v12 = +[NSDictionary dictionaryWithObjects:&v106 forKeys:&v105 count:1];
    v13 = +[CPLErrors cplErrorWithCode:18 underlyingError:0 userInfo:v12 description:@"Some records are rejected for testing purpose"];

    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_4;
  }
  id v14 = +[NSUserDefaults standardUserDefaults];
  id v15 = [v14 integerForKey:@"CPLSimulateBusyState"];

  if (v15)
  {
    uint64_t v103 = CPLErrorScopeBusyKey;
    v16 = +[NSNumber numberWithInteger:v15];
    v104 = v16;
    v17 = +[NSDictionary dictionaryWithObjects:&v104 forKeys:&v103 count:1];
    v18 = +[CPLScopeChange descriptionForBusyState:v15];
    id v19 = +[CPLErrors cplErrorWithCode:35, 0, v17, @"Simulating busy state (%@)", v18 underlyingError userInfo description];

    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_4;
  }
  id v20 = [(CPLEngineScope *)v77->_scope scopeIdentifier];
  v73 = [(CPLCloudKitTransportTask *)v77 cloudKitScopeForScopeIdentifier:v20];

  uint64_t v21 = [v73 zoneID];
  LODWORD(v20) = v21 == 0;

  if (v20)
  {
    id completionHandler = (void (**)(id, void *))v77->_completionHandler;
    v72 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
    completionHandler[2](completionHandler, v72);
    goto LABEL_67;
  }
  uint64_t v22 = v77;
  sharedScope = v77->_sharedScope;
  if (sharedScope)
  {
    Class v24 = [(CPLEngineScope *)sharedScope scopeIdentifier];
    v72 = [(CPLCloudKitTransportTask *)v77 cloudKitScopeForScopeIdentifier:v24];

    uint64_t v25 = [v72 zoneID];
    LODWORD(v24) = v25 == 0;

    if (v24)
    {
      long long v64 = (void (**)(id, void *))v77->_completionHandler;
      long long v65 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required shared zone"];
      v64[2](v64, v65);

      goto LABEL_67;
    }
    uint64_t v22 = v77;
  }
  else
  {
    v72 = 0;
  }
  if (!v22->_autoRejectRecordIdentifiers && !v22->_autoRejectClasses) {
    goto LABEL_43;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v27 = v22->_batch;
  id v28 = [(CPLChangeBatch *)v27 countByEnumeratingWithState:&v88 objects:v102 count:16];
  if (!v28)
  {

    uint64_t v22 = v77;
    goto LABEL_43;
  }
  id v29 = 0;
  uint64_t v30 = *(void *)v89;
  do
  {
    for (j = 0; j != v28; j = (char *)j + 1)
    {
      if (*(void *)v89 != v30) {
        objc_enumerationMutation(v27);
      }
      id v32 = *(void **)(*((void *)&v88 + 1) + 8 * (void)j);
      if ([(NSMutableSet *)v77->_autoRejectClasses containsObject:objc_opt_class()])
      {
        if (!v29) {
          id v29 = objc_alloc_init((Class)NSMutableDictionary);
        }
        uint64_t v33 = [v32 scopedIdentifier];
        [v29 setObject:@"record class is rejected for testing purpose" forKeyedSubscript:v33];
      }
      else
      {
        autoRejectRecordIdentifiers = v77->_autoRejectRecordIdentifiers;
        uint64_t v35 = [v32 scopedIdentifier];
        uint64_t v36 = [v35 identifier];
        LODWORD(autoRejectRecordIdentifiers) = [(NSMutableSet *)autoRejectRecordIdentifiers containsObject:v36];

        if (!autoRejectRecordIdentifiers) {
          continue;
        }
        if (!v29) {
          id v29 = objc_alloc_init((Class)NSMutableDictionary);
        }
        uint64_t v33 = [v32 scopedIdentifier];
        [v29 setObject:@"record is rejected for testing purpose" forKeyedSubscript:v33];
      }
    }
    id v28 = [(CPLChangeBatch *)v27 countByEnumeratingWithState:&v88 objects:v102 count:16];
  }
  while (v28);

  uint64_t v22 = v77;
  if (v29)
  {
    uint64_t v100 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    id v101 = v29;
    v37 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    v38 = +[CPLErrors cplErrorWithCode:18 underlyingError:0 userInfo:v37 description:@"Some records are rejected for testing purpose"];

    (*((void (**)(void))v77->_completionHandler + 2))();
    goto LABEL_67;
  }
LABEL_43:
  v39 = [(CPLCloudKitTransportTask *)v22 controller];
  long long v70 = [v39 zoneIdentificationForCloudKitScope:v73 engineScope:v77->_scope];

  if (v72 && v77->_sharedScope)
  {
    v40 = [(CPLCloudKitTransportTask *)v77 controller];
    long long v69 = [v40 zoneIdentificationForCloudKitScope:v72 engineScope:v77->_sharedScope];
  }
  else
  {
    long long v69 = 0;
  }
  objc_super v71 = objc_alloc_init(CPLCloudKitUploadMetric);
  uint64_t v41 = [CPLCKBatchUploadPlanner alloc];
  id v42 = [(CPLCloudKitTransportTask *)v77 controller];
  v43 = [v42 propertyMapping];
  targetMapping = v77->_targetMapping;
  unsigned int v45 = [(CPLCloudKitTransportTask *)v77 fetchCache];
  id v46 = [(CPLCloudKitUploadBatchTask *)v77 cplEnabledDate];
  v76 = [(CPLCKBatchUploadPlanner *)v41 initWithScopeProvider:v77 destinationZoneIdentification:v70 sharedZoneIdentification:v69 propertyMapping:v43 currentUserRecordID:v75 targetMapping:targetMapping fetchCache:v45 cplEnabledDate:v46];

  [(CPLCKBatchUploadPlanner *)v76 setMetric:v71];
  [(CPLCKBatchUploadPlanner *)v76 setProgressHandler:v77->_progressHandler];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v47 = v77->_batch;
  id v48 = 0;
  id v49 = [(CPLChangeBatch *)v47 countByEnumeratingWithState:&v84 objects:v99 count:16];
  if (v49)
  {
    uint64_t v50 = *(void *)v85;
    do
    {
      for (k = 0; k != v49; k = (char *)k + 1)
      {
        if (*(void *)v85 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v84 + 1) + 8 * (void)k);
        id v83 = 0;
        unsigned __int8 v54 = [(CPLCKBatchUploadPlanner *)v76 planRecordChangeUpload:v52 error:&v83];
        id v55 = v83;
        id v56 = v55;
        if ((v54 & 1) == 0)
        {
          id v57 = [v55 localizedDescription];
          id v58 = v57;
          id v59 = v57
              ? v57
              : [objc_alloc((Class)NSString) initWithFormat:@"Failed to create CKRecord from %@", objc_opt_class()];
          id v60 = v59;

          if (v60)
          {
            if (!v48) {
              id v48 = objc_alloc_init((Class)NSMutableDictionary);
            }
            id v61 = [v52 scopedIdentifier];
            [v48 setObject:v60 forKeyedSubscript:v61];
          }
        }
      }
      id v49 = [(CPLChangeBatch *)v47 countByEnumeratingWithState:&v84 objects:v99 count:16];
    }
    while (v49);
  }

  if ([v48 count])
  {
    uint64_t v97 = CPLErrorRejectedRecordIdentifiersAndReasonsKey;
    id v98 = v48;
    v62 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
    id v63 = +[CPLErrors cplErrorWithCode:18 underlyingError:0 userInfo:v62 description:@"Some records were rejected before upload"];

    (*((void (**)(void))v77->_completionHandler + 2))();
  }
  else
  {
    [(CPLCKBatchUploadPlanner *)v76 finalizePlan];
    id v66 = objc_retainBlock(v77->_completionHandler);
    [(CPLCloudKitTransportTask *)v77 associateMetric:v71];
    [(CPLCloudKitMetric *)v71 begin];
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_1000A3AF0;
    v78[3] = &unk_1002784D8;
    id v82 = v66;
    long long v67 = v76;
    v79 = v67;
    v80 = v71;
    v81 = v77;
    id v63 = v66;
    long long v68 = objc_retainBlock(v78);
    [(CPLCloudKitUploadBatchTask *)v77 _fetchRequestedRecordsFromPlanner:v67 completionHandler:v68];
  }
LABEL_67:

LABEL_4:
}

- (void)_fetchRequestedRecordsFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 recordRequestor];
  if ([v8 needsRequestedRecords])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000A3CC0;
    v9[3] = &unk_100279480;
    id v11 = v7;
    v9[4] = self;
    id v10 = v6;
    [v8 fetchRequestedRecordsForTransportTask:self completionHandler:v9];
  }
  else
  {
    [(CPLCloudKitUploadBatchTask *)self _fetchSharedRecordsFromPlanner:v6 completionHandler:v7];
  }
}

- (void)_fetchSharedRecordsFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 requestedSharedCKRecordIDs];
  if ([v9 count])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000A2DB8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will fetch %@ before upload", buf, 0xCu);
      }
    }
    id v11 = [v7 sharedZoneIdentification];

    if (!v11) {
      sub_1001CE21C((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
    }
    v12 = [v7 sharedZoneIdentification];
    id v13 = [v12 operationType];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A3EB8;
    v14[3] = &unk_10027A1A8;
    id v17 = v8;
    id v15 = v7;
    v16 = self;
    [(CPLCloudKitTransportTask *)self fetchRecordsFollowRemappingWithIDs:v9 wantsAllRecords:1 type:v13 completionHandler:v14];
  }
  else
  {
    [(CPLCloudKitUploadBatchTask *)self _uploadBatchFromPlanner:v7 completionHandler:v8];
  }
}

- (void)_fetchPrivateRecordsFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 requestedPrivateCKRecordIDs];
  if ([v9 count])
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000A2DB8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will fetch %@ before upload", buf, 0xCu);
      }
    }
    id v11 = [v7 sharedZoneIdentification];

    if (!v11) {
      sub_1001CE304((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
    }
    v12 = [v7 destinationZoneIdentification];
    id v13 = [v12 operationType];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000A43C4;
    v14[3] = &unk_10027A1A8;
    id v17 = v8;
    id v15 = v7;
    v16 = self;
    [(CPLCloudKitTransportTask *)self fetchRecordsFollowRemappingWithIDs:v9 wantsAllRecords:1 type:v13 completionHandler:v14];
  }
  else
  {
    [(CPLCloudKitUploadBatchTask *)self _uploadSharedBatchFromPlanner:v7 completionHandler:v8];
  }
}

- (void)_uploadRecords:(id)a3 deleteRecordIDs:(id)a4 identification:(id)a5 fromPlanner:(id)a6 uploadContext:(id)a7 updateProgress:(id)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v36 = a7;
  id v20 = a8;
  id v21 = a9;
  v52[0] = 0;
  LOBYTE(a8) = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:v52];
  id v22 = v52[0];
  if (a8)
  {
    if ([v16 count] || objc_msgSend(v17, "count"))
    {
      uint64_t v35 = v18;
      id v23 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v16 recordIDsToDelete:v17];
      [v23 setSavePolicy:0];
      [(CPLCloudKitTransportTask *)self fetchCache];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1000A4A8C;
      v48[3] = &unk_10027A1D0;
      v48[4] = self;
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      id v49 = v24;
      id v33 = v22;
      id v25 = v19;
      id v26 = v36;
      id v50 = v26;
      uint64_t v34 = v16;
      id v27 = v20;
      id v28 = v20;
      id v51 = v28;
      [v23 setPerRecordSaveBlock:v48];
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1000A4D9C;
      v46[3] = &unk_1002779A0;
      v46[4] = self;
      id v47 = v24;
      id v32 = v24;
      [v23 setPerRecordDeleteBlock:v46];
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_1000A4E58;
      v43[3] = &unk_10027A1F8;
      v43[4] = self;
      id v29 = v26;
      id v19 = v25;
      id v22 = v33;
      id v30 = v29;
      id v44 = v29;
      id v31 = v28;
      id v20 = v27;
      id v16 = v34;
      id v45 = v31;
      [v23 setPerRecordProgressBlock:v43];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000A5020;
      v37[3] = &unk_10027A270;
      v37[4] = self;
      id v38 = v34;
      id v39 = v17;
      id v40 = v19;
      SEL v42 = a2;
      id v41 = v21;
      [v23 setModifyRecordsCompletionBlock:v37];
      -[CPLCloudKitTransportTask launchOperation:type:withContext:](self, "launchOperation:type:withContext:", v23, [v35 operationType], v30);

      id v18 = v35;
    }
    else
    {
      (*((void (**)(id, void))v21 + 2))(v21, 0);
    }
  }
  else
  {
    (*((void (**)(id, id))v21 + 2))(v21, v22);
  }
}

- (void)_uploadBatchFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 ckRecordsToUpload];
  if ([v8 count] && self->_simulateOverQuotaPhase == 1)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A593C;
    v20[3] = &unk_100275DF8;
    id v21 = v7;
    id v9 = v7;
    [(CPLCloudKitTransportTask *)self dispatchAsync:v20];
    id v10 = v21;
  }
  else
  {
    id v9 = [v6 ckRecordIDsToDelete];
    id v10 = [v6 willUploadRecords];
    id v11 = [v6 destinationZoneIdentification];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A5B00;
    v17[3] = &unk_10027A298;
    id v18 = v6;
    id v19 = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A5B48;
    v13[3] = &unk_10027A2C0;
    id v15 = self;
    id v16 = v7;
    id v14 = v18;
    id v12 = v7;
    [(CPLCloudKitUploadBatchTask *)self _uploadRecords:v8 deleteRecordIDs:v9 identification:v11 fromPlanner:v14 uploadContext:v10 updateProgress:v17 completionHandler:v13];
  }
}

- (void)_uploadSharedBatchFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sharedCKRecordsToUpload];
  if ([v8 count] && self->_simulateOverQuotaPhase == 2)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000A5DE0;
    v20[3] = &unk_100275DF8;
    id v21 = v7;
    id v9 = v7;
    [(CPLCloudKitTransportTask *)self dispatchAsync:v20];
    id v10 = v21;
  }
  else
  {
    id v9 = [v6 sharedCKRecordIDsToDelete];
    id v10 = [v6 willUploadSharedRecords];
    id v11 = [v6 sharedZoneIdentification];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000A5E40;
    v17[3] = &unk_10027A298;
    id v18 = v6;
    id v19 = self;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A5E88;
    v13[3] = &unk_10027A2C0;
    id v15 = self;
    id v16 = v7;
    id v14 = v18;
    id v12 = v7;
    [(CPLCloudKitUploadBatchTask *)self _uploadRecords:v8 deleteRecordIDs:v9 identification:v11 fromPlanner:v14 uploadContext:v10 updateProgress:v17 completionHandler:v13];
  }
}

- (void)_executeSharePlanFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 sharePlan];
  if ([v8 count])
  {
    if (self->_simulateOverQuotaPhase == 3)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000A611C;
      v19[3] = &unk_100275DF8;
      id v20 = v7;
      [(CPLCloudKitTransportTask *)self dispatchAsync:v19];
      id v9 = v20;
    }
    else
    {
      [v8 willUploadRecords];
      id v10 = [v8 ckRecordIDsToShare];
      id v11 = [v6 destinationZoneIdentification];
      id v15 = [v11 operationType];
      id v12 = [v8 sharedCKRecordIDs];
      id v13 = [v6 sharedZoneIdentification];
      id v14 = [v13 operationType];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000A617C;
      v16[3] = &unk_10027A2E8;
      id v18 = v7;
      id v17 = v8;
      [(CPLCloudKitTransportTask *)self moveRecordsWithIDs:v10 followRemapping:1 sourceType:v15 destinationRecordIDs:v12 destinationType:v14 helper:v17 completionHandler:v16];

      id v9 = v18;
    }
  }
  else
  {
    [(CPLCloudKitUploadBatchTask *)self _executeUnsharePlanFromPlanner:v6 completionHandler:v7];
  }
}

- (void)_executeUnsharePlanFromPlanner:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 unsharePlan];
  if ([v8 count])
  {
    if (self->_simulateOverQuotaPhase == 4)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000A6428;
      v19[3] = &unk_100275DF8;
      id v20 = v7;
      [(CPLCloudKitTransportTask *)self dispatchAsync:v19];
      id v9 = v20;
    }
    else
    {
      [v8 willUploadRecords];
      id v10 = [v8 ckRecordIDsToUnshare];
      id v11 = [v6 sharedZoneIdentification];
      id v15 = [v11 operationType];
      id v12 = [v8 privateRecordIDs];
      id v13 = [v6 destinationZoneIdentification];
      id v14 = [v13 operationType];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1000A6488;
      v16[3] = &unk_10027A2E8;
      id v18 = v7;
      id v17 = v8;
      [(CPLCloudKitTransportTask *)self moveRecordsWithIDs:v10 followRemapping:1 sourceType:v15 destinationRecordIDs:v12 destinationType:v14 helper:v17 completionHandler:v16];

      id v9 = v18;
    }
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (double)approximativeResourcesUploadRate
{
  return self->_approximativeResourcesUploadRate;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (void)setSharedScope:(id)a3
{
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLChangeBatch)batch
{
  return self->_batch;
}

- (void)setBatch:(id)a3
{
}

- (NSDate)cplEnabledDate
{
  return self->_cplEnabledDate;
}

- (void)setCplEnabledDate:(id)a3
{
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_cplEnabledDate, 0);
  objc_storeStrong((id *)&self->_batch, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_autoError, 0);
  objc_storeStrong((id *)&self->_autoRejectRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_autoRejectClasses, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end