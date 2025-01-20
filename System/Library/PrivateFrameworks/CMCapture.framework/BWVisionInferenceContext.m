@interface BWVisionInferenceContext
+ (void)initialize;
- (BOOL)isPrepared;
- (BWVisionInferenceContext)init;
- (VNSequenceRequestHandler)sequenceRequestHandler;
- (int)prepareForInference;
- (void)dealloc;
@end

@implementation BWVisionInferenceContext

- (BWVisionInferenceContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)BWVisionInferenceContext;
  v2 = [(BWVisionInferenceContext *)&v4 init];
  if (v2 && !atomic_fetch_add(numberOfOutstandingContexts, 1u)) {
    BWVNSetRequestConcurrentTasksProcessingTimeout(4000000000);
  }
  return v2;
}

- (VNSequenceRequestHandler)sequenceRequestHandler
{
  return self->_sequenceRequestHandler;
}

- (int)prepareForInference
{
  if ([(BWVisionInferenceContext *)self isPrepared]) {
    return 0;
  }
  v3 = (VNSequenceRequestHandler *)objc_alloc_init((Class)getVNSequenceRequestHandlerClass());
  self->_sequenceRequestHandler = v3;
  if (v3) {
    return 0;
  }
  else {
    return -31702;
  }
}

- (BOOL)isPrepared
{
  return self->_sequenceRequestHandler != 0;
}

+ (void)initialize
{
}

- (void)dealloc
{
  if (atomic_fetch_add(numberOfOutstandingContexts, 0xFFFFFFFF) == 1)
  {
    [(id)getVNSequenceRequestHandlerClass() forcedCleanup];
    BWVNSetRequestConcurrentTasksProcessingTimeout(0);
  }

  v3.receiver = self;
  v3.super_class = (Class)BWVisionInferenceContext;
  [(BWVisionInferenceContext *)&v3 dealloc];
}

@end