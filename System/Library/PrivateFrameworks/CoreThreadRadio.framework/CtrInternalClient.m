@interface CtrInternalClient
- (Result)form:(Result *__return_ptr)retstr;
- (Result)generatePSKc:(Result *__return_ptr)retstr output:;
- (Result)getNCPStatus:(Result *__return_ptr)retstr;
- (Result)getProperty:(Result *__return_ptr)retstr output:;
- (Result)get_device_data_diag:(Result *__return_ptr)retstr;
- (Result)join:(Result *__return_ptr)retstr;
- (Result)joiner:(Result *__return_ptr)retstr;
- (Result)leave;
- (Result)reset:(Result *__return_ptr)retstr;
- (Result)resume;
- (Result)scan:(Result *__return_ptr)retstr;
- (Result)sendData:(Result *__return_ptr)retstr data:data_length:;
- (Result)send_diagnostics_req:(Result *__return_ptr)retstr;
- (Result)send_ping_node:(Result *__return_ptr)retstr;
- (Result)setProperty:(Result *__return_ptr)retstr property_val:;
- (Result)stop;
- (Result)updatePrimaryResident:(Result *__return_ptr)retstr;
- (Result)wedStart:(Result *__return_ptr)retstr;
- (Result)wedStop;
- (id).cxx_construct;
- (id)init:(const char *)a3;
- (shared_ptr<InternalClient>)createClient:(const char *)a3;
- (void)setEventHandler:()basic_string<char InternalClientEventBlock:()std:(std::allocator<char>> *)a3 :char_traits<char> dqueue:;
- (void)signal_property_changed:()basic_string<char value:()std:(std::allocator<char>> *)a3 :char_traits<char>;
@end

@implementation CtrInternalClient

