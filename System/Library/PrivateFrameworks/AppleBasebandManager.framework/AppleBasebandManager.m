void __destroy_helper_block_e8_32c21_ZTSN8dispatch5groupE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(uint64_t a1)
{
  std::__shared_weak_count *v2;
  NSObject *v3;
  uint64_t vars8;

  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v3 = *(NSObject **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  else
  {
    v3 = *(NSObject **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  dispatch_release(v3);
}

void abm::client::PerformCommand(uint64_t *a1, int a2, void *a3, void *a4)
{
  if (*a1)
  {
    xpc_object_t v8 = xpc_null_create();
    v9 = v8;
    if (a4)
    {
      xpc_retain(a4);
      xpc_release(v9);
      uint64_t v10 = *a1;
      xpc_object_t object = a4;
    }
    else
    {
      uint64_t v10 = *a1;
      xpc_object_t object = v8;
      if (!v8)
      {
        xpc_object_t v11 = xpc_null_create();
        a4 = 0;
        goto LABEL_10;
      }
      a4 = v8;
    }
    if (MEMORY[0x1C878FBE0](a4) == MEMORY[0x1E4F14590])
    {
      xpc_retain(a4);
LABEL_11:
      abm::client::Manager::perform(v10, a2, a3, &object);
      xpc_release(object);
      xpc_object_t object = 0;
      xpc_release(a4);
      return;
    }
    xpc_object_t v11 = xpc_null_create();
LABEL_10:
    xpc_object_t object = v11;
    goto LABEL_11;
  }
}

void sub_1C57380AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32c21_ZTSN8dispatch5groupE40c48_ZTSNSt3__110shared_ptrIN12TelephonyXPC5EventEEE(void *a1, void *a2)
{
  v4 = a2[4];
  a1[4] = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  uint64_t v5 = a2[6];
  a1[5] = a2[5];
  a1[6] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
}

void abm::client::Manager::perform(uint64_t a1, int a2, void *aBlock, void **a4)
{
  if (!aBlock)
  {
    dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
LABEL_11:
    xpc_object_t v8 = 0;
    int v12 = 0;
    v20 = 0;
    dispatch_object_t object = 0;
    v16 = 0;
    v17 = 0;
    v13 = *a4;
    xpc_object_t v15 = *a4;
    if (!*a4) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  v7 = _Block_copy(aBlock);
  xpc_object_t v8 = v7;
  v20 = (void *)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  if (!v7) {
    goto LABEL_11;
  }
  aBlocka[0] = MEMORY[0x1E4F143A8];
  aBlocka[1] = 1174405120;
  aBlocka[2] = ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvEN3xpc4dictE_block_invoke;
  aBlocka[3] = &__block_descriptor_tmp_5_0;
  v19 = _Block_copy(v7);
  v9 = _Block_copy(aBlocka);
  uint64_t v10 = *(NSObject **)(a1 + 16);
  if (v10) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  v20 = v9;
  dispatch_object_t object = v10;
  if (v9)
  {
    xpc_object_t v11 = _Block_copy(v9);
    uint64_t v10 = object;
    v4 = (const void **)&v19;
    v16 = v11;
    v17 = object;
    if (!object) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v4 = (const void **)&v19;
  v16 = 0;
  v17 = v10;
  if (v10) {
LABEL_7:
  }
    dispatch_retain(v10);
LABEL_8:
  int v12 = 1;
  v13 = *a4;
  xpc_object_t v15 = *a4;
  if (!*a4)
  {
LABEL_9:
    xpc_object_t v15 = xpc_null_create();
    goto LABEL_13;
  }
LABEL_12:
  xpc_retain(v13);
LABEL_13:
  TelephonyXPC::Command::create();
  xpc_release(v15);
  if (v17) {
    dispatch_release(v17);
  }
  if (v16) {
    _Block_release(v16);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  TelephonyXPC::Client::perform();
  v14 = (std::__shared_weak_count *)v23;
  if (v23 && !atomic_fetch_add((atomic_ullong *volatile)(v23 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v20) {
    _Block_release(v20);
  }
  if (v12 && *v4) {
    _Block_release(*v4);
  }
  if (v8) {
    _Block_release(v8);
  }
}

void sub_1C5738428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, xpc_object_t object, char a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v24 - 80);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback((uint64_t)&a21);
  if ((v22 & 1) != 0 && *v23) {
    _Block_release(*v23);
  }
  if (v21) {
    _Block_release(v21);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client7Manager15setEventHandlerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvPvP16dispatch_group_sE_block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_object_t v12 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  TelephonyXPC::Event::getData((uint64_t *)&v12, *(TelephonyXPC::Event **)a2);
  v4 = dispatch_group_create();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1174405120;
  v8[2] = ___ZN3abm6client7Manager15setEventHandlerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvPvP16dispatch_group_sE_block_invoke_2;
  v8[3] = &__block_descriptor_tmp_7;
  dispatch_object_t object = v4;
  if (v4) {
    dispatch_retain(v4);
  }
  v6 = *(std::__shared_weak_count **)(a2 + 8);
  uint64_t v10 = *(TelephonyXPC::Event **)a2;
  xpc_object_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_group_notify(v4, global_queue, v8);
  v7 = v11;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }
  if (object) {
    dispatch_release(object);
  }
  if (v4) {
    dispatch_release(v4);
  }
  xpc_release(v12);
}

void sub_1C573860C(_Unwind_Exception *a1)
{
  if (v1) {
    dispatch_release(v1);
  }
  xpc_release(*(xpc_object_t *)(v2 - 40));
  _Unwind_Resume(a1);
}

void __destroy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEPvEEE(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *__copy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFvN12TelephonyXPC6ResultEPvEEE(uint64_t a1, uint64_t a2)
{
  result = *(void **)(a2 + 32);
  if (result) {
    result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvEN3xpc4dictE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *a2;
  if (*((char *)a2 + 31) < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
  }
  else {
    std::string __p = *(std::string *)(a2 + 2);
  }
  (*(void (**)(uint64_t, int *, uint64_t))(v4 + 16))(v4, &v5, v3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1C5738734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](uint64_t result)
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

const void **ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6512F28, MEMORY[0x1E4FBA1C8]);
}

void sub_1C5738864(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void __clang_call_terminate(void *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  int v5 = this;
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
    int v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t __cxx_global_var_init()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy, &ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance, &dword_1C5737000);
  }
  return result;
}

uint64_t ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

uint64_t __cxx_global_var_init_0()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>::~PthreadMutexGuardPolicy, &ctu::Singleton<support::log::shared_stdio,support::log::shared_stdio,ctu::PthreadMutexGuardPolicy<support::log::shared_stdio>>::sInstance, &dword_1C5737000);
  }
  return result;
}

void AppleBasebandManager::create(const void **a1@<X0>, const void **a2@<X1>, void *a3@<X8>)
{
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  int v5 = *a2;
  CFTypeRef cf = v5;
  if (v5) {
    CFRetain(v5);
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  block[4] = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce != -1)
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, block);
    std::string::size_type v6 = *(std::__shared_weak_count **)algn_1EB506B18;
    uint64_t v14 = ClientGetLogServer(void)::sLogServer;
    uint64_t v15 = *(void *)algn_1EB506B18;
    if (!*(void *)algn_1EB506B18) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string::size_type v6 = *(std::__shared_weak_count **)algn_1EB506B18;
  uint64_t v14 = ClientGetLogServer(void)::sLogServer;
  uint64_t v15 = *(void *)algn_1EB506B18;
  if (*(void *)algn_1EB506B18) {
LABEL_5:
  }
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_6:
  AppleBasebandManager::State::create(&v17, a1, v5, &v14);
  if (!v6 || atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v7 = cf;
    if (!cf) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
  std::__shared_weak_count::__release_weak(v6);
  CFTypeRef v7 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v7);
LABEL_10:
  xpc_object_t v8 = operator new(0x10uLL);
  v9 = (AppleBasebandManager::State *)v17;
  unint64_t v10 = v18;
  v13 = (std::__shared_weak_count *)v18;
  if (v18)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
    *xpc_object_t v8 = v9;
    v8[1] = v10;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    *xpc_object_t v8 = v17;
    v8[1] = 0;
  }
  AppleBasebandManager::State::init(v9);
  *a3 = v8;
  xpc_object_t v11 = operator new(0x20uLL);
  *xpc_object_t v11 = &unk_1F20ED1D8;
  v11[1] = 0;
  v11[2] = 0;
  v11[3] = v8;
  a3[1] = v11;
  if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
  }
  xpc_object_t v12 = (std::__shared_weak_count *)v18;
  if (v18)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v18 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_1C5738E40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  unint64_t v17 = *v15;
  if (v17)
  {
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1C5738EAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  unint64_t v17 = *v15;
  if (v17)
  {
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1C5738F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5738F2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::State::create(void *a1, const void **a2, const void *a3, uint64_t *a4)
{
  xpc_object_t v8 = (char *)operator new(0xB8uLL);
  CFTypeRef cf = a3;
  if (a3) {
    CFRetain(a3);
  }
  uint64_t v10 = *a4;
  v9 = (std::__shared_weak_count *)a4[1];
  v31 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)xpc_object_t v8 = &unk_1F20ECD70;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v33, "com.apple.telephony.abm", "AppleBasebandManager::State");
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  xpc_object_t v12 = dispatch_queue_create_with_target_V2("AppleBasebandManager::State", initially_inactive, 0);
  dispatch_set_qos_class_floor(v12, QOS_CLASS_DEFAULT, 0);
  dispatch_activate(v12);
  *((void *)v8 + 9) = 0;
  *((void *)v8 + 10) = 0;
  *((void *)v8 + 11) = v12;
  if (v12)
  {
    dispatch_retain(v12);
    *((void *)v8 + 12) = 0;
    dispatch_release(v12);
  }
  else
  {
    *((void *)v8 + 12) = 0;
  }
  *(void *)xpc_object_t v8 = &unk_1F20ECE80;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v36);
  *((void *)v8 + 1) = &unk_1F20ED228;
  *((void *)v8 + 7) = v10;
  *((void *)v8 + 8) = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v34);
  *(void *)xpc_object_t v8 = &unk_1F20ECE40;
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v33);
  *(void *)xpc_object_t v8 = &unk_1F20ECD70;
  *((void *)v8 + 13) = 0xAAAAAAAAAAAAAAAALL;
  int v13 = *((char *)a2 + 23);
  if (v13 >= 0) {
    size_t v14 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v14 = (size_t)a2[1];
  }
  unint64_t v15 = v14 + 7;
  *((void *)v8 + 14) = 0xAAAAAAAAAAAAAAAALL;
  *((void *)v8 + 15) = 0xAAAAAAAAAAAAAAAALL;
  if (v14 + 7 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v15 >= 0x17)
  {
    uint64_t v17 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v17 = v15 | 7;
    }
    uint64_t v18 = v17 + 1;
    v16 = operator new(v17 + 1);
    *((void *)v8 + 14) = v15;
    *((void *)v8 + 15) = v18 | 0x8000000000000000;
    *((void *)v8 + 13) = v16;
  }
  else
  {
    *((void *)v8 + 14) = 0;
    *((void *)v8 + 15) = 0;
    *((void *)v8 + 13) = 0;
    v16 = v8 + 104;
    v8[127] = v15;
    if (!v14) {
      goto LABEL_24;
    }
  }
  if (v13 >= 0) {
    v19 = a2;
  }
  else {
    v19 = *a2;
  }
  memmove(v16, v19, v14);
LABEL_24:
  strcpy((char *)v16 + v14, ".client");
  *((void *)v8 + 16) = a3;
  if (a3) {
    CFRetain(a3);
  }
  *((void *)v8 + 17) = 0;
  *((void *)v8 + 18) = 0;
  *((void *)v8 + 19) = 0;
  *((void *)v8 + 20) = v8 + 160;
  *((void *)v8 + 21) = v8 + 160;
  *((void *)v8 + 22) = 0;
  ctu::LoggerCommonBase::setLogLevel();
  *a1 = v8;
  a1[1] = 0xAAAAAAAAAAAAAAAALL;
  v20 = (std::__shared_weak_count *)operator new(0x20uLL);
  v20->__shared_owners_ = 0;
  p_shared_owners = &v20->__shared_owners_;
  v20->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20ECD20;
  v20->__shared_weak_owners_ = 0;
  v20[1].__vftable = (std::__shared_weak_count_vtbl *)v8;
  a1[1] = v20;
  char v22 = (std::__shared_weak_count *)*((void *)v8 + 10);
  if (!v22)
  {
    atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v20->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v8 + 9) = v8;
    *((void *)v8 + 10) = v20;
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_40;
    }
LABEL_31:
    unint64_t v23 = (void *)*a1;
    if (!*(void *)(*a1 + 56)) {
      goto LABEL_41;
    }
    goto LABEL_32;
  }
  if (v22->__shared_owners_ != -1) {
    goto LABEL_31;
  }
  atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v20->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *((void *)v8 + 9) = v8;
  *((void *)v8 + 10) = v20;
  std::__shared_weak_count::__release_weak(v22);
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_31;
  }
LABEL_40:
  ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
  std::__shared_weak_count::__release_weak(v20);
  unint64_t v23 = (void *)*a1;
  if (!*(void *)(*a1 + 56)) {
    goto LABEL_41;
  }
LABEL_32:
  uint64_t v24 = (std::__shared_weak_count *)v23[10];
  if (!v24 || (uint64_t v25 = v23[9], (v26 = std::__shared_weak_count::lock(v24)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v27 = v26;
  uint64_t v36 = v25;
  v37 = v26;
  ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v23 + 1));
  uint64_t v34 = v25;
  v35 = v27;
  uint64_t v36 = 0;
  v37 = 0;
  ctu::TrackedLogger::registerLoggerToServer();
  v28 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
  }
  v29 = v37;
  if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
LABEL_41:
  if (!v31 || atomic_fetch_add(&v31->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    v30 = cf;
    if (!cf) {
      return;
    }
    goto LABEL_44;
  }
  ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
  std::__shared_weak_count::__release_weak(v31);
  v30 = cf;
  if (cf) {
LABEL_44:
  }
    CFRelease(v30);
}

void sub_1C5739438(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va3, a2);
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  va_copy(va2, va1);
  CFTypeRef v7 = va_arg(va2, const void *);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  va_copy(va3, va2);
  uint64_t v11 = va_arg(va3, void);
  uint64_t v13 = va_arg(va3, void);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1C5739464(void *a1)
{
  __cxa_begin_catch(a1);
  dispatch_barrier_async_f(v1[11], v1, (dispatch_function_t)std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State*)#1}::operator() const(AppleBasebandManager::State*)::{lambda(void *)#1}::__invoke);
  __cxa_rethrow();
}

void sub_1C573948C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  __cxa_end_catch();
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1C57394A0()
{
  std::list<boost::signals2::connection>::~list(v3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v0 + 144);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(v2);
  if (*(char *)(v0 + 127) < 0) {
    operator delete(*v1);
  }
  ctu::SharedLoggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable((void *)v0);
  JUMPOUT(0x1C5739528);
}

void sub_1C57394D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va2);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va1);
  ctu::SharedSynchronizable<AppleBasebandManager::State>::~SharedSynchronizable(v4);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)va);
  JUMPOUT(0x1C5739524);
}

void sub_1C57394FC()
{
}

AppleBasebandManager::State **AppleBasebandManager::AppleBasebandManager(AppleBasebandManager::State **a1, uint64_t a2)
{
  uint64_t v3 = *(AppleBasebandManager::State **)a2;
  uint64_t v4 = *(atomic_ullong **)(a2 + 8);
  *a1 = *(AppleBasebandManager::State **)a2;
  a1[1] = (AppleBasebandManager::State *)v4;
  if (v4)
  {
    atomic_fetch_add_explicit(v4 + 1, 1uLL, memory_order_relaxed);
    uint64_t v3 = *a1;
  }
  AppleBasebandManager::State::init(v3);
  return a1;
}

{
  AppleBasebandManager::State *v3;
  atomic_ullong *v4;

  uint64_t v3 = *(AppleBasebandManager::State **)a2;
  uint64_t v4 = *(atomic_ullong **)(a2 + 8);
  *a1 = *(AppleBasebandManager::State **)a2;
  a1[1] = (AppleBasebandManager::State *)v4;
  if (v4)
  {
    atomic_fetch_add_explicit(v4 + 1, 1uLL, memory_order_relaxed);
    uint64_t v3 = *a1;
  }
  AppleBasebandManager::State::init(v3);
  return a1;
}

void sub_1C5739590(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

void AppleBasebandManager::create(const void **a1@<X0>, const void **a2@<X1>, uint64_t *a3@<X2>, void *a4@<X8>)
{
  if (*a3) {
    goto LABEL_2;
  }
  unint64_t block = MEMORY[0x1E4F143A8];
  unint64_t v24 = 0x40000000;
  uint64_t v25 = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v26 = &__block_descriptor_tmp_0;
  v27 = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce != -1)
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    uint64_t v16 = ClientGetLogServer(void)::sLogServer;
    uint64_t v15 = *(void *)algn_1EB506B18;
    if (!*(void *)algn_1EB506B18) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  uint64_t v16 = ClientGetLogServer(void)::sLogServer;
  uint64_t v15 = *(void *)algn_1EB506B18;
  if (*(void *)algn_1EB506B18) {
LABEL_14:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
LABEL_15:
  uint64_t v17 = (std::__shared_weak_count *)a3[1];
  *a3 = v16;
  a3[1] = v15;
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
LABEL_2:
  unint64_t block = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v24 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = *a2;
  CFTypeRef cf = v8;
  if (v8) {
    CFRetain(v8);
  }
  uint64_t v9 = *a3;
  uint64_t v10 = (std::__shared_weak_count *)a3[1];
  v21[0] = v9;
  v21[1] = (uint64_t)v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  AppleBasebandManager::State::create(&block, a1, v8, v21);
  if (!v10 || atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v11 = cf;
    if (!cf) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  CFTypeRef v11 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v11);
LABEL_10:
  xpc_object_t v12 = operator new(0x10uLL);
  uint64_t v13 = (AppleBasebandManager::State *)block;
  unint64_t v14 = v24;
  v20 = (std::__shared_weak_count *)v24;
  if (v24)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v24 + 8), 1uLL, memory_order_relaxed);
    *xpc_object_t v12 = v13;
    v12[1] = v14;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    *xpc_object_t v12 = block;
    v12[1] = 0;
  }
  AppleBasebandManager::State::init(v13);
  *a4 = v12;
  uint64_t v18 = operator new(0x20uLL);
  *uint64_t v18 = &unk_1F20ED1D8;
  v18[1] = 0;
  v18[2] = 0;
  v18[3] = v12;
  a4[1] = v18;
  if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  v19 = (std::__shared_weak_count *)v24;
  if (v24)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v24 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
}

void sub_1C57398DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v17 = *v15;
  if (v17)
  {
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1C5739948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  uint64_t v17 = *v15;
  if (v17)
  {
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void sub_1C57399B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C57399C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1C5739A28(_Unwind_Exception *a1)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::State::init(AppleBasebandManager::State *this)
{
  uint64_t v5 = *((void *)this + 9);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 10);
  uint64_t v4 = (char *)this + 72;
  if (!v3 || (uint64_t v6 = std::__shared_weak_count::lock(v3)) == 0) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 1174405120;
  v11[2] = ___ZN20AppleBasebandManager5State4initEv_block_invoke;
  v11[3] = &__block_descriptor_tmp_27;
  v11[4] = this;
  v11[5] = v5;
  xpc_object_t v12 = v7;
  uint64_t v13 = v11;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = v4;
  void block[5] = &v13;
  uint64_t v9 = *((void *)this + 11);
  if (!*((void *)this + 12))
  {
    dispatch_sync(v9, block);
    uint64_t v10 = v12;
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  dispatch_async_and_wait(v9, block);
  uint64_t v10 = v12;
  if (v12) {
LABEL_7:
  }
    std::__shared_weak_count::__release_weak(v10);
LABEL_8:
  std::__shared_weak_count::__release_weak(v7);
}

void AppleBasebandManager::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  ctu::cf::assign();
  uint64_t v5 = *a1;
  memset(&v10, 0, sizeof(v10));
  if (*(void *)a3)
  {
    uint64_t v6 = _Block_copy(*(const void **)a3);
    uint64_t v7 = *(NSObject **)(a3 + 8);
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(NSObject **)(a3 + 8);
  uint64_t v8 = 0;
  uint64_t v9 = v7;
  if (v7) {
LABEL_3:
  }
    dispatch_retain(v7);
LABEL_4:
  AppleBasebandManager::State::setEventHandler(v5, (uint64_t)&v10, (uint64_t)&v8);
  if (v7) {
    dispatch_release(v7);
  }
  if (v6) {
    _Block_release(v6);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
}

{
  uint64_t v4;
  const void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  std::string v10;

  uint64_t v4 = *a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    uint64_t v5 = *(const void **)a3;
    if (*(void *)a3)
    {
LABEL_3:
      uint64_t v6 = _Block_copy(v5);
      uint64_t v7 = *(NSObject **)(a3 + 8);
      uint64_t v8 = v6;
      uint64_t v9 = v7;
      if (!v7) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else
  {
    std::string v10 = *(std::string *)a2;
    uint64_t v5 = *(const void **)a3;
    if (*(void *)a3) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(NSObject **)(a3 + 8);
  uint64_t v8 = 0;
  uint64_t v9 = v7;
  if (v7) {
LABEL_4:
  }
    dispatch_retain(v7);
LABEL_5:
  AppleBasebandManager::State::setEventHandler(v4, (uint64_t)&v10, (uint64_t)&v8);
  if (v7) {
    dispatch_release(v7);
  }
  if (v6) {
    _Block_release(v6);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
}

void sub_1C5739CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  operator delete(v22);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::State::setEventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 1174405120;
  v9[2] = ___ZN20AppleBasebandManager5State15setEventHandlerENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS1_10shared_ptrIN3abm6client5EventEEEEEE_block_invoke;
  v9[3] = &__block_descriptor_tmp_55;
  v9[4] = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    uint64_t v5 = *(void **)a3;
    if (!*(void *)a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string __p = *(std::string *)a2;
  uint64_t v5 = *(void **)a3;
  if (*(void *)a3) {
LABEL_5:
  }
    uint64_t v5 = _Block_copy(v5);
LABEL_6:
  uint64_t v6 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v13 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = a1 + 72;
  void block[5] = &v13;
  uint64_t v7 = *(NSObject **)(a1 + 88);
  if (*(void *)(a1 + 96))
  {
    dispatch_async_and_wait(v7, block);
    uint64_t v8 = object;
    if (!object) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  dispatch_sync(v7, block);
  uint64_t v8 = object;
  if (object) {
LABEL_10:
  }
    dispatch_release(v8);
LABEL_11:
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void sub_1C5739FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void AppleBasebandManager::eventsOn(AppleBasebandManager *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(void *)this + 72;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN20AppleBasebandManager5State8eventsOnEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_56;
  v4[4] = v1;
  uint64_t v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = v2;
  void block[5] = &v5;
  uint64_t v3 = *(NSObject **)(v1 + 88);
  if (*(void *)(v1 + 96)) {
    dispatch_async_and_wait(v3, block);
  }
  else {
    dispatch_sync(v3, block);
  }
}

void AppleBasebandManager::perform(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    AppleBasebandManager::State::perform(v3, v4, v5);
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    AppleBasebandManager::State::perform(v3, v4, 0);
  }
}

void AppleBasebandManager::State::perform(uint64_t a1, uint64_t a2, std::__shared_weak_count *a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1174405120;
  v6[2] = ___ZN20AppleBasebandManager5State7performENSt3__110shared_ptrIN3abm6client7CommandEEE_block_invoke;
  v6[3] = &__block_descriptor_tmp_57;
  v6[4] = a1;
  v6[5] = a2;
  uint64_t v7 = a3;
  if (a3) {
    atomic_fetch_add_explicit(&a3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = a1 + 72;
  void block[5] = &v8;
  uint64_t v4 = a1 + 88;
  uint64_t v3 = *(NSObject **)(a1 + 88);
  if (*(void *)(v4 + 8))
  {
    dispatch_async_and_wait(v3, block);
    uint64_t v5 = v7;
    if (!v7) {
      return;
    }
  }
  else
  {
    dispatch_sync(v3, block);
    uint64_t v5 = v7;
    if (!v7) {
      return;
    }
  }
  if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
}

void AppleBasebandManager::perform(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v5 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v5 = _Block_copy(v5);
  }
  uint64_t v6 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  CFTypeRef cf = 0;
  abm::client::Command::create((uint64_t)&aBlock, (ctu **)&cf, &v14);
  if (cf) {
    CFRelease(cf);
  }
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  uint64_t v7 = *a1;
  uint64_t v8 = v14;
  uint64_t v9 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
    AppleBasebandManager::State::perform(v7, v8, v9);
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  else
  {
    AppleBasebandManager::State::perform(v7, v14, 0);
  }
  std::string v10 = (std::__shared_weak_count *)v15;
  if (v15)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v15 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  CFTypeRef cf;
  void *aBlock;
  dispatch_object_t object;
  uint64_t v15;
  unint64_t v16;

  unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v6 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v6 = _Block_copy(v6);
  }
  uint64_t v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  dispatch_object_t object = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  CFTypeRef cf = 0;
  abm::client::Command::create(a2, (uint64_t)&aBlock, (ctu **)&cf, &v15);
  if (cf) {
    CFRelease(cf);
  }
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  uint64_t v8 = *a1;
  uint64_t v9 = v15;
  std::string v10 = (std::__shared_weak_count *)v16;
  if (v16)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
    AppleBasebandManager::State::perform(v8, v9, v10);
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  else
  {
    AppleBasebandManager::State::perform(v8, v15, 0);
  }
  long long v11 = (std::__shared_weak_count *)v16;
  if (v16)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v16 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_1C573A42C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)va1);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void sub_1C573A5F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)va1);
  _Unwind_Resume(a1);
}

void AppleBasebandManager::eventsOff(AppleBasebandManager *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(void *)this + 72;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN20AppleBasebandManager5State9eventsOffEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_58;
  v4[4] = v1;
  uint64_t v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke;
  block[3] = &__block_descriptor_tmp_28;
  block[4] = v2;
  void block[5] = &v5;
  uint64_t v3 = *(NSObject **)(v1 + 88);
  if (*(void *)(v1 + 96)) {
    dispatch_async_and_wait(v3, block);
  }
  else {
    dispatch_sync(v3, block);
  }
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__shared_ptr_pointer<AppleBasebandManager::State *,std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State *)#1},std::allocator<AppleBasebandManager::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<AppleBasebandManager::State *,std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State *)#1},std::allocator<AppleBasebandManager::State>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<AppleBasebandManager::State *,std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State *)#1},std::allocator<AppleBasebandManager::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3__110shared_"
                     "ptrIT_EEPS7_EUlPS2_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3_"
                                "_110shared_ptrIT_EEPS7_EUlPS2_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3__110shared_ptrIT_EEPS7_EUlPS2_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE15make_shared_ptrIS2_EENSt3__110shared_ptrIT_EEPS7_EUlPS2_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<AppleBasebandManager::State> ctu::SharedSynchronizable<AppleBasebandManager::State>::make_shared_ptr<AppleBasebandManager::State>(AppleBasebandManager::State*)::{lambda(AppleBasebandManager::State*)#1}::operator() const(AppleBasebandManager::State*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x1E4FBA438] + 16;
  __cxa_throw(exception, MEMORY[0x1E4FBA2E0], MEMORY[0x1E4FBA208]);
}

uint64_t *std::list<boost::signals2::connection>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    unint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6 && atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
        }
        operator delete(v3);
        unint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

void *ctu::SharedLoggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F20ECE80;
  MEMORY[0x1C878F380](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  *a1 = &unk_1F20ECE80;
  MEMORY[0x1C878F380](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void AppleBasebandManager::State::~State(AppleBasebandManager::State *this)
{
  AppleBasebandManager::State::~State(this);
  operator delete(v1);
}

{
  char *v2;
  char *v3;
  atomic_uint *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  boost::signals2::detail::connection_body_base *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  atomic_uint *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  atomic_uint *v19;
  std::__shared_weak_count *v20;
  const void *v21;
  NSObject *v22;
  NSObject *v23;
  std::__shared_weak_count *v24;
  boost::signals2::detail::connection_body_base *v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  uint64_t v29;

  *(void *)this = &unk_1F20ECD70;
  uint64_t v2 = (char *)this + 160;
  unint64_t v3 = (char *)*((void *)this + 21);
  if (v3 != (char *)this + 160)
  {
    do
    {
      uint64_t v4 = (atomic_uint *)*((void *)v3 + 3);
      uint64_t v25 = 0;
      v26 = (uint64_t)v4;
      if (v4)
      {
        uint64_t v5 = v4[2];
        while (v5)
        {
          uint64_t v6 = v5;
          atomic_compare_exchange_strong_explicit(v4 + 2, (unsigned int *)&v6, v5 + 1, memory_order_relaxed, memory_order_relaxed);
          uint64_t v7 = v6 == v5;
          uint64_t v5 = v6;
          if (v7)
          {
            uint64_t v8 = (boost::signals2::detail::connection_body_base *)*((void *)v3 + 2);
            uint64_t v25 = v8;
            if (v8) {
              boost::signals2::detail::connection_body_base::disconnect(v8);
            }
            if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
              if (atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
              }
            }
            break;
          }
        }
      }
      unint64_t v3 = (char *)*((void *)v3 + 1);
    }
    while (v3 != v2);
  }
  if (*((void *)this + 22))
  {
    uint64_t v9 = *((void *)this + 20);
    std::string v10 = (char *)*((void *)this + 21);
    long long v11 = *(void *)v10;
    *(void *)(v11 + 8) = *(void *)(v9 + 8);
    **(void **)(v9 + 8) = v11;
    *((void *)this + 22) = 0;
    if (v10 != v2)
    {
      do
      {
        uint64_t v12 = (char *)*((void *)v10 + 1);
        uint64_t v13 = (atomic_uint *)*((void *)v10 + 3);
        if (v13 && atomic_fetch_add(v13 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v13 + 24))(v13);
        }
        operator delete(v10);
        std::string v10 = v12;
      }
      while (v12 != v2);
    }
  }
  uint64_t v14 = **((void **)this + 18);
  uint64_t v25 = (boost::signals2::detail::connection_body_base *)MEMORY[0x1E4F143A8];
  v26 = 0x40000000;
  v27 = ___ZN3abm6client9Transport5State8checkOutEv_block_invoke;
  v28 = &__block_descriptor_tmp_47;
  v29 = v14;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v14 + 8), (uint64_t)&v25);
  if (*((void *)this + 22))
  {
    unint64_t v15 = *((void *)this + 20);
    uint64_t v16 = (char *)*((void *)this + 21);
    uint64_t v17 = *(void *)v16;
    *(void *)(v17 + 8) = *(void *)(v15 + 8);
    **(void **)(v15 + 8) = v17;
    *((void *)this + 22) = 0;
    if (v16 != v2)
    {
      do
      {
        uint64_t v18 = (char *)*((void *)v16 + 1);
        v19 = (atomic_uint *)*((void *)v16 + 3);
        if (v19 && atomic_fetch_add(v19 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v19 + 24))(v19);
        }
        operator delete(v16);
        uint64_t v16 = v18;
      }
      while (v18 != v2);
    }
  }
  v20 = (std::__shared_weak_count *)*((void *)this + 19);
  if (!v20 || atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    v21 = (const void *)*((void *)this + 16);
    if (!v21) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
  std::__shared_weak_count::__release_weak(v20);
  v21 = (const void *)*((void *)this + 16);
  if (v21) {
LABEL_31:
  }
    CFRelease(v21);
LABEL_32:
  if (*((char *)this + 127) < 0) {
    operator delete(*((void **)this + 13));
  }
  *(void *)this = &unk_1F20ECE80;
  MEMORY[0x1C878F380]((char *)this + 8);
  char v22 = *((void *)this + 12);
  if (v22) {
    dispatch_release(v22);
  }
  unint64_t v23 = *((void *)this + 11);
  if (v23) {
    dispatch_release(v23);
  }
  unint64_t v24 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
}

uint64_t ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

double ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)a1 = v2;
  *(_OWORD *)(a1 + 8) = xmmword_1C5764220;
  strcpy(v2, "AppleBasebandManager::State");
  return *(double *)"ndManager::State";
}

uint64_t ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::SharedSynchronizable<AppleBasebandManager::State>::~SharedSynchronizable(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[2];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  return a1;
}

void ctu::SharedLoggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggable(void *a1)
{
  *a1 = &unk_1F20ECE80;
  MEMORY[0x1C878F380](a1 + 1);
  uint64_t v2 = a1[12];
  if (v2) {
    dispatch_release(v2);
  }
  unint64_t v3 = a1[11];
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[10];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(a1);
}

void *ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20ECE80;
  MEMORY[0x1C878F380](a1 + 1);
  return a1;
}

void ctu::Loggable<AppleBasebandManager::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20ECE80;
  MEMORY[0x1C878F380](a1 + 1);
  operator delete(a1);
}

void boost::signals2::connection::~connection(boost::signals2::connection *this)
{
  uint64_t v1 = (atomic_uint *)*((void *)this + 1);
  if (v1)
  {
    if (atomic_fetch_add(v1 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v1 + 24))(v1);
    }
  }
}

void sub_1C573AF8C(void *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  boost::shared_ptr<boost::signals2::detail::connection_body_base>::~shared_ptr((uint64_t)va);
  __clang_call_terminate(a1);
}

void boost::signals2::detail::connection_body_base::disconnect(boost::signals2::detail::connection_body_base *this)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[8] = v2;
  v6[9] = v2;
  void v6[6] = v2;
  v6[7] = v2;
  v6[4] = v2;
  v6[5] = v2;
  v6[2] = v2;
  v6[3] = v2;
  v6[0] = v2;
  v6[1] = v2;
  unint64_t v7 = 10;
  std::string __p = v6;
  uint64_t v9 = 0;
  std::string v10 = this;
  (*(void (**)(boost::signals2::detail::connection_body_base *))(*(void *)this + 24))(this);
  if (*((unsigned char *)this + 24))
  {
    *((unsigned char *)this + 24) = 0;
    boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(this, v6);
  }
  (*(void (**)(boost::signals2::detail::connection_body_base *))(*(void *)v10 + 32))(v10);
  unint64_t v3 = (char *)__p;
  if (__p)
  {
    if (v9 - 1 >= 0)
    {
      uint64_t v4 = (char *)__p + 16 * v9;
      do
      {
        uint64_t v5 = (atomic_uint *)*((void *)v4 - 1);
        if (v5)
        {
          if (atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
            if (atomic_fetch_add(v5 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v5 + 24))(v5);
            }
          }
        }
        v4 -= 16;
      }
      while (v4 > v3);
    }
    if (v7 >= 0xB) {
      operator delete(__p);
    }
  }
}

void sub_1C573B158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1C573B16C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t boost::shared_ptr<boost::signals2::detail::connection_body_base>::~shared_ptr(uint64_t a1)
{
  long long v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock(uint64_t a1)
{
  (*(void (**)(void))(**(void **)(a1 + 184) + 32))(*(void *)(a1 + 184));
  unint64_t v2 = *(void *)(a1 + 168);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 176);
    if (v3 - 1 >= 0)
    {
      unint64_t v4 = v2 + 16 * v3;
      do
      {
        uint64_t v5 = *(atomic_uint **)(v4 - 8);
        if (v5)
        {
          if (atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
            if (atomic_fetch_add(v5 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v5 + 24))(v5);
            }
          }
        }
        v4 -= 16;
      }
      while (v4 > v2);
    }
    if (*(void *)(a1 + 160) >= 0xBuLL) {
      operator delete(*(void **)(a1 + 168));
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<void>::~shared_ptr(uint64_t a1)
{
  unint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(_DWORD *a1, void *a2)
{
  int v2 = a1[7] - 1;
  a1[7] = v2;
  if (!v2)
  {
    (*(void (**)(long long *__return_ptr))(*(void *)a1 + 40))(&v8);
    uint64_t v4 = a2[22];
    if (v4 == a2[20] && v4 != -1)
    {
      if (4 * v4 <= (unint64_t)(v4 + 1)) {
        unint64_t v5 = v4 + 1;
      }
      else {
        unint64_t v5 = 4 * v4;
      }
      boost::signals2::detail::auto_buffer<boost::shared_ptr<void>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::shared_ptr<void>>>::reserve_impl((uint64_t)a2, v5);
      uint64_t v4 = a2[22];
    }
    uint64_t v6 = *((void *)&v8 + 1);
    *(_OWORD *)(a2[21] + 16 * v4) = v8;
    if (v6)
    {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 8), 1u, memory_order_relaxed);
      uint64_t v4 = a2[22];
    }
    a2[22] = v4 + 1;
    unint64_t v7 = (atomic_uint *)*((void *)&v8 + 1);
    if (*((void *)&v8 + 1) && atomic_fetch_add((atomic_uint *volatile)(*((void *)&v8 + 1) + 8), 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      if (atomic_fetch_add(v7 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 24))(v7);
      }
    }
  }
}

void sub_1C573B608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void boost::signals2::detail::auto_buffer<boost::shared_ptr<void>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::shared_ptr<void>>>::reserve_impl(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = (void *)a1;
  if (a2 >= 0xB)
  {
    if (a2 >> 60) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v4 = operator new(16 * a2);
  }
  uint64_t v6 = *(void **)(a1 + 168);
  uint64_t v5 = *(void *)(a1 + 176);
  if (v5)
  {
    unint64_t v7 = &v6[2 * v5];
    long long v8 = v4;
    do
    {
      uint64_t v9 = v6[1];
      *long long v8 = *v6;
      v8[1] = v9;
      if (v9) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v9 + 8), 1u, memory_order_relaxed);
      }
      v6 += 2;
      v8 += 2;
    }
    while (v6 != v7);
    uint64_t v6 = *(void **)(a1 + 168);
  }
  if (v6)
  {
    uint64_t v10 = *(void *)(a1 + 176);
    if (v10 - 1 >= 0)
    {
      uint64_t v11 = &v6[2 * v10];
      do
      {
        uint64_t v12 = (atomic_uint *)*(v11 - 1);
        if (v12)
        {
          if (atomic_fetch_add(v12 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v12 + 16))(v12);
            if (atomic_fetch_add(v12 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v12 + 24))(v12);
            }
          }
        }
        v11 -= 2;
      }
      while (v11 > v6);
    }
    if (*(void *)(a1 + 160) >= 0xBuLL) {
      operator delete(*(void **)(a1 + 168));
    }
  }
  *(void *)(a1 + 160) = a2;
  *(void *)(a1 + 168) = v4;
}

void ___ZN20AppleBasebandManager5State4initEv_block_invoke(void *a1)
{
  uint64_t v161 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  int v2 = (const void *)off_1EB5069C8;
  if (!off_1EB5069C8)
  {
    uint64_t v3 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v3);
    memset(v148, 170, 16);
    std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(v148, (uint64_t)v3);
    ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*(uint64_t *)v148);
    long long v4 = *(_OWORD *)v148;
    *(void *)v148 = 0;
    *(void *)&v148[8] = 0;
    uint64_t v5 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    off_1EB5069C8 = v4;
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
    uint64_t v6 = *(std::__shared_weak_count **)&v148[8];
    if (*(void *)&v148[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v148[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    int v2 = (const void *)off_1EB5069C8;
  }
  cf[1] = v2;
  v133 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
  if (*(&off_1EB5069C8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE13connect_eventIN5boost8signals26signalIFvvENS6_19optional_last_valueIvEEiNSt3__14lessIiEENS5_8functionIS8_EENSE_IFvRKNS6_10connectionEEEENS6_5mutexEEES2_vJEEEDTcl7connectfp_cvNSB_10shared_ptrIS2_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSR_ST_E_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_29;
  aBlock[4] = v1 + 72;
  aBlock[5] = AppleBasebandManager::State::handleServerReady_sync;
  aBlock[6] = 0;
  unint64_t v7 = _Block_copy(aBlock);
  v123 = v2;
  long long v8 = *(std::__shared_weak_count **)(v1 + 80);
  if (!v8 || (v9 = *(void *)(v1 + 72), (uint64_t v10 = std::__shared_weak_count::lock(v8)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(NSObject **)(v1 + 88);
  dispatch_object_t v136 = v12;
  if (v7) {
    uint64_t v13 = _Block_copy(v7);
  }
  else {
    uint64_t v13 = 0;
  }
  v137 = v13;
  dispatch_retain(v12);
  memset(v138, 0, sizeof(v138));
  dispatch_object_t v141 = v12;
  if (v13) {
    uint64_t v13 = _Block_copy(v13);
  }
  v142 = v13;
  dispatch_retain(v12);
  dispatch_object_t object = v12;
  uint64_t v124 = v9;
  v125 = v11;
  v122 = v7;
  if (!v13)
  {
    v144 = 0;
    dispatch_retain(v12);
    goto LABEL_27;
  }
  uint64_t v14 = _Block_copy(v13);
  v144 = v14;
  dispatch_retain(v12);
  if (!v14)
  {
LABEL_27:
    dispatch_retain(v12);
    v145 = 0;
    goto LABEL_28;
  }
  unint64_t v15 = _Block_copy(v14);
  dispatch_retain(v12);
  v145 = 0;
  if (!v15)
  {
LABEL_28:
    dispatch_retain(v12);
    v119 = 0;
    char v20 = 1;
LABEL_29:
    dispatch_retain(v12);
    v120 = 0;
    char v21 = 1;
LABEL_30:
    dispatch_retain(v12);
    uint64_t v17 = 0;
    char v22 = 1;
LABEL_31:
    dispatch_retain(v12);
    uint64_t v18 = 0;
    v146 = (uint64_t *)v12;
    char v23 = 1;
    goto LABEL_32;
  }
  uint64_t v16 = _Block_copy(v15);
  dispatch_retain(v12);
  v119 = v15;
  if (!v16)
  {
    char v20 = 0;
    goto LABEL_29;
  }
  uint64_t v17 = _Block_copy(v16);
  dispatch_retain(v12);
  v120 = v16;
  if (!v17)
  {
    char v20 = 0;
    char v21 = 0;
    goto LABEL_30;
  }
  uint64_t v18 = _Block_copy(v17);
  dispatch_retain(v12);
  if (!v18)
  {
    char v20 = 0;
    char v21 = 0;
    char v22 = 0;
    goto LABEL_31;
  }
  v19 = _Block_copy(v18);
  dispatch_retain(v12);
  v146 = (uint64_t *)v12;
  if (v19)
  {
    char v20 = 0;
    char v21 = 0;
    char v22 = 0;
    char v23 = 0;
    v147 = _Block_copy(v19);
    dispatch_retain(v12);
    dispatch_release(v12);
    _Block_release(v19);
    goto LABEL_33;
  }
  char v20 = 0;
  char v21 = 0;
  char v22 = 0;
  char v23 = 0;
LABEL_32:
  v147 = 0;
  dispatch_retain(v12);
  dispatch_release(v12);
LABEL_33:
  dispatch_release(v12);
  if ((v23 & 1) == 0) {
    _Block_release(v18);
  }
  dispatch_release(v12);
  if ((v22 & 1) == 0) {
    _Block_release(v17);
  }
  v145 = (uint64_t *)boost::function0<void>::assign_to<ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>>(ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>)::stored_vtable;
  dispatch_release(v12);
  if ((v21 & 1) == 0) {
    _Block_release(v120);
  }
  dispatch_release(v12);
  if ((v20 & 1) == 0) {
    _Block_release(v119);
  }
  *(void *)v148 = 0;
  memset(&v148[8], 170, 24);
  boost::function0<void>::move_assign((uint64_t)v148, (uint64_t *)&v145);
  boost::function0<void>::move_assign((uint64_t)&v145, (uint64_t *)&v138[3]);
  boost::function0<void>::move_assign((uint64_t)&v138[3], (uint64_t *)v148);
  if (*(void *)v148)
  {
    if ((v148[0] & 1) == 0)
    {
      unint64_t v24 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)v148 & 0xFFFFFFFFFFFFFFFELL);
      if (v24) {
        v24(&v148[8], &v148[8], 2);
      }
    }
  }
  if (v145)
  {
    if ((v145 & 1) == 0)
    {
      uint64_t v25 = *(void (**)(uint64_t, _WORD *, unsigned int))((unint64_t)v145 & 0xFFFFFFFFFFFFFFFELL);
      if (v25) {
        v25((uint64_t)&v146, &v146, 2u);
      }
    }
    v145 = 0;
  }
  dispatch_release(object);
  if (v144) {
    _Block_release(v144);
  }
  dispatch_release(v141);
  if (v142) {
    _Block_release(v142);
  }
  atomic_fetch_add_explicit(&v125->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v26 = operator new(0x18uLL);
  void *v26 = &unk_1F20ED0C8;
  v26[1] = v124;
  v26[2] = v125;
  atomic_fetch_add_explicit(&v125->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v27 = (uint64_t *)operator new(0x18uLL);
  uint64_t *v27 = (uint64_t)&unk_1F20ED0C8;
  v27[1] = v124;
  v27[2] = (uint64_t)v125;
  atomic_fetch_add_explicit(&v125->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  v146 = v27;
  LODWORD(v145) = 2;
  v28 = (char *)v138[1];
  if (v138[1] < v138[2])
  {
    v29 = v125;
    v30 = operator new(0x18uLL);
    void *v30 = &unk_1F20ED0C8;
    v30[1] = v124;
    v30[2] = v125;
    atomic_fetch_add_explicit(&v125->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v28 + 1) = v30;
    *(_DWORD *)v28 = 2;
    v31 = v28 + 24;
    goto LABEL_78;
  }
  v32 = (char *)v138[0];
  unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v138[1] - (char *)v138[0]) >> 3);
  unint64_t v34 = v33 + 1;
  if (v33 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((char *)v138[2] - (char *)v138[0]) >> 3) > v34) {
    unint64_t v34 = 0x5555555555555556 * (((char *)v138[2] - (char *)v138[0]) >> 3);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v138[2] - (char *)v138[0]) >> 3) >= 0x555555555555555) {
    unint64_t v35 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v35 = v34;
  }
  *(void *)&long long v149 = &v138[2];
  if (v35)
  {
    if (v35 > 0xAAAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    uint64_t v36 = (char *)operator new(24 * v35);
  }
  else
  {
    uint64_t v36 = 0;
  }
  v37 = &v36[24 * v33];
  *(void *)v148 = v36;
  *(void *)&v148[8] = v37;
  *(void *)&v148[16] = v37;
  *(void *)&v148[24] = &v36[24 * v35];
  v38 = operator new(0x18uLL);
  void *v38 = &unk_1F20ED0C8;
  v38[1] = v124;
  v38[2] = v125;
  atomic_fetch_add_explicit(&v125->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *((void *)v37 + 1) = v38;
  *(_DWORD *)v37 = 2;
  v31 = v37 + 24;
  *(void *)&v148[16] = v37 + 24;
  if (v28 == v32)
  {
    v138[0] = v37;
    v138[1] = v37 + 24;
    v138[2] = &v36[24 * v35];
    v29 = v125;
    if (!v28) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  uint64_t v39 = 0;
  do
  {
    v40 = &v37[v39];
    v41 = &v28[v39];
    if ((*(_DWORD *)&v28[v39 - 24] ^ (*(int *)&v28[v39 - 24] >> 31)) == 2)
    {
      *((void *)v40 - 2) = (*(uint64_t (**)(void))(**((void **)v41 - 2) + 32))(*((void *)v41 - 2));
    }
    else
    {
      *((void *)v40 - 2) = *((void *)v41 - 2);
      uint64_t v42 = *(void *)&v28[v39 - 8];
      *(void *)&v37[v39 - 8] = v42;
      if (v42) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v42 + 12), 1u, memory_order_relaxed);
      }
    }
    *((_DWORD *)v40 - 6) = *((_DWORD *)v41 - 6) ^ (*((int *)v41 - 6) >> 31);
    v39 -= 24;
  }
  while (&v28[v39] != v32);
  v28 = (char *)v138[0];
  v43 = (char *)v138[1];
  v138[0] = &v37[v39];
  *(_OWORD *)&v138[1] = *(_OWORD *)&v148[16];
  v31 = *(void **)&v148[16];
  if (v43 == v28)
  {
    v29 = v125;
    if (!v28) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
  v29 = v125;
  do
  {
    v43 -= 24;
    boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content((uint64_t)v43);
  }
  while (v43 != v28);
  if (v28) {
LABEL_77:
  }
    operator delete(v28);
LABEL_78:
  v138[1] = v31;
  boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content((uint64_t)&v145);
  (*(void (**)(void *))(*v26 + 8))(v26);
  std::__shared_weak_count::__release_weak(v29);
  v44 = (uint64_t **)*((void *)v123 + 13);
  *(void *)&long long v45 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v155 = v45;
  long long v156 = v45;
  long long v153 = v45;
  long long v154 = v45;
  long long v151 = v45;
  long long v152 = v45;
  long long v149 = v45;
  long long v150 = v45;
  *(_OWORD *)v148 = v45;
  *(_OWORD *)&v148[16] = v45;
  v46 = (pthread_mutex_t *)v44[3];
  unint64_t v157 = 10;
  std::string __p = v148;
  uint64_t v159 = 0;
  v160 = v46;
  pthread_mutex_lock(v46);
  dispatch_object_t object = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  v144 = (void *)0xAAAAAAAAAAAAAAAALL;
  v47 = (atomic_uint *)v44[1];
  if (v47 && atomic_load_explicit(v47 + 2, memory_order_acquire) == 1)
  {
    uint64_t v48 = **v44;
    v49 = v44[2];
    int v50 = 2;
    if (v49 != (uint64_t *)v48)
    {
      v145 = v44[2];
      if ((uint64_t *)**v44 == v49) {
        goto LABEL_111;
      }
      goto LABEL_91;
    }
  }
  else
  {
    v51 = (uint64_t *)operator new(0x20uLL);
    v52 = (uint64_t **)*v44;
    uint64_t v53 = **v44;
    v54 = operator new(0x40uLL);
    boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list((uint64_t)v54, v53);
    boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(v51, (uint64_t)v54);
    v51[2] = (uint64_t)v52[2];
    uint64_t v55 = (uint64_t)v52[3];
    v51[3] = v55;
    if (v55) {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v55 + 8), 1u, memory_order_relaxed);
    }
    boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>((uint64_t *)&v145, (uint64_t)v51);
    v56 = v145;
    v57 = (atomic_uint *)v44[1];
    v145 = *v44;
    *v44 = v56;
    v44[1] = v146;
    v146 = (uint64_t *)v57;
    if (v57)
    {
      if (atomic_fetch_add(v57 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v57 + 16))(v57);
        if (atomic_fetch_add(v57 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v57 + 24))(v57);
        }
      }
    }
    int v50 = 0;
    uint64_t v48 = **v44;
  }
  v49 = *(uint64_t **)(v48 + 8);
  v145 = v49;
  if ((uint64_t *)**v44 == v49) {
    goto LABEL_111;
  }
LABEL_91:
  unsigned int v58 = 0;
  unsigned int v59 = v50 - 1;
  do
  {
    uint64_t v62 = v49[2];
    v63 = *(uint64_t **)(v62 + 32);
    if (v63)
    {
      for (uint64_t i = *v63; i != v63[1]; i += 24)
      {
        if ((*(_DWORD *)i ^ (*(int *)i >> 31)) > 1)
        {
          if ((*(uint64_t (**)(void))(**(void **)(i + 8) + 24))(*(void *)(i + 8))) {
            goto LABEL_108;
          }
        }
        else
        {
          uint64_t v65 = *(void *)(i + 16);
          if (!v65 || !atomic_load_explicit((atomic_uint *volatile)(v65 + 8), memory_order_acquire))
          {
LABEL_108:
            if (*(unsigned char *)(v62 + 24))
            {
              *(unsigned char *)(v62 + 24) = 0;
              boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)v62, v148);
            }
            break;
          }
        }
      }
    }
    uint64_t v60 = v145[2];
    if (*(unsigned char *)(v60 + 24)) {
      v49 = (uint64_t *)v145[1];
    }
    else {
      v49 = (uint64_t *)boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase((uint64_t *)**v44, (int *)(v60 + 64), &v145);
    }
    v145 = v49;
    ++v58;
  }
  while (v49 != (uint64_t *)**v44 && v59 >= v58);
LABEL_111:
  v44[2] = v49;
  v66 = (char *)operator new(0x50uLL);
  *((void *)v66 + 1) = 0;
  *((void *)v66 + 2) = 0;
  v66[24] = 1;
  *((_DWORD *)v66 + 7) = 1;
  *(void *)v66 = &unk_1F20ECF20;
  v67 = operator new(0x38uLL);
  void *v67 = 0;
  v67[1] = 0;
  v67[2] = 0;
  v68 = (char *)v138[0];
  v69 = (char *)v138[1];
  int64_t v70 = (char *)v138[1] - (char *)v138[0];
  if (v138[1] != v138[0])
  {
    unint64_t v71 = 0xAAAAAAAAAAAAAAABLL * (v70 >> 3);
    if (v71 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]();
    }
    v72 = (char *)operator new(v70);
    uint64_t v73 = 0;
    void *v67 = v72;
    v67[1] = v72;
    v67[2] = &v72[24 * v71];
    do
    {
      v74 = &v72[v73];
      v75 = &v68[v73];
      if ((*(_DWORD *)&v68[v73] ^ (*(int *)&v68[v73] >> 31)) == 2)
      {
        *((void *)v74 + 1) = (*(uint64_t (**)(void))(**((void **)v75 + 1) + 32))(*((void *)v75 + 1));
      }
      else
      {
        *((void *)v74 + 1) = *((void *)v75 + 1);
        uint64_t v76 = *(void *)&v68[v73 + 16];
        *(void *)&v72[v73 + 16] = v76;
        if (v76) {
          atomic_fetch_add_explicit((atomic_uint *volatile)(v76 + 12), 1u, memory_order_relaxed);
        }
      }
      *(_DWORD *)v74 = *(_DWORD *)&v68[v73] ^ (*(int *)&v68[v73] >> 31);
      v73 += 24;
    }
    while (&v68[v73] != v69);
    v67[1] = &v72[v73];
  }
  v67[3] = 0;
  unint64_t v77 = (unint64_t)v138[3];
  if (v138[3])
  {
    v67[3] = v138[3];
    if (v77)
    {
      *((_OWORD *)v67 + 2) = v139;
      v67[6] = v140;
    }
    else
    {
      (*(void (**)(long long *, void *, void))(v77 & 0xFFFFFFFFFFFFFFFELL))(&v139, v67 + 4, 0);
    }
  }
  *((void *)v66 + 4) = v67;
  *((void *)v66 + 5) = 0;
  v78 = operator new(0x18uLL);
  v78[1] = 0x100000001;
  void *v78 = &unk_1F20ECFC8;
  v78[2] = v67;
  *((void *)v66 + 5) = v78;
  *((void *)v66 + 6) = v44[3];
  v79 = (atomic_uint *)v44[4];
  *((void *)v66 + 7) = v79;
  if (v79) {
    atomic_fetch_add_explicit(v79 + 2, 1u, memory_order_relaxed);
  }
  *((_DWORD *)v66 + 16) = 0;
  v66[68] = 0;
  dispatch_object_t object = (dispatch_object_t)v66;
  v144 = 0;
  v80 = (atomic_uint *)operator new(0x18uLL);
  *((void *)v80 + 1) = 0x100000001;
  *(void *)v80 = &unk_1F20ED028;
  *((void *)v80 + 2) = v66;
  v144 = v80;
  uint64_t v81 = **v44;
  v82 = operator new(0x20uLL);
  v83 = (void *)(v81 + 32);
  v82[2] = v66;
  v82[3] = v80;
  atomic_fetch_add_explicit(v80 + 2, 1u, memory_order_relaxed);
  uint64_t v84 = *(void *)v81;
  *(void *)(v84 + 8) = v82;
  void *v82 = v84;
  *(void *)uint64_t v81 = v82;
  v82[1] = v81;
  ++*(void *)(v81 + 16);
  v85 = *(uint64_t **)(v81 + 32);
  if (v85)
  {
    uint64_t v86 = v81 + 32;
    uint64_t v87 = *(void *)(v81 + 32);
    do
    {
      int v88 = *(_DWORD *)(v87 + 32);
      BOOL v89 = v88 == 2;
      BOOL v90 = v88 < 2;
      if (v88 >= 2) {
        v91 = (uint64_t *)v87;
      }
      else {
        v91 = (uint64_t *)(v87 + 8);
      }
      if (!v90) {
        uint64_t v86 = v87;
      }
      if (v89)
      {
        v91 = (uint64_t *)v87;
        uint64_t v86 = v87;
      }
      uint64_t v87 = *v91;
    }
    while (*v91);
    if ((void *)v86 == v83 || *(_DWORD *)(v86 + 32) != 2)
    {
      int v93 = *((_DWORD *)v85 + 8);
      while (v93 != 2)
      {
        if (v93 < 3)
        {
          v94 = (uint64_t *)v85[1];
          if (!v94)
          {
            v83 = v85 + 1;
            goto LABEL_147;
          }
        }
        else
        {
          v94 = (uint64_t *)*v85;
          v83 = v85;
          if (!*v85) {
            goto LABEL_147;
          }
        }
        int v93 = *((_DWORD *)v94 + 8);
        v85 = v94;
      }
    }
    *((_DWORD *)v66 + 16) = 2;
    *(void *)(v66 + 68) = 0xAAAAAAAAAAAAAA00;
    v92 = v122;
  }
  else
  {
    v85 = (uint64_t *)(v81 + 32);
LABEL_147:
    v95 = operator new(0x38uLL);
    v95[4] = 0xAAAAAA0000000002;
    *((_DWORD *)v95 + 10) = -1431655766;
    v95[6] = v82;
    void *v95 = 0;
    v95[1] = 0;
    v95[2] = v85;
    void *v83 = v95;
    uint64_t v96 = **(void **)(v81 + 24);
    if (v96)
    {
      *(void *)(v81 + 24) = v96;
      v95 = (void *)*v83;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v81 + 32), v95);
    ++*(void *)(v81 + 40);
    v66 = (char *)object;
    v80 = (atomic_uint *)v144;
    LODWORD(object[8].isa) = 2;
    *(void *)(v66 + 68) = 0xAAAAAAAAAAAAAA00;
    v92 = v122;
    if (!v80)
    {
      long long v134 = (unint64_t)v66;
      v97 = (atomic_uint *)v144;
      if (!v144) {
        goto LABEL_159;
      }
      goto LABEL_153;
    }
  }
  atomic_fetch_add_explicit(v80 + 3, 1u, memory_order_relaxed);
  *(void *)&long long v134 = v66;
  *((void *)&v134 + 1) = v80;
  atomic_fetch_add_explicit(v80 + 3, 1u, memory_order_relaxed);
  if (atomic_fetch_add(v80 + 3, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v80 + 24))(v80);
  }
  v97 = (atomic_uint *)v144;
  if (v144)
  {
LABEL_153:
    if (atomic_fetch_add(v97 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v97 + 16))(v97);
      if (atomic_fetch_add(v97 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v97 + 24))(v97);
      }
    }
  }
LABEL_159:
  pthread_mutex_unlock(v160);
  v98 = (char *)__p;
  if (__p)
  {
    if (v159 - 1 >= 0)
    {
      v99 = (char *)__p + 16 * v159;
      do
      {
        v100 = (atomic_uint *)*((void *)v99 - 1);
        if (v100)
        {
          if (atomic_fetch_add(v100 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v100 + 16))(v100);
            if (atomic_fetch_add(v100 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v100 + 24))(v100);
            }
          }
        }
        v99 -= 16;
      }
      while (v99 > v98);
    }
    if (v157 >= 0xB) {
      operator delete(__p);
    }
  }
  if (v138[3])
  {
    if (((uint64_t)v138[3] & 1) == 0)
    {
      v101 = *(void (**)(long long *, long long *, uint64_t))((unint64_t)v138[3] & 0xFFFFFFFFFFFFFFFELL);
      if (v101) {
        v101(&v139, &v139, 2);
      }
    }
    v138[3] = 0;
  }
  v102 = (char *)v138[0];
  if (v138[0])
  {
    v103 = (char *)v138[1];
    v104 = v138[0];
    if (v138[1] != v138[0])
    {
      do
      {
        v103 -= 24;
        boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content((uint64_t)v103);
      }
      while (v103 != v102);
      v104 = v138[0];
    }
    v138[1] = v102;
    operator delete(v104);
  }
  dispatch_release(v136);
  if (v137) {
    _Block_release(v137);
  }
  if (atomic_fetch_add(&v125->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (!v92) {
      goto LABEL_186;
    }
    goto LABEL_185;
  }
  ((void (*)(std::__shared_weak_count *))v125->__on_zero_shared)(v125);
  std::__shared_weak_count::__release_weak(v125);
  if (v92) {
LABEL_185:
  }
    _Block_release(v92);
LABEL_186:
  v105 = operator new(0x20uLL);
  v105[1] = v134;
  long long v134 = 0uLL;
  *((void *)v105 + 1) = v1 + 160;
  uint64_t v106 = *(void *)(v1 + 160);
  *(void *)v105 = v106;
  *(void *)(v106 + 8) = v105;
  *(void *)(v1 + 160) = v105;
  ++*(void *)(v1 + 176);
  if (v133 && !atomic_fetch_add(&v133->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v133->__on_zero_shared)(v133);
    std::__shared_weak_count::__release_weak(v133);
  }
  uint64_t v108 = *(void *)(v1 + 56);
  v107 = *(std::__shared_weak_count **)(v1 + 64);
  *(void *)v148 = v108;
  *(void *)&v148[8] = v107;
  if (v107) {
    atomic_fetch_add_explicit(&v107->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v109 = *(const void **)(v1 + 128);
  cf[0] = v109;
  if (v109) {
    CFRetain(v109);
  }
  uint64_t v130 = v108;
  v131 = v107;
  if (v107) {
    atomic_fetch_add_explicit(&v107->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 1174405120;
  v126[2] = ___ZN20AppleBasebandManager5State4initEv_block_invoke_2;
  v126[3] = &__block_descriptor_tmp_3;
  v110 = (std::__shared_weak_count *)a1[6];
  v126[4] = a1[5];
  v127 = v110;
  if (v110) {
    atomic_fetch_add_explicit(&v110->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  v111 = _Block_copy(v126);
  v112 = *(NSObject **)(v1 + 88);
  if (v112) {
    dispatch_retain(*(dispatch_object_t *)(v1 + 88));
  }
  v128 = v111;
  dispatch_object_t v129 = v112;
  abm::client::Transport::create(v1 + 104, cf, &v130, (uint64_t)&v128, v138);
  long long v113 = *(_OWORD *)v138;
  v138[0] = 0;
  v138[1] = 0;
  v114 = *(std::__shared_weak_count **)(v1 + 152);
  *(_OWORD *)(v1 + 144) = v113;
  if (v114 && !atomic_fetch_add(&v114->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
    std::__shared_weak_count::__release_weak(v114);
  }
  v115 = (std::__shared_weak_count *)v138[1];
  if (v138[1] && !atomic_fetch_add((atomic_ullong *volatile)v138[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v115->__on_zero_shared)(v115);
    std::__shared_weak_count::__release_weak(v115);
  }
  if (v129) {
    dispatch_release(v129);
  }
  if (v128) {
    _Block_release(v128);
  }
  v116 = v131;
  if (!v131 || atomic_fetch_add(&v131->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v117 = cf[0];
    if (!cf[0]) {
      goto LABEL_213;
    }
    goto LABEL_212;
  }
  ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
  std::__shared_weak_count::__release_weak(v116);
  CFTypeRef v117 = cf[0];
  if (cf[0]) {
LABEL_212:
  }
    CFRelease(v117);
LABEL_213:
  AppleBasebandManager::State::checkIn_sync((AppleBasebandManager::State *)v1);
  if (v127) {
    std::__shared_weak_count::__release_weak(v127);
  }
  v118 = *(std::__shared_weak_count **)&v148[8];
  if (*(void *)&v148[8])
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(*(void *)&v148[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
      std::__shared_weak_count::__release_weak(v118);
    }
  }
}

void sub_1C573CB6C(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *v2;
    if (*v2)
    {
      uint64_t v4 = v2[1];
      if (v4 != v3)
      {
        do
        {
          v4 -= 24;
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v4);
        }
        while (v4 != v3);
        JUMPOUT(0x1C573D130);
      }
      JUMPOUT(0x1C573D114);
    }
    JUMPOUT(0x1C573D13CLL);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CBA4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_1C573CC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,char a22,uint64_t a23,char a24,uint64_t a25,const void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  if (a21) {
    std::__shared_weak_count::__release_weak(a21);
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef(&a26);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a57);
  _Unwind_Resume(a1);
}

void sub_1C573CC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,char a29)
{
}

void sub_1C573CCA4(void *a1, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    __cxa_rethrow();
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CCE4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,atomic_uint *a52)
{
  if (a2)
  {
    __cxa_end_catch();
    if (a52 && atomic_fetch_add(a52 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)a52 + 16))(a52);
      if (atomic_fetch_add(a52 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)a52 + 24))(a52);
      }
    }
    JUMPOUT(0x1C573D16CLL);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CD7C(void *a1, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    unint64_t v3 = (unint64_t)v2[3];
    if (v3)
    {
      if ((v3 & 1) == 0)
      {
        uint64_t v4 = *(void (**)(void **, void **, uint64_t))(v3 & 0xFFFFFFFFFFFFFFFELL);
        if (v4) {
          v4(v2 + 4, v2 + 4, 2);
        }
      }
      v2[3] = 0;
    }
    uint64_t v5 = *v2;
    if (*v2)
    {
      uint64_t v6 = (uint64_t)v2[1];
      unint64_t v7 = *v2;
      if ((void *)v6 != v5)
      {
        do
        {
          v6 -= 24;
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v6);
        }
        while ((void *)v6 != v5);
        unint64_t v7 = *v2;
      }
      v2[1] = v5;
      operator delete(v7);
    }
    operator delete(v2);
    __cxa_rethrow();
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CE04(uint64_t a1, int a2)
{
  if (a2)
  {
    __cxa_end_catch();
    unint64_t v3 = *(atomic_uint **)(v2 + 40);
    if (v3 && atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
    JUMPOUT(0x1C573D144);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CE9C(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1C573D144);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CEA8(uint64_t a1, int a2)
{
  if (a2)
  {
    unint64_t v2 = STACK[0x228];
    if (STACK[0x228])
    {
      if ((uint64_t)(STACK[0x230] - 1) >= 0)
      {
        unint64_t v3 = v2 + 16 * STACK[0x230];
        do
        {
          uint64_t v4 = *(atomic_uint **)(v3 - 8);
          if (v4)
          {
            if (atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
              if (atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
              }
            }
          }
          v3 -= 16;
        }
        while (v3 > v2);
      }
      if (STACK[0x220] >= 0xB) {
        operator delete((void *)STACK[0x228]);
      }
    }
    JUMPOUT(0x1C573D174);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CF74(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1C573D09CLL);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CF80(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1C573D0C4);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CFA0(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1C573D100);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CFAC(uint64_t a1, int a2)
{
  if (a2) {
    JUMPOUT(0x1C573D14CLL);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CFB8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  if (a2)
  {
    boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::~shared_ptr((uint64_t)&a51);
    JUMPOUT(0x1C573D16CLL);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573CFD4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char *__p,char *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  if (a2)
  {
    boost::function0<void>::~function0(&a57);
    boost::function<void ()(void)>::~function(&a53);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>::~DispatchSlot((uint64_t)&a51);
    ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>::~DispatchSlot((uint64_t)&a49);
    if (a44)
    {
      if ((a44 & 1) == 0)
      {
        v57 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(a44 & 0xFFFFFFFFFFFFFFFELL);
        if (v57) {
          v57(&a45, &a45, 2);
        }
      }
    }
    if (__p)
    {
      unsigned int v58 = a42;
      unsigned int v59 = __p;
      if (a42 != __p)
      {
        do
        {
          v58 -= 24;
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content((uint64_t)v58);
        }
        while (v58 != __p);
        unsigned int v59 = __p;
      }
      operator delete(v59);
    }
    JUMPOUT(0x1C573D17CLL);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573D06C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  if (a2)
  {
    for (; v57; v57 += 24)
      boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v58 + v57);
    std::__split_buffer<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::~__split_buffer((uint64_t)&a57);
    boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content((uint64_t)&a53);
    (*(void (**)(uint64_t))(*(void *)v59 + 8))(v59);
    std::__shared_weak_count::__release_weak(a15);
    JUMPOUT(0x1C573D174);
  }
  JUMPOUT(0x1C573D164);
}

void sub_1C573D0D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void AppleBasebandManager::State::handleServerReady_sync(AppleBasebandManager::State *this)
{
  unint64_t v2 = *((void *)this + 5);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v4[0]) = 0;
    _os_log_debug_impl(&dword_1C5737000, v2, OS_LOG_TYPE_DEBUG, "#D Server ready", (uint8_t *)v4, 2u);
  }
  uint64_t v3 = **((void **)this + 18);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State9reconnectEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_35;
  v4[4] = v3;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v3 + 8), (uint64_t)v4);
  AppleBasebandManager::State::checkIn_sync(this);
  if (*((_DWORD *)this + 35)) {
    AppleBasebandManager::State::eventsOn_sync(this);
  }
}

void ___ZN20AppleBasebandManager5State4initEv_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v3);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)(a1 + 32);
      if (v7)
      {
        p_shared_owners = &v6->__shared_owners_;
        atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v9 = 2;
        switch(a2)
        {
          case 0:
            goto LABEL_6;
          case 1:
          case 4:
            LODWORD(v9) = 0;
LABEL_6:
            AppleBasebandManager::State::changeCheckInState_sync(v7, v9);
            goto LABEL_7;
          case 2:
            goto LABEL_11;
          case 3:
            a2 = 0;
LABEL_11:
            AppleBasebandManager::State::changeEventsState_sync(v7, a2);
            if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
              goto LABEL_12;
            }
            break;
          default:
LABEL_7:
            if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
              break;
            }
LABEL_12:
            ((void (*)(std::__shared_weak_count *, uint64_t))v6->__on_zero_shared)(v6, v9);
            std::__shared_weak_count::__release_weak(v6);
            if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
              goto LABEL_13;
            }
            return;
        }
      }
      if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_13:
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
}

uint64_t __copy_helper_block_e8_32c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void AppleBasebandManager::State::checkIn_sync(AppleBasebandManager::State *this)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v2 = *((_DWORD *)this + 34);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 5);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      if (v2 == 2)
      {
        HIBYTE(v8) = 9;
        strcpy((char *)&block, "CheckedIn");
      }
      else if (v2 == 1)
      {
        HIBYTE(v8) = 10;
        strcpy((char *)&block, "CheckingIn");
      }
      else
      {
        HIBYTE(v8) = 7;
        strcpy((char *)&block, "Unknown");
      }
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = &block;
      _os_log_debug_impl(&dword_1C5737000, v3, OS_LOG_TYPE_DEBUG, "#D Checked in state is %s, skipping", (uint8_t *)&buf, 0xCu);
      if (SHIBYTE(v8) < 0) {
        operator delete((void *)block);
      }
    }
  }
  else
  {
    AppleBasebandManager::State::changeCheckInState_sync((uint64_t)this, 1);
    uint64_t v4 = **((void **)this + 18);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 0x40000000;
    uint64_t v13 = ___ZN3abm6client9Transport5State7checkInEv_block_invoke;
    uint64_t v14 = &__block_descriptor_tmp_36;
    uint64_t v15 = v4;
    p_long long buf = &buf;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 0x40000000;
    long long v8 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    uint64_t v9 = &__block_descriptor_tmp_22;
    uint64_t v10 = v4 + 8;
    p_p_long long buf = &p_buf;
    uint64_t v5 = *(NSObject **)(v4 + 24);
    if (*(void *)(v4 + 32)) {
      dispatch_async_and_wait(v5, &block);
    }
    else {
      dispatch_sync(v5, &block);
    }
  }
}

uint64_t __copy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c53_ZTSNSt3__18weak_ptrIN20AppleBasebandManager5StateEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void *___ZNK3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS8__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

uint64_t ___ZN3ctu20SharedSynchronizableIN20AppleBasebandManager5StateEE13connect_eventIN5boost8signals26signalIFvvENS6_19optional_last_valueIvEEiNSt3__14lessIiEENS5_8functionIS8_EENSE_IFvRKNS6_10connectionEEEENS6_5mutexEEES2_vJEEEDTcl7connectfp_cvNSB_10shared_ptrIS2_EE_EcvP16dispatch_queue_s_EcvPFT1_DpT2_ELi0EEERT_MT0_FSR_ST_E_block_invoke(void *a1)
{
  uint64_t v1 = (uint64_t (*)(void *))a1[5];
  uint64_t v2 = a1[6];
  uint64_t v3 = (void *)(a1[4] + (v2 >> 1) - 72);
  if (v2) {
    return (*(uint64_t (**)(void))(*v3 + v1))();
  }
  else {
    return v1(v3);
  }
}

void **boost::signals2::slot<void ()(void),boost::function<void ()(void)>>::~slot(void **a1)
{
  unint64_t v2 = (unint64_t)a1[3];
  if (v2)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(void **, void **, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 4, a1 + 4, 2);
      }
    }
    a1[3] = 0;
  }
  uint64_t v4 = *a1;
  if (*a1)
  {
    uint64_t v5 = (uint64_t)a1[1];
    uint64_t v6 = *a1;
    if ((void *)v5 != v4)
    {
      do
      {
        v5 -= 24;
        boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v5);
      }
      while ((void *)v5 != v4);
      uint64_t v6 = *a1;
    }
    a1[1] = v4;
    operator delete(v6);
  }
  return a1;
}

uint64_t ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>::~DispatchSlot(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)a1);
  unint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

uint64_t boost::signals2::detail::garbage_collecting_lock<boost::signals2::mutex>::~garbage_collecting_lock(uint64_t a1)
{
  pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 184));
  unint64_t v2 = *(void *)(a1 + 168);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 176);
    if (v3 - 1 >= 0)
    {
      unint64_t v4 = v2 + 16 * v3;
      do
      {
        uint64_t v5 = *(atomic_uint **)(v4 - 8);
        if (v5)
        {
          if (atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
            if (atomic_fetch_add(v5 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v5 + 24))(v5);
            }
          }
        }
        v4 -= 16;
      }
      while (v4 > v2);
    }
    if (*(void *)(a1 + 160) >= 0xBuLL) {
      operator delete(*(void **)(a1 + 168));
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::~shared_ptr(uint64_t a1)
{
  unint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t *boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  a1[1] = 0;
  boost::detail::shared_count::shared_count<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(&v5, a2);
  uint64_t v3 = (atomic_uint *)a1[1];
  a1[1] = (uint64_t)v5;
  uint64_t v5 = v3;
  if (v3)
  {
    if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
  }
  return a1;
}

void sub_1C573D9FC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(atomic_uint **)(v1 + 8);
  if (v3 && atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
  {
    (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
    if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

void *boost::detail::shared_count::shared_count<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(void *a1, uint64_t a2)
{
  *a1 = 0;
  unint64_t v4 = operator new(0x18uLL);
  v4[1] = 0x100000001;
  void *v4 = &unk_1F20ED2D8;
  v4[2] = a2;
  *a1 = v4;
  return a1;
}

void sub_1C573DAEC(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1)
  {
    unint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3 && atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_1C573DC0C(_Unwind_Exception *a1)
{
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = (atomic_uint *)v1[3];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_base::destroy(uint64_t this)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(uint64_t *a1, uint64_t a2)
{
  *a1 = a2;
  a1[1] = 0;
  boost::detail::shared_count::shared_count<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(&v5, a2);
  uint64_t v3 = (atomic_uint *)a1[1];
  a1[1] = (uint64_t)v5;
  uint64_t v5 = v3;
  if (v3)
  {
    if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
  }
  return a1;
}

void sub_1C573DE80(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(atomic_uint **)(v1 + 8);
  if (v3 && atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
  {
    (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
    if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::list((void *)a1, (void *)a2);
  v4[3] = 0;
  v4[4] = 0;
  void v4[5] = 0;
  *((unsigned char *)v4 + 48) = *(unsigned char *)(a2 + 48);
  v4[3] = v4 + 4;
  uint64_t v5 = (void *)(a2 + 32);
  std::map<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::group_key_less<int,std::less<int>>,std::allocator<std::pair<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__tree_node<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,void *> *,long>>>(v4 + 3, *(int **)(a2 + 24), (int *)(a2 + 32));
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  uint64_t v6 = *(void **)(a2 + 24);
  if (v6 != (void *)(a2 + 32))
  {
    uint64_t v7 = *(void **)(a1 + 24);
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      v7[6] = v8;
      uint64_t v9 = a2;
      if (v6 != v5) {
        uint64_t v9 = v6[6];
      }
      uint64_t v10 = (void *)v6[1];
      uint64_t v11 = v10;
      uint64_t v12 = v6;
      if (v10)
      {
        do
        {
          uint64_t v13 = v11;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          uint64_t v13 = (void *)v12[2];
          BOOL v14 = *v13 == (void)v12;
          uint64_t v12 = v13;
        }
        while (!v14);
      }
      uint64_t v15 = a2;
      if (v13 != v5) {
        uint64_t v15 = v13[6];
      }
      while (v9 != v15)
      {
        uint64_t v9 = *(void *)(v9 + 8);
        uint64_t v8 = *(void *)(v8 + 8);
      }
      if (v10)
      {
        do
        {
          uint64_t v16 = v10;
          uint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          uint64_t v16 = (void *)v6[2];
          BOOL v14 = *v16 == (void)v6;
          uint64_t v6 = v16;
        }
        while (!v14);
      }
      uint64_t v17 = (void *)v7[1];
      if (v17)
      {
        do
        {
          uint64_t v18 = v17;
          uint64_t v17 = (void *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          uint64_t v18 = (void *)v7[2];
          BOOL v14 = *v18 == (void)v7;
          uint64_t v7 = v18;
        }
        while (!v14);
      }
      uint64_t v6 = v16;
      uint64_t v7 = v18;
    }
    while (v16 != v5);
  }
  return a1;
}

void sub_1C573E06C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(v2, *(void **)(v1 + 32));
  std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~list((uint64_t *)v1);
  _Unwind_Resume(a1);
}

void *std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::list(void *a1, void *a2)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  uint64_t v3 = (void *)a2[1];
  if (v3 != a2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1;
    do
    {
      uint64_t v7 = operator new(0x20uLL);
      uint64_t v8 = v3[3];
      v7[2] = v3[2];
      v7[3] = v8;
      if (v8)
      {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v8 + 8), 1u, memory_order_relaxed);
        uint64_t v6 = (void *)*a1;
        uint64_t v5 = a1[2];
      }
      void *v7 = v6;
      v7[1] = a1;
      v6[1] = v7;
      *a1 = v7;
      a1[2] = ++v5;
      uint64_t v3 = (void *)v3[1];
      uint64_t v6 = v7;
    }
    while (v3 != a2);
  }
  return a1;
}

void sub_1C573E134(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v5 = (uint64_t *)v1[1];
    uint64_t v6 = *v5;
    *(void *)(v6 + 8) = *(void *)(v3 + 8);
    **(void **)(v3 + 8) = v6;
    v1[2] = 0;
    if (v5 != v1)
    {
      do
      {
        uint64_t v7 = (uint64_t *)v5[1];
        uint64_t v8 = (atomic_uint *)v5[3];
        if (v8 && atomic_fetch_add(v8 + 2, 0xFFFFFFFF) == 1)
        {
          (*(void (**)(atomic_uint *))(*(void *)v8 + 16))(v8);
          if (atomic_fetch_add(v8 + 3, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v8 + 24))(v8);
          }
        }
        operator delete(v5);
        uint64_t v5 = v7;
      }
      while (v7 != v1);
    }
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::list<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~list(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t *std::map<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::group_key_less<int,std::less<int>>,std::allocator<std::pair<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__tree_node<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  if (a2 != a3)
  {
    v19[9] = v3;
    v19[10] = v4;
    uint64_t v6 = a2;
    uint64_t v7 = result;
    uint64_t v8 = result + 1;
    do
    {
      uint64_t v18 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      v19[0] = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
      uint64_t result = std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__find_equal<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>>(v7, v8, v19, &v18, v6 + 8);
      if (*result)
      {
        uint64_t v9 = (int *)*((void *)v6 + 1);
        if (v9) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v10 = result;
        uint64_t v11 = operator new(0x38uLL);
        uint64_t v12 = *((void *)v6 + 6);
        v11[2] = *((_OWORD *)v6 + 2);
        *((void *)v11 + 6) = v12;
        uint64_t v13 = v19[0];
        *(void *)uint64_t v11 = 0;
        *((void *)v11 + 1) = 0;
        *((void *)v11 + 2) = v13;
        *uint64_t v10 = (uint64_t)v11;
        BOOL v14 = *(void **)*v7;
        if (v14)
        {
          uint64_t *v7 = (uint64_t)v14;
          uint64_t v15 = (uint64_t *)*v10;
        }
        else
        {
          uint64_t v15 = (uint64_t *)v11;
        }
        uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v7[1], v15);
        ++v7[2];
        uint64_t v9 = (int *)*((void *)v6 + 1);
        if (v9)
        {
          do
          {
LABEL_11:
            uint64_t v16 = v9;
            uint64_t v9 = *(int **)v9;
          }
          while (v9);
          goto LABEL_3;
        }
      }
      do
      {
        uint64_t v16 = (int *)*((void *)v6 + 2);
        BOOL v17 = *(void *)v16 == (void)v6;
        uint64_t v6 = v16;
      }
      while (!v17);
LABEL_3:
      uint64_t v6 = v16;
    }
    while (v16 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__find_equal<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2) {
    goto LABEL_8;
  }
  int v6 = *a5;
  int v7 = *((_DWORD *)a2 + 8);
  if (*a5 == v7)
  {
    if (v6 != 1)
    {
LABEL_6:
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
    int v8 = a5[2];
    int v9 = *((_DWORD *)a2 + 10);
    if (v8 >= v9)
    {
      if (v9 >= v8) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
LABEL_8:
    uint64_t v11 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v13 = a2;
    }
    else
    {
      if (v11)
      {
        uint64_t v12 = (uint64_t *)*a2;
        do
        {
          uint64_t v13 = v12;
          uint64_t v12 = (uint64_t *)v12[1];
        }
        while (v12);
      }
      else
      {
        BOOL v17 = a2;
        do
        {
          uint64_t v13 = (uint64_t *)v17[2];
          BOOL v18 = *v13 == (void)v17;
          BOOL v17 = v13;
        }
        while (v18);
      }
      int v19 = *((_DWORD *)v13 + 8);
      int v20 = *a5;
      if (v19 == *a5)
      {
        if (v19 != 1 || *((_DWORD *)v13 + 10) >= a5[2]) {
          goto LABEL_24;
        }
      }
      else if (v19 >= v20)
      {
LABEL_24:
        char v21 = (void *)*v5;
        if (!*v5)
        {
          *a3 = v5;
          return a1 + 1;
        }
        if (v20 != 1)
        {
          while (1)
          {
            int v26 = *((_DWORD *)v21 + 8);
            char v23 = v21;
            if (v20 == v26) {
              break;
            }
            if (v20 < v26)
            {
              char v21 = (void *)*v21;
              uint64_t v5 = v23;
              if (!*v23) {
                break;
              }
            }
            else
            {
              if (v26 >= v20) {
                break;
              }
              uint64_t v5 = v21 + 1;
              char v21 = (void *)v21[1];
              if (!v21) {
                break;
              }
            }
          }
LABEL_40:
          *a3 = v23;
          return v5;
        }
        int v22 = a5[2];
        while (1)
        {
          char v23 = v21;
          int v24 = *((_DWORD *)v21 + 8);
          if (v24 == 1)
          {
            int v25 = *((_DWORD *)v23 + 10);
            if (v22 >= v25)
            {
              if (v25 >= v22) {
                goto LABEL_40;
              }
              goto LABEL_33;
            }
LABEL_27:
            char v21 = (void *)*v23;
            uint64_t v5 = v23;
            if (!*v23) {
              goto LABEL_40;
            }
          }
          else
          {
            if (v24 > 1) {
              goto LABEL_27;
            }
LABEL_33:
            uint64_t v5 = v23 + 1;
            char v21 = (void *)v23[1];
            if (!v21) {
              goto LABEL_40;
            }
          }
        }
      }
    }
    if (v11)
    {
      *a3 = v13;
      return v13 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  if (v6 < v7) {
    goto LABEL_8;
  }
  if (v7 >= v6) {
    goto LABEL_6;
  }
LABEL_15:
  uint64_t v14 = a2[1];
  if (v14)
  {
    uint64_t v15 = (uint64_t *)a2[1];
    do
    {
      uint64_t v16 = v15;
      uint64_t v15 = (uint64_t *)*v15;
    }
    while (v15);
  }
  else
  {
    v27 = a2;
    do
    {
      uint64_t v16 = (uint64_t *)v27[2];
      BOOL v18 = *v16 == (void)v27;
      v27 = v16;
    }
    while (!v18);
  }
  if (v16 == v5) {
    goto LABEL_56;
  }
  int v28 = *((_DWORD *)v16 + 8);
  if (v6 == v28)
  {
    if (v6 == 1)
    {
      int v29 = a5[2];
      if (v29 >= *((_DWORD *)v16 + 10))
      {
        v30 = (void *)*v5;
        if (!*v5)
        {
          *a3 = v5;
          return a1 + 1;
        }
        goto LABEL_61;
      }
      goto LABEL_56;
    }
    goto LABEL_58;
  }
  if (v6 < v28)
  {
LABEL_56:
    if (v14)
    {
      *a3 = v16;
      return v16;
    }
    else
    {
      *a3 = a2;
      return a2 + 1;
    }
  }
LABEL_58:
  v30 = (void *)*v5;
  if (*v5)
  {
    if (v6 == 1)
    {
      int v29 = a5[2];
LABEL_61:
      v31 = v30;
      while (1)
      {
        v30 = v31;
        int v32 = *((_DWORD *)v31 + 8);
        if (v32 == 1)
        {
          int v33 = *((_DWORD *)v30 + 10);
          if (v29 >= v33)
          {
            if (v33 >= v29) {
              goto LABEL_72;
            }
            goto LABEL_68;
          }
LABEL_62:
          v31 = (void *)*v30;
          uint64_t v5 = v30;
          if (!*v30) {
            goto LABEL_72;
          }
        }
        else
        {
          if (v32 > 1) {
            goto LABEL_62;
          }
LABEL_68:
          uint64_t v5 = v30 + 1;
          v31 = (void *)v30[1];
          if (!v31) {
            goto LABEL_72;
          }
        }
      }
    }
    int v34 = *((_DWORD *)v30 + 8);
    while (v6 != v34)
    {
      if (v6 < v34)
      {
        uint64_t v35 = *v30;
        uint64_t v5 = v30;
        if (!*v30) {
          break;
        }
      }
      else
      {
        if (v34 >= v6) {
          break;
        }
        uint64_t v5 = v30 + 1;
        uint64_t v35 = v30[1];
        if (!v35) {
          break;
        }
      }
      int v34 = *(_DWORD *)(v35 + 32);
      v30 = (void *)v35;
    }
  }
  else
  {
    v30 = a1 + 1;
  }
LABEL_72:
  *a3 = v30;
  return v5;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 == result) {
    return result;
  }
  while (1)
  {
    uint64_t v2 = a2[2];
    if (*(unsigned char *)(v2 + 24)) {
      return result;
    }
    uint64_t v3 = *(uint64_t **)(v2 + 16);
    uint64_t v4 = *v3;
    if (*v3 != v2) {
      break;
    }
    uint64_t v7 = v3[1];
    if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(unsigned char *)(v2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
          goto LABEL_15;
        }
      }
      else
      {
        int v9 = *(uint64_t **)(v2 + 8);
        uint64_t v10 = *v9;
        *(void *)(v2 + 8) = *v9;
        if (v10)
        {
          *(void *)(v10 + 16) = v2;
          uint64_t v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = v9;
        uint64_t *v9 = v2;
        *(void *)(v2 + 16) = v9;
        uint64_t v3 = (uint64_t *)v9[2];
        uint64_t v2 = *v3;
        *((unsigned char *)v9 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v11 = *(void *)(v2 + 8);
        *uint64_t v3 = v11;
        if (v11) {
LABEL_15:
        }
          *(void *)(v11 + 16) = v3;
      }
      *(void *)(v2 + 16) = v3[2];
      *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
      *(void *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(unsigned char *)(v2 + 24) = 1;
    a2 = v3;
    *((unsigned char *)v3 + 24) = v3 == result;
    *uint64_t v5 = 1;
    if (v3 == result) {
      return result;
    }
  }
  if (v4)
  {
    int v6 = *(unsigned __int8 *)(v4 + 24);
    uint64_t v5 = (unsigned char *)(v4 + 24);
    if (!v6) {
      goto LABEL_3;
    }
  }
  if (*(uint64_t **)v2 == a2)
  {
    uint64_t v12 = a2[1];
    *(void *)uint64_t v2 = v12;
    if (v12)
    {
      *(void *)(v12 + 16) = v2;
      uint64_t v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(void *)(*(void *)(v2 + 16) + 8 * (**(void **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(void *)(v2 + 16) = a2;
    uint64_t v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((unsigned char *)a2 + 24) = 1;
  *((unsigned char *)v3 + 24) = 0;
  uint64_t v13 = (uint64_t *)v3[1];
  uint64_t v14 = *v13;
  v3[1] = *v13;
  if (v14) {
    *(void *)(v14 + 16) = v3;
  }
  v13[2] = v3[2];
  *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v13;
  uint64_t *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

void std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void *boost::detail::shared_count::shared_count<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(void *a1, uint64_t a2)
{
  *a1 = 0;
  uint64_t v4 = operator new(0x18uLL);
  v4[1] = 0x100000001;
  void *v4 = &unk_1F20ED268;
  v4[2] = a2;
  *a1 = v4;
  return a1;
}

void sub_1C573E994(void *a1)
{
  __cxa_begin_catch(a1);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)(v1 + 3), (void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          uint64_t v5 = (uint64_t *)v3[1];
          int v6 = (atomic_uint *)v3[3];
          if (v6 && atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
          operator delete(v3);
          uint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
  __cxa_rethrow();
}

void sub_1C573EA84(_Unwind_Exception *a1)
{
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 16);
  if (v1)
  {
    std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)(v1 + 3), (void *)v1[4]);
    if (v1[2])
    {
      uint64_t v2 = (void *)*v1;
      uint64_t v3 = (uint64_t *)v1[1];
      uint64_t v4 = *v3;
      *(void *)(v4 + 8) = *(void *)(*v1 + 8);
      *(void *)v2[1] = v4;
      v1[2] = 0;
      if (v3 != v1)
      {
        do
        {
          uint64_t v5 = (uint64_t *)v3[1];
          int v6 = (atomic_uint *)v3[3];
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          operator delete(v3);
          uint64_t v3 = v5;
        }
        while (v5 != v1);
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::get_untyped_deleter()
{
  return 0;
}

uint64_t boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase(uint64_t *a1, int *a2, uint64_t **a3)
{
  int v6 = a1 + 4;
  uint64_t v5 = (uint64_t *)a1[4];
  if (!v5)
  {
    uint64_t v23 = a1[10];
    if ((uint64_t *)v23 != *a3) {
      goto LABEL_55;
    }
    int v19 = *(uint64_t **)(v23 + 8);
    int v9 = v6;
    int v24 = (uint64_t **)(v6 - 1);
    if (v19 != a1)
    {
LABEL_46:
      uint64_t v39 = a2;
      std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__emplace_unique_key_args<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::piecewise_construct_t const&,std::tuple<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const&>,std::tuple<>>(v24, a2, (uint64_t)&std::piecewise_construct, &v39)[6] = v19;
      goto LABEL_55;
    }
    goto LABEL_31;
  }
  int v7 = *a2;
  int v8 = a2[2];
  int v9 = v6;
  uint64_t v10 = v5;
  if (*a2 == 1)
  {
    do
    {
      while (1)
      {
        int v16 = *((_DWORD *)v10 + 8);
        BOOL v17 = v16 < 1;
        if (v16 == 1) {
          BOOL v17 = *((_DWORD *)v10 + 10) < v8;
        }
        if (!v17) {
          break;
        }
        uint64_t v10 = (uint64_t *)v10[1];
        if (!v10) {
          goto LABEL_19;
        }
      }
      int v9 = v10;
      uint64_t v10 = (uint64_t *)*v10;
    }
    while (v10);
  }
  else
  {
    do
    {
      int v11 = *((_DWORD *)v10 + 8);
      BOOL v12 = v11 == v7;
      BOOL v13 = v11 < v7;
      if (v11 >= v7) {
        uint64_t v14 = (uint64_t **)v10;
      }
      else {
        uint64_t v14 = (uint64_t **)(v10 + 1);
      }
      if (v13) {
        uint64_t v15 = v9;
      }
      else {
        uint64_t v15 = v10;
      }
      if (v12)
      {
        uint64_t v14 = (uint64_t **)v10;
        int v9 = v10;
      }
      else
      {
        int v9 = v15;
      }
      uint64_t v10 = *v14;
    }
    while (*v14);
  }
LABEL_19:
  uint64_t v18 = v9[6];
  if ((uint64_t *)v18 == *a3)
  {
    int v19 = *(uint64_t **)(v18 + 8);
    int v20 = v6;
    if (v7 == 1)
    {
      char v21 = v5;
      while (1)
      {
        int v22 = *((_DWORD *)v21 + 8);
        if (v22 == 1)
        {
          if (v8 < *((_DWORD *)v21 + 10)) {
            goto LABEL_27;
          }
LABEL_22:
          char v21 = (uint64_t *)v21[1];
          if (!v21) {
            goto LABEL_44;
          }
        }
        else
        {
          if (v22 <= 1) {
            goto LABEL_22;
          }
LABEL_27:
          int v20 = v21;
          char v21 = (uint64_t *)*v21;
          if (!v21) {
            goto LABEL_44;
          }
        }
      }
    }
    v27 = v5;
    do
    {
      int v28 = *((_DWORD *)v27 + 8);
      int v29 = (uint64_t **)(v27 + 1);
      BOOL v30 = v7 == v28;
      BOOL v31 = v7 < v28;
      if (v7 >= v28) {
        int v32 = (uint64_t **)(v27 + 1);
      }
      else {
        int v32 = (uint64_t **)v27;
      }
      if (!v31) {
        v27 = v20;
      }
      if (v30) {
        int v32 = v29;
      }
      else {
        int v20 = v27;
      }
      v27 = *v32;
    }
    while (*v32);
LABEL_44:
    if (v20 == v6)
    {
      int v24 = (uint64_t **)(v6 - 1);
      if (v19 != a1) {
        goto LABEL_46;
      }
    }
    else
    {
      int v24 = (uint64_t **)(v6 - 1);
      if (v19 != (uint64_t *)v20[6]) {
        goto LABEL_46;
      }
    }
LABEL_31:
    int v25 = (uint64_t *)v9[1];
    if (v25)
    {
      do
      {
        int v26 = v25;
        int v25 = (uint64_t *)*v25;
      }
      while (v25);
    }
    else
    {
      int v33 = v9;
      do
      {
        int v26 = (uint64_t *)v33[2];
        BOOL v12 = *v26 == (void)v33;
        int v33 = v26;
      }
      while (!v12);
    }
    if (*v24 == v9) {
      *int v24 = v26;
    }
    --a1[5];
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v5, v9);
    operator delete(v9);
  }
LABEL_55:
  int v34 = *a3;
  uint64_t v35 = **a3;
  uint64_t v36 = (*a3)[1];
  *(void *)(v35 + 8) = v36;
  *(void *)v34[1] = v35;
  --a1[2];
  v37 = (atomic_uint *)v34[3];
  if (v37)
  {
    if (atomic_fetch_add(v37 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v37 + 16))(v37);
      if (atomic_fetch_add(v37 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v37 + 24))(v37);
      }
    }
  }
  operator delete(v34);
  return v36;
}

void boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>(_DWORD *a1, void *a2)
{
  int v2 = a1[7] - 1;
  a1[7] = v2;
  if (!v2)
  {
    (*(void (**)(long long *__return_ptr))(*(void *)a1 + 40))(&v8);
    uint64_t v4 = a2[22];
    if (v4 == a2[20] && v4 != -1)
    {
      if (4 * v4 <= (unint64_t)(v4 + 1)) {
        unint64_t v5 = v4 + 1;
      }
      else {
        unint64_t v5 = 4 * v4;
      }
      boost::signals2::detail::auto_buffer<boost::shared_ptr<void>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::shared_ptr<void>>>::reserve_impl((uint64_t)a2, v5);
      uint64_t v4 = a2[22];
    }
    uint64_t v6 = *((void *)&v8 + 1);
    *(_OWORD *)(a2[21] + 16 * v4) = v8;
    if (v6)
    {
      atomic_fetch_add_explicit((atomic_uint *volatile)(v6 + 8), 1u, memory_order_relaxed);
      uint64_t v4 = a2[22];
    }
    a2[22] = v4 + 1;
    int v7 = (atomic_uint *)*((void *)&v8 + 1);
    if (*((void *)&v8 + 1) && atomic_fetch_add((atomic_uint *volatile)(*((void *)&v8 + 1) + 8), 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      if (atomic_fetch_add(v7 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 24))(v7);
      }
    }
  }
}

void sub_1C573EFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t **std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::__emplace_unique_key_args<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::piecewise_construct_t const&,std::tuple<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>> const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, void **a4)
{
  int v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    if (*a2 != 1)
    {
      int v18 = *((_DWORD *)v6 + 8);
      if (v8 == v18) {
        return (uint64_t **)v6;
      }
      uint64_t v10 = (uint64_t **)a1[1];
      while (1)
      {
        if (v8 < v18)
        {
          uint64_t v6 = *v10;
          int v7 = v10;
          if (!*v10) {
            goto LABEL_13;
          }
        }
        else
        {
          if (v18 >= v8) {
            return v10;
          }
          uint64_t v6 = v10[1];
          if (!v6)
          {
LABEL_11:
            int v7 = v10 + 1;
            goto LABEL_13;
          }
        }
        int v18 = *((_DWORD *)v6 + 8);
        uint64_t v10 = (uint64_t **)v6;
        if (v8 == v18) {
          return (uint64_t **)v6;
        }
      }
    }
    int v9 = a2[2];
    while (1)
    {
      uint64_t v10 = (uint64_t **)v6;
      int v11 = *((_DWORD *)v6 + 8);
      if (v11 == 1)
      {
        int v12 = *((_DWORD *)v6 + 10);
        if (v9 >= v12)
        {
          if (v12 >= v9) {
            return v10;
          }
          goto LABEL_10;
        }
LABEL_4:
        uint64_t v6 = (uint64_t *)*v6;
        int v7 = v10;
        if (!*v10) {
          goto LABEL_13;
        }
      }
      else
      {
        if (v11 > 1) {
          goto LABEL_4;
        }
LABEL_10:
        uint64_t v6 = (uint64_t *)v6[1];
        if (!v6) {
          goto LABEL_11;
        }
      }
    }
  }
  uint64_t v10 = a1 + 1;
LABEL_13:
  BOOL v13 = operator new(0x38uLL);
  int v14 = *((_DWORD *)*a4 + 2);
  v13[4] = **a4;
  *((_DWORD *)v13 + 10) = v14;
  v13[6] = 0;
  void *v13 = 0;
  v13[1] = 0;
  v13[2] = v10;
  atomic_uint *v7 = v13;
  uint64_t v15 = (uint64_t *)**a1;
  int v16 = v13;
  if (v15)
  {
    *a1 = v15;
    int v16 = *v7;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v16);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v13;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_10;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (!v2)
  {
    int v5 = 1;
    uint64_t v6 = (uint64_t **)v3[2];
    int v7 = *v6;
    if (*v6 == v3) {
      goto LABEL_6;
    }
LABEL_11:
    v6[1] = (uint64_t *)v2;
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
    goto LABEL_12;
  }
LABEL_10:
  int v5 = 0;
  *(void *)(v2 + 16) = v3[2];
  uint64_t v6 = (uint64_t **)v3[2];
  int v7 = *v6;
  if (*v6 != v3) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t *v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    int v7 = v6[1];
    int v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2) {
      goto LABEL_16;
    }
LABEL_12:
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
    goto LABEL_16;
  }
  int v7 = 0;
  uint64_t result = (uint64_t *)v2;
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2) {
    goto LABEL_12;
  }
LABEL_16:
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    int v14 = (uint64_t **)v7[2];
    if (*v14 != v7) {
      break;
    }
    if (*((unsigned char *)v7 + 24))
    {
      int v16 = (void *)*v7;
      if (*v7) {
        goto LABEL_48;
      }
    }
    else
    {
      *((unsigned char *)v7 + 24) = 1;
      *((unsigned char *)v14 + 24) = 0;
      int v20 = (uint64_t *)v7[1];
      void *v14 = v20;
      if (v20) {
        v20[2] = (uint64_t)v14;
      }
      v7[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (void)v14] = (uint64_t)v7;
      v7[1] = (uint64_t)v14;
      v14[2] = v7;
      if (result == (uint64_t *)v14) {
        uint64_t result = v7;
      }
      int v7 = *v14;
      int v16 = (void *)**v14;
      if (v16)
      {
LABEL_48:
        if (!*((unsigned char *)v16 + 24)) {
          goto LABEL_71;
        }
      }
    }
    char v21 = (uint64_t *)v7[1];
    if (v21 && !*((unsigned char *)v21 + 24))
    {
      if (v16 && !*((unsigned char *)v16 + 24))
      {
LABEL_71:
        char v21 = v7;
      }
      else
      {
        *((unsigned char *)v21 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = *v21;
        v7[1] = *v21;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        uint64_t v21[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v21;
        uint64_t *v21 = (uint64_t)v7;
        v7[2] = (uint64_t)v21;
        int v16 = v7;
      }
      v27 = (uint64_t *)v21[2];
      *((unsigned char *)v21 + 24) = *((unsigned char *)v27 + 24);
      *((unsigned char *)v27 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      uint64_t v28 = *v27;
      uint64_t v29 = *(void *)(*v27 + 8);
      uint64_t *v27 = v29;
      if (v29) {
        *(void *)(v29 + 16) = v27;
      }
      *(void *)(v28 + 16) = v27[2];
      *(void *)(v27[2] + 8 * (*(void *)v27[2] != (void)v27)) = v28;
      *(void *)(v28 + 8) = v27;
      v27[2] = v28;
      return result;
    }
    *((unsigned char *)v7 + 24) = 0;
    int v12 = (uint64_t *)v7[2];
    if (*((unsigned char *)v12 + 24)) {
      BOOL v13 = v12 == result;
    }
    else {
      BOOL v13 = 1;
    }
    if (v13) {
      goto LABEL_61;
    }
LABEL_24:
    int v7 = *(uint64_t **)(v12[2] + 8 * (*(void *)v12[2] == (void)v12));
  }
  if (*((unsigned char *)v7 + 24))
  {
    uint64_t v15 = (void *)*v7;
    if (!*v7)
    {
LABEL_38:
      int v19 = (uint64_t *)v7[1];
      if (v19 && !*((unsigned char *)v19 + 24)) {
        goto LABEL_67;
      }
      *((unsigned char *)v7 + 24) = 0;
      int v12 = (uint64_t *)v7[2];
      if (v12 == result)
      {
        int v12 = result;
LABEL_61:
        *((unsigned char *)v12 + 24) = 1;
        return result;
      }
      if (!*((unsigned char *)v12 + 24)) {
        goto LABEL_61;
      }
      goto LABEL_24;
    }
  }
  else
  {
    *((unsigned char *)v7 + 24) = 1;
    *((unsigned char *)v14 + 24) = 0;
    BOOL v17 = v14[1];
    int v18 = (uint64_t *)*v17;
    v14[1] = (uint64_t *)*v17;
    if (v18) {
      v18[2] = (uint64_t)v14;
    }
    v17[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (void)v14] = (uint64_t)v17;
    uint64_t *v17 = (uint64_t)v14;
    v14[2] = v17;
    if (result == (uint64_t *)*v7) {
      uint64_t result = v7;
    }
    int v7 = *(uint64_t **)(*v7 + 8);
    uint64_t v15 = (void *)*v7;
    if (!*v7) {
      goto LABEL_38;
    }
  }
  if (*((unsigned char *)v15 + 24)) {
    goto LABEL_38;
  }
  int v19 = (uint64_t *)v7[1];
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_67:
    uint64_t v15 = v7;
  }
  else
  {
    *((unsigned char *)v15 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v23 = v15[1];
    uint64_t *v7 = v23;
    if (v23) {
      *(void *)(v23 + 16) = v7;
    }
    v15[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
    v15[1] = v7;
    v7[2] = (uint64_t)v15;
    int v19 = v7;
  }
  uint64_t v24 = v15[2];
  *((unsigned char *)v15 + 24) = *(unsigned char *)(v24 + 24);
  *(unsigned char *)(v24 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  int v25 = *(uint64_t **)(v24 + 8);
  uint64_t v26 = *v25;
  *(void *)(v24 + 8) = *v25;
  if (v26) {
    *(void *)(v26 + 16) = v24;
  }
  v25[2] = *(void *)(v24 + 16);
  *(void *)(*(void *)(v24 + 16) + 8 * (**(void **)(v24 + 16) != v24)) = v25;
  *int v25 = v24;
  *(void *)(v24 + 16) = v25;
  return result;
}

void boost::signals2::detail::connection_body_base::~connection_body_base(boost::signals2::detail::connection_body_base *this)
{
  *(void *)this = &unk_1F20ECF88;
  uint64_t v1 = (atomic_uint *)*((void *)this + 2);
  if (v1)
  {
    if (atomic_fetch_add(v1 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v1 + 24))(v1);
    }
  }
}

void boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::~connection_body(void *a1)
{
  uint64_t v1 = boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::~connection_body(a1);
  operator delete(v1);
}

BOOL boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::connected(uint64_t a1)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[8] = v2;
  v14[9] = v2;
  v14[6] = v2;
  v14[7] = v2;
  v14[4] = v2;
  v14[5] = v2;
  v14[2] = v2;
  v14[3] = v2;
  v14[0] = v2;
  v14[1] = v2;
  uint64_t v3 = *(pthread_mutex_t **)(a1 + 48);
  unint64_t v15 = 10;
  int v16 = (char *)v14;
  uint64_t v17 = 0;
  int v18 = v3;
  pthread_mutex_lock(v3);
  uint64_t v4 = *(uint64_t **)(a1 + 32);
  if (v4)
  {
    uint64_t v5 = *v4;
    if (*v4 != v4[1])
    {
      while (1)
      {
        memset(v19, 170, 24);
        boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::apply_visitor<boost::signals2::detail::lock_weak_ptr_visitor const>(v5, (uint64_t)v19);
        if ((*(_DWORD *)v5 ^ (*(int *)v5 >> 31)) == 2)
        {
          if (!(*(unsigned int (**)(void))(**(void **)(v5 + 8) + 24))(*(void *)(v5 + 8))) {
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v6 = *(void *)(v5 + 16);
          if (v6 && atomic_load_explicit((atomic_uint *volatile)(v6 + 8), memory_order_acquire))
          {
LABEL_6:
            char v7 = 0;
            if (LODWORD(v19[0]) == SLODWORD(v19[0]) >> 31) {
              goto LABEL_13;
            }
            goto LABEL_7;
          }
        }
        if (*(unsigned char *)(a1 + 24))
        {
          *(unsigned char *)(a1 + 24) = 0;
          boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::mutex>((_DWORD *)a1, v14);
        }
        char v7 = 1;
        if (LODWORD(v19[0]) == SLODWORD(v19[0]) >> 31)
        {
LABEL_13:
          int v8 = (atomic_uint *)v19[2];
          if (v19[2])
          {
            if (atomic_fetch_add((atomic_uint *volatile)(v19[2] + 8), 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v8 + 16))(v8);
              if (atomic_fetch_add(v8 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v8 + 24))(v8);
              }
            }
          }
          goto LABEL_17;
        }
LABEL_7:
        if (v19[1]) {
          (*(void (**)(void))(*(void *)v19[1] + 8))(v19[1]);
        }
LABEL_17:
        if ((v7 & 1) == 0)
        {
          v5 += 24;
          if (v5 != *(void *)(*(void *)(a1 + 32) + 8)) {
            continue;
          }
        }
        break;
      }
    }
  }
  int v9 = *(unsigned __int8 *)(a1 + 24);
  pthread_mutex_unlock(v18);
  uint64_t v10 = v16;
  if (v16)
  {
    if (v17 - 1 >= 0)
    {
      uint64_t v11 = &v16[16 * v17];
      do
      {
        int v12 = (atomic_uint *)*((void *)v11 - 1);
        if (v12)
        {
          if (atomic_fetch_add(v12 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v12 + 16))(v12);
            if (atomic_fetch_add(v12 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v12 + 24))(v12);
            }
          }
        }
        v11 -= 16;
      }
      while (v11 > v10);
    }
    if (v15 >= 0xB) {
      operator delete(v16);
    }
  }
  return v9 != 0;
}

void sub_1C573F8F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::lock(uint64_t a1)
{
  return pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::unlock(uint64_t a1)
{
  return pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 48));
}

uint64_t boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::release_slot@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(result + 40);
  long long v2 = (void *)(result + 32);
  *a2 = *(void *)(result + 32);
  a2[1] = v3;
  if (v3)
  {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v3 + 8), 1u, memory_order_relaxed);
    uint64_t v4 = *(atomic_uint **)(result + 40);
    *long long v2 = 0;
    *(void *)(result + 40) = 0;
    if (v4 && atomic_fetch_add(v4 + 2, 0xFFFFFFFF) == 1)
    {
      uint64_t result = (*(uint64_t (**)(atomic_uint *))(*(void *)v4 + 16))(v4);
      if (atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
        return (*(uint64_t (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
      }
    }
  }
  else
  {
    *long long v2 = 0;
    *(void *)(result + 40) = 0;
  }
  return result;
}

void std::vector<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::__throw_length_error[abi:ne180100]()
{
}

atomic_uint *boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (*(int *)a1 >> 31);
  if (v1 == 2)
  {
    uint64_t result = *(atomic_uint **)(a1 + 8);
    if (result)
    {
      uint64_t v3 = *(uint64_t (**)(void))(*(void *)result + 8);
      return (atomic_uint *)v3();
    }
  }
  else if (v1 == 1)
  {
    uint64_t result = *(atomic_uint **)(a1 + 16);
    if (result && atomic_fetch_add(result + 3, 0xFFFFFFFF) == 1) {
      return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 24))(result);
    }
  }
  else
  {
    uint64_t result = *(atomic_uint **)(a1 + 16);
    if (result && atomic_fetch_add(result + 3, 0xFFFFFFFF) == 1) {
      return (atomic_uint *)(*(uint64_t (**)(atomic_uint *))(*(void *)result + 24))(result);
    }
  }
  return result;
}

void boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::dispose(uint64_t a1)
{
  int v1 = *(void ***)(a1 + 16);
  if (v1)
  {
    unint64_t v2 = (unint64_t)v1[3];
    if (v2)
    {
      if ((v2 & 1) == 0)
      {
        uint64_t v3 = *(void (**)(void **, void **, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
        if (v3) {
          v3(v1 + 4, v1 + 4, 2);
        }
      }
      v1[3] = 0;
    }
    uint64_t v4 = *v1;
    if (*v1)
    {
      uint64_t v5 = (uint64_t)v1[1];
      uint64_t v6 = *v1;
      if ((void *)v5 != v4)
      {
        do
        {
          v5 -= 24;
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(v5);
        }
        while ((void *)v5 != v4);
        uint64_t v6 = *v1;
      }
      v1[1] = v4;
      operator delete(v6);
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::slot<void ()(void),boost::function<void ()(void)>>>::get_untyped_deleter()
{
  return 0;
}

void *boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>::~connection_body(void *a1)
{
  *a1 = &unk_1F20ECF20;
  unint64_t v2 = (atomic_uint *)a1[7];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  uint64_t v3 = (atomic_uint *)a1[5];
  if (v3)
  {
    if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
      if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
      }
    }
  }
  *a1 = &unk_1F20ECF88;
  uint64_t v4 = (atomic_uint *)a1[2];
  if (v4 && atomic_fetch_add(v4 + 3, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v4 + 24))(v4);
  }
  return a1;
}

uint64_t boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>::~variant(uint64_t a1)
{
  if (*(_DWORD *)a1 == *(int *)a1 >> 31)
  {
    unint64_t v2 = *(atomic_uint **)(a1 + 16);
    if (v2 && atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
    return a1;
  }
  uint64_t v4 = *(void *)(a1 + 8);
  if (!v4) {
    return a1;
  }
  (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  return a1;
}

uint64_t boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::apply_visitor<boost::signals2::detail::lock_weak_ptr_visitor const>@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v3 = *(_DWORD *)result ^ (*(int *)result >> 31);
  if (v3 == 2)
  {
    (*(void (**)(uint64_t *__return_ptr))(**(void **)(result + 8) + 16))(&v8);
    *(void *)(a2 + 8) = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8);
    *(_DWORD *)a2 = 1;
    uint64_t result = v8;
    if (v8) {
      return (*(uint64_t (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
  }
  else if (v3 == 1)
  {
    uint64_t v4 = *(void *)(result + 16);
    if (v4)
    {
      uint64_t v5 = *(unsigned int *)(v4 + 8);
      while (v5)
      {
        uint64_t v6 = v5;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v4 + 8), (unsigned int *)&v6, v5 + 1, memory_order_relaxed, memory_order_relaxed);
        BOOL v7 = v6 == v5;
        uint64_t v5 = v6;
        if (v7)
        {
          *(void *)(a2 + 8) = *(void *)(result + 8);
          *(void *)(a2 + 16) = v4;
          *(_DWORD *)a2 = 0;
          return result;
        }
      }
      uint64_t v4 = 0;
    }
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = v4;
    *(_DWORD *)a2 = 0;
  }
  else
  {
    *(_DWORD *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  return result;
}

void sub_1C57400B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t *boost::function<void ()(void)>::~function(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      int v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 1, a1 + 1, 2);
      }
    }
    *a1 = 0;
  }
  return a1;
}

void boost::detail::function::functor_manager<ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>>::manage(uint64_t a1, _WORD *a2, unsigned int a3)
{
  if (a3 == 4) {
    goto LABEL_2;
  }
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      int v9 = (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v9 == (const char *)((unint64_t)"N3ctu12DispatchSlotIN8dispatch5blockIU13block_pointerFvvEEEEE" & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v9, (const char *)((unint64_t)"N3ctu12DispatchSlotIN8dispatch5blockIU13block_pointerFvvEEEEE" & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(void *)a2 = a1;
      }
      else
      {
        *(void *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      dispatch_release(*(dispatch_object_t *)a2);
      uint64_t v8 = (const void *)*((void *)a2 + 1);
      if (v8) {
LABEL_9:
      }
        _Block_release(v8);
    }
  }
  else
  {
    uint64_t v6 = *(NSObject **)a1;
    BOOL v7 = *(void **)(a1 + 8);
    *(void *)a2 = *(void *)a1;
    if (v7)
    {
      BOOL v7 = _Block_copy(v7);
      uint64_t v6 = *(NSObject **)a2;
    }
    *((void *)a2 + 1) = v7;
    dispatch_retain(v6);
    if (a3 == 1)
    {
      dispatch_release(*(dispatch_object_t *)a1);
      uint64_t v8 = *(const void **)(a1 + 8);
      if (v8) {
        goto LABEL_9;
      }
    }
  }
}

void boost::detail::function::void_function_obj_invoker0<ctu::DispatchSlot<dispatch::block<void({block_pointer})(void)>>,void>::invoke(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)a1;
  int v1 = *(const void **)(a1 + 8);
  if (!v1)
  {
    uint64_t v4 = 0;
    goto LABEL_10;
  }
  int v3 = _Block_copy(v1);
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_10:
    char v16 = 1;
LABEL_11:
    unint64_t v15 = 0;
    v20[0] = 0;
    goto LABEL_21;
  }
  uint64_t v5 = _Block_copy(v3);
  uint64_t v6 = v5;
  if (!v5)
  {
    char v16 = 0;
    goto LABEL_11;
  }
  BOOL v7 = _Block_copy(v5);
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = _Block_copy(v7);
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = _Block_copy(v9);
      int v12 = v11;
      if (v11)
      {
        BOOL v13 = _Block_copy(v11);
        int v14 = v13;
        if (v13)
        {
          unint64_t v15 = _Block_copy(v13);
          v20[0] = v15;
          _Block_release(v14);
        }
        else
        {
          unint64_t v15 = 0;
          v20[0] = 0;
        }
        _Block_release(v12);
      }
      else
      {
        unint64_t v15 = 0;
        v20[0] = 0;
      }
      _Block_release(v10);
    }
    else
    {
      unint64_t v15 = 0;
      v20[0] = 0;
    }
    _Block_release(v8);
  }
  else
  {
    unint64_t v15 = 0;
    v20[0] = 0;
  }
  _Block_release(v6);
  char v16 = 0;
LABEL_21:
  uint64_t v17 = operator new(0x20uLL);
  void *v17 = boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable;
  if (v15) {
    int v18 = _Block_copy(v15);
  }
  else {
    int v18 = 0;
  }
  v17[1] = v18;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvvEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_43;
  block[4] = v17;
  dispatch_async(v2, block);
  if (boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable)
  {
    if ((boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable & 1) == 0)
    {
      int v19 = *(void (**)(void *, void *, uint64_t))((unint64_t)boost::function0<void>::assign_to<dispatch::block<void({block_pointer})(void)>>(dispatch::block<void({block_pointer})(void)>)::stored_vtable & 0xFFFFFFFFFFFFFFFELL);
      if (v19) {
        v19(v20, v20, 2);
      }
    }
  }
  if ((v16 & 1) == 0) {
    _Block_release(v4);
  }
}

void sub_1C57404D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (v11) {
    _Block_release(v11);
  }
  if ((v12 & 1) == 0) {
    _Block_release(v10);
  }
  _Unwind_Resume(exception_object);
}

void ___Z13execute_blockP16dispatch_queue_sRKN5boost8functionIFvvEEE_block_invoke(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  if (!*v1)
  {
    std::runtime_error::runtime_error(&v6, "call to empty boost::function");
    v6.__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4B0;
    boost::throw_exception<boost::bad_function_call>(&v6);
  }
  (*(void (**)(void *))((*v1 & 0xFFFFFFFFFFFFFFFELL) + 8))(v1 + 1);
  int v3 = *(uint64_t **)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *v3;
    if (*v3)
    {
      if ((v4 & 1) == 0)
      {
        uint64_t v5 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v4 & 0xFFFFFFFFFFFFFFFELL);
        if (v5) {
          v5(v3 + 1, v3 + 1, 2);
        }
      }
      *int v3 = 0;
    }
    operator delete(v3);
  }
}

void sub_1C57405E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::runtime_error a9)
{
}

void boost::throw_exception<boost::bad_function_call>(const std::runtime_error *a1)
{
  exception = __cxa_allocate_exception(0x40uLL);
  boost::wrapexcept<boost::bad_function_call>::wrapexcept((uint64_t)exception, a1);
}

void sub_1C5740640(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t boost::wrapexcept<boost::bad_function_call>::wrapexcept(uint64_t a1, const std::runtime_error *a2)
{
  *(void *)a1 = &unk_1F20ED480;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), a2);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = -1;
  *(void *)a1 = &unk_1F20ED408;
  *(void *)(a1 + 8) = &unk_1F20ED438;
  *(void *)(a1 + 24) = &unk_1F20ED460;
  return a1;
}

uint64_t boost::wrapexcept<boost::bad_function_call>::~wrapexcept(uint64_t a1)
{
  *(void *)(a1 + 24) = &unk_1F20ED4D8;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 32) = 0;
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  return a1;
}

char *boost::wrapexcept<boost::bad_function_call>::clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x40uLL);
  *(void *)uint64_t v2 = &unk_1F20ED480;
  std::runtime_error::runtime_error((std::runtime_error *)(v2 + 8), (const std::runtime_error *)(a1 + 8));
  *((void *)v2 + 1) = &unk_1F20ED4B0;
  uint64_t v3 = *(void *)(a1 + 32);
  *((void *)v2 + 3) = &unk_1F20ED4D8;
  *((void *)v2 + 4) = v3;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 24))(v3);
  }
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  *((_DWORD *)v2 + 14) = *(_DWORD *)(a1 + 56);
  *(void *)uint64_t v2 = &unk_1F20ED408;
  *((void *)v2 + 1) = &unk_1F20ED438;
  *((void *)v2 + 3) = &unk_1F20ED460;
  boost::exception_detail::copy_boost_exception((uint64_t)(v2 + 24), a1 + 24);
  return v2;
}

void sub_1C57408C4(_Unwind_Exception *a1)
{
  std::runtime_error::~runtime_error(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1C57408E0(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 24))(v1);
  _Unwind_Resume(a1);
}

void boost::wrapexcept<boost::bad_function_call>::rethrow(uint64_t a1)
{
  exception = __cxa_allocate_exception(0x40uLL);
  boost::wrapexcept<boost::bad_function_call>::wrapexcept((uint64_t)exception, a1);
}

void sub_1C574095C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void boost::wrapexcept<boost::bad_function_call>::~wrapexcept(uint64_t a1)
{
  *(void *)(a1 + 24) = &unk_1F20ED4D8;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *(void *)(a1 + 32) = 0;
  }
  std::runtime_error::~runtime_error((std::runtime_error *)(a1 + 8));
  operator delete((void *)a1);
}

void non-virtual thunk to'boost::wrapexcept<boost::bad_function_call>::~wrapexcept(std::runtime_error *this)
{
  this[1].__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4D8;
  imp = this[1].__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(void *)imp + 32))(imp)) {
    this[1].__imp_.__imp_ = 0;
  }
  std::runtime_error::~runtime_error(this);
}

{
  const char *imp;
  uint64_t vars8;

  this[1].__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4D8;
  imp = this[1].__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(void *)imp + 32))(imp)) {
    this[1].__imp_.__imp_ = 0;
  }
  std::runtime_error::~runtime_error(this);
  operator delete(&this[-1].__imp_);
}

void non-virtual thunk to'boost::wrapexcept<boost::bad_function_call>::~wrapexcept(std::runtime_error *a1)
{
  a1->__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4D8;
  imp = a1->__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(void *)imp + 32))(imp)) {
    a1->__imp_.__imp_ = 0;
  }
  std::runtime_error::~runtime_error(a1 - 1);
}

{
  const char *imp;
  uint64_t vars8;

  a1->__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4D8;
  imp = a1->__imp_.__imp_;
  if (imp && (*(unsigned int (**)(const char *))(*(void *)imp + 32))(imp)) {
    a1->__imp_.__imp_ = 0;
  }
  std::runtime_error::~runtime_error(a1 - 1);
  operator delete(&a1[-2].__imp_);
}

void boost::bad_function_call::~bad_function_call(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);
  operator delete(v1);
}

uint64_t *boost::exception_detail::refcount_ptr<boost::exception_detail::error_info_container>::~refcount_ptr(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2 && (*(unsigned int (**)(uint64_t))(*(void *)v2 + 32))(v2)) {
    *a1 = 0;
  }
  return a1;
}

uint64_t boost::wrapexcept<boost::bad_function_call>::wrapexcept(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = &unk_1F20ED480;
  std::runtime_error::runtime_error((std::runtime_error *)(a1 + 8), (const std::runtime_error *)(a2 + 8));
  *(void *)(a1 + 8) = &unk_1F20ED4B0;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = &unk_1F20ED4D8;
  *(void *)(a1 + 32) = v4;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
  }
  long long v5 = *(_OWORD *)(a2 + 40);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v5;
  *(void *)a1 = &unk_1F20ED408;
  *(void *)(a1 + 8) = &unk_1F20ED438;
  *(void *)(a1 + 24) = &unk_1F20ED460;
  return a1;
}

void sub_1C5740DF8(_Unwind_Exception *a1)
{
  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

uint64_t boost::exception_detail::copy_boost_exception(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = 0;
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4)
  {
    uint64_t v5 = 0;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    uint64_t result = *(void *)(a1 + 8);
    if (!result) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v4 + 40))(&v7);
  uint64_t v5 = v7;
  uint64_t v8 = v7;
  if (v7)
  {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 32))(v7);
    }
  }
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  uint64_t result = *(void *)(a1 + 8);
  if (result) {
LABEL_8:
  }
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
LABEL_9:
  *(void *)(a1 + 8) = v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
    return (*(uint64_t (**)(uint64_t))(*(void *)v5 + 32))(v5);
  }
  return result;
}

void sub_1C5740F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void sub_1C5740FAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  boost::exception_detail::refcount_ptr<boost::exception_detail::error_info_container>::~refcount_ptr((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_1C5740FC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  boost::exception_detail::refcount_ptr<boost::exception_detail::error_info_container>::~refcount_ptr((uint64_t *)va);
  _Unwind_Resume(a1);
}

void boost::detail::function::functor_manager<dispatch::block<void({block_pointer})(void)>>::manage(void **a1, _WORD *a2, unsigned int a3)
{
  if (a3 == 4) {
    goto LABEL_2;
  }
  if (a3 > 1)
  {
    if (a3 == 3)
    {
      uint64_t v8 = (const char *)(*(void *)(*(void *)a2 + 8) & 0x7FFFFFFFFFFFFFFFLL);
      if (v8 == (const char *)((unint64_t)"N8dispatch5blockIU13block_pointerFvvEEE" & 0x7FFFFFFFFFFFFFFFLL)
        || !strcmp(v8, (const char *)((unint64_t)"N8dispatch5blockIU13block_pointerFvvEEE" & 0x7FFFFFFFFFFFFFFFLL)))
      {
        *(void *)a2 = a1;
      }
      else
      {
        *(void *)a2 = 0;
      }
    }
    else
    {
      if (a3 != 2)
      {
LABEL_2:
        a2[4] = 0;
        return;
      }
      uint64_t v7 = *(void **)a2;
      if (*(void *)a2) {
LABEL_9:
      }
        _Block_release(v7);
    }
  }
  else
  {
    std::runtime_error v6 = *a1;
    if (*a1) {
      std::runtime_error v6 = _Block_copy(v6);
    }
    *(void *)a2 = v6;
    if (a3 == 1)
    {
      uint64_t v7 = *a1;
      if (*a1) {
        goto LABEL_9;
      }
    }
  }
}

uint64_t boost::detail::function::void_function_obj_invoker0<dispatch::block<void({block_pointer})(void)>,void>::invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 16))();
}

uint64_t boost::function0<void>::move_assign(uint64_t result, uint64_t *a2)
{
  if (a2 != (uint64_t *)result)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (uint64_t *)result;
    uint64_t v4 = *a2;
    if (*a2)
    {
      *(void *)uint64_t result = v4;
      if (v4)
      {
        long long v7 = *(_OWORD *)(a2 + 1);
        *(void *)(result + 24) = a2[3];
        *(_OWORD *)(result + 8) = v7;
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v4 & 0xFFFFFFFFFFFFFFFELL))(a2 + 1, result + 8, 1);
      }
    }
    else
    {
      uint64_t v5 = *(void *)result;
      if (!*(void *)result) {
        return result;
      }
      if ((v5 & 1) == 0)
      {
        std::runtime_error v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 & 0xFFFFFFFFFFFFFFFELL);
        if (v6) {
          uint64_t result = v6(result + 8, result + 8, 2);
        }
      }
      uint64_t v2 = v3;
    }
    *uint64_t v2 = 0;
  }
  return result;
}

void sub_1C5741174(void *a1)
{
  __cxa_begin_catch(a1);
  void *v1 = 0;
  __cxa_rethrow();
}

void sub_1C5741184(_Unwind_Exception *a1)
{
}

uint64_t *boost::function0<void>::~function0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v3 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v2 & 0xFFFFFFFFFFFFFFFELL);
      if (v3) {
        v3(a1 + 1, a1 + 1, 2);
      }
    }
    *a1 = 0;
  }
  return a1;
}

uint64_t std::__split_buffer<boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 24;
    boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::destroy_content(i - 24);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::~foreign_weak_ptr_impl(void *a1)
{
  *a1 = &unk_1F20ED0C8;
  uint64_t v2 = (std::__shared_weak_count *)a1[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::~foreign_weak_ptr_impl(void *__p)
{
  *std::string __p = &unk_1F20ED0C8;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(__p);
}

void boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::lock(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 16);
  if (v4)
  {
    uint64_t v5 = std::__shared_weak_count::lock(v4);
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0;
LABEL_6:
  long long v7 = operator new(0x18uLL);
  void *v7 = &unk_1F20ED128;
  v7[1] = v6;
  v7[2] = v5;
  if (v5)
  {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    *a2 = v7;
    if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    *a2 = v7;
  }
}

void sub_1C57413FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::expired(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  return !v1 || *(void *)(v1 + 8) == -1;
}

void *boost::signals2::detail::foreign_weak_ptr_impl<std::weak_ptr<AppleBasebandManager::State>>::clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_1F20ED0C8;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<AppleBasebandManager::State>>::~foreign_shared_ptr_impl(void *result)
{
  uint64_t v1 = result;
  void *result = &unk_1F20ED128;
  uint64_t v2 = (std::__shared_weak_count *)result[2];
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

void boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<AppleBasebandManager::State>>::~foreign_shared_ptr_impl(void *__p)
{
  uint64_t v1 = __p;
  *std::string __p = &unk_1F20ED128;
  uint64_t v2 = (std::__shared_weak_count *)__p[2];
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    std::string __p = v1;
  }
  else if (((vars8 ^ (2 * vars8)) & 0x4000000000000000) != 0)
  {
    __break(0xC471u);
  }
  operator delete(__p);
}

void *boost::signals2::detail::foreign_shared_ptr_impl<std::shared_ptr<AppleBasebandManager::State>>::clone(uint64_t a1)
{
  uint64_t result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = &unk_1F20ED128;
  result[1] = v4;
  result[2] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(uint64_t a1)
{
  uint64_t v1 = a1 + 56;
  if (*(void *)(a1 + 56))
  {
    if (!*(void *)(a1 + 80) || (uint64_t v2 = std::__shared_weak_count::lock(*(std::__shared_weak_count **)(a1 + 80))) == 0) {
      std::__throw_bad_weak_ptr[abi:ne180100]();
    }
    uint64_t v3 = v2;
    ctu::LoggerCommonBase::getLogDomain((ctu::LoggerCommonBase *)(v1 - 48));
    ctu::TrackedLogger::registerLoggerToServer();
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1C5741758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

void sub_1C5741774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = &v4->__shared_owners_;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20ED338;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)a2;
  a1[1] = v4;
  if (!a2) {
    return a1;
  }
  uint64_t v6 = *(std::__shared_weak_count **)(a2 + 80);
  if (v6)
  {
    if (v6->__shared_owners_ == -1)
    {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *(void *)(a2 + 72) = a2;
      *(void *)(a2 + 80) = v4;
      std::__shared_weak_count::__release_weak(v6);
      if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
        goto LABEL_8;
      }
    }
    return a1;
  }
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit(&v4->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  *(void *)(a2 + 72) = a2;
  *(void *)(a2 + 80) = v4;
  if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
LABEL_8:
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void sub_1C57418A0(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<ConnectionObserver *,std::shared_ptr<ConnectionObserver>::__shared_ptr_default_delete<ConnectionObserver,ConnectionObserver>,std::allocator<ConnectionObserver>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<ConnectionObserver *,std::shared_ptr<ConnectionObserver>::__shared_ptr_default_delete<ConnectionObserver,ConnectionObserver>,std::allocator<ConnectionObserver>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<ConnectionObserver *,std::shared_ptr<ConnectionObserver>::__shared_ptr_default_delete<ConnectionObserver,ConnectionObserver>,std::allocator<ConnectionObserver>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE")) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrI18ConnectionObserverE27__shared_ptr_default_deleteIS1_S1_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void AppleBasebandManager::State::eventsOn_sync(AppleBasebandManager::State *this)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v2 = *((_DWORD *)this + 35);
  if (v2 == 1) {
    goto LABEL_4;
  }
  if (!v2)
  {
    AppleBasebandManager::State::changeEventsState_sync((uint64_t)this, 1);
LABEL_4:
    uint64_t v3 = **((void **)this + 18);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 0x40000000;
    int v14 = ___ZN3abm6client9Transport5State8eventsOnEv_block_invoke;
    unint64_t v15 = &__block_descriptor_tmp_49;
    uint64_t v16 = v3;
    p_long long buf = &buf;
    *(void *)&long long block = MEMORY[0x1E4F143A8];
    *((void *)&block + 1) = 0x40000000;
    int v9 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    uint64_t v10 = &__block_descriptor_tmp_22;
    uint64_t v11 = v3 + 8;
    p_p_long long buf = &p_buf;
    uint64_t v4 = *(NSObject **)(v3 + 24);
    if (*(void *)(v3 + 32)) {
      dispatch_async_and_wait(v4, &block);
    }
    else {
      dispatch_sync(v4, &block);
    }
    return;
  }
  uint64_t v5 = *((void *)this + 5);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v2 == 2)
    {
      strcpy((char *)&block, "EventsOn");
      char v6 = 8;
    }
    else
    {
      strcpy((char *)&block, "Unknown");
      char v6 = 7;
    }
    HIBYTE(v9) = v6;
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = &block;
    _os_log_debug_impl(&dword_1C5737000, v5, OS_LOG_TYPE_DEBUG, "#D Events state is %s, skipping", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(v9) < 0) {
      operator delete((void *)block);
    }
  }
}

void AppleBasebandManager::State::changeEventsState_sync(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)(a1 + 104);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v5 = (void *)*v5;
      int v6 = *(_DWORD *)(a1 + 140);
      if (v6 != 2)
      {
LABEL_4:
        if (v6 == 1)
        {
          char v10 = 14;
          strcpy((char *)v9, "EventsChanging");
          if (a2 != 2) {
            goto LABEL_14;
          }
        }
        else
        {
          if (!v6)
          {
            char v10 = 9;
            strcpy((char *)v9, "EventsOff");
            if (a2 == 2) {
              goto LABEL_12;
            }
LABEL_14:
            if (a2 == 1)
            {
              char v8 = 14;
              strcpy((char *)__p, "EventsChanging");
            }
            else if (a2)
            {
              char v8 = 7;
              strcpy((char *)__p, "Unknown");
            }
            else
            {
              char v8 = 9;
              strcpy((char *)__p, "EventsOff");
            }
LABEL_19:
            *(_DWORD *)long long buf = 136315650;
            char v12 = v5;
            __int16 v13 = 2080;
            int v14 = v9;
            __int16 v15 = 2080;
            uint64_t v16 = __p;
            _os_log_impl(&dword_1C5737000, v4, OS_LOG_TYPE_DEFAULT, "#I [%s] Changing event state from %s to %s", buf, 0x20u);
            if (v8 < 0)
            {
              operator delete(__p[0]);
              if ((v10 & 0x80000000) == 0) {
                goto LABEL_21;
              }
            }
            else if ((v10 & 0x80000000) == 0)
            {
              goto LABEL_21;
            }
            operator delete(v9[0]);
            goto LABEL_21;
          }
          char v10 = 7;
          strcpy((char *)v9, "Unknown");
          if (a2 != 2) {
            goto LABEL_14;
          }
        }
LABEL_12:
        char v8 = 8;
        strcpy((char *)__p, "EventsOn");
        goto LABEL_19;
      }
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 140);
      if (v6 != 2) {
        goto LABEL_4;
      }
    }
    char v10 = 8;
    strcpy((char *)v9, "EventsOn");
    if (a2 == 2) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
LABEL_21:
  *(_DWORD *)(a1 + 140) = a2;
}

void AppleBasebandManager::State::changeCheckInState_sync(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)(a1 + 104);
    if (*(char *)(a1 + 127) < 0)
    {
      uint64_t v5 = (void *)*v5;
      int v6 = *(_DWORD *)(a1 + 136);
      if (v6 != 2)
      {
LABEL_4:
        if (v6 == 1)
        {
          char v10 = 10;
          strcpy((char *)v9, "CheckingIn");
          if (a2 != 2) {
            goto LABEL_14;
          }
        }
        else
        {
          if (!v6)
          {
            char v10 = 12;
            strcpy((char *)v9, "NotCheckedIn");
            if (a2 == 2) {
              goto LABEL_12;
            }
LABEL_14:
            if (a2 == 1)
            {
              char v8 = 10;
              strcpy((char *)__p, "CheckingIn");
            }
            else if (a2)
            {
              char v8 = 7;
              strcpy((char *)__p, "Unknown");
            }
            else
            {
              char v8 = 12;
              strcpy((char *)__p, "NotCheckedIn");
            }
LABEL_19:
            *(_DWORD *)long long buf = 136315650;
            char v12 = v5;
            __int16 v13 = 2080;
            int v14 = v9;
            __int16 v15 = 2080;
            uint64_t v16 = __p;
            _os_log_impl(&dword_1C5737000, v4, OS_LOG_TYPE_DEFAULT, "#I [%s] Changing checked in state from %s to %s", buf, 0x20u);
            if (v8 < 0)
            {
              operator delete(__p[0]);
              if ((v10 & 0x80000000) == 0) {
                goto LABEL_21;
              }
            }
            else if ((v10 & 0x80000000) == 0)
            {
              goto LABEL_21;
            }
            operator delete(v9[0]);
            goto LABEL_21;
          }
          char v10 = 7;
          strcpy((char *)v9, "Unknown");
          if (a2 != 2) {
            goto LABEL_14;
          }
        }
LABEL_12:
        char v8 = 9;
        strcpy((char *)__p, "CheckedIn");
        goto LABEL_19;
      }
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 136);
      if (v6 != 2) {
        goto LABEL_4;
      }
    }
    char v10 = 9;
    strcpy((char *)v9, "CheckedIn");
    if (a2 == 2) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }
LABEL_21:
  *(_DWORD *)(a1 + 136) = a2;
}

void ___ZN20AppleBasebandManager5State15setEventHandlerENSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS1_10shared_ptrIN3abm6client5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)(a1 + 40), *(void *)(a1 + 48));
    uint64_t v3 = *(const void **)(a1 + 64);
    if (v3)
    {
LABEL_3:
      uint64_t v4 = _Block_copy(v3);
      uint64_t v5 = *(NSObject **)(a1 + 72);
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else
  {
    std::string v8 = *(std::string *)(a1 + 40);
    uint64_t v3 = *(const void **)(a1 + 64);
    if (v3) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  uint64_t v5 = *(NSObject **)(a1 + 72);
  if (v5) {
LABEL_4:
  }
    dispatch_retain(v5);
LABEL_5:
  int v6 = *(uint64_t **)(v2 + 144);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v11, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
  }
  else {
    std::string v11 = v8;
  }
  if (v4)
  {
    long long v7 = _Block_copy(v4);
    int v9 = v7;
    char v10 = v5;
    if (!v5) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  long long v7 = 0;
  int v9 = 0;
  char v10 = v5;
  if (v5) {
LABEL_13:
  }
    dispatch_retain(v5);
LABEL_14:
  abm::client::Transport::setEventHandler(v6, (uint64_t)&v11, (uint64_t)&v9);
  if (v5) {
    dispatch_release(v5);
  }
  if (v7) {
    _Block_release(v7);
  }
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
  if (v5) {
    dispatch_release(v5);
  }
  if (v4) {
    _Block_release(v4);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
}

void sub_1C57421E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if ((a16 & 0x80000000) == 0) {
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c86_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (std::string *)(a1 + 40);
  if (*(char *)(a2 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)(a2 + 40), *(void *)(a2 + 48));
    int v6 = *(void **)(a2 + 64);
    if (!v6) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  long long v5 = *(_OWORD *)(a2 + 40);
  v4->__r_.__value_.__r.__words[2] = *(void *)(a2 + 56);
  *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
  int v6 = *(void **)(a2 + 64);
  if (v6) {
LABEL_5:
  }
    int v6 = _Block_copy(v6);
LABEL_6:
  long long v7 = *(NSObject **)(a2 + 72);
  *(void *)(a1 + 64) = v6;
  *(void *)(a1 + 72) = v7;
  if (v7)
  {
    dispatch_retain(v7);
  }
}

void __destroy_helper_block_e8_40c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE64c86_ZTSN8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 72);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 64);
  if (v3) {
    _Block_release(v3);
  }
  if (*(char *)(a1 + 63) < 0)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    operator delete(v4);
  }
}

void ___ZN20AppleBasebandManager5State8eventsOnEv_block_invoke(uint64_t a1)
{
}

void ___ZN20AppleBasebandManager5State7performENSt3__110shared_ptrIN3abm6client7CommandEEE_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = (std::__shared_weak_count *)a1[6];
  long long v7 = v3;
  if (v3)
  {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = *(uint64_t **)(v2 + 144);
    int v9 = v3;
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = *(uint64_t **)(v2 + 144);
    int v9 = 0;
  }
  uint64_t v8 = v1;
  abm::client::Transport::perform(v4, &v8);
  long long v5 = v9;
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    int v6 = v7;
    if (!v7) {
      return;
    }
  }
  else
  {
    int v6 = v7;
    if (!v7) {
      return;
    }
  }
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v6);
  }
}

void sub_1C574247C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t __copy_helper_block_e8_40c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN20AppleBasebandManager5State9eventsOffEv_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 140);
  if (v2 == 1) {
    goto LABEL_4;
  }
  if (v2 == 2)
  {
    AppleBasebandManager::State::changeEventsState_sync(*(void *)(a1 + 32), 1);
LABEL_4:
    uint64_t v3 = **(void **)(v1 + 144);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 0x40000000;
    uint64_t v16 = ___ZN3abm6client9Transport5State9eventsOffEv_block_invoke;
    uint64_t v17 = &__block_descriptor_tmp_50;
    uint64_t v18 = v3;
    p_long long buf = &buf;
    long long block = (void *)MEMORY[0x1E4F143A8];
    uint64_t v10 = 0x40000000;
    std::string v11 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
    char v12 = &__block_descriptor_tmp_22;
    uint64_t v13 = v3 + 8;
    p_p_long long buf = &p_buf;
    uint64_t v4 = *(NSObject **)(v3 + 24);
    if (*(void *)(v3 + 32)) {
      dispatch_async_and_wait(v4, &block);
    }
    else {
      dispatch_sync(v4, &block);
    }
    return;
  }
  long long v5 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (v2)
    {
      qmemcpy(&block, "Unknown", 7);
      uint64_t v6 = 7;
      char v7 = 7;
    }
    else
    {
      LOBYTE(v10) = 102;
      long long block = *(void **)"EventsOff";
      uint64_t v6 = 9;
      char v7 = 9;
    }
    *((unsigned char *)&block + v6) = 0;
    HIBYTE(v11) = v7;
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = &block;
    _os_log_debug_impl(&dword_1C5737000, v5, OS_LOG_TYPE_DEBUG, "#D Events state is %s, skipping", (uint8_t *)&buf, 0xCu);
    if (SHIBYTE(v11) < 0) {
      operator delete(block);
    }
  }
}

uint64_t ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  int v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void std::__shared_ptr_pointer<AppleBasebandManager *,std::shared_ptr<AppleBasebandManager>::__shared_ptr_default_delete<AppleBasebandManager,AppleBasebandManager>,std::allocator<AppleBasebandManager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<AppleBasebandManager *,std::shared_ptr<AppleBasebandManager>::__shared_ptr_default_delete<AppleBasebandManager,AppleBasebandManager>,std::allocator<AppleBasebandManager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count ***)(a1 + 24);
  if (v1)
  {
    int v2 = v1[1];
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v3 = v1;
    }
    operator delete(v3);
  }
}

uint64_t std::__shared_ptr_pointer<AppleBasebandManager *,std::shared_ptr<AppleBasebandManager>::__shared_ptr_default_delete<AppleBasebandManager,AppleBasebandManager>,std::allocator<AppleBasebandManager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C57648A1) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C57648A1 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C57648A1)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C57648A1 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

uint64_t __cxx_global_var_init_8()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy, &ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance, &dword_1C5737000);
  }
  return result;
}

std::string *abm::trace::getBasebandTraceDirSuffix@<X0>(abm::trace *this@<X0>, std::string *a2@<X8>)
{
  int v2 = (int)this;
  memset(a2, 170, sizeof(std::string));
  *((unsigned char *)&a2->__r_.__value_.__s + 23) = 0;
  a2->__r_.__value_.__s.__data_[0] = 0;
  uint64_t result = (std::string *)capabilities::radio::vendor(this);
  if ((result - 2) >= 2)
  {
    if (result != 1) {
      return result;
    }
    if (v2)
    {
      *((unsigned char *)&a2->__r_.__value_.__s + 23) = 5;
      strcpy((char *)a2, "-qdss");
      return result;
    }
    long long v5 = abm::trace::kEURTraceSnapshotDirectorySuffix;
  }
  else
  {
    long long v5 = abm::trace::kICETraceSnapshotDirectorySuffix;
  }
  return std::string::__assign_external(a2, *v5);
}

void sub_1C5742A18(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

size_t std::string::basic_string[abi:ne180100]<0>(const char *a1)
{
  size_t result = strlen(a1);
  if (result >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v3 = result;
  if (result >= 0x17)
  {
    uint64_t v5 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17) {
      uint64_t v5 = result | 7;
    }
    uint64_t v6 = v5 + 1;
    uint64_t v4 = (long long *)operator new(v5 + 1);
    *((void *)&xmmword_1EB5069F0 + 1) = v3;
    unk_1EB506A00 = v6 | 0x8000000000000000;
    *(void *)&xmmword_1EB5069F0 = v4;
  }
  else
  {
    uint64_t v4 = &xmmword_1EB5069F0;
    byte_1EB506A07 = result;
    if (!result)
    {
      LOBYTE(xmmword_1EB5069F0) = 0;
      return result;
    }
  }
  size_t result = (size_t)memmove(v4, a1, v3);
  *((unsigned char *)v4 + v3) = 0;
  return result;
}

void abm::trace::getCoreDumpDirSuffix(std::string *a1@<X8>)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&_MergedGlobals, memory_order_acquire) & 1) == 0)
  {
    uint64_t v4 = (capabilities::radio *)__cxa_guard_acquire(&_MergedGlobals);
    if (v4)
    {
      int v5 = capabilities::radio::maverick(v4);
      uint64_t v6 = abm::trace::kEURCoreDumpSnapshotDirectorySuffix;
      if (!v5) {
        uint64_t v6 = abm::trace::kCoreDumpSnapshotDirectorySuffix;
      }
      std::string::basic_string[abi:ne180100]<0>(*v6);
      __cxa_guard_release(&_MergedGlobals);
    }
  }
  if (byte_1EB506A07 < 0)
  {
    long long v3 = xmmword_1EB5069F0;
    std::string::__init_copy_ctor_external(a1, (const std::string::value_type *)v3, *((std::string::size_type *)&v3 + 1));
  }
  else
  {
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = xmmword_1EB5069F0;
    a1->__r_.__value_.__r.__words[2] = unk_1EB506A00;
  }
}

void sub_1C5742BB8(_Unwind_Exception *a1)
{
}

uint64_t abm::trace::isSupported(uint64_t a1)
{
  uint64_t v1 = (const char *)a1;
  int v2 = *(char *)(a1 + 23);
  if (v2 < 0)
  {
    long long v3 = (capabilities::radio *)strcasecmp(*(const char **)a1, (const char *)abm::trace::kDIAG);
    if (v3)
    {
LABEL_3:
      uint64_t v4 = v1;
      if ((v2 & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    long long v3 = (capabilities::radio *)strcasecmp((const char *)a1, (const char *)abm::trace::kDIAG);
    if (v3) {
      goto LABEL_3;
    }
  }
  if (capabilities::radio::maverick(v3)) {
    return 1;
  }
  LOBYTE(v2) = v1[23];
  uint64_t v4 = v1;
  if ((v2 & 0x80) == 0)
  {
LABEL_4:
    int v5 = (capabilities::radio *)strcasecmp(v4, (const char *)abm::trace::kICETrace);
    if (v5) {
      goto LABEL_5;
    }
LABEL_12:
    if (capabilities::radio::ice(v5)) {
      return 1;
    }
    LOBYTE(v2) = v1[23];
    if ((v2 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_11:
  int v5 = (capabilities::radio *)strcasecmp(*(const char **)v1, (const char *)abm::trace::kICETrace);
  if (!v5) {
    goto LABEL_12;
  }
LABEL_5:
  if ((v2 & 0x80) == 0)
  {
LABEL_6:
    uint64_t v6 = v1;
    if (!strcasecmp(v1, (const char *)abm::trace::kBasebandTrace)) {
      return 1;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = *(const char **)v1;
  if (!strcasecmp(*(const char **)v1, (const char *)abm::trace::kBasebandTrace)) {
    return 1;
  }
LABEL_15:
  char v7 = (capabilities::radio *)strcasecmp(v6, (const char *)abm::trace::kEURCoreDump);
  if (v7)
  {
    if ((v2 & 0x80) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
    if (capabilities::radio::maverick(v7)) {
      return 1;
    }
    if ((v1[23] & 0x80) == 0)
    {
LABEL_17:
      if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump)
        || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs))
      {
        return 1;
      }
      if (!strcasecmp(v1, (const char *)abm::trace::kCompression)) {
        goto LABEL_40;
      }
      if (strcasecmp(v1, (const char *)abm::trace::kBasebandIPC))
      {
        if (!strcasecmp(v1, (const char *)abm::trace::kIPC)
          || !strcasecmp(v1, "KernelPCI")
          || !strcasecmp(v1, (const char *)abm::trace::kTapToRadar))
        {
          goto LABEL_40;
        }
LABEL_34:
        if (strcasecmp(v1, (const char *)abm::trace::kProfile))
        {
          if (strcasecmp(v1, (const char *)abm::trace::kTraceTailspin)
            && strcasecmp(v1, "Settings")
            && strcasecmp(v1, "LogFilter"))
          {
            return 0;
          }
          goto LABEL_40;
        }
        return 1;
      }
      goto LABEL_43;
    }
  }
  uint64_t v1 = *(const char **)v1;
  if (!strcasecmp(v1, (const char *)abm::trace::kCoreDump) || !strcasecmp(v1, (const char *)abm::trace::kSystemLogs)) {
    return 1;
  }
  if (!strcasecmp(v1, (const char *)abm::trace::kCompression)) {
    goto LABEL_40;
  }
  if (strcasecmp(v1, (const char *)abm::trace::kBasebandIPC))
  {
    if (!strcasecmp(v1, (const char *)abm::trace::kIPC)
      || !strcasecmp(v1, "KernelPCI")
      || !strcasecmp(v1, (const char *)abm::trace::kTapToRadar))
    {
LABEL_40:
      return MEMORY[0x1F417D688]();
    }
    goto LABEL_34;
  }
LABEL_43:
  return MEMORY[0x1F417D648]();
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      size_t v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        int v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          char v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22) {
            operator delete(v9);
          }
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        std::string::size_type v12 = 2 * v8;
        if (__n > 2 * v8) {
          std::string::size_type v12 = __n;
        }
        uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17) {
          uint64_t v13 = v12 | 7;
        }
        if (v12 >= 0x17) {
          size_t v11 = v13 + 1;
        }
        else {
          size_t v11 = 23;
        }
        goto LABEL_15;
      }
LABEL_25:
      std::string::__throw_length_error[abi:ne180100]();
    }
    unint64_t v6 = HIBYTE(v10);
    char v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    char v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        unint64_t v8 = 22;
        int v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_23;
  }
  *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((unsigned char *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void abm::client::GetTraceProperty(xpc_object_t object@<X1>, uint64_t *a2@<X0>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a2)
  {
    int v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v9;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v6 = object;
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    if (!v6)
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1C878FBE0](v6) == v8)
  {
    xpc_retain(v6);
    xpc_object_t v10 = v6;
  }
  else
  {
    xpc_object_t v10 = xpc_null_create();
  }
LABEL_10:
  xpc_release(v6);
  if (MEMORY[0x1C878FBE0](v10) == v8)
  {
    if (a3) {
      a3 = _Block_copy(a3);
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 1174405120;
    v18[2] = ___ZN3abm6client16GetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke;
    v18[3] = &__block_descriptor_tmp_4;
    if (a3) {
      std::string::size_type v12 = _Block_copy(a3);
    }
    else {
      std::string::size_type v12 = 0;
    }
    aBlock = v12;
    uint64_t v13 = *a2;
    xpc_object_t objecta = v10;
    std::string __p = operator new(0x20uLL);
    long long v17 = xmmword_1C5764C60;
    strcpy((char *)__p, "kCommandGetTraceProperty");
    if (v10) {
      xpc_retain(v10);
    }
    else {
      xpc_object_t objecta = xpc_null_create();
    }
    abm::client::Manager::perform(v13, (int)&__p, v18, &objecta);
    xpc_release(objecta);
    xpc_object_t objecta = 0;
    if (SHIBYTE(v17) < 0)
    {
      operator delete(__p);
      *(_DWORD *)a4 = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 8) = 0;
      int v14 = aBlock;
      if (!aBlock) {
        goto LABEL_25;
      }
    }
    else
    {
      *(_DWORD *)a4 = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 8) = 0;
      int v14 = aBlock;
      if (!aBlock)
      {
LABEL_25:
        if (a3) {
          _Block_release(a3);
        }
        goto LABEL_27;
      }
    }
    _Block_release(v14);
    goto LABEL_25;
  }
  size_t v11 = (char *)operator new(0x20uLL);
  strcpy(v11, "Invalid input dictionary passed");
  *(_DWORD *)a4 = -534716414;
  *(void *)(a4 + 8) = v11;
  *(_OWORD *)(a4 + 16) = xmmword_1C5764C50;
LABEL_27:
  xpc_release(v10);
}

void sub_1C57432E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client16GetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  xpc_object_t v6 = xpc_null_create();
  xpc_object_t v19 = v6;
  if (!*(_DWORD *)a2)
  {
    memset(v18, 170, sizeof(v18));
    xpc_object_t value = xpc_dictionary_get_value(*a3, "kKeyTracePropertyName");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    std::string __p = 0;
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = 0uLL;
    xpc::dyn_cast_or_default();
    xpc_release(object);
    int v9 = (void *)HIBYTE(v18[2]);
    if (SHIBYTE(v18[2]) < 0) {
      int v9 = v18[1];
    }
    if (v9)
    {
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
      {
        if (MEMORY[0x1C878FBE0](v10) == MEMORY[0x1E4F14590])
        {
          xpc_retain(v10);
          xpc_object_t v11 = v10;
        }
        else
        {
          xpc_object_t v11 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v11 = xpc_null_create();
        xpc_object_t v10 = 0;
      }
      xpc_release(v10);
      xpc_object_t v13 = xpc_null_create();
      xpc_object_t v14 = v19;
      xpc_object_t v19 = v11;
      xpc_release(v14);
      xpc_release(v13);
      __int16 v15 = v18;
      if (SHIBYTE(v18[2]) < 0) {
        __int16 v15 = (void **)v18[0];
      }
      std::string __p = &v19;
      v21.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
      xpc::dict::object_proxy::operator=(&v16, (uint64_t)&__p, *a3, "kKeyTracePropertyValue");
      xpc_release(v16);
      xpc_object_t v16 = 0;
      if (SHIBYTE(v18[2]) < 0) {
LABEL_24:
      }
        operator delete(v18[0]);
    }
    else
    {
      std::string::size_type v12 = (char *)operator new(0x28uLL);
      strcpy(v12, "Invalid trace property key returned");
      *(_DWORD *)a2 = -534716416;
      if (*(char *)(a2 + 31) < 0) {
        operator delete(*(void **)(a2 + 8));
      }
      *(void *)(a2 + 8) = v12;
      *(_OWORD *)(a2 + 16) = xmmword_1C5764C80;
      if (SHIBYTE(v18[2]) < 0) {
        goto LABEL_24;
      }
    }
    xpc_object_t v6 = v19;
    uint64_t v7 = *(void *)(a1 + 32);
    LODWORD(__p) = *(_DWORD *)a2;
    if ((*(char *)(a2 + 31) & 0x80000000) == 0) {
      goto LABEL_4;
    }
LABEL_26:
    std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
    goto LABEL_27;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  LODWORD(__p) = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0) {
    goto LABEL_26;
  }
LABEL_4:
  std::string v21 = *(std::string *)(a2 + 8);
LABEL_27:
  (*(void (**)(uint64_t, void **, xpc_object_t))(v7 + 16))(v7, &__p, v6);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  xpc_release(v19);
}

void sub_1C574360C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t a10, void *__p, uint64_t a12, uint64_t a13, xpc_object_t object, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,int a21,__int16 a22,char a23,char a24)
{
  if (v24 < 0) {
    operator delete(__p);
  }
  xpc_release(object);
  _Unwind_Resume(a1);
}

void xpc::dict::object_proxy::operator=(void *a1, uint64_t a2, xpc_object_t xdict, char *key)
{
  xpc_object_t value = xpc_dictionary_get_value(xdict, key);
  xpc_object_t v7 = value;
  if (value)
  {
    xpc_retain(value);
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    if (!v7)
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v7 = 0;
      goto LABEL_5;
    }
  }
  xpc_retain(v7);
  xpc_object_t v8 = v7;
LABEL_5:
  xpc_dictionary_set_value(**(xpc_object_t **)a2, *(const char **)(a2 + 8), v8);
  *a1 = v8;
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v7);
}

void abm::client::SetTraceProperty(xpc_object_t object@<X1>, uint64_t *a2@<X0>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a2)
  {
    xpc_object_t v9 = (char *)operator new(0x20uLL);
    strcpy(v9, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v9;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v6 = object;
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    if (!v6)
    {
      xpc_object_t v10 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1C878FBE0](v6) == v8)
  {
    xpc_retain(v6);
    xpc_object_t v10 = v6;
  }
  else
  {
    xpc_object_t v10 = xpc_null_create();
  }
LABEL_10:
  xpc_release(v6);
  if (MEMORY[0x1C878FBE0](v10) == v8)
  {
    xpc_object_t v12 = xpc_BOOL_create(1);
    if (!v12) {
      xpc_object_t v12 = xpc_null_create();
    }
    xpc_dictionary_set_value(v10, "kKeyTracePropertyWaitForCompletion", v12);
    xpc_object_t v13 = xpc_null_create();
    xpc_release(v12);
    xpc_release(v13);
    if (a3) {
      a3 = _Block_copy(a3);
    }
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 1174405120;
    v20[2] = ___ZN3abm6client16SetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke;
    void v20[3] = &__block_descriptor_tmp_6;
    if (a3) {
      xpc_object_t v14 = _Block_copy(a3);
    }
    else {
      xpc_object_t v14 = 0;
    }
    aBlock = v14;
    uint64_t v15 = *a2;
    xpc_object_t objecta = v10;
    std::string __p = operator new(0x20uLL);
    long long v19 = xmmword_1C5764C60;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    if (v10) {
      xpc_retain(v10);
    }
    else {
      xpc_object_t objecta = xpc_null_create();
    }
    abm::client::Manager::perform(v15, (int)&__p, v20, &objecta);
    xpc_release(objecta);
    xpc_object_t objecta = 0;
    if (SHIBYTE(v19) < 0)
    {
      operator delete(__p);
      *(_DWORD *)a4 = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 8) = 0;
      xpc_object_t v16 = aBlock;
      if (!aBlock) {
        goto LABEL_27;
      }
    }
    else
    {
      *(_DWORD *)a4 = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 8) = 0;
      xpc_object_t v16 = aBlock;
      if (!aBlock)
      {
LABEL_27:
        if (a3) {
          _Block_release(a3);
        }
        goto LABEL_29;
      }
    }
    _Block_release(v16);
    goto LABEL_27;
  }
  xpc_object_t v11 = (char *)operator new(0x20uLL);
  strcpy(v11, "Invalid input dictionary passed");
  *(_DWORD *)a4 = -534716414;
  *(void *)(a4 + 8) = v11;
  *(_OWORD *)(a4 + 16) = xmmword_1C5764C50;
LABEL_29:
  xpc_release(v10);
}

void sub_1C5743A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client16SetTracePropertyENSt3__110shared_ptrINS0_7ManagerEEEPvU13block_pointerFvN12TelephonyXPC6ResultES5_E_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, void))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C5743B78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::CollectTelephonyLogs(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a1)
  {
    xpc_object_t v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (xpc_object_t v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v8) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v8);
      xpc_object_t v9 = v8;
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v8 = 0;
  }
  xpc_release(v8);
  if (*(char *)(a2 + 23) >= 0) {
    xpc_object_t v11 = (const char *)a2;
  }
  else {
    xpc_object_t v11 = *(const char **)a2;
  }
  xpc_object_t v12 = xpc_string_create(v11);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "kKeyTraceDumpStateReason", v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  xpc_object_t v14 = xpc_string_create("kCollectTelephonyLogs");
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "kKeyTraceAction", v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (a3) {
    a3 = _Block_copy(a3);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 1174405120;
  v22[2] = ___ZN3abm6client20CollectTelephonyLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v22[3] = &__block_descriptor_tmp_9;
  if (a3) {
    xpc_object_t v16 = _Block_copy(a3);
  }
  else {
    xpc_object_t v16 = 0;
  }
  aBlock = v16;
  uint64_t v17 = *a1;
  strcpy(__p, "kCommandTraceDumpState");
  char v21 = 22;
  xpc_object_t object = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v17, (int)__p, v22, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v21 & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    *(void *)(a4 + 8) = 0;
    uint64_t v18 = aBlock;
    if (!aBlock) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a4 = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 8) = 0;
  uint64_t v18 = aBlock;
  if (aBlock) {
LABEL_28:
  }
    _Block_release(v18);
LABEL_29:
  if (a3) {
    _Block_release(a3);
  }
  xpc_release(v9);
}

void sub_1C5743E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client20CollectTelephonyLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *a3;
    int v5 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C5743FC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::CollectTelephonyLogsWithCoredump(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a1)
  {
    xpc_object_t v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (xpc_object_t v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v8) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v8);
      xpc_object_t v9 = v8;
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v8 = 0;
  }
  xpc_release(v8);
  xpc_object_t v11 = xpc_string_create("HardReset");
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "KeyBasebandResetType", v11);
  xpc_object_t v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  xpc_object_t v13 = xpc_string_create("OtherErrors");
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "KeyBasebandResetSubType", v13);
  xpc_object_t v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  xpc_object_t v15 = xpc_string_create("kCollectTelephonyLogsWithCoredump");
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "kKeyTraceAction", v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v17 = (const char *)a2;
  }
  else {
    uint64_t v17 = *(const char **)a2;
  }
  xpc_object_t v18 = xpc_string_create(v17);
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "KeyBasebandResetReason", v18);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  if (a3) {
    a3 = _Block_copy(a3);
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 1174405120;
  v26[2] = ___ZN3abm6client32CollectTelephonyLogsWithCoredumpENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v26[3] = &__block_descriptor_tmp_12;
  if (a3) {
    int v20 = _Block_copy(a3);
  }
  else {
    int v20 = 0;
  }
  aBlock = v20;
  uint64_t v21 = *a1;
  char v25 = 20;
  strcpy(__p, "CommandResetBaseband");
  xpc_object_t object = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v21, (int)__p, v26, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v25 & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    *(void *)(a4 + 8) = 0;
    uint64_t v22 = aBlock;
    if (!aBlock) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a4 = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 8) = 0;
  uint64_t v22 = aBlock;
  if (aBlock) {
LABEL_32:
  }
    _Block_release(v22);
LABEL_33:
  if (a3) {
    _Block_release(a3);
  }
  xpc_release(v9);
}

void sub_1C5744358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client32CollectTelephonyLogsWithCoredumpENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *a3;
    int v5 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C57444C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::CollectBasebandLogs(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a1)
  {
    xpc_object_t v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (xpc_object_t v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v8) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v8);
      xpc_object_t v9 = v8;
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v8 = 0;
  }
  xpc_release(v8);
  if (*(char *)(a2 + 23) >= 0) {
    xpc_object_t v11 = (const char *)a2;
  }
  else {
    xpc_object_t v11 = *(const char **)a2;
  }
  xpc_object_t v12 = xpc_string_create(v11);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "kKeyTraceDumpStateReason", v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  xpc_object_t v14 = xpc_string_create("kCollectBasebandLogs");
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "kKeyTraceAction", v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (a3) {
    a3 = _Block_copy(a3);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 1174405120;
  v22[2] = ___ZN3abm6client19CollectBasebandLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v22[3] = &__block_descriptor_tmp_15;
  if (a3) {
    xpc_object_t v16 = _Block_copy(a3);
  }
  else {
    xpc_object_t v16 = 0;
  }
  aBlock = v16;
  uint64_t v17 = *a1;
  strcpy(__p, "kCommandTraceDumpState");
  char v21 = 22;
  xpc_object_t object = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v17, (int)__p, v22, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v21 & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    *(void *)(a4 + 8) = 0;
    xpc_object_t v18 = aBlock;
    if (!aBlock) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a4 = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 8) = 0;
  xpc_object_t v18 = aBlock;
  if (aBlock) {
LABEL_28:
  }
    _Block_release(v18);
LABEL_29:
  if (a3) {
    _Block_release(a3);
  }
  xpc_release(v9);
}

void sub_1C57447C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client19CollectBasebandLogsENSt3__110shared_ptrINS0_7ManagerEEERKNS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *a3;
    int v5 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C5744908(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::GetTraceModeWithOwnership(uint64_t **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!*a1)
  {
    xpc_object_t v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v37 = xpc_null_create();
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v6) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v9 = xpc_int64_create(5000);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "Timeout", v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  xpc_object_t v11 = xpc_string_create("BasebandTrace");
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "kKeyTraceName", v11);
  xpc_object_t v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  xpc_object_t v13 = xpc_BOOL_create(1);
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "kKeyTracePropertyWaitForCompletion", v13);
  xpc_object_t v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  xpc_object_t v15 = xpc_string_create("TraceOwnership");
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "kKeyTracePropertyName", v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  uint64_t v17 = *a1;
  xpc_object_t object = v7;
  std::string __p = operator new(0x20uLL);
  long long v33 = xmmword_1C5764C60;
  strcpy((char *)__p, "kCommandGetTraceProperty");
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v17, &object, &v37, &v34);
  int v18 = v34;
  xpc_object_t v19 = (char *)v35;
  int v20 = v36;
  char v36 = 0;
  LOBYTE(v35) = 0;
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v33) < 0)
  {
    operator delete(__p);
    if (v18)
    {
LABEL_22:
      char v21 = (char *)operator new(0x28uLL);
      strcpy(v21, "Failed to get Baseband Trace ownership");
      *(_DWORD *)a3 = -534716414;
      *(void *)(a3 + 8) = v21;
      *(_OWORD *)(a3 + 16) = xmmword_1C5764C90;
      if ((v20 & 0x80) != 0) {
        goto LABEL_35;
      }
      goto LABEL_36;
    }
  }
  else if (v18)
  {
    goto LABEL_22;
  }
  uint64_t v34 = a2;
  uint64_t v35 = "TraceOwnership";
  xpc::dict::object_proxy::operator=(&v30, (uint64_t)&v34, v37, "kKeyTracePropertyValue");
  xpc_release(v30);
  xpc_object_t v30 = 0;
  xpc_object_t v22 = xpc_string_create("Mode");
  if (!v22) {
    xpc_object_t v22 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "kKeyTracePropertyName", v22);
  xpc_object_t v23 = xpc_null_create();
  xpc_release(v22);
  xpc_release(v23);
  int v24 = *a1;
  std::string __p = operator new(0x20uLL);
  long long v33 = xmmword_1C5764C60;
  strcpy((char *)__p, "kCommandGetTraceProperty");
  xpc_object_t v29 = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t v29 = xpc_null_create();
  }
  abm::client::Manager::perform(v24, &v29, &v37, &v34);
  int v25 = v34;
  if (v20 < 0) {
    operator delete(v19);
  }
  xpc_object_t v19 = (char *)v35;
  char v26 = v36;
  char v36 = 0;
  LOBYTE(v35) = 0;
  xpc_release(v29);
  xpc_object_t v29 = 0;
  if ((SHIBYTE(v33) & 0x80000000) == 0)
  {
    if (v25) {
      goto LABEL_34;
    }
LABEL_39:
    uint64_t v34 = a2;
    uint64_t v35 = "Mode";
    xpc::dict::object_proxy::operator=(&v28, (uint64_t)&v34, v37, "kKeyTracePropertyValue");
    xpc_release(v28);
    xpc_object_t v28 = 0;
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    if ((v26 & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  operator delete(__p);
  if (!v25) {
    goto LABEL_39;
  }
LABEL_34:
  v27 = (char *)operator new(0x28uLL);
  strcpy(v27, "Failed to get Baseband Trace Mode");
  *(_DWORD *)a3 = -534716414;
  *(void *)(a3 + 8) = v27;
  *(_OWORD *)(a3 + 16) = xmmword_1C5764CA0;
  if (v26 < 0) {
LABEL_35:
  }
    operator delete(v19);
LABEL_36:
  xpc_release(v7);
  xpc_release(v37);
}

void sub_1C5744DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, xpc_object_t object, uint64_t a15, xpc_object_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (v24 < 0) {
    operator delete(v23);
  }
  xpc_release(v22);
  xpc_release(*(xpc_object_t *)(v25 - 88));
  _Unwind_Resume(a1);
}

void abm::client::SetTraceModeWithOwnership(uint64_t **a1@<X0>, int a2@<W1>, xpc_object_t *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a1)
  {
    xpc_object_t v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v56 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v57[0] = xpc_null_create();
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = v8;
  if (v8)
  {
    xpc_object_t v56 = v8;
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v56 = v9;
    if (!v9)
    {
      xpc_object_t v11 = xpc_null_create();
      xpc_object_t v9 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1C878FBE0](v9) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v9);
    goto LABEL_11;
  }
  xpc_object_t v11 = xpc_null_create();
LABEL_10:
  xpc_object_t v56 = v11;
LABEL_11:
  xpc_release(v9);
  xpc_object_t v12 = xpc_int64_create(5000);
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, "Timeout", v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  xpc_object_t v14 = xpc_string_create("BasebandTrace");
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, "kKeyTraceName", v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  xpc_object_t v16 = xpc_BOOL_create(1);
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, "kKeyTracePropertyWaitForCompletion", v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  int v44 = a2;
  if (!a2)
  {
    LOBYTE(v23) = 0;
    char v24 = 0;
    goto LABEL_30;
  }
  xpc_object_t v18 = xpc_string_create("Enabled");
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v18);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  xpc_object_t v20 = xpc_string_create("false");
  if (!v20) {
    xpc_object_t v20 = xpc_null_create();
  }
  xpc_dictionary_set_value(v56, "kKeyTracePropertyValue", v20);
  xpc_object_t v21 = xpc_null_create();
  xpc_release(v20);
  xpc_release(v21);
  xpc_object_t v22 = *a1;
  std::string __p = operator new(0x20uLL);
  long long v52 = xmmword_1C5764C60;
  strcpy((char *)__p, "kCommandSetTraceProperty");
  xpc_object_t object = v56;
  if (v56) {
    xpc_retain(v56);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v22, &object, v57, &v53);
  int v25 = (int)v53;
  char v24 = (char *)v54;
  LOBYTE(v23) = v55;
  char v55 = 0;
  LOBYTE(v54) = 0;
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v52) < 0)
  {
    operator delete(__p);
    if (v25) {
      goto LABEL_28;
    }
LABEL_30:
    xpc_object_t v27 = xpc_string_create("TraceOwnership");
    if (!v27) {
      xpc_object_t v27 = xpc_null_create();
    }
    xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v27);
    xpc_object_t v28 = xpc_null_create();
    xpc_release(v27);
    xpc_release(v28);
    uint64_t v53 = &v56;
    v54 = "kKeyTracePropertyValue";
    xpc::dict::object_proxy::operator=(&v49, (uint64_t)&v53, *a3, "TraceOwnership");
    xpc_release(v49);
    xpc_object_t v49 = 0;
    xpc_object_t v29 = *a1;
    std::string __p = operator new(0x20uLL);
    long long v52 = xmmword_1C5764C60;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    xpc_object_t v48 = v56;
    if (v56) {
      xpc_retain(v56);
    }
    else {
      xpc_object_t v48 = xpc_null_create();
    }
    abm::client::Manager::perform(v29, &v48, v57, &v53);
    int v30 = (int)v53;
    if ((v23 & 0x80) != 0) {
      operator delete(v24);
    }
    char v24 = (char *)v54;
    int v23 = v55;
    char v55 = 0;
    LOBYTE(v54) = 0;
    xpc_release(v48);
    xpc_object_t v48 = 0;
    if (SHIBYTE(v52) < 0)
    {
      operator delete(__p);
      if (v30) {
        goto LABEL_39;
      }
    }
    else if (v30)
    {
LABEL_39:
      BOOL v31 = (char *)operator new(0x20uLL);
      strcpy(v31, "Failed to set trace ownership");
      *(_DWORD *)a4 = -534716414;
      *(void *)(a4 + 8) = v31;
      *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
      goto LABEL_67;
    }
    xpc_object_t v32 = xpc_string_create("Mode");
    if (!v32) {
      xpc_object_t v32 = xpc_null_create();
    }
    xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v32);
    xpc_object_t v33 = xpc_null_create();
    xpc_release(v32);
    xpc_release(v33);
    uint64_t v53 = &v56;
    v54 = "kKeyTracePropertyValue";
    xpc::dict::object_proxy::operator=(&v47, (uint64_t)&v53, *a3, "Mode");
    xpc_release(v47);
    xpc_object_t v47 = 0;
    uint64_t v34 = *a1;
    std::string __p = operator new(0x20uLL);
    long long v52 = xmmword_1C5764C60;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    xpc_object_t v46 = v56;
    if (v56) {
      xpc_retain(v56);
    }
    else {
      xpc_object_t v46 = xpc_null_create();
    }
    abm::client::Manager::perform(v34, &v46, v57, &v53);
    int v35 = (int)v53;
    if (v23 < 0) {
      operator delete(v24);
    }
    char v24 = (char *)v54;
    int v23 = v55;
    char v55 = 0;
    LOBYTE(v54) = 0;
    xpc_release(v46);
    xpc_object_t v46 = 0;
    if (SHIBYTE(v52) < 0)
    {
      operator delete(__p);
      if (v35) {
        goto LABEL_50;
      }
    }
    else if (v35)
    {
LABEL_50:
      char v36 = (char *)operator new(0x20uLL);
      strcpy(v36, "Failed to set trace mode");
      *(_DWORD *)a4 = -534716414;
      *(void *)(a4 + 8) = v36;
      *(_OWORD *)(a4 + 16) = xmmword_1C5764C60;
      goto LABEL_67;
    }
    if (!v44) {
      goto LABEL_66;
    }
    xpc_object_t v37 = xpc_string_create("Enabled");
    if (!v37) {
      xpc_object_t v37 = xpc_null_create();
    }
    xpc_dictionary_set_value(v56, "kKeyTracePropertyName", v37);
    xpc_object_t v38 = xpc_null_create();
    xpc_release(v37);
    xpc_release(v38);
    xpc_object_t v39 = xpc_string_create("true");
    if (!v39) {
      xpc_object_t v39 = xpc_null_create();
    }
    xpc_dictionary_set_value(v56, "kKeyTracePropertyValue", v39);
    xpc_object_t v40 = xpc_null_create();
    xpc_release(v39);
    xpc_release(v40);
    v41 = *a1;
    std::string __p = operator new(0x20uLL);
    long long v52 = xmmword_1C5764C60;
    strcpy((char *)__p, "kCommandSetTraceProperty");
    xpc_object_t v45 = v56;
    if (v56) {
      xpc_retain(v56);
    }
    else {
      xpc_object_t v45 = xpc_null_create();
    }
    abm::client::Manager::perform(v41, &v45, v57, &v53);
    int v42 = (int)v53;
    if (v23 < 0) {
      operator delete(v24);
    }
    char v24 = (char *)v54;
    LOBYTE(v23) = v55;
    char v55 = 0;
    LOBYTE(v54) = 0;
    xpc_release(v45);
    xpc_object_t v45 = 0;
    if (SHIBYTE(v52) < 0) {
      operator delete(__p);
    }
    if (v42)
    {
      v43 = (char *)operator new(0x28uLL);
      strcpy(v43, "Failed to set trace enabled to true");
      *(_DWORD *)a4 = -534716414;
      *(void *)(a4 + 8) = v43;
      *(_OWORD *)(a4 + 16) = xmmword_1C5764C80;
    }
    else
    {
LABEL_66:
      *(_DWORD *)a4 = 0;
      *(void *)(a4 + 16) = 0;
      *(void *)(a4 + 24) = 0;
      *(void *)(a4 + 8) = 0;
    }
    goto LABEL_67;
  }
  if (!v25) {
    goto LABEL_30;
  }
LABEL_28:
  char v26 = (char *)operator new(0x28uLL);
  strcpy(v26, "Failed to set trace enabled to false");
  *(_DWORD *)a4 = -534716414;
  *(void *)(a4 + 8) = v26;
  *(_OWORD *)(a4 + 16) = xmmword_1C5764CB0;
LABEL_67:
  if ((v23 & 0x80) != 0) {
    operator delete(v24);
  }
  xpc_release(v56);
  xpc_release(v57[0]);
}

void sub_1C5745714(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, xpc_object_t object, xpc_object_t a16, uint64_t a17, xpc_object_t a18, uint64_t a19, xpc_object_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (v27 < 0) {
    operator delete(v26);
  }
  xpc_release(*(xpc_object_t *)(v28 - 104));
  xpc_release(*(xpc_object_t *)(v28 - 96));
  _Unwind_Resume(a1);
}

uint64_t abm::asString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  switch((int)result)
  {
    case -1:
      a2[23] = 13;
      strcpy(a2, "Uninitialized");
      break;
    case 0:
      a2[23] = 3;
      *(_DWORD *)a2 = 5067591;
      break;
    case 2:
      a2[23] = 5;
      strcpy(a2, "UTRAN");
      break;
    case 3:
      a2[23] = 6;
      strcpy(a2, "CDMA1x");
      break;
    case 4:
      a2[23] = 8;
      strcpy(a2, "CDMAEVDO");
      break;
    case 5:
      a2[23] = 10;
      strcpy(a2, "CDMAHybrid");
      break;
    case 7:
      a2[23] = 3;
      *(_DWORD *)a2 = 4543564;
      break;
    case 8:
      a2[23] = 5;
      strcpy(a2, "1xLTE");
      break;
    case 9:
      a2[23] = 7;
      strcpy(a2, "TDSCDMA");
      break;
    case 10:
      a2[23] = 2;
      strcpy(a2, "NR");
      break;
    default:
      a2[23] = 7;
      strcpy(a2, "Unknown");
      break;
  }
  return result;
}

{
  switch((int)result)
  {
    case 0:
      a2[23] = 5;
      *(_DWORD *)a2 = 1969382724;
      a2[4] = 103;
      a2[5] = 0;
      break;
    case 1:
      a2[23] = 7;
      strcpy(a2, "Manager");
      break;
    case 2:
      a2[23] = 7;
      strcpy(a2, "Factory");
      break;
    case 3:
      a2[23] = 9;
      strcpy(a2, "Telephony");
      break;
    default:
      a2[23] = 11;
      strcpy(a2, "Unsupported");
      break;
  }
  return result;
}

{
  switch((int)result)
  {
    case 0:
      a2[23] = 2;
      strcpy(a2, "UI");
      break;
    case 1:
      a2[23] = 7;
      strcpy(a2, "ABMtool");
      break;
    case 2:
      a2[23] = 7;
      strcpy(a2, "Profile");
      break;
    case 3:
      a2[23] = 10;
      strcpy(a2, "24hr_Timer");
      break;
    default:
      a2[23] = 11;
      strcpy(a2, "UnSpecified");
      break;
  }
  return result;
}

{
  if (result == 1)
  {
    a2[23] = 9;
    strcpy(a2, "Last_Used");
  }
  else if (result)
  {
    a2[23] = 11;
    strcpy(a2, "UnSpecified");
  }
  else
  {
    a2[23] = 7;
    strcpy(a2, "Default");
  }
  return result;
}

void abm::client::GetBasebandBootState(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  xpc_object_t v6 = xpc_null_create();
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *a3 = v7;
  a3[1] = v7;
  xpc_object_t v8 = *(std::__shared_weak_count **)(a1 + 8);
  xpc_object_t v17 = *(uint64_t **)a1;
  xpc_object_t v18 = v8;
  xpc_object_t v19 = v6;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __p[0] = operator new(0x20uLL);
  __p[1] = (void *)27;
  strcpy((char *)__p[0], "CommandGetBasebandBootState");
  xpc_object_t v9 = xpc_null_create();
  abm::client::PerformCommand(&v17, v9, &v19, (uint64_t)a3);
  operator delete(__p[0]);
  xpc_object_t v10 = v18;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    xpc_object_t v11 = v19;
    uint64_t v12 = MEMORY[0x1E4F14590];
    if (v19) {
      goto LABEL_11;
    }
  }
  else
  {
    xpc_object_t v11 = v19;
    uint64_t v12 = MEMORY[0x1E4F14590];
    if (v19) {
      goto LABEL_11;
    }
  }
  xpc_object_t v11 = xpc_null_create();
  if (!v11)
  {
    xpc_object_t v13 = xpc_null_create();
    xpc_object_t v11 = 0;
    goto LABEL_14;
  }
LABEL_11:
  if (MEMORY[0x1C878FBE0](v11) == v12)
  {
    xpc_retain(v11);
    xpc_object_t v13 = v11;
  }
  else
  {
    xpc_object_t v13 = xpc_null_create();
  }
LABEL_14:
  xpc_release(v11);
  if (!*(_DWORD *)a3 && MEMORY[0x1C878FBE0](v13) == v12)
  {
    xpc_object_t value = xpc_dictionary_get_value(v13, "KeyBasebandBootState");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    xpc::dyn_cast_or_default();
    if (*(char *)(a2 + 23) < 0) {
      operator delete(*(void **)a2);
    }
    *(_OWORD *)a2 = *(_OWORD *)__p;
    *(void *)(a2 + 16) = 0x8000000000000020;
    xpc_release(object);
  }
  xpc_release(v13);
}

void sub_1C5745CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v11);
  if (*(char *)(v10 + 31) < 0) {
    operator delete(*(void **)(v10 + 8));
  }
  _Unwind_Resume(a1);
}

void sub_1C5745D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5745D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void abm::client::GetBasebandOperatingMode(void *aBlock@<X1>, uint64_t *a2@<X0>, uint64_t a3@<X8>)
{
  if (!*a2)
  {
    xpc_object_t v6 = (char *)operator new(0x20uLL);
    strcpy(v6, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v6;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  if (aBlock) {
    int v5 = _Block_copy(aBlock);
  }
  else {
    int v5 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1174405120;
  v13[2] = ___ZN3abm6client24GetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v13[3] = &__block_descriptor_tmp_5;
  if (v5) {
    long long v7 = _Block_copy(v5);
  }
  else {
    long long v7 = 0;
  }
  aBlocka = v7;
  uint64_t v8 = *a2;
  std::string __p = operator new(0x20uLL);
  long long v12 = xmmword_1C5764C50;
  strcpy((char *)__p, "CommandGetBasebandOperatingMode");
  xpc_object_t object = xpc_null_create();
  abm::client::Manager::perform(v8, (int)&__p, v13, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v12) < 0)
  {
    operator delete(__p);
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    xpc_object_t v9 = aBlocka;
    if (!aBlocka) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  xpc_object_t v9 = aBlocka;
  if (aBlocka) {
LABEL_13:
  }
    _Block_release(v9);
LABEL_14:
  if (v5) {
    _Block_release(v5);
  }
}

void sub_1C5745F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v21) {
    _Block_release(v21);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client24GetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  xpc_object_t v6 = xpc_null_create();
  long long v7 = v6;
  if (!*(_DWORD *)a2)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1C878FBE0](v10) == MEMORY[0x1E4F14590])
      {
        xpc_retain(v10);
        xpc_object_t v8 = v10;
      }
      else
      {
        xpc_object_t v8 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v10 = 0;
    }
    xpc_release(v10);
    xpc_object_t v11 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v11);
    xpc_object_t value = xpc_dictionary_get_value(*a3, "KeyBasebandOperatingMode");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    int v13 = xpc::dyn_cast_or_default();
    xpc_release(object);
    xpc_object_t v14 = xpc_int64_create(v13);
    if (!v14) {
      xpc_object_t v14 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "KeyBasebandOperatingMode", v14);
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v14);
    xpc_release(v15);
    uint64_t v9 = *(void *)(a1 + 32);
    LODWORD(object) = *(_DWORD *)a2;
    if ((*(char *)(a2 + 31) & 0x80000000) == 0) {
      goto LABEL_4;
    }
LABEL_17:
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
    goto LABEL_18;
  }
  xpc_object_t v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  LODWORD(object) = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0) {
    goto LABEL_17;
  }
LABEL_4:
  std::string __p = *(std::string *)(a2 + 8);
LABEL_18:
  (*(void (**)(uint64_t, xpc_object_t *, xpc_object_t))(v9 + 16))(v9, &object, v8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  xpc_release(v8);
}

void sub_1C574616C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  xpc_release(v15);
  _Unwind_Resume(a1);
}

void abm::client::SetBasebandOperatingMode(uint64_t *a1@<X0>, int a2@<W1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  if (!*a1)
  {
    xpc_object_t v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8 || (xpc_object_t v8 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v8) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v8);
      xpc_object_t v9 = v8;
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v8 = 0;
  }
  xpc_release(v8);
  xpc_object_t v11 = xpc_int64_create(a2);
  if (!v11) {
    xpc_object_t v11 = xpc_null_create();
  }
  xpc_dictionary_set_value(v9, "KeyBasebandOperatingMode", v11);
  xpc_object_t v12 = xpc_null_create();
  xpc_release(v11);
  xpc_release(v12);
  if (a3) {
    a3 = _Block_copy(a3);
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 1174405120;
  v19[2] = ___ZN3abm6client24SetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEiU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v19[3] = &__block_descriptor_tmp_142;
  if (a3) {
    int v13 = _Block_copy(a3);
  }
  else {
    int v13 = 0;
  }
  aBlock = v13;
  uint64_t v14 = *a1;
  xpc_object_t object = v9;
  std::string __p = operator new(0x20uLL);
  long long v18 = xmmword_1C5764C50;
  strcpy((char *)__p, "CommandSetBasebandOperatingMode");
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v14, (int)&__p, v19, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((SHIBYTE(v18) & 0x80000000) == 0)
  {
    *(_DWORD *)a4 = 0;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = 0;
    *(void *)(a4 + 8) = 0;
    xpc_object_t v15 = aBlock;
    if (!aBlock) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  operator delete(__p);
  *(_DWORD *)a4 = 0;
  *(void *)(a4 + 16) = 0;
  *(void *)(a4 + 24) = 0;
  *(void *)(a4 + 8) = 0;
  xpc_object_t v15 = aBlock;
  if (aBlock) {
LABEL_23:
  }
    _Block_release(v15);
LABEL_24:
  if (a3) {
    _Block_release(a3);
  }
  xpc_release(v9);
}

void sub_1C5746498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client24SetBasebandOperatingModeENSt3__110shared_ptrINS0_7ManagerEEEiU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, void))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C57465C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::GetBasebandTime(void *aBlock@<X1>, uint64_t *a2@<X0>, uint64_t a3@<X8>)
{
  if (!*a2)
  {
    xpc_object_t v6 = (char *)operator new(0x20uLL);
    strcpy(v6, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v6;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  if (aBlock) {
    int v5 = _Block_copy(aBlock);
  }
  else {
    int v5 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1174405120;
  v13[2] = ___ZN3abm6client15GetBasebandTimeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v13[3] = &__block_descriptor_tmp_145;
  if (v5) {
    long long v7 = _Block_copy(v5);
  }
  else {
    long long v7 = 0;
  }
  aBlocka = v7;
  uint64_t v8 = *a2;
  strcpy(__p, "CommandGetBasebandTime");
  char v12 = 22;
  xpc_object_t object = xpc_null_create();
  abm::client::Manager::perform(v8, (int)__p, v13, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (v12 < 0)
  {
    operator delete(*(void **)__p);
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    xpc_object_t v9 = aBlocka;
    if (!aBlocka) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  xpc_object_t v9 = aBlocka;
  if (aBlocka) {
LABEL_13:
  }
    _Block_release(v9);
LABEL_14:
  if (v5) {
    _Block_release(v5);
  }
}

void sub_1C574678C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v21) {
    _Block_release(v21);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client15GetBasebandTimeENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, uint64_t a2, xpc_object_t *a3)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  xpc_object_t v6 = xpc_null_create();
  long long v7 = v6;
  if (!*(_DWORD *)a2)
  {
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
    {
      if (MEMORY[0x1C878FBE0](v10) == MEMORY[0x1E4F14590])
      {
        xpc_retain(v10);
        xpc_object_t v8 = v10;
      }
      else
      {
        xpc_object_t v8 = xpc_null_create();
      }
    }
    else
    {
      xpc_object_t v8 = xpc_null_create();
      xpc_object_t v10 = 0;
    }
    xpc_release(v10);
    xpc_object_t v11 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v11);
    xpc_object_t value = xpc_dictionary_get_value(*a3, "KeyBasebandTimeSeconds");
    object[0] = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      object[0] = xpc_null_create();
    }
    int v13 = xpc::dyn_cast_or_default();
    xpc_release(object[0]);
    xpc_object_t v14 = xpc_dictionary_get_value(*a3, "KeyBasebandTimeMicroSeconds");
    object[0] = v14;
    if (v14) {
      xpc_retain(v14);
    }
    else {
      object[0] = xpc_null_create();
    }
    int v15 = xpc::dyn_cast_or_default();
    xpc_release(object[0]);
    memset(object, 170, sizeof(object));
    xpc_object_t v16 = xpc_dictionary_get_value(*a3, "KeyBasebandTimeAsString");
    xpc_object_t v24 = v16;
    if (v16) {
      xpc_retain(v16);
    }
    else {
      xpc_object_t v24 = xpc_null_create();
    }
    xpc::dyn_cast_or_default();
    xpc_release(v24);
    xpc_object_t v17 = xpc_int64_create(v13);
    if (!v17) {
      xpc_object_t v17 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "KeyBasebandTimeSeconds", v17);
    xpc_object_t v18 = xpc_null_create();
    xpc_release(v17);
    xpc_release(v18);
    xpc_object_t v19 = xpc_int64_create(v15);
    if (!v19) {
      xpc_object_t v19 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "KeyBasebandTimeMicroSeconds", v19);
    xpc_object_t v20 = xpc_null_create();
    xpc_release(v19);
    xpc_release(v20);
    if (SHIBYTE(object[2]) >= 0) {
      xpc_object_t v21 = object;
    }
    else {
      xpc_object_t v21 = (xpc_object_t *)object[0];
    }
    xpc_object_t v22 = xpc_string_create((const char *)v21);
    if (!v22) {
      xpc_object_t v22 = xpc_null_create();
    }
    xpc_dictionary_set_value(v8, "KeyBasebandTimeAsString", v22);
    xpc_object_t v23 = xpc_null_create();
    xpc_release(v22);
    xpc_release(v23);
    if (SHIBYTE(object[2]) < 0) {
      operator delete(object[0]);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    LODWORD(object[0]) = *(_DWORD *)a2;
    if ((*(char *)(a2 + 31) & 0x80000000) == 0) {
      goto LABEL_4;
    }
LABEL_32:
    std::string::__init_copy_ctor_external((std::string *)&object[1], *(const std::string::value_type **)(a2 + 8), *(void *)(a2 + 16));
    goto LABEL_33;
  }
  xpc_object_t v8 = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  LODWORD(object[0]) = *(_DWORD *)a2;
  if (*(char *)(a2 + 31) < 0) {
    goto LABEL_32;
  }
LABEL_4:
  *(_OWORD *)&object[1] = *(_OWORD *)(a2 + 8);
  uint64_t v26 = *(void *)(a2 + 24);
LABEL_33:
  (*(void (**)(uint64_t, xpc_object_t *, xpc_object_t))(v9 + 16))(v9, object, v8);
  if (SHIBYTE(v26) < 0) {
    operator delete(object[1]);
  }
  xpc_release(v8);
}

void sub_1C5746B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, xpc_object_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  xpc_release(v17);
  _Unwind_Resume(a1);
}

void abm::client::GetBasebandWakeReason(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *a3 = v5;
  a3[1] = v5;
  xpc_object_t v6 = *(std::__shared_weak_count **)(a1 + 8);
  xpc_object_t v10 = *(uint64_t **)a1;
  xpc_object_t v11 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::string __p = (char *)operator new(0x20uLL);
  strcpy(__p, "CommandGetBasebandWakeReason");
  xpc_object_t v7 = xpc_null_create();
  abm::client::PerformCommand(&v10, v7, a2, (uint64_t)a3);
  operator delete(__p);
  xpc_object_t v8 = v11;
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_1C5746CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5746D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void abm::client::GetBasebandLTEStatistics(void *aBlock@<X1>, uint64_t *a2@<X0>, uint64_t a3@<X8>)
{
  if (!*a2)
  {
    xpc_object_t v6 = (char *)operator new(0x20uLL);
    strcpy(v6, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v6;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  if (aBlock) {
    long long v5 = _Block_copy(aBlock);
  }
  else {
    long long v5 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 1174405120;
  v13[2] = ___ZN3abm6client24GetBasebandLTEStatisticsENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v13[3] = &__block_descriptor_tmp_148;
  if (v5) {
    xpc_object_t v7 = _Block_copy(v5);
  }
  else {
    xpc_object_t v7 = 0;
  }
  aBlocka = v7;
  uint64_t v8 = *a2;
  std::string __p = operator new(0x20uLL);
  long long v12 = xmmword_1C5764C50;
  strcpy((char *)__p, "CommandGetBasebandLTEStatistics");
  xpc_object_t object = xpc_null_create();
  abm::client::Manager::perform(v8, (int)&__p, v13, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if (SHIBYTE(v12) < 0)
  {
    operator delete(__p);
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    uint64_t v9 = aBlocka;
    if (!aBlocka) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  uint64_t v9 = aBlocka;
  if (aBlocka) {
LABEL_13:
  }
    _Block_release(v9);
LABEL_14:
  if (v5) {
    _Block_release(v5);
  }
}

void sub_1C5746EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v21) {
    _Block_release(v21);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client24GetBasebandLTEStatisticsENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2, uint64_t *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v4 = *a3;
    int v5 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, uint64_t))(v3 + 16))(v3, &v5, v4);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C5747008(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::ResetBaseband(uint64_t *a1@<X0>, const char *a2@<X1>, const char *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  if (!*a1) {
    goto LABEL_9;
  }
  uint64_t v8 = a2;
  if (a2[23] < 0)
  {
    if (*((void *)a2 + 1)) {
      goto LABEL_4;
    }
LABEL_9:
    long long v12 = (char *)operator new(0x20uLL);
    strcpy(v12, "Invalid manager object passed");
    *(_DWORD *)a5 = -534716414;
    *(void *)(a5 + 8) = v12;
    *(_OWORD *)(a5 + 16) = xmmword_1C5764C70;
    return;
  }
  if (!a2[23]) {
    goto LABEL_9;
  }
LABEL_4:
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (v10 || (xpc_object_t v10 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v10) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v10);
      xpc_object_t v11 = v10;
    }
    else
    {
      xpc_object_t v11 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v11 = xpc_null_create();
    xpc_object_t v10 = 0;
  }
  xpc_release(v10);
  if (v8[23] < 0) {
    uint64_t v8 = *(const char **)v8;
  }
  xpc_object_t v13 = xpc_string_create(v8);
  if (!v13) {
    xpc_object_t v13 = xpc_null_create();
  }
  xpc_dictionary_set_value(v11, "KeyBasebandResetType", v13);
  xpc_object_t v14 = xpc_null_create();
  xpc_release(v13);
  xpc_release(v14);
  xpc_object_t v15 = xpc_string_create("OtherErrors");
  if (!v15) {
    xpc_object_t v15 = xpc_null_create();
  }
  xpc_dictionary_set_value(v11, "KeyBasebandResetSubType", v15);
  xpc_object_t v16 = xpc_null_create();
  xpc_release(v15);
  xpc_release(v16);
  if (a3[23] < 0) {
    a3 = *(const char **)a3;
  }
  xpc_object_t v17 = xpc_string_create(a3);
  if (!v17) {
    xpc_object_t v17 = xpc_null_create();
  }
  xpc_dictionary_set_value(v11, "KeyBasebandResetReason", v17);
  xpc_object_t v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  if (a4) {
    a4 = _Block_copy(a4);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 1174405120;
  v25[2] = ___ZN3abm6client13ResetBasebandENSt3__110shared_ptrINS0_7ManagerEEENS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEESA_U13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v25[3] = &__block_descriptor_tmp_151;
  if (a4) {
    xpc_object_t v19 = _Block_copy(a4);
  }
  else {
    xpc_object_t v19 = 0;
  }
  aBlock = v19;
  uint64_t v20 = *a1;
  char v24 = 20;
  strcpy(__p, "CommandResetBaseband");
  xpc_object_t object = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v20, (int)__p, v25, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v24 & 0x80000000) == 0)
  {
    *(_DWORD *)a5 = 0;
    *(void *)(a5 + 16) = 0;
    *(void *)(a5 + 24) = 0;
    *(void *)(a5 + 8) = 0;
    xpc_object_t v21 = aBlock;
    if (!aBlock) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a5 = 0;
  *(void *)(a5 + 16) = 0;
  *(void *)(a5 + 24) = 0;
  *(void *)(a5 + 8) = 0;
  xpc_object_t v21 = aBlock;
  if (aBlock) {
LABEL_34:
  }
    _Block_release(v21);
LABEL_35:
  if (a4) {
    _Block_release(a4);
  }
  xpc_release(v11);
}

void sub_1C574737C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client13ResetBasebandENSt3__110shared_ptrINS0_7ManagerEEENS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEESA_U13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, void))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C57474C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::SyncBasebandFilesystem(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (!*a1)
  {
    uint64_t v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v6) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v9 = xpc_BOOL_create(1);
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "KeyFSSyncWaitForCompletion", v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  if (a2) {
    a2 = _Block_copy(a2);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1174405120;
  v17[2] = ___ZN3abm6client22SyncBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v17[3] = &__block_descriptor_tmp_154;
  if (a2) {
    xpc_object_t v11 = _Block_copy(a2);
  }
  else {
    xpc_object_t v11 = 0;
  }
  aBlock = v11;
  uint64_t v12 = *a1;
  char v16 = 21;
  strcpy(__p, "CommandBasebandSyncFS");
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v12, (int)__p, v17, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v16 & 0x80000000) == 0)
  {
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    xpc_object_t v13 = aBlock;
    if (!aBlock) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  xpc_object_t v13 = aBlock;
  if (aBlock) {
LABEL_23:
  }
    _Block_release(v13);
LABEL_24:
  if (a2) {
    _Block_release(a2);
  }
  xpc_release(v7);
}

void sub_1C5747770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client22SyncBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, void))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C574788C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::EraseBasebandFilesystem(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (!*a1)
  {
    uint64_t v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v6) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v9 = xpc_string_create("BasebandNVDataErase");
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "KeyBasebandNVDataAction", v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  if (a2) {
    a2 = _Block_copy(a2);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1174405120;
  v17[2] = ___ZN3abm6client23EraseBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v17[3] = &__block_descriptor_tmp_157;
  if (a2) {
    xpc_object_t v11 = _Block_copy(a2);
  }
  else {
    xpc_object_t v11 = 0;
  }
  aBlock = v11;
  uint64_t v12 = *a1;
  char v16 = 21;
  strcpy(__p, "CommandBasebandNVData");
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v12, (int)__p, v17, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v16 & 0x80000000) == 0)
  {
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    xpc_object_t v13 = aBlock;
    if (!aBlock) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  xpc_object_t v13 = aBlock;
  if (aBlock) {
LABEL_23:
  }
    _Block_release(v13);
LABEL_24:
  if (a2) {
    _Block_release(a2);
  }
  xpc_release(v7);
}

void sub_1C5747B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client23EraseBasebandFilesystemENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, void))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C5747C5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::RestoreBasebandFilesystemToCarrierDefault(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  if (!*a1)
  {
    uint64_t v8 = (char *)operator new(0x20uLL);
    strcpy(v8, "Invalid manager object passed");
    *(_DWORD *)a3 = -534716414;
    *(void *)(a3 + 8) = v8;
    *(_OWORD *)(a3 + 16) = xmmword_1C5764C70;
    return;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6 || (xpc_object_t v6 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v6) == MEMORY[0x1E4F14590])
    {
      xpc_retain(v6);
      xpc_object_t v7 = v6;
    }
    else
    {
      xpc_object_t v7 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    xpc_object_t v6 = 0;
  }
  xpc_release(v6);
  xpc_object_t v9 = xpc_string_create("BasebandNVDataRestoreCarrierDefaults");
  if (!v9) {
    xpc_object_t v9 = xpc_null_create();
  }
  xpc_dictionary_set_value(v7, "KeyBasebandNVDataAction", v9);
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v10);
  if (a2) {
    a2 = _Block_copy(a2);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 1174405120;
  v17[2] = ___ZN3abm6client41RestoreBasebandFilesystemToCarrierDefaultENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke;
  v17[3] = &__block_descriptor_tmp_160;
  if (a2) {
    xpc_object_t v11 = _Block_copy(a2);
  }
  else {
    xpc_object_t v11 = 0;
  }
  aBlock = v11;
  uint64_t v12 = *a1;
  char v16 = 21;
  strcpy(__p, "CommandBasebandNVData");
  xpc_object_t object = v7;
  if (v7) {
    xpc_retain(v7);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  abm::client::Manager::perform(v12, (int)__p, v17, &object);
  xpc_release(object);
  xpc_object_t object = 0;
  if ((v16 & 0x80000000) == 0)
  {
    *(_DWORD *)a3 = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 8) = 0;
    xpc_object_t v13 = aBlock;
    if (!aBlock) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  operator delete(*(void **)__p);
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 8) = 0;
  xpc_object_t v13 = aBlock;
  if (aBlock) {
LABEL_23:
  }
    _Block_release(v13);
LABEL_24:
  if (a2) {
    _Block_release(a2);
  }
  xpc_release(v7);
}

void sub_1C5747F10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *aBlock)
{
  xpc_release(object);
  if (a16 < 0) {
    operator delete(__p);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v22) {
    _Block_release(v22);
  }
  xpc_release(v21);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client41RestoreBasebandFilesystemToCarrierDefaultENSt3__110shared_ptrINS0_7ManagerEEEU13block_pointerFvN12TelephonyXPC6ResultEPvE_block_invoke(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    int v3 = *a2;
    if (*((char *)a2 + 31) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 1), *((void *)a2 + 2));
    }
    else {
      std::string __p = *(std::string *)(a2 + 2);
    }
    (*(void (**)(uint64_t, int *, void))(v2 + 16))(v2, &v3, 0);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

void sub_1C574802C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t abm::AccessorySimulate::create(xpc_object_t *a1)
{
  if (MEMORY[0x1C878FBE0](*a1) != MEMORY[0x1E4F14590] || !xpc_dictionary_get_value(*a1, "kAccessorySimulateEnabled")) {
    return 170;
  }
  xpc_object_t value = xpc_dictionary_get_value(*a1, "kAccessorySimulateEnabled");
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  int v4 = xpc::dyn_cast_or_default();
  xpc_release(object);
  return v4 | 0x100u;
}

void sub_1C5748104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::AccessorySimulate::create(abm::AccessorySimulate *this)
{
  return this | 0x100;
}

void abm::AccessorySimulate::toDict(abm::AccessorySimulate *this@<X0>, xpc_object_t *a2@<X8>)
{
  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_BOOL_create(*(unsigned char *)this);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kAccessorySimulateEnabled", v7);
  xpc_object_t v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
}

const char *abm::AccessorySimulate::asString(abm::AccessorySimulate *this)
{
  if (*(unsigned char *)this) {
    return "enabled";
  }
  else {
    return "disabled";
  }
}

const char *abm::asString(int a1)
{
  size_t result = "Generic";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      size_t result = "Lightning to Headphone Jack Adapter";
      break;
    case 2:
      size_t result = "EarPods with Lightening";
      break;
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
LABEL_7:
      size_t result = "???";
      break;
    case 4:
      size_t result = "Lightning Cable";
      break;
    case 5:
      size_t result = "Charging Dock";
      break;
    case 12:
      size_t result = "SmartKeyboard";
      break;
    case 13:
      size_t result = "DisplayCover";
      break;
    case 14:
      size_t result = "Pencil";
      break;
    case 15:
      size_t result = "MagSafeCharger";
      break;
    case 16:
      size_t result = "MagSafeBatteryPack";
      break;
    case 17:
      size_t result = "USB3";
      break;
    case 18:
      size_t result = "DisplayPort";
      break;
    case 19:
      size_t result = "USB-C to Headphone Jack Adapter";
      break;
    case 20:
      size_t result = "EarPods with USB-C";
      break;
    default:
      switch(a1)
      {
        case 2048:
          size_t result = "AppleMagSafeSiliconCase";
          break;
        case 2049:
          size_t result = "AppleMagSafeLeatherCase";
          break;
        case 2050:
          size_t result = "AppleMagSafeClearCase";
          break;
        case 2051:
          size_t result = "AppleMagSafeSleeve";
          break;
        case 2052:
          size_t result = "AppleMagSafeWallet";
          break;
        case 2053:
          size_t result = "AppleMagSafeBatteryPack";
          break;
        case 2054:
          size_t result = "AppleMagSafeChargingMat";
          break;
        case 2055:
          size_t result = "AppleMagSafeChargingCable";
          break;
        case 2056:
          size_t result = "AppleMagSafeRuggedCase";
          break;
        case 2057:
          size_t result = "AppleMagSafeTextileCase";
          break;
        default:
          if (a1 != 0xFFFF) {
            goto LABEL_7;
          }
          size_t result = "Unknown";
          break;
      }
      break;
  }
  return result;
}

{
  if ((a1 - 1) > 2) {
    return "Unknown";
  }
  else {
    return off_1E6513750[a1 - 1];
  }
}

{
  if ((a1 - 1) > 2) {
    return "Unknown";
  }
  else {
    return off_1E6513768[a1 - 1];
  }
}

const char *abm::asString(__int16 a1)
{
  if ((unsigned __int16)(a1 + 1) > 5u) {
    return "???";
  }
  else {
    return off_1E6513528[(__int16)(a1 + 1)];
  }
}

{
  if ((unsigned __int16)(a1 + 1) > 4u) {
    return "???";
  }
  else {
    return off_1E6513558[(__int16)(a1 + 1)];
  }
}

{
  if ((unsigned __int16)(a1 + 1) > 4u) {
    return "???";
  }
  else {
    return off_1E6513580[(__int16)(a1 + 1)];
  }
}

{
  if ((unsigned __int16)(a1 + 1) > 5u) {
    return "???";
  }
  else {
    return off_1E65135A8[(__int16)(a1 + 1)];
  }
}

{
  if ((unsigned __int16)(a1 + 1) > 5u) {
    return "NotApplicable";
  }
  else {
    return off_1E65135D8[(__int16)(a1 + 1)];
  }
}

unint64_t abm::AccessoryInfo::create(uint64_t a1)
{
  unint64_t v90 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v89 = v2;
  long long v88 = v2;
  long long v87 = v2;
  long long v86 = v2;
  long long v85 = v2;
  long long v84 = v2;
  long long v83 = v2;
  long long v82 = v2;
  v81[1] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v80[32] = v2;
  *(_OWORD *)&v80[16] = v2;
  *(_OWORD *)v80 = v2;
  long long v79 = v2;
  long long v77 = v2;
  long long v78 = v2;
  long long v76 = v2;
  uint64_t v3 = MEMORY[0x1E4FBA490] + 64;
  v81[0] = MEMORY[0x1E4FBA490] + 64;
  uint64_t v4 = *(void *)(MEMORY[0x1E4FBA410] + 16);
  uint64_t v75 = *(void *)(MEMORY[0x1E4FBA410] + 8);
  *(uint64_t *)((char *)&v75 + *(void *)(v75 - 24)) = v4;
  *(void *)&long long v76 = 0;
  xpc_object_t v5 = (std::ios_base *)((char *)&v75 + *(void *)(v75 - 24));
  std::ios_base::init(v5, (char *)&v76 + 8);
  uint64_t v6 = MEMORY[0x1E4FBA490] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  uint64_t v75 = v6;
  v81[0] = v3;
  std::streambuf::basic_streambuf();
  uint64_t v7 = MEMORY[0x1E4FBA470] + 16;
  *((void *)&v76 + 1) = MEMORY[0x1E4FBA470] + 16;
  xpc_object_t v8 = &v80[8];
  memset(&v80[8], 0, 32);
  char v9 = 8;
  *(_DWORD *)&v80[40] = 8;
  if (&v80[8] != (unsigned char *)a1)
  {
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__assign_no_alias<true>(&v80[8], *(void **)a1, *(void *)(a1 + 8));
      char v9 = v80[40];
    }
    else
    {
      *(_OWORD *)&v80[8] = *(_OWORD *)a1;
      *(void *)&v80[24] = *(void *)(a1 + 16);
    }
  }
  *(void *)&v80[32] = 0;
  uint64_t v10 = v80[31];
  if (v80[31] >= 0) {
    xpc_object_t v11 = &v80[8];
  }
  else {
    xpc_object_t v11 = *(unsigned char **)&v80[8];
  }
  if (v80[31] >= 0) {
    unint64_t v12 = v80[31];
  }
  else {
    unint64_t v12 = *(void *)&v80[16];
  }
  if ((v9 & 8) != 0)
  {
    *((void *)&v77 + 1) = v11;
    *(void *)&long long v78 = v11;
    *(void *)&v80[32] = &v11[v12];
    *((void *)&v78 + 1) = &v11[v12];
  }
  if ((v9 & 0x10) != 0)
  {
    *(void *)&v80[32] = &v11[v12];
    if ((v80[31] & 0x80) != 0)
    {
      unint64_t v13 = (*(void *)&v80[24] & 0x7FFFFFFFFFFFFFFFLL) - 1;
      if (*(void *)&v80[16] >= v13)
      {
        *(void *)&v80[16] = (*(void *)&v80[24] & 0x7FFFFFFFFFFFFFFFLL) - 1;
        xpc_object_t v8 = *(unsigned char **)&v80[8];
        goto LABEL_21;
      }
      uint64_t v10 = *(void *)&v80[16];
    }
    else
    {
      unint64_t v13 = 22;
      if (v80[31] > 0x15u)
      {
        v80[31] = 22;
LABEL_21:
        v8[v13] = 0;
        goto LABEL_22;
      }
    }
    std::string::append((std::string *)&v80[8], v13 - v10, 0);
LABEL_22:
    uint64_t v14 = v80[31];
    if (v80[31] < 0) {
      uint64_t v14 = *(void *)&v80[16];
    }
    *(void *)&long long v79 = v11;
    *((void *)&v79 + 1) = v11;
    *(void *)v80 = &v11[v14];
    if ((v80[40] & 3) != 0)
    {
      if (v12 >> 31)
      {
        uint64_t v15 = ((v12 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v16 = 0x7FFFFFFF * ((v15 + ((v12 - 0x80000000 - v15) >> 1)) >> 30);
        v11 += v16 + 0x7FFFFFFF;
        unint64_t v12 = v12 - v16 - 0x7FFFFFFF;
        *((void *)&v79 + 1) = v11;
      }
      if (v12) {
        *((void *)&v79 + 1) = &v11[v12];
      }
    }
  }
  unsigned __int16 v64 = 0;
  unsigned __int16 v65 = 0;
  int v68 = 0;
  v72 = 0;
  size_t v73 = 0;
  int64_t v74 = 0;
  v69 = (char *)&v77 + 8;
  uint64_t v66 = 0;
  unsigned __int16 v67 = -1;
  while (2)
  {
    LOBYTE(__dst[0]) = -86;
    MEMORY[0x1C878F6B0](__dst, &v75, 1);
    if (!LOBYTE(__dst[0])) {
      goto LABEL_68;
    }
    if (SHIBYTE(v74) < 0)
    {
      *(unsigned char *)v72 = 0;
      size_t v73 = 0;
    }
    else
    {
      LOBYTE(v72) = 0;
      HIBYTE(v74) = 0;
    }
    uint64_t v17 = 0;
    while (1)
    {
      xpc_object_t v18 = *(void **)((char *)&v78 + *(void *)(v75 - 24));
      xpc_object_t v19 = (char *)v18[3];
      if (v19 == (char *)v18[4]) {
        break;
      }
      v18[3] = v19 + 1;
      char v20 = *v19;
LABEL_38:
      if (v20 == 44)
      {
        int v32 = 0;
        goto LABEL_67;
      }
      unsigned __int8 v22 = HIBYTE(v74);
      if (SHIBYTE(v74) < 0)
      {
        size_t v24 = (v74 & 0x7FFFFFFFFFFFFFFFLL) - 1;
        if (v73 == v24)
        {
          if ((v74 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8) {
            std::string::__throw_length_error[abi:ne180100]();
          }
          xpc_object_t v23 = v72;
          size_t v25 = 0x7FFFFFFFFFFFFFF7;
          if (v24 <= 0x3FFFFFFFFFFFFFF2)
          {
LABEL_45:
            if (v24 + 1 > 2 * v24) {
              unint64_t v26 = v24 + 1;
            }
            else {
              unint64_t v26 = 2 * v24;
            }
            uint64_t v27 = (v26 & 0x7FFFFFFFFFFFFFF8) + 8;
            if ((v26 | 7) != 0x17) {
              uint64_t v27 = v26 | 7;
            }
            if (v26 >= 0x17) {
              size_t v25 = v27 + 1;
            }
            else {
              size_t v25 = 23;
            }
          }
          uint64_t v28 = (char *)operator new(v25);
          xpc_object_t v29 = v28;
          if (!v24 || (memmove(v28, v23, v24), v24 != 22)) {
            operator delete(v23);
          }
          v72 = v29;
          int64_t v74 = v25 | 0x8000000000000000;
          goto LABEL_60;
        }
        xpc_object_t v29 = (char *)v72;
        size_t v24 = v73;
LABEL_60:
        size_t v73 = v24 + 1;
        BOOL v31 = &v29[v24];
        char *v31 = v20;
        v31[1] = 0;
        --v17;
        if (SHIBYTE(v74) < 0) {
          goto LABEL_61;
        }
      }
      else
      {
        if (HIBYTE(v74) == 22)
        {
          xpc_object_t v23 = &v72;
          size_t v24 = 22;
          goto LABEL_45;
        }
        HIBYTE(v74) = (HIBYTE(v74) + 1) & 0x7F;
        int v30 = (char *)&v72 + v22;
        char *v30 = v20;
        v30[1] = 0;
        --v17;
        if (SHIBYTE(v74) < 0)
        {
LABEL_61:
          if (v73 == 0x7FFFFFFFFFFFFFF7)
          {
            int v32 = 4;
            goto LABEL_67;
          }
        }
      }
    }
    int v21 = (*(uint64_t (**)(void *))(*v18 + 80))(v18);
    char v20 = v21;
    if (v21 != -1) {
      goto LABEL_38;
    }
    if (v17) {
      int v32 = 2;
    }
    else {
      int v32 = 6;
    }
LABEL_67:
    std::ios_base::clear((std::ios_base *)((char *)&v75 + *(void *)(v75 - 24)), *(_DWORD *)((char *)&v77 + *(void *)(v75 - 24) + 8) | v32);
LABEL_68:
    if ((v69[*(void *)(v75 - 24)] & 5) == 0)
    {
      if (v74 >= 0) {
        size_t v33 = HIBYTE(v74);
      }
      else {
        size_t v33 = v73;
      }
      if (v74 >= 0) {
        uint64_t v34 = &v72;
      }
      else {
        uint64_t v34 = v72;
      }
      if (v33)
      {
        int v35 = memchr(v34, 58, v33);
        if (v35) {
          unint64_t v36 = v35 - (unsigned char *)v34;
        }
        else {
          unint64_t v36 = -1;
        }
        __dst[1] = (void *)0xAAAAAAAAAAAAAAAALL;
        __dst[2] = (void *)0xAAAAAAAAAAAAAAAALL;
        if (v33 >= v36) {
          size_t v37 = v36;
        }
        else {
          size_t v37 = v33;
        }
        __dst[0] = (void *)0xAAAAAAAAAAAAAAAALL;
        if (v37 > 0x7FFFFFFFFFFFFFF7) {
          std::string::__throw_length_error[abi:ne180100]();
        }
      }
      else
      {
        unint64_t v36 = -1;
        size_t v37 = 0;
        memset(__dst, 170, sizeof(__dst));
      }
      if (v37 >= 0x17)
      {
        uint64_t v43 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v37 | 7) != 0x17) {
          uint64_t v43 = v37 | 7;
        }
        uint64_t v44 = v43 + 1;
        xpc_object_t v38 = (void **)operator new(v43 + 1);
        __dst[1] = (void *)v37;
        __dst[2] = (void *)(v44 | 0x8000000000000000);
        __dst[0] = v38;
      }
      else
      {
        HIBYTE(__dst[2]) = v37;
        xpc_object_t v38 = __dst;
        if (!v37)
        {
          LOBYTE(__dst[0]) = 0;
          unint64_t v39 = v36 + 1;
          memset(__p, 170, sizeof(__p));
          LOBYTE(v40) = HIBYTE(v74);
          if ((SHIBYTE(v74) & 0x80000000) == 0) {
            goto LABEL_88;
          }
LABEL_95:
          size_t v40 = v73;
          if (v73 >= v39)
          {
            v41 = (char *)v72;
            size_t v42 = v73 - v39;
            if (v73 - v39 <= 0x7FFFFFFFFFFFFFF7)
            {
LABEL_97:
              if (v42 >= 0x17)
              {
                uint64_t v48 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v42 | 7) != 0x17) {
                  uint64_t v48 = v42 | 7;
                }
                uint64_t v49 = v48 + 1;
                xpc_object_t v45 = operator new(v48 + 1);
                __p[1] = (void *)v42;
                __p[2] = (void *)(v49 | 0x8000000000000000);
                __p[0] = v45;
              }
              else
              {
                HIBYTE(__p[2]) = v42;
                xpc_object_t v45 = __p;
                if (v40 == v39)
                {
                  *((unsigned char *)__p + v42) = 0;
                  int v46 = SHIBYTE(__dst[2]);
                  if ((SHIBYTE(__dst[2]) & 0x80000000) == 0) {
                    goto LABEL_100;
                  }
LABEL_107:
                  if (__dst[1])
                  {
                    unsigned int v47 = *(char *)__dst[0] - 99;
                    goto LABEL_109;
                  }
                  goto LABEL_250;
                }
              }
              memmove(v45, &v41[v39], v42);
              *((unsigned char *)v45 + v42) = 0;
              int v46 = SHIBYTE(__dst[2]);
              if (SHIBYTE(__dst[2]) < 0) {
                goto LABEL_107;
              }
LABEL_100:
              if (v46)
              {
                unsigned int v47 = SLOBYTE(__dst[0]) - 99;
                if (v47 <= 0x10)
                {
LABEL_109:
                  switch(v47)
                  {
                    case 0u:
                      char v50 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0) {
                        v51 = __p;
                      }
                      else {
                        v51 = (void **)__p[0];
                      }
                      if (!strcasecmp("NotApplicable", (const char *)v51))
                      {
                        int v52 = 0;
                      }
                      else if (!strcasecmp("Lightning", (const char *)v51))
                      {
                        int v52 = 0x10000;
                      }
                      else if (!strcasecmp("USBC", (const char *)v51))
                      {
                        int v52 = 0x20000;
                      }
                      else if (!strcasecmp("NFC", (const char *)v51))
                      {
                        int v52 = 196608;
                      }
                      else if (!strcasecmp("SmartConnector", (const char *)v51))
                      {
                        int v52 = 0x40000;
                      }
                      else
                      {
                        int v52 = -65536;
                      }
                      unsigned int v62 = (unsigned __int16)v68;
                      goto LABEL_215;
                    case 6u:
                      char v50 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0) {
                        xpc_object_t v56 = __p;
                      }
                      else {
                        xpc_object_t v56 = (void **)__p[0];
                      }
                      if (!strcasecmp("Generic", (const char *)v56))
                      {
                        unsigned __int16 v67 = 0;
                      }
                      else if (!strcasecmp("Lightning to Headphone Jack Adapter", (const char *)v56))
                      {
                        unsigned __int16 v67 = 1;
                      }
                      else if (!strcasecmp("EarPods with Lightening", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2;
                      }
                      else if (!strcasecmp("Lightning Cable", (const char *)v56))
                      {
                        unsigned __int16 v67 = 4;
                      }
                      else if (!strcasecmp("Charging Dock", (const char *)v56))
                      {
                        unsigned __int16 v67 = 5;
                      }
                      else if (!strcasecmp("SmartKeyboard", (const char *)v56))
                      {
                        unsigned __int16 v67 = 12;
                      }
                      else if (!strcasecmp("DisplayCover", (const char *)v56))
                      {
                        unsigned __int16 v67 = 13;
                      }
                      else if (!strcasecmp("Pencil", (const char *)v56))
                      {
                        unsigned __int16 v67 = 14;
                      }
                      else if (!strcasecmp("USB3", (const char *)v56))
                      {
                        unsigned __int16 v67 = 17;
                      }
                      else if (!strcasecmp("DisplayPort", (const char *)v56))
                      {
                        unsigned __int16 v67 = 18;
                      }
                      else if (!strcasecmp("USB-C to Headphone Jack Adapter", (const char *)v56))
                      {
                        unsigned __int16 v67 = 19;
                      }
                      else if (!strcasecmp("EarPods with USB-C", (const char *)v56))
                      {
                        unsigned __int16 v67 = 20;
                      }
                      else if (!strcasecmp("MagSafeCharger", (const char *)v56))
                      {
                        unsigned __int16 v67 = 15;
                      }
                      else if (!strcasecmp("MagSafeBatteryPack", (const char *)v56))
                      {
                        unsigned __int16 v67 = 16;
                      }
                      else if (!strcasecmp("AppleMagSafeSiliconCase", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2048;
                      }
                      else if (!strcasecmp("AppleMagSafeLeatherCase", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2049;
                      }
                      else if (!strcasecmp("AppleMagSafeClearCase", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2050;
                      }
                      else if (!strcasecmp("AppleMagSafeSleeve", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2051;
                      }
                      else if (!strcasecmp("AppleMagSafeWallet", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2052;
                      }
                      else if (!strcasecmp("AppleMagSafeBatteryPack", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2053;
                      }
                      else if (!strcasecmp("AppleMagSafeChargingMat", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2054;
                      }
                      else if (!strcasecmp("AppleMagSafeChargingCable", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2055;
                      }
                      else if (!strcasecmp("AppleMagSafeRuggedCase", (const char *)v56))
                      {
                        unsigned __int16 v67 = 2056;
                      }
                      else
                      {
                        if (!strcasecmp("AppleMagSafeTextileCase", (const char *)v56)) {
                          __int16 v57 = 2057;
                        }
                        else {
                          __int16 v57 = -1;
                        }
                        unsigned __int16 v67 = v57;
                      }
                      break;
                    case 0xAu:
                      char v50 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0) {
                        uint64_t v53 = __p;
                      }
                      else {
                        uint64_t v53 = (void **)__p[0];
                      }
                      if (!strcasecmp("NotApplicable", (const char *)v53))
                      {
                        int v52 = 0;
                      }
                      else if (!strcasecmp("Leather", (const char *)v53))
                      {
                        int v52 = 1;
                      }
                      else if (!strcasecmp("Silicone", (const char *)v53))
                      {
                        int v52 = 2;
                      }
                      else if (!strcasecmp("Plastic", (const char *)v53))
                      {
                        int v52 = 3;
                      }
                      else if (!strcasecmp("Textile", (const char *)v53))
                      {
                        int v52 = 4;
                      }
                      else
                      {
                        int v52 = 0xFFFF;
                      }
                      unsigned int v62 = v68 & 0xFFFF0000;
LABEL_215:
                      int v68 = v52 | v62;
                      break;
                    case 0xDu:
                      char v50 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0) {
                        uint64_t v58 = __p;
                      }
                      else {
                        uint64_t v58 = (void **)__p[0];
                      }
                      if (!strcasecmp("NotApplicable", (const char *)v58))
                      {
                        uint64_t v66 = 0;
                      }
                      else if (!strcasecmp("Battery", (const char *)v58))
                      {
                        uint64_t v66 = 1;
                      }
                      else if (!strcasecmp("Wired", (const char *)v58))
                      {
                        uint64_t v66 = 2;
                      }
                      else
                      {
                        if (!strcasecmp("Inductive", (const char *)v58)) {
                          uint64_t v59 = 3;
                        }
                        else {
                          uint64_t v59 = 0xFFFFFFFFLL;
                        }
                        uint64_t v66 = v59;
                      }
                      break;
                    case 0xFu:
                      char v50 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0) {
                        uint64_t v60 = __p;
                      }
                      else {
                        uint64_t v60 = (void **)__p[0];
                      }
                      if (!strcasecmp("NotApplicable", (const char *)v60))
                      {
                        unsigned __int16 v65 = 0;
                      }
                      else if (!strcasecmp("White", (const char *)v60))
                      {
                        unsigned __int16 v65 = 1;
                      }
                      else if (!strcasecmp("Black", (const char *)v60))
                      {
                        unsigned __int16 v65 = 2;
                      }
                      else
                      {
                        if (!strcasecmp("Brown", (const char *)v60)) {
                          __int16 v61 = 3;
                        }
                        else {
                          __int16 v61 = -1;
                        }
                        unsigned __int16 v65 = v61;
                      }
                      break;
                    case 0x10u:
                      char v50 = HIBYTE(__p[2]);
                      if (SHIBYTE(__p[2]) >= 0) {
                        v54 = __p;
                      }
                      else {
                        v54 = (void **)__p[0];
                      }
                      if (!strcasecmp("NotApplicable", (const char *)v54))
                      {
                        unsigned __int16 v64 = 0;
                      }
                      else if (!strcasecmp("Detached", (const char *)v54))
                      {
                        unsigned __int16 v64 = 1;
                      }
                      else if (!strcasecmp("Attached", (const char *)v54))
                      {
                        unsigned __int16 v64 = 2;
                      }
                      else if (!strcasecmp("Opened", (const char *)v54))
                      {
                        unsigned __int16 v64 = 3;
                      }
                      else
                      {
                        if (!strcasecmp("Closed", (const char *)v54)) {
                          __int16 v55 = 4;
                        }
                        else {
                          __int16 v55 = -1;
                        }
                        unsigned __int16 v64 = v55;
                      }
                      break;
                    default:
                      goto LABEL_141;
                  }
                }
                else
                {
LABEL_141:
                  char v50 = HIBYTE(__p[2]);
                }
                if (v50 < 0)
                {
                  operator delete(__p[0]);
                  if ((HIBYTE(__dst[2]) & 0x80) == 0) {
                    continue;
                  }
                }
                else if ((v46 & 0x80) == 0)
                {
                  continue;
                }
                operator delete(__dst[0]);
                continue;
              }
LABEL_250:
              std::string::__throw_out_of_range[abi:ne180100]();
            }
LABEL_249:
            std::string::__throw_length_error[abi:ne180100]();
          }
          goto LABEL_248;
        }
      }
      memmove(v38, v34, v37);
      *((unsigned char *)v38 + v37) = 0;
      unint64_t v39 = v36 + 1;
      memset(__p, 170, sizeof(__p));
      LOBYTE(v40) = HIBYTE(v74);
      if (SHIBYTE(v74) < 0) {
        goto LABEL_95;
      }
LABEL_88:
      size_t v40 = v40;
      if (v39 <= v40)
      {
        v41 = (char *)&v72;
        size_t v42 = v40 - v39;
        if (v42 <= 0x7FFFFFFFFFFFFFF7) {
          goto LABEL_97;
        }
        goto LABEL_249;
      }
LABEL_248:
      std::string::__throw_out_of_range[abi:ne180100]();
    }
    break;
  }
  if (v74 < 0) {
    operator delete(v72);
  }
  uint64_t v75 = *MEMORY[0x1E4FBA410];
  *(uint64_t *)((char *)&v75 + *(void *)(v75 - 24)) = *(void *)(MEMORY[0x1E4FBA410] + 24);
  *((void *)&v76 + 1) = v7;
  if ((v80[31] & 0x80000000) != 0) {
    operator delete(*(void **)&v80[8]);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x1C878F7A0](v81);
  return ((unint64_t)v65 << 32) | (v66 << 48) | ((unint64_t)v64 << 16) | v67;
}

void sub_1C5749550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52)
{
  if (a36 < 0) {
    operator delete(__p);
  }
  std::istringstream::~istringstream((uint64_t)&a37);
  _Unwind_Resume(a1);
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA410];
  uint64_t v3 = *MEMORY[0x1E4FBA410];
  *(void *)a1 = *MEMORY[0x1E4FBA410];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x1C878F7A0](a1 + 120);
  return a1;
}

unint64_t abm::AccessoryInfo::create(xpc_object_t *a1)
{
  if (MEMORY[0x1C878FBE0](*a1) != MEMORY[0x1E4F14590])
  {
    uint64_t v2 = 0;
    unsigned __int16 v3 = 0;
    unsigned __int16 v4 = 0;
    unsigned __int16 v5 = -1;
    return (v2 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)v4 << 16) | v5;
  }
  if (xpc_dictionary_get_value(*a1, "kAccessoryID"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kAccessoryID");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    unsigned __int16 v7 = xpc::dyn_cast_or_default();
    xpc_release(object);
    unsigned __int16 v5 = v7;
    if (xpc_dictionary_get_value(*a1, "kAccessoryState"))
    {
LABEL_11:
      xpc_object_t v8 = xpc_dictionary_get_value(*a1, "kAccessoryState");
      xpc_object_t objecta = v8;
      if (v8) {
        xpc_retain(v8);
      }
      else {
        xpc_object_t objecta = xpc_null_create();
      }
      unsigned __int16 v9 = xpc::dyn_cast_or_default();
      xpc_release(objecta);
      unsigned __int16 v4 = v9;
      if (xpc_dictionary_get_value(*a1, "kAccessoryColor")) {
        goto LABEL_15;
      }
LABEL_8:
      unsigned __int16 v3 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    unsigned __int16 v5 = -1;
    if (xpc_dictionary_get_value(*a1, "kAccessoryState")) {
      goto LABEL_11;
    }
  }
  unsigned __int16 v4 = 0;
  if (!xpc_dictionary_get_value(*a1, "kAccessoryColor")) {
    goto LABEL_8;
  }
LABEL_15:
  xpc_object_t v10 = xpc_dictionary_get_value(*a1, "kAccessoryColor");
  xpc_object_t objectb = v10;
  if (v10) {
    xpc_retain(v10);
  }
  else {
    xpc_object_t objectb = xpc_null_create();
  }
  unsigned __int16 v3 = xpc::dyn_cast_or_default();
  xpc_release(objectb);
LABEL_19:
  if (!xpc_dictionary_get_value(*a1, "kAccessoryPower"))
  {
    uint64_t v2 = 0;
    if (xpc_dictionary_get_value(*a1, "kAccessoryMaterial")) {
      goto LABEL_27;
    }
LABEL_23:
    if (!xpc_dictionary_get_value(*a1, "kAccessoryConnection")) {
      return (v2 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)v4 << 16) | v5;
    }
    goto LABEL_31;
  }
  xpc_object_t v11 = xpc_dictionary_get_value(*a1, "kAccessoryPower");
  xpc_object_t objectc = v11;
  if (v11) {
    xpc_retain(v11);
  }
  else {
    xpc_object_t objectc = xpc_null_create();
  }
  uint64_t v12 = xpc::dyn_cast_or_default();
  xpc_release(objectc);
  uint64_t v2 = v12;
  if (!xpc_dictionary_get_value(*a1, "kAccessoryMaterial")) {
    goto LABEL_23;
  }
LABEL_27:
  xpc_object_t v13 = xpc_dictionary_get_value(*a1, "kAccessoryMaterial");
  xpc_object_t objectd = v13;
  if (v13) {
    xpc_retain(v13);
  }
  else {
    xpc_object_t objectd = xpc_null_create();
  }
  xpc::dyn_cast_or_default();
  xpc_release(objectd);
  if (xpc_dictionary_get_value(*a1, "kAccessoryConnection"))
  {
LABEL_31:
    xpc_object_t v14 = xpc_dictionary_get_value(*a1, "kAccessoryConnection");
    xpc_object_t objecte = v14;
    if (v14) {
      xpc_retain(v14);
    }
    else {
      xpc_object_t objecte = xpc_null_create();
    }
    xpc::dyn_cast_or_default();
    xpc_release(objecte);
  }
  return (v2 << 48) | ((unint64_t)v3 << 32) | ((unint64_t)v4 << 16) | v5;
}

void sub_1C5749A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abm::AccessoryInfo::toDict(abm::AccessoryInfo *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(*(unsigned __int16 *)this);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  xpc_object_t v8 = *a2;
  xpc_dictionary_set_value(v8, "kAccessoryID", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned __int16 *)this + 1));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kAccessoryState", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
  xpc_object_t v12 = xpc_int64_create(*((unsigned __int16 *)this + 2));
  if (!v12) {
    xpc_object_t v12 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kAccessoryColor", v12);
  xpc_object_t v13 = xpc_null_create();
  xpc_release(v12);
  xpc_release(v13);
  xpc_object_t v14 = xpc_int64_create(*((unsigned __int16 *)this + 3));
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kAccessoryPower", v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  xpc_object_t v16 = xpc_int64_create(*((unsigned __int16 *)this + 4));
  if (!v16) {
    xpc_object_t v16 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kAccessoryMaterial", v16);
  xpc_object_t v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  xpc_object_t v18 = xpc_int64_create(*((unsigned __int16 *)this + 5));
  if (!v18) {
    xpc_object_t v18 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kAccessoryConnection", v18);
  xpc_object_t v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E6512F30, MEMORY[0x1E4FBA1D0]);
}

void sub_1C5749E4C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  size_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void *std::string::__assign_no_alias<true>(void *__dst, void *__src, size_t __len)
{
  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    size_t v7 = 44;
    if (__len > 0x2C) {
      size_t v7 = __len;
    }
    size_t v8 = (v7 | 7) + 1;
    xpc_object_t v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    xpc_object_t v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      xpc_object_t v6 = __dst;
    }
  }
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

const void **ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t __cxx_global_var_init_1()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy, &ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance, &dword_1C5737000);
  }
  return result;
}

uint64_t __cxx_global_var_init_2()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy, &ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance, &dword_1C5737000);
  }
  return result;
}

{
  uint64_t result;

  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy, &ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance, &dword_1C5737000);
  }
  return result;
}

uint64_t *GetOsLogContext(void)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506A10, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB506A10))
  {
    qword_1EB506A30 = 0;
    qword_1EB506A28 = 0;
    __cxa_atexit(MEMORY[0x1E4FBA188], &qword_1EB506A28, &dword_1C5737000);
    __cxa_guard_release(&qword_1EB506A10);
  }
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global);
  }
  return &qword_1EB506A28;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(void *a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506A20, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB506A20))
  {
    MEMORY[0x1C878F3F0](&unk_1EB506A38);
    __cxa_atexit(MEMORY[0x1E4FBA190], &unk_1EB506A38, &dword_1C5737000);
    __cxa_guard_release(&qword_1EB506A20);
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 1174405120;
  v5[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v5[3] = &__block_descriptor_tmp_3;
  uint64_t v2 = (std::__shared_weak_count *)a1[1];
  v5[4] = *a1;
  xpc_object_t v6 = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (qword_1EB506A18 == -1)
  {
    unsigned __int16 v3 = v6;
    if (!v6) {
      return &unk_1EB506A38;
    }
  }
  else
  {
    dispatch_once(&qword_1EB506A18, v5);
    unsigned __int16 v3 = v6;
    if (!v6) {
      return &unk_1EB506A38;
    }
  }
  if (atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return &unk_1EB506A38;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return &unk_1EB506A38;
}

void sub_1C574A284(_Unwind_Exception *a1)
{
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506A10, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB506A10))
  {
    qword_1EB506A30 = 0;
    qword_1EB506A28 = 0;
    __cxa_atexit(MEMORY[0x1E4FBA188], &qword_1EB506A28, &dword_1C5737000);
    __cxa_guard_release(&qword_1EB506A10);
  }
  if (_MergedGlobals_0 != -1) {
    dispatch_once(&_MergedGlobals_0, &__block_literal_global);
  }
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v5, (const ctu::OsLogContext *)&qword_1EB506A28);
  MEMORY[0x1C878F3E0](v6, v5, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  uint64_t v3 = v7;
  uint64_t v2 = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  xpc_object_t v4 = (std::__shared_weak_count *)qword_1EB506A70;
  qword_1EB506A68 = v3;
  qword_1EB506A70 = v2;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  MEMORY[0x1C878F400](v6);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v5);
}

void sub_1C574A3EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(result + 32) = *(void *)(a2 + 32);
  *(void *)(result + 40) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy(uint64_t a1)
{
  pthread_mutex_lock((pthread_mutex_t *)a1);
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v3 || atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL)) {
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return a1;
}

uint64_t std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>(uint64_t a1, char *__s, const char **a3)
{
  size_t v6 = strlen(__s);
  if (v6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v7 = v6;
  if (v6 >= 0x17)
  {
    uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17) {
      uint64_t v9 = v6 | 7;
    }
    uint64_t v10 = v9 + 1;
    uint64_t v8 = operator new(v9 + 1);
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v10 | 0x8000000000000000;
    *(void *)a1 = v8;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 23) = v6;
  uint64_t v8 = (void *)a1;
  if (v6) {
LABEL_8:
  }
    memmove(v8, __s, v7);
  *((unsigned char *)v8 + v7) = 0;
  xpc_object_t v11 = (void *)(a1 + 24);
  xpc_object_t v12 = *a3;
  size_t v13 = strlen(*a3);
  if (v13 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v14 = v13;
  if (v13 >= 0x17)
  {
    uint64_t v15 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v15 = v13 | 7;
    }
    uint64_t v16 = v15 + 1;
    xpc_object_t v11 = operator new(v15 + 1);
    *(void *)(a1 + 32) = v14;
    *(void *)(a1 + 40) = v16 | 0x8000000000000000;
    *(void *)(a1 + 24) = v11;
  }
  else
  {
    *(unsigned char *)(a1 + 47) = v13;
    if (!v13) {
      goto LABEL_17;
    }
  }
  memmove(v11, v12, v14);
LABEL_17:
  *((unsigned char *)v11 + v14) = 0;
  return a1;
}

void sub_1C574A6B8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    uint64_t v8 = *a1;
    a1[1] = (void *)__len;
    if (__len) {
      memmove(v8, __src, __len);
    }
    goto LABEL_12;
  }
  size_t v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = v7 - 1;
  xpc_object_t v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v13 = 2 * v10;
    if (__len > 2 * v10) {
      unint64_t v13 = __len;
    }
    uint64_t v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17) {
      uint64_t v14 = v13 | 7;
    }
    if (v13 >= 0x17) {
      size_t v9 = v14 + 1;
    }
    else {
      size_t v9 = 23;
    }
    uint64_t v8 = operator new(v9);
    if (!__len) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  xpc_object_t v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len) {
LABEL_8:
  }
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22) {
    operator delete(v11);
  }
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((unsigned char *)v8 + __len) = 0;
  return a1;
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t *std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*((unsigned char *)a1 + 16))
    {
      if (*(char *)(v2 + 79) < 0)
      {
        operator delete(*(void **)(v2 + 56));
        if ((*(char *)(v2 + 55) & 0x80000000) == 0) {
          goto LABEL_5;
        }
      }
      else if ((*(char *)(v2 + 55) & 0x80000000) == 0)
      {
        goto LABEL_5;
      }
      operator delete(*(void **)(v2 + 32));
    }
LABEL_5:
    operator delete((void *)v2);
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(void *)(a1 + 8));
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
      {
LABEL_4:
        uint64_t v2 = (void *)a1;
LABEL_6:
        operator delete(v2);
        return;
      }
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
      goto LABEL_4;
    }
    operator delete(*(void **)(a1 + 32));
    uint64_t v2 = (void *)a1;
    goto LABEL_6;
  }
}

uint64_t __cxx_global_var_init_22()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<BBUPartitionManager>::~PthreadMutexGuardPolicy, &ctu::Singleton<BBUPartitionManager,BBUPartitionManager,ctu::PthreadMutexGuardPolicy<BBUPartitionManager>>::sInstance, &dword_1C5737000);
  }
  return result;
}

void _GLOBAL__sub_I_BasebandNVRAM_mm()
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)v30, "boot-args", (const char **)kBootArgsShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v34, "boot-command", (const char **)kBootCommadShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v38, "auto-boot", (const char **)kAutoBootShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v42, "bootdelay", (const char **)kBootDelayShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v46, "boot-script", (const char **)kBootScriptShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v50, "boot-device", (const char **)kBootDeviceShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v54, "debug-soc", (const char **)kDebugSocShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v58, "debug-uarts", (const char **)kDebugUartsShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v62, "force-ctrr-lock", (const char **)kForceCtrrLockShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v66, "enable-auth-debug", (const char **)kEnableAuthDebugShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v70, "reconfig-breakpoints", (const char **)kReconfigBreakpointsShort);
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const* const&,char const* const&,0>((uint64_t)&v74, "reconfig-behavior", (const char **)&kReconfigBehaviorShort);
  uint64_t v0 = 0;
  uint64_t v1 = 0;
  qword_1EB506B08 = 0;
  qword_1EB506B00 = 0;
  mNVRAMItems = (uint64_t)&qword_1EB506B00;
  uint64_t v2 = v30;
LABEL_5:
  xpc_object_t v4 = &qword_1EB506B00;
  while (1)
  {
    if (!v0) {
      goto LABEL_51;
    }
    uint64_t v16 = v4 + 1;
    if (!v4[1]) {
      goto LABEL_52;
    }
LABEL_61:
    if (++v1 == 12) {
      break;
    }
    uint64_t v0 = qword_1EB506B00;
    uint64_t v2 = &v30[6 * v1];
    if ((uint64_t *)mNVRAMItems == &qword_1EB506B00) {
      goto LABEL_5;
    }
    uint64_t v3 = qword_1EB506B00;
    if (qword_1EB506B00)
    {
      do
      {
        xpc_object_t v4 = (uint64_t *)v3;
        uint64_t v3 = *(void *)(v3 + 8);
      }
      while (v3);
    }
    else
    {
      xpc_object_t v5 = &qword_1EB506B00;
      do
      {
        xpc_object_t v4 = (uint64_t *)v5[2];
        BOOL v6 = *v4 == (void)v5;
        xpc_object_t v5 = v4;
      }
      while (v6);
    }
    int v7 = *((char *)v4 + 55);
    if (v7 >= 0) {
      uint64_t v8 = v4 + 4;
    }
    else {
      uint64_t v8 = (const void *)v4[4];
    }
    if (v7 >= 0) {
      size_t v9 = *((unsigned __int8 *)v4 + 55);
    }
    else {
      size_t v9 = v4[5];
    }
    int v10 = *((char *)v2 + 23);
    if (v10 >= 0) {
      xpc_object_t v11 = (const std::string::value_type *)&v30[6 * v1];
    }
    else {
      xpc_object_t v11 = (const std::string::value_type *)*v2;
    }
    if (v10 >= 0) {
      size_t v12 = *((unsigned __int8 *)v2 + 23);
    }
    else {
      size_t v12 = (size_t)v2[1];
    }
    if (v12 >= v9) {
      size_t v13 = v9;
    }
    else {
      size_t v13 = v12;
    }
    int v14 = memcmp(v8, v11, v13);
    if (v14)
    {
      if ((v14 & 0x80000000) == 0) {
        goto LABEL_25;
      }
    }
    else if (v9 >= v12)
    {
LABEL_25:
      if (v0)
      {
        uint64_t v15 = (uint64_t *)v0;
        while (1)
        {
          xpc_object_t v4 = v15;
          xpc_object_t v19 = (uint64_t *)v15[4];
          xpc_object_t v17 = v15 + 4;
          xpc_object_t v18 = v19;
          int v20 = *((char *)v17 + 23);
          if (v20 >= 0) {
            int v21 = v17;
          }
          else {
            int v21 = v18;
          }
          if (v20 >= 0) {
            size_t v22 = *((unsigned __int8 *)v17 + 23);
          }
          else {
            size_t v22 = v17[1];
          }
          if (v22 >= v12) {
            size_t v23 = v12;
          }
          else {
            size_t v23 = v22;
          }
          int v24 = memcmp(v11, v21, v23);
          if (v24)
          {
            if (v24 < 0) {
              goto LABEL_27;
            }
LABEL_41:
            int v25 = memcmp(v21, v11, v23);
            if (v25)
            {
              if ((v25 & 0x80000000) == 0) {
                goto LABEL_61;
              }
            }
            else if (v22 >= v12)
            {
              goto LABEL_61;
            }
            uint64_t v15 = (uint64_t *)v4[1];
            if (!v15)
            {
              uint64_t v16 = v4 + 1;
              goto LABEL_52;
            }
          }
          else
          {
            if (v12 >= v22) {
              goto LABEL_41;
            }
LABEL_27:
            uint64_t v15 = (uint64_t *)*v4;
            uint64_t v16 = v4;
            if (!*v4) {
              goto LABEL_52;
            }
          }
        }
      }
LABEL_51:
      uint64_t v16 = &qword_1EB506B00;
      xpc_object_t v4 = &qword_1EB506B00;
LABEL_52:
      unint64_t v26 = (char *)operator new(0x50uLL);
      uint64_t v27 = (uint64_t *)v26;
      if (*((char *)v2 + 23) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v26 + 32), (const std::string::value_type *)*v2, (std::string::size_type)v2[1]);
      }
      else
      {
        *((_OWORD *)v26 + 2) = *(_OWORD *)v2;
        *((void *)v26 + 6) = v2[2];
      }
      uint64_t v28 = (std::string *)(v27 + 7);
      xpc_object_t v29 = (const std::string::value_type **)&v32[48 * v1];
      if (*((char *)v2 + 47) < 0)
      {
        std::string::__init_copy_ctor_external(v28, *v29, *(void *)&v32[48 * v1 + 8]);
      }
      else
      {
        *(_OWORD *)&v28->__r_.__value_.__l.__data_ = *(_OWORD *)v29;
        v27[9] = *(void *)&v32[48 * v1 + 16];
      }
      uint64_t *v27 = 0;
      v27[1] = 0;
      v27[2] = (uint64_t)v4;
      uint64_t *v16 = (uint64_t)v27;
      if (*(void *)mNVRAMItems)
      {
        mNVRAMItems = *(void *)mNVRAMItems;
        uint64_t v27 = (uint64_t *)*v16;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_1EB506B00, v27);
      ++qword_1EB506B08;
      goto LABEL_61;
    }
  }
  if ((v77 & 0x80000000) == 0)
  {
    if ((v75 & 0x80000000) == 0) {
      goto LABEL_66;
    }
LABEL_90:
    operator delete(v74);
    if (v73 < 0) {
      goto LABEL_91;
    }
LABEL_67:
    if ((v71 & 0x80000000) == 0) {
      goto LABEL_68;
    }
LABEL_92:
    operator delete(v70);
    if (v69 < 0) {
      goto LABEL_93;
    }
LABEL_69:
    if ((v67 & 0x80000000) == 0) {
      goto LABEL_70;
    }
LABEL_94:
    operator delete(v66);
    if (v65 < 0) {
      goto LABEL_95;
    }
LABEL_71:
    if ((v63 & 0x80000000) == 0) {
      goto LABEL_72;
    }
LABEL_96:
    operator delete(v62);
    if (v61 < 0) {
      goto LABEL_97;
    }
LABEL_73:
    if ((v59 & 0x80000000) == 0) {
      goto LABEL_74;
    }
LABEL_98:
    operator delete(v58);
    if (v57 < 0) {
      goto LABEL_99;
    }
LABEL_75:
    if ((v55 & 0x80000000) == 0) {
      goto LABEL_76;
    }
LABEL_100:
    operator delete(v54);
    if (v53 < 0) {
      goto LABEL_101;
    }
LABEL_77:
    if ((v51 & 0x80000000) == 0) {
      goto LABEL_78;
    }
LABEL_102:
    operator delete(v50);
    if (v49 < 0) {
      goto LABEL_103;
    }
LABEL_79:
    if ((v47 & 0x80000000) == 0) {
      goto LABEL_80;
    }
LABEL_104:
    operator delete(v46);
    if (v45 < 0) {
      goto LABEL_105;
    }
LABEL_81:
    if ((v43 & 0x80000000) == 0) {
      goto LABEL_82;
    }
LABEL_106:
    operator delete(v42);
    if (v41 < 0) {
      goto LABEL_107;
    }
LABEL_83:
    if ((v39 & 0x80000000) == 0) {
      goto LABEL_84;
    }
LABEL_108:
    operator delete(v38);
    if (v37 < 0) {
      goto LABEL_109;
    }
LABEL_85:
    if ((v35 & 0x80000000) == 0) {
      goto LABEL_86;
    }
LABEL_110:
    operator delete(v34);
    if (v33 < 0) {
      goto LABEL_111;
    }
LABEL_87:
    if ((v31 & 0x80000000) == 0) {
      return;
    }
LABEL_112:
    operator delete(v30[0]);
    return;
  }
  operator delete(__p);
  if (v75 < 0) {
    goto LABEL_90;
  }
LABEL_66:
  if ((v73 & 0x80000000) == 0) {
    goto LABEL_67;
  }
LABEL_91:
  operator delete(v72);
  if (v71 < 0) {
    goto LABEL_92;
  }
LABEL_68:
  if ((v69 & 0x80000000) == 0) {
    goto LABEL_69;
  }
LABEL_93:
  operator delete(v68);
  if (v67 < 0) {
    goto LABEL_94;
  }
LABEL_70:
  if ((v65 & 0x80000000) == 0) {
    goto LABEL_71;
  }
LABEL_95:
  operator delete(v64);
  if (v63 < 0) {
    goto LABEL_96;
  }
LABEL_72:
  if ((v61 & 0x80000000) == 0) {
    goto LABEL_73;
  }
LABEL_97:
  operator delete(v60);
  if (v59 < 0) {
    goto LABEL_98;
  }
LABEL_74:
  if ((v57 & 0x80000000) == 0) {
    goto LABEL_75;
  }
LABEL_99:
  operator delete(v56);
  if (v55 < 0) {
    goto LABEL_100;
  }
LABEL_76:
  if ((v53 & 0x80000000) == 0) {
    goto LABEL_77;
  }
LABEL_101:
  operator delete(v52);
  if (v51 < 0) {
    goto LABEL_102;
  }
LABEL_78:
  if ((v49 & 0x80000000) == 0) {
    goto LABEL_79;
  }
LABEL_103:
  operator delete(v48);
  if (v47 < 0) {
    goto LABEL_104;
  }
LABEL_80:
  if ((v45 & 0x80000000) == 0) {
    goto LABEL_81;
  }
LABEL_105:
  operator delete(v44);
  if (v43 < 0) {
    goto LABEL_106;
  }
LABEL_82:
  if ((v41 & 0x80000000) == 0) {
    goto LABEL_83;
  }
LABEL_107:
  operator delete(v40);
  if (v39 < 0) {
    goto LABEL_108;
  }
LABEL_84:
  if ((v37 & 0x80000000) == 0) {
    goto LABEL_85;
  }
LABEL_109:
  operator delete(v36);
  if (v35 < 0) {
    goto LABEL_110;
  }
LABEL_86:
  if ((v33 & 0x80000000) == 0) {
    goto LABEL_87;
  }
LABEL_111:
  operator delete(*(void **)v32);
  if (v31 < 0) {
    goto LABEL_112;
  }
}

void sub_1C574B000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48,void *a49,uint64_t a50,int a51,__int16 a52,char a53,char a54,void *a55,uint64_t a56,int a57,__int16 a58,char a59,char a60,void *a61,uint64_t a62,int a63)
{
  uint64_t v94 = v92;
  if (*(char *)(v94 + 55) < 0) {
    operator delete(*v93);
  }
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::~unique_ptr[abi:ne180100](&a10);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(qword_1EB506B00);
  if (SLOBYTE(STACK[0x25F]) < 0)
  {
    operator delete((void *)STACK[0x248]);
    if ((SLOBYTE(STACK[0x247]) & 0x80000000) == 0)
    {
LABEL_5:
      if ((SLOBYTE(STACK[0x22F]) & 0x80000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_30;
    }
  }
  else if ((SLOBYTE(STACK[0x247]) & 0x80000000) == 0)
  {
    goto LABEL_5;
  }
  operator delete((void *)STACK[0x230]);
  if ((SLOBYTE(STACK[0x22F]) & 0x80000000) == 0)
  {
LABEL_6:
    if ((SLOBYTE(STACK[0x217]) & 0x80000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  operator delete((void *)STACK[0x218]);
  if ((SLOBYTE(STACK[0x217]) & 0x80000000) == 0)
  {
LABEL_7:
    if ((a92 & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  operator delete((void *)STACK[0x200]);
  if ((a92 & 0x80000000) == 0)
  {
LABEL_8:
    if ((a90 & 0x80000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  operator delete(a91);
  if ((a90 & 0x80000000) == 0)
  {
LABEL_9:
    if ((a88 & 0x80000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  operator delete(a89);
  if ((a88 & 0x80000000) == 0)
  {
LABEL_10:
    if ((a86 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  operator delete(a87);
  if ((a86 & 0x80000000) == 0)
  {
LABEL_11:
    if ((a84 & 0x80000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  operator delete(a85);
  if ((a84 & 0x80000000) == 0)
  {
LABEL_12:
    if ((a82 & 0x80000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  operator delete(a83);
  if ((a82 & 0x80000000) == 0)
  {
LABEL_13:
    if ((a80 & 0x80000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  operator delete(a81);
  if ((a80 & 0x80000000) == 0)
  {
LABEL_14:
    if ((a78 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  operator delete(a79);
  if ((a78 & 0x80000000) == 0)
  {
LABEL_15:
    if ((a76 & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  operator delete(a77);
  if ((a76 & 0x80000000) == 0)
  {
LABEL_16:
    if ((a74 & 0x80000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  operator delete(a75);
  if ((a74 & 0x80000000) == 0)
  {
LABEL_17:
    if ((a72 & 0x80000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  operator delete(a73);
  if ((a72 & 0x80000000) == 0)
  {
LABEL_18:
    if ((a66 & 0x80000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  operator delete(a67);
  if ((a66 & 0x80000000) == 0)
  {
LABEL_19:
    if ((a60 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  operator delete(a61);
  if ((a60 & 0x80000000) == 0)
  {
LABEL_20:
    if ((a54 & 0x80000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  operator delete(a55);
  if ((a54 & 0x80000000) == 0)
  {
LABEL_21:
    if ((a48 & 0x80000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  operator delete(a49);
  if ((a48 & 0x80000000) == 0)
  {
LABEL_22:
    if ((a42 & 0x80000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  operator delete(a43);
  if ((a42 & 0x80000000) == 0)
  {
LABEL_23:
    if ((a36 & 0x80000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_48;
  }
LABEL_47:
  operator delete(a37);
  if ((a36 & 0x80000000) == 0)
  {
LABEL_24:
    if ((a30 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_48:
  operator delete(a31);
  if ((a30 & 0x80000000) == 0)
  {
LABEL_25:
    if ((a24 & 0x80000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_50;
  }
LABEL_49:
  operator delete(a25);
  if ((a24 & 0x80000000) == 0)
  {
LABEL_26:
    if (a18 < 0) {
      goto LABEL_27;
    }
    goto LABEL_51;
  }
LABEL_50:
  operator delete(a19);
  if (a18 < 0)
  {
LABEL_27:
    operator delete(__p);
    _Unwind_Resume(a1);
  }
LABEL_51:
  _Unwind_Resume(a1);
}

uint64_t ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  std::string __p = operator new(0x20uLL);
  v20[0] = xmmword_1C5764C70;
  strcpy((char *)__p, "AppleBasebandManagerClientLog");
  ctu::LogServer::create();
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = v34;
  long long v34 = 0uLL;
  xpc_object_t v4 = *(std::__shared_weak_count **)(v2 + 8);
  *(_OWORD *)uint64_t v2 = v3;
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  if (*((void *)&v34 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v34 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v34 + 1) + 16))(*((void *)&v34 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v34 + 1));
    if ((SHIBYTE(v20[0]) & 0x80000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (SHIBYTE(v20[0]) < 0) {
LABEL_7:
  }
    operator delete(__p);
LABEL_8:
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v5;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  long long v33 = v5;
  long long v32 = v5;
  long long v31 = v5;
  long long v30 = v5;
  long long v29 = v5;
  long long v28 = v5;
  long long v27 = v5;
  long long v26 = v5;
  long long v25 = v5;
  void v20[3] = v5;
  *(_OWORD *)int v21 = v5;
  v20[1] = v5;
  v20[2] = v5;
  v20[0] = v5;
  uint64_t v6 = MEMORY[0x1E4FBA498] + 64;
  uint64_t v24 = MEMORY[0x1E4FBA498] + 64;
  uint64_t v7 = MEMORY[0x1E4FBA418];
  uint64_t v8 = *(void **)(MEMORY[0x1E4FBA418] + 16);
  std::string __p = *(void **)(MEMORY[0x1E4FBA418] + 8);
  *(void **)((char *)&__p + *((void *)__p - 3)) = v8;
  size_t v9 = (std::ios_base *)((char *)&__p + *((void *)__p - 3));
  std::ios_base::init(v9, v20);
  int v10 = (void *)(MEMORY[0x1E4FBA498] + 24);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  std::string __p = v10;
  uint64_t v24 = v6;
  std::streambuf::basic_streambuf();
  uint64_t v11 = MEMORY[0x1E4FBA470] + 16;
  *(void *)&v20[0] = MEMORY[0x1E4FBA470] + 16;
  *(_OWORD *)int v21 = 0u;
  long long v22 = 0u;
  LODWORD(v23) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)"/tmp/ABM.", 9);
  size_t v12 = getprogname();
  size_t v13 = strlen(v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)v12, v13);
  LOBYTE(v34) = 46;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)&v34, 1);
  getpid();
  std::ostream::operator<<();
  int v14 = (std::__shared_weak_count_vtbl *)operator new(8uLL);
  v14->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))&unk_1F20ED7B8;
  *(void *)&long long v34 = v14;
  uint64_t v15 = (std::__shared_weak_count *)operator new(0x20uLL);
  v15->__shared_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20ED820;
  v15->__shared_weak_owners_ = 0;
  v15[1].__vftable = v14;
  *((void *)&v34 + 1) = v15;
  xpc_object_t v18 = v15;
  atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  ctu::LogServer::addWriter();
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  ctu::LogServer::start(**(ctu::LogServer ***)(a1 + 32));
  ctu::LogServer::setEnabled(**(ctu::LogServer ***)(a1 + 32));
  uint64_t v16 = (std::__shared_weak_count *)*((void *)&v34 + 1);
  if (*((void *)&v34 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v34 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  std::string __p = *(void **)v7;
  *(void **)((char *)&__p + *((void *)__p - 3)) = *(void **)(v7 + 24);
  *(void *)&v20[0] = v11;
  if (SBYTE7(v22) < 0) {
    operator delete(v21[0]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1C878F7A0](&v24);
}

void sub_1C574B7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v17 - 80);
  std::ostringstream::~ostringstream((uint64_t)&__p);
  _Unwind_Resume(a1);
}

void sub_1C574B874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1E4FBA418];
  uint64_t v3 = *MEMORY[0x1E4FBA418];
  *(void *)a1 = *MEMORY[0x1E4FBA418];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x1E4FBA470] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1C878F7A0](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x1C878F6D0](v24, a1);
  if (LOBYTE(v24[0]))
  {
    uint64_t v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      size_t v12 = std::locale::use_facet(__b, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      uint64_t v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20) {
        uint64_t v11 = a2 + a3;
      }
      else {
        uint64_t v11 = a2;
      }
      if (!v7) {
        goto LABEL_34;
      }
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    size_t v15 = v13 - a3;
    if (v14) {
      size_t v16 = 0;
    }
    else {
      size_t v16 = v15;
    }
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8) {
          std::string::__throw_length_error[abi:ne180100]();
        }
        if (v16 >= 0x17)
        {
          uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17) {
            uint64_t v18 = v16 | 7;
          }
          uint64_t v19 = v18 + 1;
          uint64_t v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          uint64_t v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((unsigned char *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0) {
          locale = __b;
        }
        else {
          locale = __b[0].__locale_;
        }
        uint64_t v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(void *)v7 + 96))(v7, locale, v16);
        uint64_t v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16) {
            goto LABEL_34;
          }
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((void *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x1C878F6E0](v24);
  return a1;
}

void sub_1C574BC68(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1C878F6E0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1C574BC38);
}

void sub_1C574BCD4(_Unwind_Exception *a1)
{
}

void std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<EmptyLogWriter *,std::shared_ptr<ctu::LogWriter>::__shared_ptr_default_delete<ctu::LogWriter,EmptyLogWriter>,std::allocator<EmptyLogWriter>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE") {
    return a1 + 24;
  }
  if (((v3 & (unint64_t)"NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE"))return 0; {
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrIN3ctu9LogWriterEE27__shared_ptr_default_deleteIS2_14EmptyLogWriterEE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24;
  }
  return 0;
}

void *abm::client::Event::Event(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  std::logic_error *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  std::logic_error *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void abm::client::Event::getName(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
}

void abm::client::Event::getData(xpc_object_t **this@<X0>, void *a2@<X8>)
{
  unint64_t v3 = *this;
  *a2 = 0;
  xpc_object_t value = xpc_dictionary_get_value(*v3, (const char *)kKeyEventData);
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (value)
  {
    xpc_object_t v6 = value;
    xpc_retain(value);
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    if (!v6)
    {
      xpc_object_t v7 = xpc_null_create();
      xpc_object_t v6 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v6) == v5)
  {
    xpc_retain(v6);
    xpc_object_t v7 = v6;
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
  }
LABEL_8:
  xpc_release(v6);
  if (MEMORY[0x1C878FBE0](v7) == v5)
  {
    xpc_object_t object = v7;
    if (v7) {
      xpc_retain(v7);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    xpc::bridge();
    if (cf)
    {
      CFTypeID v8 = CFGetTypeID(cf);
      if (v8 == CFDictionaryGetTypeID())
      {
        CFRetain(cf);
        int v9 = cf;
        *a2 = cf;
      }
      else
      {
        int v9 = cf;
        *a2 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      *a2 = 0;
    }
    xpc_release(object);
  }
  xpc_release(v7);
}

void sub_1C574BF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, CFTypeRef cf)
{
  xpc_release(object);
  xpc_release(v11);
  if (*v10) {
    CFRelease(*v10);
  }
  _Unwind_Resume(a1);
}

void abm::client::Event::name(xpc_object_t **this)
{
}

void abm::client::Event::State::name(xpc_object_t *this)
{
  xpc_object_t value = xpc_dictionary_get_value(*this, (const char *)kKeyEvent);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_1C574C040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abm::client::Event::create(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  xpc_object_t v6 = (std::__shared_weak_count_vtbl *)operator new(0x18uLL);
  xpc_object_t v7 = *a1;
  if (v7)
  {
    xpc_retain(v7);
    CFTypeID v8 = *(const void **)a2;
    if (*(void *)a2) {
      goto LABEL_3;
    }
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    CFTypeID v8 = *(const void **)a2;
    if (*(void *)a2)
    {
LABEL_3:
      int v9 = _Block_copy(v8);
      uint64_t v10 = *(NSObject **)(a2 + 8);
      if (!v10) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  int v9 = 0;
  uint64_t v10 = *(NSObject **)(a2 + 8);
  if (v10) {
LABEL_4:
  }
    dispatch_retain(v10);
LABEL_5:
  v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))v7;
  if (v7)
  {
    xpc_retain(v7);
    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
    v6->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))xpc_null_create();
    if (v9)
    {
LABEL_7:
      v6->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))_Block_copy(v9);
      v6->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v10;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  v6->~__shared_weak_count_0 = 0;
  v6->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v10;
  if (v10) {
LABEL_8:
  }
    dispatch_retain(v10);
LABEL_9:
  uint64_t v11 = (std::__shared_weak_count *)operator new(0x20uLL);
  v11->__shared_owners_ = 0;
  v11->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20ED870;
  v11->__shared_weak_owners_ = 0;
  v11[1].__vftable = v6;
  if (v10) {
    dispatch_release(v10);
  }
  if (v9) {
    _Block_release(v9);
  }
  xpc_release(v7);
  size_t v12 = operator new(0x10uLL);
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  *size_t v12 = v6;
  v12[1] = v11;
  atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  *a3 = v12;
  uint64_t v13 = operator new(0x20uLL);
  void *v13 = &unk_1F20ED8F0;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = v12;
  a3[1] = v13;
  if (atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    BOOL v14 = v11;
    if (!v11) {
      return;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    BOOL v14 = v11;
    if (!v11) {
      return;
    }
  }
  if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
}

void sub_1C574C2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (!atomic_fetch_add(v15, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  operator delete(v13);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_1C574C340(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  abm::client::Event::State::~State(v11);
  operator delete(v14);
  dispatch::callback<void({block_pointer})(xpc::dict)>::~callback((uint64_t)&a11);
  xpc_release(v12);
  _Unwind_Resume(a1);
}

uint64_t dispatch::callback<void({block_pointer})(xpc::dict)>::~callback(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

const void **ctu::cf::CFSharedRef<void const>::~CFSharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void std::__shared_ptr_pointer<abm::client::Event::State *,std::shared_ptr<abm::client::Event::State>::__shared_ptr_default_delete<abm::client::Event::State,abm::client::Event::State>,std::allocator<abm::client::Event::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Event::State *,std::shared_ptr<abm::client::Event::State>::__shared_ptr_default_delete<abm::client::Event::State,abm::client::Event::State>,std::allocator<abm::client::Event::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(abm::client::Event::State **)(a1 + 24);
  if (v1)
  {
    abm::client::Event::State::~State(v1);
    operator delete(v2);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Event::State *,std::shared_ptr<abm::client::Event::State>::__shared_ptr_default_delete<abm::client::Event::State,abm::client::Event::State>,std::allocator<abm::client::Event::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C5764E4ELL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C5764E4ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C5764E4ELL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C5764E4ELL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void abm::client::Event::State::~State(abm::client::Event::State *this)
{
  if (!*((void *)this + 1) || !*((void *)this + 2)) {
    goto LABEL_31;
  }
  abm::client::Event::State::name((xpc_object_t *)this);
  int v2 = SHIBYTE(v14);
  if (SHIBYTE(v14) >= 0) {
    size_t v3 = HIBYTE(v14);
  }
  else {
    size_t v3 = v13;
  }
  if (v3 == strlen((const char *)kValueInvalid))
  {
    if (SHIBYTE(v14) >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    BOOL v5 = memcmp(p_p, (const void *)kValueInvalid, v3) == 0;
    if (v2 < 0)
    {
LABEL_15:
      operator delete(__p);
      if (v5) {
        goto LABEL_31;
      }
      goto LABEL_16;
    }
  }
  else
  {
    BOOL v5 = 0;
    if (SHIBYTE(v14) < 0) {
      goto LABEL_15;
    }
  }
  if (v5) {
    goto LABEL_31;
  }
LABEL_16:
  xpc_object_t v6 = *(xpc_object_t *)this;
  if (*(void *)this)
  {
    xpc_retain(*(xpc_object_t *)this);
    xpc_object_t v7 = (const void *)*((void *)this + 1);
    if (v7)
    {
LABEL_18:
      CFTypeID v8 = _Block_copy(v7);
      goto LABEL_21;
    }
  }
  else
  {
    xpc_object_t v6 = xpc_null_create();
    xpc_object_t v7 = (const void *)*((void *)this + 1);
    if (v7) {
      goto LABEL_18;
    }
  }
  CFTypeID v8 = 0;
LABEL_21:
  int v9 = *((void *)this + 2);
  std::string __p = (void *)MEMORY[0x1E4F143A8];
  uint64_t v13 = 1174405120;
  BOOL v14 = ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke;
  size_t v15 = &__block_descriptor_tmp_6;
  if (!v8)
  {
    aBlock = 0;
    xpc_object_t object = v6;
    if (v6) {
      goto LABEL_23;
    }
LABEL_25:
    xpc_object_t object = xpc_null_create();
    goto LABEL_26;
  }
  aBlock = _Block_copy(v8);
  xpc_object_t object = v6;
  if (!v6) {
    goto LABEL_25;
  }
LABEL_23:
  xpc_retain(v6);
LABEL_26:
  dispatch_async(v9, &__p);
  xpc_release(object);
  xpc_object_t object = 0;
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v8) {
    _Block_release(v8);
  }
  xpc_release(v6);
LABEL_31:
  uint64_t v10 = *((void *)this + 2);
  if (v10) {
    dispatch_release(v10);
  }
  uint64_t v11 = (const void *)*((void *)this + 1);
  if (v11) {
    _Block_release(v11);
  }
  xpc_release(*(xpc_object_t *)this);
  *(void *)this = 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFvN3xpc4dictEEEclIJS2_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  xpc_object_t object = v1;
  if (v1) {
    xpc_retain(v1);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  (*(void (**)(uint64_t, xpc_object_t *))(v2 + 16))(v2, &object);
  xpc_release(object);
}

void sub_1C574C728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

xpc_object_t __copy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4 = *(const void **)(a2 + 32);
  if (v4)
  {
    BOOL v5 = _Block_copy(v4);
    xpc_object_t v6 = *(void **)(a2 + 40);
    *(void *)(a1 + 32) = v5;
    *(void *)(a1 + 40) = v6;
    if (v6) {
      return xpc_retain(v6);
    }
  }
  else
  {
    xpc_object_t v6 = *(void **)(a2 + 40);
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = v6;
    if (v6) {
      return xpc_retain(v6);
    }
  }
  xpc_object_t result = xpc_null_create();
  *(void *)(a1 + 40) = result;
  return result;
}

void __destroy_helper_block_e8_32c53_ZTSN8dispatch5blockIU13block_pointerFvN3xpc4dictEEEE40c15_ZTSN3xpc4dictE(uint64_t a1)
{
  xpc_release(*(xpc_object_t *)(a1 + 40));
  *(void *)(a1 + 40) = 0;
  uint64_t v2 = *(const void **)(a1 + 32);
  if (v2) {
    _Block_release(v2);
  }
}

void std::__shared_ptr_pointer<abm::client::Event *,std::shared_ptr<abm::client::Event>::__shared_ptr_default_delete<abm::client::Event,abm::client::Event>,std::allocator<abm::client::Event>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Event *,std::shared_ptr<abm::client::Event>::__shared_ptr_default_delete<abm::client::Event,abm::client::Event>,std::allocator<abm::client::Event>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count ***)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = v1[1];
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      size_t v3 = v1;
    }
    else
    {
      size_t v3 = v1;
    }
    operator delete(v3);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Event *,std::shared_ptr<abm::client::Event>::__shared_ptr_default_delete<abm::client::Event,abm::client::Event>,std::allocator<abm::client::Event>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C5764F25) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C5764F25 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C5764F25)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C5764F25 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

const char *abm::asString(unsigned int a1)
{
  if (a1 > 9) {
    return "Unknown";
  }
  else {
    return off_1E65136E0[a1];
  }
}

{
  if (a1 > 3) {
    return "Unknown";
  }
  else {
    return off_1E6513730[a1];
  }
}

char *abm::data::getDataPropertyNameFromDict(xpc_object_t *a1)
{
  if (MEMORY[0x1C878FBE0](*a1) != MEMORY[0x1E4F14590]) {
    return "Unknown";
  }
  xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataProperty");
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  unsigned int v3 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v3 < 5) {
    return off_1E6513B58[v3];
  }
  else {
    return "Unknown";
  }
}

void sub_1C574CA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::getDataPropertyTypeFromDict(xpc_object_t *a1)
{
  if (MEMORY[0x1C878FBE0](*a1) != MEMORY[0x1E4F14590]) {
    return 5;
  }
  xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataProperty");
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  unsigned int v4 = xpc::dyn_cast_or_default();
  xpc_release(object);
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

void sub_1C574CB5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abm::data::DataAggregationProtocol::toDict(abm::data::DataAggregationProtocol *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(0);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  CFTypeID v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataAggregationProtocol", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationProtocol::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataAggregationProtocol", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

const char *abm::data::DataAggregationProtocol::asString(abm::data::DataAggregationProtocol *this)
{
  uint64_t v1 = *((int *)this + 3);
  if (v1 > 2) {
    return "unknown";
  }
  else {
    return off_1E6513B80[v1];
  }
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(0);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationProtocol>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20ED940;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C878FBE0](*a1) == MEMORY[0x1E4F14590] && xpc_dictionary_get_value(*a1, "kDataAggregationProtocol"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataAggregationProtocol");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    int v5 = xpc::dyn_cast_or_default();
    xpc_release(object);
    if (v5)
    {
      if (v5 == 1)
      {
        *(_DWORD *)(a2 + 12) = 1;
      }
      else if (v5 == 2)
      {
        *(_DWORD *)(a2 + 12) = 2;
      }
      else
      {
        *(unsigned char *)(a2 + 8) = 0;
        *(_DWORD *)(a2 + 12) = 3;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 12) = 0;
    }
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_1C574CFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationProtocol>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20ED940;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (result >= 3)
  {
    *(unsigned char *)(a2 + 8) = 0;
    xpc_object_t result = 3;
  }
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxDatagrams::toDict(abm::data::DataAggregationMaxDatagrams *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(1);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  CFTypeID v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataAggregationMaxDatagrams", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxDatagrams::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxDatagrams", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(1);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20ED988;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C878FBE0](*a1) == MEMORY[0x1E4F14590] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxDatagrams");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_1C574D3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxDatagrams>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20ED988;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataAggregationMaxSize::toDict(abm::data::DataAggregationMaxSize *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(2);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  CFTypeID v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_int64_create(*((unsigned int *)this + 3));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataAggregationMaxSize", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataAggregationMaxSize::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_int64_create(*(unsigned int *)(a1 + 12));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataAggregationMaxSize", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(2);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20ED9D0;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C878FBE0](*a1) == MEMORY[0x1E4F14590] && xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataAggregationMaxSize");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(_DWORD *)(a2 + 12) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_1C574D7F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataAggregationMaxSize>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20ED9D0;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(_DWORD *)(a2 + 12) = result;
  return result;
}

void abm::data::DataFlowControl::toDict(abm::data::DataFlowControl *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(3);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  CFTypeID v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_BOOL_create(*((unsigned char *)this + 9));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataFlowControl", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataFlowControl::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_BOOL_create(*(unsigned char *)(a1 + 9));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataFlowControl", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(3);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataFlowControl>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20EDA18;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C878FBE0](*a1) == MEMORY[0x1E4F14590] && xpc_dictionary_get_value(*a1, "kDataFlowControl"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataFlowControl");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(unsigned char *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_1C574DBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataFlowControl>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20EDA18;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(unsigned char *)(a2 + 9) = result != 0;
  return result;
}

void abm::data::DataPowerSave::toDict(abm::data::DataPowerSave *this@<X0>, void **a2@<X8>)
{
  *a2 = (void *)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    xpc_object_t v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_object_t v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v5) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  xpc_object_t v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  xpc_object_t v7 = xpc_int64_create(4);
  if (!v7) {
    xpc_object_t v7 = xpc_null_create();
  }
  CFTypeID v8 = *a2;
  xpc_dictionary_set_value(v8, "kDataProperty", v7);
  xpc_object_t v9 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v9);
  xpc_object_t v10 = xpc_BOOL_create(*((unsigned char *)this + 9));
  if (!v10) {
    xpc_object_t v10 = xpc_null_create();
  }
  xpc_dictionary_set_value(v8, "kDataPowerSave", v10);
  xpc_object_t v11 = xpc_null_create();
  xpc_release(v10);
  xpc_release(v11);
}

void abm::data::DataPowerSave::addToDict(uint64_t a1, xpc_object_t *a2)
{
  xpc_object_t v3 = xpc_BOOL_create(*(unsigned char *)(a1 + 9));
  if (!v3) {
    xpc_object_t v3 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a2, "kDataPowerSave", v3);
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v3);
  xpc_release(v4);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::createDictForGet(xpc_object_t *a1@<X8>)
{
  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    xpc_object_t v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      xpc_object_t v4 = xpc_null_create();
      xpc_object_t v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x1C878FBE0](v3) == MEMORY[0x1E4F14590])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  xpc_object_t v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  xpc_object_t v5 = xpc_int64_create(4);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(*a1, "kDataProperty", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
}

void abm::data::DataProperty<abm::data::DataPowerSave>::create(xpc_object_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20EDA60;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  if (MEMORY[0x1C878FBE0](*a1) == MEMORY[0x1E4F14590] && xpc_dictionary_get_value(*a1, "kDataPowerSave"))
  {
    xpc_object_t value = xpc_dictionary_get_value(*a1, "kDataPowerSave");
    xpc_object_t object = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    *(unsigned char *)(a2 + 9) = xpc::dyn_cast_or_default();
    xpc_release(object);
  }
  else
  {
    *(unsigned char *)(a2 + 8) = 0;
  }
}

void sub_1C574E010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

uint64_t abm::data::DataProperty<abm::data::DataPowerSave>::create@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = &unk_1F20EDA60;
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAA01;
  *(unsigned char *)(a2 + 9) = result != 0;
  return result;
}

void ConnectionObserver::ConnectionObserver(ConnectionObserver *this)
{
  *(void *)this = &unk_1F20EDAA8;
  *(void *)&long long __p = MEMORY[0x1E4F143A8];
  *((void *)&__p + 1) = 0x40000000;
  int v20 = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  uint64_t v21 = (void **)&__block_descriptor_tmp_0;
  v22[0] = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce == -1)
  {
    uint64_t v3 = ClientGetLogServer(void)::sLogServer;
    xpc_object_t v2 = *(std::__shared_weak_count **)algn_1EB506B18;
    if (!*(void *)algn_1EB506B18) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &__p);
  uint64_t v3 = ClientGetLogServer(void)::sLogServer;
  xpc_object_t v2 = *(std::__shared_weak_count **)algn_1EB506B18;
  if (*(void *)algn_1EB506B18) {
LABEL_3:
  }
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_4:
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0;
  *((_DWORD *)this + 22) = 0;
  *(void *)this = &unk_1F20EDBA8;
  HIBYTE(v20) = 13;
  strcpy((char *)&__p, "conn.observer");
  ctu::LoggerCommonBase::LoggerCommonBase();
  *((void *)this + 1) = &unk_1F20ED228;
  *((void *)this + 7) = v3;
  *((void *)this + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete((void *)__p);
  }
  *(void *)this = &unk_1F20EDBE8;
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  *(void *)this = &unk_1F20EDAA8;
  *((void *)this + 12) = &unk_1F20EDC28;
  xpc_object_t v4 = (uint64_t *)operator new(0x28uLL);
  xpc_object_t v5 = (uint64_t *)operator new(0x20uLL);
  *(void *)&long long __p = &__p;
  *((void *)&__p + 1) = &__p;
  v22[0] = 0;
  v22[1] = 0;
  int v20 = 0;
  uint64_t v21 = v22;
  xpc_object_t v6 = operator new(0x40uLL);
  boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list((uint64_t)v6, (uint64_t)&__p);
  boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(v5, (uint64_t)v6);
  xpc_object_t v7 = operator new(1uLL);
  v5[2] = (uint64_t)v7;
  v5[3] = 0;
  CFTypeID v8 = operator new(0x18uLL);
  v8[1] = 0x100000001;
  *CFTypeID v8 = &unk_1F20EDCE8;
  v8[2] = v7;
  v5[3] = (uint64_t)v8;
  boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>(v4, (uint64_t)v5);
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)&v21, v22[0]);
  if (v20)
  {
    xpc_object_t v10 = (long long *)*((void *)&__p + 1);
    uint64_t v9 = __p;
    uint64_t v11 = **((void **)&__p + 1);
    *(void *)(v11 + 8) = *(void *)(__p + 8);
    **(void **)(v9 + 8) = v11;
    int v20 = 0;
    if (v10 != &__p)
    {
      do
      {
        size_t v12 = (long long *)*((void *)v10 + 1);
        uint64_t v13 = (atomic_uint *)*((void *)v10 + 3);
        if (v13)
        {
          if (atomic_fetch_add(v13 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v13 + 16))(v13);
            if (atomic_fetch_add(v13 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v13 + 24))(v13);
            }
          }
        }
        operator delete(v10);
        xpc_object_t v10 = v12;
      }
      while (v12 != &__p);
    }
  }
  v4[2] = *(void *)*v4;
  BOOL v14 = (pthread_mutex_t *)operator new(0x40uLL);
  pthread_mutex_init(v14, 0);
  v4[3] = (uint64_t)v14;
  v4[4] = 0;
  size_t v15 = operator new(0x18uLL);
  v15[1] = 0x100000001;
  *size_t v15 = &unk_1F20EDD48;
  v15[2] = v14;
  v4[4] = (uint64_t)v15;
  *((void *)this + 13) = v4;
  *((void *)this + 14) = 0;
  size_t v16 = operator new(0x18uLL);
  v16[1] = 0x100000001;
  void *v16 = &unk_1F20EDDA8;
  v16[2] = v4;
  *((void *)this + 14) = v16;
  *((void *)this + 15) = 0;
  *((_DWORD *)this + 32) = 0;
  uint64_t v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  *((void *)this + 17) = dispatch_queue_create("conn.observer", v17);
  ctu::LoggerCommonBase::setLogLevel();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, this, (CFNotificationCallback)ConnectionObserver::handleDaemonReadyNotificationStatic, @"kAppleBasebandManagerDaemonReady", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_1C574E4F0(void *a1)
{
  __cxa_begin_catch(a1);
  xpc_object_t v2 = (atomic_uint *)v1[4];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  uint64_t v3 = (atomic_uint *)v1[1];
  if (v3 && atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
  {
    (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
    if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
    }
  }
  operator delete(v1);
  __cxa_rethrow();
}

void sub_1C574E600()
{
}

void sub_1C574E798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  __cxa_end_catch();
  int v20 = (atomic_uint *)v18[3];
  if (v20 && atomic_fetch_add(v20 + 2, 0xFFFFFFFF) == 1)
  {
    (*(void (**)(atomic_uint *))(*(void *)v20 + 16))(v20);
    if (atomic_fetch_add(v20 + 3, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v20 + 24))(v20);
    }
  }
  boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::~shared_ptr((uint64_t)v18);
  boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~grouped_list((uint64_t *)&__p);
  operator delete(v18);
  operator delete(v17);
  ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggableLockable(v16);
  _Unwind_Resume(a1);
}

void sub_1C574E8DC()
{
  xpc_object_t v2 = *(NSObject **)(v0 + 136);
  if (v2) {
    dispatch_release(v2);
  }
  uint64_t v3 = *(NSObject **)(v0 + 120);
  if (v3)
  {
    dispatch_resume(v3);
    xpc_object_t v4 = *(NSObject **)(v0 + 120);
    if (v4) {
      dispatch_release(v4);
    }
  }
  boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(v1);
  JUMPOUT(0x1C574E90CLL);
}

void ConnectionObserver::handleDaemonReadyNotificationStatic(ConnectionObserver *this, __CFNotificationCenter *a2, void *a3, const __CFString *a4, const void *a5, const __CFDictionary *a6)
{
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  xpc_object_t v6 = (os_unfair_lock_s *)off_1EB5069C8;
  if (!off_1EB5069C8)
  {
    xpc_object_t v7 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v7);
    *(void *)&long long v13 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(&v13, (uint64_t)v7);
    ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(v13);
    long long v8 = v13;
    long long v13 = 0uLL;
    uint64_t v9 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    off_1EB5069C8 = v8;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    xpc_object_t v10 = (std::__shared_weak_count *)*((void *)&v13 + 1);
    if (*((void *)&v13 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v13 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    xpc_object_t v6 = (os_unfair_lock_s *)off_1EB5069C8;
  }
  uint64_t v11 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
  if (*(&off_1EB5069C8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  *(void *)&long long v13 = MEMORY[0x1E4F143A8];
  *((void *)&v13 + 1) = 0x40000000;
  BOOL v14 = ___ZN18ConnectionObserver17handleDaemonReadyEv_block_invoke;
  size_t v15 = &__block_descriptor_tmp_5;
  size_t v16 = v6;
  size_t v12 = v6 + 22;
  os_unfair_lock_lock(v12);
  v14((uint64_t)&v13);
  os_unfair_lock_unlock(v12);
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_1C574EB20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(void *a1)
{
  *a1 = &unk_1F20EDC28;
  xpc_object_t v2 = (atomic_uint *)a1[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void *ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggableLockable(void *a1)
{
  *a1 = &unk_1F20EDBA8;
  MEMORY[0x1C878F380](a1 + 1);
  xpc_object_t v2 = (std::__shared_weak_count *)a1[10];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

{
  std::__shared_weak_count *v2;

  *a1 = &unk_1F20EDBA8;
  MEMORY[0x1C878F380](a1 + 1);
  xpc_object_t v2 = (std::__shared_weak_count *)a1[10];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void ConnectionObserver::~ConnectionObserver(ConnectionObserver *this)
{
  *(void *)this = &unk_1F20EDAA8;
  xpc_object_t v2 = *((void *)this + 15);
  *((void *)this + 15) = 0;
  if (v2)
  {
    dispatch_resume(v2);
    dispatch_release(v2);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, this, @"kAppleBasebandManagerDaemonReady", 0);
  xpc_object_t v4 = *((void *)this + 17);
  if (v4) {
    dispatch_release(v4);
  }
  xpc_object_t v5 = *((void *)this + 15);
  if (v5)
  {
    dispatch_resume(v5);
    xpc_object_t v6 = *((void *)this + 15);
    if (v6) {
      dispatch_release(v6);
    }
  }
  *((void *)this + 12) = &unk_1F20EDC28;
  xpc_object_t v7 = (atomic_uint *)*((void *)this + 14);
  if (v7)
  {
    if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      if (atomic_fetch_add(v7 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 24))(v7);
      }
    }
  }
  *(void *)this = &unk_1F20EDBA8;
  MEMORY[0x1C878F380]((char *)this + 8);
  long long v8 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
}

{
  void *v1;
  uint64_t vars8;

  ConnectionObserver::~ConnectionObserver(this);
  operator delete(v1);
}

void ___ZN18ConnectionObserver6resumeEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  xpc_object_t v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)xpc_object_t v4 = 0;
    _os_log_debug_impl(&dword_1C5737000, v2, OS_LOG_TYPE_DEBUG, "#D Resuming", v4, 2u);
    uint64_t v3 = *(NSObject **)(v1 + 120);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(NSObject **)(v1 + 120);
    if (!v3) {
      return;
    }
  }
  *(void *)(v1 + 120) = 0;
  dispatch_resume(v3);
  dispatch_release(v3);
}

void ___ZN18ConnectionObserver7suspendEv_block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  xpc_object_t v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1C5737000, v2, OS_LOG_TYPE_DEBUG, "#D Suspending", buf, 2u);
    int v3 = *(_DWORD *)(v1 + 128);
    if (v3) {
      goto LABEL_3;
    }
LABEL_19:
    size_t v12 = *(NSObject **)(v1 + 136);
    if (v12)
    {
      dispatch_retain(*(dispatch_object_t *)(v1 + 136));
      dispatch_suspend(v12);
    }
    long long v13 = *(NSObject **)(v1 + 120);
    *(void *)(v1 + 120) = v12;
    if (v13)
    {
      dispatch_resume(v13);
      dispatch_release(v13);
    }
    return;
  }
  int v3 = *(_DWORD *)(v1 + 128);
  if (!v3) {
    goto LABEL_19;
  }
LABEL_3:
  int v4 = v3 - 1;
  *(_DWORD *)(v1 + 128) = v3 - 1;
  xpc_object_t v5 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v4;
    _os_log_debug_impl(&dword_1C5737000, v5, OS_LOG_TYPE_DEBUG, "#D Extra decreased to %d", buf, 8u);
    if (!*(_DWORD *)(v1 + 128)) {
      return;
    }
  }
  else if (!v4)
  {
    return;
  }
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  uint64_t v6 = off_1EB5069C8;
  if (!off_1EB5069C8)
  {
    xpc_object_t v7 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v7);
    memset(buf, 170, sizeof(buf));
    std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(buf, (uint64_t)v7);
    ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*(uint64_t *)buf);
    long long v8 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    uint64_t v9 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    off_1EB5069C8 = v8;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    xpc_object_t v10 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    uint64_t v6 = off_1EB5069C8;
  }
  uint64_t v11 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
  if (*(&off_1EB5069C8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::operator()(*(uint64_t ****)(v6 + 104));
  if (v11)
  {
    if (!atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_1C574F144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  _Unwind_Resume(a1);
}

void ___ZN18ConnectionObserver17handleDaemonReadyEv_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  xpc_object_t v2 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1C5737000, v2, OS_LOG_TYPE_DEBUG, "#D Daemon ready received", buf, 2u);
    if (*(void *)(v1 + 120)) {
      goto LABEL_3;
    }
  }
  else if (*(void *)(v1 + 120))
  {
LABEL_3:
    pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    uint64_t v3 = off_1EB5069C8;
    if (!off_1EB5069C8)
    {
      int v4 = (ConnectionObserver *)operator new(0x90uLL);
      ConnectionObserver::ConnectionObserver(v4);
      memset(buf, 170, sizeof(buf));
      std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(buf, (uint64_t)v4);
      ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*(uint64_t *)buf);
      long long v5 = *(_OWORD *)buf;
      memset(buf, 0, sizeof(buf));
      uint64_t v6 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
      off_1EB5069C8 = v5;
      if (v6 && !atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
      xpc_object_t v7 = *(std::__shared_weak_count **)&buf[8];
      if (*(void *)&buf[8]
        && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
      uint64_t v3 = off_1EB5069C8;
    }
    long long v8 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    if (*(&off_1EB5069C8 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::operator()(*(uint64_t ****)(v3 + 104));
    if (v8)
    {
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    return;
  }
  int v9 = *(_DWORD *)(v1 + 128) + 1;
  *(_DWORD *)(v1 + 128) = v9;
  xpc_object_t v10 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    _os_log_debug_impl(&dword_1C5737000, v10, OS_LOG_TYPE_DEBUG, "#D Extra increased to %d", buf, 8u);
  }
}

void sub_1C574F440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  _Unwind_Resume(a1);
}

uint64_t ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 13;
  strcpy(a1, "conn.observer");
}

uint64_t ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20EDBA8;
  MEMORY[0x1C878F380](a1 + 1);
  return a1;
}

void ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20EDBA8;
  MEMORY[0x1C878F380](a1 + 1);
  operator delete(a1);
}

void ctu::SharedLoggableLockable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~SharedLoggableLockable(void *a1)
{
  *a1 = &unk_1F20EDBA8;
  MEMORY[0x1C878F380](a1 + 1);
  xpc_object_t v2 = (std::__shared_weak_count *)a1[10];
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  operator delete(a1);
}

void boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::~signal(void *__p)
{
  *long long __p = &unk_1F20EDC28;
  xpc_object_t v2 = (atomic_uint *)__p[2];
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  operator delete(__p);
}

uint64_t boost::signals2::signal<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::lock_pimpl@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(result + 16);
  *a2 = *(void *)(result + 8);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_uint *volatile)(v2 + 8), 1u, memory_order_relaxed);
  }
  return result;
}

uint64_t *boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::~grouped_list(uint64_t *a1)
{
  std::__tree<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,std::__map_value_compare<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>,boost::signals2::detail::group_key_less<int,std::less<int>>,false>,std::allocator<std::__value_type<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>>>>::destroy((uint64_t)(a1 + 3), (void *)a1[4]);
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        long long v5 = (uint64_t *)v3[1];
        uint64_t v6 = (atomic_uint *)v3[3];
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

uint64_t boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::~shared_ptr(uint64_t a1)
{
  uint64_t v2 = *(atomic_uint **)(a1 + 8);
  if (v2)
  {
    if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
      if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
      }
    }
  }
  return a1;
}

void boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1) {
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::optional_last_value<void>>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::mutex>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    pthread_mutex_destroy(*(pthread_mutex_t **)(a1 + 16));
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::mutex>::get_untyped_deleter()
{
  return 0;
}

void boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::dispose(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = (atomic_uint *)v1[4];
    if (v2)
    {
      if (atomic_fetch_add(v2 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v2 + 16))(v2);
        if (atomic_fetch_add(v2 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v2 + 24))(v2);
        }
      }
    }
    uint64_t v3 = (atomic_uint *)v1[1];
    if (v3)
    {
      if (atomic_fetch_add(v3 + 2, 0xFFFFFFFF) == 1)
      {
        (*(void (**)(atomic_uint *))(*(void *)v3 + 16))(v3);
        if (atomic_fetch_add(v3 + 3, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v3 + 24))(v3);
        }
      }
    }
    operator delete(v1);
  }
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_local_deleter()
{
  return 0;
}

uint64_t boost::detail::sp_counted_impl_p<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>>::get_untyped_deleter()
{
  return 0;
}

uint64_t boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::operator()(uint64_t ***a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  long long v34 = 0;
  char v35 = 0;
  *(void *)&long long v2 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v47 = v2;
  long long v48 = v2;
  long long v45 = v2;
  long long v46 = v2;
  long long v43 = v2;
  long long v44 = v2;
  long long v41 = v2;
  long long v42 = v2;
  long long v39 = v2;
  long long v40 = v2;
  uint64_t v3 = (pthread_mutex_t *)a1[3];
  *(void *)&long long v49 = 10;
  *((void *)&v49 + 1) = &v39;
  *(void *)&long long v50 = 0;
  *((void *)&v50 + 1) = v3;
  pthread_mutex_lock(v3);
  uint64_t v4 = (atomic_uint *)a1[1];
  if (!v4)
  {
    uint64_t v6 = *a1;
    goto LABEL_14;
  }
  unsigned int explicit = atomic_load_explicit(v4 + 2, memory_order_acquire);
  uint64_t v6 = *a1;
  if (explicit == 1)
  {
    uint64_t v7 = (uint64_t)a1[2];
    if ((uint64_t *)v7 == *v6)
    {
      uint64_t v7 = (*v6)[1];
      *(void *)&long long v36 = v7;
      long long v8 = *v6;
      if (*v6 == (uint64_t *)v7)
      {
LABEL_11:
        a1[2] = (uint64_t **)v7;
        goto LABEL_12;
      }
    }
    else
    {
      *(void *)&long long v36 = a1[2];
      long long v8 = *v6;
      if (*v6 == (uint64_t *)v7) {
        goto LABEL_11;
      }
    }
    uint64_t v9 = *(void *)(v7 + 16);
    if (*(unsigned char *)(v9 + 24))
    {
      uint64_t v7 = *(void *)(v7 + 8);
    }
    else
    {
      uint64_t v7 = boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase(v8, (int *)(v9 + 64), (uint64_t **)&v36);
      uint64_t v6 = *a1;
    }
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v4 = (atomic_uint *)a1[1];
  if (v4) {
    atomic_fetch_add_explicit(v4 + 2, 1u, memory_order_relaxed);
  }
LABEL_14:
  xpc_object_t v10 = v35;
  long long v34 = v6;
  char v35 = v4;
  if (v10)
  {
    if (atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1)
    {
      (*(void (**)(atomic_uint *))(*(void *)v10 + 16))(v10);
      if (atomic_fetch_add(v10 + 3, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v10 + 24))(v10);
      }
    }
  }
  pthread_mutex_unlock(*((pthread_mutex_t **)&v50 + 1));
  unint64_t v11 = *((void *)&v49 + 1);
  if (*((void *)&v49 + 1))
  {
    if ((uint64_t)v50 - 1 >= 0)
    {
      unint64_t v12 = *((void *)&v49 + 1) + 16 * v50;
      do
      {
        long long v13 = *(atomic_uint **)(v12 - 8);
        if (v13)
        {
          if (atomic_fetch_add(v13 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v13 + 16))(v13);
            if (atomic_fetch_add(v13 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v13 + 24))(v13);
            }
          }
        }
        v12 -= 16;
      }
      while (v12 > v11);
    }
    if ((unint64_t)v49 >= 0xB) {
      operator delete(*((void **)&v49 + 1));
    }
  }
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v58 = v14;
  long long v53 = v14;
  unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
  long long v51 = v14;
  long long v52 = v14;
  long long v49 = v14;
  long long v50 = v14;
  long long v47 = v14;
  long long v48 = v14;
  long long v45 = v14;
  long long v46 = v14;
  long long v43 = v14;
  long long v44 = v14;
  long long v41 = v14;
  long long v42 = v14;
  long long v39 = v14;
  long long v40 = v14;
  LOBYTE(v39) = 0;
  uint64_t v55 = 10;
  xpc_object_t v56 = (char *)&v39 + 8;
  *(void *)((char *)&v58 + 4) = 0;
  uint64_t v57 = 0;
  uint64_t v59 = 0;
  uint64_t v15 = v34;
  uint64_t v16 = (uint64_t)*v34;
  long long v31 = &v39;
  long long v32 = a1;
  uint64_t v33 = v16;
  *(void *)&long long v29 = *(void *)(v16 + 8);
  *((void *)&v29 + 1) = v16;
  *(void *)&long long v30 = &v39;
  *((void *)&v30 + 1) = v16;
  boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(&v29);
  v28[0] = *v15;
  v28[1] = v28[0];
  v28[2] = &v39;
  v28[3] = v28[0];
  boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(v28);
  long long v36 = v29;
  long long v37 = v30;
  uint64_t v17 = v28[0];
  uint64_t v18 = v29;
  if ((void)v29 == v28[0])
  {
    if (DWORD2(v58) <= DWORD1(v58)) {
      goto LABEL_48;
    }
LABEL_47:
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::force_cleanup_connections((uint64_t)v32, v33);
    goto LABEL_48;
  }
  uint64_t v19 = (unsigned char *)v37;
  if (!*(unsigned char *)v37)
  {
    uint64_t v20 = *(void *)(*(void *)(v29 + 16) + 32);
    uint64_t v21 = *(void *)(v20 + 24);
    if (!v21)
    {
      std::runtime_error::runtime_error(&v38, "call to empty boost::function");
      v38.__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4B0;
      boost::throw_exception<boost::bad_function_call>(&v38);
    }
    (*(void (**)(uint64_t))((v21 & 0xFFFFFFFFFFFFFFFELL) + 8))(v20 + 32);
    if (!*v19) {
      unsigned char *v19 = 1;
    }
  }
  *(void *)&long long v36 = *(void *)(v18 + 8);
  boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(&v36);
  uint64_t v22 = (unsigned char *)v37;
  if (*(unsigned char *)v37) {
    *(unsigned char *)long long v37 = 0;
  }
  for (uint64_t i = v36; (void)v36 != v17; uint64_t i = v36)
  {
    uint64_t v24 = *(void *)(*(void *)(i + 16) + 32);
    uint64_t v25 = *(void *)(v24 + 24);
    if (!v25)
    {
      std::runtime_error::runtime_error(&v38, "call to empty boost::function");
      v38.__vftable = (std::runtime_error_vtbl *)&unk_1F20ED4B0;
      boost::throw_exception<boost::bad_function_call>(&v38);
    }
    (*(void (**)(uint64_t))((v25 & 0xFFFFFFFFFFFFFFFELL) + 8))(v24 + 32);
    if (!*v22) {
      *uint64_t v22 = 1;
    }
    *(void *)&long long v36 = *(void *)(i + 8);
    boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(&v36);
    uint64_t v22 = (unsigned char *)v37;
    if (*(unsigned char *)v37) {
      *(unsigned char *)long long v37 = 0;
    }
  }
  if (*((_DWORD *)v31 + 70) > *((_DWORD *)v31 + 69)) {
    goto LABEL_47;
  }
LABEL_48:
  uint64_t result = boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache((uint64_t)&v39);
  long long v27 = v35;
  if (v35 && atomic_fetch_add(v35 + 2, 0xFFFFFFFF) == 1)
  {
    uint64_t result = (*(uint64_t (**)(atomic_uint *))(*(void *)v27 + 16))(v27);
    if (atomic_fetch_add(v27 + 3, 0xFFFFFFFF) == 1) {
      return (*(uint64_t (**)(atomic_uint *))(*(void *)v27 + 24))(v27);
    }
  }
  return result;
}

void sub_1C575013C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1C575014C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,std::runtime_error a27)
{
  std::runtime_error::~runtime_error(&a27);
  if (a2 != 2)
  {
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_janitor::~invocation_janitor(&v29);
    boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache((uint64_t)&v31);
    boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr((uint64_t)&v30);
    _Unwind_Resume(a1);
  }
  __cxa_begin_catch(a1);
  boost::signals2::detail::connection_body_base::disconnect(*(boost::signals2::detail::connection_body_base **)(a23 + 16));
  __cxa_rethrow();
}

void sub_1C57501AC(_Unwind_Exception *a1, int a2)
{
  __cxa_end_catch();
  if (a2 != 2)
  {
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_janitor::~invocation_janitor(&v4);
    boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache((uint64_t)&v6);
    boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::~shared_ptr((uint64_t)&v5);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x1C575017CLL);
}

void sub_1C57501E4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unint64_t a49,char *__p,uint64_t a51)
{
  if (__p)
  {
    if (a51 - 1 >= 0)
    {
      long long v51 = &__p[16 * a51];
      do
      {
        long long v52 = (atomic_uint *)*((void *)v51 - 1);
        if (v52)
        {
          if (atomic_fetch_add(v52 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v52 + 16))(v52);
            if (atomic_fetch_add(v52 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v52 + 24))(v52);
            }
          }
        }
        v51 -= 16;
      }
      while (v51 > __p);
    }
    if (a49 >= 0xB) {
      operator delete(__p);
    }
  }
  JUMPOUT(0x1C57502D4);
}

void sub_1C57502B0(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x1C57502DCLL);
}

uint64_t *boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_janitor::~invocation_janitor(uint64_t *a1)
{
  if (*(_DWORD *)(*a1 + 280) > *(_DWORD *)(*a1 + 276)) {
    boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::force_cleanup_connections(a1[1], a1[2]);
  }
  return a1;
}

void boost::signals2::detail::slot_call_iterator_t<boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>,std::__list_iterator<boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>,void *>,boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>::lock_next_callable(void *a1)
{
  v69[3] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *a1;
  if (*a1 == a1[3]) {
    return;
  }
  long long v2 = a1;
  if (v1 == a1[1])
  {
LABEL_94:
    uint64_t v47 = v2[3];
    if (v47 != v1)
    {
      *(void *)&long long v48 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v65 = v48;
      long long v66 = v48;
      long long v63 = v48;
      long long v64 = v48;
      long long v61 = v48;
      long long v62 = v48;
      long long v59 = v48;
      long long v60 = v48;
      long long v57 = v48;
      long long v58 = v48;
      uint64_t v49 = *(void *)(v47 + 16);
      *(void *)&long long v67 = 10;
      *((void *)&v67 + 1) = &v57;
      *(void *)&long long v68 = 0;
      *((void *)&v68 + 1) = v49;
      (*(void (**)(uint64_t))(*(void *)v49 + 24))(v49);
      uint64_t v50 = v2[2];
      v2[3] = v2[1];
      long long v51 = *(_DWORD **)(v50 + 288);
      if (v51) {
        boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(v51, &v57);
      }
      *(void *)(v50 + 288) = 0;
      (*(void (**)(void))(**((void **)&v68 + 1) + 32))(*((void *)&v68 + 1));
      unint64_t v52 = *((void *)&v67 + 1);
      if (*((void *)&v67 + 1))
      {
        if ((uint64_t)v68 - 1 >= 0)
        {
          unint64_t v53 = *((void *)&v67 + 1) + 16 * v68;
          do
          {
            unint64_t v54 = *(atomic_uint **)(v53 - 8);
            if (v54)
            {
              if (atomic_fetch_add(v54 + 2, 0xFFFFFFFF) == 1)
              {
                (*(void (**)(atomic_uint *))(*(void *)v54 + 16))(v54);
                if (atomic_fetch_add(v54 + 3, 0xFFFFFFFF) == 1) {
                  (*(void (**)(atomic_uint *))(*(void *)v54 + 24))(v54);
                }
              }
            }
            v53 -= 16;
          }
          while (v53 > v52);
        }
        if ((unint64_t)v67 >= 0xB) {
          operator delete(*((void **)&v67 + 1));
        }
      }
    }
    return;
  }
  while (1)
  {
    uint64_t v3 = v2[2];
    uint64_t v4 = *(void *)(v3 + 264);
    if (v4)
    {
      if (v4 - 1 < 0)
      {
        uint64_t v11 = *(void *)(v3 + 264);
      }
      else
      {
        unint64_t v5 = *(void *)(v3 + 256);
        unint64_t v6 = v5 + 24 * v4;
        unint64_t v7 = v6;
        do
        {
          int v8 = *(_DWORD *)(v7 - 24);
          v7 -= 24;
          if (v8 == v8 >> 31)
          {
            uint64_t v9 = *(atomic_uint **)(v6 - 8);
            if (v9)
            {
              if (atomic_fetch_add(v9 + 2, 0xFFFFFFFF) == 1)
              {
                (*(void (**)(atomic_uint *))(*(void *)v9 + 16))(v9);
                if (atomic_fetch_add(v9 + 3, 0xFFFFFFFF) == 1) {
                  (*(void (**)(atomic_uint *))(*(void *)v9 + 24))(v9);
                }
              }
            }
          }
          else
          {
            uint64_t v10 = *(void *)(v6 - 16);
            if (v10) {
              (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
            }
          }
          unint64_t v6 = v7;
        }
        while (v7 > v5);
        uint64_t v11 = *(void *)(v3 + 264);
        uint64_t v1 = *v2;
      }
      *(void *)(v3 + 264) = v11 - v4;
    }
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v67 = v12;
    long long v68 = v12;
    long long v65 = v12;
    long long v66 = v12;
    long long v63 = v12;
    long long v64 = v12;
    long long v61 = v12;
    long long v62 = v12;
    long long v59 = v12;
    long long v60 = v12;
    long long v57 = v12;
    long long v58 = v12;
    uint64_t v13 = *(void *)(v1 + 16);
    *(void *)&long long v67 = 10;
    *((void *)&v67 + 1) = &v57;
    *(void *)&long long v68 = 0;
    *((void *)&v68 + 1) = v13;
    (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
    uint64_t v14 = *v2;
    uint64_t v15 = *(void *)(*v2 + 16);
    uint64_t v16 = v2[2];
    uint64_t v17 = *(uint64_t **)(v15 + 32);
    if (v17)
    {
      uint64_t v18 = *v17;
      if (*v17 != v17[1])
      {
        while (1)
        {
          memset(v69, 170, 24);
          boost::variant<boost::weak_ptr<boost::signals2::detail::trackable_pointee>,boost::weak_ptr<void>,boost::signals2::detail::foreign_void_weak_ptr>::apply_visitor<boost::signals2::detail::lock_weak_ptr_visitor const>(v18, (uint64_t)v69);
          if ((*(_DWORD *)v18 ^ (*(int *)v18 >> 31)) == 2)
          {
            if (!(*(unsigned int (**)(void))(**(void **)(v18 + 8) + 24))(*(void *)(v18 + 8))) {
              goto LABEL_22;
            }
          }
          else
          {
            uint64_t v19 = *(void *)(v18 + 16);
            if (v19 && atomic_load_explicit((atomic_uint *volatile)(v19 + 8), memory_order_acquire))
            {
LABEL_22:
              uint64_t v20 = *(void *)(v16 + 264);
              if (v20 == *(void *)(v16 + 248))
              {
                if (v20 == -1)
                {
                  uint64_t v22 = *(void **)(v16 + 256);
                }
                else
                {
                  if (4 * v20 <= (unint64_t)(v20 + 1)) {
                    unint64_t v21 = v20 + 1;
                  }
                  else {
                    unint64_t v21 = 4 * v20;
                  }
                  uint64_t v22 = (void *)(v16 + 8);
                  unint64_t v56 = v21;
                  if (v21 >= 0xB)
                  {
                    if (v21 >= 0xAAAAAAAAAAAAAABLL) {
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    }
                    uint64_t v22 = operator new(24 * v21);
                  }
                  uint64_t v23 = *(void *)(v16 + 256);
                  if (v20)
                  {
                    unint64_t v24 = 0;
                    uint64_t v25 = v23 + 24 * v20;
                    do
                    {
                      long long v26 = (char *)&v22[v24 / 8];
                      uint64_t v27 = v23 + v24;
                      uint64_t v28 = *(void *)(v23 + v24 + 8);
                      if (*(_DWORD *)(v23 + v24) == *(int *)(v23 + v24) >> 31)
                      {
                        *((void *)v26 + 1) = v28;
                        uint64_t v29 = *(void *)(v27 + 16);
                        *((void *)v26 + 2) = v29;
                        if (v29) {
                          atomic_fetch_add_explicit((atomic_uint *volatile)(v29 + 8), 1u, memory_order_relaxed);
                        }
                      }
                      else
                      {
                        *((void *)v26 + 1) = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 16))(v28);
                      }
                      *(_DWORD *)long long v26 = *(_DWORD *)v27 ^ (*(int *)v27 >> 31);
                      v24 += 24;
                    }
                    while (v27 + 24 != v25);
                    uint64_t v23 = *(void *)(v16 + 256);
                    long long v2 = a1;
                  }
                  if (v23) {
                    boost::signals2::detail::auto_buffer<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>>>::auto_buffer_destroy((void *)(v16 + 8));
                  }
                  *(void *)(v16 + 248) = v56;
                  *(void *)(v16 + 256) = v22;
                  uint64_t v20 = *(void *)(v16 + 264);
                }
                long long v36 = &v22[3 * v20 + 1];
                if (LODWORD(v69[0]) == SLODWORD(v69[0]) >> 31)
                {
                  *long long v36 = v69[1];
                  uint64_t v37 = v69[2];
                  v22[3 * v20 + 2] = v69[2];
                  if (v37) {
                    atomic_fetch_add_explicit((atomic_uint *volatile)(v37 + 8), 1u, memory_order_relaxed);
                  }
                }
                else
                {
                  *long long v36 = (*(uint64_t (**)(void))(*(void *)v69[1] + 16))(v69[1]);
                }
                char v35 = (int *)&v22[3 * v20];
              }
              else
              {
                uint64_t v32 = *(void *)(v16 + 256);
                uint64_t v33 = (void *)(v32 + 24 * v20 + 8);
                if (LODWORD(v69[0]) == SLODWORD(v69[0]) >> 31)
                {
                  *uint64_t v33 = v69[1];
                  uint64_t v34 = v69[2];
                  *(void *)(v32 + 24 * v20 + 16) = v69[2];
                  if (v34) {
                    atomic_fetch_add_explicit((atomic_uint *volatile)(v34 + 8), 1u, memory_order_relaxed);
                  }
                }
                else
                {
                  *uint64_t v33 = (*(uint64_t (**)(void))(*(void *)v69[1] + 16))(v69[1]);
                }
                char v35 = (int *)(v32 + 24 * v20);
              }
              char v30 = 0;
              int *v35 = LODWORD(v69[0]) ^ (SLODWORD(v69[0]) >> 31);
              ++*(void *)(v16 + 264);
              if (LODWORD(v69[0]) == SLODWORD(v69[0]) >> 31) {
                goto LABEL_41;
              }
              goto LABEL_61;
            }
          }
          if (*(unsigned char *)(v15 + 24))
          {
            *(unsigned char *)(v15 + 24) = 0;
            boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>((_DWORD *)v15, &v57);
          }
          char v30 = 1;
          if (LODWORD(v69[0]) == SLODWORD(v69[0]) >> 31)
          {
LABEL_41:
            uint64_t v31 = (atomic_uint *)v69[2];
            if (v69[2])
            {
              if (atomic_fetch_add((atomic_uint *volatile)(v69[2] + 8), 0xFFFFFFFF) == 1)
              {
                (*(void (**)(atomic_uint *))(*(void *)v31 + 16))(v31);
                if (atomic_fetch_add(v31 + 3, 0xFFFFFFFF) == 1) {
                  (*(void (**)(atomic_uint *))(*(void *)v31 + 24))(v31);
                }
              }
            }
            goto LABEL_63;
          }
LABEL_61:
          if (v69[1]) {
            (*(void (**)(void))(*(void *)v69[1] + 8))(v69[1]);
          }
LABEL_63:
          if ((v30 & 1) == 0)
          {
            v18 += 24;
            if (v18 != *(void *)(*(void *)(v15 + 32) + 8)) {
              continue;
            }
          }
          uint64_t v14 = *v2;
          uint64_t v15 = *(void *)(*v2 + 16);
          uint64_t v16 = v2[2];
          break;
        }
      }
    }
    if (*(unsigned char *)(v15 + 24))
    {
      ++*(_DWORD *)(v16 + 276);
      uint64_t v38 = *(void *)(v15 + 16);
      if (v38)
      {
        if (atomic_load_explicit((atomic_uint *volatile)(v38 + 8), memory_order_acquire))
        {
          int v39 = 1;
          goto LABEL_80;
        }
        uint64_t v16 = v2[2];
        uint64_t v14 = *v2;
      }
      v2[3] = v14;
      if (v2[1] == v14)
      {
        long long v42 = *(_DWORD **)(v16 + 288);
        if (v42) {
          boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(v42, &v57);
        }
        int v39 = 0;
        *(void *)(v16 + 288) = 0;
      }
      else
      {
        uint64_t v40 = *(void *)(v14 + 16);
        long long v41 = *(_DWORD **)(v16 + 288);
        if (v41) {
          boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(v41, &v57);
        }
        *(void *)(v16 + 288) = v40;
        int v39 = 0;
        if (v40) {
          ++*(_DWORD *)(v40 + 28);
        }
      }
    }
    else
    {
      ++*(_DWORD *)(v16 + 280);
      int v39 = 1;
    }
LABEL_80:
    (*(void (**)(void))(**((void **)&v68 + 1) + 32))(*((void *)&v68 + 1));
    unint64_t v43 = *((void *)&v67 + 1);
    if (*((void *)&v67 + 1))
    {
      if ((uint64_t)v68 - 1 >= 0)
      {
        unint64_t v44 = *((void *)&v67 + 1) + 16 * v68;
        do
        {
          long long v45 = *(atomic_uint **)(v44 - 8);
          if (v45)
          {
            if (atomic_fetch_add(v45 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v45 + 16))(v45);
              if (atomic_fetch_add(v45 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v45 + 24))(v45);
              }
            }
          }
          v44 -= 16;
        }
        while (v44 > v43);
      }
      if ((unint64_t)v67 >= 0xB) {
        operator delete(*((void **)&v67 + 1));
      }
    }
    uint64_t v1 = *v2;
    uint64_t v46 = v2[1];
    if (!v39) {
      break;
    }
    uint64_t v1 = *(void *)(v1 + 8);
    *long long v2 = v1;
    if (v1 == v46)
    {
      uint64_t v1 = v46;
      goto LABEL_94;
    }
  }
  if (v1 == v46) {
    goto LABEL_94;
  }
}

void sub_1C5750BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5750C14(_Unwind_Exception *a1)
{
  unint64_t v3 = v1[21];
  if (v3)
  {
    uint64_t v4 = v1[22];
    if (v4 - 1 >= 0)
    {
      unint64_t v5 = v3 + 16 * v4;
      do
      {
        unint64_t v6 = *(atomic_uint **)(v5 - 8);
        if (v6)
        {
          if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
            if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
            }
          }
        }
        v5 -= 16;
      }
      while (v5 > v3);
    }
    if (v1[20] >= 0xBuLL)
    {
      operator delete((void *)v1[21]);
      _Unwind_Resume(a1);
    }
  }
  JUMPOUT(0x1C5750F20);
}

void sub_1C5750DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>::~variant(v5 - 128);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5750DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5750DF4(void *a1, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    if (v3)
    {
      uint64_t v4 = (atomic_uint **)(v2 + 16);
      do
      {
        if (*((_DWORD *)v4 - 4) == *((int *)v4 - 4) >> 31)
        {
          uint64_t v5 = *v4;
          if (*v4 && atomic_fetch_add(v5 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v5 + 16))(v5);
            if (atomic_fetch_add(v5 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v5 + 24))(v5);
            }
          }
        }
        else
        {
          uint64_t v6 = (uint64_t)*(v4 - 1);
          if (v6) {
            (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
          }
        }
        v4 += 3;
        v3 -= 24;
      }
      while (v3);
    }
    __cxa_rethrow();
  }
  JUMPOUT(0x1C5750F20);
}

void sub_1C5750EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  __cxa_end_catch();
  if (a4 >= 0xB)
  {
    operator delete(v5);
    boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>::~variant(v6 - 128);
    boost::signals2::detail::garbage_collecting_lock<boost::signals2::detail::connection_body_base>::~garbage_collecting_lock((uint64_t)va);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x1C5750DC0);
}

void sub_1C5750F18(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void boost::signals2::detail::auto_buffer<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>>>::auto_buffer_destroy(void *a1)
{
  uint64_t v2 = a1[32];
  if (v2 && v2 - 1 >= 0)
  {
    unint64_t v3 = a1[31];
    unint64_t v4 = v3 + 24 * v2;
    unint64_t v5 = v4;
    do
    {
      int v6 = *(_DWORD *)(v5 - 24);
      v5 -= 24;
      if (v6 == v6 >> 31)
      {
        unint64_t v7 = *(atomic_uint **)(v4 - 8);
        if (v7)
        {
          if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
            if (atomic_fetch_add(v7 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v7 + 24))(v7);
            }
          }
        }
      }
      else
      {
        uint64_t v8 = *(void *)(v4 - 16);
        if (v8) {
          (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
        }
      }
      unint64_t v4 = v5;
    }
    while (v5 > v3);
  }
  if (a1[30] >= 0xBuLL)
  {
    uint64_t v9 = (void *)a1[31];
    operator delete(v9);
  }
}

void boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::force_cleanup_connections(uint64_t a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[8] = v4;
  v22[9] = v4;
  v22[6] = v4;
  v22[7] = v4;
  void v22[4] = v4;
  v22[5] = v4;
  v22[2] = v4;
  v22[3] = v4;
  v22[0] = v4;
  v22[1] = v4;
  unint64_t v5 = *(pthread_mutex_t **)(a1 + 24);
  unint64_t v23 = 10;
  long long __p = v22;
  uint64_t v25 = 0;
  long long v26 = v5;
  pthread_mutex_lock(v5);
  if (**(void **)a1 == a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    if (!v6 || atomic_load_explicit((atomic_uint *volatile)(v6 + 8), memory_order_acquire) != 1)
    {
      unint64_t v7 = (uint64_t *)operator new(0x20uLL);
      uint64_t v8 = *(uint64_t **)a1;
      uint64_t v9 = **(void **)a1;
      uint64_t v10 = operator new(0x40uLL);
      boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::grouped_list((uint64_t)v10, v9);
      boost::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>::shared_ptr<boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>>(v7, (uint64_t)v10);
      v7[2] = v8[2];
      uint64_t v11 = v8[3];
      v7[3] = v11;
      if (v11) {
        atomic_fetch_add_explicit((atomic_uint *volatile)(v11 + 8), 1u, memory_order_relaxed);
      }
      boost::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>::shared_ptr<boost::signals2::detail::signal_impl<void ()(void),boost::signals2::optional_last_value<void>,int,std::less<int>,boost::function<void ()(void)>,boost::function<void ()(boost::signals2::connection const&)>,boost::signals2::mutex>::invocation_state>((uint64_t *)&v21, (uint64_t)v7);
      long long v12 = *(uint64_t **)a1;
      uint64_t v13 = *(atomic_uint **)(a1 + 8);
      *(_OWORD *)a1 = v21;
      *(void *)&long long v21 = v12;
      *((void *)&v21 + 1) = v13;
      if (v13)
      {
        if (atomic_fetch_add(v13 + 2, 0xFFFFFFFF) == 1)
        {
          (*(void (**)(atomic_uint *))(*(void *)v13 + 16))(v13);
          if (atomic_fetch_add(v13 + 3, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v13 + 24))(v13);
          }
        }
      }
    }
    uint64_t v14 = *(uint64_t ***)a1;
    uint64_t v15 = **(uint64_t ***)a1;
    uint64_t v16 = v15[1];
    *(void *)&long long v21 = v16;
    if (v15 != (uint64_t *)v16)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = *(void *)(v16 + 16);
          if (!*(unsigned char *)(v17 + 24)) {
            break;
          }
          uint64_t v16 = *(void *)(v16 + 8);
          *(void *)&long long v21 = v16;
          uint64_t v15 = *v14;
          if ((uint64_t *)v16 == *v14) {
            goto LABEL_15;
          }
        }
        uint64_t v16 = boost::signals2::detail::grouped_list<int,std::less<int>,boost::shared_ptr<boost::signals2::detail::connection_body<std::pair<boost::signals2::detail::slot_meta_group,boost::optional<int>>,boost::signals2::slot<void ()(void),boost::function<void ()(void)>>,boost::signals2::mutex>>>::erase(v15, (int *)(v17 + 64), (uint64_t **)&v21);
        uint64_t v14 = *(uint64_t ***)a1;
        *(void *)&long long v21 = v16;
        uint64_t v15 = *v14;
      }
      while ((uint64_t *)v16 != *v14);
    }
LABEL_15:
    *(void *)(a1 + 16) = v16;
  }
  pthread_mutex_unlock(v26);
  uint64_t v18 = (char *)__p;
  if (__p)
  {
    if (v25 - 1 >= 0)
    {
      uint64_t v19 = (char *)__p + 16 * v25;
      do
      {
        uint64_t v20 = (atomic_uint *)*((void *)v19 - 1);
        if (v20)
        {
          if (atomic_fetch_add(v20 + 2, 0xFFFFFFFF) == 1)
          {
            (*(void (**)(atomic_uint *))(*(void *)v20 + 16))(v20);
            if (atomic_fetch_add(v20 + 3, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v20 + 24))(v20);
            }
          }
        }
        v19 -= 16;
      }
      while (v19 > v18);
    }
    if (v23 >= 0xB) {
      operator delete(__p);
    }
  }
}

void sub_1C5751358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t boost::signals2::detail::slot_call_iterator_cache<boost::signals2::detail::void_type,boost::signals2::detail::variadic_slot_invoker<boost::signals2::detail::void_type>>::~slot_call_iterator_cache(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 288);
  if (v2)
  {
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v8[8] = v3;
    v8[9] = v3;
    v8[6] = v3;
    v8[7] = v3;
    void v8[4] = v3;
    v8[5] = v3;
    v8[2] = v3;
    v8[3] = v3;
    v8[0] = v3;
    v8[1] = v3;
    unint64_t v9 = 10;
    long long __p = v8;
    uint64_t v11 = 0;
    uint64_t v12 = v2;
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
    boost::signals2::detail::connection_body_base::dec_slot_refcount<boost::signals2::detail::connection_body_base>(*(_DWORD **)(a1 + 288), v8);
    (*(void (**)(uint64_t))(*(void *)v12 + 32))(v12);
    long long v4 = (char *)__p;
    if (__p)
    {
      if (v11 - 1 >= 0)
      {
        unint64_t v5 = (char *)__p + 16 * v11;
        do
        {
          uint64_t v6 = (atomic_uint *)*((void *)v5 - 1);
          if (v6)
          {
            if (atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1)
            {
              (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
              if (atomic_fetch_add(v6 + 3, 0xFFFFFFFF) == 1) {
                (*(void (**)(atomic_uint *))(*(void *)v6 + 24))(v6);
              }
            }
          }
          v5 -= 16;
        }
        while (v5 > v4);
      }
      if (v9 >= 0xB) {
        operator delete(__p);
      }
    }
  }
  if (*(void *)(a1 + 256)) {
    boost::signals2::detail::auto_buffer<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>,boost::signals2::detail::store_n_objects<10u>,boost::signals2::detail::default_grow_policy,std::allocator<boost::variant<boost::shared_ptr<void>,boost::signals2::detail::foreign_void_shared_ptr>>>::auto_buffer_destroy((void *)(a1 + 8));
  }
  if (*(unsigned char *)a1) {
    *(unsigned char *)a1 = 0;
  }
  return a1;
}

void sub_1C5751644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t __cxx_global_var_init_6()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<ConnectionObserver>::~PthreadMutexGuardPolicy, &ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance, &dword_1C5737000);
  }
  return result;
}

void BudgetData::BudgetData(BudgetData *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
}

{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
}

void BudgetData::~BudgetData(BudgetData *this)
{
  uint64_t v2 = (void *)((char *)this + 8);
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*((void **)this + 1));
  *(void *)this = v2;
  *((void *)this + 2) = 0;
  *uint64_t v2 = 0;
}

{
  void *v2;

  uint64_t v2 = (void *)((char *)this + 8);
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*((void **)this + 1));
  *(void *)this = v2;
  *((void *)this + 2) = 0;
  *uint64_t v2 = 0;
}

void BudgetData::BudgetData(BudgetData *this, const BudgetData *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  if (this != a2) {
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>((uint64_t **)this, *(void **)a2, (void *)a2 + 1);
  }
}

{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  if (this != a2) {
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>((uint64_t **)this, *(void **)a2, (void *)a2 + 1);
  }
}

void sub_1C575185C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void sub_1C57518BC(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void *BudgetData::BudgetData(void *result, uint64_t a2)
{
  result[2] = 0;
  result[1] = 0;
  std::logic_error *result = result + 1;
  std::logic_error *result = *(void *)a2;
  *(void *)a2 = result + 1;
  uint64_t v2 = result[1];
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = 0;
  if (result[2]) {
    long long v3 = (void *)(result[1] + 16);
  }
  else {
    long long v3 = result;
  }
  *long long v3 = result + 1;
  *(void *)a2 = a2 + 8;
  return result;
}

{
  uint64_t v2;
  void *v3;

  result[2] = 0;
  result[1] = 0;
  std::logic_error *result = result + 1;
  std::logic_error *result = *(void *)a2;
  *(void *)a2 = result + 1;
  uint64_t v2 = result[1];
  *(_OWORD *)(result + 1) = *(_OWORD *)(a2 + 8);
  *(void *)(a2 + 8) = v2;
  *(void *)(a2 + 16) = 0;
  if (result[2]) {
    long long v3 = (void *)(result[1] + 16);
  }
  else {
    long long v3 = result;
  }
  *long long v3 = result + 1;
  *(void *)a2 = a2 + 8;
  return result;
}

uint64_t **BudgetData::operator=(uint64_t **a1, uint64_t **a2)
{
  if (a2 != a1) {
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>(a1, *a2, a2 + 1);
  }
  return a1;
}

uint64_t BudgetData::get(uint64_t **a1, unsigned int a2)
{
  char v2 = a2;
  unint64_t v5 = a1 + 1;
  long long v4 = (unsigned __int8 *)a1[1];
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = v4;
        unsigned int v7 = v4[28];
        if (v7 <= a2) {
          break;
        }
        long long v4 = (unsigned __int8 *)*v6;
        unint64_t v5 = (uint64_t **)v6;
        if (!*v6) {
          goto LABEL_8;
        }
      }
      if (v7 >= a2) {
        break;
      }
      long long v4 = (unsigned __int8 *)v6[1];
      if (!v4)
      {
        unint64_t v5 = (uint64_t **)(v6 + 1);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v6 = a1 + 1;
LABEL_8:
    uint64_t v8 = v6;
    uint64_t v6 = operator new(0x28uLL);
    *((unsigned char *)v6 + 28) = v2;
    *((unsigned char *)v6 + 32) = 0;
    *((unsigned char *)v6 + 36) = 0;
    void *v6 = 0;
    v6[1] = 0;
    v6[2] = v8;
    *unint64_t v5 = v6;
    unint64_t v9 = (uint64_t *)**a1;
    uint64_t v10 = v6;
    if (v9)
    {
      *a1 = v9;
      uint64_t v10 = *v5;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v10);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v6[4];
}

uint64_t *BudgetData::set(uint64_t *result, unsigned int a2, int a3)
{
  char v4 = a2;
  unint64_t v5 = result;
  unsigned int v7 = (uint64_t **)(result + 1);
  uint64_t v6 = (unsigned __int8 *)result[1];
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v8 = v6;
        unsigned int v9 = v6[28];
        if (v9 <= a2) {
          break;
        }
        uint64_t v6 = (unsigned __int8 *)*v8;
        unsigned int v7 = (uint64_t **)v8;
        if (!*v8) {
          goto LABEL_8;
        }
      }
      if (v9 >= a2) {
        break;
      }
      uint64_t v6 = (unsigned __int8 *)v8[1];
      if (!v6)
      {
        unsigned int v7 = (uint64_t **)(v8 + 1);
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v8 = result + 1;
LABEL_8:
    uint64_t v10 = v8;
    uint64_t v8 = operator new(0x28uLL);
    *((unsigned char *)v8 + 28) = v4;
    *((unsigned char *)v8 + 32) = 0;
    *((unsigned char *)v8 + 36) = 0;
    *uint64_t v8 = 0;
    v8[1] = 0;
    v8[2] = v10;
    uint64_t *v7 = v8;
    uint64_t v11 = *(void *)*v5;
    uint64_t v12 = v8;
    if (v11)
    {
      *unint64_t v5 = v11;
      uint64_t v12 = *v7;
    }
    uint64_t result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v12);
    ++v5[2];
  }
  *((_DWORD *)v8 + 8) = a3;
  *((unsigned char *)v8 + 36) = 1;
  return result;
}

void BudgetData::clear(BudgetData *this)
{
  char v2 = (void *)((char *)this + 8);
  std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*((void **)this + 1));
  *(void *)this = v2;
  *((void *)this + 2) = 0;
  *char v2 = 0;
}

void *BudgetData::for_each(void *result, uint64_t a2)
{
  char v2 = result + 1;
  long long v3 = (void *)*result;
  if ((void *)*result != result + 1)
  {
    do
    {
      uint64_t v5 = *(void *)(a2 + 24);
      if (!v5) {
        std::__throw_bad_function_call[abi:ne180100]();
      }
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, void *))(*(void *)v5 + 48))(v5, (uint64_t)v3 + 28, v3 + 4);
      if (!result) {
        break;
      }
      uint64_t v6 = (void *)v3[1];
      if (v6)
      {
        do
        {
          unsigned int v7 = v6;
          uint64_t v6 = (void *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          unsigned int v7 = (void *)v3[2];
          BOOL v8 = *v7 == (void)v3;
          long long v3 = v7;
        }
        while (!v8);
      }
      long long v3 = v7;
    }
    while (v7 != v2);
  }
  return result;
}

void std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(*a1);
    std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__tree_node<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,void *> *,long>>(uint64_t **a1, void *a2, void *a3)
{
  char v4 = a2;
  if (a1[2])
  {
    uint64_t v6 = (uint64_t **)*a1;
    BOOL v8 = a1 + 1;
    unsigned int v7 = a1[1];
    *a1 = (uint64_t *)(a1 + 1);
    v7[2] = 0;
    a1[2] = 0;
    a1[1] = 0;
    unsigned int v9 = v6[1] ? v6[1] : (uint64_t *)v6;
    if (v9)
    {
      uint64_t v10 = (uint64_t *)v9[2];
      if (v10)
      {
        uint64_t v11 = (uint64_t *)*v10;
        if ((uint64_t *)*v10 == v9)
        {
          *uint64_t v10 = 0;
          while (1)
          {
            char v35 = (void *)v10[1];
            if (!v35) {
              break;
            }
            do
            {
              uint64_t v10 = v35;
              char v35 = (void *)*v35;
            }
            while (v35);
          }
        }
        else
        {
          for (v10[1] = 0; v11; uint64_t v11 = (uint64_t *)v10[1])
          {
            do
            {
              uint64_t v10 = v11;
              uint64_t v11 = (uint64_t *)*v11;
            }
            while (v11);
          }
        }
      }
      if (a2 != a3)
      {
        uint64_t v12 = v9;
        uint64_t v13 = v4;
        while (1)
        {
          unsigned int v9 = v10;
          unsigned int v14 = *((unsigned __int8 *)v13 + 28);
          *((unsigned char *)v12 + 28) = v14;
          int v15 = *((_DWORD *)v13 + 8);
          *((unsigned char *)v12 + 36) = *((unsigned char *)v13 + 36);
          *((_DWORD *)v12 + 8) = v15;
          uint64_t v16 = *v8;
          uint64_t v17 = a1 + 1;
          uint64_t v18 = a1 + 1;
          if (*v8) {
            break;
          }
LABEL_14:
          *uint64_t v12 = 0;
          v12[1] = 0;
          v12[2] = (uint64_t)v17;
          *uint64_t v18 = v12;
          uint64_t v19 = (uint64_t *)**a1;
          if (v19) {
            goto LABEL_15;
          }
LABEL_16:
          std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
          a1[2] = (uint64_t *)((char *)a1[2] + 1);
          if (v10)
          {
            uint64_t v10 = (uint64_t *)v10[2];
            if (v10)
            {
              uint64_t v22 = (void *)*v10;
              if ((uint64_t *)*v10 == v9)
              {
                *uint64_t v10 = 0;
                while (1)
                {
                  unint64_t v23 = (void *)v10[1];
                  if (!v23) {
                    break;
                  }
                  do
                  {
                    uint64_t v10 = v23;
                    unint64_t v23 = (void *)*v23;
                  }
                  while (v23);
                }
              }
              else
              {
                for (v10[1] = 0; v22; uint64_t v22 = (void *)v10[1])
                {
                  do
                  {
                    uint64_t v10 = v22;
                    uint64_t v22 = (void *)*v22;
                  }
                  while (v22);
                }
              }
            }
          }
          else
          {
            uint64_t v10 = 0;
          }
          uint64_t v20 = (void *)v13[1];
          if (v20)
          {
            do
            {
              char v4 = v20;
              uint64_t v20 = (void *)*v20;
            }
            while (v20);
          }
          else
          {
            do
            {
              char v4 = (void *)v13[2];
              BOOL v21 = *v4 == (void)v13;
              uint64_t v13 = v4;
            }
            while (!v21);
          }
          if (v9)
          {
            uint64_t v12 = v9;
            uint64_t v13 = v4;
            if (v4 != a3) {
              continue;
            }
          }
          goto LABEL_42;
        }
        do
        {
          while (1)
          {
            uint64_t v17 = v16;
            if (v14 >= *((unsigned __int8 *)v16 + 28)) {
              break;
            }
            uint64_t v16 = (uint64_t *)*v16;
            uint64_t v18 = (uint64_t **)v17;
            if (!*v17) {
              goto LABEL_14;
            }
          }
          uint64_t v16 = (uint64_t *)v16[1];
        }
        while (v16);
        uint64_t v18 = (uint64_t **)(v17 + 1);
        *uint64_t v12 = 0;
        v12[1] = 0;
        v12[2] = (uint64_t)v17;
        v17[1] = v12;
        uint64_t v19 = (uint64_t *)**a1;
        if (!v19) {
          goto LABEL_16;
        }
LABEL_15:
        *a1 = v19;
        uint64_t v12 = *v18;
        goto LABEL_16;
      }
LABEL_42:
      std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(v9);
      if (v10)
      {
        for (uint64_t i = (void *)v10[2]; i; uint64_t i = (void *)i[2])
          uint64_t v10 = i;
        std::__tree<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::__map_value_compare<abm::BasebandCPMSPowerBudgetScale,std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>,std::less<abm::BasebandCPMSPowerBudgetScale>,true>,std::allocator<std::__value_type<abm::BasebandCPMSPowerBudgetScale,std::optional<unsigned int>>>>::destroy(v10);
      }
    }
  }
  if (v4 != a3)
  {
    uint64_t v25 = (uint64_t ***)(a1 + 1);
    while (1)
    {
      long long v26 = (uint64_t *)operator new(0x28uLL);
      uint64_t v27 = v26;
      int v28 = *((_DWORD *)v4 + 9);
      *(uint64_t *)((char *)v26 + 28) = *(void *)((char *)v4 + 28);
      *((_DWORD *)v26 + 9) = v28;
      uint64_t v29 = *v25;
      char v30 = a1 + 1;
      uint64_t v31 = a1 + 1;
      if (*v25) {
        break;
      }
LABEL_54:
      uint64_t *v26 = 0;
      v26[1] = 0;
      v26[2] = (uint64_t)v30;
      atomic_uint *v31 = v26;
      uint64_t v32 = (uint64_t *)**a1;
      if (v32) {
        goto LABEL_55;
      }
LABEL_56:
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v27);
      a1[2] = (uint64_t *)((char *)a1[2] + 1);
      uint64_t v33 = (void *)v4[1];
      if (v33)
      {
        do
        {
          uint64_t v34 = v33;
          uint64_t v33 = (void *)*v33;
        }
        while (v33);
      }
      else
      {
        do
        {
          uint64_t v34 = (void *)v4[2];
          BOOL v21 = *v34 == (void)v4;
          char v4 = v34;
        }
        while (!v21);
      }
      char v4 = v34;
      if (v34 == a3) {
        return;
      }
    }
    do
    {
      while (1)
      {
        char v30 = v29;
        if (*((unsigned __int8 *)v26 + 28) >= *((unsigned __int8 *)v29 + 28)) {
          break;
        }
        uint64_t v29 = (uint64_t **)*v29;
        uint64_t v31 = v30;
        if (!*v30) {
          goto LABEL_54;
        }
      }
      uint64_t v29 = (uint64_t **)v29[1];
    }
    while (v29);
    uint64_t v31 = v30 + 1;
    uint64_t *v26 = 0;
    v26[1] = 0;
    v26[2] = (uint64_t)v30;
    v30[1] = v26;
    uint64_t v32 = (uint64_t *)**a1;
    if (!v32) {
      goto LABEL_56;
    }
LABEL_55:
    *a1 = v32;
    uint64_t v27 = *v31;
    goto LABEL_56;
  }
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

char *ABMGetRootVersionString@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = (char *)operator new(0x28uLL);
  *(void *)a1 = result;
  *(_OWORD *)(a1 + 8) = xmmword_1C5765580;
  strcpy(result, "AppleBasebandServices_Manager-1211");
  return result;
}

uint64_t abm::asString@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a2 + 16) = 0xAAAAAAAAAAAAAAAALL;
  *(unsigned char *)(a2 + 23) = 7;
  strcpy((char *)a2, "Invalid");
  if (result <= 2)
  {
    *(unsigned char *)(a2 + 23) = 4;
    *(_DWORD *)a2 = (result << 16) + 1378894420;
    *(unsigned char *)(a2 + 4) = 0;
  }
  return result;
}

{
  *(void *)(a2 + 8) = 0xAAAAAAAAAAAAAAAALL;
  *(void *)(a2 + 16) = 0xAAAAAAAAAAAAAAAALL;
  *(unsigned char *)(a2 + 23) = 7;
  strcpy((char *)a2, "Invalid");
  switch((int)result)
  {
    case 0:
      *(unsigned char *)(a2 + 23) = 8;
      strcpy((char *)a2, "1000msec");
      break;
    case 1:
      *(_DWORD *)(a2 + 3) = 1667593069;
      *(_DWORD *)a2 = 1831874609;
      break;
    case 2:
      *(unsigned char *)(a2 + 23) = 5;
      strcpy((char *)a2, "1msec");
      break;
    case 10:
      *(unsigned char *)(a2 + 23) = 9;
      strcpy((char *)a2, "ModemSkin");
      break;
    case 11:
      *(unsigned char *)(a2 + 23) = 9;
      strcpy((char *)a2, "TangierBG");
      break;
    case 12:
      *(unsigned char *)(a2 + 23) = 9;
      strcpy((char *)a2, "TangierCG");
      break;
    case 13:
      *(unsigned char *)(a2 + 23) = 3;
      *(_DWORD *)a2 = 5915974;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t abm::convertBasebandCPMSPowerBudgetScale(unsigned __int16 *a1)
{
  uint64_t v1 = *((unsigned __int8 *)a1 + 23);
  int v2 = (char)v1;
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = *((void *)a1 + 1);
  }
  switch(v1)
  {
    case 3:
      if (v2 >= 0) {
        long long v3 = a1;
      }
      else {
        long long v3 = *(unsigned __int16 **)a1;
      }
      if (bswap32(*v3) >> 16 == 17989)
      {
        if (*((unsigned char *)v3 + 2) == 90) {
          unsigned __int8 v4 = 13;
        }
        else {
          unsigned __int8 v4 = -1;
        }
        uint64_t result = v4;
      }
      else
      {
        uint64_t result = 255;
      }
      break;
    case 5:
      if (v2 >= 0) {
        uint64_t v6 = a1;
      }
      else {
        uint64_t v6 = *(unsigned __int16 **)a1;
      }
      int v7 = *(_DWORD *)v6;
      int v8 = *((unsigned __int8 *)v6 + 4);
      if (v7 != 1702063409 || v8 != 99) {
        goto LABEL_50;
      }
      uint64_t result = 2;
      break;
    case 7:
      if (v2 >= 0) {
        uint64_t v10 = (int *)a1;
      }
      else {
        uint64_t v10 = *(int **)a1;
      }
      int v11 = *v10;
      int v12 = *(int *)((char *)v10 + 3);
      if (v11 != 1831874609 || v12 != 1667593069) {
        goto LABEL_50;
      }
      uint64_t result = 1;
      break;
    case 8:
      if (v2 >= 0) {
        unsigned int v14 = a1;
      }
      else {
        unsigned int v14 = *(void **)a1;
      }
      if (*v14 != 0x6365736D30303031) {
        goto LABEL_50;
      }
      uint64_t result = 0;
      break;
    case 9:
      if (v2 >= 0) {
        int v15 = a1;
      }
      else {
        int v15 = *(unsigned __int16 **)a1;
      }
      if (*(void *)v15 == 0x696B536D65646F4DLL && *((unsigned char *)v15 + 8) == 110)
      {
        uint64_t result = 10;
      }
      else if (*(void *)v15 == 0x42726569676E6154 && *((unsigned char *)v15 + 8) == 71)
      {
        uint64_t result = 11;
      }
      else
      {
        uint64_t v18 = *(void *)v15;
        int v19 = *((unsigned __int8 *)v15 + 8);
        if (v18 != 0x43726569676E6154 || v19 != 71) {
          goto LABEL_50;
        }
        uint64_t result = 12;
      }
      break;
    default:
LABEL_50:
      uint64_t result = 255;
      break;
  }
  return result;
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1211";
}

const void **ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef(const void **a1)
{
  int v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t ctu::cf::insert<char const*,std::string>(__CFDictionary *a1, const __CFString **a2, uint64_t a3, uint64_t a4, const __CFAllocator *a5)
{
  xpc_object_t value = 0;
  ctu::cf::convert_copy((ctu::cf *)&value, a2, (const char *)0x8000100, a4, a5);
  uint64_t v6 = value;
  xpc_object_t value = 0;
  ctu::cf::convert_copy();
  int v7 = value;
  if (v6) {
    BOOL v8 = value == 0;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  if (v8)
  {
    if (!value) {
      goto LABEL_11;
    }
  }
  else
  {
    CFDictionaryAddValue(a1, v6, value);
  }
  CFRelease(v7);
LABEL_11:
  if (v6) {
    CFRelease(v6);
  }
  return v9;
}

void sub_1C575255C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  long long v3 = va_arg(va1, const void *);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  _Unwind_Resume(a1);
}

void sub_1C5752580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t __cxx_global_var_init_3()
{
  {
    return __cxa_atexit((void (*)(void *))ctu::PthreadMutexGuardPolicy<SharedData>::~PthreadMutexGuardPolicy, &ctu::Singleton<SharedData,SharedData,ctu::PthreadMutexGuardPolicy<SharedData>>::sInstance, &dword_1C5737000);
  }
  return result;
}

void abm::client::Manager::create(uint64_t a1@<X0>, NSObject **a2@<X1>, std::__shared_weak_count_vtbl ***a3@<X8>)
{
  uint64_t v6 = (std::__shared_weak_count_vtbl *)operator new(0x10uLL);
  v6->~__shared_weak_count = 0;
  v6->~__shared_weak_count_0 = 0;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (v7 || (xpc_object_t v7 = xpc_null_create()) != 0)
  {
    if (MEMORY[0x1C878FBE0](v7) == v8)
    {
      xpc_retain(v7);
      xpc_object_t v9 = v7;
    }
    else
    {
      xpc_object_t v9 = xpc_null_create();
    }
  }
  else
  {
    xpc_object_t v9 = xpc_null_create();
    xpc_object_t v7 = 0;
  }
  xpc_release(v7);
  if (MEMORY[0x1C878FBE0](v9) == v8)
  {
    xpc_object_t v10 = xpc_string_create("com.apple.basebandd.xpc");
    if (!v10) {
      xpc_object_t v10 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x1E4FAE010], v10);
    xpc_object_t v11 = xpc_null_create();
    xpc_release(v10);
    xpc_release(v11);
    xpc_object_t v12 = xpc_string_create((const char *)abm::client::Manager::kABMDaemonReadyNotification);
    if (!v12) {
      xpc_object_t v12 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x1E4FAE018], v12);
    xpc_object_t v13 = xpc_null_create();
    xpc_release(v12);
    xpc_release(v13);
    if (*(char *)(a1 + 23) >= 0) {
      unsigned int v14 = (const char *)a1;
    }
    else {
      unsigned int v14 = *(const char **)a1;
    }
    xpc_object_t v15 = xpc_string_create(v14);
    if (!v15) {
      xpc_object_t v15 = xpc_null_create();
    }
    xpc_dictionary_set_value(v9, (const char *)*MEMORY[0x1E4FAE000], v15);
    xpc_object_t v16 = xpc_null_create();
    xpc_release(v15);
    xpc_release(v16);
  }
  xpc_object_t object = v9;
  if (v9) {
    xpc_retain(v9);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  uint64_t block = MEMORY[0x1E4F143A8];
  uint64_t v29 = 0x40000000;
  char v30 = ___ZL19ClientLogServerInitRNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  uint64_t v31 = &__block_descriptor_tmp_0;
  uint64_t v32 = &ClientGetLogServer(void)::sLogServer;
  if (ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce != -1)
  {
    dispatch_once(&ClientLogServerInit(std::shared_ptr<ctu::LogServer> &)::sOnce, &block);
    uint64_t v17 = *(void *)algn_1EB506B18;
    uint64_t block = ClientGetLogServer(void)::sLogServer;
    uint64_t v29 = *(void *)algn_1EB506B18;
    if (!*(void *)algn_1EB506B18) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  uint64_t v17 = *(void *)algn_1EB506B18;
  uint64_t block = ClientGetLogServer(void)::sLogServer;
  uint64_t v29 = *(void *)algn_1EB506B18;
  if (*(void *)algn_1EB506B18) {
LABEL_23:
  }
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
LABEL_24:
  TelephonyXPC::Client::create();
  uint64_t v18 = (std::__shared_weak_count *)v6->~__shared_weak_count_0;
  *(_OWORD *)&v6->~__shared_weak_count = v27;
  if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  int v19 = (std::__shared_weak_count *)v29;
  if (v29 && !atomic_fetch_add((atomic_ullong *volatile)(v29 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  xpc_release(object);
  xpc_release(v9);
  uint64_t v20 = (std::__shared_weak_count *)operator new(0x20uLL);
  v20->__shared_owners_ = 0;
  v20->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20EDF40;
  v20->__shared_weak_owners_ = 0;
  v20[1].__vftable = v6;
  BOOL v21 = (std::__shared_weak_count_vtbl **)operator new(0x18uLL);
  uint64_t v22 = v21;
  p_shared_owners = &v20->__shared_owners_;
  atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
  unint64_t v24 = *a2;
  if (v24)
  {
    dispatch_retain(v24);
    *uint64_t v22 = v6;
    v22[1] = (std::__shared_weak_count_vtbl *)v20;
    atomic_fetch_add_explicit(p_shared_owners, 1uLL, memory_order_relaxed);
    v22[2] = (std::__shared_weak_count_vtbl *)v24;
    dispatch_retain(v24);
  }
  else
  {
    uint64_t *v21 = v6;
    v21[1] = (std::__shared_weak_count_vtbl *)v20;
    atomic_fetch_add_explicit(p_shared_owners, 1uLL, memory_order_relaxed);
    uint64_t v21[2] = 0;
  }
  *a3 = v22;
  uint64_t v25 = (std::__shared_weak_count_vtbl **)operator new(0x20uLL);
  *uint64_t v25 = (std::__shared_weak_count_vtbl *)&unk_1F20EDF90;
  v25[1] = 0;
  v25[2] = 0;
  v25[3] = (std::__shared_weak_count_vtbl *)v22;
  a3[1] = v25;
  if (v24) {
    dispatch_release(v24);
  }
  if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
    std::__shared_weak_count::__release_weak(v20);
  }
  if (v20)
  {
    if (!atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

void sub_1C5752AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12)
{
  if (!v13 || (dispatch_release(v13), (unsigned int v14 = *v12) != 0))
  {
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
    operator delete(v15);
    if (!v13)
    {
LABEL_8:
      std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
      std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    operator delete(v15);
  }
  dispatch_release(v13);
  goto LABEL_8;
}

void sub_1C5752B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5752BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  unsigned int v14 = (std::__shared_weak_count *)v12[1];
  if (v14)
  {
    if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  operator delete(v12);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_1C5752C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, xpc_object_t object, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a18);
  xpc_release(object);
  xpc_object_t object = 0;
  xpc_release(v19);
  BOOL v21 = (void *)std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v18);
  operator delete(v21);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void sub_1C5752C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *abm::client::Manager::Manager(void *a1, void *a2, NSObject **a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *a3;
  a1[2] = *a3;
  if (v5) {
    dispatch_retain(v5);
  }
  return a1;
}

{
  uint64_t v4;
  NSObject *v5;

  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = *a3;
  a1[2] = *a3;
  if (v5) {
    dispatch_retain(v5);
  }
  return a1;
}

void abm::client::Manager::~Manager(abm::client::Manager *this)
{
  int v2 = *((void *)this + 2);
  if (v2) {
    dispatch_release(v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

{
  NSObject *v2;
  std::__shared_weak_count *v3;

  int v2 = *((void *)this + 2);
  if (v2) {
    dispatch_release(v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void abm::client::Manager::setEventHandler(uint64_t *a1, uint64_t a2, void *aBlock)
{
  if (aBlock) {
    uint64_t v5 = _Block_copy(aBlock);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *a1;
  aBlocka[0] = MEMORY[0x1E4F143A8];
  aBlocka[1] = 1174405120;
  aBlocka[2] = ___ZN3abm6client7Manager15setEventHandlerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEU13block_pointerFvPvP16dispatch_group_sE_block_invoke;
  aBlocka[3] = &__block_descriptor_tmp_3_0;
  if (v5) {
    xpc_object_t v7 = _Block_copy(v5);
  }
  else {
    xpc_object_t v7 = 0;
  }
  xpc_object_t v11 = v7;
  uint64_t v8 = _Block_copy(aBlocka);
  xpc_object_t v9 = a1[2];
  if (v9) {
    dispatch_retain(v9);
  }
  xpc_object_t v12 = v8;
  dispatch_object_t object = v9;
  abm::client::Manager::State::setEventHandler(v6, a2, (uint64_t)&v12);
  if (object) {
    dispatch_release(object);
  }
  if (v12) {
    _Block_release(v12);
  }
  if (v11) {
    _Block_release(v11);
  }
  if (v5) {
    _Block_release(v5);
  }
}

void sub_1C5752F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *aBlock, char a15)
{
  dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback((uint64_t)&a15);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v15) {
    _Block_release(v15);
  }
  _Unwind_Resume(a1);
}

void abm::client::Manager::State::setEventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v4 = _Block_copy(v4);
  }
  uint64_t v5 = *(NSObject **)(a3 + 8);
  aBlock = v4;
  dispatch_object_t object = v5;
  if (v5) {
    dispatch_retain(v5);
  }
  TelephonyXPC::Client::setEventHandler();
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_1C575300C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *__copy_helper_block_e8_32c63_ZTSN8dispatch5blockIU13block_pointerFvPvP16dispatch_group_sEEE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)(a2 + 32);
  if (result) {
    uint64_t result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c63_ZTSN8dispatch5blockIU13block_pointerFvPvP16dispatch_group_sEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t dispatch::callback<void({block_pointer})(std::shared_ptr<TelephonyXPC::Event>)>::~callback(uint64_t a1)
{
  int v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void abm::client::Manager::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v6 = _Block_copy(v6);
  }
  xpc_object_t v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  dispatch_object_t object = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  abm::client::Manager::State::setEventHandler(v5, a2, (uint64_t)&aBlock);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
}

void sub_1C5753140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t abm::client::Manager::eventsOn(abm::client::Manager *this)
{
  return MEMORY[0x1F4163B28](**(void **)this);
}

void abm::client::Manager::perform(uint64_t a1, uint64_t a2)
{
  int v2 = *(std::__shared_weak_count **)(a2 + 8);
  long long v3 = v2;
  if (v2)
  {
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v4 = v2;
    atomic_fetch_add_explicit(&v2->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    uint64_t v4 = 0;
  }
  TelephonyXPC::Client::perform();
  if (v4 && !atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  if (v3)
  {
    if (!atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

void sub_1C5753264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
}

uint64_t dispatch::callback<void({block_pointer})(TelephonyXPC::Result,xpc::dict)>::~callback(uint64_t a1)
{
  int v2 = *(NSObject **)(a1 + 8);
  if (v2) {
    dispatch_release(v2);
  }
  if (*(void *)a1) {
    _Block_release(*(const void **)a1);
  }
  return a1;
}

void abm::client::Manager::perform(uint64_t a1, int a2, void *aBlock, xpc_object_t *a4)
{
  if (aBlock)
  {
    uint64_t v6 = _Block_copy(aBlock);
    xpc_object_t v7 = *(NSObject **)(a1 + 16);
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = 0;
  xpc_object_t v7 = *(NSObject **)(a1 + 16);
  if (v7) {
LABEL_3:
  }
    dispatch_retain(v7);
LABEL_4:
  xpc_object_t object = *a4;
  if (*a4) {
    xpc_retain(*a4);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v7) {
    dispatch_release(v7);
  }
  if (v6) {
    _Block_release(v6);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  TelephonyXPC::Client::perform();
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
}

void sub_1C57534C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va2);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_1C57534F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, char a13)
{
}

void abm::client::Manager::perform(uint64_t a1, uint64_t a2, uint64_t a3, xpc_object_t *a4)
{
  uint64_t v6 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v6 = _Block_copy(v6);
  }
  uint64_t v7 = *(NSObject **)(a3 + 8);
  aBlock = v6;
  xpc_object_t v10 = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  xpc_object_t object = *a4;
  if (*a4) {
    xpc_retain(*a4);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v10) {
    dispatch_release(v10);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  TelephonyXPC::Client::perform();
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
}

void sub_1C5753704(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v2 - 48);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void sub_1C575372C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object, char a13)
{
}

void abm::client::Manager::perform(uint64_t *a1@<X0>, xpc_object_t *a2@<X2>, void **a3@<X3>, _DWORD *a4@<X8>)
{
  uint64_t v44 = 0;
  long long v45 = &v44;
  uint64_t v46 = 0x3002000000;
  uint64_t v47 = __Block_byref_object_copy_;
  long long v48 = __Block_byref_object_dispose_;
  xpc_object_t v49 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  xpc_object_t v49 = xpc_null_create();
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x4802000000;
  uint64_t v38 = __Block_byref_object_copy__6;
  int v39 = __Block_byref_object_dispose__7;
  unint64_t v40 = 0xAAAAAAAAE020E002;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  long long __p = 0;
  uint64_t v8 = (std::__shared_weak_count *)a1[1];
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v9 = *a1;
  atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v10 = std::__shared_weak_count::lock(v8);
  uint64_t v11 = v10;
  if (!v10) {
    goto LABEL_18;
  }
  if (atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v9) {
      goto LABEL_5;
    }
LABEL_17:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v11);
  if (!v9) {
    goto LABEL_17;
  }
LABEL_5:
  xpc_object_t v12 = dispatch_group_create();
  uint64_t v11 = (std::__shared_weak_count *)v12;
  if (v12)
  {
    dispatch_retain(v12);
    dispatch_group_enter((dispatch_group_t)v11);
  }
  uint64_t v33 = (void *)0xAAAAAAAAAAAAAAAALL;
  dispatch_object_t v34 = (dispatch_object_t)0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictERSC__block_invoke;
  aBlock[3] = &unk_1F20EDF00;
  aBlock[6] = v9;
  uint64_t v31 = v8;
  atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  dispatch_group_t group = (dispatch_group_t)v11;
  if (v11)
  {
    dispatch_retain((dispatch_object_t)v11);
    dispatch_group_enter(group);
  }
  aBlock[4] = &v35;
  aBlock[5] = &v44;
  xpc_object_t v13 = _Block_copy(aBlock);
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_object_t v15 = global_queue;
  if (global_queue) {
    dispatch_retain(global_queue);
  }
  uint64_t v33 = v13;
  dispatch_object_t v34 = v15;
  if (v13)
  {
    int v28 = _Block_copy(v13);
    uint64_t v29 = v15;
    if (!v15) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  int v28 = 0;
  uint64_t v29 = v15;
  if (v15) {
LABEL_13:
  }
    dispatch_retain(v15);
LABEL_14:
  xpc_object_t object = *a2;
  if (*a2) {
    xpc_retain(*a2);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  TelephonyXPC::Command::create();
  xpc_release(object);
  if (v29) {
    dispatch_release(v29);
  }
  if (v28) {
    _Block_release(v28);
  }
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  unint64_t v51 = 0xAAAAAAAAAAAAAAAALL;
  atomic_fetch_add_explicit((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 1uLL, memory_order_relaxed);
  xpc_object_t v50 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  TelephonyXPC::Client::perform();
  int v19 = (std::__shared_weak_count *)v51;
  if (v51 && !atomic_fetch_add((atomic_ullong *volatile)(v51 + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)0xAAAAAAAAAAAAAAB2, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(unint64_t))(MEMORY[0xAAAAAAAAAAAAAAAA] + 16))(0xAAAAAAAAAAAAAAAALL);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)0xAAAAAAAAAAAAAAAALL);
  }
  if (v34) {
    dispatch_release(v34);
  }
  if (v33) {
    _Block_release(v33);
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group) {
      dispatch_release(group);
    }
  }
  if (v31) {
    std::__shared_weak_count::__release_weak(v31);
  }
  if (v11)
  {
    dispatch_group_leave((dispatch_group_t)v11);
    dispatch_release((dispatch_object_t)v11);
    if (MEMORY[0x1C878FBE0](*a2) != MEMORY[0x1E4F14590]) {
      goto LABEL_53;
    }
    xpc_object_t value = xpc_dictionary_get_value(*a2, "Timeout");
    xpc_object_t v50 = value;
    if (value) {
      xpc_retain(value);
    }
    else {
      xpc_object_t v50 = xpc_null_create();
    }
    unsigned int v23 = xpc::dyn_cast_or_default();
    xpc_release(v50);
    if (v23)
    {
      dispatch_time_t v24 = dispatch_time(0, 1000000 * v23);
      if (!dispatch_group_wait((dispatch_group_t)v11, v24)) {
        goto LABEL_62;
      }
    }
    else
    {
LABEL_53:
      if (!dispatch_group_wait((dispatch_group_t)v11, 0xFFFFFFFFFFFFFFFFLL))
      {
LABEL_62:
        xpc_object_t v25 = (xpc_object_t)v45[5];
        if (v25) {
          xpc_retain((xpc_object_t)v45[5]);
        }
        else {
          xpc_object_t v25 = xpc_null_create();
        }
        long long v26 = *a3;
        *a3 = v25;
        xpc_release(v26);
        goto LABEL_18;
      }
    }
    uint64_t v20 = (char *)operator new(0x30uLL);
    strcpy(v20, "Timeout waiting for response from server");
    BOOL v21 = v36;
    *((_DWORD *)v36 + 10) = -534716413;
    if (*((char *)v21 + 71) < 0) {
      operator delete((void *)v21[6]);
    }
    v21[6] = (uint64_t)v20;
    v21[7] = 40;
    v21[8] = 0x8000000000000030;
  }
LABEL_18:
  xpc_object_t v16 = v36;
  *a4 = *((_DWORD *)v36 + 10);
  uint64_t v17 = (std::string *)(a4 + 2);
  if (*((char *)v16 + 71) < 0)
  {
    std::string::__init_copy_ctor_external(v17, (const std::string::value_type *)v16[6], v16[7]);
  }
  else
  {
    long long v18 = *((_OWORD *)v16 + 3);
    v17->__r_.__value_.__r.__words[2] = v16[8];
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v18;
  }
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  if (v11) {
    dispatch_release((dispatch_object_t)v11);
  }
  _Block_object_dispose(&v35, 8);
  if (SHIBYTE(v43) < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&v44, 8);
  xpc_release(v49);
}

void sub_1C5753D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, xpc_object_t object, char a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,std::__shared_weak_count *a24,dispatch_group_t group,char a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  xpc_release(*(xpc_object_t *)(v41 - 96));
  std::__shared_weak_count::__release_weak(v39);
  if (v40)
  {
    dispatch_release(v40);
    _Block_object_dispose(&a28, 8);
    if ((a39 & 0x80000000) == 0)
    {
LABEL_4:
      _Block_object_dispose((const void *)(v41 - 144), 8);
      xpc_release(*(xpc_object_t *)(v41 - 104));
      _Unwind_Resume(a1);
    }
  }
  else
  {
    _Block_object_dispose(&a28, 8);
    if ((a39 & 0x80000000) == 0) {
      goto LABEL_4;
    }
  }
  operator delete(__p);
  goto LABEL_4;
}

xpc_object_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  xpc_object_t result = xpc_null_create();
  *(void *)(a2 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  *(void *)(a1 + 40) = 0;
}

__n128 __Block_byref_object_copy__6(__n128 *a1, __n128 *a2)
{
  a1[2].n128_u32[2] = a2[2].n128_u32[2];
  __n128 result = a2[3];
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a1[3] = result;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[3].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
}

void ___ZN3abm6client7Manager7performERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEEN3xpc4dictERSC__block_invoke(void *a1, uint64_t a2, xpc_object_t *a3)
{
  uint64_t v4 = (std::__shared_weak_count *)a1[7];
  if (v4)
  {
    uint64_t v7 = std::__shared_weak_count::lock(v4);
    if (v7)
    {
      uint64_t v8 = v7;
      if (a1[6])
      {
        uint64_t v9 = *(void *)(a1[4] + 8);
        *(_DWORD *)(v9 + 40) = *(_DWORD *)a2;
        if (v9 + 40 != a2)
        {
          uint64_t v10 = v9 + 48;
          int v11 = *(char *)(v9 + 71);
          char v12 = *(unsigned char *)(a2 + 31);
          if (v11 < 0)
          {
            if (v12 >= 0) {
              unsigned int v14 = (void *)(a2 + 8);
            }
            else {
              unsigned int v14 = *(void **)(a2 + 8);
            }
            if (v12 >= 0) {
              size_t v15 = *(unsigned __int8 *)(a2 + 31);
            }
            else {
              size_t v15 = *(void *)(a2 + 16);
            }
            std::string::__assign_no_alias<false>((void **)v10, v14, v15);
          }
          else if ((*(unsigned char *)(a2 + 31) & 0x80) != 0)
          {
            std::string::__assign_no_alias<true>((void *)v10, *(void **)(a2 + 8), *(void *)(a2 + 16));
          }
          else
          {
            long long v13 = *(_OWORD *)(a2 + 8);
            *(void *)(v10 + 16) = *(void *)(a2 + 24);
            *(_OWORD *)uint64_t v10 = v13;
          }
        }
        uint64_t v16 = *(void *)(a1[5] + 8);
        xpc_object_t v17 = *a3;
        if (v17) {
          xpc_retain(v17);
        }
        else {
          xpc_object_t v17 = xpc_null_create();
        }
        long long v18 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v17;
        xpc_release(v18);
      }
      if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
  }
}

void sub_1C5754054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void __copy_helper_block_e8_48c50_ZTSNSt3__18weak_ptrIN3abm6client7Manager5StateEEE64c30_ZTSN8dispatch13group_sessionE(void *a1, void *a2)
{
  uint64_t v3 = a2[7];
  a1[6] = a2[6];
  a1[7] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[8];
  a1[8] = v4;
  if (v4)
  {
    dispatch_retain(v4);
    uint64_t v5 = a1[8];
    if (v5)
    {
      dispatch_group_enter(v5);
    }
  }
}

void __destroy_helper_block_e8_48c50_ZTSNSt3__18weak_ptrIN3abm6client7Manager5StateEEE64c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 64);
  if (v2)
  {
    dispatch_group_leave(v2);
    uint64_t v3 = *(NSObject **)(a1 + 64);
    if (v3) {
      dispatch_release(v3);
    }
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 56);
  if (v4)
  {
    std::__shared_weak_count::__release_weak(v4);
  }
}

uint64_t abm::client::Manager::eventsOff(abm::client::Manager *this)
{
  return MEMORY[0x1F4163B30](**(void **)this);
}

void std::__shared_ptr_pointer<abm::client::Manager::State *,std::shared_ptr<abm::client::Manager::State>::__shared_ptr_default_delete<abm::client::Manager::State,abm::client::Manager::State>,std::allocator<abm::client::Manager::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Manager::State *,std::shared_ptr<abm::client::Manager::State>::__shared_ptr_default_delete<abm::client::Manager::State,abm::client::Manager::State>,std::allocator<abm::client::Manager::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count ***)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = v1[1];
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v3 = v1;
    }
    operator delete(v3);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Manager::State *,std::shared_ptr<abm::client::Manager::State>::__shared_ptr_default_delete<abm::client::Manager::State,abm::client::Manager::State>,std::allocator<abm::client::Manager::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C576562ALL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C576562ALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C576562ALL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C576562ALL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_pointer<abm::client::Manager *,std::shared_ptr<abm::client::Manager>::__shared_ptr_default_delete<abm::client::Manager,abm::client::Manager>,std::allocator<abm::client::Manager>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Manager *,std::shared_ptr<abm::client::Manager>::__shared_ptr_default_delete<abm::client::Manager,abm::client::Manager>,std::allocator<abm::client::Manager>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = *(NSObject **)(v1 + 16);
    if (v2) {
      dispatch_release(v2);
    }
    uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
    if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
      uint64_t v4 = (void *)v1;
    }
    else
    {
      uint64_t v4 = (void *)v1;
    }
    operator delete(v4);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Manager *,std::shared_ptr<abm::client::Manager>::__shared_ptr_default_delete<abm::client::Manager,abm::client::Manager>,std::allocator<abm::client::Manager>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C5765705) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C5765705 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C5765705)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C5765705 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void *abm::client::Command::Command(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void abm::client::Command::name(xpc_object_t **this)
{
}

void abm::client::Command::State::name(xpc_object_t *this)
{
  xpc_object_t value = xpc_dictionary_get_value(this[2], (const char *)kKeyCommand);
  xpc_object_t object = value;
  if (value) {
    xpc_retain(value);
  }
  else {
    xpc_object_t object = xpc_null_create();
  }
  xpc::dyn_cast_or_default();
  xpc_release(object);
}

void sub_1C57544B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
}

void abm::client::Command::getName(void *a1@<X8>)
{
  *a1 = 0xAAAAAAAAAAAAAAAALL;
}

xpc_object_t abm::client::Command::get@<X0>(abm::client::Command *this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)(*(void *)this + 16);
  *a2 = v3;
  if (v3) {
    return xpc_retain(v3);
  }
  xpc_object_t result = xpc_null_create();
  *a2 = result;
  return result;
}

BOOL abm::client::Command::notifiable(abm::client::Command *this)
{
  return **(void **)this && *(void *)(*(void *)this + 8) != 0;
}

void abm::client::Command::notify(uint64_t *a1, int a2, const void **a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a3;
  CFTypeRef cf = v5;
  if (v5) {
    CFRetain(v5);
  }
  abm::client::Command::State::notify(v4, a2, &cf);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_1C57545B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  _Unwind_Resume(a1);
}

void abm::client::Command::State::notify(uint64_t a1, int a2, CFTypeRef *a3)
{
  uint64_t v4 = *(const void **)a1;
  if (!v4 || !*(void *)(a1 + 8)) {
    return;
  }
  CFTypeRef v6 = *a3;
  if (*a3 && (CFRetain(*a3), (uint64_t v4 = *(const void **)a1) == 0)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = _Block_copy(v4);
  }
  uint64_t v8 = *(NSObject **)(a1 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = ___ZNK8dispatch8callbackIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEclIJiS6_EEEvDpT__block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  if (v7)
  {
    int v12 = a2;
    aBlock = _Block_copy(v7);
    CFTypeRef cf = v6;
    if (!v6) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  int v12 = a2;
  aBlock = 0;
  CFTypeRef cf = v6;
  if (v6) {
LABEL_11:
  }
    CFRetain(v6);
LABEL_12:
  dispatch_async(v8, block);
  if (cf) {
    CFRelease(cf);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v7) {
    _Block_release(v7);
  }
  if (v6) {
    CFRelease(v6);
  }
}

void abm::client::Command::create(uint64_t a1@<X1>, ctu **a2@<X2>, void *a3@<X8>)
{
  uint64_t v21 = 0;
  ctu::cf::assign();
  *(_OWORD *)long long __p = 0uLL;
  uint64_t v19 = 0;
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  CFTypeRef v6 = operator new(0x18uLL);
  if (*(void *)a1)
  {
    uint64_t v7 = _Block_copy(*(const void **)a1);
    uint64_t v8 = *(NSObject **)(a1 + 8);
    uint64_t v16 = v7;
    xpc_object_t v17 = v8;
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  uint64_t v8 = *(NSObject **)(a1 + 8);
  uint64_t v16 = 0;
  xpc_object_t v17 = v8;
  if (v8) {
LABEL_3:
  }
    dispatch_retain(v8);
LABEL_4:
  uint64_t v9 = *a2;
  size_t v15 = v9;
  if (v9) {
    CFRetain(v9);
  }
  abm::client::Command::State::State(v6, (uint64_t)__p, (uint64_t)&v16, &v15);
  std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(&v20, (uint64_t)v6);
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    dispatch_release(v8);
  }
  if (v7) {
    _Block_release(v7);
  }
  uint64_t v10 = operator new(0x10uLL);
  int v11 = v10;
  long long v12 = v20;
  if (*((void *)&v20 + 1))
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v20 + 1) + 8), 1uLL, memory_order_relaxed);
    *uint64_t v10 = v12;
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  else
  {
    *uint64_t v10 = (unint64_t)v20;
  }
  *a3 = v10;
  long long v13 = operator new(0x20uLL);
  void *v13 = &unk_1F20EE060;
  v13[1] = 0;
  v13[2] = 0;
  v13[3] = v11;
  a3[1] = v13;
  if (*((void *)&v12 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v12 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v12 + 1) + 16))(*((void *)&v12 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v12 + 1));
  }
  unsigned int v14 = (std::__shared_weak_count *)*((void *)&v20 + 1);
  if (!*((void *)&v20 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v20 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v19) & 0x80000000) == 0) {
      return;
    }
LABEL_25:
    operator delete(__p[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
  std::__shared_weak_count::__release_weak(v14);
  if (SHIBYTE(v19) < 0) {
    goto LABEL_25;
  }
}

void sub_1C5754950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
  operator delete(v30);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a24);
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  void *v4 = &unk_1F20EE010;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1C5754A68(_Unwind_Exception *exception_object)
{
  if (v1)
  {
    xpc_release(*(xpc_object_t *)(v1 + 16));
    *(void *)(v1 + 16) = 0;
    uint64_t v3 = *(NSObject **)(v1 + 8);
    if (v3) {
      dispatch_release(v3);
    }
    if (*(void *)v1) {
      _Block_release(*(const void **)v1);
    }
    operator delete((void *)v1);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::Command::create(uint64_t a1@<X0>, uint64_t a2@<X1>, ctu **a3@<X2>, void *a4@<X8>)
{
  unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = operator new(0x18uLL);
  if (*(void *)a2)
  {
    uint64_t v9 = _Block_copy(*(const void **)a2);
    uint64_t v10 = *(NSObject **)(a2 + 8);
    uint64_t v19 = v9;
    long long v20 = v10;
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = 0;
  uint64_t v10 = *(NSObject **)(a2 + 8);
  uint64_t v19 = 0;
  long long v20 = v10;
  if (v10) {
LABEL_3:
  }
    dispatch_retain(v10);
LABEL_4:
  int v11 = *a3;
  long long v18 = v11;
  if (v11) {
    CFRetain(v11);
  }
  abm::client::Command::State::State(v8, a1, (uint64_t)&v19, &v18);
  std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(&v21, (uint64_t)v8);
  if (v11) {
    CFRelease(v11);
  }
  if (v10) {
    dispatch_release(v10);
  }
  if (v9) {
    _Block_release(v9);
  }
  long long v12 = operator new(0x10uLL);
  long long v13 = v12;
  unint64_t v14 = v21;
  size_t v15 = (std::__shared_weak_count *)v22;
  if (v22)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v22 + 8), 1uLL, memory_order_relaxed);
    *long long v12 = v14;
    v12[1] = v15;
    atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    *long long v12 = v21;
    v12[1] = 0;
  }
  *a4 = v12;
  uint64_t v16 = operator new(0x20uLL);
  void *v16 = &unk_1F20EE060;
  v16[1] = 0;
  v16[2] = 0;
  v16[3] = v13;
  a4[1] = v16;
  if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  xpc_object_t v17 = (std::__shared_weak_count *)v22;
  if (v22)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v22 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
}

void sub_1C5754CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (v15)
  {
    if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  operator delete(v16);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_1C5754D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  uint64_t v7 = va_arg(va1, const void *);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)va1);
  if (v5) {
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

void abm::client::Command::create(uint64_t a1@<X0>, xpc_object_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v23 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v8 = operator new(0x18uLL);
  if (*(void *)a3)
  {
    uint64_t v9 = _Block_copy(*(const void **)a3);
    uint64_t v10 = *(NSObject **)(a3 + 8);
    if (!v10) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = 0;
  uint64_t v10 = *(NSObject **)(a3 + 8);
  if (v10) {
LABEL_3:
  }
    dispatch_retain(v10);
LABEL_4:
  xpc_object_t v11 = *a2;
  if (v11)
  {
    xpc_retain(v11);
    if (v9) {
      goto LABEL_6;
    }
  }
  else
  {
    xpc_object_t v11 = xpc_null_create();
    if (v9)
    {
LABEL_6:
      *uint64_t v8 = _Block_copy(v9);
      v8[1] = v10;
      if (!v10) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  *uint64_t v8 = 0;
  v8[1] = v10;
  if (v10) {
LABEL_7:
  }
    dispatch_retain(v10);
LABEL_8:
  v8[2] = v11;
  xpc_object_t v12 = xpc_null_create();
  if (*(char *)(a1 + 23) >= 0) {
    long long v13 = (const char *)a1;
  }
  else {
    long long v13 = *(const char **)a1;
  }
  xpc_object_t v14 = xpc_string_create(v13);
  if (!v14) {
    xpc_object_t v14 = xpc_null_create();
  }
  xpc_dictionary_set_value(v11, (const char *)kKeyCommand, v14);
  xpc_object_t v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  std::shared_ptr<abm::client::Command::State>::shared_ptr[abi:ne180100]<abm::client::Command::State,void>(&v22, (uint64_t)v8);
  xpc_release(v12);
  if (v10) {
    dispatch_release(v10);
  }
  if (v9) {
    _Block_release(v9);
  }
  uint64_t v16 = operator new(0x10uLL);
  xpc_object_t v17 = v16;
  unint64_t v18 = v22;
  uint64_t v19 = (std::__shared_weak_count *)v23;
  if (v23)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 8), 1uLL, memory_order_relaxed);
    void *v16 = v18;
    v16[1] = v19;
    atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    void *v16 = v22;
    v16[1] = 0;
  }
  *a4 = v16;
  long long v20 = operator new(0x20uLL);
  void *v20 = &unk_1F20EE060;
  v20[1] = 0;
  v20[2] = 0;
  void v20[3] = v17;
  a4[1] = v20;
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  unint64_t v21 = (std::__shared_weak_count *)v23;
  if (v23)
  {
    if (!atomic_fetch_add((atomic_ullong *volatile)(v23 + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

void sub_1C5754FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (v13)
  {
    if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  operator delete(v14);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

void sub_1C5755010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1C5755028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  xpc_release(v11);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void xpc::dict::~dict(xpc_object_t *this)
{
  *this = 0;
}

void ___ZNK8dispatch8callbackIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEclIJiS6_EEEvDpT__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(const void **)(a1 + 40);
  CFTypeRef cf = v2;
  if (v2) {
    CFRetain(v2);
  }
  (*(void (**)(uint64_t, uint64_t, CFTypeRef *))(v3 + 16))(v3, v1, &cf);
  if (cf) {
    CFRelease(cf);
  }
}

void sub_1C57550F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
  _Unwind_Resume(exception_object);
}

CFTypeRef __copy_helper_block_e8_32c84_ZTSN8dispatch5blockIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEE40c45_ZTSN3ctu2cf11CFSharedRefIK14__CFDictionaryEE(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(const void **)(a2 + 32);
  if (!v4)
  {
    CFTypeRef result = *(CFTypeRef *)(a2 + 40);
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = result;
    if (!result) {
      return result;
    }
    return CFRetain(result);
  }
  int v5 = _Block_copy(v4);
  CFTypeRef result = *(CFTypeRef *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 40) = result;
  if (result) {
    return CFRetain(result);
  }
  return result;
}

void __destroy_helper_block_e8_32c84_ZTSN8dispatch5blockIU13block_pointerFviN3ctu2cf11CFSharedRefIK14__CFDictionaryEEEEE40c45_ZTSN3ctu2cf11CFSharedRefIK14__CFDictionaryEE(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 40);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 32);
  if (v3) {
    _Block_release(v3);
  }
}

void *abm::client::Command::State::State(void *a1, uint64_t a2, uint64_t a3, ctu **a4)
{
  uint64_t v8 = *(void **)a3;
  if (*(void *)a3) {
    uint64_t v8 = _Block_copy(v8);
  }
  uint64_t v9 = *(NSObject **)(a3 + 8);
  *a1 = v8;
  a1[1] = v9;
  if (v9) {
    dispatch_retain(v9);
  }
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v11 = v10;
  xpc_object_t v12 = (xpc_object_t *)(a1 + 2);
  uint64_t v13 = MEMORY[0x1E4F14590];
  if (v10)
  {
    *xpc_object_t v12 = v10;
  }
  else
  {
    xpc_object_t v11 = xpc_null_create();
    *xpc_object_t v12 = v11;
    if (!v11)
    {
      xpc_object_t v14 = xpc_null_create();
      xpc_object_t v11 = 0;
      goto LABEL_12;
    }
  }
  if (MEMORY[0x1C878FBE0](v11) == v13)
  {
    xpc_retain(v11);
    goto LABEL_13;
  }
  xpc_object_t v14 = xpc_null_create();
LABEL_12:
  *xpc_object_t v12 = v14;
LABEL_13:
  xpc_release(v11);
  if (*a4) {
    uint64_t v16 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v16)
  {
    ctu::cf_to_xpc((uint64_t *)&object, *a4, v15);
    xpc_object_t v17 = object;
    if (object && MEMORY[0x1C878FBE0](object) == v13) {
      xpc_retain(v17);
    }
    else {
      xpc_object_t v17 = xpc_null_create();
    }
    xpc_object_t v18 = xpc_null_create();
    xpc_object_t v19 = *v12;
    *xpc_object_t v12 = v17;
    xpc_release(v19);
    xpc_release(v18);
    xpc_release(object);
  }
  if (*(char *)(a2 + 23) >= 0) {
    long long v20 = (const char *)a2;
  }
  else {
    long long v20 = *(const char **)a2;
  }
  xpc_object_t v21 = xpc_string_create(v20);
  if (!v21) {
    xpc_object_t v21 = xpc_null_create();
  }
  xpc_dictionary_set_value(*v12, (const char *)kKeyCommand, v21);
  xpc_object_t v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  return a1;
}

void sub_1C5755370(_Unwind_Exception *a1)
{
  xpc::dict::~dict(v2);
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<abm::client::Command::State *,std::shared_ptr<abm::client::Command::State>::__shared_ptr_default_delete<abm::client::Command::State,abm::client::Command::State>,std::allocator<abm::client::Command::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Command::State *,std::shared_ptr<abm::client::Command::State>::__shared_ptr_default_delete<abm::client::Command::State,abm::client::Command::State>,std::allocator<abm::client::Command::State>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (v1)
  {
    xpc_release(*(xpc_object_t *)(v1 + 16));
    *(void *)(v1 + 16) = 0;
    uint64_t v2 = *(NSObject **)(v1 + 8);
    if (v2) {
      dispatch_release(v2);
    }
    if (*(void *)v1) {
      _Block_release(*(const void **)v1);
    }
    operator delete((void *)v1);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Command::State *,std::shared_ptr<abm::client::Command::State>::__shared_ptr_default_delete<abm::client::Command::State,abm::client::Command::State>,std::allocator<abm::client::Command::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C57657E0) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C57657E0 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C57657E0)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C57657E0 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void std::__shared_ptr_pointer<abm::client::Command *,std::shared_ptr<abm::client::Command>::__shared_ptr_default_delete<abm::client::Command,abm::client::Command>,std::allocator<abm::client::Command>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Command *,std::shared_ptr<abm::client::Command>::__shared_ptr_default_delete<abm::client::Command,abm::client::Command>,std::allocator<abm::client::Command>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count ***)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = v1[1];
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      uint64_t v3 = v1;
    }
    else
    {
      uint64_t v3 = v1;
    }
    operator delete(v3);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Command *,std::shared_ptr<abm::client::Command>::__shared_ptr_default_delete<abm::client::Command,abm::client::Command>,std::allocator<abm::client::Command>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C57658BBLL) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C57658BBLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C57658BBLL)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C57658BBLL & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

void abm::client::Transport::create(uint64_t a1@<X0>, const void **a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  uint64_t v9 = *a2;
  CFTypeRef v48 = *a2;
  if (*a2) {
    CFRetain(v9);
  }
  uint64_t v11 = *a3;
  xpc_object_t v10 = (std::__shared_weak_count *)a3[1];
  uint64_t v47 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*(void *)a4)
  {
    xpc_object_t v12 = _Block_copy(*(const void **)a4);
    uint64_t v13 = *(NSObject **)(a4 + 8);
    long long v45 = v12;
    dispatch_object_t v46 = v13;
    if (!v13) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  xpc_object_t v12 = 0;
  uint64_t v13 = *(NSObject **)(a4 + 8);
  long long v45 = 0;
  dispatch_object_t v46 = v13;
  if (v13) {
LABEL_7:
  }
    dispatch_retain(v13);
LABEL_8:
  xpc_object_t v14 = (char *)operator new(0xE0uLL);
  CFTypeRef cf = v9;
  if (v9) {
    CFRetain(v9);
  }
  unint64_t v52 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v12)
  {
    xpc_object_t v15 = _Block_copy(v12);
    aBlock = v15;
    xpc_object_t object = v13;
    if (!v13) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  xpc_object_t v15 = 0;
  aBlock = 0;
  xpc_object_t object = v13;
  if (v13) {
LABEL_14:
  }
    dispatch_retain(v13);
LABEL_15:
  *((unsigned char *)&v54.__r_.__value_.__s + 23) = 4;
  strcpy((char *)&v54, ".xpc");
  int v16 = *(char *)(a1 + 23);
  if (v16 >= 0) {
    xpc_object_t v17 = (const std::string::value_type *)a1;
  }
  else {
    xpc_object_t v17 = *(const std::string::value_type **)a1;
  }
  if (v16 >= 0) {
    std::string::size_type v18 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    std::string::size_type v18 = *(void *)(a1 + 8);
  }
  xpc_object_t v19 = std::string::insert(&v54, 0, v17, v18);
  long long v20 = *(_OWORD *)&v19->__r_.__value_.__l.__data_;
  long long v58 = (void *(*)(uint64_t))v19->__r_.__value_.__r.__words[2];
  long long __p = v20;
  v19->__r_.__value_.__l.__size_ = 0;
  v19->__r_.__value_.__r.__words[2] = 0;
  v19->__r_.__value_.__r.__words[0] = 0;
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v63, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v63 = *(std::string *)a1;
  }
  xpc_object_t v21 = std::string::append(&v63, ".xpc.queue", 0xAuLL);
  long long v22 = *(_OWORD *)&v21->__r_.__value_.__l.__data_;
  int64_t v65 = v21->__r_.__value_.__r.__words[2];
  long long __dst = v22;
  v21->__r_.__value_.__l.__size_ = 0;
  v21->__r_.__value_.__r.__words[2] = 0;
  v21->__r_.__value_.__r.__words[0] = 0;
  unint64_t v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  if (v65 >= 0) {
    p_dst = (const char *)&__dst;
  }
  else {
    p_dst = (const char *)__dst;
  }
  dispatch_object_t v66 = dispatch_queue_create(p_dst, v23);
  dispatch_object_t v62 = 0;
  ctu::XpcClient::XpcClient();
  if (v62) {
    dispatch_release(v62);
  }
  if (v66) {
    dispatch_release(v66);
  }
  if (SHIBYTE(v65) < 0)
  {
    operator delete((void *)__dst);
    if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_37:
      if ((SHIBYTE(v58) & 0x80000000) == 0) {
        goto LABEL_38;
      }
LABEL_45:
      operator delete((void *)__p);
      uint64_t v44 = a5;
      if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_46;
    }
  }
  else if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_37;
  }
  operator delete(v63.__r_.__value_.__l.__data_);
  if (SHIBYTE(v58) < 0) {
    goto LABEL_45;
  }
LABEL_38:
  uint64_t v44 = a5;
  if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_39;
  }
LABEL_46:
  operator delete(v54.__r_.__value_.__l.__data_);
LABEL_39:
  *(void *)xpc_object_t v14 = &unk_1F20EE100;
  *((void *)v14 + 9) = &unk_1F20EE130;
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)&v63, "com.apple.telephony.abm", "abm.client");
  *((void *)v14 + 9) = &unk_1F20EE1C0;
  ctu::OsLogContext::OsLogContext();
  ctu::OsLogContext::OsLogContext();
  ctu::LoggerCommonBase::LoggerCommonBase();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v54);
  *((void *)v14 + 10) = &unk_1F20ED228;
  *((void *)v14 + 16) = v11;
  *((void *)v14 + 17) = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&__dst);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&v63);
  *(void *)xpc_object_t v14 = &unk_1F20EE100;
  *((void *)v14 + 9) = &unk_1F20EE130;
  *((void *)v14 + 18) = 0;
  xpc_object_t v25 = (void **)(v14 + 144);
  *((void *)v14 + 19) = 0;
  *((void *)v14 + 20) = 0;
  if (*(char *)(a1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v14 + 7, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)(v14 + 168) = *(_OWORD *)a1;
    *((void *)v14 + 23) = *(void *)(a1 + 16);
  }
  if (v15)
  {
    *((void *)v14 + 24) = _Block_copy(v15);
    *((void *)v14 + 25) = v13;
    if (!v13) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  *((void *)v14 + 24) = 0;
  *((void *)v14 + 25) = v13;
  if (v13) {
LABEL_50:
  }
    dispatch_retain(v13);
LABEL_51:
  long long v26 = operator new(0x18uLL);
  v26[2] = 0;
  v26[1] = 0;
  void *v26 = v26 + 1;
  *((void *)v14 + 26) = v26;
  long long v27 = operator new(0x20uLL);
  void *v27 = &unk_1F20EE200;
  v27[1] = 0;
  v27[2] = 0;
  v27[3] = v26;
  *((void *)v14 + 27) = v27;
  ctu::LoggerCommonBase::setLogLevel();
  v63.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v63.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  ctu::cf::dict_adapter::dict_adapter((ctu::cf::dict_adapter *)&v63, (const __CFDictionary *)v9);
  int v28 = (const void *)kABMDefaultServiceName;
  size_t v29 = strlen((const char *)kABMDefaultServiceName);
  if (v29 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v30 = v29;
  if (v29 >= 0x17)
  {
    uint64_t v32 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v29 | 7) != 0x17) {
      uint64_t v32 = v29 | 7;
    }
    uint64_t v33 = v32 + 1;
    uint64_t v31 = (long long *)operator new(v32 + 1);
    *((void *)&__dst + 1) = v30;
    int64_t v65 = v33 | 0x8000000000000000;
    *(void *)&long long __dst = v31;
    goto LABEL_58;
  }
  HIBYTE(v65) = v29;
  uint64_t v31 = &__dst;
  if (v29) {
LABEL_58:
  }
    memmove(v31, v28, v30);
  *((unsigned char *)v31 + v30) = 0;
  ctu::cf::map_adapter::getString();
  if (v14[167] < 0) {
    operator delete(*v25);
  }
  *(_OWORD *)xpc_object_t v25 = *(_OWORD *)&v54.__r_.__value_.__l.__data_;
  *((void *)v14 + 20) = *((void *)&v54.__r_.__value_.__l + 2);
  *((unsigned char *)&v54.__r_.__value_.__s + 23) = 0;
  v54.__r_.__value_.__s.__data_[0] = 0;
  if (SHIBYTE(v65) < 0) {
    operator delete((void *)__dst);
  }
  MEMORY[0x1C878F4A0](&v63);
  dispatch_object_t v34 = (std::__shared_weak_count *)operator new(0x20uLL);
  v34->__shared_owners_ = 0;
  p_shared_owners = &v34->__shared_owners_;
  v34->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F20EE0B0;
  v34->__shared_weak_owners_ = 0;
  v34[1].__vftable = (std::__shared_weak_count_vtbl *)v14;
  xpc_object_t v49 = v34;
  long long v36 = (std::__shared_weak_count *)*((void *)v14 + 2);
  if (!v36)
  {
    atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v34->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v14 + 1) = v14;
    *((void *)v14 + 2) = v34;
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  if (v36->__shared_owners_ == -1)
  {
    atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v34->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    *((void *)v14 + 1) = v14;
    *((void *)v14 + 2) = v34;
    std::__shared_weak_count::__release_weak(v36);
    if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
    {
LABEL_70:
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
LABEL_71:
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (!v52 || atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v37 = cf;
    if (!cf) {
      goto LABEL_79;
    }
    goto LABEL_78;
  }
  ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
  std::__shared_weak_count::__release_weak(v52);
  uint64_t v37 = cf;
  if (cf) {
LABEL_78:
  }
    CFRelease(v37);
LABEL_79:
  v54.__r_.__value_.__r.__words[0] = MEMORY[0x1E4F143A8];
  v54.__r_.__value_.__l.__size_ = 0x40000000;
  v54.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN3abm6client9Transport5State4initEv_block_invoke;
  uint64_t v55 = &__block_descriptor_tmp_21;
  *(void *)&long long __dst = &v54;
  unint64_t v56 = v14;
  *(void *)&long long __p = MEMORY[0x1E4F143A8];
  *((void *)&__p + 1) = 0x40000000;
  long long v58 = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  long long v59 = &__block_descriptor_tmp_22;
  long long v60 = v14 + 8;
  long long v61 = &__dst;
  uint64_t v38 = *((void *)v14 + 3);
  if (*((void *)v14 + 4))
  {
    dispatch_async_and_wait(v38, &__p);
    int v39 = v46;
    if (!v46) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
  dispatch_sync(v38, &__p);
  int v39 = v46;
  if (v46) {
LABEL_81:
  }
    dispatch_release(v39);
LABEL_82:
  if (v45) {
    _Block_release(v45);
  }
  if (!v47 || atomic_fetch_add(&v47->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    unint64_t v40 = v48;
    if (!v48) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
  ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
  std::__shared_weak_count::__release_weak(v47);
  unint64_t v40 = v48;
  if (v48) {
LABEL_87:
  }
    CFRelease(v40);
LABEL_88:
  uint64_t v41 = operator new(0x10uLL);
  uint64_t v42 = v41;
  if (v49)
  {
    atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
    void *v41 = v14;
    v41[1] = v49;
    atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  else
  {
    void *v41 = v14;
    v41[1] = 0;
  }
  *uint64_t v44 = v41;
  uint64_t v43 = operator new(0x20uLL);
  void *v43 = &unk_1F20EE4A0;
  v43[1] = 0;
  v43[2] = 0;
  v43[3] = v42;
  v44[1] = v43;
  if (v49 && !atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }
  if (v49)
  {
    if (!atomic_fetch_add(&v49->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }
}

void sub_1C5755ED8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, char a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char a24,uint64_t a25,char a26,uint64_t a27,char a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
}

void sub_1C5755FBC()
{
}

void sub_1C5755FD0(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va5, a6);
  va_start(va4, a6);
  va_start(va3, a6);
  va_start(va2, a6);
  va_start(va1, a6);
  va_start(va, a6);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  va_copy(va2, va1);
  uint64_t v16 = va_arg(va2, void);
  uint64_t v18 = va_arg(va2, void);
  va_copy(va3, va2);
  xpc_object_t v19 = va_arg(va3, const void *);
  uint64_t v21 = va_arg(va3, void);
  uint64_t v22 = va_arg(va3, void);
  va_copy(va4, va3);
  uint64_t v23 = va_arg(va4, void);
  uint64_t v25 = va_arg(va4, void);
  va_copy(va5, va4);
  uint64_t v26 = va_arg(va5, void);
  uint64_t v28 = va_arg(va5, void);
  if (*(char *)(v11 - 105) < 0) {
    operator delete(*(void **)(v11 - 128));
  }
  MEMORY[0x1C878F4A0](v11 - 160);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v8);
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback((uint64_t)(v7 + 192));
  if (v7[191] < 0) {
    operator delete(*v10);
  }
  if (v7[167] < 0) {
    operator delete(*v6);
  }
  *a3 = a2;
  MEMORY[0x1C878F380](v9);
  ctu::XpcClient::~XpcClient((ctu::XpcClient *)v7);
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback((uint64_t)va3);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va4);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va5);
  operator delete(v7);
  dispatch::callback<void({block_pointer})(abm::client::TransportStatus)>::~callback((uint64_t)va);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  ctu::cf::CFSharedRef<__CFDictionary const>::~CFSharedRef((const void **)va2);
  _Unwind_Resume(a1);
}

void sub_1C5755FE8()
{
}

void sub_1C5755FF0()
{
}

void sub_1C5755FF8()
{
  operator delete(v0);
  JUMPOUT(0x1C5756100);
}

void sub_1C5756008()
{
}

void sub_1C5756010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a26);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v26 - 128));
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)(v26 - 160));
  JUMPOUT(0x1C5756138);
}

void sub_1C5756030()
{
}

void sub_1C5756038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  unint64_t v40 = *(NSObject **)(v39 - 168);
  if (v40)
  {
    dispatch_release(v40);
    uint64_t v41 = *(NSObject **)(v39 - 104);
    if (!v41)
    {
LABEL_3:
      if ((*(char *)(v39 - 105) & 0x80000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v41 = *(NSObject **)(v39 - 104);
    if (!v41) {
      goto LABEL_3;
    }
  }
  dispatch_release(v41);
  if ((*(char *)(v39 - 105) & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(char *)(v39 - 137) & 0x80000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  operator delete(*(void **)(v39 - 128));
  if ((*(char *)(v39 - 137) & 0x80000000) == 0)
  {
LABEL_5:
    if ((a39 & 0x80000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
LABEL_11:
  operator delete(*(void **)(v39 - 160));
  if ((a39 & 0x80000000) == 0)
  {
LABEL_6:
    if ((a31 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_16;
  }
LABEL_12:
  operator delete(a34);
  if ((a31 & 0x80000000) == 0) {
LABEL_15:
  }
    JUMPOUT(0x1C5756140);
LABEL_16:
  JUMPOUT(0x1C57560D8);
}

void sub_1C575609C()
{
  if (*(char *)(v0 - 137) < 0) {
    JUMPOUT(0x1C57560A8);
  }
  JUMPOUT(0x1C575605CLL);
}

void sub_1C57560CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    JUMPOUT(0x1C57560D8);
  }
  JUMPOUT(0x1C5756140);
}

void sub_1C57560E4()
{
}

void *abm::client::Transport::Transport(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = a2[1];
  void *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void abm::client::Transport::perform(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  uint64_t v4 = (std::__shared_weak_count *)a2[1];
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 1174405120;
  v6[2] = ___ZN3abm6client9Transport5State7performENSt3__110shared_ptrINS0_7CommandEEE_block_invoke;
  v6[3] = &__block_descriptor_tmp_23;
  v6[4] = v2;
  v6[5] = v3;
  uint64_t v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v2 + 8), (uint64_t)v6);
  int v5 = v7;
  if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
    if (!v4) {
      return;
    }
  }
  else if (!v4)
  {
    return;
  }
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void abm::client::Transport::reconnect(abm::client::Transport *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = (uint64_t *)(*(void *)this + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN3abm6client9Transport5State9reconnectEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_35;
  v3[4] = v1;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
}

void abm::client::Transport::checkIn(abm::client::Transport *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(void *)this + 8;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State7checkInEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_36;
  v4[4] = v1;
  int v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_22;
  void block[4] = v2;
  void block[5] = &v5;
  uint64_t v3 = *(NSObject **)(v1 + 24);
  if (*(void *)(v1 + 32)) {
    dispatch_async_and_wait(v3, block);
  }
  else {
    dispatch_sync(v3, block);
  }
}

void abm::client::Transport::checkOut(abm::client::Transport *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = (uint64_t *)(*(void *)this + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN3abm6client9Transport5State8checkOutEv_block_invoke;
  v3[3] = &__block_descriptor_tmp_47;
  v3[4] = v1;
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v2, (uint64_t)v3);
}

void abm::client::Transport::setEventHandler(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    int v5 = *(void **)a3;
    if (!*(void *)a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string v9 = *(std::string *)a2;
  int v5 = *(void **)a3;
  if (*(void *)a3) {
LABEL_5:
  }
    int v5 = _Block_copy(v5);
LABEL_6:
  CFTypeRef v6 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  dispatch_object_t object = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  abm::client::Transport::State::setEventHandler(v4, (uint64_t)&v9, (uint64_t)&aBlock);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_1C5756590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::setEventHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 1174405120;
  v8[2] = ___ZN3abm6client9Transport5State15setEventHandlerENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS3_10shared_ptrINS0_5EventEEEEEE_block_invoke;
  v8[3] = &__block_descriptor_tmp_48;
  void v8[4] = a1;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    int v5 = *(void **)a3;
    if (!*(void *)a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  std::string __p = *(std::string *)a2;
  int v5 = *(void **)a3;
  if (*(void *)a3) {
LABEL_5:
  }
    int v5 = _Block_copy(v5);
LABEL_6:
  CFTypeRef v6 = (uint64_t *)(a1 + 8);
  uint64_t v7 = *(NSObject **)(a3 + 8);
  aBlock = v5;
  dispatch_object_t object = v7;
  if (v7) {
    dispatch_retain(v7);
  }
  ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(v6, (uint64_t)v8);
  if (object) {
    dispatch_release(object);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void abm::client::Transport::eventsOn(abm::client::Transport *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(void *)this + 8;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State8eventsOnEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_49;
  v4[4] = v1;
  int v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_22;
  void block[4] = v2;
  void block[5] = &v5;
  uint64_t v3 = *(NSObject **)(v1 + 24);
  if (*(void *)(v1 + 32)) {
    dispatch_async_and_wait(v3, block);
  }
  else {
    dispatch_sync(v3, block);
  }
}

void abm::client::Transport::eventsOff(abm::client::Transport *this)
{
  uint64_t v1 = *(void *)this;
  uint64_t v2 = *(void *)this + 8;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZN3abm6client9Transport5State9eventsOffEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_50;
  v4[4] = v1;
  int v5 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke;
  block[3] = &__block_descriptor_tmp_22;
  void block[4] = v2;
  void block[5] = &v5;
  uint64_t v3 = *(NSObject **)(v1 + 24);
  if (*(void *)(v1 + 32)) {
    dispatch_async_and_wait(v3, block);
  }
  else {
    dispatch_sync(v3, block);
  }
}

void std::__shared_ptr_pointer<abm::client::Transport::State *,std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State *)#1},std::allocator<abm::client::Transport::State>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Transport::State *,std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State *)#1},std::allocator<abm::client::Transport::State>>::__on_zero_shared(uint64_t a1)
{
}

uint64_t std::__shared_ptr_pointer<abm::client::Transport::State *,std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State *)#1},std::allocator<abm::client::Transport::State>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5StateEEENSt3__"
                     "110shared_ptrIT_EEPSA_EUlPS7_E_")
    return a1 + 24;
  if (((v3 & (unint64_t)"ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5Sta"
                                "teEEENSt3__110shared_ptrIT_EEPSA_EUlPS7_E_" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5StateEEENSt3__110shared_ptrIT_EEPSA_EUlPS7_E_"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN3ctu20SharedSynchronizableINS_9XpcClientEE15make_shared_ptrIN3abm6client9Transport5StateEEENSt3__110shared_ptrIT_EEPSA_EUlPS7_E_" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

uint64_t std::shared_ptr<abm::client::Transport::State> ctu::SharedSynchronizable<ctu::XpcClient>::make_shared_ptr<abm::client::Transport::State>(abm::client::Transport::State*)::{lambda(abm::client::Transport::State*)#1}::operator() const(abm::client::Transport::State*)::{lambda(void *)#1}::__invoke(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 24))();
  }
  return result;
}

void abm::client::Transport::State::handleServerError_sync(void *a1, xpc::object *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[14];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    xpc::object::to_string((uint64_t *)object, a2);
    uint64_t v16 = SHIBYTE(v18) >= 0 ? object : (xpc_object_t *)object[0];
    *(_DWORD *)long long buf = 136315138;
    uint64_t v23 = v16;
    _os_log_error_impl(&dword_1C5737000, v4, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
    if (SHIBYTE(v18) < 0) {
      operator delete(object[0]);
    }
  }
  if (*(void *)a2 != MEMORY[0x1E4F14550])
  {
    pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    int v5 = (os_unfair_lock_s *)off_1EB5069C8;
    if (!off_1EB5069C8)
    {
      CFTypeRef v6 = (ConnectionObserver *)operator new(0x90uLL);
      ConnectionObserver::ConnectionObserver(v6);
      object[0] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
      object[1] = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
      std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(object, (uint64_t)v6);
      ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync((uint64_t)object[0]);
      long long v7 = *(_OWORD *)object;
      object[0] = 0;
      object[1] = 0;
      uint64_t v8 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
      off_1EB5069C8 = v7;
      if (v8 && !atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      std::string v9 = (std::__shared_weak_count *)object[1];
      if (object[1] && !atomic_fetch_add((atomic_ullong *volatile)object[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
      int v5 = (os_unfair_lock_s *)off_1EB5069C8;
    }
    xpc_object_t v10 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    if (*(&off_1EB5069C8 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
    object[0] = (xpc_object_t)MEMORY[0x1E4F143A8];
    object[1] = (xpc_object_t)0x40000000;
    uint64_t v18 = (void (*)(xpc_object_t *))___ZN18ConnectionObserver7suspendEv_block_invoke;
    xpc_object_t v19 = &__block_descriptor_tmp_4;
    aBlock = v5;
    os_unfair_lock_lock(v5 + 22);
    v18(object);
    os_unfair_lock_unlock(v5 + 22);
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    object[0] = xpc_null_create();
    ctu::XpcClient::setServer_sync();
    xpc_release(object[0]);
    uint64_t v11 = (const void *)a1[24];
    if (v11 && a1[25])
    {
      xpc_object_t v12 = _Block_copy(v11);
      uint64_t v13 = v12;
      xpc_object_t v14 = a1[25];
      object[0] = (xpc_object_t)MEMORY[0x1E4F143A8];
      object[1] = (xpc_object_t)1174405120;
      uint64_t v18 = (void (*)(xpc_object_t *))___ZNK8dispatch8callbackIU13block_pointerFvN3abm6client15TransportStatusEEEclIJS3_EEEvDpT__block_invoke;
      xpc_object_t v19 = &__block_descriptor_tmp_9;
      if (v12) {
        uint64_t v15 = _Block_copy(v12);
      }
      else {
        uint64_t v15 = 0;
      }
      aBlock = v15;
      int v21 = 4;
      dispatch_async(v14, object);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v13) {
        _Block_release(v13);
      }
    }
  }
}

void sub_1C5756CC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::Transport::State::handleMessage_sync(uint64_t a1, xpc::object *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(NSObject **)(a1 + 112);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    xpc::object::to_string((uint64_t *)&__p, a2);
    uint64_t v42 = SHIBYTE(v50) >= 0 ? &__p : (void **)__p;
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v42;
    _os_log_debug_impl(&dword_1C5737000, v4, OS_LOG_TYPE_DEBUG, "#D Message From Server: %s", buf, 0xCu);
    if (SHIBYTE(v50) < 0) {
      operator delete(__p);
    }
  }
  int v5 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v5 || (uint64_t v6 = *(void *)(a1 + 8), (v7 = std::__shared_weak_count::lock(v5)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v8 = v7;
  atomic_fetch_add_explicit(&v7->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    memset(buf, 170, 16);
    std::string v9 = *(void **)a2;
    xpc_object_t v47 = v9;
    if (v9)
    {
LABEL_6:
      xpc_retain(v9);
      goto LABEL_9;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v8);
    memset(buf, 170, 16);
    std::string v9 = *(void **)a2;
    xpc_object_t v47 = v9;
    if (v9) {
      goto LABEL_6;
    }
  }
  xpc_object_t v47 = xpc_null_create();
LABEL_9:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3abm6client9Transport5State18handleMessage_syncEN3xpc4dictE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_19;
  aBlock[4] = a1;
  aBlock[5] = v6;
  uint64_t v44 = v8;
  atomic_fetch_add_explicit(&v8->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  xpc_object_t v10 = _Block_copy(aBlock);
  uint64_t v11 = *(NSObject **)(a1 + 24);
  if (v11) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  }
  long long v45 = v10;
  dispatch_object_t object = v11;
  abm::client::Event::create(&v47, (uint64_t)&v45, buf);
  if (object) {
    dispatch_release(object);
  }
  if (v45) {
    _Block_release(v45);
  }
  xpc_release(v47);
  xpc_object_t v47 = 0;
  abm::client::Event::State::name(**(xpc_object_t ***)buf);
  int v12 = SHIBYTE(v50);
  if (SHIBYTE(v50) >= 0) {
    size_t v13 = HIBYTE(v50);
  }
  else {
    size_t v13 = v49;
  }
  if (v13 == strlen((const char *)kValueInvalid))
  {
    if (SHIBYTE(v50) >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    BOOL v15 = memcmp(p_p, (const void *)kValueInvalid, v13) == 0;
    if ((v12 & 0x80000000) == 0)
    {
LABEL_23:
      if (v15) {
        goto LABEL_84;
      }
      goto LABEL_27;
    }
  }
  else
  {
    BOOL v15 = 0;
    if ((SHIBYTE(v50) & 0x80000000) == 0) {
      goto LABEL_23;
    }
  }
  operator delete(__p);
  if (v15) {
    goto LABEL_84;
  }
LABEL_27:
  uint64_t v16 = *(void *)(a1 + 208);
  abm::client::Event::State::name(**(xpc_object_t ***)buf);
  xpc_object_t v19 = *(uint64_t **)(v16 + 8);
  xpc_object_t v17 = (uint64_t *)(v16 + 8);
  uint64_t v18 = v19;
  char v20 = HIBYTE(v50);
  if (!v19) {
    goto LABEL_62;
  }
  if (SHIBYTE(v50) >= 0) {
    int v21 = &__p;
  }
  else {
    int v21 = __p;
  }
  if (SHIBYTE(v50) >= 0) {
    size_t v22 = HIBYTE(v50);
  }
  else {
    size_t v22 = v49;
  }
  uint64_t v23 = v17;
  do
  {
    while (1)
    {
      int v24 = *((char *)v18 + 55);
      uint64_t v25 = v24 >= 0 ? v18 + 4 : (uint64_t *)v18[4];
      size_t v26 = v24 >= 0 ? *((unsigned __int8 *)v18 + 55) : v18[5];
      size_t v27 = v22 >= v26 ? v26 : v22;
      int v28 = memcmp(v25, v21, v27);
      if (v28) {
        break;
      }
      if (v26 >= v22) {
        goto LABEL_49;
      }
LABEL_35:
      uint64_t v18 = (uint64_t *)v18[1];
      if (!v18) {
        goto LABEL_50;
      }
    }
    if (v28 < 0) {
      goto LABEL_35;
    }
LABEL_49:
    uint64_t v23 = v18;
    uint64_t v18 = (uint64_t *)*v18;
  }
  while (v18);
LABEL_50:
  if (v23 == v17) {
    goto LABEL_62;
  }
  int v29 = *((char *)v23 + 55);
  if (v29 >= 0) {
    size_t v30 = v23 + 4;
  }
  else {
    size_t v30 = (const void *)v23[4];
  }
  if (v29 >= 0) {
    size_t v31 = *((unsigned __int8 *)v23 + 55);
  }
  else {
    size_t v31 = v23[5];
  }
  if (v31 >= v22) {
    size_t v32 = v22;
  }
  else {
    size_t v32 = v31;
  }
  int v33 = memcmp(v21, v30, v32);
  if (v33)
  {
    if (v33 < 0) {
      goto LABEL_62;
    }
  }
  else if (v22 < v31)
  {
LABEL_62:
    uint64_t v23 = v17;
  }
  if (v20 < 0)
  {
    operator delete(__p);
    if ((uint64_t *)(*(void *)(a1 + 208) + 8) != v23) {
      goto LABEL_67;
    }
  }
  else
  {
    if ((uint64_t *)(*(void *)(a1 + 208) + 8) == v23) {
      goto LABEL_84;
    }
LABEL_67:
    uint64_t v35 = *(void *)buf;
    dispatch_object_t v34 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 1uLL, memory_order_relaxed);
    }
    long long v36 = (const void *)v23[7];
    if (v36) {
      uint64_t v37 = _Block_copy(v36);
    }
    else {
      uint64_t v37 = 0;
    }
    uint64_t v38 = v23[8];
    std::string __p = (void *)MEMORY[0x1E4F143A8];
    uint64_t v49 = 1174405120;
    xpc_object_t v50 = ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEclIJS6_EEEvDpT__block_invoke;
    unint64_t v51 = &__block_descriptor_tmp_20;
    if (v37)
    {
      unint64_t v52 = _Block_copy(v37);
      uint64_t v53 = v35;
      std::string v54 = v34;
      if (v34) {
        goto LABEL_74;
      }
    }
    else
    {
      unint64_t v52 = 0;
      uint64_t v53 = v35;
      std::string v54 = v34;
      if (v34) {
LABEL_74:
      }
        atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    dispatch_async(v38, &__p);
    uint64_t v39 = v54;
    if (v54 && !atomic_fetch_add(&v54->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
      unint64_t v40 = v52;
      if (v52) {
LABEL_78:
      }
        _Block_release(v40);
    }
    else
    {
      unint64_t v40 = v52;
      if (v52) {
        goto LABEL_78;
      }
    }
    if (v37) {
      _Block_release(v37);
    }
    if (v34 && !atomic_fetch_add(&v34->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
LABEL_84:
  uint64_t v41 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]
    && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
    std::__shared_weak_count::__release_weak(v41);
  }
  if (v44) {
    std::__shared_weak_count::__release_weak(v44);
  }
  std::__shared_weak_count::__release_weak(v8);
}

void sub_1C57572F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, char a17, uint64_t a18, xpc_object_t object)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::Transport::State::~State(abm::client::Transport::State *this)
{
  abm::client::Transport::State::~State(this);
  operator delete(v1);
}

{
  std::__shared_weak_count *v2;
  NSObject *v3;
  const void *v4;
  uint64_t vars8;

  *(void *)this = &unk_1F20EE100;
  *((void *)this + 9) = &unk_1F20EE130;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 27);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
  }
  unint64_t v3 = *((void *)this + 25);
  if (v3) {
    dispatch_release(v3);
  }
  uint64_t v4 = (const void *)*((void *)this + 24);
  if (v4) {
    _Block_release(v4);
  }
  if (*((char *)this + 191) < 0)
  {
    operator delete(*((void **)this + 21));
    if ((*((char *)this + 167) & 0x80000000) == 0) {
      goto LABEL_10;
    }
  }
  else if ((*((char *)this + 167) & 0x80000000) == 0)
  {
    goto LABEL_10;
  }
  operator delete(*((void **)this + 18));
LABEL_10:
  *((void *)this + 9) = &unk_1F20EE1C0;
  MEMORY[0x1C878F380]((char *)this + 80);
  ctu::XpcClient::~XpcClient(this);
}

void non-virtual thunk to'abm::client::Transport::State::~State(abm::client::Transport::State *this)
{
}

{
  void *v1;
  uint64_t vars8;

  abm::client::Transport::State::~State((abm::client::Transport::State *)((char *)this - 72));
  operator delete(v1);
}

uint64_t ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::updateTrackedConfig(uint64_t a1)
{
  return MEMORY[0x1F417DA50](a1 + 8);
}

void ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLoggerName(char *a1@<X8>)
{
  a1[23] = 10;
  strcpy(a1, "abm.client");
}

uint64_t ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::getTrackedLogLevel(uint64_t a1)
{
  return MEMORY[0x1F417DD10](a1 + 8);
}

void *ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20EE1C0;
  MEMORY[0x1C878F380](a1 + 1);
  return a1;
}

void ctu::Loggable<abm::client::Transport::State,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::~Loggable(void *a1)
{
  *a1 = &unk_1F20EE1C0;
  MEMORY[0x1C878F380](a1 + 1);
  operator delete(a1);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(char ***)(a1 + 24);
  if (v1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(v1[1]);
    operator delete(v1);
  }
}

uint64_t std::__shared_ptr_pointer<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>> *,std::shared_ptr<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>::__shared_ptr_default_delete<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>,std::allocator<std::map<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if ((char *)v3 == "NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8dispatch8ca"
                     "llbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4pairIKS7_SG_EEEEEEE27_"
                     "_shared_ptr_default_deleteISN_SN_EE")
    return a1 + 24;
  if (((v3 & (unint64_t)"NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8"
                                "dispatch8callbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4"
                                "pairIKS7_SG_EEEEEEE27__shared_ptr_default_deleteISN_SN_EE" & 0x8000000000000000) != 0) == __OFSUB__(v3, "NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4pairIKS7_SG_EEEEEEE27__shared_ptr_default_deleteISN_SN_EE"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"NSt3__110shared_ptrINS_3mapINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS0_IN3abm6client5EventEEEEEENS_4lessIS7_EENS5_INS_4pairIKS7_SG_EEEEEEE27__shared_ptr_default_deleteISN_SN_EE" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 24; {
  return 0;
  }
}

void std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::__map_value_compare<std::string,std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>>>>::destroy(*((void *)a1 + 1));
    uint64_t v2 = *((void *)a1 + 8);
    if (v2) {
      dispatch_release(v2);
    }
    unint64_t v3 = (const void *)*((void *)a1 + 7);
    if (v3) {
      _Block_release(v3);
    }
    if (a1[55] < 0)
    {
      operator delete(*((void **)a1 + 4));
      uint64_t v4 = a1;
    }
    else
    {
      uint64_t v4 = a1;
    }
    operator delete(v4);
  }
}

uint64_t ___ZNK8dispatch8callbackIU13block_pointerFvN3abm6client15TransportStatusEEEclIJS3_EEEvDpT__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void *__copy_helper_block_e8_32c72_ZTSN8dispatch5blockIU13block_pointerFvN3abm6client15TransportStatusEEEE(uint64_t a1, uint64_t a2)
{
  CFTypeRef result = *(void **)(a2 + 32);
  if (result) {
    CFTypeRef result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c72_ZTSN8dispatch5blockIU13block_pointerFvN3abm6client15TransportStatusEEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3abm6client9Transport5State18handleMessage_syncEN3xpc4dictE_block_invoke(void *a1, xpc_object_t *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (std::__shared_weak_count *)a1[6];
  if (v3)
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = std::__shared_weak_count::lock(v3);
    xpc_object_t v17 = v6;
    if (v6)
    {
      if (!a1[5])
      {
        xpc_object_t v10 = v6;
LABEL_19:
        if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
          std::__shared_weak_count::__release_weak(v10);
        }
        return;
      }
      xpc_object_t reply = xpc_dictionary_create_reply(*a2);
      uint64_t v8 = MEMORY[0x1E4F14590];
      if (reply || (xpc_object_t reply = xpc_null_create()) != 0)
      {
        if (MEMORY[0x1C878FBE0](reply) == v8)
        {
          xpc_retain(reply);
          xpc_object_t v9 = reply;
        }
        else
        {
          xpc_object_t v9 = xpc_null_create();
        }
      }
      else
      {
        xpc_object_t v9 = xpc_null_create();
        xpc_object_t reply = 0;
      }
      xpc_release(reply);
      if (MEMORY[0x1C878FBE0](v9) == v8)
      {
        if (v9)
        {
          xpc_retain(v9);
          xpc_object_t v11 = v9;
        }
        else
        {
          xpc_object_t v11 = xpc_null_create();
        }
        if (MEMORY[0x1C878FBE0](*(void *)(v5 + 40)) == MEMORY[0x1E4F14578]) {
          xpc_connection_send_message(*(xpc_connection_t *)(v5 + 40), v11);
        }
        xpc_release(v11);
        int v12 = *(NSObject **)(v5 + 112);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          xpc::object::to_string((uint64_t *)__p, (xpc::object *)a2);
          if (v15 >= 0) {
            size_t v13 = __p;
          }
          else {
            size_t v13 = (void **)__p[0];
          }
          *(_DWORD *)long long buf = 136315138;
          xpc_object_t v19 = v13;
          _os_log_debug_impl(&dword_1C5737000, v12, OS_LOG_TYPE_DEBUG, "#D Sent reply for: %s", buf, 0xCu);
          if (v15 < 0) {
            operator delete(__p[0]);
          }
        }
      }
      xpc_release(v9);
      xpc_object_t v10 = v17;
      if (v17) {
        goto LABEL_19;
      }
    }
  }
}

void sub_1C57578D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  xpc_release(v13);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZNK8dispatch8callbackIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEclIJS6_EEEvDpT__block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t v3 = (std::__shared_weak_count *)a1[6];
  uint64_t v6 = v4;
  long long v7 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v6);
  uint64_t v5 = v7;
  if (v7)
  {
    if (!atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_1C5757A1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10)
  {
    if (!atomic_fetch_add(&a10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))a10->__on_zero_shared)(a10);
      std::__shared_weak_count::__release_weak(a10);
    }
  }
  _Unwind_Resume(exception_object);
}

void *__copy_helper_block_e8_32c83_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(void *a1, void *a2)
{
  CFTypeRef result = (void *)a2[4];
  if (result) {
    CFTypeRef result = _Block_copy(result);
  }
  uint64_t v6 = a2[5];
  uint64_t v5 = a2[6];
  a1[4] = result;
  a1[5] = v6;
  a1[6] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_32c83_ZTSN8dispatch5blockIU13block_pointerFvNSt3__110shared_ptrIN3abm6client5EventEEEEEE40c45_ZTSNSt3__110shared_ptrIN3abm6client5EventEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    unint64_t v3 = *(const void **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  else
  {
    unint64_t v3 = *(const void **)(a1 + 32);
    if (!v3) {
      return;
    }
  }
  _Block_release(v3);
}

void ___ZN3abm6client9Transport5State4initEv_block_invoke(uint64_t a1)
{
}

void abm::client::Transport::State::reconnect_sync(dispatch_queue_t *this)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (const char **)(this + 18);
  if (*((char *)this + 167) < 0)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service(*v2, this[3], 2uLL);
    if (mach_service) {
      goto LABEL_3;
    }
  }
  else
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)v2, this[3], 2uLL);
    if (mach_service)
    {
LABEL_3:
      xpc_object_t v4 = mach_service;
      xpc_object_t object = mach_service;
LABEL_6:
      xpc_retain(v4);
      goto LABEL_7;
    }
  }
  xpc_object_t v4 = xpc_null_create();
  xpc_object_t object = v4;
  if (v4) {
    goto LABEL_6;
  }
  xpc_object_t v4 = 0;
  xpc_object_t object = xpc_null_create();
LABEL_7:
  ctu::XpcClient::setServer_sync();
  xpc_release(object);
  uint64_t v5 = this[14];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = this + 21;
    if (*((char *)this + 191) < 0) {
      uint64_t v6 = (void *)*v6;
    }
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = v6;
    _os_log_impl(&dword_1C5737000, v5, OS_LOG_TYPE_DEFAULT, "#I [%s] Connecting to server", buf, 0xCu);
  }
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  long long v7 = (os_unfair_lock_s *)off_1EB5069C8;
  if (!off_1EB5069C8)
  {
    uint64_t v8 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v8);
    memset(buf, 170, sizeof(buf));
    std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(buf, (uint64_t)v8);
    ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(*(uint64_t *)buf);
    long long v9 = *(_OWORD *)buf;
    memset(buf, 0, sizeof(buf));
    xpc_object_t v10 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    off_1EB5069C8 = v9;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    xpc_object_t v11 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8]
      && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)&buf[8] + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    long long v7 = (os_unfair_lock_s *)off_1EB5069C8;
  }
  int v12 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
  if (*(&off_1EB5069C8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 0x40000000;
  uint64_t v16 = ___ZN18ConnectionObserver6resumeEv_block_invoke;
  xpc_object_t v17 = &__block_descriptor_tmp_1;
  uint64_t v18 = v7;
  size_t v13 = v7 + 22;
  os_unfair_lock_lock(v13);
  v16((uint64_t)buf);
  os_unfair_lock_unlock(v13);
  if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v12);
  }
  xpc_release(v4);
}

void sub_1C5757F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, char a11)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  xpc_release(v11);
  _Unwind_Resume(a1);
}

void *___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE20execute_wrapped_syncIRU13block_pointerFvvEEEDTclsr8dispatchE4syncLDnEclsr3stdE7forwardIT_Efp_EEEOS7__block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 40) + 16))(*(void **)(a1 + 40));
}

void ___ZN3abm6client9Transport5State7performENSt3__110shared_ptrINS0_7CommandEEE_block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = (std::__shared_weak_count *)a1[6];
  v4[0] = a1[5];
  v4[1] = (uint64_t)v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  abm::client::Transport::State::perform_sync(v2, v4);
  if (v3 && !atomic_fetch_add(&v3->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
}

void sub_1C57580BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void abm::client::Transport::State::perform_sync(uint64_t a1, uint64_t *a2)
{
  if (!*a2) {
    return;
  }
  unint64_t v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v3 || (uint64_t v5 = *(void *)(a1 + 8), (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  p_shared_weak_owners = &v6->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v6->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v6->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
    std::__shared_weak_count::__release_weak(v7);
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 1174405120;
  v25[2] = ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke;
  v25[3] = &__block_descriptor_tmp_28_0;
  void v25[4] = a1;
  v25[5] = v5;
  size_t v26 = v7;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  long long v9 = (std::__shared_weak_count *)a2[1];
  uint64_t v27 = *a2;
  int v28 = v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  xpc_object_t v10 = *(std::__shared_weak_count **)(a1 + 16);
  if (!v10 || (uint64_t v11 = *(void *)(a1 + 8), (v12 = std::__shared_weak_count::lock(v10)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  size_t v13 = v12;
  atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
    std::__shared_weak_count::__release_weak(v13);
  }
  pthread_mutex_lock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  uint64_t v14 = off_1EB5069C8;
  if (!off_1EB5069C8)
  {
    char v15 = (ConnectionObserver *)operator new(0x90uLL);
    ConnectionObserver::ConnectionObserver(v15);
    *(void *)&long long aBlock = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&aBlock + 1) = 0xAAAAAAAAAAAAAAAALL;
    std::shared_ptr<ConnectionObserver>::shared_ptr[abi:ne180100]<ConnectionObserver,void>(&aBlock, (uint64_t)v15);
    ctu::Loggable<ConnectionObserver,ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>>::connectToLogServer_sync(aBlock);
    long long v16 = aBlock;
    long long aBlock = 0uLL;
    xpc_object_t v17 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
    off_1EB5069C8 = v16;
    if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
    uint64_t v18 = (std::__shared_weak_count *)*((void *)&aBlock + 1);
    if (*((void *)&aBlock + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&aBlock + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    uint64_t v14 = off_1EB5069C8;
  }
  uint64_t v19 = (std::__shared_weak_count *)*(&off_1EB5069C8 + 1);
  if (*(&off_1EB5069C8 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(&off_1EB5069C8 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1174405120;
  size_t v30 = ___ZN3abm6client9Transport5State10gateServerIU13block_pointerFvvEEEvT__block_invoke;
  size_t v31 = &unk_1F20EE3A0;
  uint64_t v33 = v11;
  dispatch_object_t v34 = v13;
  atomic_fetch_add_explicit(&v13->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  size_t v32 = v25;
  uint64_t v20 = _Block_copy(&aBlock);
  int v21 = v20;
  size_t v22 = *(NSObject **)(v14 + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = ___ZN18ConnectionObserver4gateEN8dispatch5blockIU13block_pointerFvvEEE_block_invoke;
  block[3] = &__block_descriptor_tmp_32;
  if (v20)
  {
    long long v36 = _Block_copy(v20);
    dispatch_async(v22, block);
    uint64_t v23 = v36;
    if (!v36) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  long long v36 = 0;
  dispatch_async(v22, block);
  uint64_t v23 = v36;
  if (v36) {
LABEL_26:
  }
    _Block_release(v23);
LABEL_27:
  if (v21) {
    _Block_release(v21);
  }
  if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  if (v34) {
    std::__shared_weak_count::__release_weak(v34);
  }
  std::__shared_weak_count::__release_weak(v13);
  int v24 = v28;
  if (v28 && !atomic_fetch_add(&v28->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
    std::__shared_weak_count::__release_weak(v24);
  }
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  std::__shared_weak_count::__release_weak(v7);
}

void sub_1C5758524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, char a19)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  pthread_mutex_unlock(&ctu::Singleton<ConnectionObserver,ConnectionObserver,ctu::PthreadMutexGuardPolicy<ConnectionObserver>>::sInstance);
  std::__shared_weak_count::__release_weak(v20);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v21 + 56);
  if (a16) {
    std::__shared_weak_count::__release_weak(a16);
  }
  std::__shared_weak_count::__release_weak(v19);
  _Unwind_Resume(a1);
}

void ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = (std::__shared_weak_count *)a1[1];
  if (!v3 || (uint64_t v5 = *a1, (v6 = std::__shared_weak_count::lock(v3)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  long long v7 = v6;
  uint64_t v8 = a1[2];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 1174405120;
  block[2] = ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke;
  block[3] = &unk_1F20EE308;
  void block[5] = v5;
  int v12 = v7;
  p_shared_owners = &v7->__shared_owners_;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  void block[4] = a2;
  dispatch_async(v8, block);
  xpc_object_t v10 = v12;
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
      return;
    }
LABEL_8:
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
  std::__shared_weak_count::__release_weak(v10);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL)) {
    goto LABEL_8;
  }
}

uint64_t ___ZNK3ctu20SharedSynchronizableINS_9XpcClientEE15execute_wrappedEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __copy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c43_ZTSNSt3__110shared_ptrIKN3ctu9XpcClientEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1 && !atomic_fetch_add(&v1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2) {
    return;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  xpc_object_t v4 = std::__shared_weak_count::lock(v2);
  size_t v26 = v4;
  if (!v4) {
    return;
  }
  if (!*(void *)(a1 + 40))
  {
    uint64_t v8 = v4;
LABEL_45:
    if (!atomic_fetch_add(&v8->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
    return;
  }
  memset(&v24, 170, sizeof(v24));
  abm::client::Command::State::name(**(xpc_object_t ***)(a1 + 56));
  uint64_t v5 = *(NSObject **)(v3 + 112);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    long long v16 = &v24;
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      long long v16 = (std::string *)v24.__r_.__value_.__r.__words[0];
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_debug_impl(&dword_1C5737000, v5, OS_LOG_TYPE_DEBUG, "#D Performing %s", (uint8_t *)&buf, 0xCu);
    uint64_t v6 = **(void **)(a1 + 56);
    if (!*(void *)v6) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v6 = **(void **)(a1 + 56);
    if (!*(void *)v6) {
      goto LABEL_24;
    }
  }
  if (*(void *)(v6 + 8))
  {
    xpc_object_t v7 = *(xpc_object_t *)(v6 + 16);
    if (v7) {
      xpc_retain(*(xpc_object_t *)(v6 + 16));
    }
    else {
      xpc_object_t v7 = xpc_null_create();
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke_25;
    aBlock[3] = &__block_descriptor_tmp_27_0;
    uint64_t v10 = *(void *)(a1 + 40);
    long long v9 = *(std::__shared_weak_count **)(a1 + 48);
    aBlock[4] = v3;
    aBlock[5] = v10;
    uint64_t v20 = v9;
    if (v9) {
      atomic_fetch_add_explicit(&v9->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = v24;
    }
    uint64_t v11 = *(std::__shared_weak_count **)(a1 + 64);
    uint64_t v22 = *(void *)(a1 + 56);
    uint64_t v23 = v11;
    if (v11) {
      atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    int v12 = _Block_copy(aBlock);
    if (MEMORY[0x1C878FBE0](*(void *)(v3 + 40)) == MEMORY[0x1E4F14578])
    {
      size_t v13 = *(_xpc_connection_s **)(v3 + 40);
      uint64_t v14 = *(NSObject **)(v3 + 24);
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 1174405120;
      int v28 = ___ZN3abm6client9Transport5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS3_6objectEEEE_block_invoke;
      int v29 = &__block_descriptor_tmp_34;
      char v15 = v12 ? _Block_copy(v12) : 0;
      size_t v30 = v15;
      xpc_connection_send_message_with_reply(v13, v7, v14, &buf);
      if (v30) {
        _Block_release(v30);
      }
    }
    if (v12) {
      _Block_release(v12);
    }
    xpc_release(v7);
    uint64_t v18 = v23;
    if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v20) {
      std::__shared_weak_count::__release_weak(v20);
    }
    goto LABEL_42;
  }
LABEL_24:
  xpc_object_t v17 = *(xpc_object_t *)(v6 + 16);
  if (v17) {
    xpc_retain(*(xpc_object_t *)(v6 + 16));
  }
  else {
    xpc_object_t v17 = xpc_null_create();
  }
  if (MEMORY[0x1C878FBE0](*(void *)(v3 + 40)) == MEMORY[0x1E4F14578]) {
    xpc_connection_send_message(*(xpc_connection_t *)(v3 + 40), v17);
  }
  xpc_release(v17);
LABEL_42:
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  uint64_t v8 = v26;
  if (v26) {
    goto LABEL_45;
  }
}

void sub_1C5758B60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,char a31)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3abm6client9Transport5State12perform_syncENSt3__110shared_ptrINS0_7CommandEEE_block_invoke_25(uint64_t a1, xpc_object_t *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3) {
    return;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = std::__shared_weak_count::lock(v3);
  size_t v32 = v6;
  if (!v6) {
    return;
  }
  if (!*(void *)(a1 + 40))
  {
    uint64_t v10 = v6;
LABEL_52:
    if (!atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    return;
  }
  xpc_object_t v7 = *a2;
  uint64_t v8 = MEMORY[0x1E4F14590];
  if (v7 && MEMORY[0x1C878FBE0](v7) == v8)
  {
    xpc_retain(v7);
  }
  else
  {
    xpc_object_t v7 = xpc_null_create();
    if (!v7)
    {
      xpc_object_t v7 = xpc_null_create();
      long long v9 = 0;
      goto LABEL_11;
    }
  }
  xpc_retain(v7);
  long long v9 = v7;
LABEL_11:
  *(void *)dispatch_object_t v34 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableDictionaryRef v12 = Mutable;
  if (Mutable) {
    *(void *)dispatch_object_t v34 = Mutable;
  }
  if (MEMORY[0x1C878FBE0](v7) != v8)
  {
    int v13 = -534716416;
    if (!v12) {
      goto LABEL_32;
    }
    goto LABEL_29;
  }
  xpc_object_t value = (ctu *)xpc_dictionary_get_value(v7, (const char *)kKeyCommandData);
  ctu::xpc_to_cf((uint64_t *)&cf, value, v15);
  long long v16 = (void *)cf;
  if (cf)
  {
    CFTypeID v17 = CFGetTypeID(cf);
    if (v17 != CFDictionaryGetTypeID())
    {
      long long v16 = 0;
      *(void *)dispatch_object_t v34 = 0;
      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
    CFRetain(v16);
  }
  *(void *)dispatch_object_t v34 = v16;
  if (v12) {
LABEL_22:
  }
    CFRelease(v12);
LABEL_23:
  if (cf) {
    CFRelease(cf);
  }
  xpc_object_t v18 = xpc_dictionary_get_value(v7, (const char *)kKeyCommandResult);
  CFTypeRef cf = v18;
  if (v18) {
    xpc_retain(v18);
  }
  else {
    CFTypeRef cf = xpc_null_create();
  }
  int v13 = xpc::dyn_cast_or_default();
  xpc_release((xpc_object_t)cf);
  CFMutableDictionaryRef v12 = (CFMutableDictionaryRef)v16;
  if (!v16)
  {
LABEL_32:
    CFMutableDictionaryRef v31 = 0;
    uint64_t v20 = *(const void **)v34;
    if (!*(void *)v34) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_29:
  CFTypeID v19 = CFGetTypeID(v12);
  if (v19 != CFDictionaryGetTypeID()) {
    goto LABEL_32;
  }
  CFMutableDictionaryRef v31 = v12;
  CFRetain(v12);
  uint64_t v20 = *(const void **)v34;
  if (*(void *)v34) {
LABEL_33:
  }
    CFRelease(v20);
LABEL_34:
  xpc_release(v7);
  uint64_t v21 = *(NSObject **)(v5 + 112);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v13)
  {
    if (v22)
    {
      uint64_t v23 = (void *)(a1 + 56);
      if (*(char *)(a1 + 79) < 0) {
        uint64_t v23 = (void *)*v23;
      }
      *(_DWORD *)dispatch_object_t v34 = 136315394;
      *(void *)&v34[4] = v23;
      __int16 v35 = 1024;
      int v36 = v13;
      std::string v24 = "#D Failure: %s Error: 0x%x";
      uint64_t v25 = v21;
      uint32_t v26 = 18;
      goto LABEL_45;
    }
  }
  else if (v22)
  {
    size_t v30 = (void *)(a1 + 56);
    if (*(char *)(a1 + 79) < 0) {
      size_t v30 = (void *)*v30;
    }
    *(_DWORD *)dispatch_object_t v34 = 136315138;
    *(void *)&v34[4] = v30;
    std::string v24 = "#D Successful: %s";
    uint64_t v25 = v21;
    uint32_t v26 = 12;
LABEL_45:
    _os_log_debug_impl(&dword_1C5737000, v25, OS_LOG_TYPE_DEBUG, v24, v34, v26);
    uint64_t v27 = *(uint64_t **)(a1 + 80);
    CFMutableDictionaryRef v28 = v31;
    if (!v31) {
      goto LABEL_46;
    }
LABEL_41:
    CFRetain(v28);
    uint64_t v29 = *v27;
    *(void *)dispatch_object_t v34 = v28;
    CFRetain(v28);
    goto LABEL_47;
  }
  uint64_t v27 = *(uint64_t **)(a1 + 80);
  CFMutableDictionaryRef v28 = v31;
  if (v31) {
    goto LABEL_41;
  }
LABEL_46:
  uint64_t v29 = *v27;
  *(void *)dispatch_object_t v34 = 0;
LABEL_47:
  abm::client::Command::State::notify(v29, v13, (CFTypeRef *)v34);
  if (*(void *)v34) {
    CFRelease(*(CFTypeRef *)v34);
  }
  if (v28)
  {
    CFRelease(v28);
    CFRelease(v28);
  }
  xpc_release(v9);
  uint64_t v10 = v32;
  if (v32) {
    goto LABEL_52;
  }
}

void sub_1C5758FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, xpc_object_t object,char a21)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void __copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(void *a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 48);
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = (std::string *)(a1 + 7);
  if (*(char *)(a2 + 79) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    long long v6 = *(_OWORD *)(a2 + 56);
    a1[9] = *(void *)(a2 + 72);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  uint64_t v7 = *(void *)(a2 + 88);
  a1[10] = *(void *)(a2 + 80);
  a1[11] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
}

void sub_1C5759148(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 48);
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  _Unwind_Resume(exception_object);
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c66_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 88);
  if (!v2 || atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((*(char *)(a1 + 79) & 0x80000000) == 0) {
      goto LABEL_4;
    }
LABEL_9:
    operator delete(*(void **)(a1 + 56));
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
    goto LABEL_5;
  }
  ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
  std::__shared_weak_count::__release_weak(v2);
  if (*(char *)(a1 + 79) < 0) {
    goto LABEL_9;
  }
LABEL_4:
  uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v3) {
    return;
  }
LABEL_5:
  std::__shared_weak_count::__release_weak(v3);
}

void *__copy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(void *result, void *a2)
{
  uint64_t v2 = a2[6];
  result[5] = a2[5];
  result[6] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  uint64_t v3 = a2[8];
  result[7] = a2[7];
  result[8] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c39_ZTSNSt3__18weak_ptrIN3ctu9XpcClientEEE56c47_ZTSNSt3__110shared_ptrIN3abm6client7CommandEEE(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
  }
  else
  {
    uint64_t v3 = *(std::__shared_weak_count **)(a1 + 48);
    if (!v3) {
      return;
    }
  }
  std::__shared_weak_count::__release_weak(v3);
}

void ___ZN3abm6client9Transport5State10gateServerIU13block_pointerFvvEEEvT__block_invoke(uint64_t *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = std::__shared_weak_count::lock(v2);
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = a1[5];
      if (v5) {
        ctu::SharedSynchronizable<ctu::XpcClient>::execute_wrapped((uint64_t *)(v5 + 8), a1[4]);
      }
      if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
}

uint64_t ___ZN18ConnectionObserver4gateEN8dispatch5blockIU13block_pointerFvvEEE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *__copy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1, uint64_t a2)
{
  CFTypeRef result = *(void **)(a2 + 32);
  if (result) {
    CFTypeRef result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c43_ZTSN8dispatch5blockIU13block_pointerFvvEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void ___ZN3abm6client9Transport5State20send_with_reply_syncEN3xpc4dictEN8dispatch5blockIU13block_pointerFvNS3_6objectEEEE_block_invoke(uint64_t a1, xpc_object_t object)
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

void sub_1C5759464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c55_ZTSN8dispatch5blockIU13block_pointerFvN3xpc6objectEEEE(uint64_t a1, uint64_t a2)
{
  CFTypeRef result = *(void **)(a2 + 32);
  if (result) {
    CFTypeRef result = _Block_copy(result);
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

void ___ZN3abm6client9Transport5State9reconnectEv_block_invoke(uint64_t a1)
{
}

void ___ZN3abm6client9Transport5State7checkInEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (const void *)kCommandCheckIn;
  size_t v3 = strlen((const char *)kCommandCheckIn);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    xpc_object_t v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    unint64_t v12 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v12) = v3;
    xpc_object_t v5 = __dst;
    if (!v3) {
      goto LABEL_9;
    }
  }
  memmove(v5, v2, (size_t)v4);
LABEL_9:
  *((unsigned char *)v4 + (void)v5) = 0;
  CFTypeRef cf = 0;
  abm::client::Transport::State::createInternal_sync(&v13, v1, (uint64_t)__dst, 0, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v13);
  uint64_t v8 = v14;
  if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v9 = cf;
    if (!cf) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_12:
  }
    CFRelease(v9);
LABEL_13:
  if (SHIBYTE(v12) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_1C5759660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::createInternal_sync(void *a1, uint64_t a2, uint64_t a3, int a4, __CFDictionary **a5)
{
  CFTypeRef v35 = 0;
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  ctu::cf::convert_copy();
  CFMutableDictionaryRef Mutable = *a5;
  if (*a5) {
    unint64_t v12 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    unint64_t v12 = 0;
  }
  if (!v12)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v14 = *a5;
    if (Mutable)
    {
      *a5 = Mutable;
      if (v14)
      {
        CFRelease(v14);
        CFMutableDictionaryRef Mutable = *a5;
      }
    }
    else
    {
      CFMutableDictionaryRef Mutable = *a5;
    }
  }
  uint64_t v13 = (const __CFString **)kKeyClientName;
  if (*(char *)(a2 + 191) < 0) {
    std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)(a2 + 168), *(void *)(a2 + 176));
  }
  else {
    std::string v36 = *(std::string *)(a2 + 168);
  }
  ctu::cf::insert<char const*,std::string>(Mutable, v13, (uint64_t)&v36, (uint64_t)v9, v10);
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  *a1 = 0;
  a1[1] = 0;
  char v15 = *(std::__shared_weak_count **)(a2 + 16);
  if (!v15 || (v16 = *(void *)(a2 + 8), (CFTypeID v17 = std::__shared_weak_count::lock(v15)) == 0)) {
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  xpc_object_t v18 = v17;
  p_shared_weak_owners = &v17->__shared_weak_owners_;
  atomic_fetch_add_explicit(&v17->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v18);
  }
  v36.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAAAALL;
  v36.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3abm6client9Transport5State19createInternal_syncENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEENS0_15TransportStatusEN3ctu2cf11CFSharedRefI14__CFDictionaryEE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_40;
  aBlock[4] = a2;
  aBlock[5] = v16;
  uint64_t v33 = v18;
  atomic_fetch_add_explicit(p_shared_weak_owners, 1uLL, memory_order_relaxed);
  int v34 = a4;
  uint64_t v20 = _Block_copy(aBlock);
  uint64_t v21 = *(NSObject **)(a2 + 24);
  if (v21) {
    dispatch_retain(*(dispatch_object_t *)(a2 + 24));
  }
  v36.__r_.__value_.__r.__words[0] = (std::string::size_type)v20;
  v36.__r_.__value_.__l.__size_ = (std::string::size_type)v21;
  if (!v20)
  {
    uint64_t v29 = 0;
    dispatch_object_t object = v21;
    if (!v21) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  uint64_t v29 = _Block_copy(v20);
  dispatch_object_t object = v21;
  if (v21) {
LABEL_21:
  }
    dispatch_retain(v21);
LABEL_22:
  BOOL v22 = *a5;
  if (v22 && (CFTypeID v23 = CFGetTypeID(v22), v23 == CFDictionaryGetTypeID()))
  {
    CFTypeRef cf = v22;
    CFRetain(v22);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  abm::client::Command::create((uint64_t)&v29, (ctu **)&cf, &v31);
  long long v24 = v31;
  long long v31 = 0uLL;
  uint64_t v25 = (std::__shared_weak_count *)a1[1];
  *(_OWORD *)a1 = v24;
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  uint32_t v26 = (std::__shared_weak_count *)*((void *)&v31 + 1);
  if (!*((void *)&v31 + 1)
    || atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v31 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v27 = cf;
    if (!cf) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
  ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
  std::__shared_weak_count::__release_weak(v26);
  CFTypeRef v27 = cf;
  if (cf) {
LABEL_32:
  }
    CFRelease(v27);
LABEL_33:
  if (object) {
    dispatch_release(object);
  }
  if (v29) {
    _Block_release(v29);
  }
  CFRelease(v35);
  if (v36.__r_.__value_.__l.__size_) {
    dispatch_release((dispatch_object_t)v36.__r_.__value_.__l.__size_);
  }
  if (v36.__r_.__value_.__r.__words[0]) {
    _Block_release(v36.__r_.__value_.__l.__data_);
  }
  if (v33) {
    std::__shared_weak_count::__release_weak(v33);
  }
  std::__shared_weak_count::__release_weak(v18);
}

void sub_1C5759A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,std::__shared_weak_count *a25)
{
  dispatch::callback<void({block_pointer})(int,ctu::cf::CFSharedRef<__CFDictionary const>)>::~callback(v27 - 96);
  if (a25) {
    std::__shared_weak_count::__release_weak(a25);
  }
  std::__shared_weak_count::__release_weak(v26);
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v25);
  _Unwind_Resume(a1);
}

void sub_1C5759AB4(_Unwind_Exception *a1)
{
  std::shared_ptr<ctu::LogServer>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State19createInternal_syncENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEENS0_15TransportStatusEN3ctu2cf11CFSharedRefI14__CFDictionaryEE_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (v2)
  {
    size_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      xpc_object_t v5 = v4;
      if (!*(void *)(a1 + 40) || (uint64_t v6 = (const void *)v3[24]) == 0 || !v3[25])
      {
LABEL_16:
        if (!atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
        return;
      }
      uint64_t v7 = v3[14];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        switch(*(_DWORD *)(a1 + 56))
        {
          case 0:
            HIBYTE(v14) = 9;
            WORD4(__p) = 110;
            unint64_t v12 = "CheckedIn";
            goto LABEL_25;
          case 1:
            HIBYTE(v14) = 10;
            strcpy((char *)&__p, "CheckedOut");
            break;
          case 2:
            HIBYTE(v14) = 8;
            strcpy((char *)&__p, "EventsOn");
            break;
          case 3:
            HIBYTE(v14) = 9;
            WORD4(__p) = 102;
            unint64_t v12 = "EventsOff";
LABEL_25:
            *(void *)&long long __p = *(void *)v12;
            break;
          case 4:
            HIBYTE(v14) = 5;
            strcpy((char *)&__p, "Error");
            break;
          default:
            HIBYTE(v14) = 0;
            LOBYTE(__p) = 0;
            break;
        }
        *(_DWORD *)long long buf = 136315138;
        p_p = &__p;
        _os_log_debug_impl(&dword_1C5737000, v7, OS_LOG_TYPE_DEBUG, "#D %s", buf, 0xCu);
        if (SHIBYTE(v14) < 0) {
          operator delete((void *)__p);
        }
        uint64_t v6 = (const void *)v3[24];
        int v8 = *(_DWORD *)(a1 + 56);
        if (!v6)
        {
          CFAllocatorRef v9 = 0;
          goto LABEL_9;
        }
      }
      else
      {
        int v8 = *(_DWORD *)(a1 + 56);
      }
      CFAllocatorRef v9 = _Block_copy(v6);
LABEL_9:
      CFAllocatorRef v10 = v3[25];
      *(void *)&long long __p = MEMORY[0x1E4F143A8];
      *((void *)&__p + 1) = 1174405120;
      uint64_t v14 = ___ZNK8dispatch8callbackIU13block_pointerFvN3abm6client15TransportStatusEEEclIJS3_EEEvDpT__block_invoke;
      char v15 = &__block_descriptor_tmp_9;
      if (v9) {
        uint64_t v11 = _Block_copy(v9);
      }
      else {
        uint64_t v11 = 0;
      }
      long long aBlock = v11;
      int v17 = v8;
      dispatch_async(v10, &__p);
      if (aBlock) {
        _Block_release(aBlock);
      }
      if (v9) {
        _Block_release(v9);
      }
      goto LABEL_16;
    }
  }
}

void sub_1C5759D84(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State8checkOutEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (const void *)kCommandCheckOut;
  size_t v3 = strlen((const char *)kCommandCheckOut);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v6 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v6 = v3 | 7;
    }
    uint64_t v7 = v6 + 1;
    xpc_object_t v5 = (void **)operator new(v6 + 1);
    __dst[1] = v4;
    unint64_t v12 = v7 | 0x8000000000000000;
    __dst[0] = v5;
  }
  else
  {
    HIBYTE(v12) = v3;
    xpc_object_t v5 = __dst;
    if (!v3) {
      goto LABEL_9;
    }
  }
  memmove(v5, v2, (size_t)v4);
LABEL_9:
  *((unsigned char *)v4 + (void)v5) = 0;
  CFTypeRef cf = 0;
  abm::client::Transport::State::createInternal_sync(&v13, v1, (uint64_t)__dst, 1, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v13);
  int v8 = v14;
  if (!v14 || atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    CFTypeRef v9 = cf;
    if (!cf) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
  std::__shared_weak_count::__release_weak(v8);
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_12:
  }
    CFRelease(v9);
LABEL_13:
  if (SHIBYTE(v12) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_1C5759F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State15setEventHandlerENSt3__112basic_stringIcNS3_11char_traitsIcEENS3_9allocatorIcEEEEN8dispatch8callbackIU13block_pointerFvNS3_10shared_ptrINS0_5EventEEEEEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(char *)(a1 + 63) < 0)
  {
    std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(a1 + 40), *(void *)(a1 + 48));
    size_t v3 = *(const void **)(a1 + 64);
    if (v3)
    {
LABEL_3:
      uint64_t v4 = _Block_copy(v3);
      xpc_object_t v5 = *(NSObject **)(a1 + 72);
      dispatch_object_t object = v5;
      if (!v5) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else
  {
    std::string v32 = *(std::string *)(a1 + 40);
    size_t v3 = *(const void **)(a1 + 64);
    if (v3) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  xpc_object_t v5 = *(NSObject **)(a1 + 72);
  dispatch_object_t object = v5;
  if (v5) {
LABEL_4:
  }
    dispatch_retain(v5);
LABEL_5:
  int v6 = SHIBYTE(v32.__r_.__value_.__r.__words[2]);
  std::string::size_type size = v32.__r_.__value_.__l.__size_;
  if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v8 = HIBYTE(v32.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v8 = v32.__r_.__value_.__l.__size_;
  }
  if (v8) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (!v5)
    {
LABEL_57:
      _Block_release(v4);
      goto LABEL_58;
    }
    CFAllocatorRef v10 = *(uint64_t ***)(v2 + 208);
    unint64_t v12 = v10 + 1;
    uint64_t v11 = v10[1];
    if (v11)
    {
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v13 = &v32;
      }
      else {
        uint64_t v13 = (std::string *)v32.__r_.__value_.__r.__words[0];
      }
      while (1)
      {
        uint64_t v14 = v11;
        int v17 = (const void *)v11[4];
        char v15 = v11 + 4;
        uint64_t v16 = v17;
        int v18 = *((char *)v15 + 23);
        if (v18 >= 0) {
          CFTypeID v19 = v15;
        }
        else {
          CFTypeID v19 = v16;
        }
        if (v18 >= 0) {
          size_t v20 = *((unsigned __int8 *)v15 + 23);
        }
        else {
          size_t v20 = v15[1];
        }
        if (v20 >= v8) {
          size_t v21 = v8;
        }
        else {
          size_t v21 = v20;
        }
        int v22 = memcmp(v13, v19, v21);
        if (v22)
        {
          if (v22 < 0) {
            goto LABEL_17;
          }
LABEL_31:
          int v23 = memcmp(v19, v13, v21);
          if (v23)
          {
            if ((v23 & 0x80000000) == 0) {
              goto LABEL_47;
            }
          }
          else if (v20 >= v8)
          {
LABEL_47:
            long long v24 = v14;
            goto LABEL_48;
          }
          uint64_t v11 = (uint64_t *)v14[1];
          if (!v11)
          {
            unint64_t v12 = (uint64_t **)(v14 + 1);
            goto LABEL_41;
          }
        }
        else
        {
          if (v8 >= v20) {
            goto LABEL_31;
          }
LABEL_17:
          uint64_t v11 = (uint64_t *)*v14;
          unint64_t v12 = (uint64_t **)v14;
          if (!*v14) {
            goto LABEL_41;
          }
        }
      }
    }
    uint64_t v14 = (uint64_t *)(v10 + 1);
LABEL_41:
    long long v24 = operator new(0x48uLL);
    uint64_t v25 = (std::string *)(v24 + 4);
    if (v6 < 0)
    {
      std::string::__init_copy_ctor_external(v25, v32.__r_.__value_.__l.__data_, size);
    }
    else
    {
      *(_OWORD *)&v25->__r_.__value_.__l.__data_ = *(_OWORD *)&v32.__r_.__value_.__l.__data_;
      v24[6] = *((void *)&v32.__r_.__value_.__l + 2);
    }
    v24[7] = 0;
    v24[8] = 0;
    *long long v24 = 0;
    v24[1] = 0;
    void v24[2] = v14;
    *unint64_t v12 = v24;
    uint32_t v26 = (uint64_t *)**v10;
    uint64_t v27 = v24;
    if (v26)
    {
      *CFAllocatorRef v10 = v26;
      uint64_t v27 = *v12;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v10[1], v27);
    v10[2] = (uint64_t *)((char *)v10[2] + 1);
LABEL_48:
    CFMutableDictionaryRef v28 = _Block_copy(v4);
    uint64_t v29 = (const void *)v24[7];
    v24[7] = v28;
    if (v29) {
      _Block_release(v29);
    }
    xpc_object_t v5 = object;
    if (object) {
      dispatch_retain(object);
    }
    size_t v30 = v24[8];
    v24[8] = object;
    if (v30) {
      dispatch_release(v30);
    }
  }
  if (v5) {
    dispatch_release(v5);
  }
  if (v4) {
    goto LABEL_57;
  }
LABEL_58:
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
}

void sub_1C575A1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  operator delete(v16);
  dispatch::callback<void({block_pointer})(std::shared_ptr<abm::client::Event>)>::~callback((uint64_t)&a9);
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State8eventsOnEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (const void *)kCommandEventsOn;
  size_t v3 = strlen((const char *)kCommandEventsOn);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v10 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v10 = v3 | 7;
    }
    uint64_t v11 = v10 + 1;
    xpc_object_t v5 = (void **)operator new(v10 + 1);
    __dst[1] = v4;
    unint64_t v15 = v11 | 0x8000000000000000;
    __dst[0] = v5;
LABEL_17:
    memmove(v5, v2, (size_t)v4);
    *((unsigned char *)v4 + (void)v5) = 0;
    uint64_t v6 = *(void *)(v1 + 208);
    uint64_t v7 = *(std::__shared_weak_count **)(v1 + 216);
    unint64_t v12 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  HIBYTE(v15) = v3;
  xpc_object_t v5 = __dst;
  if (v3) {
    goto LABEL_17;
  }
  LOBYTE(__dst[0]) = 0;
  uint64_t v6 = *(void *)(v1 + 208);
  uint64_t v7 = *(std::__shared_weak_count **)(v1 + 216);
  unint64_t v12 = v7;
  if (v7) {
LABEL_5:
  }
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_6:
  abm::client::Transport::State::convert_sync((CFMutableDictionaryRef *)&cf, v1, *(void *)(v6 + 16));
  abm::client::Transport::State::createInternal_sync(&v16, v1, (uint64_t)__dst, 2, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v16);
  std::string::size_type v8 = v17;
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    CFTypeRef v9 = cf;
    if (!cf) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v9);
LABEL_10:
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0) {
      return;
    }
LABEL_22:
    operator delete(__dst[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  if (SHIBYTE(v15) < 0) {
    goto LABEL_22;
  }
}

void sub_1C575A3FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void abm::client::Transport::State::convert_sync(CFMutableDictionaryRef *a1, uint64_t a2, uint64_t a3)
{
  *a1 = 0;
  if (!a3) {
    return;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  uint64_t v7 = Mutable;
  if (Mutable) {
    *a1 = Mutable;
  }
  CFTypeRef v9 = CFArrayCreateMutable(v5, 0, MEMORY[0x1E4F1D510]);
  uint64_t v10 = *(void **)(a2 + 208);
  uint64_t v11 = (void *)*v10;
  if ((void *)*v10 != v10 + 1)
  {
    do
    {
      if (*((char *)v11 + 55) < 0) {
        std::string::__init_copy_ctor_external(&cf, (const std::string::value_type *)v11[4], v11[5]);
      }
      else {
        std::string cf = *(std::string *)(v11 + 4);
      }
      xpc_object_t value = 0;
      ctu::cf::convert_copy();
      uint64_t v13 = value;
      int v18 = value;
      if (value)
      {
        CFArrayAppendValue(v9, value);
        CFRelease(v13);
      }
      if (SHIBYTE(cf.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(cf.__r_.__value_.__l.__data_);
        uint64_t v14 = (void *)v11[1];
        if (v14)
        {
          do
          {
LABEL_24:
            unint64_t v15 = v14;
            uint64_t v14 = (void *)*v14;
          }
          while (v14);
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v14 = (void *)v11[1];
        if (v14) {
          goto LABEL_24;
        }
      }
      do
      {
        unint64_t v15 = (void *)v11[2];
        BOOL v16 = *v15 == (void)v11;
        uint64_t v11 = v15;
      }
      while (!v16);
LABEL_14:
      uint64_t v11 = v15;
    }
    while (v15 != (void *)(*(void *)(a2 + 208) + 8));
  }
  cf.__r_.__value_.__r.__words[0] = 0;
  ctu::cf::convert_copy((ctu::cf *)&cf, (const __CFString **)kKeyEventsList, (const char *)0x8000100, (uint64_t)v5, v8);
  unint64_t v12 = (const void *)cf.__r_.__value_.__r.__words[0];
  xpc_object_t value = (void *)cf.__r_.__value_.__r.__words[0];
  cf.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
  if (v9)
  {
    CFRetain(v9);
    if (v12) {
      CFDictionaryAddValue(v7, v12, v9);
    }
    CFRelease(v9);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v9) {
    CFRelease(v9);
  }
}

void sub_1C575A628(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v4 = va_arg(va1, const void *);
  va_copy(va2, va1);
  uint64_t v6 = va_arg(va2, const void *);
  uint64_t v8 = va_arg(va2, void);
  uint64_t v9 = va_arg(va2, void);
  uint64_t v10 = va_arg(va2, void);
  uint64_t v11 = va_arg(va2, void);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va1);
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef((const void **)va2);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v2);
  _Unwind_Resume(a1);
}

void sub_1C575A668(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef((const void **)va);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v2);
  _Unwind_Resume(a1);
}

void sub_1C575A6A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, const void *a18)
{
  ctu::cf::ConvertToCFTypeRef::~ConvertToCFTypeRef(&a18);
  if (a16 < 0) {
    operator delete(__p);
  }
  ctu::cf::CFSharedRef<__CFArray>::~CFSharedRef(&a10);
  ctu::cf::CFSharedRef<__CFDictionary>::~CFSharedRef(v18);
  _Unwind_Resume(a1);
}

void ___ZN3abm6client9Transport5State9eventsOffEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (const void *)kCommandEventsOff;
  size_t v3 = strlen((const char *)kCommandEventsOff);
  if (v3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  uint64_t v4 = (void *)v3;
  if (v3 >= 0x17)
  {
    uint64_t v10 = (v3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3 | 7) != 0x17) {
      uint64_t v10 = v3 | 7;
    }
    uint64_t v11 = v10 + 1;
    CFAllocatorRef v5 = (void **)operator new(v10 + 1);
    __dst[1] = v4;
    unint64_t v15 = v11 | 0x8000000000000000;
    __dst[0] = v5;
LABEL_17:
    memmove(v5, v2, (size_t)v4);
    *((unsigned char *)v4 + (void)v5) = 0;
    uint64_t v6 = *(void *)(v1 + 208);
    uint64_t v7 = *(std::__shared_weak_count **)(v1 + 216);
    unint64_t v12 = v7;
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  HIBYTE(v15) = v3;
  CFAllocatorRef v5 = __dst;
  if (v3) {
    goto LABEL_17;
  }
  LOBYTE(__dst[0]) = 0;
  uint64_t v6 = *(void *)(v1 + 208);
  uint64_t v7 = *(std::__shared_weak_count **)(v1 + 216);
  unint64_t v12 = v7;
  if (v7) {
LABEL_5:
  }
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_6:
  abm::client::Transport::State::convert_sync((CFMutableDictionaryRef *)&cf, v1, *(void *)(v6 + 16));
  abm::client::Transport::State::createInternal_sync(&v16, v1, (uint64_t)__dst, 3, (__CFDictionary **)&cf);
  abm::client::Transport::State::perform_sync(v1, &v16);
  uint64_t v8 = v17;
  if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    CFTypeRef v9 = cf;
    if (!cf) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  CFTypeRef v9 = cf;
  if (cf) {
LABEL_9:
  }
    CFRelease(v9);
LABEL_10:
  if (!v12 || atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0) {
      return;
    }
LABEL_22:
    operator delete(__dst[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  if (SHIBYTE(v15) < 0) {
    goto LABEL_22;
  }
}

void sub_1C575A8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, const void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<abm::client::Transport *,std::shared_ptr<abm::client::Transport>::__shared_ptr_default_delete<abm::client::Transport,abm::client::Transport>,std::allocator<abm::client::Transport>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<abm::client::Transport *,std::shared_ptr<abm::client::Transport>::__shared_ptr_default_delete<abm::client::Transport,abm::client::Transport>,std::allocator<abm::client::Transport>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count ***)(a1 + 24);
  if (v1)
  {
    uint64_t v2 = v1[1];
    if (v2 && !atomic_fetch_add(&v2->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      size_t v3 = v1;
    }
    else
    {
      size_t v3 = v1;
    }
    operator delete(v3);
  }
}

uint64_t std::__shared_ptr_pointer<abm::client::Transport *,std::shared_ptr<abm::client::Transport>::__shared_ptr_default_delete<abm::client::Transport,abm::client::Transport>,std::allocator<abm::client::Transport>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001C5765D58) {
    return a1 + 24;
  }
  if (((v3 & 0x80000001C5765D58 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x80000001C5765D58)) {
    return 0;
  }
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001C5765D58 & 0x7FFFFFFFFFFFFFFFLL))) {
    return a1 + 24;
  }
  return 0;
}

double abm::Overrides::Overrides(abm::Overrides *this)
{
  *((unsigned char *)this + 48) = 0;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

{
  double result;

  *((unsigned char *)this + 48) = 0;
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void abm::InitServer(abm *this, const char *a2, const abm::Overrides *a3)
{
  if (qword_1EB506AE0 == -1)
  {
    uint64_t v5 = qword_1EB506AD8;
    if (qword_1EB506AD8) {
      goto LABEL_3;
    }
  }
  else
  {
    dispatch_once(&qword_1EB506AE0, &__block_literal_global_0);
    uint64_t v5 = qword_1EB506AD8;
    if (qword_1EB506AD8)
    {
LABEL_3:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 0x40000000;
      block[2] = ___ZN3abm10InitServerEPKcRKNS_9OverridesE_block_invoke;
      block[3] = &__block_descriptor_tmp_2;
      void block[4] = v5;
      void block[5] = this;
      void block[6] = a2;
      if (_MergedGlobals_1 != -1) {
        dispatch_once(&_MergedGlobals_1, block);
      }
      return;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_1C5737000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed on loading BasebandManager library for initializing server", v6, 2u);
  }
}

void ___ZN3abm10InitServerEPKcRKNS_9OverridesE_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506A88, memory_order_acquire) & 1) == 0)
  {
    uint64_t v4 = a1;
    int v5 = __cxa_guard_acquire(&qword_1EB506A88);
    a1 = v4;
    if (v5)
    {
      off_1EB506A80 = dlsym(*(void **)(v4 + 32), "AppleBasebandManagerInitServer");
      __cxa_guard_release(&qword_1EB506A88);
      a1 = v4;
    }
  }
  uint64_t v1 = (void (*)(uint64_t, uint64_t))off_1EB506A80;
  if (off_1EB506A80)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 40);
    v1(v3, v2);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_error_impl(&dword_1C5737000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed on loading AppleBasebandManagerInitServer", v6, 2u);
  }
}

void sub_1C575AE14(_Unwind_Exception *a1)
{
}

uint64_t abm::StartServer(abm *this, dispatch_group_s *a2)
{
  if (qword_1EB506AE0 != -1)
  {
    dispatch_once(&qword_1EB506AE0, &__block_literal_global_0);
    uint64_t v3 = qword_1EB506AD8;
    if (qword_1EB506AD8) {
      goto LABEL_3;
    }
LABEL_12:
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    uint64_t v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Failed on loading BasebandManager library for starting service";
    uint64_t v8 = buf;
    goto LABEL_14;
  }
  uint64_t v3 = qword_1EB506AD8;
  if (!qword_1EB506AD8) {
    goto LABEL_12;
  }
LABEL_3:
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506A98, memory_order_acquire) & 1) == 0)
  {
    __handle = (void *)v3;
    if (__cxa_guard_acquire(&qword_1EB506A98))
    {
      off_1EB506A90 = dlsym(__handle, "AppleBasebandManagerStartServer");
      __cxa_guard_release(&qword_1EB506A98);
    }
  }
  uint64_t v4 = (uint64_t (*)(abm *))off_1EB506A90;
  if (!off_1EB506A90)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    __int16 v11 = 0;
    uint64_t v6 = MEMORY[0x1E4F14500];
    uint64_t v7 = "Failed on loading AppleBasebandManagerStartServer";
    uint64_t v8 = (uint8_t *)&v11;
LABEL_14:
    _os_log_error_impl(&dword_1C5737000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    return 0;
  }
  return v4(this);
}

void sub_1C575AFA0(_Unwind_Exception *a1)
{
}

uint64_t abm::StopServer(abm *this, dispatch_group_s *a2)
{
  if (qword_1EB506AE0 != -1)
  {
    dispatch_once(&qword_1EB506AE0, &__block_literal_global_0);
    uint64_t v3 = qword_1EB506AD8;
    if (qword_1EB506AD8) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v3 = qword_1EB506AD8;
  if (!qword_1EB506AD8) {
    return 0;
  }
LABEL_3:
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506AA8, memory_order_acquire) & 1) == 0)
  {
    __handle = (void *)v3;
    if (__cxa_guard_acquire(&qword_1EB506AA8))
    {
      off_1EB506AA0 = dlsym(__handle, "AppleBasebandManagerStopServer");
      __cxa_guard_release(&qword_1EB506AA8);
    }
  }
  uint64_t v4 = (uint64_t (*)(abm *))off_1EB506AA0;
  if (!off_1EB506AA0) {
    return 0;
  }
  return v4(this);
}

void sub_1C575B0A0(_Unwind_Exception *a1)
{
}

uint64_t abm::ShutdownServer(abm *this, dispatch_group_s *a2)
{
  if (qword_1EB506AE0 != -1)
  {
    dispatch_once(&qword_1EB506AE0, &__block_literal_global_0);
    uint64_t v3 = qword_1EB506AD8;
    if (qword_1EB506AD8) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v3 = qword_1EB506AD8;
  if (!qword_1EB506AD8) {
    return 0;
  }
LABEL_3:
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506AB8, memory_order_acquire) & 1) == 0)
  {
    __handle = (void *)v3;
    if (__cxa_guard_acquire(&qword_1EB506AB8))
    {
      off_1EB506AB0 = dlsym(__handle, "AppleBasebandManagerShutdownServer");
      __cxa_guard_release(&qword_1EB506AB8);
    }
  }
  uint64_t v4 = (uint64_t (*)(abm *))off_1EB506AB0;
  if (!off_1EB506AB0) {
    return 0;
  }
  return v4(this);
}

void sub_1C575B1A0(_Unwind_Exception *a1)
{
}

uint64_t abm::GetProfile(abm *this)
{
  if (qword_1EB506AE0 == -1)
  {
    uint64_t v1 = qword_1EB506AD8;
    if (!qword_1EB506AD8) {
      return abm::GetProfile(void)::sProfile;
    }
  }
  else
  {
    dispatch_once(&qword_1EB506AE0, &__block_literal_global_0);
    uint64_t v1 = qword_1EB506AD8;
    if (!qword_1EB506AD8) {
      return abm::GetProfile(void)::sProfile;
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = ___ZN3abm10GetProfileEv_block_invoke;
  block[3] = &__block_descriptor_tmp_11;
  void block[4] = v1;
  if (qword_1EB506AC0 == -1) {
    return abm::GetProfile(void)::sProfile;
  }
  dispatch_once(&qword_1EB506AC0, block);
  return abm::GetProfile(void)::sProfile;
}

void ___ZN3abm10GetProfileEv_block_invoke(uint64_t a1)
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1EB506AD0, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_1EB506AD0))
  {
    off_1EB506AC8 = (uint64_t (*)(void))dlsym(*(void **)(a1 + 32), "AppleBasebandManagerGetProfile");
    __cxa_guard_release(&qword_1EB506AD0);
  }
  if (off_1EB506AC8) {
    abm::GetProfile(void)::sProfile = off_1EB506AC8();
  }
}

void sub_1C575B31C(_Unwind_Exception *a1)
{
}

void *___ZN3abmL11loadLibraryEv_block_invoke(capabilities::radio *a1)
{
  double result = (void *)capabilities::radio::vendor(a1);
  if ((result - 1) <= 2)
  {
    double result = dlopen(off_1E6514350[(int)result - 1], 1);
    qword_1EB506AD8 = (uint64_t)result;
  }
  return result;
}

void abm::client::CreateManager(dispatch_object_t object@<X1>, uint64_t a2@<X0>, std::__shared_weak_count_vtbl ***a3@<X8>)
{
  dispatch_object_t objecta = object;
  if (object) {
    dispatch_retain(object);
  }
  abm::client::Manager::create(a2, &objecta, a3);
  if (objecta) {
    dispatch_release(objecta);
  }
}

void sub_1C575B3CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object)
{
  if (object) {
    dispatch_release(object);
  }
  _Unwind_Resume(exception_object);
}

void abm::client::RegisterEventHandler(uint64_t **a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *a1;
  if (v3) {
    abm::client::Manager::setEventHandler(v3, a2, a3);
  }
}

void abm::client::PerformCommand(uint64_t **a1@<X0>, void *a2@<X2>, void *a3@<X3>, uint64_t a4@<X8>)
{
  if (*a1)
  {
    xpc_object_t v8 = xpc_null_create();
    CFTypeRef v9 = v8;
    if (a2)
    {
      xpc_retain(a2);
      xpc_release(v9);
    }
    else
    {
      a2 = v8;
    }
    xpc_object_t object = a2;
    xpc_object_t v16 = xpc_null_create();
    *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)a4 = v11;
    *(_OWORD *)(a4 + 16) = v11;
    unint64_t v12 = *a1;
    if (a2 && MEMORY[0x1C878FBE0](a2) == MEMORY[0x1E4F14590]) {
      xpc_retain(a2);
    }
    else {
      xpc_object_t object = xpc_null_create();
    }
    abm::client::Manager::perform(v12, &object, &v16, (_DWORD *)a4);
    xpc_release(object);
    xpc_object_t object = 0;
    if (!a3 || *(_DWORD *)a4)
    {
      xpc_object_t v13 = v16;
    }
    else
    {
      xpc_object_t v13 = xpc_null_create();
      xpc_object_t v14 = v16;
      xpc_object_t v16 = v13;
      *a3 = v14;
    }
    xpc_release(v13);
    xpc_release(a2);
  }
  else
  {
    uint64_t v10 = (char *)operator new(0x20uLL);
    strcpy(v10, "Invalid manager object passed");
    *(_DWORD *)a4 = -534716414;
    *(void *)(a4 + 8) = v10;
    *(_OWORD *)(a4 + 16) = xmmword_1C5764C70;
  }
}

void sub_1C575B560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t a9, xpc_object_t object)
{
  if (*(char *)(v11 + 31) < 0) {
    operator delete(*(void **)(v11 + 8));
  }
  xpc_release(object);
  xpc_release(v10);
  _Unwind_Resume(a1);
}

void ***abm::client::EventsOn(void ***result)
{
  if (*result) {
    return (void ***)MEMORY[0x1F4163B28](***result);
  }
  return result;
}

void ***abm::client::EventsOff(void ***result)
{
  if (*result) {
    return (void ***)MEMORY[0x1F4163B30](***result);
  }
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t TelephonyXPC::Client::setEventHandler()
{
  return MEMORY[0x1F4163B08]();
}

uint64_t TelephonyXPC::Client::create()
{
  return MEMORY[0x1F4163B10]();
}

uint64_t TelephonyXPC::Client::perform()
{
  return MEMORY[0x1F4163B18]();
}

uint64_t TelephonyXPC::Command::create()
{
  return MEMORY[0x1F4163B38]();
}

uint64_t capabilities::radio::ice(capabilities::radio *this)
{
  return MEMORY[0x1F417D5D0](this);
}

uint64_t capabilities::radio::vendor(capabilities::radio *this)
{
  return MEMORY[0x1F417D5D8](this);
}

uint64_t capabilities::radio::maverick(capabilities::radio *this)
{
  return MEMORY[0x1F417D5E8](this);
}

uint64_t ctu::LoggerBase<std::shared_ptr<ctu::LogServer>>::~LoggerBase()
{
  return MEMORY[0x1F417D958]();
}

uint64_t ctu::OsLogContext::OsLogContext()
{
  return MEMORY[0x1F417D988]();
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D990](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x1F417D998](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x1F417D9A8]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x1F417D9B0]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x1F417D9B8](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
}

uint64_t ctu::TrackedLogger::registerLoggerToServer()
{
  return MEMORY[0x1F417D9C8]();
}

uint64_t ctu::LoggerCommonBase::setLogLevel()
{
  return MEMORY[0x1F417DA48]();
}

uint64_t ctu::LoggerCommonBase::LoggerCommonBase()
{
  return MEMORY[0x1F417DA58]();
}

{
  return MEMORY[0x1F417DA60]();
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x1F417DA68]();
}

uint64_t ctu::cf::convert_copy(ctu::cf *this, const __CFString **a2, const char *a3, uint64_t a4, const __CFAllocator *a5)
{
  return MEMORY[0x1F417DAA0](this, a2, a3, a4, a5);
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1F417DAA8]();
}

uint64_t ctu::cf::dict_adapter::dict_adapter(ctu::cf::dict_adapter *this, const __CFDictionary *a2)
{
  return MEMORY[0x1F417DAB8](this, a2);
}

void ctu::cf::dict_adapter::~dict_adapter(ctu::cf::dict_adapter *this)
{
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x1F417DAF0]();
}

uint64_t ctu::LogServer::setEnabled(ctu::LogServer *this)
{
  return MEMORY[0x1F417DC00](this);
}

uint64_t ctu::LogServer::start(ctu::LogServer *this)
{
  return MEMORY[0x1F417DC18](this);
}

uint64_t ctu::LogServer::create()
{
  return MEMORY[0x1F417DC20]();
}

uint64_t ctu::LogServer::addWriter()
{
  return MEMORY[0x1F417DC28]();
}

uint64_t ctu::XpcClient::setServer_sync()
{
  return MEMORY[0x1F417DC30]();
}

uint64_t ctu::XpcClient::XpcClient()
{
  return MEMORY[0x1F417DC40]();
}

void ctu::XpcClient::~XpcClient(ctu::XpcClient *this)
{
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x1F417DC70](this, a2);
}

uint64_t ctu::xpc_to_cf(ctu *this, void *a2)
{
  return MEMORY[0x1F417DC78](this, a2);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1F417DCA8]();
}

{
  return MEMORY[0x1F417DCB0]();
}

{
  return MEMORY[0x1F417DCC0]();
}

{
  return MEMORY[0x1F417DCD0]();
}

{
  return MEMORY[0x1F417DCD8]();
}

{
  return MEMORY[0x1F417DCE8]();
}

uint64_t xpc::bridge()
{
  return MEMORY[0x1F417DCF8]();
}

uint64_t TelephonyXPC::Event::getData(TelephonyXPC::Event *this)
{
  return MEMORY[0x1F4163B40](this);
}

uint64_t ctu::LoggerCommonBase::getLogDomain(ctu::LoggerCommonBase *this)
{
  return MEMORY[0x1F417DD08](this);
}

uint64_t ctu::cf::map_adapter::getString()
{
  return MEMORY[0x1F417DD50]();
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x1F417DD78](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4D0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4E0](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1F417E5D0](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E898]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x1F417EA90](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_set_qos_class_floor(dispatch_object_t object, dispatch_qos_class_t qos_class, int relative_priority)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}