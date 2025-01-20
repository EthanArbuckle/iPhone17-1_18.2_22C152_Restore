void abb::link::XpcClientLink::create(xpc_object_t *a1@<X0>, void *a2@<X8>)
{
  void *v4;
  xpc_endpoint_t v5;
  xpc_endpoint_t v6;

  if (MEMORY[0x24C56ED30](*a1) == MEMORY[0x263EF8718])
  {
    v4 = operator new(0x70uLL);
    v6 = (xpc_endpoint_t)*a1;
    v5 = v6;
    *a1 = xpc_null_create();
    abb::link::XpcClientLink::XpcClientLink((uint64_t)v4, &v6);
    std::shared_ptr<abb::link::XpcClientLink>::shared_ptr[abi:ne180100]<abb::link::XpcClientLink,void>(a2, (uint64_t)v4);
    xpc_release(v5);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
}

void sub_247E8CB7C(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void *abb::link::XpcClientLink::create@<X0>(long long *a1@<X0>, void *a2@<X8>)
{
  v4 = operator new(0x70uLL);
  abb::link::XpcClientLink::XpcClientLink((uint64_t)v4, a1);
  return std::shared_ptr<abb::link::XpcClientLink>::shared_ptr[abi:ne180100]<abb::link::XpcClientLink,void>(a2, (uint64_t)v4);
}

void sub_247E8CBF4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t abb::link::XpcClientLink::XpcClientLink(uint64_t a1, xpc_endpoint_t *a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26FC1EF68;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 24) = xpc_null_create();
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(void *)(a1 + 96) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a1 + 96) = xpc_null_create();
  if (MEMORY[0x24C56ED30](*a2) == MEMORY[0x263EF8718])
  {
    v4 = xpc_connection_create_from_endpoint(*a2);
    if (!v4) {
      v4 = xpc_null_create();
    }
    xpc_object_t v5 = xpc_null_create();
    v6 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v4;
    xpc_release(v6);
    xpc_release(v5);
  }
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

uint64_t abb::link::XpcClientLink::XpcClientLink(uint64_t a1, long long *a2)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26FC1EF68;
  *(void *)(a1 + 24) = 0;
  xpc_object_t v4 = xpc_null_create();
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 24) = v4;
  xpc_object_t v5 = (_OWORD *)(a1 + 64);
  *(_OWORD *)(a1 + 48) = 0u;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 64), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v6 = *a2;
    *(void *)(a1 + 80) = *((void *)a2 + 2);
    *xpc_object_t v5 = v6;
  }
  *(void *)(a1 + 88) = 0;
  v7 = (const char *)(a1 + 64);
  if (*(char *)(a1 + 87) < 0) {
    v7 = *(const char **)v5;
  }
  xpc_connection_t mach_service = xpc_connection_create_mach_service(v7, 0, 2uLL);
  *(void *)(a1 + 96) = mach_service;
  if (!mach_service) {
    *(void *)(a1 + 96) = xpc_null_create();
  }
  *(unsigned char *)(a1 + 104) = 0;
  return a1;
}

void sub_247E8CDCC(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 63) < 0)
  {
    operator delete(*(void **)(v1 + 40));
    uint64_t v5 = *v3;
    uint64_t *v3 = 0;
    if (!v5)
    {
LABEL_3:
      MEMORY[0x24C56EA60](v2);
      long long v6 = *(std::__shared_weak_count **)(v1 + 16);
      if (!v6) {
        goto LABEL_4;
      }
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v5 = *v3;
    uint64_t *v3 = 0;
    if (!v5) {
      goto LABEL_3;
    }
  }
  (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
  MEMORY[0x24C56EA60](v2);
  long long v6 = *(std::__shared_weak_count **)(v1 + 16);
  if (!v6) {
LABEL_4:
  }
    _Unwind_Resume(a1);
LABEL_7:
  std::__shared_weak_count::__release_weak(v6);
  _Unwind_Resume(a1);
}

void abb::link::XpcClientLink::~XpcClientLink(abb::link::XpcClientLink *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  }
  *((unsigned char *)this + 104) = 0;
  ctu::XpcClientHelper::setServer();
  xpc_release(*((xpc_object_t *)this + 12));
  *((void *)this + 12) = 0;
  v3 = *((void *)this + 11);
  if (v3) {
    dispatch_release(v3);
  }
  if (*((char *)this + 87) < 0)
  {
    operator delete(*((void **)this + 8));
    if ((*((char *)this + 63) & 0x80000000) == 0)
    {
LABEL_7:
      uint64_t v4 = *((void *)this + 4);
      *((void *)this + 4) = 0;
      if (!v4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((char *)this + 63) & 0x80000000) == 0)
  {
    goto LABEL_7;
  }
  operator delete(*((void **)this + 5));
  uint64_t v4 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v4) {
LABEL_8:
  }
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
LABEL_9:
  MEMORY[0x24C56EA60]((char *)this + 24);
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

{
  void *v1;
  uint64_t vars8;

  abb::link::XpcClientLink::~XpcClientLink(this);
  operator delete(v1);
}

uint64_t abb::link::XpcClientLink::disconnect(abb::link::XpcClientLink *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 48))(v2);
  }
  *((unsigned char *)this + 104) = 0;
  return ctu::XpcClientHelper::setServer();
}

void __clang_call_terminate(void *a1)
{
}

BOOL abb::link::XpcClientLink::isConnected(abb::link::XpcClientLink *this)
{
  return *((unsigned char *)this + 104) && MEMORY[0x24C56ED30](*((void *)this + 3)) == MEMORY[0x263EF86F0];
}

void abb::link::XpcClientLink::flush(abb::link::XpcClientLink *this, const group *a2)
{
  gr_name = a2->gr_name;
  if (a2->gr_name)
  {
    dispatch_retain((dispatch_object_t)a2->gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  xpc_object_t v5 = xpc_null_create();
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcClientLink5flushERKN8dispatch5groupE_block_invoke;
  handler[3] = &__block_descriptor_tmp_0;
  dispatch_group_t group = (dispatch_group_t)gr_name;
  if (gr_name)
  {
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter(group);
  }
  uint64_t v8 = *((void *)this + 3);
  v7 = (xpc_connection_t *)((char *)this + 24);
  if (v8 && MEMORY[0x24C56ED30]() == MEMORY[0x263EF86F0]) {
    xpc_connection_send_message_with_reply(*v7, v5, global_queue, handler);
  }
  xpc_release(v5);
  ctu::XpcClientHelper::flush((ctu::XpcClientHelper *)v7, a2);
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
}

void sub_247E8D1B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  xpc_release(v15);
  if (v14)
  {
    dispatch_group_leave(v14);
    dispatch_release(v14);
  }
  _Unwind_Resume(a1);
}

uint64_t abb::link::XpcClientLink::send(uint64_t a1, xpc_object_t *a2, NSObject *a3, void *a4)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    if (MEMORY[0x24C56ED30]() == MEMORY[0x263EF86F0])
    {
      xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 24), *a2, a3, a4);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void __copy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  v3 = *(NSObject **)(a2 + 32);
  *(void *)(a1 + 32) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    uint64_t v4 = *(NSObject **)(a1 + 32);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void __destroy_helper_block_e8_32c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

uint64_t abb::link::XpcClientLink::sendMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    if (MEMORY[0x24C56ED30]() == MEMORY[0x263EF86F0])
    {
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), *a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t abb::link::XpcClientLink::send(uint64_t a1, xpc_object_t *a2)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    if (MEMORY[0x24C56ED30]() == MEMORY[0x263EF86F0])
    {
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), *a2);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t abb::link::XpcClientLink::send(uint64_t a1, xpc_object_t *a2, uint64_t *a3, NSObject **a4, void *a5)
{
  v10 = operator new(0x20uLL);
  v11 = v10;
  v12 = a5 + 3;
  v13 = (void *)a5[3];
  if (!v13)
  {
    v12 = v10 + 3;
    goto LABEL_5;
  }
  if (v13 != a5)
  {
    v10[3] = v13;
LABEL_5:
    void *v12 = 0;
    goto LABEL_7;
  }
  v10[3] = v10;
  (*(void (**)(void *, void *))(*a5 + 24))(a5, v10);
LABEL_7:
  v14 = *a4;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_1;
  uint64_t v16 = *a3;
  v15 = (std::__shared_weak_count *)a3[1];
  void handler[4] = v11;
  handler[5] = v16;
  v21 = v15;
  if (v15) {
    atomic_fetch_add_explicit(&v15->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if (*(void *)(a1 + 24) && MEMORY[0x24C56ED30]() == MEMORY[0x263EF86F0])
  {
    xpc_connection_send_message_with_reply(*(xpc_connection_t *)(a1 + 24), *a2, v14, handler);
    uint64_t v17 = 1;
    v18 = v21;
    if (!v21) {
      return v17;
    }
    goto LABEL_12;
  }
  uint64_t v17 = 0;
  v18 = v21;
  if (v21) {
LABEL_12:
  }
    std::__shared_weak_count::__release_weak(v18);
  return v17;
}

void sub_247E8D56C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16)
{
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK3abb4link13XpcClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEE_block_invoke(uint64_t a1, void *a2)
{
  __p = *(void **)(a1 + 32);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3) {
    goto LABEL_9;
  }
  xpc_object_t v5 = std::__shared_weak_count::lock(v3);
  v13 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  long long v6 = v5;
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    xpc_object_t object = a2;
    if (a2)
    {
      xpc_retain(a2);
      uint64_t v8 = *(void *)(v7 + 24);
      if (v8)
      {
LABEL_6:
        (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v8 + 48))(v8, &object);
        xpc_release(object);
        xpc_object_t object = 0;
        goto LABEL_7;
      }
    }
    else
    {
      xpc_object_t object = xpc_null_create();
      uint64_t v8 = *(void *)(v7 + 24);
      if (v8) {
        goto LABEL_6;
      }
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
LABEL_7:
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_9:
  v9 = __p;
  if (__p)
  {
    v10 = (void *)*((void *)__p + 3);
    if (v10 == __p)
    {
      (*(void (**)(void *))(*(void *)__p + 32))(__p);
    }
    else if (v10)
    {
      (*(void (**)(void *))(*(void *)v10 + 40))(v10);
    }
    operator delete(v9);
  }
}

void sub_247E8D704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, void *a12)
{
}

uint64_t std::shared_ptr<void const>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    if (!atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void **std::unique_ptr<std::function<void ()(xpc::object)>>::~unique_ptr[abi:ne180100](void **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = (void *)v2[3];
    if (v3 == v2)
    {
      (*(void (**)(void *))(*v2 + 32))(v2);
    }
    else if (v3)
    {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    operator delete(v2);
  }
  return a1;
}

uint64_t __copy_helper_block_e8_40c25_ZTSNSt3__18weak_ptrIKvEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c25_ZTSNSt3__18weak_ptrIKvEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void abb::link::XpcClientLink::handleServerError(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *a2;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v2 + 40))(v2, &object);
  xpc_release(object);
}

void sub_247E8D8EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abb::link::XpcClientLink::handleMessage(uint64_t a1, xpc_object_t *a2)
{
  if (xpc_dictionary_get_value(*a2, "ConnectLink"))
  {
    *(unsigned char *)(a1 + 104) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
    xpc_object_t value = xpc_dictionary_get_value(*a2, "ConnectLink");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v4 + 16))(v4, &object);
    xpc_release(object);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    xpc_object_t v7 = *a2;
    xpc_object_t v8 = v7;
    if (v7) {
      xpc_retain(v7);
    }
    else {
      xpc_object_t v8 = xpc_null_create();
    }
    (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v6 + 24))(v6, &v8);
    xpc_release(v8);
  }
}

void sub_247E8DA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10)
{
}

void abb::link::XpcClientLink::connectInternal(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24C56ED30](v4) == MEMORY[0x263EF8708])
    {
      xpc_retain(v4);
      xpc_object_t v5 = v4;
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v4 = 0;
  }
  xpc_release(v4);
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v6 = (const char *)a2;
  }
  else {
    uint64_t v6 = *(const char **)a2;
  }
  xpc_object_t v7 = xpc_string_create(v6);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(v5, "Name", v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  if (*(void *)(a1 + 24) && MEMORY[0x24C56ED30]() == MEMORY[0x263EF86F0]) {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 24), v5);
  }
  xpc_release(v5);
}

void sub_247E8DB64(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void *abb::link::LocalClientLink::create@<X0>(void *a1@<X8>)
{
  v3 = operator new(0x68uLL);
  v3[2] = 0;
  v3[3] = 0;
  void *v3 = &unk_26FC1F010;
  v3[1] = &unk_26FC1F070;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((unsigned char *)v3 + 96) = 0;
  return std::shared_ptr<abb::link::LocalClientLink>::shared_ptr[abi:ne180100]<abb::link::LocalClientLink,void>(a1, (uint64_t)v3);
}

double abb::link::LocalClientLink::LocalClientLink(abb::link::LocalClientLink *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *(void *)this = &unk_26FC1F010;
  *((void *)this + 1) = &unk_26FC1F070;
  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((unsigned char *)this + 96) = 0;
  return result;
}

{
  double result;

  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *(void *)this = &unk_26FC1F010;
  *((void *)this + 1) = &unk_26FC1F070;
  double result = 0.0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((unsigned char *)this + 96) = 0;
  return result;
}

void abb::link::LocalClientLink::~LocalClientLink(void **this)
{
  abb::link::LocalClientLink::disconnect((abb::link::LocalClientLink *)this);
  uint64_t v2 = this[11];
  if (v2) {
    dispatch_release(v2);
  }
  if (*((char *)this + 87) < 0) {
    operator delete(this[8]);
  }
  v3 = this[7];
  this[7] = 0;
  if (v3) {
    (*(void (**)(void *))(*(void *)v3 + 8))(v3);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)this[6];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  xpc_object_t v5 = this[4];
  this[4] = 0;
  if (v5) {
    (*(void (**)(void *))(*(void *)v5 + 8))(v5);
  }
  uint64_t v6 = (std::__shared_weak_count *)this[3];
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

{
  void *v1;
  uint64_t vars8;

  abb::link::LocalClientLink::~LocalClientLink(this);
  operator delete(v1);
}

uint64_t abb::link::LocalClientLink::disconnect(abb::link::LocalClientLink *this)
{
  uint64_t result = *((void *)this + 7);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 48))(result);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3)
  {
    xpc_object_t object = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v3 + 32))(v3, &object);
    xpc_release(object);
    xpc_object_t object = 0;
    uint64_t result = *((void *)this + 4);
    *((unsigned char *)this + 96) = 0;
    *((void *)this + 4) = 0;
    if (result) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
    }
  }
  else
  {
    *((unsigned char *)this + 96) = 0;
    *((void *)this + 4) = 0;
  }
  return result;
}

