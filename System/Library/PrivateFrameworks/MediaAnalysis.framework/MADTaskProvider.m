@interface MADTaskProvider
+ (unint64_t)taskID;
- (id)logDescription;
- (id)nextAssetProcessingTask;
- (id)nextClusterProcessingTask;
- (id)nextDownloadAssetProcessingTask;
- (unint64_t)iterations;
- (unint64_t)priority;
- (unint64_t)taskID;
@end

@implementation MADTaskProvider

+ (unint64_t)taskID
{
  return 0;
}

- (unint64_t)taskID
{
  v2 = objc_opt_class();
  return (unint64_t)[v2 taskID];
}

- (unint64_t)priority
{
  return 0;
}

- (unint64_t)iterations
{
  return 1;
}

- (id)nextAssetProcessingTask
{
  return 0;
}

- (id)nextDownloadAssetProcessingTask
{
  return 0;
}

- (id)nextClusterProcessingTask
{
  return 0;
}

- (id)logDescription
{
  uint64_t v2 = [(MADTaskProvider *)self taskID];
  return VCPTaskIDDescription(v2);
}

@end