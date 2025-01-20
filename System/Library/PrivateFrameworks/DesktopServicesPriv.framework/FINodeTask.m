@interface FINodeTask
- (id).cxx_construct;
- (id)init:(const void *)a3;
@end

@implementation FINodeTask

- (id)init:(const void *)a3
{
  v4 = [(FINodeTask *)self init];
  v5 = v4;
  v7 = *(TNodeTask **)a3;
  uint64_t v6 = *((void *)a3 + 1);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v4->_nodeTask.__cntrl_;
  v5->_nodeTask.__ptr_ = v7;
  v5->_nodeTask.__cntrl_ = (__shared_weak_count *)v6;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  return v5;
}

- (void).cxx_destruct
{
  cntrl = self->_nodeTask.__cntrl_;
  if (cntrl) {
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