void sub_247E8DE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void non-virtual thunk to'abb::link::LocalClientLink::~LocalClientLink(void **this)
{
}

{
  void *v1;
  uint64_t vars8;

  abb::link::LocalClientLink::~LocalClientLink(this - 1);
  operator delete(v1);
}

BOOL abb::link::LocalClientLink::isConnected(abb::link::LocalClientLink *this)
{
  return *((unsigned char *)this + 96) && *((void *)this + 4) && *((void *)this + 7) && *((void *)this + 11) != 0;
}

void abb::link::LocalClientLink::flush(abb::link::LocalClientLink *this, const group *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  gr_name = a2->gr_name;
  if (a2->gr_name)
  {
    dispatch_retain((dispatch_object_t)a2->gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  dispatch_object_t v17 = global_queue;
  if (global_queue) {
    dispatch_retain(global_queue);
  }
  xpc_object_t object = xpc_null_create();
  xpc_object_t v5 = (std::__shared_weak_count *)*((void *)this + 3);
  if (!v5 || (uint64_t v6 = std::__shared_weak_count::lock(v5)) == 0)
  {
    v14 = 0;
    v15 = 0;
    goto LABEL_12;
  }
  xpc_object_t v7 = v6;
  xpc_object_t v8 = (std::__shared_weak_count *)*((void *)this + 2);
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    v9 = std::__shared_weak_count::lock(v6);
    if (v9) {
      goto LABEL_9;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
    v9 = std::__shared_weak_count::lock(v7);
    if (v9)
    {
LABEL_9:
      v10 = (atomic_ullong *)v9;
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      v14 = v8;
      v15 = v9;
      std::__shared_weak_count::__release_weak(v7);
      if (!atomic_fetch_add(v10 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(atomic_ullong *))(*v10 + 16))(v10);
        v11 = (std::__shared_weak_count *)v10;
        goto LABEL_28;
      }
LABEL_12:
      if (!gr_name) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v14 = 0;
  v15 = 0;
  v11 = v7;
LABEL_28:
  std::__shared_weak_count::__release_weak(v11);
  if (gr_name)
  {
LABEL_13:
    dispatch_retain((dispatch_object_t)gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
LABEL_14:
  v18[0] = &unk_26FC1F320;
  v18[1] = gr_name;
  v19 = v18;
  abb::link::LocalClientLink::send((uint64_t)this, &object, &v14, &v17, v18);
  if (v19 == v18)
  {
    (*(void (**)(void *))(v18[0] + 32))(v18);
    v13 = v15;
    if (v15) {
LABEL_18:
    }
      std::__shared_weak_count::__release_weak(v13);
  }
  else
  {
    if (v19) {
      (*(void (**)(void *, uint64_t))(*v19 + 40))(v19, v12);
    }
    v13 = v15;
    if (v15) {
      goto LABEL_18;
    }
  }
  xpc_release(object);
  if (v17) {
    dispatch_release(v17);
  }
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
}

void sub_247E8E1BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, xpc_object_t object, dispatch_object_t a13, char a14)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t abb::link::LocalClientLink::send(uint64_t a1, void **a2, std::__shared_weak_count **a3, NSObject **a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      if (*(void *)(a1 + 56) && *(void *)(a1 + 88))
      {
        v9 = *a2;
        xpc_object_t v22 = v9;
        if (v9)
        {
          xpc_retain(v9);
          v10 = a3[1];
          v23[0] = *a3;
          v23[1] = v10;
          if (!v10) {
            goto LABEL_8;
          }
        }
        else
        {
          xpc_object_t v22 = xpc_null_create();
          v10 = a3[1];
          v23[0] = *a3;
          v23[1] = v10;
          if (!v10)
          {
LABEL_8:
            v11 = *a4;
            dispatch_object_t object = v11;
            if (v11) {
              dispatch_retain(v11);
            }
            uint64_t v12 = (void *)a5[3];
            if (v12)
            {
              if (v12 == a5)
              {
                v26 = v25;
                (*(void (**)(void *, void *))(*a5 + 24))(a5, v25);
              }
              else
              {
                v26 = (void *)a5[3];
                a5[3] = 0;
              }
            }
            else
            {
              v26 = 0;
            }
            v28 = 0;
            v18 = (char *)operator new(0x40uLL);
            *(void *)v18 = &unk_26FC1F3B0;
            *(_OWORD *)(v18 + 8) = *(_OWORD *)v23;
            v23[0] = 0;
            v23[1] = 0;
            v19 = object;
            *((void *)v18 + 3) = object;
            if (v19) {
              dispatch_retain(v19);
            }
            if (v26)
            {
              if (v26 == v25)
              {
                *((void *)v18 + 7) = v18 + 32;
                (*(void (**)(void *))(v25[0] + 24))(v25);
              }
              else
              {
                *((void *)v18 + 7) = v26;
                v26 = 0;
              }
            }
            else
            {
              *((void *)v18 + 7) = 0;
            }
            v28 = v18;
            (*(void (**)(uint64_t, xpc_object_t *, void *))(*(void *)v7 + 24))(v7, &v22, v27);
            if (v28 == v27)
            {
              (*(void (**)(void *))(v27[0] + 32))(v27);
              uint64_t v20 = v26;
              if (v26 != v25) {
                goto LABEL_43;
              }
            }
            else
            {
              if (v28) {
                (*(void (**)(void))(*v28 + 40))();
              }
              uint64_t v20 = v26;
              if (v26 != v25)
              {
LABEL_43:
                if (v20) {
                  (*(void (**)(void *))(*v20 + 40))(v20);
                }
                v21 = object;
                if (!object) {
                  goto LABEL_47;
                }
LABEL_46:
                dispatch_release(v21);
LABEL_47:
                if (v23[1]) {
                  std::__shared_weak_count::__release_weak(v23[1]);
                }
                xpc_release(v22);
                return 1;
              }
            }
            (*(void (**)(void *))(v25[0] + 32))(v25);
            v21 = object;
            if (!object) {
              goto LABEL_47;
            }
            goto LABEL_46;
          }
        }
        atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        goto LABEL_8;
      }
    }
  }
  v13 = (void *)a5[3];
  if (v13)
  {
    if (v13 == a5)
    {
      v30 = v29;
      (*(void (**)(void *, void *))(*a5 + 24))(a5, v29);
    }
    else
    {
      v30 = (void *)a5[3];
      a5[3] = 0;
    }
  }
  else
  {
    v30 = 0;
  }
  v14 = *a4;
  v15 = operator new(0x20uLL);
  uint64_t v16 = v15;
  if (v30)
  {
    if (v30 == v29)
    {
      *((void *)v15 + 3) = v15;
      (*(void (**)(void *, void *))(v29[0] + 24))(v29, v15);
    }
    else
    {
      *((void *)v15 + 3) = v30;
      v30 = 0;
    }
  }
  else
  {
    *((void *)v15 + 3) = 0;
  }
  dispatch_async_f(v14, v16, (dispatch_function_t)dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (v30 == v29)
  {
    (*(void (**)(void *))(v29[0] + 32))(v29);
  }
  else if (v30)
  {
    (*(void (**)(void))(*v30 + 40))();
  }
  return 0;
}

void sub_247E8E6A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void *std::function<void ()(xpc::object)>::~function(void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    return a1;
  }
  else
  {
    if (v2) {
      (*(void (**)(void *))(*v2 + 40))(v2);
    }
    return a1;
  }
}

dispatch_object_t *abb::link::LocalClientLink::flush(dispatch::group const&)const::$_0::~$_0(dispatch_object_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    dispatch_group_leave(v2);
    if (*a1) {
      dispatch_release(*a1);
    }
  }
  return a1;
}

uint64_t abb::link::LocalClientLink::send(uint64_t a1, void **a2)
{
  if (!*(unsigned char *)(a1 + 96)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2 || !*(void *)(a1 + 56) || !*(void *)(a1 + 88)) {
    return 0;
  }
  uint64_t v3 = *a2;
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v2 + 16))(v2, &object);
  xpc_release(object);
  return 1;
}

