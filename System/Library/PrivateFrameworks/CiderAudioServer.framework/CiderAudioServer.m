void anonymous namespace'::GetKernel(_anonymous_namespace_ *this)
{
  uint64_t vars8;

  {
  }
}

void sub_249BFDE48(_Unwind_Exception *a1)
{
}

void __clang_call_terminate(void *a1)
{
}

void sub_249BFDF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::pair<int,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_249BFE064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::pair<int,applesauce::CF::DataRef>::~pair(uint64_t a1)
{
  v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

void sub_249BFE160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
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
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26527D630, MEMORY[0x263F8C060]);
}

void sub_249BFE280(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_249BFE414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *applesauce::CF::DictionaryRef::DictionaryRef(applesauce::CF::DictionaryRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_249BFE4BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void sub_249BFE69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);

  _Unwind_Resume(a1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    CFTypeID v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_249BFE99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, const void *a11, const void *a12)
{
  _Unwind_Resume(a1);
}

void sub_249BFEC18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10, const void *a11, const void *a12)
{
  _Unwind_Resume(a1);
}

void sub_249BFF084(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, long long buf)
{
  if (a2)
  {

    if (a10) {
      std::__shared_weak_count::__release_shared[abi:ne180100](a10);
    }

    if (qword_26972E470) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)qword_26972E470);
    }
    v14 = (util *)__cxa_begin_catch(a1);
    util::server_log(v14);
    v15 = (id) util::server_log(void)::sLogCat;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315394;
      *(void *)((char *)&buf + 4) = "InCider.mm";
      WORD6(buf) = 1024;
      *(_DWORD *)((char *)&buf + 14) = 35;
      _os_log_impl(&dword_249BFC000, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Couldn't launch InCider service", (uint8_t *)&buf, 0x12u);
    }
    __cxa_end_catch();
    JUMPOUT(0x249BFF050);
  }
  _Unwind_Resume(a1);
}

void sub_249BFF348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249BFF5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }

  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_249BFF868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::optional<void({block_pointer} {__strong})(NSDictionary *)>::operator=[abi:ne180100]<void({block_pointer} {__strong}&)(NSDictionary *),void>(uint64_t a1, uint64_t a2)
{
  int v3 = *(unsigned __int8 *)(a1 + 8);
  uint64_t v4 = MEMORY[0x24C5B1DD0](a2);
  if (v3)
  {
    size_t v5 = *(void **)a1;
    *(void *)a1 = v4;
  }
  else
  {
    *(void *)a1 = v4;
    *(unsigned char *)(a1 + 8) = 1;
  }
  return a1;
}

void sub_249BFFA90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249BFFB34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_249BFFBE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_249BFFC8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_249C003A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_249C004B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_249C0057C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_249C00640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_249C00D30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_249C0144C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_249C01B80(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_249C01CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  applesauce::CF::ArrayRef::~ArrayRef((const void **)(v12 - 24));
  *(void *)(v12 - 24) = &a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v12 - 24));

  _Unwind_Resume(a1);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<std::string>(long long **a1)
{
  v1 = *a1;
  uint64_t v2 = a1[1];
  int64x2_t v33 = 0uLL;
  v34 = 0;
  if (v2 != v1)
  {
    unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v2 - (char *)v1) >> 3);
    if (v4 >> 61) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    v38 = &v34;
    size_t v5 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v4);
    uint64_t v7 = (void *)v33.i64[1];
    uint64_t v8 = (void *)v33.i64[0];
    if (v33.i64[1] == v33.i64[0])
    {
      int64x2_t v11 = vdupq_n_s64(v33.u64[1]);
      v9 = v5;
    }
    else
    {
      v9 = v5;
      do
      {
        uint64_t v10 = *--v7;
        *((void *)v9 - 1) = v10;
        v9 -= 8;
        *uint64_t v7 = 0;
      }
      while (v7 != v8);
      int64x2_t v11 = v33;
    }
    v33.i64[0] = (uint64_t)v9;
    v33.i64[1] = (uint64_t)v5;
    int64x2_t v36 = v11;
    uint64_t v12 = v34;
    v34 = &v5[8 * v6];
    unint64_t v37 = (unint64_t)v12;
    v35 = (void *)v11.i64[0];
    std::__split_buffer<applesauce::CF::StringRef>::~__split_buffer((uint64_t)&v35);
    v1 = *a1;
    uint64_t v2 = a1[1];
  }
  for (; v1 != v2; v1 = (long long *)((char *)v1 + 24))
  {
    if (*((char *)v1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v1, *((void *)v1 + 1));
    }
    else
    {
      long long v13 = *v1;
      __p.__r_.__value_.__r.__words[2] = *((void *)v1 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
    }
    uint64_t v14 = v33.i64[1];
    if (v33.i64[1] >= (unint64_t)v34)
    {
      uint64_t v16 = (v33.i64[1] - v33.i64[0]) >> 3;
      if ((unint64_t)(v16 + 1) >> 61) {
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v17 = (uint64_t)&v34[-v33.i64[0]] >> 2;
      if (v17 <= v16 + 1) {
        unint64_t v17 = v16 + 1;
      }
      if ((unint64_t)&v34[-v33.i64[0]] >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v17;
      }
      v38 = &v34;
      if (v18) {
        unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v18);
      }
      else {
        uint64_t v19 = 0;
      }
      v35 = (void *)v18;
      v36.i64[0] = v18 + 8 * v16;
      v36.i64[1] = v36.i64[0];
      unint64_t v37 = v18 + 8 * v19;
      std::construct_at[abi:ne180100]<applesauce::CF::StringRef,std::string,applesauce::CF::StringRef*>((CFStringRef *)v36.i64[0], (const UInt8 *)&__p);
      uint64_t v20 = v36.i64[0];
      uint64_t v15 = v36.i64[1] + 8;
      v36.i64[1] += 8;
      v21 = (void *)v33.i64[1];
      v22 = (void *)v33.i64[0];
      if (v33.i64[1] == v33.i64[0])
      {
        int64x2_t v24 = vdupq_n_s64(v33.u64[1]);
      }
      else
      {
        do
        {
          uint64_t v23 = *--v21;
          *(void *)(v20 - 8) = v23;
          v20 -= 8;
          void *v21 = 0;
        }
        while (v21 != v22);
        int64x2_t v24 = v33;
        uint64_t v15 = v36.i64[1];
      }
      v33.i64[0] = v20;
      v33.i64[1] = v15;
      int64x2_t v36 = v24;
      v25 = v34;
      v34 = (char *)v37;
      unint64_t v37 = (unint64_t)v25;
      v35 = (void *)v24.i64[0];
      std::__split_buffer<applesauce::CF::StringRef>::~__split_buffer((uint64_t)&v35);
    }
    else
    {
      std::construct_at[abi:ne180100]<applesauce::CF::StringRef,std::string,applesauce::CF::StringRef*>((CFStringRef *)v33.i64[1], (const UInt8 *)&__p);
      uint64_t v15 = v14 + 8;
    }
    v33.i64[1] = v15;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  std::vector<void const*>::vector(&v35, (v33.i64[1] - v33.i64[0]) >> 3);
  v27 = (uint64_t *)v33.i64[1];
  v26 = (uint64_t *)v33.i64[0];
  if (v33.i64[0] != v33.i64[1])
  {
    v28 = v35;
    do
    {
      uint64_t v29 = *v26++;
      *v28++ = v29;
    }
    while (v26 != v27);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((const void **)v35, v36.i64[0]);
  if (v35)
  {
    v36.i64[0] = (uint64_t)v35;
    operator delete(v35);
  }
  v35 = &v33;
  std::vector<applesauce::CF::StringRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  return CFArray;
}

void sub_249C01F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20)
{
  if (__p)
  {
    a20 = (uint64_t)__p;
    operator delete(__p);
  }
  a9 = &a16;
  std::vector<applesauce::CF::StringRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

CFStringRef *std::construct_at[abi:ne180100]<applesauce::CF::StringRef,std::string,applesauce::CF::StringRef*>(CFStringRef *a1, const UInt8 *a2)
{
  uint64_t v2 = a2;
  CFIndex v4 = a2[23];
  if ((v4 & 0x80u) != 0) {
    a2 = *(const UInt8 **)a2;
  }
  if (a2)
  {
    CFIndex v5 = *((void *)v2 + 1);
    if ((v4 & 0x80u) == 0) {
      CFIndex v6 = v4;
    }
    else {
      CFIndex v6 = v5;
    }
    CFStringRef v7 = CFStringCreateWithBytes(0, a2, v6, 0x8000100u, 0);
    *a1 = v7;
    if (!v7)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  else
  {
    *a1 = 0;
  }
  return a1;
}

void sub_249C02178(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<applesauce::CF::StringRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    CFIndex v4 = (char *)v1[1];
    CFIndex v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        CFIndex v6 = (const void *)*((void *)v4 - 1);
        v4 -= 8;
        std::__destroy_at[abi:ne180100]<applesauce::CF::StringRef,0>(v6);
      }
      while (v4 != v2);
      CFIndex v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::StringRef,0>(const void *a1)
{
  if (a1) {
    CFRelease(a1);
  }
}

void std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

uint64_t std::__split_buffer<applesauce::CF::StringRef>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    CFIndex v4 = *(const void **)(i - 8);
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::StringRef,0>(v4);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::vector<void const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    CFIndex v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a2);
    *a1 = v4;
    a1[2] = &v4[8 * v5];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_249C0238C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<void const*>(const void **values, uint64_t a2)
{
  CFArrayRef result = CFArrayCreate(0, values, (a2 - (uint64_t)values) >> 3, MEMORY[0x263EFFF70]);
  if (!result)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::construct_error(exception);
  }
  return result;
}

void sub_249C023F8()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_249C02418(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::construct_error(applesauce::CF *this)
{
}

void sub_249C02760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  _Unwind_Resume(a1);
}

void sub_249C02A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249C02C8C(_Unwind_Exception *exception_object, int a2)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_249C03538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,const void *a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  __cxa_free_exception(v29);

  if (a20)
  {
    *(void *)(v30 - 160) = &a17;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 160));
  }
  applesauce::CF::ArrayRef::~ArrayRef(&a22);

  _Unwind_Resume(a1);
}

applesauce::CF::ArrayRef *applesauce::CF::ArrayRef::ArrayRef(applesauce::CF::ArrayRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_249C03720(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(uint64_t result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >= 0xAAAAAAAAAAAAAABLL) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    CFIndex v6 = (void *)result;
    CFStringRef v7 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a4);
    uint64_t v8 = v7;
    void *v6 = v7;
    v6[1] = v7;
    v6[2] = &v7[v9];
    uint64_t v14 = v7;
    long long v13 = v7;
    v11[0] = v6 + 2;
    v11[1] = &v13;
    v11[2] = &v14;
    char v12 = 0;
    if (a2 != a3)
    {
      do
      {
        if (*((char *)a2 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *((void *)a2 + 1));
          CFStringRef v7 = v14;
        }
        else
        {
          long long v10 = *a2;
          v7->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
          *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v10;
        }
        a2 = (long long *)((char *)a2 + 24);
        uint64_t v14 = ++v7;
      }
      while (a2 != a3);
      uint64_t v8 = v7;
    }
    char v12 = 1;
    CFArrayRef result = std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
    v6[1] = v8;
  }
  return result;
}

void sub_249C0384C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void *applesauce::CF::details::CFString_get_value<true>(uint64_t a1, CFStringRef theString)
{
  CStringPtr = (char *)CFStringGetCStringPtr(theString, 0x8000100u);
  if (CStringPtr)
  {
    return std::string::basic_string[abi:ne180100]<0>((void *)a1, CStringPtr);
  }
  else
  {
    CFIndex Length = CFStringGetLength(theString);
    CFIndex maxBufLen = 0;
    v10.location = 0;
    v10.length = Length;
    CFStringGetBytes(theString, v10, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
    std::string::basic_string[abi:ne180100]((void *)a1, maxBufLen);
    if (*(char *)(a1 + 23) >= 0) {
      CFStringRef v7 = (UInt8 *)a1;
    }
    else {
      CFStringRef v7 = *(UInt8 **)a1;
    }
    v11.location = 0;
    v11.length = Length;
    return (void *)CFStringGetBytes(theString, v11, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
  }
}

void sub_249C03968(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *a1, size_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 >= 0x17)
  {
    uint64_t v5 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v5 = a2 | 7;
    }
    uint64_t v6 = v5 + 1;
    CFIndex v4 = operator new(v5 + 1);
    a1[1] = a2;
    a1[2] = v6 | 0x8000000000000000;
    *a1 = v4;
  }
  else
  {
    *((unsigned char *)a1 + 23) = a2;
    CFIndex v4 = a1;
    if (!a2) {
      goto LABEL_9;
    }
  }
  bzero(v4, a2);
LABEL_9:
  *((unsigned char *)v4 + a2) = 0;
  return a1;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 1) < 0) {
        operator delete(*(void **)(v3 - 24));
      }
      v3 -= 24;
    }
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a1);
}

double applesauce::CF::convert_as<std::string,0>(uint64_t a1, const __CFString *a2)
{
  if (a2 && (CFTypeID TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(a2)))
  {
    CStringPtr = (char *)CFStringGetCStringPtr(a2, 0x8000100u);
    if (CStringPtr)
    {
      std::string::basic_string[abi:ne180100]<0>(&v9, CStringPtr);
    }
    else
    {
      CFIndex Length = CFStringGetLength(a2);
      CFIndex maxBufLen = 0;
      v12.location = 0;
      v12.length = Length;
      CFStringGetBytes(a2, v12, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
      std::string::basic_string[abi:ne180100](&v9, maxBufLen);
      if (v10 >= 0) {
        uint64_t v8 = (UInt8 *)&v9;
      }
      else {
        uint64_t v8 = (UInt8 *)v9;
      }
      v13.location = 0;
      v13.length = Length;
      CFStringGetBytes(a2, v13, 0x8000100u, 0, 0, v8, maxBufLen, &maxBufLen);
    }
    double result = *(double *)&v9;
    *(_OWORD *)a1 = v9;
    *(void *)(a1 + 16) = v10;
    *(unsigned char *)(a1 + 24) = 1;
  }
  else
  {
    *(unsigned char *)a1 = 0;
    *(unsigned char *)(a1 + 24) = 0;
  }
  return result;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::vector<std::string>::pointer begin = this->__begin_;
  end = this->__end_;
  std::__split_buffer<std::string>::pointer v4 = __v->__begin_;
  if (end == this->__begin_)
  {
    uint64_t v5 = __v->__begin_;
  }
  else
  {
    do
    {
      uint64_t v5 = v4 - 1;
      long long v6 = *(_OWORD *)&end[-1].__r_.__value_.__l.__data_;
      v4[-1].__r_.__value_.__r.__words[2] = end[-1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v4[-1].__r_.__value_.__l.__data_ = v6;
      end[-1].__r_.__value_.__l.__size_ = 0;
      end[-1].__r_.__value_.__r.__words[2] = 0;
      end[-1].__r_.__value_.__r.__words[0] = 0;
      --v4;
      --end;
    }
    while (end != begin);
  }
  __v->__begin_ = v5;
  CFStringRef v7 = this->__begin_;
  this->__begin_ = v5;
  __v->__begin_ = v7;
  uint64_t v8 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v8;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer begin = this->__begin_;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end != begin)
  {
    do
    {
      std::__split_buffer<std::string>::pointer v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        std::__split_buffer<std::string>::pointer v4 = this->__end_;
      }
      std::__split_buffer<std::string>::pointer end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void sub_249C040D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(a1);
}

void sub_249C04908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,const void *a22)
{
  __cxa_free_exception(v24);

  if (v22) {
    operator delete(v22);
  }
  applesauce::CF::ArrayRef::~ArrayRef(&a22);

  _Unwind_Resume(a1);
}

void *std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    double result = std::vector<unsigned int>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      double result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_249C04AC0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned int>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

const __CFNumber *applesauce::CF::convert_as<unsigned int,0>(const __CFNumber *result)
{
  if (result)
  {
    CFNumberRef v1 = result;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      switch(CFNumberGetType(v1))
      {
        case kCFNumberSInt8Type:
          LOBYTE(valuePtr) = 0;
          int Value = CFNumberGetValue(v1, kCFNumberSInt8Type, &valuePtr);
          goto LABEL_15;
        case kCFNumberSInt16Type:
          LOWORD(valuePtr) = 0;
          int v9 = CFNumberGetValue(v1, kCFNumberSInt16Type, &valuePtr);
          goto LABEL_22;
        case kCFNumberSInt32Type:
          LODWORD(valuePtr) = 0;
          int v10 = CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
          goto LABEL_33;
        case kCFNumberSInt64Type:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
          goto LABEL_33;
        case kCFNumberFloat32Type:
          LODWORD(valuePtr) = 0;
          int v10 = CFNumberGetValue(v1, kCFNumberFloat32Type, &valuePtr);
          goto LABEL_29;
        case kCFNumberFloat64Type:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberFloat64Type, &valuePtr);
          goto LABEL_35;
        case kCFNumberCharType:
          LOBYTE(valuePtr) = 0;
          int Value = CFNumberGetValue(v1, kCFNumberCharType, &valuePtr);
LABEL_15:
          uint64_t v11 = Value != 0;
          if (Value) {
            unsigned __int8 v12 = LOBYTE(valuePtr);
          }
          else {
            unsigned __int8 v12 = 0;
          }
          int v13 = -256;
          if ((v11 & (SLOBYTE(valuePtr) < 0)) == 0) {
            int v13 = 0;
          }
          uint64_t v8 = v11 << 32;
          LODWORD(v5) = v13 & 0xFFFFFF00 | v12;
          int v7 = v5 & 0xFFFFFF00;
          break;
        case kCFNumberShortType:
          LOWORD(valuePtr) = 0;
          int v9 = CFNumberGetValue(v1, kCFNumberShortType, &valuePtr);
LABEL_22:
          if (v9) {
            uint64_t v5 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
          }
          else {
            uint64_t v5 = 0;
          }
          goto LABEL_38;
        case kCFNumberIntType:
          LODWORD(valuePtr) = 0;
          int v10 = CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
          goto LABEL_33;
        case kCFNumberLongType:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberLongType, &valuePtr);
          goto LABEL_33;
        case kCFNumberLongLongType:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberLongLongType, &valuePtr);
          goto LABEL_33;
        case kCFNumberFloatType:
          LODWORD(valuePtr) = 0;
          int v10 = CFNumberGetValue(v1, kCFNumberFloatType, &valuePtr);
LABEL_29:
          uint64_t v14 = *(float *)&valuePtr;
          goto LABEL_36;
        case kCFNumberDoubleType:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberDoubleType, &valuePtr);
          goto LABEL_35;
        case kCFNumberCFIndexType:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberCFIndexType, &valuePtr);
          goto LABEL_33;
        case kCFNumberNSIntegerType:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberNSIntegerType, &valuePtr);
LABEL_33:
          uint64_t v14 = LODWORD(valuePtr);
          goto LABEL_36;
        case kCFNumberCGFloatType:
          double valuePtr = 0.0;
          int v10 = CFNumberGetValue(v1, kCFNumberCGFloatType, &valuePtr);
LABEL_35:
          uint64_t v14 = valuePtr;
LABEL_36:
          uint64_t v5 = v14 | 0x100000000;
          if (!v10) {
            uint64_t v5 = 0;
          }
LABEL_38:
          int v7 = v5 & 0xFFFFFF00;
          uint64_t v8 = v5 & 0x100000000;
          break;
        default:
          int v7 = 0;
          uint64_t v8 = 0;
          LOBYTE(v5) = 0;
          break;
      }
      uint64_t v6 = v8 | v7 & 0xFFFFFF00;
      uint64_t v5 = v5;
    }
    else
    {
      CFTypeID v4 = CFBooleanGetTypeID();
      if (v4 == CFGetTypeID(v1))
      {
        uint64_t v5 = CFBooleanGetValue(v1);
        uint64_t v6 = 0x100000000;
      }
      else
      {
        uint64_t v5 = 0;
        uint64_t v6 = 0;
      }
    }
    return (const __CFNumber *)(v6 | v5);
  }
  return result;
}

void sub_249C051C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249C05A80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,char a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void applesauce::CF::convert_as<std::vector<applesauce::CF::DictionaryRef>,0>(int64x2_t *a1, const __CFArray *a2)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    CFIndex Count = CFArrayGetCount(a2);
    int v6 = Count;
    int64x2_t v35 = 0uLL;
    int64x2_t v36 = 0;
    if (Count << 32)
    {
      if (Count << 32 < 0) {
LABEL_36:
      }
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      v40 = &v36;
      int v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>((int)Count);
      int v9 = (void *)v35.i64[1];
      int v10 = (void *)v35.i64[0];
      if (v35.i64[1] == v35.i64[0])
      {
        int64x2_t v13 = vdupq_n_s64(v35.u64[1]);
        uint64_t v11 = v7;
      }
      else
      {
        uint64_t v11 = v7;
        do
        {
          uint64_t v12 = *--v9;
          *((void *)v11 - 1) = v12;
          v11 -= 8;
          void *v9 = 0;
        }
        while (v9 != v10);
        int64x2_t v13 = v35;
      }
      v35.i64[0] = (uint64_t)v11;
      v35.i64[1] = (uint64_t)v7;
      int64x2_t v38 = v13;
      uint64_t v14 = v36;
      int64x2_t v36 = &v7[8 * v8];
      unint64_t v39 = (unint64_t)v14;
      unint64_t v37 = (int64x2_t *)v13.i64[0];
      std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v37);
    }
    if (v6 < 1)
    {
LABEL_31:
      *a1 = v35;
      a1[1].i64[0] = (uint64_t)v36;
      int64x2_t v36 = 0;
      int64x2_t v35 = 0uLL;
      a1[1].i8[8] = 1;
    }
    else
    {
      CFIndex v15 = 0;
      uint64_t v16 = v6;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a2, v15);
        unint64_t v18 = ValueAtIndex;
        if (!ValueAtIndex) {
          break;
        }
        CFRetain(ValueAtIndex);
        CFTypeID v19 = CFGetTypeID(v18);
        if (v19 != CFDictionaryGetTypeID())
        {
          CFRelease(v18);
          break;
        }
        int64x2_t v33 = v18;
        char v34 = 1;
        uint64_t v20 = (void *)v35.i64[1];
        if (v35.i64[1] >= (unint64_t)v36)
        {
          v21 = (void *)v35.i64[0];
          uint64_t v22 = (v35.i64[1] - v35.i64[0]) >> 3;
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) >> 61) {
            goto LABEL_36;
          }
          uint64_t v24 = (uint64_t)&v36[-v35.i64[0]];
          if ((uint64_t)&v36[-v35.i64[0]] >> 2 > v23) {
            unint64_t v23 = v24 >> 2;
          }
          if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v25 = v23;
          }
          v40 = &v36;
          if (v25)
          {
            unint64_t v25 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v25);
            uint64_t v20 = (void *)v35.i64[1];
            v21 = (void *)v35.i64[0];
            unint64_t v18 = v33;
          }
          else
          {
            uint64_t v26 = 0;
          }
          v27 = (void *)(v25 + 8 * v22);
          unint64_t v28 = v25 + 8 * v26;
          unint64_t v39 = v28;
          void *v27 = v18;
          uint64_t v29 = v27 + 1;
          int64x2_t v33 = 0;
          v38.i64[1] = (uint64_t)(v27 + 1);
          if (v20 != v21)
          {
            do
            {
              uint64_t v30 = *--v20;
              *--v27 = v30;
              *uint64_t v20 = 0;
            }
            while (v20 != v21);
            uint64_t v29 = (void *)v38.i64[1];
            unint64_t v28 = v39;
          }
          int64x2_t v31 = v35;
          v35.i64[0] = (uint64_t)v27;
          v35.i64[1] = (uint64_t)v29;
          int64x2_t v38 = v31;
          v32 = v36;
          int64x2_t v36 = (char *)v28;
          unint64_t v39 = (unint64_t)v32;
          unint64_t v37 = (int64x2_t *)v31.i64[0];
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v37);
          v35.i64[1] = (uint64_t)v29;
        }
        else
        {
          *(void *)v35.i64[1] = v18;
          int64x2_t v33 = 0;
          v35.i64[1] = (uint64_t)(v20 + 1);
        }
        std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v33);
        if (++v15 == v16) {
          goto LABEL_31;
        }
      }
      LOBYTE(v33) = 0;
      char v34 = 0;
      a1->i8[0] = 0;
      a1[1].i8[8] = 0;
      std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v33);
    }
    unint64_t v37 = &v35;
    std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
  }
  else
  {
    a1->i8[0] = 0;
    a1[1].i8[8] = 0;
  }
}

void *std::vector<applesauce::CF::DictionaryRef>::__init_with_size[abi:ne180100]<applesauce::CF::DictionaryRef*,applesauce::CF::DictionaryRef*>(void *result, CFTypeRef *a2, CFTypeRef *a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >> 61) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    int v6 = result;
    double result = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a4);
    int v7 = result;
    void *v6 = result;
    v6[1] = result;
    v6[2] = &result[v8];
    while (a2 != a3)
    {
      CFTypeRef v9 = *a2;
      if (*a2) {
        double result = CFRetain(*a2);
      }
      *v7++ = v9;
      ++a2;
    }
    v6[1] = v7;
  }
  return result;
}

void sub_249C05F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  CFNumberRef v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    CFTypeID v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        int v6 = (const void *)*((void *)v4 - 1);
        v4 -= 8;
        std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(const void *a1)
{
  if (a1) {
    CFRelease(a1);
  }
}

uint64_t std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

uint64_t std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    CFTypeID v4 = *(const void **)(i - 8);
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::DictionaryRef,0>(v4);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_249C066F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,char a31)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void applesauce::CF::DictionaryRef::~DictionaryRef(const void **this)
{
  CFNumberRef v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_249C06C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26)
{
  _Unwind_Resume(a1);
}

void sub_249C07150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  _Unwind_Resume(a1);
}

void sub_249C0753C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<applesauce::CF::TypeRefPair>::reserve(void *result, unint64_t a2)
{
  if (a2 > (uint64_t)(result[2] - *result) >> 4)
  {
    if (a2 >> 60) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v2 = result;
    uint64_t v3 = result[1] - *result;
    v5[4] = result + 2;
    v5[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a2);
    v5[1] = v5[0] + v3;
    v5[2] = v5[0] + v3;
    v5[3] = v5[0] + 16 * v4;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(v2, v5);
    return (void *)std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)v5);
  }
  return result;
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(void ***a1)
{
  uint64_t v2 = ((char *)a1[1] - (char *)*a1) >> 4;
  keys = 0;
  unint64_t v37 = 0;
  unint64_t v38 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  char v34 = 0;
  unint64_t v35 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1 != v4)
  {
    do
    {
      uint64_t v5 = *v3;
      if (!*v3 || !v3[1])
      {
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C5B19C0](exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      int v6 = v37;
      if ((unint64_t)v37 >= v38)
      {
        uint64_t v8 = keys;
        uint64_t v9 = v37 - keys;
        unint64_t v10 = v9 + 1;
        if ((unint64_t)(v9 + 1) >> 61) {
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v11 = v38 - (void)keys;
        if ((uint64_t)(v38 - (void)keys) >> 2 > v10) {
          unint64_t v10 = v11 >> 2;
        }
        if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v10;
        }
        if (v12) {
          unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v12);
        }
        else {
          uint64_t v13 = 0;
        }
        uint64_t v14 = (void **)(v12 + 8 * v9);
        char *v14 = v5;
        int v7 = v14 + 1;
        if (v6 != v8)
        {
          do
          {
            CFIndex v15 = *--v6;
            *--uint64_t v14 = v15;
          }
          while (v6 != v8);
          int v6 = keys;
        }
        keys = v14;
        unint64_t v38 = v12 + 8 * v13;
        if (v6) {
          operator delete(v6);
        }
      }
      else
      {
        *unint64_t v37 = v5;
        int v7 = v6 + 1;
      }
      unint64_t v37 = v7;
      uint64_t v16 = v3[1];
      unint64_t v17 = v34;
      if ((unint64_t)v34 >= v35)
      {
        CFTypeID v19 = values;
        uint64_t v20 = v34 - values;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 61) {
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v22 = v35 - (void)values;
        if ((uint64_t)(v35 - (void)values) >> 2 > v21) {
          unint64_t v21 = v22 >> 2;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23) {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v23);
        }
        else {
          uint64_t v24 = 0;
        }
        unint64_t v25 = (void **)(v23 + 8 * v20);
        char *v25 = v16;
        unint64_t v18 = v25 + 1;
        if (v17 != v19)
        {
          do
          {
            uint64_t v26 = *--v17;
            *--unint64_t v25 = v26;
          }
          while (v17 != v19);
          unint64_t v17 = values;
        }
        values = v25;
        unint64_t v35 = v23 + 8 * v24;
        if (v17) {
          operator delete(v17);
        }
      }
      else
      {
        char *v34 = v16;
        unint64_t v18 = v17 + 1;
      }
      char v34 = v18;
      v3 += 2;
    }
    while (v3 != v4);
  }
  v27 = keys;
  unint64_t v28 = values;
  CFDictionaryRef v29 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v29)
  {
    v32 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v32, "Could not construct");
    __cxa_throw(v32, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v28) {
    operator delete(v28);
  }
  if (v27) {
    operator delete(v27);
  }
  return v29;
}

void sub_249C0791C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12)
{
  __cxa_free_exception(v12);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  CFNumberRef v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 16;
        std::__destroy_at[abi:ne180100]<applesauce::CF::TypeRefPair,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(*(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(void **__p)
{
  if (__p)
  {
    CFNumberRef v1 = __p;
    do
    {
      uint64_t v2 = (void **)*v1;
      if (*((char *)v1 + 39) < 0) {
        operator delete(v1[2]);
      }
      operator delete(v1);
      CFNumberRef v1 = v2;
    }
    while (v2);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::TypeRefPair,0>(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
}

CFStringRef *applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,unsigned int const&>(CFStringRef *a1, const UInt8 *a2, int *a3)
{
  CFIndex v5 = *((void *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    CFIndex v6 = a2[23];
  }
  else
  {
    a2 = *(const UInt8 **)a2;
    CFIndex v6 = v5;
  }
  CFStringRef v7 = CFStringCreateWithBytes(0, a2, v6, 0x8000100u, 0);
  *a1 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  int valuePtr = *a3;
  CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  a1[1] = (CFStringRef)v8;
  if (!v8)
  {
    uint64_t v11 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v11, "Could not construct");
    __cxa_throw(v11, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C07BC4(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a1);
}

void *std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(void *result, void *a2)
{
  uint64_t v3 = (void *)*result;
  uint64_t v2 = (void *)result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    uint64_t v5 = *(v2 - 2);
    v2 -= 2;
    *(void *)(v4 - 16) = v5;
    v4 -= 16;
    void *v2 = 0;
    *(void *)(v4 + 8) = v2[1];
    v2[1] = 0;
  }
  a2[1] = v4;
  CFIndex v6 = (void *)*result;
  char *result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    std::__destroy_at[abi:ne180100]<applesauce::CF::TypeRefPair,0>(i - 16);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void applesauce::CF::TypeRef::~TypeRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void std::vector<void const*>::reserve(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v7 = &v4[8 * v6];
    uint64_t v9 = (char *)*a1;
    uint64_t v8 = (char *)a1[1];
    unint64_t v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
      }
      while (v8 != v9);
      uint64_t v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void sub_249C07FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_249C086E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_249C08830(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void sub_249C09160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

applesauce::CF::ArrayRef *applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef(applesauce::CF::ArrayRef *a1, CFTypeRef *a2)
{
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 != CFArrayGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeRef v5 = *a2;
    if (v5) {
      CFRetain(v5);
    }
  }
  else
  {
    CFTypeRef v5 = 0;
  }

  return applesauce::CF::ArrayRef::ArrayRef(a1, v5);
}

void sub_249C09348()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_249C09368(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::DictionaryRef *applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(applesauce::CF::DictionaryRef *a1, CFTypeRef *a2)
{
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 != CFDictionaryGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeRef v5 = *a2;
    if (v5) {
      CFRetain(v5);
    }
  }
  else
  {
    CFTypeRef v5 = 0;
  }

  return applesauce::CF::DictionaryRef::DictionaryRef(a1, v5);
}

void sub_249C0940C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_249C0942C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

applesauce::CF::StringRef *applesauce::CF::TypeRef::operator applesauce::CF::StringRef(applesauce::CF::StringRef *a1, CFTypeRef *a2)
{
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 != CFStringGetTypeID())
    {
      exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
      applesauce::CF::construct_error(exception);
    }
    CFTypeRef v5 = *a2;
    if (v5) {
      CFRetain(v5);
    }
  }
  else
  {
    CFTypeRef v5 = 0;
  }

  return applesauce::CF::StringRef::StringRef(a1, v5);
}

void sub_249C094D0()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_249C094F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_249C09794(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v3);
  operator delete(v5);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }

  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ads::Kernel>::__on_zero_shared(uint64_t a1)
{
}

void std::__shared_ptr_emplace<ads::Kernel>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDCDB80;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24C5B1B10);
}

void std::__shared_ptr_emplace<ads::Kernel>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDCDB80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t std::weak_ptr<ads::Kernel>::~weak_ptr(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  return a1;
}

void InCider::InstanceOpt(InCider *this)
{
  {
    __cxa_atexit((void (*)(void *))std::optional<InCider>::~optional, &InCider::InstanceOpt(void)::theInstance, &dword_249BFC000);
  }
}

void InCider::~InCider(id **this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  util::server_log((util *)[*this[2] invalidate]);
  uint64_t v2 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    uint64_t v6 = "InCider.mm";
    __int16 v7 = 1024;
    int v8 = 950;
    _os_log_impl(&dword_249BFC000, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d InCider object destroyed", (uint8_t *)&v5, 0x12u);
  }
  CFTypeID v3 = this[2];
  this[2] = 0;
  if (v3) {
    std::default_delete<InCider::ServiceAttributes>::operator()[abi:ne180100](v3);
  }
  CFTypeID v4 = (std::__shared_weak_count *)this[1];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void sub_249C099D8(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void std::default_delete<InCider::ServiceAttributes>::operator()[abi:ne180100](id *a1)
{
  JUMPOUT(0x24C5B1B10);
}

void std::__shared_ptr_emplace<RouteSessionAttributes>::__on_zero_shared(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72)) {

  }
  uint64_t v2 = *(const void **)(a1 + 56);
  if (v2) {
    CFRelease(v2);
  }
  if (*(unsigned char *)(a1 + 40)) {

  }
  CFTypeID v3 = *(const void **)(a1 + 24);
  if (v3) {
    CFRelease(v3);
  }
}

void std::__shared_ptr_emplace<RouteSessionAttributes>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDCDBD0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24C5B1B10);
}

void std::__shared_ptr_emplace<RouteSessionAttributes>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26FDCDBD0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::optional<InCider>::~optional(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24)) {
    InCider::~InCider((id **)a1);
  }
}

BOOL icp::IsSimulatedDevice(icp *this)
{
  int v1 = (int)this;
  ads::Kernel::getADSDevices((ads::Kernel *)&v5);
  uint64_t v2 = v6;
  CFTypeID v3 = v5;
  if (v5 != v6)
  {
    CFTypeID v3 = v5;
    while (*v3 != v1)
    {
      if (++v3 == v6)
      {
        CFTypeID v3 = v6;
        break;
      }
    }
  }
  if (v5) {
    operator delete(v5);
  }
  return v3 != v2;
}

uint64_t ads::Kernel::getADSPluginAOID(ads::Kernel *this)
{
  if (!ads::Kernel::getADSPluginAOID(void)::value)
  {
    LODWORD(v13) = 1;
    std::string __p = (void *)0x676C6F6265414453;
    LODWORD(v17) = 0;
    unint64_t v1 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v13, (const AudioObjectPropertyAddress *)&__p);
    *((void *)&v3 + 1) = v2;
    *(void *)&long long v3 = v1;
    if (((v3 >> 32) & 0xFF00000000) != 0 && HIDWORD(v1) != 0)
    {
      AudioObjectID v20 = 1;
      uint64_t v13 = (void *)0x676C6F62706C6723;
      LODWORD(v14) = 0;
      ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, &v20, (AudioObjectPropertyAddress *)&v13);
      LOBYTE(v13) = 0;
      int v5 = v19;
      if (v19)
      {
        uint64_t v13 = v17;
        long long v14 = v18;
        char v15 = 1;
        uint64_t v6 = (AudioObjectID *)v18;
        p_p = &v13;
      }
      else
      {
        uint64_t v6 = 0;
        p_p = &__p;
      }
      std::string __p = 0;
      unint64_t v17 = 0;
      *(void *)&long long v18 = 0;
      int v8 = (AudioObjectID *)*p_p;
      p_p[1] = 0;
      p_p[2] = 0;
      *p_p = 0;
      if (__p) {
        operator delete(__p);
      }
      if (v5 && v13) {
        operator delete(v13);
      }
      if (v8 == v6) {
        goto LABEL_19;
      }
      uint64_t v9 = v8;
      while (1)
      {
        AudioObjectID v10 = *v9;
        if (*v9)
        {
          std::string __p = (void *)0x676C6F626465764DLL;
          LODWORD(v17) = 0;
          if (AudioObjectHasProperty(v10, (const AudioObjectPropertyAddress *)&__p)) {
            break;
          }
        }
        if (++v9 == v6) {
          goto LABEL_19;
        }
      }
      if (v9 == v6) {
LABEL_19:
      }
        int v11 = 0;
      else {
        int v11 = *v9;
      }
      ads::Kernel::getADSPluginAOID(void)::value = v11;
      if (v8) {
        operator delete(v8);
      }
    }
  }
  return ads::Kernel::getADSPluginAOID(void)::value;
}

BOOL ads::Device::IsConnected(ads::Device *this)
{
  ads::Kernel::getADSDevices((ads::Kernel *)&v28);
  uint64_t v2 = v28;
  if (v28 == v29)
  {
    long long v3 = v28;
  }
  else
  {
    long long v3 = v28;
    while (*v3 != *((_DWORD *)this + 2))
    {
      if (++v3 == v29)
      {
        long long v3 = v29;
        break;
      }
    }
  }
  if (v3 == v29)
  {
    BOOL v20 = 0;
    if (!v28) {
      return v20;
    }
    goto LABEL_44;
  }
  ca::hal::GetPropertyOpt<1969841184u,ca::hal::detail::HALPropertyPolicy>(&v24, *((_DWORD *)this + 2), 1735159650, 0);
  CFStringRef v4 = CFStringCreateWithBytes(0, (const UInt8 *)"", 0, 0x8000100u, 0);
  CFStringRef v5 = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v25) {
    CFStringRef v6 = v24;
  }
  else {
    CFStringRef v6 = v4;
  }
  if (v25)
  {
    CFStringRef v24 = 0;
    if (v6) {
      goto LABEL_14;
    }
LABEL_37:
    unint64_t v21 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v21, "Could not construct");
    __cxa_throw(v21, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFStringRef v5 = 0;
  if (!v6) {
    goto LABEL_37;
  }
LABEL_14:
  applesauce::CF::convert_to<std::string,0>((uint64_t)__p, v6);
  uint64_t v7 = *((unsigned __int8 *)this + 39);
  if ((v7 & 0x80u) == 0) {
    int v8 = (void *)*((unsigned __int8 *)this + 39);
  }
  else {
    int v8 = (void *)*((void *)this + 3);
  }
  unint64_t v9 = v27;
  int v10 = (char)v27;
  if ((v27 & 0x80u) != 0) {
    unint64_t v9 = (unint64_t)__p[1];
  }
  if (v8 != (void *)v9)
  {
    BOOL v20 = 0;
    if (((char)v27 & 0x80000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  int v11 = (const void **)((char *)this + 16);
  if ((v27 & 0x80u) == 0) {
    unint64_t v12 = __p;
  }
  else {
    unint64_t v12 = (void **)__p[0];
  }
  if ((v7 & 0x80) != 0)
  {
    BOOL v20 = memcmp(*v11, v12, *((void *)this + 3)) == 0;
    goto LABEL_39;
  }
  if (*((unsigned char *)this + 39))
  {
    uint64_t v13 = v7 - 1;
    do
    {
      int v15 = *(unsigned __int8 *)v11;
      int v11 = (const void **)((char *)v11 + 1);
      int v14 = v15;
      int v17 = *(unsigned __int8 *)v12;
      unint64_t v12 = (void **)((char *)v12 + 1);
      int v16 = v17;
      BOOL v19 = v13-- != 0;
      BOOL v20 = v14 == v16;
    }
    while (v14 == v16 && v19);
LABEL_39:
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  BOOL v20 = 1;
  if ((char)v27 < 0) {
LABEL_40:
  }
    operator delete(__p[0]);
LABEL_41:
  CFRelease(v6);
  if (v5) {
    CFRelease(v5);
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v24);
  if (v2) {
LABEL_44:
  }
    operator delete(v2);
  return v20;
}

void sub_249C09F78(void *a1)
{
  __cxa_free_exception(v1);
  __clang_call_terminate(a1);
}

void ads::Kernel::getADSDevices(ads::Kernel *this)
{
  AudioObjectID ADSPluginAOID = ads::Kernel::getADSPluginAOID(this);
  if (ADSPluginAOID)
  {
    AudioObjectID v12 = ADSPluginAOID;
    *(void *)&v7[0].mSelector = 0x676C6F6264657623;
    v7[0].mElement = 0;
    ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, &v12, v7);
    LOBYTE(v7[0].mSelector) = 0;
    int v3 = v11;
    if (v11)
    {
      *(void *)&v7[0].mSelector = v9;
      p_p = (void **)v7;
      long long v5 = v10;
    }
    else
    {
      long long v5 = 0uLL;
      p_p = &__p;
    }
    std::string __p = 0;
    uint64_t v9 = 0;
    *(void *)&long long v10 = 0;
    CFStringRef v6 = *p_p;
    p_p[1] = 0;
    p_p[2] = 0;
    *p_p = 0;
    *(void *)this = v6;
    *(_OWORD *)((char *)this + 8) = v5;
    if (__p) {
      operator delete(__p);
    }
    if (v3)
    {
      if (*(void *)&v7[0].mSelector) {
        operator delete(*(void **)&v7[0].mSelector);
      }
    }
  }
  else
  {
    *(void *)this = 0;
    *((void *)this + 1) = 0;
    *((void *)this + 2) = 0;
  }
}

uint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(AudioObjectID a1, const AudioObjectPropertyAddress *a2, void *inQualifierData, uint64_t a4)
{
  uint64_t inData = a4;
  return AudioObjectSetPropertyData(a1, a2, 8u, inQualifierData, 8u, &inData);
}

uint64_t ca::hal::GetPropertyOpt<1969841184u,ca::hal::detail::HALPropertyPolicy>(unsigned char *a1, AudioObjectID a2, uint64_t a3, AudioObjectPropertyElement a4)
{
  AudioObjectID v10 = a2;
  *(void *)&inAddress.mSelector = (a3 << 32) | 0x75696420;
  inAddress.mElement = a4;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::StringRef,void>::Get((uint64_t)v6, &v10, &inAddress, 0, 0);
  *a1 = 0;
  a1[8] = 0;
  if (v8)
  {
    *(void *)a1 = v7;
    uint64_t v7 = 0;
    a1[8] = 1;
  }
  return std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v7);
}

void *applesauce::CF::convert_to<std::string,0>(uint64_t a1, const __CFString *a2)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return applesauce::CF::details::CFString_get_value<true>(a1, a2);
}

void sub_249C0A19C()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_249C0A1BC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(unint64_t a1)
{
  if (a1 >= 0x1555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(12 * a1);
}

uint64_t std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::StringRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress, const AudioObjectPropertyAddress *a4, const void *a5)
{
  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    char v18 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    UInt32 ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, a4, a5, v10);
    if (ioDataSize)
    {
      outData = 0;
      OSStatus PropertyData = AudioObjectGetPropertyData(*a2, inAddress, (UInt32)a4, a5, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        AudioObjectID v12 = outData;
        CFTypeRef v15 = outData;
        applesauce::CF::TypeRef::operator applesauce::CF::StringRef((applesauce::CF::StringRef *)&v14, &v15);
        uint64_t v13 = v14;
        *(unsigned char *)(a1 + 16) = 1;
        *(void *)(a1 + 8) = v13;
        if (v12) {
          CFRelease(v12);
        }
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    char v18 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

uint64_t ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize(ca::hal::detail::HALPropertyPolicy *this, const AudioObjectPropertyAddress *a2, const AudioObjectPropertyAddress *a3, const void *a4, const void *a5)
{
  UInt32 outDataSize = 0;
  if (AudioObjectGetPropertyDataSize((AudioObjectID)this, a2, (UInt32)a3, a4, &outDataSize)) {
    return 0;
  }
  else {
    return outDataSize;
  }
}

_DWORD *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned int const*>,std::__wrap_iter<unsigned int const*>,std::back_insert_iterator<std::vector<unsigned int>>,0>(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  int v3 = a1;
  uint64_t v6 = a3;
  if (a1 == a2) {
    return a1;
  }
  CFStringRef v4 = a2;
  do
    std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](&v6, v3++);
  while (v3 != v4);
  return v4;
}

uint64_t *std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100](uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = *a1;
  uint64_t v6 = *(_DWORD **)(*a1 + 8);
  unint64_t v5 = *(void *)(*a1 + 16);
  if ((unint64_t)v6 >= v5)
  {
    char v8 = *(_DWORD **)v4;
    uint64_t v9 = ((uint64_t)v6 - *(void *)v4) >> 2;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 62) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 1 > v10) {
      unint64_t v10 = v11 >> 1;
    }
    BOOL v12 = (unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v12) {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v13);
      char v8 = *(_DWORD **)v4;
      uint64_t v6 = *(_DWORD **)(v4 + 8);
    }
    else
    {
      uint64_t v14 = 0;
    }
    CFTypeRef v15 = (_DWORD *)(v13 + 4 * v9);
    unint64_t v16 = v13 + 4 * v14;
    _DWORD *v15 = *a2;
    uint64_t v7 = v15 + 1;
    while (v6 != v8)
    {
      int v17 = *--v6;
      *--CFTypeRef v15 = v17;
    }
    *(void *)uint64_t v4 = v15;
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + 16) = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    _DWORD *v6 = *a2;
    uint64_t v7 = v6 + 1;
  }
  *(void *)(v4 + 8) = v7;
  return a1;
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  if (!AudioObjectHasProperty(*a2, inAddress))
  {
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 32) = 0;
    return;
  }
  int v15 = 2003329396;
  LOBYTE(__p[0]) = 0;
  char v18 = 0;
  UInt32 PropertyDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
  UInt32 ioDataSize = PropertyDataSize;
  if (!PropertyDataSize)
  {
    *(_DWORD *)a1 = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 32) = 1;
    return;
  }
  if (PropertyDataSize >= 4)
  {
    unint64_t v10 = PropertyDataSize >> 2;
    char v8 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v10);
    bzero(v8, 4 * v10);
    uint64_t v9 = (uint64_t)v8 + 4 * v10;
  }
  else
  {
    char v8 = 0;
    uint64_t v9 = 0;
  }
  OSStatus PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, v8);
  OSStatus v12 = PropertyData;
  int v15 = PropertyData;
  if (PropertyData)
  {
    *(_DWORD *)a1 = PropertyData;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 32) = 0;
    if (!v8) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v17 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(__p, v8, v9, (v9 - (uint64_t)v8) >> 2);
  *(_DWORD *)a1 = v15;
  uint64_t v13 = v17;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)__p;
  *(void *)(a1 + 24) = v13;
  __p[1] = 0;
  uint64_t v17 = 0;
  __p[0] = 0;
  *(unsigned char *)(a1 + 32) = 1;
  if (v8) {
LABEL_10:
  }
    operator delete(v8);
LABEL_11:
  if (!v12)
  {
    if (__p[0]) {
      operator delete(__p[0]);
    }
  }
}

unint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get(AudioObjectID *a1, const AudioObjectPropertyAddress *a2)
{
  if (AudioObjectHasProperty(*a1, a2))
  {
    ioDataSize[0] = 2003329396;
    *(void *)&ioDataSize[1] = 0;
    unsigned int PropertyData = 2003329396;
    uint64_t v6 = 0;
    ioDataSize[0] = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a1, a2, 0, 0, v4);
    if (ioDataSize[0])
    {
      outData[0] = 0;
      unsigned int PropertyData = AudioObjectGetPropertyData(*a1, a2, 0, 0, ioDataSize, outData);
      if (PropertyData) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = outData[0];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int PropertyData = 2003332927;
  }
  return PropertyData | (unint64_t)(v6 << 32);
}

uint64_t ads::Device::Disconnect(CFIndex *this)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  AudioObjectID ADSPluginAOID = ads::Kernel::getADSPluginAOID((ads::Kernel *)this);
  if (!ADSPluginAOID) {
    return 1937010544;
  }
  AudioObjectID v3 = ADSPluginAOID;
  BOOL IsConnected = ads::Device::IsConnected((ads::Device *)this);
  if (!IsConnected) {
    return 1852797029;
  }
  util::server_log((util *)IsConnected);
  unint64_t v5 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = this + 2;
    if (*((char *)this + 39) < 0) {
      uint64_t v6 = (void *)*v6;
    }
    int v7 = *((_DWORD *)this + 2);
    v16.mSelector = 136315906;
    *(void *)&v16.mScope = "ADS_Management_Kernel.mm";
    __int16 v17 = 1024;
    int v18 = 140;
    __int16 v19 = 2080;
    BOOL v20 = v6;
    __int16 v21 = 1024;
    int v22 = v7;
    _os_log_impl(&dword_249BFC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Disconnecting device named %s with ID %u.", (uint8_t *)&v16, 0x22u);
  }
  if ((*((char *)this + 39) & 0x80000000) == 0)
  {
    char v8 = (const UInt8 *)(this + 2);
    CFIndex v9 = *((unsigned __int8 *)this + 39);
LABEL_13:
    CFStringRef v11 = CFStringCreateWithBytes(0, v8, v9, 0x8000100u, 0);
    CFStringRef v12 = v11;
    if (!v11)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    CFRetain(v11);
    char v13 = 0;
    goto LABEL_15;
  }
  char v8 = (const UInt8 *)this[2];
  if (v8)
  {
    CFIndex v9 = this[3];
    goto LABEL_13;
  }
  CFStringRef v12 = 0;
  char v13 = 1;
LABEL_15:
  *(void *)&v16.mSelector = 0x676C6F626465764DLL;
  v16.mElement = 0;
  uint64_t v10 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(v3, &v16, &ads::Device::Disconnect(void)::kDestroy, (uint64_t)v12);
  if (v12) {
    CFRelease(v12);
  }
  if ((v13 & 1) == 0) {
    CFRelease(v12);
  }
  if (!v10)
  {
    usleep(0x186A0u);
    return 0;
  }
  return v10;
}

void sub_249C0A98C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t ca::hal::SetPropertyStat<1698776147u,ca::hal::detail::HALPropertyPolicy>(uint64_t a1, AudioObjectPropertyElement a2, void *inData)
{
  *(void *)&v4.mSelector = (a1 << 32) | 0x65414453;
  v4.mElement = a2;
  return AudioObjectSetPropertyData(1u, &v4, 0, 0, 4u, inData);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__deallocate_node(*(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__deallocate_node(void *a1)
{
  if (a1)
  {
    unint64_t v1 = a1;
    do
    {
      uint64_t v2 = (void *)*v1;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ads::Device>,0>((uint64_t)(v1 + 2));
      operator delete(v1);
      unint64_t v1 = v2;
    }
    while (v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,ads::Device>,0>(uint64_t a1)
{
  ads::Device::~Device((ads::Device *)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void ads::Device::~Device(ads::Device *this)
{
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
}

ads::Kernel *ads::Kernel::Kernel(ads::Kernel *this)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_DWORD *)this + 12) = 1065353216;
  *((void *)this + 7) = dispatch_queue_create("ADSKernelQueue", 0);
  *(void *)&v7.mSelector = 0x676C6F6265414453;
  v7.mElement = 0;
  if (!AudioObjectHasProperty(1u, &v7))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Device does not have ADS");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
    __cxa_throw(exception, (struct type_info *)off_26527D640, MEMORY[0x263F8C080]);
  }
  v7.mSelector = 1;
  uint64_t v2 = (util *)ca::hal::SetPropertyStat<1698776147u,ca::hal::detail::HALPropertyPolicy>(1735159650, 0, &v7);
  if (v2)
  {
    uint64_t v6 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v6, "Device could not enable ADS");
    __cxa_throw(v6, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  util::server_log(v2);
  AudioObjectID v3 = (id) util::server_log(void)::sLogCat;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7.mSelector = 136315394;
    *(void *)&v7.mScope = "ADS_Management_Kernel.mm";
    __int16 v8 = 1024;
    int v9 = 177;
    _os_log_impl(&dword_249BFC000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d ADS enabled and ads::Kernel object constructed", (uint8_t *)&v7, 0x12u);
  }
  return this;
}

void sub_249C0AD14(_Unwind_Exception *a1)
{
  AudioObjectPropertyAddress v4 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;

  std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::~__hash_table(v2);
  unint64_t v5 = *(std::__shared_weak_count **)(v1 + 8);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
  _Unwind_Resume(a1);
}

uint64_t ads::Kernel::disconnectAllADSDevices(ads::Kernel *this)
{
  unint64_t v5 = this;
  uint64_t v1 = (void *)*((void *)this + 7);
  uint64_t v2 = applesauce::dispatch::v1::queue::operator*(v1);
  unsigned int v7 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23disconnectAllADSDevicesEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v7;
  block[5] = &v5;
  dispatch_sync(v2, block);
  uint64_t v3 = v7;

  return v3;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23disconnectAllADSDevicesEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v3 = *v2;
  AudioObjectPropertyAddress v4 = *(void **)(*v2 + 32);
  if (!v4) {
    goto LABEL_16;
  }
  int v5 = 0;
  do
  {
    int v6 = ads::Device::Disconnect(v4 + 5);
    if (v6) {
      int v5 = v6;
    }
    AudioObjectPropertyAddress v4 = (void *)*v4;
  }
  while (v4);
  if (!v5)
  {
LABEL_16:
    if (*(void *)(v3 + 40))
    {
      std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__deallocate_node(*(void **)(v3 + 32));
      *(void *)(v3 + 32) = 0;
      uint64_t v7 = *(void *)(v3 + 24);
      if (v7)
      {
        for (uint64_t i = 0; i != v7; ++i)
          *(void *)(*(void *)(v3 + 16) + 8 * i) = 0;
      }
      int v5 = 0;
      *(void *)(v3 + 40) = 0;
    }
    else
    {
      int v5 = 0;
    }
  }
  **(_DWORD **)(a1 + 32) = v5;
}

void ads::Kernel::~Kernel(id *this)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  ads::Kernel::disconnectAllADSDevices((ads::Kernel *)this);
  int v11 = 0;
  uint64_t v2 = (util *)ca::hal::SetPropertyStat<1698776147u,ca::hal::detail::HALPropertyPolicy>(1735159650, 0, &v11);
  int v3 = (int)v2;
  util::server_log(v2);
  AudioObjectPropertyAddress v4 = (id) util::server_log(void)::sLogCat;
  int v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    int v11 = 136315394;
    CFStringRef v12 = "ADS_Management_Kernel.mm";
    __int16 v13 = 1024;
    int v14 = 188;
    int v6 = "%25s:%-5d ads::Kernel object destroyed, but could not disable ADS";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v11 = 136315394;
    CFStringRef v12 = "ADS_Management_Kernel.mm";
    __int16 v13 = 1024;
    int v14 = 193;
    int v6 = "%25s:%-5d ADS disabled and ads::Kernel object destroyed";
    uint64_t v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_249BFC000, v7, v8, v6, (uint8_t *)&v11, 0x12u);
LABEL_7:
  id v9 = this[7];
  this[7] = 0;

  std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::~__hash_table((uint64_t)(this + 2));
  uint64_t v10 = (std::__shared_weak_count *)this[1];
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getADSDeviceMapEvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = **(void **)(a1 + 40);
  *(_OWORD *)std::string __p = 0u;
  long long v47 = 0u;
  float v48 = 1.0;
  int v3 = *(uint64_t **)(v2 + 32);
  if (v3)
  {
    uint64_t v4 = 0;
    while (1)
    {
      int v5 = *((_DWORD *)v3 + 12);
      unint64_t v6 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(v3 + 2));
      unint64_t v7 = v6;
      int8x8_t v8 = (int8x8_t)__p[1];
      if (__p[1])
      {
        uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
        v9.i16[0] = vaddlv_u8(v9);
        unint64_t v10 = v9.u32[0];
        if (v9.u32[0] > 1uLL)
        {
          unint64_t v1 = v6;
          if ((void *)v6 >= __p[1]) {
            unint64_t v1 = v6 % (unint64_t)__p[1];
          }
        }
        else
        {
          unint64_t v1 = ((unint64_t)__p[1] - 1) & v6;
        }
        int v11 = (unsigned __int8 **)*((void *)__p[0] + v1);
        if (v11)
        {
          for (uint64_t i = *v11; i; uint64_t i = *(unsigned __int8 **)i)
          {
            unint64_t v13 = *((void *)i + 1);
            if (v13 == v7)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)v3 + 16)) {
                goto LABEL_78;
              }
            }
            else
            {
              if (v10 > 1)
              {
                if ((void *)v13 >= __p[1]) {
                  v13 %= (unint64_t)__p[1];
                }
              }
              else
              {
                v13 &= (unint64_t)__p[1] - 1;
              }
              if (v13 != v1) {
                break;
              }
            }
          }
        }
      }
      int v14 = (char *)operator new(0x30uLL);
      *(void *)int v14 = 0;
      *((void *)v14 + 1) = v7;
      uint64_t v15 = (std::string *)(v14 + 16);
      if (*((char *)v3 + 39) < 0)
      {
        std::string::__init_copy_ctor_external(v15, (const std::string::value_type *)v3[2], v3[3]);
        uint64_t v4 = *((void *)&v47 + 1);
      }
      else
      {
        long long v16 = *((_OWORD *)v3 + 1);
        *((void *)v14 + 4) = v3[4];
        *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
      }
      *((_DWORD *)v14 + 10) = v5;
      float v17 = (float)(unint64_t)(v4 + 1);
      if (!__p[1] || (float)(v48 * (float)(unint64_t)__p[1]) < v17) {
        break;
      }
LABEL_68:
      int64x2_t v33 = (void *)*((void *)__p[0] + v1);
      if (v33)
      {
        *(void *)int v14 = *v33;
      }
      else
      {
        *(void *)int v14 = v47;
        *(void *)&long long v47 = v14;
        *((void *)__p[0] + v1) = &v47;
        if (!*(void *)v14) {
          goto LABEL_77;
        }
        unint64_t v34 = *(void *)(*(void *)v14 + 8);
        if ((*(void *)&v8 & (*(void *)&v8 - 1)) != 0)
        {
          if (v34 >= *(void *)&v8) {
            v34 %= *(void *)&v8;
          }
        }
        else
        {
          v34 &= *(void *)&v8 - 1;
        }
        int64x2_t v33 = (char *)__p[0] + 8 * v34;
      }
      *int64x2_t v33 = v14;
LABEL_77:
      uint64_t v4 = ++*((void *)&v47 + 1);
LABEL_78:
      int v3 = (uint64_t *)*v3;
      if (!v3) {
        goto LABEL_89;
      }
    }
    BOOL v18 = ((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0;
    if (__p[1] < (void *)3) {
      BOOL v18 = 1;
    }
    unint64_t v19 = v18 | (2 * (uint64_t)__p[1]);
    unint64_t v20 = vcvtps_u32_f32(v17 / v48);
    if (v19 <= v20) {
      int8x8_t prime = (int8x8_t)v20;
    }
    else {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    int8x8_t v8 = (int8x8_t)__p[1];
    if ((void *)*(void *)&prime > __p[1]) {
      goto LABEL_34;
    }
    if ((void *)*(void *)&prime < __p[1])
    {
      unint64_t v28 = vcvtps_u32_f32((float)*((unint64_t *)&v47 + 1) / v48);
      if (__p[1] < (void *)3
        || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
      {
        unint64_t v28 = std::__next_prime(v28);
      }
      else
      {
        uint64_t v30 = 1 << -(char)__clz(v28 - 1);
        if (v28 >= 2) {
          unint64_t v28 = v30;
        }
      }
      if (*(void *)&prime <= v28) {
        int8x8_t prime = (int8x8_t)v28;
      }
      if ((void *)*(void *)&prime >= __p[1])
      {
        int8x8_t v8 = (int8x8_t)__p[1];
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          int v22 = operator new(8 * *(void *)&prime);
          uint64_t v23 = __p[0];
          __p[0] = v22;
          if (v23) {
            operator delete(v23);
          }
          uint64_t v24 = 0;
          __p[1] = (void *)prime;
          do
            *((void *)__p[0] + v24++) = 0;
          while (*(void *)&prime != v24);
          char v25 = (void **)v47;
          if ((void)v47)
          {
            unint64_t v26 = *(void *)(v47 + 8);
            uint8x8_t v27 = (uint8x8_t)vcnt_s8(prime);
            v27.i16[0] = vaddlv_u8(v27);
            if (v27.u32[0] > 1uLL)
            {
              if (v26 >= *(void *)&prime) {
                v26 %= *(void *)&prime;
              }
            }
            else
            {
              v26 &= *(void *)&prime - 1;
            }
            *((void *)__p[0] + v26) = &v47;
            for (j = *v25; j; unint64_t v26 = v32)
            {
              unint64_t v32 = j[1];
              if (v27.u32[0] > 1uLL)
              {
                if (v32 >= *(void *)&prime) {
                  v32 %= *(void *)&prime;
                }
              }
              else
              {
                v32 &= *(void *)&prime - 1;
              }
              if (v32 != v26)
              {
                if (!*((void *)__p[0] + v32))
                {
                  *((void *)__p[0] + v32) = v25;
                  goto LABEL_59;
                }
                char *v25 = (void *)*j;
                void *j = **((void **)__p[0] + v32);
                **((void **)__p[0] + v32) = j;
                j = v25;
              }
              unint64_t v32 = v26;
LABEL_59:
              char v25 = (void **)j;
              j = (void *)*j;
            }
          }
          int8x8_t v8 = prime;
          goto LABEL_63;
        }
        unint64_t v35 = __p[0];
        __p[0] = 0;
        if (v35) {
          operator delete(v35);
        }
        int8x8_t v8 = 0;
        __p[1] = 0;
      }
    }
LABEL_63:
    if ((*(void *)&v8 & (*(void *)&v8 - 1)) != 0)
    {
      if (v7 >= *(void *)&v8) {
        unint64_t v1 = v7 % *(void *)&v8;
      }
      else {
        unint64_t v1 = v7;
      }
    }
    else
    {
      unint64_t v1 = (*(void *)&v8 - 1) & v7;
    }
    goto LABEL_68;
  }
LABEL_89:
  uint64_t v36 = *(void *)(a1 + 32);
  if (*(void *)(v36 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(*(void ***)(v36 + 16));
    *(void *)(v36 + 16) = 0;
    uint64_t v37 = *(void *)(v36 + 8);
    if (v37)
    {
      for (uint64_t k = 0; k != v37; ++k)
        *(void *)(*(void *)v36 + 8 * k) = 0;
    }
    *(void *)(v36 + 24) = 0;
  }
  unint64_t v39 = *(void **)v36;
  *(void **)uint64_t v36 = __p[0];
  if (v39) {
    operator delete(v39);
  }
  uint64_t v40 = v47;
  *(void *)(v36 + 16) = v47;
  *(void **)(v36 + 8) = __p[1];
  uint64_t v41 = *((void *)&v47 + 1);
  *(void *)(v36 + 24) = *((void *)&v47 + 1);
  *(float *)(v36 + 32) = v48;
  if (v41)
  {
    unint64_t v42 = *(void *)(v40 + 8);
    unint64_t v43 = *(void *)(v36 + 8);
    if ((v43 & (v43 - 1)) != 0)
    {
      if (v42 >= v43) {
        v42 %= v43;
      }
    }
    else
    {
      v42 &= v43 - 1;
    }
    v44 = 0;
    *(void *)(*(void *)v36 + 8 * v42) = v36 + 16;
    long long v47 = 0uLL;
  }
  else
  {
    v44 = (void **)v47;
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__deallocate_node(v44);
}

void sub_249C0B570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](1, v3);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1)
{
  int v1 = *(char *)(a1 + 23);
  unint64_t v2 = *(void *)(a1 + 8);
  BOOL v3 = v1 < 0;
  if (v1 >= 0) {
    uint64_t v4 = (uint64_t *)a1;
  }
  else {
    uint64_t v4 = *(uint64_t **)a1;
  }
  if (!v3) {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 23);
  }
  if (v2 > 0x20)
  {
    if (v2 > 0x40)
    {
      unint64_t v34 = 0x9DDFEA08EB382D69;
      uint64_t v44 = *(uint64_t *)((char *)v4 + v2 - 48);
      uint64_t v43 = *(uint64_t *)((char *)v4 + v2 - 40);
      uint64_t v45 = *(uint64_t *)((char *)v4 + v2 - 24);
      uint64_t v47 = *(uint64_t *)((char *)v4 + v2 - 64);
      uint64_t v46 = *(uint64_t *)((char *)v4 + v2 - 56);
      uint64_t v48 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v49 = *(uint64_t *)((char *)v4 + v2 - 8);
      unint64_t v50 = v46 + v48;
      unint64_t v51 = 0x9DDFEA08EB382D69
          * (v45 ^ ((0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v45 ^ (v44 + v2))));
      unint64_t v52 = 0x9DDFEA08EB382D69 * (v51 ^ (v51 >> 47));
      unint64_t v53 = v47 + v2 + v46 + v44;
      uint64_t v54 = v53 + v43;
      unint64_t v55 = __ROR8__(v53, 44) + v47 + v2 + __ROR8__(v43 + v47 + v2 - 0x622015F714C7D297 * (v51 ^ (v51 >> 47)), 21);
      uint64_t v56 = v46 + v48 + *(uint64_t *)((char *)v4 + v2 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v57 = v56 + v45 + v48;
      uint64_t v58 = __ROR8__(v57, 44);
      uint64_t v59 = v57 + v49;
      uint64_t v60 = v58 + v56 + __ROR8__(v56 + v43 + v49, 21);
      uint64_t v62 = *v4;
      v61 = v4 + 4;
      unint64_t v63 = v62 - 0x4B6D499041670D8DLL * v43;
      uint64_t v64 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v65 = *(v61 - 3);
        uint64_t v66 = v63 + v54 + v50 + v65;
        uint64_t v67 = v61[2];
        uint64_t v68 = v61[3];
        uint64_t v69 = v61[1];
        unint64_t v50 = v69 + v54 - 0x4B6D499041670D8DLL * __ROR8__(v50 + v55 + v67, 42);
        uint64_t v70 = v52 + v59;
        uint64_t v71 = *(v61 - 2);
        uint64_t v72 = *(v61 - 1);
        uint64_t v73 = *(v61 - 4) - 0x4B6D499041670D8DLL * v55;
        uint64_t v74 = v73 + v59 + v72;
        uint64_t v75 = v73 + v65 + v71;
        uint64_t v54 = v75 + v72;
        uint64_t v76 = __ROR8__(v75, 44) + v73;
        unint64_t v77 = (0xB492B66FBE98F273 * __ROR8__(v66, 37)) ^ v60;
        unint64_t v63 = 0xB492B66FBE98F273 * __ROR8__(v70, 33);
        unint64_t v55 = v76 + __ROR8__(v74 + v77, 21);
        unint64_t v78 = v63 + v60 + *v61;
        uint64_t v59 = v78 + v69 + v67 + v68;
        uint64_t v60 = __ROR8__(v78 + v69 + v67, 44) + v78 + __ROR8__(v50 + v71 + v78 + v68, 21);
        v61 += 8;
        unint64_t v52 = v77;
        v64 += 64;
      }
      while (v64);
      unint64_t v79 = 0x9DDFEA08EB382D69
          * (v59 ^ ((0x9DDFEA08EB382D69 * (v59 ^ v54)) >> 47) ^ (0x9DDFEA08EB382D69 * (v59 ^ v54)));
      unint64_t v80 = v63
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) ^ ((0x9DDFEA08EB382D69 * (v60 ^ ((0x9DDFEA08EB382D69 * (v60 ^ v55)) >> 47) ^ (0x9DDFEA08EB382D69 * (v60 ^ v55)))) >> 47));
      unint64_t v81 = 0x9DDFEA08EB382D69
          * (v80 ^ (v77 - 0x4B6D499041670D8DLL * (v50 ^ (v50 >> 47)) - 0x622015F714C7D297 * (v79 ^ (v79 >> 47))));
      unint64_t v35 = 0x9DDFEA08EB382D69 * (v80 ^ (v81 >> 47) ^ v81);
    }
    else
    {
      uint8x8_t v9 = (char *)v4 + v2;
      uint64_t v10 = *(uint64_t *)((char *)v4 + v2 - 16);
      uint64_t v11 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v12 = v4[1];
      uint64_t v13 = *v4 - 0x3C5A37A36834CED9 * (v10 + v2);
      long long v16 = v4 + 2;
      uint64_t v14 = v4[2];
      uint64_t v15 = v16[1];
      uint64_t v17 = __ROR8__(v13 + v15, 52);
      uint64_t v18 = __ROR8__(v13, 37);
      uint64_t v19 = v13 + v12;
      uint64_t v20 = __ROR8__(v19, 7);
      uint64_t v21 = v19 + v14;
      uint64_t v22 = v20 + v18;
      uint64_t v23 = *((void *)v9 - 4) + v14;
      uint64_t v24 = v11 + v15;
      uint64_t v25 = __ROR8__(v24 + v23, 52);
      uint64_t v26 = v22 + v17;
      uint64_t v27 = __ROR8__(v23, 37);
      uint64_t v28 = *((void *)v9 - 3) + v23;
      uint64_t v29 = __ROR8__(v28, 7);
      uint64_t v30 = v26 + __ROR8__(v21, 31);
      uint64_t v31 = v28 + v10;
      uint64_t v32 = v31 + v24;
      uint64_t v33 = v21 + v15 + v27 + v29 + v25 + __ROR8__(v31, 31);
      unint64_t v34 = 0x9AE16A3B2F90404FLL;
      unint64_t v35 = v30
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v32 + v30) - 0x651E95C4D06FBFB1 * v33) ^ ((0xC3A5C85C97CB3127 * (v32 + v30)
                                                                                 - 0x651E95C4D06FBFB1 * v33) >> 47));
    }
    return (v35 ^ (v35 >> 47)) * v34;
  }
  else
  {
    if (v2 > 0x10)
    {
      uint64_t v36 = v4[1];
      unint64_t v37 = 0xB492B66FBE98F273 * *v4;
      unint64_t v38 = 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v39 = __ROR8__(v38, 30) + __ROR8__(v37 - v36, 43);
      unint64_t v40 = v37 + v2 + __ROR8__(v36 ^ 0xC949D7C7509E6557, 20) - v38;
      unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v39 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)v4 + v2 - 16)));
      unint64_t v42 = v40 ^ (v41 >> 47) ^ v41;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    if (v2 >= 9)
    {
      uint64_t v5 = *v4;
      uint64_t v6 = *(uint64_t *)((char *)v4 + v2 - 8);
      uint64_t v7 = __ROR8__(v6 + v2, v2);
      return (0x9DDFEA08EB382D69
            * ((0x9DDFEA08EB382D69
              * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) ^ ((0x9DDFEA08EB382D69 * (v7 ^ ((0x9DDFEA08EB382D69 * (v7 ^ v5)) >> 47) ^ (0x9DDFEA08EB382D69 * (v7 ^ v5)))) >> 47))) ^ v6;
    }
    if (v2 >= 4)
    {
      int v82 = *(_DWORD *)v4;
      uint64_t v83 = *(unsigned int *)((char *)v4 + v2 - 4);
      unint64_t v84 = 0x9DDFEA08EB382D69 * ((v2 + (8 * v82)) ^ v83);
      unint64_t v42 = v83 ^ (v84 >> 47) ^ v84;
      return 0x9DDFEA08EB382D69 * ((0x9DDFEA08EB382D69 * v42) ^ ((0x9DDFEA08EB382D69 * v42) >> 47));
    }
    unint64_t result = 0x9AE16A3B2F90404FLL;
    if (v2)
    {
      unint64_t v85 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)v4 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                     * (*(unsigned __int8 *)v4 | ((unint64_t)*((unsigned __int8 *)v4 + (v2 >> 1)) << 8)));
      return 0x9AE16A3B2F90404FLL * (v85 ^ (v85 >> 47));
    }
  }
  return result;
}

BOOL std::equal_to<std::string>::operator()[abi:ne180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned int>,void *>>>::operator()[abi:ne180100](char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getAOIDForUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  if (*(char *)(v3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v3, *(void *)(v3 + 8));
  }
  else {
    std::string v11 = *(std::string *)v3;
  }
  DeviceForUUID = ads::Kernel::findDeviceForUUID(v4, (uint64_t)&v11);
  uint64_t v6 = DeviceForUUID;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v11.__r_.__value_.__l.__data_);
    if (v6) {
      goto LABEL_6;
    }
LABEL_8:
    v12[4] = 0;
    v12[8] = 0;
    int v8 = 560227702;
    LOBYTE(v9) = 0;
    goto LABEL_9;
  }
  if (!DeviceForUUID) {
    goto LABEL_8;
  }
LABEL_6:
  int v7 = *((_DWORD *)v6 + 12);
  *(_DWORD *)BOOL v12 = 0;
  *(_DWORD *)&v12[4] = v7;
  int v8 = 0;
  *(void *)&v12[4] = *(unsigned int *)&v12[4] | 0x100000000;
  uint64_t v9 = HIDWORD(*(void *)&v12[4]);
LABEL_9:
  *(_DWORD *)BOOL v12 = v8;
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)uint64_t v10 = *(void *)v12;
  *(unsigned char *)(v10 + 8) = v9;
}

uint64_t *ads::Kernel::findDeviceForUUID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 56);
  int v5 = applesauce::dispatch::v1::queue::operator*(v4);
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = *(uint64_t **)(a1 + 32);
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  if (v6)
  {
    char v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    while (1)
    {
      if (*((char *)v6 + 79) < 0) {
        std::string::__init_copy_ctor_external(&v16, (const std::string::value_type *)v6[7], v6[8]);
      }
      else {
        std::string v16 = *(std::string *)(v6 + 7);
      }
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v10 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v10 = v16.__r_.__value_.__l.__size_;
      }
      if (v10 == size)
      {
        if ((*((unsigned char *)&v16.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          BOOL v12 = (void *)v16.__r_.__value_.__r.__words[0];
          int v13 = memcmp(v16.__r_.__value_.__l.__data_, p_p, v16.__r_.__value_.__l.__size_);
          operator delete(v12);
          if (!v13) {
            goto LABEL_30;
          }
          goto LABEL_27;
        }
        if (!*((unsigned char *)&v16.__r_.__value_.__s + 23)) {
          goto LABEL_30;
        }
        uint64_t v11 = 0;
        while (v16.__r_.__value_.__s.__data_[v11] == p_p->__r_.__value_.__s.__data_[v11])
        {
          if (HIBYTE(v16.__r_.__value_.__r.__words[2]) == ++v11) {
            goto LABEL_30;
          }
        }
      }
      if ((*((unsigned char *)&v16.__r_.__value_.__s + 23) & 0x80) != 0) {
        operator delete(v16.__r_.__value_.__l.__data_);
      }
LABEL_27:
      uint64_t v6 = (uint64_t *)*v6;
      if (!v6) {
        goto LABEL_30;
      }
    }
  }
  char v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_30:
  if (v7 < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v6;
}

void ads::Kernel::getUUIDForAOID(ads::Kernel *this, uint64_t a2, int a3)
{
  int v6 = a3;
  v5[0] = a2;
  v5[1] = &v6;
  applesauce::dispatch::v1::queue::operator*(*(id *)(a2 + 56));
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)this = 0;
  *((unsigned char *)this + 8) = 0;
  *((unsigned char *)this + 32) = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getUUIDForAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = this;
  block[5] = v5;
  dispatch_sync(v4, block);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel14getUUIDForAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x263EF8340];
  uint64_t DeviceForAOID = ads::Kernel::findDeviceForAOID(**(ads::Kernel ***)(a1 + 40), **(_DWORD **)(*(void *)(a1 + 40) + 8));
  uint64_t v4 = DeviceForAOID;
  if (DeviceForAOID)
  {
    if (*(char *)(DeviceForAOID + 79) < 0) {
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(DeviceForAOID + 56), *(void *)(DeviceForAOID + 64));
    }
    else {
      std::string v11 = *(std::string *)(DeviceForAOID + 56);
    }
    int v7 = 0;
    v12[0] = v11.__r_.__value_.__l.__size_;
    int v6 = (void *)v11.__r_.__value_.__r.__words[0];
    *(void *)((char *)v12 + 7) = *(std::string::size_type *)((char *)&v11.__r_.__value_.__r.__words[1] + 7);
    char v1 = HIBYTE(v11.__r_.__value_.__r.__words[2]);
    int v5 = 1;
  }
  else
  {
    int v5 = 0;
    int v6 = 0;
    int v7 = 560227702;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v8 = v7;
  if (*(unsigned __int8 *)(v8 + 32) == v5)
  {
    if (*(unsigned char *)(v8 + 32))
    {
      if (*(char *)(v8 + 31) < 0) {
        operator delete(*(void **)(v8 + 8));
      }
      uint64_t v9 = v12[0];
      *(void *)(v8 + 8) = v6;
      *(void *)(v8 + 16) = v9;
      *(void *)(v8 + 23) = *(void *)((char *)v12 + 7);
      *(unsigned char *)(v8 + 31) = v1;
      return;
    }
  }
  else
  {
    if (!*(unsigned char *)(v8 + 32))
    {
      uint64_t v10 = v12[0];
      *(void *)(v8 + 8) = v6;
      *(void *)(v8 + 16) = v10;
      *(void *)(v8 + 23) = *(void *)((char *)v12 + 7);
      *(unsigned char *)(v8 + 31) = v1;
      *(unsigned char *)(v8 + 32) = 1;
      return;
    }
    if (*(char *)(v8 + 31) < 0) {
      operator delete(*(void **)(v8 + 8));
    }
    *(unsigned char *)(v8 + 32) = 0;
  }
  if (v4 && v1 < 0)
  {
    operator delete(v6);
  }
}

uint64_t ads::Kernel::findDeviceForAOID(ads::Kernel *this, int a2)
{
  uint64_t v4 = (void *)*((void *)this + 7);
  int v5 = applesauce::dispatch::v1::queue::operator*(v4);
  dispatch_assert_queue_V2(v5);

  for (uint64_t result = *((void *)this + 4); result; uint64_t result = *(void *)result)
  {
    if (*(_DWORD *)(result + 48) == a2) {
      break;
    }
  }
  return result;
}

uint64_t ads::Kernel::connectADSDevice(uint64_t a1, uint64_t a2)
{
  v6[0] = a1;
  v6[1] = a2;
  uint64_t v2 = *(void **)(a1 + 56);
  uint64_t v3 = applesauce::dispatch::v1::queue::operator*(v2);
  LODWORD(v8) = 0;
  BYTE4(v8) = 0;
  LOBYTE(v9) = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel16connectADSDeviceENS_2CF13DictionaryRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS8_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v8;
  block[5] = v6;
  dispatch_sync(v3, block);
  uint64_t v4 = v8;

  return v4;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel16connectADSDeviceENS_2CF13DictionaryRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS8_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v4 = *v2;
  uint64_t v3 = (CFTypeRef *)v2[1];
  CFTypeRef v5 = *v3;
  if (*v3)
  {
    CFRetain(*v3);
    CFTypeRef v11 = v5;
    uint64_t v6 = ads::Kernel::_connectADSDevice(v4, &v11);
    char v8 = v7;
    CFRelease(v5);
  }
  else
  {
    CFTypeRef v11 = 0;
    uint64_t v6 = ads::Kernel::_connectADSDevice(v4, &v11);
    char v8 = v9;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  *(void *)uint64_t v10 = v6;
  *(unsigned char *)(v10 + 8) = v8;
}

uint64_t ads::Kernel::_connectADSDevice(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v159 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a1 + 56);
  CFTypeRef v5 = applesauce::dispatch::v1::queue::operator*(v4);
  dispatch_assert_queue_V2(v5);

  CFDictionaryRef v6 = (const __CFDictionary *)*a2;
  if (!*a2)
  {
    int v9 = 1852797029;
LABEL_266:
    *(_DWORD *)v144 = v9;
    v144[4] = 0;
    v144[8] = 0;
    return *(void *)v144;
  }
  uint64_t v7 = (uint64_t)CFStringCreateWithBytes(0, (const UInt8 *)"uuid", 4, 0x8000100u, 0);
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v6, (const void *)v7);
  CFRelease((CFTypeRef)v7);
  if (!Value)
  {
    v142.__r_.__value_.__s.__data_[0] = 0;
    char v143 = 0;
    goto LABEL_265;
  }
  applesauce::CF::convert_as<std::string,0>((uint64_t)&v142, Value);
  if (!v143)
  {
LABEL_265:
    int v9 = 560227702;
    goto LABEL_266;
  }
  if (SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v141, v142.__r_.__value_.__l.__data_, v142.__r_.__value_.__l.__size_);
  }
  else {
    std::string v141 = v142;
  }
  int v10 = SHIBYTE(v141.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v141.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v140, v141.__r_.__value_.__l.__data_, v141.__r_.__value_.__l.__size_);
  }
  else {
    std::string v140 = v141;
  }
  DeviceForUUID = ads::Kernel::findDeviceForUUID(a1, (uint64_t)&v140);
  BOOL v12 = DeviceForUUID;
  if (SHIBYTE(v140.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v140.__r_.__value_.__l.__data_);
    if (v12) {
      goto LABEL_14;
    }
LABEL_16:
    CFTypeRef v14 = *a2;
    if (*a2)
    {
      CFRetain(*a2);
      long long v157 = 0u;
      memset(&v156[16], 0, 32);
      *(void *)v156 = v14;
      CFRetain(v14);
    }
    else
    {
      long long v157 = 0u;
      memset(&v156[16], 0, 32);
      *(void *)v156 = 0;
    }
    uint64_t v15 = (void **)(a1 + 16);
    unint64_t v16 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&v141);
    unint64_t v17 = v16;
    unint64_t v18 = *(void *)(a1 + 24);
    if (v18)
    {
      uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)v18);
      v19.i16[0] = vaddlv_u8(v19);
      unint64_t v20 = v19.u32[0];
      if (v19.u32[0] > 1uLL)
      {
        uint64_t v7 = v16;
        if (v16 >= v18) {
          uint64_t v7 = v16 % v18;
        }
      }
      else
      {
        uint64_t v7 = (v18 - 1) & v16;
      }
      uint64_t v21 = (void **)*((void *)*v15 + v7);
      if (v21)
      {
        uint64_t v22 = (char *)*v21;
        if (*v21)
        {
          do
          {
            unint64_t v23 = *((void *)v22 + 1);
            if (v23 == v17)
            {
              if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v22 + 16, (unsigned __int8 *)&v141))
              {
                goto LABEL_100;
              }
            }
            else
            {
              if (v20 > 1)
              {
                if (v23 >= v18) {
                  v23 %= v18;
                }
              }
              else
              {
                v23 &= v18 - 1;
              }
              if (v23 != v7) {
                break;
              }
            }
            uint64_t v22 = *(char **)v22;
          }
          while (v22);
        }
      }
    }
    uint64_t v24 = operator new(0x68uLL);
    uint64_t v25 = v24;
    uint64_t v26 = (void *)(a1 + 32);
    v152 = v24;
    uint64_t v153 = a1 + 32;
    char v154 = 0;
    *uint64_t v24 = 0;
    v24[1] = v17;
    if (v10 < 0) {
      std::string::__init_copy_ctor_external((std::string *)(v24 + 2), v141.__r_.__value_.__l.__data_, v141.__r_.__value_.__l.__size_);
    }
    else {
      *(std::string *)(v24 + 2) = v141;
    }
    uint64_t v27 = *(void *)v156;
    if (*(void *)v156) {
      CFRetain(*(CFTypeRef *)v156);
    }
    v25[5] = v27;
    *((_DWORD *)v25 + 12) = *(_DWORD *)&v156[8];
    uint64_t v28 = (std::string *)(v25 + 7);
    if ((v156[39] & 0x80000000) != 0)
    {
      std::string::__init_copy_ctor_external(v28, *(const std::string::value_type **)&v156[16], *(std::string::size_type *)&v156[24]);
    }
    else
    {
      *(_OWORD *)&v28->__r_.__value_.__l.__data_ = *(_OWORD *)&v156[16];
      v25[9] = *(void *)&v156[32];
    }
    v25[10] = 0;
    v25[11] = 0;
    v25[12] = 0;
    char v154 = 1;
    float v29 = (float)(unint64_t)(*(void *)(a1 + 40) + 1);
    float v30 = *(float *)(a1 + 48);
    if (v18 && (float)(v30 * (float)v18) >= v29)
    {
LABEL_90:
      uint64_t v46 = (void *)(a1 + 32);
      uint64_t v47 = (void *)*((void *)*v15 + v7);
      uint64_t v22 = (char *)v152;
      if (v47)
      {
        *(void *)v152 = *v47;
      }
      else
      {
        *(void *)v152 = *v46;
        *uint64_t v46 = v22;
        *((void *)*v15 + v7) = v46;
        if (!*(void *)v22)
        {
LABEL_99:
          v152 = 0;
          ++*(void *)(a1 + 40);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)&v152);
LABEL_100:
          ads::Device::~Device((ads::Device *)v156);
          if (v14) {
            CFRelease(v14);
          }
          AudioObjectID ADSPluginAOID = ads::Kernel::getADSPluginAOID(v49);
          if (!ADSPluginAOID)
          {
            int v53 = 1937010544;
            goto LABEL_251;
          }
          AudioObjectID v51 = ADSPluginAOID;
          unint64_t v52 = (CFTypeRef *)(v22 + 40);
          if (ads::Device::IsConnected((ads::Device *)(v22 + 40)))
          {
            int v53 = 1852797029;
            goto LABEL_251;
          }
          *((_DWORD *)v22 + 12) = 0;
          uint64_t v54 = (void **)(v22 + 56);
          if (v22[79] < 0)
          {
            *((void *)v22 + 8) = 0;
            unint64_t v55 = (unsigned char *)*((void *)v22 + 7);
          }
          else
          {
            v22[79] = 0;
            unint64_t v55 = v22 + 56;
          }
          *unint64_t v55 = 0;
          ads::Kernel::getADSDevices((ads::Kernel *)&v152);
          v139 = (ads::Device *)(v22 + 40);
          CFTypeRef v56 = *v52;
          if (*v52)
          {
            CFRetain(*v52);
            strcpy(v156, "Mvedbolg");
            v156[9] = 0;
            *(_WORD *)&v156[10] = 0;
            int v53 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(v51, (const AudioObjectPropertyAddress *)v156, ads::Device::Connect(void)::kCreate, (uint64_t)v56);
            CFRelease(v56);
          }
          else
          {
            strcpy(v156, "Mvedbolg");
            v156[9] = 0;
            *(_WORD *)&v156[10] = 0;
            int v53 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::TypeRef,void>::Set(v51, (const AudioObjectPropertyAddress *)v156, ads::Device::Connect(void)::kCreate, 0);
          }
          uint64_t v57 = (ads::Device *)(v22 + 40);
          if (v53)
          {
LABEL_248:
            if (v152) {
              operator delete(v152);
            }
            if (!v53)
            {
              if (ads::Device::IsConnected(v57))
              {
                *(_DWORD *)&v156[4] = *((_DWORD *)v22 + 12);
                *(_DWORD *)v156 = 0;
                *(_DWORD *)&v156[8] = 1;
                *(_DWORD *)v144 = 0;
                *(void *)&v144[4] = *(void *)&v156[4];
                goto LABEL_253;
              }
              std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__erase_unique<std::string>(v15, (unsigned __int8 *)&v141);
              *(_DWORD *)v144 = 560227702;
              goto LABEL_252;
            }
LABEL_251:
            std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__erase_unique<std::string>(v15, (unsigned __int8 *)&v141);
            *(_DWORD *)v144 = v53;
LABEL_252:
            v144[4] = 0;
            v144[8] = 0;
            goto LABEL_253;
          }
          usleep(0xC350u);
          int v58 = 0;
          std::string __p = 0;
          v150 = 0;
          uint64_t v151 = 0;
          uint64_t v60 = v152;
          uint64_t v59 = (_DWORD *)v153;
          while (1)
          {
            ads::Kernel::getADSDevices((ads::Kernel *)v156);
            v61 = *(void **)v156;
            uint64_t v62 = *(_DWORD **)&v156[8];
            p_p = &__p;
            *(void *)buf = &__p;
            if (v60 == v59)
            {
              uint64_t v64 = *(_DWORD **)v156;
            }
            else
            {
              uint64_t v64 = v60;
              uint64_t v65 = *(_DWORD **)v156;
              while (v65 != v62)
              {
                if (*v64 >= *v65)
                {
                  if (*v65 >= *v64) {
                    ++v64;
                  }
                  else {
                    std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100]((uint64_t *)buf, v65);
                  }
                  ++v65;
                }
                else
                {
                  std::back_insert_iterator<std::vector<unsigned int>>::operator=[abi:ne180100]((uint64_t *)buf, v64++);
                }
                if (v64 == v59)
                {
                  p_p = *(void ***)buf;
                  uint64_t v64 = v65;
                  goto LABEL_127;
                }
              }
              p_p = *(void ***)buf;
              uint64_t v62 = v59;
            }
LABEL_127:
            uint64_t v66 = (util *)std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<unsigned int const*>,std::__wrap_iter<unsigned int const*>,std::back_insert_iterator<std::vector<unsigned int>>,0>(v64, v62, (uint64_t)p_p);
            if (__p != v150) {
              break;
            }
            if (v61) {
              operator delete(v61);
            }
            if (++v58 == 3) {
              goto LABEL_136;
            }
          }
          util::server_log(v66);
          uint64_t v67 = (id) util::server_log(void)::sLogCat;
          uint64_t v66 = (util *)os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT);
          if (v66)
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "ADS_Management_Kernel.mm";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 82;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v58;
            _os_log_impl(&dword_249BFC000, v67, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Caught device on diff iteration %u.", buf, 0x18u);
          }
          if (v61) {
            operator delete(v61);
          }
LABEL_136:
          if (__p == v150)
          {
            util::server_log(v66);
            uint64_t v76 = (id) util::server_log(void)::sLogCat;
            int v53 = 1852990585;
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v156 = 136315394;
              *(void *)&v156[4] = "ADS_Management_Kernel.mm";
              *(_WORD *)&v156[12] = 1024;
              *(_DWORD *)&v156[14] = 89;
              _os_log_impl(&dword_249BFC000, v76, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to locate device after many diff iterations", v156, 0x12u);
            }
            uint64_t v57 = (ads::Device *)(v22 + 40);
            goto LABEL_246;
          }
          AudioObjectID v68 = *(_DWORD *)__p;
          *((_DWORD *)v22 + 12) = *(_DWORD *)__p;
          ca::hal::GetPropertyOpt<1969841184u,ca::hal::detail::HALPropertyPolicy>(&v147, v68, 1735159650, 0);
          if (!v148)
          {
            int v53 = 1970171760;
            uint64_t v57 = (ads::Device *)(v22 + 40);
LABEL_245:
            std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v147);
LABEL_246:
            if (__p)
            {
              v150 = __p;
              operator delete(__p);
            }
            goto LABEL_248;
          }
          if (!v147) {
            goto LABEL_261;
          }
          uint64_t v69 = (util *)applesauce::CF::convert_to<std::string,0>((uint64_t)v156, v147);
          if (v22[79] < 0) {
            operator delete(*v54);
          }
          *(_OWORD *)uint64_t v54 = *(_OWORD *)v156;
          *((void *)v22 + 9) = *(void *)&v156[16];
          util::server_log(v69);
          uint64_t v70 = (id) util::server_log(void)::sLogCat;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            if (v22[79] < 0) {
              uint64_t v54 = (void **)*v54;
            }
            int v71 = *((_DWORD *)v22 + 12);
            *(_DWORD *)v156 = 136315906;
            *(void *)&v156[4] = "ADS_Management_Kernel.mm";
            *(_WORD *)&v156[12] = 1024;
            *(_DWORD *)&v156[14] = 103;
            *(_WORD *)&v156[18] = 2080;
            *(void *)&v156[20] = v54;
            *(_WORD *)&v156[28] = 1024;
            *(_DWORD *)&v156[30] = v71;
            _os_log_impl(&dword_249BFC000, v70, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Connected device named %s with ID %u.", v156, 0x22u);
          }
          CFDictionaryRef v72 = *(const __CFDictionary **)v139;
          if (!*(void *)v139) {
            goto LABEL_261;
          }
          long long v145 = 0uLL;
          uint64_t v146 = 0;
          CFStringRef v73 = CFStringCreateWithBytes(0, (const UInt8 *)"custom", 6, 0x8000100u, 0);
          if (!v73)
          {
            unint64_t v78 = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x24C5B19C0](v78, "Could not construct");
            __cxa_throw(v78, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          CFArrayRef v74 = (const __CFArray *)CFDictionaryGetValue(v72, v73);
          CFRelease(v73);
          if (v74)
          {
            applesauce::CF::convert_as<std::vector<applesauce::CF::DictionaryRef>,0>((int64x2_t *)v156, v74);
            if (v156[24])
            {
              memset(buf, 0, sizeof(buf));
              std::vector<applesauce::CF::DictionaryRef>::__init_with_size[abi:ne180100]<applesauce::CF::DictionaryRef*,applesauce::CF::DictionaryRef*>(buf, *(CFTypeRef **)v156, *(CFTypeRef **)&v156[8], (uint64_t)(*(void *)&v156[8] - *(void *)v156) >> 3);
              if (v156[24])
              {
                v155 = (void **)v156;
                std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100](&v155);
              }
LABEL_171:
              *(void *)v156 = &v145;
              std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)v156);
              unint64_t v79 = (char *)*((void *)v22 + 10);
              *((void *)v22 + 11) = v79;
              unint64_t v81 = *(const __CFDictionary ***)buf;
              unint64_t v80 = *(const __CFDictionary ***)&buf[8];
              if (*(void *)buf != *(void *)&buf[8])
              {
                while (1)
                {
                  CFDictionaryRef v82 = *v81;
                  if (!*v81) {
                    break;
                  }
                  CFStringRef v83 = CFStringCreateWithBytes(0, (const UInt8 *)"selector", 8, 0x8000100u, 0);
                  if (!v83)
                  {
                    v87 = __cxa_allocate_exception(0x10uLL);
                    MEMORY[0x24C5B19C0](v87, "Could not construct");
                    __cxa_throw(v87, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
                  }
                  CFNumberRef v84 = (const __CFNumber *)CFDictionaryGetValue(v82, v83);
                  CFRelease(v83);
                  if (v84)
                  {
                    CFNumberRef v85 = applesauce::CF::convert_as<unsigned int,0>(v84);
                    unsigned int v86 = (unint64_t)v85 >> 32 ? v85 : 0;
                  }
                  else
                  {
                    unsigned int v86 = 0;
                  }
                  CFDictionaryRef v88 = *v81;
                  if (!*v81) {
                    break;
                  }
                  CFStringRef v89 = CFStringCreateWithBytes(0, (const UInt8 *)"scope", 5, 0x8000100u, 0);
                  if (!v89)
                  {
                    v98 = __cxa_allocate_exception(0x10uLL);
                    MEMORY[0x24C5B19C0](v98, "Could not construct");
                    __cxa_throw(v98, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
                  }
                  CFNumberRef v90 = (const __CFNumber *)CFDictionaryGetValue(v88, v89);
                  CFRelease(v89);
                  unsigned int v91 = 1735159650;
                  if (v90)
                  {
                    CFNumberRef v92 = applesauce::CF::convert_as<unsigned int,0>(v90);
                    if ((unint64_t)v92 >> 32) {
                      unsigned int v91 = v92;
                    }
                    else {
                      unsigned int v91 = 1735159650;
                    }
                  }
                  CFDictionaryRef v93 = *v81;
                  if (!*v81) {
                    break;
                  }
                  CFStringRef v94 = CFStringCreateWithBytes(0, (const UInt8 *)"element", 7, 0x8000100u, 0);
                  if (!v94)
                  {
                    v99 = __cxa_allocate_exception(0x10uLL);
                    MEMORY[0x24C5B19C0](v99, "Could not construct");
                    __cxa_throw(v99, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
                  }
                  CFNumberRef v95 = (const __CFNumber *)CFDictionaryGetValue(v93, v94);
                  CFRelease(v94);
                  if (v95)
                  {
                    CFNumberRef v96 = applesauce::CF::convert_as<unsigned int,0>(v95);
                    if ((unint64_t)v96 <= 0x100000000) {
                      int v97 = 0;
                    }
                    else {
                      int v97 = (int)v96;
                    }
                  }
                  else
                  {
                    int v97 = 0;
                  }
                  unint64_t v100 = v86 | ((unint64_t)v91 << 32);
                  unint64_t v102 = *((void *)v22 + 11);
                  unint64_t v101 = *((void *)v22 + 12);
                  if (v102 >= v101)
                  {
                    uint64_t v103 = *((void *)v22 + 10);
                    unint64_t v104 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v102 - v103) >> 2);
                    unint64_t v105 = v104 + 1;
                    if (v104 + 1 > 0x1555555555555555) {
                      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                    }
                    unint64_t v106 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v101 - v103) >> 2);
                    if (2 * v106 > v105) {
                      unint64_t v105 = 2 * v106;
                    }
                    if (v106 >= 0xAAAAAAAAAAAAAAALL) {
                      unint64_t v107 = 0x1555555555555555;
                    }
                    else {
                      unint64_t v107 = v105;
                    }
                    if (v107) {
                      unint64_t v107 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(v107);
                    }
                    else {
                      uint64_t v108 = 0;
                    }
                    unint64_t v109 = v107 + 12 * v104;
                    *(void *)unint64_t v109 = v100;
                    *(_DWORD *)(v109 + 8) = v97;
                    v111 = (_DWORD *)*((void *)v22 + 10);
                    v110 = (_DWORD *)*((void *)v22 + 11);
                    unint64_t v112 = v109;
                    if (v110 != v111)
                    {
                      do
                      {
                        uint64_t v113 = *(void *)(v110 - 3);
                        v110 -= 3;
                        int v114 = v110[2];
                        *(void *)(v112 - 12) = v113;
                        v112 -= 12;
                        *(_DWORD *)(v112 + 8) = v114;
                      }
                      while (v110 != v111);
                      v110 = (_DWORD *)*((void *)v22 + 10);
                    }
                    unint64_t v79 = (char *)(v109 + 12);
                    *((void *)v22 + 10) = v112;
                    *((void *)v22 + 11) = v109 + 12;
                    *((void *)v22 + 12) = v107 + 12 * v108;
                    if (v110) {
                      operator delete(v110);
                    }
                  }
                  else
                  {
                    *(void *)unint64_t v102 = v100;
                    *(_DWORD *)(v102 + 8) = v97;
                    unint64_t v79 = (char *)(v102 + 12);
                  }
                  *((void *)v22 + 11) = v79;
                  if (++v81 == v80) {
                    goto LABEL_212;
                  }
                }
LABEL_261:
                v137 = __cxa_allocate_exception(0x10uLL);
                MEMORY[0x24C5B19C0](v137, "Could not construct");
                __cxa_throw(v137, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
              }
LABEL_212:
              unint64_t v115 = *((void *)v22 + 12);
              if ((unint64_t)v79 >= v115)
              {
                v117 = (char *)*((void *)v22 + 10);
                unint64_t v118 = 0xAAAAAAAAAAAAAAABLL * ((v79 - v117) >> 2);
                unint64_t v119 = v118 + 1;
                uint64_t v57 = (ads::Device *)(v22 + 40);
                if (v118 + 1 > 0x1555555555555555) {
                  goto LABEL_263;
                }
                unint64_t v120 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v115 - (void)v117) >> 2);
                if (2 * v120 > v119) {
                  unint64_t v119 = 2 * v120;
                }
                if (v120 >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v121 = 0x1555555555555555;
                }
                else {
                  unint64_t v121 = v119;
                }
                if (v121)
                {
                  unint64_t v121 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(v121);
                  v117 = (char *)*((void *)v22 + 10);
                  unint64_t v79 = (char *)*((void *)v22 + 11);
                }
                else
                {
                  uint64_t v122 = 0;
                }
                unint64_t v123 = v121 + 12 * v118;
                unint64_t v115 = v121 + 12 * v122;
                *(void *)unint64_t v123 = 0x696E707473746D23;
                *(_DWORD *)(v123 + 8) = 0;
                v116 = (char *)(v123 + 12);
                if (v79 != v117)
                {
                  do
                  {
                    uint64_t v124 = *(void *)(v79 - 12);
                    v79 -= 12;
                    int v125 = *((_DWORD *)v79 + 2);
                    *(void *)(v123 - 12) = v124;
                    v123 -= 12;
                    *(_DWORD *)(v123 + 8) = v125;
                  }
                  while (v79 != v117);
                  v117 = (char *)*((void *)v22 + 10);
                }
                *((void *)v22 + 10) = v123;
                *((void *)v22 + 11) = v116;
                *((void *)v22 + 12) = v115;
                if (v117)
                {
                  operator delete(v117);
                  unint64_t v115 = *((void *)v22 + 12);
                }
              }
              else
              {
                *(void *)unint64_t v79 = 0x696E707473746D23;
                *((_DWORD *)v79 + 2) = 0;
                v116 = v79 + 12;
                uint64_t v57 = (ads::Device *)(v22 + 40);
              }
              *((void *)v22 + 11) = v116;
              if ((unint64_t)v116 < v115)
              {
                *(void *)v116 = 0x6F75747073746D23;
                *((_DWORD *)v116 + 2) = 0;
                v126 = v116 + 12;
LABEL_244:
                *((void *)v22 + 11) = v126;
                *(void *)v156 = buf;
                std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)v156);
                int v53 = 0;
                goto LABEL_245;
              }
              v127 = (unsigned char *)*((void *)v22 + 10);
              unint64_t v128 = 0xAAAAAAAAAAAAAAABLL * ((v116 - v127) >> 2);
              unint64_t v129 = v128 + 1;
              if (v128 + 1 <= 0x1555555555555555)
              {
                unint64_t v130 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v115 - (void)v127) >> 2);
                if (2 * v130 > v129) {
                  unint64_t v129 = 2 * v130;
                }
                if (v130 >= 0xAAAAAAAAAAAAAAALL) {
                  unint64_t v131 = 0x1555555555555555;
                }
                else {
                  unint64_t v131 = v129;
                }
                if (v131)
                {
                  unint64_t v131 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<AudioObjectPropertyAddress>>(v131);
                  v127 = (unsigned char *)*((void *)v22 + 10);
                  v116 = (char *)*((void *)v22 + 11);
                }
                else
                {
                  uint64_t v132 = 0;
                }
                unint64_t v133 = v131 + 12 * v128;
                unint64_t v134 = v131 + 12 * v132;
                *(void *)unint64_t v133 = 0x6F75747073746D23;
                *(_DWORD *)(v133 + 8) = 0;
                v126 = (char *)(v133 + 12);
                if (v116 != v127)
                {
                  do
                  {
                    uint64_t v135 = *(void *)(v116 - 12);
                    v116 -= 12;
                    int v136 = *((_DWORD *)v116 + 2);
                    *(void *)(v133 - 12) = v135;
                    v133 -= 12;
                    *(_DWORD *)(v133 + 8) = v136;
                  }
                  while (v116 != v127);
                  v127 = (unsigned char *)*((void *)v22 + 10);
                }
                *((void *)v22 + 10) = v133;
                *((void *)v22 + 11) = v126;
                *((void *)v22 + 12) = v134;
                if (v127) {
                  operator delete(v127);
                }
                goto LABEL_244;
              }
LABEL_263:
              std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
            }
          }
          else
          {
            v156[0] = 0;
            v156[24] = 0;
          }
          *(_OWORD *)buf = v145;
          *(void *)&buf[16] = v146;
          uint64_t v146 = 0;
          long long v145 = 0uLL;
          goto LABEL_171;
        }
        unint64_t v48 = *(void *)(*(void *)v22 + 8);
        if ((v18 & (v18 - 1)) != 0)
        {
          if (v48 >= v18) {
            v48 %= v18;
          }
        }
        else
        {
          v48 &= v18 - 1;
        }
        uint64_t v47 = (char *)*v15 + 8 * v48;
      }
      *uint64_t v47 = v22;
      goto LABEL_99;
    }
    BOOL v31 = 1;
    if (v18 >= 3) {
      BOOL v31 = (v18 & (v18 - 1)) != 0;
    }
    unint64_t v32 = v31 | (2 * v18);
    unint64_t v33 = vcvtps_u32_f32(v29 / v30);
    if (v32 <= v33) {
      int8x8_t prime = (int8x8_t)v33;
    }
    else {
      int8x8_t prime = (int8x8_t)v32;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
    }
    unint64_t v18 = *(void *)(a1 + 24);
    if (*(void *)&prime > v18) {
      goto LABEL_56;
    }
    if (*(void *)&prime < v18)
    {
      unint64_t v41 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 40) / *(float *)(a1 + 48));
      if (v18 < 3 || (uint8x8_t v42 = (uint8x8_t)vcnt_s8((int8x8_t)v18), v42.i16[0] = vaddlv_u8(v42), v42.u32[0] > 1uLL))
      {
        unint64_t v41 = std::__next_prime(v41);
      }
      else
      {
        uint64_t v43 = 1 << -(char)__clz(v41 - 1);
        if (v41 >= 2) {
          unint64_t v41 = v43;
        }
      }
      if (*(void *)&prime <= v41) {
        int8x8_t prime = (int8x8_t)v41;
      }
      if (*(void *)&prime >= v18)
      {
        unint64_t v18 = *(void *)(a1 + 24);
      }
      else
      {
        if (prime)
        {
LABEL_56:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          unint64_t v35 = operator new(8 * *(void *)&prime);
          uint64_t v36 = *v15;
          std::string *v15 = v35;
          if (v36) {
            operator delete(v36);
          }
          uint64_t v37 = 0;
          *(int8x8_t *)(a1 + 24) = prime;
          do
            *((void *)*v15 + v37++) = 0;
          while (*(void *)&prime != v37);
          unint64_t v38 = (void *)*v26;
          if (*v26)
          {
            unint64_t v39 = v38[1];
            uint8x8_t v40 = (uint8x8_t)vcnt_s8(prime);
            v40.i16[0] = vaddlv_u8(v40);
            if (v40.u32[0] > 1uLL)
            {
              if (v39 >= *(void *)&prime) {
                v39 %= *(void *)&prime;
              }
            }
            else
            {
              v39 &= *(void *)&prime - 1;
            }
            *((void *)*v15 + v39) = v26;
            uint64_t v44 = (void *)*v38;
            if (*v38)
            {
              do
              {
                unint64_t v45 = v44[1];
                if (v40.u32[0] > 1uLL)
                {
                  if (v45 >= *(void *)&prime) {
                    v45 %= *(void *)&prime;
                  }
                }
                else
                {
                  v45 &= *(void *)&prime - 1;
                }
                if (v45 != v39)
                {
                  if (!*((void *)*v15 + v45))
                  {
                    *((void *)*v15 + v45) = v38;
                    goto LABEL_81;
                  }
                  *unint64_t v38 = *v44;
                  *uint64_t v44 = **((void **)*v15 + v45);
                  **((void **)*v15 + v45) = v44;
                  uint64_t v44 = v38;
                }
                unint64_t v45 = v39;
LABEL_81:
                unint64_t v38 = v44;
                uint64_t v44 = (void *)*v44;
                unint64_t v39 = v45;
              }
              while (v44);
            }
          }
          unint64_t v18 = (unint64_t)prime;
          goto LABEL_85;
        }
        uint64_t v75 = *v15;
        std::string *v15 = 0;
        if (v75) {
          operator delete(v75);
        }
        unint64_t v18 = 0;
        *(void *)(a1 + 24) = 0;
      }
    }
LABEL_85:
    if ((v18 & (v18 - 1)) != 0)
    {
      if (v17 >= v18) {
        uint64_t v7 = v17 % v18;
      }
      else {
        uint64_t v7 = v17;
      }
    }
    else
    {
      uint64_t v7 = (v18 - 1) & v17;
    }
    goto LABEL_90;
  }
  if (!DeviceForUUID) {
    goto LABEL_16;
  }
LABEL_14:
  int v13 = *((_DWORD *)v12 + 12);
  *(_DWORD *)v144 = 0;
  *(_DWORD *)&v144[4] = v13;
  v144[8] = 1;
LABEL_253:
  if (SHIBYTE(v141.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v141.__r_.__value_.__l.__data_);
  }
  if (v143 && SHIBYTE(v142.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v142.__r_.__value_.__l.__data_);
  }
  return *(void *)v144;
}

void sub_249C0D548(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::__erase_unique<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (v5)
  {
    unint64_t v6 = v4;
    uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
    v7.i16[0] = vaddlv_u8(v7);
    unint64_t v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL)
    {
      unint64_t v9 = v4;
      if (v4 >= *(void *)&v5) {
        unint64_t v9 = v4 % *(void *)&v5;
      }
    }
    else
    {
      unint64_t v9 = (*(void *)&v5 - 1) & v4;
    }
    int v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == v6)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, a2))
          {
            std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove((uint64_t)v13, a1, i);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)v13);
            return;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= *(void *)&v5) {
              v12 %= *(void *)&v5;
            }
          }
          else
          {
            v12 &= *(void *)&v5 - 1;
          }
          if (v12 != v9) {
            return;
          }
        }
      }
    }
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove(uint64_t result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)a2[1];
  unint64_t v4 = a3[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  unint64_t v6 = *(void **)(*a2 + 8 * v4);
  do
  {
    uint8x8_t v7 = v6;
    unint64_t v6 = (void *)*v6;
  }
  while (v6 != a3);
  if (v7 == a2 + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a3) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a3 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*a2 + 8 * v4) = 0;
  }
  uint64_t v10 = *a3;
  if (*a3)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*a2 + 8 * v11) = v7;
      uint64_t v10 = *a3;
    }
  }
  *uint8x8_t v7 = v10;
  *a3 = 0;
  --a2[3];
  *(void *)uint64_t result = a3;
  *(void *)(result + 8) = a2 + 2;
  *(unsigned char *)(result + 16) = 1;
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  char v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,ads::Device>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

__n128 ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel17connectADSDevicesENSt3__16vectorINS_2CF13DictionaryRefENS5_9allocatorIS8_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int8x8_t v3 = *(CFTypeRef ***)(v2 + 8);
  unint64_t v4 = *v3;
  uint8x8_t v5 = v3[1];
  if (*v3 != v5)
  {
    unint64_t v6 = 0;
    uint8x8_t v7 = 0;
    unint64_t v8 = 0;
    unint64_t v9 = *(ads::Kernel **)v2;
    while (1)
    {
      CFTypeRef v10 = *v4;
      if (*v4)
      {
        CFRetain(*v4);
        CFTypeRef v29 = v10;
        uint64_t v11 = ads::Kernel::_connectADSDevice((uint64_t)v9, &v29);
        CFRelease(v10);
        if (v11) {
          goto LABEL_5;
        }
      }
      else
      {
        CFTypeRef v29 = 0;
        uint64_t v11 = ads::Kernel::_connectADSDevice((uint64_t)v9, &v29);
        if (v11)
        {
LABEL_5:
          if (v6 == v7)
          {
            uint64_t v21 = 0;
            __n128 v25 = 0u;
            if (v6) {
              goto LABEL_34;
            }
            goto LABEL_35;
          }
          unint64_t v12 = v6;
          do
          {
            int v13 = *v12++;
            ads::Kernel::_disconnectADSDeviceByAOID(v9, v13);
          }
          while (v12 != v7);
          CFTypeRef v14 = v6;
          uint64_t v15 = (uint64_t)v7;
          int v1 = v11;
          goto LABEL_9;
        }
      }
      if ((unint64_t)v7 < v8)
      {
        *v7++ = HIDWORD(v11);
        uint64_t v15 = (uint64_t)v7;
        goto LABEL_11;
      }
      uint64_t v16 = v7 - v6;
      unint64_t v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 62) {
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      }
      if ((uint64_t)(v8 - (void)v6) >> 1 > v17) {
        unint64_t v17 = (uint64_t)(v8 - (void)v6) >> 1;
      }
      if (v8 - (unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v17;
      }
      if (v18) {
        unint64_t v18 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v18);
      }
      else {
        uint64_t v19 = 0;
      }
      CFTypeRef v14 = (int *)(v18 + 4 * v16);
      int *v14 = HIDWORD(v11);
      uint64_t v15 = (uint64_t)(v14 + 1);
      while (v7 != v6)
      {
        int v20 = *--v7;
        *--CFTypeRef v14 = v20;
      }
      unint64_t v8 = v18 + 4 * v19;
      if (v6) {
        operator delete(v6);
      }
LABEL_9:
      if (v11)
      {
        uint64_t v21 = 0;
        __n128 v25 = 0u;
        unint64_t v6 = v14;
        LODWORD(v11) = v1;
        if (!v14) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      unint64_t v6 = v14;
      uint8x8_t v7 = (int *)v15;
LABEL_11:
      if (++v4 == v5) {
        goto LABEL_31;
      }
    }
  }
  unint64_t v6 = 0;
  uint64_t v15 = 0;
LABEL_31:
  uint64_t v28 = 0;
  __n128 v27 = 0uLL;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v27, v6, v15, (v15 - (uint64_t)v6) >> 2);
  LODWORD(v11) = 0;
  __n128 v25 = v27;
  uint64_t v21 = v28;
  if (v6) {
LABEL_34:
  }
    operator delete(v6);
LABEL_35:
  uint64_t v22 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v22 = v11;
  unint64_t v23 = *(void **)(v22 + 8);
  if (v23)
  {
    *(void *)(v22 + 16) = v23;
    operator delete(v23);
    *(void *)(v22 + 8) = 0;
    *(void *)(v22 + 16) = 0;
    *(void *)(v22 + 24) = 0;
  }
  __n128 result = v25;
  *(__n128 *)(v22 + 8) = v25;
  *(void *)(v22 + 24) = v21;
  return result;
}

void sub_249C0DA48(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ads::Kernel::_disconnectADSDeviceByAOID(ads::Kernel *this, int a2)
{
  unint64_t v4 = (void *)*((void *)this + 7);
  uint8x8_t v5 = applesauce::dispatch::v1::queue::operator*(v4);
  dispatch_assert_queue_V2(v5);

  uint64_t DeviceForAOID = ads::Kernel::findDeviceForAOID(this, a2);
  if (!DeviceForAOID) {
    return 560227702;
  }
  uint8x8_t v7 = (void *)DeviceForAOID;
  uint64_t result = ads::Device::Disconnect((CFIndex *)(DeviceForAOID + 40));
  if (!result)
  {
    std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove((uint64_t)v9, (void *)this + 2, v7);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)v9);
    return 0;
  }
  return result;
}

uint64_t ads::Kernel::disconnectADSDeviceByAOID(ads::Kernel *this, int a2)
{
  int v7 = a2;
  v6[0] = this;
  v6[1] = &v7;
  uint64_t v2 = (void *)*((void *)this + 7);
  int8x8_t v3 = applesauce::dispatch::v1::queue::operator*(v2);
  unsigned int v9 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v9;
  block[5] = v6;
  dispatch_sync(v3, block);
  uint64_t v4 = v9;

  return v4;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByAOIDEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result = ads::Kernel::_disconnectADSDeviceByAOID(**(ads::Kernel ***)(a1 + 40), **(_DWORD **)(*(void *)(a1 + 40) + 8));
  **(_DWORD **)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByAOIDsENSt3__16vectorIjNS5_9allocatorIjEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(int ****)(result + 40);
  int8x8_t v3 = **v2;
  uint64_t v4 = (*v2)[1];
  if (v3 == v4)
  {
LABEL_11:
    int v8 = 0;
  }
  else
  {
    uint8x8_t v5 = (ads::Kernel *)v2[1];
    do
    {
      uint64_t result = ads::Kernel::findDeviceForAOID(v5, *v3);
      if (!result)
      {
        int v8 = 560227702;
        goto LABEL_13;
      }
      ++v3;
    }
    while (v3 != v4);
    unint64_t v6 = **v2;
    int v7 = (*v2)[1];
    if (v6 == v7) {
      goto LABEL_11;
    }
    int v8 = 0;
    do
    {
      int v9 = *v6++;
      uint64_t result = ads::Kernel::_disconnectADSDeviceByAOID(v5, v9);
      if (result) {
        int v8 = result;
      }
    }
    while (v6 != v7);
  }
LABEL_13:
  **(_DWORD **)(v1 + 32) = v8;
  return result;
}

uint64_t ads::Kernel::disconnectADSDeviceByUUID(uint64_t a1, uint64_t a2)
{
  v6[0] = a1;
  v6[1] = a2;
  uint64_t v2 = *(void **)(a1 + 56);
  int8x8_t v3 = applesauce::dispatch::v1::queue::operator*(v2);
  unsigned int v8 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v8;
  block[5] = v6;
  dispatch_sync(v3, block);
  uint64_t v4 = v8;

  return v4;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25disconnectADSDeviceByUUIDENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  if (*(char *)(v3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *(void *)(v3 + 8));
  }
  else {
    std::string __p = *(std::string *)v3;
  }
  int v5 = ads::Kernel::_disconnectADSDeviceByUUID(v4, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  **(_DWORD **)(a1 + 32) = v5;
}

uint64_t ads::Kernel::_disconnectADSDeviceByUUID(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 56);
  int v5 = applesauce::dispatch::v1::queue::operator*(v4);
  dispatch_assert_queue_V2(v5);

  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  DeviceForUUID = ads::Kernel::findDeviceForUUID(a1, (uint64_t)&__p);
  int v7 = DeviceForUUID;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (DeviceForUUID) {
      goto LABEL_6;
    }
    return 560227702;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (!v7) {
    return 560227702;
  }
LABEL_6:
  uint64_t result = ads::Device::Disconnect(v7 + 5);
  if (!result)
  {
    std::__hash_table<std::__hash_value_type<std::string,ads::Device>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,ads::Device>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,ads::Device>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,ads::Device>>>::remove((uint64_t)v10, (void *)(a1 + 16), v7);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,ads::Device>,void *>>>>::reset[abi:ne180100]((uint64_t)v10);
    return 0;
  }
  return result;
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel27disconnectADSDevicesByUUIDsENSt3__16vectorINS5_12basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEENSA_ISC_EEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t ***)(a1 + 40);
  uint64_t v3 = **v2;
  uint64_t v4 = (*v2)[1];
  if (v3 == v4)
  {
LABEL_21:
    int v9 = 0;
  }
  else
  {
    uint64_t v5 = (uint64_t)v2[1];
    do
    {
      if (*(char *)(v3 + 23) < 0) {
        std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)v3, *(void *)(v3 + 8));
      }
      else {
        std::string v12 = *(std::string *)v3;
      }
      DeviceForUUID = ads::Kernel::findDeviceForUUID(v5, (uint64_t)&v12);
      if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v12.__r_.__value_.__l.__data_);
      }
      if (!DeviceForUUID)
      {
        int v9 = 560227702;
        goto LABEL_23;
      }
      v3 += 24;
    }
    while (v3 != v4);
    uint64_t v7 = **v2;
    uint64_t v8 = (*v2)[1];
    if (v7 == v8) {
      goto LABEL_21;
    }
    int v9 = 0;
    do
    {
      if (*(char *)(v7 + 23) < 0) {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *(void *)(v7 + 8));
      }
      else {
        std::string __p = *(std::string *)v7;
      }
      int v10 = ads::Kernel::_disconnectADSDeviceByUUID(v5, (uint64_t)&__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v10) {
        int v9 = v10;
      }
      v7 += 24;
    }
    while (v7 != v8);
  }
LABEL_23:
  **(_DWORD **)(a1 + 32) = v9;
}

uint64_t ads::Kernel::isDeviceWithAOIDConnected(ads::Kernel *this, int a2)
{
  int v7 = a2;
  v6[0] = this;
  v6[1] = &v7;
  uint64_t v2 = (void *)*((void *)this + 7);
  uint64_t v3 = applesauce::dispatch::v1::queue::operator*(v2);
  unsigned __int8 v9 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithAOIDConnectedEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v9;
  block[5] = v6;
  dispatch_sync(v3, block);
  uint64_t v4 = v9;

  return v4;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithAOIDConnectedEjE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS6_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t result = ads::Kernel::findDeviceForAOID(**(ads::Kernel ***)(a1 + 40), **(_DWORD **)(*(void *)(a1 + 40) + 8));
  if (result) {
    uint64_t result = ads::Device::IsConnected((ads::Device *)(result + 40));
  }
  **(unsigned char **)(a1 + 32) = result;
  return result;
}

BOOL ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25isDeviceWithUUIDConnectedENSt3__112basic_stringIcNS5_11char_traitsIcEENS5_9allocatorIcEEEEE3__0EENS5_5decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS5_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(uint64_t **)(a1 + 40);
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  if (*(char *)(v3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *(void *)(v3 + 8));
  }
  else {
    std::string __p = *(std::string *)v3;
  }
  DeviceForUUID = ads::Kernel::findDeviceForUUID(v4, (uint64_t)&__p);
  unint64_t v6 = DeviceForUUID;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v6) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL result = 0;
    goto LABEL_9;
  }
  if (!DeviceForUUID) {
    goto LABEL_8;
  }
LABEL_6:
  BOOL result = ads::Device::IsConnected((ads::Device *)(v6 + 5));
LABEL_9:
  **(unsigned char **)(a1 + 32) = result;
  return result;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel11hasPropertyEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    uint64_t result = AudioObjectHasProperty(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 16));
    int v4 = 0;
    __int16 v5 = result != 0;
    __int16 v6 = 256;
  }
  else
  {
    __int16 v5 = 0;
    __int16 v6 = 0;
    int v4 = 560227702;
  }
  __int16 v7 = v6 | v5;
  uint64_t v8 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v8 = v4;
  *(_WORD *)(v8 + 4) = v7;
  return result;
}

void sub_249C0E1BC(void *a1)
{
}

uint64_t ads::Kernel::getPropertyDataSize(ads::Kernel *this, int a2, const AudioObjectPropertyAddress *a3, int a4, const void *a5)
{
  int v13 = a2;
  std::string v12 = a3;
  int v11 = a4;
  v9[0] = this;
  v9[1] = &v13;
  v9[2] = &v12;
  v9[3] = &v11;
  v9[4] = &v10;
  int v10 = a5;
  __int16 v5 = (void *)*((void *)this + 7);
  __int16 v6 = applesauce::dispatch::v1::queue::operator*(v5);
  LODWORD(v15) = 0;
  BYTE4(v15) = 0;
  LOBYTE(v16) = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel19getPropertyDataSizeEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v15;
  block[5] = v9;
  dispatch_sync(v6, block);
  uint64_t v7 = v15;

  return v7;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel19getPropertyDataSizeEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    UInt32 outDataSize = 0;
    uint64_t result = AudioObjectGetPropertyDataSize(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 16), **(_DWORD **)(v2 + 24), **(const void ***)(v2 + 32), &outDataSize);
    if (!result)
    {
      *(_DWORD *)uint64_t v8 = 0;
      *(void *)&v8[4] = outDataSize | 0x100000000;
      goto LABEL_7;
    }
    *(_DWORD *)uint64_t v8 = result;
  }
  else
  {
    *(_DWORD *)uint64_t v8 = 560227702;
  }
  v8[4] = 0;
  v8[8] = 0;
LABEL_7:
  char v4 = v8[8];
  uint64_t v5 = HIDWORD(*(void *)v8);
  uint64_t v6 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v6 = *(_DWORD *)v8;
  *(_DWORD *)(v6 + 4) = v5;
  *(unsigned char *)(v6 + 8) = v4;
  return result;
}

void sub_249C0E37C(void *a1)
{
}

void ads::Kernel::getPropertyData(ads::Kernel *this, uint64_t a2, const AudioObjectPropertyAddress *a3, uint64_t a4, const void *a5, uint64_t a6)
{
  int v12 = (int)a3;
  uint64_t v11 = a4;
  int v10 = (int)a5;
  v8[0] = a2;
  v8[1] = &v12;
  v8[2] = &v11;
  v8[3] = &v10;
  v8[4] = &v9;
  uint64_t v9 = a6;
  applesauce::dispatch::v1::queue::operator*(*(id *)(a2 + 56));
  uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)this = 0;
  *((void *)this + 1) = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getPropertyDataEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = this;
  block[5] = v8;
  dispatch_sync(v7, block);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel15getPropertyDataEjPK26AudioObjectPropertyAddressjPKvE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  ads::Kernel::getPropertyData(unsigned int,AudioObjectPropertyAddress const*,unsigned int,void const*)::$_0::operator()((uint64_t)&v4, *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v2 = v4;
  uint64_t v3 = *(const void **)(v2 + 8);
  *(void *)(v2 + 8) = v5;
  if (v3) {
    CFRelease(v3);
  }
}

void ads::Kernel::getPropertyData(unsigned int,AudioObjectPropertyAddress const*,unsigned int,void const*)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!ads::Kernel::findDeviceForAOID(*(ads::Kernel **)a2, **(_DWORD **)(a2 + 8)))
  {
    *(_DWORD *)a1 = 560227702;
    goto LABEL_6;
  }
  CFDataRef v14 = 0;
  UInt32 outDataSize = 0;
  OSStatus PropertyDataSize = AudioObjectGetPropertyDataSize(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), **(_DWORD **)(a2 + 24), **(const void ***)(a2 + 32), &outDataSize);
  if (PropertyDataSize
    || (MEMORY[0x270FA5388](),
        uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0x1FFFFFFF0),
        (OSStatus PropertyDataSize = AudioObjectGetPropertyData(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), **(_DWORD **)(a2 + 24), **(const void ***)(a2 + 32), &outDataSize, v6)) != 0))
  {
    *(_DWORD *)a1 = PropertyDataSize;
LABEL_6:
    *(void *)(a1 + 8) = 0;
    return;
  }
  CFDataRef v7 = CFDataCreate(0, (const UInt8 *)v6, outDataSize);
  CFDataRef v8 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFTypeID v9 = CFGetTypeID(v7);
  if (v9 != CFDataGetTypeID())
  {
    uint64_t v11 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v11, "Could not construct");
    __cxa_throw(v11, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFDataRef v14 = v8;
  CFRetain(v8);
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = v8;
  CFRelease(v8);
}

void sub_249C0E68C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    __cxa_free_exception(v4);
    CFRelease(v3);
    __cxa_begin_catch(exception_object);
    __cxa_end_catch();
    uint64_t v7 = *(void *)(v5 - 48);
    *(_DWORD *)uint64_t v2 = 2003329396;
    *(void *)(v2 + 8) = 0;
    if (!v7) {
      JUMPOUT(0x249C0E590);
    }
    JUMPOUT(0x249C0E604);
  }
  _Unwind_Resume(exception_object);
}

void sub_249C0E720()
{
  applesauce::CF::DataRef::~DataRef((const void **)(v0 - 48));
  JUMPOUT(0x249C0E6C4);
}

void applesauce::CF::DataRef::~DataRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t ads::Kernel::setPropertyDataPrivileged(ads::Kernel *this, int a2, const AudioObjectPropertyAddress *a3, int a4, const void *a5, int a6, const void *a7)
{
  int v17 = a2;
  int v16 = a3;
  int v15 = a4;
  CFDataRef v14 = a5;
  int v13 = a6;
  v11[0] = this;
  v11[1] = &v17;
  v11[2] = &v16;
  void v11[3] = &v15;
  v11[4] = &v14;
  v11[5] = &v13;
  v11[6] = &v12;
  uint64_t v12 = a7;
  uint64_t v7 = (void *)*((void *)this + 7);
  CFDataRef v8 = applesauce::dispatch::v1::queue::operator*(v7);
  unsigned int v19 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25setPropertyDataPrivilegedEjPK26AudioObjectPropertyAddressjPKvjS9_E3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v19;
  block[5] = v11;
  dispatch_sync(v8, block);
  uint64_t v9 = v19;

  return v9;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel25setPropertyDataPrivilegedEjPK26AudioObjectPropertyAddressjPKvjS9_E3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSB_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    uint64_t result = AudioObjectHasProperty(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 16));
    if (result)
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long inData = 0u;
      long long v9 = 0u;
      LODWORD(inData) = 2;
      int v4 = *(_DWORD **)(v2 + 24);
      *(void *)&long long v9 = **(void **)(v2 + 16);
      DWORD2(v9) = *v4;
      uint64_t v5 = *(_DWORD **)(v2 + 40);
      *(void *)&long long v10 = **(void **)(v2 + 32);
      DWORD2(v10) = *v5;
      *(void *)&long long v11 = **(void **)(v2 + 48);
      v7.mElement = 0;
      *(void *)&v7.mSelector = *(void *)"asvdbolg";
      uint64_t result = AudioObjectSetPropertyData(**(_DWORD **)(v2 + 8), &v7, 0, 0, 0x40u, &inData);
      int v6 = result;
    }
    else
    {
      int v6 = 2003332927;
    }
  }
  else
  {
    int v6 = 560227702;
  }
  **(_DWORD **)(a1 + 32) = v6;
  return result;
}

void sub_249C0E938(void *a1)
{
}

void ads::Kernel::getPropertyData_TypeRef(ads::Kernel *this, uint64_t a2, const AudioObjectPropertyAddress *a3, uint64_t a4)
{
  int v8 = (int)a3;
  v6[0] = a2;
  v6[1] = &v8;
  void v6[2] = &v7;
  uint64_t v7 = a4;
  applesauce::dispatch::v1::queue::operator*(*(id *)(a2 + 56));
  uint64_t v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)this = 0;
  *((void *)this + 1) = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23getPropertyData_TypeRefEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = this;
  block[5] = v6;
  dispatch_sync(v5, block);
}

void ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel23getPropertyData_TypeRefEjPK26AudioObjectPropertyAddressE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NS9_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  ads::Kernel::getPropertyData_TypeRef(unsigned int,AudioObjectPropertyAddress const*)::$_0::operator()((uint64_t)&v4, *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  *(_DWORD *)uint64_t v2 = v4;
  uint64_t v3 = *(const void **)(v2 + 8);
  *(void *)(v2 + 8) = v5;
  if (v3) {
    CFRelease(v3);
  }
}

void ads::Kernel::getPropertyData_TypeRef(unsigned int,AudioObjectPropertyAddress const*)::$_0::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!ads::Kernel::findDeviceForAOID(*(ads::Kernel **)a2, **(_DWORD **)(a2 + 8)))
  {
    int v5 = 560227702;
LABEL_9:
    *(_DWORD *)a1 = v5;
    goto LABEL_10;
  }
  CFTypeRef v12 = 0;
  UInt32 outDataSize = 0;
  OSStatus PropertyDataSize = AudioObjectGetPropertyDataSize(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), 0, 0, &outDataSize);
  if (PropertyDataSize)
  {
LABEL_3:
    *(_DWORD *)a1 = PropertyDataSize;
LABEL_10:
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (outDataSize != 8)
  {
    int v5 = 1852797029;
    goto LABEL_9;
  }
  MEMORY[0x270FA5388]();
  OSStatus PropertyDataSize = AudioObjectGetPropertyData(**(_DWORD **)(a2 + 8), **(const AudioObjectPropertyAddress ***)(a2 + 16), 0, 0, &outDataSize, &v7);
  if (PropertyDataSize) {
    goto LABEL_3;
  }
  CFTypeRef v6 = v7;
  CFTypeRef v12 = v7;
  if (v7)
  {
    CFRetain(v7);
    *(_DWORD *)a1 = 0;
    *(void *)(a1 + 8) = v6;
    CFRelease(v6);
  }
  else
  {
    int v9 = 560947818;
    int v8 = 0;
    *(_DWORD *)a1 = 560947818;
    *(void *)(a1 + 8) = 0;
    uint64_t v10 = 0;
    std::pair<$_3,applesauce::CF::TypeRef>::~pair((uint64_t)&v9);
    applesauce::CF::TypeRef::~TypeRef(&v8);
  }
}

void sub_249C0EBC8(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void sub_249C0EBE4(void *a1, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    uint64_t v4 = *(void *)(v3 - 48);
    *(_DWORD *)uint64_t v2 = 2003329396;
    *(void *)(v2 + 8) = 0;
    if (!v4) {
      JUMPOUT(0x249C0EB38);
    }
    JUMPOUT(0x249C0EB84);
  }
  JUMPOUT(0x249C0EBD4);
}

void sub_249C0EC14()
{
  applesauce::CF::TypeRef::~TypeRef((const void **)(v0 - 48));
  JUMPOUT(0x249C0EBD4);
}

uint64_t std::pair<$_3,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t ads::Kernel::setPropertyDataPrivileged_TypeRef(ads::Kernel *this, int a2, const AudioObjectPropertyAddress *a3, const applesauce::CF::TypeRef *a4)
{
  int v10 = a2;
  v8[0] = this;
  v8[1] = &v10;
  v8[2] = a4;
  v8[3] = &v9;
  int v9 = a3;
  uint64_t v4 = (void *)*((void *)this + 7);
  int v5 = applesauce::dispatch::v1::queue::operator*(v4);
  unsigned int v12 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel33setPropertyDataPrivileged_TypeRefEjPK26AudioObjectPropertyAddressRKNS_2CF7TypeRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSD_17integral_constantIbLb0EEE_block_invoke;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = &v12;
  block[5] = v8;
  dispatch_sync(v5, block);
  uint64_t v6 = v12;

  return v6;
}

uint64_t ___ZN10applesauce8dispatch2v19sync_implIZN3ads6Kernel33setPropertyDataPrivileged_TypeRefEjPK26AudioObjectPropertyAddressRKNS_2CF7TypeRefEE3__0EENSt3__15decayIDTclfp0_EEE4typeEPU28objcproto17OS_dispatch_queue8NSObjectOT_NSD_17integral_constantIbLb0EEE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t result = ads::Kernel::findDeviceForAOID(*(ads::Kernel **)v2, **(_DWORD **)(v2 + 8));
  if (result)
  {
    if (**(void **)(v2 + 16))
    {
      uint64_t result = AudioObjectHasProperty(**(_DWORD **)(v2 + 8), **(const AudioObjectPropertyAddress ***)(v2 + 24));
      if (result)
      {
        uint64_t v10 = **(void **)(v2 + 16);
        long long v8 = 0u;
        long long v9 = 0u;
        long long inData = 0u;
        long long v7 = 0u;
        LODWORD(inData) = 2;
        *(void *)&long long v7 = **(void **)(v2 + 24);
        DWORD2(v8) = 8;
        *(void *)&long long v9 = &v10;
        BYTE8(v9) = 1;
        v5.mElement = 0;
        *(void *)&v5.mSelector = *(void *)"asvdbolg";
        uint64_t result = AudioObjectSetPropertyData(**(_DWORD **)(v2 + 8), &v5, 0, 0, 0x40u, &inData);
        int v4 = result;
      }
      else
      {
        int v4 = 2003332927;
      }
    }
    else
    {
      int v4 = 560947818;
    }
  }
  else
  {
    int v4 = 560227702;
  }
  **(_DWORD **)(a1 + 32) = v4;
  return result;
}

void sub_249C0EE20(void *a1)
{
}

void util::server_log(util *this)
{
  {
    qword_26972E4B8 = 0;
    util::server_log(void)::sLogCat = (uint64_t)os_log_create("com.apple.coreaudio", "cider_server");
  }
}

#error "249C0EEB4: too big function (funcsize=0)"

void sub_249C1FBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51)
{
  if (*(char *)(v52 - 121) < 0) {
    operator delete(*(void **)(v52 - 144));
  }
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100](v51 + 8);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(a34);
  std::__optional_destruct_base<applesauce::CF::StringRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&a37);
  if (a44 < 0) {
    operator delete(__p);
  }
  if (a51 < 0) {
    operator delete(a46);
  }
  _Unwind_Resume(a1);
}

void anonymous namespace'::TransformMacAddrs()
{
  std::regex_traits<char>::regex_traits(&v0);
  uint64_t v3 = 0;
  long long v2 = 0u;
  long long v1 = 0u;
  std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>();
}

void sub_249C24D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::locale a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p)
{
}

_OWORD *std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void *a2, _OWORD **a3)
{
  AudioObjectPropertyAddress v5 = (void **)std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__find_equal<std::string>((uint64_t)a1, &v13, a2);
  uint64_t v6 = *v5;
  if (!*v5)
  {
    long long v7 = (uint64_t **)v5;
    uint64_t v6 = operator new(0x40uLL);
    v11[1] = a1 + 1;
    long long v8 = *a3;
    uint64_t v9 = *((void *)*a3 + 2);
    void v6[2] = **a3;
    *((void *)v6 + 6) = v9;
    *long long v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    *((void *)v6 + 7) = 0;
    char v12 = 1;
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__insert_node_at(a1, v13, v7, (uint64_t *)v6);
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)v11);
  }
  return v6;
}

unint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,float,void>::Get(AudioObjectID *a1, const AudioObjectPropertyAddress *a2)
{
  if (AudioObjectHasProperty(*a1, a2))
  {
    ioDataSize[0] = 2003329396;
    *(void *)&ioDataSize[1] = 0;
    unsigned int PropertyData = 2003329396;
    uint64_t v6 = 0;
    ioDataSize[0] = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a1, a2, 0, 0, v4);
    if (ioDataSize[0])
    {
      outData[0] = 0;
      unsigned int PropertyData = AudioObjectGetPropertyData(*a1, a2, 0, 0, ioDataSize, outData);
      if (PropertyData) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = outData[0];
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int PropertyData = 2003332927;
  }
  return PropertyData | (unint64_t)(v6 << 32);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[9],std::string>(applesauce::CF::TypeRef *a1, uint64_t a2)
{
  applesauce::CF::TypeRef::TypeRef(a1, "selector");
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    AudioObjectPropertyAddress v5 = (const UInt8 *)a2;
  }
  else {
    AudioObjectPropertyAddress v5 = *(const UInt8 **)a2;
  }
  if (v4 >= 0) {
    CFIndex v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    CFIndex v6 = *(void *)(a2 + 8);
  }
  CFStringRef v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  *((void *)a1 + 1) = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C24FFC(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[6],std::string>(applesauce::CF::TypeRef *a1, uint64_t a2)
{
  applesauce::CF::TypeRef::TypeRef(a1, "scope");
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    AudioObjectPropertyAddress v5 = (const UInt8 *)a2;
  }
  else {
    AudioObjectPropertyAddress v5 = *(const UInt8 **)a2;
  }
  if (v4 >= 0) {
    CFIndex v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    CFIndex v6 = *(void *)(a2 + 8);
  }
  CFStringRef v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  *((void *)a1 + 1) = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C250E4(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[8],unsigned int const&>(applesauce::CF::TypeRef *a1, int *a2)
{
  applesauce::CF::TypeRef::TypeRef(a1, "element");
  int valuePtr = *a2;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *((void *)a1 + 1) = v4;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C251C0(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[5],std::string const>(applesauce::CF::TypeRef *a1, uint64_t a2)
{
  applesauce::CF::TypeRef::TypeRef(a1, "type");
  int v4 = *(char *)(a2 + 23);
  if (v4 >= 0) {
    AudioObjectPropertyAddress v5 = (const UInt8 *)a2;
  }
  else {
    AudioObjectPropertyAddress v5 = *(const UInt8 **)a2;
  }
  if (v4 >= 0) {
    CFIndex v6 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    CFIndex v6 = *(void *)(a2 + 8);
  }
  CFStringRef v7 = CFStringCreateWithBytes(0, v5, v6, 0x8000100u, 0);
  *((void *)a1 + 1) = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C252A8(_Unwind_Exception *a1)
{
  uint64_t v3 = *(const void **)(v1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  applesauce::CF::TypeRef::~TypeRef((const void **)v1);
  _Unwind_Resume(a1);
}

applesauce::CF::TypeRef *applesauce::CF::TypeRef::TypeRef(applesauce::CF::TypeRef *this, char *a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  if ((v9 & 0x80u) == 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    CFIndex v4 = v9;
  }
  else {
    CFIndex v4 = (CFIndex)__p[1];
  }
  CFStringRef v5 = CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *(void *)this = v5;
  if (!v5)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  return this;
}

void sub_249C253A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (*v15) {
    CFRelease(*v15);
  }
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFNumberRef anonymous namespace'::ConvertDataToTypeRef<float>(CFNumberRef *a1, float a2)
{
  float valuePtr = a2;
  CFNumberRef result = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_249C25464(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFDictionaryRef applesauce::CF::details::make_CFDictionaryRef(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  keys = 0;
  uint64_t v37 = 0;
  unint64_t v38 = 0;
  std::vector<void const*>::reserve((void **)&keys, v2);
  values = 0;
  unint64_t v34 = 0;
  unint64_t v35 = 0;
  std::vector<void const*>::reserve((void **)&values, v2);
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    CFIndex v4 = *(void ***)a1;
    uint64_t v5 = *(void *)a1 + 16 * v3;
    do
    {
      CFIndex v6 = *v4;
      CFStringRef v7 = v37;
      if ((unint64_t)v37 >= v38)
      {
        unsigned __int8 v9 = keys;
        uint64_t v10 = v37 - keys;
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) >> 61) {
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v12 = v38 - (void)keys;
        if ((uint64_t)(v38 - (void)keys) >> 2 > v11) {
          unint64_t v11 = v12 >> 2;
        }
        if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v11;
        }
        if (v13) {
          unint64_t v13 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v13);
        }
        else {
          uint64_t v14 = 0;
        }
        int v15 = (void **)(v13 + 8 * v10);
        CFTypeRef *v15 = v6;
        long long v8 = v15 + 1;
        if (v7 != v9)
        {
          do
          {
            int v16 = *--v7;
            *--int v15 = v16;
          }
          while (v7 != v9);
          CFStringRef v7 = keys;
        }
        keys = v15;
        unint64_t v38 = v13 + 8 * v14;
        if (v7) {
          operator delete(v7);
        }
      }
      else
      {
        *uint64_t v37 = v6;
        long long v8 = v7 + 1;
      }
      uint64_t v37 = v8;
      int v17 = v4[1];
      unint64_t v18 = v34;
      if ((unint64_t)v34 >= v35)
      {
        int v20 = values;
        uint64_t v21 = v34 - values;
        unint64_t v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 61) {
          std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v23 = v35 - (void)values;
        if ((uint64_t)(v35 - (void)values) >> 2 > v22) {
          unint64_t v22 = v23 >> 2;
        }
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v22;
        }
        if (v24) {
          unint64_t v24 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v24);
        }
        else {
          uint64_t v25 = 0;
        }
        uint64_t v26 = (void **)(v24 + 8 * v21);
        void *v26 = v17;
        unsigned int v19 = v26 + 1;
        if (v18 != v20)
        {
          do
          {
            __n128 v27 = *--v18;
            *--uint64_t v26 = v27;
          }
          while (v18 != v20);
          unint64_t v18 = values;
        }
        values = v26;
        unint64_t v35 = v24 + 8 * v25;
        if (v18) {
          operator delete(v18);
        }
      }
      else
      {
        char *v34 = v17;
        unsigned int v19 = v18 + 1;
      }
      unint64_t v34 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  uint64_t v28 = keys;
  CFTypeRef v29 = values;
  CFDictionaryRef v30 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!v30)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  if (v29) {
    operator delete(v29);
  }
  if (v28) {
    operator delete(v28);
  }
  return v30;
}

void sub_249C256EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12)
{
  __cxa_free_exception(v12);
  if (__p) {
    operator delete(__p);
  }
  if (a12) {
    operator delete(a12);
  }
  _Unwind_Resume(a1);
}

void applesauce::CF::TypeRefPair::~TypeRefPair(applesauce::CF::TypeRefPair *this)
{
  unint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
  if (*(void *)this) {
    CFRelease(*(CFTypeRef *)this);
  }
}

void std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(void *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,applesauce::CF::TypeRef>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

uint64_t std::vector<applesauce::CF::DictionaryRef>::push_back[abi:ne180100](void *a1, CFTypeRef *a2)
{
  CFIndex v4 = a1 + 2;
  unint64_t v5 = a1[2];
  CFIndex v6 = (void *)a1[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v9 = ((uint64_t)v6 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    uint64_t v26 = v4;
    if (v12)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v12);
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }
    int v15 = &v14[8 * v9];
    int v16 = &v14[8 * v13];
    uint64_t v25 = v16;
    int v17 = std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(v15, *a2);
    long long v8 = v17 + 1;
    v24.i64[1] = (uint64_t)(v17 + 1);
    unsigned int v19 = (void *)*a1;
    unint64_t v18 = (void *)a1[1];
    if (v18 == (void *)*a1)
    {
      int64x2_t v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        uint64_t v20 = *--v18;
        *--int v17 = v20;
        *unint64_t v18 = 0;
      }
      while (v18 != v19);
      int64x2_t v21 = *(int64x2_t *)a1;
      long long v8 = (void *)v24.i64[1];
      int v16 = v25;
    }
    *a1 = v17;
    a1[1] = v8;
    int64x2_t v24 = v21;
    unint64_t v22 = (char *)a1[2];
    a1[2] = v16;
    uint64_t v25 = v22;
    uint64_t v23 = v21.i64[0];
    uint64_t result = std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    uint64_t result = (uint64_t)std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(v6, *a2);
    long long v8 = (void *)(result + 8);
  }
  a1[1] = v8;
  return result;
}

uint64_t ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,AudioValueRange,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  uint64_t result = AudioObjectHasProperty(*a2, inAddress);
  if (result)
  {
    *(_DWORD *)a1 = 2003329396;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 24) = 0;
    uint64_t result = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v7);
    UInt32 ioDataSize = result;
    if (result)
    {
      uint64_t result = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = result;
      if (!result)
      {
        *(_OWORD *)(a1 + 8) = outData;
        *(unsigned char *)(a1 + 24) = 1;
      }
    }
  }
  else
  {
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 24) = 0;
  }
  return result;
}

void anonymous namespace'::ConvertDataToTypeRef<AudioValueRange>(CFArrayRef *a1, __n128 a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  __n128 v22 = a2;
  int64x2_t v16 = 0uLL;
  unint64_t v17 = 0;
  std::vector<applesauce::CF::NumberRef>::reserve(&v16, 2uLL);
  uint64_t v3 = 0;
  CFIndex v4 = (CFNumberRef *)v16.i64[1];
  do
  {
    if ((unint64_t)v4 >= v17)
    {
      uint64_t v5 = ((uint64_t)v4 - v16.i64[0]) >> 3;
      if ((unint64_t)(v5 + 1) >> 61) {
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v6 = (uint64_t)(v17 - v16.i64[0]) >> 2;
      if (v6 <= v5 + 1) {
        unint64_t v6 = v5 + 1;
      }
      if (v17 - v16.i64[0] >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v7 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v7 = v6;
      }
      int64x2_t v21 = &v17;
      if (v7) {
        unint64_t v7 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v7);
      }
      else {
        uint64_t v8 = 0;
      }
      unint64_t v18 = (int64x2_t *)v7;
      v19.i64[0] = v7 + 8 * v5;
      v19.i64[1] = v19.i64[0];
      unint64_t v20 = v7 + 8 * v8;
      std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,double const&,applesauce::CF::NumberRef*>((CFNumberRef *)v19.i64[0], v22.n128_f64[v3]);
      uint64_t v9 = v19.i64[0];
      CFIndex v4 = (CFNumberRef *)(v19.i64[1] + 8);
      v19.i64[1] += 8;
      uint64_t v10 = (void *)v16.i64[1];
      uint64_t v11 = (void *)v16.i64[0];
      if (v16.i64[1] == v16.i64[0])
      {
        int64x2_t v13 = vdupq_n_s64(v16.u64[1]);
      }
      else
      {
        do
        {
          uint64_t v12 = *--v10;
          *(void *)(v9 - 8) = v12;
          v9 -= 8;
          void *v10 = 0;
        }
        while (v10 != v11);
        int64x2_t v13 = v16;
        CFIndex v4 = (CFNumberRef *)v19.i64[1];
      }
      v16.i64[0] = v9;
      v16.i64[1] = (uint64_t)v4;
      int64x2_t v19 = v13;
      unint64_t v14 = v17;
      unint64_t v17 = v20;
      unint64_t v20 = v14;
      unint64_t v18 = (int64x2_t *)v13.i64[0];
      std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&v18);
    }
    else
    {
      std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,double const&,applesauce::CF::NumberRef*>(v4++, v22.n128_f64[v3]);
    }
    v16.i64[1] = (uint64_t)v4;
    ++v3;
  }
  while (v3 != 2);
  CFArrayRef v15 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>((uint64_t **)&v16);
  unint64_t v18 = &v16;
  std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  CFRetain(v15);
  *a1 = v15;
  CFRelease(v15);
}

void sub_249C25B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

CFNumberRef anonymous namespace'::ConvertDataToTypeRef<unsigned int>(CFNumberRef *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef result = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a1 = result;
  if (!result)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return result;
}

void sub_249C25C58(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::DictionaryRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    char v14 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    UInt32 ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
    if (ioDataSize)
    {
      long long outData = 0;
      OSStatus PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        uint64_t v8 = outData;
        CFTypeRef v11 = outData;
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef((applesauce::CF::DictionaryRef *)&v10, &v11);
        uint64_t v9 = v10;
        *(unsigned char *)(a1 + 16) = 1;
        *(void *)(a1 + 8) = v9;
        if (v8) {
          CFRelease(v8);
        }
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    char v14 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::DictionaryRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

void anonymous namespace'::ConvertDataToTypeRef<applesauce::CF::StringRef>(uint64_t a1, const __CFString *a2)
{
  if (a2) {
    applesauce::CF::convert_to<std::string,0>((uint64_t)v2, a2);
  }
  else {
    memset(v2, 0, sizeof(v2));
  }
}

void sub_249C25E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  _Unwind_Resume(exception_object);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::NumberRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    char v15 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    UInt32 ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
    if (ioDataSize)
    {
      CFTypeRef outData = 0;
      OSStatus PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        CFTypeRef v8 = outData;
        if (outData)
        {
          CFTypeID v9 = CFGetTypeID(outData);
          if (v9 != CFNumberGetTypeID())
          {
            exception = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x24C5B19C0](exception, "Could not construct");
            __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          CFRetain(v8);
          CFTypeID v10 = CFGetTypeID(v8);
          if (v10 != CFNumberGetTypeID())
          {
            uint64_t v12 = __cxa_allocate_exception(0x10uLL);
            MEMORY[0x24C5B19C0](v12, "Could not construct");
            __cxa_throw(v12, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
          }
          *(unsigned char *)(a1 + 16) = 1;
          *(void *)(a1 + 8) = v8;
          CFRelease(v8);
        }
        else
        {
          *(unsigned char *)(a1 + 16) = 1;
          *(void *)(a1 + 8) = 0;
        }
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    char v15 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

void sub_249C26060(void *a1)
{
  __cxa_free_exception(v2);
  CFRelease(v1);
  __clang_call_terminate(a1);
}

uint64_t std::__optional_destruct_base<applesauce::CF::NumberRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,applesauce::CF::ArrayRef,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  if (AudioObjectHasProperty(*a2, inAddress))
  {
    LOBYTE(outData) = 0;
    char v14 = 0;
    *(_DWORD *)a1 = 2003329396;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
    UInt32 ioDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
    if (ioDataSize)
    {
      CFTypeRef outData = 0;
      OSStatus PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, &outData);
      *(_DWORD *)a1 = PropertyData;
      if (!PropertyData)
      {
        CFTypeRef v8 = outData;
        CFTypeRef v11 = outData;
        applesauce::CF::TypeRef::operator applesauce::CF::ArrayRef((applesauce::CF::ArrayRef *)&v10, &v11);
        uint64_t v9 = v10;
        *(unsigned char *)(a1 + 16) = 1;
        *(void *)(a1 + 8) = v9;
        if (v8) {
          CFRelease(v8);
        }
      }
    }
  }
  else
  {
    LOBYTE(outData) = 0;
    char v14 = 0;
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 16) = 0;
    std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&outData);
  }
}

uint64_t std::__optional_destruct_base<applesauce::CF::ArrayRef,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8))
  {
    unint64_t v2 = *(const void **)a1;
    if (*(void *)a1) {
      CFRelease(v2);
    }
  }
  return a1;
}

void anonymous namespace'::AddCustomProperty<1970496630u,1735159650u,0u>(AudioObjectID a1, void *a2)
{
  v37[1] = *MEMORY[0x263EF8340];
  *(void *)&inAddress.mSelector = *(void *)"vdsubolg";
  inAddress.mElement = 0;
  LODWORD(v22) = a1;
  *(void *)&v30.mSelector = 0x676C6F6275736476;
  v30.mElement = 0;
  unint64_t v4 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v22, &v30);
  *((void *)&v7 + 1) = v5;
  *(void *)&long long v7 = v4;
  uint64_t v6 = v7 >> 32;
  if ((v6 & 0xFF00000000) != 0)
  {
    Boolean outIsSettable = 0;
    AudioObjectIsPropertySettable(a1, &inAddress, &outIsSettable);
    int v8 = outIsSettable;
    v23[0] = 0;
    v23[1] = 0;
    __n128 v22 = v23;
    std::string::basic_string[abi:ne180100]<0>(&v20, "int");
    strcpy((char *)v28, "'usdv'");
    std::string::basic_string[abi:ne180100]<0>(v17, (char *)v28);
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[9],std::string>((applesauce::CF::TypeRef *)&v30, (uint64_t)v17);
    strcpy((char *)__p, "'glob'");
    std::string::basic_string[abi:ne180100]<0>(v28, (char *)__p);
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[6],std::string>((applesauce::CF::TypeRef *)&v31, (uint64_t)v28);
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[8],unsigned int const&>((applesauce::CF::TypeRef *)&v32, (int *)&inAddress.mElement);
    std::string::basic_string[abi:ne180100]<0>(__p, "int");
    applesauce::CF::TypeRefPair::TypeRefPair<char const(&)[5],std::string const>((applesauce::CF::TypeRef *)&v33, (uint64_t)__p);
    applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v34, "settable");
    uint64_t v9 = *MEMORY[0x263EFFB40];
    uint64_t v10 = *MEMORY[0x263EFFB38];
    if (v8 != 1) {
      uint64_t v9 = *MEMORY[0x263EFFB38];
    }
    v34[1] = v9;
    applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v35, "requires set request");
    v35[1] = v10;
    applesauce::CF::TypeRef::TypeRef((applesauce::CF::TypeRef *)v36, "data");
    v37[0] = v16;
    CFNumberRef v16 = 0;
    v19[0] = &v30;
    v19[1] = 7;
    CFDictionaryRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((uint64_t)v19);
    uint64_t v12 = 0;
    CFDictionaryRef v15 = CFDictionaryRef;
    do
    {
      int64x2_t v13 = (const void *)v37[v12];
      if (v13) {
        CFRelease(v13);
      }
      char v14 = *(const void **)&v36[v12 * 8];
      if (v14) {
        CFRelease(v14);
      }
      v12 -= 2;
    }
    while (v12 != -14);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    if (v29 < 0) {
      operator delete(v28[0]);
    }
    if (v18 < 0) {
      operator delete(v17[0]);
    }
    if (v21 < 0) {
      operator delete(v20);
    }
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(v23[0]);
    std::vector<applesauce::CF::DictionaryRef>::push_back[abi:ne180100](a2, (CFTypeRef *)&v15);
    if (CFDictionaryRef) {
      CFRelease(CFDictionaryRef);
    }
  }
}

void sub_249C2650C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,char a47)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(&__p, a1[1] - *a1);
  unint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    unint64_t v4 = __p;
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((const void **)__p, (uint64_t)v9);
  if (__p)
  {
    uint64_t v9 = __p;
    operator delete(__p);
  }
  return CFArray;
}

void sub_249C266A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void anonymous namespace'::GetStreams(_anonymous_namespace_ *this, int a2, uint64_t a3)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  LODWORD(v25) = a2;
  CFTypeRef cf = (CFTypeRef)((a3 << 32) | 0x73746D23);
  LODWORD(v27) = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, (AudioObjectID *)&v25, (AudioObjectPropertyAddress *)&cf);
  LOBYTE(cf) = 0;
  int v4 = v31;
  if ((_BYTE)v31)
  {
    CFTypeRef cf = *(CFTypeRef *)v30;
    long long v27 = *(_OWORD *)&v30[8];
    char v28 = 1;
    uint64_t v5 = *(unsigned int **)&v30[8];
    p_CFTypeRef cf = (unsigned int **)&cf;
  }
  else
  {
    uint64_t v5 = 0;
    p_CFTypeRef cf = (unsigned int **)&__p;
  }
  std::string __p = 0;
  *(_OWORD *)AudioObjectPropertyAddress v30 = 0uLL;
  long long v7 = *p_cf;
  p_cf[1] = 0;
  p_cf[2] = 0;
  *p_CFTypeRef cf = 0;
  if (__p) {
    operator delete(__p);
  }
  if (v4 && cf) {
    operator delete((void *)cf);
  }
  if (v7 != v5)
  {
    int v8 = v7;
    do
    {
      uint64_t v9 = (ca::hal::detail::HALPropertyPolicy *)*v8;
      if (cf)
      {
        uint64_t v10 = (void *)*((void *)this + 1);
        unint64_t v11 = *((void *)this + 2);
        if ((unint64_t)v10 >= v11)
        {
          uint64_t v12 = *(void **)this;
          uint64_t v13 = ((uint64_t)v10 - *(void *)this) >> 3;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61) {
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v15 = v11 - (void)v12;
          if (v15 >> 2 > v14) {
            unint64_t v14 = v15 >> 2;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          uint64_t v31 = (char *)this + 16;
          if (v16)
          {
            unint64_t v16 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v16);
            uint64_t v12 = *(void **)this;
            uint64_t v10 = (void *)*((void *)this + 1);
          }
          else
          {
            uint64_t v17 = 0;
          }
          char v18 = (void *)(v16 + 8 * v13);
          unint64_t v19 = v16 + 8 * v17;
          *(void *)&v30[16] = v19;
          *char v18 = v25;
          unint64_t v20 = v18 + 1;
          uint64_t v25 = 0;
          *(void *)&v30[8] = v18 + 1;
          if (v10 == v12)
          {
            __n128 v22 = 0;
          }
          else
          {
            do
            {
              uint64_t v21 = *--v10;
              *--char v18 = v21;
              void *v10 = 0;
            }
            while (v10 != v12);
            unint64_t v20 = *(void **)&v30[8];
            unint64_t v19 = *(void *)&v30[16];
            __n128 v22 = v25;
          }
          long long v23 = *(_OWORD *)this;
          *(void *)this = v18;
          *((void *)this + 1) = v20;
          *(_OWORD *)AudioObjectPropertyAddress v30 = v23;
          uint64_t v24 = *((void *)this + 2);
          *((void *)this + 2) = v19;
          *(void *)&v30[16] = v24;
          std::string __p = (void *)v23;
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)&__p);
          *((void *)this + 1) = v20;
          if (v22) {
            CFRelease(v22);
          }
        }
        else
        {
          void *v10 = v25;
          *((void *)this + 1) = v10 + 1;
        }
        if (cf) {
          CFRelease(cf);
        }
      }
      ++v8;
    }
    while (v8 != v5);
  }
  if (v7) {
    operator delete(v7);
  }
}

void sub_249C268F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)&a9);
  applesauce::CF::DictionaryRef::~DictionaryRef((const void **)&a10);
  if (v10) {
    operator delete(v10);
  }
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  _Unwind_Resume(a1);
}

void anonymous namespace'::ConvertDataToTypeRef<std::string>()
{
}

void sub_249C269F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(void *a1, const UInt8 *a2, const void **a3)
{
  uint64_t v6 = a1 + 2;
  unint64_t v7 = a1[2];
  unint64_t v8 = a1[1];
  if (v8 >= v7)
  {
    uint64_t v11 = (uint64_t)(v8 - *a1) >> 4;
    if ((unint64_t)(v11 + 1) >> 60) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - *a1;
    uint64_t v13 = v12 >> 3;
    if (v12 >> 3 <= (unint64_t)(v11 + 1)) {
      uint64_t v13 = v11 + 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v14 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    unint64_t v20 = v6;
    if (v14) {
      unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v14);
    }
    else {
      uint64_t v15 = 0;
    }
    unint64_t v16 = v14;
    uint64_t v17 = (CFStringRef *)(v14 + 16 * v11);
    unint64_t v19 = v14 + 16 * v15;
    applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,applesauce::CF::TypeRef const&>(v17, a2, a3);
    char v18 = v17 + 2;
    std::vector<applesauce::CF::TypeRefPair>::__swap_out_circular_buffer(a1, &v16);
    unint64_t v10 = a1[1];
    uint64_t result = std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)&v16);
  }
  else
  {
    uint64_t result = (uint64_t)applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,applesauce::CF::TypeRef const&>((CFStringRef *)a1[1], a2, a3);
    unint64_t v10 = v8 + 16;
    a1[1] = v8 + 16;
  }
  a1[1] = v10;
  return result;
}

void sub_249C26B24(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<applesauce::CF::TypeRefPair>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(std::string *this, uint64_t a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  int v3 = *(char *)(a2 + 23);
  if (v3 >= 0) {
    uint64_t v4 = (char *)a2;
  }
  else {
    uint64_t v4 = *(char **)a2;
  }
  if (v3 >= 0) {
    unint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    unint64_t v5 = *(void *)(a2 + 8);
  }
  if (v5)
  {
    if (v4 >= (char *)this && (char *)&this->__r_.__value_.__l.__data_ + 1 > v4)
    {
      std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, v4, &v4[v5], v5);
      if ((v13 & 0x80u) == 0) {
        uint64_t v9 = __p;
      }
      else {
        uint64_t v9 = (void **)__p[0];
      }
      if ((v13 & 0x80u) == 0) {
        std::string::size_type v10 = v13;
      }
      else {
        std::string::size_type v10 = (std::string::size_type)__p[1];
      }
      std::string::append(this, (const std::string::value_type *)v9, v10);
      if ((char)v13 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      unint64_t v7 = this;
      if (v5 >= 0x17)
      {
        std::string::__grow_by(this, 0x16uLL, v5 - 22, 0, 0, 0, 0);
        this->__r_.__value_.__l.__size_ = 0;
        unint64_t v7 = this;
        if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
          unint64_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
        }
      }
      for (uint64_t i = 0; i != v5; ++i)
        v7->__r_.__value_.__s.__data_[i] = v4[i];
      v7->__r_.__value_.__s.__data_[i] = 0;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        this->__r_.__value_.__l.__size_ = v5;
      }
      else {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = v5 & 0x7F;
      }
    }
  }
  return this;
}

void sub_249C26CF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void *caulk::string_from_4cc(caulk *this)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  strcpy(v2, "'nope'");
  return std::string::basic_string[abi:ne180100]<0>(this, v2);
}

void sub_249C26D8C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void *std::string::__init_with_size[abi:ne180100]<char const*,char const*>(void *result, char *a2, char *a3, unint64_t a4)
{
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v7 = result;
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v7[1] = a4;
    AudioObjectPropertyAddress v7[2] = v9 | 0x8000000000000000;
    *unint64_t v7 = result;
    unint64_t v7 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)unint64_t v7 = v10;
    unint64_t v7 = (void *)((char *)v7 + 1);
  }
  *(unsigned char *)unint64_t v7 = 0;
  return result;
}

CFStringRef *applesauce::CF::TypeRefPair::TypeRefPair<std::string const&,applesauce::CF::TypeRef const&>(CFStringRef *a1, const UInt8 *a2, const void **a3)
{
  CFIndex v5 = *((void *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    CFIndex v6 = a2[23];
  }
  else
  {
    a2 = *(const UInt8 **)a2;
    CFIndex v6 = v5;
  }
  CFStringRef v7 = CFStringCreateWithBytes(0, a2, v6, 0x8000100u, 0);
  *a1 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  CFStringRef v8 = (const __CFString *)*a3;
  if (v8) {
    CFRetain(v8);
  }
  a1[1] = v8;
  return a1;
}

void sub_249C26EF0(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<applesauce::CF::NumberRef>::reserve(void *result, unint64_t a2)
{
  if (a2 > (uint64_t)(result[2] - *result) >> 3)
  {
    if (a2 >> 61) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v2 = (char **)result;
    uint64_t v3 = result[1] - *result;
    uint64_t v15 = result + 2;
    uint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(a2);
    CFStringRef v7 = *v2;
    CFIndex v6 = v2[1];
    if (v6 == *v2)
    {
      int64x2_t v10 = vdupq_n_s64((unint64_t)v6);
      CFStringRef v8 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      CFStringRef v8 = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v9 = *((void *)v6 - 1);
        v6 -= 8;
        *((void *)v8 - 1) = v9;
        v8 -= 8;
        *(void *)CFIndex v6 = 0;
      }
      while (v6 != v7);
      int64x2_t v10 = *(int64x2_t *)v2;
    }
    uint64_t *v2 = v8;
    v2[1] = &v4[v3 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v13 = v10;
    uint64_t v11 = v2[2];
    v2[2] = &v4[8 * v5];
    unint64_t v14 = v11;
    uint64_t v12 = v10.i64[0];
    return (void *)std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer((uint64_t)&v12);
  }
  return result;
}

CFArrayRef applesauce::CF::details::make_CFArrayRef<applesauce::CF::NumberRef>(uint64_t **a1)
{
  std::vector<void const*>::vector(&__p, a1[1] - *a1);
  unint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (*a1 != v3)
  {
    uint64_t v4 = __p;
    do
    {
      uint64_t v5 = *v2++;
      *v4++ = v5;
    }
    while (v2 != v3);
  }
  CFArrayRef CFArray = applesauce::CF::details::make_CFArrayRef<void const*>((const void **)__p, (uint64_t)v9);
  if (__p)
  {
    uint64_t v9 = __p;
    operator delete(__p);
  }
  return CFArray;
}

void sub_249C2705C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFNumberRef *std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,unsigned int,applesauce::CF::NumberRef*>(CFNumberRef *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a1 = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C27104(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<applesauce::CF::NumberRef>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        CFIndex v6 = (const void *)*((void *)v4 - 1);
        v4 -= 8;
        std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(const void *a1)
{
  if (a1) {
    CFRelease(a1);
  }
}

uint64_t std::__split_buffer<applesauce::CF::NumberRef>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = *(const void **)(i - 8);
    *(void *)(a1 + 16) = i - 8;
    std::__destroy_at[abi:ne180100]<applesauce::CF::NumberRef,0>(v4);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(void *a1, CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  *a1 = cf;
  return a1;
}

void anonymous namespace'::GetStreamInfo(_anonymous_namespace_ *this, ca::hal::detail::HALPropertyPolicy *a2)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  *(_DWORD *)CFTypeRef cf = a2;
  strcpy((char *)valuePtr, "spatbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  unint64_t v5 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)cf, valuePtr);
  *((void *)&v7 + 1) = v6;
  *(void *)&long long v7 = v5;
  BOOL v8 = ((v7 >> 32) & 0xFF00000000) == 0 || HIDWORD(v5) == 0;
  if (!v8)
  {
    *(void *)this = 0;
    return;
  }
  CFDictionaryRef v82 = this;
  unsigned int v91 = 0;
  unint64_t v92 = 0;
  CFStringRef v89 = 0;
  CFNumberRef v90 = (uint64_t *)&v91;
  int64x2_t v88 = 0uLL;
  LODWORD(v95) = a2;
  strcpy(cf, "amfsbolg");
  cf[9] = 0;
  *(_WORD *)&cf[10] = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<AudioStreamRangedDescription>,void>::Get((uint64_t)valuePtr, (AudioObjectID *)&v95, (AudioObjectPropertyAddress *)cf);
  __p[0] = 0;
  int mElement_low = LOBYTE(valuePtr[2].mElement);
  if (LOBYTE(valuePtr[2].mElement))
  {
    unint64_t v2 = *(const AudioStreamRangedDescription **)&valuePtr[0].mElement;
    *(void *)std::string __p = *(void *)&valuePtr[0].mElement;
    *(_OWORD *)&__p[8] = *(_OWORD *)&valuePtr[1].mScope;
    for (uint64_t i = *(const AudioStreamRangedDescription **)&valuePtr[1].mScope; v2 != i; ++v2)
    {
      uint64_t v11 = *(const void **)cf;
      if (*(void *)cf)
      {
        if (v88.i64[1] >= (unint64_t)v89)
        {
          uint64_t v12 = (v88.i64[1] - v88.i64[0]) >> 3;
          if ((unint64_t)(v12 + 1) >> 61) {
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v13 = (uint64_t)&v89[-v88.i64[0]] >> 2;
          if (v13 <= v12 + 1) {
            unint64_t v13 = v12 + 1;
          }
          if ((unint64_t)&v89[-v88.i64[0]] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v14 = v13;
          }
          *(void *)&valuePtr[2].mElement = &v89;
          if (v14)
          {
            unint64_t v16 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v14);
          }
          else
          {
            unint64_t v16 = 0;
            uint64_t v15 = 0;
          }
          uint64_t v17 = (char *)&v16[v15];
          *(void *)&valuePtr[2].mSelector = v17;
          char v18 = std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(&v16[v12], v11);
          unint64_t v19 = v18 + 1;
          *(void *)&valuePtr[1].mScope = v18 + 1;
          unint64_t v20 = (void *)v88.i64[1];
          uint64_t v21 = (void *)v88.i64[0];
          if (v88.i64[1] == v88.i64[0])
          {
            int64x2_t v23 = vdupq_n_s64(v88.u64[1]);
          }
          else
          {
            do
            {
              uint64_t v22 = *--v20;
              *--char v18 = v22;
              *unint64_t v20 = 0;
            }
            while (v20 != v21);
            int64x2_t v23 = v88;
            uint64_t v17 = *(char **)&valuePtr[2].mSelector;
            unint64_t v19 = *(void **)&valuePtr[1].mScope;
          }
          v88.i64[0] = (uint64_t)v18;
          v88.i64[1] = (uint64_t)v19;
          *(int64x2_t *)&valuePtr[0].mElement = v23;
          uint64_t v24 = v89;
          CFStringRef v89 = v17;
          *(void *)&valuePtr[2].mSelector = v24;
          *(void *)&valuePtr[0].mSelector = v23.i64[0];
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)valuePtr);
          uint64_t v11 = *(const void **)cf;
          v88.i64[1] = (uint64_t)v19;
          if (!*(void *)cf) {
            continue;
          }
        }
        else
        {
          v88.i64[1] = (uint64_t)(std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>((void *)v88.i64[1], *(CFTypeRef *)cf)+ 1);
        }
        CFRelease(v11);
      }
    }
    int v83 = 1;
  }
  else
  {
    int v83 = 0;
  }
  inAddress.mSelector = a2;
  *(void *)&long long v95 = 0x676C6F6270667461;
  DWORD2(v95) = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<AudioStreamRangedDescription>,void>::Get((uint64_t)valuePtr, &inAddress.mSelector, (AudioObjectPropertyAddress *)&v95);
  cf[0] = 0;
  if (LOBYTE(valuePtr[2].mElement))
  {
    *(_OWORD *)CFTypeRef cf = *(_OWORD *)&valuePtr[0].mElement;
    int v25 = 1;
    unint64_t v2 = *(const AudioStreamRangedDescription **)&valuePtr[2].mSelector;
  }
  else
  {
    int v25 = 0;
  }
  if (v83 != v25)
  {
    if (mElement_low)
    {
      if (*(void *)__p)
      {
        *(void *)&__p[8] = *(void *)__p;
        operator delete(*(void **)__p);
      }
      int v83 = 0;
      if (!v25) {
        goto LABEL_47;
      }
    }
    else
    {
      *(_OWORD *)std::string __p = *(_OWORD *)cf;
      *(void *)&__p[16] = v2;
      *(void *)CFTypeRef cf = 0;
      *(void *)&cf[8] = 0;
      int v83 = 1;
      if (!v25) {
        goto LABEL_47;
      }
    }
LABEL_45:
    if (*(void *)cf) {
      operator delete(*(void **)cf);
    }
    goto LABEL_47;
  }
  if (!mElement_low)
  {
    BOOL v81 = 1;
    goto LABEL_68;
  }
  if (*(void *)__p)
  {
    *(void *)&__p[8] = *(void *)__p;
    operator delete(*(void **)__p);
  }
  *(_OWORD *)std::string __p = *(_OWORD *)cf;
  *(void *)&__p[16] = v2;
  *(void *)CFTypeRef cf = 0;
  *(void *)&cf[8] = 0;
  if (v25) {
    goto LABEL_45;
  }
LABEL_47:
  BOOL v81 = v83 == 0;
  if (v83)
  {
    uint64_t v26 = *(const AudioStreamRangedDescription **)__p;
    for (j = *(const AudioStreamRangedDescription **)&__p[8]; v26 != j; ++v26)
    {
      char v28 = *(const void **)cf;
      if (*(void *)cf)
      {
        if (v88.i64[1] >= (unint64_t)v89)
        {
          uint64_t v29 = (v88.i64[1] - v88.i64[0]) >> 3;
          if ((unint64_t)(v29 + 1) >> 61) {
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v30 = (uint64_t)&v89[-v88.i64[0]] >> 2;
          if (v30 <= v29 + 1) {
            unint64_t v30 = v29 + 1;
          }
          if ((unint64_t)&v89[-v88.i64[0]] >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v31 = v30;
          }
          *(void *)&valuePtr[2].mElement = &v89;
          if (v31)
          {
            uint64_t v33 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v31);
          }
          else
          {
            uint64_t v33 = 0;
            uint64_t v32 = 0;
          }
          unint64_t v34 = (char *)&v33[v32];
          *(void *)&valuePtr[2].mSelector = v34;
          unint64_t v35 = std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>(&v33[v29], v28);
          uint64_t v36 = v35 + 1;
          *(void *)&valuePtr[1].mScope = v35 + 1;
          uint64_t v37 = (void *)v88.i64[1];
          unint64_t v38 = (void *)v88.i64[0];
          if (v88.i64[1] == v88.i64[0])
          {
            int64x2_t v40 = vdupq_n_s64(v88.u64[1]);
          }
          else
          {
            do
            {
              uint64_t v39 = *--v37;
              *--unint64_t v35 = v39;
              *uint64_t v37 = 0;
            }
            while (v37 != v38);
            int64x2_t v40 = v88;
            unint64_t v34 = *(char **)&valuePtr[2].mSelector;
            uint64_t v36 = *(void **)&valuePtr[1].mScope;
          }
          v88.i64[0] = (uint64_t)v35;
          v88.i64[1] = (uint64_t)v36;
          *(int64x2_t *)&valuePtr[0].mElement = v40;
          unint64_t v41 = v89;
          CFStringRef v89 = v34;
          *(void *)&valuePtr[2].mSelector = v41;
          *(void *)&valuePtr[0].mSelector = v40.i64[0];
          std::__split_buffer<applesauce::CF::DictionaryRef>::~__split_buffer((uint64_t)valuePtr);
          char v28 = *(const void **)cf;
          v88.i64[1] = (uint64_t)v36;
          if (!*(void *)cf) {
            continue;
          }
        }
        else
        {
          v88.i64[1] = (uint64_t)(std::construct_at[abi:ne180100]<applesauce::CF::DictionaryRef,applesauce::CF::DictionaryRef const&,applesauce::CF::DictionaryRef*>((void *)v88.i64[1], *(CFTypeRef *)cf)+ 1);
        }
        CFRelease(v28);
      }
    }
  }
LABEL_68:
  CFArrayRef v42 = applesauce::CF::details::make_CFArrayRef<applesauce::CF::DictionaryRef>((uint64_t **)&v88);
  *(void *)CFTypeRef cf = v42;
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "supported formats");
  *(void *)&long long v95 = valuePtr;
  uint64_t v43 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v90, valuePtr, (_OWORD **)&v95);
  uint64_t v44 = (const void *)*((void *)v43 + 7);
  *((void *)v43 + 7) = v42;
  *(void *)CFTypeRef cf = v44;
  if (SHIBYTE(valuePtr[1].mElement) < 0)
  {
    operator delete(*(void **)&valuePtr[0].mSelector);
    if (!v44) {
      goto LABEL_73;
    }
    goto LABEL_72;
  }
  if (v44) {
LABEL_72:
  }
    CFRelease(v44);
LABEL_73:
  LODWORD(v95) = a2;
  strcpy((char *)valuePtr, "ridsbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  unint64_t v45 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v95, valuePtr);
  *((void *)&v48 + 1) = v46;
  *(void *)&long long v48 = v45;
  uint64_t v47 = v48 >> 32;
  if ((v47 & 0xFF00000000) == 0) {
    LODWORD(v47) = 0;
  }
  valuePtr[0].mSelector = v47;
  CFNumberRef v49 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  *(void *)CFTypeRef cf = v49;
  if (!v49)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "is input");
  *(void *)&long long v95 = valuePtr;
  unint64_t v50 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v90, valuePtr, (_OWORD **)&v95);
  uint64_t v51 = (const void *)*((void *)v50 + 7);
  *((void *)v50 + 7) = v49;
  *(void *)CFTypeRef cf = v51;
  if (SHIBYTE(valuePtr[1].mElement) < 0)
  {
    operator delete(*(void **)&valuePtr[0].mSelector);
    if (!v51) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
  if (v51) {
LABEL_80:
  }
    CFRelease(v51);
LABEL_81:
  LODWORD(v95) = a2;
  strcpy((char *)valuePtr, "cntlbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  unint64_t v52 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v95, valuePtr);
  *((void *)&v55 + 1) = v53;
  *(void *)&long long v55 = v52;
  uint64_t v54 = v55 >> 32;
  if ((v54 & 0xFF00000000) == 0) {
    LODWORD(v54) = 0;
  }
  valuePtr[0].mSelector = v54;
  CFNumberRef v56 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  *(void *)CFTypeRef cf = v56;
  if (!v56)
  {
    unint64_t v79 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v79, "Could not construct");
    __cxa_throw(v79, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "latency");
  *(void *)&long long v95 = valuePtr;
  uint64_t v57 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v90, valuePtr, (_OWORD **)&v95);
  int v58 = (const void *)*((void *)v57 + 7);
  *((void *)v57 + 7) = v56;
  *(void *)CFTypeRef cf = v58;
  if (SHIBYTE(valuePtr[1].mElement) < 0)
  {
    operator delete(*(void **)&valuePtr[0].mSelector);
    if (!v58) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
  if (v58) {
LABEL_88:
  }
    CFRelease(v58);
LABEL_89:
  LODWORD(v95) = a2;
  strcpy((char *)valuePtr, "mretbolg");
  BYTE1(valuePtr[0].mElement) = 0;
  HIWORD(valuePtr[0].mElement) = 0;
  unint64_t v59 = ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,unsigned int,void>::Get((AudioObjectID *)&v95, valuePtr);
  *((void *)&v62 + 1) = v60;
  *(void *)&long long v62 = v59;
  uint64_t v61 = v62 >> 32;
  if ((v61 & 0xFF00000000) == 0) {
    LODWORD(v61) = 0;
  }
  valuePtr[0].mSelector = v61;
  CFNumberRef v63 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  *(void *)CFTypeRef cf = v63;
  if (!v63)
  {
    unint64_t v80 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v80, "Could not construct");
    __cxa_throw(v80, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "terminal type");
  *(void *)&long long v95 = valuePtr;
  uint64_t v64 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v90, valuePtr, (_OWORD **)&v95);
  uint64_t v65 = (const void *)*((void *)v64 + 7);
  *((void *)v64 + 7) = v63;
  *(void *)CFTypeRef cf = v65;
  if ((SHIBYTE(valuePtr[1].mElement) & 0x80000000) == 0)
  {
    if (!v65) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }
  operator delete(*(void **)&valuePtr[0].mSelector);
  if (v65) {
LABEL_96:
  }
    CFRelease(v65);
LABEL_97:
  *(void *)&inAddress.mSelector = 0x676C6F6273666D74;
  inAddress.mElement = 0;
  if (!AudioObjectHasProperty((AudioObjectID)a2, &inAddress)
    || (ioDataSize[0] = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize(a2, &inAddress, 0, 0, v66)) == 0
    || (memset(valuePtr, 0, 40), AudioObjectGetPropertyData((AudioObjectID)a2, &inAddress, 0, 0, ioDataSize, valuePtr)))
  {
    unint64_t v77 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(v77, "error getting property");
    __cxa_throw(v77, MEMORY[0x263F8C1E0], MEMORY[0x263F8C048]);
  }
  long long v95 = *(_OWORD *)((char *)&valuePtr[0].mSelector + 1);
  *(_OWORD *)CFNumberRef v96 = *(_OWORD *)((char *)&valuePtr[1].mScope + 1);
  *(unint64_t *)((char *)&v96[1] + 7) = *(void *)&valuePtr[2].mElement;
  cf[0] = valuePtr[0].mSelector;
  *(_OWORD *)&cf[1] = *(_OWORD *)((char *)&valuePtr[0].mSelector + 1);
  *(_OWORD *)unsigned int v86 = *(_OWORD *)v96;
  *(void *)&v86[15] = *(void *)&valuePtr[2].mElement;
  memset(valuePtr, 0, 24);
  std::vector<applesauce::CF::TypeRefPair>::reserve(valuePtr, v96[0]);
  uint64_t v67 = (_OWORD *)v95;
  if ((long long *)v95 != (long long *)((char *)&v95 + 8))
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(valuePtr, (const UInt8 *)v67 + 32, (const void **)v67 + 7);
      AudioObjectID v68 = (void *)*((void *)v67 + 1);
      if (v68)
      {
        do
        {
          uint64_t v69 = v68;
          AudioObjectID v68 = (void *)*v68;
        }
        while (v68);
      }
      else
      {
        do
        {
          uint64_t v69 = (_OWORD *)*((void *)v67 + 2);
          BOOL v8 = *(void *)v69 == (void)v67;
          uint64_t v67 = v69;
        }
        while (!v8);
      }
      uint64_t v67 = v69;
    }
    while (v69 != (long long *)((char *)&v95 + 8));
  }
  CFDictionaryRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef((void ***)valuePtr);
  *(void *)&inAddress.mSelector = valuePtr;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&inAddress);
  CFRetain(CFDictionaryRef);
  *(void *)UInt32 ioDataSize = CFDictionaryRef;
  std::string::basic_string[abi:ne180100]<0>(valuePtr, "basic description");
  *(void *)&inAddress.mSelector = valuePtr;
  int v71 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v90, valuePtr, &inAddress);
  CFDictionaryRef v72 = (const void *)*((void *)v71 + 7);
  *((void *)v71 + 7) = CFDictionaryRef;
  *(void *)UInt32 ioDataSize = v72;
  if ((SHIBYTE(valuePtr[1].mElement) & 0x80000000) == 0)
  {
    if (!v72) {
      goto LABEL_112;
    }
    goto LABEL_111;
  }
  operator delete(*(void **)&valuePtr[0].mSelector);
  if (v72) {
LABEL_111:
  }
    CFRelease(v72);
LABEL_112:
  CFRelease(CFDictionaryRef);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(*((void **)&v95 + 1));
  memset(valuePtr, 0, 24);
  std::vector<applesauce::CF::TypeRefPair>::reserve(valuePtr, v92);
  CFStringRef v73 = v90;
  if (v90 != (uint64_t *)&v91)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(valuePtr, (const UInt8 *)v73 + 32, (const void **)v73 + 7);
      CFArrayRef v74 = (uint64_t *)v73[1];
      if (v74)
      {
        do
        {
          uint64_t v75 = v74;
          CFArrayRef v74 = (uint64_t *)*v74;
        }
        while (v74);
      }
      else
      {
        do
        {
          uint64_t v75 = (uint64_t *)v73[2];
          BOOL v8 = *v75 == (void)v73;
          CFStringRef v73 = v75;
        }
        while (!v8);
      }
      CFStringRef v73 = v75;
    }
    while (v75 != (uint64_t *)&v91);
  }
  CFDictionaryRef v76 = applesauce::CF::details::make_CFDictionaryRef((void ***)valuePtr);
  *(void *)&long long v95 = valuePtr;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&v95);
  *(void *)CFDictionaryRef v82 = v76;
  if (!v81)
  {
    if (*(void *)__p) {
      operator delete(*(void **)__p);
    }
  }
  *(void *)&valuePtr[0].mSelector = &v88;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)valuePtr);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(v91);
}

void sub_249C27CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13, char a14, int a15, __int16 a16, char a17, char a18, char *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (a13)
  {
    if (__p) {
      operator delete(__p);
    }
  }
  a19 = &a29;
  std::vector<applesauce::CF::DictionaryRef>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(a33);
  _Unwind_Resume(a1);
}

void ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<AudioStreamRangedDescription>,void>::Get(uint64_t a1, AudioObjectID *a2, AudioObjectPropertyAddress *inAddress)
{
  if (!AudioObjectHasProperty(*a2, inAddress))
  {
    *(_DWORD *)a1 = 2003332927;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 32) = 0;
    return;
  }
  int v24 = 2003329396;
  LOBYTE(__p[0]) = 0;
  char v27 = 0;
  UInt32 PropertyDataSize = ca::hal::detail::HALPropertyPolicy::GetPropertyDataSize((ca::hal::detail::HALPropertyPolicy *)*a2, inAddress, 0, 0, v6);
  UInt32 ioDataSize = PropertyDataSize;
  if (!PropertyDataSize)
  {
    *(_DWORD *)a1 = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = 0;
    *(void *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 32) = 1;
    return;
  }
  BOOL v8 = 0;
  uint64_t v9 = 0;
  unint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  if (PropertyDataSize >= 0x38)
  {
    unint64_t v10 = PropertyDataSize / 0x38uLL;
    std::vector<AudioStreamRangedDescription>::__vallocate[abi:ne180100](&v20, v10);
    uint64_t v11 = (char *)v21;
    size_t v12 = 56 * ((56 * (unint64_t)v10 - 56) / 0x38) + 56;
    bzero(v21, v12);
    BOOL v8 = &v11[v12];
    uint64_t v21 = v8;
    uint64_t v9 = v20;
  }
  OSStatus PropertyData = AudioObjectGetPropertyData(*a2, inAddress, 0, 0, &ioDataSize, v9);
  OSStatus v14 = PropertyData;
  int v24 = PropertyData;
  if (PropertyData)
  {
    *(_DWORD *)a1 = PropertyData;
    *(unsigned char *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 32) = 0;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v26 = 0;
    long long v15 = 0uLL;
    *(_OWORD *)std::string __p = 0u;
    int64_t v16 = v8 - (unsigned char *)v9;
    if (v16)
    {
      std::vector<AudioStreamRangedDescription>::__vallocate[abi:ne180100](__p, 0x6DB6DB6DB6DB6DB7 * (v16 >> 3));
      uint64_t v17 = (char *)__p[1];
      memmove(__p[1], v9, v16);
      __p[1] = &v17[8 * (v16 >> 3)];
      int v18 = v24;
      long long v15 = *(_OWORD *)__p;
      uint64_t v19 = v26;
    }
    else
    {
      uint64_t v19 = 0;
      int v18 = 0;
    }
    *(_DWORD *)a1 = v18;
    *(_OWORD *)(a1 + 8) = v15;
    *(void *)(a1 + 24) = v19;
    __p[1] = 0;
    uint64_t v26 = 0;
    __p[0] = 0;
    *(unsigned char *)(a1 + 32) = 1;
    if (!v9) {
      goto LABEL_8;
    }
  }
  operator delete(v9);
LABEL_8:
  if (!v14)
  {
    if (__p[0]) {
      operator delete(__p[0]);
    }
  }
}

void sub_249C2806C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p) {
    operator delete(__p);
  }
  __clang_call_terminate(a1);
}

void anonymous namespace'::GetASRDInfo(_anonymous_namespace_ *this, const AudioStreamRangedDescription *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v3 = *(_OWORD *)&a2->mFormat.mBytesPerPacket;
  long long v23 = *(_OWORD *)&a2->mFormat.mSampleRate;
  long long v24 = v3;
  uint64_t v4 = *(void *)&a2->mFormat.mBitsPerChannel;
  uint64_t v25 = v4;
  BOOL v5 = DWORD2(v3) * DWORD1(v3) != v3 && DWORD2(v23) == 1819304813;
  if (v5)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because (asbd.mBytesPerFrame * asbd.mFramesPerPacket == asbd.mBytesPerPacket) and asbd.mFormatID == kAudioFormatLinearPCM returned false.");
    goto LABEL_38;
  }
  if (*(double *)&v23 < 0.0)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because sample rate was less than 0");
    goto LABEL_38;
  }
  if ((BYTE12(v23) & 1) == 0 && v4 >= 0x19)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because !(asbd.mFormatFlags & kAudioFormatFlagIsFloat) && (asbd.mBitsPerChannel > 24).");
    goto LABEL_38;
  }
  if (DWORD2(v3) < (v4 * HIDWORD(v24)) >> 3 && DWORD2(v23) == 1819304813)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "ASBD is not valid because not (asbd.mBitsPerChannel * asbd.mChannelsPerFrame / 8 == asbd.mBytesPerFrame) and asbd.mFormatID == kAudioFormatLinearPCM.");
LABEL_38:
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C3A0] + 16);
    __cxa_throw(exception, (struct type_info *)off_26527D640, MEMORY[0x263F8C080]);
  }
  if (a2->mSampleRateRange.mMinimum != 0.0 || a2->mSampleRateRange.mMaximum != 0.0)
  {
    valuePtr[0] = *(void ***)&a2->mSampleRateRange.mMinimum;
    CFNumberRef v8 = CFNumberCreate(0, kCFNumberDoubleType, valuePtr);
    if (!v8)
    {
      uint64_t v19 = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x24C5B19C0](v19, "Could not construct");
      __cxa_throw(v19, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
    std::string::basic_string[abi:ne180100]<0>(valuePtr, "min sample rate");
    uint64_t v26 = valuePtr;
    uint64_t v9 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, valuePtr, (_OWORD **)&v26);
    unint64_t v10 = (const void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v8;
    if (SHIBYTE(v28) < 0)
    {
      operator delete(valuePtr[0]);
      if (!v10) {
        goto LABEL_20;
      }
    }
    else if (!v10)
    {
LABEL_20:
      valuePtr[0] = *(void ***)&a2->mSampleRateRange.mMaximum;
      CFNumberRef v11 = CFNumberCreate(0, kCFNumberDoubleType, valuePtr);
      if (!v11)
      {
        unint64_t v20 = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x24C5B19C0](v20, "Could not construct");
        __cxa_throw(v20, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
      }
      std::string::basic_string[abi:ne180100]<0>(valuePtr, "max sample rate");
      uint64_t v26 = valuePtr;
      size_t v12 = std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, valuePtr, (_OWORD **)&v26);
      unint64_t v13 = (const void *)*((void *)v12 + 7);
      *((void *)v12 + 7) = v11;
      if (SHIBYTE(v28) < 0)
      {
        operator delete(valuePtr[0]);
        if (!v13) {
          goto LABEL_26;
        }
      }
      else if (!v13)
      {
        goto LABEL_26;
      }
      CFRelease(v13);
      goto LABEL_26;
    }
    CFRelease(v10);
    goto LABEL_20;
  }
LABEL_26:
  valuePtr[0] = 0;
  valuePtr[1] = 0;
  uint64_t v28 = 0;
  std::vector<applesauce::CF::TypeRefPair>::reserve(valuePtr, (unint64_t)v22[1]);
  OSStatus v14 = v21;
  if (v21 != (uint64_t *)v22)
  {
    do
    {
      std::vector<applesauce::CF::TypeRefPair>::emplace_back<std::string const&,applesauce::CF::TypeRef const&>(valuePtr, (const UInt8 *)v14 + 32, (const void **)v14 + 7);
      long long v15 = (uint64_t *)v14[1];
      if (v15)
      {
        do
        {
          int64_t v16 = v15;
          long long v15 = (uint64_t *)*v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          int64_t v16 = (uint64_t *)v14[2];
          BOOL v5 = *v16 == (void)v14;
          OSStatus v14 = v16;
        }
        while (!v5);
      }
      OSStatus v14 = v16;
    }
    while (v16 != (uint64_t *)v22);
  }
  CFDictionaryRef CFDictionaryRef = applesauce::CF::details::make_CFDictionaryRef(valuePtr);
  uint64_t v26 = valuePtr;
  std::vector<applesauce::CF::TypeRefPair>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
  *(void *)this = CFDictionaryRef;
  std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::destroy(v22[0]);
}

void sub_249C28444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,int a23,__int16 a24,int a25,__int16 a26,__int16 a27,char a28,char a29,int a30,__int16 a31,uint64_t a32)
{
}

void anonymous namespace'::GetASBDInfoRaw(_anonymous_namespace_ *this, const CA::StreamDescription *a2)
{
  v47[1] = *MEMORY[0x263EF8340];
  valuePtr[0] = *(void *)a2;
  CFNumberRef cf = CFNumberCreate(0, kCFNumberDoubleType, valuePtr);
  if (!cf)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v39, "sample rate");
  v39[3] = cf;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 2);
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v4)
  {
    uint64_t v28 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v28, "Could not construct");
    __cxa_throw(v28, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v40, "format id");
  v40[3] = v4;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 3);
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v5)
  {
    uint64_t v29 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v29, "Could not construct");
    __cxa_throw(v29, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v41, "format flags");
  v41[3] = v5;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 6);
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v6)
  {
    unint64_t v30 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v30, "Could not construct");
    __cxa_throw(v30, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v42, "bytes per frame");
  v42[3] = v6;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 5);
  CFNumberRef v7 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v7)
  {
    unint64_t v31 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v31, "Could not construct");
    __cxa_throw(v31, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v43, "frames per packet");
  v43[3] = v7;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 7);
  CFNumberRef v8 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v8)
  {
    uint64_t v32 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v32, "Could not construct");
    __cxa_throw(v32, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v44, "channels per frame");
  v44[3] = v8;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 8);
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v9)
  {
    uint64_t v33 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v33, "Could not construct");
    __cxa_throw(v33, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v45, "bits per channel");
  v45[3] = v9;
  LODWORD(valuePtr[0]) = *((_DWORD *)a2 + 4);
  CFNumberRef v10 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
  if (!v10)
  {
    unint64_t v34 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](v34, "Could not construct");
    __cxa_throw(v34, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  std::string::basic_string[abi:ne180100]<0>(v46, "bytes per packet");
  CFNumberRef v11 = 0;
  uint64_t v12 = 0;
  v47[0] = v10;
  *((void *)this + 1) = 0;
  unint64_t v13 = (void *)((char *)this + 8);
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  while (1)
  {
    OSStatus v14 = (const std::string::value_type **)&v39[4 * v12];
    long long v15 = (void *)((char *)this + 8);
    if (*(void **)this != v13)
    {
      int64_t v16 = v11;
      uint64_t v17 = (char *)this + 8;
      if (v11)
      {
        do
        {
          long long v15 = v16;
          int64_t v16 = (void *)v16[1];
        }
        while (v16);
      }
      else
      {
        do
        {
          long long v15 = (void *)*((void *)v17 + 2);
          BOOL v18 = *v15 == (void)v17;
          uint64_t v17 = (char *)v15;
        }
        while (v18);
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v15 + 4, &v39[4 * v12]) & 0x80) == 0)
      {
        uint64_t v19 = (uint64_t **)std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__find_equal<std::string>((uint64_t)this, &v38, &v39[4 * v12]);
        goto LABEL_19;
      }
    }
    if (v11)
    {
      unint64_t v38 = v15;
      uint64_t v19 = (uint64_t **)(v15 + 1);
LABEL_19:
      if (*v19) {
        goto LABEL_28;
      }
      goto LABEL_22;
    }
    unint64_t v38 = (void *)((char *)this + 8);
    uint64_t v19 = (uint64_t **)((char *)this + 8);
LABEL_22:
    unint64_t v20 = (uint64_t *)operator new(0x40uLL);
    valuePtr[0] = v20;
    valuePtr[1] = (char *)this + 8;
    char v37 = 0;
    uint64_t v21 = (std::string *)(v20 + 4);
    if (*((char *)v14 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v21, *v14, (std::string::size_type)v14[1]);
    }
    else
    {
      *(_OWORD *)&v21->__r_.__value_.__l.__data_ = *(_OWORD *)v14;
      v20[6] = (uint64_t)v14[2];
    }
    uint64_t v22 = &v39[4 * v12];
    uint64_t v23 = v22[3];
    if (v23) {
      CFRetain((CFTypeRef)v22[3]);
    }
    v20[7] = v23;
    char v37 = 1;
    std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__insert_node_at((uint64_t **)this, (uint64_t)v38, v19, v20);
    valuePtr[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100]((uint64_t)valuePtr);
LABEL_28:
    if (++v12 == 8) {
      break;
    }
    CFNumberRef v11 = (void *)*v13;
  }
  for (uint64_t i = 0; i != -32; i -= 4)
  {
    uint64_t v25 = &v39[i];
    uint64_t v26 = (const void *)v47[i];
    if (v26) {
      CFRelease(v26);
    }
    if (*((char *)v25 + 247) < 0) {
      operator delete((void *)v25[28]);
    }
  }
}

void sub_249C28BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, const void *a12, const void *a13, const void *a14, const void *a15, const void *a16, const void *a17, CFTypeRef cf, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  applesauce::CF::TypeRef::~TypeRef(&a12);
  applesauce::CF::TypeRef::~TypeRef(&a13);
  applesauce::CF::TypeRef::~TypeRef(&a14);
  applesauce::CF::TypeRef::~TypeRef(&a15);
  applesauce::CF::TypeRef::~TypeRef(&a16);
  applesauce::CF::TypeRef::~TypeRef(&a17);
  applesauce::CF::TypeRef::~TypeRef(&cf);
  while (v23 != &a23)
  {
    v23 -= 32;
    std::pair<std::string const,applesauce::CF::TypeRef>::~pair((uint64_t)v23);
  }
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,applesauce::CF::TypeRef>::~pair(uint64_t a1)
{
  unint64_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t **std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__insert_node_at(uint64_t **result, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  CFNumberRef v4 = (uint64_t *)**result;
  if (v4)
  {
    char *result = v4;
    a4 = *a3;
  }
  CFNumberRef v5 = result[1];
  *((unsigned char *)a4 + 24) = a4 == v5;
  if (a4 != v5)
  {
    do
    {
      CFNumberRef v6 = (uint64_t *)a4[2];
      if (*((unsigned char *)v6 + 24)) {
        break;
      }
      CFNumberRef v7 = (uint64_t *)v6[2];
      CFNumberRef v8 = (uint64_t *)*v7;
      if ((uint64_t *)*v7 == v6)
      {
        uint64_t v11 = v7[1];
        if (!v11 || (int v12 = *(unsigned __int8 *)(v11 + 24), v9 = (unsigned char *)(v11 + 24), v12))
        {
          if ((uint64_t *)*v6 == a4)
          {
            unint64_t v13 = (uint64_t **)a4[2];
          }
          else
          {
            unint64_t v13 = (uint64_t **)v6[1];
            OSStatus v14 = *v13;
            v6[1] = (uint64_t)*v13;
            if (v14)
            {
              v14[2] = (uint64_t)v6;
              CFNumberRef v7 = (uint64_t *)v6[2];
            }
            v13[2] = v7;
            *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = v13;
            *unint64_t v13 = v6;
            void v6[2] = (uint64_t)v13;
            CFNumberRef v7 = v13[2];
            CFNumberRef v6 = (uint64_t *)*v7;
          }
          *((unsigned char *)v13 + 24) = 1;
          *((unsigned char *)v7 + 24) = 0;
          uint64_t v17 = v6[1];
          *CFNumberRef v7 = v17;
          if (v17) {
            *(void *)(v17 + 16) = v7;
          }
          void v6[2] = v7[2];
          *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
          v6[1] = (uint64_t)v7;
          goto LABEL_29;
        }
      }
      else if (!v8 || (int v10 = *((unsigned __int8 *)v8 + 24), v9 = v8 + 3, v10))
      {
        if ((uint64_t *)*v6 == a4)
        {
          uint64_t v15 = a4[1];
          uint64_t *v6 = v15;
          if (v15)
          {
            *(void *)(v15 + 16) = v6;
            CFNumberRef v7 = (uint64_t *)v6[2];
          }
          a4[2] = (uint64_t)v7;
          *(void *)(v6[2] + 8 * (*(void *)v6[2] != (void)v6)) = a4;
          a4[1] = (uint64_t)v6;
          void v6[2] = (uint64_t)a4;
          CFNumberRef v7 = (uint64_t *)a4[2];
        }
        else
        {
          a4 = (uint64_t *)a4[2];
        }
        *((unsigned char *)a4 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        CFNumberRef v6 = (uint64_t *)v7[1];
        uint64_t v16 = *v6;
        v7[1] = *v6;
        if (v16) {
          *(void *)(v16 + 16) = v7;
        }
        void v6[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v6;
        uint64_t *v6 = (uint64_t)v7;
LABEL_29:
        AudioObjectPropertyAddress v7[2] = (uint64_t)v6;
        break;
      }
      *((unsigned char *)v6 + 24) = 1;
      a4 = v7;
      *((unsigned char *)v7 + 24) = v7 == v5;
      unsigned char *v9 = 1;
    }
    while (v7 != v5);
  }
  result[2] = (uint64_t *)((char *)result[2] + 1);
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,applesauce::CF::TypeRef>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,applesauce::CF::TypeRef>,0>((uint64_t)v1 + 32);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,applesauce::CF::TypeRef>,0>(uint64_t a1)
{
  unint64_t v2 = *(const void **)(a1 + 24);
  if (v2) {
    CFRelease(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    long long v3 = *(void **)a1;
    operator delete(v3);
  }
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void *a2)
{
  size_t v2 = a1[1];
  if (*((char *)a1 + 23) >= 0)
  {
    size_t v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = (void *)*a1;
    size_t v3 = v2;
  }
  size_t v4 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (void *)*a2;
    size_t v5 = v4;
  }
  if (v5 >= v3) {
    size_t v6 = v3;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7)
  {
    if ((v7 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (v3 == v5) {
      return 0;
    }
    if (v3 >= v5) {
      return 1;
    }
  }
  return 255;
}

void *std::__tree<std::__value_type<std::string,applesauce::CF::TypeRef>,std::__map_value_compare<std::string,std::__value_type<std::string,applesauce::CF::TypeRef>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,applesauce::CF::TypeRef>>>::__find_equal<std::string>(uint64_t a1, void *a2, void *a3)
{
  size_t v5 = (void *)(a1 + 8);
  size_t v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        int v7 = v4;
        CFNumberRef v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, v4 + 4) & 0x80) == 0) {
          break;
        }
        size_t v4 = (void *)*v7;
        size_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0) {
        break;
      }
      size_t v5 = v7 + 1;
      size_t v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    int v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

void CA::StreamDescription::AsString(CA::StreamDescription *this, void *a2, double a3, int16x8_t a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  unsigned int v6 = *((_DWORD *)a2 + 2);
  if (v6 == 1718773105)
  {
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, 'freq'", (uint64_t)this, *((unsigned int *)a2 + 7), *a2);
    return;
  }
  if (v6 != 1819304813) {
    goto LABEL_19;
  }
  if (*((_DWORD *)a2 + 5) != 1) {
    goto LABEL_19;
  }
  unsigned int v7 = *((_DWORD *)a2 + 6);
  if (v7 != *((_DWORD *)a2 + 4)) {
    goto LABEL_19;
  }
  unsigned int v8 = *((_DWORD *)a2 + 8);
  if (v7 < v8 >> 3) {
    goto LABEL_19;
  }
  uint64_t v9 = *((unsigned int *)a2 + 7);
  if (!v9) {
    goto LABEL_19;
  }
  unsigned int v10 = *((_DWORD *)a2 + 3);
  if ((v10 & 0x20) == 0)
  {
    BOOL v15 = v7 == v7 / v9 * v9;
    v7 /= v9;
    if (!v15) {
      goto LABEL_19;
    }
  }
  if ((v10 & 2) != 0 || 8 * v7 != v8) {
    goto LABEL_19;
  }
  if (v10)
  {
    if ((v10 & 0x1F84) == 0)
    {
      if (v7 == 4)
      {
        uint64_t v12 = 1;
        goto LABEL_163;
      }
      BOOL v15 = v7 == 8;
      BOOL v52 = v7 == 8;
      if (v15)
      {
        uint64_t v12 = 4 * v52;
        goto LABEL_163;
      }
    }
LABEL_19:
    uint64_t v13 = *((unsigned int *)a2 + 7);
    double v14 = *(double *)a2;
    if (v13) {
      BOOL v15 = 0;
    }
    else {
      BOOL v15 = v6 == 0;
    }
    if (v15 && v14 == 0.0)
    {
      caulk::make_string((caulk *)"%2u ch, %6.0f Hz", (uint64_t)this, 0, *a2);
      return;
    }
    a4.i32[0] = bswap32(v6);
    *(int8x8_t *)a4.i8 = vzip1_s8(*(int8x8_t *)a4.i8, *(int8x8_t *)&v14);
    v16.i64[0] = 0x1F0000001FLL;
    v16.i64[1] = 0x1F0000001FLL;
    v17.i64[0] = 0x5F0000005FLL;
    v17.i64[1] = 0x5F0000005FLL;
    *(int8x8_t *)a4.i8 = vbsl_s8((int8x8_t)vmovn_s32((int32x4_t)vcgtq_u32(v17, (uint32x4_t)vsraq_n_s32(v16, vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)a4.i8), 0x18uLL), 0x18uLL))), *(int8x8_t *)a4.i8, (int8x8_t)0x2E002E002E002ELL);
    *((unsigned char *)&v57.__r_.__value_.__s + 23) = 4;
    LODWORD(v57.__r_.__value_.__l.__data_) = vmovn_s16(a4).u32[0];
    v57.__r_.__value_.__s.__data_[4] = 0;
    caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s (0x%08X) ", (uint64_t)&v55, v13, *(void *)&v14, &v57, *((unsigned int *)a2 + 3));
    if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v57.__r_.__value_.__l.__data_);
    }
    int v18 = *((_DWORD *)a2 + 2);
    if (v18 <= 1819304812)
    {
      if (v18 != 1634492771 && v18 != 1634497332 && v18 != 1718378851)
      {
LABEL_70:
        caulk::make_string((caulk *)"%u bits/channel, %u bytes/packet, %u frames/packet, %u bytes/frame", (uint64_t)&v57, *((unsigned int *)a2 + 8), *((unsigned int *)a2 + 4), *((unsigned int *)a2 + 5), *((unsigned int *)a2 + 6));
        if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v30 = &v55;
        }
        else {
          unint64_t v30 = (std::string *)v55.__r_.__value_.__r.__words[0];
        }
        if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v55.__r_.__value_.__l.__size_;
        }
LABEL_62:
        uint64_t v32 = std::string::insert(&v57, 0, (const std::string::value_type *)v30, size);
        long long v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
        *((void *)this + 2) = *((void *)&v32->__r_.__value_.__l + 2);
        *(_OWORD *)this = v33;
        v32->__r_.__value_.__l.__size_ = 0;
        v32->__r_.__value_.__r.__words[2] = 0;
        v32->__r_.__value_.__r.__words[0] = 0;
        if ((SHIBYTE(v57.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_65;
        }
        unint64_t v34 = (void *)v57.__r_.__value_.__r.__words[0];
LABEL_64:
        operator delete(v34);
LABEL_65:
        if (SHIBYTE(v55.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v55.__r_.__value_.__l.__data_);
        }
        return;
      }
LABEL_45:
      uint64_t v27 = *((unsigned int *)a2 + 3);
      if ((v27 - 1) < 4 || !v27 && (v18 == 1634497332 || v18 == 1936487278 || v18 == 1936487267))
      {
        caulk::make_string((caulk *)"from %u-bit source, ", (uint64_t)&v57, CA::StreamDescription::AsString(void)const::kSourceBits[v27]);
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v28 = &v57;
        }
        else {
          uint64_t v28 = (std::string *)v57.__r_.__value_.__r.__words[0];
        }
        if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v29 = HIBYTE(v57.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v29 = v57.__r_.__value_.__l.__size_;
        }
        std::string::append(&v55, (const std::string::value_type *)v28, v29);
        if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v57.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string::append(&v55, "from UNKNOWN source bit depth, ", 0x1FuLL);
      }
      caulk::make_string((caulk *)"%u frames/packet", (uint64_t)&v57, *((unsigned int *)a2 + 5));
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unint64_t v30 = &v55;
      }
      else {
        unint64_t v30 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v55.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v55.__r_.__value_.__l.__size_;
      }
      goto LABEL_62;
    }
    if (v18 == 1936487278 || v18 == 1936487267) {
      goto LABEL_45;
    }
    if (v18 != 1819304813) {
      goto LABEL_70;
    }
    unsigned int v19 = *((_DWORD *)a2 + 3);
    unsigned int v20 = *((_DWORD *)a2 + 6);
    int v21 = v19 & 0x20;
    uint64_t v22 = "";
    if (!v20) {
      goto LABEL_37;
    }
    if ((v19 & 0x20) != 0)
    {
      unsigned int v23 = 1;
    }
    else
    {
      unsigned int v23 = *((_DWORD *)a2 + 7);
      if (!v23)
      {
        int v21 = 0;
LABEL_37:
        long long v24 = " signed";
        if ((v19 & 4) == 0) {
          long long v24 = " unsigned";
        }
        if (v19) {
          uint64_t v25 = "float";
        }
        else {
          uint64_t v25 = "integer";
        }
        if (v19) {
          uint64_t v26 = "";
        }
        else {
          uint64_t v26 = v24;
        }
LABEL_102:
        v57.__r_.__value_.__s.__data_[0] = 0;
        if (v21) {
          uint64_t v39 = ", deinterleaved";
        }
        else {
          uint64_t v39 = "";
        }
        uint64_t v36 = "";
        int64x2_t v40 = "";
        goto LABEL_106;
      }
    }
    int v35 = v20 / v23;
    if (v20 / v23 < 2)
    {
      unint64_t v38 = " signed";
      if ((v19 & 4) == 0) {
        unint64_t v38 = " unsigned";
      }
      if (v19) {
        uint64_t v25 = "float";
      }
      else {
        uint64_t v25 = "integer";
      }
      if (v19) {
        uint64_t v26 = "";
      }
      else {
        uint64_t v26 = v38;
      }
      if (v23 > v20) {
        goto LABEL_102;
      }
      int v35 = 1;
      uint64_t v36 = "";
    }
    else
    {
      if ((v19 & 2) != 0) {
        uint64_t v36 = " big-endian";
      }
      else {
        uint64_t v36 = " little-endian";
      }
      char v37 = " unsigned";
      if ((v19 & 4) != 0) {
        char v37 = " signed";
      }
      if (v19) {
        uint64_t v25 = "float";
      }
      else {
        uint64_t v25 = "integer";
      }
      if (v19) {
        uint64_t v26 = "";
      }
      else {
        uint64_t v26 = v37;
      }
    }
    unsigned int v41 = *((_DWORD *)a2 + 7);
    if ((v19 & 0x20) != 0) {
      unsigned int v42 = 1;
    }
    else {
      unsigned int v42 = *((_DWORD *)a2 + 7);
    }
    if (v42) {
      unsigned int v42 = 8 * (v20 / v42);
    }
    if (v42 == *((_DWORD *)a2 + 8))
    {
      v57.__r_.__value_.__s.__data_[0] = 0;
    }
    else
    {
      if ((v19 & 8) != 0) {
        uint64_t v43 = "";
      }
      else {
        uint64_t v43 = "un";
      }
      snprintf((char *)&v57, 0x20uLL, "%spacked in %u bytes", v43, v35);
      unsigned int v20 = *((_DWORD *)a2 + 6);
      unsigned int v19 = *((_DWORD *)a2 + 3);
      if (!v20)
      {
        unsigned int v44 = 0;
        int v21 = *((_DWORD *)a2 + 3) & 0x20;
        goto LABEL_128;
      }
      unsigned int v41 = *((_DWORD *)a2 + 7);
      int v21 = *((_DWORD *)a2 + 3) & 0x20;
    }
    if (v21) {
      unsigned int v44 = 1;
    }
    else {
      unsigned int v44 = v41;
    }
    if (v44) {
      unsigned int v44 = 8 * (v20 / v44);
    }
LABEL_128:
    int v45 = *((_DWORD *)a2 + 8);
    uint64_t v46 = " high-aligned";
    if ((v19 & 0x10) == 0) {
      uint64_t v46 = " low-aligned";
    }
    if ((v45 & 7) == 0 && v44 == v45) {
      int64x2_t v40 = "";
    }
    else {
      int64x2_t v40 = v46;
    }
    if (v21) {
      uint64_t v39 = ", deinterleaved";
    }
    else {
      uint64_t v39 = "";
    }
    if (v57.__r_.__value_.__s.__data_[0])
    {
      uint64_t v22 = ", ";
LABEL_141:
      if (((v19 >> 7) & 0x3F) != 0) {
        snprintf(__str, 0x14uLL, "%u.%u");
      }
      else {
        snprintf(__str, 0x14uLL, "%u");
      }
      caulk::make_string((caulk *)"%s-bit%s%s %s%s%s%s%s", (uint64_t)&v54, __str, v36, v26, v25, v22, &v57, v40, v39);
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v48 = &v55;
      }
      else {
        long long v48 = (std::string *)v55.__r_.__value_.__r.__words[0];
      }
      if ((v55.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type v49 = HIBYTE(v55.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type v49 = v55.__r_.__value_.__l.__size_;
      }
      unint64_t v50 = std::string::insert(&v54, 0, (const std::string::value_type *)v48, v49);
      long long v51 = *(_OWORD *)&v50->__r_.__value_.__l.__data_;
      *((void *)this + 2) = *((void *)&v50->__r_.__value_.__l + 2);
      *(_OWORD *)this = v51;
      v50->__r_.__value_.__l.__size_ = 0;
      v50->__r_.__value_.__r.__words[2] = 0;
      v50->__r_.__value_.__r.__words[0] = 0;
      if ((SHIBYTE(v54.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_65;
      }
      unint64_t v34 = (void *)v54.__r_.__value_.__r.__words[0];
      goto LABEL_64;
    }
LABEL_106:
    if (*v40) {
      uint64_t v22 = ", ";
    }
    goto LABEL_141;
  }
  if ((v10 & 4) == 0) {
    goto LABEL_19;
  }
  int v11 = (v10 >> 7) & 0x3F;
  if (v11 != 24 || v7 != 4)
  {
    if (!v11 && v7 == 4)
    {
      uint64_t v12 = 5;
      goto LABEL_163;
    }
    if (!v11 && v7 == 2)
    {
      uint64_t v12 = 2;
      goto LABEL_163;
    }
    goto LABEL_19;
  }
  uint64_t v12 = 3;
LABEL_163:
  if ((v10 & 0x20) != 0) {
    uint64_t v53 = ", deinterleaved";
  }
  else {
    uint64_t v53 = ", interleaved";
  }
  if (v9 <= 1) {
    uint64_t v53 = "";
  }
  caulk::make_string((caulk *)"%2u ch, %6.0f Hz, %s%s", (uint64_t)this, v9, *a2, *((void *)&off_26527D700 + v12), v53);
}

void sub_249C29908(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void caulk::make_string(caulk *this@<X0>, uint64_t a2@<X8>, ...)
{
  va_start(va, a2);
  int v5 = vsnprintf(0, 0, (const char *)this, va);
  if (v5 <= 0)
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    std::string::resize((std::string *)a2, (v5 + 1), 0);
    int v6 = *(char *)(a2 + 23);
    if (v6 >= 0) {
      unsigned int v7 = (char *)a2;
    }
    else {
      unsigned int v7 = *(char **)a2;
    }
    if (v6 >= 0) {
      size_t v8 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      size_t v8 = *(void *)(a2 + 8);
    }
    int v9 = vsnprintf(v7, v8, (const char *)this, va);
    std::string::resize((std::string *)a2, v9, 0);
  }
}

char *std::vector<AudioStreamRangedDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v3 = 56 * a2;
  uint64_t result = (char *)operator new(56 * a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[v3];
  return result;
}

CFNumberRef *std::construct_at[abi:ne180100]<applesauce::CF::NumberRef,double const&,applesauce::CF::NumberRef*>(CFNumberRef *a1, double a2)
{
  double valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  *a1 = v3;
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x24C5B19C0](exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
  }
  return a1;
}

void sub_249C29AA4(_Unwind_Exception *exception_object)
{
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, std::sub_match<const char *> *a2, std::sub_match<const char *> *a3, std::vector<std::csub_match> *this, int a5)
{
  if ((a5 & 0x80) != 0) {
    int v9 = a5 & 0xFFA;
  }
  else {
    int v9 = a5;
  }
  int v10 = *(_DWORD *)(a1 + 28);
  this[1].__begin_ = a3;
  int v11 = (const std::vector<std::csub_match>::value_type *)&this[1];
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  std::vector<std::sub_match<char const*>>::assign(this, (v10 + 1), (std::vector<std::csub_match>::const_reference)&this[1]);
  this[2].__begin_ = a2;
  this[2].__end_ = a2;
  LOBYTE(this[2].__end_cap_.__value_) = 0;
  *(std::pair<const char *, const char *> *)&this[3].__begin_ = v11->std::pair<const char *, const char *>;
  LOBYTE(this[3].__end_cap_.__value_) = this[1].__end_cap_.__value_;
  if ((v9 & 0x800) == 0) {
    this[4].__end_ = a2;
  }
  LOBYTE(this[4].__begin_) = 1;
  if (!std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (a2 == a3 || (v9 & 0x40) != 0) {
      goto LABEL_18;
    }
    int v18 = v9 | 0x80;
    unsigned int v19 = (char *)&a2->first + 1;
    if (v19 != (const char *)a3)
    {
      do
      {
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
        int v20 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v19, (const char *)a3, (uint64_t *)this, v18, 0);
        std::vector<std::csub_match>::pointer begin = this->__begin_;
        std::vector<std::csub_match>::pointer end = this->__end_;
        if (v20) {
          goto LABEL_8;
        }
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), v11);
      }
      while (++v19 != (const char *)a3);
    }
    std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
    if (!std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v18, 0))
    {
LABEL_18:
      uint64_t result = 0;
      this->__end_ = this->__begin_;
      return result;
    }
  }
  std::vector<std::csub_match>::pointer begin = this->__begin_;
  std::vector<std::csub_match>::pointer end = this->__end_;
LABEL_8:
  if (end == begin) {
    double v14 = v11;
  }
  else {
    double v14 = begin;
  }
  first = (std::sub_match<const char *> *)v14->first;
  this[2].__end_ = (std::vector<std::csub_match>::pointer)v14->first;
  LOBYTE(this[2].__end_cap_.__value_) = this[2].__begin_ != first;
  second = (std::sub_match<const char *> *)v14->second;
  this[3].__begin_ = second;
  LOBYTE(this[3].__end_cap_.__value_) = second != this[3].__end_;
  return 1;
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  locale = this[6].__locale_;
  if (locale) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)locale);
  }

  std::locale::~locale(this);
}

BOOL std::regex_iterator<std::__wrap_iter<char const*>,char,std::regex_traits<char>>::operator==(const std::regex_iterator<std::__wrap_iter<const char *>, char> *this, const std::regex_iterator<std::__wrap_iter<const char *>, char> *__x)
{
  p_match = &this->__match_;
  std::vector<std::ssub_match>::pointer begin = this->__match_.__matches_.__begin_;
  std::vector<std::csub_match>::pointer end = p_match->__matches_.__end_;
  int v9 = &__x->__match_;
  std::vector<std::ssub_match>::pointer v7 = __x->__match_.__matches_.__begin_;
  size_t v8 = v9->__matches_.__end_;
  BOOL v10 = v8 == v7 && end == begin;
  if (end != begin && v8 != v7) {
    return this->__begin_.__i_ == __x->__begin_.__i_
  }
        && this->__end_.__i_ == __x->__end_.__i_
        && this->__pregex_ == __x->__pregex_
        && this->__flags_ == __x->__flags_
        && std::sub_match<std::__wrap_iter<char const*>>::compare[abi:ne180100]((uint64_t)begin, (uint64_t)v7) == 0;
  return v10;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10 = a4[6];
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  uint64_t v12 = *(char **)a1;
  uint64_t v13 = *(char **)(a1 + 8);
  unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v13[-*(void *)a1] >> 3);
  unint64_t v15 = v11 - v14;
  if (v11 <= v14)
  {
    uint64_t v22 = *(char **)(a1 + 8);
    if (v11 >= v14) {
      goto LABEL_22;
    }
    uint64_t v22 = &v12[8 * ((a4[1] - *a4) >> 3)];
    goto LABEL_21;
  }
  uint64_t v16 = *(void *)(a1 + 16);
  if (0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v13) >> 3) >= v15)
  {
    uint64_t v22 = &v13[24 * v15];
    uint64_t v27 = 8 * ((a4[1] - *a4) >> 3) - 8 * ((uint64_t)&v13[-*(void *)a1] >> 3);
    do
    {
      *(void *)uint64_t v13 = 0;
      *((void *)v13 + 1) = 0;
      v13[16] = 0;
      v13 += 24;
      v27 -= 24;
    }
    while (v27);
LABEL_21:
    *(void *)(a1 + 8) = v22;
    goto LABEL_22;
  }
  if (v11 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v12) >> 3);
  uint64_t v18 = 2 * v17;
  if (2 * v17 <= v11) {
    uint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  }
  if (v17 >= 0x555555555555555) {
    unint64_t v19 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v19 = v18;
  }
  if (v19 > 0xAAAAAAAAAAAAAAALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  int v20 = (char *)operator new(24 * v19);
  int v21 = &v20[24 * v14];
  uint64_t v22 = &v20[24 * v11];
  unsigned int v23 = v21;
  uint64_t v24 = 24 * v11 - 24 * v14;
  do
  {
    *(void *)unsigned int v23 = 0;
    *((void *)v23 + 1) = 0;
    v23[16] = 0;
    v23 += 24;
    v24 -= 24;
  }
  while (v24);
  uint64_t v25 = *(char **)a1;
  if (v13 != *(char **)a1)
  {
    do
    {
      long long v26 = *(_OWORD *)(v13 - 24);
      *((void *)v21 - 1) = *((void *)v13 - 1);
      *(_OWORD *)(v21 - 24) = v26;
      v21 -= 24;
      v13 -= 24;
    }
    while (v13 != v25);
    uint64_t v13 = *(char **)a1;
  }
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v22;
  *(void *)(a1 + 16) = &v20[24 * v19];
  if (v13)
  {
    operator delete(v13);
    uint64_t v22 = *(char **)(a1 + 8);
  }
LABEL_22:
  uint64_t v28 = *(char **)a1;
  if (v22 != *(char **)a1)
  {
    uint64_t v29 = 0;
    unint64_t v30 = 0;
    uint64_t v32 = *a4;
    uint64_t v31 = a4[1];
    do
    {
      unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * ((v31 - v32) >> 3);
      unint64_t v34 = (void *)(v32 + v29);
      if (v33 <= v30) {
        int v35 = a4 + 3;
      }
      else {
        int v35 = v34;
      }
      *(void *)&v28[v29] = a2 + *v35 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v30) {
        uint64_t v36 = a4 + 3;
      }
      else {
        uint64_t v36 = (uint64_t *)(*a4 + v29);
      }
      *(void *)(*(void *)a1 + v29 + 8) = a2 + v36[1] - v10;
      uint64_t v32 = *a4;
      uint64_t v31 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v31 - *a4) >> 3) <= v30) {
        char v37 = a4 + 3;
      }
      else {
        char v37 = (uint64_t *)(*a4 + v29);
      }
      char v38 = *((unsigned char *)v37 + 16);
      uint64_t v28 = *(char **)a1;
      uint64_t v39 = *(void *)(a1 + 8);
      *(unsigned char *)(*(void *)a1 + v29 + 16) = v38;
      ++v30;
      v29 += 24;
    }
    while (v30 < 0xAAAAAAAAAAAAAAABLL * ((v39 - (uint64_t)v28) >> 3));
  }
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a3;
  *(unsigned char *)(a1 + 40) = 0;
  uint64_t v40 = a2 + a4[6] - v10;
  *(void *)(a1 + 48) = v40;
  *(void *)(a1 + 56) = a2 + a4[7] - v10;
  *(unsigned char *)(a1 + 64) = *((unsigned char *)a4 + 64);
  *(void *)(a1 + 72) = a2 + a4[9] - v10;
  *(void *)(a1 + 80) = a2 + a4[10] - v10;
  *(unsigned char *)(a1 + 88) = *((unsigned char *)a4 + 88);
  if ((a5 & 1) == 0) {
    *(void *)(a1 + 104) = v40;
  }
  *(unsigned char *)(a1 + 96) = *((unsigned char *)a4 + 96);
}

uint64_t std::sub_match<std::__wrap_iter<char const*>>::compare[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 16))
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&v19, *(char **)a1, *(char **)(a1 + 8), *(void *)(a1 + 8) - *(void *)a1);
  }
  else
  {
    unint64_t v19 = 0;
    size_t v20 = 0;
    uint64_t v21 = 0;
  }
  if (*(unsigned char *)(a2 + 16))
  {
    std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&v16, *(char **)a2, *(char **)(a2 + 8), *(void *)(a2 + 8) - *(void *)a2);
    unsigned int v3 = HIBYTE(v18);
    int v5 = v16;
    size_t v4 = v17;
  }
  else
  {
    size_t v4 = 0;
    int v5 = 0;
    unsigned int v3 = 0;
    uint64_t v16 = 0;
    size_t v17 = 0;
    uint64_t v18 = 0;
  }
  int v6 = SHIBYTE(v21);
  std::vector<std::ssub_match>::pointer v7 = v19;
  if (v21 >= 0) {
    size_t v8 = HIBYTE(v21);
  }
  else {
    size_t v8 = v20;
  }
  if (v21 >= 0) {
    int v9 = &v19;
  }
  else {
    int v9 = (void **)v19;
  }
  if ((v3 & 0x80u) == 0) {
    size_t v10 = v3;
  }
  else {
    size_t v10 = v4;
  }
  if ((v3 & 0x80u) == 0) {
    unint64_t v11 = (void **)&v16;
  }
  else {
    unint64_t v11 = v5;
  }
  if (v10 >= v8) {
    size_t v12 = v8;
  }
  else {
    size_t v12 = v10;
  }
  unsigned int v13 = memcmp(v9, v11, v12);
  if ((v3 & 0x80) != 0)
  {
    operator delete(v5);
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 0x80000000) == 0)
  {
    goto LABEL_24;
  }
  operator delete(v7);
LABEL_24:
  unsigned int v14 = v10 < v8;
  if (v8 < v10) {
    unsigned int v14 = -1;
  }
  if (v13) {
    return v13;
  }
  else {
    return v14;
  }
}

void sub_249C2A18C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  int v7 = a5;
  int v9 = a3;
  size_t v10 = a2;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
  {
    v164 = (const char *)(a3 - a2);
    __int16 v163 = a5;
    if (*(_DWORD *)(a1 + 28))
    {
      v165[0] = 0;
      v165[1] = 0;
      *(void *)&long long v166 = 0;
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        __x.first = a3;
        __x.second = a3;
        __x.matched = 0;
        *(_DWORD *)v168 = 0;
        memset(&v168[8], 0, 48);
        *(_OWORD *)std::string __p = 0u;
        memset(v170, 0, 21);
        v165[1] = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(v165, (uint64_t)v168);
        if (__p[0]) {
          operator delete(__p[0]);
        }
        if (*(void *)&v168[32]) {
          operator delete(*(void **)&v168[32]);
        }
        v150 = a4;
        unsigned int v13 = v165[1];
        *((_DWORD *)v165[1] - 24) = 0;
        *(v13 - 11) = v10;
        *(v13 - 10) = v10;
        v160 = v9;
        *(v13 - 9) = v9;
        std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v13 - 8), *(unsigned int *)(a1 + 28), &__x);
        std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v165[1] - 40), *(unsigned int *)(a1 + 32));
        v156 = 0;
        v158 = 0;
        uint64_t v152 = 0;
        uint64_t v153 = 0;
        char v154 = 0;
        v155 = 0;
        unsigned int v14 = 0;
        char v15 = 0;
        unsigned int v16 = 0;
        size_t v17 = v165[1];
        *((void *)v165[1] - 2) = v12;
        *(v17 - 2) = v7;
        *((unsigned char *)v17 - 4) = a6;
        do
        {
          BOOL v18 = (++v16 & 0xFFF) != 0 || (int)(v16 >> 12) < (int)v164;
          if (!v18) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
          }
          size_t v20 = v17 - 4;
          uint64_t v19 = *((void *)v17 - 2);
          uint64_t v21 = v17 - 24;
          if (v19) {
            (*(void (**)(uint64_t, _DWORD *))(*(void *)v19 + 16))(v19, v17 - 24);
          }
          switch(*(_DWORD *)v21)
          {
            case 0xFFFFFC18:
              uint64_t v22 = (const char *)*((void *)v17 - 10);
              if ((v163 & 0x20) != 0 && v22 == v10 || (v163 & 0x1000) != 0 && v22 != v160) {
                goto LABEL_21;
              }
              if ((v15 & ((uint64_t)v14 >= (uint64_t)&v22[-*((void *)v17 - 11)])) != 0)
              {
                uint64_t v29 = v158;
                unint64_t v30 = v154;
              }
              else
              {
                uint64_t v32 = (long long *)*((void *)v17 - 8);
                uint64_t v31 = (long long *)*((void *)v17 - 7);
                unint64_t v33 = 0xAAAAAAAAAAAAAAABLL * (((char *)v31 - (char *)v32) >> 3);
                unint64_t v34 = v158;
                v149 = &v22[-*((void *)v17 - 11)];
                if (0xAAAAAAAAAAAAAAABLL * ((v153 - (uint64_t)v155) >> 3) >= v33)
                {
                  if (0xAAAAAAAAAAAAAAABLL * ((v158 - v155) >> 3) >= v33)
                  {
                    if (v32 == v31)
                    {
                      uint64_t v46 = v155;
                      uint64_t v47 = v155;
                    }
                    else
                    {
                      uint64_t v46 = v155;
                      uint64_t v47 = v155;
                      do
                      {
                        *(_OWORD *)uint64_t v47 = *v32;
                        v47[16] = *((unsigned char *)v32 + 16);
                        v47 += 24;
                        uint64_t v32 = (long long *)((char *)v32 + 24);
                      }
                      while (v32 != v31);
                    }
                    int64_t v45 = v47 - v46;
                    unint64_t v34 = v46;
                  }
                  else
                  {
                    unsigned int v41 = (long long *)((char *)v32 + 8 * ((v158 - v155) >> 3));
                    if (v158 != v155)
                    {
                      unsigned int v42 = v155;
                      do
                      {
                        *(_OWORD *)unsigned int v42 = *v32;
                        v42[16] = *((unsigned char *)v32 + 16);
                        uint64_t v32 = (long long *)((char *)v32 + 24);
                        v42 += 24;
                      }
                      while (v32 != v41);
                    }
                    uint64_t v43 = v158;
                    while (v41 != v31)
                    {
                      long long v44 = *v41;
                      *((void *)v43 + 2) = *((void *)v41 + 2);
                      *(_OWORD *)uint64_t v43 = v44;
                      v43 += 24;
                      unsigned int v41 = (long long *)((char *)v41 + 24);
                    }
                    int64_t v45 = v43 - v158;
                  }
                }
                else
                {
                  if (v155)
                  {
                    operator delete(v155);
                    uint64_t v153 = 0;
                  }
                  if (v33 > 0xAAAAAAAAAAAAAAALL) {
                    goto LABEL_220;
                  }
                  unint64_t v35 = 0x5555555555555556 * (v153 >> 3);
                  if (v35 <= v33) {
                    unint64_t v35 = 0xAAAAAAAAAAAAAAABLL * (((char *)v31 - (char *)v32) >> 3);
                  }
                  unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (v153 >> 3) >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v35;
                  if (v36 > 0xAAAAAAAAAAAAAAALL) {
LABEL_220:
                  }
                    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                  char v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v36);
                  unint64_t v34 = v37;
                  uint64_t v39 = v37;
                  while (v32 != v31)
                  {
                    long long v40 = *v32;
                    *((void *)v39 + 2) = *((void *)v32 + 2);
                    *(_OWORD *)uint64_t v39 = v40;
                    v39 += 24;
                    uint64_t v32 = (long long *)((char *)v32 + 24);
                  }
                  uint64_t v153 = (uint64_t)&v37[24 * v38];
                  int64_t v45 = v39 - v37;
                  v155 = v37;
                }
                std::string::size_type v49 = (char *)*((void *)v17 - 5);
                long long v48 = (char *)*((void *)v17 - 4);
                unint64_t v50 = (v48 - v49) >> 4;
                if (v50 <= (v152 - (uint64_t)v156) >> 4)
                {
                  unint64_t v57 = (v154 - v156) >> 4;
                  if (v57 >= v50)
                  {
                    if (v49 == v48)
                    {
                      CFNumberRef v63 = v156;
                      long long v62 = v156;
                      unsigned int v14 = v149;
                    }
                    else
                    {
                      long long v62 = v156;
                      unsigned int v14 = v149;
                      do
                      {
                        *(void *)long long v62 = *(void *)v49;
                        *((void *)v62 + 1) = *((void *)v49 + 1);
                        v62 += 16;
                        v49 += 16;
                      }
                      while (v49 != v48);
                      CFNumberRef v63 = v156;
                    }
                    uint64_t v64 = (char *)(v62 - v63);
                    uint64_t v53 = v63;
                  }
                  else
                  {
                    uint64_t v58 = &v49[16 * v57];
                    if (v154 != v156)
                    {
                      unint64_t v59 = v156;
                      do
                      {
                        *(void *)unint64_t v59 = *(void *)v49;
                        *((void *)v59 + 1) = *((void *)v49 + 1);
                        v49 += 16;
                        v59 += 16;
                      }
                      while (v49 != v58);
                    }
                    unsigned int v14 = v149;
                    if (v58 == v48)
                    {
                      uint64_t v53 = v154;
                      uint64_t v60 = v154;
                    }
                    else
                    {
                      uint64_t v53 = v154;
                      uint64_t v60 = v154;
                      do
                      {
                        long long v61 = *(_OWORD *)v58;
                        v58 += 16;
                        *(_OWORD *)uint64_t v60 = v61;
                        v60 += 16;
                      }
                      while (v58 != v48);
                    }
                    uint64_t v64 = (char *)(v60 - v53);
                  }
                }
                else
                {
                  if (v156)
                  {
                    operator delete(v156);
                    uint64_t v152 = 0;
                  }
                  if (v48 - v49 < 0) {
                    goto LABEL_219;
                  }
                  uint64_t v51 = v152 >> 3;
                  if (v152 >> 3 <= v50) {
                    uint64_t v51 = (v48 - v49) >> 4;
                  }
                  unint64_t v52 = (unint64_t)v152 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v51;
                  if (v52 >> 60) {
LABEL_219:
                  }
                    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                  uint64_t v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v52);
                  std::string v55 = v53;
                  if (v49 == v48)
                  {
                    unsigned int v14 = v149;
                  }
                  else
                  {
                    unsigned int v14 = v149;
                    do
                    {
                      long long v56 = *(_OWORD *)v49;
                      v49 += 16;
                      *(_OWORD *)std::string v55 = v56;
                      v55 += 16;
                    }
                    while (v49 != v48);
                  }
                  uint64_t v152 = (uint64_t)&v53[16 * v54];
                  uint64_t v64 = (char *)(v55 - v53);
                  v156 = v53;
                }
                uint64_t v29 = &v34[v45];
                unint64_t v30 = &v64[(void)v53];
              }
              v158 = v29;
              uint64_t v65 = v165[1];
              char v154 = v30;
              if (v14 == v164)
              {
                uint64_t v66 = v165[0];
                while (v65 != v66)
                {
                  v65 -= 12;
                  std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v65);
                }
                v165[1] = v66;
                char v15 = 1;
                unsigned int v14 = v164;
              }
              else
              {
                uint64_t v67 = (char *)v165[1] - 96;
                std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)v165[1] - 12);
                v165[1] = v67;
                char v15 = 1;
              }
              break;
            case 0xFFFFFC1D:
            case 0xFFFFFC1E:
            case 0xFFFFFC21:
              break;
            case 0xFFFFFC1F:
LABEL_21:
              unsigned int v23 = (char *)v165[1] - 96;
              std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)v165[1] - 12);
              v165[1] = v23;
              break;
            case 0xFFFFFC20:
              long long v24 = *((_OWORD *)v17 - 5);
              *(_OWORD *)v168 = *v21;
              *(_OWORD *)&v168[16] = v24;
              memset(&v168[32], 0, 24);
              std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v168[32], *((long long **)v17 - 8), *((long long **)v17 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v17 - 7) - *((void *)v17 - 8)) >> 3));
              __p[0] = 0;
              __p[1] = 0;
              v170[0] = 0;
              std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v17 - 5), *((long long **)v17 - 4), (uint64_t)(*((void *)v17 - 4) - *((void *)v17 - 5)) >> 4);
              uint64_t v25 = *v20;
              *(void *)((char *)&v170[1] + 5) = *(void *)((char *)v17 - 11);
              v170[1] = v25;
              (*(void (**)(void, uint64_t, _DWORD *))(*(void *)*v20 + 24))(*v20, 1, v17 - 24);
              (*(void (**)(void, void, unsigned char *))(*(void *)v170[1] + 24))(v170[1], 0, v168);
              long long v26 = (char *)v165[1];
              if (v165[1] >= (void *)v166)
              {
                v165[1] = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(v165, (uint64_t)v168);
                if (__p[0])
                {
                  __p[1] = __p[0];
                  operator delete(__p[0]);
                }
              }
              else
              {
                long long v27 = *(_OWORD *)&v168[16];
                *(_OWORD *)v165[1] = *(_OWORD *)v168;
                *((_OWORD *)v26 + 1) = v27;
                *((void *)v26 + 4) = 0;
                *((void *)v26 + 5) = 0;
                *((void *)v26 + 6) = 0;
                *((void *)v26 + 7) = 0;
                *((_OWORD *)v26 + 2) = *(_OWORD *)&v168[32];
                *((void *)v26 + 6) = *(void *)&v168[48];
                memset(&v168[32], 0, 24);
                *((void *)v26 + 8) = 0;
                *((void *)v26 + 9) = 0;
                *(_OWORD *)(v26 + 56) = *(_OWORD *)__p;
                *((void *)v26 + 9) = v170[0];
                __p[0] = 0;
                __p[1] = 0;
                v170[0] = 0;
                uint64_t v28 = v170[1];
                *(void *)(v26 + 85) = *(void *)((char *)&v170[1] + 5);
                *((void *)v26 + 10) = v28;
                v165[1] = v26 + 96;
              }
              if (*(void *)&v168[32])
              {
                *(void *)&v168[40] = *(void *)&v168[32];
                operator delete(*(void **)&v168[32]);
              }
              break;
            default:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
          }
          size_t v17 = v165[1];
        }
        while (v165[0] != v165[1]);
        if (v15)
        {
          uint64_t v69 = *v150;
          *(void *)uint64_t v69 = v10;
          *(void *)(v69 + 8) = &v14[(void)v10];
          *(unsigned char *)(v69 + 16) = 1;
          uint64_t v70 = v155;
          if (v158 != v155)
          {
            int v71 = v155 + 16;
            unsigned int v72 = 1;
            do
            {
              uint64_t v73 = v69 + 24 * v72;
              *(_OWORD *)uint64_t v73 = *((_OWORD *)v71 - 1);
              char v74 = *v71;
              v71 += 24;
              *(unsigned char *)(v73 + 16) = v74;
              BOOL v18 = 0xAAAAAAAAAAAAAAABLL * ((v158 - v155) >> 3) > v72++;
            }
            while (v18);
          }
          uint64_t v75 = 1;
        }
        else
        {
          uint64_t v75 = 0;
          uint64_t v70 = v155;
        }
        if (v156) {
          operator delete(v156);
        }
        if (v70) {
          operator delete(v70);
        }
      }
      else
      {
        uint64_t v75 = 0;
      }
      *(void *)v168 = v165;
      std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v168);
    }
    else
    {
      long long v166 = 0u;
      int64x2_t v167 = 0u;
      *(_OWORD *)v165 = 0u;
      uint64_t v75 = *(void *)(a1 + 40);
      if (v75)
      {
        *(_DWORD *)v168 = 0;
        memset(&v168[8], 0, 48);
        *(_OWORD *)std::string __p = 0uLL;
        memset(v170, 0, 21);
        std::deque<std::__state<char>>::push_back(v165, (uint64_t)v168);
        if (__p[0]) {
          operator delete(__p[0]);
        }
        if (*(void *)&v168[32]) {
          operator delete(*(void **)&v168[32]);
        }
        uint64_t v151 = a4;
        CFDictionaryRef v76 = v165[1];
        unint64_t v77 = v167.i64[1] + v167.i64[0] - 1;
        unint64_t v78 = v77 / 0x2A;
        uint64_t v79 = *((void *)v165[1] + v77 / 0x2A);
        unint64_t v80 = 3 * (v77 % 0x2A);
        uint64_t v81 = v79 + 32 * v80;
        *(_DWORD *)uint64_t v81 = 0;
        *(void *)(v81 + 8) = v10;
        *(void *)(v76[v78] + 32 * v80 + 16) = v10;
        *(void *)(v76[v78] + 32 * v80 + 24) = v9;
        std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(v76[v78] + 32 * v80 + 56), *(unsigned int *)(a1 + 32));
        char v159 = 0;
        unsigned int v82 = 0;
        uint64_t v83 = v167.i64[1];
        CFNumberRef v84 = v165[1];
        unint64_t v85 = v167.i64[1] + v167.i64[0] - 1;
        unint64_t v86 = v85 / 0x2A;
        unint64_t v87 = 3 * (v85 % 0x2A);
        *(void *)(*((void *)v165[1] + v86) + 32 * v87 + 80) = v75;
        uint64_t v88 = v84[v86] + 32 * v87;
        *(_DWORD *)(v88 + 88) = v7;
        *(unsigned char *)(v88 + 92) = a6;
        long long v157 = 0;
        while (2)
        {
          if ((++v82 & 0xFFF) == 0 && (int)(v82 >> 12) >= (int)v164) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
          }
          unint64_t v90 = v83 + v167.i64[0] - 1;
          uint64_t v91 = *((void *)v165[1] + v90 / 0x2A);
          unint64_t v92 = v90 % 0x2A;
          uint64_t v93 = v91 + 96 * (v90 % 0x2A);
          long long v95 = (void *)(v93 + 80);
          uint64_t v94 = *(void *)(v93 + 80);
          if (v94) {
            (*(void (**)(uint64_t, unint64_t))(*(void *)v94 + 16))(v94, v91 + 96 * v92);
          }
          switch(*(_DWORD *)v93)
          {
            case 0xFFFFFC18:
              CFNumberRef v96 = *(const char **)(v91 + 96 * v92 + 16);
              BOOL v97 = (v7 & 0x1000) == 0 || v96 == v9;
              char v98 = v97;
              BOOL v99 = v96 != v10 || (v7 & 0x20) == 0;
              if (!v99 || (v98 & 1) == 0) {
                goto LABEL_203;
              }
              uint64_t v100 = (uint64_t)&v96[-*(void *)(v91 + 96 * v92 + 8)];
              unint64_t v101 = v157;
              if ((v159 & ((uint64_t)v157 >= v100)) == 0) {
                unint64_t v101 = (char *)v100;
              }
              if (v101 != v164)
              {
                long long v157 = v101;
                std::deque<std::__state<char>>::pop_back(v165);
                char v159 = 1;
                goto LABEL_204;
              }
              unint64_t v102 = (void **)v165[1];
              uint64_t v103 = (unsigned char *)v166;
              if ((void *)v166 == v165[1])
              {
                uint64_t v103 = v165[1];
              }
              else
              {
                unint64_t v104 = v10;
                unint64_t v105 = (char *)v165[1] + 8 * (v167.i64[0] / 0x2AuLL);
                unint64_t v106 = (void *)(*v105 + 96 * (v167.i64[0] % 0x2AuLL));
                unint64_t v107 = *((void *)v165[1] + (v167.i64[1] + v167.i64[0]) / 0x2AuLL)
                     + 96 * ((v167.i64[1] + v167.i64[0]) % 0x2AuLL);
                if (v106 != (void *)v107)
                {
                  do
                  {
                    std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v106);
                    v106 += 12;
                    if ((void *)((char *)v106 - *v105) == (void *)4032)
                    {
                      uint64_t v108 = (void *)v105[1];
                      ++v105;
                      unint64_t v106 = v108;
                    }
                  }
                  while (v106 != (void *)v107);
                  unint64_t v102 = (void **)v165[1];
                  uint64_t v103 = (unsigned char *)v166;
                }
                size_t v10 = v104;
              }
              v167.i64[1] = 0;
              unint64_t v139 = v103 - (unsigned char *)v102;
              if (v139 >= 0x11)
              {
                do
                {
                  operator delete(*v102);
                  unint64_t v102 = (void **)((char *)v165[1] + 8);
                  v165[1] = v102;
                  unint64_t v139 = v166 - (void)v102;
                }
                while ((void)v166 - (void)v102 > 0x10uLL);
              }
              if (v139 >> 3 == 1)
              {
                uint64_t v140 = 21;
              }
              else
              {
                if (v139 >> 3 != 2) {
                  goto LABEL_191;
                }
                uint64_t v140 = 42;
              }
              v167.i64[0] = v140;
LABEL_191:
              char v159 = 1;
              long long v157 = (char *)v164;
LABEL_204:
              uint64_t v83 = v167.i64[1];
              if (v167.i64[1]) {
                continue;
              }
              if (v159)
              {
                uint64_t v148 = *v151;
                *(void *)uint64_t v148 = v10;
                *(void *)(v148 + 8) = &v157[(void)v10];
                uint64_t v75 = 1;
                *(unsigned char *)(v148 + 16) = 1;
              }
              else
              {
                uint64_t v75 = 0;
              }
              break;
            case 0xFFFFFC19:
            case 0xFFFFFC1E:
            case 0xFFFFFC21:
              goto LABEL_204;
            case 0xFFFFFC1D:
              unint64_t v109 = v167.i64[0];
              v110 = (char *)v165[1];
              v111 = (char *)v166;
              if (!v167.i64[0])
              {
                unint64_t v114 = (uint64_t)(v166 - (unint64_t)v165[1]) >> 3;
                uint64_t v115 = 42 * v114 - 1;
                if ((void *)v166 == v165[1]) {
                  uint64_t v115 = 0;
                }
                if ((unint64_t)(v115 - v167.i64[1]) < 0x2A)
                {
                  if (v114 >= (uint64_t)(*((void *)&v166 + 1) - (unint64_t)v165[0]) >> 3)
                  {
                    if (*((void **)&v166 + 1) == v165[0]) {
                      unint64_t v116 = 1;
                    }
                    else {
                      unint64_t v116 = (uint64_t)(*((void *)&v166 + 1) - (unint64_t)v165[0]) >> 2;
                    }
                    *(void *)&v168[32] = (char *)&v166 + 8;
                    *(void *)v168 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v116);
                    *(void *)&v168[8] = *(void *)v168;
                    *(void *)&v168[16] = *(void *)v168;
                    *(void *)&v168[24] = *(void *)v168 + 8 * v117;
                    v162 = v10;
                    __x.first = (const char *)operator new(0xFC0uLL);
                    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(v168, &__x);
                    unint64_t v118 = (uint64_t *)v165[1];
                    unint64_t v119 = *(char **)&v168[16];
                    for (uint64_t i = v9; v118 != (uint64_t *)v166; *(void *)&v168[16] += 8)
                    {
                      if (v119 == *(char **)&v168[24])
                      {
                        unint64_t v120 = *(char **)&v168[8];
                        unint64_t v121 = *(void **)v168;
                        if (*(void *)&v168[8] <= *(void *)v168)
                        {
                          if (v119 == *(char **)v168) {
                            unint64_t v128 = 1;
                          }
                          else {
                            unint64_t v128 = (uint64_t)&v119[-*(void *)v168] >> 2;
                          }
                          unint64_t v129 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v128);
                          unint64_t v131 = &v129[8 * (v128 >> 2)];
                          uint64_t v132 = v119 - v120;
                          BOOL v97 = v119 == v120;
                          unint64_t v119 = v131;
                          int v9 = i;
                          if (!v97)
                          {
                            unint64_t v119 = &v131[v132 & 0xFFFFFFFFFFFFFFF8];
                            uint64_t v133 = 8 * (v132 >> 3);
                            unint64_t v134 = v131;
                            do
                            {
                              uint64_t v135 = *(void *)v120;
                              v120 += 8;
                              *(void *)unint64_t v134 = v135;
                              v134 += 8;
                              v133 -= 8;
                            }
                            while (v133);
                          }
                          *(void *)v168 = v129;
                          *(void *)&v168[8] = v131;
                          *(void *)&v168[16] = v119;
                          *(void *)&v168[24] = &v129[8 * v130];
                          if (v121) {
                            operator delete(v121);
                          }
                        }
                        else
                        {
                          uint64_t v122 = (uint64_t)(*(void *)&v168[8] - *(void *)v168) >> 3;
                          if (v122 >= -1) {
                            uint64_t v123 = v122 + 1;
                          }
                          else {
                            uint64_t v123 = v122 + 2;
                          }
                          uint64_t v124 = *(void *)&v168[8] - 8 * (v123 >> 1);
                          size_t v125 = (size_t)&v119[-*(void *)&v168[8]];
                          if (v119 != *(char **)&v168[8])
                          {
                            v126 = (void *)(*(void *)&v168[8] - 8 * (v123 >> 1));
                            memmove(v126, *(const void **)&v168[8], v125);
                            uint64_t v124 = (uint64_t)v126;
                            unint64_t v119 = v120;
                          }
                          v127 = &v119[-8 * (v123 >> 1)];
                          unint64_t v119 = (char *)(v124 + v125);
                          *(void *)&v168[8] = v127;
                          *(void *)&v168[16] = v124 + v125;
                          int v9 = i;
                        }
                      }
                      uint64_t v136 = *v118++;
                      *(void *)unint64_t v119 = v136;
                      unint64_t v119 = (char *)(*(void *)&v168[16] + 8);
                    }
                    v137 = v165[0];
                    *(_OWORD *)v165 = *(_OWORD *)v168;
                    *(void *)&long long v166 = v119;
                    *((void *)&v166 + 1) = *(void *)&v168[24];
                    uint64_t v138 = 21;
                    if (&v119[-*(void *)&v168[8]] != (char *)8) {
                      uint64_t v138 = v167.i64[0] + 42;
                    }
                    v167.i64[0] = v138;
                    size_t v10 = v162;
                    if (v137) {
                      operator delete(v137);
                    }
                    LOWORD(v7) = v163;
                  }
                  else
                  {
                    if (v165[1] == v165[0])
                    {
                      *(void *)v168 = operator new(0xFC0uLL);
                      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(v165, v168);
                      *(void *)v168 = *(void *)(v166 - 8);
                      *(void *)&long long v166 = v166 - 8;
                    }
                    else
                    {
                      *(void *)v168 = operator new(0xFC0uLL);
                    }
                    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)v165, v168);
                    uint64_t v141 = 21;
                    if ((void)v166 - (unint64_t)v165[1] != 8) {
                      uint64_t v141 = v167.i64[0] + 42;
                    }
                    v167.i64[0] = v141;
                  }
                }
                else
                {
                  v167.i64[0] = 42;
                  *(void *)v168 = *(void *)(v166 - 8);
                  *(void *)&long long v166 = v166 - 8;
                  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)v165, v168);
                }
                unint64_t v109 = v167.i64[0];
                v110 = (char *)v165[1];
                v111 = (char *)v166;
              }
              std::string v142 = &v110[8 * (v109 / 0x2A)];
              unint64_t v143 = *(void *)v142 + 96 * (v109 % 0x2A);
              if (v111 == v110) {
                uint64_t v144 = 0;
              }
              else {
                uint64_t v144 = v143;
              }
              if (v144 == *(void *)v142) {
                uint64_t v144 = *((void *)v142 - 1) + 4032;
              }
              long long v145 = *(_OWORD *)(v93 + 16);
              *(_OWORD *)(v144 - 96) = *(_OWORD *)v93;
              *(_OWORD *)(v144 - 80) = v145;
              uint64_t v146 = v91 + 96 * v92;
              *(void *)(v144 - 56) = 0;
              *(void *)(v144 - 48) = 0;
              *(void *)(v144 - 64) = 0;
              *(_OWORD *)(v144 - 64) = *(_OWORD *)(v146 + 32);
              *(void *)(v144 - 48) = *(void *)(v146 + 48);
              *(void *)(v146 + 32) = 0;
              *(void *)(v146 + 40) = 0;
              *(void *)(v146 + 48) = 0;
              *(void *)(v144 - 40) = 0;
              *(void *)(v144 - 32) = 0;
              *(void *)(v144 - 24) = 0;
              *(_OWORD *)(v144 - 40) = *(_OWORD *)(v146 + 56);
              *(void *)(v144 - 24) = *(void *)(v146 + 72);
              *(void *)(v146 + 56) = 0;
              *(void *)(v146 + 64) = 0;
              *(void *)(v146 + 72) = 0;
              uint64_t v147 = *v95;
              *(void *)(v144 - 11) = *(void *)(v93 + 85);
              *(void *)(v144 - 16) = v147;
              int64x2_t v167 = vaddq_s64(v167, (int64x2_t)xmmword_249C3A2B0);
              goto LABEL_203;
            case 0xFFFFFC1F:
LABEL_203:
              std::deque<std::__state<char>>::pop_back(v165);
              goto LABEL_204;
            case 0xFFFFFC20:
              long long v112 = *(_OWORD *)(v93 + 16);
              *(_OWORD *)v168 = *(_OWORD *)v93;
              *(_OWORD *)&v168[16] = v112;
              memset(&v168[32], 0, 24);
              std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v168[32], *(long long **)(v91 + 96 * v92 + 32), *(long long **)(v91 + 96 * v92 + 40), 0xAAAAAAAAAAAAAAABLL* ((uint64_t)(*(void *)(v91 + 96 * v92 + 40) - *(void *)(v91 + 96 * v92 + 32)) >> 3));
              __p[0] = 0;
              __p[1] = 0;
              v170[0] = 0;
              std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(long long **)(v91 + 96 * v92 + 56), *(long long **)(v91 + 96 * v92 + 64), (uint64_t)(*(void *)(v91 + 96 * v92 + 64) - *(void *)(v91 + 96 * v92 + 56)) >> 4);
              uint64_t v113 = *v95;
              *(void *)((char *)&v170[1] + 5) = *(void *)(v93 + 85);
              v170[1] = v113;
              (*(void (**)(void, uint64_t, uint64_t))(*(void *)*v95 + 24))(*v95, 1, v93);
              (*(void (**)(void, void, unsigned char *))(*(void *)v170[1] + 24))(v170[1], 0, v168);
              std::deque<std::__state<char>>::push_back(v165, (uint64_t)v168);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
              if (*(void *)&v168[32])
              {
                *(void *)&v168[40] = *(void *)&v168[32];
                operator delete(*(void **)&v168[32]);
              }
              goto LABEL_204;
            default:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
          }
          break;
        }
      }
      std::deque<std::__state<char>>::~deque[abi:ne180100]((uint64_t)v165);
    }
    return v75;
  }
  else
  {
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  }
}

void sub_249C2B1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37)
{
  operator delete(v37);
  if (__p) {
    operator delete(__p);
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100]((uint64_t)&a23);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  value = this->__end_cap_.__value_;
  std::vector<std::ssub_match>::pointer begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    std::vector<std::csub_match>::pointer end = this->__end_;
    std::vector<std::csub_match>::size_type v16 = end - begin;
    if (v16 >= __n) {
      std::vector<std::csub_match>::size_type v17 = __n;
    }
    else {
      std::vector<std::csub_match>::size_type v17 = end - begin;
    }
    if (v17)
    {
      BOOL v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      uint64_t v19 = &end[__n - v16];
      std::vector<std::csub_match>::size_type v20 = 24 * __n - 24 * v16;
      do
      {
        std::pair<const char *, const char *> v21 = __u->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    std::vector<std::csub_match>::size_type v9 = 2 * v8;
    if (2 * v8 <= __n) {
      std::vector<std::csub_match>::size_type v9 = __n;
    }
    if (v8 >= 0x555555555555555) {
      unint64_t v10 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v10 = v9;
    }
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    std::vector<std::csub_match>::pointer v11 = this->__end_;
    uint64_t v12 = &v11[__n];
    std::vector<std::csub_match>::size_type v13 = 24 * __n;
    do
    {
      std::pair<const char *, const char *> v14 = __u->std::pair<const char *, const char *>;
      *(void *)&v11->matched = *(void *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  long long v44 = 0;
  int64_t v45 = 0;
  unint64_t v46 = 0;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)long long v40 = 0;
    memset(&v40[8], 0, 48);
    *(_OWORD *)std::string __p = 0u;
    memset(v42, 0, 21);
    int64_t v45 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v44, (uint64_t)v40);
    if (__p[0]) {
      operator delete(__p[0]);
    }
    if (*(void *)&v40[32]) {
      operator delete(*(void **)&v40[32]);
    }
    uint64_t v38 = a4;
    std::vector<std::csub_match>::size_type v13 = v45;
    *((_DWORD *)v45 - 24) = 0;
    *((void *)v13 - 11) = a2;
    *((void *)v13 - 10) = a2;
    *((void *)v13 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v13 - 64), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(v45 - 40), *(unsigned int *)(a1 + 32));
    std::pair<const char *, const char *> v14 = v45;
    *((void *)v45 - 2) = v6;
    uint64_t v39 = a3;
    signed int v15 = a3 - a2;
    *((_DWORD *)v14 - 2) = a5;
    *(v14 - 4) = a6;
    unsigned int v16 = 1;
    while (2)
    {
      if ((v16 & 0xFFF) != 0 || (int)(v16 >> 12) < v15)
      {
        BOOL v18 = v14 - 16;
        uint64_t v17 = *((void *)v14 - 2);
        uint64_t v19 = v14 - 96;
        if (v17) {
          (*(void (**)(uint64_t, char *))(*(void *)v17 + 16))(v17, v14 - 96);
        }
        switch(*(_DWORD *)v19)
        {
          case 0xFFFFFC18:
            std::vector<std::csub_match>::size_type v20 = (const char *)*((void *)v14 - 10);
            if ((a5 & 0x20) != 0 && v20 == a2 || (a5 & 0x1000) != 0 && v20 != v39) {
              goto LABEL_16;
            }
            uint64_t v29 = *v38;
            *(void *)uint64_t v29 = a2;
            *(void *)(v29 + 8) = v20;
            *(unsigned char *)(v29 + 16) = 1;
            uint64_t v30 = *((void *)v14 - 8);
            uint64_t v31 = *((void *)v14 - 7) - v30;
            if (v31)
            {
              unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * (v31 >> 3);
              unint64_t v33 = (unsigned char *)(v30 + 16);
              unsigned int v34 = 1;
              do
              {
                uint64_t v35 = v29 + 24 * v34;
                *(_OWORD *)uint64_t v35 = *((_OWORD *)v33 - 1);
                char v36 = *v33;
                v33 += 24;
                *(unsigned char *)(v35 + 16) = v36;
              }
              while (v32 > v34++);
            }
            uint64_t v27 = 1;
            goto LABEL_25;
          case 0xFFFFFC1D:
          case 0xFFFFFC1E:
          case 0xFFFFFC21:
            goto LABEL_23;
          case 0xFFFFFC1F:
LABEL_16:
            std::pair<const char *, const char *> v21 = v45 - 96;
            std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)v45 - 12);
            int64_t v45 = v21;
            goto LABEL_23;
          case 0xFFFFFC20:
            long long v22 = *((_OWORD *)v14 - 5);
            *(_OWORD *)long long v40 = *(_OWORD *)v19;
            *(_OWORD *)&v40[16] = v22;
            memset(&v40[32], 0, 24);
            std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v40[32], *((long long **)v14 - 8), *((long long **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)v14 - 7) - *((void *)v14 - 8)) >> 3));
            __p[0] = 0;
            __p[1] = 0;
            v42[0] = 0;
            std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((long long **)v14 - 5), *((long long **)v14 - 4), (uint64_t)(*((void *)v14 - 4) - *((void *)v14 - 5)) >> 4);
            uint64_t v23 = *(void *)v18;
            *(void *)((char *)&v42[1] + 5) = *(void *)(v14 - 11);
            v42[1] = v23;
            (*(void (**)(void, uint64_t, char *))(**(void **)v18 + 24))(*(void *)v18, 1, v14 - 96);
            (*(void (**)(void, void, unsigned char *))(*(void *)v42[1] + 24))(v42[1], 0, v40);
            long long v24 = v45;
            if ((unint64_t)v45 >= v46)
            {
              int64_t v45 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v44, (uint64_t)v40);
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
              }
            }
            else
            {
              long long v25 = *(_OWORD *)&v40[16];
              *(_OWORD *)int64_t v45 = *(_OWORD *)v40;
              *((_OWORD *)v24 + 1) = v25;
              *((void *)v24 + 4) = 0;
              *((void *)v24 + 5) = 0;
              *((void *)v24 + 6) = 0;
              *((void *)v24 + 7) = 0;
              *((_OWORD *)v24 + 2) = *(_OWORD *)&v40[32];
              *((void *)v24 + 6) = *(void *)&v40[48];
              memset(&v40[32], 0, 24);
              *((void *)v24 + 8) = 0;
              *((void *)v24 + 9) = 0;
              *(_OWORD *)(v24 + 56) = *(_OWORD *)__p;
              *((void *)v24 + 9) = v42[0];
              __p[0] = 0;
              __p[1] = 0;
              v42[0] = 0;
              uint64_t v26 = v42[1];
              *(void *)(v24 + 85) = *(void *)((char *)&v42[1] + 5);
              *((void *)v24 + 10) = v26;
              int64_t v45 = v24 + 96;
            }
            if (*(void *)&v40[32])
            {
              *(void *)&v40[40] = *(void *)&v40[32];
              operator delete(*(void **)&v40[32]);
            }
LABEL_23:
            std::pair<const char *, const char *> v14 = v45;
            ++v16;
            if (v44 == v45) {
              goto LABEL_24;
            }
            continue;
          default:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
        }
      }
      break;
    }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
  }
LABEL_24:
  uint64_t v27 = 0;
LABEL_25:
  *(void *)long long v40 = &v44;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  return v27;
}

void sub_249C2B908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  std::__state<char>::~__state(&a11);
  a11 = v16 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a11);
  _Unwind_Resume(a1);
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 5);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) > v3) {
    unint64_t v3 = 0x5555555555555556 * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5);
  }
  if (0xAAAAAAAAAAAAAAABLL * (((unsigned char *)a1[2] - (unsigned char *)*a1) >> 5) >= 0x155555555555555) {
    unint64_t v6 = 0x2AAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v6 = v3;
  }
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int v7 = (char *)operator new(96 * v6);
  }
  else
  {
    int v7 = 0;
  }
  long long v8 = *(_OWORD *)(a2 + 16);
  std::vector<std::csub_match>::size_type v9 = &v7[96 * v2];
  *(_OWORD *)std::vector<std::csub_match>::size_type v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  unint64_t v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((void *)v9 + 6) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(v9 + 85) = *(void *)(a2 + 85);
  uint64_t v11 = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  *((void *)v9 + 9) = 0;
  *((void *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((void *)v9 + 9) = v11;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  std::vector<std::csub_match>::size_type v13 = v9 + 96;
  std::pair<const char *, const char *> v14 = (char *)*a1;
  signed int v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    uint64_t v16 = 0;
    do
    {
      uint64_t v17 = &v9[v16];
      BOOL v18 = &v15[v16];
      long long v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((void *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((void *)v17 - 6) = *(void *)&v15[v16 - 48];
      *((void *)v18 - 8) = 0;
      *((void *)v18 - 7) = 0;
      *((void *)v18 - 6) = 0;
      *((void *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((void *)v17 - 3) = *(void *)&v15[v16 - 24];
      *((void *)v18 - 5) = 0;
      *((void *)v18 - 4) = 0;
      *((void *)v18 - 3) = 0;
      uint64_t v20 = *(void *)&v15[v16 - 16];
      *(void *)(v17 - 11) = *(void *)&v15[v16 - 11];
      *((void *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    signed int v15 = (char *)*a1;
    std::pair<const char *, const char *> v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      v21 -= 96;
      std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v21);
    }
  }
  if (v15) {
    operator delete(v15);
  }
  return v13;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::pointer begin = this->__begin_;
  std::vector<std::csub_match>::pointer end = this->__end_;
  unint64_t v7 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
  unint64_t v8 = __sz - v7;
  if (__sz <= v7)
  {
    if (__sz < v7) {
      this->__end_ = &begin[__sz];
    }
  }
  else
  {
    value = this->__end_cap_.__value_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= v8)
    {
      long long v25 = &end[v8];
      std::vector<std::csub_match>::size_type v26 = 24 * __sz - 8 * (((char *)end - (char *)this->__begin_) >> 3);
      do
      {
        std::pair<const char *, const char *> v27 = __x->std::pair<const char *, const char *>;
        *(void *)&end->matched = *(void *)&__x->matched;
        end->std::pair<const char *, const char *> = v27;
        ++end;
        v26 -= 24;
      }
      while (v26);
      this->__end_ = v25;
    }
    else
    {
      if (__sz > 0xAAAAAAAAAAAAAAALL) {
        std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3);
      std::vector<std::csub_match>::size_type v12 = 2 * v11;
      if (2 * v11 <= __sz) {
        std::vector<std::csub_match>::size_type v12 = __sz;
      }
      if (v11 >= 0x555555555555555) {
        unint64_t v13 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v13 = v12;
      }
      std::pair<const char *, const char *> v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v13);
      uint64_t v16 = (std::sub_match<const char *> *)&v14[24 * v7];
      uint64_t v17 = (std::sub_match<const char *> *)&v14[24 * __sz];
      BOOL v18 = v16;
      std::vector<std::csub_match>::size_type v19 = 24 * __sz - 24 * v7;
      do
      {
        std::pair<const char *, const char *> v20 = __x->std::pair<const char *, const char *>;
        v18[1].first = *(const char **)&__x->matched;
        *BOOL v18 = v20;
        BOOL v18 = (std::pair<const char *, const char *> *)((char *)v18 + 24);
        v19 -= 24;
      }
      while (v19);
      std::pair<const char *, const char *> v21 = (std::sub_match<const char *> *)&v14[24 * v15];
      std::vector<std::csub_match>::pointer v23 = this->__begin_;
      long long v22 = this->__end_;
      if (v22 != this->__begin_)
      {
        do
        {
          std::pair<const char *, const char *> v24 = v22[-1].std::pair<const char *, const char *>;
          *(void *)&v16[-1].matched = *(void *)&v22[-1].matched;
          v16[-1].std::pair<const char *, const char *> = v24;
          --v16;
          --v22;
        }
        while (v22 != v23);
        long long v22 = this->__begin_;
      }
      this->__begin_ = v16;
      this->__end_ = v17;
      this->__end_cap_.__value_ = v21;
      if (v22)
      {
        operator delete(v22);
      }
    }
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::pointer begin = this->__begin_;
  std::vector<std::pair<unsigned long, const char *>>::pointer end = this->__end_;
  std::vector<std::pair<unsigned long, const char *>>::size_type v5 = end - this->__begin_;
  if (__sz <= v5)
  {
    if (__sz >= v5) {
      return;
    }
    BOOL v18 = &begin[__sz];
    goto LABEL_19;
  }
  std::vector<std::pair<unsigned long, const char *>>::size_type v6 = __sz - v5;
  value = this->__end_cap_.__value_;
  if (__sz - v5 <= value - end)
  {
    bzero(this->__end_, 16 * v6);
    BOOL v18 = &end[v6];
LABEL_19:
    this->__end_ = v18;
    return;
  }
  if (__sz >> 60) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v8 = (char *)value - (char *)begin;
  std::vector<std::pair<unsigned long, const char *>>::size_type v9 = v8 >> 3;
  if (v8 >> 3 <= __sz) {
    std::vector<std::pair<unsigned long, const char *>>::size_type v9 = __sz;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  unint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(v10);
  std::vector<std::csub_match>::size_type v12 = (std::pair<unsigned long, const char *> *)&v11[16 * v5];
  std::pair<const char *, const char *> v14 = (std::pair<unsigned long, const char *> *)&v11[16 * v13];
  bzero(v12, 16 * v6);
  uint64_t v15 = &v12[v6];
  std::vector<std::pair<unsigned long, const char *>>::pointer v17 = this->__begin_;
  uint64_t v16 = this->__end_;
  if (v16 != this->__begin_)
  {
    do
    {
      v12[-1] = v16[-1];
      --v12;
      --v16;
    }
    while (v16 != v17);
    uint64_t v16 = this->__begin_;
  }
  this->__begin_ = v12;
  this->__end_ = v15;
  this->__end_cap_.__value_ = v14;
  if (v16)
  {
    operator delete(v16);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 12);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2BE24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *std::__state<char>::~__state(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::__destroy_at[abi:ne180100]<std::__state<char>,0>(void *a1)
{
  unint64_t v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  unint64_t v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    std::vector<std::pair<unsigned long, const char *>>::size_type v6 = result;
    uint64_t result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      *(void *)(v7 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v7 = v8;
      v7 += 24;
      a2 = (long long *)((char *)a2 + 24);
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_249C2BF38(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    std::vector<std::pair<unsigned long, const char *>>::size_type v6 = result;
    uint64_t result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_249C2BFAC(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 16);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2C00C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    std::vector<std::pair<unsigned long, const char *>>::size_type v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v4);
      }
      while (v4 != v2);
      std::vector<std::pair<unsigned long, const char *>>::size_type v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::TypeRefPair>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

__n128 std::deque<std::__state<char>>::push_back(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1[2];
  std::vector<std::pair<unsigned long, const char *>>::size_type v5 = (char *)a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 42 * ((v4 - v5) >> 3) - 1;
  }
  unint64_t v7 = a1[4];
  unint64_t v8 = a1[5] + v7;
  if (v6 == v8)
  {
    if (v7 < 0x2A)
    {
      unint64_t v22 = (v4 - v5) >> 3;
      std::vector<std::csub_match>::pointer v23 = (char *)a1[3];
      uint64_t v24 = (uint64_t)&v23[-*a1];
      if (v22 >= v24 >> 3)
      {
        if (v23 == (char *)*a1) {
          unint64_t v25 = 1;
        }
        else {
          unint64_t v25 = v24 >> 2;
        }
        unint64_t v87 = a1 + 3;
        *(void *)&long long v85 = std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v25);
        *((void *)&v85 + 1) = v85 + 8 * v22;
        *(void *)&long long v86 = *((void *)&v85 + 1);
        *((void *)&v86 + 1) = v85 + 8 * v26;
        CFNumberRef v84 = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(&v85, &v84);
        uint64_t v27 = a1[2];
        uint64_t v29 = (char *)*((void *)&v85 + 1);
        uint64_t v28 = (char *)v85;
        uint64_t v31 = (char *)*((void *)&v86 + 1);
        uint64_t v30 = (char *)v86;
        while (v27 != a1[1])
        {
          if (v29 == v28)
          {
            if (v30 >= v31)
            {
              if (v31 == v28) {
                unint64_t v37 = 1;
              }
              else {
                unint64_t v37 = (v31 - v28) >> 2;
              }
              uint64_t v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v37);
              long long v40 = v38;
              uint64_t v29 = &v38[(2 * v37 + 6) & 0xFFFFFFFFFFFFFFF8];
              uint64_t v41 = v30 - v28;
              BOOL v35 = v30 == v28;
              uint64_t v30 = v29;
              if (!v35)
              {
                uint64_t v30 = &v29[v41 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v42 = 8 * (v41 >> 3);
                uint64_t v43 = v29;
                long long v44 = v28;
                do
                {
                  uint64_t v45 = *(void *)v44;
                  v44 += 8;
                  *(void *)uint64_t v43 = v45;
                  v43 += 8;
                  v42 -= 8;
                }
                while (v42);
              }
              uint64_t v31 = &v38[8 * v39];
              if (v28) {
                operator delete(v28);
              }
              uint64_t v28 = v40;
            }
            else
            {
              uint64_t v32 = (v31 - v30) >> 3;
              if (v32 >= -1) {
                unint64_t v33 = v32 + 1;
              }
              else {
                unint64_t v33 = v32 + 2;
              }
              unsigned int v34 = &v30[8 * (v33 >> 1)];
              uint64_t v29 = &v34[-(v30 - v28)];
              size_t v36 = v30 - v28;
              BOOL v35 = v30 == v28;
              uint64_t v30 = v34;
              if (!v35) {
                memmove(v29, v28, v36);
              }
            }
          }
          uint64_t v46 = *(void *)(v27 - 8);
          v27 -= 8;
          *((void *)v29 - 1) = v46;
          v29 -= 8;
        }
        *(void *)&long long v85 = v28;
        *((void *)&v85 + 1) = v29;
        *(void *)&long long v86 = v30;
        *((void *)&v86 + 1) = v31;
        long long v48 = v85;
        long long v49 = v86;
        *(void *)&long long v85 = *a1;
        uint64_t v47 = (void *)v85;
        *((void *)&v85 + 1) = v27;
        *(_OWORD *)a1 = v48;
        *((_OWORD *)a1 + 1) = v49;
        if (v47) {
          operator delete(v47);
        }
        goto LABEL_60;
      }
      if (v23 != v4)
      {
        *(void *)&long long v85 = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v85);
LABEL_60:
        std::vector<std::pair<unsigned long, const char *>>::size_type v5 = (char *)a1[1];
        unint64_t v8 = a1[5] + a1[4];
        goto LABEL_61;
      }
      *(void *)&long long v85 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v85);
      long long v61 = (void *)a1[1];
      uint64_t v4 = (char *)a1[2];
      uint64_t v63 = *v61;
      long long v62 = (char *)(v61 + 1);
      uint64_t v10 = v63;
      a1[1] = v62;
      if (v4 == (char *)a1[3])
      {
        uint64_t v64 = (uint64_t)&v62[-*a1];
        if ((unint64_t)v62 > *a1)
        {
          uint64_t v65 = v64 >> 3;
          BOOL v14 = v64 >> 3 < -1;
          uint64_t v66 = (v64 >> 3) + 2;
          if (v14) {
            uint64_t v67 = v66;
          }
          else {
            uint64_t v67 = v65 + 1;
          }
          uint64_t v68 = -(v67 >> 1);
          uint64_t v69 = v67 >> 1;
          uint64_t v70 = &v62[-8 * v69];
          int64_t v71 = v4 - v62;
          if (v4 != v62)
          {
            memmove(&v62[-8 * v69], v62, v4 - v62);
            long long v62 = (char *)a1[1];
          }
          uint64_t v4 = &v70[v71];
          unsigned int v72 = &v62[8 * v68];
          goto LABEL_58;
        }
        if (v4 == (char *)*a1) {
          unint64_t v77 = 1;
        }
        else {
          unint64_t v77 = (uint64_t)&v4[-*a1] >> 2;
        }
        uint64_t v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v77);
        unint64_t v52 = &v51[8 * (v77 >> 2)];
        uint64_t v54 = &v51[8 * v78];
        uint64_t v79 = (uint64_t *)a1[1];
        uint64_t v4 = v52;
        uint64_t v80 = a1[2] - (void)v79;
        if (v80)
        {
          uint64_t v4 = &v52[v80 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v81 = 8 * (v80 >> 3);
          unsigned int v82 = &v51[8 * (v77 >> 2)];
          do
          {
            uint64_t v83 = *v79++;
            *(void *)unsigned int v82 = v83;
            v82 += 8;
            v81 -= 8;
          }
          while (v81);
        }
LABEL_46:
        uint64_t v60 = (void *)*a1;
        *a1 = v51;
        a1[1] = v52;
        a1[2] = v4;
        a1[3] = v54;
        if (v60)
        {
          operator delete(v60);
          uint64_t v4 = (char *)a1[2];
        }
      }
    }
    else
    {
      a1[4] = v7 - 42;
      uint64_t v11 = *(void *)v5;
      std::vector<std::pair<unsigned long, const char *>>::size_type v9 = v5 + 8;
      uint64_t v10 = v11;
      a1[1] = v9;
      if ((char *)a1[3] == v4)
      {
        uint64_t v12 = (uint64_t)&v9[-*a1];
        if ((unint64_t)v9 > *a1)
        {
          uint64_t v13 = v12 >> 3;
          BOOL v14 = v12 >> 3 < -1;
          uint64_t v15 = (v12 >> 3) + 2;
          if (v14) {
            uint64_t v16 = v15;
          }
          else {
            uint64_t v16 = v13 + 1;
          }
          uint64_t v17 = -(v16 >> 1);
          uint64_t v18 = v16 >> 1;
          std::vector<std::csub_match>::size_type v19 = &v9[-8 * v18];
          int64_t v20 = v4 - v9;
          if (v4 == v9)
          {
            std::pair<const char *, const char *> v21 = v4;
          }
          else
          {
            memmove(&v9[-8 * v18], v9, v4 - v9);
            std::pair<const char *, const char *> v21 = (char *)a1[1];
          }
          uint64_t v4 = &v19[v20];
          unsigned int v72 = &v21[8 * v17];
LABEL_58:
          a1[1] = v72;
          a1[2] = v4;
          goto LABEL_59;
        }
        if (v4 == (char *)*a1) {
          unint64_t v50 = 1;
        }
        else {
          unint64_t v50 = (uint64_t)&v4[-*a1] >> 2;
        }
        uint64_t v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v50);
        unint64_t v52 = &v51[8 * (v50 >> 2)];
        uint64_t v54 = &v51[8 * v53];
        std::string v55 = (uint64_t *)a1[1];
        uint64_t v4 = v52;
        uint64_t v56 = a1[2] - (void)v55;
        if (v56)
        {
          uint64_t v4 = &v52[v56 & 0xFFFFFFFFFFFFFFF8];
          uint64_t v57 = 8 * (v56 >> 3);
          uint64_t v58 = &v51[8 * (v50 >> 2)];
          do
          {
            uint64_t v59 = *v55++;
            *(void *)uint64_t v58 = v59;
            v58 += 8;
            v57 -= 8;
          }
          while (v57);
        }
        goto LABEL_46;
      }
    }
LABEL_59:
    *(void *)uint64_t v4 = v10;
    a1[2] += 8;
    goto LABEL_60;
  }
LABEL_61:
  unint64_t v73 = *(void *)&v5[8 * (v8 / 0x2A)] + 96 * (v8 % 0x2A);
  long long v74 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)unint64_t v73 = *(_OWORD *)a2;
  *(_OWORD *)(v73 + 16) = v74;
  *(void *)(v73 + 40) = 0;
  *(void *)(v73 + 48) = 0;
  *(void *)(v73 + 32) = 0;
  *(_OWORD *)(v73 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(v73 + 48) = *(void *)(a2 + 48);
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  *(void *)(v73 + 56) = 0;
  *(void *)(v73 + 64) = 0;
  *(void *)(v73 + 72) = 0;
  __n128 result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v73 + 56) = result;
  *(void *)(v73 + 72) = *(void *)(a2 + 72);
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *(void *)(a2 + 72) = 0;
  uint64_t v76 = *(void *)(a2 + 80);
  *(void *)(v73 + 85) = *(void *)(a2 + 85);
  *(void *)(v73 + 80) = v76;
  ++a1[5];
  return result;
}

void sub_249C2C550(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p)
{
  operator delete(v11);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void std::deque<std::__state<char>>::pop_back(void *a1)
{
  unint64_t v2 = a1[5] + a1[4] - 1;
  std::__destroy_at[abi:ne180100]<std::__state<char>,0>((void *)(*(void *)(a1[1] + 8 * (v2 / 0x2A))
                                                                 + 96 * (v2 % 0x2A)));
  uint64_t v4 = a1[1];
  uint64_t v3 = a1[2];
  if (v3 == v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 42 * ((v3 - v4) >> 3) - 1;
  }
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5] - 1;
  a1[5] = v7;
  if ((unint64_t)(v5 - (v7 + v6)) >= 0x54)
  {
    operator delete(*(void **)(v3 - 8));
    a1[2] -= 8;
  }
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  unint64_t v2 = *(void ***)(a1 + 8);
  uint64_t v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    uint64_t v4 = (void *)(a1 + 40);
    uint64_t v3 = *(void ***)(a1 + 8);
  }
  else
  {
    uint64_t v4 = (void *)(a1 + 40);
    unint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = &v2[v5 / 0x2A];
    uint64_t v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    unint64_t v8 = (unint64_t)v2[(*(void *)(a1 + 40) + v5) / 0x2A] + 96 * ((*(void *)(a1 + 40) + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::__destroy_at[abi:ne180100]<std::__state<char>,0>(v7);
        v7 += 96;
        if (v7 - (unsigned char *)*v6 == 4032)
        {
          std::vector<std::pair<unsigned long, const char *>>::size_type v9 = (char *)v6[1];
          ++v6;
          uint64_t v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      unint64_t v2 = *(void ***)(a1 + 8);
      uint64_t v3 = *(void ***)(a1 + 16);
    }
  }
  *uint64_t v4 = 0;
  unint64_t v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = *(void ***)(a1 + 16);
      unint64_t v2 = (void **)(*(void *)(a1 + 8) + 8);
      *(void *)(a1 + 8) = v2;
      unint64_t v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v10 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 21;
    goto LABEL_14;
  }
  if (v11 == 2)
  {
    uint64_t v12 = 42;
LABEL_14:
    *(void *)(a1 + 32) = v12;
  }
  if (v2 != v3)
  {
    do
    {
      uint64_t v13 = *v2++;
      operator delete(v13);
    }
    while (v2 != v3);
    uint64_t v15 = *(void *)(a1 + 8);
    uint64_t v14 = *(void *)(a1 + 16);
    if (v14 != v15) {
      *(void *)(a1 + 16) = v14 + ((v15 - v14 + 7) & 0xFFFFFFFFFFFFFFF8);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v11);
      unint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      uint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        uint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        std::vector<std::csub_match>::size_type v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)std::vector<std::csub_match>::size_type v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      std::pair<const char *, const char *> v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        unint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      unint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    unint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    unint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<applesauce::CF::StringRef>>(v16);
      std::vector<std::csub_match>::size_type v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        std::vector<std::csub_match>::pointer v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)std::vector<std::csub_match>::pointer v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  unint64_t v2 = (const std::locale *)MEMORY[0x24C5B1AC0]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x263F8C108]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x263F8C130]);
  return this;
}

void sub_249C2CA30(_Unwind_Exception *a1)
{
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>()
{
}

void sub_249C2CE7C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 17);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2CF24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  std::vector<std::pair<unsigned long, const char *>>::pointer end = a1->__end_;
  uint64_t v7 = a2;
  do
  {
    BOOL v8 = v7;
    uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2) {
    operator new();
  }
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = a1->__end_;
    uint64_t v10 = v8 + 1;
    uint64_t v11 = v8 + 1;
    do
    {
      BOOL v8 = v11;
      uint64_t v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, v11, a3);
    }
    while (v11 != v8);
    if (v8 == v10) {
      operator new();
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return a3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a2;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v4 = a3;
  if (*a2 == 94)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    ++v3;
  }
  if (v3 != v4)
  {
    do
    {
      uint64_t v6 = v3;
      uint64_t v3 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(this, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 != v4 || *v6 != 36) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    }
  }
  return v4;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v3 = a3;
  std::vector<std::pair<unsigned long, const char *>>::pointer end = a1->__end_;
  uint64_t v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2) {
LABEL_9:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  BOOL v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124) {
      return (char *)v8;
    }
    uint64_t v9 = a1->__end_;
    uint64_t v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(a1, (char *)v8 + 1, v3);
    if (v10 == v8 + 1) {
      goto LABEL_9;
    }
    BOOL v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return v3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 14);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2D230(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  *(_DWORD *)a3 = -994;
  uint64_t v3 = 8;
  if (a2) {
    uint64_t v3 = 16;
  }
  *(void *)(a3 + 80) = *(void *)(result + v3);
  return result;
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26FDCE1C0;
  uint64_t v2 = a1[2];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  uint64_t v3 = a1[1];
  if (v3) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  }
  return a1;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }

  JUMPOUT(0x24C5B1B10);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first) {
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  }
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);

  JUMPOUT(0x24C5B1B10);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  uint64_t v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  }
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 15);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2D678(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  std::vector<std::pair<unsigned long, const char *>>::pointer end = this->__end_;
  unsigned int marked_count = this->__marked_count_;
  if (a2 == a3)
  {
LABEL_24:
    uint64_t v15 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    goto LABEL_25;
  }
  int v8 = *a2;
  uint64_t v9 = (v8 - 36);
  if (v9 > 0x3A) {
    goto LABEL_13;
  }
  if (((1 << (v8 - 36)) & 0x5800000080004D1) != 0) {
    goto LABEL_4;
  }
  if (v9 == 5)
  {
    if (!this->__open_count_) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_13:
    if ((v8 - 123) >= 2)
    {
LABEL_14:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, *a2);
LABEL_32:
      int64_t v14 = (unsigned __int8 *)(a2 + 1);
      goto LABEL_37;
    }
  }
LABEL_4:
  uint64_t v10 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_21:
    int v11 = *a2;
LABEL_22:
    if (v11 == 46) {
      operator new();
    }
    goto LABEL_24;
  }
  int v11 = *a2;
  if (v11 != 92) {
    goto LABEL_22;
  }
  int v12 = *v10;
  char v13 = *v10;
  if (((v12 - 36) > 0x3A || ((1 << (v12 - 36)) & 0x5800000080004F1) == 0)
    && (v12 - 123) >= 3)
  {
    if ((this->__flags_ & 0x1F0) == 0x40)
    {
      uint64_t v15 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(this, a2 + 1, a3, 0);
    }
    else
    {
      BOOL v16 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, v13);
      uint64_t v17 = 2;
      if (!v16) {
        uint64_t v17 = 0;
      }
      uint64_t v15 = &a2[v17];
    }
    if (v15 != a2)
    {
LABEL_25:
      if (v15 == a2 && v15 != a3)
      {
        int v18 = *a2;
        if (v18 == 36)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
          goto LABEL_32;
        }
        if (v18 != 40)
        {
          if (v18 == 94)
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
            goto LABEL_32;
          }
          return (unsigned __int8 *)a2;
        }
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
        unsigned int v19 = this->__marked_count_;
        ++this->__open_count_;
        uint64_t v20 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(this, a2 + 1, a3);
        if (v20 == a3 || (uint64_t v21 = v20, *v20 != 41)) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, v19);
        --this->__open_count_;
        uint64_t v15 = v21 + 1;
      }
      int64_t v14 = (unsigned __int8 *)v15;
      if (v15 != a2) {
        goto LABEL_37;
      }
      return (unsigned __int8 *)a2;
    }
    goto LABEL_21;
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v13);
  int64_t v14 = (unsigned __int8 *)(a2 + 2);
LABEL_37:
  size_t v22 = this->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v14, (unsigned __int8 *)a3, end, marked_count + 1, v22);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(std::basic_regex<char> *this)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(std::basic_regex<char> *this)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  if ((this->__flags_ & 2) == 0) {
    operator new();
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 6);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2DB28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  if ((this->__flags_ & 2) == 0) {
    operator new();
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  if (a2 == a3) {
    return a2;
  }
  unsigned int v6 = a6;
  unsigned int v7 = a5;
  uint64_t v10 = a1;
  int v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  int v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      char v13 = a2 + 1;
      if (v11) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v13 == a3;
      }
      if (!v20 && *v13 == 63)
      {
        char v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        size_t v14 = 0;
        size_t v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      size_t v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123) {
      return a2;
    }
    uint64_t v15 = a2 + 1;
    BOOL v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(a2 + 1, a3, (int *)&__max);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        int v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            char v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              char v13 = v16 + 2;
              size_t v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              size_t v18 = (int)__max;
LABEL_33:
              uint64_t v21 = __s;
              BOOL v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            size_t v18 = (int)__max;
LABEL_45:
            uint64_t v21 = __s;
            BOOL v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        std::vector<std::csub_match>::pointer v23 = v16 + 1;
        if (v16 + 1 == a3) {
          goto LABEL_58;
        }
        if (*v23 == 125)
        {
          char v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            char v13 = v16 + 3;
            size_t v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          size_t v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          size_t v18 = -1;
          goto LABEL_45;
        }
        int v27 = -1;
        unint64_t v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v16 + 1, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          size_t v18 = v27;
          size_t v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            char v13 = v25 + 1;
            BOOL v22 = 1;
            if (!v11 && v13 != a3)
            {
              int v26 = v25[1];
              BOOL v22 = v26 != 63;
              if (v26 == 63) {
                char v13 = v25 + 2;
              }
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            uint64_t v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    char v13 = a2 + 1;
    if (v11) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v13 == a3;
    }
    if (!v19 && *v13 == 63)
    {
      char v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    char v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      char v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      size_t v14 = 1;
LABEL_26:
      size_t v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    size_t v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
}

void sub_249C2E00C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(unsigned __int8 *result, unsigned __int8 *a2, int *a3)
{
  if (result != a2)
  {
    int v3 = *result;
    if ((v3 & 0xF8) == 0x30 || (v3 & 0xFE) == 0x38)
    {
      int v4 = v3 - 48;
      *a3 = v4;
      if (++result == a2)
      {
        return a2;
      }
      else
      {
        while (1)
        {
          int v5 = *result;
          if ((v5 & 0xF8) != 0x30 && (v5 & 0xFE) != 0x38) {
            break;
          }
          if (v4 >= 214748364) {
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          }
          int v4 = v5 + 10 * v4 - 48;
          *a3 = v4;
          if (++result == a2) {
            return a2;
          }
        }
      }
    }
  }
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 8);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2E124(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 7);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2E17C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, void *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((void *)result + 2);
  }
  else
  {
    a3[10] = *((void *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, void *a2)
{
  unsigned int v2 = result[11];
  *(void *)(a2[7] + 16 * result[10] + 8) = a2[2];
  unsigned int v3 = result[12];
  if (v2 != v3)
  {
    uint64_t v4 = v2 - 1;
    uint64_t v5 = a2[3];
    uint64_t v6 = v3 - 1 - v4;
    unsigned int v7 = (unsigned char *)(a2[4] + 24 * v4 + 16);
    do
    {
      *((void *)v7 - 2) = v5;
      *((void *)v7 - 1) = v5;
      *unsigned int v7 = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, void *a2)
{
  uint64_t v2 = result[10];
  uint64_t v3 = a2[7];
  uint64_t v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    unint64_t v5 = *v4 + 1;
    *uint64_t v4 = v5;
    unint64_t v6 = *((void *)result + 3);
    unint64_t v7 = *((void *)result + 4);
    BOOL v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      uint64_t v10 = *(void *)(v3 + 16 * v2 + 8);
      BOOL v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8) {
        goto LABEL_25;
      }
LABEL_22:
      a2[10] = *((void *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *uint64_t v4 = 0;
  if (*((void *)result + 4))
  {
    if (*((void *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((void *)result + 2);
  return result;
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::__owns_two_states<char>::~__owns_two_states(a1);

  JUMPOUT(0x24C5B1B10);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  uint64_t v2 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(void *)(v2 + 8) = *(void *)(a2 + 16);
  *(unsigned char *)(v2 + 16) = 1;
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(void *)(*(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(void *)(a2 + 16);
  *(void *)(a2 + 80) = *(void *)(result + 8);
  return result;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(unsigned char *)(a2 + 88) & 2) == 0
    || *(unsigned char *)(result + 16) && ((v3 = *v2, v3 != 13) ? (BOOL v4 = v3 == 10) : (BOOL v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    uint64_t v5 = *(void *)(result + 8);
  }
  else
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  uint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 92))
  {
    if (*(void *)(a2 + 16) != *(void *)(a2 + 8) || (*(unsigned char *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      uint64_t v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(unsigned char *)(result + 16)) {
      goto LABEL_12;
    }
    int v2 = *(unsigned __int8 *)(*(void *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10) {
      goto LABEL_12;
    }
  }
  *(_DWORD *)a2 = -994;
  uint64_t v4 = *(void *)(result + 8);
LABEL_13:
  *(void *)(a2 + 80) = v4;
  return result;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3) {
      goto LABEL_244;
    }
    uint64_t v5 = (uint64_t)(a2[1] == 94 ? a2 + 2 : a2 + 1);
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if ((char *)v5 == a3) {
      goto LABEL_244;
    }
    uint64_t v7 = (uint64_t)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(unsigned char *)v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if ((char *)v5 == a3) {
      goto LABEL_244;
    }
    uint64_t v78 = v7 + 16;
    uint64_t v79 = (std::vector<std::string> *)(v7 + 136);
    unint64_t v77 = (char **)(v7 + 88);
    uint64_t v80 = a3 - 4;
    while (1)
    {
      BOOL v8 = (char *)v5;
      uint64_t v9 = a3;
      if ((char *)v5 == a3) {
        goto LABEL_147;
      }
      int v10 = *(unsigned __int8 *)v5;
      uint64_t v9 = (char *)v5;
      if (v10 == 93) {
        goto LABEL_147;
      }
      int v11 = 0;
      __p[0] = 0;
      __p[1] = 0;
      uint64_t v88 = 0;
      int v12 = 0;
      uint64_t v9 = (char *)v5;
      if ((char *)(v5 + 1) != a3 && v10 == 91)
      {
        int v13 = *(unsigned __int8 *)(v5 + 1);
        switch(v13)
        {
          case '.':
            uint64_t v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, (char *)(v5 + 2), a3, (uint64_t)__p);
            int v12 = (void *)HIBYTE(v88);
            int v11 = __p[1];
            break;
          case ':':
            if ((uint64_t)&a3[-v5 - 2] < 2) {
              goto LABEL_243;
            }
            for (unint64_t i = 0; ; ++i)
            {
              uint64_t v15 = (char *)(v5 + i + 2);
              if (*v15 == 58 && *(unsigned char *)(v5 + i + 3) == 93) {
                break;
              }
              if (&v80[-v5] == (char *)i) {
                goto LABEL_243;
              }
            }
            if (v15 == a3) {
LABEL_243:
            }
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
            int v20 = *(_DWORD *)(a1 + 24);
            std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__v, (char *)(v5 + 2), (char *)(v5 + i + 2), i);
            std::__split_buffer<std::string>::pointer end_high = (std::__split_buffer<std::string>::pointer)HIBYTE(__v.__end_);
            if (SHIBYTE(__v.__end_) >= 0) {
              p_v = &__v;
            }
            else {
              p_v = __v.__first_;
            }
            if (SHIBYTE(__v.__end_) < 0) {
              std::__split_buffer<std::string>::pointer end_high = __v.__begin_;
            }
            (*(void (**)(void, void *, char *))(**(void **)(a1 + 8) + 48))(*(void *)(a1 + 8), p_v, (char *)end_high + (void)p_v);
            if (SHIBYTE(__v.__end_) >= 0) {
              first = (const char *)&__v;
            }
            else {
              first = (const char *)__v.__first_;
            }
            std::regex_traits<char>::char_class_type classname = std::__get_classname(first, v20 & 1);
            if (SHIBYTE(__v.__end_) < 0) {
              operator delete(__v.__first_);
            }
            if (!classname) {
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
            }
            char v25 = 0;
            *(_DWORD *)(v7 + 160) |= classname;
            goto LABEL_143;
          case '=':
            if ((uint64_t)&a3[-v5 - 2] < 2) {
              goto LABEL_243;
            }
            for (j = 0; ; ++j)
            {
              uint64_t v15 = &j[v5 + 2];
              if (*v15 == 61 && j[v5 + 3] == 93) {
                break;
              }
              if (&v80[-v5] == j) {
                goto LABEL_243;
              }
            }
            if (v15 == a3) {
              goto LABEL_243;
            }
            std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)&v91, a1, (char *)(v5 + 2), &j[v5 + 2]);
            if (SHIBYTE(v92) < 0)
            {
              unint64_t v26 = *((void *)&v91 + 1);
              if (!*((void *)&v91 + 1)) {
LABEL_245:
              }
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              int v27 = (char *)v91;
            }
            else
            {
              unint64_t v26 = HIBYTE(v92);
              if (!HIBYTE(v92)) {
                goto LABEL_245;
              }
              int v27 = (char *)&v91;
            }
            std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__v, v27, &v27[v26], v26);
            (*(void (**)(std::string::value_type **__return_ptr))(**(void **)(a1 + 16) + 32))(__s);
            uint64_t v29 = (std::string::value_type *)HIBYTE(v90);
            if (v90 < 0) {
              uint64_t v29 = __s[1];
            }
            if (v29 != (std::string::value_type *)1)
            {
              if (v29 == (std::string::value_type *)12)
              {
                uint64_t v30 = __s;
                if (v90 < 0) {
                  uint64_t v30 = (std::string::value_type **)__s[0];
                }
                *((unsigned char *)v30 + 11) = *((unsigned char *)v30 + 3);
              }
              else if (SHIBYTE(v90) < 0)
              {
                *__s[0] = 0;
                __s[1] = 0;
              }
              else
              {
                LOBYTE(__s[0]) = 0;
                HIBYTE(v90) = 0;
              }
            }
            if (SHIBYTE(__v.__end_) < 0) {
              operator delete(__v.__first_);
            }
            size_t v36 = (std::string::value_type *)HIBYTE(v90);
            char v37 = HIBYTE(v90);
            if (v90 < 0) {
              size_t v36 = __s[1];
            }
            if (v36)
            {
              unint64_t v39 = *(void *)(v7 + 144);
              unint64_t v38 = *(void *)(v7 + 152);
              if (v39 >= v38)
              {
                unint64_t v43 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - (unint64_t)v79->__begin_) >> 3);
                unint64_t v44 = v43 + 1;
                if (v43 + 1 > 0xAAAAAAAAAAAAAAALL) {
                  std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
                }
                unint64_t v45 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v38 - (unint64_t)v79->__begin_) >> 3);
                if (2 * v45 > v44) {
                  unint64_t v44 = 2 * v45;
                }
                if (v45 >= 0x555555555555555) {
                  unint64_t v46 = 0xAAAAAAAAAAAAAAALL;
                }
                else {
                  unint64_t v46 = v44;
                }
                __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v7 + 152);
                if (v46)
                {
                  long long v48 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v46);
                  char v37 = HIBYTE(v90);
                }
                else
                {
                  long long v48 = 0;
                  uint64_t v47 = 0;
                }
                std::__split_buffer<std::string>::pointer end = v48 + v43;
                __v.__first_ = v48;
                __v.__begin_ = end;
                __v.__end_ = end;
                __v.__end_cap_.__value_ = &v48[v47];
                if (v37 < 0)
                {
                  std::string::__init_copy_ctor_external(end, __s[0], (std::string::size_type)__s[1]);
                  std::__split_buffer<std::string>::pointer end = __v.__end_;
                }
                else
                {
                  long long v52 = *(_OWORD *)__s;
                  end->__r_.__value_.__r.__words[2] = v90;
                  *(_OWORD *)&end->__r_.__value_.__l.__data_ = v52;
                }
                __v.__end_ = end + 1;
                std::vector<std::string>::__swap_out_circular_buffer(v79, &__v);
                unint64_t v50 = *(void *)(v7 + 144);
                std::__split_buffer<std::string>::~__split_buffer(&__v);
              }
              else
              {
                if (SHIBYTE(v90) < 0)
                {
                  std::string::__init_copy_ctor_external(*(std::string **)(v7 + 144), __s[0], (std::string::size_type)__s[1]);
                }
                else
                {
                  long long v40 = *(_OWORD *)__s;
                  *(void *)(v39 + 16) = v90;
                  *(_OWORD *)unint64_t v39 = v40;
                }
                unint64_t v50 = v39 + 24;
                *(void *)(v7 + 144) = v39 + 24;
              }
              *(void *)(v7 + 144) = v50;
            }
            else
            {
              uint64_t v41 = HIBYTE(v92);
              if (SHIBYTE(v92) < 0) {
                uint64_t v41 = *((void *)&v91 + 1);
              }
              if (v41 == 2)
              {
                long long v49 = (char *)&v91;
                if (SHIBYTE(v92) < 0) {
                  long long v49 = (char *)v91;
                }
                std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v7, *v49, v49[1]);
              }
              else
              {
                if (v41 != 1) {
                  std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
                }
                uint64_t v42 = (char *)&v91;
                if (SHIBYTE(v92) < 0) {
                  uint64_t v42 = (char *)v91;
                }
                std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, *v42);
              }
            }
            if (SHIBYTE(v90) < 0) {
              operator delete(__s[0]);
            }
            if (SHIBYTE(v92) < 0) {
              operator delete((void *)v91);
            }
            char v25 = 0;
LABEL_143:
            uint64_t v5 = (uint64_t)(v15 + 2);
            unsigned int v34 = v8;
            goto LABEL_144;
          default:
            int v11 = 0;
            int v12 = 0;
            uint64_t v9 = (char *)v5;
            break;
        }
      }
      uint64_t v5 = *(_DWORD *)(a1 + 24) & 0x1F0;
      if ((char)v12 >= 0) {
        int v11 = v12;
      }
      if (!v11)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
        {
          int v17 = *v9;
          if (v17 == 92)
          {
            size_t v18 = v9 + 1;
            if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0) {
              BOOL v19 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v18, a3, (uint64_t *)__p);
            }
            else {
              BOOL v19 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v18, (unsigned __int8 *)a3, (uint64_t)__p, v7);
            }
            uint64_t v9 = v19;
            goto LABEL_76;
          }
        }
        else
        {
          LOBYTE(v17) = *v9;
        }
        if ((char)v12 < 0)
        {
          uint64_t v28 = (void **)__p[0];
          __p[1] = (void *)1;
        }
        else
        {
          HIBYTE(v88) = 1;
          uint64_t v28 = __p;
        }
        *(unsigned char *)uint64_t v28 = v17;
        *((unsigned char *)v28 + 1) = 0;
        ++v9;
      }
LABEL_76:
      if (v9 != a3)
      {
        int v31 = *v9;
        if (v31 != 93)
        {
          unint64_t v33 = v9 + 1;
          if (v9 + 1 != a3 && v31 == 45 && *v33 != 93)
          {
            v85[0] = 0;
            v85[1] = 0;
            uint64_t v86 = 0;
            unsigned int v34 = v9 + 2;
            if (v9 + 2 != a3 && *v33 == 91 && *v34 == 46)
            {
              BOOL v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v9 + 3, a3, (uint64_t)v85);
              goto LABEL_151;
            }
            if ((v5 | 0x40) == 0x40)
            {
              LODWORD(v33) = *v33;
              if (v33 == 92)
              {
                if (v5) {
                  BOOL v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v9 + 2, a3, (uint64_t *)v85);
                }
                else {
                  BOOL v35 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v9 + 2, (unsigned __int8 *)a3, (uint64_t)v85, v7);
                }
LABEL_151:
                unsigned int v34 = v35;
LABEL_152:
                *(_OWORD *)uint64_t v83 = *(_OWORD *)__p;
                CFNumberRef v84 = v88;
                __p[1] = 0;
                uint64_t v88 = 0;
                *(_OWORD *)uint64_t v81 = *(_OWORD *)v85;
                int64_t v82 = v86;
                v85[0] = 0;
                v85[1] = 0;
                uint64_t v86 = 0;
                __p[0] = 0;
                if (*(unsigned char *)(v7 + 170))
                {
                  if (*(unsigned char *)(v7 + 169))
                  {
                    for (uint64_t k = 0; ; ++k)
                    {
                      if (SHIBYTE(v84) < 0)
                      {
                        if (k >= v83[1])
                        {
LABEL_164:
                          for (m = 0; ; ++m)
                          {
                            if (SHIBYTE(v82) < 0)
                            {
                              if (m >= v81[1]) {
                                goto LABEL_210;
                              }
                              uint64_t v58 = (void **)v81[0];
                            }
                            else
                            {
                              if ((unint64_t)m >= HIBYTE(v82)) {
                                goto LABEL_210;
                              }
                              uint64_t v58 = v81;
                            }
                            char v59 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), m[(void)v58]);
                            if (v82 >= 0) {
                              uint64_t v60 = v81;
                            }
                            else {
                              uint64_t v60 = (void **)v81[0];
                            }
                            m[(void)v60] = v59;
                          }
                        }
                        uint64_t v54 = (void **)v83[0];
                      }
                      else
                      {
                        if ((unint64_t)k >= HIBYTE(v84)) {
                          goto LABEL_164;
                        }
                        uint64_t v54 = v83;
                      }
                      char v55 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), k[(void)v54]);
                      if (SHIBYTE(v84) >= 0) {
                        uint64_t v56 = v83;
                      }
                      else {
                        uint64_t v56 = (void **)v83[0];
                      }
                      k[(void)v56] = v55;
                    }
                  }
                  uint64_t v70 = 0;
                  if ((HIBYTE(v84) & 0x80) != 0) {
                    goto LABEL_201;
                  }
                  while ((unint64_t)v70 < HIBYTE(v84))
                  {
                    while (1)
                    {
                      ++v70;
                      if ((HIBYTE(v84) & 0x80) == 0) {
                        break;
                      }
LABEL_201:
                      if (v70 >= v83[1]) {
                        goto LABEL_204;
                      }
                    }
                  }
LABEL_204:
                  int64_t v71 = 0;
                  if (v82 < 0) {
                    goto LABEL_207;
                  }
                  while ((unint64_t)v71 < HIBYTE(v82))
                  {
                    while (1)
                    {
                      ++v71;
                      if ((v82 & 0x8000000000000000) == 0) {
                        break;
                      }
LABEL_207:
                      if (v71 >= v81[1]) {
                        goto LABEL_210;
                      }
                    }
                  }
LABEL_210:
                  unsigned int v72 = (char *)HIBYTE(v84);
                  if (SHIBYTE(v84) >= 0) {
                    unint64_t v73 = (char *)v83;
                  }
                  else {
                    unint64_t v73 = (char *)v83[0];
                  }
                  if (SHIBYTE(v84) < 0) {
                    unsigned int v72 = (char *)v83[1];
                  }
                  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)&v91, v78, v73, &v72[(void)v73]);
                  long long v74 = (char *)HIBYTE(v82);
                  if (v82 >= 0) {
                    uint64_t v75 = (char *)v81;
                  }
                  else {
                    uint64_t v75 = (char *)v81[0];
                  }
                  if (v82 < 0) {
                    long long v74 = (char *)v81[1];
                  }
                  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)__s, v78, v75, &v74[(void)v75]);
                  *(_OWORD *)&__v.__first_ = v91;
                  __v.__end_ = v92;
                  unint64_t v92 = 0;
                  long long v91 = 0uLL;
                  __v.__end_cap_ = *(std::__compressed_pair<std::string *> *)__s;
                  int64_t v94 = v90;
                  __s[0] = 0;
                  __s[1] = 0;
                  int64_t v90 = 0;
                  std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](v77, (long long *)&__v);
                  if (SHIBYTE(v94) < 0) {
                    operator delete(__v.__end_cap_.__value_);
                  }
                  if (SHIBYTE(__v.__end_) < 0) {
                    operator delete(__v.__first_);
                  }
                  if (SHIBYTE(v90) < 0) {
                    operator delete(__s[0]);
                  }
                  if (SHIBYTE(v92) < 0)
                  {
                    std::__split_buffer<std::string>::pointer v69 = (std::__split_buffer<std::string>::pointer)v91;
LABEL_228:
                    operator delete(v69);
                  }
                }
                else
                {
                  long long v61 = (void *)HIBYTE(v84);
                  if (SHIBYTE(v84) < 0) {
                    long long v61 = v83[1];
                  }
                  if (v61 != (void *)1) {
                    goto LABEL_247;
                  }
                  long long v62 = (void *)HIBYTE(v82);
                  if (v82 < 0) {
                    long long v62 = v81[1];
                  }
                  if (v62 != (void *)1) {
LABEL_247:
                  }
                    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
                  if (*(unsigned char *)(v7 + 169))
                  {
                    if (SHIBYTE(v84) >= 0) {
                      uint64_t v63 = v83;
                    }
                    else {
                      uint64_t v63 = (void **)v83[0];
                    }
                    char v64 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)v63);
                    if (SHIBYTE(v84) >= 0) {
                      uint64_t v65 = v83;
                    }
                    else {
                      uint64_t v65 = (void **)v83[0];
                    }
                    *(unsigned char *)uint64_t v65 = v64;
                    if (v82 >= 0) {
                      uint64_t v66 = v81;
                    }
                    else {
                      uint64_t v66 = (void **)v81[0];
                    }
                    char v67 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)v66);
                    if (v82 >= 0) {
                      uint64_t v68 = v81;
                    }
                    else {
                      uint64_t v68 = (void **)v81[0];
                    }
                    *(unsigned char *)uint64_t v68 = v67;
                  }
                  *(_OWORD *)&__v.__first_ = *(_OWORD *)v83;
                  __v.__end_ = v84;
                  v83[0] = 0;
                  v83[1] = 0;
                  CFNumberRef v84 = 0;
                  __v.__end_cap_ = *(std::__compressed_pair<std::string *> *)v81;
                  int64_t v94 = v82;
                  v81[0] = 0;
                  v81[1] = 0;
                  int64_t v82 = 0;
                  std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](v77, (long long *)&__v);
                  if (SHIBYTE(v94) < 0) {
                    operator delete(__v.__end_cap_.__value_);
                  }
                  if (SHIBYTE(__v.__end_) < 0)
                  {
                    std::__split_buffer<std::string>::pointer v69 = __v.__first_;
                    goto LABEL_228;
                  }
                }
                if (SHIBYTE(v82) < 0) {
                  operator delete(v81[0]);
                }
                if (SHIBYTE(v84) < 0) {
                  operator delete(v83[0]);
                }
                if (SHIBYTE(v86) < 0) {
                  operator delete(v85[0]);
                }
                char v25 = 1;
LABEL_144:
                if (SHIBYTE(v88) < 0) {
                  operator delete(__p[0]);
                }
                uint64_t v9 = v34;
                if ((v25 & 1) == 0) {
                  goto LABEL_148;
                }
                goto LABEL_147;
              }
            }
            else
            {
              LOBYTE(v33) = *v33;
            }
            HIBYTE(v86) = 1;
            LOWORD(v85[0]) = v33;
            goto LABEL_152;
          }
        }
      }
      if (SHIBYTE(v88) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            uint64_t v32 = (void **)__p[0];
LABEL_85:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, *(char *)v32);
LABEL_96:
            char v25 = 1;
            unsigned int v34 = v9;
            goto LABEL_144;
          }
          uint64_t v32 = (void **)__p[0];
LABEL_95:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v7, *(char *)v32, *((char *)v32 + 1));
          goto LABEL_96;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v88))
      {
        uint64_t v32 = __p;
        if (HIBYTE(v88) == 1) {
          goto LABEL_85;
        }
        goto LABEL_95;
      }
LABEL_147:
      uint64_t v5 = (uint64_t)v9;
LABEL_148:
      if ((char *)v5 == v8)
      {
        if (v8 != a3)
        {
          if (*v8 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v7, 45);
            ++v8;
          }
          if (v8 != a3 && *v8 == 93) {
            return v8 + 1;
          }
        }
LABEL_244:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
  }
  return a2;
}

void sub_249C2F3FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *__p,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  *(void *)(v46 + 144) = v47;
  if (a46 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v48 - 145) < 0) {
    operator delete(*(void **)(v48 - 168));
  }
  if (a40 < 0) {
    operator delete(a35);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 5);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C2F570(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
}

void sub_249C2F70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10)
{
  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  uint64_t v15 = (void *)v10[14];
  if (v15)
  {
    v10[15] = v15;
    operator delete(v15);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  BOOL v16 = (void *)v10[8];
  if (v16)
  {
    v10[9] = v16;
    operator delete(v16);
  }
  int v17 = *v13;
  if (*v13)
  {
    v10[6] = v17;
    operator delete(v17);
  }
  std::locale::~locale(v12);
  void *v10 = v11;
  uint64_t v18 = v10[1];
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  MEMORY[0x24C5B1B10](v10, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  if (*(unsigned char *)(a1 + 169))
  {
    char v2 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
    uint64_t v5 = *(unsigned char **)(a1 + 48);
    unint64_t v4 = *(void *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      unint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = &v5[-v6];
      uint64_t v8 = (uint64_t)&v5[-v6 + 1];
      if (v8 >= 0)
      {
        unint64_t v9 = v4 - v6;
        if (2 * v9 > v8) {
          uint64_t v8 = 2 * v9;
        }
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v10 = v8;
        }
        if (v10) {
          uint64_t v11 = operator new(v10);
        }
        else {
          uint64_t v11 = 0;
        }
        BOOL v19 = &v7[(void)v11];
        int v20 = (char *)v11 + v10;
        v7[(void)v11] = v2;
        uint64_t v18 = (uint64_t)&v7[(void)v11 + 1];
        if (v5 != (unsigned char *)v6)
        {
          uint64_t v21 = &v5[~v6];
          do
          {
            char v22 = *--v5;
            (v21--)[(void)v11] = v22;
          }
          while (v5 != (unsigned char *)v6);
LABEL_45:
          uint64_t v5 = *(unsigned char **)(a1 + 40);
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  uint64_t v5 = *(unsigned char **)(a1 + 48);
  unint64_t v12 = *(void *)(a1 + 56);
  if (!*(unsigned char *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v12)
    {
      unint64_t v23 = *(void *)(a1 + 40);
      uint64_t v24 = &v5[-v23];
      uint64_t v25 = (uint64_t)&v5[-v23 + 1];
      if (v25 >= 0)
      {
        unint64_t v26 = v12 - v23;
        if (2 * v26 > v25) {
          uint64_t v25 = 2 * v26;
        }
        if (v26 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v27 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v27 = v25;
        }
        if (v27) {
          uint64_t v11 = operator new(v27);
        }
        else {
          uint64_t v11 = 0;
        }
        BOOL v19 = &v24[(void)v11];
        int v20 = (char *)v11 + v27;
        v24[(void)v11] = v2;
        uint64_t v18 = (uint64_t)&v24[(void)v11 + 1];
        if (v5 != (unsigned char *)v23)
        {
          uint64_t v30 = &v5[~v23];
          do
          {
            char v31 = *--v5;
            (v30--)[(void)v11] = v31;
          }
          while (v5 != (unsigned char *)v23);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *uint64_t v5 = v2;
    uint64_t v18 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v12) {
    goto LABEL_22;
  }
  unint64_t v13 = *(void *)(a1 + 40);
  size_t v14 = &v5[-v13];
  uint64_t v15 = (uint64_t)&v5[-v13 + 1];
  if (v15 < 0) {
    goto LABEL_50;
  }
  unint64_t v16 = v12 - v13;
  if (2 * v16 > v15) {
    uint64_t v15 = 2 * v16;
  }
  if (v16 >= 0x3FFFFFFFFFFFFFFFLL) {
    size_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    size_t v17 = v15;
  }
  if (v17) {
    uint64_t v11 = operator new(v17);
  }
  else {
    uint64_t v11 = 0;
  }
  BOOL v19 = &v14[(void)v11];
  int v20 = (char *)v11 + v17;
  v14[(void)v11] = v2;
  uint64_t v18 = (uint64_t)&v14[(void)v11 + 1];
  if (v5 != (unsigned char *)v13)
  {
    uint64_t v28 = &v5[~v13];
    do
    {
      char v29 = *--v5;
      (v28--)[(void)v11] = v29;
    }
    while (v5 != (unsigned char *)v13);
    goto LABEL_45;
  }
LABEL_46:
  uint64_t v11 = v19;
LABEL_47:
  *(void *)(a1 + 40) = v11;
  *(void *)(a1 + 48) = v18;
  *(void *)(a1 + 56) = v20;
  if (v5) {
    operator delete(v5);
  }
LABEL_49:
  *(void *)(a1 + 48) = v18;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  if (a3 - a2 < 2 || a3 - 1 == a2) {
    goto LABEL_15;
  }
  for (uint64_t i = 0; ; ++i)
  {
    unint64_t v6 = &a2[i];
    if (a2[i] == 46 && v6[1] == 93) {
      break;
    }
    if (a3 - a2 - 2 == i) {
      goto LABEL_15;
    }
  }
  if (v6 == a3) {
LABEL_15:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)&v10, a1, a2, &a2[i]);
  if (*(char *)(a4 + 23) < 0) {
    operator delete(*(void **)a4);
  }
  *(_OWORD *)a4 = v10;
  unint64_t v7 = v11;
  *(void *)(a4 + 16) = v11;
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a4 + 8);
  }
  if (v8 - 1 >= 2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  return v6 + 2;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  if (a2 == a3) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  }
  int v7 = (char)*a2;
  if (v7 > 97)
  {
    if (v7 > 114)
    {
      if (v7 != 115)
      {
        if (v7 == 119)
        {
          *(_DWORD *)(a5 + 160) |= 0x500u;
          std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
          return a2 + 1;
        }
        goto LABEL_27;
      }
      int v9 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v7 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(void *)(a4 + 8) = 1;
          a4 = *(void *)a4;
        }
        else
        {
          *(unsigned char *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v7 != 100) {
        goto LABEL_27;
      }
      int v9 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v9;
    return a2 + 1;
  }
  if (v7 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(void *)(a4 + 8) = 1;
        a4 = *(void *)a4;
      }
      else
      {
        *(unsigned char *)(a4 + 23) = 1;
      }
      *(unsigned char *)a4 = 0;
      *(unsigned char *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v7 == 68)
    {
      int v8 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_24:
      *(_DWORD *)(a5 + 164) = v8;
      return a2 + 1;
    }
    goto LABEL_27;
  }
  if (v7 == 83)
  {
    int v8 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_24;
  }
  if (v7 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    if (*(unsigned char *)(a5 + 169))
    {
      char v10 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a5 + 24) + 40))(*(void *)(a5 + 24), 95);
      char v11 = v10;
      unint64_t v13 = *(unsigned char **)(a5 + 72);
      unint64_t v12 = *(void *)(a5 + 80);
      if ((unint64_t)v13 < v12)
      {
        *unint64_t v13 = v10;
        uint64_t v14 = (uint64_t)(v13 + 1);
LABEL_62:
        *(void *)(a5 + 72) = v14;
        return a2 + 1;
      }
      unint64_t v24 = *(void *)(a5 + 64);
      uint64_t v25 = &v13[-v24];
      uint64_t v26 = (uint64_t)&v13[-v24 + 1];
      if (v26 >= 0)
      {
        unint64_t v27 = v12 - v24;
        if (2 * v27 > v26) {
          uint64_t v26 = 2 * v27;
        }
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v28 = v26;
        }
        if (v28) {
          char v29 = operator new(v28);
        }
        else {
          char v29 = 0;
        }
        char v31 = &v29[v28];
        v25[(void)v29] = v11;
        uint64_t v14 = (uint64_t)&v25[(void)v29 + 1];
        if (v13 == (unsigned char *)v24)
        {
          char v29 = &v25[(void)v29];
        }
        else
        {
          uint64_t v32 = &v13[~v24];
          do
          {
            char v33 = *--v13;
            (v32--)[(void)v29] = v33;
          }
          while (v13 != (unsigned char *)v24);
          unint64_t v13 = *(unsigned char **)(a5 + 64);
        }
        *(void *)(a5 + 64) = v29;
        *(void *)(a5 + 72) = v14;
        *(void *)(a5 + 80) = v31;
        if (v13) {
          operator delete(v13);
        }
        goto LABEL_62;
      }
LABEL_87:
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    size_t v17 = *(unsigned char **)(a5 + 72);
    unint64_t v16 = *(void *)(a5 + 80);
    if (*(unsigned char *)(a5 + 170))
    {
      if ((unint64_t)v17 >= v16)
      {
        unint64_t v18 = *(void *)(a5 + 64);
        BOOL v19 = &v17[-v18];
        uint64_t v20 = (uint64_t)&v17[-v18 + 1];
        if (v20 < 0) {
          goto LABEL_87;
        }
        unint64_t v21 = v16 - v18;
        if (2 * v21 > v20) {
          uint64_t v20 = 2 * v21;
        }
        if (v21 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v22 = v20;
        }
        if (v22) {
          unint64_t v23 = operator new(v22);
        }
        else {
          unint64_t v23 = 0;
        }
        unint64_t v39 = &v19[(void)v23];
        long long v40 = (char *)v23 + v22;
        v19[(void)v23] = 95;
        uint64_t v30 = (uint64_t)&v19[(void)v23 + 1];
        if (v17 != (unsigned char *)v18)
        {
          uint64_t v41 = &v17[~v18];
          do
          {
            char v42 = *--v17;
            (v41--)[(void)v23] = v42;
          }
          while (v17 != (unsigned char *)v18);
LABEL_80:
          size_t v17 = *(unsigned char **)(a5 + 64);
          goto LABEL_82;
        }
        goto LABEL_81;
      }
    }
    else if ((unint64_t)v17 >= v16)
    {
      unint64_t v34 = *(void *)(a5 + 64);
      BOOL v35 = &v17[-v34];
      uint64_t v36 = (uint64_t)&v17[-v34 + 1];
      if (v36 < 0) {
        goto LABEL_87;
      }
      unint64_t v37 = v16 - v34;
      if (2 * v37 > v36) {
        uint64_t v36 = 2 * v37;
      }
      if (v37 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v38 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v38 = v36;
      }
      if (v38) {
        unint64_t v23 = operator new(v38);
      }
      else {
        unint64_t v23 = 0;
      }
      unint64_t v39 = &v35[(void)v23];
      long long v40 = (char *)v23 + v38;
      v35[(void)v23] = 95;
      uint64_t v30 = (uint64_t)&v35[(void)v23 + 1];
      if (v17 != (unsigned char *)v34)
      {
        unint64_t v43 = &v17[~v34];
        do
        {
          char v44 = *--v17;
          (v43--)[(void)v23] = v44;
        }
        while (v17 != (unsigned char *)v34);
        goto LABEL_80;
      }
LABEL_81:
      unint64_t v23 = v39;
LABEL_82:
      *(void *)(a5 + 64) = v23;
      *(void *)(a5 + 72) = v30;
      *(void *)(a5 + 80) = v40;
      if (v17) {
        operator delete(v17);
      }
      goto LABEL_84;
    }
    *size_t v17 = 95;
    uint64_t v30 = (uint64_t)(v17 + 1);
LABEL_84:
    *(void *)(a5 + 72) = v30;
    return a2 + 1;
  }
LABEL_27:

  return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3, uint64_t *a4)
{
  if (a2 == a3) {
LABEL_80:
  }
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  int v5 = *a2;
  std::basic_regex<char>::value_type v6 = *a2;
  if (v5 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 10;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 10;
        goto LABEL_77;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 13;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 13;
        goto LABEL_77;
      case 't':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 9;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 9;
        goto LABEL_77;
      case 'v':
        if (!a4)
        {
          std::basic_regex<char>::value_type v7 = 11;
          break;
        }
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        __int16 v13 = 11;
        goto LABEL_77;
      default:
        if (v5 == 98)
        {
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((unsigned char *)a4 + 23) = 1;
            }
            __int16 v13 = 8;
            goto LABEL_77;
          }
          std::basic_regex<char>::value_type v7 = 8;
        }
        else
        {
          if (v5 != 102) {
            goto LABEL_25;
          }
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((unsigned char *)a4 + 23) = 1;
            }
            __int16 v13 = 12;
            goto LABEL_77;
          }
          std::basic_regex<char>::value_type v7 = 12;
        }
        break;
    }
LABEL_62:
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
    return a2 + 1;
  }
  if (v5 > 91)
  {
    if (v5 == 92)
    {
LABEL_16:
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(unsigned char *)a4 = v6;
        *((unsigned char *)a4 + 1) = 0;
        return a2 + 1;
      }
      std::basic_regex<char>::value_type v7 = *a2;
      goto LABEL_62;
    }
    if (v5 != 97) {
      goto LABEL_25;
    }
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      __int16 v13 = 7;
LABEL_77:
      *(_WORD *)a4 = v13;
      return a2 + 1;
    }
    std::basic_regex<char>::value_type v7 = 7;
    goto LABEL_62;
  }
  if (v5 == 34 || v5 == 47) {
    goto LABEL_16;
  }
LABEL_25:
  if ((v6 & 0xF8) != 0x30) {
    goto LABEL_80;
  }
  std::basic_regex<char>::value_type v8 = v5 - 48;
  int v9 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v9 & 0xF8) != 0x30) {
      goto LABEL_49;
    }
    std::basic_regex<char>::value_type v8 = *v9 + 8 * v8 - 48;
    if (a2 + 2 != a3)
    {
      char v10 = a2[2];
      int v11 = v10 & 0xF8;
      std::basic_regex<char>::value_type v12 = v10 + 8 * v8 - 48;
      if (v11 == 48) {
        int v9 = a2 + 3;
      }
      else {
        int v9 = a2 + 2;
      }
      if (v11 == 48) {
        std::basic_regex<char>::value_type v8 = v12;
      }
      goto LABEL_49;
    }
  }
  int v9 = a3;
LABEL_49:
  if (a4)
  {
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((unsigned char *)a4 + 23) = 1;
    }
    *(unsigned char *)a4 = v8;
    *((unsigned char *)a4 + 1) = 0;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
  }
  return v9;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!*(unsigned char *)(a1 + 169))
  {
    __int16 v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    std::basic_regex<char>::value_type v8 = *(_WORD **)(a1 + 120);
    unint64_t v16 = *(void *)(a1 + 128);
    if (*(unsigned char *)(a1 + 170))
    {
      if ((unint64_t)v8 < v16) {
        goto LABEL_24;
      }
      uint64_t v17 = *(void *)(a1 + 112);
      uint64_t v18 = (uint64_t)v8 - v17;
      if ((uint64_t)v8 - v17 > -3)
      {
        uint64_t v19 = v18 >> 1;
        unint64_t v20 = v16 - v17;
        if (v20 <= (v18 >> 1) + 1) {
          unint64_t v21 = v19 + 1;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v20 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v22 = v21;
        }
        if (v22) {
          uint64_t v22 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v22);
        }
        else {
          uint64_t v23 = 0;
        }
        uint64_t v25 = (_WORD *)(v22 + 2 * v19);
        uint64_t v26 = v22 + 2 * v23;
        _WORD *v25 = v6;
        unint64_t v24 = v25 + 1;
        unint64_t v37 = *(char **)(a1 + 112);
        unint64_t v27 = *(char **)(a1 + 120);
        if (v27 == v37) {
          goto LABEL_46;
        }
        do
        {
          __int16 v38 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--uint64_t v25 = v38;
        }
        while (v27 != v37);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v8 < v16) {
        goto LABEL_24;
      }
      uint64_t v30 = *(void *)(a1 + 112);
      uint64_t v31 = (uint64_t)v8 - v30;
      if ((uint64_t)v8 - v30 > -3)
      {
        uint64_t v32 = v31 >> 1;
        unint64_t v33 = v16 - v30;
        if (v33 <= (v31 >> 1) + 1) {
          unint64_t v34 = v32 + 1;
        }
        else {
          unint64_t v34 = v33;
        }
        if (v33 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v35 = v34;
        }
        if (v35) {
          uint64_t v35 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v35);
        }
        else {
          uint64_t v36 = 0;
        }
        uint64_t v25 = (_WORD *)(v35 + 2 * v32);
        uint64_t v26 = v35 + 2 * v36;
        _WORD *v25 = v6;
        unint64_t v24 = v25 + 1;
        unint64_t v39 = *(char **)(a1 + 112);
        unint64_t v27 = *(char **)(a1 + 120);
        if (v27 == v39) {
          goto LABEL_46;
        }
        do
        {
          __int16 v40 = *((_WORD *)v27 - 1);
          v27 -= 2;
          *--uint64_t v25 = v40;
        }
        while (v27 != v39);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
  }
  unsigned __int8 v5 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a2);
  __int16 v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(void, uint64_t))(**(void **)(a1 + 24) + 40))(*(void *)(a1 + 24), a3) << 8);
  std::basic_regex<char>::value_type v8 = *(_WORD **)(a1 + 120);
  unint64_t v7 = *(void *)(a1 + 128);
  if ((unint64_t)v8 < v7)
  {
LABEL_24:
    *std::basic_regex<char>::value_type v8 = v6;
    unint64_t v24 = v8 + 1;
    goto LABEL_48;
  }
  uint64_t v9 = *(void *)(a1 + 112);
  uint64_t v10 = (uint64_t)v8 - v9;
  if ((uint64_t)v8 - v9 <= -3) {
    goto LABEL_49;
  }
  uint64_t v11 = v10 >> 1;
  unint64_t v12 = v7 - v9;
  if (v12 <= (v10 >> 1) + 1) {
    unint64_t v13 = v11 + 1;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v14 = v13;
  }
  if (v14) {
    uint64_t v14 = (uint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v14);
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v25 = (_WORD *)(v14 + 2 * v11);
  uint64_t v26 = v14 + 2 * v15;
  _WORD *v25 = v6;
  unint64_t v24 = v25 + 1;
  size_t v28 = *(char **)(a1 + 112);
  unint64_t v27 = *(char **)(a1 + 120);
  if (v27 == v28) {
    goto LABEL_46;
  }
  do
  {
    __int16 v29 = *((_WORD *)v27 - 1);
    v27 -= 2;
    *--uint64_t v25 = v29;
  }
  while (v27 != v28);
LABEL_45:
  unint64_t v27 = *(char **)(a1 + 112);
LABEL_46:
  *(void *)(a1 + 112) = v25;
  *(void *)(a1 + 120) = v24;
  *(void *)(a1 + 128) = v26;
  if (v27) {
    operator delete(v27);
  }
LABEL_48:
  *(void *)(a1 + 120) = v24;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a3, a4, a4 - a3);
  unint64_t v5 = v8;
  if ((v8 & 0x80u) == 0) {
    __int16 v6 = __p;
  }
  else {
    __int16 v6 = (void **)__p[0];
  }
  if ((v8 & 0x80u) != 0) {
    unint64_t v5 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_249C304D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](char **a1, long long *a2)
{
  unint64_t v4 = (unint64_t)a1[1];
  unint64_t v5 = (unint64_t)a1[2];
  if (v4 >= v5)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (void)*a1) >> 4);
    unint64_t v10 = v9 + 1;
    if (v9 + 1 > 0x555555555555555) {
      std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (void)*a1) >> 4);
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x555555555555555;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 > 0x555555555555555) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v13 = (char *)operator new(48 * v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    uint64_t v14 = &v13[48 * v9];
    *(_OWORD *)uint64_t v14 = *a2;
    *((void *)v14 + 2) = *((void *)a2 + 2);
    long long v15 = *(long long *)((char *)a2 + 24);
    *((void *)a2 + 2) = 0;
    *((void *)a2 + 3) = 0;
    *(void *)a2 = 0;
    *((void *)a2 + 1) = 0;
    *(_OWORD *)(v14 + 24) = v15;
    *((void *)v14 + 5) = *((void *)a2 + 5);
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    uint64_t v17 = *a1;
    unint64_t v16 = (unint64_t)a1[1];
    if ((char *)v16 == *a1)
    {
      int64x2_t v21 = vdupq_n_s64(v16);
      uint64_t v18 = &v13[48 * v9];
    }
    else
    {
      uint64_t v18 = &v13[48 * v9];
      do
      {
        long long v19 = *(_OWORD *)(v16 - 48);
        *((void *)v18 - 4) = *(void *)(v16 - 32);
        *((_OWORD *)v18 - 3) = v19;
        *(void *)(v16 - 40) = 0;
        *(void *)(v16 - 32) = 0;
        *(void *)(v16 - 48) = 0;
        long long v20 = *(_OWORD *)(v16 - 24);
        *((void *)v18 - 1) = *(void *)(v16 - 8);
        *(_OWORD *)(v18 - 24) = v20;
        v18 -= 48;
        *(void *)(v16 - 16) = 0;
        *(void *)(v16 - 8) = 0;
        *(void *)(v16 - 24) = 0;
        v16 -= 48;
      }
      while ((char *)v16 != v17);
      int64x2_t v21 = *(int64x2_t *)a1;
    }
    unsigned __int8 v8 = v14 + 48;
    *a1 = v18;
    a1[1] = v14 + 48;
    a1[2] = &v13[48 * v12];
    uint64_t v23 = v21.i64[1];
    uint64_t v22 = (void *)v21.i64[0];
    while ((void *)v23 != v22)
    {
      v23 -= 48;
      std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(v23);
    }
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    long long v6 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v4 = v6;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v7 = *(long long *)((char *)a2 + 24);
    *(void *)(v4 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v4 + 24) = v7;
    *((void *)a2 + 4) = 0;
    *((void *)a2 + 5) = 0;
    *((void *)a2 + 3) = 0;
    unsigned __int8 v8 = (char *)(v4 + 48);
  }
  a1[1] = v8;
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 9);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C30740(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    char v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 3);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C307F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

void sub_249C30978(_Unwind_Exception *a1)
{
  std::locale::~locale(v2);
  unint64_t v4 = v1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  MEMORY[0x24C5B1B10](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  char v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  char v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDF20;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x24C5B1B10);
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDF20;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (uint64_t v4 = result,
        __n128 result = (*(uint64_t (**)(void, void))(**(void **)(result + 24) + 40))(*(void *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    uint64_t v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(void *)(a2 + 16);
    uint64_t v5 = *(void *)(v4 + 8);
  }
  *(void *)(a2 + 80) = v5;
  return result;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDED8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x24C5B1B10);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDED8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  uint64_t v4 = a2;
  if (a2 != a3)
  {
    uint64_t v5 = *a2;
    std::basic_regex<char>::value_type v6 = v5;
    if ((char)v5 > 109)
    {
      switch((char)v5)
      {
        case 'n':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 10;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v16 = 10;
          goto LABEL_79;
        case 'r':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 13;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v16 = 13;
          goto LABEL_79;
        case 't':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 9;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v16 = 9;
          goto LABEL_79;
        case 'u':
          if (v4 + 1 != a3)
          {
            int v7 = v4[1];
            if ((v7 & 0xF8) == 0x30 || (v7 & 0xFE) == 0x38 || (v7 | 0x20u) - 97 < 6)
            {
              v4 += 2;
              if (v4 != a3)
              {
                int v8 = *v4;
                if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38 || (v8 | 0x20u) - 97 < 6) {
                  goto LABEL_27;
                }
              }
            }
          }
          goto LABEL_89;
        case 'v':
          if (!a4)
          {
            std::basic_regex<char>::value_type v6 = 11;
            goto LABEL_67;
          }
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v16 = 11;
          break;
        case 'x':
LABEL_27:
          if (v4 + 1 == a3) {
            goto LABEL_89;
          }
          unsigned __int8 v9 = v4[1];
          char v10 = -48;
          if ((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38) {
            goto LABEL_32;
          }
          v9 |= 0x20u;
          if ((v9 - 97) >= 6u) {
            goto LABEL_89;
          }
          char v10 = -87;
LABEL_32:
          if (v4 + 2 == a3) {
            goto LABEL_89;
          }
          unsigned __int8 v11 = v4[2];
          char v12 = -48;
          if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38) {
            goto LABEL_37;
          }
          v11 |= 0x20u;
          if ((v11 - 97) >= 6u) {
            goto LABEL_89;
          }
          char v12 = -87;
LABEL_37:
          std::basic_regex<char>::value_type v13 = v12 + v11 + 16 * (v10 + v9);
          if (a4)
          {
            if (*((char *)a4 + 23) < 0)
            {
              a4[1] = 1;
              a4 = (uint64_t *)*a4;
            }
            else
            {
              *((unsigned char *)a4 + 23) = 1;
            }
            *(unsigned char *)a4 = v13;
            *((unsigned char *)a4 + 1) = 0;
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v13);
          }
          v4 += 3;
          return v4;
        default:
          goto LABEL_51;
      }
      goto LABEL_79;
    }
    if ((char)v5 == 48)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((unsigned char *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return ++v4;
      }
      std::basic_regex<char>::value_type v6 = 0;
      goto LABEL_67;
    }
    if ((char)v5 != 99)
    {
      if ((char)v5 == 102)
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          __int16 v16 = 12;
LABEL_79:
          *(_WORD *)a4 = v16;
          return ++v4;
        }
        std::basic_regex<char>::value_type v6 = 12;
LABEL_67:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return ++v4;
      }
LABEL_51:
      if ((char)v5 != 95 && ((char)v5 < 0 || (a1->__traits_.__ct_->__tab_[v5] & 0x500) == 0))
      {
        if (a4)
        {
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((unsigned char *)a4 + 23) = 1;
          }
          *(unsigned char *)a4 = v5;
          *((unsigned char *)a4 + 1) = 0;
          return ++v4;
        }
        goto LABEL_67;
      }
LABEL_89:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if (v4 + 1 == a3) {
      goto LABEL_89;
    }
    unsigned __int8 v14 = v4[1];
    if (((v14 & 0xDF) - 65) > 0x19u) {
      goto LABEL_89;
    }
    std::basic_regex<char>::value_type v15 = v14 & 0x1F;
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((unsigned char *)a4 + 23) = 1;
      }
      *(unsigned char *)a4 = v15;
      *((unsigned char *)a4 + 1) = 0;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v15);
    }
    v4 += 2;
  }
  return v4;
}

void std::regex_traits<char>::__lookup_collatename<char const*>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(&__s, a3, a4, a4 - a3);
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_) {
      goto LABEL_9;
    }
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&__s.__r_.__value_.__s + 23)) {
      return;
    }
    p_s = &__s;
  }
  std::__get_collation_name(&v11, (const char *)p_s);
  *(_OWORD *)a1 = *(_OWORD *)&v11.__r_.__value_.__l.__data_;
  unint64_t v7 = v11.__r_.__value_.__r.__words[2];
  *(void *)(a1 + 16) = *((void *)&v11.__r_.__value_.__l + 2);
  unint64_t v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0) {
    unint64_t v8 = *(void *)(a1 + 8);
  }
  if (v8) {
    goto LABEL_9;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_9;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    return;
  }
  (*(void (**)(std::string *__return_ptr))(**(void **)(a2 + 16) + 32))(&v11);
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  *(std::string *)a1 = v11;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    int v9 = *(unsigned __int8 *)(a1 + 23);
    if (v9 != 12 && v9 != 1)
    {
      *(unsigned char *)a1 = 0;
      *(unsigned char *)(a1 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  uint64_t v10 = *(void *)(a1 + 8);
  if (v10 == 1 || v10 == 12)
  {
LABEL_23:
    std::string::operator=((std::string *)a1, &__s);
    goto LABEL_9;
  }
  **(unsigned char **)a1 = 0;
  *(void *)(a1 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
}

void sub_249C313F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (*(char *)(v17 + 23) < 0) {
    operator delete(*(void **)v17);
  }
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 1);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C31468(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 2);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C314C0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  char v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<std::pair<std::string,std::string>,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    uint64_t v8 = 0;
    BOOL negate = this->__negate_;
    goto LABEL_170;
  }
  if (!this->__might_have_digraph_ || current + 1 == last) {
    goto LABEL_35;
  }
  char v6 = *current;
  LOBYTE(v85) = *current;
  char v7 = current[1];
  HIBYTE(v85) = v7;
  if (this->__icase_)
  {
    LOBYTE(v85) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(v85) = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  *((unsigned char *)&__s.__r_.__value_.__s + 23) = 2;
  LOWORD(__s.__r_.__value_.__l.__data_) = v85;
  __s.__r_.__value_.__s.__data_[2] = 0;
  memset(&__p, 0, sizeof(__p));
  std::__get_collation_name(&v86, (const char *)&__s);
  std::string __p = v86;
  std::string::size_type size = HIBYTE(v86.__r_.__value_.__r.__words[2]);
  int v11 = SHIBYTE(v86.__r_.__value_.__r.__words[2]);
  if ((v86.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v86.__r_.__value_.__l.__size_;
  }
  if (size) {
    goto LABEL_11;
  }
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (__s.__r_.__value_.__l.__size_ >= 3) {
      goto LABEL_11;
    }
  }
  else if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
  {
    goto LABEL_15;
  }
  (*(void (**)(std::string *__return_ptr))(*(void *)this->__traits_.__col_ + 32))(&v86);
  if (v11 < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string __p = v86;
  if ((SHIBYTE(v86.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (HIBYTE(v86.__r_.__value_.__r.__words[2]) != 12 && HIBYTE(v86.__r_.__value_.__r.__words[2]) != 1)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 0;
      goto LABEL_11;
    }
    goto LABEL_113;
  }
  if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
  {
LABEL_113:
    std::string::operator=(&__p, &__s);
    goto LABEL_11;
  }
  *__p.__r_.__value_.__l.__data_ = 0;
  __p.__r_.__value_.__l.__size_ = 0;
LABEL_11:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__s.__r_.__value_.__l.__data_);
  }
LABEL_15:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v22 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v22) {
      goto LABEL_17;
    }
LABEL_35:
    BOOL negate = 0;
    uint64_t v8 = 1;
    goto LABEL_36;
  }
  if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
    goto LABEL_35;
  }
LABEL_17:
  std::vector<std::pair<char, char>>::pointer begin = this->__digraphs_.__begin_;
  uint64_t v13 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v13)
  {
    uint64_t v14 = v13 >> 1;
    if ((unint64_t)(v13 >> 1) <= 1) {
      uint64_t v14 = 1;
    }
    p_second = &begin->second;
    while (v85 != *(p_second - 1) || HIBYTE(v85) != *p_second)
    {
      p_second += 2;
      if (!--v14) {
        goto LABEL_26;
      }
    }
    goto LABEL_167;
  }
LABEL_26:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    BOOL negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v85, (char *)&v86);
    std::vector<std::pair<std::string, std::string>>::pointer v17 = this->__ranges_.__begin_;
    uint64_t v18 = (char *)this->__ranges_.__end_ - (char *)v17;
    if (v18)
    {
      unint64_t v19 = 0;
      unint64_t v20 = 0xAAAAAAAAAAAAAAABLL * (v18 >> 4);
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v17, &__s) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__s, v17->second.__r_.__value_.__r.__words) << 24) >= 0x1000000)
      {
        ++v19;
        ++v17;
        if (v19 >= v20) {
          goto LABEL_33;
        }
      }
      BOOL negate = 1;
      int v21 = 5;
    }
    else
    {
LABEL_33:
      BOOL negate = 0;
      int v21 = 0;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    if (negate) {
      goto LABEL_145;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_149:
    if ((char)v85 < 0)
    {
      neg_masuint64_t k = this->__neg_mask_;
    }
    else
    {
      masuint64_t k = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      std::ctype_base::mask v75 = tab[v85];
      if (((v75 & mask) != 0 || v85 == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(v85) & 0x80000000) == 0
        && ((tab[HIBYTE(v85)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(v85) == 95))
      {
        goto LABEL_167;
      }
      neg_masuint64_t k = this->__neg_mask_;
      if ((v75 & neg_mask) != 0 || v85 == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_166:
        int v77 = negate;
LABEL_168:
        BOOL negate = v77;
        goto LABEL_169;
      }
    }
    if ((SHIBYTE(v85) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(v85)] & neg_mask) == 0)
      {
        int v77 = 1;
        if (HIBYTE(v85) != 95 || (neg_mask & 0x80) == 0) {
          goto LABEL_168;
        }
      }
      goto LABEL_166;
    }
LABEL_167:
    int v77 = 1;
    goto LABEL_168;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v85, (char *)&v86);
  std::vector<std::string>::pointer v57 = this->__equivalences_.__begin_;
  uint64_t v58 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v59 = (char *)this->__equivalences_.__end_ - (char *)v57;
  if (!v59)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    goto LABEL_149;
  }
  uint64_t v60 = 0;
  unint64_t v61 = v59 / 24;
  long long v62 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v63 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v63 = __s.__r_.__value_.__l.__size_;
  }
  if (v61 <= 1) {
    uint64_t v64 = 1;
  }
  else {
    uint64_t v64 = v59 / 24;
  }
  BOOL v65 = 1;
  while (1)
  {
    uint64_t v66 = &v57[v60];
    std::string::size_type v67 = HIBYTE(v66->__r_.__value_.__r.__words[2]);
    int v68 = (char)v67;
    if ((v67 & 0x80u) != 0) {
      std::string::size_type v67 = v66->__r_.__value_.__l.__size_;
    }
    if (v63 != v67) {
      goto LABEL_140;
    }
    std::__split_buffer<std::string>::pointer v69 = v68 >= 0 ? &v57[v60] : (std::string *)v66->__r_.__value_.__r.__words[0];
    if ((v58 & 0x80) == 0) {
      break;
    }
    unint64_t v82 = v61;
    uint64_t v83 = v58;
    int v72 = memcmp((const void *)v62, v69, *((size_t *)&v62 + 1));
    unint64_t v61 = v82;
    uint64_t v58 = v83;
    if (!v72)
    {
      int v21 = 5;
      BOOL negate = 1;
      goto LABEL_143;
    }
LABEL_140:
    BOOL v65 = ++v60 < v61;
    if (v60 == v64)
    {
      int v21 = 0;
      goto LABEL_142;
    }
  }
  if (!v58)
  {
    BOOL negate = 1;
    if (v65) {
      goto LABEL_169;
    }
    goto LABEL_149;
  }
  p_s = &__s;
  uint64_t v71 = v58;
  do
  {
    if (p_s->__r_.__value_.__s.__data_[0] != v69->__r_.__value_.__s.__data_[0]) {
      goto LABEL_140;
    }
    p_s = (std::string *)((char *)p_s + 1);
    std::__split_buffer<std::string>::pointer v69 = (std::string *)((char *)v69 + 1);
    --v71;
  }
  while (v71);
  BOOL negate = 1;
  int v21 = 5;
LABEL_142:
  if ((v58 & 0x80) != 0) {
LABEL_143:
  }
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v65) {
    goto LABEL_149;
  }
LABEL_145:
  if (v21)
  {
LABEL_169:
    uint64_t v8 = 2;
    goto LABEL_170;
  }
  uint64_t v8 = 2;
LABEL_36:
  unsigned __int8 v23 = *a2->__current_;
  v86.__r_.__value_.__s.__data_[0] = v23;
  if (this->__icase_)
  {
    unsigned __int8 v23 = ((uint64_t (*)(const std::ctype<char> *, void))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v23);
    v86.__r_.__value_.__s.__data_[0] = v23;
  }
  std::vector<char>::pointer v24 = this->__chars_.__begin_;
  unint64_t v25 = this->__chars_.__end_ - v24;
  if (v25)
  {
    if (v25 <= 1) {
      unint64_t v25 = 1;
    }
    while (1)
    {
      int v26 = *v24++;
      if (v26 == v23) {
        break;
      }
      if (!--v25) {
        goto LABEL_43;
      }
    }
LABEL_103:
    BOOL negate = 1;
    goto LABEL_170;
  }
LABEL_43:
  std::regex_traits<char>::char_class_type v27 = this->__neg_mask_;
  if (v27 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v23 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v23] & v27) == 0) {
      int v28 = (v23 == 95) & (v27 >> 7);
    }
    else {
      LOBYTE(v28) = 1;
    }
    std::vector<char>::pointer end = this->__neg_chars_.__end_;
    std::vector<char>::pointer v30 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v23, end - this->__neg_chars_.__begin_);
    uint64_t v31 = v30 ? v30 : end;
    if ((v28 & 1) == 0 && v31 == end) {
      goto LABEL_103;
    }
  }
  std::vector<std::pair<std::string, std::string>>::pointer v33 = this->__ranges_.__begin_;
  std::vector<std::pair<std::string, std::string>>::pointer v32 = this->__ranges_.__end_;
  if (v33 != v32)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v86, &v86.__r_.__value_.__s.__data_[1]);
      std::vector<std::pair<std::string, std::string>>::pointer v33 = this->__ranges_.__begin_;
      std::vector<std::pair<std::string, std::string>>::pointer v32 = this->__ranges_.__end_;
    }
    else
    {
      *((unsigned char *)&__s.__r_.__value_.__s + 23) = 1;
      LOWORD(__s.__r_.__value_.__l.__data_) = v23;
    }
    uint64_t v34 = (char *)v32 - (char *)v33;
    if (v34)
    {
      unint64_t v35 = 0;
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * (v34 >> 4);
      while ((int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v33, &__s) << 24) > 0xFFFFFF|| (int)(std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__s, v33->second.__r_.__value_.__r.__words) << 24) >= 0x1000000)
      {
        ++v35;
        ++v33;
        if (v35 >= v36) {
          goto LABEL_64;
        }
      }
      char v37 = 1;
      BOOL negate = 1;
    }
    else
    {
LABEL_64:
      char v37 = 0;
    }
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    if (v37) {
      goto LABEL_170;
    }
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_) {
    goto LABEL_98;
  }
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&__s, (uint64_t)&this->__traits_, (char *)&v86, &v86.__r_.__value_.__s.__data_[1]);
  std::vector<std::string>::pointer v38 = this->__equivalences_.__begin_;
  uint64_t v39 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  int64_t v40 = (char *)this->__equivalences_.__end_ - (char *)v38;
  if (!v40)
  {
    if ((*((unsigned char *)&__s.__r_.__value_.__s + 23) & 0x80) != 0) {
      operator delete(__s.__r_.__value_.__l.__data_);
    }
    goto LABEL_98;
  }
  uint64_t v41 = 0;
  unint64_t v42 = v40 / 24;
  long long v43 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v44 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v44 = __s.__r_.__value_.__l.__size_;
  }
  if (v42 <= 1) {
    uint64_t v45 = 1;
  }
  else {
    uint64_t v45 = v40 / 24;
  }
  BOOL v46 = 1;
  while (2)
  {
    uint64_t v47 = &v38[v41];
    std::string::size_type v48 = HIBYTE(v47->__r_.__value_.__r.__words[2]);
    int v49 = (char)v48;
    if ((v48 & 0x80u) != 0) {
      std::string::size_type v48 = v47->__r_.__value_.__l.__size_;
    }
    if (v44 != v48)
    {
LABEL_91:
      BOOL v46 = ++v41 < v42;
      if (v41 == v45)
      {
LABEL_92:
        if ((v39 & 0x80) == 0) {
          goto LABEL_94;
        }
        goto LABEL_93;
      }
      continue;
    }
    break;
  }
  if (v49 >= 0) {
    unint64_t v50 = &v38[v41];
  }
  else {
    unint64_t v50 = (std::string *)v47->__r_.__value_.__r.__words[0];
  }
  if ((v39 & 0x80) != 0)
  {
    BOOL v81 = negate;
    std::string::size_type v53 = v44;
    uint64_t v80 = v38;
    int v54 = memcmp((const void *)v43, v50, *((size_t *)&v43 + 1));
    std::vector<std::string>::pointer v38 = v80;
    std::string::size_type v44 = v53;
    BOOL negate = v81;
    if (!v54)
    {
      BOOL negate = 1;
LABEL_93:
      operator delete(__s.__r_.__value_.__l.__data_);
      goto LABEL_94;
    }
    goto LABEL_91;
  }
  if (v39)
  {
    uint64_t v51 = &__s;
    uint64_t v52 = v39;
    while (v51->__r_.__value_.__s.__data_[0] == v50->__r_.__value_.__s.__data_[0])
    {
      uint64_t v51 = (std::string *)((char *)v51 + 1);
      unint64_t v50 = (std::string *)((char *)v50 + 1);
      if (!--v52)
      {
        BOOL negate = 1;
        goto LABEL_92;
      }
    }
    goto LABEL_91;
  }
  BOOL negate = 1;
LABEL_94:
  if (!v46)
  {
LABEL_98:
    if (v86.__r_.__value_.__s.__data_[0] < 0) {
      goto LABEL_170;
    }
    std::regex_traits<char>::char_class_type v55 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v86.__r_.__value_.__s.__data_[0]] & v55) == 0)
    {
      int v56 = (v55 >> 7) & 1;
      if (v86.__r_.__value_.__s.__data_[0] != 95) {
        int v56 = 0;
      }
      if (v56 != 1) {
        goto LABEL_170;
      }
    }
    goto LABEL_103;
  }
LABEL_170:
  if (negate == this->__negate_)
  {
    first = 0;
    int v79 = -993;
  }
  else
  {
    a2->__current_ += v8;
    first = this->__first_;
    int v79 = -995;
  }
  a2->__do_ = v79;
  a2->__node_ = first;
}

void sub_249C31E38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a3, a4, a4 - a3);
  unint64_t v5 = v8;
  if ((v8 & 0x80u) == 0) {
    char v6 = __p;
  }
  else {
    char v6 = (void **)__p[0];
  }
  if ((v8 & 0x80u) != 0) {
    unint64_t v5 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v6, (char *)v6 + v5);
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_249C31F1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1, uint64_t a2, char *a3, char *a4)
{
  std::string::__init_with_size[abi:ne180100]<char const*,char const*>(__p, a3, a4, a4 - a3);
  unint64_t v6 = v12;
  if ((v12 & 0x80u) == 0) {
    char v7 = __p;
  }
  else {
    char v7 = (void **)__p[0];
  }
  if ((v12 & 0x80u) != 0) {
    unint64_t v6 = (unint64_t)__p[1];
  }
  (*(void (**)(void, void **, char *))(**(void **)(a2 + 16) + 32))(*(void *)(a2 + 16), v7, (char *)v7 + v6);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a1 + 8);
  }
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0) {
        uint64_t v10 = (unsigned char *)a1;
      }
      else {
        uint64_t v10 = *(unsigned char **)a1;
      }
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(unsigned char **)a1 = 0;
      *(void *)(a1 + 8) = 0;
    }
    else
    {
      *(unsigned char *)a1 = 0;
      *(unsigned char *)(a1 + 23) = 0;
    }
  }
  if ((char)v12 < 0) {
    operator delete(__p[0]);
  }
}

void sub_249C32038(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);

  JUMPOUT(0x24C5B1B10);
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  char v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  char v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  uint64_t v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  uint64_t v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  unint64_t v5 = a1[1].__locale_;
  if (v5) {
    (*(void (**)(std::locale::__imp *))(*(void *)v5 + 8))(v5);
  }
  return a1;
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  char v2 = *(unsigned char **)(a2 + 16);
  if (v2 == *(unsigned char **)(a2 + 24) || !*v2)
  {
    uint64_t v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(void *)(a2 + 16) = v2 + 1;
    uint64_t v3 = *(void *)(result + 8);
  }
  *(void *)(a2 + 80) = v3;
  return result;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  char v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8) {
    return 0;
  }
  if (a2 - 48 > this->__marked_count_) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 4);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C32354(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags = this->__flags_;
  if ((flags & 1) == 0)
  {
    if ((flags & 8) == 0) {
      operator new();
    }
    operator new();
  }
  operator new();
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2 = result[4];
  uint64_t v3 = *(void *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(a2 + 40) - v3) >> 3) < v2) {
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  }
  unsigned int v5 = v2 - 1;
  if (*(unsigned char *)(v3 + 24 * v5 + 16)
    && (unint64_t v6 = result,
        uint64_t v7 = v3 + 24 * v5,
        __n128 result = *(unsigned int **)v7,
        int64_t v8 = *(void *)(v7 + 8) - *(void *)v7,
        uint64_t v9 = *(void *)(a2 + 16),
        *(void *)(a2 + 24) - v9 >= v8)
    && (__n128 result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !result))
  {
    *(_DWORD *)a2 = -994;
    *(void *)(a2 + 16) = v9 + v8;
    uint64_t v10 = *((void *)v6 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(void *)(a2 + 80) = v10;
  return result;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unint64_t v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(result + 40) - 1;
  uint64_t v3 = *(void *)(a2 + 32);
  if (*(unsigned char *)(v3 + 24 * v2 + 16))
  {
    uint64_t v4 = (unsigned __int8 **)(v3 + 24 * v2);
    unsigned int v5 = *v4;
    uint64_t v6 = v4[1] - *v4;
    uint64_t v7 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v7 + v6;
        uint64_t v8 = *(void *)(result + 8);
        goto LABEL_9;
      }
      uint64_t v9 = v6;
      uint64_t v10 = *(unsigned __int8 **)(a2 + 16);
      while (1)
      {
        int v12 = *v5++;
        int v11 = v12;
        int v13 = *v10++;
        if (v11 != v13) {
          break;
        }
        if (!--v9) {
          goto LABEL_8;
        }
      }
    }
  }
  uint64_t v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(void *)(a2 + 80) = v8;
  return result;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDFF8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x24C5B1B10);
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDFF8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(unsigned char *)(v3 + 16))
  {
    uint64_t v4 = *(void *)(v3 + 8) - *(void *)v3;
    uint64_t v5 = *(void *)(a2 + 16);
    if (*(void *)(a2 + 24) - v5 >= v4)
    {
      uint64_t v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(void *)(a2 + 16) = v5 + v4;
        uint64_t v6 = *(void *)(v7 + 8);
        goto LABEL_10;
      }
      uint64_t v8 = 0;
      while (1)
      {
        int v9 = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)v3 + v8));
        __n128 result = (*(uint64_t (**)(void, void))(**(void **)(v7 + 24) + 40))(*(void *)(v7 + 24), *(char *)(*(void *)(a2 + 16) + v8));
        if (v9 != result) {
          break;
        }
        if (v4 == ++v8)
        {
          uint64_t v5 = *(void *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  uint64_t v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(void *)(a2 + 80) = v6;
  return result;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDFB0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x24C5B1B10);
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDFB0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = (char *)a2;
  if (a2 != a3)
  {
    std::vector<char>::pointer end = a1->__end_;
    unsigned int marked_count = a1->__marked_count_;
    int v9 = a2 + 1;
    int v8 = *a2;
    if ((a2 + 1 != a3 || v8 != 36)
      && ((v8 - 46) > 0x2E || ((1 << (v8 - 46)) & 0x600000000001) == 0))
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v8);
      goto LABEL_29;
    }
    int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(a1, a2, a3);
    if (v11 == v3)
    {
      if (*v3 == 46) {
        operator new();
      }
      int v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)a1, v3, (char *)a3);
    }
    if (v11 == v3 && v11 != (char *)a3)
    {
      if (v9 == a3 || *v3 != 92) {
        return v3;
      }
      int v12 = *v9;
      if (v12 == 40)
      {
        uint64_t v13 = (uint64_t)(v3 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        unsigned int v14 = a1->__marked_count_;
        do
        {
          std::basic_regex<char>::value_type v15 = (unsigned __int8 *)v13;
          uint64_t v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(a1, v13, a3);
        }
        while ((unsigned __int8 *)v13 != v15);
        if (v15 == a3 || v15 + 1 == a3 || *v15 != 92 || v15[1] != 41) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
        int v11 = (char *)(v15 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, v14);
      }
      else
      {
        BOOL v16 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v12);
        uint64_t v17 = 2;
        if (!v16) {
          uint64_t v17 = 0;
        }
        int v11 = &v3[v17];
      }
    }
    int v9 = (unsigned __int8 *)v11;
    if (v11 != v3)
    {
LABEL_29:
      if (v9 == a3) {
        return (char *)a3;
      }
      size_t v18 = a1->__marked_count_ + 1;
      int v19 = *v9;
      if (v19 == 42)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, end, marked_count + 1, a1->__marked_count_ + 1, 1);
        return (char *)(v9 + 1);
      }
      if (v9 + 1 == a3 || v19 != 92 || v9[1] != 123) {
        return (char *)v9;
      }
      int v29 = 0;
      unint64_t v20 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v9 + 2, a3, &v29);
      if (v20 == v9 + 2) {
LABEL_45:
      }
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
      if (v20 != a3)
      {
        int v21 = v20 + 1;
        int v22 = *v20;
        if (v22 == 44)
        {
          int v28 = -1;
          unsigned __int8 v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v20 + 1, a3, &v28);
          if (v23 != a3 && v23 + 1 != a3 && *v23 == 92 && v23[1] == 125)
          {
            size_t v25 = v28;
            size_t v24 = v29;
            if (v28 == -1)
            {
              size_t v25 = -1;
            }
            else if (v28 < v29)
            {
              goto LABEL_45;
            }
            uint64_t v3 = (char *)&v23[2 * (v23[1] == 125)];
            int v26 = a1;
LABEL_53:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v26, v24, v25, end, marked_count + 1, v18, 1);
            return v3;
          }
        }
        else if (v21 != a3 && v22 == 92 && *v21 == 125)
        {
          uint64_t v3 = (char *)(v20 + 2);
          size_t v24 = v29;
          int v26 = a1;
          size_t v25 = v29;
          goto LABEL_53;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v3;
}

unsigned char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(std::basic_regex<char> *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    int v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, char *a3)
{
  if (a2 == (unsigned __int8 *)a3) {
    return a2;
  }
  int v6 = (char)*a2;
  int v7 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 == (unsigned __int8 *)a3) {
        goto LABEL_32;
      }
      int v16 = a2[1];
      if (v16 == 66)
      {
        BOOL v17 = 1;
      }
      else
      {
        if (v16 != 98) {
          goto LABEL_31;
        }
        BOOL v17 = 0;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v17);
      return a2 + 2;
    }
    if (v6 != 94) {
      goto LABEL_32;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_l_anchor(this);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_r_anchor(this);
    return a2 + 1;
  }
  BOOL v9 = v6 == 40;
  int v8 = (char *)(a2 + 1);
  BOOL v9 = !v9 || v8 == a3;
  if (!v9)
  {
    uint64_t v10 = (char *)(a2 + 2);
    if (*v8 == 63 && v10 != a3)
    {
      int v12 = *v10;
      if (v12 == 33)
      {
        std::regex_traits<char>::regex_traits(&v44.__traits_);
        memset(&v44.__flags_, 0, 40);
        v44.__flags_ = this->__flags_;
        uint64_t v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v44, a2 + 3, a3);
        unsigned int marked_count = v44.__marked_count_;
        std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v44, 1, this->__marked_count_);
        this->__marked_count_ += marked_count;
        if (v13 == a3 || *v13 != 41) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
LABEL_30:
        std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v44.__traits_.__loc_);
        __n128 result = (unsigned __int8 *)(v13 + 1);
        if (v13 + 1 != (char *)a2) {
          return result;
        }
        goto LABEL_31;
      }
      if (v12 == 61)
      {
        std::regex_traits<char>::regex_traits(&v44.__traits_);
        memset(&v44.__flags_, 0, 40);
        v44.__flags_ = this->__flags_;
        uint64_t v13 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v44, a2 + 3, a3);
        unsigned int v14 = v44.__marked_count_;
        std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v44, 0, this->__marked_count_);
        this->__marked_count_ += v14;
        if (v13 == a3 || *v13 != 41) {
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        }
        goto LABEL_30;
      }
    }
LABEL_31:
    int v7 = *a2;
  }
LABEL_32:
  std::vector<char>::pointer end = this->__end_;
  unsigned int v20 = this->__marked_count_;
  if ((char)v7 <= 91)
  {
    __n128 result = a2;
    switch((char)v7)
    {
      case '$':
      case ')':
        return result;
      case '%':
      case '&':
      case '\'':
      case ',':
      case '-':
        goto LABEL_60;
      case '(':
        if (a2 + 1 == (unsigned __int8 *)a3) {
          goto LABEL_98;
        }
        if (a2 + 2 != (unsigned __int8 *)a3 && a2[1] == 63 && a2[2] == 58)
        {
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          int v22 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
          if (v22 == a3) {
            goto LABEL_98;
          }
          unsigned __int8 v23 = v22;
          if (*v22 != 41) {
            goto LABEL_98;
          }
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
          unsigned int v29 = this->__marked_count_;
          p_open_count = &this->__open_count_;
          ++this->__open_count_;
          std::vector<char>::pointer v30 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 1, a3);
          if (v30 == a3 || (unsigned __int8 v23 = v30, *v30 != 41)) {
LABEL_98:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
          std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, v29);
        }
        --*p_open_count;
        size_t v25 = (unsigned __int8 *)(v23 + 1);
        goto LABEL_57;
      case '*':
      case '+':
        goto LABEL_65;
      case '.':
        operator new();
      default:
        if ((char)v7 == 91)
        {
          size_t v25 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, (char *)a2, a3);
          goto LABEL_57;
        }
        if ((char)v7 != 63) {
          goto LABEL_60;
        }
        goto LABEL_65;
    }
  }
  uint64_t v24 = ((char)v7 - 92);
  if (v24 <= 0x21)
  {
    if (((1 << (v7 - 92)) & 0x300000006) != 0) {
      return a2;
    }
    if ((char)v7 == 92)
    {
      if (v7 != 92) {
        return a2;
      }
      int v26 = a2 + 1;
      if (a2 + 1 == (unsigned __int8 *)a3) {
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      }
      int v27 = *v26;
      unsigned int v28 = v27 - 48;
      if (v27 == 48)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v28);
LABEL_97:
        size_t v25 = a2 + 2;
        goto LABEL_61;
      }
      if ((v27 - 49) <= 8)
      {
        size_t v25 = a2 + 2;
        if (a2 + 2 == (unsigned __int8 *)a3)
        {
          size_t v25 = (unsigned __int8 *)a3;
        }
        else
        {
          while (1)
          {
            int v32 = *v25;
            if ((v32 - 48) > 9) {
              break;
            }
            if (v28 >= 0x19999999) {
              goto LABEL_99;
            }
            ++v25;
            unsigned int v28 = v32 + 10 * v28 - 48;
            if (v25 == (unsigned __int8 *)a3)
            {
              size_t v25 = (unsigned __int8 *)a3;
              break;
            }
          }
          if (!v28) {
LABEL_99:
          }
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
        }
        if (v28 > v20) {
          goto LABEL_99;
        }
        std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v28);
        if (v25 != v26)
        {
LABEL_57:
          __n128 result = a2;
          if (v25 == a2) {
            return result;
          }
          goto LABEL_61;
        }
      }
      int v33 = (char)*v26;
      if (v33 > 99)
      {
        if (v33 == 119)
        {
          uint64_t v34 = this;
          BOOL v35 = 0;
          goto LABEL_89;
        }
        if (v33 == 115)
        {
          unint64_t v42 = this;
          BOOL v43 = 0;
LABEL_95:
          started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v42, v43);
          int v39 = started->__mask_ | 0x4000;
          goto LABEL_96;
        }
        if (v33 != 100)
        {
LABEL_90:
          uint64_t v41 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(this, a2 + 1, (unsigned __int8 *)a3, 0);
          if (v41 == v26) {
            size_t v25 = a2;
          }
          else {
            size_t v25 = v41;
          }
          goto LABEL_57;
        }
        unint64_t v36 = this;
        BOOL v37 = 0;
      }
      else
      {
        if (v33 != 68)
        {
          if (v33 != 83)
          {
            if (v33 == 87)
            {
              uint64_t v34 = this;
              BOOL v35 = 1;
LABEL_89:
              int64_t v40 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v34, v35);
              v40->__mask_ |= 0x500u;
              std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v40, 95);
              goto LABEL_97;
            }
            goto LABEL_90;
          }
          unint64_t v42 = this;
          BOOL v43 = 1;
          goto LABEL_95;
        }
        unint64_t v36 = this;
        BOOL v37 = 1;
      }
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(v36, v37);
      int v39 = started->__mask_ | 0x400;
LABEL_96:
      started->__mask_ = v39;
      goto LABEL_97;
    }
    if (v24 == 31) {
LABEL_65:
    }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
  }
LABEL_60:
  std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v7);
  size_t v25 = a2 + 1;
LABEL_61:
  size_t v31 = this->__marked_count_ + 1;

  return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v25, (unsigned __int8 *)a3, end, v20 + 1, v31);
}

void sub_249C33404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x24C5B19E0](exception, 11);
  __cxa_throw(exception, MEMORY[0x263F8C190], MEMORY[0x263F8C098]);
}

void sub_249C33494(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  char v22 = 0;
  memset(&v23, 0, 17);
  char v24 = 0;
  uint64_t v25 = 0;
  memset(&__p, 0, sizeof(__p));
  std::vector<std::csub_match>::size_type v4 = (*(_DWORD *)(a1 + 44) + 1);
  uint64_t v5 = *(void *)(a2 + 16);
  v19.first = *(const char **)(a2 + 24);
  v19.second = v19.first;
  v19.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v19);
  uint64_t v20 = v5;
  uint64_t v21 = v5;
  char v22 = 0;
  std::vector<std::csub_match>::value_type v23 = v19;
  uint64_t v25 = v5;
  char v24 = 1;
  int v6 = *(const char **)(a2 + 16);
  if (*(unsigned char *)(a2 + 92)) {
    BOOL v7 = v6 == *(const char **)(a2 + 8);
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(void *)(a2 + 80) = 0;
    std::vector<std::csub_match>::pointer begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(void *)(a2 + 80) = *(void *)(a1 + 8);
  std::vector<std::csub_match>::pointer begin = __p.__begin_;
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin) {
      return;
    }
    goto LABEL_14;
  }
  int v11 = *(_DWORD *)(a1 + 80);
  uint64_t v12 = *(void *)(a2 + 32);
  unsigned int v13 = 2;
  uint64_t v14 = 1;
  do
  {
    std::basic_regex<char>::value_type v15 = &begin[v14];
    uint64_t v16 = v12 + 24 * (v11 + v13 - 2);
    *(std::pair<const char *, const char *> *)uint64_t v16 = v15->std::pair<const char *, const char *>;
    *(unsigned char *)(v16 + 16) = v15->matched;
    uint64_t v14 = v13;
  }
  while (v10 > v13++);
LABEL_14:

  operator delete(begin);
}

void sub_249C33890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26FDCDE48;
  unsigned int v2 = (std::locale *)(a1 + 2);
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  std::vector<std::csub_match>::size_type v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_26FDCDE48;
  unsigned int v2 = (std::locale *)(a1 + 2);
  uint64_t v3 = (std::__shared_weak_count *)a1[8];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::locale::~locale(v2);
  std::vector<std::csub_match>::size_type v4 = a1[1];
  if (v4) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  }
  return a1;
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 **)(a2 + 8);
  uint64_t v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3) {
    goto LABEL_17;
  }
  std::vector<std::csub_match>::size_type v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(unsigned char *)(a2 + 88) & 8) == 0)
    {
      uint64_t v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    int v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    int v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        uint64_t v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          int v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  uint64_t v7 = *(v4 - 1);
  uint64_t v8 = *v4;
  int v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  int v11 = v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(void *)(*(void *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  int v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    uint64_t v12 = 0;
    int v13 = -993;
  }
  else
  {
    uint64_t v12 = *(void *)(result + 8);
    int v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(void *)(a2 + 80) = v12;
  return result;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDE00;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }

  JUMPOUT(0x24C5B1B10);
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  a1->__locale_ = (std::locale::__imp *)&unk_26FDCDE00;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale) {
    (*(void (**)(std::locale::__imp *))(*(void *)locale + 8))(locale);
  }
  return a1;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x8000000249C3A44DLL
    || ((v3 & 0x8000000249C3A44DLL & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x8000000249C3A44DLL)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000249C3A44DLL & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x24C5B1B10);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  uint64_t v1 = a1[1];
  if (v1) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  }

  JUMPOUT(0x24C5B1B10);
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  unsigned int v2 = a1[1];
  if (v2) {
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  }
  return a1;
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__end_state<char>::~__end_state()
{
}

void util::WriteDevicesExceptionSafe(util *this)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  memset(&v20, 0, sizeof(v20));
  LODWORD(v22[0]) = 1;
  *(void *)&long long inAddress = 0x676C6F6272647623;
  DWORD2(inAddress) = 0;
  ca::hal::detail::PropertyDispatch<ca::hal::detail::HALPropertyPolicy,std::vector<unsigned int>,void>::Get((uint64_t)&__p, (AudioObjectID *)v22, (AudioObjectPropertyAddress *)&inAddress);
  LOBYTE(inAddress) = 0;
  int value_low = LOBYTE(__p.__end_cap_.__value_);
  if (LOBYTE(__p.__end_cap_.__value_))
  {
    std::__split_buffer<std::string>::pointer end = __p.__end_;
    *(void *)&long long inAddress = __p.__begin_;
    p_long long inAddress = (std::__split_buffer<std::string> *)&inAddress;
  }
  else
  {
    std::__split_buffer<std::string>::pointer end = 0;
    p_long long inAddress = &__p;
  }
  memset(&__p, 0, 24);
  first = (unsigned int *)p_inAddress->__first_;
  p_inAddress->__begin_ = 0;
  p_inAddress->__end_ = 0;
  p_inAddress->__first_ = 0;
  if (__p.__first_) {
    operator delete(__p.__first_);
  }
  if (value_low && (void)inAddress) {
    operator delete((void *)inAddress);
  }
  memset(&v21, 0, sizeof(v21));
  if (first != (unsigned int *)end)
  {
    uint64_t v6 = first;
    do
    {
      unsigned int v7 = *v6;
      util::WriteDevice((util *)v22, *v6);
      unint64_t v8 = v23;
      unsigned __int8 v9 = v23;
      if ((v23 & 0x80u) != 0) {
        unint64_t v8 = (unint64_t)v22[1];
      }
      if (v8)
      {
        util::WriteDevice((util *)&inAddress, v7);
        std::vector<std::string>::pointer v10 = v21.__end_;
        if (v21.__end_ >= v21.__end_cap_.__value_)
        {
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21.__end_ - (char *)v21.__begin_) >> 3);
          unint64_t v13 = v12 + 1;
          if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<applesauce::CF::StringRef>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3) > v13) {
            unint64_t v13 = 0x5555555555555556 * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v21.__end_cap_.__value_ - (char *)v21.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v14 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v14 = v13;
          }
          __p.__end_cap_.__value_ = (std::allocator<std::string> *)&v21.__end_cap_;
          if (v14) {
            unint64_t v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v14);
          }
          else {
            uint64_t v15 = 0;
          }
          uint64_t v16 = (std::string *)(v14 + 24 * v12);
          __p.__first_ = (std::__split_buffer<std::string>::pointer)v14;
          __p.__begin_ = v16;
          __p.__end_cap_.__value_ = (std::string *)(v14 + 24 * v15);
          long long v17 = inAddress;
          v16->__r_.__value_.__r.__words[2] = v26;
          *(_OWORD *)&v16->__r_.__value_.__l.__data_ = v17;
          std::string::size_type v26 = 0;
          long long inAddress = 0uLL;
          __p.__end_ = v16 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v21, &__p);
          size_t v18 = v21.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__p);
          v21.__end_ = v18;
          if (SHIBYTE(v26) < 0) {
            operator delete((void *)inAddress);
          }
        }
        else
        {
          long long v11 = inAddress;
          v21.__end_->__r_.__value_.__r.__words[2] = v26;
          *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
          v21.__end_ = v10 + 1;
        }
        unsigned __int8 v9 = v23;
      }
      if ((v9 & 0x80) != 0) {
        operator delete(v22[0]);
      }
      ++v6;
    }
    while (v6 != (unsigned int *)end);
  }
  if (first) {
    operator delete(first);
  }
  long long v19 = *(_OWORD *)&v21.__begin_;
  std::vector<std::string> v20 = v21;
  memset(&v21, 0, sizeof(v21));
  __p.__first_ = (std::__split_buffer<std::string>::pointer)&v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  *(_DWORD *)this = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 1) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((uint64_t)this + 8, (long long *)v19, *((long long **)&v19 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v19 + 1) - v19) >> 3));
  *(void *)&long long inAddress = &v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&inAddress);
}

void sub_249C34138(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, long long *p_p, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,long long __p,long long a31)
{
  if (a2)
  {
    if (SBYTE7(a31) < 0) {
      operator delete((void *)__p);
    }
    if (a24 < 0) {
      operator delete(a19);
    }
    *(void *)&std::__split_buffer<std::string> __p = &a15;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    if (v32) {
      operator delete(v32);
    }
    BOOL v35 = (util *)__cxa_begin_catch(exception_object);
    util::server_log(v35);
    unint64_t v36 = (id) util::server_log(void)::sLogCat;
    BOOL v37 = v36;
    if (a2 == 2)
    {
      std::vector<std::string>::pointer v38 = v36;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = (*(uint64_t (**)(util *))(*(void *)v35 + 16))(v35);
        LODWORD(__p) = 136315650;
        *(void *)((char *)&__p + 4) = "DeviceSerializationUtilities.mm";
        WORD6(__p) = 1024;
        *(_DWORD *)((char *)&__p + 14) = 823;
        WORD1(a31) = 2080;
        *(void *)((char *)&a31 + 4) = v39;
        _os_log_impl(&dword_249BFC000, v38, OS_LOG_TYPE_ERROR, "%25s:%-5d catchAndLogException: encountered std::exception %s", (uint8_t *)&__p, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 136315394;
      *(void *)((char *)&__p + 4) = "DeviceSerializationUtilities.mm";
      WORD6(__p) = 1024;
      *(_DWORD *)((char *)&__p + 14) = 828;
      _os_log_impl(&dword_249BFC000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d catchAndLogException: encountered unspecified error", (uint8_t *)&__p, 0x12u);
    }
    __cxa_end_catch();
    *(_DWORD *)uint64_t v31 = 2003329396;
    *(void *)(v31 + 16) = 0;
    *(void *)(v31 + 24) = 0;
    *(void *)(v31 + 8) = 0;
    *(void *)&a31 = 0;
    std::__split_buffer<std::string> __p = 0uLL;
    p_p = &__p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_p);
    JUMPOUT(0x249C340E4);
  }
  _Unwind_Resume(exception_object);
}

OSStatus AudioObjectGetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *ioDataSize, void *outData)
{
  return MEMORY[0x270EE4128](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, ioDataSize, outData);
}

OSStatus AudioObjectGetPropertyDataSize(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 *outDataSize)
{
  return MEMORY[0x270EE4130](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, outDataSize);
}

Boolean AudioObjectHasProperty(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress)
{
  return MEMORY[0x270EE4138](*(void *)&inObjectID, inAddress);
}

OSStatus AudioObjectIsPropertySettable(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, Boolean *outIsSettable)
{
  return MEMORY[0x270EE4140](*(void *)&inObjectID, inAddress, outIsSettable);
}

OSStatus AudioObjectSetPropertyData(AudioObjectID inObjectID, const AudioObjectPropertyAddress *inAddress, UInt32 inQualifierDataSize, const void *inQualifierData, UInt32 inDataSize, const void *inData)
{
  return MEMORY[0x270EE4158](*(void *)&inObjectID, inAddress, *(void *)&inQualifierDataSize, inQualifierData, *(void *)&inDataSize, inData);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F98288](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = (const std::string_view::value_type *)MEMORY[0x270F982A0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x270F982D8](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98318](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x270F98440](this, *(void *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x270F98890](__s, __icase);
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

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x270F98A00](retstr, __s);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x270F98C70](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x270F98C78](this);
}

void std::locale::~locale(std::locale *this)
{
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
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

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
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
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
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

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}