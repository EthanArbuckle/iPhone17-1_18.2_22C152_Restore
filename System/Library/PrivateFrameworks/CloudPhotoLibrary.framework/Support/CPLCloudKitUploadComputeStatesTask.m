@interface CPLCloudKitUploadComputeStatesTask
- (CPLCloudKitUploadComputeStatesTask)initWithController:(id)a3 computeStates:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetMapping:(id)a7 transportScopeMapping:(id)a8 knownRecords:(id)a9 completionHandler:(id)a10;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (CPLRecordTargetMapping)targetMapping;
- (NSDictionary)knownRecords;
- (void)_getEncryptionHelper;
- (void)_getTemporaryFolder;
- (void)_uploadComputeStatesWithTemporaryFolderURL:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitUploadComputeStatesTask

- (CPLCloudKitUploadComputeStatesTask)initWithController:(id)a3 computeStates:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetMapping:(id)a7 transportScopeMapping:(id)a8 knownRecords:(id)a9 completionHandler:(id)a10
{
  id v16 = a4;
  id v30 = a5;
  id v29 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  v31.receiver = self;
  v31.super_class = (Class)CPLCloudKitUploadComputeStatesTask;
  v21 = [(CPLCloudKitTransportTask *)&v31 initWithController:a3];
  if (v21)
  {
    v22 = (NSArray *)objc_msgSend(v16, "copy", v29, v30);
    computeStates = v21->_computeStates;
    v21->_computeStates = v22;

    objc_storeStrong((id *)&v21->_scope, a5);
    objc_storeStrong((id *)&v21->_sharedScope, a6);
    objc_storeStrong((id *)&v21->_targetMapping, a7);
    [(CPLCloudKitTransportTask *)v21 setTransportScopeMapping:v18];
    v24 = (NSDictionary *)[v19 copy];
    knownRecords = v21->_knownRecords;
    v21->_knownRecords = v24;

    id v26 = [v20 copy];
    id completionHandler = v21->_completionHandler;
    v21->_id completionHandler = v26;
  }
  return v21;
}

- (void)runOperations
{
  id v5 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v5];
  id v4 = v5;
  if (v3) {
    [(CPLCloudKitUploadComputeStatesTask *)self _getEncryptionHelper];
  }
  else {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_getEncryptionHelper
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100099754;
  v2[3] = &unk_100279F40;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self acquireHelperWithIdentifier:@"compute-state-encryption" completionHandler:v2];
}

- (void)_getTemporaryFolder
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10009985C;
  v2[3] = &unk_100278198;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getTemporaryFolderWithCompletionHandler:v2];
}

- (void)_uploadComputeStatesWithTemporaryFolderURL:(id)a3
{
  id v32 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_computeStates, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  objc_super v31 = self;
  id v5 = self->_computeStates;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v11 = [v10 itemScopedIdentifier];
        if (v11)
        {
          [v4 setObject:v10 forKeyedSubscript:v11];
        }
        else if (!_CPLSilentLogging)
        {
          v12 = sub_100099D98();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v47 = v10;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[CCSS] Missing identifier to upload for compute state %@", buf, 0xCu);
          }
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v7);
  }

  v13 = [(CPLEngineScope *)v31->_scope scopeIdentifier];
  v14 = [(CPLCloudKitTransportTask *)v31 cloudKitScopeForScopeIdentifier:v13];

  v15 = [v14 zoneID];

  if (v15)
  {
    sharedScope = v31->_sharedScope;
    if (sharedScope)
    {
      id v17 = [(CPLEngineScope *)sharedScope scopeIdentifier];
      id v18 = [(CPLCloudKitTransportTask *)v31 cloudKitScopeForScopeIdentifier:v17];

      id v19 = [v18 zoneID];

      if (!v19)
      {
        id completionHandler = (void (**)(id, void, void *))v31->_completionHandler;
        v21 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required shared zone"];
        completionHandler[2](completionHandler, 0, v21);
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      id v18 = 0;
    }
    v23 = [(CPLCloudKitTransportTask *)v31 controller];
    v21 = [v23 zoneIdentificationForCloudKitScope:v14 engineScope:v31->_scope];

    if (v18 && v31->_sharedScope)
    {
      v24 = [(CPLCloudKitTransportTask *)v31 controller];
      id v30 = [v24 zoneIdentificationForCloudKitScope:v18 engineScope:v31->_sharedScope];
    }
    else
    {
      id v30 = 0;
    }
    id v25 = objc_alloc_init((Class)NSMutableArray);
    id v26 = [v4 allKeys];
    targetMapping = v31->_targetMapping;
    knownRecords = v31->_knownRecords;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100099DEC;
    v40[3] = &unk_100279F68;
    v40[4] = v31;
    id v41 = v4;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10009A164;
    v35[3] = &unk_100279F90;
    id v36 = v41;
    id v37 = v32;
    v38 = v31;
    id v39 = v25;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10009A508;
    v33[3] = &unk_100276128;
    v33[4] = v31;
    id v34 = v39;
    id v28 = v39;
    [(CPLCloudKitTransportTask *)v31 updatePrivatePropertiesOnAssetsWithScopedIdentifiers:v26 desiredKeys:&off_1002942D8 destinationZoneIdentification:v21 sharedZoneIdentification:v30 targetMapping:targetMapping knownRecords:knownRecords shouldUpdateRecord:v40 updateBlock:v35 completionHandler:v33];

    goto LABEL_25;
  }
  v22 = (void (**)(id, void, void *))v31->_completionHandler;
  id v18 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
  v22[2](v22, 0, v18);
LABEL_26:
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (CPLRecordTargetMapping)targetMapping
{
  return self->_targetMapping;
}

- (NSDictionary)knownRecords
{
  return self->_knownRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownRecords, 0);
  objc_storeStrong((id *)&self->_targetMapping, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_encryptionHelper, 0);
  objc_storeStrong((id *)&self->_computeStates, 0);
}

@end