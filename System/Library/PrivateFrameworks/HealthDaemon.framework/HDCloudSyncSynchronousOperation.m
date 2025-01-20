@interface HDCloudSyncSynchronousOperation
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
- (BOOL)performWithError:(id *)a3;
- (void)main;
@end

@implementation HDCloudSyncSynchronousOperation

- (void)main
{
  id v5 = 0;
  BOOL v3 = [(HDCloudSyncSynchronousOperation *)self performWithError:&v5];
  id v4 = v5;
  [(HDCloudSyncOperation *)self finishWithSuccess:v3 error:v4];
}

- (BOOL)performWithError:(id *)a3
{
  return 0;
}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

@end