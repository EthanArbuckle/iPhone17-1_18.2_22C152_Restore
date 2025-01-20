@interface ATXAppLaunchInferredModeSessionBiomeStream
- (ATXAppLaunchInferredModeSessionBiomeStream)init;
- (ATXAppLaunchInferredModeSessionBiomeStream)initWithStoreConfig:(id)a3;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)source;
- (void)sendEvent:(id)a3;
@end

@implementation ATXAppLaunchInferredModeSessionBiomeStream

- (NSString)identifier
{
  return (NSString *)@"appLaunchInferredMode";
}

- (ATXAppLaunchInferredModeSessionBiomeStream)init
{
  return [(ATXAppLaunchInferredModeSessionBiomeStream *)self initWithStoreConfig:0];
}

- (ATXAppLaunchInferredModeSessionBiomeStream)initWithStoreConfig:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAppLaunchInferredModeSessionBiomeStream;
  v5 = [(ATXAppLaunchInferredModeSessionBiomeStream *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F50278], "atx_storeConfig");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F50490]) initWithPrivateStreamIdentifier:@"appLaunchInferredMode" storeConfig:v6 eventDataClass:objc_opt_class()];
    inner = v5->_inner;
    v5->_inner = (BMStoreStream *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return (id)[(BMStoreStream *)self->_inner publisherFromStartTime:a3];
}

- (id)source
{
  return (id)[(BMStoreStream *)self->_inner source];
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXAppLaunchInferredModeSessionBiomeStream *)self source];
  [v5 sendEvent:v4];
}

- (void).cxx_destruct
{
}

@end