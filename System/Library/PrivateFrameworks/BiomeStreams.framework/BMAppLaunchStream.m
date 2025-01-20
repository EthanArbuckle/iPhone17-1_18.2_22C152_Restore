@interface BMAppLaunchStream
- (BMAppLaunchStream)init;
- (BMAppLaunchStream)initWithConfig:(id)a3;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)remoteDevices;
- (id)remoteDevicesWithError:(id *)a3;
- (id)source;
- (void)init;
@end

@implementation BMAppLaunchStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FB88] streamIdentifierForStream:1];
}

- (BMAppLaunchStream)init
{
  v10.receiver = self;
  v10.super_class = (Class)BMAppLaunchStream;
  v2 = [(BMAppLaunchStream *)&v10 init];
  if (v2)
  {
    v3 = BMRootLibraryBridge();
    v4 = [v3 App];
    v5 = [v4 InFocus];
    uint64_t v6 = [v5 storeStreamWithLegacyClass:objc_opt_class()];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMAppLaunchStream init]();
      }
    }
  }
  return v2;
}

- (BMAppLaunchStream)initWithConfig:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMAppLaunchStream;
  v5 = [(BMAppLaunchStream *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [BMStoreStream alloc];
    v7 = [(BMAppLaunchStream *)v5 identifier];
    uint64_t v8 = [(BMStoreStream *)v6 initWithStreamIdentifier:v7 storeConfig:v4 streamType:2 eventDataClass:objc_opt_class() useCase:*MEMORY[0x1E4F4FAF8]];
    storeStream = v5->_storeStream;
    v5->_storeStream = (BMStoreStream *)v8;

    if (!v5->_storeStream)
    {
      objc_super v10 = __biome_log_for_category();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BMAppLaunchStream init]();
      }
    }
  }

  return v5;
}

- (id)remoteDevices
{
  return [(BMStoreStream *)self->_storeStream remoteDevices];
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
  id v4 = [(BMAppLaunchStream *)self identifier];
  v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:1 eventDataClass:objc_opt_class()];

  return v5;
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return [(BMStoreStream *)self->_storeStream publishersForRemoteDevices:a3 startTime:a5 includeLocal:a6 pipeline:a4];
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  return -[BMStoreStream publishersForRemoteDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self->_storeStream, "publishersForRemoteDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", a3, a4, a5, a6, a7, a8);
}

- (id)publishersForDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10
{
  return -[BMStoreStream publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:](self->_storeStream, "publishersForDevices:startTime:endTime:maxEvents:lastN:reversed:includeLocal:pipeline:", a3, a4, a5, a6, a7, a8);
}

- (id)remoteDevicesWithError:(id *)a3
{
  return [(BMStoreStream *)self->_storeStream remoteDevicesWithError:a3];
}

- (id)source
{
  return [(BMStoreStream *)self->_storeStream source];
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "Unable to initialize BMAppLaunchStream, please consult error logs for cause", v2, v3, v4, v5, v6);
}

@end