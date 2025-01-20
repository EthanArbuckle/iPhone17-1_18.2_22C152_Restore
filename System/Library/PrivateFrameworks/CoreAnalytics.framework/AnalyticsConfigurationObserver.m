@interface AnalyticsConfigurationObserver
- (AnalyticsConfigurationObserver)init;
- (AnalyticsConfigurationObserverDelegate)delegate;
- (BOOL)startObservingConfigurationType:(id)a3;
- (BOOL)stopObservingConfigurationType:(id)a3;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (void)dealloc;
- (void)setConfigurationObserverDelegate:(id)a3 queue:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation AnalyticsConfigurationObserver

- (AnalyticsConfigurationObserver)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AnalyticsConfigurationObserver;
  v2 = [(AnalyticsConfigurationObserver *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreAnalytics.ConfigurationObserver", MEMORY[0x1E4F14430]);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    [(AnalyticsConfigurationObserver *)v2 setDelegate:0];
    [(AnalyticsConfigurationObserver *)v2 setDelegateQueue:0];
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
  v4.super_class = (Class)AnalyticsConfigurationObserver;
  [(AnalyticsConfigurationObserver *)&v4 dealloc];
}

- (void)setConfigurationObserverDelegate:(id)a3 queue:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  CASPIEnter();
  v8 = [(AnalyticsConfigurationObserver *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__AnalyticsConfigurationObserver_setConfigurationObserverDelegate_queue___block_invoke;
  v11[3] = &unk_1E5D1EBE0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_async(v8, v11);
}

uint64_t __73__AnalyticsConfigurationObserver_setConfigurationObserverDelegate_queue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  dispatch_queue_t v3 = *(void **)(a1 + 32);

  return [v3 setDelegateQueue:v2];
}

- (BOOL)startObservingConfigurationType:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CASPIEnter();
  uint64_t v5 = [(AnalyticsConfigurationObserver *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__AnalyticsConfigurationObserver_startObservingConfigurationType___block_invoke;
  block[3] = &unk_1E5D1ED00;
  block[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, block);

  return 1;
}

void __66__AnalyticsConfigurationObserver_startObservingConfigurationType___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (char *)[*(id *)(a1 + 40) UTF8String];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) delegate];
  id v4 = [*(id *)(a1 + 32) delegateQueue];
  uint64_t v5 = (char *)operator new(0x50uLL);
  *((void *)v5 + 1) = 0;
  *((void *)v5 + 2) = 0;
  *(void *)uint64_t v5 = &unk_1EFE160A8;
  std::string::basic_string[abi:ne180100]<0>(__p, v2);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = v6;
  id v10 = v7;
  id v11 = v8;
  *((void *)v5 + 3) = &unk_1EFE15DC8;
  id v12 = (std::string *)(v5 + 32);
  if (SHIBYTE(v23) < 0)
  {
    std::string::__init_copy_ctor_external(v12, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
  }
  else
  {
    *(_OWORD *)&v12->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((void *)v5 + 6) = v23;
  }
  objc_initWeak((id *)v5 + 7, v9);
  objc_initWeak((id *)v5 + 8, v10);
  *((void *)v5 + 9) = v11;

  if (SHIBYTE(v23) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(std::__shared_weak_count **)(v13 + 16);
  *(void *)(v13 + 8) = v5 + 24;
  *(void *)(v13 + 16) = v5;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }

  v16 = CoreAnalytics::Client::get(v15);
  uint64_t v17 = *(void *)(a1 + 32);
  uint64_t v19 = *(void *)(v17 + 8);
  v18 = *(std::__shared_weak_count **)(v17 + 16);
  uint64_t v20 = v19;
  v21 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  CoreAnalytics::Client::registerConfigurationObserver((NSObject **)v16, (uint64_t)&v20);
  if (v21) {
    std::__shared_weak_count::__release_weak(v21);
  }
}

- (BOOL)stopObservingConfigurationType:(id)a3
{
  v6[5] = *MEMORY[0x1E4F143B8];
  CASPIEnter();
  id v4 = [(AnalyticsConfigurationObserver *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__AnalyticsConfigurationObserver_stopObservingConfigurationType___block_invoke;
  v6[3] = &unk_1E5D1EC08;
  v6[4] = self;
  dispatch_barrier_async(v4, v6);

  return 1;
}

void __65__AnalyticsConfigurationObserver_stopObservingConfigurationType___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(std::__shared_weak_count **)(v1 + 16);
  *(void *)(v1 + 8) = 0;
  *(void *)(v1 + 16) = 0;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (AnalyticsConfigurationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AnalyticsConfigurationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
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

@end