@interface BMSocialHighlightFeedbackStream
+ (id)new;
- (BMSocialHighlightFeedbackStream)init;
- (BMSocialHighlightFeedbackStream)initWithPruningPolicy:(id)a3;
- (NSString)identifier;
- (id)publisher;
- (id)publisherFromStartTime:(double)a3;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7;
- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6;
- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6;
- (id)remoteDevices;
- (id)source;
- (void)deleteEventsWithPredicate:(id)a3;
- (void)deleteLocalAndRemoteEventsWithPredicateBlock:(id)a3;
- (void)deleteLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4;
@end

@implementation BMSocialHighlightFeedbackStream

- (id)remoteDevices
{
  return [(BMRestrictedStream *)self->_stream remoteDevices];
}

- (id)publishersForRemoteDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return [(BMRestrictedStream *)self->_stream publishersForRemoteDevices:a3 startTime:a5 includeLocal:a6 pipeline:a4];
}

- (NSString)identifier
{
  return (NSString *)[MEMORY[0x1E4F4FBA8] libraryPathForStreamIdentifier:@"feedbackSocialHighlights"];
}

+ (id)new
{
  return objc_alloc_init(BMSocialHighlightFeedbackStream);
}

- (BMSocialHighlightFeedbackStream)init
{
  v8.receiver = self;
  v8.super_class = (Class)BMSocialHighlightFeedbackStream;
  v2 = [(BMSocialHighlightFeedbackStream *)&v8 init];
  if (v2)
  {
    v3 = [BMRestrictedStream alloc];
    v4 = [(BMSocialHighlightFeedbackStream *)v2 identifier];
    uint64_t v5 = [(BMRestrictedStream *)v3 initWithIdentifier:v4 eventDataClass:objc_opt_class()];
    stream = v2->_stream;
    v2->_stream = (BMRestrictedStream *)v5;
  }
  return v2;
}

- (BMSocialHighlightFeedbackStream)initWithPruningPolicy:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BMSocialHighlightFeedbackStream;
  uint64_t v5 = [(BMSocialHighlightFeedbackStream *)&v11 init];
  if (v5)
  {
    v6 = [BMRestrictedStream alloc];
    v7 = [(BMSocialHighlightFeedbackStream *)v5 identifier];
    uint64_t v8 = [(BMRestrictedStream *)v6 initWithIdentifier:v7 segmentSize:*MEMORY[0x1E4F502B8] pruningPolicy:v4 eventDataClass:objc_opt_class()];
    stream = v5->_stream;
    v5->_stream = (BMRestrictedStream *)v8;
  }
  return v5;
}

- (id)publisherFromStartTime:(double)a3
{
  return [(BMRestrictedStream *)self->_stream publisherFromStartTime:a3];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 reversed:(BOOL)a6
{
  return [(BMRestrictedStream *)self->_stream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:0 reversed:a6];
}

- (id)publisherWithStartTime:(id)a3 endTime:(id)a4 maxEvents:(id)a5 lastN:(id)a6 reversed:(BOOL)a7
{
  return [(BMRestrictedStream *)self->_stream publisherWithStartTime:a3 endTime:a4 maxEvents:a5 lastN:a6 reversed:a7];
}

- (id)publisher
{
  v3 = [BMDSLStreamPublisher alloc];
  id v4 = [(BMSocialHighlightFeedbackStream *)self identifier];
  uint64_t v5 = [(BMDSLStreamPublisher *)v3 initWithIdentifier:v4 streamType:2 eventDataClass:objc_opt_class()];

  return v5;
}

- (id)source
{
  return [(BMRestrictedStream *)self->_stream source];
}

- (void)deleteEventsWithPredicate:(id)a3
{
}

- (void)deleteLocalAndRemoteEventsWithPredicateBlock:(id)a3
{
}

- (void)deleteLocalAndRemoteEventsWithReason:(unint64_t)a3 usingPredicateBlock:(id)a4
{
}

- (id)publishersForDevices:(id)a3 startTime:(double)a4 includeLocal:(BOOL)a5 pipeline:(id)a6
{
  return [(BMRestrictedStream *)self->_stream publishersForDevices:a3 startTime:a5 includeLocal:a6 pipeline:a4];
}

- (void).cxx_destruct
{
}

@end