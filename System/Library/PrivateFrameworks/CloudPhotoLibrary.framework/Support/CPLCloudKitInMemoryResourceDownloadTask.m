@interface CPLCloudKitInMemoryResourceDownloadTask
- (CPLCloudKitInMemoryResourceDownloadTask)initWithController:(id)a3 resource:(id)a4 record:(id)a5 target:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (CPLPlaceholderRecord)record;
- (CPLResource)resource;
- (id)_inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 operationType:(int64_t)a7 completionBlock:(id)a8;
- (id)completionHandler;
- (void)_fetchPlaceholderRecordAndStartDownload;
- (void)_startDownload;
- (void)runOperations;
@end

@implementation CPLCloudKitInMemoryResourceDownloadTask

- (CPLCloudKitInMemoryResourceDownloadTask)initWithController:(id)a3 resource:(id)a4 record:(id)a5 target:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CPLCloudKitInMemoryResourceDownloadTask;
  v20 = [(CPLCloudKitTransportTask *)&v29 initWithController:a3];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_resource, a4);
    objc_storeStrong((id *)&v21->_record, a5);
    v22 = (CPLRecordTargetMapping *)objc_alloc_init((Class)CPLRecordTargetMapping);
    targetMapping = v21->_targetMapping;
    v21->_targetMapping = v22;

    v24 = v21->_targetMapping;
    v25 = [v17 scopedIdentifier];
    [(CPLRecordTargetMapping *)v24 setTarget:v17 forRecordWithScopedIdentifier:v25];

    id v26 = [v19 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;

    [(CPLCloudKitTransportTask *)v21 setTransportScopeMapping:v18];
    [(CPLCloudKitTransportTask *)v21 setIsMetadata:0];
    [(CPLCloudKitTransportTask *)v21 setBoostable:0];
  }

  return v21;
}

- (id)_inMemoryDownloadOperationForRecordID:(id)a3 resource:(id)a4 record:(id)a5 keys:(id)a6 operationType:(int64_t)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  id v18 = sub_1000967A4((uint64_t)v16);
  if (CPLCloudKitUseGateKeeperForOperationType(a7))
  {
    uint64_t v19 = CPLCloudKitGateKeeperDefaultDownloadType;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000B6D18;
    v35[3] = &unk_10027A6D0;
    id v36 = v17;
    id v20 = +[CPLCKResourceDownloadOperation inMemoryDownloadOperationForRecordID:v13 resource:v14 record:v15 keys:v16 downloadType:v19 completionBlock:v35];
    v21 = v36;
  }
  else
  {
    id v22 = objc_alloc((Class)CKFetchRecordsOperation);
    id v38 = v13;
    v23 = +[NSArray arrayWithObjects:&v38 count:1];
    id v20 = [v22 initWithRecordIDs:v23];

    [v20 setShouldFetchAssetContentInMemory:1];
    v21 = sub_100096744((uint64_t)v16);
    v37[0] = v18;
    v37[1] = v21;
    v24 = +[NSArray arrayWithObjects:v37 count:2];
    [v20 setDesiredKeys:v24];

    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = sub_1000B6DB8;
    v33[4] = sub_1000B6DC8;
    id v34 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000B6DD0;
    v32[3] = &unk_10027A6F8;
    v32[4] = v33;
    [v20 setPerRecordCompletionBlock:v32];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000B6F30;
    v26[3] = &unk_10027A720;
    v31 = v33;
    id v27 = v13;
    id v28 = v18;
    id v29 = v16;
    id v30 = v17;
    [v20 setFetchRecordsCompletionBlock:v26];

    _Block_object_dispose(v33, 8);
  }

  return v20;
}

