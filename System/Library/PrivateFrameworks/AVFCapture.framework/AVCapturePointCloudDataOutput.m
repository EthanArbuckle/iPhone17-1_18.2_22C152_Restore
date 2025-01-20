@interface AVCapturePointCloudDataOutput
+ (void)initialize;
- (AVCapturePointCloudDataOutput)init;
- (AVCapturePointCloudDataOutputDelegate)delegate;
- (BOOL)alwaysDiscardsLatePointCloudData;
- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3;
- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (OS_dispatch_queue)delegateCallbackQueue;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (id)connectionMediaTypes;
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
- (void)setAlwaysDiscardsLatePointCloudData:(BOOL)a3;
- (void)setDelegate:(id)a3 callbackQueue:(id)a4;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
@end

@implementation AVCapturePointCloudDataOutput

+ (void)initialize
{
}

- (AVCapturePointCloudDataOutput)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePointCloudDataOutput;
  v2 = [(AVCaptureOutput *)&v4 initSubclass];
  if (v2)
  {
    v2->_delegateCallbackHelper = [[AVCaptureDataOutputDelegateCallbackHelper alloc] initWithQueueName:@"com.apple.avfoundation.pointclouddataoutput.queue" canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:0];
    v2->_weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    v2->_alwaysDiscardsLatePointCloudData = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCapturePointCloudDataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  int IsRunningInMediaserverd = AVCaptureIsRunningInMediaserverd();
  if (a4 && IsRunningInMediaserverd)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    [(AVCapturePointCloudDataOutput *)self willChangeValueForKey:@"delegate"];
    uint64_t v11 = 0;
    if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper setClientDelegate:a3 clientCallbackQueue:a4 exceptionReason:&v11])
    {
      [(AVCapturePointCloudDataOutput *)self didChangeValueForKey:@"delegate"];
      return;
    }
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  }
  v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v10);
  }
  NSLog(&cfstr_SuppressingExc.isa, v10);
}

- (AVCapturePointCloudDataOutputDelegate)delegate
{
  return (AVCapturePointCloudDataOutputDelegate *)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper clientDelegate];
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper clientCallbackQueue];
}

- (BOOL)alwaysDiscardsLatePointCloudData
{
  return self->_alwaysDiscardsLatePointCloudData;
}

- (void)setAlwaysDiscardsLatePointCloudData:(BOOL)a3
{
  if (self->_alwaysDiscardsLatePointCloudData != a3)
  {
    self->_alwaysDiscardsLatePointCloudData = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"pcld";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"pcld"))
  {
    uint64_t v7 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v7 = 2;
LABEL_5:
    v8 = (void *)AVCaptureOutputConnectionFailureReasonString(v7, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v8;
    return result;
  }
  return 1;
}

- (BOOL)appliesOrientationWithPhysicalRotationForConnection:(id)a3
{
  return 0;
}

- (BOOL)appliesMirroringWithPhysicalFlipForConnection:(id)a3
{
  return 0;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:pdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:pdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCapturePointCloudDataOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_weakReference callback:pdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_weakReference callback:pdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCapturePointCloudDataOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (id)delegateOverride
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper delegateOverride];
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper delegateOverrideCallbackQueue];
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
  if (![(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper setDelegateOverride:a3 delegateOverrideCallbackQueue:v7 exceptionReason:&v9])
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCapturePointCloudDataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCapturePointCloudDataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  v5 = self->_weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

void __52__AVCapturePointCloudDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  objc_super v6 = (void *)MEMORY[0x1A62348E0]();
  uint64_t v7 = (id *)(id)[*(id *)(a1 + 32) referencedObject];
  if (v7)
  {
    uint64_t v8 = v7;
    if (a2 == -16665)
    {
      [v7[2] releaseRemoteQueueReceiver];
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
    [(AVCapturePointCloudDataOutput *)self _processSampleBuffer:a3->var4.var4.var0];
  }
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  v5 = self->_weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__AVCapturePointCloudDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __51__AVCapturePointCloudDataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
{
  objc_super v4 = (void *)MEMORY[0x1A62348E0]();
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
    [(AVCapturePointCloudDataOutput *)self _processSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper activeDelegate];
  id v6 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  if ([v6 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(a3);
    if (DataBuffer) {
      CFTypeRef v8 = CMGetAttachment(DataBuffer, (CFStringRef)*MEMORY[0x1E4F1EC38], 0);
    }
    else {
      CFTypeRef v8 = 0;
    }
    memset(&v12, 0, sizeof(v12));
    CMSampleBufferGetPresentationTimeStamp(&v12, a3);
    uint64_t v9 = [[AVPointCloudData alloc] initWithDataBuffer:v8];
    if (v8)
    {
      if (objc_opt_respondsToSelector())
      {
        CMTime v11 = v12;
        [v5 pointCloudDataOutput:self didOutputPointCloudData:v9 timestamp:&v11 connection:v6];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      int64_t v10 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:a3];
      CMTime v11 = v12;
      [v5 pointCloudDataOutput:self didDropPointCloudData:v9 timestamp:&v11 connection:v6 reason:v10];
    }
  }
}

@end