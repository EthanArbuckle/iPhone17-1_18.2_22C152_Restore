@interface AVFigAssetWriterFinishWritingAsyncOperation
- (AVFigAssetWriterFinishWritingAsyncOperation)init;
- (AVFigAssetWriterFinishWritingAsyncOperation)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3;
- (BOOL)isAsynchronous;
- (void)cancel;
- (void)dealloc;
- (void)didEnterTerminalState;
- (void)didReceiveFigAssetWriterNotificationWithSuccess:(BOOL)a3 error:(id)a4;
- (void)start;
@end

@implementation AVFigAssetWriterFinishWritingAsyncOperation

- (AVFigAssetWriterFinishWritingAsyncOperation)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithFigAssetWriter_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVFigAssetWriterFinishWritingAsyncOperation)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3
{
  if (!a3)
  {
    uint64_t v8 = self;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"figAssetWriter != NULL"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVFigAssetWriterFinishWritingAsyncOperation;
  v4 = [(AVOperation *)&v15 init];
  if (v4)
  {
    v4->_figAssetWriter = (OpaqueFigAssetWriter *)CFRetain(a3);
    v4->_notificationHandler = [[AVAssetWriterFigAssetWriterNotificationHandler alloc] initWithFigAssetWriter:a3];
  }
  return v4;
}

- (void)dealloc
{
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter) {
    CFRelease(figAssetWriter);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVFigAssetWriterFinishWritingAsyncOperation;
  [(AVOperation *)&v4 dealloc];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  if (![(AVOperation *)self evaluateDependenciesAndMarkAsExecuting]) {
    return;
  }
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self->_notificationHandler setDelegate:self];
  figAssetWriter = self->_figAssetWriter;
  uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = *(uint64_t (**)(OpaqueFigAssetWriter *))(v5 + 128);
  if (v6)
  {
    uint64_t v7 = v6(figAssetWriter);
    if (!v7) {
      return;
    }
    uint64_t v8 = v7;
    if (v7 == -12785)
    {
      [(AVOperation *)self markAsCancelled];
      return;
    }
  }
  else
  {
    uint64_t v8 = 4294954514;
  }
  id v9 = +[AVAssetWriter _errorForOSStatus:v8];
  [(AVOperation *)self markAsFailedWithError:v9];
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)AVFigAssetWriterFinishWritingAsyncOperation;
  [(AVFigAssetWriterFinishWritingAsyncOperation *)&v3 cancel];
  [(AVOperation *)self markAsCancelled];
}

- (void)didEnterTerminalState
{
  if ((unint64_t)([(AVOperation *)self status] - 3) <= 1)
  {
    uint64_t FigBaseObject = FigAssetWriterGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v3 = FigBaseObject;
      uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v5 = v4 ? v4 : 0;
      v6 = *(void (**)(uint64_t))(v5 + 24);
      if (v6)
      {
        v6(v3);
      }
    }
  }
}

- (void)didReceiveFigAssetWriterNotificationWithSuccess:(BOOL)a3 error:(id)a4
{
  if (a3) {
    [(AVOperation *)self markAsCompleted];
  }
  else {
    [(AVOperation *)self markAsFailedWithError:a4];
  }
}

@end