@interface _EARLmHandle
- (id).cxx_construct;
- (id)_initWithHandle:(shared_ptr<kaldi::quasar::LmHandle>)a3;
- (shared_ptr<kaldi::quasar::LmHandle>)handle;
@end

@implementation _EARLmHandle

- (id)_initWithHandle:(shared_ptr<kaldi::quasar::LmHandle>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)_EARLmHandle;
  v4 = [(_EARLmHandle *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(LmHandle **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_handle.__cntrl_;
    v5->_handle.__ptr_ = v7;
    v5->_handle.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (shared_ptr<kaldi::quasar::LmHandle>)handle
{
  cntrl = self->_handle.__cntrl_;
  *v2 = self->_handle.__ptr_;
  v2[1] = (LmHandle *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LmHandle *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_handle.__cntrl_;
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