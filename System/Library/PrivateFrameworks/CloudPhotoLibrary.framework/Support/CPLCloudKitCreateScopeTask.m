@interface CPLCloudKitCreateScopeTask
- (CPLCloudKitCreateScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (NSURL)tempCKAssetURL;
- (id)scope;
- (void)_clearPartiallyCreatedZoneIfNecessary;
- (void)_createCKShare:(id)a3 andRootRecord:(id)a4 currentUserID:(id)a5 withCompletionHandler:(id)a6;
- (void)_createCKShareWithCompletionHandler:(id)a3;
- (void)_createLibraryShareWithScopeChange:(id)a3 completionHandler:(id)a4;
- (void)_createLibraryWithScopeChange:(id)a3 completionHandler:(id)a4;
- (void)_createMomentShareWithScopeChange:(id)a3 completionHandler:(id)a4;
- (void)_createZoneWithCompletionHandler:(id)a3;
- (void)_runOperations;
- (void)runOperations;
- (void)setTempCKAssetURL:(id)a3;
@end

@implementation CPLCloudKitCreateScopeTask

- (CPLCloudKitCreateScopeTask)initWithController:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CPLCloudKitCreateScopeTask;
  v9 = [(CPLCloudKitManageScopeTask *)&v13 initWithController:a3 scope:a4];
  if (v9)
  {
    id v10 = [v8 copy];
    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v10;
  }
  return v9;
}

- (id)scope
{
  updatedScope = self->_updatedScope;
  if (updatedScope)
  {
    v3 = updatedScope;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLCloudKitCreateScopeTask;
    v3 = [(CPLCloudKitManageScopeTask *)&v5 scope];
  }
  return v3;
}

- (void)_clearPartiallyCreatedZoneIfNecessary
{
  identificationToCleanIfNecessary = self->_identificationToCleanIfNecessary;
  if (identificationToCleanIfNecessary
    && [(CPLCloudKitZoneIdentification *)identificationToCleanIfNecessary supportsZoneDelete])
  {
    v4 = [(CPLCloudKitZoneIdentification *)self->_identificationToCleanIfNecessary zoneID];
    if (!_CPLSilentLogging)
    {
      objc_super v5 = sub_100053134();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will try to delete partially created zone %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    v6 = [CPLCloudKitDeleteTransportScopeTask alloc];
    v7 = [(CPLCloudKitTransportTask *)self controller];
    id v8 = [(CPLCloudKitZoneIdentification *)self->_identificationToCleanIfNecessary cloudKitScope];
    v9 = [(CPLCloudKitZoneIdentification *)self->_identificationToCleanIfNecessary engineScope];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100054394;
    v19[3] = &unk_100276328;
    id v20 = v4;
    id v10 = v4;
    v11 = [(CPLCloudKitDeleteTransportScopeTask *)v6 initWithController:v7 cloudKitScope:v8 scope:v9 completionHandler:v19];

    v12 = [(CPLCloudKitTransportTask *)self transportGroup];
    [(CPLCloudKitTransportTask *)v11 setTransportGroup:v12];

    objc_super v13 = dispatch_get_global_queue(0, 0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000544C4;
    v17[3] = &unk_100275EA0;
    v18 = v11;
    v14 = v17;
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v22 = sub_1000580CC;
    v23 = &unk_100275DF8;
    id v24 = v14;
    v15 = v11;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v13, v16);
  }
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100054538;
  v2[3] = &unk_100278198;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getTemporaryFolderWithCompletionHandler:v2];
}

- (void)_runOperations
{
  id v17 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v17];
  id v4 = v17;
  objc_super v5 = v4;
  if (v3)
  {
    id v16 = v4;
    unsigned __int8 v6 = [(CPLCloudKitManageScopeTask *)self checkScopeIsValidWithError:&v16];
    id v7 = v16;

    if (v6)
    {
      id v8 = [(CPLCloudKitManageScopeTask *)self identification];
      if ([v8 supportsZoneCreation])
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100054858;
        v15[3] = &unk_100276328;
        v15[4] = self;
        [v8 validateCreateScopeTask:self completionHandler:v15];
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v9 = sub_100053134();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            id v10 = [(CPLCloudKitManageScopeTask *)self engineScope];
            *(_DWORD *)long long buf = 138412290;
            v19 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Creating a zone for %@ is not supported", buf, 0xCu);
          }
        }
        id completionHandler = self->_completionHandler;
        v12 = +[CPLScopeChange descriptionForScopeType:[(CPLCloudKitManageScopeTask *)self scopeType]];
        objc_super v13 = [(CPLCloudKitManageScopeTask *)self scopeIdentifier];
        v14 = +[CPLErrors cplErrorWithCode:38, @"%@ %@ is an unsupported scope to create", v12, v13 description];
        (*((void (**)(id, void, void, void *))completionHandler + 2))(completionHandler, 0, 0, v14);
      }
    }
    else
    {
      (*((void (**)(void))self->_completionHandler + 2))();
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
    id v7 = v5;
  }
}

