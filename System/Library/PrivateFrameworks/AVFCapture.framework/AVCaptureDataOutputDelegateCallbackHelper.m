@interface AVCaptureDataOutputDelegateCallbackHelper
+ (void)initialize;
- (AVCaptureDataOutputDelegateCallbackHelper)initWithQueueName:(id)a3 canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:(BOOL)a4;
- (BOOL)_validateCallbackQueue:(id)a3 exceptionReason:(id *)a4;
- (BOOL)setClientDelegate:(id)a3 clientCallbackQueue:(id)a4 exceptionReason:(id *)a5;
- (BOOL)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4 exceptionReason:(id *)a5;
- (OS_dispatch_queue)activeCallbackQueue;
- (OS_dispatch_queue)clientCallbackQueue;
- (OS_dispatch_queue)delegateOverrideCallbackQueue;
- (id)_activeCallbackQueue;
- (id)_activeDelegate;
- (id)activeDelegate;
- (id)clientDelegate;
- (id)delegateOverride;
- (void)dealloc;
- (void)releaseRemoteQueueReceiver;
- (void)updateLocalQueue:(localQueueOpaque *)a3 handler:(id)a4;
- (void)updateRemoteQueueReceiver:(remoteQueueReceiverOpaque *)a3 handler:(id)a4;
@end

@implementation AVCaptureDataOutputDelegateCallbackHelper

- (id)activeDelegate
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  id v3 = [(AVCaptureDataOutputDelegateCallbackHelper *)self _activeDelegate];
  MEMORY[0x1A6234340](self->_stateMutex);
  return v3;
}

- (id)_activeDelegate
{
  uint64_t v3 = [(AVWeakReferencingDelegateStorage *)self->_delegateOverrideStorage delegate];
  uint64_t v4 = 40;
  if (!v3) {
    uint64_t v4 = 32;
  }
  v5 = *(Class *)((char *)&self->super.isa + v4);

  return (id)[v5 delegate];
}

- (id)delegateOverride
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  uint64_t v3 = (void *)[(AVWeakReferencingDelegateStorage *)self->_delegateOverrideStorage delegate];
  MEMORY[0x1A6234340](self->_stateMutex);
  return v3;
}

- (AVCaptureDataOutputDelegateCallbackHelper)initWithQueueName:(id)a3 canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDataOutputDelegateCallbackHelper;
  v6 = [(AVCaptureDataOutputDelegateCallbackHelper *)&v8 init];
  if (v6)
  {
    v6->_defaultCallbackQueueName = (NSString *)a3;
    v6->_canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd = a4;
    v6->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v6->_delegateStorage = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E4F47DF8]);
  }
  return v6;
}

- (void)updateRemoteQueueReceiver:(remoteQueueReceiverOpaque *)a3 handler:(id)a4
{
  MEMORY[0x1A6234330](self->_stateMutex);
  if (!self->_localQueue)
  {
    if (self->_remoteQueueReceiver)
    {
      FigRemoteQueueReceiverUnsetHandler();
      remoteQueueReceiver = self->_remoteQueueReceiver;
    }
    else
    {
      remoteQueueReceiver = 0;
    }
    self->_remoteQueueReceiver = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (remoteQueueReceiver) {
      CFRelease(remoteQueueReceiver);
    }
    id remoteQueueHandler = self->_remoteQueueHandler;
    self->_id remoteQueueHandler = a4;

    if (self->_remoteQueueReceiver && self->_remoteQueueHandler)
    {
      [(AVCaptureDataOutputDelegateCallbackHelper *)self _activeCallbackQueue];
      FigRemoteQueueReceiverSetHandler();
    }
    JUMPOUT(0x1A6234340);
  }
  MEMORY[0x1A6234340](self->_stateMutex);
  if (a3)
  {
    v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    objc_exception_throw(v9);
  }
}

- (id)_activeCallbackQueue
{
  if (AVCaptureIsRunningInMediaserverd()
    && !self->_canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd)
  {
    return 0;
  }
  delegateOverrideStorage = self->_delegateOverrideStorage;
  if (!delegateOverrideStorage) {
    delegateOverrideStorage = self->_delegateStorage;
  }
  id result = (id)[(AVWeakReferencingDelegateStorage *)delegateOverrideStorage delegateQueue];
  if (!result)
  {
    id result = self->_defaultCallbackQueue;
    if (!result)
    {
      defaultCallbackQueueName = self->_defaultCallbackQueueName;
      if (defaultCallbackQueueName) {
        v6 = [(NSString *)defaultCallbackQueueName UTF8String];
      }
      else {
        v6 = "com.apple.avfoundation.dataoutput.delegate_callback_queue";
      }
      id result = dispatch_queue_create(v6, 0);
      self->_defaultCallbackQueue = (OS_dispatch_queue *)result;
    }
  }
  return result;
}

