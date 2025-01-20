@interface LSObserver
+ (void)initialize;
- (LSObserverDelegate)delegate;
- (NSOperationQueue)queue;
- (NSString)name;
- (id)debugDescription;
- (id)description;
- (void)_configureCallbacks;
- (void)_tearDownCallbacks;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setName:(id)a3;
- (void)setQueue:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation LSObserver

- (void)startObserving
{
  os_unfair_recursive_lock_lock_with_options();
  if (*((unsigned char *)self + 32))
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:95 description:@"Already invoked -startObserving on this observer."];
  }
  [(LSObserver *)self _configureCallbacks];
  *((unsigned char *)self + 32) |= 1u;

  os_unfair_recursive_lock_unlock();
}

- (void)_configureCallbacks
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_182959000, a2, OS_LOG_TYPE_DEBUG, "Delegate %@ does not respond to -observerDidObserveDatabaseChange:, will not notify it of anything.", (uint8_t *)&v2, 0xCu);
}

- (LSObserverDelegate)delegate
{
  os_unfair_recursive_lock_lock_with_options();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_recursive_lock_unlock();

  return (LSObserverDelegate *)WeakRetained;
}

- (NSOperationQueue)queue
{
  os_unfair_recursive_lock_lock_with_options();
  uint64_t v3 = self->_queue;
  os_unfair_recursive_lock_unlock();

  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    os_log_t v2 = os_log_create("com.apple.launchservices", "observer");
    uint64_t v3 = (void *)_LSObserverLog;
    _LSObserverLog = (uint64_t)v2;
  }
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (*((unsigned char *)self + 32))
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:68 description:@"Attempting to set an observer's delegate while it is already observing."];
  }
  objc_storeWeak((id *)&self->_delegate, obj);
  os_unfair_recursive_lock_unlock();
}

- (void)dealloc
{
  [(LSObserver *)self _tearDownCallbacks];
  v3.receiver = self;
  v3.super_class = (Class)LSObserver;
  [(LSObserver *)&v3 dealloc];
}

- (void)setQueue:(id)a3
{
  v5 = (NSOperationQueue *)a3;
  os_unfair_recursive_lock_lock_with_options();
  if (*((unsigned char *)self + 32))
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:87 description:@"Attempting to set an observer's queue while it is already observing."];
  }
  queue = self->_queue;
  self->_queue = v5;

  os_unfair_recursive_lock_unlock();
}

- (void)stopObserving
{
  os_unfair_recursive_lock_lock_with_options();
  if ((*((unsigned char *)self + 32) & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"LSObserver.mm" lineNumber:106 description:@"Invoked -stopObserving on this observer without first invoking -startObserving."];
  }
  [(LSObserver *)self _tearDownCallbacks];
  *((unsigned char *)self + 32) &= ~1u;

  os_unfair_recursive_lock_unlock();
}

void __33__LSObserver__configureCallbacks__block_invoke(uint64_t a1, id *a2)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__LSObserver__configureCallbacks__block_invoke_2;
  v12[3] = &unk_1E522FD58;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  objc_copyWeak(&v14, (id *)(a1 + 48));
  uint64_t v4 = MEMORY[0x18530F950](v12);
  v5 = (void *)v4;
  if (*(void *)(a1 + 32))
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3812000000;
    v10[3] = __Block_byref_object_copy__36;
    v10[4] = __Block_byref_object_dispose__36;
    v10[5] = 256;
    id v11 = *a2;
    v6 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__LSObserver__configureCallbacks__block_invoke_21;
    v7[3] = &unk_1E522FD80;
    id v8 = v5;
    v9 = v10;
    [v6 addOperationWithBlock:v7];

    _Block_object_dispose(v10, 8);
  }
  else
  {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, a2);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
}

void __33__LSObserver__configureCallbacks__block_invoke_2(uint64_t a1, LaunchServices::DatabaseContext *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (WeakRetained && v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__LSObserver__configureCallbacks__block_invoke_3;
    v7[3] = &unk_1E522DCE8;
    id v8 = v5;
    id v9 = WeakRetained;
    _LSDatabaseContextAccessContextUsingBlock(a2, (uint64_t)v7);
  }
}

uint64_t __33__LSObserver__configureCallbacks__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) observerDidObserveDatabaseChange:*(void *)(a1 + 40)];
}

uint64_t __33__LSObserver__configureCallbacks__block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8) + 48);
}

- (void)_tearDownCallbacks
{
  changeObserver = self->_changeObserver;
  if (changeObserver)
  {
    _LSContextRemoveChangeObserver(changeObserver);
    uint64_t v4 = self->_changeObserver;
    self->_changeObserver = 0;
  }
}

- (id)description
{
  os_log_t v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p>", objc_opt_class(), self];

  return v2;
}

- (id)debugDescription
{
  objc_super v3 = [(LSObserver *)self name];
  if (v3)
  {
    uint64_t v4 = [[NSString alloc] initWithFormat:@"<%@ %p> \"%@\"", objc_opt_class(), self, v3];
  }
  else
  {
    uint64_t v4 = [(LSObserver *)self description];
  }
  id v5 = (void *)v4;

  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_changeObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end