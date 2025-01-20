@interface AVAssetWriterInputNoMorePassesHelper
- (AVAssetWriterInputNoMorePassesHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterInputNoMorePassesHelper)initWithWritingHelper:(id)a3;
- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4;
- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4;
- (BOOL)canPerformMultiplePasses;
- (BOOL)isReadyForMoreMediaData;
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
- (void)stopRequestingMediaData;
@end

@implementation AVAssetWriterInputNoMorePassesHelper

- (AVAssetWriterInputNoMorePassesHelper)initWithConfigurationState:(id)a3
{
  return [(AVAssetWriterInputNoMorePassesHelper *)self initWithWritingHelper:0];
}

- (AVAssetWriterInputNoMorePassesHelper)initWithWritingHelper:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 3182, @"Invalid parameter not satisfying: %@", @"writingHelper != nil");
  }
  v7.receiver = self;
  v7.super_class = (Class)AVAssetWriterInputNoMorePassesHelper;
  v5 = -[AVAssetWriterInputHelper initWithConfigurationState:](&v7, sel_initWithConfigurationState_, [a3 configurationState]);
  if (v5) {
    v5->_writingHelper = (AVAssetWriterInputWritingHelper *)a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputNoMorePassesHelper;
  [(AVAssetWriterInputHelper *)&v3 dealloc];
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
  return 0;
}

- (BOOL)isReadyForMoreMediaData
{
  return 0;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  objc_super v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromSelector(sel_currentPassDescription);
  v14 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, @"cannot be called when no media data is being requested.  Check the value of %@.", v9, v10, v11, v12, v13, (uint64_t)v8), 0 reason userInfo];
  objc_exception_throw(v14);
}

- (void)stopRequestingMediaData
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_currentPassDescription);
  uint64_t v12 = (void *)[v3 exceptionWithName:v4, AVMethodExceptionReasonWithClassAndSelector(v5, a2, @"cannot be called when no media data is being requested.  Check the value of %@.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (int64_t)appendSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"not allowed when no media data is being requested.  Check the value of %@.", NSStringFromSelector(sel_currentPassDescription)), 0 reason userInfo];
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (BOOL)appendPixelBuffer:(__CVBuffer *)a3 withPresentationTime:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromSelector(sel_currentPassDescription);
  v14 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, @"cannot be called when no media data is being requested.  Check the value of %@.", v9, v10, v11, v12, v13, (uint64_t)v8), 0 reason userInfo];
  objc_exception_throw(v14);
}

- (BOOL)appendTaggedPixelBufferGroup:(OpaqueCMTaggedBufferGroup *)a3 withPresentationTime:(id *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromSelector(sel_currentPassDescription);
  v14 = (void *)[v5 exceptionWithName:v6, AVMethodExceptionReasonWithClassAndSelector(v7, a2, @"cannot be called when no media data is being requested.  Check the value of %@.", v9, v10, v11, v12, v13, (uint64_t)v8), 0 reason userInfo];
  objc_exception_throw(v14);
}

- (int64_t)appendCaption:(id)a3 error:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"not allowed when no media data is being requested.  Check the value of %@.", NSStringFromSelector(sel_currentPassDescription)), 0 reason userInfo];
    *a4 = (id)AVErrorForClientProgrammingError(v5);
  }
  return 1;
}

- (int64_t)appendCaptionGroup:(id)a3 error:(id *)a4
{
  if (a4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], objc_msgSend(NSString, "stringWithFormat:", @"not allowed when no media data is being requested.  Check the value of %@.", NSStringFromSelector(sel_currentPassDescription)), 0 reason userInfo];
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
}

- (void)markCurrentPassAsFinished
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v11 = (void *)[v3 exceptionWithName:v4, AVMethodExceptionReasonWithObjectAndSelector(v5, a2, @"cannot be called after the final pass", v6, v7, v8, v9, v10, v12), 0 reason userInfo];
  objc_exception_throw(v11);
}

@end