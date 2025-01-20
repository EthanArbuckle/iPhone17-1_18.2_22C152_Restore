@interface BMContextualActionsStream
- (BMContextualActionsStream)init;
- (NSString)identifier;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
- (void)init;
@end

@implementation BMContextualActionsStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FB88] streamIdentifierForStream:5];
}

- (BMContextualActionsStream)init
{
  v10.receiver = self;
  v10.super_class = (Class)BMContextualActionsStream;
  v2 = [(BMContextualActionsStream *)&v10 init];
  if (v2)
  {
    v3 = BMRootLibraryBridge();
    v4 = [v3 App];
    v5 = [v4 ContextualActions];
    uint64_t v6 = [v5 storeStreamWithLegacyClass:objc_opt_class()];
    storeStream = v2->_storeStream;
    v2->_storeStream = (BMStoreStream *)v6;

    if (!v2->_storeStream)
    {
      v8 = __biome_log_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BMContextualActionsStream init]();
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
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_18E67D000, v0, v1, "Unable to initialize BMContextualActionsStream, please consult error logs for cause", v2, v3, v4, v5, v6);
}

@end