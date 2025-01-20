void sub_24B55AB74(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24C5D3F20](v1, 0x10B2C40D4E86D64);
  _Unwind_Resume(a1);
}

void sub_24B55ADA8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_24B55AE44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_24B55AFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24B55B6CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_24B55B758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_24B55BA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_24B55BC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

os_log_t ___ZL46_CLLogObjectForCategory_TilesFramework_Defaultv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.CoreLocationTiles", "TilesFramework");
  logObject_TilesFramework_Default = (uint64_t)result;
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  v5 = this;
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
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
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
  __cxa_throw(exception, (struct type_info *)off_2652DD4D0, MEMORY[0x263F8C060]);
}

void sub_24B55BDA0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  os_log_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void __clang_call_terminate(void *a1)
{
}

CLConnection *std::unique_ptr<CLConnection,CLConnectionDeleter>::reset[abi:ne180100](CLConnection **a1, CLConnection *a2)
{
  os_log_t result = *a1;
  *a1 = a2;
  if (result) {
    return (CLConnection *)CLConnection::deferredDelete(result);
  }
  return result;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void *std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[35],NSDictionary *&,void>@<X0>(char *a1@<X1>, void *a2@<X2>, void *a3@<X8>)
{
  std::string::size_type v6 = operator new(0x70uLL);
  os_log_t result = std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[35],NSDictionary *&,std::allocator<CLConnectionMessage>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_24B55BEEC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[35],NSDictionary *&,std::allocator<CLConnectionMessage>,0>(void *a1, char *a2, void *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26FE89E58;
  std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[35],NSDictionary *&,CLConnectionMessage*>((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_24B55BF48(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<CLConnectionMessage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FE89E58;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<CLConnectionMessage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FE89E58;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24C5D3F20);
}

void std::__shared_ptr_emplace<CLConnectionMessage>::__on_zero_shared()
{
}

uint64_t std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[35],NSDictionary *&,CLConnectionMessage*>(uint64_t a1, char *a2, void *a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  MEMORY[0x24C5D3E80](a1, __p, *a3);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_24B55C034(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[41],void>@<X0>(char *a1@<X1>, void *a2@<X8>)
{
  size_t v4 = operator new(0x70uLL);
  os_log_t result = std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[41],std::allocator<CLConnectionMessage>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_24B55C14C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<CLConnectionMessage>::__shared_ptr_emplace[abi:ne180100]<char const(&)[41],std::allocator<CLConnectionMessage>,0>(void *a1, char *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26FE89E58;
  std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[41],CLConnectionMessage*>((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_24B55C1A8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<CLConnectionMessage,char const(&)[41],CLConnectionMessage*>(uint64_t a1, char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  MEMORY[0x24C5D3E70](a1, __p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_24B55C20C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x270EFDB40]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x270EFDD60](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x270EFDD80](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x270EFDDE0](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t CLConnection::sendMessage()
{
  return MEMORY[0x270F47AC0]();
}

uint64_t CLConnection::deferredDelete(CLConnection *this)
{
  return MEMORY[0x270F47AD0](this);
}

uint64_t CLConnection::setInterruptionHandler()
{
  return MEMORY[0x270F47AD8]();
}

uint64_t CLConnection::setDisconnectionHandler()
{
  return MEMORY[0x270F47AE0]();
}

uint64_t CLConnection::setDefaultMessageHandler()
{
  return MEMORY[0x270F47AE8]();
}

uint64_t CLConnection::start(CLConnection *this)
{
  return MEMORY[0x270F47AF0](this);
}

uint64_t CLConnection::CLConnection()
{
  return MEMORY[0x270F47AF8]();
}

uint64_t CLConnectionMessage::CLConnectionMessage()
{
  return MEMORY[0x270F47B00]();
}

{
  return MEMORY[0x270F47B08]();
}

void CLConnectionMessage::~CLConnectionMessage(CLConnectionMessage *this)
{
}

uint64_t CLConnectionMessage::getObjectOfClass(CLConnectionMessage *this, objc_class *a2)
{
  return MEMORY[0x270F47B18](this, a2);
}

uint64_t CLConnectionMessage::getDictionaryOfClasses(CLConnectionMessage *this, NSSet *a2)
{
  return MEMORY[0x270F47B20](this, a2);
}

uint64_t CLConnectionMessage::name(CLConnectionMessage *this)
{
  return MEMORY[0x270F47B28](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
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

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
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

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x270ED8028](dso, description, activity, *(void *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x270EDBE40](name, targetq);
}

void xpc_release(xpc_object_t object)
{
}