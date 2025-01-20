@interface IDEGaugeDataProviderService_SceneKit
+ (void)registerCapabilities:(id)a3;
- (id)sampleAttributes:(id)a3 forPIDs:(id)a4;
- (id)startSamplingForPIDs:(id)a3;
- (id)stopSamplingForPIDs:(id)a3;
@end

@implementation IDEGaugeDataProviderService_SceneKit

+ (void)registerCapabilities:(id)a3
{
}

- (id)startSamplingForPIDs:(id)a3
{
  id v3 = a3;
  v4 = +[IDEDataProvider_SceneKit sharedDataProvider];
  v5 = [v4 startSamplingForPIDs:v3];

  return v5;
}

- (id)sampleAttributes:(id)a3 forPIDs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[IDEDataProvider_SceneKit sharedDataProvider];
  v8 = [v7 captureAttributes:v6 forPIDs:v5];

  return v8;
}

- (id)stopSamplingForPIDs:(id)a3
{
  id v3 = a3;
  v4 = +[IDEDataProvider_SceneKit sharedDataProvider];
  id v5 = [v4 stopSamplingForPIDs:v3];

  return v5;
}

@end