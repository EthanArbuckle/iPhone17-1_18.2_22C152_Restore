@interface CPLCloudKitSharedLibraryServerRampTask
- (CPLCloudKitSharedLibraryServerRampTask)initWithController:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitSharedLibraryServerRampTask

- (CPLCloudKitSharedLibraryServerRampTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitSharedLibraryServerRampTask;
  v7 = [(CPLCloudKitTransportTask *)&v11 initWithController:a3];
  if (v7)
  {
    id v8 = [v6 copy];
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v8;
  }
  return v7;
}

- (void)runOperations
{
  id v7 = 0;
  unsigned __int8 v3 = [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v7];
  id v4 = v7;
  if (v3)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000C6B90;
    v6[3] = &unk_10027AD90;
    v6[4] = self;
    v5 = +[CPLCKPhotosSharedLibraryOperation silentMoverServerRampOperationWithOperationID:0 completionHandler:v6];
    [(CPLCloudKitTransportTask *)self launchOperation:v5 type:1 withContext:0];
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