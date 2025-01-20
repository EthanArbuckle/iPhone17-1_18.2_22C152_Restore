@interface ViewHierarchyService
+ (id)forLocalPid:(int)a3;
- (DBGSnapshotManager)snapshotManager;
- (DBGStandaloneDataSourceConnection)dataSourceConnection;
- (NSString)platform;
- (NSURL)destination;
- (OS_dispatch_queue)captureQueue;
- (ViewHierarchyService)initWithDataSourceConnection:(id)a3 runnablePid:(int)a4;
- (id)_metadata;
- (id)completionBlock;
- (id)defaultPlatform;
- (int)runnablePid;
- (void)_enqueueAdditionalRequests;
- (void)_enqueueInitialRequest;
- (void)_enqueueRemainingUnfetchedPropertyValuesRequest;
- (void)_requestFailed:(id)a3;
- (void)_saveCompletedRequests;
- (void)captureTo:(id)a3 completionBlock:(id)a4;
- (void)finishWithError:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDestination:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setRunnablePid:(int)a3;
@end

@implementation ViewHierarchyService

+ (id)forLocalPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [[DBGLocalDataSourceConnection alloc] initWithPid:*(void *)&a3];
  id v6 = [objc_alloc((Class)a1) initWithDataSourceConnection:v5 runnablePid:v3];

  return v6;
}

- (ViewHierarchyService)initWithDataSourceConnection:(id)a3 runnablePid:(int)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ViewHierarchyService;
  v8 = [(ViewHierarchyService *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_dataSourceConnection, a3);
    v10 = objc_alloc_init(DBGSnapshot);
    v11 = +[DBGDataCoordinator coordinatorWithDataSourceConnection:v7];
    [v11 setShouldStoreCompletedRequests:1];
    uint64_t v12 = +[DBGSnapshotManager snapshotManagerWithSnapshot:v10 primaryDataCoordinator:v11];
    snapshotManager = v9->_snapshotManager;
    v9->_snapshotManager = (DBGSnapshotManager *)v12;

    v9->_runnablePid = a4;
    dispatch_queue_t v14 = dispatch_queue_create("CaptureQueue", 0);
    captureQueue = v9->_captureQueue;
    v9->_captureQueue = (OS_dispatch_queue *)v14;

    [(DBGStandaloneDataSourceConnection *)v9->_dataSourceConnection setCaptureQueue:v9->_captureQueue];
  }

  return v9;
}

- (void)captureTo:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(ViewHierarchyService *)self captureQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __50__ViewHierarchyService_captureTo_completionBlock___block_invoke;
  block[3] = &unk_243E8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __50__ViewHierarchyService_captureTo_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) completionBlock];

  if (v2)
  {
    NSErrorUserInfoKey v5 = NSLocalizedDescriptionKey;
    id v6 = @"A capture is already in progress";
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    v4 = +[NSError errorWithDomain:@"com.apple.dt.ViewHierarchyService" code:-2 userInfo:v3];

    [*(id *)(a1 + 32) finishWithError:v4];
  }
  else
  {
    [*(id *)(a1 + 32) setDestination:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setCompletionBlock:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _enqueueInitialRequest];
  }
}

- (void)_enqueueInitialRequest
{
  uint64_t v3 = [(ViewHierarchyService *)self platform];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(ViewHierarchyService *)self defaultPlatform];
  }
  id v6 = v5;

  id v7 = +[RequestFactory initialRequestForPlatform:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __46__ViewHierarchyService__enqueueInitialRequest__block_invoke;
  v10[3] = &unk_24410;
  v10[4] = self;
  [v7 setCompletion:v10];
  v8 = [(ViewHierarchyService *)self snapshotManager];
  id v9 = [v8 primaryDataCoordinator];
  [v9 performRequest:v7];
}

void __46__ViewHierarchyService__enqueueInitialRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (char *)[v3 status];
  id v5 = *(void **)(a1 + 32);
  if (v4 == (unsigned char *)&dword_0 + 3) {
    [v5 _enqueueAdditionalRequests];
  }
  else {
    [v5 _requestFailed:v3];
  }
}

- (void)_enqueueAdditionalRequests
{
  id v3 = [(ViewHierarchyService *)self snapshotManager];
  v4 = [v3 snapshot];

  +[RequestFactory additionalRequestsWithSnapshot:v4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke;
  v6[3] = &unk_24438;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = self;
  id v5 = v7;
  [v5 enumerateObjectsUsingBlock:v6];
}

void __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke(uint64_t a1, void *a2, char *a3)
{
  id v5 = a2;
  if ((char *)[*(id *)(a1 + 32) count] - 1 <= a3)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke_2;
    v10[3] = &unk_24410;
    v10[4] = *(void *)(a1 + 40);
    [v5 setCompletion:v10];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) snapshotManager];
    id v7 = [v6 primaryDataCoordinator];
    [v7 performRequest:v5];
  }
  v8 = [*(id *)(a1 + 40) snapshotManager];
  id v9 = [v8 primaryDataCoordinator];
  [v9 performRequest:v5];
}

id __50__ViewHierarchyService__enqueueAdditionalRequests__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enqueueRemainingUnfetchedPropertyValuesRequest];
}

