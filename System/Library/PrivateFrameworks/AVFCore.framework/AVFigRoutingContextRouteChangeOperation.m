@interface AVFigRoutingContextRouteChangeOperation
+ (void)initialize;
- (AVFigRoutingContextRouteChangeOperation)init;
- (AVFigRoutingContextRouteChangeOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 successNotification:(__CFString *)a4 routeChangeBlock:(id)a5;
- (AVOutputContextDestinationChange)result;
- (BOOL)isAsynchronous;
- (void)_routeChangeComplete;
- (void)_routeChangeStartedWithID:(__CFNumber *)a3;
- (void)_routeChangeWithID:(__CFNumber *)a3 endedWithReason:(__CFString *)a4;
- (void)_setResultIfNotAlreadySet:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation AVFigRoutingContextRouteChangeOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextRouteChangeOperation)init
{
  return [(AVFigRoutingContextRouteChangeOperation *)self initWithRoutingContext:0 successNotification:0 routeChangeBlock:0];
}

- (AVFigRoutingContextRouteChangeOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 successNotification:(__CFString *)a4 routeChangeBlock:(id)a5
{
  id v9 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v19.receiver = self;
  v19.super_class = (Class)AVFigRoutingContextRouteChangeOperation;
  v10 = [(AVOperation *)&v19 init];
  if (!v10) {
    goto LABEL_12;
  }
  if (!a3)
  {
    v16 = 0;
    uint64_t v17 = 280;
LABEL_10:
    *(Class *)((char *)&v10->super.super.super.isa + v17) = 0;
    goto LABEL_11;
  }
  v11 = (OpaqueFigRoutingContext *)CFRetain(a3);
  v10->_routingContext = v11;
  if (!v11)
  {
LABEL_12:
    v16 = 0;
    goto LABEL_11;
  }
  if (!a4)
  {
    v16 = 0;
    uint64_t v17 = 288;
    goto LABEL_10;
  }
  v12 = (__CFString *)CFRetain(a4);
  v10->_successNotification = v12;
  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v13 = [a5 copy];
  v10->_routeChangeBlock = (id)v13;
  if (!v13) {
    goto LABEL_12;
  }
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_notificationManagementQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.route-change-operation.ivars", v14);
  v10->_actOnRouteChangeNotifications = 0;
  v15 = [[AVWeakReference alloc] initWithReferencedObject:v10];
  v10->_weakObserver = v15;
  [v9 addListenerWithWeakReference:v15 callback:AVFigRoutingContextRouteChangeOperationRouteChangeStarted name:*MEMORY[0x1E4F756E8] object:v10->_routingContext flags:0];
  [v9 addListenerWithWeakReference:v10->_weakObserver callback:AVFigRoutingContextRouteChangeOperationRouteChangeEnded name:*MEMORY[0x1E4F756E0] object:v10->_routingContext flags:0];
  [v9 addListenerWithWeakReference:v10->_weakObserver callback:AVFigRoutingContextRouteChangeOperationRouteChangeComplete name:v10->_successNotification object:v10->_routingContext flags:0];
  v16 = v10;
LABEL_11:

  return v16;
}

- (void)dealloc
{
  if (self->_weakObserver)
  {
    id v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextRouteChangeOperationRouteChangeStarted name:*MEMORY[0x1E4F756E8] object:self->_routingContext];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextRouteChangeOperationRouteChangeEnded name:*MEMORY[0x1E4F756E0] object:self->_routingContext];
    [v3 removeListenerWithWeakReference:self->_weakObserver callback:AVFigRoutingContextRouteChangeOperationRouteChangeComplete name:self->_successNotification object:self->_routingContext];
  }
  routingContext = self->_routingContext;
  if (routingContext) {
    CFRelease(routingContext);
  }
  successNotification = self->_successNotification;
  if (successNotification) {
    CFRelease(successNotification);
  }

  notificationManagementQueue = self->_notificationManagementQueue;
  if (notificationManagementQueue) {
    dispatch_release(notificationManagementQueue);
  }
  routeChangeID = self->_routeChangeID;
  if (routeChangeID) {
    CFRelease(routeChangeID);
  }

  v8.receiver = self;
  v8.super_class = (Class)AVFigRoutingContextRouteChangeOperation;
  [(AVOperation *)&v8 dealloc];
}

