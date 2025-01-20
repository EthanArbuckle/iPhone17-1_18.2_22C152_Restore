@interface AVAssetWriterInputFigAssetWriterEndPassOperation
- (AVAssetWriterInputFigAssetWriterEndPassOperation)init;
- (AVAssetWriterInputFigAssetWriterEndPassOperation)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 trackID:(int)a4;
- (AVAssetWriterInputPassDescription)descriptionForNextPass;
- (BOOL)isAsynchronous;
- (void)_notifyWhetherMorePassesAreNeeded:(BOOL)a3 timeRanges:(id)a4 forTrackWithID:(int)a5;
- (void)dealloc;
- (void)start;
@end

@implementation AVAssetWriterInputFigAssetWriterEndPassOperation

- (AVAssetWriterInputFigAssetWriterEndPassOperation)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithFigAssetWriter_trackID_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Not available.  Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVAssetWriterInputFigAssetWriterEndPassOperation)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3 trackID:(int)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 5369, @"Invalid parameter not satisfying: %@", @"figAssetWriter != NULL");
    if (a4) {
      goto LABEL_3;
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"AVAssetWriterInput.m", 5370, @"Invalid parameter not satisfying: %@", @"trackID != kCMPersistentTrackID_Invalid");
LABEL_3:
  v11.receiver = self;
  v11.super_class = (Class)AVAssetWriterInputFigAssetWriterEndPassOperation;
  uint64_t v8 = [(AVOperation *)&v11 init];
  if (v8)
  {
    if (a3) {
      uint64_t v9 = (OpaqueFigAssetWriter *)CFRetain(a3);
    }
    else {
      uint64_t v9 = 0;
    }
    v8->_figAssetWriter = v9;
    v8->_trackID = a4;
  }
  return v8;
}

- (void)dealloc
{
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter) {
    CFRelease(figAssetWriter);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputFigAssetWriterEndPassOperation;
  [(AVOperation *)&v4 dealloc];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  if ([(AVOperation *)self evaluateDependenciesAndMarkAsExecuting])
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListener();
    figAssetWriter = self->_figAssetWriter;
    uint64_t trackID = self->_trackID;
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(uint64_t (**)(OpaqueFigAssetWriter *, uint64_t))(v6 + 144);
    if (v7)
    {
      signed int v8 = v7(figAssetWriter, trackID);
      if (!v8) {
        return;
      }
    }
    else
    {
      signed int v8 = -12782;
    }
    [(AVOperation *)self markAsFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v8, 0)];
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
  }
}

- (void)_notifyWhetherMorePassesAreNeeded:(BOOL)a3 timeRanges:(id)a4 forTrackWithID:(int)a5
{
  if (self->_trackID == a5)
  {
    if (a3) {
      self->_nextPassDescription = [[AVAssetWriterInputPassDescription alloc] initWithTimeRanges:a4];
    }
    [(AVOperation *)self markAsCompleted];
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
  }
}

- (AVAssetWriterInputPassDescription)descriptionForNextPass
{
  return self->_nextPassDescription;
}

@end