@interface AVCaptureDepthDataOutput
+ (void)initialize;
- (AVCaptureDepthDataOutput)init;
- (BOOL)alwaysDiscardsLateDepthData;
- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3;
- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)isFilteringEnabled;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (dispatch_queue_t)delegateCallbackQueue;
- (id)addConnection:(id)a3 error:(id *)a4;
- (id)connectionMediaTypes;
- (id)delegate;
- (id)delegateOverride;
- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3;
- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_updateLocalQueue:(localQueueOpaque *)a3;
- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeConnection:(id)a3;
- (void)setAlwaysDiscardsLateDepthData:(BOOL)alwaysDiscardsLateDepthData;
- (void)setDelegate:(id)delegate callbackQueue:(dispatch_queue_t)callbackQueue;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
- (void)setFilteringEnabled:(BOOL)filteringEnabled;
@end

@implementation AVCaptureDepthDataOutput

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  v7 = (void *)[a3 mediaType];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C48]])
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v8 = 2;
LABEL_5:
    v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (BOOL)isFilteringEnabled
{
  return self->_internal->filteringEnabled;
}

- (BOOL)alwaysDiscardsLateDepthData
{
  return self->_internal->alwaysDiscardsLateDepthData;
}

- (id)addConnection:(id)a3 error:(id *)a4
{
  [a3 addObserver:self forKeyPath:@"videoMirrored" options:3 context:AVCaptureOutputVideoMirroredChangedContext];
  [a3 addObserver:self forKeyPath:@"videoOrientation" options:3 context:AVCaptureOutputVideoOrientationChangedContext];
  [a3 addObserver:self forKeyPath:@"active" options:3 context:AVCaptureOutputActiveChangedContext];
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDepthDataOutput;
  return [(AVCaptureOutput *)&v8 addConnection:a3 error:a4];
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 1;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureOutputVideoMirroredChangedContext == a6
    || AVCaptureOutputVideoOrientationChangedContext == (void)a6)
  {
    goto LABEL_6;
  }
  if ((void *)AVCaptureOutputActiveChangedContext != a6) {
    return;
  }
  int v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284E0]), "BOOLValue");
  int v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E4F284C8]), "BOOLValue");
  if (v11 == v12) {
    return;
  }
  if (v12) {
LABEL_6:
  }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "sourceDevice", a3, a4, a5), "activeDepthDataFormat");
  else {
    uint64_t v9 = 0;
  }

  [(AVCaptureOutput *)self updateMetadataTransformForSourceFormat:v9];
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:ddo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:ddo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureDepthDataOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)setFilteringEnabled:(BOOL)filteringEnabled
{
  internal = self->_internal;
  if (internal->filteringEnabled != filteringEnabled)
  {
    internal->filteringEnabled = filteringEnabled;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (void)setAlwaysDiscardsLateDepthData:(BOOL)alwaysDiscardsLateDepthData
{
  internal = self->_internal;
  if (internal->alwaysDiscardsLateDepthData != alwaysDiscardsLateDepthData)
  {
    internal->alwaysDiscardsLateDepthData = alwaysDiscardsLateDepthData;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (AVCaptureDepthDataOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDepthDataOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureDepthDataOutputInternal);
    v2->_internal = v3;
    if (v3)
    {
      v2->_internal->weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCaptureDepthDataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCaptureDepthDataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  objc_super v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

void __47__AVCaptureDepthDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  v6 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v7 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v7)
  {
    uint64_t v8 = v7;
    if (a2 == -16665)
    {
      [*(id *)(v7[2] + 8) releaseRemoteQueueReceiver];
    }
    else if (!a2)
    {
      [v7 _handleRemoteQueueOperation:a3];
    }
  }
}

- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureDepthDataOutput *)self _processSampleBuffer:a3->var4.var4.var0];
  }
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper activeDelegate];
  id v6 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  if ([v6 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    CFTypeRef v8 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52818], 0);
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    uint64_t v9 = [[AVDepthData alloc] initWithPixelBuffer:ImageBuffer depthMetadataDictionary:v8];
    if (ImageBuffer)
    {
      if (objc_opt_respondsToSelector())
      {
        CMTime v11 = v12;
        [v5 depthDataOutput:self didOutputDepthData:v9 timestamp:&v11 connection:v6];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      int64_t v10 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:a3];
      CMTime v11 = v12;
      [v5 depthDataOutput:self didDropDepthData:v9 timestamp:&v11 connection:v6 reason:v10];
    }
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDepthDataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)setDelegate:(id)delegate callbackQueue:(dispatch_queue_t)callbackQueue
{
  dispatch_queue_t v4 = callbackQueue;
  if (((callbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    dispatch_queue_t v4 = 0;
  }
  [(AVCaptureDepthDataOutput *)self willChangeValueForKey:@"delegate"];
  uint64_t v8 = 0;
  if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setClientDelegate:delegate clientCallbackQueue:v4 exceptionReason:&v8])
  {
    [(AVCaptureDepthDataOutput *)self didChangeValueForKey:@"delegate"];
  }
  else
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    [(AVCaptureDepthDataOutput *)self didChangeValueForKey:@"delegate"];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (id)delegate
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientDelegate];
}

- (dispatch_queue_t)delegateCallbackQueue
{
  return (dispatch_queue_t)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientCallbackQueue];
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F47C48];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (void)removeConnection:(id)a3
{
  [a3 removeObserver:self forKeyPath:@"videoMirrored" context:AVCaptureOutputVideoMirroredChangedContext];
  [a3 removeObserver:self forKeyPath:@"videoOrientation" context:AVCaptureOutputVideoOrientationChangedContext];
  [a3 removeObserver:self forKeyPath:@"active" context:AVCaptureOutputActiveChangedContext];
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDepthDataOutput;
  [(AVCaptureOutput *)&v5 removeConnection:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_super v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:ddo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:ddo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDepthDataOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  objc_super v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureDepthDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __46__AVCaptureDepthDataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
{
  dispatch_queue_t v4 = (void *)MEMORY[0x1A62348E0]();
  id v5 = (id)[*(id *)(a1 + 32) referencedObject];
  if (v5)
  {
    objc_super v6 = v5;
    long long v7 = *a2;
    int v8 = *((_DWORD *)a2 + 4);
    [v5 _handleLocalQueueMessage:&v7];
  }
}

- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3
{
  if (a3->var0 == 3) {
    [(AVCaptureDepthDataOutput *)self _processSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
}

- (id)delegateOverride
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverride];
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper delegateOverrideCallbackQueue];
}

- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4
{
  if (((a4 != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    id v7 = 0;
  }
  else {
    id v7 = a4;
  }
  uint64_t v9 = 0;
  if (![(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setDelegateOverride:a3 delegateOverrideCallbackQueue:v7 exceptionReason:&v9])
  {
    int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

@end