- (void)runOperations
{
  id v8 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v8];
  id v4 = v8;
  if (v3)
  {
    if (self->_record)
    {
      targetMapping = self->_targetMapping;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000B72E0;
      v7[3] = &unk_100276328;
      v7[4] = self;
      [(CPLCloudKitTransportTask *)self fetchUnknownTargetsInMapping:targetMapping completionHandler:v7];
    }
    else
    {
      v6 = [(CPLResource *)self->_resource identity];
      [v6 fingerPrint];

      [(CPLCloudKitInMemoryResourceDownloadTask *)self _fetchPlaceholderRecordAndStartDownload];
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_fetchPlaceholderRecordAndStartDownload
{
  unsigned __int8 v3 = [(CPLResource *)self->_resource itemScopedIdentifier];
  v9 = v3;
  id v4 = +[NSArray arrayWithObjects:&v9 count:1];
  targetMapping = self->_targetMapping;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B7420;
  v7[3] = &unk_100278E38;
  v7[4] = self;
  id v8 = v3;
  id v6 = v3;
  [(CPLCloudKitTransportTask *)self fetchPlaceholderRecordsForScopedIdentifiers:v4 targetMapping:targetMapping completionHandler:v7];
}

- (void)_startDownload
{
  id v32 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v32];
  id v4 = v32;
  if (v3)
  {
    v5 = sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, +[CPLCloudKitFakeDynamicDerivatives realResourceTypeForResource:self->_resource]);
    if (v5)
    {
      id v6 = [(CPLResource *)self->_resource itemScopedIdentifier];
      v7 = [(CPLRecordTargetMapping *)self->_targetMapping targetForRecordWithScopedIdentifier:v6];
      id v8 = [v7 resourceScopedIdentifier];
      v9 = [v8 scopeIdentifier];
      v10 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v9];

      if (v10)
      {
        id v28 = v7;
        v11 = [v8 identifier];
        v12 = [v10 recordIDWithRecordName:v11];

        if (!_CPLSilentLogging)
        {
          id v13 = sub_1000B6EDC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            sub_1000967A4((uint64_t)v5);
            id v15 = v14 = v8;
            *(_DWORD *)buf = 138412546;
            id v34 = v12;
            __int16 v35 = 2112;
            id v36 = v15;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Starting in memory download for %@ (resourceKey %@)", buf, 0x16u);

            id v8 = v14;
          }
        }
        id v27 = v8;
        id v16 = objc_alloc_init(CPLCloudKitDownloadMetric);
        id v17 = [(CPLResource *)self->_resource identity];
        -[CPLCloudKitDownloadMetric setExpectedSize:](v16, "setExpectedSize:", [v17 fileSize]);

        [(CPLCloudKitDownloadMetric *)v16 setRequestedItemCount:1];
        [(CPLCloudKitTransportTask *)self associateMetric:v16];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000B797C;
        v29[3] = &unk_10027A770;
        v29[4] = self;
        id v30 = v16;
        v31 = v12;
        id v18 = v12;
        uint64_t v19 = v16;
        id v20 = objc_retainBlock(v29);
        uint64_t v21 = CPLCloudKitOperationTypeForScope(v10);
        id v22 = [(CPLCloudKitInMemoryResourceDownloadTask *)self _inMemoryDownloadOperationForRecordID:v18 resource:self->_resource record:self->_record keys:v5 operationType:v21 completionBlock:v20];
        [(CPLCloudKitTransportTask *)self launchOperation:v22 type:v21 withContext:0];

        id v8 = v27;
        v7 = v28;
      }
      else
      {
        id completionHandler = (void (**)(id, void, id))self->_completionHandler;
        uint64_t v19 = [v8 scopeIdentifier];
        id v18 = +[CPLErrors cplErrorWithCode:80, @"Missing zone for %@", v19 description];
        completionHandler[2](completionHandler, 0, v18);
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v23 = sub_1000B6EDC();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          resource = self->_resource;
          *(_DWORD *)buf = 138412290;
          id v34 = resource;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Tried to download an unsupported resource type in memory: %@", buf, 0xCu);
        }
      }
      v25 = (void (**)(id, void, void *))self->_completionHandler;
      id v6 = +[CPLErrors incorrectParametersErrorForParameter:@"resourceType"];
      v25[2](v25, 0, v6);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CPLResource)resource
{
  return self->_resource;
}

- (CPLPlaceholderRecord)record
{
  return self->_record;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
}

@end