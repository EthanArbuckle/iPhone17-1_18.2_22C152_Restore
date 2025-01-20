@interface BMTestStream
- (BMTestStream)init;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)init;
@end

@implementation BMTestStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FB88] streamIdentifierForStream:3];
}

- (BMTestStream)init
{
  v10.receiver = self;
  v10.super_class = (Class)BMTestStream;
  v2 = [(BMTestStream *)&v10 init];
  if (v2)
  {
    v3 = (void *)[MEMORY[0x1E4F50278] newPublicStreamDefaultConfigurationWithProtectionClass:3];
    v4 = [BMStoreStream alloc];
    v5 = [(BMTestStream *)v2 identifier];
    uint64_t v6 = [(BMStoreStream *)v4 initWithStreamIdentifier:v5 storeConfig:v3 streamType:2 eventDataClass:objc_opt_class() useCase:*MEMORY[0x1E4F4FAF8]];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMTestStream init](v8);
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

- (void).cxx_destruct
{
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18E67D000, log, OS_LOG_TYPE_FAULT, "Unable to initialize BMTestStream, please consult error logs for cause", v1, 2u);
}

@end