void sub_247E8E880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void *abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)const::$_1::~$_1(void *a1)
{
  uint64_t v2 = a1 + 3;
  uint64_t v3 = (void *)a1[6];
  if (v3 == v2)
  {
    (*(void (**)(void *))(*v2 + 32))(v2);
    xpc_object_t v4 = a1[2];
    if (v4) {
LABEL_5:
    }
      dispatch_release(v4);
  }
  else
  {
    if (v3) {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    xpc_object_t v4 = a1[2];
    if (v4) {
      goto LABEL_5;
    }
  }
  xpc_object_t v5 = (std::__shared_weak_count *)a1[1];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return a1;
}

void abb::link::LocalClientLink::connectInternal(void *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (!v3) {
    return;
  }
  xpc_object_t v5 = std::__shared_weak_count::lock(v3);
  uint64_t v16 = v5;
  if (!v5) {
    return;
  }
  uint64_t v6 = (void *)a1[5];
  v15 = v6;
  if (!v6)
  {
    uint64_t v12 = v5;
    if (atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_15:
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
    return;
  }
  uint64_t v7 = (std::__shared_weak_count *)a1[3];
  if (!v7 || (uint64_t v8 = a1[2], (v9 = std::__shared_weak_count::lock(v7)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v10 = v8 + 8;
  if (!v8) {
    uint64_t v10 = 0;
  }
  uint64_t v13 = v10;
  v14 = v9;
  abb::link::LocalLinkAccepter::handleNewClient(v6, a2, &v13);
  v11 = v14;
  if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  uint64_t v12 = v16;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_15;
  }
}

void sub_247E8EAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, char a13)
{
}

void sub_247E8EAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void abb::link::LocalClientLink::handleServerMessage(void *a1, xpc_object_t *a2)
{
  xpc_object_t v3 = *a2;
  *a2 = xpc_null_create();
  if (a1[11])
  {
    xpc_object_t v4 = (std::__shared_weak_count *)a1[3];
    if (!v4 || (uint64_t v5 = a1[2], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v7 = v6;
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    xpc_object_t v8 = xpc_null_create();
    v9 = a1[11];
    uint64_t v10 = operator new(0x20uLL);
    void *v10 = v5;
    v10[1] = v7;
    v10[2] = a1;
    v10[3] = v3;
    xpc_object_t v11 = xpc_null_create();
    dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke);
    xpc_release(v11);
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    xpc_object_t v8 = v3;
  }
  xpc_release(v8);
}

void non-virtual thunk to'abb::link::LocalClientLink::handleServerMessage(uint64_t a1, xpc_object_t *a2)
{
}

void abb::link::LocalClientLink::handleServerMessage(void *a1, void **a2, NSObject **a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v7 = *a2;
  v28[0] = a1;
  v28[1] = v7;
  *a2 = xpc_null_create();
  xpc_object_t v8 = *a3;
  dispatch_object_t v29 = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  v9 = (void *)a4[3];
  if (v9)
  {
    if (v9 == a4)
    {
      uint64_t v31 = v30;
      (*(void (**)(void *, void *))(*a4 + 24))(a4, v30);
    }
    else
    {
      uint64_t v31 = (void *)a4[3];
      a4[3] = 0;
    }
  }
  else
  {
    uint64_t v31 = 0;
  }
  if (!a1[11]) {
    goto LABEL_29;
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[3];
  if (!v10 || (v11 = a1[2], (uint64_t v12 = std::__shared_weak_count::lock(v10)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v13 = v12;
  *(void *)&long long v32 = v11;
  *((void *)&v32 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = v12;
  atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  *(_OWORD *)v33 = *(_OWORD *)v28;
  xpc_object_t v14 = xpc_null_create();
  dispatch_object_t object = v29;
  v28[1] = v14;
  dispatch_object_t v29 = 0;
  if (v31)
  {
    if (v31 == v30)
    {
      v36 = v35;
      (*(void (**)(void *, void *))(v30[0] + 24))(v30, v35);
    }
    else
    {
      v36 = v31;
      uint64_t v31 = 0;
    }
  }
  else
  {
    v36 = 0;
  }
  v15 = a1[11];
  uint64_t v16 = operator new(0x48uLL);
  long long v17 = v32;
  long long v18 = *(_OWORD *)v33;
  long long v32 = 0uLL;
  *uint64_t v16 = v17;
  v16[1] = v18;
  xpc_object_t v19 = xpc_null_create();
  uint64_t v20 = v36;
  *((void *)v16 + 4) = object;
  v33[1] = v19;
  dispatch_object_t object = 0;
  if (v20)
  {
    if (v20 == v35)
    {
      *((void *)v16 + 8) = (char *)v16 + 40;
      (*(void (**)(void *))(v35[0] + 24))(v35);
    }
    else
    {
      *((void *)v16 + 8) = v20;
      v36 = 0;
    }
  }
  else
  {
    *((void *)v16 + 8) = 0;
  }
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  dispatch_async_f(v15, v16, (dispatch_function_t)dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&v26);
  std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&v27);
  if (v36 == v35)
  {
    (*(void (**)(void *))(v35[0] + 32))(v35);
    xpc_object_t v22 = object;
    if (!object) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
  if (v36) {
    (*(void (**)(void *, uint64_t))(*v36 + 40))(v36, v21);
  }
  xpc_object_t v22 = object;
  if (object) {
LABEL_25:
  }
    dispatch_release(v22);
LABEL_26:
  xpc_release(v33[1]);
  v33[1] = 0;
  v23 = (std::__shared_weak_count *)*((void *)&v32 + 1);
  if (*((void *)&v32 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v32 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_38;
    }
LABEL_29:
    v24 = v31;
    if (v31 != v30) {
      goto LABEL_30;
    }
LABEL_39:
    (*(void (**)(void *))(v30[0] + 32))(v30);
    v25 = v29;
    if (!v29) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  if (atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_29;
  }
LABEL_38:
  ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
  std::__shared_weak_count::__release_weak(v13);
  v24 = v31;
  if (v31 == v30) {
    goto LABEL_39;
  }
LABEL_30:
  if (v24) {
    (*(void (**)(void *))(*v24 + 40))(v24);
  }
  v25 = v29;
  if (v29) {
LABEL_33:
  }
    dispatch_release(v25);
LABEL_34:
  xpc_release(v28[1]);
}

void sub_247E8F048(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void non-virtual thunk to'abb::link::LocalClientLink::handleServerMessage(uint64_t a1, void **a2, NSObject **a3, void *a4)
{
}

void abb::link::LocalClientLink::handleServerError(void *a1, xpc_object_t *a2)
{
  xpc_object_t v3 = *a2;
  *a2 = xpc_null_create();
  if (a1[11])
  {
    xpc_object_t v4 = (std::__shared_weak_count *)a1[3];
    if (!v4 || (uint64_t v5 = a1[2], (v6 = std::__shared_weak_count::lock(v4)) == 0)) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v7 = v6;
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
    xpc_object_t v8 = xpc_null_create();
    v9 = a1[11];
    uint64_t v10 = operator new(0x20uLL);
    void *v10 = v5;
    v10[1] = v7;
    v10[2] = a1;
    v10[3] = v3;
    xpc_object_t v11 = xpc_null_create();
    dispatch_async_f(v9, v10, (dispatch_function_t)dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>(abb::link::LocalClientLink::handleServerError(xpc::object)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
    xpc_release(v11);
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  else
  {
    xpc_object_t v8 = v3;
  }
  xpc_release(v8);
}

void non-virtual thunk to'abb::link::LocalClientLink::handleServerError(uint64_t a1, xpc_object_t *a2)
{
}

void abb::link::LocalClientLink::registerAccepter(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = 0;
  xpc_object_t v4 = *(std::__shared_weak_count **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = v3;
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

uint64_t abb::link::XpcClientLink::isXpc(abb::link::XpcClientLink *this)
{
  return 1;
}

uint64_t abb::link::LocalClientLink::isXpc(abb::link::LocalClientLink *this)
{
  return 0;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    xpc_object_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265232038, MEMORY[0x263F8C060]);
}

void sub_247E8F30C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::shared_ptr<abb::link::XpcClientLink>::shared_ptr[abi:ne180100]<abb::link::XpcClientLink,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  xpc_object_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC1F240;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    std::string::size_type v6 = *(std::__shared_weak_count **)(a2 + 16);
    if (v6)
    {
      if (v6->__shared_owners_ == -1)
      {
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        *(void *)(a2 + 8) = a2;
        *(void *)(a2 + 16) = v4;
        std::__shared_weak_count::__release_weak(v6);
        if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 8) = a2;
      *(void *)(a2 + 16) = v4;
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_7:
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return a1;
}

void sub_247E8F478(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<abb::link::XpcClientLink>::~unique_ptr[abi:ne180100]((abb::link::XpcClientLink **)va);
  _Unwind_Resume(a1);
}

abb::link::XpcClientLink **std::unique_ptr<abb::link::XpcClientLink>::~unique_ptr[abi:ne180100](abb::link::XpcClientLink **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    abb::link::XpcClientLink::~XpcClientLink(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<abb::link::XpcClientLink *,std::shared_ptr<abb::link::XpcClientLink>::__shared_ptr_default_delete<abb::link::XpcClientLink,abb::link::XpcClientLink>,std::allocator<abb::link::XpcClientLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::XpcClientLink *,std::shared_ptr<abb::link::XpcClientLink>::__shared_ptr_default_delete<abb::link::XpcClientLink,abb::link::XpcClientLink>,std::allocator<abb::link::XpcClientLink>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(abb::link::XpcClientLink **)(a1 + 24);
  if (v1)
  {
    abb::link::XpcClientLink::~XpcClientLink(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcClientLink *,std::shared_ptr<abb::link::XpcClientLink>::__shared_ptr_default_delete<abb::link::XpcClientLink,abb::link::XpcClientLink>,std::allocator<abb::link::XpcClientLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000247E97F01) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000247E97F01 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000247E97F01)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000247E97F01 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  operator delete(v1);
}

void *std::shared_ptr<abb::link::LocalClientLink>::shared_ptr[abi:ne180100]<abb::link::LocalClientLink,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  xpc_object_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC1F2D0;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    std::string::size_type v6 = *(std::__shared_weak_count **)(a2 + 24);
    if (v6)
    {
      if (v6->__shared_owners_ == -1)
      {
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        *(void *)(a2 + 16) = a2;
        *(void *)(a2 + 24) = v4;
        std::__shared_weak_count::__release_weak(v6);
        if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 16) = a2;
      *(void *)(a2 + 24) = v4;
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_7:
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return a1;
}

void sub_247E8F748(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<abb::link::LocalClientLink>::~unique_ptr[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

void ***std::unique_ptr<abb::link::LocalClientLink>::~unique_ptr[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    abb::link::LocalClientLink::~LocalClientLink(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<abb::link::LocalClientLink *,std::shared_ptr<abb::link::LocalClientLink>::__shared_ptr_default_delete<abb::link::LocalClientLink,abb::link::LocalClientLink>,std::allocator<abb::link::LocalClientLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::LocalClientLink *,std::shared_ptr<abb::link::LocalClientLink>::__shared_ptr_default_delete<abb::link::LocalClientLink,abb::link::LocalClientLink>,std::allocator<abb::link::LocalClientLink>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 24);
  if (v1)
  {
    abb::link::LocalClientLink::~LocalClientLink(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalClientLink *,std::shared_ptr<abb::link::LocalClientLink>::__shared_ptr_default_delete<abb::link::LocalClientLink,abb::link::LocalClientLink>,std::allocator<abb::link::LocalClientLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000247E97FFELL) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000247E97FFELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000247E97FFELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000247E97FFELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::~__func(void *a1)
{
  *a1 = &unk_26FC1F320;
  uint64_t v2 = a1[1];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = a1[1];
    if (v3) {
      dispatch_release(v3);
    }
  }
  return a1;
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::~__func(void *__p)
{
  void *__p = &unk_26FC1F320;
  uint64_t v2 = __p[1];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[1];
    if (v3) {
      dispatch_release(v3);
    }
  }
  operator delete(__p);
}

void *std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  uint64_t v3 = *(NSObject **)(a1 + 8);
  *uint64_t v2 = &unk_26FC1F320;
  v2[1] = v3;
  if (v3)
  {
    dispatch_retain(v3);
    xpc_object_t v4 = v2[1];
    if (v4) {
      dispatch_group_enter(v4);
    }
  }
  return v2;
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  *a2 = &unk_26FC1F320;
  a2[1] = v2;
  if (v2)
  {
    dispatch_retain(v2);
    xpc_object_t v4 = a2[1];
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::destroy(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 8);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = __p[1];
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = __p[1];
    if (v3) {
      dispatch_release(v3);
    }
  }
  operator delete(__p);
}

void std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::operator()(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  *a2 = xpc_null_create();
  xpc_release(v2);
}

uint64_t std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0") {
    return a1 + 8;
  }
  if (((v3 & (unint64_t)"ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK3abb4link15LocalClientLink5flushERKN8dispatch5groupEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0,std::allocator<abb::link::LocalClientLink::flush(dispatch::group const&)::$_0>,void ()(xpc::object)>::target_type()
{
}

void dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke(void *a1)
{
  xpc_object_t object = (xpc_object_t)MEMORY[0x263EF86A8];
  xpc_retain(MEMORY[0x263EF86A8]);
  uint64_t v2 = a1[3];
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v2 + 48))(v2, &object);
  xpc_release(object);
  unint64_t v3 = (void *)a1[3];
  if (v3 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
    operator delete(a1);
  }
  else
  {
    if (v3) {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    operator delete(a1);
  }
}

void sub_247E8FC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  uint64_t v12 = (void *)v10[3];
  if (v12 == v10)
  {
    (*(void (**)(void *))(*v10 + 32))(v10);
    operator delete(v10);
    _Unwind_Resume(a1);
  }
  if (v12) {
    (*(void (**)(void *))(*v12 + 40))(v12);
  }
  operator delete(v10);
  _Unwind_Resume(a1);
}

void *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::~__func(void *a1)
{
  *a1 = &unk_26FC1F3B0;
  uint64_t v2 = a1 + 4;
  unint64_t v3 = (void *)a1[7];
  if (v3 == v2)
  {
    (*(void (**)(void *))(*v2 + 32))(v2);
    xpc_object_t v4 = a1[3];
    if (v4) {
LABEL_5:
    }
      dispatch_release(v4);
  }
  else
  {
    if (v3) {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    xpc_object_t v4 = a1[3];
    if (v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[2];
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  return a1;
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::~__func(char *__p)
{
  *(void *)__p = &unk_26FC1F3B0;
  uint64_t v2 = __p + 32;
  unint64_t v3 = (char *)*((void *)__p + 7);
  if (v3 == v2)
  {
    (*(void (**)(char *))(*(void *)v2 + 32))(v2);
    xpc_object_t v4 = *((void *)__p + 3);
    if (v4) {
LABEL_5:
    }
      dispatch_release(v4);
  }
  else
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    xpc_object_t v4 = *((void *)__p + 3);
    if (v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)__p + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  operator delete(__p);
}

void *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::__clone(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 8);
  uint64_t v2 = operator new(0x40uLL);
  *uint64_t v2 = &unk_26FC1F3B0;
  std::__compressed_pair_elem<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,0,false>::__compressed_pair_elem[abi:ne180100]<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1 const&,0ul>(v2 + 1, v1);
  return v2;
}

void sub_247E8FED4(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FC1F3B0;
  return std::__compressed_pair_elem<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,0,false>::__compressed_pair_elem[abi:ne180100]<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1 const&,0ul>(a2 + 1, (void *)(a1 + 8));
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::destroy(void *a1)
{
  uint64_t v2 = a1 + 4;
  unint64_t v3 = (void *)a1[7];
  if (v3 == v2)
  {
    (*(void (**)(void *))(*v2 + 32))(v2);
    xpc_object_t v4 = a1[3];
    if (v4) {
LABEL_5:
    }
      dispatch_release(v4);
  }
  else
  {
    if (v3) {
      (*(void (**)(void *))(*v3 + 40))(v3);
    }
    xpc_object_t v4 = a1[3];
    if (v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[2];
  if (v5)
  {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::destroy_deallocate(char *__p)
{
  uint64_t v2 = __p + 32;
  unint64_t v3 = (char *)*((void *)__p + 7);
  if (v3 == v2)
  {
    (*(void (**)(char *))(*(void *)v2 + 32))(v2);
    xpc_object_t v4 = *((void *)__p + 3);
    if (v4) {
LABEL_5:
    }
      dispatch_release(v4);
  }
  else
  {
    if (v3) {
      (*(void (**)(char *))(*(void *)v3 + 40))(v3);
    }
    xpc_object_t v4 = *((void *)__p + 3);
    if (v4) {
      goto LABEL_5;
    }
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)__p + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  operator delete(__p);
}

void std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::operator()(void *a1, void **a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v3 = *a2;
  *a2 = xpc_null_create();
  xpc_object_t v4 = (std::__shared_weak_count *)a1[2];
  if (!v4) {
    goto LABEL_26;
  }
  uint64_t v5 = std::__shared_weak_count::lock(v4);
  if (!v5) {
    goto LABEL_26;
  }
  std::string::size_type v6 = v5;
  if (a1[1])
  {
    *(void *)&long long v15 = a1[1];
    *((void *)&v15 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = v5;
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    xpc_object_t object = v3;
    if (v3)
    {
      xpc_retain(v3);
      uint64_t v7 = a1[7];
      if (!v7) {
        goto LABEL_10;
      }
    }
    else
    {
      xpc_object_t object = xpc_null_create();
      uint64_t v7 = a1[7];
      if (!v7) {
        goto LABEL_10;
      }
    }
    if ((void *)v7 == a1 + 4)
    {
      long long v18 = v17;
      (*(void (**)(uint64_t, void *))(*(void *)v7 + 24))(v7, v17);
      goto LABEL_12;
    }
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
LABEL_10:
    long long v18 = (void *)v7;
LABEL_12:
    xpc_object_t v8 = a1[3];
    v9 = operator new(0x38uLL);
    *(_OWORD *)v9 = v15;
    long long v15 = 0uLL;
    v9[2] = object;
    xpc_object_t object = xpc_null_create();
    if (v18)
    {
      if (v18 == v17)
      {
        v9[6] = v9 + 3;
        (*(void (**)(void *))(v17[0] + 24))(v17);
      }
      else
      {
        v9[6] = v18;
        long long v18 = 0;
      }
    }
    else
    {
      v9[6] = 0;
    }
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    dispatch_async_f(v8, v9, (dispatch_function_t)dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v13);
    std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v14);
    if (v18 == v17)
    {
      (*(void (**)(void *))(v17[0] + 32))(v17);
    }
    else if (v18)
    {
      (*(void (**)(void *, uint64_t, uint64_t))(*v18 + 40))(v18, v10, v11);
    }
    xpc_release(object);
    xpc_object_t object = 0;
    uint64_t v12 = (std::__shared_weak_count *)*((void *)&v15 + 1);
    if (*((void *)&v15 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v15 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
LABEL_26:
  xpc_release(v3);
}

void sub_247E9037C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, xpc_object_t object)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functi"
                     "onIFvNS2_6objectEEEEE3$_1")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueE"
                                "NS6_8functionIFvNS2_6objectEEEEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEEE3$_1"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK3abb4link15LocalClientLink4sendERKN3xpc4dictENSt3__18weak_ptrIKvEERKN8dispatch5queueENS6_8functionIFvNS2_6objectEEEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,std::allocator<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1>,void ()(xpc::object)>::target_type()
{
}

void *std::__compressed_pair_elem<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1,0,false>::__compressed_pair_elem[abi:ne180100]<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1 const&,0ul>(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = a2[2];
  a1[2] = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  uint64_t v6 = a2[6];
  if (!v6) {
    goto LABEL_8;
  }
  if ((void *)v6 != a2 + 3)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 16))(v6);
LABEL_8:
    a1[6] = v6;
    return a1;
  }
  a1[6] = a1 + 3;
  (*(void (**)(void))(*(void *)a2[6] + 24))(a2[6]);
  return a1;
}

void sub_247E905A0(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(NSObject **)(v1 + 16);
  if (v3)
  {
    dispatch_release(v3);
    uint64_t v4 = *(std::__shared_weak_count **)(v1 + 8);
    if (!v4) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else
  {
    uint64_t v4 = *(std::__shared_weak_count **)(v1 + 8);
    if (!v4) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(exception_object);
}

uint64_t *std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    if (v3 == v2 + 24)
    {
      (*(void (**)(uint64_t))(*(void *)(v2 + 24) + 32))(v2 + 24);
    }
    else if (v3)
    {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    xpc_release(*(xpc_object_t *)(v2 + 16));
    *(void *)(v2 + 16) = 0;
    uint64_t v4 = *(std::__shared_weak_count **)(v2 + 8);
    if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
    operator delete((void *)v2);
  }
  return a1;
}

uint64_t *dispatch::async<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v5 = a1;
  uint64_t v2 = *(void **)(a1 + 16);
  xpc_object_t object = v2;
  if (!v2)
  {
    xpc_object_t object = xpc_null_create();
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  xpc_retain(v2);
  uint64_t v3 = *(void *)(a1 + 48);
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v3 + 48))(v3, &object);
  xpc_release(object);
  return std::unique_ptr<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::send(xpc::dict const&,std::weak_ptr<void const>,dispatch::queue const&,std::function<void ()(xpc::object)>)::$_1::operator() const(xpc::object)::{lambda(void)#1}>>::~unique_ptr[abi:ne180100](&v5);
}

void sub_247E9076C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

void dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 24), "ConnectLink"))
  {
    *(unsigned char *)(v2 + 96) = 1;
    uint64_t v3 = *(void *)(v2 + 56);
    xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 24), "ConnectLink");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v3 + 16))(v3, &object);
    xpc_release(object);
  }
  else
  {
    uint64_t v5 = *(void *)(v2 + 56);
    uint64_t v6 = *(void **)(a1 + 24);
    xpc_object_t object = v6;
    if (v6) {
      xpc_retain(v6);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v5 + 24))(v5, &object);
    xpc_release(object);
  }
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(void *)(a1 + 24) = 0;
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 8);
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  operator delete((void *)a1);
}

void sub_247E9093C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(void *)(v10 + 24) = 0;
  uint64_t v12 = *(std::__shared_weak_count **)(v10 + 8);
  if (v12)
  {
    if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (!v2) {
    return a1;
  }
  uint64_t v3 = *(void *)(v2 + 64);
  if (v3 != v2 + 40)
  {
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 40))(v3);
    }
    uint64_t v4 = *(NSObject **)(v2 + 32);
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  (*(void (**)(uint64_t))(*(void *)(v2 + 40) + 32))(v2 + 40);
  uint64_t v4 = *(NSObject **)(v2 + 32);
  if (v4) {
LABEL_6:
  }
    dispatch_release(v4);
LABEL_7:
  xpc_release(*(xpc_object_t *)(v2 + 24));
  *(void *)(v2 + 24) = 0;
  uint64_t v5 = *(std::__shared_weak_count **)(v2 + 8);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  operator delete((void *)v2);
  return a1;
}

uint64_t *dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v10 = a1;
  uint64_t v3 = a1[2];
  uint64_t v2 = (void *)a1[3];
  uint64_t v4 = *(void *)(v3 + 56);
  xpc_object_t v12 = v2;
  if (v2)
  {
    xpc_retain(v2);
    uint64_t v5 = a1[4];
    dispatch_object_t object = v5;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  xpc_object_t v7 = xpc_null_create();
  uint64_t v5 = a1[4];
  dispatch_object_t object = v5;
  xpc_object_t v12 = v7;
  if (v5) {
LABEL_3:
  }
    dispatch_retain(v5);
LABEL_4:
  uint64_t v6 = a1[8];
  if (!v6)
  {
LABEL_7:
    uint64_t v14 = (void *)v6;
    goto LABEL_11;
  }
  if ((void *)v6 != a1 + 5)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 16))(v6);
    goto LABEL_7;
  }
  uint64_t v14 = v13;
  (*(void (**)(uint64_t, void *))(*(void *)v6 + 24))(v6, v13);
LABEL_11:
  (*(void (**)(uint64_t, xpc_object_t *, dispatch_object_t *, void *))(*(void *)v4 + 32))(v4, &v12, &object, v13);
  if (v14 == v13)
  {
    (*(void (**)(void *))(v13[0] + 32))(v13);
    xpc_object_t v8 = object;
    if (!object) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (v14) {
    (*(void (**)(void *))(*v14 + 40))(v14);
  }
  xpc_object_t v8 = object;
  if (object) {
LABEL_15:
  }
    dispatch_release(v8);
LABEL_16:
  xpc_release(v12);
  return std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100]((uint64_t *)&v10);
}

void sub_247E90CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (v15) {
    dispatch_release(v15);
  }
  xpc_release(object);
  std::unique_ptr<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0>(abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&)::{lambda(void)#1},std::default_delete<abb::link::LocalClientLink::handleServerMessage(xpc::dict,dispatch::queue,std::function<void ()(xpc::object)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void sub_247E90D58(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void dispatch::async<void abb::link::LocalClientLink::execute<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>(abb::link::LocalClientLink::handleServerError(xpc::object)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0,dispatch_queue_s *::default_delete<abb::link::LocalClientLink::handleServerError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v4 = *(void *)(v3 + 56);
  xpc_object_t object = v2;
  if (v2) {
    xpc_retain(v2);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v4 + 40))(v4, &object);
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(void *)(a1 + 24) = 0;
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
  if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  operator delete((void *)a1);
}

void sub_247E90E5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(void *)(v10 + 24) = 0;
  xpc_object_t v12 = *(std::__shared_weak_count **)(v10 + 8);
  if (v12)
  {
    if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void abb::link::XpcServerLink::create(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x48uLL);
  xpc_object_t v7 = *a2;
  *a2 = xpc_null_create();
  void *v6 = &unk_26FC1F430;
  xpc_object_t v8 = (std::string *)(v6 + 1);
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v6[3] = *(void *)(a1 + 16);
  }
  v6[4] = 0;
  v6[5] = 0;
  void *v6 = &unk_26FC1F470;
  v6[6] = 0;
  v6[7] = v7;
  xpc_object_t v9 = xpc_null_create();
  if (*(char *)(a1 + 23) >= 0) {
    uint64_t v10 = (const char *)a1;
  }
  else {
    uint64_t v10 = *(const char **)a1;
  }
  v6[8] = dispatch_queue_create(v10, 0);
  std::shared_ptr<abb::link::XpcServerLink>::shared_ptr[abi:ne180100]<abb::link::XpcServerLink,void>(a3, (uint64_t)v6);
  xpc_release(v9);
}

void sub_247E90FDC(_Unwind_Exception *a1)
{
  xpc_release(v2);
  if (v3) {
    operator delete(v1);
  }
  _Unwind_Resume(a1);
}

void *abb::link::XpcServerLink::XpcServerLink(void *a1, long long *a2, xpc_object_t *a3)
{
  *a1 = &unk_26FC1F430;
  uint64_t v6 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    v6->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  a1[4] = 0;
  a1[5] = 0;
  *a1 = &unk_26FC1F470;
  xpc_object_t v8 = *a3;
  a1[6] = 0;
  a1[7] = v8;
  *a3 = xpc_null_create();
  if (*((char *)a2 + 23) >= 0) {
    xpc_object_t v9 = (const char *)a2;
  }
  else {
    xpc_object_t v9 = *(const char **)a2;
  }
  a1[8] = dispatch_queue_create(v9, 0);
  return a1;
}

{
  std::string *v6;
  long long v7;
  xpc_object_t v8;
  const char *v9;

  *a1 = &unk_26FC1F430;
  uint64_t v6 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    v6->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  a1[4] = 0;
  a1[5] = 0;
  *a1 = &unk_26FC1F470;
  xpc_object_t v8 = *a3;
  a1[6] = 0;
  a1[7] = v8;
  *a3 = xpc_null_create();
  if (*((char *)a2 + 23) >= 0) {
    xpc_object_t v9 = (const char *)a2;
  }
  else {
    xpc_object_t v9 = *(const char **)a2;
  }
  a1[8] = dispatch_queue_create(v9, 0);
  return a1;
}

void abb::link::ServerLink::~ServerLink(void **this)
{
  *this = &unk_26FC1F430;
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

void abb::link::XpcServerLink::~XpcServerLink(abb::link::XpcServerLink *this)
{
  uint64_t v2 = *((void *)this + 8);
  if (v2) {
    dispatch_release(v2);
  }
  xpc_release(*((xpc_object_t *)this + 7));
  uint64_t v3 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  *(void *)this = &unk_26FC1F430;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  void *v1;
  uint64_t vars8;

  abb::link::XpcServerLink::~XpcServerLink(this);
  operator delete(v1);
}

uint64_t abb::link::XpcServerLink::getXpcConnection(abb::link::XpcServerLink *this)
{
  return (uint64_t)this + 56;
}

void abb::link::XpcServerLink::connectLink(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24C56ED30](v4) == MEMORY[0x263EF8708])
    {
      xpc_retain(v4);
      xpc_object_t v5 = v4;
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v4 = 0;
  }
  xpc_release(v4);
  xpc_object_t v6 = *a2;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v5, "ConnectLink", v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  if (v5)
  {
    xpc_retain(v5);
    xpc_object_t v8 = v5;
  }
  else
  {
    xpc_object_t v8 = xpc_null_create();
  }
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), v8);
  xpc_release(v8);
  xpc_release(v5);
}

void sub_247E913FC(_Unwind_Exception *a1)
{
  xpc_release(v2);
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void abb::link::XpcServerLink::sendMessage(uint64_t a1, xpc_object_t *a2)
{
}

uint64_t abb::link::XpcServerLink::sendMessage(uint64_t a1, void **a2, NSObject **a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  xpc_object_t v4 = *(_xpc_connection_s **)(a1 + 56);
  xpc_object_t v5 = *a2;
  xpc_object_t v6 = *a3;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENSt3__18functionIFvNS2_6objectEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_1;
  xpc_object_t v7 = (void *)a4[3];
  if (v7)
  {
    if (v7 == a4)
    {
      uint64_t v11 = v10;
      (*(void (**)(void *, void *))(*a4 + 24))(a4, v10);
    }
    else
    {
      uint64_t v11 = (void *)(*(uint64_t (**)(void *))(*v7 + 16))(v7);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  xpc_connection_send_message_with_reply(v4, v5, v6, handler);
  uint64_t result = (uint64_t)v11;
  if (v11 == v10) {
    return (*(uint64_t (**)(void *))(v10[0] + 32))(v10);
  }
  if (v11) {
    return (*(uint64_t (**)(void))(*v11 + 40))();
  }
  return result;
}

void sub_247E915E8(_Unwind_Exception *a1)
{
  std::function<void ()(xpc::object)>::~function(v1);
  _Unwind_Resume(a1);
}

void ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENSt3__18functionIFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  xpc_object_t objecta = object;
  if (!object)
  {
    xpc_object_t objecta = xpc_null_create();
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    std::__throw_bad_function_call[abi:ne180100]();
  }
  xpc_retain(object);
  uint64_t v3 = *(void *)(a1 + 56);
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v3 + 48))(v3, &objecta);
  xpc_release(objecta);
}

void sub_247E9168C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t __copy_helper_block_e8_32c39_ZTSNSt3__18functionIFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a2 + 56);
  if (result)
  {
    if (result == a2 + 32)
    {
      *(void *)(a1 + 56) = a1 + 32;
      xpc_object_t v4 = *(uint64_t (**)(void))(**(void **)(a2 + 56) + 24);
      return v4();
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
      *(void *)(a1 + 56) = result;
    }
  }
  else
  {
    *(void *)(a1 + 56) = 0;
  }
  return result;
}

uint64_t __destroy_helper_block_e8_32c39_ZTSNSt3__18functionIFvN3xpc6objectEEEE(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t result = *(void *)(a1 + 56);
  if (result == v1) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v1 + 32))(v1);
  }
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 40))();
  }
  return result;
}

