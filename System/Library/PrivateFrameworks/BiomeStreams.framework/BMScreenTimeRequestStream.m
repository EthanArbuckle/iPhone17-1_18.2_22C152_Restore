@interface BMScreenTimeRequestStream
- (BMScreenTimeRequestStream)init;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)init;
@end

@implementation BMScreenTimeRequestStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FB88] streamIdentifierForStream:34];
}

- (BMScreenTimeRequestStream)init
{
  v11.receiver = self;
  v11.super_class = (Class)BMScreenTimeRequestStream;
  v2 = [(BMScreenTimeRequestStream *)&v11 init];
  if (v2)
  {
    v3 = BMRootLibraryBridge();
    v4 = [v3 Family];
    v5 = [v4 ScreenTime];
    v6 = [v5 Request];
    uint64_t v7 = [v6 storeStreamWithLegacyClass:objc_opt_class()];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v7;

    if (!v2->_storeStream)
    {
      v9 = __biome_log_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        -[BMScreenTimeRequestStream init](v9);
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

- (id)source
{
  return [(BMStoreStream *)self->_storeStream source];
}

- (id)publisher
{
  v3 = [BMDSLStreamPublisher alloc];
  v4 = [(BMScreenTimeRequestStream *)self identifier];
  v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:1 eventDataClass:objc_opt_class()];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "Unable to initialize BMPublicStreamScreenTimeRequest, please consult error logs for cause", v1, 2u);
}

@end