@interface CPLCloudKitCleanupStagedScopeTask
- (BOOL)isAuxiliaryOperationResultRelevant;
- (BOOL)shouldLaunchAuxiliaryOperation;
- (CKOperation)auxiliaryOperation;
- (CKOperation)mainOperation;
- (CPLCloudKitCleanupStagedScopeTask)initWithController:(id)a3 stagedScope:(id)a4 stagingScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)destinationScope;
- (CPLEngineScope)stagedScope;
- (CPLEngineScope)stagingScope;
- (NSDate)dateSinceLastAuxiliaryOperation;
- (id)auxiliaryOperationDidFinishWithError:(id)a3;
- (id)operationDidFinish:(id)a3 error:(id)a4;
- (id)operationDidFinishWithError:(id)a3;
- (void)_fetchAndMoveNextBatchWithUserRecordID:(id)a3;
- (void)_moveBatchRecordWithNames:(id)a3 userRecordID:(id)a4 operationID:(id)a5 moveBatchID:(id)a6 hasMore:(BOOL)a7;
- (void)_sendExitFeedbackWithSourceRecordIDs:(id)a3 destinationRecordIDs:(id)a4 moveError:(id)a5 operationID:(id)a6 moveBatchID:(id)a7;
- (void)dispatchAsync:(id)a3;
- (void)launchAuxiliaryOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5;
- (void)runAuxiliaryOperation;
- (void)runOperations;
- (void)updateContextWithBlock:(id)a3;
- (void)updateOneBatch;
- (void)updateProgress:(double)a3;
@end

@implementation CPLCloudKitCleanupStagedScopeTask

- (CPLCloudKitCleanupStagedScopeTask)initWithController:(id)a3 stagedScope:(id)a4 stagingScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)CPLCloudKitCleanupStagedScopeTask;
  v21 = [(CPLCloudKitTransportTask *)&v32 initWithController:a3];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_stagedScope, a4);
    objc_storeStrong((id *)&v22->_stagingScope, a5);
    objc_storeStrong((id *)&v22->_destinationScope, a6);
    [(CPLCloudKitTransportTask *)v22 setTransportScopeMapping:v18];
    id v23 = [v19 copy];
    id progressHandler = v22->_progressHandler;
    v22->_id progressHandler = v23;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000BBD84;
    v29[3] = &unk_10027A928;
    id v30 = v19;
    id v31 = v20;
    id v25 = [v29 copy];
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v25;
  }
  return v22;
}

- (void)_sendExitFeedbackWithSourceRecordIDs:(id)a3 destinationRecordIDs:(id)a4 moveError:(id)a5 operationID:(id)a6 moveBatchID:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v28 = [CPLCloudKitSendSharedLibraryExitFeedbackTask alloc];
  id v17 = [(CPLCloudKitTransportTask *)self controller];
  id v18 = [(CPLCloudKitScope *)self->_stagingCloudKitScope zoneID];
  destinationCloudKitScope = self->_destinationCloudKitScope;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000BC06C;
  v31[3] = &unk_10027A950;
  id v32 = v13;
  id v33 = v12;
  id v20 = v12;
  id v21 = v13;
  v22 = [(CPLCloudKitSendSharedLibraryExitFeedbackTask *)v28 initWithController:v17 sourceRecordIDs:v16 destinationRecordIDs:v15 moveError:v14 operationID:v20 moveBatchID:v21 exitZoneID:v18 scope:destinationCloudKitScope completionHandler:v31];

  id v23 = [(CPLCloudKitTransportTask *)self transportGroup];
  [(CPLCloudKitTransportTask *)v22 setTransportGroup:v23];

  v24 = dispatch_get_global_queue(0, 0);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000BC1F0;
  v29[3] = &unk_100275EA0;
  id v30 = v22;
  id v25 = v29;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BE144;
  block[3] = &unk_100275DF8;
  id v35 = v25;
  v26 = v22;
  dispatch_block_t v27 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v24, v27);
}

