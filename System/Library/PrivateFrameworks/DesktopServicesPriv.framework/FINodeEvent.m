@interface FINodeEvent
- (id).cxx_construct;
- (id)init:(const void *)a3;
@end

@implementation FINodeEvent

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 2) = 0;
  *((_DWORD *)self + 6) = 0;
  *((_DWORD *)self + 12) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (id)init:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FINodeEvent;
  v4 = [(FINodeEvent *)&v9 init];
  v4->_event.fEventKind = *(_DWORD *)a3;
  objc_storeStrong((id *)&v4->_event.fFINode, *((id *)a3 + 1));
  v4->_event.fProperty = *((_DWORD *)a3 + 4);
  TPropertyValue::operator=(&v4->_event.fPropertyValue, (TPropertyValue *)a3 + 1);
  v6 = (TNodeTask *)*((void *)a3 + 6);
  uint64_t v5 = *((void *)a3 + 7);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v4->_event.fTask.__cntrl_;
  v4->_event.fTask.__ptr_ = v6;
  v4->_event.fTask.__cntrl_ = (__shared_weak_count *)v5;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  TRef<TDSNotifier *,TRetainReleasePolicy<TDSNotifier *>>::operator=(&v4->_event.fNotifier.fRef, *((TDSNotifier **)a3 + 8));
  return v4;
}

@end