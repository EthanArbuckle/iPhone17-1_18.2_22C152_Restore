@interface AVWeaklyObservedObjectClientBlockKVONotifier
- (AVWeaklyObservedObjectClientBlockKVONotifier)initWithCallbackContextRegistry:(id)a3 observer:(id)a4 object:(id)a5 keyPath:(id)a6 options:(unint64_t)a7 block:(id)a8;
- (void)callbackDidFireWithChangeDictionary:(id)a3;
- (void)cancelCallbacks;
- (void)dealloc;
- (void)start;
@end

@implementation AVWeaklyObservedObjectClientBlockKVONotifier

- (void)callbackDidFireWithChangeDictionary:(id)a3
{
  if ([(AVWeakReference *)self->_weakReferenceToObject referencedObject])
  {
    v4 = (void (*)(void))*((void *)self->_block + 2);
    v4();
  }
  else
  {
    NSLog(&cfstr_ReceivedKvoFor.isa, self->_unsafeUnretainedObject, self->_unsafeUnretainedObject);
  }
}

- (void)start
{
  id v3 = [(AVWeakReference *)self->_weakReferenceToObject referencedObject];
  v4 = [(AVCallbackContextRegistry *)self->_callbackContextRegistry registerCallbackContextObject:self];
  self->_callbackContextToken = v4;
  [v3 addObserver:self->_observer forKeyPath:self->_keyPath options:self->_options context:v4];
  [v3 addCallbackToCancelDuringDeallocation:self];
}

- (AVWeaklyObservedObjectClientBlockKVONotifier)initWithCallbackContextRegistry:(id)a3 observer:(id)a4 object:(id)a5 keyPath:(id)a6 options:(unint64_t)a7 block:(id)a8
{
  if (!a3)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "callbackContextRegistry != nil";
    goto LABEL_16;
  }
  if (!a4)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "observer != nil";
    goto LABEL_16;
  }
  if (!a5)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "object != nil";
    goto LABEL_16;
  }
  if (!a6)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "keyPath != nil";
    goto LABEL_16;
  }
  if (!a8)
  {
    v17 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v18 = *MEMORY[0x1E4F1C3C8];
    v19 = "block != nil";
LABEL_16:
    v20 = (void *)[v17 exceptionWithName:v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (uint64_t)a8, (uint64_t)v19), 0 reason userInfo];
    objc_exception_throw(v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)AVWeaklyObservedObjectClientBlockKVONotifier;
  v14 = [(AVWeaklyObservedObjectClientBlockKVONotifier *)&v21 init];
  if (v14)
  {
    v15 = (AVCallbackContextRegistry *)a3;
    if (v15) {
      v15 = (AVCallbackContextRegistry *)CFRetain(v15);
    }
    v14->_callbackContextRegistry = v15;
    v14->_observer = a4;
    v14->_weakReferenceToObject = [[AVWeakReference alloc] initWithReferencedObject:a5];
    v14->_unsafeUnretainedObject = (AVWeakObservable *)a5;
    v14->_keyPath = (NSString *)[a6 copy];
    v14->_options = a7;
    v14->_block = (id)[a8 copy];
  }
  return v14;
}

- (void)dealloc
{
  unsafeUnretainedObject = self->_unsafeUnretainedObject;
  if (unsafeUnretainedObject)
  {
    v4 = NSStringFromProtocol((Protocol *)&unk_1EE5E3768);
    NSLog(&cfstr_WeaklyObserved.isa, unsafeUnretainedObject, self, unsafeUnretainedObject, v4);
  }
  [(AVCallbackContextRegistry *)self->_callbackContextRegistry unregisterCallbackContextForToken:self->_callbackContextToken];
  callbackContextRegistry = self->_callbackContextRegistry;
  if (callbackContextRegistry)
  {
    CFRelease(callbackContextRegistry);
    v6 = self->_callbackContextRegistry;
  }
  else
  {
    v6 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)AVWeaklyObservedObjectClientBlockKVONotifier;
  [(AVWeaklyObservedObjectClientBlockKVONotifier *)&v7 dealloc];
}

- (void)cancelCallbacks
{
  unsafeUnretainedObject = self->_unsafeUnretainedObject;
  if (unsafeUnretainedObject && FigAtomicCompareAndSwapPtr())
  {
    v4 = [(AVWeakReference *)self->_weakReferenceToObject referencedObject];
    if (!v4) {
      v4 = unsafeUnretainedObject;
    }
    [(AVWeakObservable *)v4 removeObserver:self->_observer forKeyPath:self->_keyPath context:self->_callbackContextToken];
    callbackContextRegistry = self->_callbackContextRegistry;
    callbackContextToken = self->_callbackContextToken;
    [(AVCallbackContextRegistry *)callbackContextRegistry unregisterCallbackContextForToken:callbackContextToken];
  }
}

@end