void abb::link::XpcServerLink::sendMessage(uint64_t a1, void **a2, NSObject **a3, void **a4)
{
  xpc_object_t v4 = *(_xpc_connection_s **)(a1 + 56);
  xpc_object_t v5 = *a2;
  xpc_object_t v6 = *a3;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 1174405120;
  handler[2] = ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke;
  handler[3] = &__block_descriptor_tmp_2;
  xpc_object_t v7 = *a4;
  if (*a4) {
    xpc_object_t v7 = _Block_copy(v7);
  }
  aBlock = v7;
  xpc_connection_send_message_with_reply(v4, v5, v6, handler);
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_247E91874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock)
{
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Unwind_Resume(exception_object);
}

void ___ZNK3abb4link13XpcServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
{
  if (object)
  {
    xpc_object_t v3 = object;
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
  }
  uint64_t v4 = *(void *)(a1 + 32);
  xpc_object_t objecta = v3;
  xpc_object_t v5 = xpc_null_create();
  (*(void (**)(uint64_t, xpc_object_t *))(v4 + 16))(v4, &objecta);
  xpc_release(objecta);
  xpc_release(v5);
}

void sub_247E91918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void abb::link::XpcServerLink::handleClientMessage(void *a1, uint64_t a2, xpc_object_t *a3)
{
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v6 = *a3;
  if (*a3) {
    xpc_retain(*a3);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_object_t v7 = a1[8];
  xpc_object_t v8 = operator new(0x20uLL);
  *xpc_object_t v8 = a1;
  v8[1] = v4;
  v8[2] = v5;
  v8[3] = v6;
  xpc_object_t v9 = xpc_null_create();
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>>)::{lambda(void *)#1}::__invoke);
  xpc_release(v9);
}

void abb::link::XpcServerLink::handleClientError(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[5];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[8];
  uint64_t v5 = operator new(0x18uLL);
  *uint64_t v5 = a1;
  v5[1] = v2;
  v5[2] = v3;
  dispatch_async_f(v4, v5, (dispatch_function_t)dispatch::async<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>>)::{lambda(void *)#1}::__invoke);
}

void *abb::link::LocalServerLink::create@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x50uLL);
  void *v4 = &unk_26FC1F430;
  uint64_t v5 = (std::string *)(v4 + 1);
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    BOOL v6 = *(char *)(a1 + 23) < 0;
  }
  else
  {
    BOOL v6 = 0;
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    v4[3] = *(void *)(a1 + 16);
  }
  v4[5] = 0;
  v4[6] = 0;
  void *v4 = &unk_26FC1F510;
  v4[4] = &unk_26FC1F568;
  v4[7] = 0;
  v4[8] = 0;
  if (v6) {
    xpc_object_t v7 = *(const char **)a1;
  }
  else {
    xpc_object_t v7 = (const char *)a1;
  }
  v4[9] = dispatch_queue_create(v7, 0);
  return std::shared_ptr<abb::link::LocalServerLink>::shared_ptr[abi:ne180100]<abb::link::LocalServerLink,void>(a2, (uint64_t)v4);
}

void sub_247E91BCC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *abb::link::LocalServerLink::LocalServerLink(void *a1, long long *a2)
{
  *a1 = &unk_26FC1F430;
  uint64_t v4 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    v4->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  a1[5] = 0;
  a1[6] = 0;
  *a1 = &unk_26FC1F510;
  a1[4] = &unk_26FC1F568;
  a1[7] = 0;
  a1[8] = 0;
  if (*((char *)a2 + 23) >= 0) {
    BOOL v6 = (const char *)a2;
  }
  else {
    BOOL v6 = *(const char **)a2;
  }
  a1[9] = dispatch_queue_create(v6, 0);
  return a1;
}

