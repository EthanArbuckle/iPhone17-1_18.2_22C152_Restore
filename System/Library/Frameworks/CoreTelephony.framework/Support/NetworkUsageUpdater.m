@interface NetworkUsageUpdater
- (NetworkUsageUpdater)initWithHandler:(shared_ptr<NetworkUsageUpdaterCollector::UsageHandler>)a3;
- (id).cxx_construct;
- (void)statsManager:(id)a3 didReceiveNWSnapshot:(id)a4;
- (void)statsManager:(id)a3 thresholdReachedOn:(unsigned int)a4;
@end

@implementation NetworkUsageUpdater

- (NetworkUsageUpdater)initWithHandler:(shared_ptr<NetworkUsageUpdaterCollector::UsageHandler>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)NetworkUsageUpdater;
  v4 = [(NetworkUsageUpdater *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(UsageHandler **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->fHandler.__cntrl_;
    v5->fHandler.__ptr_ = v7;
    v5->fHandler.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      sub_10004D2C8(cntrl);
    }
  }
  return v5;
}

- (void)statsManager:(id)a3 didReceiveNWSnapshot:(id)a4
{
  id v11 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    ptr = self->fHandler.__ptr_;
    id v6 = v11;
    v7 = (std::__shared_weak_count *)*((void *)ptr + 1);
    if (v7)
    {
      v8 = std::__shared_weak_count::lock(v7);
      if (v8)
      {
        uint64_t v9 = *(void *)ptr;
        if (*(void *)ptr)
        {
          atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
          id v10 = v6;
          v12[0] = 0;
          v12[1] = 0;
          sub_10003E168(v12, (void *)(v9 + 8));
          operator new();
        }
        sub_10004D2C8(v8);
      }
    }
  }
}

- (void)statsManager:(id)a3 thresholdReachedOn:(unsigned int)a4
{
  ptr = self->fHandler.__ptr_;
  v5 = (std::__shared_weak_count *)*((void *)ptr + 1);
  if (v5)
  {
    id v6 = std::__shared_weak_count::lock(v5);
    if (v6)
    {
      uint64_t v7 = *(void *)ptr;
      if (*(void *)ptr)
      {
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        v8[0] = 0;
        v8[1] = 0;
        sub_10003E168(v8, (void *)(v7 + 8));
        operator new();
      }
      sub_10004D2C8(v6);
    }
  }
}

- (void).cxx_destruct
{
  cntrl = self->fHandler.__cntrl_;
  if (cntrl) {
    sub_10004D2C8((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end