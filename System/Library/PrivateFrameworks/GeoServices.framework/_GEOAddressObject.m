@interface _GEOAddressObject
- (_GEOAddressObject)init;
- (id).cxx_construct;
@end

@implementation _GEOAddressObject

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_addrObjPtr.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (_GEOAddressObject)init
{
  v7.receiver = self;
  v7.super_class = (Class)_GEOAddressObject;
  v2 = [(_GEOAddressObject *)&v7 init];
  v3 = v2;
  if (v2)
  {
    cntrl = (std::__shared_weak_count *)v2->_addrObjPtr.__cntrl_;
    v3->_addrObjPtr.__ptr_ = 0;
    v3->_addrObjPtr.__cntrl_ = 0;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    v5 = v3;
  }

  return v3;
}

@end