{
  std::string *v4;
  long long v5;
  const char *v6;

  *a1 = &unk_26FC1F430;
  uint64_t v4 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    v4->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  }
  a1[5] = 0;
  a1[6] = 0;
  *a1 = &unk_26FC1F510;
  a1[4] = &unk_26FC1F568;
  a1[7] = 0;
  a1[8] = 0;
  if (*((char *)a2 + 23) >= 0) {
    BOOL v6 = (const char *)a2;
  }
  else {
    BOOL v6 = *(const char **)a2;
  }
  a1[9] = dispatch_queue_create(v6, 0);
  return a1;
}

void abb::link::LocalServerLink::~LocalServerLink(abb::link::LocalServerLink *this)
{
  uint64_t v2 = *((void *)this + 9);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  long long v5 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  *(void *)this = &unk_26FC1F430;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;

  uint64_t v2 = *((void *)this + 9);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  long long v5 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  *(void *)this = &unk_26FC1F430;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  abb::link::LocalServerLink *v6;
  uint64_t vars8;

  uint64_t v2 = *((void *)this + 9);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 7);
  *((void *)this + 7) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  long long v5 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  *(void *)this = &unk_26FC1F430;
  if (*((char *)this + 31) < 0)
  {
    operator delete(*((void **)this + 1));
    BOOL v6 = this;
  }
  else
  {
    BOOL v6 = this;
  }
  operator delete(v6);
}

void non-virtual thunk to'abb::link::LocalServerLink::~LocalServerLink(abb::link::LocalServerLink *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  long long v5 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  *((void *)this - 4) = &unk_26FC1F430;
  if (*((char *)this - 1) < 0) {
    operator delete(*((void **)this - 3));
  }
}

{
  abb::link::LocalServerLink::~LocalServerLink((abb::link::LocalServerLink *)((char *)this - 32));
}

void abb::link::LocalServerLink::connectLink(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4 || (xpc_object_t v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24C56ED30](v4) == MEMORY[0x263EF8708])
    {
      xpc_retain(v4);
      xpc_object_t v5 = v4;
    }
    else
    {
      xpc_object_t v5 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    xpc_object_t v4 = 0;
  }
  xpc_release(v4);
  xpc_object_t v6 = *a2;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t v6 = xpc_null_create();
  }
  xpc_dictionary_set_value(v5, "ConnectLink", v6);
  xpc_object_t v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  xpc_object_t object = v5;
  if (v5) {
    xpc_retain(v5);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abb::link::LocalServerLink::sendMessage(a1, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v5);
}

void sub_247E92230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void abb::link::LocalServerLink::sendMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    xpc_object_t object = *a2;
    *a2 = xpc_null_create();
    (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v2 + 16))(v2, &object);
    xpc_release(object);
  }
}

void sub_247E922F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abb::link::LocalServerLink::sendMessage(uint64_t a1, void **a2, NSObject **a3, void *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4)
  {
    xpc_object_t v7 = *a2;
    xpc_object_t v13 = v7;
    if (v7)
    {
      xpc_retain(v7);
      xpc_object_t v8 = *a3;
      dispatch_object_t object = v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    else
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v8 = *a3;
      dispatch_object_t object = v8;
      xpc_object_t v13 = v10;
      if (!v8)
      {
LABEL_5:
        uint64_t v9 = a4[3];
        if (v9)
        {
          if ((void *)v9 == a4)
          {
            uint64_t v15 = v14;
            (*(void (**)(void *, void *))(*a4 + 24))(a4, v14);
LABEL_12:
            (*(void (**)(uint64_t, xpc_object_t *, dispatch_object_t *, void *))(*(void *)v4 + 24))(v4, &v13, &object, v14);
            if (v15 == v14)
            {
              (*(void (**)(void *))(v14[0] + 32))(v14);
              uint64_t v11 = object;
              if (!object) {
                goto LABEL_17;
              }
            }
            else
            {
              if (v15) {
                (*(void (**)(void))(*v15 + 40))();
              }
              uint64_t v11 = object;
              if (!object) {
                goto LABEL_17;
              }
            }
            dispatch_release(v11);
LABEL_17:
            xpc_release(v13);
            return;
          }
          uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16))(v9);
        }
        uint64_t v15 = (void *)v9;
        goto LABEL_12;
      }
    }
    dispatch_retain(v8);
    goto LABEL_5;
  }
}

void sub_247E924D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12)
{
  if (v12) {
    dispatch_release(v12);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void abb::link::LocalServerLink::sendMessage(uint64_t a1, xpc_object_t *a2, NSObject **a3, void **a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 64))
  {
    xpc_object_t v7 = *a2;
    xpc_object_t v13 = v7;
    if (v7)
    {
      xpc_retain(v7);
      xpc_object_t v8 = *a3;
      uint64_t v12 = v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v8 = *a3;
      uint64_t v12 = v8;
      xpc_object_t v13 = v7;
      if (!v8)
      {
LABEL_5:
        uint64_t v9 = *a4;
        if (*a4) {
          uint64_t v9 = _Block_copy(v9);
        }
        v14[0] = &unk_26FC1F738;
        v14[1] = v9;
        uint64_t v15 = v14;
        abb::link::LocalServerLink::sendMessage(a1, &v13, &v12, v14);
        if (v15 == v14)
        {
          (*(void (**)(void *))(v14[0] + 32))(v14);
          if (!v8) {
            goto LABEL_12;
          }
        }
        else
        {
          if (v15) {
            (*(void (**)(void *, uint64_t, uint64_t))(*v15 + 40))(v15, v10, v11);
          }
          if (!v8) {
            goto LABEL_12;
          }
        }
        dispatch_release(v8);
LABEL_12:
        xpc_release(v7);
        return;
      }
    }
    dispatch_retain(v8);
    goto LABEL_5;
  }
}

void sub_247E92698(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

const void **abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)const::$_0::~$_0(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

void abb::link::LocalServerLink::handleClientMessage(void *a1, xpc_object_t *a2)
{
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v5 = *a2;
  *a2 = xpc_null_create();
  xpc_object_t v6 = a1[9];
  xpc_object_t v7 = operator new(0x20uLL);
  void *v7 = a1;
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = v5;
  xpc_object_t v8 = xpc_null_create();
  dispatch_async_f(v6, v7, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke);
  xpc_release(v8);
}

void non-virtual thunk to'abb::link::LocalServerLink::handleClientMessage(uint64_t a1, xpc_object_t *a2)
{
}

void abb::link::LocalServerLink::handleClientMessage(void *a1, xpc_object_t *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  xpc_object_t v5 = (std::__shared_weak_count *)a1[6];
  *(void *)&long long v9 = a1;
  *((void *)&v9 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = a1[5];
  uint64_t v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t object = *a2;
  *a2 = xpc_null_create();
  xpc_object_t v6 = (void *)a3[3];
  if (v6)
  {
    if (v6 == a3)
    {
      uint64_t v14 = v13;
      (*(void (**)(void *, void *))(*a3 + 24))(a3, v13);
    }
    else
    {
      uint64_t v14 = (void *)a3[3];
      a3[3] = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  xpc_object_t v7 = a1[9];
  xpc_object_t v8 = operator new(0x40uLL);
  *(_OWORD *)xpc_object_t v8 = v9;
  v8[2] = v10;
  v8[3] = object;
  xpc_object_t objecta = xpc_null_create();
  if (v14)
  {
    if (v14 == v13)
    {
      v8[7] = v8 + 4;
      (*(void (**)(void *))(v13[0] + 24))(v13);
    }
    else
    {
      v8[7] = v14;
      uint64_t v14 = 0;
    }
  }
  else
  {
    v8[7] = 0;
  }
  dispatch_async_f(v7, v8, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  if (v14 == v13)
  {
    (*(void (**)(void *))(v13[0] + 32))(v13);
  }
  else if (v14)
  {
    (*(void (**)(void))(*v14 + 40))();
  }
  xpc_release(objecta);
}

void sub_247E929E4(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void non-virtual thunk to'abb::link::LocalServerLink::handleClientMessage(uint64_t a1, xpc_object_t *a2, void *a3)
{
}

void abb::link::LocalServerLink::handleClientError(void *a1)
{
  uint64_t v2 = a1[5];
  uint64_t v3 = a1[6];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[9];
  xpc_object_t v5 = operator new(0x18uLL);
  *xpc_object_t v5 = a1;
  v5[1] = v2;
  v5[2] = v3;
  dispatch_async_f(v4, v5, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
}

void non-virtual thunk to'abb::link::LocalServerLink::handleClientError(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a1[5];
  xpc_object_t v5 = operator new(0x18uLL);
  *xpc_object_t v5 = a1 - 4;
  v5[1] = v2;
  v5[2] = v3;
  dispatch_async_f(v4, v5, (dispatch_function_t)dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke);
}

uint64_t abb::link::ServerLink::isXpc(abb::link::ServerLink *this)
{
  return 0;
}

uint64_t abb::link::XpcServerLink::isXpc(abb::link::XpcServerLink *this)
{
  return 1;
}

uint64_t abb::link::LocalServerLink::isXpc(abb::link::LocalServerLink *this)
{
  return 0;
}

void *std::shared_ptr<abb::link::XpcServerLink>::shared_ptr[abi:ne180100]<abb::link::XpcServerLink,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC1F698;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (a2)
  {
    xpc_object_t v6 = *(std::__shared_weak_count **)(a2 + 40);
    if (v6)
    {
      if (v6->__shared_owners_ == -1)
      {
        atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        *(void *)(a2 + 32) = a2;
        *(void *)(a2 + 40) = v4;
        std::__shared_weak_count::__release_weak(v6);
        if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
          goto LABEL_7;
        }
      }
    }
    else
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 32) = a2;
      *(void *)(a2 + 40) = v4;
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_7:
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  return a1;
}

void sub_247E92C54(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<abb::link::XpcServerLink>::~unique_ptr[abi:ne180100]((abb::link::XpcServerLink **)va);
  _Unwind_Resume(a1);
}

abb::link::XpcServerLink **std::unique_ptr<abb::link::XpcServerLink>::~unique_ptr[abi:ne180100](abb::link::XpcServerLink **a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    abb::link::XpcServerLink::~XpcServerLink(v2);
    operator delete(v3);
  }
  return a1;
}

void std::__shared_ptr_pointer<abb::link::XpcServerLink *,std::shared_ptr<abb::link::XpcServerLink>::__shared_ptr_default_delete<abb::link::XpcServerLink,abb::link::XpcServerLink>,std::allocator<abb::link::XpcServerLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::XpcServerLink *,std::shared_ptr<abb::link::XpcServerLink>::__shared_ptr_default_delete<abb::link::XpcServerLink,abb::link::XpcServerLink>,std::allocator<abb::link::XpcServerLink>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(abb::link::XpcServerLink **)(a1 + 24);
  if (v1)
  {
    abb::link::XpcServerLink::~XpcServerLink(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcServerLink *,std::shared_ptr<abb::link::XpcServerLink>::__shared_ptr_default_delete<abb::link::XpcServerLink,abb::link::XpcServerLink>,std::allocator<abb::link::XpcServerLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000247E983DBLL) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000247E983DBLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000247E983DBLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000247E983DBLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void dispatch::async<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientMessage(xpc::connection const&,xpc::dict const&)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
  {
    uint64_t v3 = *a1;
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      xpc_object_t v5 = v4;
      if (a1[1])
      {
        uint64_t v6 = *(void *)(v3 + 48);
        if (v6)
        {
          xpc_object_t v7 = (void *)a1[3];
          xpc_object_t object = v7;
          if (v7) {
            xpc_retain(v7);
          }
          else {
            xpc_object_t object = xpc_null_create();
          }
          (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v6 + 16))(v6, &object);
          xpc_release(object);
          xpc_object_t object = 0;
        }
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  xpc_release((xpc_object_t)a1[3]);
  a1[3] = 0;
  xpc_object_t v8 = (std::__shared_weak_count *)a1[2];
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  operator delete(a1);
}

void sub_247E92E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(void *)(v10 + 24) = 0;
  xpc_object_t v13 = *(std::__shared_weak_count **)(v10 + 16);
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void dispatch::async<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0,std::default_delete<abb::link::XpcServerLink::handleClientError(xpc::connection const&,xpc::object const&)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
  {
    uint64_t v3 = *__p;
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      xpc_object_t v5 = v4;
      if (__p[1])
      {
        uint64_t v6 = *(void *)(v3 + 48);
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 32))(v6);
        }
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    xpc_object_t v7 = (std::__shared_weak_count *)__p[2];
    if (v7) {
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  operator delete(__p);
}

void sub_247E92FF4(_Unwind_Exception *a1)
{
  if (atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v4 = (std::__shared_weak_count *)v1[2];
    if (!v4) {
      goto LABEL_3;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v4 = (std::__shared_weak_count *)v1[2];
    if (!v4)
    {
LABEL_3:
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  std::__shared_weak_count::__release_weak(v4);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<abb::link::LocalServerLink>::shared_ptr[abi:ne180100]<abb::link::LocalServerLink,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC1F6E8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 48);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 40) = a2;
      *(void *)(a2 + 48) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 40) = a2;
  *(void *)(a2 + 48) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_247E93184(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::default_delete<abb::link::LocalServerLink>::operator()[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<abb::link::LocalServerLink *,std::shared_ptr<abb::link::LocalServerLink>::__shared_ptr_default_delete<abb::link::LocalServerLink,abb::link::LocalServerLink>,std::allocator<abb::link::LocalServerLink>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abb::link::LocalServerLink *,std::shared_ptr<abb::link::LocalServerLink>::__shared_ptr_default_delete<abb::link::LocalServerLink,abb::link::LocalServerLink>,std::allocator<abb::link::LocalServerLink>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalServerLink *,std::shared_ptr<abb::link::LocalServerLink>::__shared_ptr_default_delete<abb::link::LocalServerLink,abb::link::LocalServerLink>,std::allocator<abb::link::LocalServerLink>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000247E984BCLL) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000247E984BCLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000247E984BCLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000247E984BCLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::default_delete<abb::link::LocalServerLink>::operator()[abi:ne180100](char *__p)
{
  if (__p)
  {
    uint64_t v2 = *((void *)__p + 9);
    if (v2) {
      dispatch_release(v2);
    }
    uint64_t v3 = *((void *)__p + 8);
    *((void *)__p + 8) = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    uint64_t v4 = *((void *)__p + 7);
    *((void *)__p + 7) = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    xpc_object_t v5 = (std::__shared_weak_count *)*((void *)__p + 6);
    if (v5) {
      std::__shared_weak_count::__release_weak(v5);
    }
    *(void *)__p = &unk_26FC1F430;
    if (__p[31] < 0)
    {
      operator delete(*((void **)__p + 1));
      uint64_t v6 = __p;
    }
    else
    {
      uint64_t v6 = __p;
    }
    operator delete(v6);
  }
}

void *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::~__func(void *a1)
{
  *a1 = &unk_26FC1F738;
  uint64_t v2 = (const void *)a1[1];
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::~__func(void *__p)
{
  void *__p = &unk_26FC1F738;
  uint64_t v2 = (const void *)__p[1];
  if (v2) {
    _Block_release(v2);
  }
  operator delete(__p);
}

void *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  uint64_t v3 = *(void **)(a1 + 8);
  *uint64_t v2 = &unk_26FC1F738;
  if (v3) {
    uint64_t v3 = _Block_copy(v3);
  }
  v2[1] = v3;
  return v2;
}

void *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::__clone(uint64_t a1, void *a2)
{
  uint64_t result = *(void **)(a1 + 8);
  *a2 = &unk_26FC1F738;
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  a2[1] = result;
  return result;
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = (const void *)__p[1];
  if (v2) {
    _Block_release(v2);
  }
  operator delete(__p);
}

void std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::operator()(uint64_t a1, void **a2)
{
  uint64_t v3 = *a2;
  *a2 = xpc_null_create();
  uint64_t v4 = *(void *)(a1 + 8);
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v4 + 16))(v4, &object);
  xpc_release(object);
  xpc_release(v3);
}

void sub_247E935A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::target(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerF"
                     "vNS2_6objectEEEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13blo"
                                "ck_pointerFvNS2_6objectEEEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZNK3abb4link15LocalServerLink11sendMessageEN3xpc4dictEN8dispatch5queueENS4_5blockIU13block_pointerFvNS2_6objectEEEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8; {
  return 0;
  }
}

void *std::__function::__func<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0,std::allocator<abb::link::LocalServerLink::sendMessage(xpc::dict,dispatch::queue,dispatch::block<void({block_pointer})(xpc::object)>)::$_0>,void ()(xpc::object)>::target_type()
{
}

void dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2)
  {
    uint64_t v3 = *a1;
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      xpc_object_t v5 = v4;
      if (a1[1])
      {
        uint64_t v6 = *(void *)(v3 + 56);
        if (v6)
        {
          xpc_object_t v7 = (void *)a1[3];
          xpc_object_t object = v7;
          if (v7) {
            xpc_retain(v7);
          }
          else {
            xpc_object_t object = xpc_null_create();
          }
          (*(void (**)(uint64_t, xpc_object_t *))(*(void *)v6 + 16))(v6, &object);
          xpc_release(object);
          xpc_object_t object = 0;
        }
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  xpc_release((xpc_object_t)a1[3]);
  a1[3] = 0;
  xpc_object_t v8 = (std::__shared_weak_count *)a1[2];
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  operator delete(a1);
}

void sub_247E93760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  xpc_release(*(xpc_object_t *)(v10 + 24));
  *(void *)(v10 + 24) = 0;
  xpc_object_t v13 = *(std::__shared_weak_count **)(v10 + 16);
  if (v13) {
    std::__shared_weak_count::__release_weak(v13);
  }
  operator delete((void *)v10);
  _Unwind_Resume(a1);
}

void dispatch::async<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientMessage(xpc::dict,std::function<void ()(xpc::object)>)::$_0>>)::{lambda(void *)#1}::__invoke(char *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = (std::__shared_weak_count *)*((void *)a1 + 2);
  if (!v2 || (v3 = *(void *)a1, (uint64_t v4 = std::__shared_weak_count::lock(v2)) == 0))
  {
LABEL_19:
    long long v9 = a1 + 32;
    uint64_t v10 = (char *)*((void *)a1 + 7);
    if (v10 != a1 + 32) {
      goto LABEL_20;
    }
LABEL_23:
    (*(void (**)(char *))(*(void *)v9 + 32))(v9);
    goto LABEL_24;
  }
  xpc_object_t v5 = v4;
  if (*((void *)a1 + 1))
  {
    uint64_t v6 = *(void *)(v3 + 56);
    if (v6)
    {
      xpc_object_t v7 = (void *)*((void *)a1 + 3);
      xpc_object_t object = v7;
      if (v7)
      {
        xpc_retain(v7);
        uint64_t v8 = *((void *)a1 + 7);
        if (!v8) {
          goto LABEL_11;
        }
      }
      else
      {
        xpc_object_t object = xpc_null_create();
        uint64_t v8 = *((void *)a1 + 7);
        if (!v8) {
          goto LABEL_11;
        }
      }
      if ((char *)v8 == a1 + 32)
      {
        uint64_t v14 = v13;
        (*(void (**)(uint64_t, void *))(*(void *)v8 + 24))(v8, v13);
        goto LABEL_13;
      }
      uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
LABEL_11:
      uint64_t v14 = (void *)v8;
LABEL_13:
      (*(void (**)(uint64_t, xpc_object_t *, void *))(*(void *)v6 + 24))(v6, &object, v13);
      if (v14 == v13)
      {
        (*(void (**)(void *))(v13[0] + 32))(v13);
      }
      else if (v14)
      {
        (*(void (**)(void *))(*v14 + 40))(v14);
      }
      xpc_release(object);
      xpc_object_t object = 0;
    }
  }
  if (atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_19;
  }
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  long long v9 = a1 + 32;
  uint64_t v10 = (char *)*((void *)a1 + 7);
  if (v10 == a1 + 32) {
    goto LABEL_23;
  }
LABEL_20:
  if (v10) {
    (*(void (**)(char *))(*(void *)v10 + 40))(v10);
  }
LABEL_24:
  xpc_release(*((xpc_object_t *)a1 + 3));
  *((void *)a1 + 3) = 0;
  uint64_t v11 = (std::__shared_weak_count *)*((void *)a1 + 2);
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  operator delete(a1);
}

