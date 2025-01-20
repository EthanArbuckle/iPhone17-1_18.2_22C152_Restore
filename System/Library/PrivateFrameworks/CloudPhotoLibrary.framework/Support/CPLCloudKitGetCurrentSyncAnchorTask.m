@interface CPLCloudKitGetCurrentSyncAnchorTask
- (CPLCloudKitGetCurrentSyncAnchorTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7;
- (CPLCloudKitScope)cloudKitScope;
- (CPLEngineScope)scope;
- (CPLScopeChange)previousScopeChange;
- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3;
- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3 currentUserID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitGetCurrentSyncAnchorTask

- (CPLCloudKitGetCurrentSyncAnchorTask)initWithController:(id)a3 cloudKitScope:(id)a4 scope:(id)a5 previousScopeChange:(id)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CPLCloudKitGetCurrentSyncAnchorTask;
  v17 = [(CPLCloudKitTransportTask *)&v21 initWithController:a3];
  if (v17)
  {
    id v18 = [v16 copy];
    id completionHandler = v17->_completionHandler;
    v17->_id completionHandler = v18;

    objc_storeStrong((id *)&v17->_cloudKitScope, a4);
    objc_storeStrong((id *)&v17->_scope, a5);
    objc_storeStrong((id *)&v17->_previousScopeChange, a6);
  }

  return v17;
}

- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000C38C0;
  v4[3] = &unk_1002779A0;
  v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CPLCloudKitTransportTask *)v5 getUserRecordIDFetchIfNecessaryWithCompletionHandler:v4];
}

- (void)_fetchLibraryInfoAndStateWithCurrentSyncAnchor:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CPLCloudKitTransportTask *)self controller];
  v9 = [v8 zoneIdentificationForCloudKitScope:self->_cloudKitScope engineScope:self->_scope];

  v10 = [v9 recordsToFetchForScopeInfoWithCurrentUserID:v7];
  if ([v10 count])
  {
    cloudKitScope = self->_cloudKitScope;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C3A74;
    v12[3] = &unk_10027AB50;
    v12[4] = self;
    id v13 = v9;
    id v14 = v7;
    id v15 = v6;
    [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v10 fetchResources:1 inScope:cloudKitScope completionHandler:v12];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v10 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v10];
  id v4 = v10;
  if (v3)
  {
    if ([(CPLEngineScope *)self->_scope scopeType])
    {
      cloudKitScope = self->_cloudKitScope;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000C3CC0;
      v9[3] = &unk_10027AB78;
      v9[4] = self;
      [(CPLCloudKitTransportTask *)self fetchZoneForScope:cloudKitScope completionHandler:v9];
    }
    else
    {
      id completionHandler = self->_completionHandler;
      id v7 = [(CPLEngineScope *)self->_scope scopeIdentifier];
      v8 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v7];
      (*((void (**)(id, void, void, void, void *))completionHandler + 2))(completionHandler, 0, 0, 0, v8);
    }
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
  objc_storeStrong((id *)&self->_updatedTransportScope, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end