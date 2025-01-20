@interface HDCloudSyncPipelineStage
+ (BOOL)shouldLogAtOperationEnd;
+ (BOOL)shouldLogAtOperationStart;
+ (BOOL)shouldProduceOperationAnalytics;
- (BOOL)criticalFailureOnError;
- (HDCloudSyncPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (id)pipelineStageIgnoringErrors;
- (int64_t)expectedReceiveSize;
- (int64_t)expectedSendSize;
- (void)setCriticalFailureOnError:(BOOL)a3;
- (void)setExpectedReceiveSize:(int64_t)a3;
- (void)setExpectedSendSize:(int64_t)a3;
@end

@implementation HDCloudSyncPipelineStage

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

+ (BOOL)shouldLogAtOperationEnd
{
  return 0;
}

+ (BOOL)shouldProduceOperationAnalytics
{
  return 0;
}

- (HDCloudSyncPipelineStage)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HDCloudSyncPipelineStage;
  result = [(HDCloudSyncOperation *)&v5 initWithConfiguration:a3 cloudState:a4];
  if (result)
  {
    result->_criticalFailureOnError = 1;
    result->_expectedSendSize = 1;
    result->_expectedReceiveSize = 1;
  }
  return result;
}

- (BOOL)criticalFailureOnError
{
  return self->_criticalFailureOnError;
}

- (void)setCriticalFailureOnError:(BOOL)a3
{
  self->_criticalFailureOnError = a3;
}

- (int64_t)expectedSendSize
{
  return self->_expectedSendSize;
}

- (void)setExpectedSendSize:(int64_t)a3
{
  self->_expectedSendSize = a3;
}

- (int64_t)expectedReceiveSize
{
  return self->_expectedReceiveSize;
}

- (void)setExpectedReceiveSize:(int64_t)a3
{
  self->_expectedReceiveSize = a3;
}

- (id)pipelineStageIgnoringErrors
{
  v3 = [HDCloudSyncIgnoredErrorsPipelineStage alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  objc_super v5 = [(HDCloudSyncOperation *)self cloudState];
  v6 = [(HDCloudSyncIgnoredErrorsPipelineStage *)v3 initWithConfiguration:v4 cloudState:v5 stage:self];

  return v6;
}

@end