- (AVOutputContextDestinationChange)result
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  uint64_t v11 = 0;
  notificationManagementQueue = self->_notificationManagementQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__AVFigRoutingContextRouteChangeOperation_result__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationManagementQueue, v5);
  id v3 = (AVOutputContextDestinationChange *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __49__AVFigRoutingContextRouteChangeOperation_result__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 328);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setResultIfNotAlreadySet:(id)a3
{
  notificationManagementQueue = self->_notificationManagementQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AVFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(notificationManagementQueue, v4);
}

id *__69__AVFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke(id *result)
{
  if (!*((void *)result[4] + 41))
  {
    v1 = result;
    id result = (id *)result[5];
    *((void *)v1[4] + 41) = result;
  }
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  if ([(AVOperation *)self evaluateDependenciesAndMarkAsExecuting])
  {
    notificationManagementQueue = self->_notificationManagementQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__AVFigRoutingContextRouteChangeOperation_start__block_invoke;
    block[3] = &unk_1E57B1E80;
    block[4] = self;
    dispatch_sync(notificationManagementQueue, block);
    signed int v4 = (*((uint64_t (**)(void))self->_routeChangeBlock + 2))();
    if (v4)
    {
      signed int v5 = v4;
      uint64_t v6 = objc_alloc_init(AVOutputContextDestinationChange);
      [(AVOutputContextDestinationChange *)v6 markAsFailed];
      [(AVFigRoutingContextRouteChangeOperation *)self _setResultIfNotAlreadySet:v6];
      [(AVOperation *)self markAsFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v5, 0)];
    }
  }
}

uint64_t __48__AVFigRoutingContextRouteChangeOperation_start__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 312) = 1;
  return result;
}

- (void)_routeChangeStartedWithID:(__CFNumber *)a3
{
  notificationManagementQueue = self->_notificationManagementQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__AVFigRoutingContextRouteChangeOperation__routeChangeStartedWithID___block_invoke;
  v4[3] = &unk_1E57B2228;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(notificationManagementQueue, v4);
}

void *__69__AVFigRoutingContextRouteChangeOperation__routeChangeStartedWithID___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 312) && !*(void *)(v1 + 320))
  {
    v2 = result;
    id result = (void *)result[5];
    if (result)
    {
      id result = CFRetain(result);
      uint64_t v1 = v2[4];
    }
    *(void *)(v1 + 320) = result;
  }
  return result;
}

- (void)_routeChangeWithID:(__CFNumber *)a3 endedWithReason:(__CFString *)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v7 = objc_alloc_init(AVOutputContextDestinationChange);
  notificationManagementQueue = self->_notificationManagementQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__AVFigRoutingContextRouteChangeOperation__routeChangeWithID_endedWithReason___block_invoke;
  block[3] = &unk_1E57B3A60;
  void block[5] = &v11;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(notificationManagementQueue, block);
  if (*((unsigned char *)v12 + 24))
  {
    [(AVOutputContextDestinationChange *)v7 changeToTerminalStatusBasedOnRouteChangeEndedReason:a4];
    [(AVFigRoutingContextRouteChangeOperation *)self _setResultIfNotAlreadySet:v7];
    if (!FigCFEqual())
    {
      if (FigCFEqual())
      {
        uint64_t v9 = -11800;
      }
      else
      {
        if (!FigCFEqual())
        {
          [(AVOperation *)self markAsCancelled];
          goto LABEL_8;
        }
        uint64_t v9 = -11909;
      }
      [(AVOperation *)self markAsFailedWithError:AVLocalizedError(@"AVFoundationErrorDomain", v9, 0)];
    }
  }
LABEL_8:

  _Block_object_dispose(&v11, 8);
}

uint64_t __78__AVFigRoutingContextRouteChangeOperation__routeChangeWithID_endedWithReason___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 312))
  {
    uint64_t v1 = result;
    id result = FigCFEqual();
    if (result) {
      *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)_routeChangeComplete
{
  id v3 = objc_alloc_init(AVOutputContextDestinationChange);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  notificationManagementQueue = self->_notificationManagementQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AVFigRoutingContextRouteChangeOperation__routeChangeComplete__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(notificationManagementQueue, v5);
  if (*((unsigned char *)v7 + 24))
  {
    [(AVOutputContextDestinationChange *)v3 markAsFinished];
    [(AVFigRoutingContextRouteChangeOperation *)self _setResultIfNotAlreadySet:v3];
    [(AVOperation *)self markAsCompleted];
  }

  _Block_object_dispose(&v6, 8);
}

uint64_t __63__AVFigRoutingContextRouteChangeOperation__routeChangeComplete__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 312);
  return result;
}

@end