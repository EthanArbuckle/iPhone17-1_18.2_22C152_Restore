@interface AVCaptureAudioDataOutput
+ (void)initialize;
- (AVCaptureAudioDataOutput)init;
- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4;
- (NSDictionary)audioSettings;
- (NSDictionary)recommendedAudioSettingsForAssetWriterWithOutputFileType:(AVFileType)outputFileType;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (dispatch_queue_t)sampleBufferCallbackQueue;
- (id)connectionMediaTypes;
- (id)delegateOverride;
- (id)sampleBufferDelegate;
- (id)supportedAssetWriterOutputFileTypes;
- (void)_handleLocalQueueMessage:(FigLocalQueueMessage *)a3;
- (void)_handleNotification:(id)a3 payload:(id)a4;
- (void)_handleRemoteQueueOperation:(FigRemoteOperation *)a3;
- (void)_handleSampleBufferEventForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)_updateLocalQueue:(localQueueOpaque *)a3;
- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3;
- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)dealloc;
- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3;
- (void)setAudioSettings:(NSDictionary *)audioSettings;
- (void)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4;
- (void)setSampleBufferDelegate:(id)sampleBufferDelegate queue:(dispatch_queue_t)sampleBufferCallbackQueue;
@end

@implementation AVCaptureAudioDataOutput

+ (void)initialize
{
}

- (AVCaptureAudioDataOutput)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureAudioDataOutput;
  v2 = [(AVCaptureOutput *)&v5 initSubclass];
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptureAudioDataOutputInternal);
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureAudioDataOutput;
  [(AVCaptureOutput *)&v3 dealloc];
}

- (void)setSampleBufferDelegate:(id)sampleBufferDelegate queue:(dispatch_queue_t)sampleBufferCallbackQueue
{
  dispatch_queue_t v4 = sampleBufferCallbackQueue;
  if (((sampleBufferCallbackQueue != 0) & AVCaptureIsRunningInMediaserverd()) != 0) {
    dispatch_queue_t v4 = 0;
  }
  [(AVCaptureAudioDataOutput *)self willChangeValueForKey:@"sampleBufferDelegate"];
  uint64_t v8 = 0;
  if ([(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper setClientDelegate:sampleBufferDelegate clientCallbackQueue:v4 exceptionReason:&v8])
  {
    [(AVCaptureAudioDataOutput *)self didChangeValueForKey:@"sampleBufferDelegate"];
  }
  else
  {
    v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v7);
    }
    NSLog(&cfstr_SuppressingExc.isa, v7);
  }
}

- (id)sampleBufferDelegate
{
  return [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientDelegate];
}

- (dispatch_queue_t)sampleBufferCallbackQueue
{
  return (dispatch_queue_t)[(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper clientCallbackQueue];
}

- (NSDictionary)audioSettings
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

- (void)setAudioSettings:(NSDictionary *)audioSettings
{
}

- (id)supportedAssetWriterOutputFileTypes
{
  v8[10] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F47C00];
  v8[0] = *MEMORY[0x1E4F47C08];
  v8[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F47BD0];
  v8[2] = *MEMORY[0x1E4F47BA0];
  v8[3] = v3;
  uint64_t v4 = *MEMORY[0x1E4F47BD8];
  v8[4] = *MEMORY[0x1E4F47BC8];
  v8[5] = v4;
  uint64_t v5 = *MEMORY[0x1E4F47BB0];
  v8[6] = *MEMORY[0x1E4F47C18];
  v8[7] = v5;
  uint64_t v6 = *MEMORY[0x1E4F47BB8];
  v8[8] = *MEMORY[0x1E4F47BA8];
  v8[9] = v6;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:10];
}

- (NSDictionary)recommendedAudioSettingsForAssetWriterWithOutputFileType:(AVFileType)outputFileType
{
  id v5 = [(AVCaptureAudioDataOutput *)self supportedAssetWriterOutputFileTypes];
  if (([v5 containsObject:outputFileType] & 1) == 0)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    [NSString stringWithFormat:@"Invalid file type UTI - available file types are: %@", v5];
    v10 = (void *)[v8 exceptionWithName:v9 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v10);
    }
    NSLog(&cfstr_SuppressingExc.isa, v10);
    return 0;
  }
  uint64_t v6 = [(AVCaptureOutput *)self connectionWithMediaType:*MEMORY[0x1E4F47C40]];
  if (![(AVCaptureConnection *)v6 isLive]) {
    return 0;
  }

  return (NSDictionary *)[(AVCaptureOutput *)self recommendedOutputSettingsForConnection:v6 sourceSettings:0 videoCodecType:0 fileType:outputFileType isIris:0 outputFileURL:0];
}

