@interface HMDCameraClipOperationDataSource
- (double)operationTimeout;
- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4;
- (void)appendData:(id)a3 toStreamingAssetAppendContext:(id)a4 completion:(id)a5;
- (void)submitOperationEvent:(id)a3;
@end

@implementation HMDCameraClipOperationDataSource

- (void)submitOperationEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v4 submitLogEvent:v3];
}

- (id)timerWithTimeInterval:(double)a3 options:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a4 options:a3];
  return v4;
}

- (void)appendData:(id)a3 toStreamingAssetAppendContext:(id)a4 completion:(id)a5
{
}

- (double)operationTimeout
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"clipModelOperationTimeout"];

  id v4 = [v3 numberValue];
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

@end