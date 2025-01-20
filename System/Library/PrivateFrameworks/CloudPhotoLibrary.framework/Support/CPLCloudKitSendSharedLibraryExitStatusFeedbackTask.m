@interface CPLCloudKitSendSharedLibraryExitStatusFeedbackTask
- (CPLCloudKitScope)cloudKitScope;
- (CPLCloudKitSendSharedLibraryExitStatusFeedbackTask)initWithController:(id)a3 scopeIdentifier:(id)a4 cloudKitScope:(id)a5 status:(int64_t)a6 completionHandler:(id)a7;
- (NSString)scopeIdentifier;
- (int64_t)status;
- (void)runOperations;
@end

@implementation CPLCloudKitSendSharedLibraryExitStatusFeedbackTask

- (CPLCloudKitSendSharedLibraryExitStatusFeedbackTask)initWithController:(id)a3 scopeIdentifier:(id)a4 cloudKitScope:(id)a5 status:(int64_t)a6 completionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CPLCloudKitSendSharedLibraryExitStatusFeedbackTask;
  v16 = [(CPLCloudKitTransportTask *)&v20 initWithController:a3];
  if (v16)
  {
    id v17 = [v15 copy];
    id completionHandler = v16->_completionHandler;
    v16->_id completionHandler = v17;

    objc_storeStrong((id *)&v16->_scopeIdentifier, a4);
    objc_storeStrong((id *)&v16->_cloudKitScope, a5);
    v16->_status = a6;
  }

  return v16;
}

- (void)runOperations
{
  id v11 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v11];
  id v4 = v11;
  if (v3)
  {
    v5 = [(CPLCloudKitScope *)self->_cloudKitScope zoneID];
    v6 = +[NSUUID UUID];
    v7 = [v6 UUIDString];

    int64_t status = self->_status;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100037C38;
    v10[3] = &unk_1002777A8;
    v10[4] = self;
    v9 = +[CPLCKPhotosSharedLibraryOperation sendExitStatusFeedbackWithOperationID:v7 shareID:v5 status:status completionHandler:v10];
    [(CPLCloudKitTransportTask *)self launchOperation:v9 type:CPLCloudKitOperationTypeForScope(self->_cloudKitScope) withContext:0];
  }
  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (NSString)scopeIdentifier
{
  return self->_scopeIdentifier;
}

- (CPLCloudKitScope)cloudKitScope
{
  return self->_cloudKitScope;
}

- (int64_t)status
{
  return self->_status;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitScope, 0);
  objc_storeStrong((id *)&self->_scopeIdentifier, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end