void sub_247E93A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  xpc_release(v15);
  if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  uint64_t v17 = *(void *)(v13 + 56);
  if (v17 == v13 + 32)
  {
    (*(void (**)(uint64_t))(*(void *)(v13 + 32) + 32))(v13 + 32);
  }
  else if (v17)
  {
    (*(void (**)(uint64_t))(*(void *)v17 + 40))(v17);
  }
  xpc_release(*(xpc_object_t *)(v13 + 24));
  *(void *)(v13 + 24) = 0;
  long long v18 = *(std::__shared_weak_count **)(v13 + 16);
  if (v18) {
    std::__shared_weak_count::__release_weak(v18);
  }
  operator delete((void *)v13);
  _Unwind_Resume(a1);
}

void sub_247E93BDC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void dispatch::async<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0,std::default_delete<abb::link::LocalServerLink::handleClientError(xpc::object)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2)
  {
    uint64_t v3 = *__p;
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      xpc_object_t v5 = v4;
      if (__p[1])
      {
        uint64_t v6 = *(void *)(v3 + 56);
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 32))(v6);
        }
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    xpc_object_t v7 = (std::__shared_weak_count *)__p[2];
    if (v7) {
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  operator delete(__p);
}

void sub_247E93CC8(_Unwind_Exception *a1)
{
  if (atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v4 = (std::__shared_weak_count *)v1[2];
    if (!v4) {
      goto LABEL_3;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v4 = (std::__shared_weak_count *)v1[2];
    if (!v4)
    {
LABEL_3:
      operator delete(v1);
      _Unwind_Resume(a1);
    }
  }
  std::__shared_weak_count::__release_weak(v4);
  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *abb::link::XpcLinkAccepter::Configuration::Configuration(std::string *this, long long *a2)
{
  uint64_t v2 = this;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    return v2;
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  return this;
}

{
  std::string *v2;
  long long v3;

  uint64_t v2 = this;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    return v2;
  }
  else
  {
    long long v3 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v3;
  }
  return this;
}

uint64_t abb::link::XpcLinkAccepter::Configuration::isEntitled(uint64_t *a1, void *a2)
{
  if (MEMORY[0x24C56ED30](*a2) != MEMORY[0x263EF86F0]) {
    return 0;
  }
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    if (*((unsigned char *)a1 + 23)) {
      goto LABEL_5;
    }
    return 1;
  }
  if (!a1[1]) {
    return 1;
  }
LABEL_5:
  xpc_connection_get_audit_token();
  uint64_t v4 = (void *)xpc_copy_entitlement_for_token();
  uint64_t v5 = MEMORY[0x263EF8708];
  if (v4 || (uint64_t v4 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x24C56ED30](v4) == v5)
    {
      xpc_retain(v4);
      xpc_object_t v6 = v4;
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    uint64_t v4 = 0;
  }
  xpc_release(v4);
  if (MEMORY[0x24C56ED30](v6) != v5) {
    goto LABEL_14;
  }
  if (*((char *)a1 + 23) < 0) {
    a1 = (uint64_t *)*a1;
  }
  if (xpc_dictionary_get_value(v6, (const char *)a1)
    && (xpc_object_t v8 = xpc_dictionary_get_value(v6, (const char *)a1), MEMORY[0x24C56ED30](v8) == MEMORY[0x263EF86E0]))
  {
    xpc_object_t value = xpc_dictionary_get_value(v6, (const char *)a1);
    BOOL v7 = xpc_BOOL_get_value(value);
  }
  else
  {
LABEL_14:
    BOOL v7 = 0;
  }
  xpc_release(v6);
  return v7;
}

void sub_247E93FA0(_Unwind_Exception *a1)
{
  xpc_release(v1);
  _Unwind_Resume(a1);
}

void abb::link::XpcLinkAccepter::create(xpc_object_t *a1@<X0>, dispatch_object_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  xpc_object_t v8 = operator new(0x50uLL);
  xpc_object_t v14 = *a1;
  *a1 = xpc_null_create();
  dispatch_object_t object = *a2;
  *a2 = 0;
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  abb::link::XpcLinkAccepter::XpcLinkAccepter((uint64_t)v8, &v14, &object, (long long *)&__p);
  *a4 = v8;
  long long v9 = (std::__shared_weak_count *)operator new(0x20uLL);
  v9->__shared_owners_ = 0;
  p_shared_owners = &v9->__shared_owners_;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FC1F920;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  a4[1] = v9;
  uint64_t v11 = (std::__shared_weak_count *)*((void *)v8 + 2);
  if (!v11)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v8 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = v8;
    *((void *)v8 + 2) = v9;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v11->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v8 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = v8;
    *((void *)v8 + 2) = v9;
    std::__shared_weak_count::__release_weak(v11);
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_9:
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
LABEL_10:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (object) {
    dispatch_release(object);
  }
  xpc_release(v14);
}

void sub_247E94164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, dispatch_object_t object, xpc_object_t a17)
{
  if (object) {
    dispatch_release(object);
  }
  xpc_release(a17);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void xpc::connection::~connection(xpc_object_t *this)
{
  *this = 0;
}

uint64_t abb::link::XpcLinkAccepter::XpcLinkAccepter(uint64_t a1, xpc_object_t *a2, void *a3, long long *a4)
{
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = &unk_26FC1F7B8;
  *(void *)(a1 + 24) = *a2;
  *a2 = xpc_null_create();
  *(void *)(a1 + 32) = *a3;
  *a3 = 0;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 40), *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v7 = *a4;
    *(void *)(a1 + 56) = *((void *)a4 + 2);
    *(_OWORD *)(a1 + 40) = v7;
  }
  *(void *)(a1 + 64) = 0;
  xpc_object_t object = xpc_null_create();
  MEMORY[0x24C56EA80](a1 + 72, &object);
  xpc_release(object);
  return a1;
}

void sub_247E94300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  uint64_t v13 = *(NSObject **)(v10 + 32);
  if (v13)
  {
    dispatch_release(v13);
    xpc::connection::~connection(v11);
    xpc_object_t v14 = *(std::__shared_weak_count **)(v10 + 16);
    if (!v14) {
LABEL_3:
    }
      _Unwind_Resume(a1);
  }
  else
  {
    xpc::connection::~connection(v11);
    xpc_object_t v14 = *(std::__shared_weak_count **)(v10 + 16);
    if (!v14) {
      goto LABEL_3;
    }
  }
  std::__shared_weak_count::__release_weak(v14);
  _Unwind_Resume(a1);
}

void abb::link::XpcLinkAccepter::createClientLink(NSObject **this@<X0>, void *a2@<X8>)
{
  long long v3 = (abb::link::XpcLinkAccepter *)this;
  uint64_t v2 = this[4];
  *a2 = 0;
  a2[1] = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN8dispatch9sync_implIZN3abb4link15XpcLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_tmp;
  block[4] = a2;
  block[5] = &v3;
  dispatch_sync(v2, block);
}

