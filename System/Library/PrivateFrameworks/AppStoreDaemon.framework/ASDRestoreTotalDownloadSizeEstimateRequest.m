@interface ASDRestoreTotalDownloadSizeEstimateRequest
- (ASDRestoreTotalDownloadSizeEstimateRequest)init;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation ASDRestoreTotalDownloadSizeEstimateRequest

- (ASDRestoreTotalDownloadSizeEstimateRequest)init
{
  v3 = +[ASDRestoreService sharedInstance];
  id v4 = v3;
  if (self)
  {
    v7.receiver = self;
    v7.super_class = (Class)ASDRestoreTotalDownloadSizeEstimateRequest;
    v5 = [(ASDRestoreTotalDownloadSizeEstimateRequest *)&v7 init];
    self = v5;
    if (v5) {
      objc_storeStrong((id *)&v5->_restoreService, v3);
    }
  }

  return self;
}

- (void)startWithCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end