@interface BMAppClipLaunchStream
- (BMAppClipLaunchStream)init;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)init;
@end

@implementation BMAppClipLaunchStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"AppClipLaunch"];
}

- (BMAppClipLaunchStream)init
{
  v11.receiver = self;
  v11.super_class = (Class)BMAppClipLaunchStream;
  v2 = [(BMAppClipLaunchStream *)&v11 init];
  if (v2)
  {
    v3 = BMRootLibraryBridge();
    v4 = [v3 App];
    v5 = [v4 Clip];
    v6 = [v5 InFocus];
    uint64_t v7 = [v6 storeStreamWithLegacyClass:objc_opt_class()];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v7;

    if (!v2->_storeStream)
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMAppClipLaunchStream init]();
      }
    }
  }
  return v2;
}

- (id)source
{
  v3 = [BMAppClipLaunchSource alloc];
  v4 = [(BMStoreStream *)self->_storeStream source];
  v5 = [(BMAppClipLaunchSource *)v3 initWithStoreSource:v4];

  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return [(BMStoreStream *)self->_storeStream publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:0 reversed:a6];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return [(BMStoreStream *)self->_storeStream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
}

- (id)publisher
{
  v3 = [BMDSLStreamPublisher alloc];
  v4 = [(BMAppClipLaunchStream *)self identifier];
  v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:1 eventDataClass:objc_opt_class()];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "Unable to initialize BMPublicStreamAppClipLaunch, please consult error logs for cause", v2, v3, v4, v5, v6);
}

@end