uint64_t *std::unique_ptr<mlc::xpc_dispatch_t>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  std::unique_ptr<mlc::xpc_dispatch_t>::reset[abi:ne180100](a1, 0);
  return a1;
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t xpc_compile(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v14 = 0;
  v15[0] = 0;
  uint64_t v11 = a2;
  v12 = 0;
  v13 = &_free;
  pthread_attr_init(&v20);
  pthread_attr_setstacksize(&v20, 0x404000uLL);
  pthread_create(v15, &v20, (void *(__cdecl *)(void *))compile_thread_handler, &v11);
  pthread_join(v15[0], 0);
  v3 = os_log_create("com.apple.mlcompiler.service.compiler", "Compilation");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v12;
    if (v12 && !*v12) {
      v4 = &unk_100003E2E;
    }
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = v4;
    __int16 v17 = 2048;
    uint64_t v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Compilation completed: \"%s\" (%lfms)", buf, 0x16u);
  }
  char v19 = 1;
  strcpy(buf, "m");
  v5 = v12;
  if (v12 && !*v12) {
    v5 = (const char *)&unk_100003E2E;
  }
  v6 = (_opaque_pthread_t *)xpc_string_create(v5);
  v15[1] = v6;
  xpc_dictionary_set_value(*a1, buf, v6);
  if (v6) {
    xpc_release(v6);
  }
  if (v19 < 0)
  {
    operator delete(*(void **)buf);
    v7 = v12;
    if (v12) {
      goto LABEL_13;
    }
  }
  else
  {
    v7 = v12;
    if (v12)
    {
LABEL_13:
      BOOL v8 = *v7 == 0;
      goto LABEL_16;
    }
  }
  BOOL v8 = 0;
LABEL_16:
  mlc::xpc_auto_message_t::set_ret(a1, v8);
  xpc_dictionary_send_reply();
  if (*a1) {
    xpc_release(*a1);
  }
  *a1 = 0;
  uint64_t result = (uint64_t)v12;
  v12 = 0;
  if (result) {
    return ((uint64_t (*)(uint64_t, uint64_t))v13)(result, v9);
  }
  return result;
}

void sub_100002520(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void conection_handler(_xpc_connection_s *a1)
{
  v2 = xpc_copy_description(a1);
  free(v2);
  xpc_connection_set_event_handler(a1, &__block_literal_global);
  xpc_connection_activate(a1);
}

uint64_t compile_thread_handler(double *a1)
{
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep rep = std::chrono::steady_clock::now().__d_.__rep_;
  uint64_t v3 = mlc_model_compile();
  a1[3] = (double)(std::chrono::steady_clock::now().__d_.__rep_ - rep) / 1000000.0;
  uint64_t v4 = *((void *)a1 + 1);
  *((void *)a1 + 1) = v3;
  if (v4) {
    (*((void (**)(void))a1 + 2))();
  }
  return 0;
}

void __clang_call_terminate(void *a1)
{
}

void mlc::xpc_auto_handle_t::~xpc_auto_handle_t(void **this)
{
  v1 = *this;
  if (v1) {
    xpc_release(v1);
  }
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_1000026E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

xpc_object_t *mlc::xpc_auto_message_t::set_ret(xpc_object_t *this, BOOL value)
{
  char v6 = 1;
  LOWORD(__p) = 114;
  xpc_object_t v3 = xpc_BOOL_create(value);
  xpc_object_t v7 = v3;
  xpc_dictionary_set_value(*this, (const char *)&__p, v3);
  if (v3) {
    xpc_release(v3);
  }
  if (v6 < 0) {
    operator delete(__p);
  }
  return this;
}

void sub_1000027D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ___ZL17conection_handlerP17_xpc_connection_s_block_invoke(id a1, void *a2)
{
}

uint64_t *std::unique_ptr<mlc::xpc_dispatch_t>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *uint64_t result = a2;
  if (v2)
  {
    xpc_object_t v3 = *(void **)(v2 + 24);
    while (v3)
    {
      v5 = v3;
      xpc_object_t v3 = (void *)*v3;
      char v6 = (void *)v5[6];
      if (v6 == v5 + 3)
      {
        (*(void (**)(void *))(v5[3] + 32))(v5 + 3);
      }
      else if (v6)
      {
        (*(void (**)(void *))(*v6 + 40))(v6);
      }
      operator delete(v5);
    }
    uint64_t v4 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;
    if (v4) {
      operator delete(v4);
    }
    operator delete();
  }
  return result;
}

void *std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__emplace_unique_key_args<mlc::function_kind_t,std::piecewise_construct_t const&,std::tuple<mlc::function_kind_t const&>,std::piecewise_construct_t const&<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
          }
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8) {
              v12 %= v8;
            }
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4) {
            break;
          }
        }
      }
    }
  }
  v13 = (void *)(a1 + 16);
  i = operator new(0x38uLL);
  void *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[6] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t prime = v18;
    }
    else {
      size_t prime = v17;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v8 = *(void *)(a1 + 8);
    }
    if (prime > v8) {
      goto LABEL_30;
    }
    if (prime < v8)
    {
      unint64_t v20 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v8 < 3 || (uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v8), v21.i16[0] = vaddlv_u8(v21), v21.u32[0] > 1uLL))
      {
        unint64_t v20 = std::__next_prime(v20);
      }
      else
      {
        uint64_t v22 = 1 << -(char)__clz(v20 - 1);
        if (v20 >= 2) {
          unint64_t v20 = v22;
        }
      }
      if (prime <= v20) {
        size_t prime = v20;
      }
      if (prime < v8) {
LABEL_30:
      }
        std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v23 = *(void *)a1;
  v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    void *i = *v24;
