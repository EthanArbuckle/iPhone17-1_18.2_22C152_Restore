@interface LACKeyBagObserverCollection
- (LACKeyBagObserverCollection)initWithState:(int64_t)a3;
- (void)addObserver:(id)a3;
- (void)publishKeybagStateUpdate:(id)a3 state:(int64_t)a4;
- (void)removeObserver:(id)a3;
@end

@implementation LACKeyBagObserverCollection

- (LACKeyBagObserverCollection)initWithState:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)LACKeyBagObserverCollection;
  v4 = [(LACKeyBagObserverCollection *)&v8 init];
  if (v4)
  {
    uint64_t v5 = +[LACThreadSafeCollection weakObjectsCollection];
    observers = v4->_observers;
    v4->_observers = (LACThreadSafeCollection *)v5;

    v4->_lastPublishedState = a3;
  }
  return v4;
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)publishKeybagStateUpdate:(id)a3 state:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_lastPublishedState != a4)
  {
    v7 = LACLogKeybag();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v8 = NSStringFromLACKeyBagState(self->_lastPublishedState);
      v9 = NSStringFromLACKeyBagState(a4);
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_254F14000, v7, OS_LOG_TYPE_DEFAULT, "Keybag state changed from %@ to %@", buf, 0x16u);
    }
    self->_lastPublishedState = a4;
    observers = self->_observers;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke;
    v11[3] = &unk_2653B5FD8;
    id v12 = v6;
    [(LACThreadSafeCollection *)observers forEach:v11];
  }
}

void __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 conformsToProtocol:&unk_2704383D8] & 1) == 0) {
    __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke_cold_1();
  }
  [v3 keybagStateDidChange:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

void __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke_cold_1()
{
}

@end