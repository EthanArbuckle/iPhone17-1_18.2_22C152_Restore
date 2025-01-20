@interface CPLCloudKitDownloadComputeStatesTask
- (BOOL)shouldDecrypt;
- (CPLCloudKitDownloadComputeStatesTask)initWithController:(id)a3 scopedIdentifiers:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetStorageURL:(id)a7 transportScopeMapping:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)scope;
- (CPLEngineScope)sharedScope;
- (NSURL)targetStorageURL;
- (void)_downloadComputeStates;
- (void)_getEncryptionHelper;
- (void)_group:(id)a3 dispatchWhenFinished:(id)a4;
- (void)runOperations;
- (void)setShouldDecrypt:(BOOL)a3;
@end

@implementation CPLCloudKitDownloadComputeStatesTask

- (CPLCloudKitDownloadComputeStatesTask)initWithController:(id)a3 scopedIdentifiers:(id)a4 scope:(id)a5 sharedScope:(id)a6 targetStorageURL:(id)a7 transportScopeMapping:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  id v26 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27.receiver = self;
  v27.super_class = (Class)CPLCloudKitDownloadComputeStatesTask;
  v20 = [(CPLCloudKitTransportTask *)&v27 initWithController:a3];
  if (v20)
  {
    v21 = (NSArray *)[v15 copy];
    scopedIdentifiers = v20->_scopedIdentifiers;
    v20->_scopedIdentifiers = v21;

    objc_storeStrong((id *)&v20->_scope, a5);
    objc_storeStrong((id *)&v20->_sharedScope, a6);
    objc_storeStrong((id *)&v20->_targetStorageURL, a7);
    [(CPLCloudKitTransportTask *)v20 setTransportScopeMapping:v18];
    id v23 = [v19 copy];
    id completionHandler = v20->_completionHandler;
    v20->_id completionHandler = v23;
  }
  return v20;
}

- (void)runOperations
{
  id v5 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v5];
  id v4 = v5;
  if (v3) {
    [(CPLCloudKitDownloadComputeStatesTask *)self _getEncryptionHelper];
  }
  else {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_getEncryptionHelper
{
  if (self->_shouldDecrypt)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000A09CC;
    v5[3] = &unk_100279F40;
    v5[4] = self;
    [(CPLCloudKitTransportTask *)self acquireHelperWithIdentifier:@"compute-state-encryption" completionHandler:v5];
  }
  else
  {
    unsigned __int8 v3 = objc_alloc_init(CPLCloudKitComputeStateNoEncryptionHelper);
    encryptionHelper = self->_encryptionHelper;
    self->_encryptionHelper = (CPLCloudKitComputeStateEncryptionHelper *)v3;

    [(CPLCloudKitDownloadComputeStatesTask *)self _downloadComputeStates];
  }
}

- (void)_group:(id)a3 dispatchWhenFinished:(id)a4
{
  id v6 = a4;
  v7 = a3;
  v8 = +[NSProgress progressWithTotalUnitCount:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A0B78;
  v11[3] = &unk_100276288;
  v11[4] = self;
  id v12 = v6;
  v9 = [(CPLCloudKitTransportTask *)self blockWithAdaptedQOS:v11];
  [(CPLCloudKitTransportTask *)self dispatchCallbackOperation:@"Waiting for decryption to finish" progress:v8];
  v10 = [(CPLCloudKitTransportTask *)self synchronousWorkQueue];
  dispatch_group_notify(v7, v10, v9);
}

- (void)_downloadComputeStates
{
  id v61 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v61];
  id v39 = v61;
  if ((v3 & 1) != 0 && [(NSArray *)self->_scopedIdentifiers count])
  {
    id v4 = [(CPLEngineScope *)self->_scope scopeIdentifier];
    v36 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v4];

    id v5 = [v36 zoneID];
    LODWORD(v4) = v5 == 0;

    if (v4)
    {
      id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
      v35 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required zone"];
      completionHandler[2](completionHandler, 0, v35);
LABEL_20:

      goto LABEL_21;
    }
    sharedScope = self->_sharedScope;
    if (sharedScope)
    {
      v7 = [(CPLEngineScope *)sharedScope scopeIdentifier];
      v35 = [(CPLCloudKitTransportTask *)self cloudKitScopeForScopeIdentifier:v7];

      v8 = [v35 zoneID];
      LODWORD(v7) = v8 == 0;

      if (v7)
      {
        v9 = (void (**)(id, void, void *))self->_completionHandler;
        v10 = +[CPLErrors cplErrorWithCode:80 description:@"Missing required shared zone"];
        v9[2](v9, 0, v10);
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      v35 = 0;
    }
    id v12 = [(CPLCloudKitTransportTask *)self controller];
    v10 = [v12 zoneIdentificationForCloudKitScope:v36 engineScope:self->_scope];

    id v13 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_scopedIdentifiers, "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v14 = self->_scopedIdentifiers;
    id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v58;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v58 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          id v19 = [v18 identifier];
          v20 = [v10 recordIDWithRecordName:v19];

          [v13 setObject:v18 forKeyedSubscript:v20];
        }
        id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v57 objects:v62 count:16];
      }
      while (v15);
    }

    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = sub_1000A1298;
    v55[4] = sub_1000A12A8;
    id v56 = 0;
    id v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_scopedIdentifiers, "count"));
    id v22 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSArray count](self->_scopedIdentifiers, "count"));
    id v23 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSArray count](self->_scopedIdentifiers, "count"));
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000A12B0;
    v46[3] = &unk_10027A080;
    v24 = dispatch_group_create();
    v47 = v24;
    v48 = self;
    v53 = v55;
    id v34 = v13;
    id v49 = v34;
    SEL v54 = a2;
    id v25 = v23;
    id v50 = v25;
    id v26 = v22;
    id v51 = v26;
    id v27 = v21;
    id v52 = v27;
    v28 = objc_retainBlock(v46);
    v29 = [v34 allKeys];
    id v30 = [v10 operationType];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000A1AE4;
    v40[3] = &unk_10027A0F8;
    v40[4] = self;
    v38 = v24;
    v41 = v38;
    v45 = v55;
    id v31 = v27;
    id v42 = v31;
    id v32 = v25;
    id v43 = v32;
    id v33 = v26;
    id v44 = v33;
    [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v29 fetchResources:1 desiredKeys:&off_100294320 wantsAllRecords:0 type:v30 perFoundRecordBlock:v28 completionHandler:v40];

    _Block_object_dispose(v55, 8);
    goto LABEL_19;
  }
  (*((void (**)(void))self->_completionHandler + 2))();
LABEL_21:
}

- (BOOL)shouldDecrypt
{
  return self->_shouldDecrypt;
}

- (void)setShouldDecrypt:(BOOL)a3
{
  self->_shouldDecrypt = a3;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLEngineScope)sharedScope
{
  return self->_sharedScope;
}

- (NSURL)targetStorageURL
{
  return self->_targetStorageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetStorageURL, 0);
  objc_storeStrong((id *)&self->_sharedScope, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_encryptionHelper, 0);
  objc_storeStrong((id *)&self->_scopedIdentifiers, 0);
}

@end