void abb::link::XpcLinkAccepter::startAccepting(abb::link::XpcLinkAccepter *this)
{
  uint64_t v2 = *((void *)this + 4);
  long long v3 = operator new(8uLL);
  void *v3 = this;
  dispatch_async_f(v2, v3, (dispatch_function_t)dispatch::async<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcLinkAccepter::startAccepting(void)::$_0,std::default_delete<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>>)::{lambda(void *)#1}::__invoke);
}

uint64_t abb::link::XpcLinkAccepter::handleNewClient(uint64_t a1, xpc_connection_t *a2)
{
  if (MEMORY[0x24C56ED30](*a2) != MEMORY[0x263EF86F0]) {
    return 0;
  }
  xpc_connection_get_pid(*a2);
  uint64_t v4 = *a2;
  uint64_t v20 = v4;
  if (v4)
  {
    xpc_retain(v4);
  }
  else
  {
    uint64_t v4 = xpc_null_create();
    uint64_t v20 = v4;
  }
  char isEntitled = abb::link::XpcLinkAccepter::Configuration::isEntitled((uint64_t *)(a1 + 40), &v20);
  xpc_release(v4);
  uint64_t v20 = 0;
  if ((isEntitled & 1) == 0) {
    return 0;
  }
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  HIBYTE(v22) = 11;
  strcpy((char *)&handler, "client-name");
  xpc_connection_t v6 = *a2;
  xpc_object_t object = v6;
  if (v6) {
    xpc_retain(v6);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abb::link::XpcServerLink::create((uint64_t)&handler, &object, &v18);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((SHIBYTE(v22) & 0x80000000) == 0)
  {
    xpc_object_t v8 = *(xpc_object_t *)(v18 + 56);
    if (v8) {
      goto LABEL_12;
    }
LABEL_33:
    xpc_object_t v8 = xpc_null_create();
    unint64_t v9 = v18;
    uint64_t v10 = *(NSObject **)(v18 + 64);
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  operator delete((void *)handler);
  xpc_object_t v8 = *(xpc_object_t *)(v18 + 56);
  if (!v8) {
    goto LABEL_33;
  }
LABEL_12:
  xpc_retain(v8);
  unint64_t v9 = v18;
  uint64_t v10 = *(NSObject **)(v18 + 64);
  if (v10)
  {
LABEL_13:
    dispatch_retain(v10);
    unint64_t v9 = v18;
  }
LABEL_14:
  uint64_t v11 = (std::__shared_weak_count *)v19;
  if (v19) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 16), 1uLL, memory_order_relaxed);
  }
  *(void *)&long long handler = MEMORY[0x263EF8330];
  *((void *)&handler + abb::link::LocalClientLink::~LocalClientLink(this - 1) = 1174405120;
  xpc_object_t v22 = ___ZNK3ctu15XpcServerHelper12acceptClientIN3abb4link13XpcServerLinkEEEvN3xpc10connectionEN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke;
  v23 = &__block_descriptor_tmp_11;
  unint64_t v24 = v9;
  v25 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v26 = v8;
  xpc_connection_set_event_handler((xpc_connection_t)v8, &handler);
  xpc_connection_set_target_queue((xpc_connection_t)v8, v10);
  xpc_connection_resume((xpc_connection_t)v8);
  if (v25) {
    std::__shared_weak_count::__release_weak(v25);
  }
  if (v11) {
    std::__shared_weak_count::__release_weak(v11);
  }
  if (v10) {
    dispatch_release(v10);
  }
  xpc_release(v8);
  uint64_t v12 = *(void *)(a1 + 64);
  unint64_t v15 = v18;
  uint64_t v16 = (std::__shared_weak_count *)v19;
  if (v19) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, unint64_t *))(*(void *)v12 + 16))(v12, &v15);
  uint64_t v13 = v16;
  if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  xpc_object_t v14 = (std::__shared_weak_count *)v19;
  if (!v19 || atomic_fetch_add((atomic_ullong *volatile)(v19 + 8), 0xFFFFFFFFFFFFFFFFLL)) {
    return 1;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  return 1;
}

void sub_247E947C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_247E947E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24)
{
  if (a24)
  {
    std::__shared_weak_count::__release_weak(a24);
    if (!v26)
    {
LABEL_3:
      if (!v25) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v26)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v26);
  if (!v25)
  {
LABEL_5:
    xpc_release(v24);
    std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
    _Unwind_Resume(a1);
  }
LABEL_4:
  dispatch_release(v25);
  goto LABEL_5;
}

void sub_247E94868()
{
  xpc_release(v0);
  JUMPOUT(0x247E94874);
}

void abb::link::LocalLinkAccepter::create(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x28uLL);
  uint64_t v5 = *a1;
  *a1 = 0;
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = &unk_26FC1F7E8;
  v4[3] = v5;
  v4[4] = 0;
  *a2 = v4;
  uint64_t v6 = (atomic_ullong *)operator new(0x20uLL);
  long long v7 = (std::__shared_weak_count *)v6;
  v6[2] = 0;
  v6[1] = 0;
  atomic_ullong *v6 = (atomic_ullong)&unk_26FC1F9D0;
  v6[3] = (atomic_ullong)v4;
  a2[1] = v6;
  atomic_fetch_add_explicit(v6 + 1, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(v6 + 2, 1uLL, memory_order_relaxed);
  v4[1] = v4;
  v4[2] = v6;
  if (!atomic_fetch_add(v6 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(atomic_ullong *))(*v6 + 16))(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
}

void sub_247E949A0(_Unwind_Exception *a1)
{
  abb::link::LocalLinkAccepter::~LocalLinkAccepter(v1);
  _Unwind_Resume(a1);
}

void *abb::link::LocalLinkAccepter::LocalLinkAccepter(void *result, void *a2)
{
  result[1] = 0;
  result[2] = 0;
  *uint64_t result = &unk_26FC1F7E8;
  result[3] = *a2;
  *a2 = 0;
  result[4] = 0;
  return result;
}

{
  result[1] = 0;
  result[2] = 0;
  *uint64_t result = &unk_26FC1F7E8;
  result[3] = *a2;
  *a2 = 0;
  result[4] = 0;
  return result;
}

void abb::link::LocalLinkAccepter::createClientLink(NSObject **this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (abb::link::LocalLinkAccepter *)this;
  uint64_t v2 = this[3];
  *a2 = 0;
  a2[1] = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN8dispatch9sync_implIZN3abb4link17LocalLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_tmp_12;
  block[4] = a2;
  block[5] = &v3;
  dispatch_sync(v2, block);
}

void abb::link::LocalLinkAccepter::handleNewClient(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[1];
  uint64_t v6 = (std::__shared_weak_count *)a1[2];
  if (v6)
  {
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *(void *)&long long v11 = a1;
    *((void *)&v11 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = v5;
    uint64_t v12 = v6;
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      std::string __p = *(std::string *)a2;
      goto LABEL_6;
    }
  }
  else
  {
    *(void *)&long long v11 = a1;
    *((void *)&v11 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = a1[1];
    uint64_t v12 = 0;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0) {
      goto LABEL_3;
    }
  }
  std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
LABEL_6:
  uint64_t v7 = a3[1];
  *(void *)&long long v14 = *a3;
  *((void *)&v14 + abb::link::LocalClientLink::~LocalClientLink(this - 1) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v8 = a1[3];
  unint64_t v9 = (std::string *)operator new(0x40uLL);
  *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  v9->__r_.__value_.__r.__words[2] = (std::string::size_type)v12;
  v9[1] = __p;
  memset(&__p, 0, sizeof(__p));
  *(_OWORD *)&v9[2].__r_.__value_.__l.__data_ = v14;
  long long v14 = 0uLL;
  dispatch_async_f(v8, v9, (dispatch_function_t)dispatch::async<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0,std::default_delete<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>>)::{lambda(void *)#1}::__invoke);
  uint64_t v10 = (std::__shared_weak_count *)*((void *)&v14 + 1);
  if (!*((void *)&v14 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v14 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_11:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_12:
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_247E94C48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11)
  {
    std::__shared_weak_count::__release_weak(a11);
    if (!v11) {
LABEL_3:
    }
      _Unwind_Resume(exception_object);
  }
  else if (!v11)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v11);
  _Unwind_Resume(exception_object);
}

void abb::link::XpcLinkAccepter::~XpcLinkAccepter(abb::link::XpcLinkAccepter *this)
{
  *(void *)this = &unk_26FC1F7B8;
  MEMORY[0x24C56EA90]((char *)this + 72);
  uint64_t v2 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    dispatch_release(v3);
  }
  xpc_release(*((xpc_object_t *)this + 3));
  *((void *)this + 3) = 0;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

{
  uint64_t v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t vars8;

  *(void *)this = &unk_26FC1F7B8;
  MEMORY[0x24C56EA90]((char *)this + 72);
  uint64_t v2 = *((void *)this + 8);
  *((void *)this + 8) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*((char *)this + 63) < 0) {
    operator delete(*((void **)this + 5));
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    dispatch_release(v3);
  }
  xpc_release(*((xpc_object_t *)this + 3));
  *((void *)this + 3) = 0;
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(this);
}

void abb::link::LocalLinkAccepter::~LocalLinkAccepter(abb::link::LocalLinkAccepter *this)
{
  *(void *)this = &unk_26FC1F7E8;
  uint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
}

{
  uint64_t v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  uint64_t vars8;

  *(void *)this = &unk_26FC1F7E8;
  uint64_t v2 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(this);
}

void std::__shared_ptr_pointer<abb::link::XpcLinkAccepter *,std::shared_ptr<abb::link::XpcLinkAccepter>::__shared_ptr_default_delete<abb::link::XpcLinkAccepter,abb::link::XpcLinkAccepter>,std::allocator<abb::link::XpcLinkAccepter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcLinkAccepter *,std::shared_ptr<abb::link::XpcLinkAccepter>::__shared_ptr_default_delete<abb::link::XpcLinkAccepter,abb::link::XpcLinkAccepter>,std::allocator<abb::link::XpcLinkAccepter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<abb::link::XpcLinkAccepter *,std::shared_ptr<abb::link::XpcLinkAccepter>::__shared_ptr_default_delete<abb::link::XpcLinkAccepter,abb::link::XpcLinkAccepter>,std::allocator<abb::link::XpcLinkAccepter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000247E987D1) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000247E987D1 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000247E987D1)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000247E987D1 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void ___ZN8dispatch9sync_implIZN3abb4link15XpcLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(_xpc_connection_s **)(**(void **)(a1 + 40) + 24);
  unint64_t v9 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  xpc_object_t object = xpc_endpoint_create(v2);
  if (!object) {
    xpc_object_t object = xpc_null_create();
  }
  abb::link::XpcClientLink::create(&object, &v9);
  xpc_release(object);
  xpc_object_t object = 0;
  unint64_t v4 = v9;
  unint64_t v3 = v10;
  if (v10)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    uint64_t v5 = (std::__shared_weak_count *)v10;
    if (v10)
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)(v10 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  uint64_t v6 = *(unint64_t **)(a1 + 32);
  uint64_t v7 = (std::__shared_weak_count *)v6[1];
  unint64_t *v6 = v4;
  v6[1] = v3;
  if (v7)
  {
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

void sub_247E95120(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void dispatch::async<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::XpcLinkAccepter::startAccepting(void)::$_0,std::default_delete<abb::link::XpcLinkAccepter::startAccepting(void)::$_0>>)::{lambda(void *)#1}::__invoke(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *(void **)(*a1 + 24);
  xpc_object_t object = v3;
  if (v3) {
    xpc_retain(v3);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  unint64_t v4 = (xpc_connection_t *)(v2 + 72);
  ctu::XpcServerHelper::setListener();
  xpc_release(object);
  uint64_t v5 = *(NSObject **)(v2 + 32);
  if (v5) {
    dispatch_retain(*(dispatch_object_t *)(v2 + 32));
  }
  uint64_t v7 = *(void *)(v2 + 8);
  uint64_t v6 = *(std::__shared_weak_count **)(v2 + 16);
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  if (MEMORY[0x24C56ED30](*v4) == MEMORY[0x263EF86F0])
  {
    xpc_object_t v8 = *v4;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 1174405120;
    handler[2] = ___ZN3ctu15XpcServerHelper13startListenerIN3abb4link15XpcLinkAccepterEEEvN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke;
    handler[3] = &__block_descriptor_tmp_10;
    void handler[4] = v4;
    handler[5] = v7;
    long long v11 = v6;
    if (v6) {
      atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v12 = v8;
    xpc_connection_set_event_handler(v8, handler);
    xpc_connection_set_target_queue(*v4, v5);
    xpc_connection_resume(*v4);
    if (v11) {
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v6) {
    std::__shared_weak_count::__release_weak(v6);
  }
  if (v5) {
    dispatch_release(v5);
  }
  operator delete(a1);
}

void sub_247E95298(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17)
  {
    std::__shared_weak_count::__release_weak(a17);
    if (!v19)
    {
LABEL_3:
      if (!v18)
      {
LABEL_8:
        operator delete(v17);
        _Unwind_Resume(a1);
      }
LABEL_7:
      dispatch_release(v18);
      operator delete(v17);
      _Unwind_Resume(a1);
    }
  }
  else if (!v19)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v19);
  if (!v18) {
    goto LABEL_8;
  }
  goto LABEL_7;
}

void ___ZN3ctu15XpcServerHelper13startListenerIN3abb4link15XpcLinkAccepterEEEvN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke(void *a1, xpc_object_t a2)
{
  unint64_t v3 = (ctu::XpcServerHelper *)a1[4];
  uint64_t v14 = 0;
  unint64_t v15 = 0;
  unint64_t v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    unint64_t v15 = std::__shared_weak_count::lock(v4);
    if (!v15) {
      return;
    }
    uint64_t v6 = a1[5];
    uint64_t v14 = v6;
    if (v6)
    {
      uint64_t v7 = MEMORY[0x24C56ED30](a2);
      uint64_t v8 = MEMORY[0x263EF86F0];
      if (v7 != MEMORY[0x263EF86F0])
      {
        if (v7 == MEMORY[0x263EF8720] && *(void *)ctu::XpcServerHelper::getListener(v3) == a1[7])
        {
          if (a2) {
            xpc_retain(a2);
          }
          else {
            a2 = xpc_null_create();
          }
          xpc_release(a2);
        }
        goto LABEL_21;
      }
      if (a2)
      {
        xpc_retain(a2);
        xpc_connection_t v13 = (xpc_connection_t)a2;
        unint64_t v9 = (_xpc_connection_s *)a2;
      }
      else
      {
        unint64_t v9 = (_xpc_connection_s *)xpc_null_create();
        xpc_connection_t v13 = v9;
        if (!v9)
        {
          unint64_t v10 = (_xpc_connection_s *)xpc_null_create();
          unint64_t v9 = 0;
          goto LABEL_16;
        }
      }
      if (MEMORY[0x24C56ED30](v9) == v8)
      {
        xpc_retain(v9);
        unint64_t v10 = v9;
        goto LABEL_17;
      }
      unint64_t v10 = (_xpc_connection_s *)xpc_null_create();
LABEL_16:
      xpc_connection_t v13 = v10;
LABEL_17:
      char v11 = abb::link::XpcLinkAccepter::handleNewClient(v6, &v13);
      xpc_release(v10);
      xpc_connection_t v13 = 0;
      xpc_release(v9);
      if ((v11 & 1) == 0) {
        xpc_connection_cancel((xpc_connection_t)a2);
      }
    }
  }
LABEL_21:
  uint64_t v12 = v15;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
}

void sub_247E954E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<void const>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c51_ZTSNSt3__18weak_ptrIN3abb4link15XpcLinkAccepterEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c51_ZTSNSt3__18weak_ptrIN3abb4link15XpcLinkAccepterEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZNK3ctu15XpcServerHelper12acceptClientIN3abb4link13XpcServerLinkEEEvN3xpc10connectionEN8dispatch5queueENSt3__18weak_ptrIT_EE_block_invoke(void *a1, xpc_object_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[5];
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    unint64_t v15 = v5;
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = (void *)a1[4];
      v14[1] = v7;
      if (!v7) {
        goto LABEL_23;
      }
      uint64_t v8 = MEMORY[0x24C56ED30](a2);
      uint64_t v9 = MEMORY[0x263EF8708];
      if (v8 != MEMORY[0x263EF8708])
      {
        if (v8 != MEMORY[0x263EF8720]) {
          goto LABEL_23;
        }
        unint64_t v10 = (void *)a1[6];
        v14[0] = v10;
        if (v10)
        {
          xpc_retain(v10);
          xpc_object_t object = a2;
          if (a2)
          {
LABEL_8:
            xpc_retain(a2);
LABEL_19:
            abb::link::XpcServerLink::handleClientError(v7);
            xpc_release(object);
            xpc_release(v14[0]);
LABEL_23:
            if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
              std::__shared_weak_count::__release_weak(v6);
            }
            return;
          }
        }
        else
        {
          xpc_object_t object = a2;
          v14[0] = xpc_null_create();
          if (a2) {
            goto LABEL_8;
          }
        }
        xpc_object_t object = xpc_null_create();
        goto LABEL_19;
      }
      char v11 = (void *)a1[6];
      v14[0] = v11;
      if (v11)
      {
        xpc_retain(v11);
        if (a2)
        {
LABEL_11:
          xpc_retain(a2);
          xpc_object_t object = a2;
          goto LABEL_14;
        }
      }
      else
      {
        v14[0] = xpc_null_create();
        if (a2) {
          goto LABEL_11;
        }
      }
      a2 = xpc_null_create();
      xpc_object_t object = a2;
      if (!a2)
      {
        xpc_object_t v12 = xpc_null_create();
        a2 = 0;
        goto LABEL_21;
      }
LABEL_14:
      if (MEMORY[0x24C56ED30](a2) == v9)
      {
        xpc_retain(a2);
        goto LABEL_22;
      }
      xpc_object_t v12 = xpc_null_create();
LABEL_21:
      xpc_object_t object = v12;
LABEL_22:
      abb::link::XpcServerLink::handleClientMessage(v7, (uint64_t)v14, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(a2);
      xpc_release(v14[0]);
      uint64_t v6 = v15;
      if (!v15) {
        return;
      }
      goto LABEL_23;
    }
  }
}

