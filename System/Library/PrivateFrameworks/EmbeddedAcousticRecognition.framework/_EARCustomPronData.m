@interface _EARCustomPronData
- (BOOL)isValid;
- (_EARCustomPronData)initWithCustomPronData:(shared_ptr<quasar::CustomPronData>)a3;
- (id).cxx_construct;
- (id)getProns;
- (id)getRejectedProns;
- (id)validationError;
- (shared_ptr<quasar::CustomPronData>)data;
- (void)setData:(shared_ptr<quasar::CustomPronData>)a3;
@end

@implementation _EARCustomPronData

- (_EARCustomPronData)initWithCustomPronData:(shared_ptr<quasar::CustomPronData>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)_EARCustomPronData;
  v4 = [(_EARCustomPronData *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(CustomPronData **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_data.__cntrl_;
    v5->_data.__ptr_ = v7;
    v5->_data.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (BOOL)isValid
{
  return *(unsigned char *)self->_data.__ptr_;
}

- (id)validationError
{
  ptr = self->_data.__ptr_;
  v3 = (void *)((char *)ptr + 8);
  if (*((char *)ptr + 31) < 0) {
    v3 = (void *)*v3;
  }
  return (id)[NSString stringWithUTF8String:v3];
}

- (id)getProns
{
  return EARHelpers::VectorToArray<quasar::AppLmData::Oov,_EAROovToken * (*)(quasar::AppLmData::Oov const&)>((long long **)self->_data.__ptr_ + 4, (void (*)(std::string *))_earOovTokenFromAppLmDataOov);
}

- (id)getRejectedProns
{
  return EARHelpers::VectorToArray<quasar::AppLmData::Oov,_EAROovToken * (*)(quasar::AppLmData::Oov const&)>((long long **)self->_data.__ptr_ + 7, (void (*)(std::string *))_earOovTokenFromAppLmDataOov);
}

- (shared_ptr<quasar::CustomPronData>)data
{
  cntrl = self->_data.__cntrl_;
  *v2 = self->_data.__ptr_;
  v2[1] = (CustomPronData *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (CustomPronData *)self;
  return result;
}

- (void)setData:(shared_ptr<quasar::CustomPronData>)a3
{
  v4 = *(CustomPronData **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_data.__cntrl_;
  self->_data.__ptr_ = v4;
  self->_data.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void).cxx_destruct
{
  cntrl = self->_data.__cntrl_;
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