@interface CPLCloudKitGetScopeInfoTask
- (CPLCloudKitGetScopeInfoTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (CPLScopeChange)previousScopeChange;
- (void)_determineScopeTypeAndFetchLibraryInfoWithCurrentUserID:(id)a3;
- (void)getScopeInfoWithCurrentUserID:(id)a3;
- (void)runOperations;
@end

@implementation CPLCloudKitGetScopeInfoTask

- (CPLCloudKitGetScopeInfoTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CPLCloudKitGetScopeInfoTask;
  v17 = [(CPLCloudKitTransportTask *)&v21 initWithController:a3];
  if (v17)
  {
    id v18 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    objc_storeStrong((id *)&v17->_cloudKitScope, a4);
    v17->_originalScopeType = (int64_t)[v14 scopeType];
    objc_storeStrong((id *)&v17->_scope, a5);
    objc_storeStrong((id *)&v17->_previousScopeChange, a6);
  }

  return v17;
}

- (void)runOperations
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000C29C4;
  v2[3] = &unk_100277DA8;
  v2[4] = self;
  [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v2];
}

- (void)getScopeInfoWithCurrentUserID:(id)a3
{
  id v4 = a3;
  id v20 = 0;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v20];
  id v6 = v20;
  if (v5)
  {
    cloudKitScope = self->_cloudKitScope;
    if (cloudKitScope
      && ([(CPLCloudKitScope *)cloudKitScope zone],
          v8 = objc_claimAutoreleasedReturnValue(),
          [v8 zoneID],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      v18[0] = 0;
      v18[1] = v18;
      v18[2] = 0x3032000000;
      v18[3] = sub_1000C2C60;
      v18[4] = sub_1000C2C70;
      v10 = [(CPLCloudKitTransportTask *)self controller];
      id v19 = [v10 zoneIdentificationForCloudKitScope:self->_cloudKitScope engineScope:self->_scope];

      v11 = self->_cloudKitScope;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1000C2C78;
      v15[3] = &unk_10027AB00;
      v15[4] = self;
      v17 = v18;
      id v16 = v4;
      [(CPLCloudKitTransportTask *)self fetchZoneForScope:v11 completionHandler:v15];

      _Block_object_dispose(v18, 8);
    }
    else
    {
      id completionHandler = self->_completionHandler;
      int64_t originalScopeType = self->_originalScopeType;
      id v14 = +[CPLErrors cplErrorWithCode:32, @"No CloudKit scope for %@", self->_scope description];
      (*((void (**)(id, int64_t, void, void, void, void *))completionHandler + 2))(completionHandler, originalScopeType, 0, 0, 0, v14);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)_determineScopeTypeAndFetchLibraryInfoWithCurrentUserID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(CPLCloudKitTransportTask *)self controller];
  id v6 = [v5 recordsToFetchToIdentifyCloudKitScope:self->_cloudKitScope proposedScopeType:self->_originalScopeType currentUserID:v4];
  if ([v6 count])
  {
    if (!_CPLSilentLogging)
    {
      v7 = sub_1000C32C0();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = [(CPLEngineScope *)self->_scope scopeIdentifier];
        cloudKitScope = self->_cloudKitScope;
        *(_DWORD *)buf = 138543874;
        id v15 = v8;
        __int16 v16 = 2114;
        v17 = v6;
        __int16 v18 = 2112;
        id v19 = cloudKitScope;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trying to determine scope type for %{public}@. Fetching %{public}@ in %@", buf, 0x20u);
      }
    }
    v10 = self->_cloudKitScope;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C3314;
    v11[3] = &unk_10027AB28;
    v11[4] = self;
    id v12 = v5;
    id v13 = v4;
    [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v6 fetchResources:1 inScope:v10 completionHandler:v11];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (CPLScopeChange)previousScopeChange
{
  return self->_previousScopeChange;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousScopeChange, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end