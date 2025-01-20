@interface AVAssetWriterInputTerminalHelper
- (AVAssetWriterInputTerminalHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterInputTerminalHelper)initWithConfigurationState:(id)a3 terminalStatus:(int64_t)a4;
- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4;
- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4;
- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)mediaDataRequesterShouldRequestMediaData;
- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3;
- (int64_t)appendCaption:(id)a3 error:(id *)a4;
- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4;
- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (int64_t)status;
- (void)markCurrentPassAsFinished;
- (void)requestMediaDataOnceIfNecessaryWithMediaDataRequester:(id)a3;
- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4;
- (void)stopRequestingMediaData;
@end

@implementation AVAssetWriterInputTerminalHelper

- (AVAssetWriterInputTerminalHelper)initWithConfigurationState:(id)a3
{
  return [(AVAssetWriterInputTerminalHelper *)self initWithConfigurationState:a3 terminalStatus:0];
}

- (AVAssetWriterInputTerminalHelper)initWithConfigurationState:(id)a3 terminalStatus:(int64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)AVAssetWriterInputTerminalHelper;
  result = [(AVAssetWriterInputHelper *)&v13 initWithConfigurationState:a3];
  if ((unint64_t)(a4 - 2) >= 3)
  {
    v12 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)result, a2, @"invalid parameter not satisfying: %s", v7, v8, v9, v10, v11, (uint64_t)"(terminalStatus == AVAssetWriterStatusCompleted) || (terminalStatus == AVAssetWriterStatusCancelled) || (terminalStatus == AVAssetWriterStatusFailed)"), 0 reason userInfo];
    objc_exception_throw(v12);
  }
  if (result) {
    result->_terminalStatus = a4;
  }
  return result;
}

- (int64_t)status
{
  return self->_terminalStatus;
}

- (id)transitionToAndReturnTerminalHelperWithTerminalStatus:(int64_t)a3
{
  return 0;
}

- (BOOL)isReadyForMoreMediaData
{
  if ([(AVAssetWriterInputTerminalHelper *)self status] == 3) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputTerminalHelper;
  return [(AVAssetWriterInputHelper *)&v4 isReadyForMoreMediaData];
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  if ([(AVAssetWriterInputTerminalHelper *)self status] != 3)
  {
    v28.receiver = self;
    v28.super_class = (Class)AVAssetWriterInputTerminalHelper;
    [(AVAssetWriterInputHelper *)&v28 requestMediaDataWhenReadyOnQueue:a3 usingBlock:a4];
    return;
  }
  if (self->_didRequestMediaDataOnce)
  {
    objc_super v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3B8];
    v15 = (objc_class *)objc_opt_class();
    uint64_t v21 = AVMethodExceptionReasonWithClassAndSelector(v15, a2, @"cannot be called more than once.", v16, v17, v18, v19, v20, v27);
    v22 = v13;
    uint64_t v23 = v14;
    goto LABEL_13;
  }
  self->_didRequestMediaDataOnce = 1;
  if (!a3)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = "queue != NULL";
LABEL_12:
    uint64_t v21 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)v26);
    v22 = v24;
    uint64_t v23 = v25;
LABEL_13:
    objc_exception_throw((id)[v22 exceptionWithName:v23 reason:v21 userInfo:0]);
  }
  if (!a4)
  {
    v24 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v25 = *MEMORY[0x1E4F1C3C8];
    v26 = "block != nil";
    goto LABEL_12;
  }
  dispatch_async((dispatch_queue_t)a3, a4);
}

- (void)stopRequestingMediaData
{
  v2.receiver = self;
  v2.super_class = (Class)AVAssetWriterInputTerminalHelper;
  [(AVAssetWriterInputHelper *)&v2 stopRequestingMediaData];
}

- (BOOL)mediaDataRequesterShouldRequestMediaData
{
  id v3 = [(AVWeakReference *)[(AVAssetWriterInputHelper *)self weakReferenceToAssetWriterInput] referencedObject];
  int64_t v4 = [(AVAssetWriterInputTerminalHelper *)self status];
  BOOL result = 0;
  if (v4 == 3 && v3)
  {
    if ([v3 numberOfAppendFailures]) {
      return 0;
    }
    else {
      return [v3 _markAsFinishedCalled] ^ 1;
    }
  }
  return result;
}

- (void)requestMediaDataOnceIfNecessaryWithMediaDataRequester:(id)a3
{
  v5 = [a3 requestQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__AVAssetWriterInputTerminalHelper_requestMediaDataOnceIfNecessaryWithMediaDataRequester___block_invoke;
  v6[3] = &unk_1E57B2098;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async(v5, v6);
}

uint64_t __90__AVAssetWriterInputTerminalHelper_requestMediaDataOnceIfNecessaryWithMediaDataRequester___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) requestMediaDataIfNecessary];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 setDelegate:0];
}

- (BOOL)canStartRespondingToEachPassDescriptionReturningReason:(id *)a3
{
  int64_t v4 = [(AVAssetWriterInputTerminalHelper *)self status];
  if (a3 && v4 != 3) {
    *a3 = @"cannot be called after canceling or finishing writing";
  }
  return v4 == 3;
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  return 2;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  return 0;
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  return 0;
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  return 2;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  return 2;
}

- (void)markCurrentPassAsFinished
{
  if ([(AVAssetWriterInputTerminalHelper *)self status] == 2)
  {
    v3.receiver = self;
    v3.super_class = (Class)AVAssetWriterInputTerminalHelper;
    [(AVAssetWriterInputHelper *)&v3 markCurrentPassAsFinished];
  }
}

@end