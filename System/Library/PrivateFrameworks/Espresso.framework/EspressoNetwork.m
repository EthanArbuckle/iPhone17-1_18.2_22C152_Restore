@interface EspressoNetwork
- (EspressoContext)ctx;
- (EspressoNetwork)initWithJSFile:(const char *)a3 binSerializerId:(const char *)a4 context:(id)a5 computePath:(int)a6;
- (EspressoNetwork)initWithJSFile:(const char *)a3 context:(id)a4 computePath:(int)a5;
- (id).cxx_construct;
- (shared_ptr<Espresso::net>)net;
- (unint64_t)layers_size;
- (void)wipe_layers_blobs;
@end

@implementation EspressoNetwork

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_net.__cntrl_;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<Espresso::net>)net
{
  objc_copyCppObjectAtomic(v2, &self->_net, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__3455);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)wipe_layers_blobs
{
}

- (unint64_t)layers_size
{
  return (uint64_t)(*((void *)self->_net.__ptr_ + 5) - *((void *)self->_net.__ptr_ + 4)) >> 4;
}

- (EspressoNetwork)initWithJSFile:(const char *)a3 binSerializerId:(const char *)a4 context:(id)a5 computePath:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a5;
  std::string::basic_string[abi:ne180100]<0>(v17, (char *)a3);
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a4);
  if (v10)
  {
    [v10 ctx];
  }
  else
  {
    uint64_t v13 = 0;
    v14 = 0;
  }
  Espresso::load_network_binserializer((uint64_t)v17, (const void **)__p, &v13, v6, 1, (uint64_t *)&v19);
  cntrl = self->_net.__cntrl_;
  self->_net = v19;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  if (v14) {
    nitro::nitro_function::nitro_function(v14);
  }
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  if (v18 < 0) {
    operator delete(v17[0]);
  }

  return self;
}

- (EspressoNetwork)initWithJSFile:(const char *)a3 context:(id)a4 computePath:(int)a5
{
  id v8 = a4;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)a3);
  if (v8)
  {
    [v8 ctx];
  }
  else
  {
    uint64_t v11 = 0;
    v12 = 0;
  }
  Espresso::load_network((uint64_t)__p, &v11, a5, 0, (uint64_t *)&v15);
  cntrl = self->_net.__cntrl_;
  self->_net = v15;
  if (cntrl) {
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)cntrl);
  }
  if (v12) {
    nitro::nitro_function::nitro_function(v12);
  }
  if (v14 < 0) {
    operator delete(__p[0]);
  }

  return self;
}

- (EspressoContext)ctx
{
  v3 = [EspressoContext alloc];
  ptr = self->_net.__ptr_;
  uint64_t v6 = *((void *)ptr + 2);
  v5 = (std::__shared_weak_count *)*((void *)ptr + 3);
  uint64_t v9 = v6;
  id v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v7 = [(EspressoContext *)v3 initWithContext:&v9];
  if (v10) {
    nitro::nitro_function::nitro_function(v10);
  }

  return v7;
}

@end