- (id)connectionMediaTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = *MEMORY[0x1E4F47C40];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (BOOL)canAddConnection:(id)a3 failureReason:(id *)a4
{
  v7 = (void *)[a3 mediaType];
  if (![v7 isEqualToString:*MEMORY[0x1E4F47C40]])
  {
    uint64_t v8 = 1;
    goto LABEL_5;
  }
  if ([(NSArray *)[(AVCaptureOutput *)self connections] count])
  {
    uint64_t v8 = 2;
LABEL_5:
    uint64_t v9 = (void *)AVCaptureOutputConnectionFailureReasonString(v8, (uint64_t)self, a3);
    BOOL result = 0;
    *a4 = v9;
    return result;
  }
  return 1;
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  id v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  weakReference = self->_internal->weakReference;
  [v5 addListenerWithWeakReference:weakReference callback:ado_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3 flags:0];
  [v5 addListenerWithWeakReference:weakReference callback:ado_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3 flags:0];
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureAudioDataOutput;
  [(AVCaptureOutput *)&v7 attachSafelyToFigCaptureSession:a3];
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  id v5 = (void *)[MEMORY[0x1E4F47DB8] notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:ado_notificationHandler name:*MEMORY[0x1E4F518B8] object:a3];
  [v5 removeListenerWithWeakReference:self->_internal->weakReference callback:ado_notificationHandler name:*MEMORY[0x1E4F518B0] object:a3];
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureAudioDataOutput;
  [(AVCaptureOutput *)&v6 detachSafelyFromFigCaptureSession:a3];
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E4F51770]), "isEqual:", -[AVCaptureOutput sinkID](self, "sinkID")))
  {
    if ([a3 isEqualToString:*MEMORY[0x1E4F518B8]])
    {
      uint64_t v7 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F518A8]];
      [(AVCaptureAudioDataOutput *)self _updateRemoteQueue:v7];
    }
    else if ([a3 isEqualToString:*MEMORY[0x1E4F518B0]])
    {
      uint64_t v8 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F51658]];
      [(AVCaptureAudioDataOutput *)self _updateLocalQueue:v8];
    }
  }
}

- (void)_updateRemoteQueue:(remoteQueueReceiverOpaque *)a3
{
  id v5 = self->_internal->weakReference;
  MessageReceiver = (void *)FigRemoteOperationReceiverCreateMessageReceiver();
  -[AVCaptureDataOutputDelegateCallbackHelper updateRemoteQueueReceiver:handler:](self->_internal->delegateCallbackHelper, "updateRemoteQueueReceiver:handler:", a3, (id)[MessageReceiver copy]);
}

void __47__AVCaptureAudioDataOutput__updateRemoteQueue___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  objc_super v6 = (void *)MEMORY[0x1A62348E0]();
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
  if (a3->var0 == 3)
  {
    [(AVCaptureAudioDataOutput *)self _handleSampleBufferEventForSampleBuffer:a3->var4.var4.var0];
  }
  else if (a3->var0 == 5)
  {
    [(AVCaptureAudioDataOutput *)self _handleConfigurationLiveEventForID:a3->var4.var4.var0 updatedFormatDescription:a3->var4.var2.var1];
  }
}

- (void)_updateLocalQueue:(localQueueOpaque *)a3
{
  id v5 = self->_internal->weakReference;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__AVCaptureAudioDataOutput__updateLocalQueue___block_invoke;
  v6[3] = &unk_1E5A730B8;
  v6[4] = v5;
  -[AVCaptureDataOutputDelegateCallbackHelper updateLocalQueue:handler:](self->_internal->delegateCallbackHelper, "updateLocalQueue:handler:", a3, (id)[v6 copy]);
}

void __46__AVCaptureAudioDataOutput__updateLocalQueue___block_invoke(uint64_t a1, long long *a2)
{
  uint64_t v4 = (void *)MEMORY[0x1A62348E0]();
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
  if (a3->var0 == 3)
  {
    [(AVCaptureAudioDataOutput *)self _handleSampleBufferEventForSampleBuffer:*(void *)(&a3->var0 + 1)];
  }
  else if (a3->var0 == 5)
  {
    [(AVCaptureAudioDataOutput *)self _handleConfigurationLiveEventForID:*(void *)(&a3->var0 + 1) updatedFormatDescription:*(int64_t *)((char *)&a3->var1.var1.var0 + 4)];
  }
}

- (void)_handleSampleBufferEventForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  id v5 = [(AVCaptureDataOutputDelegateCallbackHelper *)self->_internal->delegateCallbackHelper activeDelegate];
  id v6 = [(NSArray *)[(AVCaptureOutput *)self connections] firstObject];
  if ([v6 isLive]
    && objc_msgSend(-[AVCaptureOutput session](self, "session"), "isRunning")
    && (objc_msgSend(-[AVCaptureOutput session](self, "session"), "isInterrupted") & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 captureOutput:self didOutputSampleBuffer:a3 fromConnection:v6];
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