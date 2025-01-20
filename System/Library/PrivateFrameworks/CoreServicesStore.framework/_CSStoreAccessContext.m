@interface _CSStoreAccessContext
- (id).cxx_construct;
- (id)description;
- (id)initForSharedReading;
@end

@implementation _CSStoreAccessContext

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_impl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = (void *)(*(uint64_t (**)(CSStoreAccessContextInterface *))(*(void *)self->_impl.__ptr_ + 32))(self->_impl.__ptr_);
  v5 = (void *)[v3 initWithFormat:@"<_CSStoreAccessContext: %@>", v4];

  return v5;
}

- (id)initForSharedReading
{
  v6.receiver = self;
  v6.super_class = (Class)_CSStoreAccessContext;
  v2 = [(_CSStoreAccessContext *)&v6 init];
  if (v2)
  {
    id v3 = (char *)operator new(0x50uLL);
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    *(void *)id v3 = &unk_1EFE40A10;
    *((void *)v3 + 3) = &unk_1EFE40918;
    *((_DWORD *)v3 + 8) = 0;
    *(_OWORD *)(v3 + 40) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *((_DWORD *)v3 + 18) = 1065353216;
    cntrl = (std::__shared_weak_count *)v2->_impl.__cntrl_;
    v2->_impl.__ptr_ = (CSStoreAccessContextInterface *)(v3 + 24);
    v2->_impl.__cntrl_ = (__shared_weak_count *)v3;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
  }
  return v2;
}

@end