- (void)_moveBatchRecordWithNames:(id)a3 userRecordID:(id)a4 operationID:(id)a5 moveBatchID:(id)a6 hasMore:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v33 = a5;
  id v31 = a6;
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  id v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  id v32 = v12;
  id v35 = [[CPLCloudKitMoveBackCopyHelper alloc] initWithUserRecordID:v12 scopeProvider:self];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v15 = v11;
  id v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        id v21 = [(CPLCloudKitScope *)self->_stagingCloudKitScope recordIDWithRecordName:v20];
        [v13 addObject:v21];
        v22 = [(CPLCloudKitScope *)self->_destinationCloudKitScope recordIDWithRecordName:v20];
        [v14 addObject:v22];
      }
      id v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v17);
  }
  id v30 = v15;

  uint64_t v23 = CPLCloudKitOperationTypeForScope(self->_stagingCloudKitScope);
  uint64_t v24 = CPLCloudKitOperationTypeForScope(self->_destinationCloudKitScope);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000BC504;
  v36[3] = &unk_10027A978;
  id v37 = v13;
  id v38 = v14;
  v39 = self;
  id v40 = v33;
  BOOL v43 = a7;
  id v41 = v31;
  id v42 = v32;
  id v25 = v32;
  id v26 = v31;
  id v27 = v33;
  id v28 = v14;
  id v29 = v13;
  [(CPLCloudKitTransportTask *)self moveRecordsWithIDs:v29 followRemapping:0 sourceType:v23 destinationRecordIDs:v28 destinationType:v24 helper:v35 completionHandler:v36];
}

- (void)_fetchAndMoveNextBatchWithUserRecordID:(id)a3
{
  id v4 = a3;
  id v12 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v12];
  id v6 = v12;
  if (v5)
  {
    v7 = [(CPLCloudKitScope *)self->_stagingCloudKitScope zoneID];
    int64_t batchSize = self->_batchSize;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000BC838;
    v10[3] = &unk_10027A9A0;
    v10[4] = self;
    id v11 = v4;
    v9 = +[CPLCKPhotosSharedLibraryOperation getNextBatchToMoveOperationWithZoneID:v7 batchSize:batchSize completionHandler:v10];

    [(CPLCloudKitTransportTask *)self launchOperation:v9 type:CPLCloudKitOperationTypeForScope(self->_stagingCloudKitScope) withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runAuxiliaryOperation
{
  if (!self->_mainOperation) {
    sub_1001CEC48();
  }
  v3 = [(CPLCloudKitZoneIdentification *)self->_stagingZoneIdentification libraryInfoRecordName];
  if (v3)
  {
    id v4 = [(CPLCloudKitZoneIdentification *)self->_stagingZoneIdentification recordIDWithRecordName:v3];
    id v5 = objc_alloc((Class)CKFetchRecordsOperation);
    id v17 = v4;
    id v6 = +[NSArray arrayWithObjects:&v17 count:1];
    id v7 = [v5 initWithRecordIDs:v6];

    [v7 setShouldFetchAssetContent:0];
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    id v13 = sub_1000BCDCC;
    id v14 = &unk_100278E38;
    id v15 = self;
    id v16 = v4;
    id v8 = v4;
    [v7 setFetchRecordsCompletionBlock:&v11];
    [(CPLCloudKitCleanupStagedScopeTask *)self launchAuxiliaryOperation:v7 type:[(CPLCloudKitZoneIdentification *)self->_stagingZoneIdentification operationType] withContext:0];
  }
  else
  {
    v9 = +[NSDate date];
    dateSinceLastAuxiliaryOperation = self->_dateSinceLastAuxiliaryOperation;
    self->_dateSinceLastAuxiliaryOperation = v9;
  }
}

- (void)runOperations
{
  self->_int64_t batchSize = 100;
  v3 = +[NSUserDefaults standardUserDefaults];
  int64_t v4 = (int64_t)[v3 integerForKey:@"CPLCleanupStagedScopeBatchSize"];

  if (v4 >= 1)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_1000BC19C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using batch size: %ld", buf, 0xCu);
      }
    }
    self->_int64_t batchSize = v4;
  }
  id v6 = [(CPLEngineScope *)self->_stagingScope scopeIdentifier];
  id v7 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v6];
  stagingCloudKitScope = self->_stagingCloudKitScope;
  self->_stagingCloudKitScope = v7;

  if (self->_stagingCloudKitScope)
  {
    v9 = [(CPLEngineScope *)self->_destinationScope scopeIdentifier];
    v10 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v9];
    destinationCloudKitScope = self->_destinationCloudKitScope;
    self->_destinationCloudKitScope = v10;

    if (self->_destinationCloudKitScope)
    {
      uint64_t v12 = [(CPLCloudKitTransportTask *)self controller];
      id v13 = [v12 zoneIdentificationForCloudKitScope:self->_stagingCloudKitScope engineScope:self->_stagingScope];
      stagingZoneIdentification = self->_stagingZoneIdentification;
      self->_stagingZoneIdentification = v13;

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000BD308;
      v19[3] = &unk_100277DA8;
      v19[4] = self;
      [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v19];
      return;
    }
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    destinationScope = self->_destinationScope;
  }
  else
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    destinationScope = self->_stagingScope;
  }
  id v17 = [(CPLEngineScope *)destinationScope scopeIdentifier];
  uint64_t v18 = +[CPLErrors cplErrorWithCode:32, @"Missing transport scope for %@", v17 description];
  completionHandler[2](completionHandler, v18);
}

