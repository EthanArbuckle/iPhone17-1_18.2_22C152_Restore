@interface AnalyticsEventObserver
- (AnalyticsEventObserver)init;
- (AnalyticsEventObserverDelegate)delegate;
- (BOOL)startObservingEventList:(id)a3;
- (BOOL)startObservingEventList:(id)a3 withErrorHandler:(id)a4;
- (BOOL)stopObserving;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (uint64_t)startObservingEventList:withErrorHandler:;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setEventObserverDelegate:(id)a3 queue:(id)a4;
- (void)setQueue:(id)a3;
- (void)startObservingEventList:withErrorHandler:;
@end

@implementation AnalyticsEventObserver

void __67__AnalyticsEventObserver_startObservingEventList_withErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  v3 = [*(id *)(a1 + 32) delegate];
  v4 = [*v2 delegateQueue];
  v5 = (char *)operator new(0x38uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)v5 = &unk_1EFE16070;
  v6 = *(void **)(a1 + 32);
  id v7 = v4;
  *((void *)v5 + 3) = &unk_1EFE15DA0;
  id v8 = v3;
  objc_initWeak((id *)v5 + 4, v6);
  objc_initWeak((id *)v5 + 5, v8);

  *((void *)v5 + 6) = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(std::__shared_weak_count **)(v9 + 16);
  *(void *)(v9 + 8) = v5 + 24;
  *(void *)(v9 + 16) = v5;
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }

  v12 = CoreAnalytics::Client::get(v11);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v13 + 8);
  v14 = *(std::__shared_weak_count **)(v13 + 16);
  uint64_t v16 = v15;
  v17 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  CoreAnalytics::Client::registerEventObserver((NSObject **)v12, (uint64_t)&v16);
  if (v17) {
    std::__shared_weak_count::__release_weak(v17);
  }
}

- (AnalyticsEventObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AnalyticsEventObserverDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)startObservingEventList:withErrorHandler:
{
}

- (BOOL)startObservingEventList:(id)a3 withErrorHandler:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CASPIEnter();
  xpc_object_t v36 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::dict::create(&v36);
  xpc_object_t v35 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  applesauce::xpc::array::create(&v35);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v41 + 1) + 8 * i);
        applesauce::xpc::object::object((applesauce::xpc::object *)&v37, (const char *)[v12 UTF8String]);
        uint64_t v13 = v37;
        xpc_object_t v14 = v35;
        xpc_array_append_value(v14, v13);

        uint64_t v15 = v37;
        v37 = 0;
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v40 count:16];
    }
    while (v9);
  }

  applesauce::xpc::object::object((applesauce::xpc::object *)&v33, &v35);
  v37 = &v36;
  v38 = "events";
  applesauce::xpc::dict::object_proxy::operator=((uint64_t)&v37, &v33, &v34);
  id v16 = v34;
  id v34 = 0;

  id v17 = v33;
  id v33 = 0;

  v19 = CoreAnalytics::Client::get(v18);
  if (v7)
  {
    v20 = (const char *)_Block_copy(v7);
    v37 = (xpc_object_t *)&unk_1EFE15FB8;
    v38 = v20;
    v39 = (id *)&v37;
    CoreAnalytics::Client::registerErrorHandler((NSObject **)v19, (uint64_t)&v37);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](&v37);
  }
  xpc_object_t v32 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  std::string::basic_string[abi:ne180100]<0>(__p, "create-event-observer");
  applesauce::xpc::object::object((applesauce::xpc::object *)&v29, &v36);
  CoreAnalytics::Client::sendManagementCommandWithReply((NSObject **)v19, (uint64_t)__p, &v29, &v32);
  id v21 = v29;
  id v29 = 0;

  if (v31 < 0) {
    operator delete(__p[0]);
  }
  if (MEMORY[0x1AD0D7420](v32) == MEMORY[0x1E4F14590])
  {
    v37 = &v32;
    v38 = "error";
    if (applesauce::xpc::dict::object_proxy::operator BOOL((uint64_t)&v37))
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1AD0D68A0](exception, "create-event-observer failed");
      __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
    }
  }
  v22 = [(AnalyticsEventObserver *)self queue];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __67__AnalyticsEventObserver_startObservingEventList_withErrorHandler___block_invoke;
  v28[3] = &unk_1E5D1EC08;
  v28[4] = self;
  dispatch_barrier_async(v22, v28);

  xpc_object_t v23 = v32;
  xpc_object_t v32 = 0;

  xpc_object_t v24 = v35;
  xpc_object_t v35 = 0;

  xpc_object_t v25 = v36;
  xpc_object_t v36 = 0;

  return 1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (AnalyticsEventObserver)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AnalyticsEventObserver;
  v2 = [(AnalyticsEventObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreAnalytics.EventObserver", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    [(AnalyticsEventObserver *)v2 setDelegate:0];
    [(AnalyticsEventObserver *)v2 setDelegateQueue:0];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  cntrl = self->observer.__cntrl_;
  self->observer.__ptr_ = 0;
  self->observer.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  v4.receiver = self;
  v4.super_class = (Class)AnalyticsEventObserver;
  [(AnalyticsEventObserver *)&v4 dealloc];
}

- (void)setEventObserverDelegate:(id)a3 queue:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CASPIEnter();
  id v8 = [(AnalyticsEventObserver *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__AnalyticsEventObserver_setEventObserverDelegate_queue___block_invoke;
  v11[3] = &unk_1E5D1EBE0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);
}

uint64_t __57__AnalyticsEventObserver_setEventObserverDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  dispatch_queue_t v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (BOOL)startObservingEventList:(id)a3
{
  return [(AnalyticsEventObserver *)self startObservingEventList:a3 withErrorHandler:0];
}

- (BOOL)stopObserving
{
  v5[5] = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  dispatch_queue_t v3 = [(AnalyticsEventObserver *)self queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AnalyticsEventObserver_stopObserving__block_invoke;
  v5[3] = &unk_1E5D1EC08;
  v5[4] = self;
  dispatch_barrier_async(v3, v5);

  return 1;
}

void __39__AnalyticsEventObserver_stopObserving__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

- (void)setQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  cntrl = self->observer.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (uint64_t)startObservingEventList:withErrorHandler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end