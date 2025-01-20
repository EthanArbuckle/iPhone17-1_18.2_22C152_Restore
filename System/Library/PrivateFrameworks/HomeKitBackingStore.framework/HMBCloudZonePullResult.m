@interface HMBCloudZonePullResult
- (HMBCloudZonePullResult)initWithProcessingFuture:(id)a3;
- (NAFuture)processingFuture;
@end

@implementation HMBCloudZonePullResult

- (void).cxx_destruct
{
}

- (NAFuture)processingFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 8, 1);
}

- (HMBCloudZonePullResult)initWithProcessingFuture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBCloudZonePullResult;
  v6 = [(HMBCloudZonePullResult *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_processingFuture, a3);
  }

  return v7;
}

@end