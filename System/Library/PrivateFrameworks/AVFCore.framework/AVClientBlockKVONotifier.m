@interface AVClientBlockKVONotifier
- (AVClientBlockKVONotifier)initWithCallbackContextRegistry:(id)a3 observer:(id)a4 object:(id)a5 keyPath:(id)a6 options:(unint64_t)a7 block:(id)a8;
- (NSObject)observedObject;
- (void)callbackDidFireWithChangeDictionary:(id)a3;
- (void)cancelCallbacks;
- (void)dealloc;
- (void)start;
@end

@implementation AVClientBlockKVONotifier

- (void)start
{
  v3 = [(AVCallbackContextRegistry *)self->_callbackContextRegistry registerCallbackContextObject:self];
  self->_callbackContextToken = v3;
  observer = self->_observer;
  object = self->_object;
  keyPath = self->_keyPath;
  unint64_t options = self->_options;
  [object addObserver:observer forKeyPath:keyPath options:options context:v3];
}

- (AVClientBlockKVONotifier)initWithCallbackContextRegistry:(id)a3 observer:(id)a4 object:(id)a5 keyPath:(id)a6 options:(unint64_t)a7 block:(id)a8
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
  v21.super_class = (Class)AVClientBlockKVONotifier;
  v14 = [(AVClientBlockKVONotifier *)&v21 init];
  if (v14)
  {
    v15 = (AVCallbackContextRegistry *)a3;
    if (v15) {
      v15 = (AVCallbackContextRegistry *)CFRetain(v15);
    }
    v14->_callbackContextRegistry = v15;
    v14->_observer = a4;
    v14->_object = a5;
    v14->_keyPath = (NSString *)[a6 copy];
    v14->_unint64_t options = a7;
    v14->_block = (id)[a8 copy];
  }
  return v14;
}

- (void)callbackDidFireWithChangeDictionary:(id)a3
{
}

- (void)dealloc
{
  object = self->_object;
  if (object) {
    [object removeObserver:self->_observer forKeyPath:self->_keyPath context:self->_callbackContextToken];
  }
  [(AVCallbackContextRegistry *)self->_callbackContextRegistry unregisterCallbackContextForToken:self->_callbackContextToken];
  callbackContextRegistry = self->_callbackContextRegistry;
  if (callbackContextRegistry)
  {
    CFRelease(callbackContextRegistry);
    v5 = self->_callbackContextRegistry;
  }
  else
  {
    v5 = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)AVClientBlockKVONotifier;
  [(AVClientBlockKVONotifier *)&v6 dealloc];
}

- (NSObject)observedObject
{
  return self->_object;
}

- (void)cancelCallbacks
{
  object = self->_object;
  if (object)
  {
    v4 = object;
    if (FigAtomicCompareAndSwapPtr())
    {
      [v4 removeObserver:self->_observer forKeyPath:self->_keyPath context:self->_callbackContextToken];
      [(AVCallbackContextRegistry *)self->_callbackContextRegistry unregisterCallbackContextForToken:self->_callbackContextToken];
    }
  }
}

@end