- (void)dispatchAsync:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BD3E0;
  v5[3] = &unk_100276210;
  id v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)CPLCloudKitCleanupStagedScopeTask;
  id v3 = v7;
  [(CPLCloudKitTransportTask *)&v4 dispatchAsync:v5];
}

- (id)operationDidFinish:(id)a3 error:(id)a4
{
  id v6 = (CKOperation *)a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLCloudKitCleanupStagedScopeTask;
  id v7 = [(CPLCloudKitTransportTask *)&v9 operationDidFinish:v6 error:a4];
  if (self->_mainOperation == v6)
  {
    self->_mainOperation = 0;
  }
  return v7;
}

- (void)updateOneBatch
{
  if (self->_mainOperation)
  {
    -[CPLCloudKitTransportTask updateOneBatchForOperation:](self, "updateOneBatchForOperation:");
  }
  else
  {
    v2 = (CPLCloudKitCleanupStagedScopeTask *)sub_1001CEE08(a2, self);
    [(CPLCloudKitCleanupStagedScopeTask *)v2 updateContextWithBlock:v4];
  }
}

- (void)updateContextWithBlock:(id)a3
{
  id v5 = a3;
  if (self->_mainOperation)
  {
    id v9 = v5;
    -[CPLCloudKitTransportTask updateContextWithBlock:forOperation:](self, "updateContextWithBlock:forOperation:", v5);
  }
  else
  {
    id v6 = (CPLCloudKitCleanupStagedScopeTask *)sub_1001CEF04(a2, self);
    [(CPLCloudKitCleanupStagedScopeTask *)v6 updateProgress:v8];
  }
}

- (void)updateProgress:(double)a3
{
  if (self->_mainOperation)
  {
    -[CPLCloudKitTransportTask updateProgress:forOperation:](self, "updateProgress:forOperation:", a3);
  }
  else
  {
    SEL v3 = (CPLCloudKitCleanupStagedScopeTask *)sub_1001CF000(a2, self, a3);
    [(CPLCloudKitCleanupStagedScopeTask *)v3 operationDidFinishWithError:v5];
  }
}

