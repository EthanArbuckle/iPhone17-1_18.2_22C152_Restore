@interface BMNowPlayingStream
- (BMNowPlayingStream)init;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(id)a4 endTime:(id)a5 maxEvents:(id)a6 lastN:(id)a7 reversed:(BOOL)a8 includeLocal:(BOOL)a9 pipeline:(id)a10;
- (id)remoteDevices;
- (id)source;
- (void)init;
@end

@implementation BMNowPlayingStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FB88] streamIdentifierForStream:17];
}

- (BMNowPlayingStream)init
{
  v10.receiver = self;
  v10.super_class = (Class)BMNowPlayingStream;
  v2 = [(BMNowPlayingStream *)&v10 init];
  if (v2)
  {
    v3 = BMRootLibraryBridge();
    v4 = [v3 Media];
    v5 = [v4 NowPlaying];
    uint64_t v6 = [v5 storeStreamWithLegacyClass:objc_opt_class()];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMNowPlayingStream init](v8);
      }
    }
  }
  return v2;
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
  v4 = [(BMNowPlayingStream *)self identifier];
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

- (id)remoteDevices
{
  return [(BMStoreStream *)self->_storeStream remoteDevices];
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
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "Unable to initialize BMPublicStreamNowPlaying, please consult error logs for cause", v1, 2u);
}

@end