- (void)_enqueueRemainingUnfetchedPropertyValuesRequest
{
  id v3 = [(ViewHierarchyService *)self snapshotManager];
  v4 = [v3 snapshot];

  id v5 = +[RequestFactory requestForRemainingLazyPropertiesWithSnapshot:v4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __71__ViewHierarchyService__enqueueRemainingUnfetchedPropertyValuesRequest__block_invoke;
  v8[3] = &unk_24410;
  v8[4] = self;
  [v5 setCompletion:v8];
  id v6 = [(ViewHierarchyService *)self snapshotManager];
  id v7 = [v6 primaryDataCoordinator];
  [v7 performRequest:v5];
}

void __71__ViewHierarchyService__enqueueRemainingUnfetchedPropertyValuesRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) dataSourceConnection];
  [v4 closeConnection];

  id v5 = (char *)[v3 status];
  id v6 = *(void **)(a1 + 32);
  if (v5 == (unsigned char *)&dword_0 + 3) {
    [v6 _saveCompletedRequests];
  }
  else {
    [v6 _requestFailed:v3];
  }
}

- (void)_requestFailed:(id)a3
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  id v7 = @"Failed to capture view hierarchy";
  v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v5 = +[NSError errorWithDomain:@"com.apple.dt.ViewHierarchyService" code:-1 userInfo:v4];

  [(ViewHierarchyService *)self finishWithError:v5];
}

- (void)finishWithError:(id)a3
{
  id v6 = a3;
  v4 = [(ViewHierarchyService *)self completionBlock];

  if (v4)
  {
    id v5 = [(ViewHierarchyService *)self completionBlock];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(ViewHierarchyService *)self setCompletionBlock:0];
  }
}

- (void)_saveCompletedRequests
{
  id v3 = [objc_alloc((Class)NSFileWrapper) initDirectoryWithFileWrappers:&__NSDictionary0__struct];
  v4 = [(ViewHierarchyService *)self destination];
  id v5 = [v4 lastPathComponent];
  [v3 setPreferredFilename:v5];

  id v6 = [objc_alloc((Class)NSFileWrapper) initDirectoryWithFileWrappers:&__NSDictionary0__struct];
  [v6 setPreferredFilename:@"RequestResponses"];
  id v7 = [(ViewHierarchyService *)self snapshotManager];
  v8 = [v7 primaryDataCoordinator];
  id v9 = [v8 completedRequests];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __46__ViewHierarchyService__saveCompletedRequests__block_invoke;
  v19[3] = &unk_24460;
  id v20 = v6;
  id v10 = v6;
  [v9 enumerateObjectsUsingBlock:v19];

  id v11 = [v3 addFileWrapper:v10];
  id v12 = objc_alloc((Class)NSFileWrapper);
  id v13 = [(ViewHierarchyService *)self _metadata];
  id v14 = [v12 initRegularFileWithContents:v13];

  [v14 setPreferredFilename:@"metadata"];
  id v15 = [v3 addFileWrapper:v14];
  v16 = [(ViewHierarchyService *)self destination];
  id v18 = 0;
  [v3 writeToURL:v16 options:1 originalContentsURL:0 error:&v18];
  id v17 = v18;

  [(ViewHierarchyService *)self finishWithError:v17];
}

void __46__ViewHierarchyService__saveCompletedRequests__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = objc_alloc((Class)NSFileWrapper);
  id v7 = [v5 rawResponseData];

  id v10 = [v6 initRegularFileWithContents:v7];
  v8 = +[NSString stringWithFormat:@"Response_%lu", a3];
  [v10 setPreferredFilename:v8];

  id v9 = [*(id *)(a1 + 32) addFileWrapper:v10];
}

- (id)_metadata
{
  v11[0] = &off_30568;
  v10[0] = @"DocumentVersion";
  v10[1] = @"RunnablePID";
  id v3 = +[NSNumber numberWithInt:[(ViewHierarchyService *)self runnablePid]];
  v11[1] = v3;
  v10[2] = @"RunnableDisplayName";
  v4 = [(ViewHierarchyService *)self destination];
  id v5 = [v4 lastPathComponent];
  id v6 = [v5 stringByReplacingOccurrencesOfString:@".viewhierarchy" withString:&stru_28750];
  v11[2] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  v8 = +[NSPropertyListSerialization dataWithPropertyList:v7 format:100 options:0 error:0];

  return v8;
}

- (id)defaultPlatform
{
  return @"iOS";
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (DBGStandaloneDataSourceConnection)dataSourceConnection
{
  return (DBGStandaloneDataSourceConnection *)objc_getProperty(self, a2, 24, 1);
}

- (DBGSnapshotManager)snapshotManager
{
  return (DBGSnapshotManager *)objc_getProperty(self, a2, 32, 1);
}

- (int)runnablePid
{
  return self->_runnablePid;
}

- (void)setRunnablePid:(int)a3
{
  self->_runnablePid = a3;
}

- (OS_dispatch_queue)captureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)destination
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDestination:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_dataSourceConnection, 0);

  objc_storeStrong((id *)&self->_platform, 0);
}

@end