- (id)init:(const char *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CtrInternalClient;
  v4 = [(CtrInternalClient *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(CtrInternalClient *)v4 createClient:a3];
    cntrl = (std::__shared_weak_count *)v5->ctrInternalClientPtr.__cntrl_;
    v5->ctrInternalClientPtr = v8;
    if (cntrl)
    {
      if (!atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
  }
  return v5;
}

- (shared_ptr<InternalClient>)createClient:(const char *)a3
{
}

- (void)setEventHandler:()basic_string<char InternalClientEventBlock:()std:(std::allocator<char>> *)a3 :char_traits<char> dqueue:
{
  v5 = v4;
  id v8 = v3;
  ptr = self->ctrInternalClientPtr.__ptr_;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&var0, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else {
    std::string var0 = (std::string)a3->var0.var0;
  }
  v11 = *v5;
  InternalClient::setEventHandler((uint64_t)ptr, (uint64_t)&var0, v8, &v11);
  v10 = v11;
  v11 = 0;

  if (SHIBYTE(var0.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(var0.__r_.__value_.__l.__data_);
  }
}

- (Result)getProperty:(Result *__return_ptr)retstr output:
{
  uint64_t v4 = v3;
  v6 = *(uint64_t **)(v1 + 8);
  if (*(char *)(v2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *(void *)(v2 + 8));
  }
  else {
    std::string __p = *(std::string *)v2;
  }
  InternalClient::get(v6, (uint64_t)&__p, v4, (uint64_t)retstr);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return result;
}

- (Result)setProperty:(Result *__return_ptr)retstr property_val:
{
  uint64_t v3 = *(void *)(v1 + 8);
  if (*(char *)(v2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *(void *)(v2 + 8));
  }
  else {
    std::string __p = *(std::string *)v2;
  }
  InternalClient::set(v3, (uint64_t)&__p);
}

- (Result)scan:(Result *__return_ptr)retstr
{
  uint64_t v3 = *(void *)(v1 + 8);
  long long v5 = *v2;
  uint64_t v6 = *((void *)v2 + 2);
  InternalClient::scan(v3, (uint64_t)&v5);
}

- (Result)updatePrimaryResident:(Result *__return_ptr)retstr
{
  uint64_t v3 = v2;
  long long v5 = *(uint64_t **)(v1 + 8);
  long long v7 = *(_OWORD *)v2;
  id v8 = *(id *)(v2 + 16);
  InternalClient::updatePrimaryResident(v5, &v7, (uint64_t)retstr);

  return result;
}

- (Result)wedStart:(Result *__return_ptr)retstr
{
  InternalClient::wedStart(*(uint64_t **)(v1 + 8), v2, (uint64_t)retstr);
  return result;
}

- (Result)wedStop
{
  InternalClient::wedStop(*(InternalClient **)(v1 + 8), (uint64_t)retstr);
  return result;
}

- (Result)form:(Result *__return_ptr)retstr
{
  long long v2 = *(_OWORD *)(v1 + 80);
  v6[4] = *(_OWORD *)(v1 + 64);
  v6[5] = v2;
  uint64_t v7 = *(void *)(v1 + 96);
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  long long v4 = *(_OWORD *)(v1 + 48);
  v6[2] = *(_OWORD *)(v1 + 32);
  v6[3] = v4;
  InternalClient::form((uint64_t)v6, (uint64_t)retstr);
  return result;
}

- (Result)leave
{
  InternalClient::leave(*(InternalClient **)(v1 + 8), 1, (uint64_t)retstr);
  return result;
}

- (Result)stop
{
  InternalClient::leave(*(InternalClient **)(v1 + 8), 0, (uint64_t)retstr);
  return result;
}

- (Result)join:(Result *__return_ptr)retstr
{
  long long v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  v4[2] = *(_OWORD *)(v1 + 32);
  uint64_t v5 = *(void *)(v1 + 48);
  InternalClient::join(v4, (uint64_t)retstr);
  return result;
}

- (Result)joiner:(Result *__return_ptr)retstr
{
  InternalClient::joiner((uint64_t)retstr);
  return result;
}

- (Result)resume
{
  InternalClient::resume(*(InternalClient **)(v1 + 8), (uint64_t)retstr);
  return result;
}

- (Result)reset:(Result *__return_ptr)retstr
{
  InternalClient::reset(*(InternalClient **)(v1 + 8), v2, (uint64_t)retstr);
  return result;
}

- (Result)send_diagnostics_req:(Result *__return_ptr)retstr
{
}

- (Result)send_ping_node:(Result *__return_ptr)retstr
{
  uint64_t v3 = v2;
  uint64_t v5 = *(uint64_t **)(v1 + 8);
  if (*(char *)(v2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *(void *)(v2 + 8));
  }
  else {
    std::string __p = *(std::string *)v2;
  }
  __int16 v8 = *(_WORD *)(v3 + 24);
  InternalClient::send_ping_node_req(v5, (uint64_t)&__p, (uint64_t)retstr);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return result;
}

- (Result)get_device_data_diag:(Result *__return_ptr)retstr
{
  uint64_t v3 = v2;
  uint64_t v5 = *(uint64_t **)(v1 + 8);
  if (*(char *)(v2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v2, *(void *)(v2 + 8));
  }
  else {
    std::string __p = *(std::string *)v2;
  }
  long long v8 = *(_OWORD *)(v3 + 24);
  __int16 v9 = *(_WORD *)(v3 + 40);
  InternalClient::get_device_data_diag_req(v5, (uint64_t)&__p, (uint64_t)retstr);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return result;
}

- (Result)sendData:(Result *__return_ptr)retstr data:data_length:
{
  InternalClient::sendData(*(InternalClient **)(v1 + 8), (uint64_t)retstr);
  return result;
}

- (Result)generatePSKc:(Result *__return_ptr)retstr output:
{
  uint64_t v3 = v2;
  long long v4 = v1;
  uint64_t v6 = (void *)v1[1];
  v8[0] = *v1;
  v8[1] = v6;
  long long v9 = *((_OWORD *)v4 + 1);
  InternalClient::generatePSKc(v8, v3, (uint64_t)retstr);

  return result;
}

- (Result)getNCPStatus:(Result *__return_ptr)retstr
{
  InternalClient::getNCPStatus(*(InternalClient **)(v1 + 8), v2);
}

- (void)signal_property_changed:()basic_string<char value:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  uint64_t v4 = v3;
  ptr = self->ctrInternalClientPtr.__ptr_;
  if (*((char *)&a3->var0.var0.var0.var1 + 23) < 0) {
    std::string::__init_copy_ctor_external((std::string *)&__p, a3->var0.var0.var0.var1.var0, a3->var0.var0.var0.var1.var1);
  }
  else {
    __rep __p = a3->var0.var0;
  }
  InternalClient::signal_property_changed((uint64_t)ptr, (uint64_t)&__p, v4);
  if (*((char *)&__p.var0.var1 + 23) < 0) {
    operator delete(__p.var0.var1.var0);
  }
}

- (void).cxx_destruct
{
  cntrl = self->ctrInternalClientPtr.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end