LABEL_55:
    void *v24 = i;
    goto LABEL_56;
  }
  void *i = *v13;
  void *v13 = i;
  *(void *)(v23 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v25 = *(void *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }
    else
    {
      v25 &= v8 - 1;
    }
    v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_55;
  }
LABEL_56:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100002BD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,mlc::xpc_auto_reply_t &&>,std::__hash_node_destructor<std::allocator<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>>>::~unique_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<std::__hash_node<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,mlc::xpc_auto_reply_t &&>,std::__hash_node_destructor<std::allocator<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>>>::~unique_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      xpc_object_t v3 = (void *)v2[6];
      if (v3 == v2 + 3)
      {
        (*(void (**)(void *))(v2[3] + 32))(v2 + 3);
      }
      else if (v3)
      {
        (*(void (**)(void *))(*v3 + 40))(v3);
      }
    }
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>,std::__unordered_map_hasher<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::hash<mlc::function_kind_t>,std::equal_to<mlc::function_kind_t>,true>,std::__unordered_map_equal<mlc::function_kind_t,std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>,std::equal_to,std::hash,true>,std::allocator<std::function<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    unint64_t v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    unint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      uint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v13 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v13 >= a2) {
              v13 %= a2;
            }
          }
          else
          {
            v13 &= a2 - 1;
          }
          if (v13 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v13))
            {
              *(void *)(*(void *)a1 + 8 * v13) = v7;
              goto LABEL_19;
            }
            void *v7 = *v11;
            uint64_t v12 = 8 * v13;
            *uint64_t v11 = **(void **)(*(void *)a1 + v12);
            **(void **)(*(void *)a1 + v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v13 = v8;
LABEL_19:
          unint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v13;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::~__func()
{
}

void *std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = off_100004258;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_100004258;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<void mlc::xpc_dispatch_t::add<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>)>(mlc::function_kind_t,void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&)::{lambda(mlc::xpc_auto_reply_t&&,void *)#1},std::allocator<mlc::xpc_auto_reply_t&&>,BOOL ()(void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>) &&,mlc::xpc_auto_reply_t&)>::operator()(uint64_t a1, long long *a2, xpc_object_t *a3)
{
  xpc_object_t v4 = *a3;
  v5 = *(void (**)(xpc_object_t *, void **))(a1 + 8);
  size_t count = xpc_array_get_count(*a3);
  if (count == 1) {
    mlc::detail::dispatch_impl_t<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>),void,mlc::xpc_auto_reply_t,std::vector<char const*>>::invoke_with_seq<mlc::xpc_auto_reply_t&&,0ul>(v5, a2, v4);
  }
  return count == 1;
}

void mlc::detail::dispatch_impl_t<void (&)(mlc::xpc_auto_reply_t,std::vector<char const*>),void,mlc::xpc_auto_reply_t,std::vector<char const*>>::invoke_with_seq<mlc::xpc_auto_reply_t&&,0ul>(void (*a1)(xpc_object_t *, void **), long long *a2, xpc_object_t xarray)
{
  long long v4 = *a2;
  *(void *)a2 = 0;
  *(_OWORD *)object = v4;
  xpc_object_t value = xpc_array_get_value(xarray, 0);
  mlc::xpc<std::vector<char const*>>::get_value(value, (const char ***)__p);
  a1(object, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (object[0]) {
    xpc_release(object[0]);
  }
}

void sub_100002F44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13)
{
  if (__p) {
    operator delete(__p);
  }
  mlc::xpc_auto_reply_t::~xpc_auto_reply_t(&a13);
  _Unwind_Resume(a1);
}