- (id)operationDidFinishWithError:(id)a3
{
  id v5 = a3;
  mainOperation = self->_mainOperation;
  if (mainOperation)
  {
    SEL v7 = v5;
    double v8 = [(CPLCloudKitCleanupStagedScopeTask *)self operationDidFinish:mainOperation error:v5];

    return v8;
  }
  else
  {
    v10 = (CPLCloudKitCleanupStagedScopeTask *)sub_1001CF0FC(a2, self);
    [(CPLCloudKitCleanupStagedScopeTask *)v10 launchAuxiliaryOperation:v12 type:v13 withContext:v14];
  }
  return result;
}

- (void)launchAuxiliaryOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (self->_auxiliaryOperation) {
    sub_1001CF1F8(self, a2);
  }
  objc_storeStrong((id *)&self->_auxiliaryOperation, a3);
  id v12 = +[NSDate date];
  dateSinceLastAuxiliaryOperation = self->_dateSinceLastAuxiliaryOperation;
  self->_dateSinceLastAuxiliaryOperation = v12;

  id v14 = [(CPLCloudKitTransportTask *)self sourceBundleIdentifier];
  id v15 = v14;
  if (!v14)
  {
    a2 = [(CPLCloudKitTransportTask *)self controller];
    id v15 = [(id)a2 defaultSourceBundleIdentifier];
  }
  uint64_t v18 = v15;
  id v16 = +[NSArray arrayWithObjects:&v18 count:1];
  v17.receiver = self;
  v17.super_class = (Class)CPLCloudKitCleanupStagedScopeTask;
  [(CPLCloudKitTransportTask *)&v17 launchOperation:v10 type:a4 withContext:v11 sourceBundleIdentifiers:v16];

  if (!v14)
  {
  }
}

- (id)auxiliaryOperationDidFinishWithError:(id)a3
{
  id v5 = a3;
  auxiliaryOperation = self->_auxiliaryOperation;
  if (auxiliaryOperation)
  {
    SEL v7 = v5;
    double v8 = [(CPLCloudKitCleanupStagedScopeTask *)self operationDidFinish:auxiliaryOperation error:v5];
    id v9 = self->_auxiliaryOperation;
    self->_auxiliaryOperation = 0;

    return v8;
  }
  else
  {
    id v11 = (CPLCloudKitCleanupStagedScopeTask *)sub_1001CF2E0(a2, self);
    return (id)[(CPLCloudKitCleanupStagedScopeTask *)v11 shouldLaunchAuxiliaryOperation];
  }
}

- (BOOL)shouldLaunchAuxiliaryOperation
{
  dateSinceLastAuxiliaryOperation = self->_dateSinceLastAuxiliaryOperation;
  if (!dateSinceLastAuxiliaryOperation) {
    return 1;
  }
  [(NSDate *)dateSinceLastAuxiliaryOperation timeIntervalSinceNow];
  return v3 < -30.0;
}

- (BOOL)isAuxiliaryOperationResultRelevant
{
  return self->_mainOperation != 0;
}

- (CPLEngineScope)stagedScope
{
  return self->_stagedScope;
}

- (CPLEngineScope)stagingScope
{
  return self->_stagingScope;
}

- (CPLEngineScope)destinationScope
{
  return self->_destinationScope;
}

- (CKOperation)mainOperation
{
  return self->_mainOperation;
}

- (CKOperation)auxiliaryOperation
{
  return self->_auxiliaryOperation;
}

- (NSDate)dateSinceLastAuxiliaryOperation
{
  return self->_dateSinceLastAuxiliaryOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSinceLastAuxiliaryOperation, 0);
  objc_storeStrong((id *)&self->_auxiliaryOperation, 0);
  objc_storeStrong((id *)&self->_mainOperation, 0);
  objc_storeStrong((id *)&self->_destinationScope, 0);
  objc_storeStrong((id *)&self->_stagingScope, 0);
  objc_storeStrong((id *)&self->_stagedScope, 0);
  objc_storeStrong((id *)&self->_stagingZoneIdentification, 0);
  objc_storeStrong((id *)&self->_destinationCloudKitScope, 0);
  objc_storeStrong((id *)&self->_stagingCloudKitScope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end