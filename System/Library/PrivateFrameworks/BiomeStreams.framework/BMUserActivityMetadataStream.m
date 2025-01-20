@interface BMUserActivityMetadataStream
- (BMUserActivityMetadataStream)init;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)source;
@end

@implementation BMUserActivityMetadataStream

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"UserActivityMetadata"];
}

- (BMUserActivityMetadataStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)BMUserActivityMetadataStream;
  v2 = [(BMUserActivityMetadataStream *)&v8 init];
  if (v2)
  {
    v3 = [BMRestrictedStream alloc];
    v4 = [(BMUserActivityMetadataStream *)v2 identifier];
    uint64_t v5 = [(BMRestrictedStream *)v3 initWithIdentifier:v4 eventDataClass:objc_opt_class()];
    stream = v2->_stream;
    v2->_stream = (BMRestrictedStream *)v5;
  }
  return v2;
}

- (id)publisherFromStartTime:(double)a3
{
  return [(BMRestrictedStream *)self->_stream publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return [(BMRestrictedStream *)self->_stream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 reversed:a6];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return [(BMRestrictedStream *)self->_stream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
}

- (id)publisher
{
  v3 = [BMDSLStreamPublisher alloc];
  v4 = [(BMUserActivityMetadataStream *)self identifier];
  uint64_t v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:2 eventDataClass:objc_opt_class()];

  return v5;
}

- (id)source
{
  return [(BMRestrictedStream *)self->_stream source];
}

- (void).cxx_destruct
{
}

@end