void mlc::xpc<std::vector<char const*>>::get_value(void *a1@<X0>, const char ***a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  size_t count = xpc_array_get_count(a1);
  if (count)
  {
    long long v4 = 0;
    size_t v5 = 0;
    while (1)
    {
      xpc_object_t value = xpc_array_get_value(a1, v5);
      string_ptr = xpc_string_get_string_ptr(value);
      uint8x8_t v9 = string_ptr;
      unint64_t v10 = (unint64_t)a2[2];
      if ((unint64_t)v4 >= v10) {
        break;
      }
      void *v4 = string_ptr;
      uint64_t v6 = v4 + 1;
LABEL_4:
      a2[1] = v6;
      ++v5;
      long long v4 = v6;
      if (v5 == count) {
        return;
      }
    }
    uint64_t v11 = *a2;
    uint64_t v12 = (char *)v4 - (char *)*a2;
    uint64_t v13 = v12 >> 3;
    unint64_t v14 = (v12 >> 3) + 1;
    if (v14 >> 61) {
      std::vector<char const*>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = v10 - (void)v11;
    if (v15 >> 2 > v14) {
      unint64_t v14 = v15 >> 2;
    }
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v14;
    }
    if (v16)
    {
      if (v16 >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      unint64_t v17 = operator new(8 * v16);
    }
    else
    {
      unint64_t v17 = 0;
    }
    unint64_t v18 = (const char **)&v17[8 * v13];
    *unint64_t v18 = v9;
    uint64_t v6 = v18 + 1;
    if (v4 == v11)
    {
LABEL_21:
      *a2 = v18;
      a2[1] = v6;
      a2[2] = (const char **)&v17[8 * v16];
      if (v4) {
        operator delete(v4);
      }
      goto LABEL_4;
    }
    unint64_t v19 = (char *)v4 - (char *)v11 - 8;
    if (v19 >= 0x168)
    {
      unint64_t v22 = ((char *)(v4 - 1) - (char *)v11) & 0xFFFFFFFFFFFFFFF8;
      if (&v17[v12 - 8 - v22] > &v17[v12 - 8])
      {
        unint64_t v20 = v4;
      }
      else if ((const char **)((char *)v4 - v22 - 8) > v4 - 1)
      {
        unint64_t v20 = v4;
      }
      else if ((unint64_t)((char *)v4 - v17 - v12) >= 0x20)
      {
        uint64_t v23 = (v19 >> 3) + 1;
        uint64_t v24 = 8 * (v23 & 0x3FFFFFFFFFFFFFFCLL);
        unint64_t v20 = &v4[v24 / 0xFFFFFFFFFFFFFFF8];
        unint64_t v18 = (const char **)((char *)v18 - v24);
        unint64_t v25 = &v17[8 * v13 - 16];
        v26 = v4 - 2;
        uint64_t v27 = v23 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v28 = *(_OWORD *)v26;
          *(v25 - 1) = *((_OWORD *)v26 - 1);
          *unint64_t v25 = v28;
          v25 -= 2;
          v26 -= 4;
          v27 -= 4;
        }
        while (v27);
        if (v23 == (v23 & 0x3FFFFFFFFFFFFFFCLL)) {
          goto LABEL_20;
        }
      }
      else
      {
        unint64_t v20 = v4;
      }
    }
    else
    {
      unint64_t v20 = v4;
    }
    do
    {
      uint8x8_t v21 = *--v20;
      *--unint64_t v18 = v21;
    }
    while (v20 != v11);
LABEL_20:
    long long v4 = *a2;
    goto LABEL_21;
  }
}

void sub_100003174(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void mlc::xpc_auto_reply_t::~xpc_auto_reply_t(void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    xpc_release(v1);
  }
}

void std::vector<char const*>::__throw_length_error[abi:ne180100]()
{
}

