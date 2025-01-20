@interface CHCallInteractionInProcessDataSource
- (CHCallInteractionDataSourceDelegate)delegate;
- (CHCallInteractionInProcessDataSource)init;
- (CHNotifyObserver)callInteractionObserver;
- (os_unfair_lock_s)accessorLock;
- (void)setDelegate:(id)a3;
@end

@implementation CHCallInteractionInProcessDataSource

- (CHCallInteractionInProcessDataSource)init
{
  v19.receiver = self;
  v19.super_class = (Class)CHCallInteractionInProcessDataSource;
  v2 = [(CHCallInteractionInProcessDataSource *)&v19 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    id v4 = [NSString stringWithFormat:@"com.apple.CallHistory.queue.%@.%p", objc_opt_class(), v2];
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);

    objc_initWeak(&location, v3);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__CHCallInteractionInProcessDataSource_init__block_invoke;
    v15[3] = &unk_1E61C7430;
    objc_copyWeak(&v17, &location);
    v8 = v3;
    v16 = v8;
    v9 = (void *)MEMORY[0x1BA9CD2A0](v15);
    v10 = [CHNotifyObserver alloc];
    v11 = [NSString stringWithUTF8String:"com.apple.callhistory.notification.call-interactions-changed"];
    uint64_t v12 = [(CHNotifyObserver *)v10 initWithName:v11 queue:v7 callback:v9];
    callInteractionObserver = v8->_callInteractionObserver;
    v8->_callInteractionObserver = (CHNotifyObserver *)v12;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __44__CHCallInteractionInProcessDataSource_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v3 = [WeakRetained delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 callInteractionsDidChangeForDataSource:*(void *)(a1 + 32)];
    }

    id WeakRetained = v4;
  }
}

- (CHCallInteractionDataSourceDelegate)delegate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = self->_delegate;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setDelegate:(id)a3
{
  v8 = (CHCallInteractionDataSourceDelegate *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  delegate = self->_delegate;
  p_delegate = &self->_delegate;
  if (delegate != v8) {
    objc_storeStrong((id *)p_delegate, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (CHNotifyObserver)callInteractionObserver
{
  return self->_callInteractionObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callInteractionObserver, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end