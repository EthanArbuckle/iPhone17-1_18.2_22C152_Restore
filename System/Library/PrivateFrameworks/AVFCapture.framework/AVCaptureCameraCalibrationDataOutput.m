@interface AVCaptureCameraCalibrationDataOutput
+ (void)initialize;
- (AVCaptureCameraCalibrationDataOutput)init;
- (AVCaptureCameraCalibrationDataOutputDelegate)delegate;
- (BOOL)alwaysDiscardsLateCameraCalibrationData;
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
- (void)setAlwaysDiscardsLateCameraCalibrationData:(BOOL)a3;
- (void)setDelegate:(id)a3 callbackQueue:(id)a4;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
@end

@implementation AVCaptureCameraCalibrationDataOutput

+ (void)initialize
{
}

- (AVCaptureCameraCalibrationDataOutput)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  v2 = [(AVCaptureOutput *)&v4 initSubclass];
  if (v2)
  {
    v2->_delegateCallbackHelper = [[AVCaptureDataOutputDelegateCallbackHelper alloc] initWithQueueName:@"com.apple.avfoundation.cameracalibrationdataoutput.queue" canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:0];
    v2->_weakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v2];
    v2->_alwaysDiscardsLateCameraCalibrationData = 1;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)setDelegate:(id)a3 callbackQueue:(id)a4
{
  int IsRunningInMediaserverd = AVCaptureIsRunningInMediaserverd();
  if (a4 && IsRunningInMediaserverd)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
  }
  else
  {
    [(AVCaptureCameraCalibrationDataOutput *)self willChangeValueForKey:@"delegate"];
    uint64_t v10 = 0;
    if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper setClientDelegate:a3 clientCallbackQueue:a4 exceptionReason:&v10])
    {
      [(AVCaptureCameraCalibrationDataOutput *)self didChangeValueForKey:@"delegate"];
    }
    else
    {
      v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
      [(AVCaptureCameraCalibrationDataOutput *)self didChangeValueForKey:@"delegate"];
      if (AVCaptureShouldThrowForAPIViolations()) {
        objc_exception_throw(v9);
      }
      NSLog(&cfstr_SuppressingExc.isa, v9);
    }
  }
}

- (AVCaptureCameraCalibrationDataOutputDelegate)delegate
{
  return (AVCaptureCameraCalibrationDataOutputDelegate *)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper clientDelegate];
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper clientCallbackQueue];
}

- (BOOL)alwaysDiscardsLateCameraCalibrationData
{
  return self->_alwaysDiscardsLateCameraCalibrationData;
}

- (void)setAlwaysDiscardsLateCameraCalibrationData:(BOOL)a3
{
  if (self->_alwaysDiscardsLateCameraCalibrationData != a3)
  {
    self->_alwaysDiscardsLateCameraCalibrationData = a3;
    [(AVCaptureOutput *)self bumpChangeSeed];
  }
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = @"cacd";
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  if (!objc_msgSend((id)objc_msgSend(a3, "mediaType"), "isEqualToString:", @"cacd"))
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

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:ccdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:ccdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_weakReference callback:ccdo_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_weakReference callback:ccdo_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureCameraCalibrationDataOutput;
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
  int IsRunningInMediaserverd = AVCaptureIsRunningInMediaserverd();
  if (a4 && IsRunningInMediaserverd)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    uint64_t v11 = 0;
    if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper setDelegateOverride:a3 delegateOverrideCallbackQueue:a4 exceptionReason:&v11])
    {
      return;
    }
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
  }
  uint64_t v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v10);
  }
  NSLog(&cfstr_SuppressingExc.isa, v10);
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCaptureCameraCalibrationDataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCaptureCameraCalibrationDataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  v5 = self->_weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

void __59__AVCaptureCameraCalibrationDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
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
    [(AVCaptureCameraCalibrationDataOutput *)self _processSampleBuffer:a3->var4.var4.var0];
  }
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  v5 = self->_weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AVCaptureCameraCalibrationDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __58__AVCaptureCameraCalibrationDataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
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
    [(AVCaptureCameraCalibrationDataOutput *)self _processSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
}

- (void)_processSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  id v6 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_delegateCallbackHelper activeDelegate];
  if ([v5 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0)
  {
    long long v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52810], 0));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = *MEMORY[0x1E4F51228];
    objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F51228]), "getBytes:length:", &v21, 64);
    FigCaptureFirmwareToNVMExtrinsicMatrixTransform();
    FigCaptureTransformExtrinsicMatrix();
    DWORD2(v21) = v9;
    DWORD2(v22) = v10;
    *(void *)&long long v21 = v11;
    *(void *)&long long v22 = v12;
    DWORD2(v23) = v13;
    DWORD2(v24) = v14;
    *(void *)&long long v23 = v15;
    *(void *)&long long v24 = v16;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v21, 64), v8);
    v17 = [[AVCameraCalibrationData alloc] initWithDepthMetadataDictionary:v7];
    memset(&v20, 0, sizeof(v20));
    CMSampleBufferGetPresentationTimeStamp(&v20, a3);
    if (v17)
    {
      if (objc_opt_respondsToSelector())
      {
        CMTime v19 = v20;
        [v6 cameraCalibrationDataOutput:self didOutputCameraCalibrationData:v17 timestamp:&v19 connection:v5];
      }
    }
    else if (objc_opt_respondsToSelector())
    {
      int64_t v18 = +[AVCaptureOutput dataDroppedReasonFromSampleBuffer:a3];
      CMTime v19 = v20;
      [v6 cameraCalibrationDataOutput:self didDropCameraCalibrationDataAtTimestamp:&v19 connection:v5 reason:v18];
    }
  }
}

@end