void sub_247E95744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10, char a11)
{
}

uint64_t __copy_helper_block_e8_32c49_ZTSNSt3__18weak_ptrIN3abb4link13XpcServerLinkEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c49_ZTSNSt3__18weak_ptrIN3abb4link13XpcServerLinkEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void std::__shared_ptr_pointer<abb::link::LocalLinkAccepter *,std::shared_ptr<abb::link::LocalLinkAccepter>::__shared_ptr_default_delete<abb::link::LocalLinkAccepter,abb::link::LocalLinkAccepter>,std::allocator<abb::link::LocalLinkAccepter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalLinkAccepter *,std::shared_ptr<abb::link::LocalLinkAccepter>::__shared_ptr_default_delete<abb::link::LocalLinkAccepter,abb::link::LocalLinkAccepter>,std::allocator<abb::link::LocalLinkAccepter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<abb::link::LocalLinkAccepter *,std::shared_ptr<abb::link::LocalLinkAccepter>::__shared_ptr_default_delete<abb::link::LocalLinkAccepter,abb::link::LocalLinkAccepter>,std::allocator<abb::link::LocalLinkAccepter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000247E988B6) {
    return a1 + 24;
  }
  if (((v3 & 0x8000000247E988B6 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000247E988B6)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000247E988B6 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void ___ZN8dispatch9sync_implIZN3abb4link17LocalLinkAccepter16createClientLinkEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEP16dispatch_queue_sOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 40);
  unint64_t v12 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = operator new(0x68uLL);
  v3[2] = 0;
  v3[3] = 0;
  void *v3 = &unk_26FC1F010;
  v3[1] = &unk_26FC1F070;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  *((_OWORD *)v3 + 5) = 0u;
  *((unsigned char *)v3 + 96) = 0;
  std::shared_ptr<abb::link::LocalClientLink>::shared_ptr[abi:ne180100]<abb::link::LocalClientLink,void>(&v12, (uint64_t)v3);
  unint64_t v4 = v12;
  uint64_t v6 = *(void *)(v2 + 8);
  uint64_t v5 = *(void *)(v2 + 16);
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v4 + 48);
  *(void *)(v4 + 40) = v6;
  *(void *)(v4 + 48) = v5;
  if (v7)
  {
    std::__shared_weak_count::__release_weak(v7);
    unint64_t v4 = v12;
  }
  unint64_t v8 = v13;
  if (v13)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v13 + 8), 1uLL, memory_order_relaxed);
    uint64_t v9 = (std::__shared_weak_count *)v13;
    if (v13)
    {
      if (!atomic_fetch_add((atomic_ullong *volatile)(v13 + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
  unint64_t v10 = *(unint64_t **)(a1 + 32);
  char v11 = (std::__shared_weak_count *)v10[1];
  unint64_t *v10 = v4;
  v10[1] = v8;
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void dispatch::async<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>(dispatch_queue_s *,std::unique_ptr<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0,std::default_delete<abb::link::LocalLinkAccepter::handleNewClient(std::string const&,std::shared_ptr<abb::link::ClientHandleBase>)::$_0>>)::{lambda(void *)#1}::__invoke(char *__p)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)__p + 2);
  if (v2)
  {
    uint64_t v3 = *(void *)__p;
    unint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      if (*((void *)__p + 1))
      {
        unint64_t v25 = 0xAAAAAAAAAAAAAAAALL;
        unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
        abb::link::LocalServerLink::create((uint64_t)(__p + 24), &v25);
        unint64_t v6 = v25;
        uint64_t v8 = *((void *)__p + 6);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)__p + 7);
        if (v7)
        {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
          atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        }
        uint64_t v9 = operator new(0x18uLL);
        void *v9 = &unk_26FC1FA20;
        v9[1] = v8;
        v9[2] = v7;
        if (v7)
        {
          atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
          std::__shared_weak_count::__release_weak(v7);
        }
        uint64_t v10 = *(void *)(v6 + 64);
        *(void *)(v6 + 64) = v9;
        if (v10) {
          (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
        }
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
        uint64_t v11 = *((void *)__p + 6);
        unint64_t v12 = (std::__shared_weak_count *)*((void *)__p + 7);
        if (v11) {
          uint64_t v13 = v11 - 8;
        }
        else {
          uint64_t v13 = 0;
        }
        if (v12) {
          atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        unint64_t v15 = v25;
        unint64_t v14 = v26;
        if (v26) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v26 + 16), 1uLL, memory_order_relaxed);
        }
        uint64_t v16 = operator new(0x18uLL);
        *uint64_t v16 = &unk_26FC1FA70;
        v16[1] = v15;
        v16[2] = v14;
        uint64_t v17 = *(void *)(v13 + 32);
        *(void *)(v13 + 32) = v16;
        if (v17)
        {
          (*(void (**)(uint64_t))(*(void *)v17 + 8))(v17);
          unint64_t v15 = v25;
          unint64_t v14 = v26;
        }
        uint64_t v18 = *(void *)(v3 + 32);
        unint64_t v23 = v15;
        unint64_t v24 = (std::__shared_weak_count *)v14;
        if (v14) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
        }
        (*(void (**)(uint64_t, unint64_t *))(*(void *)v18 + 16))(v18, &v23);
        unint64_t v19 = v24;
        if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
          std::__shared_weak_count::__release_weak(v19);
        }
        if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
        uint64_t v20 = (std::__shared_weak_count *)v26;
        if (v26 && !atomic_fetch_add((atomic_ullong *volatile)(v26 + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
        }
      }
      if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
  uint64_t v21 = (std::__shared_weak_count *)*((void *)__p + 7);
  if (!v21 || atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((__p[47] & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
  std::__shared_weak_count::__release_weak(v21);
  if (__p[47] < 0) {
LABEL_38:
  }
    operator delete(*((void **)__p + 3));
LABEL_39:
  xpc_object_t v22 = (std::__shared_weak_count *)*((void *)__p + 2);
  if (v22) {
    std::__shared_weak_count::__release_weak(v22);
  }
  operator delete(__p);
}

void sub_247E95E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10 && !atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
    std::__shared_weak_count::__release_weak(a10);
  }
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  if (a12 && !atomic_fetch_add(&a12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a12->__on_zero_shared)(a12);
    std::__shared_weak_count::__release_weak(a12);
  }
  if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  uint64_t v17 = *(std::__shared_weak_count **)(v12 + 56);
  if (v17)
  {
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (*(char *)(v12 + 47) < 0)
  {
    operator delete(*v14);
    uint64_t v18 = *(std::__shared_weak_count **)(v12 + 16);
    if (!v18)
    {
LABEL_17:
      operator delete((void *)v12);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    uint64_t v18 = *(std::__shared_weak_count **)(v12 + 16);
    if (!v18) {
      goto LABEL_17;
    }
  }
  std::__shared_weak_count::__release_weak(v18);
  operator delete((void *)v12);
  _Unwind_Resume(a1);
}

void *abb::link::ClientHandle<abb::link::ClientHandleBase>::~ClientHandle(void *a1)
{
  *a1 = &unk_26FC1FA20;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::~ClientHandle(void *__p)
{
  void *__p = &unk_26FC1FA20;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(__p);
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::handleServerMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    object[2] = v5;
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void **)(a1 + 8);
      object[1] = v7;
      if (v7)
      {
        object[0] = *a2;
        *a2 = xpc_null_create();
        (*(void (**)(void *, xpc_object_t *))(*(void *)v7 + 16))(v7, object);
        xpc_release(object[0]);
        object[0] = 0;
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_247E96188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::handleServerMessage(uint64_t a1, xpc_object_t *a2, dispatch_object_t *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (v5)
  {
    uint64_t v9 = std::__shared_weak_count::lock(v5);
    v15[2] = v9;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void **)(a1 + 8);
      v15[1] = v11;
      if (!v11) {
        goto LABEL_15;
      }
      v15[0] = *a2;
      *a2 = xpc_null_create();
      dispatch_object_t object = *a3;
      *a3 = 0;
      uint64_t v12 = (void *)a4[3];
      if (v12)
      {
        if (v12 == a4)
        {
          uint64_t v17 = v16;
          (*(void (**)(void *, void *))(*a4 + 24))(a4, v16);
        }
        else
        {
          uint64_t v17 = (void *)a4[3];
          a4[3] = 0;
        }
      }
      else
      {
        uint64_t v17 = 0;
      }
      (*(void (**)(void *, xpc_object_t *, dispatch_object_t *, void *))(*(void *)v11 + 24))(v11, v15, &object, v16);
      if (v17 == v16)
      {
        (*(void (**)(void *))(v16[0] + 32))(v16);
        uint64_t v13 = object;
        if (!object) {
          goto LABEL_14;
        }
      }
      else
      {
        if (v17) {
          (*(void (**)(void))(*v17 + 40))();
        }
        uint64_t v13 = object;
        if (!object) {
          goto LABEL_14;
        }
      }
      dispatch_release(v13);
LABEL_14:
      xpc_release(v15[0]);
      v15[0] = 0;
LABEL_15:
      if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
}

void sub_247E963BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, xpc_object_t a11, char a12, uint64_t a13, char a14)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void abb::link::ClientHandle<abb::link::ClientHandleBase>::handleServerError(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    object[2] = v5;
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void **)(a1 + 8);
      object[1] = v7;
      if (v7)
      {
        object[0] = *a2;
        *a2 = xpc_null_create();
        (*(void (**)(void *, xpc_object_t *))(*(void *)v7 + 32))(v7, object);
        xpc_release(object[0]);
        object[0] = 0;
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_247E9650C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
}

void *abb::link::ServerHandle<abb::link::LocalServerLink>::~ServerHandle(void *a1)
{
  *a1 = &unk_26FC1FA70;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::~ServerHandle(void *__p)
{
  void *__p = &unk_26FC1FA70;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(__p);
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::handleClientMessage(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    object[2] = v5;
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void **)(a1 + 8);
      object[1] = v7;
      if (v7)
      {
        object[0] = *a2;
        *a2 = xpc_null_create();
        abb::link::LocalServerLink::handleClientMessage(v7, object);
        xpc_release(object[0]);
        object[0] = 0;
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_247E966B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::handleClientMessage(uint64_t a1, xpc_object_t *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    uint64_t v7 = std::__shared_weak_count::lock(v4);
    object[2] = v7;
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void **)(a1 + 8);
      object[1] = v9;
      if (v9)
      {
        object[0] = *a2;
        *a2 = xpc_null_create();
        uint64_t v10 = (void *)a3[3];
        if (v10)
        {
          if (v10 == a3)
          {
            unint64_t v15 = v14;
            (*(void (**)(void *, void *))(*a3 + 24))(a3, v14);
          }
          else
          {
            unint64_t v15 = (void *)a3[3];
            a3[3] = 0;
          }
        }
        else
        {
          unint64_t v15 = 0;
        }
        abb::link::LocalServerLink::handleClientMessage(v9, object, v14);
        if (v15 == v14)
        {
          (*(void (**)(void *))(v14[0] + 32))(v14);
        }
        else if (v15)
        {
          (*(void (**)(void *, uint64_t, uint64_t))(*v15 + 40))(v15, v11, v12);
        }
        xpc_release(object[0]);
        object[0] = 0;
      }
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_247E96898(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, char a10, uint64_t a11, char a12)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void abb::link::ServerHandle<abb::link::LocalServerLink>::handleClientError(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      unint64_t v6 = v5;
      uint64_t v7 = *(void **)(a1 + 8);
      if (v7)
      {
        xpc_object_t object = *a2;
        *a2 = xpc_null_create();
        abb::link::LocalServerLink::handleClientError(v7);
        xpc_release(object);
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

void sub_247E969BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::XpcClientHelper::setServer()
{
  return MEMORY[0x270F973C0]();
}

void ctu::XpcClientHelper::~XpcClientHelper(ctu::XpcClientHelper *this)
{
}

uint64_t ctu::XpcServerHelper::setListener()
{
  return MEMORY[0x270F973D0]();
}

uint64_t ctu::XpcServerHelper::XpcServerHelper()
{
  return MEMORY[0x270F973D8]();
}

void ctu::XpcServerHelper::~XpcServerHelper(ctu::XpcServerHelper *this)
{
}

uint64_t ctu::XpcClientHelper::flush(ctu::XpcClientHelper *this, const group *a2)
{
  return MEMORY[0x270F978C0](this, a2);
}

uint64_t ctu::XpcServerHelper::getListener(ctu::XpcServerHelper *this)
{
  return MEMORY[0x270F978C8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x270EDBE48](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x270EDBE70]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x270EDBEA0](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x270EDC180](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}