@interface CPLCloudKitAcquireReschedulerTask
- (CPLCloudKitAcquireReschedulerTask)initWithController:(id)a3 completionHandler:(id)a4;
- (void)runOperations;
@end

@implementation CPLCloudKitAcquireReschedulerTask

- (CPLCloudKitAcquireReschedulerTask)initWithController:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CPLCloudKitAcquireReschedulerTask;
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
  id v4 = 0;
  [(CPLCloudKitTransportTask *)self shouldRunOperationsWithError:&v4];
  id v3 = v4;
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void).cxx_destruct
{
}

@end