- (BOOL)setClientDelegate:(id)a3 clientCallbackQueue:(id)a4 exceptionReason:(id *)a5
{
  if (a3)
  {
    id v7 = a4;
    BOOL v8 = [(AVCaptureDataOutputDelegateCallbackHelper *)self _validateCallbackQueue:a4 exceptionReason:a5];
    if (!v8) {
      return v8;
    }
  }
  else
  {
    id v7 = 0;
  }
  MEMORY[0x1A6234330](self->_stateMutex);
  [(AVWeakReferencingDelegateStorage *)self->_delegateStorage setDelegate:a3 queue:v7];
  if (!self->_delegateOverrideStorage && self->_remoteQueueReceiver)
  {
    [(AVCaptureDataOutputDelegateCallbackHelper *)self _activeCallbackQueue];
    FigRemoteQueueReceiverSetHandler();
  }
  MEMORY[0x1A6234340](self->_stateMutex);
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)_validateCallbackQueue:(id)a3 exceptionReason:(id *)a4
{
  if (AVCaptureIsRunningInMediaserverd()
    && !self->_canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd)
  {
    if (!a3) {
      return 1;
    }
    if (a4)
    {
      BOOL v8 = @"A callback queue can not be used in conjunction with a local queue";
      goto LABEL_10;
    }
  }
  else
  {
    if (a3) {
      return 1;
    }
    if (a4)
    {
      BOOL v8 = @"NULL queue passed";
LABEL_10:
      BOOL result = 0;
      *a4 = v8;
      return result;
    }
  }
  return 0;
}

+ (void)initialize
{
}

- (void)dealloc
{
  if (self->_remoteQueueReceiver)
  {
    FigRemoteQueueReceiverUnsetHandler();
    CFRelease(self->_remoteQueueReceiver);
  }

  if (self->_localQueue)
  {
    FigLocalQueueUnsetReceiverHandler();
    CFRelease(self->_localQueue);
  }

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDataOutputDelegateCallbackHelper;
  [(AVCaptureDataOutputDelegateCallbackHelper *)&v3 dealloc];
}

- (OS_dispatch_queue)activeCallbackQueue
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  objc_super v3 = [(AVCaptureDataOutputDelegateCallbackHelper *)self _activeCallbackQueue];
  MEMORY[0x1A6234340](self->_stateMutex);
  return v3;
}

- (id)clientDelegate
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  objc_super v3 = (void *)[(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegate];
  MEMORY[0x1A6234340](self->_stateMutex);
  return v3;
}

- (OS_dispatch_queue)clientCallbackQueue
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  objc_super v3 = (OS_dispatch_queue *)[(AVWeakReferencingDelegateStorage *)self->_delegateStorage delegateQueue];
  MEMORY[0x1A6234340](self->_stateMutex);
  return v3;
}

- (BOOL)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4 exceptionReason:(id *)a5
{
  if (a3)
  {
    BOOL v8 = [(AVCaptureDataOutputDelegateCallbackHelper *)self _validateCallbackQueue:a4 exceptionReason:a5];
    if (!v8) {
      return v8;
    }
    p_stateMutex = &self->_stateMutex;
    MEMORY[0x1A6234330](self->_stateMutex);
    delegateOverrideStorage = self->_delegateOverrideStorage;
    if (!delegateOverrideStorage)
    {
      delegateOverrideStorage = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E4F47DF8]);
      self->_delegateOverrideStorage = delegateOverrideStorage;
    }
    [(AVWeakReferencingDelegateStorage *)delegateOverrideStorage setDelegate:a3 queue:a4];
  }
  else
  {
    p_stateMutex = &self->_stateMutex;
    MEMORY[0x1A6234330](self->_stateMutex, a2, 0, a4, a5);

    self->_delegateOverrideStorage = 0;
  }
  if (self->_remoteQueueReceiver)
  {
    [(AVCaptureDataOutputDelegateCallbackHelper *)self _activeCallbackQueue];
    FigRemoteQueueReceiverSetHandler();
  }
  MEMORY[0x1A6234340](*p_stateMutex);
  LOBYTE(v8) = 1;
  return v8;
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  id v3 = (id)[(AVWeakReferencingDelegateStorage *)self->_delegateOverrideStorage delegateQueue];
  MEMORY[0x1A6234340](self->_stateMutex);

  return (OS_dispatch_queue *)v3;
}

- (void)releaseRemoteQueueReceiver
{
  MEMORY[0x1A6234330](self->_stateMutex, a2);
  if (self->_remoteQueueReceiver)
  {
    FigRemoteQueueReceiverUnsetHandler();
    remoteQueueReceiver = self->_remoteQueueReceiver;
    if (remoteQueueReceiver)
    {
      CFRelease(remoteQueueReceiver);
      self->_remoteQueueReceiver = 0;
    }
  }

  JUMPOUT(0x1A6234340);
}

- (void)updateLocalQueue:(localQueueOpaque *)a3 handler:(id)a4
{
  MEMORY[0x1A6234330](self->_stateMutex);
  if (!self->_remoteQueueReceiver)
  {
    if (self->_localQueue)
    {
      FigLocalQueueUnsetReceiverHandler();
      localQueue = self->_localQueue;
    }
    else
    {
      localQueue = 0;
    }
    self->_localQueue = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (localQueue) {
      CFRelease(localQueue);
    }
    if (a4 && self->_localQueue)
    {
      [(AVCaptureDataOutputDelegateCallbackHelper *)self _activeCallbackQueue];
      FigLocalQueueSetReceiverHandler();
    }
    JUMPOUT(0x1A6234340);
  }
  MEMORY[0x1A6234340](self->_stateMutex);
  if (a3)
  {
    BOOL v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    objc_exception_throw(v8);
  }
}

@end