void *std::__function::__value_func<BOOL ()(mlc::xpc_auto_reply_t &&,void *)>::swap[abi:ne180100](void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v3 = result;
    long long v4 = (void *)result[3];
    size_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

void sub_100003444(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

uint64_t _GLOBAL__sub_I_main_cpp()
{
  return __cxa_atexit((void (*)(void *))std::unique_ptr<mlc::xpc_dispatch_t>::~unique_ptr[abi:ne180100], &global_dispatch, (void *)&_mh_execute_header);
}

void mlc::xpc_dispatch_t::handle_xpc_call(NSObject **this@<X0>, xpc_object_t object@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = xpc_copy_description(object);
  xpc_type_t type = xpc_get_type(object);
  unint64_t v8 = *this;
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v9) {
      mlc::xpc_dispatch_t::handle_xpc_call((uint64_t)v6, v8);
    }
    goto LABEL_4;
  }
  if (v9) {
    mlc::xpc_dispatch_t::handle_xpc_call((uint64_t)v6, v8);
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(object, "fc");
  xpc_object_t array = xpc_dictionary_get_array(object, "args");
  if (!uint64 || (xpc_object_t v12 = array, xpc_get_type(array) != (xpc_type_t)&_xpc_type_array))
  {
LABEL_4:
    *(unsigned char *)a3 = 0;
    *(unsigned char *)(a3 + 16) = 0;
    if (!v6) {
      return;
    }
    goto LABEL_5;
  }
  *(void *)a3 = uint64;
  *(void *)(a3 + 8) = v12;
  *(unsigned char *)(a3 + 16) = 1;
  if (!v6) {
    return;
  }
LABEL_5:
  free(v6);
}

void sub_100003578(_Unwind_Exception *exception_object)
{
  if (v1) {
    free(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t mlc::xpc_dispatch_t::handle(NSObject **this, void *a2, _xpc_connection_s *a3)
{
  mlc::xpc_dispatch_t::handle_xpc_call(this, a2, (uint64_t)v17);
  if (!v18) {
    return 0;
  }
  uint64_t v6 = v17[0];
  int8x8_t v7 = (int8x8_t)this[2];
  if (!*(void *)&v7) {
    goto LABEL_18;
  }
  uint8x8_t v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  if (v8.u32[0] > 1uLL)
  {
    uint64_t v9 = v17[0];
    if (v17[0] >= *(void *)&v7) {
      uint64_t v9 = v17[0] % *(void *)&v7;
    }
  }
  else
  {
    uint64_t v9 = (*(void *)&v7 - 1) & v17[0];
  }
  isa = this[1][v9].isa;
  if (!isa || (uint64_t v11 = (void *)*isa) == 0)
  {
LABEL_18:
    uint64_t v13 = *this;
    uint64_t v14 = 0;
    if (!os_log_type_enabled(*this, OS_LOG_TYPE_DEFAULT)) {
      return v14;
    }
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unknown function: %llu", (uint8_t *)&buf, 0xCu);
    return 0;
  }
  while (1)
  {
    unint64_t v12 = v11[1];
    if (v17[0] == v12) {
      break;
    }
    if (v8.u32[0] > 1uLL)
    {
      if (v12 >= *(void *)&v7) {
        v12 %= *(void *)&v7;
      }
    }
    else
    {
      v12 &= *(void *)&v7 - 1;
    }
    if (v12 != v9) {
      goto LABEL_18;
    }
LABEL_11:
    uint64_t v11 = (void *)*v11;
    if (!v11) {
      goto LABEL_18;
    }
  }
  if (v11[2] != v17[0]) {
    goto LABEL_11;
  }
  *(void *)&long long buf = xpc_dictionary_create_reply(a2);
  *((void *)&buf + 1) = a3;
  uint64_t v19 = v17[1];
  uint64_t v16 = v11[6];
  if (!v16) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v14 = (*(uint64_t (**)(uint64_t, long long *, uint64_t *))(*(void *)v16 + 48))(v16, &buf, &v19);
  if ((void)buf) {
    xpc_release((xpc_object_t)buf);
  }
  return v14;
}

void sub_10000376C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  operator delete();
}

void mlc::xpc_dispatch_t::handle_xpc_call(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Request: %s", (uint8_t *)&v2, 0xCu);
}

{
  int v2;
  uint64_t v3;

  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unhandled message: %s", (uint8_t *)&v2, 0xCu);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
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
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

uint64_t mlc_model_compile()
{
  return _mlc_model_compile();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setstacksize(pthread_attr_t *a1, size_t a2)
{
  return _pthread_attr_setstacksize(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}