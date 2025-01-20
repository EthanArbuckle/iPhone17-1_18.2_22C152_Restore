@interface CPLCloudKitFetchScopeListChangesTask
+ (id)descriptionForScopeListSyncAnchor:(id)a3;
- (CPLCloudKitFetchScopeListChangesTask)initWithController:(id)a3 scopeListSyncAnchor:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (void)_launchOperationForSharedDatabase:(BOOL)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchScopeListChangesTask

+ (id)descriptionForScopeListSyncAnchor:(id)a3
{
  v3 = +[CPLCloudKitScopeListSyncAnchor cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:a3];
  v4 = [v3 description];

  return v4;
}

- (CPLCloudKitFetchScopeListChangesTask)initWithController:(id)a3 scopeListSyncAnchor:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CPLCloudKitFetchScopeListChangesTask;
  v13 = [(CPLCloudKitTransportTask *)&v21 initWithController:a3];
  if (v13)
  {
    uint64_t v14 = +[CPLCloudKitScopeListSyncAnchor cloudKitScopeListSyncAnchorWithScopeListSyncAnchor:v10];
    ckScopeListSyncAnchor = v13->_ckScopeListSyncAnchor;
    v13->_ckScopeListSyncAnchor = (CPLCloudKitScopeListSyncAnchor *)v14;

    id v16 = objc_retainBlock(v11);
    id progressHandler = v13->_progressHandler;
    v13->_id progressHandler = v16;

    id v18 = objc_retainBlock(v12);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v18;
  }
  return v13;
}

- (void)runOperations
{
}

- (void)_launchOperationForSharedDatabase:(BOOL)a3
{
  BOOL v3 = a3;
  id v37 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v37];
  id v6 = v37;
  if (v5)
  {
    ckScopeListSyncAnchor = self->_ckScopeListSyncAnchor;
    if (v3) {
      [(CPLCloudKitScopeListSyncAnchor *)ckScopeListSyncAnchor sharedChangeToken];
    }
    else {
    v8 = [(CPLCloudKitScopeListSyncAnchor *)ckScopeListSyncAnchor privateChangeToken];
    }
    id v9 = [objc_alloc((Class)CKFetchDatabaseChangesOperation) initWithPreviousServerChangeToken:v8];
    [v9 setFetchAllChanges:1];
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3032000000;
    v35[3] = sub_1000C52B8;
    v35[4] = sub_1000C52C8;
    id v36 = objc_alloc_init((Class)NSMutableDictionary);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = sub_1000C52B8;
    v33[4] = sub_1000C52C8;
    id v34 = objc_alloc_init((Class)NSMutableArray);
    [(CPLCloudKitTransportTask *)self controller];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000C52D0;
    v28[3] = &unk_10027AC38;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v29 = v10;
    v30 = self;
    BOOL v32 = v3;
    v31 = v35;
    [v9 setRecordZoneWithIDChangedBlock:v28];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000C5558;
    v24[3] = &unk_10027AC60;
    id v11 = v10;
    id v25 = v11;
    v26 = self;
    v27 = v33;
    [v9 setRecordZoneWithIDWasDeletedBlock:v24];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000C56E8;
    v22[3] = &unk_10027AC88;
    BOOL v23 = v3;
    v22[4] = self;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000C579C;
    v18[3] = &unk_10027ACB0;
    v18[4] = self;
    id v12 = objc_retainBlock(v22);
    id v19 = v12;
    v20 = v35;
    objc_super v21 = v33;
    [v9 setChangeTokenUpdatedBlock:v18];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000C58C4;
    v15[3] = &unk_10027ACD8;
    v15[4] = self;
    BOOL v17 = v3;
    v13 = v12;
    id v16 = v13;
    [v9 setFetchDatabaseChangesCompletionBlock:v15];
    if (v3) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    [(CPLCloudKitTransportTask *)self launchOperation:v9 type:v14 withContext:0];

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(v35, 8);
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_ckScopeListSyncAnchor, 0);
}

@end