@interface AVAssetWriterFigAssetWriterNotificationHandler
- (AVAssetWriterFigAssetWriterNotificationHandler)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3;
- (AVAssetWriterFigAssetWriterNotificationHandlerDelegate)delegate;
- (AVWeakReference)_weakReferenceToDelegate;
- (void)_callDelegateIfNotCalledWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_handleCompletedWritingNotification;
- (void)_handleFailedNotificationWithError:(id)a3;
- (void)_handleServerDiedNotification;
- (void)_setWeakReferenceToDelegate:(id)a3;
- (void)_teardownNotificationHandlers;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation AVAssetWriterFigAssetWriterNotificationHandler

- (AVAssetWriterFigAssetWriterNotificationHandlerDelegate)delegate
{
  v2 = [(AVAssetWriterFigAssetWriterNotificationHandler *)self _weakReferenceToDelegate];
  return (AVAssetWriterFigAssetWriterNotificationHandlerDelegate *)[(AVWeakReference *)v2 referencedObject];
}

- (void)setDelegate:(id)a3
{
  v4 = [[AVWeakReference alloc] initWithReferencedObject:a3];
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _setWeakReferenceToDelegate:v4];
}

- (AVAssetWriterFigAssetWriterNotificationHandler)initWithFigAssetWriter:(OpaqueFigAssetWriter *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVAssetWriterFigAssetWriterNotificationHandler;
  v4 = [(AVAssetWriterFigAssetWriterNotificationHandler *)&v8 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueFigAssetWriter *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_figAssetWriter = v5;
    v4->_weakReferenceToSelf = [[AVWeakReference alloc] initWithReferencedObject:v4];
    v4->_didNotCallDelegate = 1;
    id v6 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v6 addListenerWithWeakReference:v4->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleServerDiedNotification name:*MEMORY[0x1E4F32540] object:v4->_figAssetWriter flags:0];
    [v6 addListenerWithWeakReference:v4->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleServerDiedNotification name:*MEMORY[0x1E4F21770] object:v4->_figAssetWriter flags:0];
    [v6 addListenerWithWeakReference:v4->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleCompletedNotification name:*MEMORY[0x1E4F32528] object:v4->_figAssetWriter flags:0];
    [v6 addListenerWithWeakReference:v4->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleFailedNotification name:*MEMORY[0x1E4F32530] object:v4->_figAssetWriter flags:0];
    CFRetain(v4->_weakReferenceToSelf);
    v4->_notificationHandlersAreRegistered = 1;
  }
  return v4;
}

- (void)dealloc
{
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _teardownNotificationHandlers];
  figAssetWriter = self->_figAssetWriter;
  if (figAssetWriter) {
    CFRelease(figAssetWriter);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterFigAssetWriterNotificationHandler;
  [(AVAssetWriterFigAssetWriterNotificationHandler *)&v4 dealloc];
}

- (void)_callDelegateIfNotCalledWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v5 = a3;
  if (FigAtomicCompareAndSwap32())
  {
    v7 = [(AVAssetWriterFigAssetWriterNotificationHandler *)self delegate];
    [(AVAssetWriterFigAssetWriterNotificationHandlerDelegate *)v7 didReceiveFigAssetWriterNotificationWithSuccess:v5 error:a4];
  }
}

- (void)_teardownNotificationHandlers
{
  if (FigAtomicCompareAndSwap32())
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleServerDiedNotification name:*MEMORY[0x1E4F32540] object:self->_figAssetWriter];
    [v3 removeListenerWithWeakReference:self->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleServerDiedNotification name:*MEMORY[0x1E4F21770] object:self->_figAssetWriter];
    [v3 removeListenerWithWeakReference:self->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleCompletedNotification name:*MEMORY[0x1E4F32528] object:self->_figAssetWriter];
    [v3 removeListenerWithWeakReference:self->_weakReferenceToSelf callback:AVAssetWriterFigAssetWriterHandleFailedNotification name:*MEMORY[0x1E4F32530] object:self->_figAssetWriter];
    weakReferenceToSelf = self->_weakReferenceToSelf;
    CFRelease(weakReferenceToSelf);
  }
}

- (void)_handleServerDiedNotification
{
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _callDelegateIfNotCalledWithSuccess:0 error:AVLocalizedError(@"AVFoundationErrorDomain", -11819, 0)];
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _teardownNotificationHandlers];
}

- (void)_handleCompletedWritingNotification
{
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _callDelegateIfNotCalledWithSuccess:1 error:0];
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _teardownNotificationHandlers];
}

- (void)_handleFailedNotificationWithError:(id)a3
{
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _callDelegateIfNotCalledWithSuccess:0 error:a3];
  [(AVAssetWriterFigAssetWriterNotificationHandler *)self _teardownNotificationHandlers];
}

- (AVWeakReference)_weakReferenceToDelegate
{
  return (AVWeakReference *)objc_getProperty(self, a2, 32, 1);
}

- (void)_setWeakReferenceToDelegate:(id)a3
{
}

@end