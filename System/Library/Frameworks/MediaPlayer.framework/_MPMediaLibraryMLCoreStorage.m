@interface _MPMediaLibraryMLCoreStorage
- (id).cxx_construct;
- (shared_ptr<mlcore::DeviceLibrary>)_MediaLibrary_coreLibrary;
- (void)set_MediaLibrary_coreLibrary:(shared_ptr<mlcore::DeviceLibrary>)a3;
@end

@implementation _MPMediaLibraryMLCoreStorage

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (shared_ptr<mlcore::DeviceLibrary>)_MediaLibrary_coreLibrary
{
  cntrl = self->__MediaLibrary_coreLibrary.__cntrl_;
  *v2 = self->__MediaLibrary_coreLibrary.__ptr_;
  v2[1] = (DeviceLibrary *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DeviceLibrary *)self;
  return result;
}

- (void)set_MediaLibrary_coreLibrary:(shared_ptr<mlcore::DeviceLibrary>)a3
{
  v4 = *(DeviceLibrary **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->__MediaLibrary_coreLibrary.__cntrl_;
  self->__MediaLibrary_coreLibrary.__ptr_ = v4;
  self->__MediaLibrary_coreLibrary.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->__MediaLibrary_coreLibrary.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

@end