- (void)_createCKShare:(id)a3 andRootRecord:(id)a4 currentUserID:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v28 = 0;
  unsigned __int8 v14 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v28];
  id v15 = v28;
  if (v14)
  {
    if (v11)
    {
      v30[0] = v10;
      v30[1] = v11;
      id v16 = (id *)v30;
      uint64_t v17 = 2;
    }
    else
    {
      id v29 = v10;
      id v16 = &v29;
      uint64_t v17 = 1;
    }
    v18 = +[NSArray arrayWithObjects:v16 count:v17];
    id v19 = [objc_alloc((Class)CKModifyRecordsOperation) initWithRecordsToSave:v18 recordIDsToDelete:0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100054F84;
    v22[3] = &unk_100278210;
    v22[4] = self;
    id v23 = v18;
    id v27 = v13;
    id v24 = v10;
    id v25 = v12;
    id v26 = v11;
    id v20 = v18;
    [v19 setModifyRecordsCompletionBlock:v22];
    v21 = [(CPLCloudKitManageScopeTask *)self cloudKitScope];
    [(CPLCloudKitTransportTask *)self launchOperation:v19 type:CPLCloudKitOperationTypeForScope(v21) withContext:0];
  }
  else
  {
    (*((void (**)(id, void, id))v13 + 2))(v13, 0, v15);
  }
}

- (void)_createCKShareWithCompletionHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005548C;
  v5[3] = &unk_100278260;
  unsigned __int8 v6 = self;
  id v7 = a3;
  SEL v8 = a2;
  id v4 = v7;
  [(CPLCloudKitTransportTask *)v6 getUserRecordIDFetchIfNecessaryWithCompletionHandler:v5];
}

- (void)_createZoneWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v23 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v23];
  id v6 = v23;
  if (v5)
  {
    id v7 = [(CPLCloudKitManageScopeTask *)self cloudKitScope];
    id v8 = [v7 databaseScope];
    v9 = [(CPLCloudKitTransportTask *)self controller];
    id v10 = [v7 zoneID];
    unsigned int v11 = [v9 shouldIgnoreZoneWithZoneID:v10];

    if (v11)
    {
      id v12 = [v7 zoneID];
      id v13 = objc_msgSend(v12, "cpl_zoneName");
      id v14 = +[CPLErrors cplErrorWithCode:38, @"Zone %@ is not supported by this engine", v13 description];

      v4[2](v4, v14);
    }
    else
    {
      id v15 = objc_alloc((Class)CKModifyRecordZonesOperation);
      id v16 = [v7 zone];
      id v24 = v16;
      uint64_t v17 = +[NSArray arrayWithObjects:&v24 count:1];
      id v14 = [v15 initWithRecordZonesToSave:v17 recordZoneIDsToDelete:0];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100055BD8;
      v19[3] = &unk_1002782B0;
      void v19[4] = self;
      v21 = v4;
      id v22 = v8;
      id v18 = v7;
      id v20 = v18;
      [v14 setModifyRecordZonesCompletionBlock:v19];
      [(CPLCloudKitTransportTask *)self launchOperation:v14 type:CPLCloudKitOperationTypeForScope(v18) withContext:0];
    }
  }
  else
  {
    v4[2](v4, v6);
  }
}

- (void)_createMomentShareWithScopeChange:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000562D8;
  v5[3] = &unk_100276390;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(CPLCloudKitCreateScopeTask *)v6 _createZoneWithCompletionHandler:v5];
}

- (void)_createLibraryWithScopeChange:(id)a3 completionHandler:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000563C0;
  v8[3] = &unk_100276390;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  [(CPLCloudKitCreateScopeTask *)self _createZoneWithCompletionHandler:v8];
}

- (void)_createLibraryShareWithScopeChange:(id)a3 completionHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000564F0;
  v5[3] = &unk_100276390;
  id v6 = self;
  id v7 = a4;
  id v4 = v7;
  [(CPLCloudKitCreateScopeTask *)v6 _createZoneWithCompletionHandler:v5];
}

- (NSURL)tempCKAssetURL
{
  return self->_tempCKAssetURL;
}

- (void)setTempCKAssetURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempCKAssetURL, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identificationToCleanIfNecessary, 0);
  objc_storeStrong((id *)&self->_updatedScope, 0);
}

@end