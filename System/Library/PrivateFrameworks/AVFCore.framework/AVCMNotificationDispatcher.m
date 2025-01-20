@interface AVCMNotificationDispatcher
+ (id)notificationDispatcherForCMNotificationCenter:(opaqueCMNotificationCenter *)a3;
+ (void)initialize;
- (AVCMNotificationDispatcher)init;
- (AVCMNotificationDispatcher)initWithCMNotificationCenter:(opaqueCMNotificationCenter *)a3;
- (id)_copyAndRemoveObserverForWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6;
- (opaqueCMNotificationCenter)CMNotificationCenter;
- (void)addListenerWithWeakReference:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6 flags:(unsigned int)a7;
- (void)dealloc;
- (void)removeListenerWithWeakReference:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6;
@end

@implementation AVCMNotificationDispatcher

uint64_t __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    uint64_t v5 = result;
    v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 40) CMNotificationCenter];
    uint64_t v7 = [a2 name];
    uint64_t v8 = [a2 object];
    uint64_t v9 = [a2 userInfo];
    return v10(v6, v5, v7, v8, v9);
  }
  return result;
}

- (opaqueCMNotificationCenter)CMNotificationCenter
{
  return self->_cmNotificationCenter;
}

- (void)addListenerWithWeakReference:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6 flags:(unsigned int)a7
{
  listenerObjectsQueue = self->_listenerObjectsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke;
  block[3] = &unk_1E57B6790;
  block[6] = a5;
  block[7] = a6;
  block[8] = a4;
  block[4] = a3;
  block[5] = self;
  dispatch_sync(listenerObjectsQueue, block);
}

- (void)removeListenerWithWeakReference:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6
{
  id v6 = [(AVCMNotificationDispatcher *)self _copyAndRemoveObserverForWeakReferenceToListener:a3 callback:a4 name:a5 object:a6];
  if (v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", v6);
  }
}

void __100__AVCMNotificationDispatcher__copyAndRemoveObserverForWeakReferenceToListener_callback_name_object___block_invoke(uint64_t a1)
{
  v2 = +[AVCMNotificationDispatcherListenerKey listenerKeyWithWeakReferenceToListener:*(void *)(a1 + 32) callback:*(void *)(a1 + 56) name:*(void *)(a1 + 64) object:*(void *)(a1 + 72)];
  v3 = (void *)[*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:v2];
  if (v3 && (uint64_t v9 = v3, [v3 count]))
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = (id)[v9 lastObject];
    objc_msgSend(v9, "removeObjectAtIndex:", objc_msgSend(v9, "count") - 1);
    if (![v9 count])
    {
      v10 = *(void **)(*(void *)(a1 + 40) + 24);
      [v10 removeObjectForKey:v2];
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 72);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v11 = AVMethodExceptionReasonWithObjectAndSelector(*(objc_class **)(a1 + 40), *(const char **)(a1 + 80), @"Cannot remove a listener %@ (callback %p) for %@ from object %p that was never added.  Break on AVCMNotificationDispatcherUnbalancedUnregistrationBreak() to debug.", v4, v5, v6, v7, v8, *(void *)(a1 + 32));
    NSLog(&stru_1EE596A18.isa, v11, v12, v13, v14);
  }
}

void __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__AVCMNotificationDispatcher_addListenerWithWeakReference_callback_name_object_flags___block_invoke_2;
  v8[3] = &unk_1E57B6768;
  uint64_t v10 = *(void *)(a1 + 64);
  long long v9 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = [v2 addObserverForName:v3 object:v4 queue:0 usingBlock:v8];
  uint64_t v6 = +[AVCMNotificationDispatcherListenerKey listenerKeyWithWeakReferenceToListener:*(void *)(a1 + 32) callback:*(void *)(a1 + 64) name:*(void *)(a1 + 48) object:*(void *)(a1 + 56)];
  id v7 = (id)[*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [*(id *)(*(void *)(a1 + 40) + 24) setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v5];
}

- (id)_copyAndRemoveObserverForWeakReferenceToListener:(id)a3 callback:(void *)a4 name:(__CFString *)a5 object:(void *)a6
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy__32;
  uint64_t v14 = __Block_byref_object_dispose__32;
  uint64_t v15 = 0;
  listenerObjectsQueue = self->_listenerObjectsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__AVCMNotificationDispatcher__copyAndRemoveObserverForWeakReferenceToListener_callback_name_object___block_invoke;
  block[3] = &unk_1E57B67B8;
  block[8] = a5;
  void block[9] = a6;
  block[4] = a3;
  block[5] = self;
  block[10] = a2;
  block[6] = &v10;
  block[7] = a4;
  dispatch_sync(listenerObjectsQueue, block);
  id v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

+ (id)notificationDispatcherForCMNotificationCenter:(opaqueCMNotificationCenter *)a3
{
  if ((opaqueCMNotificationCenter *)CMNotificationCenterGetDefaultLocalCenter() != a3
    && (opaqueCMNotificationCenter *)CMNotificationCenterGetDefaultLocalCenter() != a3)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    long long v9 = NSStringFromClass((Class)a1);
    uint64_t v15 = (void *)[v7 exceptionWithName:v8, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"%@ only supports listening to notifications from CMNotificationCenterGetDefaultLocalCenter", v10, v11, v12, v13, v14, (uint64_t)v9), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AVCMNotificationDispatcher_notificationDispatcherForCMNotificationCenter___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (notificationDispatcherForCMNotificationCenter__sSharedDispatcherOnce != -1) {
    dispatch_once(&notificationDispatcherForCMNotificationCenter__sSharedDispatcherOnce, block);
  }
  return (id)notificationDispatcherForCMNotificationCenter__sSharedDispatcher;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    MEMORY[0x1F40DED88]();
  }
}

AVCMNotificationDispatcher *__76__AVCMNotificationDispatcher_notificationDispatcherForCMNotificationCenter___block_invoke(uint64_t a1)
{
  uint64_t result = [[AVCMNotificationDispatcher alloc] initWithCMNotificationCenter:*(void *)(a1 + 32)];
  notificationDispatcherForCMNotificationCenter__sSharedDispatcher = (uint64_t)result;
  return result;
}

- (AVCMNotificationDispatcher)initWithCMNotificationCenter:(opaqueCMNotificationCenter *)a3
{
  if (!a3)
  {
    uint64_t v11 = self;
    v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v12, v13, v14, v15, v16, (uint64_t)"cmNotificationCenter != NULL"), 0 reason userInfo];
    objc_exception_throw(v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)AVCMNotificationDispatcher;
  uint64_t v4 = [(AVCMNotificationDispatcher *)&v18 init];
  if (v4 && (uint64_t v5 = (opaqueCMNotificationCenter *)CFRetain(a3), (v4->_cmNotificationCenter = v5) != 0))
  {
    v4->_observersForListenerKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_listenerObjectsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avcmnotificationdispatcher.ivars", v6);
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (AVCMNotificationDispatcher)init
{
  return [(AVCMNotificationDispatcher *)self initWithCMNotificationCenter:0];
}

- (void)dealloc
{
  cmNotificationCenter = self->_cmNotificationCenter;
  if (cmNotificationCenter) {
    CFRelease(cmNotificationCenter);
  }
  listenerObjectsQueue = self->_listenerObjectsQueue;
  if (listenerObjectsQueue) {
    dispatch_release(listenerObjectsQueue);
  }

  v5.receiver = self;
  v5.super_class = (Class)AVCMNotificationDispatcher;
  [(AVCMNotificationDispatcher *)&v5 dealloc];
}

@end