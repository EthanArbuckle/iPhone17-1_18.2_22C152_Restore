@interface AVKVODispatcher
+ (id)sharedKVODispatcher;
- (AVKVODispatcher)initWithDescriptionOfHowAllObservedPropertyChangesAreSerializedWithDispatcherDeallocation:(id)a3;
- (id)startObservingObject:(id)a3 weakObserver:(id)a4 forKeyPath:(id)a5 options:(unint64_t)a6 context:(void *)a7;
- (id)startObservingObject:(id)a3 weakObserver:(id)a4 forTwoPartKeyPath:(id)a5 options:(unint64_t)a6 context:(void *)a7;
- (id)startObservingValueAtKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (id)startObservingValueAtKeyPath:(id)a3 withoutKeepingAliveObservedObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (id)startObservingValueAtTwoPartKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AVKVODispatcher

- (id)startObservingObject:(id)a3 weakObserver:(id)a4 forKeyPath:(id)a5 options:(unint64_t)a6 context:(void *)a7
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __102__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forKeyPath_options_context___block_invoke;
  v8[3] = &unk_1E57B7570;
  v8[4] = a5;
  v8[5] = a3;
  v8[6] = a7;
  return [(AVKVODispatcher *)self startObservingValueAtKeyPath:a5 ofObject:a3 options:a6 usingBlock:+[AVObservationBlockFactory observationBlockForWeakObserver:a4 passedToBlock:v8]];
}

- (id)startObservingValueAtKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = "observedObject != nil";
    goto LABEL_10;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = "keyPath != nil";
    goto LABEL_10;
  }
  if (!a6)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = "block != nil";
LABEL_10:
    v13 = (void *)[v10 exceptionWithName:v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, a5, (uint64_t)a6, v6, v7, (uint64_t)v12), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  v8 = [[AVClientBlockKVONotifier alloc] initWithCallbackContextRegistry:self->_callbackContextRegistry observer:self object:a4 keyPath:a3 options:a5 block:a6];
  [(AVClientBlockKVONotifier *)v8 start];
  return v8;
}

+ (id)sharedKVODispatcher
{
  if (sharedKVODispatcher_sSharedRegistryOnce != -1) {
    dispatch_once(&sharedKVODispatcher_sSharedRegistryOnce, &__block_literal_global_37);
  }
  return (id)sharedKVODispatcher_sSharedRegistry;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7 = -[AVCallbackContextRegistry callbackContextForToken:](self->_callbackContextRegistry, "callbackContextForToken:", a6, a4);
  if (v7)
  {
    [v7 callbackDidFireWithChangeDictionary:a5];
  }
}

uint64_t __102__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forKeyPath_options_context___block_invoke(void *a1, void *a2, uint64_t a3)
{
  return [a2 observeValueForKeyPath:a1[4] ofObject:a1[5] change:a3 context:a1[6]];
}

- (id)startObservingValueAtKeyPath:(id)a3 withoutKeepingAliveObservedObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  if (!a4)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = "observedObject != nil";
    goto LABEL_10;
  }
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = "keyPath != nil";
    goto LABEL_10;
  }
  if (!a6)
  {
    v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    v12 = "block != nil";
LABEL_10:
    v13 = (void *)[v10 exceptionWithName:v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, a5, (uint64_t)a6, v6, v7, (uint64_t)v12), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  v8 = [[AVWeaklyObservedObjectClientBlockKVONotifier alloc] initWithCallbackContextRegistry:self->_callbackContextRegistry observer:self object:a4 keyPath:a3 options:a5 block:a6];
  [(AVWeaklyObservedObjectClientBlockKVONotifier *)v8 start];
  return v8;
}

AVKVODispatcher *__38__AVKVODispatcher_sharedKVODispatcher__block_invoke()
{
  result = [[AVKVODispatcher alloc] initWithDescriptionOfHowAllObservedPropertyChangesAreSerializedWithDispatcherDeallocation:@"This instance is never deallocated"];
  sharedKVODispatcher_sSharedRegistry = (uint64_t)result;
  return result;
}

- (AVKVODispatcher)initWithDescriptionOfHowAllObservedPropertyChangesAreSerializedWithDispatcherDeallocation:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVKVODispatcher;
  v3 = [(AVKVODispatcher *)&v5 init];
  if (v3) {
    v3->_callbackContextRegistry = objc_alloc_init(AVCallbackContextRegistry);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVKVODispatcher;
  [(AVKVODispatcher *)&v3 dealloc];
}

- (id)startObservingValueAtTwoPartKeyPath:(id)a3 ofObject:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  if (!a4)
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "observedObject != nil";
    goto LABEL_10;
  }
  if (!a3)
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "keyPath != nil";
    goto LABEL_10;
  }
  if (!a6)
  {
    v16 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v17 = *MEMORY[0x1E4F1C3C8];
    v18 = "block != nil";
LABEL_10:
    v19 = (void *)[v16 exceptionWithName:v17, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, a5, (uint64_t)a6, v6, v7, (uint64_t)v18), 0 reason userInfo];
    objc_exception_throw(v19);
  }
  id v12 = [[AVKeyPathFlattener alloc] initForObservingValueAtKeyPath:a3 onObject:a4];
  v13 = [[AVClientBlockKVONotifier alloc] initWithCallbackContextRegistry:self->_callbackContextRegistry observer:self object:v12 keyPath:@"dependentProperty" options:a5 block:a6];
  [(AVClientBlockKVONotifier *)v13 start];
  v14 = [[AVKeyPathFlattenerKVOIntrospectionShim alloc] initWithObservedObject:a4 realNotifier:v13];

  return v14;
}

- (id)startObservingObject:(id)a3 weakObserver:(id)a4 forTwoPartKeyPath:(id)a5 options:(unint64_t)a6 context:(void *)a7
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __109__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forTwoPartKeyPath_options_context___block_invoke;
  v8[3] = &unk_1E57B7570;
  v8[4] = a5;
  v8[5] = a3;
  v8[6] = a7;
  return [(AVKVODispatcher *)self startObservingValueAtTwoPartKeyPath:a5 ofObject:a3 options:a6 usingBlock:+[AVObservationBlockFactory observationBlockForWeakObserver:a4 passedToBlock:v8]];
}

uint64_t __109__AVKVODispatcher_LegacyCallbackMethod__startObservingObject_weakObserver_forTwoPartKeyPath_options_context___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) keyPathString];
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  return [a2 observeValueForKeyPath:v6 ofObject:v7 change:a3 context:v8];
}

@end