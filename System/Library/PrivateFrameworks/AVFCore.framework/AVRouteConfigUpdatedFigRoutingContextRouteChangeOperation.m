@interface AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation
+ (void)initialize;
- (AVOutputContextDestinationChange)result;
- (AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation)init;
- (AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 routeChangeID:(__CFString *)a4 routeChangeBlock:(id)a5;
- (BOOL)isAsynchronous;
- (void)_routeConfigUpdateWithID:(__CFString *)a3 endedWithReason:(__CFString *)a4;
- (void)_setResultIfNotAlreadySet:(id)a3;
- (void)dealloc;
- (void)start;
@end

@implementation AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation)init
{
  return [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)self initWithRoutingContext:0 routeChangeID:0 routeChangeBlock:0];
}

- (AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 routeChangeID:(__CFString *)a4 routeChangeBlock:(id)a5
{
  id v9 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:CMNotificationCenterGetDefaultLocalCenter()];
  v19.receiver = self;
  v19.super_class = (Class)AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation;
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
  v10->_routeChangeID = v12;
  if (!v12) {
    goto LABEL_12;
  }
  uint64_t v13 = [a5 copy];
  v10->_routeChangeBlock = (id)v13;
  if (!v13) {
    goto LABEL_12;
  }
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10->_routeChangeIvarAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.route-change-operation.ivars", v14);
  v15 = [[AVWeakReference alloc] initWithReferencedObject:v10];
  v10->_weakObserver = v15;
  [v9 addListenerWithWeakReference:v15 callback:AVRouteConfigUpdatedFigRoutingContextRouteChangeOperationRouteConfigUpdated name:*MEMORY[0x1E4F756F0] object:v10->_routingContext flags:0];
  v16 = v10;
LABEL_11:

  return v16;
}

- (void)dealloc
{
  if (self->_weakObserver) {
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVRouteConfigUpdatedFigRoutingContextRouteChangeOperationRouteConfigUpdated, *MEMORY[0x1E4F756F0], self->_routingContext);
  }
  routingContext = self->_routingContext;
  if (routingContext) {
    CFRelease(routingContext);
  }

  routeChangeIvarAccessQueue = self->_routeChangeIvarAccessQueue;
  if (routeChangeIvarAccessQueue) {
    dispatch_release(routeChangeIvarAccessQueue);
  }
  routeChangeID = self->_routeChangeID;
  if (routeChangeID) {
    CFRelease(routeChangeID);
  }

  v6.receiver = self;
  v6.super_class = (Class)AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation;
  [(AVOperation *)&v6 dealloc];
}

- (AVOutputContextDestinationChange)result
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  id v9 = __Block_byref_object_copy__30;
  v10 = __Block_byref_object_dispose__30;
  uint64_t v11 = 0;
  routeChangeIvarAccessQueue = self->_routeChangeIvarAccessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation_result__block_invoke;
  v5[3] = &unk_1E57B2110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(routeChangeIvarAccessQueue, v5);
  v3 = (AVOutputContextDestinationChange *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __67__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation_result__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 312);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setResultIfNotAlreadySet:(id)a3
{
  routeChangeIvarAccessQueue = self->_routeChangeIvarAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __87__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke;
  v4[3] = &unk_1E57B2098;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(routeChangeIvarAccessQueue, v4);
}

id *__87__AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation__setResultIfNotAlreadySet___block_invoke(id *result)
{
  if (!*((void *)result[4] + 39))
  {
    v1 = result;
    id result = (id *)result[5];
    *((void *)v1[4] + 39) = result;
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
    signed int v3 = (*((uint64_t (**)(void))self->_routeChangeBlock + 2))();
    if (v3)
    {
      signed int v4 = v3;
      v5 = objc_alloc_init(AVOutputContextDestinationChange);
      [(AVOutputContextDestinationChange *)v5 markAsFailed];
      [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)self _setResultIfNotAlreadySet:v5];
      [(AVOperation *)self markAsFailedWithError:AVLocalizedErrorWithUnderlyingOSStatus(v4, 0)];
    }
  }
}

- (void)_routeConfigUpdateWithID:(__CFString *)a3 endedWithReason:(__CFString *)a4
{
  v7 = objc_alloc_init(AVOutputContextDestinationChange);
  if (FigCFEqual())
  {
    [(AVOutputContextDestinationChange *)v7 changeToTerminalStatusBasedOnRouteConfigUpdatedReason:a4];
    [(AVRouteConfigUpdatedFigRoutingContextRouteChangeOperation *)self _setResultIfNotAlreadySet:v7];
    if ([(AVOutputContextDestinationChange *)v7 status] == 2)
    {
      [(AVOperation *)self markAsCompleted];
    }
    else if ([(AVOutputContextDestinationChange *)v7 status] == 3)
    {
      if (FigCFEqual()) {
        uint64_t v6 = -11909;
      }
      else {
        uint64_t v6 = -11800;
      }
      [(AVOperation *)self markAsFailedWithError:AVLocalizedError(@"AVFoundationErrorDomain", v6, 0)];
    }
    else
    {
      [(AVOperation *)self markAsCancelled];
    }
  }
  MEMORY[0x1F41817F8]();
}

@end