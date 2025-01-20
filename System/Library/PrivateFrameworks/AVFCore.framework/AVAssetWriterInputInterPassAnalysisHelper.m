@interface AVAssetWriterInputInterPassAnalysisHelper
- (AVAssetWriterInputInterPassAnalysisHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterInputInterPassAnalysisHelper)initWithWritingHelper:(id)a3;
- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4;
- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4;
- (BOOL)canPerformMultiplePasses;
- (BOOL)isReadyForMoreMediaData;
- (BOOL)shouldRespondToInitialPassDescription;
- (__CVPixelBufferPool)pixelBufferPool;
- (id)currentPassDescription;
- (int64_t)appendCaption:(id)a3 error:(id *)a4;
- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4;
- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (int64_t)status;
- (void)dealloc;
- (void)markAsFinished;
- (void)markCurrentPassAsFinished;
- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4;
- (void)startPassAnalysis;
- (void)stopRequestingMediaData;
@end

@implementation AVAssetWriterInputInterPassAnalysisHelper

- (AVAssetWriterInputInterPassAnalysisHelper)initWithConfigurationState:(id)a3
{
  return [(AVAssetWriterInputInterPassAnalysisHelper *)self initWithWritingHelper:0];
}

- (AVAssetWriterInputInterPassAnalysisHelper)initWithWritingHelper:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 3031, @"Invalid parameter not satisfying: %@", @"writingHelper != nil");
  }
  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterInputInterPassAnalysisHelper;
  v5 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v8, sel_initWithConfigurationState_, [a3 configurationState]);
  if (v5)
  {
    v6 = (AVAssetWriterInputWritingHelper *)a3;
    v5->_writingHelper = v6;
    v5->_initialPassDescription = [(AVAssetWriterInputWritingHelper *)v6 currentPassDescription];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputInterPassAnalysisHelper;
  [(AVAssetWriterInputHelper *)&v3 dealloc];
}

- (void)startPassAnalysis
{
  objc_super v3 = [(AVAssetWriterInputWritingHelper *)self->_writingHelper _assetWriterTrack];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AVAssetWriterInputInterPassAnalysisHelper_startPassAnalysis__block_invoke;
  v4[3] = &unk_1E57B4710;
  v4[4] = self;
  [(AVFigAssetWriterTrack *)v3 endPassWithCompletionHandler:v4];
}

uint64_t __62__AVAssetWriterInputInterPassAnalysisHelper_startPassAnalysis__block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v5 = *(void **)(a1 + 32);
  if (a2)
  {
    v7 = objc_msgSend((id)objc_msgSend(v5, "weakReferenceToAssetWriterInput"), "referencedObject");
    if (a3)
    {
      [*(id *)(*(void *)(a1 + 32) + 24) setCurrentPassDescription:a3];
      [*(id *)(*(void *)(a1 + 32) + 24) beginPassIfAppropriate];
      objc_super v8 = *(AVAssetWriterInputNoMorePassesHelper **)(*(void *)(a1 + 32) + 24);
    }
    else
    {
      objc_super v8 = [[AVAssetWriterInputNoMorePassesHelper alloc] initWithWritingHelper:*(void *)(*(void *)(a1 + 32) + 24)];
    }
    return [v7 _setHelper:v8];
  }
  else
  {
    return [v5 transitionAssetWriterAndAllInputsToFailedStatusWithError:a4];
  }
}

- (int64_t)status
{
  return [(AVAssetWriterInputWritingHelper *)self->_writingHelper status];
}

- (BOOL)canPerformMultiplePasses
{
  return [(AVAssetWriterInputWritingHelper *)self->_writingHelper canPerformMultiplePasses];
}

- (id)currentPassDescription
{
  return self->_initialPassDescription;
}

- (BOOL)isReadyForMoreMediaData
{
  return 0;
}

- (BOOL)shouldRespondToInitialPassDescription
{
  return 0;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v14 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector(v7, a2, @"cannot be called between the invocation of %@ and the beginning of the next pass", v9, v10, v11, v12, v13, (uint64_t)v8), 0 reason userInfo];
  objc_exception_throw(v14);
}

- (void)stopRequestingMediaData
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  uint64_t v12 = (void *)[v3 exceptionWithName:v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, @"cannot be called between the invocation of %@ and the beginning of the next pass", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"not allowed between the invocation of %@ and the beginning of the next pass", NSStringFromSelector(sel_markCurrentPassAsFinished)), 0 reason userInfo];
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v14 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector(v7, a2, @"cannot be called between the invocation of %@ and the beginning of the next pass", v9, v10, v11, v12, v13, (uint64_t)v8), 0 reason userInfo];
  objc_exception_throw(v14);
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  v14 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithObjectAndSelector(v7, a2, @"cannot be called between the invocation of %@ and the beginning of the next pass", v9, v10, v11, v12, v13, (uint64_t)v8), 0 reason userInfo];
  objc_exception_throw(v14);
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"not allowed between the invocation of %@ and the beginning of the next pass", NSStringFromSelector(sel_markCurrentPassAsFinished)), 0 reason userInfo];
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"not allowed between the invocation of %@ and the beginning of the next pass", NSStringFromSelector(sel_markCurrentPassAsFinished)), 0 reason userInfo];
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (__CVPixelBufferPool)pixelBufferPool
{
  return [(AVAssetWriterInputWritingHelper *)self->_writingHelper pixelBufferPool];
}

- (void)markAsFinished
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_markCurrentPassAsFinished);
  uint64_t v12 = (void *)[v3 exceptionWithName:v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, @"cannot be called between the invocation of %@ and the beginning of the next pass", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (void)markCurrentPassAsFinished
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromSelector(a2);
  uint64_t v12 = (void *)[v3 exceptionWithName:v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, @"Cannot call %@ more than once for the same pass", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

@end