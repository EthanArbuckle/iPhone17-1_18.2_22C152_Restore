@interface CPLCloudKitFetchExistingSharedScopeTask
- (CPLCloudKitFetchExistingSharedScopeTask)initWithController:(id)a3 completionHandler:(id)a4;
- (void)_validateLastZoneIDInArray:(id)a3 currentUserID:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitFetchExistingSharedScopeTask

- (CPLCloudKitFetchExistingSharedScopeTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitFetchExistingSharedScopeTask;
  v7 = [(CPLCloudKitTransportTask *)&v11 initWithController:a3];
  if (v7)
  {
    id v8 = [v6 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v8;
  }
  return v7;
}

- (void)_validateLastZoneIDInArray:(id)a3 currentUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v33 = 0;
  unsigned __int8 v8 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v33];
  id v9 = v33;
  if (v8)
  {
    if ([v6 count])
    {
      v10 = [v6 lastObject];
      [v6 removeLastObject];
      if (!_CPLSilentLogging)
      {
        objc_super v11 = sub_1000C32C0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_msgSend(v10, "cpl_zoneName");
          *(_DWORD *)buf = 138543362;
          v35 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Checking if %{public}@ is a valid shared zone", buf, 0xCu);
        }
      }
      v13 = [[CPLCloudKitScope alloc] initWithZoneID:v10];
      v14 = [(CPLCloudKitTransportTask *)self controller];
      v15 = [v14 recordsToFetchToIdentifyCloudKitScope:v13 proposedScopeType:0 currentUserID:v7];
      if ([v15 count])
      {
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000C43C4;
        v27[3] = &unk_10027ABC8;
        v27[4] = self;
        id v28 = v14;
        v16 = (id *)&v29;
        v17 = v10;
        v18 = v13;
        v29 = v18;
        id v30 = v7;
        id v31 = v17;
        id v32 = v6;
        v19 = v18;
        v10 = v17;
        v20 = &v28;
        [(CPLCloudKitTransportTask *)self fetchRecordsWithIDs:v15 fetchResources:1 inScope:v19 completionHandler:v27];
      }
      else
      {
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000C4850;
        v24[3] = &unk_1002760B0;
        v24[4] = self;
        v20 = &v25;
        id v25 = v6;
        v16 = &v26;
        id v26 = v7;
        [(CPLCloudKitTransportTask *)self dispatchAsync:v24];
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v21 = sub_1000C32C0();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No more candidate for a shared zone", buf, 2u);
        }
      }
      id completionHandler = self->_completionHandler;
      v23 = +[CPLErrors cplErrorWithCode:39 description:@"No Shared Zone available"];
      (*((void (**)(id, void, void, void, void *))completionHandler + 2))(completionHandler, 0, 0, 0, v23);
    }
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runOperations
{
  id v6 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v6];
  id v4 = v6;
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000C4934;
    v5[3] = &unk_100277DA8;
    v5[4] = self;
    [(CPLCloudKitTransportTask *)self getUserRecordIDFetchIfNecessaryWithCompletionHandler:v5];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void).cxx_destruct
{
}

@end