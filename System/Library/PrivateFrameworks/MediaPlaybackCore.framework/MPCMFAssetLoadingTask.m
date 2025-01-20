@interface MPCMFAssetLoadingTask
+ (id)wrap:(id)a3;
- (BOOL)isCancelled;
@end

@implementation MPCMFAssetLoadingTask

- (void).cxx_destruct
{
}

- (BOOL)isCancelled
{
  return [(MFAssetLoadingTask *)self->_mfTask isCancelled];
}

+ (id)wrap:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MPCMFAssetLoadingTask);
  v6 = v5;
  if (v5) {
    objc_storeStrong((id *)&v5->_mfTask, a3);
  }

  return v6;
}

@end