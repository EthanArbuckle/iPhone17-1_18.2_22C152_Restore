@interface HMIVideoProcessingNode
- (void)finish;
- (void)finishWithCompletionHandler:(id)a3;
- (void)flush;
- (void)flushAsync;
- (void)handleAudioSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)handleVideoSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation HMIVideoProcessingNode

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int MediaType = HMICMSampleBufferGetMediaType(a3);
  if (MediaType == 1936684398)
  {
    [(HMIVideoProcessingNode *)self handleAudioSampleBuffer:a3];
  }
  else if (MediaType == 1986618469)
  {
    [(HMIVideoProcessingNode *)self handleVideoSampleBuffer:a3];
  }
  else
  {
    v6 = (void *)MEMORY[0x22A641C70]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      v10 = HMICMSampleBufferFormattedDescription(a3, 0);
      int v11 = 138543618;
      v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_225DC6000, v8, OS_LOG_TYPE_ERROR, "%{public}@Ignoring %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)handleVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)handleAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = NSString;
  v6 = NSStringFromSelector(a2);
  v7 = [v5 stringWithFormat:@"You must override %@ in a subclass", v6];
  id v8 = [v3 exceptionWithName:v4 reason:v7 userInfo:0];

  objc_exception_throw(v8);
}

- (void)finish
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  uint64_t v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFF940];
  uint64_t v6 = *MEMORY[0x263EFF498];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"You must override %@ in a subclass", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (void)flush
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)flushAsync
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  v5 = NSStringFromSelector(a2);
  uint64_t v6 = [v4 stringWithFormat:@"You must override %@ in a subclass", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end