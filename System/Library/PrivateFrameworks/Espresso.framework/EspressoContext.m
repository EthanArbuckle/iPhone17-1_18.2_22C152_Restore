@interface EspressoContext
- (EspressoContext)initWithContext:(shared_ptr<Espresso::abstract_context>)a3;
- (EspressoContext)initWithDevice:(id)a3 andWisdomParams:(id)a4;
- (EspressoContext)initWithNetworkContext:(id)a3;
- (EspressoContext)initWithPlatform:(int)a3;
- (id).cxx_construct;
- (int)platform;
- (shared_ptr<Espresso::abstract_context>)ctx;
- (void)set_priority:(BOOL)a3 low_priority_max_ms_per_command_buffer:(float)a4 gpu_priority:(unsigned int)a5;
@end

@implementation EspressoContext

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_ctx.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<Espresso::abstract_context>)ctx
{
  objc_copyCppObjectAtomic(v2, &self->_ctx, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__45);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)set_priority:(BOOL)a3 low_priority_max_ms_per_command_buffer:(float)a4 gpu_priority:(unsigned int)a5
{
}

- (int)platform
{
  return (***((uint64_t (****)(void))self->_ctx.__ptr_ + 1))(*((void *)self->_ctx.__ptr_ + 1));
}

- (EspressoContext)initWithNetworkContext:(id)a3
{
  v4 = a3;
  uint64_t v5 = v4[1];
  v7 = *(abstract_context **)(v5 + 16);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_ctx.__cntrl_;
  self->_ctx.__ptr_ = v7;
  self->_ctx.__cntrl_ = (__shared_weak_count *)v6;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }

  return self;
}

- (EspressoContext)initWithDevice:(id)a3 andWisdomParams:(id)a4
{
  Espresso::create_metal_context((uint64_t)&v7, a3, a4);
  cntrl = self->_ctx.__cntrl_;
  self->_ctx = v7;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  return self;
}

- (EspressoContext)initWithPlatform:(int)a3
{
  int v7 = a3;
  Espresso::create_context(&v7, &v8);
  shared_ptr<Espresso::abstract_context> v4 = v8;
  shared_ptr<Espresso::abstract_context> v8 = (shared_ptr<Espresso::abstract_context>)0;
  cntrl = self->_ctx.__cntrl_;
  self->_ctx = v4;
  if (cntrl)
  {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
    if (v8.__cntrl_) {
      nitro::nitro_function::nitro_function((std::__shared_weak_count *)v8.__cntrl_);
    }
  }
  return self;
}

- (EspressoContext)initWithContext:(shared_ptr<Espresso::abstract_context>)a3
{
  uint64_t v5 = *(abstract_context **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_ctx.__cntrl_;
  self->_ctx.__ptr_ = v5;
  self->_ctx.__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  return self;
}

@end