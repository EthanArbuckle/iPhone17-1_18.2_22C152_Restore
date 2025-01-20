void *GPUTools::SM::GL::operator<<(void *a1, int *a2)
{
  int v3;
  const char *v4;
  void *v5;
  size_t v6;
  const char *v7;

  v3 = *a2;
  if (*a2 == 1)
  {
    v4 = "GL_ONE";
    v5 = a1;
    v6 = 6;
  }
  else if (v3)
  {
    v7 = dy_string_from_enum(v3);
    v6 = strlen(v7);
    v5 = a1;
    v4 = v7;
  }
  else
  {
    v4 = "GL_ZERO";
    v5 = a1;
    v6 = 7;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v4, v6);
  return a1;
}

{
  const char *v3;
  size_t v4;

  v3 = dy_string_from_enum(*a2);
  v4 = strlen(v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v3, v4);
  return a1;
}

{
  void *v2;
  const char *v3;
  size_t v4;
  const char *v5;

  v2 = a1;
  if (*a2)
  {
    v3 = dy_string_from_enum(*a2);
    v4 = strlen(v3);
    a1 = v2;
    v5 = v3;
  }
  else
  {
    v5 = "GL_NO_ERROR";
    v4 = 11;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v5, v4);
  return v2;
}

void *GPUTools::SM::GL::operator<<(void *a1, _DWORD *a2)
{
  if (*a2)
  {
    v3 = "GL_TRUE";
    uint64_t v4 = 7;
  }
  else
  {
    v3 = "GL_FALSE";
    uint64_t v4 = 8;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)v3, v4);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x25335F530](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x25335F540](v13);
  return a1;
}

void sub_24F5A94B8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x25335F540](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x24F5A9498);
}

void sub_24F5A950C(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_24F5A968C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_24F5A97C8(_Unwind_Exception *a1)
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

void *GPUTools::SM::GL::BindingPoint::BindingPoint(void *this)
{
  *this = 0;
  return this;
}

{
  *this = 0;
  return this;
}

uint64_t GPUTools::SM::GL::BindingPoint::getInternalID(GPUTools::SM::GL::BindingPoint *this)
{
  return *((unsigned int *)this + 1);
}

uint64_t GPUTools::SM::GL::BindingPoint::getExternalID(GPUTools::SM::GL::BindingPoint *this)
{
  return *(unsigned int *)this;
}

uint64_t GPUTools::SM::GL::operator<<(uint64_t a1, unsigned int *a2)
{
  return MEMORY[0x270F987A8](a1, *a2);
}

void sub_24F5AA478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  MEMORY[0x25335F5D0](v8, 0x10B0C40F47DA5FCLL);
  std::unique_ptr<GPUTools::FD::Function>::reset[abi:ne180100]((GPUTools::FD::Function **)va, 0);
  _Unwind_Resume(a1);
}

GPUTools::FD::Function *std::unique_ptr<GPUTools::FD::Function>::reset[abi:ne180100](GPUTools::FD::Function **a1, GPUTools::FD::Function *a2)
{
  result = *a1;
  *a1 = a2;
  if (result)
  {
    GPUTools::FD::Function::~Function(result);
    JUMPOUT(0x25335F5D0);
  }
  return result;
}

void *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__emplace_unique_key_args<unsigned int,unsigned int const&>(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    int v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  void *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__rehash<true>(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    void *v10 = *v19;
LABEL_38:
    void *v19 = v10;
    goto LABEL_39;
  }
  void *v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_24F5AAA38(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
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
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *uint64_t v7 = *v11;
            *unint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
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

uint64_t *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::find<unsigned int>(void *a1, unsigned int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::remove(a1, a2, (uint64_t)&__p);
  unint64_t v3 = __p;
  __p = 0;
  if (v3) {
    operator delete(v3);
  }
  return v2;
}

void *std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
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
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
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
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
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
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
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
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  *uint64_t v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

uint64_t std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      int8x8_t v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  unint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

const char *dy_string_from_error(int a1)
{
  if (!a1) {
    return "no error";
  }
  if (a1 == 32817) {
    return "table too large";
  }
  if ((a1 - 1280) > 6) {
    return 0;
  }
  return gGLErrorStrings[a1 - 1280];
}

char *dy_string_from_attachment_mask(unsigned int a1, char a2, char *__s, size_t __size)
{
  return format_bitfield(dy_string_from_attachment_mask_clear_mask_bits, 4, a1, a2, __s, __size);
}

char *format_bitfield(void *a1, uint64_t a2, unsigned int a3, char a4, char *__s, size_t __size)
{
  uint64_t v7 = __s;
  if (!a3)
  {
    if (!__s)
    {
      __size = 2;
      uint64_t v7 = (char *)malloc_type_malloc(2uLL, 0x8A4E21D3uLL);
    }
    strlcpy(v7, "0", __size);
    return v7;
  }
  uint64_t v9 = a2;
  uint64_t v10 = a1;
  if (!a2)
  {
    uint64_t v13 = a3;
    if (__s)
    {
      *__s = 0;
LABEL_45:
      size_t v30 = strlen(v7);
      snprintf(&v7[v30], __size - v30, "0x%lx", v13);
      return v7;
    }
    size_t v24 = 1;
    uint64_t v22 = a3;
    goto LABEL_24;
  }
  if (a2 == 1)
  {
    unint64_t v11 = 0;
    int v12 = 0;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t v11 = a2 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v16 = a2 & 0xFFFFFFFFFFFFFFFELL;
    size_t v17 = a1;
    do
    {
      v14 |= *v17;
      v15 |= v17[5];
      v17 += 10;
      v16 -= 2;
    }
    while (v16);
    int v12 = v15 | v14;
    if (v11 == a2) {
      goto LABEL_12;
    }
  }
  uint64_t v18 = a2 - v11;
  v19 = &a1[5 * v11];
  do
  {
    uint64_t v20 = *v19;
    v19 += 5;
    v12 |= v20;
    --v18;
  }
  while (v18);
LABEL_12:
  uint64_t v21 = a3;
  uint64_t v22 = ~v12 & a3;
  if (__s) {
    goto LABEL_28;
  }
  if (a4)
  {
    v23 = a1 + 4;
    size_t v24 = 1;
    uint64_t v25 = a2;
    do
    {
      if ((*(v23 - 4) & a3) != 0) {
        v24 += *v23 + 3;
      }
      v23 += 5;
      --v25;
    }
    while (v25);
  }
  else
  {
    v26 = a1 + 2;
    size_t v24 = 1;
    uint64_t v27 = a2;
    do
    {
      if ((*(v26 - 2) & a3) != 0) {
        v24 += *v26 + 3;
      }
      v26 += 5;
      --v27;
    }
    while (v27);
  }
  uint64_t v13 = a3;
LABEL_24:
  uint64_t v21 = v13;
  if (v22) {
    __size = v24 + 13;
  }
  else {
    __size = v24;
  }
  uint64_t v7 = (char *)malloc_type_malloc(__size, 0x99871F80uLL);
LABEL_28:
  uint64_t v13 = v22;
  *uint64_t v7 = 0;
  char v28 = 0;
  if (v9)
  {
    if (a4)
    {
      do
      {
        if ((*v10 & v21) != 0)
        {
          if (v28) {
            strlcat(v7, " | ", __size);
          }
          strlcat(v7, (const char *)v10[3], __size);
          char v28 = 1;
        }
        v10 += 5;
        --v9;
      }
      while (v9);
    }
    else
    {
      v29 = (const char **)(v10 + 1);
      do
      {
        if (((unint64_t)*(v29 - 1) & v21) != 0)
        {
          if (v28) {
            strlcat(v7, " | ", __size);
          }
          strlcat(v7, *v29, __size);
          char v28 = 1;
        }
        v29 += 5;
        --v9;
      }
      while (v9);
    }
  }
  if (v22)
  {
    if (v28) {
      strlcat(v7, " | ", __size);
    }
    goto LABEL_45;
  }
  return v7;
}

char *dy_string_from_pipeline_stages(unsigned int a1, int a2, char *__s, size_t __size)
{
  size_t v4 = __size;
  uint8x8_t v5 = __s;
  if (a1 == -1)
  {
    if (!__s)
    {
      size_t v4 = 8;
      uint8x8_t v5 = (char *)malloc_type_malloc(8uLL, 0x529859A1uLL);
    }
    if (a2) {
      unint64_t v8 = "AllShaders";
    }
    else {
      unint64_t v8 = "GL_ALL_SHADER_BITS";
    }
    strlcpy(v5, v8, v4);
    return v5;
  }
  else
  {
    return format_bitfield(dy_string_from_pipeline_stages_pipeline_stages_bits, 5, a1, a2, __s, __size);
  }
}

char *dy_string_from_map_buffer_range_access(unsigned int a1, char a2, char *__s, size_t __size)
{
  return format_bitfield(dy_string_from_map_buffer_range_access_map_buffer_range_access_bits, 6, a1, a2, __s, __size);
}

char *dy_string_from_sync_flags(unsigned int a1, char a2, char *__s, size_t __size)
{
  return format_bitfield(dy_string_from_sync_flags_sync_flags_bits, 1, a1, a2, __s, __size);
}

char *dy_string_from_client_attrib_mask(unsigned int a1, int a2, char *__s, size_t __size)
{
  size_t v4 = __size;
  uint8x8_t v5 = __s;
  if (a1 == -1)
  {
    if (!__s)
    {
      size_t v4 = 8;
      uint8x8_t v5 = (char *)malloc_type_malloc(8uLL, 0xC7640EDDuLL);
    }
    if (a2) {
      unint64_t v8 = "ClientAllAttribs";
    }
    else {
      unint64_t v8 = "GL_CLIENT_ALL_ATTRIB_BITS";
    }
    strlcpy(v5, v8, v4);
    return v5;
  }
  else
  {
    return format_bitfield(dy_string_from_client_attrib_mask_client_attrib_bits, 2, a1, a2, __s, __size);
  }
}

char *dy_string_from_attrib_mask(unsigned int a1, int a2, char *__s, size_t __size)
{
  size_t v4 = __size;
  uint8x8_t v5 = __s;
  if (a1 == 0xFFFFF)
  {
    if (!__s)
    {
      size_t v4 = 8;
      uint8x8_t v5 = (char *)malloc_type_malloc(8uLL, 0x95EDDC42uLL);
    }
    if (a2) {
      uint64_t v7 = "AllAttribs";
    }
    else {
      uint64_t v7 = "GL_ALL_ATTRIB_BITS";
    }
    strlcpy(v5, v7, v4);
    return v5;
  }
  else
  {
    return format_bitfield(dy_string_from_attrib_mask_attrib_bits, 20, a1, a2, __s, __size);
  }
}

const char *dy_glsl_type_string_from_enum(int a1)
{
  if (a1 > 35663)
  {
    switch(a1)
    {
      case 35664:
        result = "vec2";
        break;
      case 35665:
        result = "vec3";
        break;
      case 35666:
        result = "vec4";
        break;
      case 35667:
        result = "ivec2";
        break;
      case 35668:
        result = "ivec3";
        break;
      case 35669:
        result = "ivec4";
        break;
      case 35670:
        result = "BOOL";
        break;
      case 35671:
        result = "bvec2";
        break;
      case 35672:
        result = "bvec3";
        break;
      case 35673:
        result = "bvec4";
        break;
      case 35674:
        result = "mat2";
        break;
      case 35675:
        result = "mat3";
        break;
      case 35676:
        result = "mat4";
        break;
      case 35677:
      case 35681:
      case 35683:
      case 35684:
        return "Unknown";
      case 35678:
        result = "sampler2D";
        break;
      case 35679:
        result = "sampler3D";
        break;
      case 35680:
        result = "samplerCube";
        break;
      case 35682:
        result = "sampler2DShadow";
        break;
      case 35685:
        result = "mat2x3";
        break;
      case 35686:
        result = "mat2x4";
        break;
      case 35687:
        result = "mat3x2";
        break;
      case 35688:
        result = "mat3x4";
        break;
      case 35689:
        result = "mat4x2";
        break;
      case 35690:
        result = "mat4x3";
        break;
      default:
        switch(a1)
        {
          case 36289:
            result = "sampler2DArray";
            break;
          case 36292:
            result = "sampler2DArrayShadow";
            break;
          case 36293:
            result = "samplerCubeShadow";
            break;
          case 36294:
            result = "uvec2";
            break;
          case 36295:
            result = "uvec3";
            break;
          case 36296:
            result = "uvec4";
            break;
          case 36298:
            result = "isampler2D";
            break;
          case 36299:
            result = "isampler3D";
            break;
          case 36300:
            result = "isamplerCube";
            break;
          case 36303:
            result = "isampler2DArray";
            break;
          case 36306:
            result = "usampler2D";
            break;
          case 36307:
            result = "usampler3D";
            break;
          case 36308:
            result = "usamplerCube";
            break;
          case 36311:
            result = "usampler2DArray";
            break;
          default:
            return "Unknown";
        }
        break;
    }
  }
  else
  {
    switch(a1)
    {
      case 5124:
        return "int";
      case 5125:
        return "uint";
      case 5126:
        return "float";
      default:
        return "Unknown";
    }
  }
  return result;
}

const char *dy_short_tex_target_string_from_enum(int a1)
{
  if (a1 > 34066)
  {
    if (a1 != 35866)
    {
      if (a1 == 34067) {
        return "Cube Map";
      }
      return "Unknown";
    }
    return "2D Array";
  }
  else
  {
    if (a1 != 3553)
    {
      if (a1 == 32879) {
        return "3D";
      }
      return "Unknown";
    }
    return "2D";
  }
}

const char *dy_short_cube_face_string_from_enum(int a1)
{
  if ((a1 - 34069) > 5) {
    return "Unknown";
  }
  else {
    return off_26532CCA0[a1 - 34069];
  }
}

const char *dy_binding_point_string_from_enum(int a1)
{
  if (a1 > 35724)
  {
    if (a1 > 36388)
    {
      switch(a1)
      {
        case 36389:
          return "Transform Feedback";
        case 36662:
          return "Copy Read Buffer";
        case 36663:
          return "Copy Write Buffer";
        default:
          return "Unknown";
      }
    }
    else
    {
      int v2 = a1 - 35983;
      result = "Draw Framebuffer";
      switch(v2)
      {
        case 0:
          result = "Transform Feedback Buffer";
          break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 25:
        case 26:
          return "Unknown";
        case 23:
          return result;
        case 24:
          result = "Renderbuffer";
          break;
        case 27:
          result = "Read Framebuffer";
          break;
        default:
          if ("Draw Framebuffer" != 35725) {
            return "Unknown";
          }
          result = "Current Program";
          break;
      }
    }
  }
  else if (a1 > 35052)
  {
    if (a1 > 35096)
    {
      if (a1 != 35097)
      {
        if (a1 == 35368) {
          return "Uniform Buffer";
        }
        return "Unknown";
      }
      return "Sampler";
    }
    else
    {
      if (a1 != 35053)
      {
        if (a1 == 35055) {
          return "Pixel Unpack Buffer";
        }
        return "Unknown";
      }
      return "Pixel Pack Buffer";
    }
  }
  else if (a1 > 34963)
  {
    if (a1 != 34964)
    {
      if (a1 == 34965) {
        return "Element Array Buffer";
      }
      return "Unknown";
    }
    return "Array Buffer";
  }
  else
  {
    if (a1 != 33370)
    {
      if (a1 == 34229) {
        return "Vertex Array";
      }
      return "Unknown";
    }
    return "Program Pipeline";
  }
  return result;
}

const char *dy_buffer_string_from_enum(int a1)
{
  if (a1 > 35344)
  {
    if (a1 > 36661)
    {
      if (a1 == 36663) {
        return "Copy Write Buffer";
      }
      if (a1 == 36662) {
        return "Copy Read Buffer";
      }
    }
    else
    {
      if (a1 == 35345) {
        return "Uniform Buffer";
      }
      if (a1 == 35982) {
        return "TF Buffer";
      }
    }
  }
  else if (a1 > 35050)
  {
    if (a1 == 35051) {
      return "Pixel Pack Buffer";
    }
    if (a1 == 35052) {
      return "Pixel Unpack Buffer";
    }
  }
  else
  {
    if (a1 == 34962) {
      return "Array Buffer";
    }
    if (a1 == 34963) {
      return "Element Array Buffer";
    }
  }
  return "Buffer";
}

const char *dy_query_target_string_from_enum(int a1)
{
  v1 = (const char *)&unk_24F5F0846;
  if (a1 == 36202) {
    v1 = "Any Samples Passed Conservative";
  }
  if (a1 == 35976) {
    int v2 = "Transform Feedback Primitives Written";
  }
  else {
    int v2 = v1;
  }
  if (a1 == 35887) {
    return "Any Samples Passed";
  }
  else {
    return v2;
  }
}

void sub_24F5AD980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24F5AF218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_24F5B0648(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

uint64_t DYGetGLGuestAppClient()
{
  uint64_t result = _guestAppClientGL;
  if (!_guestAppClientGL) {
    __assert_rtn("DYGuestAppClient *DYGetGLGuestAppClient()", (const char *)&unk_24F5F0846, 0, "_guestAppClientGL != nil");
  }
  return result;
}

id DYSetGLGuestAppClient(void *a1)
{
  id result = a1;
  _guestAppClientGL = (uint64_t)result;
  return result;
}

uint64_t DYSetContextRemappingBlock(uint64_t a1)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v2 = g_interpose_api;
  return MEMORY[0x270F2DC50](a1, v2);
}

uint64_t init_interpose_api(void *a1)
{
  v1 = (const char *)DYGetGLInterposeDylibPath();
  uint64_t v2 = dlopen(v1, 272);
  if (!v2)
  {
    dlerror();
    dy_abort();
LABEL_20:
    uint64_t v5 = dy_abort();
    return DYHarvestRenderbuffer(v5);
  }
  int8x8_t v3 = v2;
  g_interpose_api = dlsym(v2, "add_per_function_profiling_data");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "HarvestRenderbuffer");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "HarvestRenderbufferInfo");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = (uint64_t (*)(void))dlsym(v3, "ReserveGLObjectsAPI");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "ReserveGLVAOsAPI");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "ReserveGLProgramAPI");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "ReserveGLShaderAPI");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "ReserveGLFenceSyncAPI");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "CreatePrivateGLProgram");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "CreatePrivateGLShader");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = dlsym(v3, "CreatePrivateGLProgramPipeline");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = (uint64_t)dlsym(v3, "gDYContextRemappingBlock");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = (uint64_t)dlsym(v3, "gDYResourceUpdateCallbackBlock");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  g_interpose_api = (uint64_t)dlsym(v3, "gEncodeNameReservationSPI");
  if (!g_interpose_api) {
    goto LABEL_20;
  }
  return dlclose(v3);
}

uint64_t DYHarvestRenderbuffer(uint64_t a1, uint64_t a2)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  size_t v4 = (uint64_t (*)(uint64_t, uint64_t))g_interpose_api;
  return v4(a1, a2);
}

uint64_t DYHarvestRenderbufferInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))g_interpose_api;
  return v8(a1, a2, a3, a4);
}

uint64_t DYAddPerFunctionProfilingData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))g_interpose_api;
  return v6(a1, a2, a3);
}

void DYSetNameReservationEncoding(char a1)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  *(unsigned char *)g_interpose_api = a1;
}

uint64_t DYReserveGLObjects()
{
  return g_interpose_api();
}

uint64_t DYReserveGLVAOs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))g_interpose_api;
  return v6(a1, a2, a3);
}

uint64_t DYReserveGLProgram(uint64_t a1, uint64_t a2)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  size_t v4 = (uint64_t (*)(uint64_t, uint64_t))g_interpose_api;
  return v4(a1, a2);
}

uint64_t DYReserveGLShader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))g_interpose_api;
  return v6(a1, a2, a3);
}

uint64_t DYReserveGLFenceSync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  unint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))g_interpose_api;
  return v8(a1, a2, a3, a4);
}

uint64_t DYCreatePrivateGLProgram(uint64_t a1)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v2 = (uint64_t (*)(uint64_t))g_interpose_api;
  return v2(a1);
}

uint64_t DYCreatePrivateGLShader(uint64_t a1, uint64_t a2)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  size_t v4 = (uint64_t (*)(uint64_t, uint64_t))g_interpose_api;
  return v4(a1, a2);
}

uint64_t DYCreatePrivateGLProgramPipeline(uint64_t a1)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v2 = (uint64_t (*)(uint64_t))g_interpose_api;
  return v2(a1);
}

uint64_t DYSetResourceUpdateCallbackBlock(uint64_t a1)
{
  if (g_interpose_api_once != -1) {
    dispatch_once_f(&g_interpose_api_once, 0, (dispatch_function_t)init_interpose_api);
  }
  uint64_t v2 = g_interpose_api;
  return MEMORY[0x270F2DC50](a1, v2);
}

const char *dy_string_from_enum(int a1)
{
  if (a1 > 24719)
  {
    if (a1 < 0x10000)
    {
      switch(a1)
      {
        case 24720:
          id result = "GL_PN_TRIANGLES_ATI";
          break;
        case 24721:
          id result = "GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI";
          break;
        case 24722:
          id result = "GL_PN_TRIANGLES_POINT_MODE_ATI";
          break;
        case 24723:
          id result = "GL_PN_TRIANGLES_NORMAL_MODE_ATI";
          break;
        case 24724:
          id result = "GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI";
          break;
        case 24725:
          id result = "GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI";
          break;
        case 24726:
          id result = "GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI";
          break;
        case 24727:
          id result = "GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI";
          break;
        case 24728:
          id result = "GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI";
          break;
        case 24755:
          id result = "GL_POINT_CULL_MODE_ATI";
          break;
        case 24756:
          id result = "GL_POINT_CULL_CENTER_ATI";
          break;
        case 24757:
          id result = "GL_POINT_CULL_CLIP_ATI";
          break;
        case 32768:
          id result = "GL_ABGR_EXT";
          break;
        case 32769:
          id result = "GL_CONSTANT_COLOR";
          break;
        case 32770:
          id result = "GL_ONE_MINUS_CONSTANT_COLOR";
          break;
        case 32771:
          id result = "GL_CONSTANT_ALPHA";
          break;
        case 32772:
          id result = "GL_ONE_MINUS_CONSTANT_ALPHA";
          break;
        case 32773:
          id result = "GL_BLEND_COLOR";
          break;
        case 32774:
          id result = "GL_FUNC_ADD";
          break;
        case 32775:
          id result = "GL_MIN";
          break;
        case 32776:
          id result = "GL_MAX";
          break;
        case 32777:
          id result = "GL_BLEND_EQUATION_RGB";
          break;
        case 32778:
          id result = "GL_FUNC_SUBTRACT";
          break;
        case 32779:
          id result = "GL_FUNC_REVERSE_SUBTRACT";
          break;
        case 32784:
          id result = "GL_CONVOLUTION_1D";
          break;
        case 32785:
          id result = "GL_CONVOLUTION_2D";
          break;
        case 32786:
          id result = "GL_SEPARABLE_2D";
          break;
        case 32787:
          id result = "GL_CONVOLUTION_BORDER_MODE";
          break;
        case 32788:
          id result = "GL_CONVOLUTION_FILTER_SCALE";
          break;
        case 32789:
          id result = "GL_CONVOLUTION_FILTER_BIAS";
          break;
        case 32790:
          id result = "GL_REDUCE";
          break;
        case 32791:
          id result = "GL_CONVOLUTION_FORMAT";
          break;
        case 32792:
          id result = "GL_CONVOLUTION_WIDTH";
          break;
        case 32793:
          id result = "GL_CONVOLUTION_HEIGHT";
          break;
        case 32794:
          id result = "GL_MAX_CONVOLUTION_WIDTH";
          break;
        case 32795:
          id result = "GL_MAX_CONVOLUTION_HEIGHT";
          break;
        case 32796:
          id result = "GL_POST_CONVOLUTION_RED_SCALE";
          break;
        case 32797:
          id result = "GL_POST_CONVOLUTION_GREEN_SCALE";
          break;
        case 32798:
          id result = "GL_POST_CONVOLUTION_BLUE_SCALE";
          break;
        case 32799:
          id result = "GL_POST_CONVOLUTION_ALPHA_SCALE";
          break;
        case 32800:
          id result = "GL_POST_CONVOLUTION_RED_BIAS";
          break;
        case 32801:
          id result = "GL_POST_CONVOLUTION_GREEN_BIAS";
          break;
        case 32802:
          id result = "GL_POST_CONVOLUTION_BLUE_BIAS";
          break;
        case 32803:
          id result = "GL_POST_CONVOLUTION_ALPHA_BIAS";
          break;
        case 32804:
          id result = "GL_HISTOGRAM";
          break;
        case 32805:
          id result = "GL_PROXY_HISTOGRAM";
          break;
        case 32806:
          id result = "GL_HISTOGRAM_WIDTH";
          break;
        case 32807:
          id result = "GL_HISTOGRAM_FORMAT";
          break;
        case 32808:
          id result = "GL_HISTOGRAM_RED_SIZE";
          break;
        case 32809:
          id result = "GL_HISTOGRAM_GREEN_SIZE";
          break;
        case 32810:
          id result = "GL_HISTOGRAM_BLUE_SIZE";
          break;
        case 32811:
          id result = "GL_HISTOGRAM_ALPHA_SIZE";
          break;
        case 32812:
          id result = "GL_HISTOGRAM_LUMINANCE_SIZE";
          break;
        case 32813:
          id result = "GL_HISTOGRAM_SINK";
          break;
        case 32814:
          id result = "GL_MINMAX";
          break;
        case 32815:
          id result = "GL_MINMAX_FORMAT";
          break;
        case 32816:
          id result = "GL_MINMAX_SINK";
          break;
        case 32817:
          id result = "GL_TABLE_TOO_LARGE";
          break;
        case 32818:
          id result = "GL_UNSIGNED_BYTE_3_3_2";
          break;
        case 32819:
          id result = "GL_UNSIGNED_SHORT_4_4_4_4";
          break;
        case 32820:
          id result = "GL_UNSIGNED_SHORT_5_5_5_1";
          break;
        case 32821:
          id result = "GL_UNSIGNED_INT_8_8_8_8";
          break;
        case 32822:
          id result = "GL_UNSIGNED_INT_10_10_10_2";
          break;
        case 32823:
          id result = "GL_POLYGON_OFFSET_FILL";
          break;
        case 32824:
          id result = "GL_POLYGON_OFFSET_FACTOR";
          break;
        case 32825:
          id result = "GL_POLYGON_OFFSET_BIAS_EXT";
          break;
        case 32826:
          id result = "GL_RESCALE_NORMAL";
          break;
        case 32827:
          id result = "GL_ALPHA4";
          break;
        case 32828:
          id result = "GL_ALPHA8";
          break;
        case 32829:
          id result = "GL_ALPHA12";
          break;
        case 32830:
          id result = "GL_ALPHA16";
          break;
        case 32831:
          id result = "GL_LUMINANCE4";
          break;
        case 32832:
          id result = "GL_LUMINANCE8";
          break;
        case 32833:
          id result = "GL_LUMINANCE12";
          break;
        case 32834:
          id result = "GL_LUMINANCE16";
          break;
        case 32835:
          id result = "GL_LUMINANCE4_ALPHA4";
          break;
        case 32836:
          id result = "GL_LUMINANCE6_ALPHA2";
          break;
        case 32837:
          id result = "GL_LUMINANCE8_ALPHA8";
          break;
        case 32838:
          id result = "GL_LUMINANCE12_ALPHA4";
          break;
        case 32839:
          id result = "GL_LUMINANCE12_ALPHA12";
          break;
        case 32840:
          id result = "GL_LUMINANCE16_ALPHA16";
          break;
        case 32841:
          id result = "GL_INTENSITY";
          break;
        case 32842:
          id result = "GL_INTENSITY4";
          break;
        case 32843:
          id result = "GL_INTENSITY8";
          break;
        case 32844:
          id result = "GL_INTENSITY12";
          break;
        case 32845:
          id result = "GL_INTENSITY16";
          break;
        case 32846:
          id result = "GL_RGB2_EXT";
          break;
        case 32847:
          id result = "GL_RGB4";
          break;
        case 32848:
          id result = "GL_RGB5";
          break;
        case 32849:
          id result = "GL_RGB8";
          break;
        case 32850:
          id result = "GL_RGB10";
          break;
        case 32851:
          id result = "GL_RGB12";
          break;
        case 32852:
          id result = "GL_RGB16";
          break;
        case 32853:
          id result = "GL_RGBA2";
          break;
        case 32854:
          id result = "GL_RGBA4";
          break;
        case 32855:
          id result = "GL_RGB5_A1";
          break;
        case 32856:
          id result = "GL_RGBA8";
          break;
        case 32857:
          id result = "GL_RGB10_A2";
          break;
        case 32858:
          id result = "GL_RGBA12";
          break;
        case 32859:
          id result = "GL_RGBA16";
          break;
        case 32860:
          id result = "GL_TEXTURE_RED_SIZE";
          break;
        case 32861:
          id result = "GL_TEXTURE_GREEN_SIZE";
          break;
        case 32862:
          id result = "GL_TEXTURE_BLUE_SIZE";
          break;
        case 32863:
          id result = "GL_TEXTURE_ALPHA_SIZE";
          break;
        case 32864:
          id result = "GL_TEXTURE_LUMINANCE_SIZE";
          break;
        case 32865:
          id result = "GL_TEXTURE_INTENSITY_SIZE";
          break;
        case 32866:
          id result = "GL_REPLACE_EXT";
          break;
        case 32867:
          id result = "GL_PROXY_TEXTURE_1D";
          break;
        case 32868:
          id result = "GL_PROXY_TEXTURE_2D";
          break;
        case 32869:
          id result = "GL_TEXTURE_TOO_LARGE_EXT";
          break;
        case 32870:
          id result = "GL_TEXTURE_PRIORITY";
          break;
        case 32871:
          id result = "GL_TEXTURE_RESIDENT";
          break;
        case 32872:
          id result = "GL_TEXTURE_BINDING_1D";
          break;
        case 32873:
          id result = "GL_TEXTURE_BINDING_2D";
          break;
        case 32874:
          id result = "GL_TEXTURE_BINDING_3D";
          break;
        case 32875:
          id result = "GL_PACK_SKIP_IMAGES";
          break;
        case 32876:
          id result = "GL_PACK_IMAGE_HEIGHT";
          break;
        case 32877:
          id result = "GL_UNPACK_SKIP_IMAGES";
          break;
        case 32878:
          id result = "GL_UNPACK_IMAGE_HEIGHT";
          break;
        case 32879:
          id result = "GL_TEXTURE_3D";
          break;
        case 32880:
          id result = "GL_PROXY_TEXTURE_3D";
          break;
        case 32881:
          id result = "GL_TEXTURE_DEPTH";
          break;
        case 32882:
          id result = "GL_TEXTURE_WRAP_R";
          break;
        case 32883:
          id result = "GL_MAX_3D_TEXTURE_SIZE";
          break;
        case 32884:
          id result = "GL_VERTEX_ARRAY";
          break;
        case 32885:
          id result = "GL_NORMAL_ARRAY";
          break;
        case 32886:
          id result = "GL_COLOR_ARRAY";
          break;
        case 32887:
          id result = "GL_INDEX_ARRAY";
          break;
        case 32888:
          id result = "GL_TEXTURE_COORD_ARRAY";
          break;
        case 32889:
          id result = "GL_EDGE_FLAG_ARRAY";
          break;
        case 32890:
          id result = "GL_VERTEX_ARRAY_SIZE";
          break;
        case 32891:
          id result = "GL_VERTEX_ARRAY_TYPE";
          break;
        case 32892:
          id result = "GL_VERTEX_ARRAY_STRIDE";
          break;
        case 32893:
          id result = "GL_VERTEX_ARRAY_COUNT_EXT";
          break;
        case 32894:
          id result = "GL_NORMAL_ARRAY_TYPE";
          break;
        case 32895:
          id result = "GL_NORMAL_ARRAY_STRIDE";
          break;
        case 32896:
          id result = "GL_NORMAL_ARRAY_COUNT_EXT";
          break;
        case 32897:
          id result = "GL_COLOR_ARRAY_SIZE";
          break;
        case 32898:
          id result = "GL_COLOR_ARRAY_TYPE";
          break;
        case 32899:
          id result = "GL_COLOR_ARRAY_STRIDE";
          break;
        case 32900:
          id result = "GL_COLOR_ARRAY_COUNT_EXT";
          break;
        case 32901:
          id result = "GL_INDEX_ARRAY_TYPE";
          break;
        case 32902:
          id result = "GL_INDEX_ARRAY_STRIDE";
          break;
        case 32903:
          id result = "GL_INDEX_ARRAY_COUNT_EXT";
          break;
        case 32904:
          id result = "GL_TEXTURE_COORD_ARRAY_SIZE";
          break;
        case 32905:
          id result = "GL_TEXTURE_COORD_ARRAY_TYPE";
          break;
        case 32906:
          id result = "GL_TEXTURE_COORD_ARRAY_STRIDE";
          break;
        case 32907:
          id result = "GL_TEXTURE_COORD_ARRAY_COUNT_EXT";
          break;
        case 32908:
          id result = "GL_EDGE_FLAG_ARRAY_STRIDE";
          break;
        case 32909:
          id result = "GL_EDGE_FLAG_ARRAY_COUNT_EXT";
          break;
        case 32910:
          id result = "GL_VERTEX_ARRAY_POINTER";
          break;
        case 32911:
          id result = "GL_NORMAL_ARRAY_POINTER";
          break;
        case 32912:
          id result = "GL_COLOR_ARRAY_POINTER";
          break;
        case 32913:
          id result = "GL_INDEX_ARRAY_POINTER";
          break;
        case 32914:
          id result = "GL_TEXTURE_COORD_ARRAY_POINTER";
          break;
        case 32915:
          id result = "GL_EDGE_FLAG_ARRAY_POINTER";
          break;
        case 32925:
          id result = "GL_MULTISAMPLE";
          break;
        case 32926:
          id result = "GL_SAMPLE_ALPHA_TO_COVERAGE";
          break;
        case 32927:
          id result = "GL_SAMPLE_ALPHA_TO_ONE";
          break;
        case 32928:
          id result = "GL_SAMPLE_COVERAGE";
          break;
        case 32936:
          id result = "GL_SAMPLE_BUFFERS";
          break;
        case 32937:
          id result = "GL_SAMPLES";
          break;
        case 32938:
          id result = "GL_SAMPLE_COVERAGE_VALUE";
          break;
        case 32939:
          id result = "GL_SAMPLE_COVERAGE_INVERT";
          break;
        case 32945:
          id result = "GL_COLOR_MATRIX";
          break;
        case 32946:
          id result = "GL_COLOR_MATRIX_STACK_DEPTH";
          break;
        case 32947:
          id result = "GL_MAX_COLOR_MATRIX_STACK_DEPTH";
          break;
        case 32948:
          id result = "GL_POST_COLOR_MATRIX_RED_SCALE";
          break;
        case 32949:
          id result = "GL_POST_COLOR_MATRIX_GREEN_SCALE";
          break;
        case 32950:
          id result = "GL_POST_COLOR_MATRIX_BLUE_SCALE";
          break;
        case 32951:
          id result = "GL_POST_COLOR_MATRIX_ALPHA_SCALE";
          break;
        case 32952:
          id result = "GL_POST_COLOR_MATRIX_RED_BIAS";
          break;
        case 32953:
          id result = "GL_POST_COLOR_MATRIX_GREEN_BIAS";
          break;
        case 32954:
          id result = "GL_POST_COLOR_MATRIX_BLUE_BIAS";
          break;
        case 32955:
          id result = "GL_POST_COLOR_MATRIX_ALPHA_BIAS";
          break;
        case 32959:
          id result = "GL_TEXTURE_COMPARE_FAIL_VALUE_ARB";
          break;
        case 32968:
          id result = "GL_BLEND_DST_RGB";
          break;
        case 32969:
          id result = "GL_BLEND_SRC_RGB";
          break;
        case 32970:
          id result = "GL_BLEND_DST_ALPHA";
          break;
        case 32971:
          id result = "GL_BLEND_SRC_ALPHA";
          break;
        case 32976:
          id result = "GL_COLOR_TABLE";
          break;
        case 32977:
          id result = "GL_POST_CONVOLUTION_COLOR_TABLE";
          break;
        case 32978:
          id result = "GL_POST_COLOR_MATRIX_COLOR_TABLE";
          break;
        case 32979:
          id result = "GL_PROXY_COLOR_TABLE";
          break;
        case 32980:
          id result = "GL_PROXY_POST_CONVOLUTION_COLOR_TABLE";
          break;
        case 32981:
          id result = "GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE";
          break;
        case 32982:
          id result = "GL_COLOR_TABLE_SCALE";
          break;
        case 32983:
          id result = "GL_COLOR_TABLE_BIAS";
          break;
        case 32984:
          id result = "GL_COLOR_TABLE_FORMAT";
          break;
        case 32985:
          id result = "GL_COLOR_TABLE_WIDTH";
          break;
        case 32986:
          id result = "GL_COLOR_TABLE_RED_SIZE";
          break;
        case 32987:
          id result = "GL_COLOR_TABLE_GREEN_SIZE";
          break;
        case 32988:
          id result = "GL_COLOR_TABLE_BLUE_SIZE";
          break;
        case 32989:
          id result = "GL_COLOR_TABLE_ALPHA_SIZE";
          break;
        case 32990:
          id result = "GL_COLOR_TABLE_LUMINANCE_SIZE";
          break;
        case 32991:
          id result = "GL_COLOR_TABLE_INTENSITY_SIZE";
          break;
        case 32992:
          id result = "GL_BGR";
          break;
        case 32993:
          id result = "GL_BGRA";
          break;
        case 32994:
          id result = "GL_COLOR_INDEX1_EXT";
          break;
        case 32995:
          id result = "GL_COLOR_INDEX2_EXT";
          break;
        case 32996:
          id result = "GL_COLOR_INDEX4_EXT";
          break;
        case 32997:
          id result = "GL_COLOR_INDEX8_EXT";
          break;
        case 32998:
          id result = "GL_COLOR_INDEX12_EXT";
          break;
        case 32999:
          id result = "GL_COLOR_INDEX16_EXT";
          break;
        case 33000:
          id result = "GL_MAX_ELEMENTS_VERTICES";
          break;
        case 33001:
          id result = "GL_MAX_ELEMENTS_INDICES";
          break;
        case 33005:
          id result = "GL_TEXTURE_INDEX_SIZE_EXT";
          break;
        case 33008:
          id result = "GL_CLIP_VOLUME_CLIPPING_HINT_EXT";
          break;
        case 33062:
          id result = "GL_POINT_SIZE_MIN";
          break;
        case 33063:
          id result = "GL_POINT_SIZE_MAX";
          break;
        case 33064:
          id result = "GL_POINT_FADE_THRESHOLD_SIZE";
          break;
        case 33065:
          id result = "GL_POINT_DISTANCE_ATTENUATION";
          break;
        case 33069:
          id result = "GL_CLAMP_TO_BORDER";
          break;
        case 33071:
          id result = "GL_CLAMP_TO_EDGE";
          break;
        case 33082:
          id result = "GL_TEXTURE_MIN_LOD";
          break;
        case 33083:
          id result = "GL_TEXTURE_MAX_LOD";
          break;
        case 33084:
          id result = "GL_TEXTURE_BASE_LEVEL";
          break;
        case 33085:
          id result = "GL_TEXTURE_MAX_LEVEL";
          break;
        case 33104:
          id result = "GL_IGNORE_BORDER_HP";
          break;
        case 33105:
          id result = "GL_CONSTANT_BORDER";
          break;
        case 33107:
          id result = "GL_REPLICATE_BORDER";
          break;
        case 33108:
          id result = "GL_CONVOLUTION_BORDER_COLOR";
          break;
        case 33169:
          id result = "GL_GENERATE_MIPMAP";
          break;
        case 33170:
          id result = "GL_GENERATE_MIPMAP_HINT";
          break;
        case 33189:
          id result = "GL_DEPTH_COMPONENT16";
          break;
        case 33190:
          id result = "GL_DEPTH_COMPONENT24";
          break;
        case 33191:
          id result = "GL_DEPTH_COMPONENT32";
          break;
        case 33192:
          id result = "GL_ARRAY_ELEMENT_LOCK_FIRST_EXT";
          break;
        case 33193:
          id result = "GL_ARRAY_ELEMENT_LOCK_COUNT_EXT";
          break;
        case 33272:
          id result = "GL_LIGHT_MODEL_COLOR_CONTROL";
          break;
        case 33273:
          id result = "GL_SINGLE_COLOR";
          break;
        case 33274:
          id result = "GL_SEPARATE_SPECULAR_COLOR";
          break;
        case 33275:
          id result = "GL_SHARED_TEXTURE_PALETTE_EXT";
          break;
        case 33280:
          id result = "GL_TEXT_FRAGMENT_SHADER_ATI";
          break;
        case 33296:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING";
          break;
        case 33297:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE";
          break;
        case 33298:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE";
          break;
        case 33299:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE";
          break;
        case 33300:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE";
          break;
        case 33301:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE";
          break;
        case 33302:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE";
          break;
        case 33303:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE";
          break;
        case 33304:
          id result = "GL_FRAMEBUFFER_DEFAULT";
          break;
        case 33305:
          id result = "GL_FRAMEBUFFER_UNDEFINED";
          break;
        case 33306:
          id result = "GL_DEPTH_STENCIL_ATTACHMENT";
          break;
        case 33307:
          id result = "GL_MAJOR_VERSION";
          break;
        case 33308:
          id result = "GL_MINOR_VERSION";
          break;
        case 33309:
          id result = "GL_NUM_EXTENSIONS";
          break;
        case 33310:
          id result = "GL_CONTEXT_FLAGS";
          break;
        case 33317:
          id result = "GL_COMPRESSED_RED";
          break;
        case 33318:
          id result = "GL_COMPRESSED_RG";
          break;
        case 33319:
          id result = "GL_RG";
          break;
        case 33320:
          id result = "GL_RG_INTEGER";
          break;
        case 33321:
          id result = "GL_R8";
          break;
        case 33322:
          id result = "GL_R16";
          break;
        case 33323:
          id result = "GL_RG8";
          break;
        case 33324:
          id result = "GL_RG16";
          break;
        case 33325:
          id result = "GL_R16F";
          break;
        case 33326:
          id result = "GL_R32F";
          break;
        case 33327:
          id result = "GL_RG16F";
          break;
        case 33328:
          id result = "GL_RG32F";
          break;
        case 33329:
          id result = "GL_R8I";
          break;
        case 33330:
          id result = "GL_R8UI";
          break;
        case 33331:
          id result = "GL_R16I";
          break;
        case 33332:
          id result = "GL_R16UI";
          break;
        case 33333:
          id result = "GL_R32I";
          break;
        case 33334:
          id result = "GL_R32UI";
          break;
        case 33335:
          id result = "GL_RG8I";
          break;
        case 33336:
          id result = "GL_RG8UI";
          break;
        case 33337:
          id result = "GL_RG16I";
          break;
        case 33338:
          id result = "GL_RG16UI";
          break;
        case 33339:
          id result = "GL_RG32I";
          break;
        case 33340:
          id result = "GL_RG32UI";
          break;
        case 33344:
          id result = "GL_SYNC_CL_EVENT_ARB";
          break;
        case 33345:
          id result = "GL_SYNC_CL_EVENT_COMPLETE_ARB";
          break;
        case 33367:
          id result = "GL_PROGRAM_BINARY_RETRIEVABLE_HINT";
          break;
        case 33368:
          id result = "GL_PROGRAM_SEPARABLE";
          break;
        case 33369:
          id result = "GL_ACTIVE_PROGRAM";
          break;
        case 33370:
          id result = "GL_PROGRAM_PIPELINE_BINDING";
          break;
        case 33371:
          id result = "GL_MAX_VIEWPORTS";
          break;
        case 33372:
          id result = "GL_VIEWPORT_SUBPIXEL_BITS";
          break;
        case 33373:
          id result = "GL_VIEWPORT_BOUNDS_RANGE";
          break;
        case 33374:
          id result = "GL_LAYER_PROVOKING_VERTEX";
          break;
        case 33375:
          id result = "GL_VIEWPORT_INDEX_PROVOKING_VERTEX";
          break;
        case 33376:
          id result = "GL_UNDEFINED_VERTEX";
          break;
        case 33503:
          id result = "GL_TEXTURE_IMMUTABLE_LEVELS";
          break;
        case 33510:
          id result = "GL_SAMPLER";
          break;
        case 33634:
          id result = "GL_UNSIGNED_BYTE_2_3_3_REV";
          break;
        case 33635:
          id result = "GL_UNSIGNED_SHORT_5_6_5";
          break;
        case 33636:
          id result = "GL_UNSIGNED_SHORT_5_6_5_REV";
          break;
        case 33637:
          id result = "GL_UNSIGNED_SHORT_4_4_4_4_REV";
          break;
        case 33638:
          id result = "GL_UNSIGNED_SHORT_1_5_5_5_REV";
          break;
        case 33639:
          id result = "GL_UNSIGNED_INT_8_8_8_8_REV";
          break;
        case 33640:
          id result = "GL_UNSIGNED_INT_2_10_10_10_REV";
          break;
        case 33648:
          id result = "GL_MIRRORED_REPEAT";
          break;
        case 33776:
          id result = "GL_COMPRESSED_RGB_S3TC_DXT1_EXT";
          break;
        case 33777:
          id result = "GL_COMPRESSED_RGBA_S3TC_DXT1_EXT";
          break;
        case 33778:
          id result = "GL_COMPRESSED_RGBA_S3TC_DXT3_EXT";
          break;
        case 33779:
          id result = "GL_COMPRESSED_RGBA_S3TC_DXT5_EXT";
          break;
        case 33872:
          id result = "GL_FOG_COORD_SRC";
          break;
        case 33873:
          id result = "GL_FOG_COORD";
          break;
        case 33874:
          id result = "GL_FRAGMENT_DEPTH";
          break;
        case 33875:
          id result = "GL_CURRENT_FOG_COORDINATE_EXT";
          break;
        case 33876:
          id result = "GL_FOG_COORD_ARRAY_TYPE";
          break;
        case 33877:
          id result = "GL_FOG_COORD_ARRAY_STRIDE";
          break;
        case 33878:
          id result = "GL_FOG_COORD_ARRAY_POINTER";
          break;
        case 33879:
          id result = "GL_FOG_COORD_ARRAY";
          break;
        case 33880:
          id result = "GL_COLOR_SUM";
          break;
        case 33881:
          id result = "GL_CURRENT_SECONDARY_COLOR";
          break;
        case 33882:
          id result = "GL_SECONDARY_COLOR_ARRAY_SIZE";
          break;
        case 33883:
          id result = "GL_SECONDARY_COLOR_ARRAY_TYPE";
          break;
        case 33884:
          id result = "GL_SECONDARY_COLOR_ARRAY_STRIDE";
          break;
        case 33885:
          id result = "GL_SECONDARY_COLOR_ARRAY_POINTER";
          break;
        case 33886:
          id result = "GL_SECONDARY_COLOR_ARRAY";
          break;
        case 33887:
          id result = "GL_CURRENT_RASTER_SECONDARY_COLOR";
          break;
        case 33901:
          id result = "GL_ALIASED_POINT_SIZE_RANGE";
          break;
        case 33902:
          id result = "GL_ALIASED_LINE_WIDTH_RANGE";
          break;
        case 33984:
          id result = "GL_TEXTURE0";
          break;
        case 33985:
          id result = "GL_TEXTURE1";
          break;
        case 33986:
          id result = "GL_TEXTURE2";
          break;
        case 33987:
          id result = "GL_TEXTURE3";
          break;
        case 33988:
          id result = "GL_TEXTURE4";
          break;
        case 33989:
          id result = "GL_TEXTURE5";
          break;
        case 33990:
          id result = "GL_TEXTURE6";
          break;
        case 33991:
          id result = "GL_TEXTURE7";
          break;
        case 33992:
          id result = "GL_TEXTURE8";
          break;
        case 33993:
          id result = "GL_TEXTURE9";
          break;
        case 33994:
          id result = "GL_TEXTURE10";
          break;
        case 33995:
          id result = "GL_TEXTURE11";
          break;
        case 33996:
          id result = "GL_TEXTURE12";
          break;
        case 33997:
          id result = "GL_TEXTURE13";
          break;
        case 33998:
          id result = "GL_TEXTURE14";
          break;
        case 33999:
          id result = "GL_TEXTURE15";
          break;
        case 34000:
          id result = "GL_TEXTURE16";
          break;
        case 34001:
          id result = "GL_TEXTURE17";
          break;
        case 34002:
          id result = "GL_TEXTURE18";
          break;
        case 34003:
          id result = "GL_TEXTURE19";
          break;
        case 34004:
          id result = "GL_TEXTURE20";
          break;
        case 34005:
          id result = "GL_TEXTURE21";
          break;
        case 34006:
          id result = "GL_TEXTURE22";
          break;
        case 34007:
          id result = "GL_TEXTURE23";
          break;
        case 34008:
          id result = "GL_TEXTURE24";
          break;
        case 34009:
          id result = "GL_TEXTURE25";
          break;
        case 34010:
          id result = "GL_TEXTURE26";
          break;
        case 34011:
          id result = "GL_TEXTURE27";
          break;
        case 34012:
          id result = "GL_TEXTURE28";
          break;
        case 34013:
          id result = "GL_TEXTURE29";
          break;
        case 34014:
          id result = "GL_TEXTURE30";
          break;
        case 34015:
          id result = "GL_TEXTURE31";
          break;
        case 34016:
          id result = "GL_ACTIVE_TEXTURE";
          break;
        case 34017:
          id result = "GL_CLIENT_ACTIVE_TEXTURE";
          break;
        case 34018:
          id result = "GL_MAX_TEXTURE_UNITS";
          break;
        case 34019:
          id result = "GL_TRANSPOSE_MODELVIEW_MATRIX";
          break;
        case 34020:
          id result = "GL_TRANSPOSE_PROJECTION_MATRIX";
          break;
        case 34021:
          id result = "GL_TRANSPOSE_TEXTURE_MATRIX";
          break;
        case 34022:
          id result = "GL_TRANSPOSE_COLOR_MATRIX";
          break;
        case 34023:
          id result = "GL_SUBTRACT";
          break;
        case 34024:
          id result = "GL_MAX_RENDERBUFFER_SIZE";
          break;
        case 34025:
          id result = "GL_COMPRESSED_ALPHA";
          break;
        case 34026:
          id result = "GL_COMPRESSED_LUMINANCE";
          break;
        case 34027:
          id result = "GL_COMPRESSED_LUMINANCE_ALPHA";
          break;
        case 34028:
          id result = "GL_COMPRESSED_INTENSITY";
          break;
        case 34029:
          id result = "GL_COMPRESSED_RGB";
          break;
        case 34030:
          id result = "GL_COMPRESSED_RGBA";
          break;
        case 34031:
          id result = "GL_TEXTURE_COMPRESSION_HINT";
          break;
        case 34032:
          id result = "GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER";
          break;
        case 34033:
          id result = "GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER";
          break;
        case 34037:
          id result = "GL_TEXTURE_RECTANGLE";
          break;
        case 34038:
          id result = "GL_TEXTURE_BINDING_RECTANGLE";
          break;
        case 34039:
          id result = "GL_PROXY_TEXTURE_RECTANGLE";
          break;
        case 34040:
          id result = "GL_MAX_RECTANGLE_TEXTURE_SIZE";
          break;
        case 34041:
          id result = "GL_DEPTH_STENCIL";
          break;
        case 34042:
          id result = "GL_UNSIGNED_INT_24_8";
          break;
        case 34045:
          id result = "GL_MAX_TEXTURE_LOD_BIAS";
          break;
        case 34046:
          id result = "GL_TEXTURE_MAX_ANISOTROPY_EXT";
          break;
        case 34047:
          id result = "GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT";
          break;
        case 34048:
          id result = "GL_TEXTURE_FILTER_CONTROL";
          break;
        case 34049:
          id result = "GL_TEXTURE_LOD_BIAS";
          break;
        case 34052:
          id result = "GL_MAX_SHININESS_NV";
          break;
        case 34053:
          id result = "GL_MAX_SPOT_EXPONENT_NV";
          break;
        case 34055:
          id result = "GL_INCR_WRAP";
          break;
        case 34056:
          id result = "GL_DECR_WRAP";
          break;
        case 34058:
          id result = "GL_MODELVIEW1_ARB";
          break;
        case 34065:
          id result = "GL_NORMAL_MAP";
          break;
        case 34066:
          id result = "GL_REFLECTION_MAP";
          break;
        case 34067:
          id result = "GL_TEXTURE_CUBE_MAP";
          break;
        case 34068:
          id result = "GL_TEXTURE_BINDING_CUBE_MAP";
          break;
        case 34069:
          id result = "GL_TEXTURE_CUBE_MAP_POSITIVE_X";
          break;
        case 34070:
          id result = "GL_TEXTURE_CUBE_MAP_NEGATIVE_X";
          break;
        case 34071:
          id result = "GL_TEXTURE_CUBE_MAP_POSITIVE_Y";
          break;
        case 34072:
          id result = "GL_TEXTURE_CUBE_MAP_NEGATIVE_Y";
          break;
        case 34073:
          id result = "GL_TEXTURE_CUBE_MAP_POSITIVE_Z";
          break;
        case 34074:
          id result = "GL_TEXTURE_CUBE_MAP_NEGATIVE_Z";
          break;
        case 34075:
          id result = "GL_PROXY_TEXTURE_CUBE_MAP";
          break;
        case 34076:
          id result = "GL_MAX_CUBE_MAP_TEXTURE_SIZE";
          break;
        case 34077:
          id result = "GL_VERTEX_ARRAY_RANGE_APPLE";
          break;
        case 34078:
          id result = "GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE";
          break;
        case 34079:
          id result = "GL_VERTEX_ARRAY_STORAGE_HINT_APPLE";
          break;
        case 34080:
          id result = "GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_APPLE";
          break;
        case 34081:
          id result = "GL_VERTEX_ARRAY_RANGE_POINTER_APPLE";
          break;
        case 34082:
          id result = "GL_REGISTER_COMBINERS_NV";
          break;
        case 34083:
          id result = "GL_VARIABLE_A_NV";
          break;
        case 34084:
          id result = "GL_VARIABLE_B_NV";
          break;
        case 34085:
          id result = "GL_VARIABLE_C_NV";
          break;
        case 34086:
          id result = "GL_VARIABLE_D_NV";
          break;
        case 34087:
          id result = "GL_VARIABLE_E_NV";
          break;
        case 34088:
          id result = "GL_VARIABLE_F_NV";
          break;
        case 34089:
          id result = "GL_VARIABLE_G_NV";
          break;
        case 34090:
          id result = "GL_CONSTANT_COLOR0_NV";
          break;
        case 34091:
          id result = "GL_CONSTANT_COLOR1_NV";
          break;
        case 34092:
          id result = "GL_PRIMARY_COLOR_NV";
          break;
        case 34093:
          id result = "GL_SECONDARY_COLOR_NV";
          break;
        case 34094:
          id result = "GL_SPARE0_NV";
          break;
        case 34095:
          id result = "GL_SPARE1_NV";
          break;
        case 34096:
          id result = "GL_DISCARD_NV";
          break;
        case 34097:
          id result = "GL_E_TIMES_F_NV";
          break;
        case 34098:
          id result = "GL_SPARE0_PLUS_SECONDARY_COLOR_NV";
          break;
        case 34099:
          id result = "GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV";
          break;
        case 34100:
          id result = "GL_MULTISAMPLE_FILTER_HINT_NV";
          break;
        case 34101:
          id result = "GL_PER_STAGE_CONSTANTS_NV";
          break;
        case 34102:
          id result = "GL_UNSIGNED_IDENTITY_NV";
          break;
        case 34103:
          id result = "GL_UNSIGNED_INVERT_NV";
          break;
        case 34104:
          id result = "GL_EXPAND_NORMAL_NV";
          break;
        case 34105:
          id result = "GL_EXPAND_NEGATE_NV";
          break;
        case 34106:
          id result = "GL_HALF_BIAS_NORMAL_NV";
          break;
        case 34107:
          id result = "GL_HALF_BIAS_NEGATE_NV";
          break;
        case 34108:
          id result = "GL_SIGNED_IDENTITY_NV";
          break;
        case 34109:
          id result = "GL_SIGNED_NEGATE_NV";
          break;
        case 34110:
          id result = "GL_SCALE_BY_TWO_NV";
          break;
        case 34111:
          id result = "GL_SCALE_BY_FOUR_NV";
          break;
        case 34112:
          id result = "GL_SCALE_BY_ONE_HALF_NV";
          break;
        case 34113:
          id result = "GL_BIAS_BY_NEGATIVE_ONE_HALF_NV";
          break;
        case 34114:
          id result = "GL_COMBINER_INPUT_NV";
          break;
        case 34115:
          id result = "GL_COMBINER_MAPPING_NV";
          break;
        case 34116:
          id result = "GL_COMBINER_COMPONENT_USAGE_NV";
          break;
        case 34117:
          id result = "GL_COMBINER_AB_DOT_PRODUCT_NV";
          break;
        case 34118:
          id result = "GL_COMBINER_CD_DOT_PRODUCT_NV";
          break;
        case 34119:
          id result = "GL_COMBINER_MUX_SUM_NV";
          break;
        case 34120:
          id result = "GL_COMBINER_SCALE_NV";
          break;
        case 34121:
          id result = "GL_COMBINER_BIAS_NV";
          break;
        case 34122:
          id result = "GL_COMBINER_AB_OUTPUT_NV";
          break;
        case 34123:
          id result = "GL_COMBINER_CD_OUTPUT_NV";
          break;
        case 34124:
          id result = "GL_COMBINER_SUM_OUTPUT_NV";
          break;
        case 34125:
          id result = "GL_MAX_GENERAL_COMBINERS_NV";
          break;
        case 34126:
          id result = "GL_NUM_GENERAL_COMBINERS_NV";
          break;
        case 34127:
          id result = "GL_COLOR_SUM_CLAMP_NV";
          break;
        case 34128:
          id result = "GL_COMBINER0_NV";
          break;
        case 34129:
          id result = "GL_COMBINER1_NV";
          break;
        case 34130:
          id result = "GL_COMBINER2_NV";
          break;
        case 34131:
          id result = "GL_COMBINER3_NV";
          break;
        case 34132:
          id result = "GL_COMBINER4_NV";
          break;
        case 34133:
          id result = "GL_COMBINER5_NV";
          break;
        case 34134:
          id result = "GL_COMBINER6_NV";
          break;
        case 34135:
          id result = "GL_COMBINER7_NV";
          break;
        case 34138:
          id result = "GL_FOG_DISTANCE_MODE_NV";
          break;
        case 34139:
          id result = "GL_EYE_RADIAL_NV";
          break;
        case 34140:
          id result = "GL_EYE_PLANE_ABSOLUTE_NV";
          break;
        case 34160:
          id result = "GL_COMBINE";
          break;
        case 34161:
          id result = "GL_COMBINE_RGB";
          break;
        case 34162:
          id result = "GL_COMBINE_ALPHA";
          break;
        case 34163:
          id result = "GL_RGB_SCALE";
          break;
        case 34164:
          id result = "GL_ADD_SIGNED";
          break;
        case 34165:
          id result = "GL_INTERPOLATE";
          break;
        case 34166:
          id result = "GL_CONSTANT";
          break;
        case 34167:
          id result = "GL_PRIMARY_COLOR";
          break;
        case 34168:
          id result = "GL_PREVIOUS";
          break;
        case 34176:
          id result = "GL_SRC0_RGB";
          break;
        case 34177:
          id result = "GL_SRC1_RGB";
          break;
        case 34178:
          id result = "GL_SRC2_RGB";
          break;
        case 34184:
          id result = "GL_SRC0_ALPHA";
          break;
        case 34185:
          id result = "GL_SRC1_ALPHA";
          break;
        case 34186:
          id result = "GL_SRC2_ALPHA";
          break;
        case 34192:
          id result = "GL_OPERAND0_RGB";
          break;
        case 34193:
          id result = "GL_OPERAND1_RGB";
          break;
        case 34194:
          id result = "GL_OPERAND2_RGB";
          break;
        case 34200:
          id result = "GL_OPERAND0_ALPHA";
          break;
        case 34201:
          id result = "GL_OPERAND1_ALPHA";
          break;
        case 34202:
          id result = "GL_OPERAND2_ALPHA";
          break;
        case 34224:
          id result = "GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE";
          break;
        case 34225:
          id result = "GL_TRANSFORM_HINT_APPLE";
          break;
        case 34226:
          id result = "GL_UNPACK_CLIENT_STORAGE_APPLE";
          break;
        case 34227:
          id result = "GL_BUFFER_OBJECT_APPLE";
          break;
        case 34228:
          id result = "GL_STORAGE_CLIENT_APPLE";
          break;
        case 34229:
          id result = "GL_VERTEX_ARRAY_BINDING";
          break;
        case 34230:
          id result = "GL_TEXTURE_MINIMIZE_STORAGE_APPLE";
          break;
        case 34231:
          id result = "GL_TEXTURE_RANGE_LENGTH_APPLE";
          break;
        case 34232:
          id result = "GL_TEXTURE_RANGE_POINTER_APPLE";
          break;
        case 34233:
          id result = "GL_YCBCR_422_APPLE";
          break;
        case 34234:
          id result = "GL_UNSIGNED_SHORT_8_8_APPLE";
          break;
        case 34235:
          id result = "GL_UNSIGNED_SHORT_8_8_REV_APPLE";
          break;
        case 34236:
          id result = "GL_TEXTURE_STORAGE_HINT_APPLE";
          break;
        case 34237:
          id result = "GL_STORAGE_PRIVATE_APPLE";
          break;
        case 34238:
          id result = "GL_STORAGE_CACHED_APPLE";
          break;
        case 34239:
          id result = "GL_STORAGE_SHARED_APPLE";
          break;
        case 34336:
          id result = "GL_VERTEX_PROGRAM_ARB";
          break;
        case 34337:
          id result = "GL_VERTEX_STATE_PROGRAM_NV";
          break;
        case 34338:
          id result = "GL_VERTEX_ATTRIB_ARRAY_ENABLED";
          break;
        case 34339:
          id result = "GL_VERTEX_ATTRIB_ARRAY_SIZE";
          break;
        case 34340:
          id result = "GL_VERTEX_ATTRIB_ARRAY_STRIDE";
          break;
        case 34341:
          id result = "GL_VERTEX_ATTRIB_ARRAY_TYPE";
          break;
        case 34342:
          id result = "GL_CURRENT_VERTEX_ATTRIB";
          break;
        case 34343:
          id result = "GL_PROGRAM_LENGTH_ARB";
          break;
        case 34344:
          id result = "GL_PROGRAM_STRING_ARB";
          break;
        case 34345:
          id result = "GL_MODELVIEW_PROJECTION_NV";
          break;
        case 34346:
          id result = "GL_IDENTITY_NV";
          break;
        case 34347:
          id result = "GL_INVERSE_NV";
          break;
        case 34348:
          id result = "GL_TRANSPOSE_NV";
          break;
        case 34349:
          id result = "GL_INVERSE_TRANSPOSE_NV";
          break;
        case 34350:
          id result = "GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB";
          break;
        case 34351:
          id result = "GL_MAX_PROGRAM_MATRICES_ARB";
          break;
        case 34352:
          id result = "GL_MATRIX0_NV";
          break;
        case 34353:
          id result = "GL_MATRIX1_NV";
          break;
        case 34354:
          id result = "GL_MATRIX2_NV";
          break;
        case 34355:
          id result = "GL_MATRIX3_NV";
          break;
        case 34356:
          id result = "GL_MATRIX4_NV";
          break;
        case 34357:
          id result = "GL_MATRIX5_NV";
          break;
        case 34358:
          id result = "GL_MATRIX6_NV";
          break;
        case 34359:
          id result = "GL_MATRIX7_NV";
          break;
        case 34368:
          id result = "GL_CURRENT_MATRIX_STACK_DEPTH_ARB";
          break;
        case 34369:
          id result = "GL_CURRENT_MATRIX_ARB";
          break;
        case 34370:
          id result = "GL_PROGRAM_POINT_SIZE";
          break;
        case 34371:
          id result = "GL_VERTEX_PROGRAM_TWO_SIDE";
          break;
        case 34372:
          id result = "GL_PROGRAM_PARAMETER_NV";
          break;
        case 34373:
          id result = "GL_VERTEX_ATTRIB_ARRAY_POINTER";
          break;
        case 34374:
          id result = "GL_PROGRAM_TARGET_NV";
          break;
        case 34375:
          id result = "GL_PROGRAM_RESIDENT_NV";
          break;
        case 34376:
          id result = "GL_TRACK_MATRIX_NV";
          break;
        case 34377:
          id result = "GL_TRACK_MATRIX_TRANSFORM_NV";
          break;
        case 34378:
          id result = "GL_VERTEX_PROGRAM_BINDING_NV";
          break;
        case 34379:
          id result = "GL_PROGRAM_ERROR_POSITION_ARB";
          break;
        case 34380:
          id result = "GL_OFFSET_TEXTURE_RECTANGLE_NV";
          break;
        case 34381:
          id result = "GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV";
          break;
        case 34382:
          id result = "GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV";
          break;
        case 34383:
          id result = "GL_DEPTH_CLAMP";
          break;
        case 34384:
          id result = "GL_VERTEX_ATTRIB_ARRAY0_NV";
          break;
        case 34385:
          id result = "GL_VERTEX_ATTRIB_ARRAY1_NV";
          break;
        case 34386:
          id result = "GL_VERTEX_ATTRIB_ARRAY2_NV";
          break;
        case 34387:
          id result = "GL_VERTEX_ATTRIB_ARRAY3_NV";
          break;
        case 34388:
          id result = "GL_VERTEX_ATTRIB_ARRAY4_NV";
          break;
        case 34389:
          id result = "GL_VERTEX_ATTRIB_ARRAY5_NV";
          break;
        case 34390:
          id result = "GL_VERTEX_ATTRIB_ARRAY6_NV";
          break;
        case 34391:
          id result = "GL_VERTEX_ATTRIB_ARRAY7_NV";
          break;
        case 34392:
          id result = "GL_VERTEX_ATTRIB_ARRAY8_NV";
          break;
        case 34393:
          id result = "GL_VERTEX_ATTRIB_ARRAY9_NV";
          break;
        case 34394:
          id result = "GL_VERTEX_ATTRIB_ARRAY10_NV";
          break;
        case 34395:
          id result = "GL_VERTEX_ATTRIB_ARRAY11_NV";
          break;
        case 34396:
          id result = "GL_VERTEX_ATTRIB_ARRAY12_NV";
          break;
        case 34397:
          id result = "GL_VERTEX_ATTRIB_ARRAY13_NV";
          break;
        case 34398:
          id result = "GL_VERTEX_ATTRIB_ARRAY14_NV";
          break;
        case 34399:
          id result = "GL_VERTEX_ATTRIB_ARRAY15_NV";
          break;
        case 34400:
          id result = "GL_MAP1_VERTEX_ATTRIB0_4_NV";
          break;
        case 34401:
          id result = "GL_MAP1_VERTEX_ATTRIB1_4_NV";
          break;
        case 34402:
          id result = "GL_MAP1_VERTEX_ATTRIB2_4_NV";
          break;
        case 34403:
          id result = "GL_MAP1_VERTEX_ATTRIB3_4_NV";
          break;
        case 34404:
          id result = "GL_MAP1_VERTEX_ATTRIB4_4_NV";
          break;
        case 34405:
          id result = "GL_MAP1_VERTEX_ATTRIB5_4_NV";
          break;
        case 34406:
          id result = "GL_MAP1_VERTEX_ATTRIB6_4_NV";
          break;
        case 34407:
          id result = "GL_MAP1_VERTEX_ATTRIB7_4_NV";
          break;
        case 34408:
          id result = "GL_MAP1_VERTEX_ATTRIB8_4_NV";
          break;
        case 34409:
          id result = "GL_MAP1_VERTEX_ATTRIB9_4_NV";
          break;
        case 34410:
          id result = "GL_MAP1_VERTEX_ATTRIB10_4_NV";
          break;
        case 34411:
          id result = "GL_MAP1_VERTEX_ATTRIB11_4_NV";
          break;
        case 34412:
          id result = "GL_MAP1_VERTEX_ATTRIB12_4_NV";
          break;
        case 34413:
          id result = "GL_MAP1_VERTEX_ATTRIB13_4_NV";
          break;
        case 34414:
          id result = "GL_MAP1_VERTEX_ATTRIB14_4_NV";
          break;
        case 34415:
          id result = "GL_MAP1_VERTEX_ATTRIB15_4_NV";
          break;
        case 34416:
          id result = "GL_MAP2_VERTEX_ATTRIB0_4_NV";
          break;
        case 34417:
          id result = "GL_MAP2_VERTEX_ATTRIB1_4_NV";
          break;
        case 34418:
          id result = "GL_MAP2_VERTEX_ATTRIB2_4_NV";
          break;
        case 34419:
          id result = "GL_MAP2_VERTEX_ATTRIB3_4_NV";
          break;
        case 34420:
          id result = "GL_MAP2_VERTEX_ATTRIB4_4_NV";
          break;
        case 34421:
          id result = "GL_MAP2_VERTEX_ATTRIB5_4_NV";
          break;
        case 34422:
          id result = "GL_MAP2_VERTEX_ATTRIB6_4_NV";
          break;
        case 34423:
          id result = "GL_PROGRAM_BINDING_ARB";
          break;
        case 34424:
          id result = "GL_MAP2_VERTEX_ATTRIB8_4_NV";
          break;
        case 34425:
          id result = "GL_MAP2_VERTEX_ATTRIB9_4_NV";
          break;
        case 34426:
          id result = "GL_MAP2_VERTEX_ATTRIB10_4_NV";
          break;
        case 34427:
          id result = "GL_MAP2_VERTEX_ATTRIB11_4_NV";
          break;
        case 34428:
          id result = "GL_MAP2_VERTEX_ATTRIB12_4_NV";
          break;
        case 34429:
          id result = "GL_MAP2_VERTEX_ATTRIB13_4_NV";
          break;
        case 34430:
          id result = "GL_MAP2_VERTEX_ATTRIB14_4_NV";
          break;
        case 34431:
          id result = "GL_MAP2_VERTEX_ATTRIB15_4_NV";
          break;
        case 34464:
          id result = "GL_TEXTURE_COMPRESSED_IMAGE_SIZE";
          break;
        case 34465:
          id result = "GL_TEXTURE_COMPRESSED";
          break;
        case 34466:
          id result = "GL_NUM_COMPRESSED_TEXTURE_FORMATS";
          break;
        case 34467:
          id result = "GL_COMPRESSED_TEXTURE_FORMATS";
          break;
        case 34468:
          id result = "GL_MAX_VERTEX_UNITS_ARB";
          break;
        case 34469:
          id result = "GL_ACTIVE_VERTEX_UNITS_ARB";
          break;
        case 34470:
          id result = "GL_WEIGHT_SUM_UNITY_ARB";
          break;
        case 34471:
          id result = "GL_VERTEX_BLEND_ARB";
          break;
        case 34472:
          id result = "GL_CURRENT_WEIGHT_ARB";
          break;
        case 34473:
          id result = "GL_WEIGHT_ARRAY_TYPE_ARB";
          break;
        case 34474:
          id result = "GL_WEIGHT_ARRAY_STRIDE_ARB";
          break;
        case 34475:
          id result = "GL_WEIGHT_ARRAY_SIZE_ARB";
          break;
        case 34476:
          id result = "GL_WEIGHT_ARRAY_POINTER_ARB";
          break;
        case 34477:
          id result = "GL_WEIGHT_ARRAY_ARB";
          break;
        case 34478:
          id result = "GL_DOT3_RGB";
          break;
        case 34479:
          id result = "GL_DOT3_RGBA";
          break;
        case 34521:
          id result = "GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV";
          break;
        case 34522:
          id result = "GL_UNSIGNED_INT_S8_S8_8_8_NV";
          break;
        case 34523:
          id result = "GL_UNSIGNED_INT_8_8_S8_S8_REV_NV";
          break;
        case 34524:
          id result = "GL_DSDT_MAG_INTENSITY_NV";
          break;
        case 34525:
          id result = "GL_SHADER_CONSISTENT_NV";
          break;
        case 34526:
          id result = "GL_TEXTURE_SHADER_NV";
          break;
        case 34527:
          id result = "GL_SHADER_OPERATION_NV";
          break;
        case 34528:
          id result = "GL_CULL_MODES_NV";
          break;
        case 34529:
          id result = "GL_OFFSET_TEXTURE_MATRIX_NV";
          break;
        case 34530:
          id result = "GL_OFFSET_TEXTURE_SCALE_NV";
          break;
        case 34531:
          id result = "GL_OFFSET_TEXTURE_BIAS_NV";
          break;
        case 34532:
          id result = "GL_PREVIOUS_TEXTURE_INPUT_NV";
          break;
        case 34533:
          id result = "GL_CONST_EYE_NV";
          break;
        case 34534:
          id result = "GL_PASS_THROUGH_NV";
          break;
        case 34535:
          id result = "GL_CULL_FRAGMENT_NV";
          break;
        case 34536:
          id result = "GL_OFFSET_TEXTURE_2D_NV";
          break;
        case 34537:
          id result = "GL_DEPENDENT_AR_TEXTURE_2D_NV";
          break;
        case 34538:
          id result = "GL_DEPENDENT_GB_TEXTURE_2D_NV";
          break;
        case 34540:
          id result = "GL_DOT_PRODUCT_NV";
          break;
        case 34541:
          id result = "GL_DOT_PRODUCT_DEPTH_REPLACE_NV";
          break;
        case 34542:
          id result = "GL_DOT_PRODUCT_TEXTURE_2D_NV";
          break;
        case 34543:
          id result = "GL_DOT_PRODUCT_TEXTURE_3D_NV";
          break;
        case 34544:
          id result = "GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV";
          break;
        case 34545:
          id result = "GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV";
          break;
        case 34546:
          id result = "GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV";
          break;
        case 34547:
          id result = "GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV";
          break;
        case 34548:
          id result = "GL_HILO_NV";
          break;
        case 34549:
          id result = "GL_DSDT_NV";
          break;
        case 34550:
          id result = "GL_DSDT_MAG_NV";
          break;
        case 34551:
          id result = "GL_DSDT_MAG_VIB_NV";
          break;
        case 34552:
          id result = "GL_HILO16_NV";
          break;
        case 34553:
          id result = "GL_SIGNED_HILO_NV";
          break;
        case 34554:
          id result = "GL_SIGNED_HILO16_NV";
          break;
        case 34555:
          id result = "GL_SIGNED_RGBA_NV";
          break;
        case 34556:
          id result = "GL_SIGNED_RGBA8_NV";
          break;
        case 34558:
          id result = "GL_SIGNED_RGB_NV";
          break;
        case 34559:
          id result = "GL_SIGNED_RGB8_NV";
          break;
        case 34561:
          id result = "GL_SIGNED_LUMINANCE_NV";
          break;
        case 34562:
          id result = "GL_SIGNED_LUMINANCE8_NV";
          break;
        case 34563:
          id result = "GL_SIGNED_LUMINANCE_ALPHA_NV";
          break;
        case 34564:
          id result = "GL_SIGNED_LUMINANCE8_ALPHA8_NV";
          break;
        case 34565:
          id result = "GL_SIGNED_ALPHA_NV";
          break;
        case 34566:
          id result = "GL_SIGNED_ALPHA8_NV";
          break;
        case 34567:
          id result = "GL_SIGNED_INTENSITY_NV";
          break;
        case 34568:
          id result = "GL_SIGNED_INTENSITY8_NV";
          break;
        case 34569:
          id result = "GL_DSDT8_NV";
          break;
        case 34570:
          id result = "GL_DSDT8_MAG8_NV";
          break;
        case 34571:
          id result = "GL_DSDT8_MAG8_INTENSITY8_NV";
          break;
        case 34572:
          id result = "GL_SIGNED_RGB_UNSIGNED_ALPHA_NV";
          break;
        case 34573:
          id result = "GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV";
          break;
        case 34574:
          id result = "GL_HI_SCALE_NV";
          break;
        case 34575:
          id result = "GL_LO_SCALE_NV";
          break;
        case 34576:
          id result = "GL_DS_SCALE_NV";
          break;
        case 34577:
          id result = "GL_DT_SCALE_NV";
          break;
        case 34578:
          id result = "GL_MAGNITUDE_SCALE_NV";
          break;
        case 34579:
          id result = "GL_VIBRANCE_SCALE_NV";
          break;
        case 34580:
          id result = "GL_HI_BIAS_NV";
          break;
        case 34581:
          id result = "GL_LO_BIAS_NV";
          break;
        case 34582:
          id result = "GL_DS_BIAS_NV";
          break;
        case 34583:
          id result = "GL_DT_BIAS_NV";
          break;
        case 34584:
          id result = "GL_MAGNITUDE_BIAS_NV";
          break;
        case 34585:
          id result = "GL_VIBRANCE_BIAS_NV";
          break;
        case 34586:
          id result = "GL_TEXTURE_BORDER_VALUES_NV";
          break;
        case 34587:
          id result = "GL_TEXTURE_HI_SIZE_NV";
          break;
        case 34588:
          id result = "GL_TEXTURE_LO_SIZE_NV";
          break;
        case 34589:
          id result = "GL_TEXTURE_DS_SIZE_NV";
          break;
        case 34590:
          id result = "GL_TEXTURE_DT_SIZE_NV";
          break;
        case 34591:
          id result = "GL_TEXTURE_MAG_SIZE_NV";
          break;
        case 34594:
          id result = "GL_MODELVIEW2_ARB";
          break;
        case 34595:
          id result = "GL_MODELVIEW3_ARB";
          break;
        case 34596:
          id result = "GL_MODELVIEW4_ARB";
          break;
        case 34597:
          id result = "GL_MODELVIEW5_ARB";
          break;
        case 34598:
          id result = "GL_MODELVIEW6_ARB";
          break;
        case 34599:
          id result = "GL_MODELVIEW7_ARB";
          break;
        case 34600:
          id result = "GL_MODELVIEW8_ARB";
          break;
        case 34601:
          id result = "GL_MODELVIEW9_ARB";
          break;
        case 34602:
          id result = "GL_MODELVIEW10_ARB";
          break;
        case 34603:
          id result = "GL_MODELVIEW11_ARB";
          break;
        case 34604:
          id result = "GL_MODELVIEW12_ARB";
          break;
        case 34605:
          id result = "GL_MODELVIEW13_ARB";
          break;
        case 34606:
          id result = "GL_MODELVIEW14_ARB";
          break;
        case 34607:
          id result = "GL_MODELVIEW15_ARB";
          break;
        case 34608:
          id result = "GL_MODELVIEW16_ARB";
          break;
        case 34609:
          id result = "GL_MODELVIEW17_ARB";
          break;
        case 34610:
          id result = "GL_MODELVIEW18_ARB";
          break;
        case 34611:
          id result = "GL_MODELVIEW19_ARB";
          break;
        case 34612:
          id result = "GL_MODELVIEW20_ARB";
          break;
        case 34613:
          id result = "GL_MODELVIEW21_ARB";
          break;
        case 34614:
          id result = "GL_MODELVIEW22_ARB";
          break;
        case 34615:
          id result = "GL_MODELVIEW23_ARB";
          break;
        case 34616:
          id result = "GL_MODELVIEW24_ARB";
          break;
        case 34617:
          id result = "GL_MODELVIEW25_ARB";
          break;
        case 34618:
          id result = "GL_MODELVIEW26_ARB";
          break;
        case 34619:
          id result = "GL_MODELVIEW27_ARB";
          break;
        case 34620:
          id result = "GL_MODELVIEW28_ARB";
          break;
        case 34621:
          id result = "GL_MODELVIEW29_ARB";
          break;
        case 34622:
          id result = "GL_MODELVIEW30_ARB";
          break;
        case 34623:
          id result = "GL_MODELVIEW31_ARB";
          break;
        case 34625:
          id result = "GL_PROGRAM_BINARY_LENGTH";
          break;
        case 34626:
          id result = "GL_MIRROR_CLAMP_EXT";
          break;
        case 34627:
          id result = "GL_MIRROR_CLAMP_TO_EDGE_EXT";
          break;
        case 34628:
          id result = "GL_MODULATE_ADD_ATI";
          break;
        case 34629:
          id result = "GL_MODULATE_SIGNED_ADD_ATI";
          break;
        case 34630:
          id result = "GL_MODULATE_SUBTRACT_ATI";
          break;
        case 34660:
          id result = "GL_BUFFER_SIZE";
          break;
        case 34661:
          id result = "GL_BUFFER_USAGE";
          break;
        case 34685:
          id result = "GL_MIN_WEIGHTED_ATI";
          break;
        case 34686:
          id result = "GL_MAX_WEIGHTED_ATI";
          break;
        case 34814:
          id result = "GL_NUM_PROGRAM_BINARY_FORMATS";
          break;
        case 34815:
          id result = "GL_PROGRAM_BINARY_FORMATS";
          break;
        case 34816:
          id result = "GL_STENCIL_BACK_FUNC";
          break;
        case 34817:
          id result = "GL_STENCIL_BACK_FAIL";
          break;
        case 34818:
          id result = "GL_STENCIL_BACK_PASS_DEPTH_FAIL";
          break;
        case 34819:
          id result = "GL_STENCIL_BACK_PASS_DEPTH_PASS";
          break;
        case 34820:
          id result = "GL_FRAGMENT_PROGRAM_ARB";
          break;
        case 34821:
          id result = "GL_PROGRAM_ALU_INSTRUCTIONS_ARB";
          break;
        case 34822:
          id result = "GL_PROGRAM_TEX_INSTRUCTIONS_ARB";
          break;
        case 34823:
          id result = "GL_PROGRAM_TEX_INDIRECTIONS_ARB";
          break;
        case 34824:
          id result = "GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB";
          break;
        case 34825:
          id result = "GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB";
          break;
        case 34826:
          id result = "GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB";
          break;
        case 34827:
          id result = "GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB";
          break;
        case 34828:
          id result = "GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB";
          break;
        case 34829:
          id result = "GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB";
          break;
        case 34830:
          id result = "GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB";
          break;
        case 34831:
          id result = "GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB";
          break;
        case 34832:
          id result = "GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB";
          break;
        case 34836:
          id result = "GL_RGBA32F";
          break;
        case 34837:
          id result = "GL_RGB32F";
          break;
        case 34838:
          id result = "GL_ALPHA32F_ARB";
          break;
        case 34839:
          id result = "GL_INTENSITY32F_ARB";
          break;
        case 34840:
          id result = "GL_LUMINANCE32F_ARB";
          break;
        case 34841:
          id result = "GL_LUMINANCE_ALPHA32F_ARB";
          break;
        case 34842:
          id result = "GL_RGBA16F";
          break;
        case 34843:
          id result = "GL_RGB16F";
          break;
        case 34844:
          id result = "GL_ALPHA16F_ARB";
          break;
        case 34845:
          id result = "GL_INTENSITY16F_ARB";
          break;
        case 34846:
          id result = "GL_LUMINANCE16F_ARB";
          break;
        case 34847:
          id result = "GL_LUMINANCE_ALPHA16F_ARB";
          break;
        case 34848:
          id result = "GL_RGBA_FLOAT_MODE_ARB";
          break;
        case 34852:
          id result = "GL_MAX_DRAW_BUFFERS";
          break;
        case 34853:
          id result = "GL_DRAW_BUFFER0";
          break;
        case 34854:
          id result = "GL_DRAW_BUFFER1";
          break;
        case 34855:
          id result = "GL_DRAW_BUFFER2";
          break;
        case 34856:
          id result = "GL_DRAW_BUFFER3";
          break;
        case 34857:
          id result = "GL_DRAW_BUFFER4";
          break;
        case 34858:
          id result = "GL_DRAW_BUFFER5";
          break;
        case 34859:
          id result = "GL_DRAW_BUFFER6";
          break;
        case 34860:
          id result = "GL_DRAW_BUFFER7";
          break;
        case 34861:
          id result = "GL_DRAW_BUFFER8";
          break;
        case 34862:
          id result = "GL_DRAW_BUFFER9";
          break;
        case 34863:
          id result = "GL_DRAW_BUFFER10";
          break;
        case 34864:
          id result = "GL_DRAW_BUFFER11";
          break;
        case 34865:
          id result = "GL_DRAW_BUFFER12";
          break;
        case 34866:
          id result = "GL_DRAW_BUFFER13";
          break;
        case 34867:
          id result = "GL_DRAW_BUFFER14";
          break;
        case 34868:
          id result = "GL_DRAW_BUFFER15";
          break;
        case 34871:
          id result = "GL_COMPRESSED_LUMINANCE_ALPHA_3DC_ATI";
          break;
        case 34877:
          id result = "GL_BLEND_EQUATION_ALPHA";
          break;
        case 34880:
          id result = "GL_MATRIX_PALETTE_OES";
          break;
        case 34882:
          id result = "GL_MAX_PALETTE_MATRICES_OES";
          break;
        case 34883:
          id result = "GL_CURRENT_PALETTE_MATRIX_OES";
          break;
        case 34884:
          id result = "GL_MATRIX_INDEX_ARRAY_OES";
          break;
        case 34886:
          id result = "GL_MATRIX_INDEX_ARRAY_SIZE_OES";
          break;
        case 34887:
          id result = "GL_MATRIX_INDEX_ARRAY_TYPE_OES";
          break;
        case 34888:
          id result = "GL_MATRIX_INDEX_ARRAY_STRIDE_OES";
          break;
        case 34889:
          id result = "GL_MATRIX_INDEX_ARRAY_POINTER_OES";
          break;
        case 34890:
          id result = "GL_TEXTURE_DEPTH_SIZE";
          break;
        case 34891:
          id result = "GL_DEPTH_TEXTURE_MODE";
          break;
        case 34892:
          id result = "GL_TEXTURE_COMPARE_MODE";
          break;
        case 34893:
          id result = "GL_TEXTURE_COMPARE_FUNC";
          break;
        case 34894:
          id result = "GL_COMPARE_REF_TO_TEXTURE";
          break;
        case 34895:
          id result = "GL_TEXTURE_CUBE_MAP_SEAMLESS";
          break;
        case 34896:
          id result = "GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV";
          break;
        case 34897:
          id result = "GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV";
          break;
        case 34898:
          id result = "GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV";
          break;
        case 34899:
          id result = "GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV";
          break;
        case 34900:
          id result = "GL_OFFSET_HILO_TEXTURE_2D_NV";
          break;
        case 34901:
          id result = "GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV";
          break;
        case 34902:
          id result = "GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV";
          break;
        case 34903:
          id result = "GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV";
          break;
        case 34904:
          id result = "GL_DEPENDENT_HILO_TEXTURE_2D_NV";
          break;
        case 34905:
          id result = "GL_DEPENDENT_RGB_TEXTURE_3D_NV";
          break;
        case 34906:
          id result = "GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV";
          break;
        case 34907:
          id result = "GL_DOT_PRODUCT_PASS_THROUGH_NV";
          break;
        case 34908:
          id result = "GL_DOT_PRODUCT_TEXTURE_1D_NV";
          break;
        case 34909:
          id result = "GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV";
          break;
        case 34910:
          id result = "GL_HILO8_NV";
          break;
        case 34911:
          id result = "GL_SIGNED_HILO8_NV";
          break;
        case 34912:
          id result = "GL_FORCE_BLUE_TO_ONE_NV";
          break;
        case 34913:
          id result = "GL_POINT_SPRITE";
          break;
        case 34914:
          id result = "GL_COORD_REPLACE";
          break;
        case 34915:
          id result = "GL_POINT_SPRITE_R_MODE_NV";
          break;
        case 34916:
          id result = "GL_QUERY_COUNTER_BITS";
          break;
        case 34917:
          id result = "GL_CURRENT_QUERY";
          break;
        case 34918:
          id result = "GL_QUERY_RESULT";
          break;
        case 34919:
          id result = "GL_QUERY_RESULT_AVAILABLE";
          break;
        case 34921:
          id result = "GL_MAX_VERTEX_ATTRIBS";
          break;
        case 34922:
          id result = "GL_VERTEX_ATTRIB_ARRAY_NORMALIZED";
          break;
        case 34924:
          id result = "GL_MAX_TESS_CONTROL_INPUT_COMPONENTS";
          break;
        case 34925:
          id result = "GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS";
          break;
        case 34929:
          id result = "GL_MAX_TEXTURE_COORDS";
          break;
        case 34930:
          id result = "GL_MAX_TEXTURE_IMAGE_UNITS";
          break;
        case 34932:
          id result = "GL_PROGRAM_ERROR_STRING_ARB";
          break;
        case 34933:
          id result = "GL_PROGRAM_FORMAT_ASCII_ARB";
          break;
        case 34934:
          id result = "GL_PROGRAM_FORMAT_ARB";
          break;
        case 34943:
          id result = "GL_GEOMETRY_SHADER_INVOCATIONS";
          break;
        case 34960:
          id result = "GL_DEPTH_BOUNDS_TEST_EXT";
          break;
        case 34961:
          id result = "GL_DEPTH_BOUNDS_EXT";
          break;
        case 34962:
          id result = "GL_ARRAY_BUFFER";
          break;
        case 34963:
          id result = "GL_ELEMENT_ARRAY_BUFFER";
          break;
        case 34964:
          id result = "GL_ARRAY_BUFFER_BINDING";
          break;
        case 34965:
          id result = "GL_ELEMENT_ARRAY_BUFFER_BINDING";
          break;
        case 34966:
          id result = "GL_VERTEX_ARRAY_BUFFER_BINDING";
          break;
        case 34967:
          id result = "GL_NORMAL_ARRAY_BUFFER_BINDING";
          break;
        case 34968:
          id result = "GL_COLOR_ARRAY_BUFFER_BINDING";
          break;
        case 34969:
          id result = "GL_INDEX_ARRAY_BUFFER_BINDING";
          break;
        case 34970:
          id result = "GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING";
          break;
        case 34971:
          id result = "GL_EDGE_FLAG_ARRAY_BUFFER_BINDING";
          break;
        case 34972:
          id result = "GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING";
          break;
        case 34973:
          id result = "GL_FOG_COORD_ARRAY_BUFFER_BINDING";
          break;
        case 34974:
          id result = "GL_WEIGHT_ARRAY_BUFFER_BINDING";
          break;
        case 34975:
          id result = "GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING";
          break;
        case 34976:
          id result = "GL_PROGRAM_INSTRUCTIONS_ARB";
          break;
        case 34977:
          id result = "GL_MAX_PROGRAM_INSTRUCTIONS_ARB";
          break;
        case 34978:
          id result = "GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB";
          break;
        case 34979:
          id result = "GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB";
          break;
        case 34980:
          id result = "GL_PROGRAM_TEMPORARIES_ARB";
          break;
        case 34981:
          id result = "GL_MAX_PROGRAM_TEMPORARIES_ARB";
          break;
        case 34982:
          id result = "GL_PROGRAM_NATIVE_TEMPORARIES_ARB";
          break;
        case 34983:
          id result = "GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB";
          break;
        case 34984:
          id result = "GL_PROGRAM_PARAMETERS_ARB";
          break;
        case 34985:
          id result = "GL_MAX_PROGRAM_PARAMETERS_ARB";
          break;
        case 34986:
          id result = "GL_PROGRAM_NATIVE_PARAMETERS_ARB";
          break;
        case 34987:
          id result = "GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB";
          break;
        case 34988:
          id result = "GL_PROGRAM_ATTRIBS_ARB";
          break;
        case 34989:
          id result = "GL_MAX_PROGRAM_ATTRIBS_ARB";
          break;
        case 34990:
          id result = "GL_PROGRAM_NATIVE_ATTRIBS_ARB";
          break;
        case 34991:
          id result = "GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB";
          break;
        case 34992:
          id result = "GL_PROGRAM_ADDRESS_REGISTERS_ARB";
          break;
        case 34993:
          id result = "GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB";
          break;
        case 34994:
          id result = "GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB";
          break;
        case 34995:
          id result = "GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB";
          break;
        case 34996:
          id result = "GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB";
          break;
        case 34997:
          id result = "GL_MAX_PROGRAM_ENV_PARAMETERS_ARB";
          break;
        case 34998:
          id result = "GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB";
          break;
        case 34999:
          id result = "GL_TRANSPOSE_CURRENT_MATRIX_ARB";
          break;
        case 35000:
          id result = "GL_READ_ONLY";
          break;
        case 35001:
          id result = "GL_WRITE_ONLY";
          break;
        case 35002:
          id result = "GL_READ_WRITE";
          break;
        case 35003:
          id result = "GL_BUFFER_ACCESS";
          break;
        case 35004:
          id result = "GL_BUFFER_MAPPED";
          break;
        case 35005:
          id result = "GL_BUFFER_MAP_POINTER";
          break;
        case 35007:
          id result = "GL_TIME_ELAPSED";
          break;
        case 35008:
          id result = "GL_MATRIX0_ARB";
          break;
        case 35009:
          id result = "GL_MATRIX1_ARB";
          break;
        case 35010:
          id result = "GL_MATRIX2_ARB";
          break;
        case 35011:
          id result = "GL_MATRIX3_ARB";
          break;
        case 35012:
          id result = "GL_MATRIX4_ARB";
          break;
        case 35013:
          id result = "GL_MATRIX5_ARB";
          break;
        case 35014:
          id result = "GL_MATRIX6_ARB";
          break;
        case 35015:
          id result = "GL_MATRIX7_ARB";
          break;
        case 35016:
          id result = "GL_MATRIX8_ARB";
          break;
        case 35017:
          id result = "GL_MATRIX9_ARB";
          break;
        case 35018:
          id result = "GL_MATRIX10_ARB";
          break;
        case 35019:
          id result = "GL_MATRIX11_ARB";
          break;
        case 35020:
          id result = "GL_MATRIX12_ARB";
          break;
        case 35021:
          id result = "GL_MATRIX13_ARB";
          break;
        case 35022:
          id result = "GL_MATRIX14_ARB";
          break;
        case 35023:
          id result = "GL_MATRIX15_ARB";
          break;
        case 35024:
          id result = "GL_MATRIX16_ARB";
          break;
        case 35025:
          id result = "GL_MATRIX17_ARB";
          break;
        case 35026:
          id result = "GL_MATRIX18_ARB";
          break;
        case 35027:
          id result = "GL_MATRIX19_ARB";
          break;
        case 35028:
          id result = "GL_MATRIX20_ARB";
          break;
        case 35029:
          id result = "GL_MATRIX21_ARB";
          break;
        case 35030:
          id result = "GL_MATRIX22_ARB";
          break;
        case 35031:
          id result = "GL_MATRIX23_ARB";
          break;
        case 35032:
          id result = "GL_MATRIX24_ARB";
          break;
        case 35033:
          id result = "GL_MATRIX25_ARB";
          break;
        case 35034:
          id result = "GL_MATRIX26_ARB";
          break;
        case 35035:
          id result = "GL_MATRIX27_ARB";
          break;
        case 35036:
          id result = "GL_MATRIX28_ARB";
          break;
        case 35037:
          id result = "GL_MATRIX29_ARB";
          break;
        case 35038:
          id result = "GL_MATRIX30_ARB";
          break;
        case 35039:
          id result = "GL_MATRIX31_ARB";
          break;
        case 35040:
          id result = "GL_STREAM_DRAW";
          break;
        case 35041:
          id result = "GL_STREAM_READ";
          break;
        case 35042:
          id result = "GL_STREAM_COPY";
          break;
        case 35044:
          id result = "GL_STATIC_DRAW";
          break;
        case 35045:
          id result = "GL_STATIC_READ";
          break;
        case 35046:
          id result = "GL_STATIC_COPY";
          break;
        case 35048:
          id result = "GL_DYNAMIC_DRAW";
          break;
        case 35049:
          id result = "GL_DYNAMIC_READ";
          break;
        case 35050:
          id result = "GL_DYNAMIC_COPY";
          break;
        case 35051:
          id result = "GL_PIXEL_PACK_BUFFER";
          break;
        case 35052:
          id result = "GL_PIXEL_UNPACK_BUFFER";
          break;
        case 35053:
          id result = "GL_PIXEL_PACK_BUFFER_BINDING";
          break;
        case 35055:
          id result = "GL_PIXEL_UNPACK_BUFFER_BINDING";
          break;
        case 35056:
          id result = "GL_DEPTH24_STENCIL8";
          break;
        case 35057:
          id result = "GL_TEXTURE_STENCIL_SIZE";
          break;
        case 35060:
          id result = "GL_MAX_PROGRAM_EXEC_INSTRUCTIONS_NV";
          break;
        case 35061:
          id result = "GL_MAX_PROGRAM_CALL_DEPTH_NV";
          break;
        case 35062:
          id result = "GL_MAX_PROGRAM_IF_DEPTH_NV";
          break;
        case 35063:
          id result = "GL_MAX_PROGRAM_LOOP_DEPTH_NV";
          break;
        case 35064:
          id result = "GL_MAX_PROGRAM_LOOP_COUNT_NV";
          break;
        case 35065:
          id result = "GL_SRC1_COLOR";
          break;
        case 35066:
          id result = "GL_ONE_MINUS_SRC1_COLOR";
          break;
        case 35067:
          id result = "GL_ONE_MINUS_SRC1_ALPHA";
          break;
        case 35068:
          id result = "GL_MAX_DUAL_SOURCE_DRAW_BUFFERS";
          break;
        case 35069:
          id result = "GL_VERTEX_ATTRIB_ARRAY_INTEGER";
          break;
        case 35070:
          id result = "GL_VERTEX_ATTRIB_ARRAY_DIVISOR";
          break;
        case 35071:
          id result = "GL_MAX_ARRAY_TEXTURE_LAYERS";
          break;
        case 35076:
          id result = "GL_MIN_PROGRAM_TEXEL_OFFSET";
          break;
        case 35077:
          id result = "GL_MAX_PROGRAM_TEXEL_OFFSET";
          break;
        case 35088:
          id result = "GL_STENCIL_TEST_TWO_SIDE_EXT";
          break;
        case 35089:
          id result = "GL_ACTIVE_STENCIL_FACE_EXT";
          break;
        case 35090:
          id result = "GL_MIRROR_CLAMP_TO_BORDER_EXT";
          break;
        case 35092:
          id result = "GL_SAMPLES_PASSED";
          break;
        case 35094:
          id result = "GL_GEOMETRY_VERTICES_OUT";
          break;
        case 35095:
          id result = "GL_GEOMETRY_INPUT_TYPE";
          break;
        case 35096:
          id result = "GL_GEOMETRY_OUTPUT_TYPE";
          break;
        case 35097:
          id result = "GL_SAMPLER_BINDING";
          break;
        case 35098:
          id result = "GL_CLAMP_VERTEX_COLOR_ARB";
          break;
        case 35099:
          id result = "GL_CLAMP_FRAGMENT_COLOR_ARB";
          break;
        case 35100:
          id result = "GL_CLAMP_READ_COLOR";
          break;
        case 35101:
          id result = "GL_FIXED_ONLY";
          break;
        case 35196:
          id result = "GL_ARRAY_REV_COMPS_IN_4_BYTES_ATI";
          break;
        case 35210:
          id result = "GL_POINT_SIZE_ARRAY_TYPE_OES";
          break;
        case 35211:
          id result = "GL_POINT_SIZE_ARRAY_STRIDE_OES";
          break;
        case 35212:
          id result = "GL_POINT_SIZE_ARRAY_POINTER_OES";
          break;
        case 35213:
          id result = "GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES";
          break;
        case 35214:
          id result = "GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES";
          break;
        case 35215:
          id result = "GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES";
          break;
        case 35328:
          id result = "GL_VERTEX_ATTRIB_MAP1_APPLE";
          break;
        case 35329:
          id result = "GL_VERTEX_ATTRIB_MAP2_APPLE";
          break;
        case 35330:
          id result = "GL_VERTEX_ATTRIB_MAP1_SIZE_APPLE";
          break;
        case 35331:
          id result = "GL_VERTEX_ATTRIB_MAP1_COEFF_APPLE";
          break;
        case 35332:
          id result = "GL_VERTEX_ATTRIB_MAP1_ORDER_APPLE";
          break;
        case 35333:
          id result = "GL_VERTEX_ATTRIB_MAP1_DOMAIN_APPLE";
          break;
        case 35334:
          id result = "GL_VERTEX_ATTRIB_MAP2_SIZE_APPLE";
          break;
        case 35335:
          id result = "GL_VERTEX_ATTRIB_MAP2_COEFF_APPLE";
          break;
        case 35336:
          id result = "GL_VERTEX_ATTRIB_MAP2_ORDER_APPLE";
          break;
        case 35337:
          id result = "GL_VERTEX_ATTRIB_MAP2_DOMAIN_APPLE";
          break;
        case 35338:
          id result = "GL_DRAW_PIXELS_APPLE";
          break;
        case 35339:
          id result = "GL_FENCE_APPLE";
          break;
        case 35340:
          id result = "GL_ELEMENT_ARRAY_APPLE";
          break;
        case 35341:
          id result = "GL_ELEMENT_ARRAY_TYPE_APPLE";
          break;
        case 35342:
          id result = "GL_ELEMENT_ARRAY_POINTER_APPLE";
          break;
        case 35343:
          id result = "GL_COLOR_FLOAT_APPLE";
          break;
        case 35344:
          id result = "GL_MIN_PBUFFER_VIEWPORT_DIMS_APPLE";
          break;
        case 35345:
          id result = "GL_UNIFORM_BUFFER";
          break;
        case 35346:
          id result = "GL_BUFFER_SERIALIZED_MODIFY_APPLE";
          break;
        case 35347:
          id result = "GL_BUFFER_FLUSHING_UNMAP_APPLE";
          break;
        case 35348:
          id result = "GL_AUX_DEPTH_STENCIL_APPLE";
          break;
        case 35349:
          id result = "GL_PACK_ROW_BYTES_APPLE";
          break;
        case 35350:
          id result = "GL_UNPACK_ROW_BYTES_APPLE";
          break;
        case 35351:
          id result = "GL_PACK_IMAGE_BYTES_APPLE";
          break;
        case 35352:
          id result = "GL_UNPACK_IMAGE_BYTES_APPLE";
          break;
        case 35353:
          id result = "GL_RELEASED_APPLE";
          break;
        case 35354:
          id result = "GL_VOLATILE_APPLE";
          break;
        case 35355:
          id result = "GL_RETAINED_APPLE";
          break;
        case 35356:
          id result = "GL_UNDEFINED_APPLE";
          break;
        case 35357:
          id result = "GL_PURGEABLE_APPLE";
          break;
        case 35358:
          id result = "GL_PRIVATE_EXTENSIONS_APPLE";
          break;
        case 35359:
          id result = "GL_RGB_422_APPLE";
          break;
        case 35366:
          id result = "GL_VERTEX_POINT_SIZE_APPLE";
          break;
        case 35367:
          id result = "GL_CURRENT_POINT_SIZE_APPLE";
          break;
        case 35368:
          id result = "GL_UNIFORM_BUFFER_BINDING";
          break;
        case 35369:
          id result = "GL_UNIFORM_BUFFER_START";
          break;
        case 35370:
          id result = "GL_UNIFORM_BUFFER_SIZE";
          break;
        case 35371:
          id result = "GL_MAX_VERTEX_UNIFORM_BLOCKS";
          break;
        case 35372:
          id result = "GL_MAX_GEOMETRY_UNIFORM_BLOCKS";
          break;
        case 35373:
          id result = "GL_MAX_FRAGMENT_UNIFORM_BLOCKS";
          break;
        case 35374:
          id result = "GL_MAX_COMBINED_UNIFORM_BLOCKS";
          break;
        case 35375:
          id result = "GL_MAX_UNIFORM_BUFFER_BINDINGS";
          break;
        case 35376:
          id result = "GL_MAX_UNIFORM_BLOCK_SIZE";
          break;
        case 35377:
          id result = "GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS";
          break;
        case 35378:
          id result = "GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS";
          break;
        case 35379:
          id result = "GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS";
          break;
        case 35380:
          id result = "GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT";
          break;
        case 35381:
          id result = "GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH";
          break;
        case 35382:
          id result = "GL_ACTIVE_UNIFORM_BLOCKS";
          break;
        case 35383:
          id result = "GL_UNIFORM_TYPE";
          break;
        case 35384:
          id result = "GL_UNIFORM_SIZE";
          break;
        case 35385:
          id result = "GL_UNIFORM_NAME_LENGTH";
          break;
        case 35386:
          id result = "GL_UNIFORM_BLOCK_INDEX";
          break;
        case 35387:
          id result = "GL_UNIFORM_OFFSET";
          break;
        case 35388:
          id result = "GL_UNIFORM_ARRAY_STRIDE";
          break;
        case 35389:
          id result = "GL_UNIFORM_MATRIX_STRIDE";
          break;
        case 35390:
          id result = "GL_UNIFORM_IS_ROW_MAJOR";
          break;
        case 35391:
          id result = "GL_UNIFORM_BLOCK_BINDING";
          break;
        case 35392:
          id result = "GL_UNIFORM_BLOCK_DATA_SIZE";
          break;
        case 35393:
          id result = "GL_UNIFORM_BLOCK_NAME_LENGTH";
          break;
        case 35394:
          id result = "GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS";
          break;
        case 35395:
          id result = "GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES";
          break;
        case 35396:
          id result = "GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER";
          break;
        case 35397:
          id result = "GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER";
          break;
        case 35398:
          id result = "GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER";
          break;
        case 35400:
          id result = "GL_TEXTURE_SRGB_DECODE_EXT";
          break;
        case 35401:
          id result = "GL_DECODE_EXT";
          break;
        case 35402:
          id result = "GL_SKIP_DECODE_EXT";
          break;
        case 35403:
          id result = "GL_MAGIC_MIPMAP_APPLE";
          break;
        case 35407:
          id result = "GL_PROGRAM_PIPELINE_OBJECT_EXT";
          break;
        case 35408:
          id result = "GL_RGB_YCBCR_422_APPLE";
          break;
        case 35409:
          id result = "GL_RGB_RAW_422_APPLE";
          break;
        case 35410:
          id result = "GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT";
          break;
        case 35411:
          id result = "GL_SYNC_OBJECT_APPLE";
          break;
        case 35412:
          id result = "GL_COMPRESSED_SRGB_PVRTC_2BPPV1_EXT";
          break;
        case 35413:
          id result = "GL_COMPRESSED_SRGB_PVRTC_4BPPV1_EXT";
          break;
        case 35414:
          id result = "GL_COMPRESSED_SRGB_ALPHA_PVRTC_2BPPV1_EXT";
          break;
        case 35415:
          id result = "GL_COMPRESSED_SRGB_ALPHA_PVRTC_4BPPV1_EXT";
          break;
        case 35416:
          id result = "GL_CUBIC_APPLE";
          break;
        case 35417:
          id result = "GL_CUBIC_MIPMAP_NEAREST_APPLE";
          break;
        case 35418:
          id result = "GL_CUBIC_MIPMAP_LINEAR_APPLE";
          break;
        case 35419:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_TARGET_APPLE";
          break;
        case 35420:
          id result = "GL_COMPRESSED_RGBA_ASTC_4x2_APPLE";
          break;
        case 35421:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x4_APPLE";
          break;
        case 35422:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x2_APPLE";
          break;
        case 35423:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x4_APPLE";
          break;
        case 35424:
          id result = "GL_UNIFORM_REFERENCED_BY_VERTEX_SHADER_APPLE";
          break;
        case 35425:
          id result = "GL_UNIFORM_REFERENCED_BY_TESS_CONTROL_SHADER_APPLE";
          break;
        case 35426:
          id result = "GL_UNIFORM_REFERENCED_BY_TESS_EVAL_SHADER_APPLE";
          break;
        case 35427:
          id result = "GL_UNIFORM_REFERENCED_BY_GEOMETRY_SHADER_APPLE";
          break;
        case 35428:
          id result = "GL_UNIFORM_REFERENCED_BY_FRAGMENT_SHADER_APPLE";
          break;
        case 35429:
          id result = "GL_YCBCR8_420_2PLANE_APPLE";
          break;
        case 35430:
          id result = "GL_YCBCR8_422_1PLANE_APPLE";
          break;
        case 35431:
          id result = "GL_YCBCR8_422_2PLANE_APPLE";
          break;
        case 35432:
          id result = "GL_YCBCR8_444_2PLANE_APPLE";
          break;
        case 35433:
          id result = "GL_YCBCR10_444_1PLANE_APPLE";
          break;
        case 35434:
          id result = "GL_YCBCR10_422_2PLANE_APPLE";
          break;
        case 35435:
          id result = "GL_YCBCR10_420_2PLANE_APPLE";
          break;
        case 35436:
          id result = "GL_YCBCR10_444_2PLANE_APPLE";
          break;
        case 35437:
          id result = "GL_SRGB_YCBCR8_420_2PLANE_APPLE";
          break;
        case 35438:
          id result = "GL_SRGB_YCBCR8_422_1PLANE_APPLE";
          break;
        case 35439:
          id result = "GL_SRGB_YCBCR8_422_2PLANE_APPLE";
          break;
        case 35440:
          id result = "GL_SRGB_YCBCR8_444_2PLANE_APPLE";
          break;
        case 35441:
          id result = "GL_SRGB_YCBCR10_444_1PLANE_APPLE";
          break;
        case 35442:
          id result = "GL_SRGB_YCBCR10_422_2PLANE_APPLE";
          break;
        case 35443:
          id result = "GL_SRGB_YCBCR10_420_2PLANE_APPLE";
          break;
        case 35444:
          id result = "GL_SRGB_YCBCR10_444_2PLANE_APPLE";
          break;
        case 35445:
          id result = "GL_FUNC_OVERRIDE_BLEND_SOURCE_COLOR_APPLE";
          break;
        case 35446:
          id result = "GL_ARGBV16_XR10_APPLE";
          break;
        case 35447:
          id result = "GL_SRGB_ARGBV16_XR10_APPLE";
          break;
        case 35448:
          id result = "GL_SR8_APPLE";
          break;
        case 35449:
          id result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_APPLE";
          break;
        case 35450:
          id result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_0_APPLE";
          break;
        case 35451:
          id result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_90_APPLE";
          break;
        case 35452:
          id result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_180_APPLE";
          break;
        case 35453:
          id result = "GL_FRAMEBUFFER_TILE_ORDER_ROT_270_APPLE";
          break;
        case 35454:
          id result = "GL_VERTEX_STORAGE_MEMORY_COHERENT_APPLE";
          break;
        case 35455:
          id result = "GL_TEXTURE_STORAGE_MEMORY_COHERENT_APPLE";
          break;
        case 35632:
          id result = "GL_FRAGMENT_SHADER";
          break;
        case 35633:
          id result = "GL_VERTEX_SHADER";
          break;
        case 35648:
          id result = "GL_PROGRAM_OBJECT_EXT";
          break;
        case 35656:
          id result = "GL_SHADER_OBJECT_EXT";
          break;
        case 35657:
          id result = "GL_MAX_FRAGMENT_UNIFORM_COMPONENTS";
          break;
        case 35658:
          id result = "GL_MAX_VERTEX_UNIFORM_COMPONENTS";
          break;
        case 35659:
          id result = "GL_MAX_VARYING_COMPONENTS";
          break;
        case 35660:
          id result = "GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS";
          break;
        case 35661:
          id result = "GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS";
          break;
        case 35662:
          id result = "GL_OBJECT_TYPE_ARB";
          break;
        case 35663:
          id result = "GL_SHADER_TYPE";
          break;
        case 35664:
          id result = "GL_FLOAT_VEC2";
          break;
        case 35665:
          id result = "GL_FLOAT_VEC3";
          break;
        case 35666:
          id result = "GL_FLOAT_VEC4";
          break;
        case 35667:
          id result = "GL_INT_VEC2";
          break;
        case 35668:
          id result = "GL_INT_VEC3";
          break;
        case 35669:
          id result = "GL_INT_VEC4";
          break;
        case 35670:
          id result = "GL_BOOL";
          break;
        case 35671:
          id result = "GL_BOOL_VEC2";
          break;
        case 35672:
          id result = "GL_BOOL_VEC3";
          break;
        case 35673:
          id result = "GL_BOOL_VEC4";
          break;
        case 35674:
          id result = "GL_FLOAT_MAT2";
          break;
        case 35675:
          id result = "GL_FLOAT_MAT3";
          break;
        case 35676:
          id result = "GL_FLOAT_MAT4";
          break;
        case 35677:
          id result = "GL_SAMPLER_1D";
          break;
        case 35678:
          id result = "GL_SAMPLER_2D";
          break;
        case 35679:
          id result = "GL_SAMPLER_3D";
          break;
        case 35680:
          id result = "GL_SAMPLER_CUBE";
          break;
        case 35681:
          id result = "GL_SAMPLER_1D_SHADOW";
          break;
        case 35682:
          id result = "GL_SAMPLER_2D_SHADOW";
          break;
        case 35683:
          id result = "GL_SAMPLER_2D_RECT";
          break;
        case 35684:
          id result = "GL_SAMPLER_2D_RECT_SHADOW";
          break;
        case 35685:
          id result = "GL_FLOAT_MAT2x3";
          break;
        case 35686:
          id result = "GL_FLOAT_MAT2x4";
          break;
        case 35687:
          id result = "GL_FLOAT_MAT3x2";
          break;
        case 35688:
          id result = "GL_FLOAT_MAT3x4";
          break;
        case 35689:
          id result = "GL_FLOAT_MAT4x2";
          break;
        case 35690:
          id result = "GL_FLOAT_MAT4x3";
          break;
        case 35712:
          id result = "GL_DELETE_STATUS";
          break;
        case 35713:
          id result = "GL_COMPILE_STATUS";
          break;
        case 35714:
          id result = "GL_LINK_STATUS";
          break;
        case 35715:
          id result = "GL_VALIDATE_STATUS";
          break;
        case 35716:
          id result = "GL_INFO_LOG_LENGTH";
          break;
        case 35717:
          id result = "GL_ATTACHED_SHADERS";
          break;
        case 35718:
          id result = "GL_ACTIVE_UNIFORMS";
          break;
        case 35719:
          id result = "GL_ACTIVE_UNIFORM_MAX_LENGTH";
          break;
        case 35720:
          id result = "GL_SHADER_SOURCE_LENGTH";
          break;
        case 35721:
          id result = "GL_ACTIVE_ATTRIBUTES";
          break;
        case 35722:
          id result = "GL_ACTIVE_ATTRIBUTE_MAX_LENGTH";
          break;
        case 35723:
          id result = "GL_FRAGMENT_SHADER_DERIVATIVE_HINT";
          break;
        case 35724:
          id result = "GL_SHADING_LANGUAGE_VERSION";
          break;
        case 35725:
          id result = "GL_CURRENT_PROGRAM";
          break;
        case 35728:
          id result = "GL_PALETTE4_RGB8_OES";
          break;
        case 35729:
          id result = "GL_PALETTE4_RGBA8_OES";
          break;
        case 35730:
          id result = "GL_PALETTE4_R5_G6_B5_OES";
          break;
        case 35731:
          id result = "GL_PALETTE4_RGBA4_OES";
          break;
        case 35732:
          id result = "GL_PALETTE4_RGB5_A1_OES";
          break;
        case 35733:
          id result = "GL_PALETTE8_RGB8_OES";
          break;
        case 35734:
          id result = "GL_PALETTE8_RGBA8_OES";
          break;
        case 35735:
          id result = "GL_PALETTE8_R5_G6_B5_OES";
          break;
        case 35736:
          id result = "GL_PALETTE8_RGBA4_OES";
          break;
        case 35737:
          id result = "GL_PALETTE8_RGB5_A1_OES";
          break;
        case 35738:
          id result = "GL_IMPLEMENTATION_COLOR_READ_TYPE";
          break;
        case 35739:
          id result = "GL_IMPLEMENTATION_COLOR_READ_FORMAT";
          break;
        case 35740:
          id result = "GL_POINT_SIZE_ARRAY_OES";
          break;
        case 35741:
          id result = "GL_TEXTURE_CROP_RECT_OES";
          break;
        case 35742:
          id result = "GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES";
          break;
        case 35743:
          id result = "GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES";
          break;
        case 35840:
          id result = "GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG";
          break;
        case 35841:
          id result = "GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG";
          break;
        case 35842:
          id result = "GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG";
          break;
        case 35843:
          id result = "GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG";
          break;
        case 35856:
          id result = "GL_TEXTURE_RED_TYPE";
          break;
        case 35857:
          id result = "GL_TEXTURE_GREEN_TYPE";
          break;
        case 35858:
          id result = "GL_TEXTURE_BLUE_TYPE";
          break;
        case 35859:
          id result = "GL_TEXTURE_ALPHA_TYPE";
          break;
        case 35860:
          id result = "GL_TEXTURE_LUMINANCE_TYPE_ARB";
          break;
        case 35861:
          id result = "GL_TEXTURE_INTENSITY_TYPE_ARB";
          break;
        case 35862:
          id result = "GL_TEXTURE_DEPTH_TYPE";
          break;
        case 35863:
          id result = "GL_UNSIGNED_NORMALIZED";
          break;
        case 35864:
          id result = "GL_TEXTURE_1D_ARRAY";
          break;
        case 35865:
          id result = "GL_PROXY_TEXTURE_1D_ARRAY";
          break;
        case 35866:
          id result = "GL_TEXTURE_2D_ARRAY";
          break;
        case 35867:
          id result = "GL_PROXY_TEXTURE_2D_ARRAY";
          break;
        case 35868:
          id result = "GL_TEXTURE_BINDING_1D_ARRAY";
          break;
        case 35869:
          id result = "GL_TEXTURE_BINDING_2D_ARRAY";
          break;
        case 35881:
          id result = "GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS";
          break;
        case 35882:
          id result = "GL_TEXTURE_BUFFER";
          break;
        case 35883:
          id result = "GL_MAX_TEXTURE_BUFFER_SIZE";
          break;
        case 35884:
          id result = "GL_TEXTURE_BINDING_BUFFER";
          break;
        case 35885:
          id result = "GL_TEXTURE_BUFFER_DATA_STORE_BINDING";
          break;
        case 35887:
          id result = "GL_ANY_SAMPLES_PASSED";
          break;
        case 35894:
          id result = "GL_SAMPLE_SHADING";
          break;
        case 35895:
          id result = "GL_MIN_SAMPLE_SHADING_VALUE";
          break;
        case 35898:
          id result = "GL_R11F_G11F_B10F";
          break;
        case 35899:
          id result = "GL_UNSIGNED_INT_10F_11F_11F_REV";
          break;
        case 35900:
          id result = "GL_RGBA_SIGNED_COMPONENTS_EXT";
          break;
        case 35901:
          id result = "GL_RGB9_E5";
          break;
        case 35902:
          id result = "GL_UNSIGNED_INT_5_9_9_9_REV";
          break;
        case 35903:
          id result = "GL_TEXTURE_SHARED_SIZE";
          break;
        case 35904:
          id result = "GL_SRGB";
          break;
        case 35905:
          id result = "GL_SRGB8";
          break;
        case 35906:
          id result = "GL_SRGB_ALPHA";
          break;
        case 35907:
          id result = "GL_SRGB8_ALPHA8";
          break;
        case 35908:
          id result = "GL_SLUMINANCE_ALPHA";
          break;
        case 35909:
          id result = "GL_SLUMINANCE8_ALPHA8";
          break;
        case 35910:
          id result = "GL_SLUMINANCE";
          break;
        case 35911:
          id result = "GL_SLUMINANCE8";
          break;
        case 35912:
          id result = "GL_COMPRESSED_SRGB";
          break;
        case 35913:
          id result = "GL_COMPRESSED_SRGB_ALPHA";
          break;
        case 35914:
          id result = "GL_COMPRESSED_SLUMINANCE";
          break;
        case 35915:
          id result = "GL_COMPRESSED_SLUMINANCE_ALPHA";
          break;
        case 35916:
          id result = "GL_COMPRESSED_SRGB_S3TC_DXT1_EXT";
          break;
        case 35917:
          id result = "GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT";
          break;
        case 35918:
          id result = "GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT3_EXT";
          break;
        case 35919:
          id result = "GL_COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT";
          break;
        case 35958:
          id result = "GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH";
          break;
        case 35967:
          id result = "GL_TRANSFORM_FEEDBACK_BUFFER_MODE";
          break;
        case 35968:
          id result = "GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS";
          break;
        case 35971:
          id result = "GL_TRANSFORM_FEEDBACK_VARYINGS";
          break;
        case 35972:
          id result = "GL_TRANSFORM_FEEDBACK_BUFFER_START";
          break;
        case 35973:
          id result = "GL_TRANSFORM_FEEDBACK_BUFFER_SIZE";
          break;
        case 35975:
          id result = "GL_PRIMITIVES_GENERATED";
          break;
        case 35976:
          id result = "GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN";
          break;
        case 35977:
          id result = "GL_RASTERIZER_DISCARD";
          break;
        case 35978:
          id result = "GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS";
          break;
        case 35979:
          id result = "GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS";
          break;
        case 35980:
          id result = "GL_INTERLEAVED_ATTRIBS";
          break;
        case 35981:
          id result = "GL_SEPARATE_ATTRIBS";
          break;
        case 35982:
          id result = "GL_TRANSFORM_FEEDBACK_BUFFER";
          break;
        case 35983:
          id result = "GL_TRANSFORM_FEEDBACK_BUFFER_BINDING";
          break;
        case 36000:
          id result = "GL_POINT_SPRITE_COORD_ORIGIN";
          break;
        case 36001:
          id result = "GL_LOWER_LEFT";
          break;
        case 36002:
          id result = "GL_UPPER_LEFT";
          break;
        case 36003:
          id result = "GL_STENCIL_BACK_REF";
          break;
        case 36004:
          id result = "GL_STENCIL_BACK_VALUE_MASK";
          break;
        case 36005:
          id result = "GL_STENCIL_BACK_WRITEMASK";
          break;
        case 36006:
          id result = "GL_FRAMEBUFFER_BINDING";
          break;
        case 36007:
          id result = "GL_RENDERBUFFER_BINDING";
          break;
        case 36008:
          id result = "GL_READ_FRAMEBUFFER";
          break;
        case 36009:
          id result = "GL_DRAW_FRAMEBUFFER";
          break;
        case 36010:
          id result = "GL_READ_FRAMEBUFFER_BINDING";
          break;
        case 36011:
          id result = "GL_RENDERBUFFER_SAMPLES";
          break;
        case 36012:
          id result = "GL_DEPTH_COMPONENT32F";
          break;
        case 36013:
          id result = "GL_DEPTH32F_STENCIL8";
          break;
        case 36048:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE";
          break;
        case 36049:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME";
          break;
        case 36050:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL";
          break;
        case 36051:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE";
          break;
        case 36052:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER";
          break;
        case 36053:
          id result = "GL_FRAMEBUFFER_COMPLETE";
          break;
        case 36054:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT";
          break;
        case 36055:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT";
          break;
        case 36057:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS";
          break;
        case 36058:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT";
          break;
        case 36059:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER";
          break;
        case 36060:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER";
          break;
        case 36061:
          id result = "GL_FRAMEBUFFER_UNSUPPORTED";
          break;
        case 36063:
          id result = "GL_MAX_COLOR_ATTACHMENTS";
          break;
        case 36064:
          id result = "GL_COLOR_ATTACHMENT0";
          break;
        case 36065:
          id result = "GL_COLOR_ATTACHMENT1";
          break;
        case 36066:
          id result = "GL_COLOR_ATTACHMENT2";
          break;
        case 36067:
          id result = "GL_COLOR_ATTACHMENT3";
          break;
        case 36068:
          id result = "GL_COLOR_ATTACHMENT4";
          break;
        case 36069:
          id result = "GL_COLOR_ATTACHMENT5";
          break;
        case 36070:
          id result = "GL_COLOR_ATTACHMENT6";
          break;
        case 36071:
          id result = "GL_COLOR_ATTACHMENT7";
          break;
        case 36072:
          id result = "GL_COLOR_ATTACHMENT8";
          break;
        case 36073:
          id result = "GL_COLOR_ATTACHMENT9";
          break;
        case 36074:
          id result = "GL_COLOR_ATTACHMENT10";
          break;
        case 36075:
          id result = "GL_COLOR_ATTACHMENT11";
          break;
        case 36076:
          id result = "GL_COLOR_ATTACHMENT12";
          break;
        case 36077:
          id result = "GL_COLOR_ATTACHMENT13";
          break;
        case 36078:
          id result = "GL_COLOR_ATTACHMENT14";
          break;
        case 36079:
          id result = "GL_COLOR_ATTACHMENT15";
          break;
        case 36096:
          id result = "GL_DEPTH_ATTACHMENT";
          break;
        case 36128:
          id result = "GL_STENCIL_ATTACHMENT";
          break;
        case 36160:
          id result = "GL_FRAMEBUFFER";
          break;
        case 36161:
          id result = "GL_RENDERBUFFER";
          break;
        case 36162:
          id result = "GL_RENDERBUFFER_WIDTH";
          break;
        case 36163:
          id result = "GL_RENDERBUFFER_HEIGHT";
          break;
        case 36164:
          id result = "GL_RENDERBUFFER_INTERNAL_FORMAT";
          break;
        case 36166:
          id result = "GL_STENCIL_INDEX1";
          break;
        case 36167:
          id result = "GL_STENCIL_INDEX4";
          break;
        case 36168:
          id result = "GL_STENCIL_INDEX8";
          break;
        case 36169:
          id result = "GL_STENCIL_INDEX16";
          break;
        case 36176:
          id result = "GL_RENDERBUFFER_RED_SIZE";
          break;
        case 36177:
          id result = "GL_RENDERBUFFER_GREEN_SIZE";
          break;
        case 36178:
          id result = "GL_RENDERBUFFER_BLUE_SIZE";
          break;
        case 36179:
          id result = "GL_RENDERBUFFER_ALPHA_SIZE";
          break;
        case 36180:
          id result = "GL_RENDERBUFFER_DEPTH_SIZE";
          break;
        case 36181:
          id result = "GL_RENDERBUFFER_STENCIL_SIZE";
          break;
        case 36182:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE";
          break;
        case 36183:
          id result = "GL_MAX_SAMPLES";
          break;
        case 36193:
          id result = "GL_HALF_FLOAT_OES";
          break;
        case 36194:
          id result = "GL_RGB565";
          break;
        case 36201:
          id result = "GL_PRIMITIVE_RESTART_FIXED_INDEX";
          break;
        case 36202:
          id result = "GL_ANY_SAMPLES_PASSED_CONSERVATIVE";
          break;
        case 36203:
          id result = "GL_MAX_ELEMENT_INDEX";
          break;
        case 36208:
          id result = "GL_RGBA32UI";
          break;
        case 36209:
          id result = "GL_RGB32UI";
          break;
        case 36210:
          id result = "GL_ALPHA32UI_EXT";
          break;
        case 36211:
          id result = "GL_INTENSITY32UI_EXT";
          break;
        case 36212:
          id result = "GL_LUMINANCE32UI_EXT";
          break;
        case 36213:
          id result = "GL_LUMINANCE_ALPHA32UI_EXT";
          break;
        case 36214:
          id result = "GL_RGBA16UI";
          break;
        case 36215:
          id result = "GL_RGB16UI";
          break;
        case 36216:
          id result = "GL_ALPHA16UI_EXT";
          break;
        case 36217:
          id result = "GL_INTENSITY16UI_EXT";
          break;
        case 36218:
          id result = "GL_LUMINANCE16UI_EXT";
          break;
        case 36219:
          id result = "GL_LUMINANCE_ALPHA16UI_EXT";
          break;
        case 36220:
          id result = "GL_RGBA8UI";
          break;
        case 36221:
          id result = "GL_RGB8UI";
          break;
        case 36222:
          id result = "GL_ALPHA8UI_EXT";
          break;
        case 36223:
          id result = "GL_INTENSITY8UI_EXT";
          break;
        case 36224:
          id result = "GL_LUMINANCE8UI_EXT";
          break;
        case 36225:
          id result = "GL_LUMINANCE_ALPHA8UI_EXT";
          break;
        case 36226:
          id result = "GL_RGBA32I";
          break;
        case 36227:
          id result = "GL_RGB32I";
          break;
        case 36228:
          id result = "GL_ALPHA32I_EXT";
          break;
        case 36229:
          id result = "GL_INTENSITY32I_EXT";
          break;
        case 36230:
          id result = "GL_LUMINANCE32I_EXT";
          break;
        case 36231:
          id result = "GL_LUMINANCE_ALPHA32I_EXT";
          break;
        case 36232:
          id result = "GL_RGBA16I";
          break;
        case 36233:
          id result = "GL_RGB16I";
          break;
        case 36234:
          id result = "GL_ALPHA16I_EXT";
          break;
        case 36235:
          id result = "GL_INTENSITY16I_EXT";
          break;
        case 36236:
          id result = "GL_LUMINANCE16I_EXT";
          break;
        case 36237:
          id result = "GL_LUMINANCE_ALPHA16I_EXT";
          break;
        case 36238:
          id result = "GL_RGBA8I";
          break;
        case 36239:
          id result = "GL_RGB8I";
          break;
        case 36240:
          id result = "GL_ALPHA8I_EXT";
          break;
        case 36241:
          id result = "GL_INTENSITY8I_EXT";
          break;
        case 36242:
          id result = "GL_LUMINANCE8I_EXT";
          break;
        case 36243:
          id result = "GL_LUMINANCE_ALPHA8I_EXT";
          break;
        case 36244:
          id result = "GL_RED_INTEGER";
          break;
        case 36245:
          id result = "GL_GREEN_INTEGER";
          break;
        case 36246:
          id result = "GL_BLUE_INTEGER";
          break;
        case 36247:
          id result = "GL_ALPHA_INTEGER_EXT";
          break;
        case 36248:
          id result = "GL_RGB_INTEGER";
          break;
        case 36249:
          id result = "GL_RGBA_INTEGER";
          break;
        case 36250:
          id result = "GL_BGR_INTEGER";
          break;
        case 36251:
          id result = "GL_BGRA_INTEGER";
          break;
        case 36252:
          id result = "GL_LUMINANCE_INTEGER_EXT";
          break;
        case 36253:
          id result = "GL_LUMINANCE_ALPHA_INTEGER_EXT";
          break;
        case 36254:
          id result = "GL_RGBA_INTEGER_MODE_EXT";
          break;
        case 36255:
          id result = "GL_INT_2_10_10_10_REV";
          break;
        case 36263:
          id result = "GL_FRAMEBUFFER_ATTACHMENT_LAYERED";
          break;
        case 36264:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS";
          break;
        case 36265:
          id result = "GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_EXT";
          break;
        case 36269:
          id result = "GL_FLOAT_32_UNSIGNED_INT_24_8_REV";
          break;
        case 36270:
          id result = "GL_SHADER_INCLUDE_ARB";
          break;
        case 36281:
          id result = "GL_FRAMEBUFFER_SRGB";
          break;
        case 36282:
          id result = "GL_FRAMEBUFFER_SRGB_CAPABLE_EXT";
          break;
        case 36283:
          id result = "GL_COMPRESSED_RED_RGTC1";
          break;
        case 36284:
          id result = "GL_COMPRESSED_SIGNED_RED_RGTC1";
          break;
        case 36285:
          id result = "GL_COMPRESSED_RG_RGTC2";
          break;
        case 36286:
          id result = "GL_COMPRESSED_SIGNED_RG_RGTC2";
          break;
        case 36288:
          id result = "GL_SAMPLER_1D_ARRAY";
          break;
        case 36289:
          id result = "GL_SAMPLER_2D_ARRAY";
          break;
        case 36290:
          id result = "GL_SAMPLER_BUFFER";
          break;
        case 36291:
          id result = "GL_SAMPLER_1D_ARRAY_SHADOW";
          break;
        case 36292:
          id result = "GL_SAMPLER_2D_ARRAY_SHADOW";
          break;
        case 36293:
          id result = "GL_SAMPLER_CUBE_SHADOW";
          break;
        case 36294:
          id result = "GL_UNSIGNED_INT_VEC2";
          break;
        case 36295:
          id result = "GL_UNSIGNED_INT_VEC3";
          break;
        case 36296:
          id result = "GL_UNSIGNED_INT_VEC4";
          break;
        case 36297:
          id result = "GL_INT_SAMPLER_1D";
          break;
        case 36298:
          id result = "GL_INT_SAMPLER_2D";
          break;
        case 36299:
          id result = "GL_INT_SAMPLER_3D";
          break;
        case 36300:
          id result = "GL_INT_SAMPLER_CUBE";
          break;
        case 36301:
          id result = "GL_INT_SAMPLER_2D_RECT";
          break;
        case 36302:
          id result = "GL_INT_SAMPLER_1D_ARRAY";
          break;
        case 36303:
          id result = "GL_INT_SAMPLER_2D_ARRAY";
          break;
        case 36304:
          id result = "GL_INT_SAMPLER_BUFFER";
          break;
        case 36305:
          id result = "GL_UNSIGNED_INT_SAMPLER_1D";
          break;
        case 36306:
          id result = "GL_UNSIGNED_INT_SAMPLER_2D";
          break;
        case 36307:
          id result = "GL_UNSIGNED_INT_SAMPLER_3D";
          break;
        case 36308:
          id result = "GL_UNSIGNED_INT_SAMPLER_CUBE";
          break;
        case 36309:
          id result = "GL_UNSIGNED_INT_SAMPLER_2D_RECT";
          break;
        case 36310:
          id result = "GL_UNSIGNED_INT_SAMPLER_1D_ARRAY";
          break;
        case 36311:
          id result = "GL_UNSIGNED_INT_SAMPLER_2D_ARRAY";
          break;
        case 36312:
          id result = "GL_UNSIGNED_INT_SAMPLER_BUFFER";
          break;
        case 36313:
          id result = "GL_GEOMETRY_SHADER";
          break;
        case 36314:
          id result = "GL_GEOMETRY_VERTICES_OUT_EXT";
          break;
        case 36315:
          id result = "GL_GEOMETRY_INPUT_TYPE_EXT";
          break;
        case 36316:
          id result = "GL_GEOMETRY_OUTPUT_TYPE_EXT";
          break;
        case 36317:
          id result = "GL_MAX_GEOMETRY_VARYING_COMPONENTS_EXT";
          break;
        case 36318:
          id result = "GL_MAX_VERTEX_VARYING_COMPONENTS_EXT";
          break;
        case 36319:
          id result = "GL_MAX_GEOMETRY_UNIFORM_COMPONENTS";
          break;
        case 36320:
          id result = "GL_MAX_GEOMETRY_OUTPUT_VERTICES";
          break;
        case 36321:
          id result = "GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS";
          break;
        case 36322:
          id result = "GL_MAX_VERTEX_BINDABLE_UNIFORMS_EXT";
          break;
        case 36323:
          id result = "GL_MAX_FRAGMENT_BINDABLE_UNIFORMS_EXT";
          break;
        case 36324:
          id result = "GL_MAX_GEOMETRY_BINDABLE_UNIFORMS_EXT";
          break;
        case 36325:
          id result = "GL_ACTIVE_SUBROUTINES";
          break;
        case 36326:
          id result = "GL_ACTIVE_SUBROUTINE_UNIFORMS";
          break;
        case 36327:
          id result = "GL_MAX_SUBROUTINES";
          break;
        case 36328:
          id result = "GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS";
          break;
        case 36329:
          id result = "GL_NAMED_STRING_LENGTH_ARB";
          break;
        case 36330:
          id result = "GL_NAMED_STRING_TYPE_ARB";
          break;
        case 36333:
          id result = "GL_MAX_BINDABLE_UNIFORM_SIZE_EXT";
          break;
        case 36334:
          id result = "GL_UNIFORM_BUFFER_EXT";
          break;
        case 36335:
          id result = "GL_UNIFORM_BUFFER_BINDING_EXT";
          break;
        case 36336:
          id result = "GL_LOW_FLOAT";
          break;
        case 36337:
          id result = "GL_MEDIUM_FLOAT";
          break;
        case 36338:
          id result = "GL_HIGH_FLOAT";
          break;
        case 36339:
          id result = "GL_LOW_INT";
          break;
        case 36340:
          id result = "GL_MEDIUM_INT";
          break;
        case 36341:
          id result = "GL_HIGH_INT";
          break;
        case 36344:
          id result = "GL_SHADER_BINARY_FORMATS";
          break;
        case 36345:
          id result = "GL_NUM_SHADER_BINARY_FORMATS";
          break;
        case 36346:
          id result = "GL_SHADER_COMPILER";
          break;
        case 36347:
          id result = "GL_MAX_VERTEX_UNIFORM_VECTORS";
          break;
        case 36348:
          id result = "GL_MAX_VARYING_VECTORS";
          break;
        case 36349:
          id result = "GL_MAX_FRAGMENT_UNIFORM_VECTORS";
          break;
        case 36371:
          id result = "GL_QUERY_WAIT";
          break;
        case 36372:
          id result = "GL_QUERY_NO_WAIT";
          break;
        case 36373:
          id result = "GL_QUERY_BY_REGION_WAIT";
          break;
        case 36374:
          id result = "GL_QUERY_BY_REGION_NO_WAIT";
          break;
        case 36382:
          id result = "GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS";
          break;
        case 36383:
          id result = "GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS";
          break;
        case 36386:
          id result = "GL_TRANSFORM_FEEDBACK";
          break;
        case 36387:
          id result = "GL_TRANSFORM_FEEDBACK_PAUSED";
          break;
        case 36388:
          id result = "GL_TRANSFORM_FEEDBACK_ACTIVE";
          break;
        case 36389:
          id result = "GL_TRANSFORM_FEEDBACK_BINDING";
          break;
        case 36392:
          id result = "GL_TIMESTAMP";
          break;
        case 36418:
          id result = "GL_TEXTURE_SWIZZLE_R";
          break;
        case 36419:
          id result = "GL_TEXTURE_SWIZZLE_G";
          break;
        case 36420:
          id result = "GL_TEXTURE_SWIZZLE_B";
          break;
        case 36421:
          id result = "GL_TEXTURE_SWIZZLE_A";
          break;
        case 36422:
          id result = "GL_TEXTURE_SWIZZLE_RGBA";
          break;
        case 36423:
          id result = "GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS";
          break;
        case 36424:
          id result = "GL_ACTIVE_SUBROUTINE_MAX_LENGTH";
          break;
        case 36425:
          id result = "GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH";
          break;
        case 36426:
          id result = "GL_NUM_COMPATIBLE_SUBROUTINES";
          break;
        case 36427:
          id result = "GL_COMPATIBLE_SUBROUTINES";
          break;
        case 36428:
          id result = "GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION";
          break;
        case 36429:
          id result = "GL_FIRST_VERTEX_CONVENTION";
          break;
        case 36430:
          id result = "GL_LAST_VERTEX_CONVENTION";
          break;
        case 36431:
          id result = "GL_PROVOKING_VERTEX";
          break;
        case 36432:
          id result = "GL_SAMPLE_POSITION";
          break;
        case 36433:
          id result = "GL_SAMPLE_MASK";
          break;
        case 36434:
          id result = "GL_SAMPLE_MASK_VALUE";
          break;
        case 36441:
          id result = "GL_MAX_SAMPLE_MASK_WORDS";
          break;
        case 36442:
          id result = "GL_MAX_GEOMETRY_SHADER_INVOCATIONS";
          break;
        case 36443:
          id result = "GL_MIN_FRAGMENT_INTERPOLATION_OFFSET";
          break;
        case 36444:
          id result = "GL_MAX_FRAGMENT_INTERPOLATION_OFFSET";
          break;
        case 36445:
          id result = "GL_FRAGMENT_INTERPOLATION_OFFSET_BITS";
          break;
        case 36446:
          id result = "GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET";
          break;
        case 36447:
          id result = "GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET";
          break;
        case 36464:
          id result = "GL_MAX_TRANSFORM_FEEDBACK_BUFFERS";
          break;
        case 36465:
          id result = "GL_MAX_VERTEX_STREAMS";
          break;
        case 36466:
          id result = "GL_PATCH_VERTICES";
          break;
        case 36467:
          id result = "GL_PATCH_DEFAULT_INNER_LEVEL";
          break;
        case 36468:
          id result = "GL_PATCH_DEFAULT_OUTER_LEVEL";
          break;
        case 36469:
          id result = "GL_TESS_CONTROL_OUTPUT_VERTICES";
          break;
        case 36470:
          id result = "GL_TESS_GEN_MODE";
          break;
        case 36471:
          id result = "GL_TESS_GEN_SPACING";
          break;
        case 36472:
          id result = "GL_TESS_GEN_VERTEX_ORDER";
          break;
        case 36473:
          id result = "GL_TESS_GEN_POINT_MODE";
          break;
        case 36474:
          id result = "GL_ISOLINES";
          break;
        case 36475:
          id result = "GL_FRACTIONAL_ODD";
          break;
        case 36476:
          id result = "GL_FRACTIONAL_EVEN";
          break;
        case 36477:
          id result = "GL_MAX_PATCH_VERTICES";
          break;
        case 36478:
          id result = "GL_MAX_TESS_GEN_LEVEL";
          break;
        case 36479:
          id result = "GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS";
          break;
        case 36480:
          id result = "GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS";
          break;
        case 36481:
          id result = "GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS";
          break;
        case 36482:
          id result = "GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS";
          break;
        case 36483:
          id result = "GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS";
          break;
        case 36484:
          id result = "GL_MAX_TESS_PATCH_COMPONENTS";
          break;
        case 36485:
          id result = "GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS";
          break;
        case 36486:
          id result = "GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS";
          break;
        case 36487:
          id result = "GL_TESS_EVALUATION_SHADER";
          break;
        case 36488:
          id result = "GL_TESS_CONTROL_SHADER";
          break;
        case 36489:
          id result = "GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS";
          break;
        case 36490:
          id result = "GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS";
          break;
        case 36662:
          id result = "GL_COPY_READ_BUFFER";
          break;
        case 36663:
          id result = "GL_COPY_WRITE_BUFFER";
          break;
        case 36671:
          id result = "GL_DRAW_INDIRECT_BUFFER";
          break;
        case 36675:
          id result = "GL_DRAW_INDIRECT_BUFFER_BINDING";
          break;
        case 36678:
          id result = "GL_DOUBLE_MAT2";
          break;
        case 36679:
          id result = "GL_DOUBLE_MAT3";
          break;
        case 36680:
          id result = "GL_DOUBLE_MAT4";
          break;
        case 36681:
          id result = "GL_DOUBLE_MAT2x3";
          break;
        case 36682:
          id result = "GL_DOUBLE_MAT2x4";
          break;
        case 36683:
          id result = "GL_DOUBLE_MAT3x2";
          break;
        case 36684:
          id result = "GL_DOUBLE_MAT3x4";
          break;
        case 36685:
          id result = "GL_DOUBLE_MAT4x2";
          break;
        case 36686:
          id result = "GL_DOUBLE_MAT4x3";
          break;
        case 36756:
          id result = "GL_R8_SNORM";
          break;
        case 36757:
          id result = "GL_RG8_SNORM";
          break;
        case 36758:
          id result = "GL_RGB8_SNORM";
          break;
        case 36759:
          id result = "GL_RGBA8_SNORM";
          break;
        case 36760:
          id result = "GL_R16_SNORM";
          break;
        case 36761:
          id result = "GL_RG16_SNORM";
          break;
        case 36762:
          id result = "GL_RGB16_SNORM";
          break;
        case 36763:
          id result = "GL_RGBA16_SNORM";
          break;
        case 36764:
          id result = "GL_SIGNED_NORMALIZED";
          break;
        case 36765:
          id result = "GL_PRIMITIVE_RESTART";
          break;
        case 36766:
          id result = "GL_PRIMITIVE_RESTART_INDEX";
          break;
        case 36767:
          id result = "GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB";
          break;
        case 36860:
          id result = "GL_DOUBLE_VEC2";
          break;
        case 36861:
          id result = "GL_DOUBLE_VEC3";
          break;
        case 36862:
          id result = "GL_DOUBLE_VEC4";
          break;
        case 36873:
          id result = "GL_TEXTURE_CUBE_MAP_ARRAY";
          break;
        case 36874:
          id result = "GL_TEXTURE_BINDING_CUBE_MAP_ARRAY";
          break;
        case 36875:
          id result = "GL_PROXY_TEXTURE_CUBE_MAP_ARRAY";
          break;
        case 36876:
          id result = "GL_SAMPLER_CUBE_MAP_ARRAY";
          break;
        case 36877:
          id result = "GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW";
          break;
        case 36878:
          id result = "GL_INT_SAMPLER_CUBE_MAP_ARRAY";
          break;
        case 36879:
          id result = "GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY";
          break;
        case 36975:
          id result = "GL_RGB10_A2UI";
          break;
        case 37050:
          id result = "GL_SCALED_RESOLVE_FASTEST_EXT";
          break;
        case 37051:
          id result = "GL_SCALED_RESOLVE_NICEST_EXT";
          break;
        case 37120:
          id result = "GL_TEXTURE_2D_MULTISAMPLE";
          break;
        case 37121:
          id result = "GL_PROXY_TEXTURE_2D_MULTISAMPLE";
          break;
        case 37122:
          id result = "GL_TEXTURE_2D_MULTISAMPLE_ARRAY";
          break;
        case 37123:
          id result = "GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY";
          break;
        case 37124:
          id result = "GL_TEXTURE_BINDING_2D_MULTISAMPLE";
          break;
        case 37125:
          id result = "GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY";
          break;
        case 37126:
          id result = "GL_TEXTURE_SAMPLES";
          break;
        case 37127:
          id result = "GL_TEXTURE_FIXED_SAMPLE_LOCATIONS";
          break;
        case 37128:
          id result = "GL_SAMPLER_2D_MULTISAMPLE";
          break;
        case 37129:
          id result = "GL_INT_SAMPLER_2D_MULTISAMPLE";
          break;
        case 37130:
          id result = "GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE";
          break;
        case 37131:
          id result = "GL_SAMPLER_2D_MULTISAMPLE_ARRAY";
          break;
        case 37132:
          id result = "GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY";
          break;
        case 37133:
          id result = "GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY";
          break;
        case 37134:
          id result = "GL_MAX_COLOR_TEXTURE_SAMPLES";
          break;
        case 37135:
          id result = "GL_MAX_DEPTH_TEXTURE_SAMPLES";
          break;
        case 37136:
          id result = "GL_MAX_INTEGER_SAMPLES";
          break;
        case 37137:
          id result = "GL_MAX_SERVER_WAIT_TIMEOUT";
          break;
        case 37138:
          id result = "GL_OBJECT_TYPE";
          break;
        case 37139:
          id result = "GL_SYNC_CONDITION";
          break;
        case 37140:
          id result = "GL_SYNC_STATUS";
          break;
        case 37141:
          id result = "GL_SYNC_FLAGS";
          break;
        case 37142:
          id result = "GL_SYNC_FENCE";
          break;
        case 37143:
          id result = "GL_SYNC_GPU_COMMANDS_COMPLETE";
          break;
        case 37144:
          id result = "GL_UNSIGNALED";
          break;
        case 37145:
          id result = "GL_SIGNALED";
          break;
        case 37146:
          id result = "GL_ALREADY_SIGNALED";
          break;
        case 37147:
          id result = "GL_TIMEOUT_EXPIRED";
          break;
        case 37148:
          id result = "GL_CONDITION_SATISFIED";
          break;
        case 37149:
          id result = "GL_WAIT_FAILED";
          break;
        case 37151:
          id result = "GL_BUFFER_ACCESS_FLAGS";
          break;
        case 37152:
          id result = "GL_BUFFER_MAP_LENGTH";
          break;
        case 37153:
          id result = "GL_BUFFER_MAP_OFFSET";
          break;
        case 37154:
          id result = "GL_MAX_VERTEX_OUTPUT_COMPONENTS";
          break;
        case 37155:
          id result = "GL_MAX_GEOMETRY_INPUT_COMPONENTS";
          break;
        case 37156:
          id result = "GL_MAX_GEOMETRY_OUTPUT_COMPONENTS";
          break;
        case 37157:
          id result = "GL_MAX_FRAGMENT_INPUT_COMPONENTS";
          break;
        case 37158:
          id result = "GL_CONTEXT_PROFILE_MASK";
          break;
        case 37167:
          id result = "GL_TEXTURE_IMMUTABLE_FORMAT";
          break;
        case 37201:
          id result = "GL_BUFFER_OBJECT_EXT";
          break;
        case 37203:
          id result = "GL_QUERY_OBJECT_EXT";
          break;
        case 37204:
          id result = "GL_VERTEX_ARRAY_OBJECT_EXT";
          break;
        case 37488:
          id result = "GL_COMPRESSED_R11_EAC";
          break;
        case 37489:
          id result = "GL_COMPRESSED_SIGNED_R11_EAC";
          break;
        case 37490:
          id result = "GL_COMPRESSED_RG11_EAC";
          break;
        case 37491:
          id result = "GL_COMPRESSED_SIGNED_RG11_EAC";
          break;
        case 37492:
          id result = "GL_COMPRESSED_RGB8_ETC2";
          break;
        case 37493:
          id result = "GL_COMPRESSED_SRGB8_ETC2";
          break;
        case 37494:
          id result = "GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2";
          break;
        case 37495:
          id result = "GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2";
          break;
        case 37496:
          id result = "GL_COMPRESSED_RGBA8_ETC2_EAC";
          break;
        case 37497:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC";
          break;
        case 37760:
          id result = "GL_NUM_SAMPLE_COUNTS";
          break;
        case 37793:
          id result = "GL_BGRA8_EXT";
          break;
        case 37808:
          id result = "GL_COMPRESSED_RGBA_ASTC_4x4_KHR";
          break;
        case 37809:
          id result = "GL_COMPRESSED_RGBA_ASTC_5x4_KHR";
          break;
        case 37810:
          id result = "GL_COMPRESSED_RGBA_ASTC_5x5_KHR";
          break;
        case 37811:
          id result = "GL_COMPRESSED_RGBA_ASTC_6x5_KHR";
          break;
        case 37812:
          id result = "GL_COMPRESSED_RGBA_ASTC_6x6_KHR";
          break;
        case 37813:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x5_KHR";
          break;
        case 37814:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x6_KHR";
          break;
        case 37815:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x8_KHR";
          break;
        case 37816:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x5_KHR";
          break;
        case 37817:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x6_KHR";
          break;
        case 37818:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x8_KHR";
          break;
        case 37819:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x10_KHR";
          break;
        case 37820:
          id result = "GL_COMPRESSED_RGBA_ASTC_12x10_KHR";
          break;
        case 37821:
          id result = "GL_COMPRESSED_RGBA_ASTC_12x12_KHR";
          break;
        case 37840:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR";
          break;
        case 37841:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR";
          break;
        case 37842:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR";
          break;
        case 37843:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR";
          break;
        case 37844:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR";
          break;
        case 37845:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR";
          break;
        case 37846:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR";
          break;
        case 37847:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR";
          break;
        case 37848:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR";
          break;
        case 37849:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR";
          break;
        case 37850:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR";
          break;
        case 37851:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR";
          break;
        case 37852:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR";
          break;
        case 37853:
          id result = "GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR";
          break;
        case 37874:
          id result = "GL_XRSRGB10_APPLE";
          break;
        case 37875:
          id result = "GL_YCBCR10_422_2PLANE_PACKED_APPLE";
          break;
        case 37876:
          id result = "GL_YCBCR10_420_2PLANE_PACKED_APPLE";
          break;
        case 37877:
          id result = "GL_YCBCR10_444_2PLANE_PACKED_APPLE";
          break;
        case 37878:
          id result = "GL_SRGB_YCBCR10_422_2PLANE_PACKED_APPLE";
          break;
        case 37879:
          id result = "GL_SRGB_YCBCR10_420_2PLANE_PACKED_APPLE";
          break;
        case 37880:
          id result = "GL_SRGB_YCBCR10_444_2PLANE_PACKED_APPLE";
          break;
        case 37881:
          id result = "GL_XRSRGB10_PLANE_A8_PLANE_APPLE";
          break;
        case 37882:
          id result = "GL_UNSIGNED_INT_2_10_10_10_PLANE_UNSIGNED_BYTE_PLANE_APPLE";
          break;
        case 37883:
          id result = "GL_RGB8_420_2PLANE_APPLE";
          break;
        case 37884:
          id result = "GL_RGB8_422_2PLANE_APPLE";
          break;
        case 37885:
          id result = "GL_RGB8_444_2PLANE_APPLE";
          break;
        case 37886:
          id result = "GL_COMPRESSED_RGBA_ASTC_4x2_LOWPRECISION_APPLE";
          break;
        case 37887:
          id result = "GL_COMPRESSED_RGBA_ASTC_4x4_LOWPRECISION_APPLE";
          break;
        case 37888:
          id result = "GL_COMPRESSED_RGBA_ASTC_5x4_LOWPRECISION_APPLE";
          break;
        case 37889:
          id result = "GL_COMPRESSED_RGBA_ASTC_5x5_LOWPRECISION_APPLE";
          break;
        case 37890:
          id result = "GL_COMPRESSED_RGBA_ASTC_6x5_LOWPRECISION_APPLE";
          break;
        case 37891:
          id result = "GL_COMPRESSED_RGBA_ASTC_6x6_LOWPRECISION_APPLE";
          break;
        case 37892:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x4_LOWPRECISION_APPLE";
          break;
        case 37893:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x5_LOWPRECISION_APPLE";
          break;
        case 37894:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x6_LOWPRECISION_APPLE";
          break;
        case 37895:
          id result = "GL_COMPRESSED_RGBA_ASTC_8x8_LOWPRECISION_APPLE";
          break;
        case 37896:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x5_LOWPRECISION_APPLE";
          break;
        case 37897:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x6_LOWPRECISION_APPLE";
          break;
        case 37898:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x8_LOWPRECISION_APPLE";
          break;
        case 37899:
          id result = "GL_COMPRESSED_RGBA_ASTC_10x10_LOWPRECISION_APPLE";
          break;
        case 37900:
          id result = "GL_COMPRESSED_RGBA_ASTC_12x10_LOWPRECISION_APPLE";
          break;
        case 37901:
          id result = "GL_COMPRESSED_RGBA_ASTC_12x12_LOWPRECISION_APPLE";
          break;
        default:
          return 0;
      }
      return result;
    }
    if (a1 >= 0x80000)
    {
      switch(a1)
      {
        case 0x80000:
          return "GL_SCISSOR_BIT";
        case 0xFFFFF:
          return "GL_ALL_ATTRIB_BITS";
        case 0x20000000:
          return "GL_MULTISAMPLE_BIT";
      }
    }
    else
    {
      switch(a1)
      {
        case 0x10000:
          return "GL_EVAL_BIT";
        case 0x20000:
          return "GL_LIST_BIT";
        case 0x40000:
          return "GL_TEXTURE_BIT";
      }
    }
    return 0;
  }
  if (a1 > 4095)
  {
    if (a1 <= 7167)
    {
      if (a1 > 5631)
      {
        if (a1 <= 6399)
        {
          if (a1 > 5888)
          {
            if (a1 <= 6143)
            {
              if (a1 == 5889) {
                return "GL_PROJECTION";
              }
              if (a1 == 5890) {
                return "GL_TEXTURE";
              }
            }
            else
            {
              switch(a1)
              {
                case 6144:
                  return "GL_COLOR";
                case 6145:
                  return "GL_DEPTH";
                case 6146:
                  return "GL_STENCIL";
              }
            }
            return 0;
          }
          switch(a1)
          {
            case 5632:
              id result = "GL_EMISSION";
              break;
            case 5633:
              id result = "GL_SHININESS";
              break;
            case 5634:
              id result = "GL_AMBIENT_AND_DIFFUSE";
              break;
            case 5635:
              id result = "GL_COLOR_INDEXES";
              break;
            default:
              if (a1 != 5888) {
                return 0;
              }
              id result = "GL_MODELVIEW";
              break;
          }
        }
        else
        {
          if (a1 > 6655)
          {
            if (a1 > 6912)
            {
              if (a1 == 6913) {
                return "GL_LINE";
              }
              if (a1 == 6914) {
                return "GL_FILL";
              }
            }
            else
            {
              if (a1 == 6656) {
                return "GL_BITMAP";
              }
              if (a1 == 6912) {
                return "GL_POINT";
              }
            }
            return 0;
          }
          switch(a1)
          {
            case 6400:
              id result = "GL_COLOR_INDEX";
              break;
            case 6401:
              id result = "GL_STENCIL_INDEX";
              break;
            case 6402:
              id result = "GL_DEPTH_COMPONENT";
              break;
            case 6403:
              id result = "GL_RED";
              break;
            case 6404:
              id result = "GL_GREEN";
              break;
            case 6405:
              id result = "GL_BLUE";
              break;
            case 6406:
              id result = "GL_ALPHA";
              break;
            case 6407:
              id result = "GL_RGB";
              break;
            case 6408:
              id result = "GL_RGBA";
              break;
            case 6409:
              id result = "GL_LUMINANCE";
              break;
            case 6410:
              id result = "GL_LUMINANCE_ALPHA";
              break;
            default:
              return 0;
          }
        }
      }
      else if (a1 <= 4863)
      {
        if (a1 <= 4353)
        {
          switch(a1)
          {
            case 4096:
              return "GL_TEXTURE_WIDTH";
            case 4097:
              return "GL_TEXTURE_HEIGHT";
            case 4098:
              return 0;
            case 4099:
              return "GL_TEXTURE_INTERNAL_FORMAT";
            case 4100:
              return "GL_TEXTURE_BORDER_COLOR";
            case 4101:
              return "GL_TEXTURE_BORDER";
            default:
              if (a1 == 4352)
              {
                id result = "GL_DONT_CARE";
              }
              else
              {
                if (a1 != 4353) {
                  return 0;
                }
                id result = "GL_FASTEST";
              }
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 4608:
              id result = "GL_AMBIENT";
              break;
            case 4609:
              id result = "GL_DIFFUSE";
              break;
            case 4610:
              id result = "GL_SPECULAR";
              break;
            case 4611:
              id result = "GL_POSITION";
              break;
            case 4612:
              id result = "GL_SPOT_DIRECTION";
              break;
            case 4613:
              id result = "GL_SPOT_EXPONENT";
              break;
            case 4614:
              id result = "GL_SPOT_CUTOFF";
              break;
            case 4615:
              id result = "GL_CONSTANT_ATTENUATION";
              break;
            case 4616:
              id result = "GL_LINEAR_ATTENUATION";
              break;
            case 4617:
              id result = "GL_QUADRATIC_ATTENUATION";
              break;
            default:
              if (a1 != 4354) {
                return 0;
              }
              id result = "GL_NICEST";
              break;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 5120:
            return "GL_BYTE";
          case 5121:
            return "GL_UNSIGNED_BYTE";
          case 5122:
            return "GL_SHORT";
          case 5123:
            return "GL_UNSIGNED_SHORT";
          case 5124:
            return "GL_INT";
          case 5125:
            return "GL_UNSIGNED_INT";
          case 5126:
            return "GL_FLOAT";
          case 5127:
            return "GL_2_BYTES";
          case 5128:
            return "GL_3_BYTES";
          case 5129:
            return "GL_4_BYTES";
          case 5130:
            return "GL_DOUBLE";
          case 5131:
            return "GL_HALF_FLOAT";
          case 5132:
            return "GL_FIXED";
          case 5133:
          case 5134:
          case 5135:
          case 5136:
          case 5137:
          case 5138:
          case 5139:
          case 5140:
          case 5141:
          case 5142:
          case 5143:
          case 5144:
          case 5145:
          case 5146:
          case 5147:
          case 5148:
          case 5149:
          case 5150:
          case 5151:
          case 5152:
          case 5153:
          case 5154:
          case 5155:
          case 5156:
          case 5157:
          case 5158:
          case 5159:
          case 5160:
          case 5161:
          case 5162:
          case 5163:
          case 5164:
          case 5165:
          case 5166:
          case 5167:
          case 5168:
          case 5169:
          case 5170:
          case 5171:
          case 5172:
          case 5173:
          case 5174:
          case 5175:
          case 5176:
          case 5177:
          case 5178:
          case 5179:
          case 5180:
          case 5181:
          case 5182:
          case 5183:
          case 5184:
          case 5185:
          case 5186:
          case 5187:
          case 5188:
          case 5189:
          case 5190:
          case 5191:
          case 5192:
          case 5193:
          case 5194:
          case 5195:
          case 5196:
          case 5197:
          case 5198:
          case 5199:
          case 5200:
          case 5201:
          case 5202:
          case 5203:
          case 5204:
          case 5205:
          case 5206:
          case 5207:
          case 5208:
          case 5209:
          case 5210:
          case 5211:
          case 5212:
          case 5213:
          case 5214:
          case 5215:
          case 5216:
          case 5217:
          case 5218:
          case 5219:
          case 5220:
          case 5221:
          case 5222:
          case 5223:
          case 5224:
          case 5225:
          case 5226:
          case 5227:
          case 5228:
          case 5229:
          case 5230:
          case 5231:
          case 5232:
          case 5233:
          case 5234:
          case 5235:
          case 5236:
          case 5237:
          case 5238:
          case 5239:
          case 5240:
          case 5241:
          case 5242:
          case 5243:
          case 5244:
          case 5245:
          case 5246:
          case 5247:
          case 5248:
          case 5249:
          case 5250:
          case 5251:
          case 5252:
          case 5253:
          case 5254:
          case 5255:
          case 5256:
          case 5257:
          case 5258:
          case 5259:
          case 5260:
          case 5261:
          case 5262:
          case 5263:
          case 5264:
          case 5265:
          case 5266:
          case 5267:
          case 5268:
          case 5269:
          case 5270:
          case 5271:
          case 5272:
          case 5273:
          case 5274:
          case 5275:
          case 5276:
          case 5277:
          case 5278:
          case 5279:
          case 5280:
          case 5281:
          case 5282:
          case 5283:
          case 5284:
          case 5285:
          case 5286:
          case 5287:
          case 5288:
          case 5289:
          case 5290:
          case 5291:
          case 5292:
          case 5293:
          case 5294:
          case 5295:
          case 5296:
          case 5297:
          case 5298:
          case 5299:
          case 5300:
          case 5301:
          case 5302:
          case 5303:
          case 5304:
          case 5305:
          case 5306:
          case 5307:
          case 5308:
          case 5309:
          case 5310:
          case 5311:
          case 5312:
          case 5313:
          case 5314:
          case 5315:
          case 5316:
          case 5317:
          case 5318:
          case 5319:
          case 5320:
          case 5321:
          case 5322:
          case 5323:
          case 5324:
          case 5325:
          case 5326:
          case 5327:
          case 5328:
          case 5329:
          case 5330:
          case 5331:
          case 5332:
          case 5333:
          case 5334:
          case 5335:
          case 5336:
          case 5337:
          case 5338:
          case 5339:
          case 5340:
          case 5341:
          case 5342:
          case 5343:
          case 5344:
          case 5345:
          case 5346:
          case 5347:
          case 5348:
          case 5349:
          case 5350:
          case 5351:
          case 5352:
          case 5353:
          case 5354:
          case 5355:
          case 5356:
          case 5357:
          case 5358:
          case 5359:
          case 5360:
          case 5361:
          case 5362:
          case 5363:
          case 5364:
          case 5365:
          case 5366:
          case 5367:
          case 5368:
          case 5369:
          case 5370:
          case 5371:
          case 5372:
          case 5373:
          case 5374:
          case 5375:
            return 0;
          case 5376:
            return "GL_CLEAR";
          case 5377:
            return "GL_AND";
          case 5378:
            return "GL_AND_REVERSE";
          case 5379:
            return "GL_COPY";
          case 5380:
            return "GL_AND_INVERTED";
          case 5381:
            return "GL_NOOP";
          case 5382:
            return "GL_XOR";
          case 5383:
            return "GL_OR";
          case 5384:
            return "GL_NOR";
          case 5385:
            return "GL_EQUIV";
          case 5386:
            return "GL_INVERT";
          case 5387:
            return "GL_OR_REVERSE";
          case 5388:
            return "GL_COPY_INVERTED";
          case 5389:
            return "GL_OR_INVERTED";
          case 5390:
            return "GL_NAND";
          case 5391:
            return "GL_SET";
          default:
            if (a1 == 4864)
            {
              id result = "GL_COMPILE";
            }
            else
            {
              if (a1 != 4865) {
                return 0;
              }
              id result = "GL_COMPILE_AND_EXECUTE";
            }
            break;
        }
      }
    }
    else if (a1 > 10494)
    {
      if (a1 <= 10751)
      {
        switch(a1)
        {
          case 10495:
            return "GL_TEXTURE_SUBIMAGE_SYNC";
          case 10496:
            return "GL_CLAMP";
          case 10497:
            return "GL_REPEAT";
        }
        return 0;
      }
      switch(a1)
      {
        case 10752:
          id result = "GL_POLYGON_OFFSET_UNITS";
          break;
        case 10753:
          id result = "GL_POLYGON_OFFSET_POINT";
          break;
        case 10754:
          id result = "GL_POLYGON_OFFSET_LINE";
          break;
        case 10755:
        case 10756:
        case 10757:
        case 10758:
        case 10759:
        case 10760:
        case 10761:
        case 10762:
        case 10763:
        case 10764:
        case 10765:
        case 10766:
        case 10767:
        case 10769:
        case 10770:
        case 10771:
        case 10772:
        case 10773:
        case 10774:
        case 10775:
        case 10776:
        case 10777:
        case 10778:
        case 10779:
        case 10780:
        case 10781:
        case 10782:
        case 10783:
          return 0;
        case 10768:
          id result = "GL_R3_G3_B2";
          break;
        case 10784:
          id result = "GL_V2F";
          break;
        case 10785:
          id result = "GL_V3F";
          break;
        case 10786:
          id result = "GL_C4UB_V2F";
          break;
        case 10787:
          id result = "GL_C4UB_V3F";
          break;
        case 10788:
          id result = "GL_C3F_V3F";
          break;
        case 10789:
          id result = "GL_N3F_V3F";
          break;
        case 10790:
          id result = "GL_C4F_N3F_V3F";
          break;
        case 10791:
          id result = "GL_T2F_V3F";
          break;
        case 10792:
          id result = "GL_T4F_V4F";
          break;
        case 10793:
          id result = "GL_T2F_C4UB_V3F";
          break;
        case 10794:
          id result = "GL_T2F_C3F_V3F";
          break;
        case 10795:
          id result = "GL_T2F_N3F_V3F";
          break;
        case 10796:
          id result = "GL_T2F_C4F_N3F_V3F";
          break;
        case 10797:
          id result = "GL_T4F_C4F_N3F_V4F";
          break;
        default:
          switch(a1)
          {
            case 16384:
              id result = "GL_LIGHT0";
              break;
            case 16385:
              id result = "GL_LIGHT1";
              break;
            case 16386:
              id result = "GL_LIGHT2";
              break;
            case 16387:
              id result = "GL_LIGHT3";
              break;
            case 16388:
              id result = "GL_LIGHT4";
              break;
            case 16389:
              id result = "GL_LIGHT5";
              break;
            case 16390:
              id result = "GL_LIGHT6";
              break;
            case 16391:
              id result = "GL_LIGHT7";
              break;
            default:
              return 0;
          }
          break;
      }
    }
    else if (a1 > 8703)
    {
      if (a1 <= 9727)
      {
        if (a1 <= 9216)
        {
          if (a1 > 8959)
          {
            if (a1 == 8960) {
              return "GL_TEXTURE_ENV";
            }
            if (a1 == 9216) {
              return "GL_EYE_LINEAR";
            }
          }
          else
          {
            if (a1 == 8704) {
              return "GL_TEXTURE_ENV_MODE";
            }
            if (a1 == 8705) {
              return "GL_TEXTURE_ENV_COLOR";
            }
          }
        }
        else if (a1 <= 9471)
        {
          if (a1 == 9217) {
            return "GL_OBJECT_LINEAR";
          }
          if (a1 == 9218) {
            return "GL_SPHERE_MAP";
          }
        }
        else
        {
          switch(a1)
          {
            case 9472:
              return "GL_TEXTURE_GEN_MODE";
            case 9473:
              return "GL_OBJECT_PLANE";
            case 9474:
              return "GL_EYE_PLANE";
          }
        }
        return 0;
      }
      if (a1 > 10239)
      {
        switch(a1)
        {
          case 10240:
            id result = "GL_TEXTURE_MAG_FILTER";
            break;
          case 10241:
            id result = "GL_TEXTURE_MIN_FILTER";
            break;
          case 10242:
            id result = "GL_TEXTURE_WRAP_S";
            break;
          case 10243:
            id result = "GL_TEXTURE_WRAP_T";
            break;
          default:
            return 0;
        }
      }
      else
      {
        switch(a1)
        {
          case 9984:
            id result = "GL_NEAREST_MIPMAP_NEAREST";
            break;
          case 9985:
            id result = "GL_LINEAR_MIPMAP_NEAREST";
            break;
          case 9986:
            id result = "GL_NEAREST_MIPMAP_LINEAR";
            break;
          case 9987:
            id result = "GL_LINEAR_MIPMAP_LINEAR";
            break;
          default:
            if (a1 == 9728)
            {
              id result = "GL_NEAREST";
            }
            else
            {
              if (a1 != 9729) {
                return 0;
              }
              id result = "GL_LINEAR";
            }
            break;
        }
      }
    }
    else if (a1 <= 7935)
    {
      if (a1 <= 7423)
      {
        switch(a1)
        {
          case 7168:
            return "GL_RENDER";
          case 7169:
            return "GL_FEEDBACK";
          case 7170:
            return "GL_SELECT";
        }
        return 0;
      }
      switch(a1)
      {
        case 7680:
          id result = "GL_KEEP";
          break;
        case 7681:
          id result = "GL_REPLACE";
          break;
        case 7682:
          id result = "GL_INCR";
          break;
        case 7683:
          id result = "GL_DECR";
          break;
        default:
          if (a1 == 7424)
          {
            id result = "GL_FLAT";
          }
          else
          {
            if (a1 != 7425) {
              return 0;
            }
            id result = "GL_SMOOTH";
          }
          break;
      }
    }
    else if (a1 < 0x2000)
    {
      switch(a1)
      {
        case 7936:
          id result = "GL_VENDOR";
          break;
        case 7937:
          id result = "GL_RENDERER";
          break;
        case 7938:
          id result = "GL_VERSION";
          break;
        case 7939:
          id result = "GL_EXTENSIONS";
          break;
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 8192:
          id result = "GL_S";
          break;
        case 8193:
          id result = "GL_T";
          break;
        case 8194:
          id result = "GL_R";
          break;
        case 8195:
          id result = "GL_Q";
          break;
        default:
          if (a1 == 8448)
          {
            id result = "GL_MODULATE";
          }
          else
          {
            if (a1 != 8449) {
              return 0;
            }
            id result = "GL_DECAL";
          }
          break;
      }
    }
  }
  else if (a1 <= 1023)
  {
    if (a1 <= 255)
    {
      int v2 = a1 + 1;
      id result = "GL_FALSE";
      switch(v2)
      {
        case 0:
          id result = "GL_INVALID_INDEX";
          break;
        case 1:
          return result;
        case 2:
          id result = "GL_TRUE";
          break;
        case 3:
          id result = "GL_LINE_LOOP";
          break;
        case 4:
          id result = "GL_LINE_STRIP";
          break;
        case 5:
          id result = "GL_TRIANGLES";
          break;
        case 6:
          id result = "GL_TRIANGLE_STRIP";
          break;
        case 7:
          id result = "GL_TRIANGLE_FAN";
          break;
        case 8:
          id result = "GL_QUADS";
          break;
        case 9:
          id result = "GL_QUAD_STRIP";
          break;
        case 10:
          id result = "GL_POLYGON";
          break;
        case 11:
          id result = "GL_LINES_ADJACENCY";
          break;
        case 12:
          id result = "GL_LINE_STRIP_ADJACENCY";
          break;
        case 13:
          id result = "GL_TRIANGLES_ADJACENCY";
          break;
        case 14:
          id result = "GL_TRIANGLE_STRIP_ADJACENCY";
          break;
        case 15:
          id result = "GL_PATCHES";
          break;
        case 17:
          id result = "GL_MAP_FLUSH_EXPLICIT_BIT";
          break;
        case 33:
          id result = "GL_MAP_UNSYNCHRONIZED_BIT";
          break;
        case 65:
          id result = "GL_LIGHTING_BIT";
          break;
        case 129:
          id result = "GL_FOG_BIT";
          break;
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 512:
          id result = "GL_NEVER";
          break;
        case 513:
          id result = "GL_LESS";
          break;
        case 514:
          id result = "GL_EQUAL";
          break;
        case 515:
          id result = "GL_LEQUAL";
          break;
        case 516:
          id result = "GL_GREATER";
          break;
        case 517:
          id result = "GL_NOTEQUAL";
          break;
        case 518:
          id result = "GL_GEQUAL";
          break;
        case 519:
          id result = "GL_ALWAYS";
          break;
        default:
          switch(a1)
          {
            case 256:
              id result = "GL_ACCUM";
              break;
            case 257:
              id result = "GL_LOAD";
              break;
            case 258:
              id result = "GL_RETURN";
              break;
            case 259:
              id result = "GL_MULT";
              break;
            case 260:
              id result = "GL_ADD";
              break;
            default:
              return 0;
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        id result = "GL_INVALID_ENUM";
        break;
      case 1281:
        id result = "GL_INVALID_VALUE";
        break;
      case 1282:
        id result = "GL_INVALID_OPERATION";
        break;
      case 1283:
        id result = "GL_STACK_OVERFLOW";
        break;
      case 1284:
        id result = "GL_STACK_UNDERFLOW";
        break;
      case 1285:
        id result = "GL_OUT_OF_MEMORY";
        break;
      case 1286:
        id result = "GL_INVALID_FRAMEBUFFER_OPERATION";
        break;
      case 1287:
      case 1288:
      case 1289:
      case 1290:
      case 1291:
      case 1292:
      case 1293:
      case 1294:
      case 1295:
      case 1296:
      case 1297:
      case 1298:
      case 1299:
      case 1300:
      case 1301:
      case 1302:
      case 1303:
      case 1304:
      case 1305:
      case 1306:
      case 1307:
      case 1308:
      case 1309:
      case 1310:
      case 1311:
      case 1312:
      case 1313:
      case 1314:
      case 1315:
      case 1316:
      case 1317:
      case 1318:
      case 1319:
      case 1320:
      case 1321:
      case 1322:
      case 1323:
      case 1324:
      case 1325:
      case 1326:
      case 1327:
      case 1328:
      case 1329:
      case 1330:
      case 1331:
      case 1332:
      case 1333:
      case 1334:
      case 1335:
      case 1336:
      case 1337:
      case 1338:
      case 1339:
      case 1340:
      case 1341:
      case 1342:
      case 1343:
      case 1344:
      case 1345:
      case 1346:
      case 1347:
      case 1348:
      case 1349:
      case 1350:
      case 1351:
      case 1352:
      case 1353:
      case 1354:
      case 1355:
      case 1356:
      case 1357:
      case 1358:
      case 1359:
      case 1360:
      case 1361:
      case 1362:
      case 1363:
      case 1364:
      case 1365:
      case 1366:
      case 1367:
      case 1368:
      case 1369:
      case 1370:
      case 1371:
      case 1372:
      case 1373:
      case 1374:
      case 1375:
      case 1376:
      case 1377:
      case 1378:
      case 1379:
      case 1380:
      case 1381:
      case 1382:
      case 1383:
      case 1384:
      case 1385:
      case 1386:
      case 1387:
      case 1388:
      case 1389:
      case 1390:
      case 1391:
      case 1392:
      case 1393:
      case 1394:
      case 1395:
      case 1396:
      case 1397:
      case 1398:
      case 1399:
      case 1400:
      case 1401:
      case 1402:
      case 1403:
      case 1404:
      case 1405:
      case 1406:
      case 1407:
      case 1408:
      case 1409:
      case 1410:
      case 1411:
      case 1412:
      case 1413:
      case 1414:
      case 1415:
      case 1416:
      case 1417:
      case 1418:
      case 1419:
      case 1420:
      case 1421:
      case 1422:
      case 1423:
      case 1424:
      case 1425:
      case 1426:
      case 1427:
      case 1428:
      case 1429:
      case 1430:
      case 1431:
      case 1432:
      case 1433:
      case 1434:
      case 1435:
      case 1436:
      case 1437:
      case 1438:
      case 1439:
      case 1440:
      case 1441:
      case 1442:
      case 1443:
      case 1444:
      case 1445:
      case 1446:
      case 1447:
      case 1448:
      case 1449:
      case 1450:
      case 1451:
      case 1452:
      case 1453:
      case 1454:
      case 1455:
      case 1456:
      case 1457:
      case 1458:
      case 1459:
      case 1460:
      case 1461:
      case 1462:
      case 1463:
      case 1464:
      case 1465:
      case 1466:
      case 1467:
      case 1468:
      case 1469:
      case 1470:
      case 1471:
      case 1472:
      case 1473:
      case 1474:
      case 1475:
      case 1476:
      case 1477:
      case 1478:
      case 1479:
      case 1480:
      case 1481:
      case 1482:
      case 1483:
      case 1484:
      case 1485:
      case 1486:
      case 1487:
      case 1488:
      case 1489:
      case 1490:
      case 1491:
      case 1492:
      case 1493:
      case 1494:
      case 1495:
      case 1496:
      case 1497:
      case 1498:
      case 1499:
      case 1500:
      case 1501:
      case 1502:
      case 1503:
      case 1504:
      case 1505:
      case 1506:
      case 1507:
      case 1508:
      case 1509:
      case 1510:
      case 1511:
      case 1512:
      case 1513:
      case 1514:
      case 1515:
      case 1516:
      case 1517:
      case 1518:
      case 1519:
      case 1520:
      case 1521:
      case 1522:
      case 1523:
      case 1524:
      case 1525:
      case 1526:
      case 1527:
      case 1528:
      case 1529:
      case 1530:
      case 1531:
      case 1532:
      case 1533:
      case 1534:
      case 1535:
      case 1541:
      case 1542:
      case 1543:
      case 1544:
      case 1545:
      case 1546:
      case 1547:
      case 1548:
      case 1549:
      case 1550:
      case 1551:
      case 1552:
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1600:
      case 1601:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1629:
      case 1630:
      case 1631:
      case 1632:
      case 1633:
      case 1634:
      case 1635:
      case 1636:
      case 1637:
      case 1638:
      case 1639:
      case 1640:
      case 1641:
      case 1642:
      case 1643:
      case 1644:
      case 1645:
      case 1646:
      case 1647:
      case 1648:
      case 1649:
      case 1650:
      case 1651:
      case 1652:
      case 1653:
      case 1654:
      case 1655:
      case 1656:
      case 1657:
      case 1658:
      case 1659:
      case 1660:
      case 1661:
      case 1662:
      case 1663:
      case 1664:
      case 1665:
      case 1666:
      case 1667:
      case 1668:
      case 1669:
      case 1670:
      case 1671:
      case 1672:
      case 1673:
      case 1674:
      case 1675:
      case 1676:
      case 1677:
      case 1678:
      case 1679:
      case 1680:
      case 1681:
      case 1682:
      case 1683:
      case 1684:
      case 1685:
      case 1686:
      case 1687:
      case 1688:
      case 1689:
      case 1690:
      case 1691:
      case 1692:
      case 1693:
      case 1694:
      case 1695:
      case 1696:
      case 1697:
      case 1698:
      case 1699:
      case 1700:
      case 1701:
      case 1702:
      case 1703:
      case 1704:
      case 1705:
      case 1706:
      case 1707:
      case 1708:
      case 1709:
      case 1710:
      case 1711:
      case 1712:
      case 1713:
      case 1714:
      case 1715:
      case 1716:
      case 1717:
      case 1718:
      case 1719:
      case 1720:
      case 1721:
      case 1722:
      case 1723:
      case 1724:
      case 1725:
      case 1726:
      case 1727:
      case 1728:
      case 1729:
      case 1730:
      case 1731:
      case 1732:
      case 1733:
      case 1734:
      case 1735:
      case 1736:
      case 1737:
      case 1738:
      case 1739:
      case 1740:
      case 1741:
      case 1742:
      case 1743:
      case 1744:
      case 1745:
      case 1746:
      case 1747:
      case 1748:
      case 1749:
      case 1750:
      case 1751:
      case 1752:
      case 1753:
      case 1754:
      case 1755:
      case 1756:
      case 1757:
      case 1758:
      case 1759:
      case 1760:
      case 1761:
      case 1762:
      case 1763:
      case 1764:
      case 1765:
      case 1766:
      case 1767:
      case 1768:
      case 1769:
      case 1770:
      case 1771:
      case 1772:
      case 1773:
      case 1774:
      case 1775:
      case 1776:
      case 1777:
      case 1778:
      case 1779:
      case 1780:
      case 1781:
      case 1782:
      case 1783:
      case 1784:
      case 1785:
      case 1786:
      case 1787:
      case 1788:
      case 1789:
      case 1790:
      case 1791:
      case 1800:
      case 1801:
      case 1802:
      case 1803:
      case 1804:
      case 1805:
      case 1806:
      case 1807:
      case 1808:
      case 1809:
      case 1810:
      case 1811:
      case 1812:
      case 1813:
      case 1814:
      case 1815:
      case 1816:
      case 1817:
      case 1818:
      case 1819:
      case 1820:
      case 1821:
      case 1822:
      case 1823:
      case 1824:
      case 1825:
      case 1826:
      case 1827:
      case 1828:
      case 1829:
      case 1830:
      case 1831:
      case 1832:
      case 1833:
      case 1834:
      case 1835:
      case 1836:
      case 1837:
      case 1838:
      case 1839:
      case 1840:
      case 1841:
      case 1842:
      case 1843:
      case 1844:
      case 1845:
      case 1846:
      case 1847:
      case 1848:
      case 1849:
      case 1850:
      case 1851:
      case 1852:
      case 1853:
      case 1854:
      case 1855:
      case 1856:
      case 1857:
      case 1858:
      case 1859:
      case 1860:
      case 1861:
      case 1862:
      case 1863:
      case 1864:
      case 1865:
      case 1866:
      case 1867:
      case 1868:
      case 1869:
      case 1870:
      case 1871:
      case 1872:
      case 1873:
      case 1874:
      case 1875:
      case 1876:
      case 1877:
      case 1878:
      case 1879:
      case 1880:
      case 1881:
      case 1882:
      case 1883:
      case 1884:
      case 1885:
      case 1886:
      case 1887:
      case 1888:
      case 1889:
      case 1890:
      case 1891:
      case 1892:
      case 1893:
      case 1894:
      case 1895:
      case 1896:
      case 1897:
      case 1898:
      case 1899:
      case 1900:
      case 1901:
      case 1902:
      case 1903:
      case 1904:
      case 1905:
      case 1906:
      case 1907:
      case 1908:
      case 1909:
      case 1910:
      case 1911:
      case 1912:
      case 1913:
      case 1914:
      case 1915:
      case 1916:
      case 1917:
      case 1918:
      case 1919:
      case 1920:
      case 1921:
      case 1922:
      case 1923:
      case 1924:
      case 1925:
      case 1926:
      case 1927:
      case 1928:
      case 1929:
      case 1930:
      case 1931:
      case 1932:
      case 1933:
      case 1934:
      case 1935:
      case 1936:
      case 1937:
      case 1938:
      case 1939:
      case 1940:
      case 1941:
      case 1942:
      case 1943:
      case 1944:
      case 1945:
      case 1946:
      case 1947:
      case 1948:
      case 1949:
      case 1950:
      case 1951:
      case 1952:
      case 1953:
      case 1954:
      case 1955:
      case 1956:
      case 1957:
      case 1958:
      case 1959:
      case 1960:
      case 1961:
      case 1962:
      case 1963:
      case 1964:
      case 1965:
      case 1966:
      case 1967:
      case 1968:
      case 1969:
      case 1970:
      case 1971:
      case 1972:
      case 1973:
      case 1974:
      case 1975:
      case 1976:
      case 1977:
      case 1978:
      case 1979:
      case 1980:
      case 1981:
      case 1982:
      case 1983:
      case 1984:
      case 1985:
      case 1986:
      case 1987:
      case 1988:
      case 1989:
      case 1990:
      case 1991:
      case 1992:
      case 1993:
      case 1994:
      case 1995:
      case 1996:
      case 1997:
      case 1998:
      case 1999:
      case 2000:
      case 2001:
      case 2002:
      case 2003:
      case 2004:
      case 2005:
      case 2006:
      case 2007:
      case 2008:
      case 2009:
      case 2010:
      case 2011:
      case 2012:
      case 2013:
      case 2014:
      case 2015:
      case 2016:
      case 2017:
      case 2018:
      case 2019:
      case 2020:
      case 2021:
      case 2022:
      case 2023:
      case 2024:
      case 2025:
      case 2026:
      case 2027:
      case 2028:
      case 2029:
      case 2030:
      case 2031:
      case 2032:
      case 2033:
      case 2034:
      case 2035:
      case 2036:
      case 2037:
      case 2038:
      case 2039:
      case 2040:
      case 2041:
      case 2042:
      case 2043:
      case 2044:
      case 2045:
      case 2046:
      case 2047:
      case 2050:
      case 2051:
      case 2052:
      case 2053:
      case 2054:
      case 2055:
      case 2056:
      case 2057:
      case 2058:
      case 2059:
      case 2060:
      case 2061:
      case 2062:
      case 2063:
      case 2064:
      case 2065:
      case 2066:
      case 2067:
      case 2068:
      case 2069:
      case 2070:
      case 2071:
      case 2072:
      case 2073:
      case 2074:
      case 2075:
      case 2076:
      case 2077:
      case 2078:
      case 2079:
      case 2080:
      case 2081:
      case 2082:
      case 2083:
      case 2084:
      case 2085:
      case 2086:
      case 2087:
      case 2088:
      case 2089:
      case 2090:
      case 2091:
      case 2092:
      case 2093:
      case 2094:
      case 2095:
      case 2096:
      case 2097:
      case 2098:
      case 2099:
      case 2100:
      case 2101:
      case 2102:
      case 2103:
      case 2104:
      case 2105:
      case 2106:
      case 2107:
      case 2108:
      case 2109:
      case 2110:
      case 2111:
      case 2112:
      case 2113:
      case 2114:
      case 2115:
      case 2116:
      case 2117:
      case 2118:
      case 2119:
      case 2120:
      case 2121:
      case 2122:
      case 2123:
      case 2124:
      case 2125:
      case 2126:
      case 2127:
      case 2128:
      case 2129:
      case 2130:
      case 2131:
      case 2132:
      case 2133:
      case 2134:
      case 2135:
      case 2136:
      case 2137:
      case 2138:
      case 2139:
      case 2140:
      case 2141:
      case 2142:
      case 2143:
      case 2144:
      case 2145:
      case 2146:
      case 2147:
      case 2148:
      case 2149:
      case 2150:
      case 2151:
      case 2152:
      case 2153:
      case 2154:
      case 2155:
      case 2156:
      case 2157:
      case 2158:
      case 2159:
      case 2160:
      case 2161:
      case 2162:
      case 2163:
      case 2164:
      case 2165:
      case 2166:
      case 2167:
      case 2168:
      case 2169:
      case 2170:
      case 2171:
      case 2172:
      case 2173:
      case 2174:
      case 2175:
      case 2176:
      case 2177:
      case 2178:
      case 2179:
      case 2180:
      case 2181:
      case 2182:
      case 2183:
      case 2184:
      case 2185:
      case 2186:
      case 2187:
      case 2188:
      case 2189:
      case 2190:
      case 2191:
      case 2192:
      case 2193:
      case 2194:
      case 2195:
      case 2196:
      case 2197:
      case 2198:
      case 2199:
      case 2200:
      case 2201:
      case 2202:
      case 2203:
      case 2204:
      case 2205:
      case 2206:
      case 2207:
      case 2208:
      case 2209:
      case 2210:
      case 2211:
      case 2212:
      case 2213:
      case 2214:
      case 2215:
      case 2216:
      case 2217:
      case 2218:
      case 2219:
      case 2220:
      case 2221:
      case 2222:
      case 2223:
      case 2224:
      case 2225:
      case 2226:
      case 2227:
      case 2228:
      case 2229:
      case 2230:
      case 2231:
      case 2232:
      case 2233:
      case 2234:
      case 2235:
      case 2236:
      case 2237:
      case 2238:
      case 2239:
      case 2240:
      case 2241:
      case 2242:
      case 2243:
      case 2244:
      case 2245:
      case 2246:
      case 2247:
      case 2248:
      case 2249:
      case 2250:
      case 2251:
      case 2252:
      case 2253:
      case 2254:
      case 2255:
      case 2256:
      case 2257:
      case 2258:
      case 2259:
      case 2260:
      case 2261:
      case 2262:
      case 2263:
      case 2264:
      case 2265:
      case 2266:
      case 2267:
      case 2268:
      case 2269:
      case 2270:
      case 2271:
      case 2272:
      case 2273:
      case 2274:
      case 2275:
      case 2276:
      case 2277:
      case 2278:
      case 2279:
      case 2280:
      case 2281:
      case 2282:
      case 2283:
      case 2284:
      case 2285:
      case 2286:
      case 2287:
      case 2288:
      case 2289:
      case 2290:
      case 2291:
      case 2292:
      case 2293:
      case 2294:
      case 2295:
      case 2296:
      case 2297:
      case 2298:
      case 2299:
      case 2300:
      case 2301:
      case 2302:
      case 2303:
      case 2306:
      case 2307:
      case 2308:
      case 2309:
      case 2310:
      case 2311:
      case 2312:
      case 2313:
      case 2314:
      case 2315:
      case 2316:
      case 2317:
      case 2318:
      case 2319:
      case 2320:
      case 2321:
      case 2322:
      case 2323:
      case 2324:
      case 2325:
      case 2326:
      case 2327:
      case 2328:
      case 2329:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
      case 2351:
      case 2352:
      case 2353:
      case 2354:
      case 2355:
      case 2356:
      case 2357:
      case 2358:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
      case 2368:
      case 2369:
      case 2370:
      case 2371:
      case 2372:
      case 2373:
      case 2374:
      case 2375:
      case 2376:
      case 2377:
      case 2378:
      case 2379:
      case 2380:
      case 2381:
      case 2382:
      case 2383:
      case 2384:
      case 2385:
      case 2386:
      case 2387:
      case 2388:
      case 2389:
      case 2390:
      case 2391:
      case 2392:
      case 2393:
      case 2394:
      case 2395:
      case 2396:
      case 2397:
      case 2398:
      case 2399:
      case 2400:
      case 2401:
      case 2402:
      case 2403:
      case 2404:
      case 2405:
      case 2406:
      case 2407:
      case 2408:
      case 2409:
      case 2410:
      case 2411:
      case 2412:
      case 2413:
      case 2414:
      case 2415:
      case 2416:
      case 2417:
      case 2418:
      case 2419:
      case 2420:
      case 2421:
      case 2422:
      case 2423:
      case 2424:
      case 2425:
      case 2426:
      case 2427:
      case 2428:
      case 2429:
      case 2430:
      case 2431:
      case 2432:
      case 2433:
      case 2434:
      case 2435:
      case 2436:
      case 2437:
      case 2438:
      case 2439:
      case 2440:
      case 2441:
      case 2442:
      case 2443:
      case 2444:
      case 2445:
      case 2446:
      case 2447:
      case 2448:
      case 2449:
      case 2450:
      case 2451:
      case 2452:
      case 2453:
      case 2454:
      case 2455:
      case 2456:
      case 2457:
      case 2458:
      case 2459:
      case 2460:
      case 2461:
      case 2462:
      case 2463:
      case 2464:
      case 2465:
      case 2466:
      case 2467:
      case 2468:
      case 2469:
      case 2470:
      case 2471:
      case 2472:
      case 2473:
      case 2474:
      case 2475:
      case 2476:
      case 2477:
      case 2478:
      case 2479:
      case 2480:
      case 2481:
      case 2482:
      case 2483:
      case 2484:
      case 2485:
      case 2486:
      case 2487:
      case 2488:
      case 2489:
      case 2490:
      case 2491:
      case 2492:
      case 2493:
      case 2494:
      case 2495:
      case 2496:
      case 2497:
      case 2498:
      case 2499:
      case 2500:
      case 2501:
      case 2502:
      case 2503:
      case 2504:
      case 2505:
      case 2506:
      case 2507:
      case 2508:
      case 2509:
      case 2510:
      case 2511:
      case 2512:
      case 2513:
      case 2514:
      case 2515:
      case 2516:
      case 2517:
      case 2518:
      case 2519:
      case 2520:
      case 2521:
      case 2522:
      case 2523:
      case 2524:
      case 2525:
      case 2526:
      case 2527:
      case 2528:
      case 2529:
      case 2530:
      case 2531:
      case 2532:
      case 2533:
      case 2534:
      case 2535:
      case 2536:
      case 2537:
      case 2538:
      case 2539:
      case 2540:
      case 2541:
      case 2542:
      case 2543:
      case 2544:
      case 2545:
      case 2546:
      case 2547:
      case 2548:
      case 2549:
      case 2550:
      case 2551:
      case 2552:
      case 2553:
      case 2554:
      case 2555:
      case 2556:
      case 2557:
      case 2558:
      case 2559:
      case 2563:
      case 2564:
      case 2565:
      case 2566:
      case 2567:
      case 2568:
      case 2569:
      case 2570:
      case 2571:
      case 2572:
      case 2573:
      case 2574:
      case 2575:
      case 2576:
      case 2577:
      case 2578:
      case 2579:
      case 2580:
      case 2581:
      case 2582:
      case 2583:
      case 2584:
      case 2585:
      case 2586:
      case 2587:
      case 2588:
      case 2589:
      case 2590:
      case 2591:
      case 2592:
      case 2593:
      case 2594:
      case 2595:
      case 2596:
      case 2597:
      case 2598:
      case 2599:
      case 2600:
      case 2601:
      case 2602:
      case 2603:
      case 2604:
      case 2605:
      case 2606:
      case 2607:
      case 2608:
      case 2609:
      case 2610:
      case 2611:
      case 2612:
      case 2613:
      case 2614:
      case 2615:
      case 2616:
      case 2617:
      case 2618:
      case 2619:
      case 2620:
      case 2621:
      case 2622:
      case 2623:
      case 2624:
      case 2625:
      case 2626:
      case 2627:
      case 2628:
      case 2629:
      case 2630:
      case 2631:
      case 2632:
      case 2633:
      case 2634:
      case 2635:
      case 2636:
      case 2637:
      case 2638:
      case 2639:
      case 2640:
      case 2641:
      case 2642:
      case 2643:
      case 2644:
      case 2645:
      case 2646:
      case 2647:
      case 2648:
      case 2649:
      case 2650:
      case 2651:
      case 2652:
      case 2653:
      case 2654:
      case 2655:
      case 2656:
      case 2657:
      case 2658:
      case 2659:
      case 2660:
      case 2661:
      case 2662:
      case 2663:
      case 2664:
      case 2665:
      case 2666:
      case 2667:
      case 2668:
      case 2669:
      case 2670:
      case 2671:
      case 2672:
      case 2673:
      case 2674:
      case 2675:
      case 2676:
      case 2677:
      case 2678:
      case 2679:
      case 2680:
      case 2681:
      case 2682:
      case 2683:
      case 2684:
      case 2685:
      case 2686:
      case 2687:
      case 2688:
      case 2689:
      case 2690:
      case 2691:
      case 2692:
      case 2693:
      case 2694:
      case 2695:
      case 2696:
      case 2697:
      case 2698:
      case 2699:
      case 2700:
      case 2701:
      case 2702:
      case 2703:
      case 2704:
      case 2705:
      case 2706:
      case 2707:
      case 2708:
      case 2709:
      case 2710:
      case 2711:
      case 2712:
      case 2713:
      case 2714:
      case 2715:
      case 2716:
      case 2717:
      case 2718:
      case 2719:
      case 2720:
      case 2721:
      case 2722:
      case 2723:
      case 2724:
      case 2725:
      case 2726:
      case 2727:
      case 2728:
      case 2729:
      case 2730:
      case 2731:
      case 2732:
      case 2733:
      case 2734:
      case 2735:
      case 2736:
      case 2737:
      case 2738:
      case 2739:
      case 2740:
      case 2741:
      case 2742:
      case 2743:
      case 2744:
      case 2745:
      case 2746:
      case 2747:
      case 2748:
      case 2749:
      case 2750:
      case 2751:
      case 2752:
      case 2753:
      case 2754:
      case 2755:
      case 2756:
      case 2757:
      case 2758:
      case 2759:
      case 2760:
      case 2761:
      case 2762:
      case 2763:
      case 2764:
      case 2765:
      case 2766:
      case 2767:
      case 2768:
      case 2769:
      case 2770:
      case 2771:
      case 2772:
      case 2773:
      case 2774:
      case 2775:
      case 2776:
      case 2777:
      case 2778:
      case 2779:
      case 2780:
      case 2781:
      case 2782:
      case 2783:
      case 2784:
      case 2785:
      case 2786:
      case 2787:
      case 2788:
      case 2789:
      case 2790:
      case 2791:
      case 2792:
      case 2793:
      case 2794:
      case 2795:
      case 2796:
      case 2797:
      case 2798:
      case 2799:
      case 2800:
      case 2801:
      case 2802:
      case 2803:
      case 2804:
      case 2805:
      case 2806:
      case 2807:
      case 2808:
      case 2809:
      case 2810:
      case 2811:
      case 2812:
      case 2813:
      case 2814:
      case 2815:
      case 2826:
      case 2827:
      case 2828:
      case 2829:
      case 2830:
      case 2831:
      case 2836:
      case 2837:
      case 2838:
      case 2839:
      case 2840:
      case 2841:
      case 2842:
      case 2843:
      case 2844:
      case 2845:
      case 2846:
      case 2847:
      case 2855:
      case 2856:
      case 2857:
      case 2858:
      case 2859:
      case 2860:
      case 2861:
      case 2862:
      case 2863:
      case 2868:
      case 2869:
      case 2870:
      case 2871:
      case 2872:
      case 2873:
      case 2874:
      case 2875:
      case 2876:
      case 2877:
      case 2878:
      case 2879:
      case 2887:
      case 2888:
      case 2889:
      case 2890:
      case 2891:
      case 2892:
      case 2893:
      case 2894:
      case 2895:
      case 2904:
      case 2905:
      case 2906:
      case 2907:
      case 2908:
      case 2909:
      case 2910:
      case 2911:
      case 2919:
      case 2920:
      case 2921:
      case 2922:
      case 2923:
      case 2924:
      case 2925:
      case 2926:
      case 2927:
      case 2933:
      case 2934:
      case 2935:
      case 2936:
      case 2937:
      case 2938:
      case 2939:
      case 2940:
      case 2941:
      case 2942:
      case 2943:
      case 2945:
      case 2946:
      case 2947:
      case 2948:
      case 2949:
      case 2950:
      case 2951:
      case 2952:
      case 2953:
      case 2954:
      case 2955:
      case 2956:
      case 2957:
      case 2958:
      case 2959:
      case 2969:
      case 2970:
      case 2971:
      case 2972:
      case 2973:
      case 2974:
      case 2975:
      case 2985:
      case 2986:
      case 2987:
      case 2988:
      case 2989:
      case 2990:
      case 2991:
      case 2994:
      case 2995:
      case 2996:
      case 2997:
      case 2998:
      case 2999:
      case 3000:
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
      case 3016:
      case 3017:
      case 3018:
      case 3019:
      case 3020:
      case 3021:
      case 3022:
      case 3023:
      case 3025:
      case 3026:
      case 3027:
      case 3028:
      case 3029:
      case 3030:
      case 3031:
      case 3032:
      case 3033:
      case 3034:
      case 3035:
      case 3036:
      case 3037:
      case 3038:
      case 3039:
      case 3043:
      case 3044:
      case 3045:
      case 3046:
      case 3047:
      case 3048:
      case 3049:
      case 3050:
      case 3051:
      case 3052:
      case 3053:
      case 3054:
      case 3055:
      case 3059:
      case 3060:
      case 3061:
      case 3062:
      case 3063:
      case 3064:
      case 3065:
      case 3066:
      case 3067:
      case 3068:
      case 3069:
      case 3070:
      case 3071:
      case 3075:
      case 3076:
      case 3077:
      case 3078:
      case 3079:
      case 3080:
      case 3081:
      case 3082:
      case 3083:
      case 3084:
      case 3085:
      case 3086:
      case 3087:
      case 3090:
      case 3091:
      case 3092:
      case 3093:
      case 3094:
      case 3095:
      case 3096:
      case 3097:
      case 3098:
      case 3099:
      case 3100:
      case 3101:
      case 3102:
      case 3103:
      case 3108:
      case 3109:
      case 3110:
      case 3111:
      case 3112:
      case 3113:
      case 3114:
      case 3115:
      case 3116:
      case 3117:
      case 3118:
      case 3119:
      case 3124:
      case 3125:
      case 3126:
      case 3127:
      case 3128:
      case 3129:
      case 3130:
      case 3131:
      case 3132:
      case 3133:
      case 3134:
      case 3135:
      case 3137:
      case 3138:
      case 3139:
      case 3140:
      case 3141:
      case 3142:
      case 3143:
      case 3144:
      case 3145:
      case 3146:
      case 3147:
      case 3148:
      case 3149:
      case 3150:
      case 3151:
      case 3157:
      case 3158:
      case 3159:
      case 3160:
      case 3161:
      case 3162:
      case 3163:
      case 3164:
      case 3165:
      case 3166:
      case 3167:
      case 3172:
      case 3173:
      case 3174:
      case 3175:
      case 3176:
      case 3177:
      case 3178:
      case 3179:
      case 3180:
      case 3181:
      case 3182:
      case 3183:
      case 3194:
      case 3195:
      case 3196:
      case 3197:
      case 3198:
      case 3199:
      case 3200:
      case 3201:
      case 3202:
      case 3203:
      case 3204:
      case 3205:
      case 3206:
      case 3207:
      case 3208:
      case 3209:
      case 3210:
      case 3211:
      case 3212:
      case 3213:
      case 3214:
      case 3215:
      case 3216:
      case 3217:
      case 3218:
      case 3219:
      case 3220:
      case 3221:
      case 3222:
      case 3223:
      case 3224:
      case 3225:
      case 3226:
      case 3227:
      case 3228:
      case 3229:
      case 3230:
      case 3231:
      case 3232:
      case 3233:
      case 3234:
      case 3235:
      case 3236:
      case 3237:
      case 3238:
      case 3239:
      case 3240:
      case 3241:
      case 3242:
      case 3243:
      case 3244:
      case 3245:
      case 3246:
      case 3247:
      case 3258:
      case 3259:
      case 3260:
      case 3261:
      case 3262:
      case 3263:
      case 3264:
      case 3265:
      case 3266:
      case 3267:
      case 3268:
      case 3269:
      case 3270:
      case 3271:
      case 3272:
      case 3273:
      case 3274:
      case 3275:
      case 3276:
      case 3277:
      case 3278:
      case 3279:
      case 3280:
      case 3281:
      case 3282:
      case 3283:
      case 3284:
      case 3285:
      case 3286:
      case 3287:
      case 3288:
      case 3289:
      case 3290:
      case 3291:
      case 3292:
      case 3293:
      case 3294:
      case 3295:
      case 3296:
      case 3297:
      case 3298:
      case 3299:
      case 3300:
      case 3301:
      case 3302:
      case 3303:
      case 3304:
      case 3305:
      case 3306:
      case 3307:
      case 3308:
      case 3309:
      case 3310:
      case 3311:
      case 3318:
      case 3319:
      case 3320:
      case 3321:
      case 3322:
      case 3323:
      case 3324:
      case 3325:
      case 3326:
      case 3327:
      case 3334:
      case 3335:
      case 3336:
      case 3337:
      case 3338:
      case 3339:
      case 3340:
      case 3341:
      case 3342:
      case 3343:
      case 3360:
      case 3361:
      case 3362:
      case 3363:
      case 3364:
      case 3365:
      case 3366:
      case 3367:
      case 3368:
      case 3369:
      case 3370:
      case 3371:
      case 3372:
      case 3373:
      case 3374:
      case 3375:
      case 3388:
      case 3389:
      case 3390:
      case 3391:
      case 3392:
      case 3393:
      case 3394:
      case 3395:
      case 3396:
      case 3397:
      case 3398:
      case 3399:
      case 3400:
      case 3401:
      case 3402:
      case 3403:
      case 3404:
      case 3405:
      case 3406:
      case 3407:
      case 3420:
      case 3421:
      case 3422:
      case 3423:
      case 3424:
      case 3425:
      case 3426:
      case 3427:
      case 3428:
      case 3429:
      case 3430:
      case 3431:
      case 3432:
      case 3433:
      case 3434:
      case 3435:
      case 3436:
      case 3437:
      case 3438:
      case 3439:
      case 3441:
      case 3442:
      case 3443:
      case 3444:
      case 3445:
      case 3446:
      case 3447:
      case 3448:
      case 3449:
      case 3450:
      case 3451:
      case 3452:
      case 3453:
      case 3454:
      case 3455:
      case 3457:
      case 3458:
      case 3459:
      case 3460:
      case 3461:
      case 3462:
      case 3463:
      case 3464:
      case 3465:
      case 3466:
      case 3467:
      case 3468:
      case 3469:
      case 3470:
      case 3471:
      case 3481:
      case 3482:
      case 3483:
      case 3484:
      case 3485:
      case 3486:
      case 3487:
      case 3488:
      case 3489:
      case 3490:
      case 3491:
      case 3492:
      case 3493:
      case 3494:
      case 3495:
      case 3496:
      case 3497:
      case 3498:
      case 3499:
      case 3500:
      case 3501:
      case 3502:
      case 3503:
      case 3513:
      case 3514:
      case 3515:
      case 3516:
      case 3517:
      case 3518:
      case 3519:
      case 3520:
      case 3521:
      case 3522:
      case 3523:
      case 3524:
      case 3525:
      case 3526:
      case 3527:
      case 3528:
      case 3529:
      case 3530:
      case 3531:
      case 3532:
      case 3533:
      case 3534:
      case 3535:
      case 3540:
      case 3541:
      case 3542:
      case 3543:
      case 3544:
      case 3545:
      case 3546:
      case 3547:
      case 3548:
      case 3549:
      case 3550:
      case 3551:
      case 3554:
      case 3555:
      case 3556:
      case 3557:
      case 3558:
      case 3559:
      case 3560:
      case 3561:
      case 3562:
      case 3563:
      case 3564:
      case 3565:
      case 3566:
      case 3567:
        return 0;
      case 1536:
        id result = "GL_2D";
        break;
      case 1537:
        id result = "GL_3D";
        break;
      case 1538:
        id result = "GL_3D_COLOR";
        break;
      case 1539:
        id result = "GL_3D_COLOR_TEXTURE";
        break;
      case 1540:
        id result = "GL_4D_COLOR_TEXTURE";
        break;
      case 1792:
        id result = "GL_PASS_THROUGH_TOKEN";
        break;
      case 1793:
        id result = "GL_POINT_TOKEN";
        break;
      case 1794:
        id result = "GL_LINE_TOKEN";
        break;
      case 1795:
        id result = "GL_POLYGON_TOKEN";
        break;
      case 1796:
        id result = "GL_BITMAP_TOKEN";
        break;
      case 1797:
        id result = "GL_DRAW_PIXEL_TOKEN";
        break;
      case 1798:
        id result = "GL_COPY_PIXEL_TOKEN";
        break;
      case 1799:
        id result = "GL_LINE_RESET_TOKEN";
        break;
      case 2048:
        id result = "GL_EXP";
        break;
      case 2049:
        id result = "GL_EXP2";
        break;
      case 2304:
        id result = "GL_CW";
        break;
      case 2305:
        id result = "GL_CCW";
        break;
      case 2560:
        id result = "GL_COEFF";
        break;
      case 2561:
        id result = "GL_ORDER";
        break;
      case 2562:
        id result = "GL_DOMAIN";
        break;
      case 2816:
        id result = "GL_CURRENT_COLOR";
        break;
      case 2817:
        id result = "GL_CURRENT_INDEX";
        break;
      case 2818:
        id result = "GL_CURRENT_NORMAL";
        break;
      case 2819:
        id result = "GL_CURRENT_TEXTURE_COORDS";
        break;
      case 2820:
        id result = "GL_CURRENT_RASTER_COLOR";
        break;
      case 2821:
        id result = "GL_CURRENT_RASTER_INDEX";
        break;
      case 2822:
        id result = "GL_CURRENT_RASTER_TEXTURE_COORDS";
        break;
      case 2823:
        id result = "GL_CURRENT_RASTER_POSITION";
        break;
      case 2824:
        id result = "GL_CURRENT_RASTER_POSITION_VALID";
        break;
      case 2825:
        id result = "GL_CURRENT_RASTER_DISTANCE";
        break;
      case 2832:
        id result = "GL_POINT_SMOOTH";
        break;
      case 2833:
        id result = "GL_POINT_SIZE";
        break;
      case 2834:
        id result = "GL_POINT_SIZE_RANGE";
        break;
      case 2835:
        id result = "GL_POINT_SIZE_GRANULARITY";
        break;
      case 2848:
        id result = "GL_LINE_SMOOTH";
        break;
      case 2849:
        id result = "GL_LINE_WIDTH";
        break;
      case 2850:
        id result = "GL_SMOOTH_LINE_WIDTH_RANGE";
        break;
      case 2851:
        id result = "GL_SMOOTH_LINE_WIDTH_GRANULARITY";
        break;
      case 2852:
        id result = "GL_LINE_STIPPLE";
        break;
      case 2853:
        id result = "GL_LINE_STIPPLE_PATTERN";
        break;
      case 2854:
        id result = "GL_LINE_STIPPLE_REPEAT";
        break;
      case 2864:
        id result = "GL_LIST_MODE";
        break;
      case 2865:
        id result = "GL_MAX_LIST_NESTING";
        break;
      case 2866:
        id result = "GL_LIST_BASE";
        break;
      case 2867:
        id result = "GL_LIST_INDEX";
        break;
      case 2880:
        id result = "GL_POLYGON_MODE";
        break;
      case 2881:
        id result = "GL_POLYGON_SMOOTH";
        break;
      case 2882:
        id result = "GL_POLYGON_STIPPLE";
        break;
      case 2883:
        id result = "GL_EDGE_FLAG";
        break;
      case 2884:
        id result = "GL_CULL_FACE";
        break;
      case 2885:
        id result = "GL_CULL_FACE_MODE";
        break;
      case 2886:
        id result = "GL_FRONT_FACE";
        break;
      case 2896:
        id result = "GL_LIGHTING";
        break;
      case 2897:
        id result = "GL_LIGHT_MODEL_LOCAL_VIEWER";
        break;
      case 2898:
        id result = "GL_LIGHT_MODEL_TWO_SIDE";
        break;
      case 2899:
        id result = "GL_LIGHT_MODEL_AMBIENT";
        break;
      case 2900:
        id result = "GL_SHADE_MODEL";
        break;
      case 2901:
        id result = "GL_COLOR_MATERIAL_FACE";
        break;
      case 2902:
        id result = "GL_COLOR_MATERIAL_PARAMETER";
        break;
      case 2903:
        id result = "GL_COLOR_MATERIAL";
        break;
      case 2912:
        id result = "GL_FOG";
        break;
      case 2913:
        id result = "GL_FOG_INDEX";
        break;
      case 2914:
        id result = "GL_FOG_DENSITY";
        break;
      case 2915:
        id result = "GL_FOG_START";
        break;
      case 2916:
        id result = "GL_FOG_END";
        break;
      case 2917:
        id result = "GL_FOG_MODE";
        break;
      case 2918:
        id result = "GL_FOG_COLOR";
        break;
      case 2928:
        id result = "GL_DEPTH_RANGE";
        break;
      case 2929:
        id result = "GL_DEPTH_TEST";
        break;
      case 2930:
        id result = "GL_DEPTH_WRITEMASK";
        break;
      case 2931:
        id result = "GL_DEPTH_CLEAR_VALUE";
        break;
      case 2932:
        id result = "GL_DEPTH_FUNC";
        break;
      case 2944:
        id result = "GL_ACCUM_CLEAR_VALUE";
        break;
      case 2960:
        id result = "GL_STENCIL_TEST";
        break;
      case 2961:
        id result = "GL_STENCIL_CLEAR_VALUE";
        break;
      case 2962:
        id result = "GL_STENCIL_FUNC";
        break;
      case 2963:
        id result = "GL_STENCIL_VALUE_MASK";
        break;
      case 2964:
        id result = "GL_STENCIL_FAIL";
        break;
      case 2965:
        id result = "GL_STENCIL_PASS_DEPTH_FAIL";
        break;
      case 2966:
        id result = "GL_STENCIL_PASS_DEPTH_PASS";
        break;
      case 2967:
        id result = "GL_STENCIL_REF";
        break;
      case 2968:
        id result = "GL_STENCIL_WRITEMASK";
        break;
      case 2976:
        id result = "GL_MATRIX_MODE";
        break;
      case 2977:
        id result = "GL_NORMALIZE";
        break;
      case 2978:
        id result = "GL_VIEWPORT";
        break;
      case 2979:
        id result = "GL_MODELVIEW_STACK_DEPTH";
        break;
      case 2980:
        id result = "GL_PROJECTION_STACK_DEPTH";
        break;
      case 2981:
        id result = "GL_TEXTURE_STACK_DEPTH";
        break;
      case 2982:
        id result = "GL_MODELVIEW_MATRIX";
        break;
      case 2983:
        id result = "GL_PROJECTION_MATRIX";
        break;
      case 2984:
        id result = "GL_TEXTURE_MATRIX";
        break;
      case 2992:
        id result = "GL_ATTRIB_STACK_DEPTH";
        break;
      case 2993:
        id result = "GL_CLIENT_ATTRIB_STACK_DEPTH";
        break;
      case 3008:
        id result = "GL_ALPHA_TEST";
        break;
      case 3009:
        id result = "GL_ALPHA_TEST_FUNC";
        break;
      case 3010:
        id result = "GL_ALPHA_TEST_REF";
        break;
      case 3024:
        id result = "GL_DITHER";
        break;
      case 3040:
        id result = "GL_BLEND_DST";
        break;
      case 3041:
        id result = "GL_BLEND_SRC";
        break;
      case 3042:
        id result = "GL_BLEND";
        break;
      case 3056:
        id result = "GL_LOGIC_OP_MODE";
        break;
      case 3057:
        id result = "GL_INDEX_LOGIC_OP";
        break;
      case 3058:
        id result = "GL_COLOR_LOGIC_OP";
        break;
      case 3072:
        id result = "GL_AUX_BUFFERS";
        break;
      case 3073:
        id result = "GL_DRAW_BUFFER";
        break;
      case 3074:
        id result = "GL_READ_BUFFER";
        break;
      case 3088:
        id result = "GL_SCISSOR_BOX";
        break;
      case 3089:
        id result = "GL_SCISSOR_TEST";
        break;
      case 3104:
        id result = "GL_INDEX_CLEAR_VALUE";
        break;
      case 3105:
        id result = "GL_INDEX_WRITEMASK";
        break;
      case 3106:
        id result = "GL_COLOR_CLEAR_VALUE";
        break;
      case 3107:
        id result = "GL_COLOR_WRITEMASK";
        break;
      case 3120:
        id result = "GL_INDEX_MODE";
        break;
      case 3121:
        id result = "GL_RGBA_MODE";
        break;
      case 3122:
        id result = "GL_DOUBLEBUFFER";
        break;
      case 3123:
        id result = "GL_STEREO";
        break;
      case 3136:
        id result = "GL_RENDER_MODE";
        break;
      case 3152:
        id result = "GL_PERSPECTIVE_CORRECTION_HINT";
        break;
      case 3153:
        id result = "GL_POINT_SMOOTH_HINT";
        break;
      case 3154:
        id result = "GL_LINE_SMOOTH_HINT";
        break;
      case 3155:
        id result = "GL_POLYGON_SMOOTH_HINT";
        break;
      case 3156:
        id result = "GL_FOG_HINT";
        break;
      case 3168:
        id result = "GL_TEXTURE_GEN_S";
        break;
      case 3169:
        id result = "GL_TEXTURE_GEN_T";
        break;
      case 3170:
        id result = "GL_TEXTURE_GEN_R";
        break;
      case 3171:
        id result = "GL_TEXTURE_GEN_Q";
        break;
      case 3184:
        id result = "GL_PIXEL_MAP_I_TO_I";
        break;
      case 3185:
        id result = "GL_PIXEL_MAP_S_TO_S";
        break;
      case 3186:
        id result = "GL_PIXEL_MAP_I_TO_R";
        break;
      case 3187:
        id result = "GL_PIXEL_MAP_I_TO_G";
        break;
      case 3188:
        id result = "GL_PIXEL_MAP_I_TO_B";
        break;
      case 3189:
        id result = "GL_PIXEL_MAP_I_TO_A";
        break;
      case 3190:
        id result = "GL_PIXEL_MAP_R_TO_R";
        break;
      case 3191:
        id result = "GL_PIXEL_MAP_G_TO_G";
        break;
      case 3192:
        id result = "GL_PIXEL_MAP_B_TO_B";
        break;
      case 3193:
        id result = "GL_PIXEL_MAP_A_TO_A";
        break;
      case 3248:
        id result = "GL_PIXEL_MAP_I_TO_I_SIZE";
        break;
      case 3249:
        id result = "GL_PIXEL_MAP_S_TO_S_SIZE";
        break;
      case 3250:
        id result = "GL_PIXEL_MAP_I_TO_R_SIZE";
        break;
      case 3251:
        id result = "GL_PIXEL_MAP_I_TO_G_SIZE";
        break;
      case 3252:
        id result = "GL_PIXEL_MAP_I_TO_B_SIZE";
        break;
      case 3253:
        id result = "GL_PIXEL_MAP_I_TO_A_SIZE";
        break;
      case 3254:
        id result = "GL_PIXEL_MAP_R_TO_R_SIZE";
        break;
      case 3255:
        id result = "GL_PIXEL_MAP_G_TO_G_SIZE";
        break;
      case 3256:
        id result = "GL_PIXEL_MAP_B_TO_B_SIZE";
        break;
      case 3257:
        id result = "GL_PIXEL_MAP_A_TO_A_SIZE";
        break;
      case 3312:
        id result = "GL_UNPACK_SWAP_BYTES";
        break;
      case 3313:
        id result = "GL_UNPACK_LSB_FIRST";
        break;
      case 3314:
        id result = "GL_UNPACK_ROW_LENGTH";
        break;
      case 3315:
        id result = "GL_UNPACK_SKIP_ROWS";
        break;
      case 3316:
        id result = "GL_UNPACK_SKIP_PIXELS";
        break;
      case 3317:
        id result = "GL_UNPACK_ALIGNMENT";
        break;
      case 3328:
        id result = "GL_PACK_SWAP_BYTES";
        break;
      case 3329:
        id result = "GL_PACK_LSB_FIRST";
        break;
      case 3330:
        id result = "GL_PACK_ROW_LENGTH";
        break;
      case 3331:
        id result = "GL_PACK_SKIP_ROWS";
        break;
      case 3332:
        id result = "GL_PACK_SKIP_PIXELS";
        break;
      case 3333:
        id result = "GL_PACK_ALIGNMENT";
        break;
      case 3344:
        id result = "GL_MAP_COLOR";
        break;
      case 3345:
        id result = "GL_MAP_STENCIL";
        break;
      case 3346:
        id result = "GL_INDEX_SHIFT";
        break;
      case 3347:
        id result = "GL_INDEX_OFFSET";
        break;
      case 3348:
        id result = "GL_RED_SCALE";
        break;
      case 3349:
        id result = "GL_RED_BIAS";
        break;
      case 3350:
        id result = "GL_ZOOM_X";
        break;
      case 3351:
        id result = "GL_ZOOM_Y";
        break;
      case 3352:
        id result = "GL_GREEN_SCALE";
        break;
      case 3353:
        id result = "GL_GREEN_BIAS";
        break;
      case 3354:
        id result = "GL_BLUE_SCALE";
        break;
      case 3355:
        id result = "GL_BLUE_BIAS";
        break;
      case 3356:
        id result = "GL_ALPHA_SCALE";
        break;
      case 3357:
        id result = "GL_ALPHA_BIAS";
        break;
      case 3358:
        id result = "GL_DEPTH_SCALE";
        break;
      case 3359:
        id result = "GL_DEPTH_BIAS";
        break;
      case 3376:
        id result = "GL_MAX_EVAL_ORDER";
        break;
      case 3377:
        id result = "GL_MAX_LIGHTS";
        break;
      case 3378:
        id result = "GL_MAX_CLIP_DISTANCES";
        break;
      case 3379:
        id result = "GL_MAX_TEXTURE_SIZE";
        break;
      case 3380:
        id result = "GL_MAX_PIXEL_MAP_TABLE";
        break;
      case 3381:
        id result = "GL_MAX_ATTRIB_STACK_DEPTH";
        break;
      case 3382:
        id result = "GL_MAX_MODELVIEW_STACK_DEPTH";
        break;
      case 3383:
        id result = "GL_MAX_NAME_STACK_DEPTH";
        break;
      case 3384:
        id result = "GL_MAX_PROJECTION_STACK_DEPTH";
        break;
      case 3385:
        id result = "GL_MAX_TEXTURE_STACK_DEPTH";
        break;
      case 3386:
        id result = "GL_MAX_VIEWPORT_DIMS";
        break;
      case 3387:
        id result = "GL_MAX_CLIENT_ATTRIB_STACK_DEPTH";
        break;
      case 3408:
        id result = "GL_SUBPIXEL_BITS";
        break;
      case 3409:
        id result = "GL_INDEX_BITS";
        break;
      case 3410:
        id result = "GL_RED_BITS";
        break;
      case 3411:
        id result = "GL_GREEN_BITS";
        break;
      case 3412:
        id result = "GL_BLUE_BITS";
        break;
      case 3413:
        id result = "GL_ALPHA_BITS";
        break;
      case 3414:
        id result = "GL_DEPTH_BITS";
        break;
      case 3415:
        id result = "GL_STENCIL_BITS";
        break;
      case 3416:
        id result = "GL_ACCUM_RED_BITS";
        break;
      case 3417:
        id result = "GL_ACCUM_GREEN_BITS";
        break;
      case 3418:
        id result = "GL_ACCUM_BLUE_BITS";
        break;
      case 3419:
        id result = "GL_ACCUM_ALPHA_BITS";
        break;
      case 3440:
        id result = "GL_NAME_STACK_DEPTH";
        break;
      case 3456:
        id result = "GL_AUTO_NORMAL";
        break;
      case 3472:
        id result = "GL_MAP1_COLOR_4";
        break;
      case 3473:
        id result = "GL_MAP1_INDEX";
        break;
      case 3474:
        id result = "GL_MAP1_NORMAL";
        break;
      case 3475:
        id result = "GL_MAP1_TEXTURE_COORD_1";
        break;
      case 3476:
        id result = "GL_MAP1_TEXTURE_COORD_2";
        break;
      case 3477:
        id result = "GL_MAP1_TEXTURE_COORD_3";
        break;
      case 3478:
        id result = "GL_MAP1_TEXTURE_COORD_4";
        break;
      case 3479:
        id result = "GL_MAP1_VERTEX_3";
        break;
      case 3480:
        id result = "GL_MAP1_VERTEX_4";
        break;
      case 3504:
        id result = "GL_MAP2_COLOR_4";
        break;
      case 3505:
        id result = "GL_MAP2_INDEX";
        break;
      case 3506:
        id result = "GL_MAP2_NORMAL";
        break;
      case 3507:
        id result = "GL_MAP2_TEXTURE_COORD_1";
        break;
      case 3508:
        id result = "GL_MAP2_TEXTURE_COORD_2";
        break;
      case 3509:
        id result = "GL_MAP2_TEXTURE_COORD_3";
        break;
      case 3510:
        id result = "GL_MAP2_TEXTURE_COORD_4";
        break;
      case 3511:
        id result = "GL_MAP2_VERTEX_3";
        break;
      case 3512:
        id result = "GL_MAP2_VERTEX_4";
        break;
      case 3536:
        id result = "GL_MAP1_GRID_DOMAIN";
        break;
      case 3537:
        id result = "GL_MAP1_GRID_SEGMENTS";
        break;
      case 3538:
        id result = "GL_MAP2_GRID_DOMAIN";
        break;
      case 3539:
        id result = "GL_MAP2_GRID_SEGMENTS";
        break;
      case 3552:
        id result = "GL_TEXTURE_1D";
        break;
      case 3553:
        id result = "GL_TEXTURE_2D";
        break;
      case 3568:
        id result = "GL_FEEDBACK_BUFFER_POINTER";
        break;
      case 3569:
        id result = "GL_FEEDBACK_BUFFER_SIZE";
        break;
      case 3570:
        id result = "GL_FEEDBACK_BUFFER_TYPE";
        break;
      case 3571:
        id result = "GL_SELECTION_BUFFER_POINTER";
        break;
      case 3572:
        id result = "GL_SELECTION_BUFFER_SIZE";
        break;
      default:
        switch(a1)
        {
          case 1024:
            id result = "GL_FRONT_LEFT";
            break;
          case 1025:
            id result = "GL_FRONT_RIGHT";
            break;
          case 1026:
            id result = "GL_BACK_LEFT";
            break;
          case 1027:
            id result = "GL_BACK_RIGHT";
            break;
          case 1028:
            id result = "GL_FRONT";
            break;
          case 1029:
            id result = "GL_BACK";
            break;
          case 1030:
            id result = "GL_LEFT";
            break;
          case 1031:
            id result = "GL_RIGHT";
            break;
          case 1032:
            id result = "GL_FRONT_AND_BACK";
            break;
          case 1033:
            id result = "GL_AUX0";
            break;
          case 1034:
            id result = "GL_AUX1";
            break;
          case 1035:
            id result = "GL_AUX2";
            break;
          case 1036:
            id result = "GL_AUX3";
            break;
          default:
            return 0;
        }
        break;
    }
  }
  return result;
}

const char *dy_compact_string_from_enum(int a1)
{
  if (a1 > 24719)
  {
    if (a1 < 0x10000)
    {
      switch(a1)
      {
        case 24720:
          id result = "Pn Triangles";
          break;
        case 24721:
          id result = "Max Pn Triangles Tesselation Level";
          break;
        case 24722:
          id result = "Pn Triangles Point Mode";
          break;
        case 24723:
          id result = "Pn Triangles Normal Mode";
          break;
        case 24724:
          id result = "Pn Triangles Tesselation Level";
          break;
        case 24725:
          id result = "Pn Triangles Point Mode Linear";
          break;
        case 24726:
          id result = "Pn Triangles Point Mode Cubic";
          break;
        case 24727:
          id result = "Pn Triangles Normal Mode Linear";
          break;
        case 24728:
          id result = "Pn Triangles Normal Mode Quadratic";
          break;
        case 24755:
          id result = "Cull Mode";
          break;
        case 24756:
          id result = "Cull Center";
          break;
        case 24757:
          id result = "Cull Clip";
          break;
        case 32768:
          id result = "Abgr";
          break;
        case 32769:
          id result = "Constant Color";
          break;
        case 32770:
          id result = "One Minus Constant Color";
          break;
        case 32771:
          id result = "Constant Alpha";
          break;
        case 32772:
          id result = "One Minus Constant Alpha";
          break;
        case 32773:
          id result = "Color";
          break;
        case 32774:
          id result = "Func Add";
          break;
        case 32775:
          id result = "Min";
          break;
        case 32776:
          id result = "Max";
          break;
        case 32777:
          id result = "Equation RGB";
          break;
        case 32778:
          id result = "Func Subtract";
          break;
        case 32779:
          id result = "Func Reverse Subtract";
          break;
        case 32784:
          id result = "Convolution 1D";
          break;
        case 32785:
          id result = "Convolution 2D";
          break;
        case 32786:
          id result = "Separable 2D";
          break;
        case 32787:
          id result = "Convolution Border Mode";
          break;
        case 32788:
          id result = "Convolution Filter Scale";
          break;
        case 32789:
          id result = "Convolution Filter Bias";
          break;
        case 32790:
          id result = "Reduce";
          break;
        case 32791:
          id result = "Convolution Format";
          break;
        case 32792:
          id result = "Convolution Width";
          break;
        case 32793:
          id result = "Convolution Height";
          break;
        case 32794:
          id result = "Max Convolution Width";
          break;
        case 32795:
          id result = "Max Convolution Height";
          break;
        case 32796:
          id result = "Post Convolution Red Scale";
          break;
        case 32797:
          id result = "Post Convolution Green Scale";
          break;
        case 32798:
          id result = "Post Convolution Blue Scale";
          break;
        case 32799:
          id result = "Post Convolution Alpha Scale";
          break;
        case 32800:
          id result = "Post Convolution Red Bias";
          break;
        case 32801:
          id result = "Post Convolution Green Bias";
          break;
        case 32802:
          id result = "Post Convolution Blue Bias";
          break;
        case 32803:
          id result = "Post Convolution Alpha Bias";
          break;
        case 32804:
          id result = "Histogram";
          break;
        case 32805:
          id result = "Proxy Histogram";
          break;
        case 32806:
          id result = "Histogram Width";
          break;
        case 32807:
          id result = "Histogram Format";
          break;
        case 32808:
          id result = "Histogram Red Size";
          break;
        case 32809:
          id result = "Histogram Green Size";
          break;
        case 32810:
          id result = "Histogram Blue Size";
          break;
        case 32811:
          id result = "Histogram Alpha Size";
          break;
        case 32812:
          id result = "Histogram Luminance Size";
          break;
        case 32813:
          id result = "Histogram Sink";
          break;
        case 32814:
          id result = "Minmax";
          break;
        case 32815:
          id result = "Minmax Format";
          break;
        case 32816:
          id result = "Minmax Sink";
          break;
        case 32817:
          id result = "Table Too Large";
          break;
        case 32818:
          id result = "Unsigned Byte 3 3 2";
          break;
        case 32819:
          id result = "Unsigned Short 4 4 4 4";
          break;
        case 32820:
          id result = "Unsigned Short 5 5 5 1";
          break;
        case 32821:
          id result = "Unsigned Int 8 8 8 8";
          break;
        case 32822:
          id result = "Unsigned Int 10 10 10 2";
          break;
        case 32823:
          id result = "Fill";
          break;
        case 32824:
          id result = "Factor";
          break;
        case 32825:
          id result = "Bias";
          break;
        case 32826:
          id result = "Rescale Normal";
          break;
        case 32827:
          id result = "Alpha4";
          break;
        case 32828:
          id result = "Alpha8";
          break;
        case 32829:
          id result = "Alpha12";
          break;
        case 32830:
          id result = "Alpha16";
          break;
        case 32831:
          id result = "Luminance4";
          break;
        case 32832:
          id result = "Luminance8";
          break;
        case 32833:
          id result = "Luminance12";
          break;
        case 32834:
          id result = "Luminance16";
          break;
        case 32835:
          id result = "Luminance4 Alpha4";
          break;
        case 32836:
          id result = "Luminance6 Alpha2";
          break;
        case 32837:
          id result = "Luminance8 Alpha8";
          break;
        case 32838:
          id result = "Luminance12 Alpha4";
          break;
        case 32839:
          id result = "Luminance12 Alpha12";
          break;
        case 32840:
          id result = "Luminance16 Alpha16";
          break;
        case 32841:
          id result = "Intensity";
          break;
        case 32842:
          id result = "Intensity4";
          break;
        case 32843:
          id result = "Intensity8";
          break;
        case 32844:
          id result = "Intensity12";
          break;
        case 32845:
          id result = "Intensity16";
          break;
        case 32846:
          id result = "RGB2";
          break;
        case 32847:
          id result = "RGB4";
          break;
        case 32848:
          id result = "RGB5";
          break;
        case 32849:
          id result = "RGB8";
          break;
        case 32850:
          id result = "RGB10";
          break;
        case 32851:
          id result = "RGB12";
          break;
        case 32852:
          id result = "RGB16";
          break;
        case 32853:
          id result = "RGBA2";
          break;
        case 32854:
          id result = "RGBA4";
          break;
        case 32855:
          id result = "RGB5 A1";
          break;
        case 32856:
          id result = "RGBA8";
          break;
        case 32857:
          id result = "RGB10 A2";
          break;
        case 32858:
          id result = "RGBA12";
          break;
        case 32859:
          id result = "RGBA16";
          break;
        case 32860:
          id result = "Red Size";
          break;
        case 32861:
          id result = "Green Size";
          break;
        case 32862:
          id result = "Blue Size";
          break;
        case 32863:
          id result = "Alpha Size";
          break;
        case 32864:
          id result = "Luminance Size";
          break;
        case 32865:
          id result = "Intensity Size";
          break;
        case 32866:
          id result = "Replace";
          break;
        case 32867:
          id result = "Proxy Texture 1D";
          break;
        case 32868:
          id result = "Proxy Texture 2D";
          break;
        case 32869:
          id result = "Too Large";
          break;
        case 32870:
          id result = "Priority";
          break;
        case 32871:
          id result = "Resident";
          break;
        case 32872:
          id result = "Binding 1D";
          break;
        case 32873:
          id result = "Binding 2D";
          break;
        case 32874:
          id result = "Binding 3D";
          break;
        case 32875:
          id result = "Pack Skip Images";
          break;
        case 32876:
          id result = "Pack Image Height";
          break;
        case 32877:
          id result = "Unpack Skip Images";
          break;
        case 32878:
          id result = "Unpack Image Height";
          break;
        case 32879:
          id result = "3D";
          break;
        case 32880:
          id result = "Proxy Texture 3D";
          break;
        case 32881:
          id result = "Depth";
          break;
        case 32882:
          id result = "Wrap R";
          break;
        case 32883:
          id result = "Max 3D Texture Size";
          break;
        case 32884:
          id result = "Vertex Array";
          break;
        case 32885:
          id result = "Normal Array";
          break;
        case 32886:
          id result = "Color Array";
          break;
        case 32887:
          id result = "Index Array";
          break;
        case 32888:
          id result = "Coord Array";
          break;
        case 32889:
          id result = "Edge Flag Array";
          break;
        case 32890:
          id result = "Vertex Array Size";
          break;
        case 32891:
          id result = "Vertex Array Type";
          break;
        case 32892:
          id result = "Vertex Array Stride";
          break;
        case 32893:
          id result = "Vertex Array Count";
          break;
        case 32894:
          id result = "Normal Array Type";
          break;
        case 32895:
          id result = "Normal Array Stride";
          break;
        case 32896:
          id result = "Normal Array Count";
          break;
        case 32897:
          id result = "Color Array Size";
          break;
        case 32898:
          id result = "Color Array Type";
          break;
        case 32899:
          id result = "Color Array Stride";
          break;
        case 32900:
          id result = "Color Array Count";
          break;
        case 32901:
          id result = "Index Array Type";
          break;
        case 32902:
          id result = "Index Array Stride";
          break;
        case 32903:
          id result = "Index Array Count";
          break;
        case 32904:
          id result = "Coord Array Size";
          break;
        case 32905:
          id result = "Coord Array Type";
          break;
        case 32906:
          id result = "Coord Array Stride";
          break;
        case 32907:
          id result = "Coord Array Count";
          break;
        case 32908:
          id result = "Edge Flag Array Stride";
          break;
        case 32909:
          id result = "Edge Flag Array Count";
          break;
        case 32910:
          id result = "Vertex Array Pointer";
          break;
        case 32911:
          id result = "Normal Array Pointer";
          break;
        case 32912:
          id result = "Color Array Pointer";
          break;
        case 32913:
          id result = "Index Array Pointer";
          break;
        case 32914:
          id result = "Coord Array Pointer";
          break;
        case 32915:
          id result = "Edge Flag Array Pointer";
          break;
        case 32925:
          id result = "Multisample";
          break;
        case 32926:
          id result = "Alpha To Coverage";
          break;
        case 32927:
          id result = "Alpha To One";
          break;
        case 32928:
          id result = "Coverage";
          break;
        case 32936:
          id result = "Sample Buffers";
          break;
        case 32937:
          id result = "Samples";
          break;
        case 32938:
          id result = "Coverage Value";
          break;
        case 32939:
          id result = "Coverage Invert";
          break;
        case 32945:
          id result = "Matrix";
          break;
        case 32946:
          id result = "Matrix Stack Depth";
          break;
        case 32947:
          id result = "Max Color Matrix Stack Depth";
          break;
        case 32948:
          id result = "Post Color Matrix Red Scale";
          break;
        case 32949:
          id result = "Post Color Matrix Green Scale";
          break;
        case 32950:
          id result = "Post Color Matrix Blue Scale";
          break;
        case 32951:
          id result = "Post Color Matrix Alpha Scale";
          break;
        case 32952:
          id result = "Post Color Matrix Red Bias";
          break;
        case 32953:
          id result = "Post Color Matrix Green Bias";
          break;
        case 32954:
          id result = "Post Color Matrix Blue Bias";
          break;
        case 32955:
          id result = "Post Color Matrix Alpha Bias";
          break;
        case 32959:
          id result = "Compare Fail Value";
          break;
        case 32968:
          id result = "Dst RGB";
          break;
        case 32969:
          id result = "Src RGB";
          break;
        case 32970:
          id result = "Dst Alpha";
          break;
        case 32971:
          id result = "Src Alpha";
          break;
        case 32976:
          id result = "Table";
          break;
        case 32977:
          id result = "Post Convolution Color Table";
          break;
        case 32978:
          id result = "Post Color Matrix Color Table";
          break;
        case 32979:
          id result = "Proxy Color Table";
          break;
        case 32980:
          id result = "Proxy Post Convolution Color Table";
          break;
        case 32981:
          id result = "Proxy Post Color Matrix Color Table";
          break;
        case 32982:
          id result = "Table Scale";
          break;
        case 32983:
          id result = "Table Bias";
          break;
        case 32984:
          id result = "Table Format";
          break;
        case 32985:
          id result = "Table Width";
          break;
        case 32986:
          id result = "Table Red Size";
          break;
        case 32987:
          id result = "Table Green Size";
          break;
        case 32988:
          id result = "Table Blue Size";
          break;
        case 32989:
          id result = "Table Alpha Size";
          break;
        case 32990:
          id result = "Table Luminance Size";
          break;
        case 32991:
          id result = "Table Intensity Size";
          break;
        case 32992:
          id result = "BGR";
          break;
        case 32993:
          id result = "BGRA";
          break;
        case 32994:
          id result = "Index1";
          break;
        case 32995:
          id result = "Index2";
          break;
        case 32996:
          id result = "Index4";
          break;
        case 32997:
          id result = "Index8";
          break;
        case 32998:
          id result = "Index12";
          break;
        case 32999:
          id result = "Index16";
          break;
        case 33000:
          id result = "Max Elements Vertices";
          break;
        case 33001:
          id result = "Max Elements Indices";
          break;
        case 33005:
          id result = "Index Size";
          break;
        case 33008:
          id result = "Clip Volume Clipping Hint";
          break;
        case 33062:
          id result = "Size Min";
          break;
        case 33063:
          id result = "Size Max";
          break;
        case 33064:
          id result = "Fade Threshold Size";
          break;
        case 33065:
          id result = "Distance Attenuation";
          break;
        case 33069:
          id result = "Clamp To Border";
          break;
        case 33071:
          id result = "Clamp To Edge";
          break;
        case 33082:
          id result = "Min Lod";
          break;
        case 33083:
          id result = "Max Lod";
          break;
        case 33084:
          id result = "Base Level";
          break;
        case 33085:
          id result = "Max Level";
          break;
        case 33104:
          id result = "Ignore Border";
          break;
        case 33105:
          id result = "Constant Border";
          break;
        case 33107:
          id result = "Replicate Border";
          break;
        case 33108:
          id result = "Convolution Border Color";
          break;
        case 33169:
          id result = "Generate Mipmap";
          break;
        case 33170:
          id result = "Generate Mipmap Hint";
          break;
        case 33189:
          id result = "Depth Component16";
          break;
        case 33190:
          id result = "Depth Component24";
          break;
        case 33191:
          id result = "Depth Component32";
          break;
        case 33192:
          id result = "Array Element Lock First";
          break;
        case 33193:
          id result = "Array Element Lock Count";
          break;
        case 33272:
          id result = "Control";
          break;
        case 33273:
          id result = "Single Color";
          break;
        case 33274:
          id result = "Separate Specular Color";
          break;
        case 33275:
          id result = "Shared Texture Palette";
          break;
        case 33280:
          id result = "Text Fragment Shader";
          break;
        case 33296:
          id result = "Attachment Color Encoding";
          break;
        case 33297:
          id result = "Attachment Component Type";
          break;
        case 33298:
          id result = "Attachment Red Size";
          break;
        case 33299:
          id result = "Attachment Green Size";
          break;
        case 33300:
          id result = "Attachment Blue Size";
          break;
        case 33301:
          id result = "Attachment Alpha Size";
          break;
        case 33302:
          id result = "Attachment Depth Size";
          break;
        case 33303:
          id result = "Attachment Stencil Size";
          break;
        case 33304:
          id result = "Default";
          break;
        case 33305:
          id result = "Undefined";
          break;
        case 33306:
          id result = "Stencil Attachment";
          break;
        case 33307:
          id result = "Major Version";
          break;
        case 33308:
          id result = "Minor Version";
          break;
        case 33309:
          id result = "Num Extensions";
          break;
        case 33310:
          id result = "Context Flags";
          break;
        case 33317:
          id result = "Compressed Red";
          break;
        case 33318:
          id result = "Compressed RG";
          break;
        case 33319:
          id result = "RG";
          break;
        case 33320:
          id result = "RG Integer";
          break;
        case 33321:
          id result = "R8";
          break;
        case 33322:
          id result = "R16";
          break;
        case 33323:
          id result = "RG8";
          break;
        case 33324:
          id result = "RG16";
          break;
        case 33325:
          id result = "R16f";
          break;
        case 33326:
          id result = "R32f";
          break;
        case 33327:
          id result = "RG16f";
          break;
        case 33328:
          id result = "RG32f";
          break;
        case 33329:
          id result = "R8i";
          break;
        case 33330:
          id result = "R8ui";
          break;
        case 33331:
          id result = "R16i";
          break;
        case 33332:
          id result = "R16ui";
          break;
        case 33333:
          id result = "R32i";
          break;
        case 33334:
          id result = "R32ui";
          break;
        case 33335:
          id result = "RG8i";
          break;
        case 33336:
          id result = "RG8ui";
          break;
        case 33337:
          id result = "RG16i";
          break;
        case 33338:
          id result = "RG16ui";
          break;
        case 33339:
          id result = "RG32i";
          break;
        case 33340:
          id result = "RG32ui";
          break;
        case 33344:
          id result = "Sync CL Event";
          break;
        case 33345:
          id result = "Sync CL Event Complete";
          break;
        case 33367:
          id result = "Program Binary Retrievable Hint";
          break;
        case 33368:
          id result = "Program Separable";
          break;
        case 33369:
          id result = "Active Program";
          break;
        case 33370:
          id result = "Program Pipeline Binding";
          break;
        case 33371:
          id result = "Max Viewports";
          break;
        case 33372:
          id result = "Viewport Subpixel Bits";
          break;
        case 33373:
          id result = "Viewport Bounds Range";
          break;
        case 33374:
          id result = "Layer Provoking Vertex";
          break;
        case 33375:
          id result = "Viewport Index Provoking Vertex";
          break;
        case 33376:
          id result = "Undefined Vertex";
          break;
        case 33503:
          id result = "Immutable Levels";
          break;
        case 33510:
          id result = "Sampler";
          break;
        case 33634:
          id result = "Unsigned Byte 2 3 3 Rev";
          break;
        case 33635:
          id result = "Unsigned Short 5 6 5";
          break;
        case 33636:
          id result = "Unsigned Short 5 6 5 Rev";
          break;
        case 33637:
          id result = "Unsigned Short 4 4 4 4 Rev";
          break;
        case 33638:
          id result = "Unsigned Short 1 5 5 5 Rev";
          break;
        case 33639:
          id result = "Unsigned Int 8 8 8 8 Rev";
          break;
        case 33640:
          id result = "Unsigned Int 2 10 10 10 Rev";
          break;
        case 33648:
          id result = "Mirrored Repeat";
          break;
        case 33776:
          id result = "Compressed RGB S3TC DXT1";
          break;
        case 33777:
          id result = "Compressed RGBA S3TC DXT1";
          break;
        case 33778:
          id result = "Compressed RGBA S3TC DXT3";
          break;
        case 33779:
          id result = "Compressed RGBA S3TC DXT5";
          break;
        case 33872:
          id result = "Coord Src";
          break;
        case 33873:
          id result = "Coord";
          break;
        case 33874:
          id result = "Fragment Depth";
          break;
        case 33875:
          id result = "Current Fog Coordinate";
          break;
        case 33876:
          id result = "Coord Array Type";
          break;
        case 33877:
          id result = "Coord Array Stride";
          break;
        case 33878:
          id result = "Coord Array Pointer";
          break;
        case 33879:
          id result = "Coord Array";
          break;
        case 33880:
          id result = "Sum";
          break;
        case 33881:
          id result = "Current Secondary Color";
          break;
        case 33882:
          id result = "Secondary Color Array Size";
          break;
        case 33883:
          id result = "Secondary Color Array Type";
          break;
        case 33884:
          id result = "Secondary Color Array Stride";
          break;
        case 33885:
          id result = "Secondary Color Array Pointer";
          break;
        case 33886:
          id result = "Secondary Color Array";
          break;
        case 33887:
          id result = "Current Raster Secondary Color";
          break;
        case 33901:
          id result = "Aliased Point Size Range";
          break;
        case 33902:
          id result = "Aliased Line Width Range";
          break;
        case 33984:
          id result = "Texture0";
          break;
        case 33985:
          id result = "Texture1";
          break;
        case 33986:
          id result = "Texture2";
          break;
        case 33987:
          id result = "Texture3";
          break;
        case 33988:
          id result = "Texture4";
          break;
        case 33989:
          id result = "Texture5";
          break;
        case 33990:
          id result = "Texture6";
          break;
        case 33991:
          id result = "Texture7";
          break;
        case 33992:
          id result = "Texture8";
          break;
        case 33993:
          id result = "Texture9";
          break;
        case 33994:
          id result = "Texture10";
          break;
        case 33995:
          id result = "Texture11";
          break;
        case 33996:
          id result = "Texture12";
          break;
        case 33997:
          id result = "Texture13";
          break;
        case 33998:
          id result = "Texture14";
          break;
        case 33999:
          id result = "Texture15";
          break;
        case 34000:
          id result = "Texture16";
          break;
        case 34001:
          id result = "Texture17";
          break;
        case 34002:
          id result = "Texture18";
          break;
        case 34003:
          id result = "Texture19";
          break;
        case 34004:
          id result = "Texture20";
          break;
        case 34005:
          id result = "Texture21";
          break;
        case 34006:
          id result = "Texture22";
          break;
        case 34007:
          id result = "Texture23";
          break;
        case 34008:
          id result = "Texture24";
          break;
        case 34009:
          id result = "Texture25";
          break;
        case 34010:
          id result = "Texture26";
          break;
        case 34011:
          id result = "Texture27";
          break;
        case 34012:
          id result = "Texture28";
          break;
        case 34013:
          id result = "Texture29";
          break;
        case 34014:
          id result = "Texture30";
          break;
        case 34015:
          id result = "Texture31";
          break;
        case 34016:
          id result = "Active Texture";
          break;
        case 34017:
          id result = "Client Active Texture";
          break;
        case 34018:
          id result = "Max Texture Units";
          break;
        case 34019:
          id result = "Transpose Modelview Matrix";
          break;
        case 34020:
          id result = "Transpose Projection Matrix";
          break;
        case 34021:
          id result = "Transpose Texture Matrix";
          break;
        case 34022:
          id result = "Transpose Color Matrix";
          break;
        case 34023:
          id result = "Subtract";
          break;
        case 34024:
          id result = "Max Renderbuffer Size";
          break;
        case 34025:
          id result = "Compressed Alpha";
          break;
        case 34026:
          id result = "Compressed Luminance";
          break;
        case 34027:
          id result = "Compressed Luminance Alpha";
          break;
        case 34028:
          id result = "Compressed Intensity";
          break;
        case 34029:
          id result = "Compressed RGB";
          break;
        case 34030:
          id result = "Compressed RGBA";
          break;
        case 34031:
          id result = "Compression Hint";
          break;
        case 34032:
          id result = "Uniform Block Referenced By Tess Control Shader";
          break;
        case 34033:
          id result = "Uniform Block Referenced By Tess Evaluation Shader";
          break;
        case 34037:
          id result = "Rectangle";
          break;
        case 34038:
          id result = "Binding Rectangle";
          break;
        case 34039:
          id result = "Proxy Texture Rectangle";
          break;
        case 34040:
          id result = "Max Rectangle Texture Size";
          break;
        case 34041:
          id result = "Stencil";
          break;
        case 34042:
          id result = "Unsigned Int 24 8";
          break;
        case 34045:
          id result = "Max Texture Lod Bias";
          break;
        case 34046:
          id result = "Max Anisotropy";
          break;
        case 34047:
          id result = "Max Texture Max Anisotropy";
          break;
        case 34048:
          id result = "Filter Control";
          break;
        case 34049:
          id result = "Lod Bias";
          break;
        case 34052:
          id result = "Max Shininess";
          break;
        case 34053:
          id result = "Max Spot Exponent";
          break;
        case 34055:
          id result = "Incr Wrap";
          break;
        case 34056:
          id result = "Decr Wrap";
          break;
        case 34058:
          id result = "Modelview1";
          break;
        case 34065:
          id result = "Normal Map";
          break;
        case 34066:
          id result = "Reflection Map";
          break;
        case 34067:
          id result = "Cube Map";
          break;
        case 34068:
          id result = "Binding Cube Map";
          break;
        case 34069:
          id result = "Cube Map Positive X";
          break;
        case 34070:
          id result = "Cube Map Negative X";
          break;
        case 34071:
          id result = "Cube Map Positive Y";
          break;
        case 34072:
          id result = "Cube Map Negative Y";
          break;
        case 34073:
          id result = "Cube Map Positive Z";
          break;
        case 34074:
          id result = "Cube Map Negative Z";
          break;
        case 34075:
          id result = "Proxy Texture Cube Map";
          break;
        case 34076:
          id result = "Max Cube Map Texture Size";
          break;
        case 34077:
          id result = "Vertex Array Range";
          break;
        case 34078:
          id result = "Vertex Array Range Length";
          break;
        case 34079:
          id result = "Vertex Array Storage Hint";
          break;
        case 34080:
          id result = "Max Vertex Array Range Element";
          break;
        case 34081:
          id result = "Vertex Array Range Pointer";
          break;
        case 34082:
          id result = "Register Combiners";
          break;
        case 34083:
          id result = "Variable A";
          break;
        case 34084:
          id result = "Variable B";
          break;
        case 34085:
          id result = "Variable C";
          break;
        case 34086:
          id result = "Variable D";
          break;
        case 34087:
          id result = "Variable E";
          break;
        case 34088:
          id result = "Variable F";
          break;
        case 34089:
          id result = "Variable G";
          break;
        case 34090:
          id result = "Constant Color0";
          break;
        case 34091:
          id result = "Constant Color1";
          break;
        case 34092:
          id result = "Primary Color";
          break;
        case 34093:
          id result = "Secondary Color";
          break;
        case 34094:
          id result = "Spare0";
          break;
        case 34095:
          id result = "Spare1";
          break;
        case 34096:
          id result = "Discard";
          break;
        case 34097:
          id result = "E Times F";
          break;
        case 34098:
          id result = "Spare0 Plus Secondary Color";
          break;
        case 34099:
          id result = "Vertex Array Range Without Flush";
          break;
        case 34100:
          id result = "Multisample Filter Hint";
          break;
        case 34101:
          id result = "Per Stage Constants";
          break;
        case 34102:
          id result = "Unsigned Identity";
          break;
        case 34103:
          id result = "Unsigned Invert";
          break;
        case 34104:
          id result = "Expand Normal";
          break;
        case 34105:
          id result = "Expand Negate";
          break;
        case 34106:
          id result = "Half Bias Normal";
          break;
        case 34107:
          id result = "Half Bias Negate";
          break;
        case 34108:
          id result = "Signed Identity";
          break;
        case 34109:
          id result = "Signed Negate";
          break;
        case 34110:
          id result = "Scale By Two";
          break;
        case 34111:
          id result = "Scale By Four";
          break;
        case 34112:
          id result = "Scale By One Half";
          break;
        case 34113:
          id result = "Bias By Negative One Half";
          break;
        case 34114:
          id result = "Combiner Input";
          break;
        case 34115:
          id result = "Combiner Mapping";
          break;
        case 34116:
          id result = "Combiner Component Usage";
          break;
        case 34117:
          id result = "Combiner Ab Dot Product";
          break;
        case 34118:
          id result = "Combiner Cd Dot Product";
          break;
        case 34119:
          id result = "Combiner Mux Sum";
          break;
        case 34120:
          id result = "Combiner Scale";
          break;
        case 34121:
          id result = "Combiner Bias";
          break;
        case 34122:
          id result = "Combiner Ab Output";
          break;
        case 34123:
          id result = "Combiner Cd Output";
          break;
        case 34124:
          id result = "Combiner Sum Output";
          break;
        case 34125:
          id result = "Max General Combiners";
          break;
        case 34126:
          id result = "Num General Combiners";
          break;
        case 34127:
          id result = "Sum Clamp";
          break;
        case 34128:
          id result = "Combiner0";
          break;
        case 34129:
          id result = "Combiner1";
          break;
        case 34130:
          id result = "Combiner2";
          break;
        case 34131:
          id result = "Combiner3";
          break;
        case 34132:
          id result = "Combiner4";
          break;
        case 34133:
          id result = "Combiner5";
          break;
        case 34134:
          id result = "Combiner6";
          break;
        case 34135:
          id result = "Combiner7";
          break;
        case 34138:
          id result = "Distance Mode";
          break;
        case 34139:
          id result = "Eye Radial";
          break;
        case 34140:
          id result = "Eye Plane Absolute";
          break;
        case 34160:
          id result = "Combine";
          break;
        case 34161:
          id result = "Combine RGB";
          break;
        case 34162:
          id result = "Combine Alpha";
          break;
        case 34163:
          id result = "RGB Scale";
          break;
        case 34164:
          id result = "Add Signed";
          break;
        case 34165:
          id result = "Interpolate";
          break;
        case 34166:
          id result = "Constant";
          break;
        case 34167:
          id result = "Primary Color";
          break;
        case 34168:
          id result = "Previous";
          break;
        case 34176:
          id result = "Src0 RGB";
          break;
        case 34177:
          id result = "Src1 RGB";
          break;
        case 34178:
          id result = "Src2 RGB";
          break;
        case 34184:
          id result = "Src0 Alpha";
          break;
        case 34185:
          id result = "Src1 Alpha";
          break;
        case 34186:
          id result = "Src2 Alpha";
          break;
        case 34192:
          id result = "Operand0 RGB";
          break;
        case 34193:
          id result = "Operand1 RGB";
          break;
        case 34194:
          id result = "Operand2 RGB";
          break;
        case 34200:
          id result = "Operand0 Alpha";
          break;
        case 34201:
          id result = "Operand1 Alpha";
          break;
        case 34202:
          id result = "Operand2 Alpha";
          break;
        case 34224:
          id result = "Specular Vector";
          break;
        case 34225:
          id result = "Transform Hint";
          break;
        case 34226:
          id result = "Unpack Client Storage";
          break;
        case 34227:
          id result = "Object";
          break;
        case 34228:
          id result = "Storage Client";
          break;
        case 34229:
          id result = "Vertex Array Binding";
          break;
        case 34230:
          id result = "Minimize Storage";
          break;
        case 34231:
          id result = "Range Length";
          break;
        case 34232:
          id result = "Range Pointer";
          break;
        case 34233:
          id result = "Ycbcr 422";
          break;
        case 34234:
          id result = "Unsigned Short 8 8";
          break;
        case 34235:
          id result = "Unsigned Short 8 8 Rev";
          break;
        case 34236:
          id result = "Storage Hint";
          break;
        case 34237:
          id result = "Storage Private";
          break;
        case 34238:
          id result = "Storage Cached";
          break;
        case 34239:
          id result = "Storage Shared";
          break;
        case 34336:
          id result = "Vertex Program";
          break;
        case 34337:
          id result = "Vertex State Program";
          break;
        case 34338:
          id result = "Enabled";
          break;
        case 34339:
          id result = "Size";
          break;
        case 34340:
          id result = "Stride";
          break;
        case 34341:
          id result = "Type";
          break;
        case 34342:
          id result = "Current Vertex Attrib";
          break;
        case 34343:
          id result = "Program Length";
          break;
        case 34344:
          id result = "Program String";
          break;
        case 34345:
          id result = "Modelview Projection";
          break;
        case 34346:
          id result = "Identity";
          break;
        case 34347:
          id result = "Inverse";
          break;
        case 34348:
          id result = "Transpose";
          break;
        case 34349:
          id result = "Inverse Transpose";
          break;
        case 34350:
          id result = "Max Program Matrix Stack Depth";
          break;
        case 34351:
          id result = "Max Program Matrices";
          break;
        case 34352:
          id result = "Matrix0";
          break;
        case 34353:
          id result = "Matrix1";
          break;
        case 34354:
          id result = "Matrix2";
          break;
        case 34355:
          id result = "Matrix3";
          break;
        case 34356:
          id result = "Matrix4";
          break;
        case 34357:
          id result = "Matrix5";
          break;
        case 34358:
          id result = "Matrix6";
          break;
        case 34359:
          id result = "Matrix7";
          break;
        case 34368:
          id result = "Current Matrix Stack Depth";
          break;
        case 34369:
          id result = "Current Matrix";
          break;
        case 34370:
          id result = "Program Point Size";
          break;
        case 34371:
          id result = "Vertex Program Two Side";
          break;
        case 34372:
          id result = "Program Parameter";
          break;
        case 34373:
          id result = "Pointer";
          break;
        case 34374:
          id result = "Program Target";
          break;
        case 34375:
          id result = "Program Resident";
          break;
        case 34376:
          id result = "Track Matrix";
          break;
        case 34377:
          id result = "Track Matrix Transform";
          break;
        case 34378:
          id result = "Vertex Program Binding";
          break;
        case 34379:
          id result = "Program Error Position";
          break;
        case 34380:
          id result = "Offset Texture Rectangle";
          break;
        case 34381:
          id result = "Offset Texture Rectangle Scale";
          break;
        case 34382:
          id result = "Dot Product Texture Rectangle";
          break;
        case 34383:
          id result = "Clamp";
          break;
        case 34384:
          id result = "Vertex Attrib Array0";
          break;
        case 34385:
          id result = "Vertex Attrib Array1";
          break;
        case 34386:
          id result = "Vertex Attrib Array2";
          break;
        case 34387:
          id result = "Vertex Attrib Array3";
          break;
        case 34388:
          id result = "Vertex Attrib Array4";
          break;
        case 34389:
          id result = "Vertex Attrib Array5";
          break;
        case 34390:
          id result = "Vertex Attrib Array6";
          break;
        case 34391:
          id result = "Vertex Attrib Array7";
          break;
        case 34392:
          id result = "Vertex Attrib Array8";
          break;
        case 34393:
          id result = "Vertex Attrib Array9";
          break;
        case 34394:
          id result = "Vertex Attrib Array10";
          break;
        case 34395:
          id result = "Vertex Attrib Array11";
          break;
        case 34396:
          id result = "Vertex Attrib Array12";
          break;
        case 34397:
          id result = "Vertex Attrib Array13";
          break;
        case 34398:
          id result = "Vertex Attrib Array14";
          break;
        case 34399:
          id result = "Vertex Attrib Array15";
          break;
        case 34400:
          id result = "Map1 Vertex Attrib0 4";
          break;
        case 34401:
          id result = "Map1 Vertex Attrib1 4";
          break;
        case 34402:
          id result = "Map1 Vertex Attrib2 4";
          break;
        case 34403:
          id result = "Map1 Vertex Attrib3 4";
          break;
        case 34404:
          id result = "Map1 Vertex Attrib4 4";
          break;
        case 34405:
          id result = "Map1 Vertex Attrib5 4";
          break;
        case 34406:
          id result = "Map1 Vertex Attrib6 4";
          break;
        case 34407:
          id result = "Map1 Vertex Attrib7 4";
          break;
        case 34408:
          id result = "Map1 Vertex Attrib8 4";
          break;
        case 34409:
          id result = "Map1 Vertex Attrib9 4";
          break;
        case 34410:
          id result = "Map1 Vertex Attrib10 4";
          break;
        case 34411:
          id result = "Map1 Vertex Attrib11 4";
          break;
        case 34412:
          id result = "Map1 Vertex Attrib12 4";
          break;
        case 34413:
          id result = "Map1 Vertex Attrib13 4";
          break;
        case 34414:
          id result = "Map1 Vertex Attrib14 4";
          break;
        case 34415:
          id result = "Map1 Vertex Attrib15 4";
          break;
        case 34416:
          id result = "Map2 Vertex Attrib0 4";
          break;
        case 34417:
          id result = "Map2 Vertex Attrib1 4";
          break;
        case 34418:
          id result = "Map2 Vertex Attrib2 4";
          break;
        case 34419:
          id result = "Map2 Vertex Attrib3 4";
          break;
        case 34420:
          id result = "Map2 Vertex Attrib4 4";
          break;
        case 34421:
          id result = "Map2 Vertex Attrib5 4";
          break;
        case 34422:
          id result = "Map2 Vertex Attrib6 4";
          break;
        case 34423:
          id result = "Program Binding";
          break;
        case 34424:
          id result = "Map2 Vertex Attrib8 4";
          break;
        case 34425:
          id result = "Map2 Vertex Attrib9 4";
          break;
        case 34426:
          id result = "Map2 Vertex Attrib10 4";
          break;
        case 34427:
          id result = "Map2 Vertex Attrib11 4";
          break;
        case 34428:
          id result = "Map2 Vertex Attrib12 4";
          break;
        case 34429:
          id result = "Map2 Vertex Attrib13 4";
          break;
        case 34430:
          id result = "Map2 Vertex Attrib14 4";
          break;
        case 34431:
          id result = "Map2 Vertex Attrib15 4";
          break;
        case 34464:
          id result = "Compressed Image Size";
          break;
        case 34465:
          id result = "Compressed";
          break;
        case 34466:
          id result = "Num Compressed Texture Formats";
          break;
        case 34467:
          id result = "Compressed Texture Formats";
          break;
        case 34468:
          id result = "Max Vertex Units";
          break;
        case 34469:
          id result = "Active Vertex Units";
          break;
        case 34470:
          id result = "Weight Sum Unity";
          break;
        case 34471:
          id result = "Vertex Blend";
          break;
        case 34472:
          id result = "Current Weight";
          break;
        case 34473:
          id result = "Weight Array Type";
          break;
        case 34474:
          id result = "Weight Array Stride";
          break;
        case 34475:
          id result = "Weight Array Size";
          break;
        case 34476:
          id result = "Weight Array Pointer";
          break;
        case 34477:
          id result = "Weight Array";
          break;
        case 34478:
          id result = "Dot3 RGB";
          break;
        case 34479:
          id result = "Dot3 RGBA";
          break;
        case 34521:
          id result = "RGBA Unsigned Dot Product Mapping";
          break;
        case 34522:
          id result = "Unsigned Int S8 S8 8 8";
          break;
        case 34523:
          id result = "Unsigned Int 8 8 S8 S8 Rev";
          break;
        case 34524:
          id result = "Dsdt Mag Intensity";
          break;
        case 34525:
          id result = "Shader Consistent";
          break;
        case 34526:
          id result = "Shader";
          break;
        case 34527:
          id result = "Shader Operation";
          break;
        case 34528:
          id result = "Cull Modes";
          break;
        case 34529:
          id result = "Offset Texture Matrix";
          break;
        case 34530:
          id result = "Offset Texture Scale";
          break;
        case 34531:
          id result = "Offset Texture Bias";
          break;
        case 34532:
          id result = "Previous Texture Input";
          break;
        case 34533:
          id result = "Const Eye";
          break;
        case 34534:
          id result = "Pass Through";
          break;
        case 34535:
          id result = "Cull Fragment";
          break;
        case 34536:
          id result = "Offset Texture 2D";
          break;
        case 34537:
          id result = "Dependent Ar Texture 2D";
          break;
        case 34538:
          id result = "Dependent Gb Texture 2D";
          break;
        case 34540:
          id result = "Dot Product";
          break;
        case 34541:
          id result = "Dot Product Depth Replace";
          break;
        case 34542:
          id result = "Dot Product Texture 2D";
          break;
        case 34543:
          id result = "Dot Product Texture 3D";
          break;
        case 34544:
          id result = "Dot Product Texture Cube Map";
          break;
        case 34545:
          id result = "Dot Product Diffuse Cube Map";
          break;
        case 34546:
          id result = "Dot Product Reflect Cube Map";
          break;
        case 34547:
          id result = "Dot Product Const Eye Reflect Cube Map";
          break;
        case 34548:
          id result = "Hilo";
          break;
        case 34549:
          id result = "Dsdt";
          break;
        case 34550:
          id result = "Dsdt Mag";
          break;
        case 34551:
          id result = "Dsdt Mag Vib";
          break;
        case 34552:
          id result = "Hilo16";
          break;
        case 34553:
          id result = "Signed Hilo";
          break;
        case 34554:
          id result = "Signed Hilo16";
          break;
        case 34555:
          id result = "Signed RGBA";
          break;
        case 34556:
          id result = "Signed RGBA8";
          break;
        case 34558:
          id result = "Signed RGB";
          break;
        case 34559:
          id result = "Signed RGB8";
          break;
        case 34561:
          id result = "Signed Luminance";
          break;
        case 34562:
          id result = "Signed Luminance8";
          break;
        case 34563:
          id result = "Signed Luminance Alpha";
          break;
        case 34564:
          id result = "Signed Luminance8 Alpha8";
          break;
        case 34565:
          id result = "Signed Alpha";
          break;
        case 34566:
          id result = "Signed Alpha8";
          break;
        case 34567:
          id result = "Signed Intensity";
          break;
        case 34568:
          id result = "Signed Intensity8";
          break;
        case 34569:
          id result = "Dsdt8";
          break;
        case 34570:
          id result = "Dsdt8 Mag8";
          break;
        case 34571:
          id result = "Dsdt8 Mag8 Intensity8";
          break;
        case 34572:
          id result = "Signed RGB Unsigned Alpha";
          break;
        case 34573:
          id result = "Signed RGB8 Unsigned Alpha8";
          break;
        case 34574:
          id result = "Hi Scale";
          break;
        case 34575:
          id result = "Lo Scale";
          break;
        case 34576:
          id result = "Ds Scale";
          break;
        case 34577:
          id result = "Dt Scale";
          break;
        case 34578:
          id result = "Magnitude Scale";
          break;
        case 34579:
          id result = "Vibrance Scale";
          break;
        case 34580:
          id result = "Hi Bias";
          break;
        case 34581:
          id result = "Lo Bias";
          break;
        case 34582:
          id result = "Ds Bias";
          break;
        case 34583:
          id result = "Dt Bias";
          break;
        case 34584:
          id result = "Magnitude Bias";
          break;
        case 34585:
          id result = "Vibrance Bias";
          break;
        case 34586:
          id result = "Border Values";
          break;
        case 34587:
          id result = "Hi Size";
          break;
        case 34588:
          id result = "Lo Size";
          break;
        case 34589:
          id result = "Ds Size";
          break;
        case 34590:
          id result = "Dt Size";
          break;
        case 34591:
          id result = "Mag Size";
          break;
        case 34594:
          id result = "Modelview2";
          break;
        case 34595:
          id result = "Modelview3";
          break;
        case 34596:
          id result = "Modelview4";
          break;
        case 34597:
          id result = "Modelview5";
          break;
        case 34598:
          id result = "Modelview6";
          break;
        case 34599:
          id result = "Modelview7";
          break;
        case 34600:
          id result = "Modelview8";
          break;
        case 34601:
          id result = "Modelview9";
          break;
        case 34602:
          id result = "Modelview10";
          break;
        case 34603:
          id result = "Modelview11";
          break;
        case 34604:
          id result = "Modelview12";
          break;
        case 34605:
          id result = "Modelview13";
          break;
        case 34606:
          id result = "Modelview14";
          break;
        case 34607:
          id result = "Modelview15";
          break;
        case 34608:
          id result = "Modelview16";
          break;
        case 34609:
          id result = "Modelview17";
          break;
        case 34610:
          id result = "Modelview18";
          break;
        case 34611:
          id result = "Modelview19";
          break;
        case 34612:
          id result = "Modelview20";
          break;
        case 34613:
          id result = "Modelview21";
          break;
        case 34614:
          id result = "Modelview22";
          break;
        case 34615:
          id result = "Modelview23";
          break;
        case 34616:
          id result = "Modelview24";
          break;
        case 34617:
          id result = "Modelview25";
          break;
        case 34618:
          id result = "Modelview26";
          break;
        case 34619:
          id result = "Modelview27";
          break;
        case 34620:
          id result = "Modelview28";
          break;
        case 34621:
          id result = "Modelview29";
          break;
        case 34622:
          id result = "Modelview30";
          break;
        case 34623:
          id result = "Modelview31";
          break;
        case 34625:
          id result = "Program Binary Length";
          break;
        case 34626:
          id result = "Mirror Clamp";
          break;
        case 34627:
          id result = "Mirror Clamp To Edge";
          break;
        case 34628:
          id result = "Modulate Add";
          break;
        case 34629:
          id result = "Modulate Signed Add";
          break;
        case 34630:
          id result = "Modulate Subtract";
          break;
        case 34660:
          id result = "Size";
          break;
        case 34661:
          id result = "Usage";
          break;
        case 34685:
          id result = "Min Weighted";
          break;
        case 34686:
          id result = "Max Weighted";
          break;
        case 34814:
          id result = "Num Program Binary Formats";
          break;
        case 34815:
          id result = "Program Binary Formats";
          break;
        case 34816:
          id result = "Back Func";
          break;
        case 34817:
          id result = "Back Fail";
          break;
        case 34818:
          id result = "Back Pass Depth Fail";
          break;
        case 34819:
          id result = "Back Pass Depth Pass";
          break;
        case 34820:
          id result = "Fragment Program";
          break;
        case 34821:
          id result = "Program Alu Instructions";
          break;
        case 34822:
          id result = "Program Tex Instructions";
          break;
        case 34823:
          id result = "Program Tex Indirections";
          break;
        case 34824:
          id result = "Program Native Alu Instructions";
          break;
        case 34825:
          id result = "Program Native Tex Instructions";
          break;
        case 34826:
          id result = "Program Native Tex Indirections";
          break;
        case 34827:
          id result = "Max Program Alu Instructions";
          break;
        case 34828:
          id result = "Max Program Tex Instructions";
          break;
        case 34829:
          id result = "Max Program Tex Indirections";
          break;
        case 34830:
          id result = "Max Program Native Alu Instructions";
          break;
        case 34831:
          id result = "Max Program Native Tex Instructions";
          break;
        case 34832:
          id result = "Max Program Native Tex Indirections";
          break;
        case 34836:
          id result = "RGBA32f";
          break;
        case 34837:
          id result = "RGB32f";
          break;
        case 34838:
          id result = "Alpha32f";
          break;
        case 34839:
          id result = "Intensity32f";
          break;
        case 34840:
          id result = "Luminance32f";
          break;
        case 34841:
          id result = "Luminance Alpha32f";
          break;
        case 34842:
          id result = "RGBA16f";
          break;
        case 34843:
          id result = "RGB16f";
          break;
        case 34844:
          id result = "Alpha16f";
          break;
        case 34845:
          id result = "Intensity16f";
          break;
        case 34846:
          id result = "Luminance16f";
          break;
        case 34847:
          id result = "Luminance Alpha16f";
          break;
        case 34848:
          id result = "RGBA Float Mode";
          break;
        case 34852:
          id result = "Max Draw Buffers";
          break;
        case 34853:
          id result = "Draw Buffer0";
          break;
        case 34854:
          id result = "Draw Buffer1";
          break;
        case 34855:
          id result = "Draw Buffer2";
          break;
        case 34856:
          id result = "Draw Buffer3";
          break;
        case 34857:
          id result = "Draw Buffer4";
          break;
        case 34858:
          id result = "Draw Buffer5";
          break;
        case 34859:
          id result = "Draw Buffer6";
          break;
        case 34860:
          id result = "Draw Buffer7";
          break;
        case 34861:
          id result = "Draw Buffer8";
          break;
        case 34862:
          id result = "Draw Buffer9";
          break;
        case 34863:
          id result = "Draw Buffer10";
          break;
        case 34864:
          id result = "Draw Buffer11";
          break;
        case 34865:
          id result = "Draw Buffer12";
          break;
        case 34866:
          id result = "Draw Buffer13";
          break;
        case 34867:
          id result = "Draw Buffer14";
          break;
        case 34868:
          id result = "Draw Buffer15";
          break;
        case 34871:
          id result = "Compressed Luminance Alpha 3DC";
          break;
        case 34877:
          id result = "Equation Alpha";
          break;
        case 34880:
          id result = "Matrix Palette";
          break;
        case 34882:
          id result = "Max Palette Matrices";
          break;
        case 34883:
          id result = "Current Palette Matrix";
          break;
        case 34884:
          id result = "Matrix Index Array";
          break;
        case 34886:
          id result = "Matrix Index Array Size";
          break;
        case 34887:
          id result = "Matrix Index Array Type";
          break;
        case 34888:
          id result = "Matrix Index Array Stride";
          break;
        case 34889:
          id result = "Matrix Index Array Pointer";
          break;
        case 34890:
          id result = "Size";
          break;
        case 34891:
          id result = "Texture Mode";
          break;
        case 34892:
          id result = "Compare Mode";
          break;
        case 34893:
          id result = "Compare Func";
          break;
        case 34894:
          id result = "Compare Ref To Texture";
          break;
        case 34895:
          id result = "Cube Map Seamless";
          break;
        case 34896:
          id result = "Offset Projective Texture 2D";
          break;
        case 34897:
          id result = "Offset Projective Texture 2D Scale";
          break;
        case 34898:
          id result = "Offset Projective Texture Rectangle";
          break;
        case 34899:
          id result = "Offset Projective Texture Rectangle Scale";
          break;
        case 34900:
          id result = "Offset Hilo Texture 2D";
          break;
        case 34901:
          id result = "Offset Hilo Texture Rectangle";
          break;
        case 34902:
          id result = "Offset Hilo Projective Texture 2D";
          break;
        case 34903:
          id result = "Offset Hilo Projective Texture Rectangle";
          break;
        case 34904:
          id result = "Dependent Hilo Texture 2D";
          break;
        case 34905:
          id result = "Dependent RGB Texture 3D";
          break;
        case 34906:
          id result = "Dependent RGB Texture Cube Map";
          break;
        case 34907:
          id result = "Dot Product Pass Through";
          break;
        case 34908:
          id result = "Dot Product Texture 1D";
          break;
        case 34909:
          id result = "Dot Product Affine Depth Replace";
          break;
        case 34910:
          id result = "Hilo8";
          break;
        case 34911:
          id result = "Signed Hilo8";
          break;
        case 34912:
          id result = "Force Blue To One";
          break;
        case 34913:
          id result = "Sprite";
          break;
        case 34914:
          id result = "Coord Replace";
          break;
        case 34915:
          id result = "Sprite R Mode";
          break;
        case 34916:
          id result = "Query Counter Bits";
          break;
        case 34917:
          id result = "Current Query";
          break;
        case 34918:
          id result = "Query Result";
          break;
        case 34919:
          id result = "Query Result Available";
          break;
        case 34921:
          id result = "Max Vertex Attribs";
          break;
        case 34922:
          id result = "Normalized";
          break;
        case 34924:
          id result = "Max Tess Control Input Components";
          break;
        case 34925:
          id result = "Max Tess Evaluation Input Components";
          break;
        case 34929:
          id result = "Max Texture Coords";
          break;
        case 34930:
          id result = "Max Texture Image Units";
          break;
        case 34932:
          id result = "Program Error String";
          break;
        case 34933:
          id result = "Program Format Ascii";
          break;
        case 34934:
          id result = "Program Format";
          break;
        case 34943:
          id result = "Geometry Shader Invocations";
          break;
        case 34960:
          id result = "Bounds Test";
          break;
        case 34961:
          id result = "Bounds";
          break;
        case 34962:
          id result = "Array Buffer";
          break;
        case 34963:
          id result = "Element Array Buffer";
          break;
        case 34964:
          id result = "Array Buffer Binding";
          break;
        case 34965:
          id result = "Element Array Buffer Binding";
          break;
        case 34966:
          id result = "Vertex Array Buffer Binding";
          break;
        case 34967:
          id result = "Normal Array Buffer Binding";
          break;
        case 34968:
          id result = "Color Array Buffer Binding";
          break;
        case 34969:
          id result = "Index Array Buffer Binding";
          break;
        case 34970:
          id result = "Coord Array Buffer Binding";
          break;
        case 34971:
          id result = "Edge Flag Array Buffer Binding";
          break;
        case 34972:
          id result = "Secondary Color Array Buffer Binding";
          break;
        case 34973:
          id result = "Coord Array Buffer Binding";
          break;
        case 34974:
          id result = "Weight Array Buffer Binding";
          break;
        case 34975:
          id result = "Buffer Binding";
          break;
        case 34976:
          id result = "Program Instructions";
          break;
        case 34977:
          id result = "Max Program Instructions";
          break;
        case 34978:
          id result = "Program Native Instructions";
          break;
        case 34979:
          id result = "Max Program Native Instructions";
          break;
        case 34980:
          id result = "Program Temporaries";
          break;
        case 34981:
          id result = "Max Program Temporaries";
          break;
        case 34982:
          id result = "Program Native Temporaries";
          break;
        case 34983:
          id result = "Max Program Native Temporaries";
          break;
        case 34984:
          id result = "Program Parameters";
          break;
        case 34985:
          id result = "Max Program Parameters";
          break;
        case 34986:
          id result = "Program Native Parameters";
          break;
        case 34987:
          id result = "Max Program Native Parameters";
          break;
        case 34988:
          id result = "Program Attribs";
          break;
        case 34989:
          id result = "Max Program Attribs";
          break;
        case 34990:
          id result = "Program Native Attribs";
          break;
        case 34991:
          id result = "Max Program Native Attribs";
          break;
        case 34992:
          id result = "Program Address Registers";
          break;
        case 34993:
          id result = "Max Program Address Registers";
          break;
        case 34994:
          id result = "Program Native Address Registers";
          break;
        case 34995:
          id result = "Max Program Native Address Registers";
          break;
        case 34996:
          id result = "Max Program Local Parameters";
          break;
        case 34997:
          id result = "Max Program Env Parameters";
          break;
        case 34998:
          id result = "Program Under Native Limits";
          break;
        case 34999:
          id result = "Transpose Current Matrix";
          break;
        case 35000:
          id result = "Read Only";
          break;
        case 35001:
          id result = "Write Only";
          break;
        case 35002:
          id result = "Read Write";
          break;
        case 35003:
          id result = "Access";
          break;
        case 35004:
          id result = "Mapped";
          break;
        case 35005:
          id result = "Map Pointer";
          break;
        case 35007:
          id result = "Time Elapsed";
          break;
        case 35008:
          id result = "Matrix0";
          break;
        case 35009:
          id result = "Matrix1";
          break;
        case 35010:
          id result = "Matrix2";
          break;
        case 35011:
          id result = "Matrix3";
          break;
        case 35012:
          id result = "Matrix4";
          break;
        case 35013:
          id result = "Matrix5";
          break;
        case 35014:
          id result = "Matrix6";
          break;
        case 35015:
          id result = "Matrix7";
          break;
        case 35016:
          id result = "Matrix8";
          break;
        case 35017:
          id result = "Matrix9";
          break;
        case 35018:
          id result = "Matrix10";
          break;
        case 35019:
          id result = "Matrix11";
          break;
        case 35020:
          id result = "Matrix12";
          break;
        case 35021:
          id result = "Matrix13";
          break;
        case 35022:
          id result = "Matrix14";
          break;
        case 35023:
          id result = "Matrix15";
          break;
        case 35024:
          id result = "Matrix16";
          break;
        case 35025:
          id result = "Matrix17";
          break;
        case 35026:
          id result = "Matrix18";
          break;
        case 35027:
          id result = "Matrix19";
          break;
        case 35028:
          id result = "Matrix20";
          break;
        case 35029:
          id result = "Matrix21";
          break;
        case 35030:
          id result = "Matrix22";
          break;
        case 35031:
          id result = "Matrix23";
          break;
        case 35032:
          id result = "Matrix24";
          break;
        case 35033:
          id result = "Matrix25";
          break;
        case 35034:
          id result = "Matrix26";
          break;
        case 35035:
          id result = "Matrix27";
          break;
        case 35036:
          id result = "Matrix28";
          break;
        case 35037:
          id result = "Matrix29";
          break;
        case 35038:
          id result = "Matrix30";
          break;
        case 35039:
          id result = "Matrix31";
          break;
        case 35040:
          id result = "Stream Draw";
          break;
        case 35041:
          id result = "Stream Read";
          break;
        case 35042:
          id result = "Stream Copy";
          break;
        case 35044:
          id result = "Static Draw";
          break;
        case 35045:
          id result = "Static Read";
          break;
        case 35046:
          id result = "Static Copy";
          break;
        case 35048:
          id result = "Dynamic Draw";
          break;
        case 35049:
          id result = "Dynamic Read";
          break;
        case 35050:
          id result = "Dynamic Copy";
          break;
        case 35051:
          id result = "Pixel Pack Buffer";
          break;
        case 35052:
          id result = "Pixel Unpack Buffer";
          break;
        case 35053:
          id result = "Pixel Pack Buffer Binding";
          break;
        case 35055:
          id result = "Pixel Unpack Buffer Binding";
          break;
        case 35056:
          id result = "Depth24 Stencil8";
          break;
        case 35057:
          id result = "Size";
          break;
        case 35060:
          id result = "Max Program Exec Instructions";
          break;
        case 35061:
          id result = "Max Program Call Depth";
          break;
        case 35062:
          id result = "Max Program If Depth";
          break;
        case 35063:
          id result = "Max Program Loop Depth";
          break;
        case 35064:
          id result = "Max Program Loop Count";
          break;
        case 35065:
          id result = "Src1 Color";
          break;
        case 35066:
          id result = "One Minus Src1 Color";
          break;
        case 35067:
          id result = "One Minus Src1 Alpha";
          break;
        case 35068:
          id result = "Max Dual Source Draw Buffers";
          break;
        case 35069:
          id result = "Integer";
          break;
        case 35070:
          id result = "Divisor";
          break;
        case 35071:
          id result = "Max Array Texture Layers";
          break;
        case 35076:
          id result = "Min Program Texel Offset";
          break;
        case 35077:
          id result = "Max Program Texel Offset";
          break;
        case 35088:
          id result = "Test Two Side";
          break;
        case 35089:
          id result = "Active Stencil Face";
          break;
        case 35090:
          id result = "Mirror Clamp To Border";
          break;
        case 35092:
          id result = "Samples Passed";
          break;
        case 35094:
          id result = "Geometry Vertices Out";
          break;
        case 35095:
          id result = "Geometry Input Type";
          break;
        case 35096:
          id result = "Geometry Output Type";
          break;
        case 35097:
          id result = "Sampler Binding";
          break;
        case 35098:
          id result = "Clamp Vertex Color";
          break;
        case 35099:
          id result = "Clamp Fragment Color";
          break;
        case 35100:
          id result = "Clamp Read Color";
          break;
        case 35101:
          id result = "Fixed Only";
          break;
        case 35196:
          id result = "Array Rev Comps In 4 Bytes";
          break;
        case 35210:
          id result = "Size Array Type";
          break;
        case 35211:
          id result = "Size Array Stride";
          break;
        case 35212:
          id result = "Size Array Pointer";
          break;
        case 35213:
          id result = "Modelview Matrix Float As Int Bits";
          break;
        case 35214:
          id result = "Projection Matrix Float As Int Bits";
          break;
        case 35215:
          id result = "Matrix Float As Int Bits";
          break;
        case 35328:
          id result = "Vertex Attrib Map1";
          break;
        case 35329:
          id result = "Vertex Attrib Map2";
          break;
        case 35330:
          id result = "Vertex Attrib Map1 Size";
          break;
        case 35331:
          id result = "Vertex Attrib Map1 Coeff";
          break;
        case 35332:
          id result = "Vertex Attrib Map1 Order";
          break;
        case 35333:
          id result = "Vertex Attrib Map1 Domain";
          break;
        case 35334:
          id result = "Vertex Attrib Map2 Size";
          break;
        case 35335:
          id result = "Vertex Attrib Map2 Coeff";
          break;
        case 35336:
          id result = "Vertex Attrib Map2 Order";
          break;
        case 35337:
          id result = "Vertex Attrib Map2 Domain";
          break;
        case 35338:
          id result = "Draw Pixels";
          break;
        case 35339:
          id result = "Fence";
          break;
        case 35340:
          id result = "Element Array";
          break;
        case 35341:
          id result = "Element Array Type";
          break;
        case 35342:
          id result = "Element Array Pointer";
          break;
        case 35343:
          id result = "Float";
          break;
        case 35344:
          id result = "Min Pbuffer Viewport Dims";
          break;
        case 35345:
          id result = "Uniform Buffer";
          break;
        case 35346:
          id result = "Serialized Modify";
          break;
        case 35347:
          id result = "Flushing Unmap";
          break;
        case 35348:
          id result = "Aux Depth Stencil";
          break;
        case 35349:
          id result = "Pack Row Bytes";
          break;
        case 35350:
          id result = "Unpack Row Bytes";
          break;
        case 35351:
          id result = "Pack Image Bytes";
          break;
        case 35352:
          id result = "Unpack Image Bytes";
          break;
        case 35353:
          id result = "Released";
          break;
        case 35354:
          id result = "Volatile";
          break;
        case 35355:
          id result = "Retained";
          break;
        case 35356:
          id result = "Undefined";
          break;
        case 35357:
          id result = "Purgeable";
          break;
        case 35358:
          id result = "Private Extensions";
          break;
        case 35359:
          id result = "RGB 422";
          break;
        case 35366:
          id result = "Vertex Point Size";
          break;
        case 35367:
          id result = "Current Point Size";
          break;
        case 35368:
          id result = "Uniform Buffer Binding";
          break;
        case 35369:
          id result = "Uniform Buffer Start";
          break;
        case 35370:
          id result = "Uniform Buffer Size";
          break;
        case 35371:
          id result = "Max Vertex Uniform Blocks";
          break;
        case 35372:
          id result = "Max Geometry Uniform Blocks";
          break;
        case 35373:
          id result = "Max Fragment Uniform Blocks";
          break;
        case 35374:
          id result = "Max Combined Uniform Blocks";
          break;
        case 35375:
          id result = "Max Uniform Buffer Bindings";
          break;
        case 35376:
          id result = "Max Uniform Block Size";
          break;
        case 35377:
          id result = "Max Combined Vertex Uniform Components";
          break;
        case 35378:
          id result = "Max Combined Geometry Uniform Components";
          break;
        case 35379:
          id result = "Max Combined Fragment Uniform Components";
          break;
        case 35380:
          id result = "Uniform Buffer Offset Alignment";
          break;
        case 35381:
          id result = "Active Uniform Block Max Name Length";
          break;
        case 35382:
          id result = "Active Uniform Blocks";
          break;
        case 35383:
          id result = "Uniform Type";
          break;
        case 35384:
          id result = "Uniform Size";
          break;
        case 35385:
          id result = "Uniform Name Length";
          break;
        case 35386:
          id result = "Uniform Block Index";
          break;
        case 35387:
          id result = "Uniform Offset";
          break;
        case 35388:
          id result = "Uniform Array Stride";
          break;
        case 35389:
          id result = "Uniform Matrix Stride";
          break;
        case 35390:
          id result = "Uniform Is Row Major";
          break;
        case 35391:
          id result = "Uniform Block Binding";
          break;
        case 35392:
          id result = "Uniform Block Data Size";
          break;
        case 35393:
          id result = "Uniform Block Name Length";
          break;
        case 35394:
          id result = "Uniform Block Active Uniforms";
          break;
        case 35395:
          id result = "Uniform Block Active Uniform Indices";
          break;
        case 35396:
          id result = "Uniform Block Referenced By Vertex Shader";
          break;
        case 35397:
          id result = "Uniform Block Referenced By Geometry Shader";
          break;
        case 35398:
          id result = "Uniform Block Referenced By Fragment Shader";
          break;
        case 35400:
          id result = "SRGB Decode";
          break;
        case 35401:
          id result = "Decode";
          break;
        case 35402:
          id result = "Skip Decode";
          break;
        case 35403:
          id result = "Magic Mipmap";
          break;
        case 35407:
          id result = "Program Pipeline Object";
          break;
        case 35408:
          id result = "RGB Ycbcr 422";
          break;
        case 35409:
          id result = "RGB Raw 422";
          break;
        case 35410:
          id result = "Fragment Shader Discards Samples";
          break;
        case 35411:
          id result = "Sync Object";
          break;
        case 35412:
          id result = "PVRTC SRGB2";
          break;
        case 35413:
          id result = "PVRTC SRGB4";
          break;
        case 35414:
          id result = "PVRTC SRGBA2";
          break;
        case 35415:
          id result = "PVRTC SRGBA4";
          break;
        case 35416:
          id result = "Cubic";
          break;
        case 35417:
          id result = "Cubic Mipmap Nearest";
          break;
        case 35418:
          id result = "Cubic Mipmap Linear";
          break;
        case 35419:
          id result = "Attachment Texture Target";
          break;
        case 35420:
          id result = "ASTC RGBA 4x2";
          break;
        case 35421:
          id result = "ASTC RGBA 8x4";
          break;
        case 35422:
          id result = "ASTC sRGBA 4x2";
          break;
        case 35423:
          id result = "ASTC sRGBA 8x4";
          break;
        case 35424:
          id result = "Uniform Referenced By Vertex Shader";
          break;
        case 35425:
          id result = "Uniform Referenced By Tess Control Shader";
          break;
        case 35426:
          id result = "Uniform Referenced By Tess Eval Shader";
          break;
        case 35427:
          id result = "Uniform Referenced By Geometry Shader";
          break;
        case 35428:
          id result = "Uniform Referenced By Fragment Shader";
          break;
        case 35429:
          id result = "Ycbcr8 420 2plane";
          break;
        case 35430:
          id result = "Ycbcr8 422 1plane";
          break;
        case 35431:
          id result = "Ycbcr8 422 2plane";
          break;
        case 35432:
          id result = "Ycbcr8 444 2plane";
          break;
        case 35433:
          id result = "Ycbcr10 444 1plane";
          break;
        case 35434:
          id result = "Ycbcr10 422 2plane";
          break;
        case 35435:
          id result = "Ycbcr10 420 2plane";
          break;
        case 35436:
          id result = "Ycbcr10 444 2plane";
          break;
        case 35437:
          id result = "SRGB Ycbcr8 420 2plane";
          break;
        case 35438:
          id result = "SRGB Ycbcr8 422 1plane";
          break;
        case 35439:
          id result = "SRGB Ycbcr8 422 2plane";
          break;
        case 35440:
          id result = "SRGB Ycbcr8 444 2plane";
          break;
        case 35441:
          id result = "SRGB Ycbcr10 444 1plane";
          break;
        case 35442:
          id result = "SRGB Ycbcr10 422 2plane";
          break;
        case 35443:
          id result = "SRGB Ycbcr10 420 2plane";
          break;
        case 35444:
          id result = "SRGB Ycbcr10 444 2plane";
          break;
        case 35445:
          id result = "Func Override Blend Source Color";
          break;
        case 35446:
          id result = "Argbv16 Xr10";
          break;
        case 35447:
          id result = "SRGB Argbv16 Xr10";
          break;
        case 35448:
          id result = "Sr8";
          break;
        case 35449:
          id result = "Tile Order Rot";
          break;
        case 35450:
          id result = "Tile Order Rot 0";
          break;
        case 35451:
          id result = "Tile Order Rot 90";
          break;
        case 35452:
          id result = "Tile Order Rot 180";
          break;
        case 35453:
          id result = "Tile Order Rot 270";
          break;
        case 35454:
          id result = "Vertex Storage Memory Coherent";
          break;
        case 35455:
          id result = "Storage Memory Coherent";
          break;
        case 35632:
          id result = "Fragment Shader";
          break;
        case 35633:
          id result = "Vertex Shader";
          break;
        case 35648:
          id result = "Program Object";
          break;
        case 35656:
          id result = "Shader Object";
          break;
        case 35657:
          id result = "Max Fragment Uniform Components";
          break;
        case 35658:
          id result = "Max Vertex Uniform Components";
          break;
        case 35659:
          id result = "Max Varying Components";
          break;
        case 35660:
          id result = "Max Vertex Texture Image Units";
          break;
        case 35661:
          id result = "Max Combined Texture Image Units";
          break;
        case 35662:
          id result = "Object Type";
          break;
        case 35663:
          id result = "Shader Type";
          break;
        case 35664:
          id result = "Float Vec2";
          break;
        case 35665:
          id result = "Float Vec3";
          break;
        case 35666:
          id result = "Float Vec4";
          break;
        case 35667:
          id result = "Int Vec2";
          break;
        case 35668:
          id result = "Int Vec3";
          break;
        case 35669:
          id result = "Int Vec4";
          break;
        case 35670:
          id result = "Bool";
          break;
        case 35671:
          id result = "Bool Vec2";
          break;
        case 35672:
          id result = "Bool Vec3";
          break;
        case 35673:
          id result = "Bool Vec4";
          break;
        case 35674:
          id result = "Float Mat2";
          break;
        case 35675:
          id result = "Float Mat3";
          break;
        case 35676:
          id result = "Float Mat4";
          break;
        case 35677:
          id result = "Sampler 1D";
          break;
        case 35678:
          id result = "Sampler 2D";
          break;
        case 35679:
          id result = "Sampler 3D";
          break;
        case 35680:
          id result = "Sampler Cube";
          break;
        case 35681:
          id result = "Sampler 1D Shadow";
          break;
        case 35682:
          id result = "Sampler 2D Shadow";
          break;
        case 35683:
          id result = "Sampler 2D Rect";
          break;
        case 35684:
          id result = "Sampler 2D Rect Shadow";
          break;
        case 35685:
          id result = "Float Mat2x3";
          break;
        case 35686:
          id result = "Float Mat2x4";
          break;
        case 35687:
          id result = "Float Mat3x2";
          break;
        case 35688:
          id result = "Float Mat3x4";
          break;
        case 35689:
          id result = "Float Mat4x2";
          break;
        case 35690:
          id result = "Float Mat4x3";
          break;
        case 35712:
          id result = "Delete Status";
          break;
        case 35713:
          id result = "Compile Status";
          break;
        case 35714:
          id result = "Link Status";
          break;
        case 35715:
          id result = "Validate Status";
          break;
        case 35716:
          id result = "Info Log Length";
          break;
        case 35717:
          id result = "Attached Shaders";
          break;
        case 35718:
          id result = "Active Uniforms";
          break;
        case 35719:
          id result = "Active Uniform Max Length";
          break;
        case 35720:
          id result = "Shader Source Length";
          break;
        case 35721:
          id result = "Active Attributes";
          break;
        case 35722:
          id result = "Active Attribute Max Length";
          break;
        case 35723:
          id result = "Fragment Shader Derivative Hint";
          break;
        case 35724:
          id result = "Shading Language Version";
          break;
        case 35725:
          id result = "Current Program";
          break;
        case 35728:
          id result = "Palette4 RGB8";
          break;
        case 35729:
          id result = "Palette4 RGBA8";
          break;
        case 35730:
          id result = "Palette4 R5 G6 B5";
          break;
        case 35731:
          id result = "Palette4 RGBA4";
          break;
        case 35732:
          id result = "Palette4 RGB5 A1";
          break;
        case 35733:
          id result = "Palette8 RGB8";
          break;
        case 35734:
          id result = "Palette8 RGBA8";
          break;
        case 35735:
          id result = "Palette8 R5 G6 B5";
          break;
        case 35736:
          id result = "Palette8 RGBA4";
          break;
        case 35737:
          id result = "Palette8 RGB5 A1";
          break;
        case 35738:
          id result = "Implementation Color Read Type";
          break;
        case 35739:
          id result = "Implementation Color Read Format";
          break;
        case 35740:
          id result = "Size Array";
          break;
        case 35741:
          id result = "Crop Rect";
          break;
        case 35742:
          id result = "Matrix Index Array Buffer Binding";
          break;
        case 35743:
          id result = "Size Array Buffer Binding";
          break;
        case 35840:
          id result = "PVRTC RGB4";
          break;
        case 35841:
          id result = "PVRTC RGB2";
          break;
        case 35842:
          id result = "PVRTC RGBA4";
          break;
        case 35843:
          id result = "PVRTC RGBA2";
          break;
        case 35856:
          id result = "Red Type";
          break;
        case 35857:
          id result = "Green Type";
          break;
        case 35858:
          id result = "Blue Type";
          break;
        case 35859:
          id result = "Alpha Type";
          break;
        case 35860:
          id result = "Luminance Type";
          break;
        case 35861:
          id result = "Intensity Type";
          break;
        case 35862:
          id result = "Type";
          break;
        case 35863:
          id result = "Unsigned Normalized";
          break;
        case 35864:
          id result = "1D Array";
          break;
        case 35865:
          id result = "Proxy Texture 1D Array";
          break;
        case 35866:
          id result = "2D Array";
          break;
        case 35867:
          id result = "Proxy Texture 2D Array";
          break;
        case 35868:
          id result = "Binding 1D Array";
          break;
        case 35869:
          id result = "Binding 2D Array";
          break;
        case 35881:
          id result = "Max Geometry Texture Image Units";
          break;
        case 35882:
          id result = "Buffer";
          break;
        case 35883:
          id result = "Max Texture Buffer Size";
          break;
        case 35884:
          id result = "Binding Buffer";
          break;
        case 35885:
          id result = "Data Store Binding";
          break;
        case 35887:
          id result = "Any Samples Passed";
          break;
        case 35894:
          id result = "Shading";
          break;
        case 35895:
          id result = "Min Sample Shading Value";
          break;
        case 35898:
          id result = "R11f G11f B10f";
          break;
        case 35899:
          id result = "Unsigned Int 10f 11f 11f Rev";
          break;
        case 35900:
          id result = "RGBA Signed Components";
          break;
        case 35901:
          id result = "RGB9 E5";
          break;
        case 35902:
          id result = "Unsigned Int 5 9 9 9 Rev";
          break;
        case 35903:
          id result = "Shared Size";
          break;
        case 35904:
          id result = "SRGB";
          break;
        case 35905:
          id result = "SRGB8";
          break;
        case 35906:
          id result = "SRGB Alpha";
          break;
        case 35907:
          id result = "SRGB8 Alpha8";
          break;
        case 35908:
          id result = "Sluminance Alpha";
          break;
        case 35909:
          id result = "Sluminance8 Alpha8";
          break;
        case 35910:
          id result = "Sluminance";
          break;
        case 35911:
          id result = "Sluminance8";
          break;
        case 35912:
          id result = "Compressed SRGB";
          break;
        case 35913:
          id result = "Compressed SRGB Alpha";
          break;
        case 35914:
          id result = "Compressed Sluminance";
          break;
        case 35915:
          id result = "Compressed Sluminance Alpha";
          break;
        case 35916:
          id result = "Compressed SRGB S3TC DXT1";
          break;
        case 35917:
          id result = "Compressed SRGB Alpha S3TC DXT1";
          break;
        case 35918:
          id result = "Compressed SRGB Alpha S3TC DXT3";
          break;
        case 35919:
          id result = "Compressed SRGB Alpha S3TC DXT5";
          break;
        case 35958:
          id result = "Varying Max Length";
          break;
        case 35967:
          id result = "Buffer Mode";
          break;
        case 35968:
          id result = "Max Transform Feedback Separate Components";
          break;
        case 35971:
          id result = "Varyings";
          break;
        case 35972:
          id result = "Buffer Start";
          break;
        case 35973:
          id result = "Buffer Size";
          break;
        case 35975:
          id result = "Primitives Generated";
          break;
        case 35976:
          id result = "Primitives Written";
          break;
        case 35977:
          id result = "Rasterizer Discard";
          break;
        case 35978:
          id result = "Max Transform Feedback Interleaved Components";
          break;
        case 35979:
          id result = "Max Transform Feedback Separate Attribs";
          break;
        case 35980:
          id result = "Interleaved Attribs";
          break;
        case 35981:
          id result = "Separate Attribs";
          break;
        case 35982:
          id result = "Buffer";
          break;
        case 35983:
          id result = "Buffer Binding";
          break;
        case 36000:
          id result = "Sprite Coord Origin";
          break;
        case 36001:
          id result = "Lower Left";
          break;
        case 36002:
          id result = "Upper Left";
          break;
        case 36003:
          id result = "Back Ref";
          break;
        case 36004:
          id result = "Back Value Mask";
          break;
        case 36005:
          id result = "Back Writemask";
          break;
        case 36006:
          id result = "Binding";
          break;
        case 36007:
          id result = "Binding";
          break;
        case 36008:
          id result = "Read Framebuffer";
          break;
        case 36009:
          id result = "Draw Framebuffer";
          break;
        case 36010:
          id result = "Read Framebuffer Binding";
          break;
        case 36011:
          id result = "Samples";
          break;
        case 36012:
          id result = "Depth Component32f";
          break;
        case 36013:
          id result = "Depth32f Stencil8";
          break;
        case 36048:
          id result = "Attachment Object Type";
          break;
        case 36049:
          id result = "Attachment Object Name";
          break;
        case 36050:
          id result = "Attachment Texture Level";
          break;
        case 36051:
          id result = "Attachment Texture Cube Map Face";
          break;
        case 36052:
          id result = "Attachment Texture Layer";
          break;
        case 36053:
          id result = "Complete";
          break;
        case 36054:
          id result = "Incomplete Attachment";
          break;
        case 36055:
          id result = "Incomplete Missing Attachment";
          break;
        case 36057:
          id result = "Incomplete Dimensions";
          break;
        case 36058:
          id result = "Incomplete Formats";
          break;
        case 36059:
          id result = "Incomplete Draw Buffer";
          break;
        case 36060:
          id result = "Incomplete Read Buffer";
          break;
        case 36061:
          id result = "Unsupported";
          break;
        case 36063:
          id result = "Max Color Attachments";
          break;
        case 36064:
          id result = "Color Attachment 0";
          break;
        case 36065:
          id result = "Color Attachment 1";
          break;
        case 36066:
          id result = "Color Attachment 2";
          break;
        case 36067:
          id result = "Color Attachment 3";
          break;
        case 36068:
          id result = "Color Attachment 4";
          break;
        case 36069:
          id result = "Color Attachment 5";
          break;
        case 36070:
          id result = "Color Attachment 6";
          break;
        case 36071:
          id result = "Color Attachment 7";
          break;
        case 36072:
          id result = "Color Attachment 8";
          break;
        case 36073:
          id result = "Color Attachment 9";
          break;
        case 36074:
          id result = "Color Attachment 10";
          break;
        case 36075:
          id result = "Color Attachment 11";
          break;
        case 36076:
          id result = "Color Attachment 12";
          break;
        case 36077:
          id result = "Color Attachment 13";
          break;
        case 36078:
          id result = "Color Attachment 14";
          break;
        case 36079:
          id result = "Color Attachment 15";
          break;
        case 36096:
          id result = "Depth Attachment";
          break;
        case 36128:
          id result = "Stencil Attachment";
          break;
        case 36160:
          id result = "Framebuffer";
          break;
        case 36161:
          id result = "Renderbuffer";
          break;
        case 36162:
          id result = "Width";
          break;
        case 36163:
          id result = "Height";
          break;
        case 36164:
          id result = "Internal Format";
          break;
        case 36166:
          id result = "Stencil Index1";
          break;
        case 36167:
          id result = "Stencil Index4";
          break;
        case 36168:
          id result = "Stencil Index8";
          break;
        case 36169:
          id result = "Stencil Index16";
          break;
        case 36176:
          id result = "Red Size";
          break;
        case 36177:
          id result = "Green Size";
          break;
        case 36178:
          id result = "Blue Size";
          break;
        case 36179:
          id result = "Alpha Size";
          break;
        case 36180:
          id result = "Size";
          break;
        case 36181:
          id result = "Size";
          break;
        case 36182:
          id result = "Incomplete Multisample";
          break;
        case 36183:
          id result = "Max Samples";
          break;
        case 36193:
          id result = "Half Float";
          break;
        case 36194:
          id result = "RGB565";
          break;
        case 36201:
          id result = "Primitive Restart Fixed Index";
          break;
        case 36202:
          id result = "Any Samples Passed Conservative";
          break;
        case 36203:
          id result = "Max Element Index";
          break;
        case 36208:
          id result = "RGBA32ui";
          break;
        case 36209:
          id result = "RGB32ui";
          break;
        case 36210:
          id result = "Alpha32ui";
          break;
        case 36211:
          id result = "Intensity32ui";
          break;
        case 36212:
          id result = "Luminance32ui";
          break;
        case 36213:
          id result = "Luminance Alpha32ui";
          break;
        case 36214:
          id result = "RGBA16ui";
          break;
        case 36215:
          id result = "RGB16ui";
          break;
        case 36216:
          id result = "Alpha16ui";
          break;
        case 36217:
          id result = "Intensity16ui";
          break;
        case 36218:
          id result = "Luminance16ui";
          break;
        case 36219:
          id result = "Luminance Alpha16ui";
          break;
        case 36220:
          id result = "RGBA8ui";
          break;
        case 36221:
          id result = "RGB8ui";
          break;
        case 36222:
          id result = "Alpha8ui";
          break;
        case 36223:
          id result = "Intensity8ui";
          break;
        case 36224:
          id result = "Luminance8ui";
          break;
        case 36225:
          id result = "Luminance Alpha8ui";
          break;
        case 36226:
          id result = "RGBA32i";
          break;
        case 36227:
          id result = "RGB32i";
          break;
        case 36228:
          id result = "Alpha32i";
          break;
        case 36229:
          id result = "Intensity32i";
          break;
        case 36230:
          id result = "Luminance32i";
          break;
        case 36231:
          id result = "Luminance Alpha32i";
          break;
        case 36232:
          id result = "RGBA16i";
          break;
        case 36233:
          id result = "RGB16i";
          break;
        case 36234:
          id result = "Alpha16i";
          break;
        case 36235:
          id result = "Intensity16i";
          break;
        case 36236:
          id result = "Luminance16i";
          break;
        case 36237:
          id result = "Luminance Alpha16i";
          break;
        case 36238:
          id result = "RGBA8i";
          break;
        case 36239:
          id result = "RGB8i";
          break;
        case 36240:
          id result = "Alpha8i";
          break;
        case 36241:
          id result = "Intensity8i";
          break;
        case 36242:
          id result = "Luminance8i";
          break;
        case 36243:
          id result = "Luminance Alpha8i";
          break;
        case 36244:
          id result = "Red Integer";
          break;
        case 36245:
          id result = "Green Integer";
          break;
        case 36246:
          id result = "Blue Integer";
          break;
        case 36247:
          id result = "Alpha Integer";
          break;
        case 36248:
          id result = "RGB Integer";
          break;
        case 36249:
          id result = "RGBA Integer";
          break;
        case 36250:
          id result = "BGR Integer";
          break;
        case 36251:
          id result = "BGRA Integer";
          break;
        case 36252:
          id result = "Luminance Integer";
          break;
        case 36253:
          id result = "Luminance Alpha Integer";
          break;
        case 36254:
          id result = "RGBA Integer Mode";
          break;
        case 36255:
          id result = "Int 2 10 10 10 Rev";
          break;
        case 36263:
          id result = "Attachment Layered";
          break;
        case 36264:
          id result = "Incomplete Layer Targets";
          break;
        case 36265:
          id result = "Incomplete Layer Count";
          break;
        case 36269:
          id result = "Float 32 Unsigned Int 24 8 Rev";
          break;
        case 36270:
          id result = "Shader Include";
          break;
        case 36281:
          id result = "SRGB";
          break;
        case 36282:
          id result = "SRGB Capable";
          break;
        case 36283:
          id result = "Compressed Red RGTC1";
          break;
        case 36284:
          id result = "Compressed Signed Red RGTC1";
          break;
        case 36285:
          id result = "Compressed RG RGTC2";
          break;
        case 36286:
          id result = "Compressed Signed RG RGTC2";
          break;
        case 36288:
          id result = "Sampler 1D Array";
          break;
        case 36289:
          id result = "Sampler 2D Array";
          break;
        case 36290:
          id result = "Sampler Buffer";
          break;
        case 36291:
          id result = "Sampler 1D Array Shadow";
          break;
        case 36292:
          id result = "Sampler 2D Array Shadow";
          break;
        case 36293:
          id result = "Sampler Cube Shadow";
          break;
        case 36294:
          id result = "Unsigned Int Vec2";
          break;
        case 36295:
          id result = "Unsigned Int Vec3";
          break;
        case 36296:
          id result = "Unsigned Int Vec4";
          break;
        case 36297:
          id result = "Int Sampler 1D";
          break;
        case 36298:
          id result = "Int Sampler 2D";
          break;
        case 36299:
          id result = "Int Sampler 3D";
          break;
        case 36300:
          id result = "Int Sampler Cube";
          break;
        case 36301:
          id result = "Int Sampler 2D Rect";
          break;
        case 36302:
          id result = "Int Sampler 1D Array";
          break;
        case 36303:
          id result = "Int Sampler 2D Array";
          break;
        case 36304:
          id result = "Int Sampler Buffer";
          break;
        case 36305:
          id result = "Unsigned Int Sampler 1D";
          break;
        case 36306:
          id result = "Unsigned Int Sampler 2D";
          break;
        case 36307:
          id result = "Unsigned Int Sampler 3D";
          break;
        case 36308:
          id result = "Unsigned Int Sampler Cube";
          break;
        case 36309:
          id result = "Unsigned Int Sampler 2D Rect";
          break;
        case 36310:
          id result = "Unsigned Int Sampler 1D Array";
          break;
        case 36311:
          id result = "Unsigned Int Sampler 2D Array";
          break;
        case 36312:
          id result = "Unsigned Int Sampler Buffer";
          break;
        case 36313:
          id result = "Geometry Shader";
          break;
        case 36314:
          id result = "Geometry Vertices Out";
          break;
        case 36315:
          id result = "Geometry Input Type";
          break;
        case 36316:
          id result = "Geometry Output Type";
          break;
        case 36317:
          id result = "Max Geometry Varying Components";
          break;
        case 36318:
          id result = "Max Vertex Varying Components";
          break;
        case 36319:
          id result = "Max Geometry Uniform Components";
          break;
        case 36320:
          id result = "Max Geometry Output Vertices";
          break;
        case 36321:
          id result = "Max Geometry Total Output Components";
          break;
        case 36322:
          id result = "Max Vertex Bindable Uniforms";
          break;
        case 36323:
          id result = "Max Fragment Bindable Uniforms";
          break;
        case 36324:
          id result = "Max Geometry Bindable Uniforms";
          break;
        case 36325:
          id result = "Active Subroutines";
          break;
        case 36326:
          id result = "Active Subroutine Uniforms";
          break;
        case 36327:
          id result = "Max Subroutines";
          break;
        case 36328:
          id result = "Max Subroutine Uniform Locations";
          break;
        case 36329:
          id result = "Named String Length";
          break;
        case 36330:
          id result = "Named String Type";
          break;
        case 36333:
          id result = "Max Bindable Uniform Size";
          break;
        case 36334:
          id result = "Uniform Buffer";
          break;
        case 36335:
          id result = "Uniform Buffer Binding";
          break;
        case 36336:
          id result = "Low Float";
          break;
        case 36337:
          id result = "Medium Float";
          break;
        case 36338:
          id result = "High Float";
          break;
        case 36339:
          id result = "Low Int";
          break;
        case 36340:
          id result = "Medium Int";
          break;
        case 36341:
          id result = "High Int";
          break;
        case 36344:
          id result = "Shader Binary Formats";
          break;
        case 36345:
          id result = "Num Shader Binary Formats";
          break;
        case 36346:
          id result = "Shader Compiler";
          break;
        case 36347:
          id result = "Max Vertex Uniform Vectors";
          break;
        case 36348:
          id result = "Max Varying Vectors";
          break;
        case 36349:
          id result = "Max Fragment Uniform Vectors";
          break;
        case 36371:
          id result = "Query Wait";
          break;
        case 36372:
          id result = "Query No Wait";
          break;
        case 36373:
          id result = "Query By Region Wait";
          break;
        case 36374:
          id result = "Query By Region No Wait";
          break;
        case 36382:
          id result = "Max Combined Tess Control Uniform Components";
          break;
        case 36383:
          id result = "Max Combined Tess Evaluation Uniform Components";
          break;
        case 36386:
          id result = "Transform Feedback";
          break;
        case 36387:
          id result = "Paused";
          break;
        case 36388:
          id result = "Active";
          break;
        case 36389:
          id result = "Binding";
          break;
        case 36392:
          id result = "Timestamp";
          break;
        case 36418:
          id result = "Swizzle R";
          break;
        case 36419:
          id result = "Swizzle G";
          break;
        case 36420:
          id result = "Swizzle B";
          break;
        case 36421:
          id result = "Swizzle A";
          break;
        case 36422:
          id result = "Swizzle RGBA";
          break;
        case 36423:
          id result = "Active Subroutine Uniform Locations";
          break;
        case 36424:
          id result = "Active Subroutine Max Length";
          break;
        case 36425:
          id result = "Active Subroutine Uniform Max Length";
          break;
        case 36426:
          id result = "Num Compatible Subroutines";
          break;
        case 36427:
          id result = "Compatible Subroutines";
          break;
        case 36428:
          id result = "Quads Follow Provoking Vertex Convention";
          break;
        case 36429:
          id result = "First Vertex Convention";
          break;
        case 36430:
          id result = "Last Vertex Convention";
          break;
        case 36431:
          id result = "Provoking Vertex";
          break;
        case 36432:
          id result = "Position";
          break;
        case 36433:
          id result = "Mask";
          break;
        case 36434:
          id result = "Mask Value";
          break;
        case 36441:
          id result = "Max Sample Mask Words";
          break;
        case 36442:
          id result = "Max Geometry Shader Invocations";
          break;
        case 36443:
          id result = "Min Fragment Interpolation Offset";
          break;
        case 36444:
          id result = "Max Fragment Interpolation Offset";
          break;
        case 36445:
          id result = "Fragment Interpolation Offset Bits";
          break;
        case 36446:
          id result = "Min Program Texture Gather Offset";
          break;
        case 36447:
          id result = "Max Program Texture Gather Offset";
          break;
        case 36464:
          id result = "Max Transform Feedback Buffers";
          break;
        case 36465:
          id result = "Max Vertex Streams";
          break;
        case 36466:
          id result = "Patch Vertices";
          break;
        case 36467:
          id result = "Patch Default Inner Level";
          break;
        case 36468:
          id result = "Patch Default Outer Level";
          break;
        case 36469:
          id result = "Tess Control Output Vertices";
          break;
        case 36470:
          id result = "Tess Gen Mode";
          break;
        case 36471:
          id result = "Tess Gen Spacing";
          break;
        case 36472:
          id result = "Tess Gen Vertex Order";
          break;
        case 36473:
          id result = "Tess Gen Point Mode";
          break;
        case 36474:
          id result = "Isolines";
          break;
        case 36475:
          id result = "Fractional Odd";
          break;
        case 36476:
          id result = "Fractional Even";
          break;
        case 36477:
          id result = "Max Patch Vertices";
          break;
        case 36478:
          id result = "Max Tess Gen Level";
          break;
        case 36479:
          id result = "Max Tess Control Uniform Components";
          break;
        case 36480:
          id result = "Max Tess Evaluation Uniform Components";
          break;
        case 36481:
          id result = "Max Tess Control Texture Image Units";
          break;
        case 36482:
          id result = "Max Tess Evaluation Texture Image Units";
          break;
        case 36483:
          id result = "Max Tess Control Output Components";
          break;
        case 36484:
          id result = "Max Tess Patch Components";
          break;
        case 36485:
          id result = "Max Tess Control Total Output Components";
          break;
        case 36486:
          id result = "Max Tess Evaluation Output Components";
          break;
        case 36487:
          id result = "Tess Evaluation Shader";
          break;
        case 36488:
          id result = "Tess Control Shader";
          break;
        case 36489:
          id result = "Max Tess Control Uniform Blocks";
          break;
        case 36490:
          id result = "Max Tess Evaluation Uniform Blocks";
          break;
        case 36662:
          id result = "Copy Read Buffer";
          break;
        case 36663:
          id result = "Copy Write Buffer";
          break;
        case 36671:
          id result = "Draw Indirect Buffer";
          break;
        case 36675:
          id result = "Draw Indirect Buffer Binding";
          break;
        case 36678:
          id result = "Double Mat2";
          break;
        case 36679:
          id result = "Double Mat3";
          break;
        case 36680:
          id result = "Double Mat4";
          break;
        case 36681:
          id result = "Double Mat2x3";
          break;
        case 36682:
          id result = "Double Mat2x4";
          break;
        case 36683:
          id result = "Double Mat3x2";
          break;
        case 36684:
          id result = "Double Mat3x4";
          break;
        case 36685:
          id result = "Double Mat4x2";
          break;
        case 36686:
          id result = "Double Mat4x3";
          break;
        case 36756:
          id result = "R8 Snorm";
          break;
        case 36757:
          id result = "RG8 Snorm";
          break;
        case 36758:
          id result = "RGB8 Snorm";
          break;
        case 36759:
          id result = "RGBA8 Snorm";
          break;
        case 36760:
          id result = "R16 Snorm";
          break;
        case 36761:
          id result = "RG16 Snorm";
          break;
        case 36762:
          id result = "RGB16 Snorm";
          break;
        case 36763:
          id result = "RGBA16 Snorm";
          break;
        case 36764:
          id result = "Signed Normalized";
          break;
        case 36765:
          id result = "Primitive Restart";
          break;
        case 36766:
          id result = "Primitive Restart Index";
          break;
        case 36767:
          id result = "Max Program Texture Gather Components";
          break;
        case 36860:
          id result = "Double Vec2";
          break;
        case 36861:
          id result = "Double Vec3";
          break;
        case 36862:
          id result = "Double Vec4";
          break;
        case 36873:
          id result = "Cube Map Array";
          break;
        case 36874:
          id result = "Binding Cube Map Array";
          break;
        case 36875:
          id result = "Proxy Texture Cube Map Array";
          break;
        case 36876:
          id result = "Sampler Cube Map Array";
          break;
        case 36877:
          id result = "Sampler Cube Map Array Shadow";
          break;
        case 36878:
          id result = "Int Sampler Cube Map Array";
          break;
        case 36879:
          id result = "Unsigned Int Sampler Cube Map Array";
          break;
        case 36975:
          id result = "RGB10 A2ui";
          break;
        case 37050:
          id result = "Scaled Resolve Fastest";
          break;
        case 37051:
          id result = "Scaled Resolve Nicest";
          break;
        case 37120:
          id result = "2D Multisample";
          break;
        case 37121:
          id result = "Proxy Texture 2D Multisample";
          break;
        case 37122:
          id result = "2D Multisample Array";
          break;
        case 37123:
          id result = "Proxy Texture 2D Multisample Array";
          break;
        case 37124:
          id result = "Binding 2D Multisample";
          break;
        case 37125:
          id result = "Binding 2D Multisample Array";
          break;
        case 37126:
          id result = "Samples";
          break;
        case 37127:
          id result = "Fixed Sample Locations";
          break;
        case 37128:
          id result = "Sampler 2D Multisample";
          break;
        case 37129:
          id result = "Int Sampler 2D Multisample";
          break;
        case 37130:
          id result = "Unsigned Int Sampler 2D Multisample";
          break;
        case 37131:
          id result = "Sampler 2D Multisample Array";
          break;
        case 37132:
          id result = "Int Sampler 2D Multisample Array";
          break;
        case 37133:
          id result = "Unsigned Int Sampler 2D Multisample Array";
          break;
        case 37134:
          id result = "Max Color Texture Samples";
          break;
        case 37135:
          id result = "Max Depth Texture Samples";
          break;
        case 37136:
          id result = "Max Integer Samples";
          break;
        case 37137:
          id result = "Max Server Wait Timeout";
          break;
        case 37138:
          id result = "Object Type";
          break;
        case 37139:
          id result = "Sync Condition";
          break;
        case 37140:
          id result = "Sync Status";
          break;
        case 37141:
          id result = "Sync Flags";
          break;
        case 37142:
          id result = "Sync Fence";
          break;
        case 37143:
          id result = "Sync Gpu Commands Complete";
          break;
        case 37144:
          id result = "Unsignaled";
          break;
        case 37145:
          id result = "Signaled";
          break;
        case 37146:
          id result = "Already Signaled";
          break;
        case 37147:
          id result = "Timeout Expired";
          break;
        case 37148:
          id result = "Condition Satisfied";
          break;
        case 37149:
          id result = "Wait Failed";
          break;
        case 37151:
          id result = "Access Flags";
          break;
        case 37152:
          id result = "Map Length";
          break;
        case 37153:
          id result = "Map Offset";
          break;
        case 37154:
          id result = "Max Vertex Output Components";
          break;
        case 37155:
          id result = "Max Geometry Input Components";
          break;
        case 37156:
          id result = "Max Geometry Output Components";
          break;
        case 37157:
          id result = "Max Fragment Input Components";
          break;
        case 37158:
          id result = "Context Profile Mask";
          break;
        case 37167:
          id result = "Immutable Format";
          break;
        case 37201:
          id result = "Object";
          break;
        case 37203:
          id result = "Query Object";
          break;
        case 37204:
          id result = "Vertex Array Object";
          break;
        case 37488:
          id result = "EAC R11ui";
          break;
        case 37489:
          id result = "EAC R11i";
          break;
        case 37490:
          id result = "EAC RG11ui";
          break;
        case 37491:
          id result = "EAC RG11i";
          break;
        case 37492:
          id result = "ETC2 RGB";
          break;
        case 37493:
          id result = "ETC2 SRGB";
          break;
        case 37494:
          id result = "ETC2 RGB A1";
          break;
        case 37495:
          id result = "ETC2 SRGB A1";
          break;
        case 37496:
          id result = "ETC2 RGBA";
          break;
        case 37497:
          id result = "ETC2 SRGBA";
          break;
        case 37760:
          id result = "Num Sample Counts";
          break;
        case 37793:
          id result = "BGRA8";
          break;
        case 37808:
          id result = "ASTC RGBA 4x4";
          break;
        case 37809:
          id result = "ASTC RGBA 5x4";
          break;
        case 37810:
          id result = "ASTC RGBA 5x5";
          break;
        case 37811:
          id result = "ASTC RGBA 6x5";
          break;
        case 37812:
          id result = "ASTC RGBA 6x6";
          break;
        case 37813:
          id result = "ASTC RGBA 8x5";
          break;
        case 37814:
          id result = "ASTC RGBA 8x6";
          break;
        case 37815:
          id result = "ASTC RGBA 8x8";
          break;
        case 37816:
          id result = "ASTC RGBA 10x5";
          break;
        case 37817:
          id result = "ASTC RGBA 10x6";
          break;
        case 37818:
          id result = "ASTC RGBA 10x8";
          break;
        case 37819:
          id result = "ASTC RGBA 10x10";
          break;
        case 37820:
          id result = "ASTC RGBA 12x10";
          break;
        case 37821:
          id result = "ASTC RGBA 12x12";
          break;
        case 37840:
          id result = "ASTC sRGBA 4x4";
          break;
        case 37841:
          id result = "ASTC sRGBA 5x4";
          break;
        case 37842:
          id result = "ASTC sRGBA 5x5";
          break;
        case 37843:
          id result = "ASTC sRGBA 6x5";
          break;
        case 37844:
          id result = "ASTC sRGBA 6x6";
          break;
        case 37845:
          id result = "ASTC sRGBA 8x5";
          break;
        case 37846:
          id result = "ASTC sRGBA 8x6";
          break;
        case 37847:
          id result = "ASTC sRGBA 8x8";
          break;
        case 37848:
          id result = "ASTC sRGBA 10x5";
          break;
        case 37849:
          id result = "ASTC sRGBA 10x6";
          break;
        case 37850:
          id result = "ASTC sRGBA 10x8";
          break;
        case 37851:
          id result = "ASTC sRGBA 10x10";
          break;
        case 37852:
          id result = "ASTC sRGBA 12x10";
          break;
        case 37853:
          id result = "ASTC sRGBA 12x12";
          break;
        case 37874:
          id result = "Xrsrgb10";
          break;
        case 37875:
          id result = "Ycbcr10 422 2plane Packed";
          break;
        case 37876:
          id result = "Ycbcr10 420 2plane Packed";
          break;
        case 37877:
          id result = "Ycbcr10 444 2plane Packed";
          break;
        case 37878:
          id result = "SRGB Ycbcr10 422 2plane Packed";
          break;
        case 37879:
          id result = "SRGB Ycbcr10 420 2plane Packed";
          break;
        case 37880:
          id result = "SRGB Ycbcr10 444 2plane Packed";
          break;
        case 37881:
          id result = "Xrsrgb10 Plane A8 Plane";
          break;
        case 37882:
          id result = "Unsigned Int 2 10 10 10 Plane Unsigned Byte Plane";
          break;
        case 37883:
          id result = "RGB8 420 2plane";
          break;
        case 37884:
          id result = "RGB8 422 2plane";
          break;
        case 37885:
          id result = "RGB8 444 2plane";
          break;
        case 37886:
          id result = "ASTC RGBA 4x2 LowPrecision";
          break;
        case 37887:
          id result = "ASTC RGBA 4x4 LowPrecision";
          break;
        case 37888:
          id result = "ASTC RGBA 5x4 LowPrecision";
          break;
        case 37889:
          id result = "ASTC RGBA 5x5 LowPrecision";
          break;
        case 37890:
          id result = "ASTC RGBA 6x5 LowPrecision";
          break;
        case 37891:
          id result = "ASTC RGBA 6x6 LowPrecision";
          break;
        case 37892:
          id result = "ASTC RGBA 8x4 LowPrecision";
          break;
        case 37893:
          id result = "ASTC RGBA 8x5 LowPrecision";
          break;
        case 37894:
          id result = "ASTC RGBA 8x6 LowPrecision";
          break;
        case 37895:
          id result = "ASTC RGBA 8x8 LowPrecision";
          break;
        case 37896:
          id result = "ASTC RGBA 10x5 LowPrecision";
          break;
        case 37897:
          id result = "ASTC RGBA 10x6 LowPrecision";
          break;
        case 37898:
          id result = "ASTC RGBA 10x8 LowPrecision";
          break;
        case 37899:
          id result = "ASTC RGBA 10x10 LowPrecision";
          break;
        case 37900:
          id result = "ASTC RGBA 12x10 LowPrecision";
          break;
        case 37901:
          id result = "ASTC RGBA 12x12 LowPrecision";
          break;
        default:
          return 0;
      }
      return result;
    }
    if (a1 < 0x80000)
    {
      if (a1 == 0x10000) {
        return "Eval Bit";
      }
      if (a1 == 0x20000) {
        return "List Bit";
      }
      if (a1 != 0x40000) {
        return 0;
      }
      return "Bit";
    }
    switch(a1)
    {
      case 0x80000:
        return "Bit";
      case 0xFFFFF:
        return "All Attrib Bits";
      case 0x20000000:
        return "Multisample Bit";
    }
    return 0;
  }
  if (a1 > 4095)
  {
    if (a1 <= 7167)
    {
      if (a1 > 5631)
      {
        if (a1 <= 6399)
        {
          if (a1 > 5888)
          {
            if (a1 <= 6143)
            {
              if (a1 == 5889) {
                return "Projection";
              }
              if (a1 == 5890) {
                return "Texture";
              }
            }
            else
            {
              switch(a1)
              {
                case 6144:
                  return "Color";
                case 6145:
                  return "Depth";
                case 6146:
                  return "Stencil";
              }
            }
            return 0;
          }
          switch(a1)
          {
            case 5632:
              id result = "Emission";
              break;
            case 5633:
              id result = "Shininess";
              break;
            case 5634:
              id result = "Ambient And Diffuse";
              break;
            case 5635:
              id result = "Indexes";
              break;
            default:
              if (a1 != 5888) {
                return 0;
              }
              id result = "Modelview";
              break;
          }
        }
        else
        {
          if (a1 > 6655)
          {
            if (a1 > 6912)
            {
              if (a1 == 6913) {
                return "Line";
              }
              if (a1 == 6914) {
                return "Fill";
              }
            }
            else
            {
              if (a1 == 6656) {
                return "Bitmap";
              }
              if (a1 == 6912) {
                return "Point";
              }
            }
            return 0;
          }
          switch(a1)
          {
            case 6400:
              id result = "Index";
              break;
            case 6401:
              id result = "Stencil Index";
              break;
            case 6402:
              id result = "Depth Component";
              break;
            case 6403:
              id result = "Red";
              break;
            case 6404:
              id result = "Green";
              break;
            case 6405:
              id result = "Blue";
              break;
            case 6406:
              id result = "Alpha";
              break;
            case 6407:
              id result = "RGB";
              break;
            case 6408:
              id result = "RGBA";
              break;
            case 6409:
              id result = "Luminance";
              break;
            case 6410:
              id result = "Luminance Alpha";
              break;
            default:
              return 0;
          }
        }
      }
      else if (a1 <= 4863)
      {
        if (a1 <= 4353)
        {
          switch(a1)
          {
            case 4096:
              return "Width";
            case 4097:
              return "Height";
            case 4098:
              return 0;
            case 4099:
              return "Internal Format";
            case 4100:
              return "Border Color";
            case 4101:
              return "Border";
            default:
              if (a1 == 4352)
              {
                id result = "Dont Care";
              }
              else
              {
                if (a1 != 4353) {
                  return 0;
                }
                id result = "Fastest";
              }
              break;
          }
        }
        else
        {
          switch(a1)
          {
            case 4608:
              id result = "Ambient";
              break;
            case 4609:
              id result = "Diffuse";
              break;
            case 4610:
              id result = "Specular";
              break;
            case 4611:
              id result = "Position";
              break;
            case 4612:
              id result = "Spot Direction";
              break;
            case 4613:
              id result = "Spot Exponent";
              break;
            case 4614:
              id result = "Spot Cutoff";
              break;
            case 4615:
              id result = "Constant Attenuation";
              break;
            case 4616:
              id result = "Linear Attenuation";
              break;
            case 4617:
              id result = "Quadratic Attenuation";
              break;
            default:
              if (a1 != 4354) {
                return 0;
              }
              id result = "Nicest";
              break;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 5120:
            return "Byte";
          case 5121:
            return "Unsigned Byte";
          case 5122:
            return "Short";
          case 5123:
            return "Unsigned Short";
          case 5124:
            return "Int";
          case 5125:
            return "Unsigned Int";
          case 5126:
            return "Float";
          case 5127:
            return "2 Bytes";
          case 5128:
            return "3 Bytes";
          case 5129:
            return "4 Bytes";
          case 5130:
            return "Double";
          case 5131:
            return "Half Float";
          case 5132:
            return "Fixed";
          case 5133:
          case 5134:
          case 5135:
          case 5136:
          case 5137:
          case 5138:
          case 5139:
          case 5140:
          case 5141:
          case 5142:
          case 5143:
          case 5144:
          case 5145:
          case 5146:
          case 5147:
          case 5148:
          case 5149:
          case 5150:
          case 5151:
          case 5152:
          case 5153:
          case 5154:
          case 5155:
          case 5156:
          case 5157:
          case 5158:
          case 5159:
          case 5160:
          case 5161:
          case 5162:
          case 5163:
          case 5164:
          case 5165:
          case 5166:
          case 5167:
          case 5168:
          case 5169:
          case 5170:
          case 5171:
          case 5172:
          case 5173:
          case 5174:
          case 5175:
          case 5176:
          case 5177:
          case 5178:
          case 5179:
          case 5180:
          case 5181:
          case 5182:
          case 5183:
          case 5184:
          case 5185:
          case 5186:
          case 5187:
          case 5188:
          case 5189:
          case 5190:
          case 5191:
          case 5192:
          case 5193:
          case 5194:
          case 5195:
          case 5196:
          case 5197:
          case 5198:
          case 5199:
          case 5200:
          case 5201:
          case 5202:
          case 5203:
          case 5204:
          case 5205:
          case 5206:
          case 5207:
          case 5208:
          case 5209:
          case 5210:
          case 5211:
          case 5212:
          case 5213:
          case 5214:
          case 5215:
          case 5216:
          case 5217:
          case 5218:
          case 5219:
          case 5220:
          case 5221:
          case 5222:
          case 5223:
          case 5224:
          case 5225:
          case 5226:
          case 5227:
          case 5228:
          case 5229:
          case 5230:
          case 5231:
          case 5232:
          case 5233:
          case 5234:
          case 5235:
          case 5236:
          case 5237:
          case 5238:
          case 5239:
          case 5240:
          case 5241:
          case 5242:
          case 5243:
          case 5244:
          case 5245:
          case 5246:
          case 5247:
          case 5248:
          case 5249:
          case 5250:
          case 5251:
          case 5252:
          case 5253:
          case 5254:
          case 5255:
          case 5256:
          case 5257:
          case 5258:
          case 5259:
          case 5260:
          case 5261:
          case 5262:
          case 5263:
          case 5264:
          case 5265:
          case 5266:
          case 5267:
          case 5268:
          case 5269:
          case 5270:
          case 5271:
          case 5272:
          case 5273:
          case 5274:
          case 5275:
          case 5276:
          case 5277:
          case 5278:
          case 5279:
          case 5280:
          case 5281:
          case 5282:
          case 5283:
          case 5284:
          case 5285:
          case 5286:
          case 5287:
          case 5288:
          case 5289:
          case 5290:
          case 5291:
          case 5292:
          case 5293:
          case 5294:
          case 5295:
          case 5296:
          case 5297:
          case 5298:
          case 5299:
          case 5300:
          case 5301:
          case 5302:
          case 5303:
          case 5304:
          case 5305:
          case 5306:
          case 5307:
          case 5308:
          case 5309:
          case 5310:
          case 5311:
          case 5312:
          case 5313:
          case 5314:
          case 5315:
          case 5316:
          case 5317:
          case 5318:
          case 5319:
          case 5320:
          case 5321:
          case 5322:
          case 5323:
          case 5324:
          case 5325:
          case 5326:
          case 5327:
          case 5328:
          case 5329:
          case 5330:
          case 5331:
          case 5332:
          case 5333:
          case 5334:
          case 5335:
          case 5336:
          case 5337:
          case 5338:
          case 5339:
          case 5340:
          case 5341:
          case 5342:
          case 5343:
          case 5344:
          case 5345:
          case 5346:
          case 5347:
          case 5348:
          case 5349:
          case 5350:
          case 5351:
          case 5352:
          case 5353:
          case 5354:
          case 5355:
          case 5356:
          case 5357:
          case 5358:
          case 5359:
          case 5360:
          case 5361:
          case 5362:
          case 5363:
          case 5364:
          case 5365:
          case 5366:
          case 5367:
          case 5368:
          case 5369:
          case 5370:
          case 5371:
          case 5372:
          case 5373:
          case 5374:
          case 5375:
            return 0;
          case 5376:
            return "Clear";
          case 5377:
            return "And";
          case 5378:
            return "And Reverse";
          case 5379:
            return "Copy";
          case 5380:
            return "And Inverted";
          case 5381:
            return "Noop";
          case 5382:
            return "Xor";
          case 5383:
            return "Or";
          case 5384:
            return "Nor";
          case 5385:
            return "Equiv";
          case 5386:
            return "Invert";
          case 5387:
            return "Or Reverse";
          case 5388:
            return "Copy Inverted";
          case 5389:
            return "Or Inverted";
          case 5390:
            return "Nand";
          case 5391:
            return "Set";
          default:
            if (a1 == 4864)
            {
              id result = "Compile";
            }
            else
            {
              if (a1 != 4865) {
                return 0;
              }
              id result = "Compile And Execute";
            }
            break;
        }
      }
    }
    else if (a1 > 10494)
    {
      if (a1 <= 10751)
      {
        switch(a1)
        {
          case 10495:
            return "Subimage Sync";
          case 10496:
            return "Clamp";
          case 10497:
            return "Repeat";
        }
        return 0;
      }
      switch(a1)
      {
        case 10752:
          id result = "Units";
          break;
        case 10753:
          id result = "Point";
          break;
        case 10754:
          id result = "Line";
          break;
        case 10755:
        case 10756:
        case 10757:
        case 10758:
        case 10759:
        case 10760:
        case 10761:
        case 10762:
        case 10763:
        case 10764:
        case 10765:
        case 10766:
        case 10767:
        case 10769:
        case 10770:
        case 10771:
        case 10772:
        case 10773:
        case 10774:
        case 10775:
        case 10776:
        case 10777:
        case 10778:
        case 10779:
        case 10780:
        case 10781:
        case 10782:
        case 10783:
          return 0;
        case 10768:
          id result = "R3 G3 B2";
          break;
        case 10784:
          id result = "V2f";
          break;
        case 10785:
          id result = "V3f";
          break;
        case 10786:
          id result = "C4ub V2f";
          break;
        case 10787:
          id result = "C4ub V3f";
          break;
        case 10788:
          id result = "C3f V3f";
          break;
        case 10789:
          id result = "N3f V3f";
          break;
        case 10790:
          id result = "C4f N3f V3f";
          break;
        case 10791:
          id result = "T2f V3f";
          break;
        case 10792:
          id result = "T4f V4f";
          break;
        case 10793:
          id result = "T2f C4ub V3f";
          break;
        case 10794:
          id result = "T2f C3f V3f";
          break;
        case 10795:
          id result = "T2f N3f V3f";
          break;
        case 10796:
          id result = "T2f C4f N3f V3f";
          break;
        case 10797:
          id result = "T4f C4f N3f V4f";
          break;
        default:
          switch(a1)
          {
            case 16384:
              id result = "Light 0";
              break;
            case 16385:
              id result = "Light 1";
              break;
            case 16386:
              id result = "Light 2";
              break;
            case 16387:
              id result = "Light 3";
              break;
            case 16388:
              id result = "Light 4";
              break;
            case 16389:
              id result = "Light 5";
              break;
            case 16390:
              id result = "Light 6";
              break;
            case 16391:
              id result = "Light 7";
              break;
            default:
              return 0;
          }
          break;
      }
    }
    else if (a1 > 8703)
    {
      if (a1 <= 9727)
      {
        if (a1 <= 9216)
        {
          if (a1 > 8959)
          {
            if (a1 == 8960) {
              return "Env";
            }
            if (a1 == 9216) {
              return "Eye Linear";
            }
          }
          else
          {
            if (a1 == 8704) {
              return "Env Mode";
            }
            if (a1 == 8705) {
              return "Env Color";
            }
          }
        }
        else if (a1 <= 9471)
        {
          if (a1 == 9217) {
            return "Object Linear";
          }
          if (a1 == 9218) {
            return "Sphere Map";
          }
        }
        else
        {
          switch(a1)
          {
            case 9472:
              return "Gen Mode";
            case 9473:
              return "Object Plane";
            case 9474:
              return "Eye Plane";
          }
        }
        return 0;
      }
      if (a1 > 10239)
      {
        switch(a1)
        {
          case 10240:
            id result = "Mag Filter";
            break;
          case 10241:
            id result = "Min Filter";
            break;
          case 10242:
            id result = "Wrap S";
            break;
          case 10243:
            id result = "Wrap T";
            break;
          default:
            return 0;
        }
      }
      else
      {
        switch(a1)
        {
          case 9984:
            id result = "Nearest Mipmap Nearest";
            break;
          case 9985:
            id result = "Linear Mipmap Nearest";
            break;
          case 9986:
            id result = "Nearest Mipmap Linear";
            break;
          case 9987:
            id result = "Linear Mipmap Linear";
            break;
          default:
            if (a1 == 9728)
            {
              id result = "Nearest";
            }
            else
            {
              if (a1 != 9729) {
                return 0;
              }
              id result = "Linear";
            }
            break;
        }
      }
    }
    else if (a1 <= 7935)
    {
      if (a1 <= 7423)
      {
        switch(a1)
        {
          case 7168:
            return "Render";
          case 7169:
            return "Feedback";
          case 7170:
            return "Select";
        }
        return 0;
      }
      switch(a1)
      {
        case 7680:
          id result = "Keep";
          break;
        case 7681:
          id result = "Replace";
          break;
        case 7682:
          id result = "Incr";
          break;
        case 7683:
          id result = "Decr";
          break;
        default:
          if (a1 == 7424)
          {
            id result = "Flat";
          }
          else
          {
            if (a1 != 7425) {
              return 0;
            }
            id result = "Smooth";
          }
          break;
      }
    }
    else if (a1 < 0x2000)
    {
      switch(a1)
      {
        case 7936:
          id result = "Vendor";
          break;
        case 7937:
          id result = "Renderer";
          break;
        case 7938:
          id result = "Version";
          break;
        case 7939:
          id result = "Extensions";
          break;
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 8192:
          id result = "S";
          break;
        case 8193:
          id result = "T";
          break;
        case 8194:
          id result = "R";
          break;
        case 8195:
          id result = "Q";
          break;
        default:
          if (a1 == 8448)
          {
            id result = "Modulate";
          }
          else
          {
            if (a1 != 8449) {
              return 0;
            }
            id result = "Decal";
          }
          break;
      }
    }
  }
  else if (a1 <= 1023)
  {
    if (a1 <= 255)
    {
      int v2 = a1 + 1;
      id result = "False";
      switch(v2)
      {
        case 0:
          id result = "Invalid Index";
          break;
        case 1:
          return result;
        case 2:
          id result = "True";
          break;
        case 3:
          id result = "Line Loop";
          break;
        case 4:
          id result = "Line Strip";
          break;
        case 5:
          id result = "Triangles";
          break;
        case 6:
          id result = "Triangle Strip";
          break;
        case 7:
          id result = "Triangle Fan";
          break;
        case 8:
          id result = "Quads";
          break;
        case 9:
          id result = "Quad Strip";
          break;
        case 10:
          id result = "Polygon";
          break;
        case 11:
          id result = "Lines Adjacency";
          break;
        case 12:
          id result = "Line Strip Adjacency";
          break;
        case 13:
          id result = "Triangles Adjacency";
          break;
        case 14:
          id result = "Triangle Strip Adjacency";
          break;
        case 15:
          id result = "Patches";
          break;
        case 17:
          id result = "Map Flush Explicit Bit";
          break;
        case 33:
          id result = "Map Unsynchronized Bit";
          break;
        case 65:
          id result = "Lighting Bit";
          break;
        case 129:
          return "Bit";
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 512:
          id result = "Never";
          break;
        case 513:
          id result = "Less";
          break;
        case 514:
          id result = "Equal";
          break;
        case 515:
          id result = "Lequal";
          break;
        case 516:
          id result = "Greater";
          break;
        case 517:
          id result = "Notequal";
          break;
        case 518:
          id result = "Gequal";
          break;
        case 519:
          id result = "Always";
          break;
        default:
          switch(a1)
          {
            case 256:
              id result = "Accum";
              break;
            case 257:
              id result = "Load";
              break;
            case 258:
              id result = "Return";
              break;
            case 259:
              id result = "Mult";
              break;
            case 260:
              id result = "Add";
              break;
            default:
              return 0;
          }
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 1280:
        id result = "Invalid Enum";
        break;
      case 1281:
        id result = "Invalid Value";
        break;
      case 1282:
        id result = "Invalid Operation";
        break;
      case 1283:
        id result = "Stack Overflow";
        break;
      case 1284:
        id result = "Stack Underflow";
        break;
      case 1285:
        id result = "Out Of Memory";
        break;
      case 1286:
        id result = "Invalid Framebuffer Operation";
        break;
      case 1287:
      case 1288:
      case 1289:
      case 1290:
      case 1291:
      case 1292:
      case 1293:
      case 1294:
      case 1295:
      case 1296:
      case 1297:
      case 1298:
      case 1299:
      case 1300:
      case 1301:
      case 1302:
      case 1303:
      case 1304:
      case 1305:
      case 1306:
      case 1307:
      case 1308:
      case 1309:
      case 1310:
      case 1311:
      case 1312:
      case 1313:
      case 1314:
      case 1315:
      case 1316:
      case 1317:
      case 1318:
      case 1319:
      case 1320:
      case 1321:
      case 1322:
      case 1323:
      case 1324:
      case 1325:
      case 1326:
      case 1327:
      case 1328:
      case 1329:
      case 1330:
      case 1331:
      case 1332:
      case 1333:
      case 1334:
      case 1335:
      case 1336:
      case 1337:
      case 1338:
      case 1339:
      case 1340:
      case 1341:
      case 1342:
      case 1343:
      case 1344:
      case 1345:
      case 1346:
      case 1347:
      case 1348:
      case 1349:
      case 1350:
      case 1351:
      case 1352:
      case 1353:
      case 1354:
      case 1355:
      case 1356:
      case 1357:
      case 1358:
      case 1359:
      case 1360:
      case 1361:
      case 1362:
      case 1363:
      case 1364:
      case 1365:
      case 1366:
      case 1367:
      case 1368:
      case 1369:
      case 1370:
      case 1371:
      case 1372:
      case 1373:
      case 1374:
      case 1375:
      case 1376:
      case 1377:
      case 1378:
      case 1379:
      case 1380:
      case 1381:
      case 1382:
      case 1383:
      case 1384:
      case 1385:
      case 1386:
      case 1387:
      case 1388:
      case 1389:
      case 1390:
      case 1391:
      case 1392:
      case 1393:
      case 1394:
      case 1395:
      case 1396:
      case 1397:
      case 1398:
      case 1399:
      case 1400:
      case 1401:
      case 1402:
      case 1403:
      case 1404:
      case 1405:
      case 1406:
      case 1407:
      case 1408:
      case 1409:
      case 1410:
      case 1411:
      case 1412:
      case 1413:
      case 1414:
      case 1415:
      case 1416:
      case 1417:
      case 1418:
      case 1419:
      case 1420:
      case 1421:
      case 1422:
      case 1423:
      case 1424:
      case 1425:
      case 1426:
      case 1427:
      case 1428:
      case 1429:
      case 1430:
      case 1431:
      case 1432:
      case 1433:
      case 1434:
      case 1435:
      case 1436:
      case 1437:
      case 1438:
      case 1439:
      case 1440:
      case 1441:
      case 1442:
      case 1443:
      case 1444:
      case 1445:
      case 1446:
      case 1447:
      case 1448:
      case 1449:
      case 1450:
      case 1451:
      case 1452:
      case 1453:
      case 1454:
      case 1455:
      case 1456:
      case 1457:
      case 1458:
      case 1459:
      case 1460:
      case 1461:
      case 1462:
      case 1463:
      case 1464:
      case 1465:
      case 1466:
      case 1467:
      case 1468:
      case 1469:
      case 1470:
      case 1471:
      case 1472:
      case 1473:
      case 1474:
      case 1475:
      case 1476:
      case 1477:
      case 1478:
      case 1479:
      case 1480:
      case 1481:
      case 1482:
      case 1483:
      case 1484:
      case 1485:
      case 1486:
      case 1487:
      case 1488:
      case 1489:
      case 1490:
      case 1491:
      case 1492:
      case 1493:
      case 1494:
      case 1495:
      case 1496:
      case 1497:
      case 1498:
      case 1499:
      case 1500:
      case 1501:
      case 1502:
      case 1503:
      case 1504:
      case 1505:
      case 1506:
      case 1507:
      case 1508:
      case 1509:
      case 1510:
      case 1511:
      case 1512:
      case 1513:
      case 1514:
      case 1515:
      case 1516:
      case 1517:
      case 1518:
      case 1519:
      case 1520:
      case 1521:
      case 1522:
      case 1523:
      case 1524:
      case 1525:
      case 1526:
      case 1527:
      case 1528:
      case 1529:
      case 1530:
      case 1531:
      case 1532:
      case 1533:
      case 1534:
      case 1535:
      case 1541:
      case 1542:
      case 1543:
      case 1544:
      case 1545:
      case 1546:
      case 1547:
      case 1548:
      case 1549:
      case 1550:
      case 1551:
      case 1552:
      case 1553:
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1600:
      case 1601:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1629:
      case 1630:
      case 1631:
      case 1632:
      case 1633:
      case 1634:
      case 1635:
      case 1636:
      case 1637:
      case 1638:
      case 1639:
      case 1640:
      case 1641:
      case 1642:
      case 1643:
      case 1644:
      case 1645:
      case 1646:
      case 1647:
      case 1648:
      case 1649:
      case 1650:
      case 1651:
      case 1652:
      case 1653:
      case 1654:
      case 1655:
      case 1656:
      case 1657:
      case 1658:
      case 1659:
      case 1660:
      case 1661:
      case 1662:
      case 1663:
      case 1664:
      case 1665:
      case 1666:
      case 1667:
      case 1668:
      case 1669:
      case 1670:
      case 1671:
      case 1672:
      case 1673:
      case 1674:
      case 1675:
      case 1676:
      case 1677:
      case 1678:
      case 1679:
      case 1680:
      case 1681:
      case 1682:
      case 1683:
      case 1684:
      case 1685:
      case 1686:
      case 1687:
      case 1688:
      case 1689:
      case 1690:
      case 1691:
      case 1692:
      case 1693:
      case 1694:
      case 1695:
      case 1696:
      case 1697:
      case 1698:
      case 1699:
      case 1700:
      case 1701:
      case 1702:
      case 1703:
      case 1704:
      case 1705:
      case 1706:
      case 1707:
      case 1708:
      case 1709:
      case 1710:
      case 1711:
      case 1712:
      case 1713:
      case 1714:
      case 1715:
      case 1716:
      case 1717:
      case 1718:
      case 1719:
      case 1720:
      case 1721:
      case 1722:
      case 1723:
      case 1724:
      case 1725:
      case 1726:
      case 1727:
      case 1728:
      case 1729:
      case 1730:
      case 1731:
      case 1732:
      case 1733:
      case 1734:
      case 1735:
      case 1736:
      case 1737:
      case 1738:
      case 1739:
      case 1740:
      case 1741:
      case 1742:
      case 1743:
      case 1744:
      case 1745:
      case 1746:
      case 1747:
      case 1748:
      case 1749:
      case 1750:
      case 1751:
      case 1752:
      case 1753:
      case 1754:
      case 1755:
      case 1756:
      case 1757:
      case 1758:
      case 1759:
      case 1760:
      case 1761:
      case 1762:
      case 1763:
      case 1764:
      case 1765:
      case 1766:
      case 1767:
      case 1768:
      case 1769:
      case 1770:
      case 1771:
      case 1772:
      case 1773:
      case 1774:
      case 1775:
      case 1776:
      case 1777:
      case 1778:
      case 1779:
      case 1780:
      case 1781:
      case 1782:
      case 1783:
      case 1784:
      case 1785:
      case 1786:
      case 1787:
      case 1788:
      case 1789:
      case 1790:
      case 1791:
      case 1800:
      case 1801:
      case 1802:
      case 1803:
      case 1804:
      case 1805:
      case 1806:
      case 1807:
      case 1808:
      case 1809:
      case 1810:
      case 1811:
      case 1812:
      case 1813:
      case 1814:
      case 1815:
      case 1816:
      case 1817:
      case 1818:
      case 1819:
      case 1820:
      case 1821:
      case 1822:
      case 1823:
      case 1824:
      case 1825:
      case 1826:
      case 1827:
      case 1828:
      case 1829:
      case 1830:
      case 1831:
      case 1832:
      case 1833:
      case 1834:
      case 1835:
      case 1836:
      case 1837:
      case 1838:
      case 1839:
      case 1840:
      case 1841:
      case 1842:
      case 1843:
      case 1844:
      case 1845:
      case 1846:
      case 1847:
      case 1848:
      case 1849:
      case 1850:
      case 1851:
      case 1852:
      case 1853:
      case 1854:
      case 1855:
      case 1856:
      case 1857:
      case 1858:
      case 1859:
      case 1860:
      case 1861:
      case 1862:
      case 1863:
      case 1864:
      case 1865:
      case 1866:
      case 1867:
      case 1868:
      case 1869:
      case 1870:
      case 1871:
      case 1872:
      case 1873:
      case 1874:
      case 1875:
      case 1876:
      case 1877:
      case 1878:
      case 1879:
      case 1880:
      case 1881:
      case 1882:
      case 1883:
      case 1884:
      case 1885:
      case 1886:
      case 1887:
      case 1888:
      case 1889:
      case 1890:
      case 1891:
      case 1892:
      case 1893:
      case 1894:
      case 1895:
      case 1896:
      case 1897:
      case 1898:
      case 1899:
      case 1900:
      case 1901:
      case 1902:
      case 1903:
      case 1904:
      case 1905:
      case 1906:
      case 1907:
      case 1908:
      case 1909:
      case 1910:
      case 1911:
      case 1912:
      case 1913:
      case 1914:
      case 1915:
      case 1916:
      case 1917:
      case 1918:
      case 1919:
      case 1920:
      case 1921:
      case 1922:
      case 1923:
      case 1924:
      case 1925:
      case 1926:
      case 1927:
      case 1928:
      case 1929:
      case 1930:
      case 1931:
      case 1932:
      case 1933:
      case 1934:
      case 1935:
      case 1936:
      case 1937:
      case 1938:
      case 1939:
      case 1940:
      case 1941:
      case 1942:
      case 1943:
      case 1944:
      case 1945:
      case 1946:
      case 1947:
      case 1948:
      case 1949:
      case 1950:
      case 1951:
      case 1952:
      case 1953:
      case 1954:
      case 1955:
      case 1956:
      case 1957:
      case 1958:
      case 1959:
      case 1960:
      case 1961:
      case 1962:
      case 1963:
      case 1964:
      case 1965:
      case 1966:
      case 1967:
      case 1968:
      case 1969:
      case 1970:
      case 1971:
      case 1972:
      case 1973:
      case 1974:
      case 1975:
      case 1976:
      case 1977:
      case 1978:
      case 1979:
      case 1980:
      case 1981:
      case 1982:
      case 1983:
      case 1984:
      case 1985:
      case 1986:
      case 1987:
      case 1988:
      case 1989:
      case 1990:
      case 1991:
      case 1992:
      case 1993:
      case 1994:
      case 1995:
      case 1996:
      case 1997:
      case 1998:
      case 1999:
      case 2000:
      case 2001:
      case 2002:
      case 2003:
      case 2004:
      case 2005:
      case 2006:
      case 2007:
      case 2008:
      case 2009:
      case 2010:
      case 2011:
      case 2012:
      case 2013:
      case 2014:
      case 2015:
      case 2016:
      case 2017:
      case 2018:
      case 2019:
      case 2020:
      case 2021:
      case 2022:
      case 2023:
      case 2024:
      case 2025:
      case 2026:
      case 2027:
      case 2028:
      case 2029:
      case 2030:
      case 2031:
      case 2032:
      case 2033:
      case 2034:
      case 2035:
      case 2036:
      case 2037:
      case 2038:
      case 2039:
      case 2040:
      case 2041:
      case 2042:
      case 2043:
      case 2044:
      case 2045:
      case 2046:
      case 2047:
      case 2050:
      case 2051:
      case 2052:
      case 2053:
      case 2054:
      case 2055:
      case 2056:
      case 2057:
      case 2058:
      case 2059:
      case 2060:
      case 2061:
      case 2062:
      case 2063:
      case 2064:
      case 2065:
      case 2066:
      case 2067:
      case 2068:
      case 2069:
      case 2070:
      case 2071:
      case 2072:
      case 2073:
      case 2074:
      case 2075:
      case 2076:
      case 2077:
      case 2078:
      case 2079:
      case 2080:
      case 2081:
      case 2082:
      case 2083:
      case 2084:
      case 2085:
      case 2086:
      case 2087:
      case 2088:
      case 2089:
      case 2090:
      case 2091:
      case 2092:
      case 2093:
      case 2094:
      case 2095:
      case 2096:
      case 2097:
      case 2098:
      case 2099:
      case 2100:
      case 2101:
      case 2102:
      case 2103:
      case 2104:
      case 2105:
      case 2106:
      case 2107:
      case 2108:
      case 2109:
      case 2110:
      case 2111:
      case 2112:
      case 2113:
      case 2114:
      case 2115:
      case 2116:
      case 2117:
      case 2118:
      case 2119:
      case 2120:
      case 2121:
      case 2122:
      case 2123:
      case 2124:
      case 2125:
      case 2126:
      case 2127:
      case 2128:
      case 2129:
      case 2130:
      case 2131:
      case 2132:
      case 2133:
      case 2134:
      case 2135:
      case 2136:
      case 2137:
      case 2138:
      case 2139:
      case 2140:
      case 2141:
      case 2142:
      case 2143:
      case 2144:
      case 2145:
      case 2146:
      case 2147:
      case 2148:
      case 2149:
      case 2150:
      case 2151:
      case 2152:
      case 2153:
      case 2154:
      case 2155:
      case 2156:
      case 2157:
      case 2158:
      case 2159:
      case 2160:
      case 2161:
      case 2162:
      case 2163:
      case 2164:
      case 2165:
      case 2166:
      case 2167:
      case 2168:
      case 2169:
      case 2170:
      case 2171:
      case 2172:
      case 2173:
      case 2174:
      case 2175:
      case 2176:
      case 2177:
      case 2178:
      case 2179:
      case 2180:
      case 2181:
      case 2182:
      case 2183:
      case 2184:
      case 2185:
      case 2186:
      case 2187:
      case 2188:
      case 2189:
      case 2190:
      case 2191:
      case 2192:
      case 2193:
      case 2194:
      case 2195:
      case 2196:
      case 2197:
      case 2198:
      case 2199:
      case 2200:
      case 2201:
      case 2202:
      case 2203:
      case 2204:
      case 2205:
      case 2206:
      case 2207:
      case 2208:
      case 2209:
      case 2210:
      case 2211:
      case 2212:
      case 2213:
      case 2214:
      case 2215:
      case 2216:
      case 2217:
      case 2218:
      case 2219:
      case 2220:
      case 2221:
      case 2222:
      case 2223:
      case 2224:
      case 2225:
      case 2226:
      case 2227:
      case 2228:
      case 2229:
      case 2230:
      case 2231:
      case 2232:
      case 2233:
      case 2234:
      case 2235:
      case 2236:
      case 2237:
      case 2238:
      case 2239:
      case 2240:
      case 2241:
      case 2242:
      case 2243:
      case 2244:
      case 2245:
      case 2246:
      case 2247:
      case 2248:
      case 2249:
      case 2250:
      case 2251:
      case 2252:
      case 2253:
      case 2254:
      case 2255:
      case 2256:
      case 2257:
      case 2258:
      case 2259:
      case 2260:
      case 2261:
      case 2262:
      case 2263:
      case 2264:
      case 2265:
      case 2266:
      case 2267:
      case 2268:
      case 2269:
      case 2270:
      case 2271:
      case 2272:
      case 2273:
      case 2274:
      case 2275:
      case 2276:
      case 2277:
      case 2278:
      case 2279:
      case 2280:
      case 2281:
      case 2282:
      case 2283:
      case 2284:
      case 2285:
      case 2286:
      case 2287:
      case 2288:
      case 2289:
      case 2290:
      case 2291:
      case 2292:
      case 2293:
      case 2294:
      case 2295:
      case 2296:
      case 2297:
      case 2298:
      case 2299:
      case 2300:
      case 2301:
      case 2302:
      case 2303:
      case 2306:
      case 2307:
      case 2308:
      case 2309:
      case 2310:
      case 2311:
      case 2312:
      case 2313:
      case 2314:
      case 2315:
      case 2316:
      case 2317:
      case 2318:
      case 2319:
      case 2320:
      case 2321:
      case 2322:
      case 2323:
      case 2324:
      case 2325:
      case 2326:
      case 2327:
      case 2328:
      case 2329:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
      case 2351:
      case 2352:
      case 2353:
      case 2354:
      case 2355:
      case 2356:
      case 2357:
      case 2358:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
      case 2368:
      case 2369:
      case 2370:
      case 2371:
      case 2372:
      case 2373:
      case 2374:
      case 2375:
      case 2376:
      case 2377:
      case 2378:
      case 2379:
      case 2380:
      case 2381:
      case 2382:
      case 2383:
      case 2384:
      case 2385:
      case 2386:
      case 2387:
      case 2388:
      case 2389:
      case 2390:
      case 2391:
      case 2392:
      case 2393:
      case 2394:
      case 2395:
      case 2396:
      case 2397:
      case 2398:
      case 2399:
      case 2400:
      case 2401:
      case 2402:
      case 2403:
      case 2404:
      case 2405:
      case 2406:
      case 2407:
      case 2408:
      case 2409:
      case 2410:
      case 2411:
      case 2412:
      case 2413:
      case 2414:
      case 2415:
      case 2416:
      case 2417:
      case 2418:
      case 2419:
      case 2420:
      case 2421:
      case 2422:
      case 2423:
      case 2424:
      case 2425:
      case 2426:
      case 2427:
      case 2428:
      case 2429:
      case 2430:
      case 2431:
      case 2432:
      case 2433:
      case 2434:
      case 2435:
      case 2436:
      case 2437:
      case 2438:
      case 2439:
      case 2440:
      case 2441:
      case 2442:
      case 2443:
      case 2444:
      case 2445:
      case 2446:
      case 2447:
      case 2448:
      case 2449:
      case 2450:
      case 2451:
      case 2452:
      case 2453:
      case 2454:
      case 2455:
      case 2456:
      case 2457:
      case 2458:
      case 2459:
      case 2460:
      case 2461:
      case 2462:
      case 2463:
      case 2464:
      case 2465:
      case 2466:
      case 2467:
      case 2468:
      case 2469:
      case 2470:
      case 2471:
      case 2472:
      case 2473:
      case 2474:
      case 2475:
      case 2476:
      case 2477:
      case 2478:
      case 2479:
      case 2480:
      case 2481:
      case 2482:
      case 2483:
      case 2484:
      case 2485:
      case 2486:
      case 2487:
      case 2488:
      case 2489:
      case 2490:
      case 2491:
      case 2492:
      case 2493:
      case 2494:
      case 2495:
      case 2496:
      case 2497:
      case 2498:
      case 2499:
      case 2500:
      case 2501:
      case 2502:
      case 2503:
      case 2504:
      case 2505:
      case 2506:
      case 2507:
      case 2508:
      case 2509:
      case 2510:
      case 2511:
      case 2512:
      case 2513:
      case 2514:
      case 2515:
      case 2516:
      case 2517:
      case 2518:
      case 2519:
      case 2520:
      case 2521:
      case 2522:
      case 2523:
      case 2524:
      case 2525:
      case 2526:
      case 2527:
      case 2528:
      case 2529:
      case 2530:
      case 2531:
      case 2532:
      case 2533:
      case 2534:
      case 2535:
      case 2536:
      case 2537:
      case 2538:
      case 2539:
      case 2540:
      case 2541:
      case 2542:
      case 2543:
      case 2544:
      case 2545:
      case 2546:
      case 2547:
      case 2548:
      case 2549:
      case 2550:
      case 2551:
      case 2552:
      case 2553:
      case 2554:
      case 2555:
      case 2556:
      case 2557:
      case 2558:
      case 2559:
      case 2563:
      case 2564:
      case 2565:
      case 2566:
      case 2567:
      case 2568:
      case 2569:
      case 2570:
      case 2571:
      case 2572:
      case 2573:
      case 2574:
      case 2575:
      case 2576:
      case 2577:
      case 2578:
      case 2579:
      case 2580:
      case 2581:
      case 2582:
      case 2583:
      case 2584:
      case 2585:
      case 2586:
      case 2587:
      case 2588:
      case 2589:
      case 2590:
      case 2591:
      case 2592:
      case 2593:
      case 2594:
      case 2595:
      case 2596:
      case 2597:
      case 2598:
      case 2599:
      case 2600:
      case 2601:
      case 2602:
      case 2603:
      case 2604:
      case 2605:
      case 2606:
      case 2607:
      case 2608:
      case 2609:
      case 2610:
      case 2611:
      case 2612:
      case 2613:
      case 2614:
      case 2615:
      case 2616:
      case 2617:
      case 2618:
      case 2619:
      case 2620:
      case 2621:
      case 2622:
      case 2623:
      case 2624:
      case 2625:
      case 2626:
      case 2627:
      case 2628:
      case 2629:
      case 2630:
      case 2631:
      case 2632:
      case 2633:
      case 2634:
      case 2635:
      case 2636:
      case 2637:
      case 2638:
      case 2639:
      case 2640:
      case 2641:
      case 2642:
      case 2643:
      case 2644:
      case 2645:
      case 2646:
      case 2647:
      case 2648:
      case 2649:
      case 2650:
      case 2651:
      case 2652:
      case 2653:
      case 2654:
      case 2655:
      case 2656:
      case 2657:
      case 2658:
      case 2659:
      case 2660:
      case 2661:
      case 2662:
      case 2663:
      case 2664:
      case 2665:
      case 2666:
      case 2667:
      case 2668:
      case 2669:
      case 2670:
      case 2671:
      case 2672:
      case 2673:
      case 2674:
      case 2675:
      case 2676:
      case 2677:
      case 2678:
      case 2679:
      case 2680:
      case 2681:
      case 2682:
      case 2683:
      case 2684:
      case 2685:
      case 2686:
      case 2687:
      case 2688:
      case 2689:
      case 2690:
      case 2691:
      case 2692:
      case 2693:
      case 2694:
      case 2695:
      case 2696:
      case 2697:
      case 2698:
      case 2699:
      case 2700:
      case 2701:
      case 2702:
      case 2703:
      case 2704:
      case 2705:
      case 2706:
      case 2707:
      case 2708:
      case 2709:
      case 2710:
      case 2711:
      case 2712:
      case 2713:
      case 2714:
      case 2715:
      case 2716:
      case 2717:
      case 2718:
      case 2719:
      case 2720:
      case 2721:
      case 2722:
      case 2723:
      case 2724:
      case 2725:
      case 2726:
      case 2727:
      case 2728:
      case 2729:
      case 2730:
      case 2731:
      case 2732:
      case 2733:
      case 2734:
      case 2735:
      case 2736:
      case 2737:
      case 2738:
      case 2739:
      case 2740:
      case 2741:
      case 2742:
      case 2743:
      case 2744:
      case 2745:
      case 2746:
      case 2747:
      case 2748:
      case 2749:
      case 2750:
      case 2751:
      case 2752:
      case 2753:
      case 2754:
      case 2755:
      case 2756:
      case 2757:
      case 2758:
      case 2759:
      case 2760:
      case 2761:
      case 2762:
      case 2763:
      case 2764:
      case 2765:
      case 2766:
      case 2767:
      case 2768:
      case 2769:
      case 2770:
      case 2771:
      case 2772:
      case 2773:
      case 2774:
      case 2775:
      case 2776:
      case 2777:
      case 2778:
      case 2779:
      case 2780:
      case 2781:
      case 2782:
      case 2783:
      case 2784:
      case 2785:
      case 2786:
      case 2787:
      case 2788:
      case 2789:
      case 2790:
      case 2791:
      case 2792:
      case 2793:
      case 2794:
      case 2795:
      case 2796:
      case 2797:
      case 2798:
      case 2799:
      case 2800:
      case 2801:
      case 2802:
      case 2803:
      case 2804:
      case 2805:
      case 2806:
      case 2807:
      case 2808:
      case 2809:
      case 2810:
      case 2811:
      case 2812:
      case 2813:
      case 2814:
      case 2815:
      case 2826:
      case 2827:
      case 2828:
      case 2829:
      case 2830:
      case 2831:
      case 2836:
      case 2837:
      case 2838:
      case 2839:
      case 2840:
      case 2841:
      case 2842:
      case 2843:
      case 2844:
      case 2845:
      case 2846:
      case 2847:
      case 2855:
      case 2856:
      case 2857:
      case 2858:
      case 2859:
      case 2860:
      case 2861:
      case 2862:
      case 2863:
      case 2868:
      case 2869:
      case 2870:
      case 2871:
      case 2872:
      case 2873:
      case 2874:
      case 2875:
      case 2876:
      case 2877:
      case 2878:
      case 2879:
      case 2887:
      case 2888:
      case 2889:
      case 2890:
      case 2891:
      case 2892:
      case 2893:
      case 2894:
      case 2895:
      case 2904:
      case 2905:
      case 2906:
      case 2907:
      case 2908:
      case 2909:
      case 2910:
      case 2911:
      case 2919:
      case 2920:
      case 2921:
      case 2922:
      case 2923:
      case 2924:
      case 2925:
      case 2926:
      case 2927:
      case 2933:
      case 2934:
      case 2935:
      case 2936:
      case 2937:
      case 2938:
      case 2939:
      case 2940:
      case 2941:
      case 2942:
      case 2943:
      case 2945:
      case 2946:
      case 2947:
      case 2948:
      case 2949:
      case 2950:
      case 2951:
      case 2952:
      case 2953:
      case 2954:
      case 2955:
      case 2956:
      case 2957:
      case 2958:
      case 2959:
      case 2969:
      case 2970:
      case 2971:
      case 2972:
      case 2973:
      case 2974:
      case 2975:
      case 2985:
      case 2986:
      case 2987:
      case 2988:
      case 2989:
      case 2990:
      case 2991:
      case 2994:
      case 2995:
      case 2996:
      case 2997:
      case 2998:
      case 2999:
      case 3000:
      case 3001:
      case 3002:
      case 3003:
      case 3004:
      case 3005:
      case 3006:
      case 3007:
      case 3011:
      case 3012:
      case 3013:
      case 3014:
      case 3015:
      case 3016:
      case 3017:
      case 3018:
      case 3019:
      case 3020:
      case 3021:
      case 3022:
      case 3023:
      case 3025:
      case 3026:
      case 3027:
      case 3028:
      case 3029:
      case 3030:
      case 3031:
      case 3032:
      case 3033:
      case 3034:
      case 3035:
      case 3036:
      case 3037:
      case 3038:
      case 3039:
      case 3043:
      case 3044:
      case 3045:
      case 3046:
      case 3047:
      case 3048:
      case 3049:
      case 3050:
      case 3051:
      case 3052:
      case 3053:
      case 3054:
      case 3055:
      case 3059:
      case 3060:
      case 3061:
      case 3062:
      case 3063:
      case 3064:
      case 3065:
      case 3066:
      case 3067:
      case 3068:
      case 3069:
      case 3070:
      case 3071:
      case 3075:
      case 3076:
      case 3077:
      case 3078:
      case 3079:
      case 3080:
      case 3081:
      case 3082:
      case 3083:
      case 3084:
      case 3085:
      case 3086:
      case 3087:
      case 3090:
      case 3091:
      case 3092:
      case 3093:
      case 3094:
      case 3095:
      case 3096:
      case 3097:
      case 3098:
      case 3099:
      case 3100:
      case 3101:
      case 3102:
      case 3103:
      case 3108:
      case 3109:
      case 3110:
      case 3111:
      case 3112:
      case 3113:
      case 3114:
      case 3115:
      case 3116:
      case 3117:
      case 3118:
      case 3119:
      case 3124:
      case 3125:
      case 3126:
      case 3127:
      case 3128:
      case 3129:
      case 3130:
      case 3131:
      case 3132:
      case 3133:
      case 3134:
      case 3135:
      case 3137:
      case 3138:
      case 3139:
      case 3140:
      case 3141:
      case 3142:
      case 3143:
      case 3144:
      case 3145:
      case 3146:
      case 3147:
      case 3148:
      case 3149:
      case 3150:
      case 3151:
      case 3157:
      case 3158:
      case 3159:
      case 3160:
      case 3161:
      case 3162:
      case 3163:
      case 3164:
      case 3165:
      case 3166:
      case 3167:
      case 3172:
      case 3173:
      case 3174:
      case 3175:
      case 3176:
      case 3177:
      case 3178:
      case 3179:
      case 3180:
      case 3181:
      case 3182:
      case 3183:
      case 3194:
      case 3195:
      case 3196:
      case 3197:
      case 3198:
      case 3199:
      case 3200:
      case 3201:
      case 3202:
      case 3203:
      case 3204:
      case 3205:
      case 3206:
      case 3207:
      case 3208:
      case 3209:
      case 3210:
      case 3211:
      case 3212:
      case 3213:
      case 3214:
      case 3215:
      case 3216:
      case 3217:
      case 3218:
      case 3219:
      case 3220:
      case 3221:
      case 3222:
      case 3223:
      case 3224:
      case 3225:
      case 3226:
      case 3227:
      case 3228:
      case 3229:
      case 3230:
      case 3231:
      case 3232:
      case 3233:
      case 3234:
      case 3235:
      case 3236:
      case 3237:
      case 3238:
      case 3239:
      case 3240:
      case 3241:
      case 3242:
      case 3243:
      case 3244:
      case 3245:
      case 3246:
      case 3247:
      case 3258:
      case 3259:
      case 3260:
      case 3261:
      case 3262:
      case 3263:
      case 3264:
      case 3265:
      case 3266:
      case 3267:
      case 3268:
      case 3269:
      case 3270:
      case 3271:
      case 3272:
      case 3273:
      case 3274:
      case 3275:
      case 3276:
      case 3277:
      case 3278:
      case 3279:
      case 3280:
      case 3281:
      case 3282:
      case 3283:
      case 3284:
      case 3285:
      case 3286:
      case 3287:
      case 3288:
      case 3289:
      case 3290:
      case 3291:
      case 3292:
      case 3293:
      case 3294:
      case 3295:
      case 3296:
      case 3297:
      case 3298:
      case 3299:
      case 3300:
      case 3301:
      case 3302:
      case 3303:
      case 3304:
      case 3305:
      case 3306:
      case 3307:
      case 3308:
      case 3309:
      case 3310:
      case 3311:
      case 3318:
      case 3319:
      case 3320:
      case 3321:
      case 3322:
      case 3323:
      case 3324:
      case 3325:
      case 3326:
      case 3327:
      case 3334:
      case 3335:
      case 3336:
      case 3337:
      case 3338:
      case 3339:
      case 3340:
      case 3341:
      case 3342:
      case 3343:
      case 3360:
      case 3361:
      case 3362:
      case 3363:
      case 3364:
      case 3365:
      case 3366:
      case 3367:
      case 3368:
      case 3369:
      case 3370:
      case 3371:
      case 3372:
      case 3373:
      case 3374:
      case 3375:
      case 3388:
      case 3389:
      case 3390:
      case 3391:
      case 3392:
      case 3393:
      case 3394:
      case 3395:
      case 3396:
      case 3397:
      case 3398:
      case 3399:
      case 3400:
      case 3401:
      case 3402:
      case 3403:
      case 3404:
      case 3405:
      case 3406:
      case 3407:
      case 3420:
      case 3421:
      case 3422:
      case 3423:
      case 3424:
      case 3425:
      case 3426:
      case 3427:
      case 3428:
      case 3429:
      case 3430:
      case 3431:
      case 3432:
      case 3433:
      case 3434:
      case 3435:
      case 3436:
      case 3437:
      case 3438:
      case 3439:
      case 3441:
      case 3442:
      case 3443:
      case 3444:
      case 3445:
      case 3446:
      case 3447:
      case 3448:
      case 3449:
      case 3450:
      case 3451:
      case 3452:
      case 3453:
      case 3454:
      case 3455:
      case 3457:
      case 3458:
      case 3459:
      case 3460:
      case 3461:
      case 3462:
      case 3463:
      case 3464:
      case 3465:
      case 3466:
      case 3467:
      case 3468:
      case 3469:
      case 3470:
      case 3471:
      case 3481:
      case 3482:
      case 3483:
      case 3484:
      case 3485:
      case 3486:
      case 3487:
      case 3488:
      case 3489:
      case 3490:
      case 3491:
      case 3492:
      case 3493:
      case 3494:
      case 3495:
      case 3496:
      case 3497:
      case 3498:
      case 3499:
      case 3500:
      case 3501:
      case 3502:
      case 3503:
      case 3513:
      case 3514:
      case 3515:
      case 3516:
      case 3517:
      case 3518:
      case 3519:
      case 3520:
      case 3521:
      case 3522:
      case 3523:
      case 3524:
      case 3525:
      case 3526:
      case 3527:
      case 3528:
      case 3529:
      case 3530:
      case 3531:
      case 3532:
      case 3533:
      case 3534:
      case 3535:
      case 3540:
      case 3541:
      case 3542:
      case 3543:
      case 3544:
      case 3545:
      case 3546:
      case 3547:
      case 3548:
      case 3549:
      case 3550:
      case 3551:
      case 3554:
      case 3555:
      case 3556:
      case 3557:
      case 3558:
      case 3559:
      case 3560:
      case 3561:
      case 3562:
      case 3563:
      case 3564:
      case 3565:
      case 3566:
      case 3567:
        return 0;
      case 1536:
        id result = "2D";
        break;
      case 1537:
        id result = "3D";
        break;
      case 1538:
        id result = "3D Color";
        break;
      case 1539:
        id result = "3D Color Texture";
        break;
      case 1540:
        id result = "4D Color Texture";
        break;
      case 1792:
        id result = "Pass Through Token";
        break;
      case 1793:
        id result = "Token";
        break;
      case 1794:
        id result = "Line Token";
        break;
      case 1795:
        id result = "Polygon Token";
        break;
      case 1796:
        id result = "Bitmap Token";
        break;
      case 1797:
        id result = "Draw Pixel Token";
        break;
      case 1798:
        id result = "Copy Pixel Token";
        break;
      case 1799:
        id result = "Line Reset Token";
        break;
      case 2048:
        id result = "Exp";
        break;
      case 2049:
        id result = "Exp2";
        break;
      case 2304:
        id result = "CW";
        break;
      case 2305:
        id result = "CCW";
        break;
      case 2560:
        id result = "Coeff";
        break;
      case 2561:
        id result = "Order";
        break;
      case 2562:
        id result = "Domain";
        break;
      case 2816:
        id result = "Current Color";
        break;
      case 2817:
        id result = "Current Index";
        break;
      case 2818:
        id result = "Current Normal";
        break;
      case 2819:
        id result = "Current Texture Coords";
        break;
      case 2820:
        id result = "Current Raster Color";
        break;
      case 2821:
        id result = "Current Raster Index";
        break;
      case 2822:
        id result = "Current Raster Texture Coords";
        break;
      case 2823:
        id result = "Current Raster Position";
        break;
      case 2824:
        id result = "Current Raster Position Valid";
        break;
      case 2825:
        id result = "Current Raster Distance";
        break;
      case 2832:
        id result = "Smooth";
        break;
      case 2833:
        id result = "Size";
        break;
      case 2834:
        id result = "Size Range";
        break;
      case 2835:
        id result = "Size Granularity";
        break;
      case 2848:
        id result = "Line Smooth";
        break;
      case 2849:
        id result = "Line Width";
        break;
      case 2850:
        id result = "Smooth Line Width Range";
        break;
      case 2851:
        id result = "Smooth Line Width Granularity";
        break;
      case 2852:
        id result = "Line Stipple";
        break;
      case 2853:
        id result = "Line Stipple Pattern";
        break;
      case 2854:
        id result = "Line Stipple Repeat";
        break;
      case 2864:
        id result = "List Mode";
        break;
      case 2865:
        id result = "Max List Nesting";
        break;
      case 2866:
        id result = "List Base";
        break;
      case 2867:
        id result = "List Index";
        break;
      case 2880:
        id result = "Polygon Mode";
        break;
      case 2881:
        id result = "Polygon Smooth";
        break;
      case 2882:
        id result = "Polygon Stipple";
        break;
      case 2883:
        id result = "Edge Flag";
        break;
      case 2884:
        id result = "Cull Face";
        break;
      case 2885:
        id result = "Cull Face Mode";
        break;
      case 2886:
        id result = "Front Face";
        break;
      case 2896:
        id result = "Lighting";
        break;
      case 2897:
        id result = "Local Viewer";
        break;
      case 2898:
        id result = "Two Side";
        break;
      case 2899:
        id result = "Ambient";
        break;
      case 2900:
        id result = "Shade Model";
        break;
      case 2901:
        id result = "Color Material Face";
        break;
      case 2902:
        id result = "Color Material Parameter";
        break;
      case 2903:
        id result = "Color Material";
        break;
      case 2912:
        id result = "Fog";
        break;
      case 2913:
        id result = "Index";
        break;
      case 2914:
        id result = "Density";
        break;
      case 2915:
        id result = "Start";
        break;
      case 2916:
        id result = "End";
        break;
      case 2917:
        id result = "Mode";
        break;
      case 2918:
        id result = "Color";
        break;
      case 2928:
        id result = "Depth Range";
        break;
      case 2929:
        id result = "Test";
        break;
      case 2930:
        id result = "Writemask";
        break;
      case 2931:
        id result = "Clear Value";
        break;
      case 2932:
        id result = "Func";
        break;
      case 2944:
        id result = "Accum Clear Value";
        break;
      case 2960:
        id result = "Test";
        break;
      case 2961:
        id result = "Clear Value";
        break;
      case 2962:
        id result = "Func";
        break;
      case 2963:
        id result = "Value Mask";
        break;
      case 2964:
        id result = "Fail";
        break;
      case 2965:
        id result = "Pass Depth Fail";
        break;
      case 2966:
        id result = "Pass Depth Pass";
        break;
      case 2967:
        id result = "Ref";
        break;
      case 2968:
        id result = "Writemask";
        break;
      case 2976:
        id result = "Matrix Mode";
        break;
      case 2977:
        id result = "Normalize";
        break;
      case 2978:
        id result = "Viewport";
        break;
      case 2979:
        id result = "Modelview Stack Depth";
        break;
      case 2980:
        id result = "Projection Stack Depth";
        break;
      case 2981:
        id result = "Stack Depth";
        break;
      case 2982:
        id result = "Modelview Matrix";
        break;
      case 2983:
        id result = "Projection Matrix";
        break;
      case 2984:
        id result = "Texture Matrix";
        break;
      case 2992:
        id result = "Attrib Stack Depth";
        break;
      case 2993:
        id result = "Client Attrib Stack Depth";
        break;
      case 3008:
        id result = "Alpha Test";
        break;
      case 3009:
        id result = "Alpha Test Func";
        break;
      case 3010:
        id result = "Alpha Test Ref";
        break;
      case 3024:
        id result = "Dither";
        break;
      case 3040:
        id result = "Dst";
        break;
      case 3041:
        id result = "Src";
        break;
      case 3042:
        id result = "Blend";
        break;
      case 3056:
        id result = "Logic Op Mode";
        break;
      case 3057:
        id result = "Index Logic Op";
        break;
      case 3058:
        id result = "Logic Op";
        break;
      case 3072:
        id result = "Aux Buffers";
        break;
      case 3073:
        id result = "Draw Buffer";
        break;
      case 3074:
        id result = "Read Buffer";
        break;
      case 3088:
        id result = "Box";
        break;
      case 3089:
        id result = "Test";
        break;
      case 3104:
        id result = "Index Clear Value";
        break;
      case 3105:
        id result = "Index Writemask";
        break;
      case 3106:
        id result = "Clear Value";
        break;
      case 3107:
        id result = "Writemask";
        break;
      case 3120:
        id result = "Index Mode";
        break;
      case 3121:
        id result = "RGBA Mode";
        break;
      case 3122:
        id result = "Doublebuffer";
        break;
      case 3123:
        id result = "Stereo";
        break;
      case 3136:
        id result = "Render Mode";
        break;
      case 3152:
        id result = "Perspective Correction Hint";
        break;
      case 3153:
        id result = "Smooth Hint";
        break;
      case 3154:
        id result = "Line Smooth Hint";
        break;
      case 3155:
        id result = "Polygon Smooth Hint";
        break;
      case 3156:
        id result = "Hint";
        break;
      case 3168:
        id result = "Gen S";
        break;
      case 3169:
        id result = "Gen T";
        break;
      case 3170:
        id result = "Gen R";
        break;
      case 3171:
        id result = "Gen Q";
        break;
      case 3184:
        id result = "Pixel Map I To I";
        break;
      case 3185:
        id result = "Pixel Map S To S";
        break;
      case 3186:
        id result = "Pixel Map I To R";
        break;
      case 3187:
        id result = "Pixel Map I To G";
        break;
      case 3188:
        id result = "Pixel Map I To B";
        break;
      case 3189:
        id result = "Pixel Map I To A";
        break;
      case 3190:
        id result = "Pixel Map R To R";
        break;
      case 3191:
        id result = "Pixel Map G To G";
        break;
      case 3192:
        id result = "Pixel Map B To B";
        break;
      case 3193:
        id result = "Pixel Map A To A";
        break;
      case 3248:
        id result = "Pixel Map I To I Size";
        break;
      case 3249:
        id result = "Pixel Map S To S Size";
        break;
      case 3250:
        id result = "Pixel Map I To R Size";
        break;
      case 3251:
        id result = "Pixel Map I To G Size";
        break;
      case 3252:
        id result = "Pixel Map I To B Size";
        break;
      case 3253:
        id result = "Pixel Map I To A Size";
        break;
      case 3254:
        id result = "Pixel Map R To R Size";
        break;
      case 3255:
        id result = "Pixel Map G To G Size";
        break;
      case 3256:
        id result = "Pixel Map B To B Size";
        break;
      case 3257:
        id result = "Pixel Map A To A Size";
        break;
      case 3312:
        id result = "Unpack Swap Bytes";
        break;
      case 3313:
        id result = "Unpack Lsb First";
        break;
      case 3314:
        id result = "Unpack Row Length";
        break;
      case 3315:
        id result = "Unpack Skip Rows";
        break;
      case 3316:
        id result = "Unpack Skip Pixels";
        break;
      case 3317:
        id result = "Unpack Alignment";
        break;
      case 3328:
        id result = "Pack Swap Bytes";
        break;
      case 3329:
        id result = "Pack Lsb First";
        break;
      case 3330:
        id result = "Pack Row Length";
        break;
      case 3331:
        id result = "Pack Skip Rows";
        break;
      case 3332:
        id result = "Pack Skip Pixels";
        break;
      case 3333:
        id result = "Pack Alignment";
        break;
      case 3344:
        id result = "Map Color";
        break;
      case 3345:
        id result = "Map Stencil";
        break;
      case 3346:
        id result = "Index Shift";
        break;
      case 3347:
        id result = "Index Offset";
        break;
      case 3348:
        id result = "Red Scale";
        break;
      case 3349:
        id result = "Red Bias";
        break;
      case 3350:
        id result = "Zoom X";
        break;
      case 3351:
        id result = "Zoom Y";
        break;
      case 3352:
        id result = "Green Scale";
        break;
      case 3353:
        id result = "Green Bias";
        break;
      case 3354:
        id result = "Blue Scale";
        break;
      case 3355:
        id result = "Blue Bias";
        break;
      case 3356:
        id result = "Alpha Scale";
        break;
      case 3357:
        id result = "Alpha Bias";
        break;
      case 3358:
        id result = "Scale";
        break;
      case 3359:
        id result = "Bias";
        break;
      case 3376:
        id result = "Max Eval Order";
        break;
      case 3377:
        id result = "Max Lights";
        break;
      case 3378:
        id result = "Max Clip Distances";
        break;
      case 3379:
        id result = "Max Texture Size";
        break;
      case 3380:
        id result = "Max Pixel Map Table";
        break;
      case 3381:
        id result = "Max Attrib Stack Depth";
        break;
      case 3382:
        id result = "Max Modelview Stack Depth";
        break;
      case 3383:
        id result = "Max Name Stack Depth";
        break;
      case 3384:
        id result = "Max Projection Stack Depth";
        break;
      case 3385:
        id result = "Max Texture Stack Depth";
        break;
      case 3386:
        id result = "Max Viewport Dims";
        break;
      case 3387:
        id result = "Max Client Attrib Stack Depth";
        break;
      case 3408:
        id result = "Subpixel Bits";
        break;
      case 3409:
        id result = "Index Bits";
        break;
      case 3410:
        id result = "Red Bits";
        break;
      case 3411:
        id result = "Green Bits";
        break;
      case 3412:
        id result = "Blue Bits";
        break;
      case 3413:
        id result = "Alpha Bits";
        break;
      case 3414:
        id result = "Bits";
        break;
      case 3415:
        id result = "Bits";
        break;
      case 3416:
        id result = "Accum Red Bits";
        break;
      case 3417:
        id result = "Accum Green Bits";
        break;
      case 3418:
        id result = "Accum Blue Bits";
        break;
      case 3419:
        id result = "Accum Alpha Bits";
        break;
      case 3440:
        id result = "Name Stack Depth";
        break;
      case 3456:
        id result = "Auto Normal";
        break;
      case 3472:
        id result = "Map1 Color 4";
        break;
      case 3473:
        id result = "Map1 Index";
        break;
      case 3474:
        id result = "Map1 Normal";
        break;
      case 3475:
        id result = "Map1 Texture Coord 1";
        break;
      case 3476:
        id result = "Map1 Texture Coord 2";
        break;
      case 3477:
        id result = "Map1 Texture Coord 3";
        break;
      case 3478:
        id result = "Map1 Texture Coord 4";
        break;
      case 3479:
        id result = "Map1 Vertex 3";
        break;
      case 3480:
        id result = "Map1 Vertex 4";
        break;
      case 3504:
        id result = "Map2 Color 4";
        break;
      case 3505:
        id result = "Map2 Index";
        break;
      case 3506:
        id result = "Map2 Normal";
        break;
      case 3507:
        id result = "Map2 Texture Coord 1";
        break;
      case 3508:
        id result = "Map2 Texture Coord 2";
        break;
      case 3509:
        id result = "Map2 Texture Coord 3";
        break;
      case 3510:
        id result = "Map2 Texture Coord 4";
        break;
      case 3511:
        id result = "Map2 Vertex 3";
        break;
      case 3512:
        id result = "Map2 Vertex 4";
        break;
      case 3536:
        id result = "Map1 Grid Domain";
        break;
      case 3537:
        id result = "Map1 Grid Segments";
        break;
      case 3538:
        id result = "Map2 Grid Domain";
        break;
      case 3539:
        id result = "Map2 Grid Segments";
        break;
      case 3552:
        id result = "1D";
        break;
      case 3553:
        id result = "2D";
        break;
      case 3568:
        id result = "Feedback Buffer Pointer";
        break;
      case 3569:
        id result = "Feedback Buffer Size";
        break;
      case 3570:
        id result = "Feedback Buffer Type";
        break;
      case 3571:
        id result = "Selection Buffer Pointer";
        break;
      case 3572:
        id result = "Selection Buffer Size";
        break;
      default:
        switch(a1)
        {
          case 1024:
            id result = "Front Left";
            break;
          case 1025:
            id result = "Front Right";
            break;
          case 1026:
            id result = "Back Left";
            break;
          case 1027:
            id result = "Back Right";
            break;
          case 1028:
            id result = "Front";
            break;
          case 1029:
            id result = "Back";
            break;
          case 1030:
            id result = "Left";
            break;
          case 1031:
            id result = "Right";
            break;
          case 1032:
            id result = "Front And Back";
            break;
          case 1033:
            id result = "Aux0";
            break;
          case 1034:
            id result = "Aux1";
            break;
          case 1035:
            id result = "Aux2";
            break;
          case 1036:
            id result = "Aux3";
            break;
          default:
            return 0;
        }
        break;
    }
  }
  return result;
}

id dy_nsstring_from_enum(uint64_t a1)
{
  int v2 = dy_string_from_enum(a1);
  if (!v2) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", a1);
  }
  int8x8_t v3 = (void *)[[NSString alloc] initWithBytesNoCopy:v2 length:strlen(v2) encoding:1 freeWhenDone:0];
  return v3;
}

id dy_compact_nsstring_from_enum(uint64_t a1)
{
  int v2 = dy_compact_string_from_enum(a1);
  if (!v2) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"0x%08x", a1);
  }
  int8x8_t v3 = (void *)[[NSString alloc] initWithBytesNoCopy:v2 length:strlen(v2) encoding:1 freeWhenDone:0];
  return v3;
}

const char *dy_string_from_enum_ex(int a1, int a2)
{
  if (a2) {
    return dy_compact_string_from_enum(a1);
  }
  else {
    return dy_string_from_enum(a1);
  }
}

id dy_nsstring_from_enum_ex(uint64_t a1, int a2)
{
  int8x8_t v3 = NSString;
  if (a2)
  {
    size_t v4 = dy_compact_string_from_enum(a1);
    if (!v4) {
      return (id)objc_msgSend(v3, "stringWithFormat:", @"0x%08x", a1);
    }
  }
  else
  {
    size_t v4 = dy_string_from_enum(a1);
    if (!v4) {
      return (id)objc_msgSend(v3, "stringWithFormat:", @"0x%08x", a1);
    }
  }
  uint64_t v5 = (void *)[objc_alloc((Class)v3) initWithBytesNoCopy:v4 length:strlen(v4) encoding:1 freeWhenDone:0];
  return v5;
}

uint64_t dy_enum_from_string(const char *a1)
{
  int8x8_t v3 = a1;
  if (qword_269A12C60 == -1)
  {
    v1 = std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::find<char const*>((void *)_MergedGlobals, &v3);
    if (v1) {
      return *((unsigned int *)v1 + 6);
    }
  }
  else
  {
    dispatch_once(&qword_269A12C60, &__block_literal_global);
    v1 = std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::find<char const*>((void *)_MergedGlobals, &v3);
    if (v1) {
      return *((unsigned int *)v1 + 6);
    }
  }
  return 0xFFFFFFFFLL;
}

void __dy_enum_from_string_block_invoke()
{
}

void *std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__emplace_unique_key_args<char const*,std::pair<char const* const,unsigned int>>(uint64_t a1, const char **a2, _OWORD *a3)
{
  unsigned int v6 = -1640531527;
  uint64_t v7 = *a2;
  int v8 = *(unsigned __int8 *)*a2;
  if (**a2)
  {
    uint64_t v9 = (unsigned __int8 *)(v7 + 2);
    while (*(v9 - 1))
    {
      unsigned int v10 = ((v6 + v8) << 16) ^ (*(v9 - 1) << 11) ^ (v6 + v8);
      unsigned int v6 = v10 + (v10 >> 11);
      int v11 = *v9;
      v9 += 2;
      int v8 = v11;
      if (!v11) {
        goto LABEL_7;
      }
    }
    unsigned int v6 = ((v6 + v8) ^ ((v6 + v8) << 11)) + (((v6 + v8) ^ ((v6 + v8) << 11)) >> 17);
  }
LABEL_7:
  unsigned int v12 = (v6 ^ (8 * v6)) + ((v6 ^ (8 * v6)) >> 5);
  unsigned int v13 = (v12 ^ (4 * v12)) + ((v12 ^ (4 * v12)) >> 15);
  unsigned int v14 = v13 ^ (v13 << 10);
  if (v14) {
    unint64_t v15 = v14;
  }
  else {
    unint64_t v15 = 0x40000000;
  }
  unint64_t v16 = *(void *)(a1 + 8);
  if (v16)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)v16);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] > 1uLL)
    {
      unint64_t v3 = v15;
      if (v16 <= v15) {
        unint64_t v3 = v15 % v16;
      }
    }
    else
    {
      unint64_t v3 = (v16 - 1) & v15;
    }
    uint64_t v18 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v18)
    {
      v19 = *v18;
      if (*v18)
      {
        if (v17.u32[0] < 2uLL)
        {
          while (1)
          {
            uint64_t v21 = *((void *)v19 + 1);
            if (v21 == v15)
            {
              if (!strcmp(*((const char **)v19 + 2), v7)) {
                return v19;
              }
            }
            else if ((v21 & (v16 - 1)) != v3)
            {
              goto LABEL_32;
            }
            v19 = *(void **)v19;
            if (!v19) {
              goto LABEL_32;
            }
          }
        }
        do
        {
          unint64_t v20 = *((void *)v19 + 1);
          if (v20 == v15)
          {
            if (!strcmp(*((const char **)v19 + 2), v7)) {
              return v19;
            }
          }
          else
          {
            if (v20 >= v16) {
              v20 %= v16;
            }
            if (v20 != v3) {
              break;
            }
          }
          v19 = *(void **)v19;
        }
        while (v19);
      }
    }
  }
LABEL_32:
  v19 = operator new(0x20uLL);
  *(void *)v19 = 0;
  *((void *)v19 + 1) = v15;
  *((_OWORD *)v19 + 1) = *a3;
  float v22 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v23 = *(float *)(a1 + 32);
  if (v16 && (float)(v23 * (float)v16) >= v22)
  {
    unint64_t v15 = v3;
  }
  else
  {
    BOOL v24 = 1;
    if (v16 >= 3) {
      BOOL v24 = (v16 & (v16 - 1)) != 0;
    }
    unint64_t v25 = v24 | (2 * v16);
    unint64_t v26 = vcvtps_u32_f32(v22 / v23);
    if (v25 <= v26) {
      size_t prime = v26;
    }
    else {
      size_t prime = v25;
    }
    if (prime == 1)
    {
      size_t prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      size_t prime = std::__next_prime(prime);
      unint64_t v16 = *(void *)(a1 + 8);
    }
    if (prime > v16) {
      goto LABEL_45;
    }
    if (prime < v16)
    {
      unint64_t v28 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v16 < 3 || (uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v16), v29.i16[0] = vaddlv_u8(v29), v29.u32[0] > 1uLL))
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
      if (prime <= v28) {
        size_t prime = v28;
      }
      if (prime < v16) {
LABEL_45:
      }
        std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__do_rehash<true>(a1, prime);
    }
    unint64_t v16 = *(void *)(a1 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v16 <= v15) {
        v15 %= v16;
      }
    }
    else
    {
      unint64_t v15 = (v16 - 1) & v15;
    }
  }
  uint64_t v31 = *(void *)a1;
  v32 = *(void **)(*(void *)a1 + 8 * v15);
  if (v32)
  {
    *(void *)v19 = *v32;
LABEL_68:
    void *v32 = v19;
    goto LABEL_69;
  }
  *(void *)v19 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v19;
  *(void *)(v31 + 8 * v15) = a1 + 16;
  if (*(void *)v19)
  {
    unint64_t v33 = *(void *)(*(void *)v19 + 8);
    if ((v16 & (v16 - 1)) != 0)
    {
      if (v33 >= v16) {
        v33 %= v16;
      }
    }
    else
    {
      v33 &= v16 - 1;
    }
    v32 = (void *)(*(void *)a1 + 8 * v33);
    goto LABEL_68;
  }
LABEL_69:
  ++*(void *)(a1 + 24);
  return v19;
}

void sub_24F5DD6A0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (!a2)
  {
    unint64_t v15 = *(void **)a1;
    *(void *)a1 = 0;
    if (v15) {
      operator delete(v15);
    }
    *(void *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  size_t v4 = operator new(8 * a2);
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v6 = 0;
  *(void *)(a1 + 8) = a2;
  do
    *(void *)(*(void *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  uint64_t v8 = a1 + 16;
  uint64_t v7 = *(void **)(a1 + 16);
  if (v7)
  {
    unint64_t v9 = v7[1];
    unint64_t v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      uint64_t v11 = v9 & v10;
      *(void *)(*(void *)a1 + 8 * v11) = v8;
      while (1)
      {
        unsigned int v12 = (void *)*v7;
        if (!*v7) {
          break;
        }
        uint64_t v13 = v12[1] & v10;
        if (v13 == v11)
        {
          uint64_t v7 = (void *)*v7;
        }
        else if (*(void *)(*(void *)a1 + 8 * v13))
        {
          *uint64_t v7 = *v12;
          uint64_t v14 = 8 * v13;
          void *v12 = **(void **)(*(void *)a1 + v14);
          **(void **)(*(void *)a1 + v14) = v12;
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v13) = v7;
          uint64_t v7 = v12;
          uint64_t v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2) {
      v9 %= a2;
    }
    *(void *)(*(void *)a1 + 8 * v9) = v8;
    unint64_t v16 = (void *)*v7;
    if (*v7)
    {
      while (1)
      {
        unint64_t v18 = v16[1];
        if (v18 >= a2) {
          v18 %= a2;
        }
        if (v18 == v9) {
          goto LABEL_25;
        }
        if (*(void *)(*(void *)a1 + 8 * v18))
        {
          *uint64_t v7 = *v16;
          uint64_t v17 = 8 * v18;
          *unint64_t v16 = **(void **)(*(void *)a1 + v17);
          **(void **)(*(void *)a1 + v17) = v16;
          unint64_t v16 = v7;
LABEL_25:
          uint64_t v7 = v16;
          unint64_t v16 = (void *)*v16;
          if (!v16) {
            return;
          }
        }
        else
        {
          *(void *)(*(void *)a1 + 8 * v18) = v7;
          uint64_t v7 = v16;
          unint64_t v16 = (void *)*v16;
          unint64_t v9 = v18;
          if (!v16) {
            return;
          }
        }
      }
    }
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<char const*,unsigned int>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,unsigned int>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,unsigned int>>>::find<char const*>(void *a1, const char **a2)
{
  unsigned int v2 = -1640531527;
  unint64_t v3 = *a2;
  int v4 = *(unsigned __int8 *)*a2;
  if (**a2)
  {
    uint64_t v5 = (unsigned __int8 *)(v3 + 2);
    while (*(v5 - 1))
    {
      unsigned int v6 = ((v2 + v4) << 16) ^ (*(v5 - 1) << 11) ^ (v2 + v4);
      unsigned int v2 = v6 + (v6 >> 11);
      int v7 = *v5;
      v5 += 2;
      int v4 = v7;
      if (!v7) {
        goto LABEL_7;
      }
    }
    unsigned int v2 = ((v2 + v4) ^ ((v2 + v4) << 11)) + (((v2 + v4) ^ ((v2 + v4) << 11)) >> 17);
  }
LABEL_7:
  unsigned int v8 = (v2 ^ (8 * v2)) + ((v2 ^ (8 * v2)) >> 5);
  unsigned int v9 = (v8 ^ (4 * v8)) + ((v8 ^ (4 * v8)) >> 15);
  unsigned int v10 = v9 ^ (v9 << 10);
  if (v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = 0x40000000;
  }
  int8x8_t v12 = (int8x8_t)a1[1];
  if (!*(void *)&v12) {
    return 0;
  }
  uint8x8_t v13 = (uint8x8_t)vcnt_s8(v12);
  v13.i16[0] = vaddlv_u8(v13);
  if (v13.u32[0] > 1uLL)
  {
    unint64_t v14 = v11;
    if (*(void *)&v12 <= v11) {
      unint64_t v14 = v11 % *(void *)&v12;
    }
  }
  else
  {
    unint64_t v14 = (v12.i32[0] - 1) & v11;
  }
  unint64_t v16 = *(uint64_t ****)(*a1 + 8 * v14);
  if (!v16) {
    return 0;
  }
  unint64_t v15 = *v16;
  if (*v16)
  {
    if (v13.u32[0] < 2uLL)
    {
      uint64_t v17 = *(void *)&v12 - 1;
      while (1)
      {
        v19 = v15[1];
        if (v19 == (uint64_t *)v11)
        {
          if (!strcmp((const char *)v15[2], v3)) {
            return v15;
          }
        }
        else if (((unint64_t)v19 & v17) != v14)
        {
          return 0;
        }
        unint64_t v15 = (uint64_t **)*v15;
        if (!v15) {
          return v15;
        }
      }
    }
    do
    {
      unint64_t v18 = (unint64_t)v15[1];
      if (v18 == v11)
      {
        if (!strcmp((const char *)v15[2], v3)) {
          return v15;
        }
      }
      else
      {
        if (v18 >= *(void *)&v12) {
          v18 %= *(void *)&v12;
        }
        if (v18 != v14) {
          return 0;
        }
      }
      unint64_t v15 = (uint64_t **)*v15;
    }
    while (v15);
  }
  return v15;
}

uint64_t GPUTools::GL::DYGetParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  if ((int)this > 33306)
  {
    if ((int)this > 35367)
    {
      if ((int)this <= 35967)
      {
        uint64_t v6 = (this - 35368);
        if (v6 > 0x2A) {
          goto LABEL_13;
        }
        if (((1 << (this - 40)) & 0x1BEF) != 0) {
          goto LABEL_38;
        }
        if (v6 != 42)
        {
LABEL_13:
          switch((int)this)
          {
            case 35723:
            case 35738:
            case 35739:
            case 35740:
              break;
            default:
              goto LABEL_38;
          }
        }
      }
      else
      {
        if ((int)this <= 36202)
        {
          switch((int)this)
          {
            case 35968:
            case 35969:
            case 35970:
            case 35971:
            case 35972:
            case 35973:
            case 35974:
            case 35975:
            case 35976:
            case 35978:
            case 35979:
            case 35980:
            case 35981:
            case 35982:
            case 35983:
            case 35984:
            case 35985:
            case 35986:
            case 35987:
            case 35988:
            case 35989:
            case 35990:
            case 35991:
            case 35992:
            case 35993:
            case 35994:
            case 35995:
            case 35996:
            case 35997:
            case 35998:
            case 35999:
            case 36000:
            case 36001:
            case 36002:
            case 36003:
            case 36004:
            case 36005:
            case 36006:
            case 36007:
            case 36008:
            case 36009:
            case 36010:
            case 36011:
            case 36012:
            case 36013:
            case 36014:
            case 36015:
            case 36016:
            case 36017:
            case 36018:
            case 36019:
            case 36020:
            case 36021:
            case 36022:
            case 36023:
            case 36024:
            case 36025:
            case 36026:
            case 36027:
            case 36028:
            case 36029:
            case 36030:
            case 36031:
            case 36032:
            case 36033:
            case 36034:
            case 36035:
            case 36036:
            case 36037:
            case 36038:
            case 36039:
            case 36040:
            case 36041:
            case 36042:
            case 36043:
            case 36044:
            case 36045:
            case 36046:
            case 36047:
            case 36048:
            case 36049:
            case 36050:
            case 36051:
            case 36052:
            case 36053:
            case 36054:
            case 36055:
            case 36056:
            case 36057:
            case 36058:
            case 36059:
            case 36060:
            case 36061:
            case 36062:
            case 36063:
              goto LABEL_38;
            case 35977:
              goto LABEL_26;
            default:
              if (this != 36201) {
                goto LABEL_38;
              }
              goto LABEL_26;
          }
        }
        if ((int)this > 36661) {
          goto LABEL_38;
        }
        char v8 = this + 8;
        if ((this - 36344) > 0x30
          || ((1 << v8) & 0x120000000003ALL) != 0
          || ((1 << v8) & 0x180000000005) == 0)
        {
          goto LABEL_38;
        }
      }
    }
    else
    {
      if ((int)this > 34465)
      {
        switch((int)this)
        {
          case 34815:
          case 34816:
          case 34817:
          case 34818:
          case 34819:
          case 34853:
          case 34854:
          case 34855:
          case 34856:
          case 34857:
          case 34858:
          case 34859:
          case 34860:
          case 34861:
          case 34862:
          case 34863:
          case 34864:
          case 34865:
          case 34866:
          case 34867:
          case 34868:
          case 34877:
          case 34913:
          case 35210:
            goto LABEL_26;
          default:
            goto LABEL_38;
        }
      }
      if ((int)this <= 34015)
      {
        if (((this - 33307) > 0x3F || ((1 << (this - 27)) & 0x8000000000000007) == 0)
          && (this - 33901) < 2)
        {
LABEL_33:
          char v4 = 0;
          int v5 = 2;
          goto LABEL_39;
        }
        goto LABEL_38;
      }
      char v7 = this + 32;
      if ((this - 34016) > 0x3C || ((1 << v7) & 0x10100000A0000104) != 0 || ((1 << v7) & 3) == 0)
      {
LABEL_38:
        char v4 = 0;
        int v5 = 1;
        goto LABEL_39;
      }
    }
LABEL_26:
    int v5 = 1;
    char v4 = 1;
    goto LABEL_39;
  }
  if ((int)this >= 12288)
  {
    switch((int)this)
    {
      case 32773:
LABEL_4:
        char v4 = 0;
        int v5 = 4;
        break;
      case 32774:
      case 32775:
      case 32776:
      case 32778:
      case 32779:
      case 32780:
      case 32781:
      case 32782:
      case 32783:
      case 32784:
      case 32785:
      case 32786:
      case 32787:
      case 32788:
      case 32789:
      case 32790:
      case 32791:
      case 32792:
      case 32793:
      case 32794:
      case 32795:
      case 32796:
      case 32797:
      case 32798:
      case 32799:
      case 32800:
      case 32801:
      case 32802:
      case 32803:
      case 32804:
      case 32805:
      case 32806:
      case 32807:
      case 32808:
      case 32809:
      case 32810:
      case 32811:
      case 32812:
      case 32813:
      case 32814:
      case 32815:
      case 32816:
      case 32817:
      case 32818:
      case 32819:
      case 32820:
      case 32821:
      case 32822:
      case 32824:
      case 32825:
      case 32827:
      case 32828:
      case 32829:
      case 32830:
      case 32831:
      case 32832:
      case 32833:
      case 32834:
      case 32835:
      case 32836:
      case 32837:
      case 32838:
      case 32839:
      case 32840:
      case 32841:
      case 32842:
      case 32843:
      case 32844:
      case 32845:
      case 32846:
      case 32847:
      case 32848:
      case 32849:
      case 32850:
      case 32851:
      case 32852:
      case 32853:
      case 32854:
      case 32855:
      case 32856:
      case 32857:
      case 32858:
      case 32859:
      case 32860:
      case 32861:
      case 32862:
      case 32863:
      case 32864:
      case 32865:
      case 32866:
      case 32867:
      case 32868:
      case 32869:
      case 32870:
      case 32871:
      case 32872:
      case 32873:
      case 32874:
      case 32875:
      case 32876:
      case 32877:
      case 32878:
      case 32879:
      case 32880:
      case 32881:
      case 32882:
      case 32883:
      case 32887:
      case 32889:
      case 32890:
      case 32892:
      case 32893:
      case 32895:
      case 32896:
      case 32897:
      case 32899:
      case 32900:
      case 32901:
      case 32902:
      case 32903:
      case 32904:
      case 32906:
      case 32907:
      case 32908:
      case 32909:
      case 32910:
      case 32911:
      case 32912:
      case 32913:
      case 32914:
      case 32915:
      case 32916:
      case 32917:
      case 32918:
      case 32919:
      case 32920:
      case 32921:
      case 32922:
      case 32923:
      case 32924:
      case 32929:
      case 32930:
      case 32931:
      case 32932:
      case 32933:
      case 32934:
      case 32935:
      case 32936:
      case 32937:
      case 32938:
      case 32940:
      case 32941:
      case 32942:
      case 32943:
      case 32944:
      case 32945:
      case 32946:
      case 32947:
      case 32948:
      case 32949:
      case 32950:
      case 32951:
      case 32952:
      case 32953:
      case 32954:
      case 32955:
      case 32956:
      case 32957:
      case 32958:
      case 32959:
      case 32960:
      case 32961:
      case 32962:
      case 32963:
      case 32964:
      case 32965:
      case 32966:
      case 32967:
      case 32972:
      case 32973:
      case 32974:
      case 32975:
      case 32976:
      case 32977:
      case 32978:
      case 32979:
      case 32980:
      case 32981:
      case 32982:
      case 32983:
      case 32984:
      case 32985:
      case 32986:
      case 32987:
      case 32988:
      case 32989:
      case 32990:
      case 32991:
      case 32992:
      case 32993:
      case 32994:
      case 32995:
      case 32996:
      case 32997:
      case 32998:
      case 32999:
      case 33000:
      case 33001:
      case 33002:
      case 33003:
      case 33004:
      case 33005:
      case 33006:
      case 33007:
      case 33008:
      case 33009:
      case 33010:
      case 33011:
      case 33012:
      case 33013:
      case 33014:
      case 33015:
      case 33016:
      case 33017:
      case 33018:
      case 33019:
      case 33020:
      case 33021:
      case 33022:
      case 33023:
      case 33024:
      case 33025:
      case 33026:
      case 33027:
      case 33028:
      case 33029:
      case 33030:
      case 33031:
      case 33032:
      case 33033:
      case 33034:
      case 33035:
      case 33036:
      case 33037:
      case 33038:
      case 33039:
      case 33040:
      case 33041:
      case 33042:
      case 33043:
      case 33044:
      case 33045:
      case 33046:
      case 33047:
      case 33048:
      case 33049:
      case 33050:
      case 33051:
      case 33052:
      case 33053:
      case 33054:
      case 33055:
      case 33056:
      case 33057:
      case 33058:
      case 33059:
      case 33060:
      case 33061:
      case 33062:
      case 33063:
      case 33064:
      case 33065:
      case 33066:
      case 33067:
      case 33068:
      case 33069:
      case 33070:
      case 33071:
      case 33072:
      case 33073:
      case 33074:
      case 33075:
      case 33076:
      case 33077:
      case 33078:
      case 33079:
      case 33080:
      case 33081:
      case 33082:
      case 33083:
      case 33084:
      case 33085:
      case 33086:
      case 33087:
      case 33088:
      case 33089:
      case 33090:
      case 33091:
      case 33092:
      case 33093:
      case 33094:
      case 33095:
      case 33096:
      case 33097:
      case 33098:
      case 33099:
      case 33100:
      case 33101:
      case 33102:
      case 33103:
      case 33104:
      case 33105:
      case 33106:
      case 33107:
      case 33108:
      case 33109:
      case 33110:
      case 33111:
      case 33112:
      case 33113:
      case 33114:
      case 33115:
      case 33116:
      case 33117:
      case 33118:
      case 33119:
      case 33120:
      case 33121:
      case 33122:
      case 33123:
      case 33124:
      case 33125:
      case 33126:
      case 33127:
      case 33128:
      case 33129:
      case 33130:
      case 33131:
      case 33132:
      case 33133:
      case 33134:
      case 33135:
      case 33136:
      case 33137:
      case 33138:
      case 33139:
      case 33140:
      case 33141:
      case 33142:
      case 33143:
      case 33144:
      case 33145:
      case 33146:
      case 33147:
      case 33148:
      case 33149:
      case 33150:
      case 33151:
      case 33152:
      case 33153:
      case 33154:
      case 33155:
      case 33156:
      case 33157:
      case 33158:
      case 33159:
      case 33160:
      case 33161:
      case 33162:
      case 33163:
      case 33164:
      case 33165:
      case 33166:
      case 33167:
      case 33168:
      case 33169:
        goto LABEL_38;
      case 32777:
      case 32823:
      case 32826:
      case 32884:
      case 32885:
      case 32886:
      case 32888:
      case 32891:
      case 32894:
      case 32898:
      case 32905:
      case 32925:
      case 32926:
      case 32927:
      case 32928:
      case 32939:
      case 32968:
      case 32969:
      case 32970:
      case 32971:
      case 33170:
        goto LABEL_26;
      default:
        if ((this - 12288) >= 8 && (this - 0x4000) >= 8) {
          goto LABEL_38;
        }
        goto LABEL_26;
    }
  }
  else
  {
    char v4 = 0;
    int v5 = 16;
    switch((int)this)
    {
      case 2816:
      case 2819:
      case 2899:
      case 2918:
      case 2978:
      case 3088:
      case 3106:
      case 3107:
        goto LABEL_4;
      case 2818:
        char v4 = 0;
        int v5 = 3;
        break;
      case 2832:
      case 2848:
      case 2849:
      case 2884:
      case 2885:
      case 2886:
      case 2896:
      case 2898:
      case 2900:
      case 2903:
      case 2912:
      case 2917:
      case 2929:
      case 2930:
      case 2932:
      case 2960:
      case 2962:
      case 2964:
      case 2965:
      case 2966:
      case 2976:
      case 2977:
      case 3008:
      case 3009:
      case 3024:
      case 3040:
      case 3041:
      case 3042:
      case 3056:
      case 3058:
      case 3074:
      case 3089:
      case 3152:
      case 3153:
      case 3154:
      case 3156:
      case 3553:
        goto LABEL_26;
      case 2834:
      case 2850:
      case 2928:
      case 3386:
        goto LABEL_33;
      case 2982:
      case 2983:
      case 2984:
        break;
      default:
        goto LABEL_38;
    }
  }
LABEL_39:
  if (a2) {
    *a2 = v5;
  }
  if (a3) {
    *(unsigned char *)a3 = v4;
  }
  return this;
}

uint64_t GPUTools::GL::dy_light_model_param_component_count(GPUTools::GL *this)
{
  if ((this - 2897) >= 2 && this == 2899) {
    return 4;
  }
  else {
    return 1;
  }
}

uint64_t GPUTools::GL::dy_light_array_size(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 1;
  if (v1 <= 4611)
  {
    if ((v1 - 4608) >= 4) {
      return result;
    }
    return 4;
  }
  if (v1 > 5633)
  {
    if (v1 == 5634) {
      return 4;
    }
    if (v1 != 5635) {
      return result;
    }
    return 3;
  }
  if (v1 == 4612) {
    return 3;
  }
  if (v1 == 5632) {
    return 4;
  }
  return result;
}

uint64_t GPUTools::GL::dy_fog_param_component_count(GPUTools::GL *this)
{
  if ((this - 2913) < 5) {
    return 1;
  }
  if (this == 2918) {
    return 4;
  }
  return 1;
}

uint64_t GPUTools::GL::DYMaterialParameterComponentCount(GPUTools::GL *this)
{
  int v3 = (int)this;
  uint64_t result = 4;
  if (!v2 & v1)
  {
    if ((v3 - 4608) >= 3) {
      return 1;
    }
    else {
      return 4;
    }
  }
  else
  {
    switch(v3)
    {
      case 5632:
      case 5634:
        return result;
      case 5633:
        uint64_t result = 1;
        break;
      case 5635:
        uint64_t result = 3;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

double GPUTools::GL::DYGetTextureTargetInfo(int a1, uint64_t a2)
{
  if (!a2) {
    __assert_rtn("void GPUTools::GL::DYGetTextureTargetInfo(GLenum, TextureTargetInfo *)", (const char *)&unk_24F5F0846, 0, "info");
  }
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  if (a1 > 34036)
  {
    switch(a1)
    {
      case 34037:
        goto LABEL_28;
      case 34038:
      case 34040:
      case 34041:
      case 34042:
      case 34043:
      case 34044:
      case 34045:
      case 34046:
      case 34047:
      case 34048:
      case 34049:
      case 34050:
      case 34051:
      case 34052:
      case 34053:
      case 34054:
      case 34055:
      case 34056:
      case 34057:
      case 34058:
      case 34059:
      case 34060:
      case 34061:
      case 34062:
      case 34063:
      case 34064:
      case 34065:
      case 34066:
      case 34068:
        goto LABEL_24;
      case 34039:
        *(unsigned char *)(a2 + 13) = 1;
LABEL_28:
        *(void *)&double result = 0x84F6000084F8;
        goto LABEL_26;
      case 34067:
        goto LABEL_11;
      case 34069:
      case 34070:
      case 34071:
      case 34072:
      case 34073:
      case 34074:
        int v3 = (unsigned char *)(a2 + 11);
        goto LABEL_10;
      case 34075:
        int v3 = (unsigned char *)(a2 + 13);
LABEL_10:
        unsigned char *v3 = 1;
LABEL_11:
        *(void *)&double result = 0x85140000851CLL;
        goto LABEL_26;
      default:
        switch(a1)
        {
          case 35864:
            goto LABEL_17;
          case 35865:
            *(unsigned char *)(a2 + 13) = 1;
LABEL_17:
            *(void *)&double result = 0x8C1C00000D33;
            *(void *)a2 = 0x8C1C00000D33;
            *(_WORD *)(a2 + 8) = 258;
            *(unsigned char *)(a2 + 10) = 1;
            *(unsigned char *)(a2 + 14) = 1;
            return result;
          case 35866:
            goto LABEL_31;
          case 35867:
            *(unsigned char *)(a2 + 13) = 1;
LABEL_31:
            *(void *)&double result = 0x8C1D00000D33;
            *(void *)a2 = 0x8C1D00000D33;
            *(_WORD *)(a2 + 8) = 259;
            *(unsigned char *)(a2 + 10) = 1;
            *(unsigned char *)(a2 + 14) = 1;
            break;
          case 35868:
          case 35869:
          case 35870:
          case 35871:
          case 35872:
          case 35873:
          case 35874:
          case 35875:
          case 35876:
          case 35877:
          case 35878:
          case 35879:
          case 35880:
          case 35881:
            goto LABEL_24;
          case 35882:
            *(void *)&double result = 0x8C2C00008C2BLL;
            *(void *)a2 = 0x8C2C00008C2BLL;
            *(unsigned char *)(a2 + 8) = 1;
            break;
          default:
            switch(a1)
            {
              case 37120:
                goto LABEL_23;
              case 37121:
                *(unsigned char *)(a2 + 13) = 1;
LABEL_23:
                *(void *)&double result = 0x910400000D33;
                *(void *)a2 = 0x910400000D33;
                *(unsigned char *)(a2 + 8) = 2;
                *(unsigned char *)(a2 + 12) = 1;
                return result;
              case 37122:
                goto LABEL_34;
              case 37123:
                *(unsigned char *)(a2 + 13) = 1;
LABEL_34:
                *(void *)&double result = 0x910500000D33;
                *(void *)a2 = 0x910500000D33;
                *(unsigned char *)(a2 + 8) = 3;
                *(unsigned char *)(a2 + 10) = 1;
                *(unsigned char *)(a2 + 12) = 1;
                break;
              default:
                goto LABEL_24;
            }
            break;
        }
        return result;
    }
  }
  if (a1 <= 32866)
  {
    if (a1 != 3552)
    {
      if (a1 == 3553) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
LABEL_19:
    *(void *)&double result = 0x806800000D33;
    *(void *)a2 = 0x806800000D33;
    *(_WORD *)(a2 + 8) = 257;
    *(unsigned char *)(a2 + 14) = 1;
    return result;
  }
  switch(a1)
  {
    case 32867:
      *(unsigned char *)(a2 + 13) = 1;
      goto LABEL_19;
    case 32868:
      *(unsigned char *)(a2 + 13) = 1;
      goto LABEL_25;
    case 32879:
      *(void *)&double result = 0x806A00008073;
      *(void *)a2 = 0x806A00008073;
      *(_WORD *)(a2 + 8) = 259;
      *(unsigned char *)(a2 + 14) = 1;
      return result;
  }
LABEL_24:
  *(void *)(a2 + 8) = 0;
LABEL_25:
  *(void *)&double result = 0x806900000D33;
LABEL_26:
  *(double *)a2 = result;
  *(_WORD *)(a2 + 8) = 258;
  *(unsigned char *)(a2 + 14) = 1;
  return result;
}

uint64_t GPUTools::GL::DYGetTextureParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  if ((int)this > 34229)
  {
    if ((int)this > 35740)
    {
      if ((int)this <= 36421)
      {
        if ((this - 36418) >= 4)
        {
          int v4 = 35741;
LABEL_17:
          if (this == v4)
          {
            char v5 = 0;
            int v6 = 4;
            if (!a2) {
              goto LABEL_34;
            }
LABEL_33:
            *a2 = v6;
            goto LABEL_34;
          }
          goto LABEL_27;
        }
LABEL_32:
        int v6 = 1;
        char v5 = 1;
        if (!a2) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }
      if (this == 36422)
      {
        char v5 = 1;
        int v6 = 4;
        if (a2) {
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      int v7 = 37167;
      goto LABEL_31;
    }
    if ((int)this <= 34890)
    {
      if (this == 34230) {
        goto LABEL_32;
      }
      if (this == 34231) {
        goto LABEL_27;
      }
      int v7 = 34236;
      goto LABEL_31;
    }
    if ((this - 34891) < 3
      || (this - 35400) <= 0x37 && ((1 << (this - 72)) & 0x80000000000009) != 0)
    {
      goto LABEL_32;
    }
  }
  else if ((int)this > 32958)
  {
    if ((int)this > 33168 && this == 33169) {
      goto LABEL_32;
    }
  }
  else
  {
    if ((int)this <= 10494)
    {
      if ((this - 10240) >= 4)
      {
        int v4 = 4100;
        goto LABEL_17;
      }
      goto LABEL_32;
    }
    if (this == 10495) {
      goto LABEL_32;
    }
    if (this != 32870)
    {
      int v7 = 32882;
LABEL_31:
      if (this == v7) {
        goto LABEL_32;
      }
    }
  }
LABEL_27:
  char v5 = 0;
  int v6 = 1;
  if (a2) {
    goto LABEL_33;
  }
LABEL_34:
  if (a3) {
    *(unsigned char *)a3 = v5;
  }
  return this;
}

uint64_t GPUTools::GL::DYGetTexEnvParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  if ((int)this > 9471)
  {
    switch((int)this)
    {
      case 34049:
      case 34050:
      case 34051:
      case 34052:
      case 34053:
      case 34054:
      case 34055:
      case 34056:
      case 34057:
      case 34058:
      case 34059:
      case 34060:
      case 34061:
      case 34062:
      case 34063:
      case 34064:
      case 34065:
      case 34066:
      case 34067:
      case 34068:
      case 34069:
      case 34070:
      case 34071:
      case 34072:
      case 34073:
      case 34074:
      case 34075:
      case 34076:
      case 34077:
      case 34078:
      case 34079:
      case 34080:
      case 34081:
      case 34082:
      case 34083:
      case 34084:
      case 34085:
      case 34086:
      case 34087:
      case 34088:
      case 34089:
      case 34090:
      case 34091:
      case 34092:
      case 34093:
      case 34094:
      case 34095:
      case 34096:
      case 34097:
      case 34098:
      case 34099:
      case 34100:
      case 34101:
      case 34102:
      case 34103:
      case 34104:
      case 34105:
      case 34106:
      case 34107:
      case 34108:
      case 34109:
      case 34110:
      case 34111:
      case 34112:
      case 34113:
      case 34114:
      case 34115:
      case 34116:
      case 34117:
      case 34118:
      case 34119:
      case 34120:
      case 34121:
      case 34122:
      case 34123:
      case 34124:
      case 34125:
      case 34126:
      case 34127:
      case 34128:
      case 34129:
      case 34130:
      case 34131:
      case 34132:
      case 34133:
      case 34134:
      case 34135:
      case 34136:
      case 34137:
      case 34138:
      case 34139:
      case 34140:
      case 34141:
      case 34142:
      case 34143:
      case 34144:
      case 34145:
      case 34146:
      case 34147:
      case 34148:
      case 34149:
      case 34150:
      case 34151:
      case 34152:
      case 34153:
      case 34154:
      case 34155:
      case 34156:
      case 34157:
      case 34158:
      case 34159:
      case 34160:
      case 34163:
      case 34164:
      case 34165:
      case 34166:
      case 34167:
      case 34168:
      case 34169:
      case 34170:
      case 34171:
      case 34172:
      case 34173:
      case 34174:
      case 34175:
      case 34179:
      case 34180:
      case 34181:
      case 34182:
      case 34183:
      case 34187:
      case 34188:
      case 34189:
      case 34190:
      case 34191:
      case 34195:
      case 34196:
      case 34197:
      case 34198:
      case 34199:
        goto LABEL_10;
      case 34161:
      case 34162:
      case 34176:
      case 34177:
      case 34178:
      case 34184:
      case 34185:
      case 34186:
      case 34192:
      case 34193:
      case 34194:
      case 34200:
      case 34201:
      case 34202:
        goto LABEL_3;
      default:
        if (this != 9472 && this != 34914) {
          goto LABEL_10;
        }
        goto LABEL_3;
    }
  }
  if (this == 3356) {
    goto LABEL_10;
  }
  if (this == 8704)
  {
LABEL_3:
    int v4 = 1;
    char v5 = 1;
    goto LABEL_11;
  }
  if (this != 8705)
  {
LABEL_10:
    char v5 = 0;
    int v4 = 1;
  }
  else
  {
    char v5 = 0;
    int v4 = 4;
  }
LABEL_11:
  if (a2) {
    *a2 = v4;
  }
  if (a3) {
    *(unsigned char *)a3 = v5;
  }
  return this;
}

uint64_t GPUTools::GL::DYTexGenParameterComponentCount(GPUTools::GL *this)
{
  if ((this - 9472) > 2) {
    return 1;
  }
  else {
    return dword_24F611F60[(int)this - 9472];
  }
}

uint64_t GPUTools::GL::DYGetProgramParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  char v4 = 0;
  if ((int)this > 35966)
  {
    if ((this - 36315) >= 2 && this != 35967) {
      goto LABEL_13;
    }
LABEL_12:
    char v4 = 1;
    goto LABEL_13;
  }
  if ((this - 35712) <= 3 && this != 35713 || this == 33367) {
    goto LABEL_12;
  }
LABEL_13:
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = v4;
  }
  return this;
}

uint64_t GPUTools::GL::DYShaderParameterComponentCount(GPUTools::GL *this)
{
  return 1;
}

void GPUTools::GL::DYGetProgramPipelineParameterInfo(GPUTools::GL *this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = 0;
  }
}

uint64_t GPUTools::GL::DYGetShaderVariableTypeInfo(uint64_t result, uint64_t a2)
{
  if (!a2) {
    __assert_rtn("void GPUTools::GL::DYGetShaderVariableTypeInfo(const GLenum, ShaderVariableTypeInfo *)", (const char *)&unk_24F5F0846, 0, "pVariableTypeInfo");
  }
  uint64_t v2 = 0x26200001406;
  uint64_t v3 = 0x100000001;
  int v4 = 1;
  if ((int)result <= 36287)
  {
    if ((int)result <= 35663)
    {
      switch(result)
      {
        case 0x1404:
LABEL_14:
          int32x2_t v7 = (int32x2_t)0x26400001404;
LABEL_15:
          *(_DWORD *)a2 = 1;
          *(int32x2_t *)(a2 + 4) = v7;
          *(void *)(a2 + 16) = 0x100000001;
          *(unsigned char *)(a2 + 12) = 0;
          return result;
        case 0x1405:
          unsigned int v8 = 614;
          break;
        case 0x140A:
          unsigned int v8 = 1010;
          break;
        default:
          goto LABEL_9;
      }
      int32x2_t v7 = vdup_n_s32(v8);
      v7.i32[0] = result;
      goto LABEL_15;
    }
    switch((int)result)
    {
      case 35664:
        uint64_t v5 = 0x26800001406;
        goto LABEL_31;
      case 35665:
        uint64_t v11 = 0x26E00001406;
        goto LABEL_33;
      case 35666:
        char v9 = 0;
        uint64_t v10 = 0x400000001;
        uint64_t v6 = 0x27400001406;
        goto LABEL_37;
      case 35667:
      case 35671:
        uint64_t v3 = 0x200000001;
        uint64_t v2 = 0x26A00001404;
        int v4 = 2;
        goto LABEL_9;
      case 35668:
      case 35672:
        uint64_t v11 = 0x27000001404;
        goto LABEL_33;
      case 35669:
      case 35673:
        char v9 = 0;
        uint64_t v10 = 0x400000001;
        uint64_t v6 = 0x27600001404;
        goto LABEL_37;
      case 35670:
      case 35677:
      case 35678:
      case 35679:
      case 35680:
      case 35681:
      case 35682:
      case 35683:
      case 35684:
        goto LABEL_14;
      case 35674:
        uint64_t v6 = 0x27A00001406;
LABEL_36:
        uint64_t v10 = 0x200000002;
        char v9 = 1;
        goto LABEL_37;
      case 35675:
        uint64_t v12 = 0x27D00001406;
LABEL_49:
        *(_DWORD *)a2 = 9;
        *(void *)(a2 + 4) = v12;
        *(void *)(a2 + 16) = 0x300000003;
        *(unsigned char *)(a2 + 12) = 1;
        return result;
      case 35676:
        uint64_t v13 = 0x28000001406;
LABEL_51:
        *(_DWORD *)a2 = 16;
        *(void *)(a2 + 4) = v13;
        *(void *)(a2 + 16) = 0x400000004;
        *(unsigned char *)(a2 + 12) = 1;
        return result;
      case 35685:
        uint64_t v14 = 0x200000003;
        uint64_t v15 = 0x27B00001406;
        goto LABEL_55;
      case 35686:
        uint64_t v16 = 0x200000004;
        uint64_t v17 = 0x27C00001406;
        goto LABEL_58;
      case 35687:
        uint64_t v14 = 0x300000002;
        uint64_t v15 = 0x27E00001406;
LABEL_55:
        *(_DWORD *)a2 = 6;
        *(void *)(a2 + 4) = v15;
        *(void *)(a2 + 16) = v14;
        *(unsigned char *)(a2 + 12) = 1;
        return result;
      case 35688:
        uint64_t v18 = 0x300000004;
        uint64_t v19 = 0x27F00001406;
        goto LABEL_60;
      case 35689:
        uint64_t v16 = 0x400000002;
        uint64_t v17 = 0x28100001406;
LABEL_58:
        *(_DWORD *)a2 = 8;
        *(void *)(a2 + 4) = v17;
        *(void *)(a2 + 16) = v16;
        *(unsigned char *)(a2 + 12) = 1;
        return result;
      case 35690:
        uint64_t v18 = 0x400000003;
        uint64_t v19 = 0x28200001406;
LABEL_60:
        *(_DWORD *)a2 = 12;
        *(void *)(a2 + 4) = v19;
        *(void *)(a2 + 16) = v18;
        *(unsigned char *)(a2 + 12) = 1;
        break;
      default:
        goto LABEL_9;
    }
  }
  else
  {
    if ((int)result <= 36677)
    {
      switch((int)result)
      {
        case 36288:
        case 36289:
        case 36290:
        case 36291:
        case 36292:
        case 36293:
        case 36297:
        case 36298:
        case 36299:
        case 36300:
        case 36301:
        case 36302:
        case 36303:
        case 36304:
        case 36305:
        case 36306:
        case 36307:
        case 36308:
        case 36309:
        case 36310:
        case 36311:
        case 36312:
          goto LABEL_14;
        case 36294:
          uint64_t v5 = 0x26C00001405;
          goto LABEL_31;
        case 36295:
          uint64_t v11 = 0x27200001405;
          goto LABEL_33;
        case 36296:
          char v9 = 0;
          uint64_t v10 = 0x400000001;
          uint64_t v6 = 0x27800001405;
          goto LABEL_37;
        default:
          goto LABEL_9;
      }
    }
    if ((int)result <= 36860)
    {
      switch((int)result)
      {
        case 36678:
          uint64_t v6 = 0x3F90000140ALL;
          goto LABEL_36;
        case 36679:
          uint64_t v12 = 0x3FC0000140ALL;
          goto LABEL_49;
        case 36680:
          uint64_t v13 = 0x3FF0000140ALL;
          goto LABEL_51;
        case 36681:
          uint64_t v14 = 0x200000003;
          uint64_t v15 = 0x3FA0000140ALL;
          goto LABEL_55;
        case 36682:
          uint64_t v16 = 0x200000004;
          uint64_t v17 = 0x3FB0000140ALL;
          goto LABEL_58;
        case 36683:
          uint64_t v14 = 0x300000002;
          uint64_t v15 = 0x3FD0000140ALL;
          goto LABEL_55;
        case 36684:
          uint64_t v18 = 0x300000004;
          uint64_t v19 = 0x3FE0000140ALL;
          goto LABEL_60;
        case 36685:
          uint64_t v16 = 0x400000002;
          uint64_t v17 = 0x4000000140ALL;
          goto LABEL_58;
        case 36686:
          uint64_t v18 = 0x400000003;
          uint64_t v19 = 0x4010000140ALL;
          goto LABEL_60;
        default:
          if (result != 36860) {
            goto LABEL_9;
          }
          uint64_t v5 = 0x3F40000140ALL;
          break;
      }
LABEL_31:
      *(_DWORD *)a2 = 2;
      *(void *)(a2 + 4) = v5;
      *(void *)(a2 + 16) = 0x200000001;
      *(unsigned char *)(a2 + 12) = 0;
      return result;
    }
    if ((result - 37128) < 6) {
      goto LABEL_14;
    }
    if (result != 36861)
    {
      if (result == 36862)
      {
        char v9 = 0;
        uint64_t v10 = 0x400000001;
        uint64_t v6 = 0x3F80000140ALL;
LABEL_37:
        *(_DWORD *)a2 = 4;
        *(void *)(a2 + 4) = v6;
        *(void *)(a2 + 16) = v10;
        *(unsigned char *)(a2 + 12) = v9;
        return result;
      }
LABEL_9:
      *(_DWORD *)a2 = v4;
      *(void *)(a2 + 4) = v2;
      *(void *)(a2 + 16) = v3;
      *(unsigned char *)(a2 + 12) = 0;
      return result;
    }
    uint64_t v11 = 0x3F60000140ALL;
LABEL_33:
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 4) = v11;
    *(void *)(a2 + 16) = 0x300000001;
    *(unsigned char *)(a2 + 12) = 0;
  }
  return result;
}

uint64_t GPUTools::GL::DYGetVertexAttribParameterInfo(uint64_t this, int *a2, unsigned int *a3, BOOL *a4)
{
  int v4 = 1;
  if ((int)this > 34921)
  {
    if ((int)this > 35068)
    {
      char v5 = 1;
      if (this == 35069) {
        goto LABEL_9;
      }
    }
    else
    {
      char v5 = 1;
      if (this == 34922) {
        goto LABEL_9;
      }
    }
LABEL_8:
    char v5 = 0;
    int v4 = 1;
  }
  else
  {
    char v5 = 1;
    switch((int)this)
    {
      case 34338:
      case 34341:
        break;
      case 34342:
        char v5 = 0;
        int v4 = 4;
        break;
      default:
        goto LABEL_8;
    }
  }
LABEL_9:
  if (a2) {
    *a2 = v4;
  }
  if (a3) {
    *(unsigned char *)a3 = v5;
  }
  return this;
}

uint64_t GPUTools::GL::DYGetActiveUniformParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = this == 35383;
  }
  return this;
}

uint64_t GPUTools::GL::DYGetActiveUniformBlockParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = (this & 0xFFFFFFFD) == 35396;
  }
  return this;
}

uint64_t GPUTools::GL::DYGetShaderTypeFromMask(GPUTools::GL *this)
{
  int v1 = this - 1;
  uint64_t result = 35633;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 35632;
      break;
    case 3:
      uint64_t result = 36313;
      break;
    case 7:
      uint64_t result = 36488;
      break;
    case 15:
      uint64_t result = 36487;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t GPUTools::GL::DYGetRenderbufferParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if ((this - 36162) > 0x13 || (char v4 = 1, ((1 << (this - 66)) & 0xFC003) != 0) || this != 36164) {
    char v4 = 0;
  }
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = v4;
  }
  return this;
}

uint64_t GPUTools::GL::DYGetFramebufferAttachmentParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  char v4 = 1;
  if ((int)this > 36047)
  {
    if ((this - 36048) > 4 || ((1 << (this + 48)) & 0x16) != 0) {
      goto LABEL_7;
    }
  }
  else if ((this - 33298) < 6 || (this - 33296) >= 2)
  {
LABEL_7:
    char v4 = 0;
  }
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = v4;
  }
  return this;
}

uint64_t GPUTools::GL::GetFramebufferAttachmentMaskInfo(GPUTools::GL *this)
{
  uint64_t v1 = 2930;
  uint64_t v2 = 3107;
  if (this == 36128) {
    uint64_t v2 = 2968;
  }
  if (this != 36096) {
    uint64_t v1 = v2;
  }
  if (this == 33306)
  {
    uint64_t v1 = 2930;
    uint64_t v3 = 0xB9800000000;
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3 | v1;
}

uint64_t GPUTools::GL::DYGetFramebufferAttachment(GPUTools::GL *this, int a2)
{
  if ((int)this > 6145)
  {
    if (this != 6146)
    {
      if (this == 34041) {
        return 33306;
      }
      return 36064;
    }
    return 36128;
  }
  else
  {
    if (this != 6144)
    {
      if (this == 6145) {
        return 36096;
      }
      return 36064;
    }
    return (a2 + 36064);
  }
}

uint64_t GPUTools::GL::DYGetBufferParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  BOOL v5 = (this - 35003) < 2 || this == 34661;
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = v5;
  }
  return this;
}

void GPUTools::GL::DYGetQueryParameterInfo(GPUTools::GL *this, unsigned int a2, _DWORD *a3, unsigned int *a4, BOOL *a5)
{
  if (a3) {
    *a3 = 1;
  }
  if (a4) {
    *(unsigned char *)a4 = 0;
  }
}

uint64_t GPUTools::GL::DYGetQueryObjectParameterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = this == 34919;
  }
  return this;
}

int *GPUTools::GL::GetInternalFormatInfo(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = &GPUTools::GL::sInternalFormatsTable;
  uint64_t v3 = 6660;
  while (*result != v1)
  {
    result += 15;
    v3 -= 60;
    if (!v3) {
      return (int *)&GPUTools::GL::sUnknownFormat;
    }
  }
  return result;
}

uint64_t GPUTools::GL::EnumerateInternalFormats(uint64_t a1)
{
  char v7 = 0;
  uint64_t v2 = &GPUTools::GL::sInternalFormatsTable;
  uint64_t v3 = 6600;
  do
  {
    uint64_t v4 = *(void *)(a1 + 24);
    if (!v4) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, int *, char *))(*(void *)v4 + 48))(v4, v2, &v7);
    v2 += 15;
    if (v7) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 0;
    }
    v3 -= 60;
  }
  while (!v6);
  return result;
}

{
  int *v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;
  char v6;

  BOOL v6 = 0;
  uint64_t v2 = &GPUTools::GL::sInternalFormatsTable;
  uint64_t v3 = 6600;
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, int *, char *))(a1 + 16))(a1, v2, &v6);
    v2 += 15;
    if (v6) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
    v3 -= 60;
  }
  while (!v5);
  return result;
}

uint64_t GPUTools::GL::EnumerateCompressedFormats(uint64_t a1)
{
  char v7 = 0;
  uint64_t v2 = (char *)&GPUTools::GL::sCompressedFormatsTable;
  uint64_t v3 = 4920;
  do
  {
    uint64_t v4 = *(void *)(a1 + 24);
    if (!v4) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, char *))(*(void *)v4 + 48))(v4, v2, &v7);
    v2 += 60;
    if (v7) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = v3 == 0;
    }
    v3 -= 60;
  }
  while (!v6);
  return result;
}

{
  char *v2;
  uint64_t v3;
  uint64_t result;
  BOOL v5;
  char v6;

  BOOL v6 = 0;
  uint64_t v2 = (char *)&GPUTools::GL::sCompressedFormatsTable;
  uint64_t v3 = 4920;
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, char *))(a1 + 16))(a1, v2, &v6);
    v2 += 60;
    if (v6) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v3 == 0;
    }
    v3 -= 60;
  }
  while (!v5);
  return result;
}

uint64_t GPUTools::GL::GetInternalFormatComponentsInfo@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, uint8x8_t a3@<D0>)
{
  unsigned int v3 = *(_DWORD *)(result + 8);
  *(void *)a2 = v3;
  if (v3)
  {
    a3.i32[0] = *(_DWORD *)(result + 44);
    LOBYTE(v4) = vmaxv_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a3));
LABEL_10:
    *(_DWORD *)(a2 + 4) = v4;
    goto LABEL_11;
  }
  int v5 = *(_DWORD *)(result + 36);
  *(_DWORD *)a2 = v5;
  if (v5)
  {
    unsigned int v4 = *(unsigned __int8 *)(result + 51);
    if (v4 <= *(unsigned __int8 *)(result + 47)) {
      LOBYTE(v4) = *(unsigned char *)(result + 47);
    }
    goto LABEL_10;
  }
  int v6 = *(_DWORD *)(result + 40);
  *(_DWORD *)a2 = v6;
  if (v6)
  {
    LOBYTE(v4) = *(unsigned char *)(result + 52);
    goto LABEL_10;
  }
  int v7 = *(_DWORD *)(result + 20);
  *(_DWORD *)a2 = v7;
  if (v7)
  {
    LOBYTE(v4) = *(unsigned char *)(result + 47);
    goto LABEL_10;
  }
LABEL_11:
  int v8 = *(unsigned __int8 *)(result + 49);
  int v9 = *(_DWORD *)(result + 32);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 28);
  *(_DWORD *)(a2 + 12) = v8;
  int v10 = *(unsigned __int8 *)(result + 50);
  *(_DWORD *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 20) = v10;
  return result;
}

unint64_t GPUTools::GL::GetFirstValidComponentInfo(void *a1)
{
  if (*(_DWORD *)a1) {
    return *a1 | *a1 & 0xFFFFFFFF00000000;
  }
  if (*((_DWORD *)a1 + 2)) {
    return a1[1] | a1[1] & 0xFFFFFFFF00000000;
  }
  if (*((_DWORD *)a1 + 4)) {
    return a1[2] | a1[2] & 0xFFFFFFFF00000000;
  }
  return 0;
}

uint64_t GPUTools::GL::GetImageUploadFormatInfo(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t v2 = this;
  if (GPUTools::GL::IsCompressedFormat(this)) {
    return v2;
  }
  unsigned int v3 = &GPUTools::GL::sInternalFormatsTable;
  uint64_t v4 = 6660;
  while (*v3 != v1)
  {
    v3 += 15;
    v4 -= 60;
    if (!v4) {
      return v2;
    }
  }
  if (!v1) {
    return v2;
  }
  else {
    return ((uint64_t (*)(void))GPUTools::GL::GetImageUploadFormatInfo)();
  }
}

uint64_t GPUTools::GL::IsCompressedFormat(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 1;
  if (v1 <= 36282)
  {
    if (v1 <= 35727)
    {
      if ((v1 - 35412) <= 0x23 && ((1 << (v1 - 84)) & 0xC00000F0FLL) != 0
        || (v1 - 33777) < 3)
      {
        return result;
      }
    }
    else if ((v1 - 35728) < 0xA || (v1 - 35840) < 4 || (v1 - 35917) < 3)
    {
      return result;
    }
    return 0;
  }
  switch(v1)
  {
    case 37488:
    case 37489:
    case 37490:
    case 37491:
    case 37492:
    case 37493:
    case 37494:
    case 37495:
    case 37496:
    case 37497:
    case 37808:
    case 37809:
    case 37810:
    case 37811:
    case 37812:
    case 37813:
    case 37814:
    case 37815:
    case 37816:
    case 37817:
    case 37818:
    case 37819:
    case 37820:
    case 37821:
    case 37840:
    case 37841:
    case 37842:
    case 37843:
    case 37844:
    case 37845:
    case 37846:
    case 37847:
    case 37848:
    case 37849:
    case 37850:
    case 37851:
    case 37852:
    case 37853:
    case 37874:
    case 37886:
    case 37887:
    case 37888:
    case 37889:
    case 37890:
    case 37891:
    case 37892:
    case 37893:
    case 37894:
    case 37895:
    case 37896:
    case 37897:
    case 37898:
    case 37899:
    case 37900:
    case 37901:
      return result;
    case 37498:
    case 37499:
    case 37500:
    case 37501:
    case 37502:
    case 37503:
    case 37504:
    case 37505:
    case 37506:
    case 37507:
    case 37508:
    case 37509:
    case 37510:
    case 37511:
    case 37512:
    case 37513:
    case 37514:
    case 37515:
    case 37516:
    case 37517:
    case 37518:
    case 37519:
    case 37520:
    case 37521:
    case 37522:
    case 37523:
    case 37524:
    case 37525:
    case 37526:
    case 37527:
    case 37528:
    case 37529:
    case 37530:
    case 37531:
    case 37532:
    case 37533:
    case 37534:
    case 37535:
    case 37536:
    case 37537:
    case 37538:
    case 37539:
    case 37540:
    case 37541:
    case 37542:
    case 37543:
    case 37544:
    case 37545:
    case 37546:
    case 37547:
    case 37548:
    case 37549:
    case 37550:
    case 37551:
    case 37552:
    case 37553:
    case 37554:
    case 37555:
    case 37556:
    case 37557:
    case 37558:
    case 37559:
    case 37560:
    case 37561:
    case 37562:
    case 37563:
    case 37564:
    case 37565:
    case 37566:
    case 37567:
    case 37568:
    case 37569:
    case 37570:
    case 37571:
    case 37572:
    case 37573:
    case 37574:
    case 37575:
    case 37576:
    case 37577:
    case 37578:
    case 37579:
    case 37580:
    case 37581:
    case 37582:
    case 37583:
    case 37584:
    case 37585:
    case 37586:
    case 37587:
    case 37588:
    case 37589:
    case 37590:
    case 37591:
    case 37592:
    case 37593:
    case 37594:
    case 37595:
    case 37596:
    case 37597:
    case 37598:
    case 37599:
    case 37600:
    case 37601:
    case 37602:
    case 37603:
    case 37604:
    case 37605:
    case 37606:
    case 37607:
    case 37608:
    case 37609:
    case 37610:
    case 37611:
    case 37612:
    case 37613:
    case 37614:
    case 37615:
    case 37616:
    case 37617:
    case 37618:
    case 37619:
    case 37620:
    case 37621:
    case 37622:
    case 37623:
    case 37624:
    case 37625:
    case 37626:
    case 37627:
    case 37628:
    case 37629:
    case 37630:
    case 37631:
    case 37632:
    case 37633:
    case 37634:
    case 37635:
    case 37636:
    case 37637:
    case 37638:
    case 37639:
    case 37640:
    case 37641:
    case 37642:
    case 37643:
    case 37644:
    case 37645:
    case 37646:
    case 37647:
    case 37648:
    case 37649:
    case 37650:
    case 37651:
    case 37652:
    case 37653:
    case 37654:
    case 37655:
    case 37656:
    case 37657:
    case 37658:
    case 37659:
    case 37660:
    case 37661:
    case 37662:
    case 37663:
    case 37664:
    case 37665:
    case 37666:
    case 37667:
    case 37668:
    case 37669:
    case 37670:
    case 37671:
    case 37672:
    case 37673:
    case 37674:
    case 37675:
    case 37676:
    case 37677:
    case 37678:
    case 37679:
    case 37680:
    case 37681:
    case 37682:
    case 37683:
    case 37684:
    case 37685:
    case 37686:
    case 37687:
    case 37688:
    case 37689:
    case 37690:
    case 37691:
    case 37692:
    case 37693:
    case 37694:
    case 37695:
    case 37696:
    case 37697:
    case 37698:
    case 37699:
    case 37700:
    case 37701:
    case 37702:
    case 37703:
    case 37704:
    case 37705:
    case 37706:
    case 37707:
    case 37708:
    case 37709:
    case 37710:
    case 37711:
    case 37712:
    case 37713:
    case 37714:
    case 37715:
    case 37716:
    case 37717:
    case 37718:
    case 37719:
    case 37720:
    case 37721:
    case 37722:
    case 37723:
    case 37724:
    case 37725:
    case 37726:
    case 37727:
    case 37728:
    case 37729:
    case 37730:
    case 37731:
    case 37732:
    case 37733:
    case 37734:
    case 37735:
    case 37736:
    case 37737:
    case 37738:
    case 37739:
    case 37740:
    case 37741:
    case 37742:
    case 37743:
    case 37744:
    case 37745:
    case 37746:
    case 37747:
    case 37748:
    case 37749:
    case 37750:
    case 37751:
    case 37752:
    case 37753:
    case 37754:
    case 37755:
    case 37756:
    case 37757:
    case 37758:
    case 37759:
    case 37760:
    case 37761:
    case 37762:
    case 37763:
    case 37764:
    case 37765:
    case 37766:
    case 37767:
    case 37768:
    case 37769:
    case 37770:
    case 37771:
    case 37772:
    case 37773:
    case 37774:
    case 37775:
    case 37776:
    case 37777:
    case 37778:
    case 37779:
    case 37780:
    case 37781:
    case 37782:
    case 37783:
    case 37784:
    case 37785:
    case 37786:
    case 37787:
    case 37788:
    case 37789:
    case 37790:
    case 37791:
    case 37792:
    case 37793:
    case 37794:
    case 37795:
    case 37796:
    case 37797:
    case 37798:
    case 37799:
    case 37800:
    case 37801:
    case 37802:
    case 37803:
    case 37804:
    case 37805:
    case 37806:
    case 37807:
    case 37822:
    case 37823:
    case 37824:
    case 37825:
    case 37826:
    case 37827:
    case 37828:
    case 37829:
    case 37830:
    case 37831:
    case 37832:
    case 37833:
    case 37834:
    case 37835:
    case 37836:
    case 37837:
    case 37838:
    case 37839:
    case 37854:
    case 37855:
    case 37856:
    case 37857:
    case 37858:
    case 37859:
    case 37860:
    case 37861:
    case 37862:
    case 37863:
    case 37864:
    case 37865:
    case 37866:
    case 37867:
    case 37868:
    case 37869:
    case 37870:
    case 37871:
    case 37872:
    case 37873:
    case 37875:
    case 37876:
    case 37877:
    case 37878:
    case 37879:
    case 37880:
    case 37881:
    case 37882:
    case 37883:
    case 37884:
    case 37885:
      return 0;
    default:
      if ((v1 - 36283) >= 4 && (v1 - 36492) >= 4) {
        return 0;
      }
      break;
  }
  return result;
}

uint64_t GPUTools::GL::TypeMatchingComponentSpecification(GPUTools::GL *this, int a2)
{
  if (!a2)
  {
    if ((this - 5124) >= 3)
    {
      a2 = 8;
      if (this != 35863 && this != 36764) {
        goto LABEL_30;
      }
    }
    else
    {
      a2 = 32;
    }
  }
  if ((int)this <= 5125)
  {
    if (this != 5124)
    {
      if (this != 5125) {
        goto LABEL_30;
      }
LABEL_14:
      if (a2 < 9) {
        return 5121;
      }
      if (a2 < 0x11) {
        return 5123;
      }
      if (a2 < 0x21) {
        return 5125;
      }
      goto LABEL_30;
    }
LABEL_16:
    if (a2 < 9) {
      return 5120;
    }
    if (a2 < 0x11) {
      return 5122;
    }
    if (a2 < 0x21) {
      return 5124;
    }
    goto LABEL_30;
  }
  switch(this)
  {
    case 0x8F9C:
      goto LABEL_16;
    case 0x8C17:
      goto LABEL_14;
    case 0x1406:
      if (a2 < 17) {
        return 36193;
      }
      if (a2 < 0x21) {
        return 5126;
      }
      if (a2 < 0x41) {
        return 5130;
      }
      break;
  }
LABEL_30:
  uint64_t v3 = dy_abort();
  return GPUTools::GL::DYProcessImageUploadFormatForLegacyES(v3);
}

int *GPUTools::GL::DYProcessImageUploadFormatForLegacyES(int *result)
{
  if (!result) {
    __assert_rtn("void GPUTools::GL::DYProcessImageUploadFormatForLegacyES(ImageFormatInfo *)", (const char *)&unk_24F5F0846, 0, "pImageFormatInfo");
  }
  int v1 = result[1];
  if (v1 == 32993)
  {
    int *result = 6408;
  }
  else
  {
    if (*result == 35905) {
      int v1 = 35904;
    }
    if (*result == 35907) {
      int v1 = 35906;
    }
    int *result = v1;
  }
  return result;
}

uint64_t GPUTools::GL::dy_type_component_count(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 1;
  if (v1 <= 33636)
  {
    if ((v1 - 32819) < 4) {
      return 4;
    }
    if ((v1 - 33634) >= 3 && v1 != 32818) {
      return result;
    }
    return 3;
  }
  if (v1 <= 34233)
  {
    if ((v1 - 33637) >= 4)
    {
      int v3 = 34042;
      goto LABEL_17;
    }
    return 4;
  }
  if (v1 > 35901)
  {
    if (v1 != 35902)
    {
      int v3 = 36269;
LABEL_17:
      if (v1 == v3) {
        return 2;
      }
      return result;
    }
    return 3;
  }
  if ((v1 - 34234) < 2) {
    return 2;
  }
  if (v1 == 35899) {
    return 3;
  }
  return result;
}

uint64_t GPUTools::GL::dy_type_size(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 1;
  if (v1 <= 33634)
  {
    switch(v1)
    {
      case 5122:
      case 5123:
      case 5127:
      case 5131:
        return 2;
      case 5124:
      case 5125:
      case 5126:
      case 5129:
      case 5132:
        return 4;
      case 5128:
        return 3;
      case 5130:
        return 8;
      default:
        if ((v1 - 32819) < 2) {
          return 2;
        }
        if ((v1 - 32821) >= 2) {
          return result;
        }
        return 4;
    }
  }
  if (v1 <= 34233)
  {
    if ((v1 - 33635) >= 4)
    {
      if ((v1 - 33639) >= 2)
      {
        int v3 = 34042;
        goto LABEL_12;
      }
      return 4;
    }
    return 2;
  }
  if (v1 > 36192)
  {
    if (v1 == 36269) {
      return 8;
    }
    if (v1 == 36255) {
      return 4;
    }
    if (v1 != 36193) {
      return result;
    }
    return 2;
  }
  if ((v1 - 34234) < 2) {
    return 2;
  }
  if (v1 == 35899) {
    return 4;
  }
  int v3 = 35902;
LABEL_12:
  if (v1 == v3) {
    return 4;
  }
  return result;
}

uint64_t GPUTools::GL::GetCompressedFormatElementCount(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 4;
  if (v1 <= 37487)
  {
    if ((v1 - 35412) < 2 || (v1 - 35840) < 2) {
      return 3;
    }
  }
  else
  {
    char v3 = v1 - 112;
    if ((v1 - 37488) <= 5)
    {
      if (((1 << v3) & 3) != 0) {
        return 1;
      }
      if (((1 << v3) & 0xC) != 0) {
        return 2;
      }
      return 3;
    }
    if (v1 == 37874) {
      return 3;
    }
  }
  return result;
}

uint64_t GPUTools::GL::GetColorFormatForElementCount(GPUTools::GL *this, int a2)
{
  switch((int)this)
  {
    case 1:
      if (a2) {
        uint64_t result = 36244;
      }
      else {
        uint64_t result = 6403;
      }
      break;
    case 2:
      if (a2) {
        uint64_t result = 33320;
      }
      else {
        uint64_t result = 33319;
      }
      break;
    case 3:
      if (a2) {
        uint64_t result = 36248;
      }
      else {
        uint64_t result = 6407;
      }
      break;
    default:
      if (a2) {
        uint64_t result = 36249;
      }
      else {
        uint64_t result = 6408;
      }
      break;
  }
  return result;
}

uint64_t GPUTools::GL::ColorRenderableFormatMatchingFormat(int *a1)
{
  uint64_t v1 = *a1;
  if (!v1) {
    __assert_rtn("ImageFormatInfo GPUTools::GL::ColorRenderableFormatMatchingFormat(const ImageFormatInfo &)", (const char *)&unk_24F5F0846, 0, "formatInfo.internalFormat != 0");
  }
  if (!a1[1] && (GPUTools::GL::IsCompressedFormat((GPUTools::GL *)*a1) & 1) == 0) {
    __assert_rtn("ImageFormatInfo GPUTools::GL::ColorRenderableFormatMatchingFormat(const ImageFormatInfo &)", (const char *)&unk_24F5F0846, 0, "formatInfo.format != 0 || IsCompressedFormat(formatInfo.internalFormat)");
  }
  int v3 = a1[2];
  char IsCompressedFormat = GPUTools::GL::IsCompressedFormat((GPUTools::GL *)v1);
  if (!v3) {
    goto LABEL_16;
  }
  if (IsCompressedFormat) {
    goto LABEL_17;
  }
  CompressedFormatInfo = &GPUTools::GL::sInternalFormatsTable;
  uint64_t v7 = 6660;
  while (*CompressedFormatInfo != v1)
  {
    CompressedFormatInfo += 15;
    v7 -= 60;
    if (!v7)
    {
      CompressedFormatInfo = (int *)&GPUTools::GL::sUnknownFormat;
      break;
    }
  }
  uint64_t v8 = CompressedFormatInfo[1];
  if (v8 == 6402)
  {
LABEL_18:
    int v10 = *a1;
    uint64_t v1 = 0x19030000822ELL;
    if ((*a1 - 33189) < 3 || v10 == 6402 || v10 == 36012) {
      return v1;
    }
    dy_string_from_enum(v10);
    uint64_t v8 = dy_abort();
  }
  else
  {
    while (v8 == 34041)
    {
      int v9 = *a1;
      uint64_t v1 = 0x19030000822ELL;
      if (*a1 == 34041 || v9 == 35056 || v9 == 36013) {
        return v1;
      }
      dy_string_from_enum(v9);
      char IsCompressedFormat = dy_abort();
LABEL_16:
      if ((IsCompressedFormat & 1) == 0) {
        __assert_rtn("ImageFormatInfo GPUTools::GL::ColorRenderableFormatMatchingFormat(const ImageFormatInfo &)", (const char *)&unk_24F5F0846, 0, "formatInfo.type != 0 || IsCompressedFormat(formatInfo.internalFormat)");
      }
LABEL_17:
      CompressedFormatInfo = (int *)GPUTools::GL::GetCompressedFormatInfo((GPUTools::GL *)v1, v5);
      uint64_t v8 = CompressedFormatInfo[1];
      if (v8 == 6402) {
        goto LABEL_18;
      }
    }
  }
  int v11 = CompressedFormatInfo[7];
  int v12 = CompressedFormatInfo[8];
  uint64_t v13 = *((unsigned __int8 *)CompressedFormatInfo + 47);
  uint64_t v14 = *((unsigned __int8 *)CompressedFormatInfo + 49);
  int v15 = CompressedFormatInfo[2];
  if (v15)
  {
    unsigned int v16 = *((unsigned __int8 *)CompressedFormatInfo + 44);
    unsigned int v17 = *((unsigned __int8 *)CompressedFormatInfo + 45);
    unsigned int v18 = *((unsigned __int8 *)CompressedFormatInfo + 46);
    if (v18 <= v13) {
      unsigned int v18 = v13;
    }
    if (v17 > v18) {
      unsigned int v18 = v17;
    }
    if (v16 <= v18) {
      uint64_t v13 = v18;
    }
    else {
      uint64_t v13 = v16;
    }
    goto LABEL_37;
  }
  int v15 = CompressedFormatInfo[9];
  if (v15)
  {
    unsigned int v19 = *((unsigned __int8 *)CompressedFormatInfo + 51);
    if (v19 <= v13) {
      uint64_t v13 = v13;
    }
    else {
      uint64_t v13 = v19;
    }
    goto LABEL_37;
  }
  int v15 = CompressedFormatInfo[10];
  if (v15)
  {
    uint64_t v13 = *((unsigned __int8 *)CompressedFormatInfo + 52);
    goto LABEL_37;
  }
  int v15 = CompressedFormatInfo[5];
  if (v15)
  {
LABEL_37:
    unint64_t v20 = v13 << 32;
    int v21 = v15;
    int v22 = GPUTools::GL::dy_format_element_count((GPUTools::GL *)v8);
    if (v21 > 5125) {
      goto LABEL_38;
    }
LABEL_52:
    if (v21 != 5124)
    {
      if (v21 == 5125)
      {
        int v23 = 4;
        unint64_t v24 = HIDWORD(v20);
        if (HIDWORD(v20) < 9) {
          goto LABEL_64;
        }
        goto LABEL_59;
      }
LABEL_83:
      dy_abort();
      goto LABEL_84;
    }
    int v23 = 3;
    unint64_t v24 = HIDWORD(v20);
    if (HIDWORD(v20) >= 9) {
      goto LABEL_59;
    }
LABEL_64:
    unsigned int v27 = 0;
    goto LABEL_65;
  }
  unint64_t v25 = (unint64_t)*((unsigned __int8 *)CompressedFormatInfo + 50) << 32;
  if (!v12)
  {
    unint64_t v25 = 0;
    int v12 = 0;
  }
  if (v11) {
    unint64_t v20 = v14 << 32;
  }
  else {
    unint64_t v20 = v25;
  }
  if (v11) {
    int v26 = v11;
  }
  else {
    int v26 = v12;
  }
  int v21 = v26 | v20;
  int v22 = GPUTools::GL::dy_format_element_count((GPUTools::GL *)v8);
  if (v21 <= 5125) {
    goto LABEL_52;
  }
LABEL_38:
  if (v21 == 5126)
  {
    int v23 = 2;
    unint64_t v24 = HIDWORD(v20);
    if (HIDWORD(v20) < 9) {
      goto LABEL_64;
    }
    goto LABEL_59;
  }
  if (v21 == 35863)
  {
    int v23 = 0;
    unint64_t v24 = HIDWORD(v20);
    if (HIDWORD(v20) >= 9) {
      goto LABEL_59;
    }
    goto LABEL_64;
  }
  if (v21 != 36764) {
    goto LABEL_83;
  }
  int v23 = 1;
  unint64_t v24 = HIDWORD(v20);
  if (HIDWORD(v20) < 9) {
    goto LABEL_64;
  }
LABEL_59:
  if (v24 < 0x11)
  {
    unsigned int v27 = 1;
LABEL_65:
    uint64_t v28 = 1;
    if (v22 != 2) {
      uint64_t v28 = 2;
    }
    if (v22 == 1) {
      uint64_t v28 = 0;
    }
    uint8x8_t v29 = (char *)&GPUTools::GL::s_renderableFormats + 48 * v23 + 12 * v27;
    uint64_t v1 = *(unsigned int *)&v29[4 * v28];
    if (v1)
    {
      if ((GPUTools::GL::IsCompressedFormat((GPUTools::GL *)*(unsigned int *)&v29[4 * v28]) & 1) == 0)
      {
        uint64_t v30 = &GPUTools::GL::sInternalFormatsTable;
        uint64_t v31 = 6660;
        while (*v30 != v1)
        {
          v30 += 15;
          v31 -= 60;
          if (!v31) {
            return v1;
          }
        }
        return ((uint64_t (*)(int *))GPUTools::GL::GetImageUploadFormatInfo)(v30);
      }
      return v1;
    }
    dy_string_from_enum(*a1);
    dy_string_from_enum(a1[1]);
    dy_string_from_enum(a1[2]);
    dy_abort();
    goto LABEL_83;
  }
  if (v24 < 0x21)
  {
    unsigned int v27 = 2;
    goto LABEL_65;
  }
  if (v24 < 0x41)
  {
    unsigned int v27 = 3;
    goto LABEL_65;
  }
LABEL_84:
  uint64_t v33 = dy_abort();
  return GPUTools::GL::ColorRenderableFormatMatchingDepthStencilFormat(v33);
}

uint64_t GPUTools::GL::ColorRenderableFormatMatchingDepthStencilFormat(int *a1, int a2)
{
  int v2 = *a1;
  if (v2 == 34041 || v2 == 36013 || v2 == 35056)
  {
    if (a2) {
      return 0x19030000822ELL;
    }
    else {
      return 0x8D9400008232;
    }
  }
  else
  {
    dy_string_from_enum(v2);
    uint64_t v5 = dy_abort();
    return GPUTools::GL::ColorRenderableFormatMatchingDepthFormat(v5);
  }
}

uint64_t GPUTools::GL::ColorRenderableFormatMatchingDepthFormat(int *a1)
{
  int v1 = *a1;
  if ((v1 - 33189) < 3 || v1 == 36012 || v1 == 6402) {
    return 0x19030000822ELL;
  }
  dy_string_from_enum(v1);
  uint64_t v4 = (GPUTools::GL *)dy_abort();
  return GPUTools::GL::dy_format_element_count(v4);
}

uint64_t GPUTools::GL::dy_format_element_count(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 1;
  if (v1 > 35358)
  {
    if ((v1 - 35898) > 8) {
      goto LABEL_11;
    }
    if (((1 << (v1 - 58)) & 0x5B) != 0) {
      return 3;
    }
    if (v1 != 35906)
    {
LABEL_11:
      switch(v1)
      {
        case 36248:
        case 36250:
          return 3;
        case 36249:
        case 36251:
          return 4;
        default:
          int v4 = 35359;
          goto LABEL_23;
      }
    }
    return 4;
  }
  if (v1 <= 32992)
  {
    if (v1 > 6409)
    {
      if (v1 != 6410)
      {
        if (v1 != 0x8000)
        {
          if (v1 != 32992) {
            return result;
          }
          return 3;
        }
        return 4;
      }
      return 2;
    }
    if (v1 == 6407) {
      return 3;
    }
    int v3 = 6408;
LABEL_17:
    if (v1 != v3) {
      return result;
    }
    return 4;
  }
  if (v1 <= 34040)
  {
    if ((v1 - 33319) < 2) {
      return 2;
    }
    int v3 = 32993;
    goto LABEL_17;
  }
  if (v1 == 34041) {
    return 2;
  }
  int v4 = 34233;
LABEL_23:
  if (v1 == v4) {
    return 2;
  }
  return result;
}

BOOL GPUTools::GL::IsIntegerFormat(GPUTools::GL *this)
{
  return (this - 36244) <= 5 && ((1 << ((_BYTE)this + 108)) & 0x31) != 0 || this == 33320;
}

BOOL GPUTools::GL::IsSignedType(GPUTools::GL *this)
{
  return (this - 5120) <= 0xB && ((1 << (char)this) & 0xC55) != 0 || this == 36193;
}

uint64_t GPUTools::GL::IsPackedType(GPUTools::GL *this)
{
  int v1 = (int)this;
  uint64_t result = 1;
  if (v1 <= 34041)
  {
    if ((v1 - 33634) >= 7 && (v1 - 32818) >= 5) {
      return 0;
    }
  }
  else
  {
    if (v1 > 35901)
    {
      if (v1 == 35902 || v1 == 36255 || v1 == 36269) {
        return result;
      }
      return 0;
    }
    if (v1 != 34042 && v1 != 35899) {
      return 0;
    }
  }
  return result;
}

BOOL GPUTools::GL::IsIntegralType(GPUTools::GL *this)
{
  return (this - 5120) < 6;
}

double GPUTools::GL::RangeForUnpackedType(GPUTools::GL *this, unint64_t *a2, double *a3, double *a4)
{
  unint64_t v4 = 0;
  double result = 255.0;
  switch((int)this)
  {
    case 5120:
      double result = 127.0;
      unint64_t v4 = 0xC060000000000000;
      goto LABEL_3;
    case 5121:
LABEL_3:
      *a2 = v4;
      *a3 = result;
      return result;
    case 5122:
      double result = 32767.0;
      *a2 = 0xC0E0000000000000;
      *a3 = 32767.0;
      return result;
    case 5123:
      double result = 65535.0;
      *a2 = 0;
      *a3 = 65535.0;
      return result;
    case 5124:
      double result = 2147483650.0;
      *a2 = 0xC1E0000000000000;
      *a3 = 2147483650.0;
      return result;
    case 5125:
      double result = 4294967300.0;
      *a2 = 0;
      *a3 = 4294967300.0;
      return result;
    case 5126:
      double result = 3.40282347e38;
      *a2 = 0xC7EFFFFFE0000000;
      *a3 = 3.40282347e38;
      return result;
    case 5127:
    case 5128:
    case 5129:
      goto LABEL_6;
    case 5130:
      double result = 1.79769313e308;
      *a2 = 0xFFEFFFFFFFFFFFFFLL;
      *a3 = 1.79769313e308;
      return result;
    case 5131:
      goto LABEL_5;
    default:
      if (this == 36193)
      {
LABEL_5:
        double result = 65504.0;
        *a2 = 0xC0EFFC0000000000;
        *a3 = 65504.0;
      }
      else
      {
LABEL_6:
        double result = 1.0;
        *a2 = 0;
        *a3 = 1.0;
      }
      return result;
  }
}

uint64_t GPUTools::GL::dy_pixel_group_size(GPUTools::GL *this, GPUTools::GL *a2)
{
  int v2 = (int)a2;
  uint64_t result = GPUTools::GL::dy_type_size(a2);
  if (v2 > 34041)
  {
    if (v2 > 35898)
    {
      if (v2 != 35899 && v2 != 35902 && v2 != 36269) {
        return GPUTools::GL::dy_format_element_count(this) * result;
      }
    }
    else if ((v2 - 34234) >= 2 && v2 != 34042)
    {
      return GPUTools::GL::dy_format_element_count(this) * result;
    }
  }
  else if ((v2 - 33634) >= 7 && (v2 - 32818) >= 5)
  {
    return GPUTools::GL::dy_format_element_count(this) * result;
  }
  return result;
}

uint64_t GPUTools::GL::dy_pixel_row_bytes(GPUTools::GL *this, int a2, int a3, unsigned int a4)
{
  if (!a2) {
    return 0;
  }
  int v4 = (int)this;
  uint64_t result = 0;
  if (a4 <= 8 && ((1 << a4) & 0x116) != 0)
  {
    if (a3 <= 0) {
      int v6 = a2;
    }
    else {
      int v6 = a3;
    }
    return (a4 + v6 * v4 - 1) & -a4;
  }
  return result;
}

uint64_t GPUTools::GL::ComputeClientImageSize(unsigned int *a1, int *a2)
{
  int v4 = GPUTools::GL::dy_pixel_group_size((GPUTools::GL *)a1[1], (GPUTools::GL *)a1[2]);
  if ((int)a1[10] <= 1) {
    int v5 = 1;
  }
  else {
    int v5 = a1[10];
  }
  int v6 = a1[6];
  if (!v6) {
    return 0;
  }
  unsigned int v7 = a2[3];
  if (v7 > 8 || ((1 << v7) & 0x116) == 0) {
    return 0;
  }
  int v9 = v5 * v4;
  if (*a2 > 0) {
    int v6 = *a2;
  }
  return a1[7] * ((v7 + v9 * v6 - 1) & -v7) * a1[8];
}

uint64_t GPUTools::GL::ComputePackedClientImageSize(unsigned int *a1)
{
  int v2 = GPUTools::GL::dy_pixel_group_size((GPUTools::GL *)a1[1], (GPUTools::GL *)a1[2]);
  int v3 = a1[10];
  if (v3 <= 1) {
    int v3 = 1;
  }
  return a1[7] * a1[6] * v3 * v2 * a1[8];
}

uint64_t GPUTools::GL::ComputeReadPixelsImageSize(int a1, int a2, GPUTools::GL *this, GPUTools::GL *a4, int *a5)
{
  int v8 = GPUTools::GL::dy_pixel_group_size(this, a4);
  int v9 = a5[6];
  if (!v9)
  {
    int v10 = *a5;
    unsigned int v11 = a5[3];
    if (*a5 <= 0) {
      int v10 = a1;
    }
    int v9 = (v11 + v10 * v8 - 1) & -v11;
    BOOL v12 = v11 > 8;
    int v13 = (1 << v11) & 0x116;
    if (v12 || v13 == 0) {
      int v9 = 0;
    }
    if (!a1) {
      int v9 = 0;
    }
  }
  return (a5[2] * v8 + (a5[1] + a2) * v9);
}

const signed __int8 *GPUTools::GL::NormalizeIntegerComponents(const signed __int8 *this, unint64_t a2, unint64_t a3)
{
  if (!a3) {
    return this;
  }
  if (a3 >= 8 && (a2 + a3 <= (unint64_t)this || (unint64_t)&this[4 * a3] <= a2))
  {
    if (a3 >= 0x10)
    {
      unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFF0;
      v9.i64[0] = 0x8181818181818181;
      v9.i64[1] = 0x8181818181818181;
      float32x4_t v10 = (float32x4_t)vdupq_n_s32(0x42FE0000u);
      unint64_t v11 = a3 & 0xFFFFFFFFFFFFFFF0;
      BOOL v12 = (float32x4_t *)this;
      int v13 = (int8x16_t *)a2;
      do
      {
        int8x16_t v14 = *v13++;
        int8x16_t v15 = vmaxq_s8(v14, v9);
        float32x4_t v16 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL)));
        float32x4_t v17 = vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL)));
        v15.i64[0] = vextq_s8(v15, v15, 8uLL).u64[0];
        float32x4_t *v12 = vdivq_f32(v17, v10);
        v12[1] = vdivq_f32(v16, v10);
        v12[2] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL))), v10);
        v12[3] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(*(int8x8_t *)v15.i8, *(int8x8_t *)v9.i8), 8uLL), 8uLL))), v10);
        v12 += 4;
        v11 -= 16;
      }
      while (v11);
      if (v3 == a3) {
        return this;
      }
      if ((a3 & 8) == 0) {
        goto LABEL_6;
      }
    }
    else
    {
      unint64_t v3 = 0;
    }
    unint64_t v18 = v3;
    unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFF8;
    unsigned int v19 = (int8x8_t *)(a2 + v18);
    unint64_t v20 = (float32x4_t *)&this[4 * v18];
    unint64_t v21 = v18 - (a3 & 0xFFFFFFFFFFFFFFF8);
    float32x4_t v22 = (float32x4_t)vdupq_n_s32(0x42FE0000u);
    do
    {
      int8x8_t v23 = *v19++;
      int8x8_t v24 = vmax_s8(v23, (int8x8_t)0x8181818181818181);
      *unint64_t v20 = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip1_s8(v24, (int8x8_t)0x8181818181818181), 8uLL), 8uLL))), v22);
      v20[1] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(vshr_n_s16(vshl_n_s16((int16x4_t)vzip2_s8(v24, (int8x8_t)0x8181818181818181), 8uLL), 8uLL))), v22);
      v20 += 2;
      v21 += 8;
    }
    while (v21);
    if (v3 == a3) {
      return this;
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
LABEL_6:
  int v4 = (const signed __int8 *)(a3 - v3);
  int v5 = (char *)(a2 + v3);
  int v6 = (float *)&this[4 * v3];
  do
  {
    int v8 = *v5++;
    int v7 = v8;
    if (v8 <= -127) {
      int v7 = -127;
    }
    *v6++ = (float)v7 / 127.0;
    --v4;
  }
  while (v4);
  return this;
}

const unsigned __int8 *GPUTools::GL::NormalizeIntegerComponents(const unsigned __int8 *this, unint64_t a2, unint64_t a3, double a4, double a5, double a6, int8x16_t a7)
{
  if (a3)
  {
    if (a3 < 8 || a2 + a3 > (unint64_t)this && (unint64_t)&this[4 * a3] > a2)
    {
      unint64_t v7 = 0;
      goto LABEL_6;
    }
    if (a3 >= 0x10)
    {
      unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFF0;
      a7.i64[1] = 0xFFFFFF0FFFFFFF0ELL;
      unint64_t v12 = a3 & 0xFFFFFFFFFFFFFFF0;
      int v13 = (float32x4_t *)this;
      int8x16_t v14 = (int8x16_t *)a2;
      float32x4_t v15 = (float32x4_t)vdupq_n_s32(0x437F0000u);
      do
      {
        int8x16_t v16 = *v14++;
        v13[2] = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_24F60F060)), v15);
        v13[3] = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_24F60F070)), v15);
        *int v13 = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_24F60F040)), v15);
        v13[1] = vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(v16, (int8x16_t)xmmword_24F60F050)), v15);
        v13 += 4;
        v12 -= 16;
      }
      while (v12);
      if (v7 == a3) {
        return this;
      }
      if ((a3 & 8) == 0)
      {
LABEL_6:
        int v8 = (const unsigned __int8 *)(a3 - v7);
        int8x16_t v9 = (unsigned __int8 *)(a2 + v7);
        float32x4_t v10 = (float *)&this[4 * v7];
        do
        {
          unsigned int v11 = *v9++;
          *v10++ = (float)v11 / 255.0;
          --v8;
        }
        while (v8);
        return this;
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
    unint64_t v17 = v7;
    unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFF8;
    unint64_t v18 = (unint64_t *)(a2 + v17);
    unsigned int v19 = (unsigned __int8 *)&this[4 * v17];
    unint64_t v20 = v17 - (a3 & 0xFFFFFFFFFFFFFFF8);
    float32x4_t v21 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    do
    {
      unint64_t v22 = *v18++;
      a7.i64[0] = v22;
      uint32x4_t v23 = (uint32x4_t)vqtbl1q_s8(a7, (int8x16_t)xmmword_24F60F040);
      a7 = (int8x16_t)vdivq_f32(vcvtq_f32_u32((uint32x4_t)vqtbl1q_s8(a7, (int8x16_t)xmmword_24F60F050)), v21);
      *(float32x4_t *)unsigned int v19 = vdivq_f32(vcvtq_f32_u32(v23), v21);
      *((int8x16_t *)v19 + 1) = a7;
      v19 += 32;
      v20 += 8;
    }
    while (v20);
    if (v7 != a3) {
      goto LABEL_6;
    }
  }
  return this;
}

float GPUTools::GL::NormalizeIntegerComponents(GPUTools::GL *this, int16x8_t *a2, unint64_t a3, int16x8_t a4)
{
  if (a3)
  {
    if (a3 >= 0x10)
    {
      unint64_t v4 = a3 & 0xFFFFFFFFFFFFFFF0;
      int v5 = a2 + 1;
      int v6 = (float32x4_t *)((char *)this + 32);
      a4 = vdupq_n_s16(0x8001u);
      float32x4_t v7 = (float32x4_t)vdupq_n_s32(0x46FFFE00u);
      unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        int16x8_t v9 = vmaxq_s16(v5[-1], a4);
        int16x8_t v10 = vmaxq_s16(*v5, a4);
        v6[-2] = vdivq_f32(vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v9.i8)), v7);
        v6[-1] = vdivq_f32(vcvtq_f32_s32(vmovl_high_s16(v9)), v7);
        *int v6 = vdivq_f32(vcvtq_f32_s32(vmovl_s16(*(int16x4_t *)v10.i8)), v7);
        v6[1] = vdivq_f32(vcvtq_f32_s32(vmovl_high_s16(v10)), v7);
        v6 += 4;
        v5 += 2;
        v8 -= 16;
      }
      while (v8);
      if (v4 == a3) {
        return *(float *)a4.i32;
      }
    }
    else
    {
      unint64_t v4 = 0;
    }
    unsigned int v11 = (char *)(a3 - v4);
    unint64_t v12 = (_DWORD *)((char *)this + 4 * v4);
    int v13 = &a2->i16[v4];
    do
    {
      int v15 = *v13++;
      int v14 = v15;
      if (v15 <= -32767) {
        int v14 = -32767;
      }
      *(float *)a4.i32 = (float)v14 / 32767.0;
      *v12++ = a4.i32[0];
      --v11;
    }
    while (v11);
  }
  return *(float *)a4.i32;
}

float32_t GPUTools::GL::NormalizeIntegerComponents(GPUTools::GL *this, uint16x8_t *a2, unint64_t a3, float32x4_t a4)
{
  if (a3)
  {
    if (a3 < 0x10)
    {
      unint64_t v4 = 0;
LABEL_7:
      unsigned int v11 = (char *)(a3 - v4);
      unint64_t v12 = (_DWORD *)((char *)this + 4 * v4);
      int v13 = (unsigned __int16 *)a2 + v4;
      do
      {
        unsigned int v14 = *v13++;
        a4.f32[0] = (float)v14 / 65535.0;
        *v12++ = a4.i32[0];
        --v11;
      }
      while (v11);
      return a4.f32[0];
    }
    unint64_t v4 = a3 & 0xFFFFFFFFFFFFFFF0;
    int v5 = a2 + 1;
    int v6 = (float32x4_t *)((char *)this + 32);
    a4 = (float32x4_t)vdupq_n_s32(0x477FFF00u);
    unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      uint16x8_t v8 = v5[-1];
      float32x4_t v9 = vcvtq_f32_u32(vmovl_high_u16(*v5));
      float32x4_t v10 = vdivq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v5->i8)), a4);
      v6[-2] = vdivq_f32(vcvtq_f32_u32(vmovl_u16(*(uint16x4_t *)v8.i8)), a4);
      v6[-1] = vdivq_f32(vcvtq_f32_u32(vmovl_high_u16(v8)), a4);
      *int v6 = v10;
      v6[1] = vdivq_f32(v9, a4);
      v6 += 4;
      v5 += 2;
      v7 -= 16;
    }
    while (v7);
    if (v4 != a3) {
      goto LABEL_7;
    }
  }
  return a4.f32[0];
}

float32x4_t *GPUTools::GL::NormalizeIntegerComponents(float32x4_t *this, int32x4_t *a2, unint64_t a3)
{
  if (a3)
  {
    if (a3 >= 8)
    {
      unint64_t v3 = a3 & 0xFFFFFFFFFFFFFFF8;
      unint64_t v4 = a2 + 1;
      int v5 = this + 1;
      int32x4_t v6 = vdupq_n_s32(0x80000001);
      v7.i64[0] = 0x3000000030000000;
      v7.i64[1] = 0x3000000030000000;
      unint64_t v8 = a3 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        float32x4_t v9 = vmulq_f32(vcvtq_f32_s32(vmaxq_s32(*v4, v6)), v7);
        v5[-1] = vmulq_f32(vcvtq_f32_s32(vmaxq_s32(v4[-1], v6)), v7);
        *int v5 = v9;
        v4 += 2;
        v5 += 2;
        v8 -= 8;
      }
      while (v8);
      if (v3 == a3) {
        return this;
      }
    }
    else
    {
      unint64_t v3 = 0;
    }
    float32x4_t v10 = (char *)(a3 - v3);
    unint64_t v11 = v3;
    unint64_t v12 = &this->f32[v3];
    int v13 = (float *)&a2->i32[v11];
    do
    {
      int v15 = *(_DWORD *)v13++;
      int v14 = v15;
      if (v15 <= -2147483647) {
        int v14 = -2147483647;
      }
      *v12++ = (float)v14 * 4.6566e-10;
      --v10;
    }
    while (v10);
  }
  return this;
}

float32_t GPUTools::GL::NormalizeIntegerComponents(GPUTools::GL *this, uint32x4_t *a2, unint64_t a3, float32x4_t a4)
{
  if (a3)
  {
    if (a3 < 8)
    {
      unint64_t v4 = 0;
LABEL_7:
      float32x4_t v9 = (char *)(a3 - v4);
      unint64_t v10 = v4;
      unint64_t v11 = (_DWORD *)((char *)this + 4 * v4);
      unint64_t v12 = (float *)&a2->i32[v10];
      do
      {
        unsigned int v13 = *(_DWORD *)v12++;
        a4.f32[0] = (float)v13 * 2.3283e-10;
        *v11++ = a4.i32[0];
        --v9;
      }
      while (v9);
      return a4.f32[0];
    }
    unint64_t v4 = a3 & 0xFFFFFFFFFFFFFFF8;
    int v5 = a2 + 1;
    int32x4_t v6 = (float32x4_t *)((char *)this + 16);
    a4 = (float32x4_t)vdupq_n_s32(0x2F800000u);
    unint64_t v7 = a3 & 0xFFFFFFFFFFFFFFF8;
    do
    {
      float32x4_t v8 = vmulq_f32(vcvtq_f32_u32(*v5), a4);
      v6[-1] = vmulq_f32(vcvtq_f32_u32(v5[-1]), a4);
      *int32x4_t v6 = v8;
      v5 += 2;
      v6 += 2;
      v7 -= 8;
    }
    while (v7);
    if (v4 != a3) {
      goto LABEL_7;
    }
  }
  return a4.f32[0];
}

uint64_t GPUTools::GL::DYGetBufferBindingEnum(GPUTools::GL *this)
{
  if (this == 36663) {
    int v1 = 36663;
  }
  else {
    int v1 = 0;
  }
  if (this == 36662) {
    int v2 = 36662;
  }
  else {
    int v2 = v1;
  }
  if (this == 35982) {
    int v3 = 35983;
  }
  else {
    int v3 = 0;
  }
  if (this == 35345) {
    int v4 = 35368;
  }
  else {
    int v4 = v3;
  }
  if ((int)this <= 36661) {
    unsigned int v5 = v4;
  }
  else {
    unsigned int v5 = v2;
  }
  if (this == 35052) {
    int v6 = 35055;
  }
  else {
    int v6 = 0;
  }
  if (this == 35051) {
    int v7 = 35053;
  }
  else {
    int v7 = v6;
  }
  if (this == 34963) {
    int v8 = 34965;
  }
  else {
    int v8 = 0;
  }
  if (this == 34962) {
    int v9 = 34964;
  }
  else {
    int v9 = v8;
  }
  if ((int)this <= 35050) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = v7;
  }
  if ((int)this <= 35344) {
    return v10;
  }
  else {
    return v5;
  }
}

uint64_t GPUTools::GL::DYGetBufferAccessAsBitfield(GPUTools::GL *this)
{
  if ((this - 35000) >= 3) {
    return 0;
  }
  else {
    return (this - 34999);
  }
}

uint64_t GPUTools::GL::dy_get_renderbuffer_binding_enum(GPUTools::GL *this)
{
  return 36007;
}

uint64_t GPUTools::GL::dy_get_framebuffer_binding_enum(GPUTools::GL *this)
{
  if (this == 36008) {
    int v1 = 36010;
  }
  else {
    int v1 = 36160;
  }
  if (this == 36009) {
    unsigned int v2 = 36006;
  }
  else {
    unsigned int v2 = v1;
  }
  if (this == 36160) {
    return 36006;
  }
  else {
    return v2;
  }
}

uint64_t GPUTools::GL::DYGetCompressedPalettedTextureInfo(uint64_t result, _DWORD *a2)
{
  if ((result - 35728) > 9)
  {
    *a2 = 1;
    a2[1] = 1;
    a2[2] = 8;
  }
  else
  {
    uint64_t v2 = 4 * ((int)result - 35728);
    int v3 = *(_DWORD *)((char *)&unk_24F611F6C + v2);
    int v4 = *(_DWORD *)((char *)&unk_24F611F94 + v2);
    LODWORD(v2) = *(_DWORD *)((char *)&unk_24F611FBC + v2);
    *a2 = v3;
    a2[1] = v4;
    a2[2] = v2;
  }
  return result;
}

uint64_t GPUTools::GL::DYComputeTextureLayerDataOffset(GPUTools::GL *this, int a2, int a3, int a4)
{
  return ((int)this / a3 * (a2 - a4));
}

BOOL GPUTools::GL::DYIsAttachmentWritable(int a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a1 == 33306)
  {
    v23[1] = 36128;
    a1 = 36096;
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 1;
  }
  uint64_t v4 = 0;
  v23[0] = a1;
  BOOL v5 = 1;
  while (1)
  {
    int v7 = v23[v4];
    if ((v7 - 36064) < 0x10) {
      break;
    }
    if (v7 == 36096)
    {
      v22[0] = 0;
      (*(void (**)(uint64_t, uint64_t, _DWORD *))(a2 + 16))(a2, 2929, v22);
      if (v22[0] == 1)
      {
        int v21 = 0;
        (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2930, &v21);
        if (v21)
        {
          int v21 = 0;
          (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2932, &v21);
          if (v21 != 512) {
            return v5;
          }
        }
      }
    }
    else if (v7 == 36128)
    {
      v22[0] = 0;
      (*(void (**)(uint64_t, uint64_t, _DWORD *))(a2 + 16))(a2, 2960, v22);
      if (v22[0] == 1)
      {
        int v21 = 0;
        (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2968, &v21);
        if (v21)
        {
          int v20 = 0;
          (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 2962, &v20);
          if (v20 == 519)
          {
            uint64_t v19 = 0;
            HIDWORD(v18) = 0;
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2929, (char *)&v18 + 4);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2965, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2966, &v19);
            if (v19 == 7680)
            {
              BOOL v11 = HIDWORD(v19) == 7680;
              int v12 = HIDWORD(v18);
              goto LABEL_36;
            }
            BOOL v10 = 1;
          }
          else
          {
            if (v20 == 512)
            {
              HIDWORD(v19) = 0;
              (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2964, (char *)&v19 + 4);
              BOOL v10 = HIDWORD(v19) != 7680;
              goto LABEL_43;
            }
            uint64_t v18 = 0;
            uint64_t v19 = 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2929, &v18);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2964, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2965, &v19);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2966, (char *)&v18 + 4);
            BOOL v10 = 1;
            if (HIDWORD(v19) == 7680 && HIDWORD(v18) == 7680)
            {
              BOOL v11 = v19 == 7680;
              int v12 = v18;
LABEL_36:
              BOOL v10 = !v11 && v12 == 1;
            }
          }
        }
        else
        {
          BOOL v10 = 0;
        }
LABEL_43:
        int v21 = 0;
        (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 36005, &v21);
        BOOL v6 = v21;
        if (v21)
        {
          int v20 = 0;
          (*(void (**)(uint64_t, uint64_t, int *))(a2 + 16))(a2, 34816, &v20);
          if (v20 == 512)
          {
            HIDWORD(v19) = 0;
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34817, (char *)&v19 + 4);
            BOOL v6 = HIDWORD(v19) != 7680;
          }
          else if (v20 == 519)
          {
            uint64_t v19 = 0;
            HIDWORD(v18) = 0;
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 2929, (char *)&v18 + 4);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34818, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 34819, &v19);
            if (v19 == 7680)
            {
              BOOL v14 = HIDWORD(v19) == 7680;
              int v15 = HIDWORD(v18);
              goto LABEL_51;
            }
            BOOL v6 = 1;
          }
          else
          {
            uint64_t v18 = 0;
            uint64_t v19 = 0;
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 2929, &v18);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34817, (char *)&v19 + 4);
            (*(void (**)(uint64_t, uint64_t, uint64_t *))(a2 + 16))(a2, 34818, &v19);
            (*(void (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, 34819, (char *)&v18 + 4);
            BOOL v6 = 1;
            if (HIDWORD(v19) == 7680 && HIDWORD(v18) == 7680)
            {
              BOOL v14 = v19 == 7680;
              int v15 = v18;
LABEL_51:
              BOOL v6 = !v14 && v15 == 1;
            }
          }
        }
        if (v10 || v6) {
          return v5;
        }
      }
    }
LABEL_7:
    BOOL v5 = ++v4 < v3;
    if (v3 == v4) {
      return v5;
    }
  }
  (*(void (**)(uint64_t, uint64_t, _DWORD *))(a2 + 16))(a2, 3107, v22);
  if (v22[0]) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v22[1] == 0;
  }
  BOOL v9 = v8 && v22[2] == 0;
  if (v9 && !v22[3]) {
    goto LABEL_7;
  }
  return v5;
}

uint64_t GPUTools::GL::DYGetSyncObjectParamterInfo(uint64_t this, _DWORD *a2, unsigned int *a3, BOOL *a4)
{
  if (a2) {
    *a2 = 1;
  }
  if (a3) {
    *(unsigned char *)a3 = ((this - 37138) < 4) & (7u >> ((this - 18) & 0xF));
  }
  return this;
}

void GPUTools::GL::DYResolveMSAABuffer(GPUTools::GL *this, unint64_t a2, int8x16_t *__src, size_t __n, float *__b, void *a6)
{
  BOOL v6 = __b;
  BOOL v8 = __src;
  if (a2 <= 1)
  {
    memcpy(__b, __src, __n);
    return;
  }
  int v10 = (int)this;
  memset(__b, 255, __n / a2);
  if (v10 > 35055)
  {
    if (v10 <= 36167)
    {
      if (v10 > 36011)
      {
        if (v10 == 36012)
        {
          GPUTools::GL::MSAADepthStencilResolver<float>::resolve<4u,4u,true,63ull,32ull,0ull,0ull>(a2, (unint64_t)v8, __n, v6);
        }
        else if (v10 == 36013)
        {
          GPUTools::GL::MSAADepthStencilResolver<float>::resolve<8u,8u,true,63ull,32ull,31ull,24ull>(a2, (unint64_t)v8, __n, (uint64_t)v6);
        }
      }
      else
      {
        switch(v10)
        {
          case 35898:
            GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)11,(unsigned char)11,(unsigned char)10,(unsigned char)0>(a2, v8->i8, __n, (int *)v6);
            break;
          case 35899:
          case 35900:
          case 35902:
          case 35903:
          case 35904:
          case 35906:
            return;
          case 35901:
            GPUTools::GL::MSAABufferResolverResolveRGB9E5((GPUTools::GL *)a2, (unsigned int *)v8, (const void *)__n, (__int32 *)v6, v11, v12);
            break;
          case 35905:
LABEL_63:
            GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
            break;
          case 35907:
LABEL_55:
            GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(a2, (unsigned __int8 *)v8, __n, v6);
            break;
          default:
            if (v10 == 35056)
            {
              GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,39ull,32ull>(a2, (unsigned int *)v8, __n, (uint64_t)v6);
            }
            break;
        }
      }
      return;
    }
    switch(v10)
    {
      case 36168:
LABEL_12:
        if (!__n) {
          return;
        }
        BOOL v14 = (int8x16_t *)((char *)v8 + __n);
        if (a2 < 8)
        {
          do
          {
            uint64_t v15 = 0;
            unint64_t v16 = 0;
            do
              v16 += v8->u8[v15++];
            while (a2 != v15);
            BOOL v8 = (int8x16_t *)((char *)v8 + a2);
            *(unsigned char *)BOOL v6 = v16 / a2;
            BOOL v6 = (float *)((char *)v6 + 1);
          }
          while (v8 < v14);
          return;
        }
        uint64_t v107 = a2 & 0xFFFFFFE0;
        uint64_t v108 = a2 & 0xFFFFFFF8;
        while (a2 >= 0x20)
        {
          unint64_t v111 = 0;
          int64x2_t v112 = 0uLL;
          int64x2_t v113 = 0uLL;
          int64x2_t v114 = 0uLL;
          int64x2_t v115 = 0uLL;
          int64x2_t v116 = 0uLL;
          int64x2_t v117 = 0uLL;
          int64x2_t v118 = 0uLL;
          int64x2_t v119 = 0uLL;
          int64x2_t v120 = 0uLL;
          int64x2_t v121 = 0uLL;
          int64x2_t v122 = 0uLL;
          int64x2_t v123 = 0uLL;
          int64x2_t v124 = 0uLL;
          int64x2_t v125 = 0uLL;
          int64x2_t v126 = 0uLL;
          int64x2_t v127 = 0uLL;
          do
          {
            int8x16_t v128 = v8[v111 / 0x10];
            int8x16_t v129 = v8[v111 / 0x10 + 1];
            uint32x4_t v130 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_24F60F060);
            uint32x4_t v131 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_24F60F050);
            uint32x4_t v132 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_24F60F040);
            uint32x4_t v133 = (uint32x4_t)vqtbl1q_s8(v128, (int8x16_t)xmmword_24F60F070);
            uint32x4_t v134 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_24F60F060);
            uint32x4_t v135 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_24F60F050);
            uint32x4_t v136 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_24F60F040);
            uint32x4_t v137 = (uint32x4_t)vqtbl1q_s8(v129, (int8x16_t)xmmword_24F60F070);
            int64x2_t v115 = (int64x2_t)vaddw_high_u32((uint64x2_t)v115, v131);
            int64x2_t v113 = (int64x2_t)vaddw_high_u32((uint64x2_t)v113, v132);
            int64x2_t v116 = (int64x2_t)vaddw_u32((uint64x2_t)v116, *(uint32x2_t *)v130.i8);
            int64x2_t v114 = (int64x2_t)vaddw_u32((uint64x2_t)v114, *(uint32x2_t *)v131.i8);
            int64x2_t v112 = (int64x2_t)vaddw_u32((uint64x2_t)v112, *(uint32x2_t *)v132.i8);
            int64x2_t v117 = (int64x2_t)vaddw_high_u32((uint64x2_t)v117, v130);
            int64x2_t v118 = (int64x2_t)vaddw_u32((uint64x2_t)v118, *(uint32x2_t *)v133.i8);
            int64x2_t v119 = (int64x2_t)vaddw_high_u32((uint64x2_t)v119, v133);
            int64x2_t v123 = (int64x2_t)vaddw_high_u32((uint64x2_t)v123, v135);
            int64x2_t v121 = (int64x2_t)vaddw_high_u32((uint64x2_t)v121, v136);
            int64x2_t v124 = (int64x2_t)vaddw_u32((uint64x2_t)v124, *(uint32x2_t *)v134.i8);
            int64x2_t v122 = (int64x2_t)vaddw_u32((uint64x2_t)v122, *(uint32x2_t *)v135.i8);
            int64x2_t v120 = (int64x2_t)vaddw_u32((uint64x2_t)v120, *(uint32x2_t *)v136.i8);
            int64x2_t v125 = (int64x2_t)vaddw_high_u32((uint64x2_t)v125, v134);
            int64x2_t v126 = (int64x2_t)vaddw_u32((uint64x2_t)v126, *(uint32x2_t *)v137.i8);
            int64x2_t v127 = (int64x2_t)vaddw_high_u32((uint64x2_t)v127, v137);
            v111 += 32;
          }
          while (v107 != v111);
          int64x2_t v13 = vaddq_s64(v126, v118);
          unint64_t v109 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v120, v112), vaddq_s64(v124, v116)), vaddq_s64(vaddq_s64(v122, v114), v13)), vaddq_s64(vaddq_s64(vaddq_s64(v121, v113), vaddq_s64(v125, v117)), vaddq_s64(vaddq_s64(v123, v115), vaddq_s64(v127, v119)))));
          if (v107 == a2) {
            goto LABEL_197;
          }
          uint64_t v110 = a2 & 0xFFFFFFE0;
          uint64_t v138 = v110;
          if ((a2 & 0x18) != 0) {
            goto LABEL_204;
          }
          do
LABEL_207:
            v109 += v8->u8[v138++];
          while (a2 != v138);
LABEL_197:
          BOOL v8 = (int8x16_t *)((char *)v8 + a2);
          *(unsigned char *)BOOL v6 = v109 / a2;
          BOOL v6 = (float *)((char *)v6 + 1);
          if (v8 >= v14) {
            return;
          }
        }
        unint64_t v109 = 0;
        uint64_t v110 = 0;
LABEL_204:
        int64x2_t v139 = 0uLL;
        int64x2_t v140 = (int64x2_t)v109;
        int64x2_t v141 = 0uLL;
        int64x2_t v142 = 0uLL;
        do
        {
          v13.i64[0] = *(uint64_t *)((char *)v8->i64 + v110);
          uint32x4_t v143 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v13, (int8x16_t)xmmword_24F60F050);
          int64x2_t v13 = (int64x2_t)vqtbl1q_s8((int8x16_t)v13, (int8x16_t)xmmword_24F60F040);
          int64x2_t v142 = (int64x2_t)vaddw_high_u32((uint64x2_t)v142, v143);
          int64x2_t v139 = (int64x2_t)vaddw_high_u32((uint64x2_t)v139, (uint32x4_t)v13);
          int64x2_t v141 = (int64x2_t)vaddw_u32((uint64x2_t)v141, *(uint32x2_t *)v143.i8);
          int64x2_t v140 = (int64x2_t)vaddw_u32((uint64x2_t)v140, *(uint32x2_t *)v13.i8);
          v110 += 8;
        }
        while (v108 != v110);
        unint64_t v109 = vaddvq_s64(vaddq_s64(vaddq_s64(v140, v141), vaddq_s64(v139, v142)));
        uint64_t v138 = a2 & 0xFFFFFFF8;
        if (v108 == a2) {
          goto LABEL_197;
        }
        goto LABEL_207;
      case 36169:
      case 36170:
      case 36171:
      case 36172:
      case 36173:
      case 36174:
      case 36175:
      case 36176:
      case 36177:
      case 36178:
      case 36179:
      case 36180:
      case 36181:
      case 36182:
      case 36183:
      case 36184:
      case 36185:
      case 36186:
      case 36187:
      case 36188:
      case 36189:
      case 36190:
      case 36191:
      case 36192:
      case 36193:
      case 36195:
      case 36196:
      case 36197:
      case 36198:
      case 36199:
      case 36200:
      case 36201:
      case 36202:
      case 36203:
      case 36204:
      case 36205:
      case 36206:
      case 36207:
      case 36210:
      case 36211:
      case 36212:
      case 36213:
      case 36216:
      case 36217:
      case 36218:
      case 36219:
      case 36222:
      case 36223:
      case 36224:
      case 36225:
      case 36228:
      case 36229:
      case 36230:
      case 36231:
      case 36234:
      case 36235:
      case 36236:
      case 36237:
        return;
      case 36194:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,53ull,52ull,48ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
        return;
      case 36208:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, &v8->i8[8], __n, (uint64_t)(v6 + 2));
        return;
      case 36209:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, &v8->u32[2], __n, (uint64_t)(v6 + 2));
        return;
      case 36214:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(a2, v8, __n, v6);
        return;
      case 36215:
        GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(a2, (unsigned int *)v8, __n, v6);
        return;
      case 36220:
        goto LABEL_55;
      case 36221:
        goto LABEL_63;
      case 36226:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, &v8->i8[8], __n, (uint64_t)(v6 + 2));
        return;
      case 36227:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8->i64, __n, (uint64_t)v6);
        GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, &v8->i32[2], __n, (uint64_t)(v6 + 2));
        return;
      case 36232:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(a2, v8->i64, __n, v6);
        return;
      case 36233:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(a2, v8->i32, __n, v6);
        return;
      case 36238:
LABEL_72:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(a2, v8->i8, __n, v6);
        return;
      case 36239:
LABEL_69:
        GPUTools::GL::MSAABufferResolver<long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(a2, v8->i8, __n, v6);
        return;
      default:
        switch(v10)
        {
          case 36756:
            if (!__n) {
              return;
            }
            unint64_t v17 = (int8x16_t *)((char *)v8 + __n);
            if (a2 < 8)
            {
              do
              {
                uint64_t v20 = v8->i8[0];
                if (a2 != 1)
                {
                  v20 += v8->i8[1];
                  if (a2 != 2)
                  {
                    v20 += v8->i8[2];
                    if (a2 != 3)
                    {
                      v20 += v8->i8[3];
                      if (a2 != 4)
                      {
                        v20 += v8->i8[4];
                        if (a2 != 5)
                        {
                          v20 += v8->i8[5];
                          if (a2 != 6) {
                            v20 += v8->i8[6];
                          }
                        }
                      }
                    }
                  }
                }
                BOOL v8 = (int8x16_t *)((char *)v8 + a2);
                *(unsigned char *)BOOL v6 = v20 / a2;
                BOOL v6 = (float *)((char *)v6 + 1);
              }
              while (v8 < v17);
              return;
            }
            uint64_t v18 = a2 & 0xFFFFFFE0;
            uint64_t v19 = a2 & 0xFFFFFFF8;
            break;
          case 36757:
LABEL_66:
            GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(a2, v8->i8, __n, v6);
            return;
          case 36758:
            goto LABEL_69;
          case 36759:
            goto LABEL_72;
          default:
            if (v10 == 36975)
            {
LABEL_76:
              GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,41ull,32ull,51ull,42ull,61ull,52ull,63ull,62ull>(a2, v8->i8, __n, v6);
            }
            return;
        }
        break;
    }
    while (a2 >= 0x20)
    {
      unint64_t v23 = 0;
      int64x2_t v24 = 0uLL;
      int64x2_t v25 = 0uLL;
      int64x2_t v26 = 0uLL;
      int64x2_t v27 = 0uLL;
      int64x2_t v28 = 0uLL;
      int64x2_t v29 = 0uLL;
      int64x2_t v30 = 0uLL;
      int64x2_t v31 = 0uLL;
      int64x2_t v32 = 0uLL;
      int64x2_t v33 = 0uLL;
      int64x2_t v34 = 0uLL;
      int64x2_t v35 = 0uLL;
      int64x2_t v36 = 0uLL;
      int64x2_t v37 = 0uLL;
      int64x2_t v38 = 0uLL;
      int64x2_t v39 = 0uLL;
      do
      {
        int8x16_t v40 = v8[v23 / 0x10];
        int8x16_t v41 = v8[v23 / 0x10 + 1];
        int16x8_t v42 = vmovl_s8(*(int8x8_t *)v40.i8);
        int32x4_t v43 = vmovl_s16(*(int16x4_t *)v42.i8);
        int32x4_t v44 = vmovl_high_s16(v42);
        int16x8_t v45 = vmovl_high_s8(v40);
        int32x4_t v46 = vmovl_s16(*(int16x4_t *)v45.i8);
        int32x4_t v47 = vmovl_high_s16(v45);
        int16x8_t v48 = vmovl_s8(*(int8x8_t *)v41.i8);
        int32x4_t v49 = vmovl_s16(*(int16x4_t *)v48.i8);
        int32x4_t v50 = vmovl_high_s16(v48);
        int16x8_t v51 = vmovl_high_s8(v41);
        int32x4_t v52 = vmovl_s16(*(int16x4_t *)v51.i8);
        int32x4_t v53 = vmovl_high_s16(v51);
        int64x2_t v29 = vaddw_high_s32(v29, v46);
        int64x2_t v27 = vaddw_high_s32(v27, v44);
        int64x2_t v30 = vaddw_s32(v30, *(int32x2_t *)v47.i8);
        int64x2_t v28 = vaddw_s32(v28, *(int32x2_t *)v46.i8);
        int64x2_t v26 = vaddw_s32(v26, *(int32x2_t *)v44.i8);
        int64x2_t v25 = vaddw_high_s32(v25, v43);
        int64x2_t v31 = vaddw_high_s32(v31, v47);
        int64x2_t v24 = vaddw_s32(v24, *(int32x2_t *)v43.i8);
        int64x2_t v37 = vaddw_high_s32(v37, v52);
        int64x2_t v35 = vaddw_high_s32(v35, v50);
        int64x2_t v38 = vaddw_s32(v38, *(int32x2_t *)v53.i8);
        int64x2_t v36 = vaddw_s32(v36, *(int32x2_t *)v52.i8);
        int64x2_t v34 = vaddw_s32(v34, *(int32x2_t *)v50.i8);
        int64x2_t v33 = vaddw_high_s32(v33, v49);
        int64x2_t v39 = vaddw_high_s32(v39, v53);
        int64x2_t v32 = vaddw_s32(v32, *(int32x2_t *)v49.i8);
        v23 += 32;
      }
      while (v18 != v23);
      uint64_t v21 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v32, v24), vaddq_s64(v36, v28)), vaddq_s64(vaddq_s64(v34, v26), vaddq_s64(v38, v30))), vaddq_s64(vaddq_s64(vaddq_s64(v33, v25), vaddq_s64(v37, v29)), vaddq_s64(vaddq_s64(v35, v27), vaddq_s64(v39, v31)))));
      if (v18 == a2) {
        goto LABEL_39;
      }
      uint64_t v22 = a2 & 0xFFFFFFE0;
      uint64_t v54 = v22;
      if ((a2 & 0x18) != 0) {
        goto LABEL_46;
      }
      do
LABEL_49:
        v21 += v8->i8[v54++];
      while (a2 != v54);
LABEL_39:
      BOOL v8 = (int8x16_t *)((char *)v8 + a2);
      *(unsigned char *)BOOL v6 = v21 / a2;
      BOOL v6 = (float *)((char *)v6 + 1);
      if (v8 >= v17) {
        return;
      }
    }
    uint64_t v21 = 0;
    uint64_t v22 = 0;
LABEL_46:
    int64x2_t v55 = 0uLL;
    int64x2_t v56 = (int64x2_t)(unint64_t)v21;
    int64x2_t v57 = 0uLL;
    int64x2_t v58 = 0uLL;
    do
    {
      int16x8_t v59 = vmovl_s8(*(int8x8_t *)&v8->i8[v22]);
      int32x4_t v60 = vmovl_s16(*(int16x4_t *)v59.i8);
      int32x4_t v61 = vmovl_high_s16(v59);
      int64x2_t v58 = vaddw_high_s32(v58, v61);
      int64x2_t v57 = vaddw_s32(v57, *(int32x2_t *)v61.i8);
      int64x2_t v55 = vaddw_high_s32(v55, v60);
      int64x2_t v56 = vaddw_s32(v56, *(int32x2_t *)v60.i8);
      v22 += 8;
    }
    while (v19 != v22);
    uint64_t v21 = vaddvq_s64(vaddq_s64(vaddq_s64(v56, v57), vaddq_s64(v55, v58)));
    uint64_t v54 = a2 & 0xFFFFFFF8;
    if (v19 == a2) {
      goto LABEL_39;
    }
    goto LABEL_49;
  }
  switch(v10)
  {
    case 33189:
      GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull>(a2, (unsigned __int16 *)v8, __n, v6);
      return;
    case 33190:
      GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,0ull,0ull>(a2, (uint32x4_t *)v8, __n, (uint64_t)v6);
      return;
    case 33191:
    case 33192:
    case 33193:
    case 33194:
    case 33195:
    case 33196:
    case 33197:
    case 33198:
    case 33199:
    case 33200:
    case 33201:
    case 33202:
    case 33203:
    case 33204:
    case 33205:
    case 33206:
    case 33207:
    case 33208:
    case 33209:
    case 33210:
    case 33211:
    case 33212:
    case 33213:
    case 33214:
    case 33215:
    case 33216:
    case 33217:
    case 33218:
    case 33219:
    case 33220:
    case 33221:
    case 33222:
    case 33223:
    case 33224:
    case 33225:
    case 33226:
    case 33227:
    case 33228:
    case 33229:
    case 33230:
    case 33231:
    case 33232:
    case 33233:
    case 33234:
    case 33235:
    case 33236:
    case 33237:
    case 33238:
    case 33239:
    case 33240:
    case 33241:
    case 33242:
    case 33243:
    case 33244:
    case 33245:
    case 33246:
    case 33247:
    case 33248:
    case 33249:
    case 33250:
    case 33251:
    case 33252:
    case 33253:
    case 33254:
    case 33255:
    case 33256:
    case 33257:
    case 33258:
    case 33259:
    case 33260:
    case 33261:
    case 33262:
    case 33263:
    case 33264:
    case 33265:
    case 33266:
    case 33267:
    case 33268:
    case 33269:
    case 33270:
    case 33271:
    case 33272:
    case 33273:
    case 33274:
    case 33275:
    case 33276:
    case 33277:
    case 33278:
    case 33279:
    case 33280:
    case 33281:
    case 33282:
    case 33283:
    case 33284:
    case 33285:
    case 33286:
    case 33287:
    case 33288:
    case 33289:
    case 33290:
    case 33291:
    case 33292:
    case 33293:
    case 33294:
    case 33295:
    case 33296:
    case 33297:
    case 33298:
    case 33299:
    case 33300:
    case 33301:
    case 33302:
    case 33303:
    case 33304:
    case 33305:
    case 33306:
    case 33307:
    case 33308:
    case 33309:
    case 33310:
    case 33311:
    case 33312:
    case 33313:
    case 33314:
    case 33315:
    case 33316:
    case 33317:
    case 33318:
    case 33319:
    case 33320:
    case 33322:
    case 33324:
      return;
    case 33321:
    case 33330:
      goto LABEL_12;
    case 33323:
    case 33336:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
      return;
    case 33325:
      GPUTools::GL::MSAABufferResolver<float>::resolve<2u,(unsigned char)16,(unsigned char)0,(unsigned char)0,(unsigned char)0>(a2, (unsigned __int16 *)v8, __n, v6);
      return;
    case 33326:
      GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)32,(unsigned char)0,(unsigned char)0,(unsigned char)0>(a2, (unint64_t)v8, __n, v6);
      return;
    case 33327:
      GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)16,(unsigned char)16,(unsigned char)0,(unsigned char)0>(a2, v8->i8, __n, v6);
      return;
    case 33328:
      GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)32,(unsigned char)32,(unsigned char)0,(unsigned char)0>(a2, (unint64_t)v8, __n, v6, v12);
      return;
    case 33329:
      if (!__n) {
        return;
      }
      v62 = (int8x16_t *)((char *)v8 + __n);
      if (a2 >= 8)
      {
        uint64_t v63 = a2 & 0xFFFFFFE0;
        uint64_t v64 = a2 & 0xFFFFFFF8;
        while (a2 >= 0x20)
        {
          unint64_t v68 = 0;
          int64x2_t v69 = 0uLL;
          int64x2_t v70 = 0uLL;
          int64x2_t v71 = 0uLL;
          int64x2_t v72 = 0uLL;
          int64x2_t v73 = 0uLL;
          int64x2_t v74 = 0uLL;
          int64x2_t v75 = 0uLL;
          int64x2_t v76 = 0uLL;
          int64x2_t v77 = 0uLL;
          int64x2_t v78 = 0uLL;
          int64x2_t v79 = 0uLL;
          int64x2_t v80 = 0uLL;
          int64x2_t v81 = 0uLL;
          int64x2_t v82 = 0uLL;
          int64x2_t v83 = 0uLL;
          int64x2_t v84 = 0uLL;
          do
          {
            int8x16_t v85 = v8[v68 / 0x10];
            int8x16_t v86 = v8[v68 / 0x10 + 1];
            int16x8_t v87 = vmovl_s8(*(int8x8_t *)v85.i8);
            int32x4_t v88 = vmovl_s16(*(int16x4_t *)v87.i8);
            int32x4_t v89 = vmovl_high_s16(v87);
            int16x8_t v90 = vmovl_high_s8(v85);
            int32x4_t v91 = vmovl_s16(*(int16x4_t *)v90.i8);
            int32x4_t v92 = vmovl_high_s16(v90);
            int16x8_t v93 = vmovl_s8(*(int8x8_t *)v86.i8);
            int32x4_t v94 = vmovl_s16(*(int16x4_t *)v93.i8);
            int32x4_t v95 = vmovl_high_s16(v93);
            int16x8_t v96 = vmovl_high_s8(v86);
            int32x4_t v97 = vmovl_s16(*(int16x4_t *)v96.i8);
            int32x4_t v98 = vmovl_high_s16(v96);
            int64x2_t v74 = vaddw_high_s32(v74, v91);
            int64x2_t v72 = vaddw_high_s32(v72, v89);
            int64x2_t v75 = vaddw_s32(v75, *(int32x2_t *)v92.i8);
            int64x2_t v73 = vaddw_s32(v73, *(int32x2_t *)v91.i8);
            int64x2_t v71 = vaddw_s32(v71, *(int32x2_t *)v89.i8);
            int64x2_t v70 = vaddw_high_s32(v70, v88);
            int64x2_t v76 = vaddw_high_s32(v76, v92);
            int64x2_t v69 = vaddw_s32(v69, *(int32x2_t *)v88.i8);
            int64x2_t v82 = vaddw_high_s32(v82, v97);
            int64x2_t v80 = vaddw_high_s32(v80, v95);
            int64x2_t v83 = vaddw_s32(v83, *(int32x2_t *)v98.i8);
            int64x2_t v81 = vaddw_s32(v81, *(int32x2_t *)v97.i8);
            int64x2_t v79 = vaddw_s32(v79, *(int32x2_t *)v95.i8);
            int64x2_t v78 = vaddw_high_s32(v78, v94);
            int64x2_t v84 = vaddw_high_s32(v84, v98);
            int64x2_t v77 = vaddw_s32(v77, *(int32x2_t *)v94.i8);
            v68 += 32;
          }
          while (v63 != v68);
          uint64_t v66 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v77, v69), vaddq_s64(v81, v73)), vaddq_s64(vaddq_s64(v79, v71), vaddq_s64(v83, v75))), vaddq_s64(vaddq_s64(vaddq_s64(v78, v70), vaddq_s64(v82, v74)), vaddq_s64(vaddq_s64(v80, v72), vaddq_s64(v84, v76)))));
          if (v63 == a2) {
            goto LABEL_121;
          }
          uint64_t v67 = a2 & 0xFFFFFFE0;
          uint64_t v99 = v67;
          if ((a2 & 0x18) != 0) {
            goto LABEL_128;
          }
          do
LABEL_131:
            v66 += v8->i8[v99++];
          while (a2 != v99);
LABEL_121:
          BOOL v8 = (int8x16_t *)((char *)v8 + a2);
          *(unsigned char *)BOOL v6 = v66 / a2;
          BOOL v6 = (float *)((char *)v6 + 1);
          if (v8 >= v62) {
            return;
          }
        }
        uint64_t v66 = 0;
        uint64_t v67 = 0;
LABEL_128:
        int64x2_t v100 = 0uLL;
        int64x2_t v101 = (int64x2_t)(unint64_t)v66;
        int64x2_t v102 = 0uLL;
        int64x2_t v103 = 0uLL;
        do
        {
          int16x8_t v104 = vmovl_s8(*(int8x8_t *)&v8->i8[v67]);
          int32x4_t v105 = vmovl_s16(*(int16x4_t *)v104.i8);
          int32x4_t v106 = vmovl_high_s16(v104);
          int64x2_t v103 = vaddw_high_s32(v103, v106);
          int64x2_t v102 = vaddw_s32(v102, *(int32x2_t *)v106.i8);
          int64x2_t v100 = vaddw_high_s32(v100, v105);
          int64x2_t v101 = vaddw_s32(v101, *(int32x2_t *)v105.i8);
          v67 += 8;
        }
        while (v64 != v67);
        uint64_t v66 = vaddvq_s64(vaddq_s64(vaddq_s64(v101, v102), vaddq_s64(v100, v103)));
        uint64_t v99 = a2 & 0xFFFFFFF8;
        if (v64 == a2) {
          goto LABEL_121;
        }
        goto LABEL_131;
      }
      do
      {
        uint64_t v65 = v8->i8[0];
        if (a2 != 1)
        {
          v65 += v8->i8[1];
          if (a2 != 2)
          {
            v65 += v8->i8[2];
            if (a2 != 3)
            {
              v65 += v8->i8[3];
              if (a2 != 4)
              {
                v65 += v8->i8[4];
                if (a2 != 5)
                {
                  v65 += v8->i8[5];
                  if (a2 != 6) {
                    v65 += v8->i8[6];
                  }
                }
              }
            }
          }
        }
        BOOL v8 = (int8x16_t *)((char *)v8 + a2);
        *(unsigned char *)BOOL v6 = v65 / a2;
        BOOL v6 = (float *)((char *)v6 + 1);
      }
      while (v8 < v62);
      break;
    case 33331:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
      return;
    case 33332:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, (unsigned __int16 *)v8, __n, v6);
      return;
    case 33333:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, v8->i32, __n, (uint64_t)v6);
      return;
    case 33334:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(a2, (unsigned int *)v8, __n, (uint64_t)v6);
      return;
    case 33335:
      goto LABEL_66;
    case 33337:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,47ull,32ull,65ull,48ull,0ull,0ull,0ull,0ull>(a2, (unsigned int *)v8, __n, v6);
      return;
    case 33338:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,47ull,32ull,63ull,48ull,0ull,0ull,0ull,0ull>(a2, (unsigned int *)v8, __n, v6);
      return;
    case 33339:
      GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8, __n, (uint64_t)v6);
      return;
    case 33340:
      GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(a2, v8, __n, (uint64_t)v6);
      return;
    default:
      switch(v10)
      {
        case 32849:
          GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,32ull,0ull,0ull>(a2, (unsigned __int8 *)v8, __n, v6);
          break;
        case 32850:
        case 32851:
        case 32852:
        case 32853:
          return;
        case 32854:
          GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,60ull,59ull,56ull,55ull,52ull,51ull,48ull>(a2, (unsigned __int8 *)v8, __n, v6);
          break;
        case 32855:
          GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,54ull,53ull,49ull,48ull,48ull>(a2, v8->i8, __n, v6);
          break;
        case 32856:
          goto LABEL_55;
        case 32857:
          goto LABEL_76;
        default:
          switch(v10)
          {
            case 34836:
              GPUTools::GL::MSAABufferResolver<float>::resolve<16u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)32>(a2, (unint64_t)v8, __n, (int32x4_t *)v6, v12);
              break;
            case 34837:
              GPUTools::GL::MSAABufferResolver<float>::resolve<12u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)0>(a2, (float32x2_t *)v8, __n, v6, v12);
              break;
            case 34842:
              GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)16>(a2, v8->i16, __n, v6);
              break;
            case 34843:
              GPUTools::GL::MSAABufferResolver<float>::resolve<6u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)0>(a2, (unsigned __int16 *)v8, __n, v6);
              break;
            default:
              return;
          }
          break;
      }
      return;
  }
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(unint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    BOOL v5 = (unsigned __int16 *)((char *)a2 + a3);
    uint64_t v6 = 2 * (v4 - 1) + 2;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        unint64_t v9 = *a2;
        if (result >= 2)
        {
          v9 += a2[1];
          if (v4 != 2)
          {
            v9 += a2[2];
            if (v4 != 3)
            {
              v9 += a2[3];
              if (v4 != 4)
              {
                v9 += a2[4];
                if (v4 != 5)
                {
                  v9 += a2[5];
                  if (v4 != 6) {
                    v9 += a2[6];
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned __int16 *)((char *)a2 + v6);
        *a4++ = v9 / v4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v7 > 0xF)
      {
        uint64_t v26 = v7 & 0xFFFFFFF0;
        if (v26 == v7)
        {
          do
          {
            int64x2_t v27 = 0uLL;
            int64x2_t v28 = (const char *)a2;
            int64x2_t v29 = 0uLL;
            uint64_t v30 = v26;
            int64x2_t v31 = 0uLL;
            int64x2_t v32 = 0uLL;
            int64x2_t v33 = 0uLL;
            int64x2_t v34 = 0uLL;
            int64x2_t v35 = 0uLL;
            int64x2_t v36 = 0uLL;
            do
            {
              int8x16x2_t v102 = vld2q_s8(v28);
              v28 += 32;
              uint16x8_t v37 = vmovl_high_u8((uint8x16_t)v102.val[0]);
              uint32x4_t v38 = vmovl_high_u16(v37);
              v39.i64[0] = v38.u32[2];
              v39.i64[1] = v38.u32[3];
              int8x16_t v40 = v39;
              v39.i64[0] = v38.u32[0];
              v39.i64[1] = v38.u32[1];
              int8x16_t v41 = v39;
              uint32x4_t v42 = vmovl_u16(*(uint16x4_t *)v37.i8);
              v39.i64[0] = v42.u32[2];
              v39.i64[1] = v42.u32[3];
              int8x16_t v43 = v39;
              uint16x8_t v44 = vmovl_u8(*(uint8x8_t *)v102.val[0].i8);
              uint32x4_t v45 = vmovl_high_u16(v44);
              v39.i64[0] = v45.u32[2];
              v39.i64[1] = v45.u32[3];
              int8x16_t v46 = v39;
              v39.i64[0] = v42.u32[0];
              v39.i64[1] = v42.u32[1];
              int8x16_t v47 = v39;
              v39.i64[0] = v45.u32[0];
              v39.i64[1] = v45.u32[1];
              int8x16_t v48 = v39;
              uint32x4_t v49 = vmovl_u16(*(uint16x4_t *)v44.i8);
              v39.i64[0] = v49.u32[2];
              v39.i64[1] = v49.u32[3];
              int8x16_t v50 = v39;
              v39.i64[0] = v49.u32[0];
              v39.i64[1] = v49.u32[1];
              uint16x8_t v51 = vmovl_u8(*(uint8x8_t *)v102.val[1].i8);
              uint32x4_t v52 = vmovl_u16(*(uint16x4_t *)v51.i8);
              uint32x4_t v53 = vmovl_high_u16(v51);
              v102.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v102.val[1]);
              v102.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v102.val[0].i8);
              v102.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v102.val[0]);
              int64x2_t v36 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v102.val[0], 8uLL), v40), v36);
              int64x2_t v35 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v102.val[0].i8, 8uLL), v41), v35);
              int64x2_t v34 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v102.val[1], 8uLL), v43), v34);
              int64x2_t v32 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v53, 8uLL), v46), v32);
              int64x2_t v33 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v102.val[1].i8, 8uLL), v47), v33);
              int64x2_t v31 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v53.i8, 8uLL), v48), v31);
              int64x2_t v29 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v52, 8uLL), v50), v29);
              int64x2_t v27 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v52.i8, 8uLL), v39), v27);
              v30 -= 16;
            }
            while (v30);
            a2 = (unsigned __int16 *)((char *)a2 + v6);
            *a4++ = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v27, v33), vaddq_s64(v31, v35)), vaddq_s64(vaddq_s64(v29, v34), vaddq_s64(v32, v36))))/ v4;
          }
          while (a2 < v5);
        }
        else
        {
          do
          {
            int64x2_t v54 = 0uLL;
            uint64_t v55 = v7 & 0xFFFFFFF0;
            int64x2_t v56 = 0uLL;
            int64x2_t v57 = (const char *)a2;
            int64x2_t v58 = 0uLL;
            int64x2_t v59 = 0uLL;
            int64x2_t v60 = 0uLL;
            int64x2_t v61 = 0uLL;
            int64x2_t v62 = 0uLL;
            int64x2_t v63 = 0uLL;
            do
            {
              int8x16x2_t v103 = vld2q_s8(v57);
              v57 += 32;
              uint16x8_t v64 = vmovl_high_u8((uint8x16_t)v103.val[0]);
              uint32x4_t v65 = vmovl_high_u16(v64);
              v66.i64[0] = v65.u32[2];
              v66.i64[1] = v65.u32[3];
              int8x16_t v67 = v66;
              v66.i64[0] = v65.u32[0];
              v66.i64[1] = v65.u32[1];
              int8x16_t v68 = v66;
              uint32x4_t v69 = vmovl_u16(*(uint16x4_t *)v64.i8);
              v66.i64[0] = v69.u32[2];
              v66.i64[1] = v69.u32[3];
              int8x16_t v70 = v66;
              uint16x8_t v71 = vmovl_u8(*(uint8x8_t *)v103.val[0].i8);
              uint32x4_t v72 = vmovl_high_u16(v71);
              v66.i64[0] = v72.u32[2];
              v66.i64[1] = v72.u32[3];
              int8x16_t v73 = v66;
              v66.i64[0] = v69.u32[0];
              v66.i64[1] = v69.u32[1];
              int8x16_t v74 = v66;
              v66.i64[0] = v72.u32[0];
              v66.i64[1] = v72.u32[1];
              int8x16_t v75 = v66;
              uint32x4_t v76 = vmovl_u16(*(uint16x4_t *)v71.i8);
              v66.i64[0] = v76.u32[2];
              v66.i64[1] = v76.u32[3];
              int8x16_t v77 = v66;
              v66.i64[0] = v76.u32[0];
              v66.i64[1] = v76.u32[1];
              uint16x8_t v78 = vmovl_u8(*(uint8x8_t *)v103.val[1].i8);
              uint32x4_t v79 = vmovl_u16(*(uint16x4_t *)v78.i8);
              uint32x4_t v80 = vmovl_high_u16(v78);
              v103.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v103.val[1]);
              v103.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v103.val[0].i8);
              v103.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v103.val[0]);
              int64x2_t v63 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v103.val[0], 8uLL), v67), v63);
              int64x2_t v62 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v103.val[0].i8, 8uLL), v68), v62);
              int64x2_t v61 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v103.val[1], 8uLL), v70), v61);
              int64x2_t v59 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v80, 8uLL), v73), v59);
              int64x2_t v60 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v103.val[1].i8, 8uLL), v74), v60);
              int64x2_t v58 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v80.i8, 8uLL), v75), v58);
              int64x2_t v56 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(v79, 8uLL), v77), v56);
              int64x2_t v54 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v79.i8, 8uLL), v66), v54);
              v55 -= 16;
            }
            while (v55);
            uint64_t v81 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v54, v60), vaddq_s64(v58, v62)), vaddq_s64(vaddq_s64(v56, v61), vaddq_s64(v59, v63))));
            unint64_t v82 = v81;
            uint64_t v83 = v26;
            int v84 = v7 & 0xFFFFFFF0;
            if ((v7 & 8) == 0) {
              goto LABEL_38;
            }
            int64x2_t v85 = 0uLL;
            int64x2_t v86 = (int64x2_t)(unint64_t)v81;
            uint64_t v87 = v8 - v26;
            uint64_t v88 = (2 * v4) & 0x1FFFFFFE0;
            int64x2_t v89 = 0uLL;
            int64x2_t v90 = 0uLL;
            do
            {
              int32x4_t v91 = (char *)a2 + v88;
              int8x8x2_t v101 = vld2_s8(v91);
              uint16x8_t v92 = vmovl_u8((uint8x8_t)v101.val[0]);
              uint32x4_t v93 = vmovl_high_u16(v92);
              v94.i64[0] = v93.u32[2];
              v94.i64[1] = v93.u32[3];
              int8x16_t v95 = v94;
              v94.i64[0] = v93.u32[0];
              v94.i64[1] = v93.u32[1];
              int8x16_t v96 = v94;
              uint32x4_t v97 = vmovl_u16(*(uint16x4_t *)v92.i8);
              v94.i64[0] = v97.u32[2];
              v94.i64[1] = v97.u32[3];
              int8x16_t v98 = v94;
              v94.i64[0] = v97.u32[0];
              v94.i64[1] = v97.u32[1];
              int8x8x2_t v101 = (int8x8x2_t)vmovl_u8((uint8x8_t)v101.val[1]);
              *(int8x8x2_t *)((char *)&v101 + 8) = (int8x8x2_t)vmovl_u16((uint16x4_t)v101.val[0]);
              int8x8x2_t v101 = (int8x8x2_t)vmovl_high_u16((uint16x8_t)v101);
              int64x2_t v90 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v101, 8uLL), v95), v90);
              int64x2_t v89 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v101.val[0], 8uLL), v96), v89);
              int64x2_t v85 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(*(uint32x4_t *)((char *)&v101 + 8), 8uLL), v98), v85);
              int64x2_t v86 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v101.val[1], 8uLL), v94), v86);
              v88 += 16;
              v87 -= 8;
            }
            while (v87);
            unint64_t v82 = vaddvq_s64(vaddq_s64(vaddq_s64(v86, v89), vaddq_s64(v85, v90)));
            uint64_t v83 = v7 & 0xFFFFFFF8;
            int v84 = v7 & 0xFFFFFFF8;
            if (v8 != v7)
            {
LABEL_38:
              int v99 = v4 - v84;
              do
              {
                v82 += a2[v83++];
                --v99;
              }
              while (v99);
            }
            a2 = (unsigned __int16 *)((char *)a2 + v6);
            uint64_t result = v82 / v4;
            *a4++ = result;
          }
          while (a2 < v5);
        }
      }
      else
      {
        do
        {
          int64x2_t v10 = 0uLL;
          BOOL v11 = (const char *)a2;
          uint64_t v12 = v7 & 0xFFFFFFF8;
          int64x2_t v13 = 0uLL;
          int64x2_t v14 = 0uLL;
          int64x2_t v15 = 0uLL;
          do
          {
            int8x8x2_t v100 = vld2_s8(v11);
            v11 += 16;
            uint16x8_t v16 = vmovl_u8((uint8x8_t)v100.val[0]);
            uint32x4_t v17 = vmovl_high_u16(v16);
            v18.i64[0] = v17.u32[2];
            v18.i64[1] = v17.u32[3];
            int8x16_t v19 = v18;
            v18.i64[0] = v17.u32[0];
            v18.i64[1] = v17.u32[1];
            int8x16_t v20 = v18;
            uint32x4_t v21 = vmovl_u16(*(uint16x4_t *)v16.i8);
            v18.i64[0] = v21.u32[2];
            v18.i64[1] = v21.u32[3];
            int8x16_t v22 = v18;
            v18.i64[0] = v21.u32[0];
            v18.i64[1] = v21.u32[1];
            int8x8x2_t v100 = (int8x8x2_t)vmovl_u8((uint8x8_t)v100.val[1]);
            *(int8x8x2_t *)((char *)&v100 + 8) = (int8x8x2_t)vmovl_u16((uint16x4_t)v100.val[0]);
            int8x8x2_t v100 = (int8x8x2_t)vmovl_high_u16((uint16x8_t)v100);
            int64x2_t v15 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32((uint32x4_t)v100, 8uLL), v19), v15);
            int64x2_t v14 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v100.val[0], 8uLL), v20), v14);
            int64x2_t v13 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_high_n_u32(*(uint32x4_t *)((char *)&v100 + 8), 8uLL), v22), v13);
            int64x2_t v10 = vaddq_s64((int64x2_t)vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v100.val[1], 8uLL), v18), v10);
            v12 -= 8;
          }
          while (v12);
          unint64_t v23 = vaddvq_s64(vaddq_s64(vaddq_s64(v10, v14), vaddq_s64(v13, v15)));
          int v24 = v4 - v8;
          uint64_t v25 = v7 & 0xFFFFFFF8;
          if (v8 != v7)
          {
            do
            {
              uint64_t result = a2[v25];
              v23 += result;
              ++v25;
              --v24;
            }
            while (v24);
          }
          a2 = (unsigned __int16 *)((char *)a2 + v6);
          *a4++ = v23 / v4;
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, _WORD *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    BOOL v5 = &a2[a3];
    uint64_t v6 = 2 * (v4 - 1) + 2;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        uint64_t v9 = (uint64_t)(((unint64_t)*a2 << 48) | ((unint64_t)a2[1] << 56)) >> 48;
        if (result >= 2)
        {
          v9 += (uint64_t)(((unint64_t)a2[2] << 48) | ((unint64_t)a2[3] << 56)) >> 48;
          if (v4 != 2)
          {
            v9 += (uint64_t)(((unint64_t)a2[4] << 48) | ((unint64_t)a2[5] << 56)) >> 48;
            if (v4 != 3)
            {
              v9 += (uint64_t)(((unint64_t)a2[6] << 48) | ((unint64_t)a2[7] << 56)) >> 48;
              if (v4 != 4)
              {
                v9 += (uint64_t)(((unint64_t)a2[8] << 48) | ((unint64_t)a2[9] << 56)) >> 48;
                if (v4 != 5)
                {
                  v9 += (uint64_t)(((unint64_t)a2[10] << 48) | ((unint64_t)a2[11] << 56)) >> 48;
                  if (v4 != 6) {
                    v9 += (uint64_t)(((unint64_t)a2[12] << 48) | ((unint64_t)a2[13] << 56)) >> 48;
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4++ = v9 / v4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v7 > 0xF)
      {
        uint64_t v33 = v7 & 0xFFFFFFF0;
        if (v33 == v7)
        {
          do
          {
            int64x2_t v34 = 0uLL;
            int64x2_t v35 = (const char *)a2;
            int64x2_t v36 = 0uLL;
            uint64_t v37 = v33;
            int64x2_t v38 = 0uLL;
            int64x2_t v39 = 0uLL;
            int64x2_t v40 = 0uLL;
            int64x2_t v41 = 0uLL;
            int64x2_t v42 = 0uLL;
            int64x2_t v43 = 0uLL;
            do
            {
              int8x16x2_t v130 = vld2q_s8(v35);
              v35 += 32;
              uint16x8_t v44 = vmovl_u8(*(uint8x8_t *)v130.val[0].i8);
              uint32x4_t v45 = vmovl_u16(*(uint16x4_t *)v44.i8);
              v46.i64[0] = v45.u32[0];
              v46.i64[1] = v45.u32[1];
              int64x2_t v47 = v46;
              v46.i64[0] = v45.u32[2];
              v46.i64[1] = v45.u32[3];
              int64x2_t v48 = v46;
              uint32x4_t v49 = vmovl_high_u16(v44);
              v46.i64[0] = v49.u32[0];
              v46.i64[1] = v49.u32[1];
              int64x2_t v50 = v46;
              uint16x8_t v51 = vmovl_high_u8((uint8x16_t)v130.val[0]);
              uint32x4_t v52 = vmovl_u16(*(uint16x4_t *)v51.i8);
              v46.i64[0] = v52.u32[0];
              v46.i64[1] = v52.u32[1];
              int64x2_t v53 = v46;
              v46.i64[0] = v49.u32[2];
              v46.i64[1] = v49.u32[3];
              int64x2_t v54 = v46;
              v46.i64[0] = v52.u32[2];
              v46.i64[1] = v52.u32[3];
              int64x2_t v55 = v46;
              uint32x4_t v56 = vmovl_high_u16(v51);
              v46.i64[0] = v56.u32[0];
              v46.i64[1] = v56.u32[1];
              int64x2_t v57 = v46;
              v46.i64[0] = v56.u32[2];
              v46.i64[1] = v56.u32[3];
              int64x2_t v58 = v46;
              uint16x8_t v59 = vmovl_u8(*(uint8x8_t *)v130.val[1].i8);
              uint32x4_t v60 = vmovl_u16(*(uint16x4_t *)v59.i8);
              v46.i64[0] = v60.u32[0];
              v46.i64[1] = v60.u32[1];
              int64x2_t v61 = v46;
              v46.i64[0] = v60.u32[2];
              v46.i64[1] = v60.u32[3];
              int64x2_t v62 = v46;
              uint32x4_t v63 = vmovl_high_u16(v59);
              v46.i64[0] = v63.u32[0];
              v46.i64[1] = v63.u32[1];
              int64x2_t v64 = v46;
              v130.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v130.val[1]);
              v130.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v130.val[0].i8);
              v46.i64[0] = v130.val[1].u32[0];
              v46.i64[1] = v130.val[1].u32[1];
              int64x2_t v65 = v46;
              v46.i64[0] = v63.u32[2];
              v46.i64[1] = v63.u32[3];
              int64x2_t v66 = v46;
              v46.i64[0] = v130.val[1].u32[2];
              v46.i64[1] = v130.val[1].u32[3];
              v130.val[1] = (int8x16_t)v46;
              v130.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v130.val[0]);
              v46.i64[0] = v130.val[0].u32[0];
              v46.i64[1] = v130.val[0].u32[1];
              int64x2_t v67 = v46;
              v46.i64[0] = v130.val[0].u32[2];
              v46.i64[1] = v130.val[0].u32[3];
              int64x2_t v43 = vsraq_n_s64(v43, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v46, 0x38uLL), (int8x16_t)vshlq_n_s64(v58, 0x30uLL)), 0x30uLL);
              int64x2_t v42 = vsraq_n_s64(v42, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v67, 0x38uLL), (int8x16_t)vshlq_n_s64(v57, 0x30uLL)), 0x30uLL);
              int64x2_t v41 = vsraq_n_s64(v41, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v130.val[1], 0x38uLL), (int8x16_t)vshlq_n_s64(v55, 0x30uLL)), 0x30uLL);
              int64x2_t v39 = vsraq_n_s64(v39, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v66, 0x38uLL), (int8x16_t)vshlq_n_s64(v54, 0x30uLL)), 0x30uLL);
              int64x2_t v40 = vsraq_n_s64(v40, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v65, 0x38uLL), (int8x16_t)vshlq_n_s64(v53, 0x30uLL)), 0x30uLL);
              int64x2_t v38 = vsraq_n_s64(v38, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v64, 0x38uLL), (int8x16_t)vshlq_n_s64(v50, 0x30uLL)), 0x30uLL);
              int64x2_t v36 = vsraq_n_s64(v36, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v62, 0x38uLL), (int8x16_t)vshlq_n_s64(v48, 0x30uLL)), 0x30uLL);
              int64x2_t v34 = vsraq_n_s64(v34, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v61, 0x38uLL), (int8x16_t)vshlq_n_s64(v47, 0x30uLL)), 0x30uLL);
              v37 -= 16;
            }
            while (v37);
            a2 += v6;
            *a4++ = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v34, v40), vaddq_s64(v38, v42)), vaddq_s64(vaddq_s64(v36, v41), vaddq_s64(v39, v43))))/ v4;
          }
          while (a2 < v5);
        }
        else
        {
          do
          {
            int64x2_t v68 = 0uLL;
            uint64_t v69 = v7 & 0xFFFFFFF0;
            int64x2_t v70 = 0uLL;
            uint16x8_t v71 = (const char *)a2;
            int64x2_t v72 = 0uLL;
            int64x2_t v73 = 0uLL;
            int64x2_t v74 = 0uLL;
            int64x2_t v75 = 0uLL;
            int64x2_t v76 = 0uLL;
            int64x2_t v77 = 0uLL;
            do
            {
              int8x16x2_t v131 = vld2q_s8(v71);
              v71 += 32;
              uint16x8_t v78 = vmovl_u8(*(uint8x8_t *)v131.val[0].i8);
              uint32x4_t v79 = vmovl_u16(*(uint16x4_t *)v78.i8);
              v80.i64[0] = v79.u32[0];
              v80.i64[1] = v79.u32[1];
              int64x2_t v81 = v80;
              v80.i64[0] = v79.u32[2];
              v80.i64[1] = v79.u32[3];
              int64x2_t v82 = v80;
              uint32x4_t v83 = vmovl_high_u16(v78);
              v80.i64[0] = v83.u32[0];
              v80.i64[1] = v83.u32[1];
              int64x2_t v84 = v80;
              uint16x8_t v85 = vmovl_high_u8((uint8x16_t)v131.val[0]);
              uint32x4_t v86 = vmovl_u16(*(uint16x4_t *)v85.i8);
              v80.i64[0] = v86.u32[0];
              v80.i64[1] = v86.u32[1];
              int64x2_t v87 = v80;
              v80.i64[0] = v83.u32[2];
              v80.i64[1] = v83.u32[3];
              int64x2_t v88 = v80;
              v80.i64[0] = v86.u32[2];
              v80.i64[1] = v86.u32[3];
              int64x2_t v89 = v80;
              uint32x4_t v90 = vmovl_high_u16(v85);
              v80.i64[0] = v90.u32[0];
              v80.i64[1] = v90.u32[1];
              int64x2_t v91 = v80;
              v80.i64[0] = v90.u32[2];
              v80.i64[1] = v90.u32[3];
              int64x2_t v92 = v80;
              uint16x8_t v93 = vmovl_u8(*(uint8x8_t *)v131.val[1].i8);
              uint32x4_t v94 = vmovl_u16(*(uint16x4_t *)v93.i8);
              v80.i64[0] = v94.u32[0];
              v80.i64[1] = v94.u32[1];
              int64x2_t v95 = v80;
              v80.i64[0] = v94.u32[2];
              v80.i64[1] = v94.u32[3];
              int64x2_t v96 = v80;
              uint32x4_t v97 = vmovl_high_u16(v93);
              v80.i64[0] = v97.u32[0];
              v80.i64[1] = v97.u32[1];
              int64x2_t v98 = v80;
              v131.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v131.val[1]);
              v131.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v131.val[0].i8);
              v80.i64[0] = v131.val[1].u32[0];
              v80.i64[1] = v131.val[1].u32[1];
              int64x2_t v99 = v80;
              v80.i64[0] = v97.u32[2];
              v80.i64[1] = v97.u32[3];
              int64x2_t v100 = v80;
              v80.i64[0] = v131.val[1].u32[2];
              v80.i64[1] = v131.val[1].u32[3];
              v131.val[1] = (int8x16_t)v80;
              v131.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v131.val[0]);
              v80.i64[0] = v131.val[0].u32[0];
              v80.i64[1] = v131.val[0].u32[1];
              int64x2_t v101 = v80;
              v80.i64[0] = v131.val[0].u32[2];
              v80.i64[1] = v131.val[0].u32[3];
              int64x2_t v77 = vsraq_n_s64(v77, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v80, 0x38uLL), (int8x16_t)vshlq_n_s64(v92, 0x30uLL)), 0x30uLL);
              int64x2_t v76 = vsraq_n_s64(v76, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v101, 0x38uLL), (int8x16_t)vshlq_n_s64(v91, 0x30uLL)), 0x30uLL);
              int64x2_t v75 = vsraq_n_s64(v75, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)v131.val[1], 0x38uLL), (int8x16_t)vshlq_n_s64(v89, 0x30uLL)), 0x30uLL);
              int64x2_t v73 = vsraq_n_s64(v73, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v100, 0x38uLL), (int8x16_t)vshlq_n_s64(v88, 0x30uLL)), 0x30uLL);
              int64x2_t v74 = vsraq_n_s64(v74, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v99, 0x38uLL), (int8x16_t)vshlq_n_s64(v87, 0x30uLL)), 0x30uLL);
              int64x2_t v72 = vsraq_n_s64(v72, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v98, 0x38uLL), (int8x16_t)vshlq_n_s64(v84, 0x30uLL)), 0x30uLL);
              int64x2_t v70 = vsraq_n_s64(v70, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v96, 0x38uLL), (int8x16_t)vshlq_n_s64(v82, 0x30uLL)), 0x30uLL);
              int64x2_t v68 = vsraq_n_s64(v68, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v95, 0x38uLL), (int8x16_t)vshlq_n_s64(v81, 0x30uLL)), 0x30uLL);
              v69 -= 16;
            }
            while (v69);
            uint64_t v102 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v68, v74), vaddq_s64(v72, v76)), vaddq_s64(vaddq_s64(v70, v75), vaddq_s64(v73, v77))));
            uint64_t v103 = v102;
            uint64_t v104 = 2 * v33;
            int v105 = v7 & 0xFFFFFFF0;
            if ((v7 & 8) == 0) {
              goto LABEL_38;
            }
            int64x2_t v106 = 0uLL;
            int64x2_t v107 = (int64x2_t)(unint64_t)v102;
            uint64_t v108 = v8 - v33;
            uint64_t v109 = (2 * v4) & 0x1FFFFFFE0;
            int64x2_t v110 = 0uLL;
            int64x2_t v111 = 0uLL;
            do
            {
              int64x2_t v112 = (const char *)&a2[v109];
              uint16x8_t v129 = (uint16x8_t)vld2_s8(v112);
              uint16x8_t v113 = vmovl_u8(*(uint8x8_t *)v129.i8);
              uint32x4_t v114 = vmovl_u16(*(uint16x4_t *)v113.i8);
              v115.i64[0] = v114.u32[0];
              v115.i64[1] = v114.u32[1];
              int64x2_t v116 = v115;
              v115.i64[0] = v114.u32[2];
              v115.i64[1] = v114.u32[3];
              int64x2_t v117 = v115;
              uint32x4_t v118 = vmovl_high_u16(v113);
              v115.i64[0] = v118.u32[0];
              v115.i64[1] = v118.u32[1];
              int64x2_t v119 = v115;
              v115.i64[0] = v118.u32[2];
              v115.i64[1] = v118.u32[3];
              int64x2_t v120 = v115;
              uint16x8_t v129 = vmovl_u8((uint8x8_t)v129.u64[1]);
              *(uint32x4_t *)((char *)&v129 + 8) = vmovl_u16(*(uint16x4_t *)v129.i8);
              v115.i64[0] = v129.u32[2];
              v115.i64[1] = v129.u32[3];
              int64x2_t v121 = v115;
              v115.i64[0] = v122;
              v115.i64[1] = v123;
              *(int64x2_t *)((char *)&v129 + 8) = v115;
              uint16x8_t v129 = (uint16x8_t)vmovl_high_u16(v129);
              v115.i64[0] = v129.u32[0];
              v115.i64[1] = v129.u32[1];
              int64x2_t v124 = v115;
              v115.i64[0] = v125;
              v115.i64[1] = v126;
              int64x2_t v111 = vsraq_n_s64(v111, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v115, 0x38uLL), (int8x16_t)vshlq_n_s64(v120, 0x30uLL)), 0x30uLL);
              int64x2_t v110 = vsraq_n_s64(v110, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v124, 0x38uLL), (int8x16_t)vshlq_n_s64(v119, 0x30uLL)), 0x30uLL);
              int64x2_t v106 = vsraq_n_s64(v106, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v129 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v117, 0x30uLL)), 0x30uLL);
              int64x2_t v107 = vsraq_n_s64(v107, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v121, 0x38uLL), (int8x16_t)vshlq_n_s64(v116, 0x30uLL)), 0x30uLL);
              v109 += 16;
              v108 -= 8;
            }
            while (v108);
            uint64_t v103 = vaddvq_s64(vaddq_s64(vaddq_s64(v107, v110), vaddq_s64(v106, v111)));
            uint64_t v104 = 2 * (v7 & 0xFFFFFFF8);
            int v105 = v7 & 0xFFFFFFF8;
            if (v8 != v7)
            {
LABEL_38:
              int v127 = v4 - v105;
              do
              {
                v103 += (uint64_t)(((unint64_t)a2[v104] << 48) | ((unint64_t)a2[v104 + 1] << 56)) >> 48;
                v104 += 2;
                --v127;
              }
              while (v127);
            }
            a2 += v6;
            uint64_t result = v103 / v4;
            *a4++ = result;
          }
          while (a2 < v5);
        }
      }
      else
      {
        do
        {
          int64x2_t v10 = 0uLL;
          BOOL v11 = (const char *)a2;
          uint64_t v12 = v7 & 0xFFFFFFF8;
          int64x2_t v13 = 0uLL;
          int64x2_t v14 = 0uLL;
          int64x2_t v15 = 0uLL;
          do
          {
            uint16x8_t v128 = (uint16x8_t)vld2_s8(v11);
            v11 += 16;
            uint16x8_t v16 = vmovl_u8(*(uint8x8_t *)v128.i8);
            uint32x4_t v17 = vmovl_u16(*(uint16x4_t *)v16.i8);
            v18.i64[0] = v17.u32[0];
            v18.i64[1] = v17.u32[1];
            int64x2_t v19 = v18;
            v18.i64[0] = v17.u32[2];
            v18.i64[1] = v17.u32[3];
            int64x2_t v20 = v18;
            uint32x4_t v21 = vmovl_high_u16(v16);
            v18.i64[0] = v21.u32[0];
            v18.i64[1] = v21.u32[1];
            int64x2_t v22 = v18;
            v18.i64[0] = v21.u32[2];
            v18.i64[1] = v21.u32[3];
            int64x2_t v23 = v18;
            uint16x8_t v128 = vmovl_u8((uint8x8_t)v128.u64[1]);
            *(uint32x4_t *)((char *)&v128 + 8) = vmovl_u16(*(uint16x4_t *)v128.i8);
            v18.i64[0] = v128.u32[2];
            v18.i64[1] = v128.u32[3];
            int64x2_t v24 = v18;
            v18.i64[0] = v25;
            v18.i64[1] = v26;
            *(int64x2_t *)((char *)&v128 + 8) = v18;
            uint16x8_t v128 = (uint16x8_t)vmovl_high_u16(v128);
            v18.i64[0] = v128.u32[0];
            v18.i64[1] = v128.u32[1];
            int64x2_t v27 = v18;
            v18.i64[0] = v28;
            v18.i64[1] = v29;
            int64x2_t v15 = vsraq_n_s64(v15, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v18, 0x38uLL), (int8x16_t)vshlq_n_s64(v23, 0x30uLL)), 0x30uLL);
            int64x2_t v14 = vsraq_n_s64(v14, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v27, 0x38uLL), (int8x16_t)vshlq_n_s64(v22, 0x30uLL)), 0x30uLL);
            int64x2_t v13 = vsraq_n_s64(v13, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v128 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v20, 0x30uLL)), 0x30uLL);
            int64x2_t v10 = vsraq_n_s64(v10, (int64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v24, 0x38uLL), (int8x16_t)vshlq_n_s64(v19, 0x30uLL)), 0x30uLL);
            v12 -= 8;
          }
          while (v12);
          uint64_t v30 = vaddvq_s64(vaddq_s64(vaddq_s64(v10, v14), vaddq_s64(v13, v15)));
          int v31 = v4 - v8;
          uint64_t v32 = 2 * (v7 & 0xFFFFFFF8);
          if (v8 != v7)
          {
            do
            {
              uint64_t result = ((unint64_t)a2[v32] << 48) | ((unint64_t)a2[v32 + 1] << 56);
              v30 += result >> 48;
              v32 += 2;
              --v31;
            }
            while (v31);
          }
          a2 += v6;
          *a4++ = v30 / v4;
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    BOOL v5 = (unsigned int *)((char *)a2 + a3);
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        unint64_t v19 = *a2;
        if (result >= 2)
        {
          v19 += a2[1];
          if (v4 != 2)
          {
            v19 += a2[2];
            if (v4 != 3)
            {
              v19 += a2[3];
              if (v4 != 4)
              {
                v19 += a2[4];
                if (v4 != 5)
                {
                  v19 += a2[5];
                  if (v4 != 6) {
                    v19 += a2[6];
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        unint64_t v18 = v19 / v4;
        *(_WORD *)a4 = v18;
        *(unsigned char *)(a4 + 2) = BYTE2(v18);
        *(unsigned char *)(a4 + 3) = BYTE3(v18);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        uint64_t v9 = (uint32x4_t *)(a2 + 4);
        do
        {
          int64x2_t v10 = 0uLL;
          BOOL v11 = v9;
          uint64_t v12 = v8;
          int64x2_t v13 = 0uLL;
          int64x2_t v14 = 0uLL;
          int64x2_t v15 = 0uLL;
          do
          {
            uint32x4_t v16 = v11[-1];
            int64x2_t v13 = (int64x2_t)vaddw_high_u32((uint64x2_t)v13, v16);
            int64x2_t v10 = (int64x2_t)vaddw_u32((uint64x2_t)v10, *(uint32x2_t *)v16.i8);
            int64x2_t v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, *v11);
            int64x2_t v14 = (int64x2_t)vaddw_u32((uint64x2_t)v14, *(uint32x2_t *)v11->i8);
            v11 += 2;
            v12 -= 8;
          }
          while (v12);
          unint64_t v17 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
          a2 = (unsigned int *)((char *)a2 + v6);
          *(_WORD *)a4 = v17 / v4;
          *(unsigned char *)(a4 + 2) = (v17 / v4) >> 16;
          *(unsigned char *)(a4 + 3) = (v17 / v4) >> 24;
          a4 += 4;
          uint64_t v9 = (uint32x4_t *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        int64x2_t v20 = (uint32x4_t *)(a2 + 4);
        do
        {
          int64x2_t v21 = 0uLL;
          uint64_t v22 = v8;
          int64x2_t v23 = v20;
          int64x2_t v24 = 0uLL;
          int64x2_t v25 = 0uLL;
          int64x2_t v26 = 0uLL;
          do
          {
            uint32x4_t v27 = v23[-1];
            int64x2_t v24 = (int64x2_t)vaddw_high_u32((uint64x2_t)v24, v27);
            int64x2_t v21 = (int64x2_t)vaddw_u32((uint64x2_t)v21, *(uint32x2_t *)v27.i8);
            int64x2_t v26 = (int64x2_t)vaddw_high_u32((uint64x2_t)v26, *v23);
            int64x2_t v25 = (int64x2_t)vaddw_u32((uint64x2_t)v25, *(uint32x2_t *)v23->i8);
            v23 += 2;
            v22 -= 8;
          }
          while (v22);
          unint64_t v28 = vaddvq_s64(vaddq_s64(vaddq_s64(v25, v21), vaddq_s64(v26, v24)));
          uint64_t v29 = v8;
          do
            v28 += a2[v29++];
          while (v4 != v29);
          a2 = (unsigned int *)((char *)a2 + v6);
          unint64_t v30 = v28 / v4;
          *(_WORD *)a4 = v30;
          *(unsigned char *)(a4 + 2) = BYTE2(v30);
          *(unsigned char *)(a4 + 3) = BYTE3(v30);
          a4 += 4;
          int64x2_t v20 = (uint32x4_t *)((char *)v20 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, int *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    BOOL v5 = (int *)((char *)a2 + a3);
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        uint64_t v19 = *a2;
        if (result >= 2)
        {
          v19 += a2[1];
          if (v4 != 2)
          {
            v19 += a2[2];
            if (v4 != 3)
            {
              v19 += a2[3];
              if (v4 != 4)
              {
                v19 += a2[4];
                if (v4 != 5)
                {
                  v19 += a2[5];
                  if (v4 != 6) {
                    v19 += a2[6];
                  }
                }
              }
            }
          }
        }
        a2 = (int *)((char *)a2 + v6);
        uint64_t v18 = v19 / v4;
        *(_WORD *)a4 = v18;
        *(unsigned char *)(a4 + 2) = BYTE2(v18);
        *(unsigned char *)(a4 + 3) = BYTE3(v18);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        uint64_t v9 = (int32x4_t *)(a2 + 4);
        do
        {
          int64x2_t v10 = 0uLL;
          BOOL v11 = v9;
          uint64_t v12 = v8;
          int64x2_t v13 = 0uLL;
          int64x2_t v14 = 0uLL;
          int64x2_t v15 = 0uLL;
          do
          {
            int32x4_t v16 = v11[-1];
            int64x2_t v13 = vaddw_high_s32(v13, v16);
            int64x2_t v10 = vaddw_s32(v10, *(int32x2_t *)v16.i8);
            int64x2_t v15 = vaddw_high_s32(v15, *v11);
            int64x2_t v14 = vaddw_s32(v14, *(int32x2_t *)v11->i8);
            v11 += 2;
            v12 -= 8;
          }
          while (v12);
          uint64_t v17 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
          a2 = (int *)((char *)a2 + v6);
          *(_WORD *)a4 = v17 / v4;
          *(unsigned char *)(a4 + 2) = (v17 / v4) >> 16;
          *(unsigned char *)(a4 + 3) = (v17 / v4) >> 24;
          a4 += 4;
          uint64_t v9 = (int32x4_t *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        int64x2_t v20 = (int32x4_t *)(a2 + 4);
        do
        {
          int64x2_t v21 = 0uLL;
          uint64_t v22 = v8;
          int64x2_t v23 = v20;
          int64x2_t v24 = 0uLL;
          int64x2_t v25 = 0uLL;
          int64x2_t v26 = 0uLL;
          do
          {
            int32x4_t v27 = v23[-1];
            int64x2_t v24 = vaddw_high_s32(v24, v27);
            int64x2_t v21 = vaddw_s32(v21, *(int32x2_t *)v27.i8);
            int64x2_t v26 = vaddw_high_s32(v26, *v23);
            int64x2_t v25 = vaddw_s32(v25, *(int32x2_t *)v23->i8);
            v23 += 2;
            v22 -= 8;
          }
          while (v22);
          uint64_t v28 = vaddvq_s64(vaddq_s64(vaddq_s64(v25, v21), vaddq_s64(v26, v24)));
          uint64_t v29 = v8;
          do
            v28 += a2[v29++];
          while (v4 != v29);
          a2 = (int *)((char *)a2 + v6);
          uint64_t v30 = v28 / v4;
          *(_WORD *)a4 = v30;
          *(unsigned char *)(a4 + 2) = BYTE2(v30);
          *(unsigned char *)(a4 + 3) = BYTE3(v30);
          a4 += 4;
          int64x2_t v20 = (int32x4_t *)((char *)v20 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(unint64_t result, unsigned __int8 *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = result;
  }
  if (a3)
  {
    uint64_t v7 = &a2[a3];
    uint64_t v8 = 2 * (v6 - 1) + 2;
    if (result <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = result;
    }
    if (v9 >= 8)
    {
      while (v9 >= 0x10)
      {
        int64x2_t v30 = 0uLL;
        uint64_t v31 = v9 & 0xFFFFFFF0;
        int64x2_t v32 = 0uLL;
        uint64_t v33 = (const char *)a2;
        int64x2_t v34 = 0uLL;
        int64x2_t v35 = 0uLL;
        int64x2_t v36 = 0uLL;
        int64x2_t v37 = 0uLL;
        int64x2_t v38 = 0uLL;
        int64x2_t v39 = 0uLL;
        int64x2_t v40 = 0uLL;
        int64x2_t v41 = 0uLL;
        int64x2_t v42 = 0uLL;
        int64x2_t v43 = 0uLL;
        int64x2_t v44 = 0uLL;
        int64x2_t v45 = 0uLL;
        int64x2_t v46 = 0uLL;
        int64x2_t v47 = 0uLL;
        do
        {
          int8x16x2_t v57 = vld2q_s8(v33);
          v33 += 32;
          uint32x4_t v48 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_24F60F060);
          uint32x4_t v49 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_24F60F050);
          uint32x4_t v50 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_24F60F040);
          uint32x4_t v51 = (uint32x4_t)vqtbl1q_s8(v57.val[0], (int8x16_t)xmmword_24F60F070);
          uint32x4_t v52 = (uint32x4_t)vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_24F60F060);
          uint32x4_t v53 = (uint32x4_t)vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_24F60F050);
          uint32x4_t v54 = (uint32x4_t)vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_24F60F040);
          v57.val[0] = vqtbl1q_s8(v57.val[1], (int8x16_t)xmmword_24F60F070);
          int64x2_t v35 = (int64x2_t)vaddw_high_u32((uint64x2_t)v35, v49);
          int64x2_t v32 = (int64x2_t)vaddw_high_u32((uint64x2_t)v32, v50);
          int64x2_t v36 = (int64x2_t)vaddw_u32((uint64x2_t)v36, *(uint32x2_t *)v48.i8);
          int64x2_t v34 = (int64x2_t)vaddw_u32((uint64x2_t)v34, *(uint32x2_t *)v49.i8);
          int64x2_t v30 = (int64x2_t)vaddw_u32((uint64x2_t)v30, *(uint32x2_t *)v50.i8);
          int64x2_t v37 = (int64x2_t)vaddw_high_u32((uint64x2_t)v37, v48);
          int64x2_t v38 = (int64x2_t)vaddw_u32((uint64x2_t)v38, *(uint32x2_t *)v51.i8);
          int64x2_t v39 = (int64x2_t)vaddw_high_u32((uint64x2_t)v39, v51);
          int64x2_t v43 = (int64x2_t)vaddw_high_u32((uint64x2_t)v43, v53);
          int64x2_t v41 = (int64x2_t)vaddw_high_u32((uint64x2_t)v41, v54);
          int64x2_t v44 = (int64x2_t)vaddw_u32((uint64x2_t)v44, *(uint32x2_t *)v52.i8);
          int64x2_t v42 = (int64x2_t)vaddw_u32((uint64x2_t)v42, *(uint32x2_t *)v53.i8);
          int64x2_t v40 = (int64x2_t)vaddw_u32((uint64x2_t)v40, *(uint32x2_t *)v54.i8);
          int64x2_t v45 = (int64x2_t)vaddw_high_u32((uint64x2_t)v45, v52);
          int64x2_t v46 = (int64x2_t)vaddw_u32((uint64x2_t)v46, *(uint32x2_t *)v57.val[0].i8);
          int64x2_t v47 = (int64x2_t)vaddw_high_u32((uint64x2_t)v47, (uint32x4_t)v57.val[0]);
          v31 -= 16;
        }
        while (v31);
        int64x2_t v5 = vaddq_s64(v43, v47);
        int64x2_t v4 = vaddq_s64(vaddq_s64(vaddq_s64(v40, v44), vaddq_s64(v42, v46)), vaddq_s64(vaddq_s64(v41, v45), v5));
        unint64_t v13 = vaddvq_s64(v4);
        unint64_t v12 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v30, v36), vaddq_s64(v34, v38)), vaddq_s64(vaddq_s64(v32, v37), vaddq_s64(v35, v39))));
        if ((v9 & 0xFFFFFFF0) == v9) {
          goto LABEL_18;
        }
        uint64_t v14 = v9 & 0xFFFFFFF0;
        uint64_t v29 = v14;
        if ((v9 & 8) != 0) {
          goto LABEL_21;
        }
LABEL_29:
        uint64_t v55 = 2 * v29;
        int v56 = v6 - v29;
        do
        {
          v12 += a2[v55];
          v13 += a2[v55 + 1];
          v55 += 2;
          --v56;
        }
        while (v56);
LABEL_18:
        a2 += v8;
        uint64_t result = v12 / v6;
        *a4 = result;
        a4[1] = v13 / v6;
        a4 += 2;
        if (a2 >= v7) {
          return result;
        }
      }
      unint64_t v12 = 0;
      unint64_t v13 = 0;
      uint64_t v14 = 0;
LABEL_21:
      int64x2_t v15 = 0uLL;
      int64x2_t v16 = (int64x2_t)v12;
      int64x2_t v17 = (int64x2_t)v13;
      uint64_t v18 = 2 * v14;
      uint64_t v19 = v14 - (v6 & 0xFFFFFFF8);
      int64x2_t v20 = 0uLL;
      int64x2_t v21 = 0uLL;
      int64x2_t v22 = 0uLL;
      int64x2_t v23 = 0uLL;
      int64x2_t v24 = 0uLL;
      do
      {
        int64x2_t v25 = (const char *)&a2[v18];
        int64x2_t v4 = (int64x2_t)vld2_s8(v25);
        uint32x4_t v26 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_24F60F050);
        uint32x4_t v27 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_24F60F040);
        uint32x4_t v28 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_24F60F050);
        int64x2_t v4 = (int64x2_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_24F60F040);
        int64x2_t v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v26);
        int64x2_t v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, v27);
        int64x2_t v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, *(uint32x2_t *)v26.i8);
        int64x2_t v16 = (int64x2_t)vaddw_u32((uint64x2_t)v16, *(uint32x2_t *)v27.i8);
        int64x2_t v24 = (int64x2_t)vaddw_high_u32((uint64x2_t)v24, v28);
        int64x2_t v22 = (int64x2_t)vaddw_high_u32((uint64x2_t)v22, (uint32x4_t)v4);
        int64x2_t v23 = (int64x2_t)vaddw_u32((uint64x2_t)v23, *(uint32x2_t *)v28.i8);
        int64x2_t v17 = (int64x2_t)vaddw_u32((uint64x2_t)v17, *(uint32x2_t *)v4.i8);
        v18 += 16;
        v19 += 8;
      }
      while (v19);
      unint64_t v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v17, v23), vaddq_s64(v22, v24)));
      unint64_t v12 = vaddvq_s64(vaddq_s64(vaddq_s64(v16, v20), vaddq_s64(v15, v21)));
      uint64_t v29 = v9 & 0xFFFFFFF8;
      if (v29 == v9) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
    do
    {
      unint64_t v10 = *a2;
      unint64_t v11 = a2[1];
      if (result >= 2)
      {
        v10 += a2[2];
        v11 += a2[3];
        if (v6 != 2)
        {
          v10 += a2[4];
          v11 += a2[5];
          if (v6 != 3)
          {
            v10 += a2[6];
            v11 += a2[7];
            if (v6 != 4)
            {
              v10 += a2[8];
              v11 += a2[9];
              if (v6 != 5)
              {
                v10 += a2[10];
                v11 += a2[11];
                if (v6 != 6)
                {
                  v10 += a2[12];
                  v11 += a2[13];
                }
              }
            }
          }
        }
      }
      a2 += v8;
      *a4 = v10 / v6;
      a4[1] = v11 / v6;
      a4 += 2;
    }
    while (a2 < v7);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<2u,2u,false,63ull,56ull,55ull,48ull,0ull,0ull,0ull,0ull>(uint64_t result, char *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    int64x2_t v5 = &a2[a3];
    uint64_t v6 = 2 * (v4 - 1) + 2;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 >= 8)
    {
      while (v7 >= 0x10)
      {
        int64x2_t v27 = 0uLL;
        uint64_t v28 = v7 & 0xFFFFFFF0;
        int64x2_t v29 = 0uLL;
        int64x2_t v30 = a2;
        int64x2_t v31 = 0uLL;
        int64x2_t v32 = 0uLL;
        int64x2_t v33 = 0uLL;
        int64x2_t v34 = 0uLL;
        int64x2_t v35 = 0uLL;
        int64x2_t v36 = 0uLL;
        int64x2_t v37 = 0uLL;
        int64x2_t v38 = 0uLL;
        int64x2_t v39 = 0uLL;
        int64x2_t v40 = 0uLL;
        int64x2_t v41 = 0uLL;
        int64x2_t v42 = 0uLL;
        int64x2_t v43 = 0uLL;
        int64x2_t v44 = 0uLL;
        do
        {
          int8x16x2_t v56 = vld2q_s8(v30);
          v30 += 32;
          int16x8_t v45 = vmovl_s8(*(int8x8_t *)v56.val[0].i8);
          int32x4_t v46 = vmovl_s16(*(int16x4_t *)v45.i8);
          int32x4_t v47 = vmovl_high_s16(v45);
          int16x8_t v48 = vmovl_high_s8(v56.val[0]);
          int32x4_t v49 = vmovl_s16(*(int16x4_t *)v48.i8);
          int32x4_t v50 = vmovl_high_s16(v48);
          int16x8_t v51 = vmovl_s8(*(int8x8_t *)v56.val[1].i8);
          int32x4_t v52 = vmovl_s16(*(int16x4_t *)v51.i8);
          int32x4_t v53 = vmovl_high_s16(v51);
          v56.val[0] = (int8x16_t)vmovl_high_s8(v56.val[1]);
          v56.val[1] = (int8x16_t)vmovl_s16(*(int16x4_t *)v56.val[0].i8);
          v56.val[0] = (int8x16_t)vmovl_high_s16((int16x8_t)v56.val[0]);
          int64x2_t v34 = vaddw_high_s32(v34, v49);
          int64x2_t v32 = vaddw_high_s32(v32, v47);
          int64x2_t v35 = vaddw_s32(v35, *(int32x2_t *)v50.i8);
          int64x2_t v33 = vaddw_s32(v33, *(int32x2_t *)v49.i8);
          int64x2_t v31 = vaddw_s32(v31, *(int32x2_t *)v47.i8);
          int64x2_t v29 = vaddw_high_s32(v29, v46);
          int64x2_t v36 = vaddw_high_s32(v36, v50);
          int64x2_t v27 = vaddw_s32(v27, *(int32x2_t *)v46.i8);
          int64x2_t v42 = vaddw_high_s32(v42, (int32x4_t)v56.val[1]);
          int64x2_t v40 = vaddw_high_s32(v40, v53);
          int64x2_t v43 = vaddw_s32(v43, *(int32x2_t *)v56.val[0].i8);
          int64x2_t v41 = vaddw_s32(v41, *(int32x2_t *)v56.val[1].i8);
          int64x2_t v39 = vaddw_s32(v39, *(int32x2_t *)v53.i8);
          int64x2_t v38 = vaddw_high_s32(v38, v52);
          int64x2_t v44 = vaddw_high_s32(v44, (int32x4_t)v56.val[0]);
          int64x2_t v37 = vaddw_s32(v37, *(int32x2_t *)v52.i8);
          v28 -= 16;
        }
        while (v28);
        uint64_t v11 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v37, v41), vaddq_s64(v39, v43)), vaddq_s64(vaddq_s64(v38, v42), vaddq_s64(v40, v44))));
        uint64_t v10 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v27, v33), vaddq_s64(v31, v35)), vaddq_s64(vaddq_s64(v29, v34), vaddq_s64(v32, v36))));
        if ((v7 & 0xFFFFFFF0) == v7) {
          goto LABEL_18;
        }
        uint64_t v12 = v7 & 0xFFFFFFF0;
        uint64_t result = v12;
        if ((v7 & 8) != 0) {
          goto LABEL_21;
        }
LABEL_29:
        uint64_t v54 = 2 * result;
        LODWORD(result) = v4 - result;
        do
        {
          v10 += a2[v54];
          v11 += a2[v54 + 1];
          v54 += 2;
          uint64_t result = (result - 1);
        }
        while (result);
LABEL_18:
        a2 += v6;
        *a4 = v10 / v4;
        a4[1] = v11 / v4;
        a4 += 2;
        if (a2 >= v5) {
          return result;
        }
      }
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = 0;
LABEL_21:
      int64x2_t v13 = 0uLL;
      int64x2_t v14 = (int64x2_t)(unint64_t)v10;
      int64x2_t v15 = (int64x2_t)(unint64_t)v11;
      uint64_t v16 = 2 * v12;
      uint64_t v17 = v12 - (v4 & 0xFFFFFFF8);
      int64x2_t v18 = 0uLL;
      int64x2_t v19 = 0uLL;
      int64x2_t v20 = 0uLL;
      int64x2_t v21 = 0uLL;
      int64x2_t v22 = 0uLL;
      do
      {
        int64x2_t v23 = &a2[v16];
        int16x8_t v55 = (int16x8_t)vld2_s8(v23);
        int16x8_t v24 = vmovl_s8(*(int8x8_t *)v55.i8);
        int32x4_t v25 = vmovl_s16(*(int16x4_t *)v24.i8);
        int32x4_t v26 = vmovl_high_s16(v24);
        int16x8_t v55 = vmovl_s8((int8x8_t)v55.u64[1]);
        *(int32x4_t *)((char *)&v55 + 8) = vmovl_s16(*(int16x4_t *)v55.i8);
        int16x8_t v55 = (int16x8_t)vmovl_high_s16(v55);
        int64x2_t v19 = vaddw_high_s32(v19, v26);
        int64x2_t v18 = vaddw_s32(v18, *(int32x2_t *)v26.i8);
        int64x2_t v13 = vaddw_high_s32(v13, v25);
        int64x2_t v14 = vaddw_s32(v14, *(int32x2_t *)v25.i8);
        int64x2_t v22 = vaddw_high_s32(v22, (int32x4_t)v55);
        int64x2_t v21 = vaddw_s32(v21, *(int32x2_t *)v55.i8);
        int64x2_t v20 = vaddw_high_s32(v20, *(int32x4_t *)((char *)&v55 + 8));
        int64x2_t v15 = vaddw_s32(v15, (int32x2_t)v55.u64[1]);
        v16 += 16;
        v17 += 8;
      }
      while (v17);
      uint64_t v11 = vaddvq_s64(vaddq_s64(vaddq_s64(v15, v21), vaddq_s64(v20, v22)));
      uint64_t v10 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v18), vaddq_s64(v13, v19)));
      uint64_t result = v7 & 0xFFFFFFF8;
      if (result == v7) {
        goto LABEL_18;
      }
      goto LABEL_29;
    }
    do
    {
      uint64_t v8 = *a2;
      uint64_t v9 = a2[1];
      if (result >= 2)
      {
        v8 += a2[2];
        v9 += a2[3];
        if (v4 != 2)
        {
          v8 += a2[4];
          v9 += a2[5];
          if (v4 != 3)
          {
            v8 += a2[6];
            v9 += a2[7];
            if (v4 != 4)
            {
              v8 += a2[8];
              v9 += a2[9];
              if (v4 != 5)
              {
                v8 += a2[10];
                v9 += a2[11];
                if (v4 != 6)
                {
                  v8 += a2[12];
                  v9 += a2[13];
                }
              }
            }
          }
        }
      }
      a2 += v6;
      *a4 = v8 / v4;
      a4[1] = v9 / v4;
      a4 += 2;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,47ull,32ull,63ull,48ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int64x2_t v5 = (unsigned int *)((char *)a2 + a3);
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        unint64_t v26 = (unsigned __int16)*a2;
        unint64_t v27 = (unint64_t)*a2 >> 16;
        if (result >= 2)
        {
          unint64_t v28 = a2[1];
          v26 += (unsigned __int16)v28;
          v27 += v28 >> 16;
          if (v4 != 2)
          {
            unint64_t v29 = a2[2];
            v26 += (unsigned __int16)v29;
            v27 += v29 >> 16;
            if (v4 != 3)
            {
              unint64_t v30 = a2[3];
              v26 += (unsigned __int16)v30;
              v27 += v30 >> 16;
              if (v4 != 4)
              {
                unint64_t v31 = a2[4];
                v26 += (unsigned __int16)v31;
                v27 += v31 >> 16;
                if (v4 != 5)
                {
                  unint64_t v32 = a2[5];
                  v26 += (unsigned __int16)v32;
                  v27 += v32 >> 16;
                  if (v4 != 6)
                  {
                    unint64_t v33 = a2[6];
                    v26 += (unsigned __int16)v33;
                    v27 += v33 >> 16;
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v26 / v4;
        a4[1] = v27 / v4;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        uint64_t v9 = a2 + 4;
        v10.i64[0] = 0xFFFFLL;
        v10.i64[1] = 0xFFFFLL;
        do
        {
          int64x2_t v11 = 0uLL;
          uint64_t v12 = v9;
          int64x2_t v13 = 0uLL;
          uint64_t v14 = v8;
          int64x2_t v15 = 0uLL;
          int64x2_t v16 = 0uLL;
          int64x2_t v17 = 0uLL;
          int64x2_t v18 = 0uLL;
          int64x2_t v19 = 0uLL;
          int64x2_t v20 = 0uLL;
          do
          {
            long long v21 = *((_OWORD *)v12 - 1);
            v22.i64[0] = DWORD2(v21);
            v22.i64[1] = HIDWORD(v21);
            int8x16_t v23 = v22;
            v22.i64[0] = v21;
            v22.i64[1] = DWORD1(v21);
            int8x16_t v24 = v22;
            v22.i64[0] = *((void *)v12 + 1);
            v22.i64[1] = HIDWORD(*(_OWORD *)v12);
            int8x16_t v25 = v22;
            v22.i64[0] = *(_OWORD *)v12;
            v22.i64[1] = HIDWORD(*(void *)v12);
            int64x2_t v13 = vaddq_s64((int64x2_t)vandq_s8(v23, v10), v13);
            int64x2_t v11 = vaddq_s64((int64x2_t)vandq_s8(v24, v10), v11);
            int64x2_t v16 = vaddq_s64((int64x2_t)vandq_s8(v25, v10), v16);
            int64x2_t v15 = vaddq_s64((int64x2_t)vandq_s8(v22, v10), v15);
            int64x2_t v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, (uint64x2_t)v23, 0x10uLL);
            int64x2_t v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v24, 0x10uLL);
            int64x2_t v20 = (int64x2_t)vsraq_n_u64((uint64x2_t)v20, (uint64x2_t)v25, 0x10uLL);
            int64x2_t v19 = (int64x2_t)vsraq_n_u64((uint64x2_t)v19, (uint64x2_t)v22, 0x10uLL);
            v12 += 8;
            v14 -= 8;
          }
          while (v14);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = vaddvq_s64(vaddq_s64(vaddq_s64(v15, v11), vaddq_s64(v16, v13))) / v4;
          a4[1] = vaddvq_s64(vaddq_s64(vaddq_s64(v19, v17), vaddq_s64(v20, v18))) / v4;
          a4 += 2;
          uint64_t v9 = (unsigned int *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        int64x2_t v34 = a2 + 4;
        v35.i64[0] = 0xFFFFLL;
        v35.i64[1] = 0xFFFFLL;
        do
        {
          int64x2_t v36 = 0uLL;
          uint64_t v37 = v8;
          int64x2_t v38 = 0uLL;
          int64x2_t v39 = v34;
          int64x2_t v40 = 0uLL;
          int64x2_t v41 = 0uLL;
          int64x2_t v42 = 0uLL;
          int64x2_t v43 = 0uLL;
          int64x2_t v44 = 0uLL;
          int64x2_t v45 = 0uLL;
          do
          {
            long long v46 = *((_OWORD *)v39 - 1);
            v47.i64[0] = DWORD2(v46);
            v47.i64[1] = HIDWORD(v46);
            int8x16_t v48 = v47;
            v47.i64[0] = v46;
            v47.i64[1] = DWORD1(v46);
            int8x16_t v49 = v47;
            v47.i64[0] = *((void *)v39 + 1);
            v47.i64[1] = HIDWORD(*(_OWORD *)v39);
            int8x16_t v50 = v47;
            v47.i64[0] = *(_OWORD *)v39;
            v47.i64[1] = HIDWORD(*(void *)v39);
            int64x2_t v38 = vaddq_s64((int64x2_t)vandq_s8(v48, v35), v38);
            int64x2_t v36 = vaddq_s64((int64x2_t)vandq_s8(v49, v35), v36);
            int64x2_t v41 = vaddq_s64((int64x2_t)vandq_s8(v50, v35), v41);
            int64x2_t v40 = vaddq_s64((int64x2_t)vandq_s8(v47, v35), v40);
            int64x2_t v43 = (int64x2_t)vsraq_n_u64((uint64x2_t)v43, (uint64x2_t)v48, 0x10uLL);
            int64x2_t v42 = (int64x2_t)vsraq_n_u64((uint64x2_t)v42, (uint64x2_t)v49, 0x10uLL);
            int64x2_t v45 = (int64x2_t)vsraq_n_u64((uint64x2_t)v45, (uint64x2_t)v50, 0x10uLL);
            int64x2_t v44 = (int64x2_t)vsraq_n_u64((uint64x2_t)v44, (uint64x2_t)v47, 0x10uLL);
            v39 += 8;
            v37 -= 8;
          }
          while (v37);
          unint64_t v51 = vaddvq_s64(vaddq_s64(vaddq_s64(v44, v42), vaddq_s64(v45, v43)));
          unint64_t v52 = vaddvq_s64(vaddq_s64(vaddq_s64(v40, v36), vaddq_s64(v41, v38)));
          uint64_t v53 = v8;
          do
          {
            unint64_t v54 = a2[v53];
            v52 += (unsigned __int16)v54;
            v51 += v54 >> 16;
            ++v53;
          }
          while (v4 != v53);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = v52 / v4;
          a4[1] = v51 / v4;
          a4 += 2;
          int64x2_t v34 = (unsigned int *)((char *)v34 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,true,47ull,32ull,65ull,48ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    int64x2_t v5 = (unsigned int *)((char *)a2 + a3);
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        unint64_t v25 = *a2;
        uint64_t v26 = (__int16)v25;
        unint64_t v27 = v25 >> 16;
        if (result >= 2)
        {
          unint64_t v28 = a2[1];
          v26 += (__int16)v28;
          v27 += v28 >> 16;
          if (v4 != 2)
          {
            unint64_t v29 = a2[2];
            v26 += (__int16)v29;
            v27 += v29 >> 16;
            if (v4 != 3)
            {
              unint64_t v30 = a2[3];
              v26 += (__int16)v30;
              v27 += v30 >> 16;
              if (v4 != 4)
              {
                unint64_t v31 = a2[4];
                v26 += (__int16)v31;
                v27 += v31 >> 16;
                if (v4 != 5)
                {
                  unint64_t v32 = a2[5];
                  v26 += (__int16)v32;
                  v27 += v32 >> 16;
                  if (v4 != 6)
                  {
                    unint64_t v33 = a2[6];
                    v26 += (__int16)v33;
                    v27 += v33 >> 16;
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v26 / v4;
        a4[1] = v27 / v4;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        uint64_t v9 = a2 + 4;
        do
        {
          int64x2_t v10 = 0uLL;
          int64x2_t v11 = v9;
          int64x2_t v12 = 0uLL;
          uint64_t v13 = v8;
          int64x2_t v14 = 0uLL;
          int64x2_t v15 = 0uLL;
          int64x2_t v16 = 0uLL;
          int64x2_t v17 = 0uLL;
          int64x2_t v18 = 0uLL;
          int64x2_t v19 = 0uLL;
          do
          {
            long long v20 = *((_OWORD *)v11 - 1);
            v21.i64[0] = DWORD2(v20);
            v21.i64[1] = HIDWORD(v20);
            int64x2_t v22 = v21;
            v21.i64[0] = v20;
            v21.i64[1] = DWORD1(v20);
            int64x2_t v23 = v21;
            v21.i64[0] = *((void *)v11 + 1);
            v21.i64[1] = HIDWORD(*(_OWORD *)v11);
            int64x2_t v24 = v21;
            v21.i64[0] = *(_OWORD *)v11;
            v21.i64[1] = HIDWORD(*(void *)v11);
            int64x2_t v12 = vsraq_n_s64(v12, vshlq_n_s64(v22, 0x30uLL), 0x30uLL);
            int64x2_t v10 = vsraq_n_s64(v10, vshlq_n_s64(v23, 0x30uLL), 0x30uLL);
            int64x2_t v15 = vsraq_n_s64(v15, vshlq_n_s64(v24, 0x30uLL), 0x30uLL);
            int64x2_t v14 = vsraq_n_s64(v14, vshlq_n_s64(v21, 0x30uLL), 0x30uLL);
            int64x2_t v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v22, 0x10uLL);
            int64x2_t v16 = (int64x2_t)vsraq_n_u64((uint64x2_t)v16, (uint64x2_t)v23, 0x10uLL);
            int64x2_t v19 = (int64x2_t)vsraq_n_u64((uint64x2_t)v19, (uint64x2_t)v24, 0x10uLL);
            int64x2_t v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, (uint64x2_t)v21, 0x10uLL);
            v11 += 8;
            v13 -= 8;
          }
          while (v13);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v12))) / v4;
          a4[1] = vaddvq_s64(vaddq_s64(vaddq_s64(v18, v16), vaddq_s64(v19, v17))) / (unint64_t)v4;
          a4 += 2;
          uint64_t v9 = (unsigned int *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        int64x2_t v34 = a2 + 4;
        do
        {
          int64x2_t v35 = 0uLL;
          uint64_t v36 = v8;
          int64x2_t v37 = 0uLL;
          int64x2_t v38 = v34;
          int64x2_t v39 = 0uLL;
          int64x2_t v40 = 0uLL;
          int64x2_t v41 = 0uLL;
          int64x2_t v42 = 0uLL;
          int64x2_t v43 = 0uLL;
          int64x2_t v44 = 0uLL;
          do
          {
            long long v45 = *((_OWORD *)v38 - 1);
            v46.i64[0] = DWORD2(v45);
            v46.i64[1] = HIDWORD(v45);
            int64x2_t v47 = v46;
            v46.i64[0] = v45;
            v46.i64[1] = DWORD1(v45);
            int64x2_t v48 = v46;
            v46.i64[0] = *((void *)v38 + 1);
            v46.i64[1] = HIDWORD(*(_OWORD *)v38);
            int64x2_t v49 = v46;
            v46.i64[0] = *(_OWORD *)v38;
            v46.i64[1] = HIDWORD(*(void *)v38);
            int64x2_t v37 = vsraq_n_s64(v37, vshlq_n_s64(v47, 0x30uLL), 0x30uLL);
            int64x2_t v35 = vsraq_n_s64(v35, vshlq_n_s64(v48, 0x30uLL), 0x30uLL);
            int64x2_t v40 = vsraq_n_s64(v40, vshlq_n_s64(v49, 0x30uLL), 0x30uLL);
            int64x2_t v39 = vsraq_n_s64(v39, vshlq_n_s64(v46, 0x30uLL), 0x30uLL);
            int64x2_t v42 = (int64x2_t)vsraq_n_u64((uint64x2_t)v42, (uint64x2_t)v47, 0x10uLL);
            int64x2_t v41 = (int64x2_t)vsraq_n_u64((uint64x2_t)v41, (uint64x2_t)v48, 0x10uLL);
            int64x2_t v44 = (int64x2_t)vsraq_n_u64((uint64x2_t)v44, (uint64x2_t)v49, 0x10uLL);
            int64x2_t v43 = (int64x2_t)vsraq_n_u64((uint64x2_t)v43, (uint64x2_t)v46, 0x10uLL);
            v38 += 8;
            v36 -= 8;
          }
          while (v36);
          unint64_t v50 = vaddvq_s64(vaddq_s64(vaddq_s64(v43, v41), vaddq_s64(v44, v42)));
          uint64_t v51 = vaddvq_s64(vaddq_s64(vaddq_s64(v39, v35), vaddq_s64(v40, v37)));
          uint64_t v52 = v8;
          do
          {
            unint64_t v53 = a2[v52];
            v51 += (__int16)v53;
            v50 += v53 >> 16;
            ++v52;
          }
          while (v4 != v52);
          a2 = (unsigned int *)((char *)a2 + v6);
          *a4 = v51 / v4;
          a4[1] = v50 / v4;
          a4 += 2;
          int64x2_t v34 = (unsigned int *)((char *)v34 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(unint64_t result, int8x16_t *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int64x2_t v5 = (int8x16_t *)((char *)a2 + a3);
    uint64_t v6 = 8 * (v4 - 1) + 8;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    uint64_t v8 = a2 + 1;
    v9.i64[0] = 0xFFFFFFFFLL;
    v9.i64[1] = 0xFFFFFFFFLL;
    int8x16_t v10 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v7 >= 4)
      {
        int64x2_t v17 = 0uLL;
        int64x2_t v16 = &a2->i64[v7 & 0xFFFFFFFC];
        int64x2_t v18 = 0uLL;
        uint64_t v19 = v7 & 0xFFFFFFFC;
        long long v20 = v8;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        do
        {
          int8x16_t v27 = v20[-1];
          int64x2_t v28 = (int64x2_t)vandq_s8(v27, v10);
          int64x2_t v29 = (int64x2_t)vandq_s8(*v20, v10);
          int64x2_t v17 = vaddq_s64((int64x2_t)vandq_s8(v27, v9), v17);
          int64x2_t v18 = vaddq_s64((int64x2_t)vandq_s8(*v20, v9), v18);
          int64x2_t v21 = (int64x2_t)vsraq_n_u64((uint64x2_t)v21, (uint64x2_t)v27, 0x20uLL);
          int64x2_t v22 = (int64x2_t)vsraq_n_u64((uint64x2_t)v22, *(uint64x2_t *)v20, 0x20uLL);
          int64x2_t v23 = vaddq_s64(v28, v23);
          int64x2_t v24 = vaddq_s64(v29, v24);
          int64x2_t v25 = vaddq_s64(v28, v25);
          int64x2_t v26 = vaddq_s64(v29, v26);
          v20 += 2;
          v19 -= 4;
        }
        while (v19);
        unint64_t v15 = vaddvq_s64(vaddq_s64(v26, v25));
        unint64_t v13 = vaddvq_s64(vaddq_s64(v24, v23));
        unint64_t v12 = vaddvq_s64(vaddq_s64(v22, v21));
        unint64_t v11 = vaddvq_s64(vaddq_s64(v18, v17));
        int v14 = v7 & 0xFFFFFFFC;
        if ((v7 & 0xFFFFFFFC) == v7) {
          goto LABEL_9;
        }
      }
      else
      {
        unint64_t v11 = 0;
        unint64_t v12 = 0;
        unint64_t v13 = 0;
        int v14 = 0;
        unint64_t v15 = 0;
        int64x2_t v16 = (uint64_t *)a2;
      }
      int v30 = v7 - v14;
      do
      {
        unint64_t v31 = *v16++;
        v11 += v31;
        v12 += HIDWORD(v31);
        v13 += v31 & 1;
        v15 += v31 & 1;
        --v30;
      }
      while (v30);
LABEL_9:
      a2 = (int8x16_t *)((char *)a2 + v6);
      uint64_t result = v13 / v4;
      *(unsigned char *)a4 = ((v15 / v4) | result) & 1 | (v11 / v4);
      *(unsigned char *)(a4 + 1) = (unsigned __int16)(v11 / v4) >> 8;
      *(unsigned char *)(a4 + 2) = (v11 / v4) >> 16;
      *(unsigned char *)(a4 + 3) = (v11 / v4) >> 24;
      *(_WORD *)(a4 + 4) = v12 / v4;
      *(unsigned char *)(a4 + 6) = (v12 / v4) >> 16;
      *(unsigned char *)(a4 + 7) = (v12 / v4) >> 24;
      a4 += 8;
      uint64_t v8 = (int8x16_t *)((char *)v8 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(uint64_t result, int8x16_t *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    int64x2_t v5 = (int8x16_t *)((char *)a2 + a3);
    uint64_t v6 = 8 * (v4 - 1) + 8;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    uint64_t v8 = a2 + 1;
    int8x16_t v9 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v7 >= 4)
      {
        int64x2_t v16 = 0uLL;
        unint64_t v15 = &a2->i64[v7 & 0xFFFFFFFC];
        int64x2_t v17 = 0uLL;
        uint64_t v18 = v7 & 0xFFFFFFFC;
        uint64_t v19 = v8;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        do
        {
          int64x2_t v26 = (int64x2_t)v19[-1];
          int64x2_t v27 = (int64x2_t)vandq_s8((int8x16_t)v26, v9);
          int64x2_t v28 = (int64x2_t)vandq_s8(*v19, v9);
          int64x2_t v16 = vsraq_n_s64(v16, vshlq_n_s64(v26, 0x20uLL), 0x20uLL);
          int64x2_t v17 = vsraq_n_s64(v17, vshlq_n_s64(*(int64x2_t *)v19, 0x20uLL), 0x20uLL);
          int64x2_t v20 = vsraq_n_s64(v20, v26, 0x20uLL);
          int64x2_t v21 = vsraq_n_s64(v21, *(int64x2_t *)v19, 0x20uLL);
          int64x2_t v22 = vsubq_s64(v22, v27);
          int64x2_t v23 = vsubq_s64(v23, v28);
          int64x2_t v24 = vsubq_s64(v24, v27);
          int64x2_t v25 = vsubq_s64(v25, v28);
          v19 += 2;
          v18 -= 4;
        }
        while (v18);
        uint64_t v13 = vaddvq_s64(vaddq_s64(v25, v24));
        uint64_t v12 = vaddvq_s64(vaddq_s64(v23, v22));
        uint64_t v11 = vaddvq_s64(vaddq_s64(v21, v20));
        uint64_t v10 = vaddvq_s64(vaddq_s64(v17, v16));
        int v14 = v7 & 0xFFFFFFFC;
        if ((v7 & 0xFFFFFFFC) == v7) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        int v14 = 0;
        unint64_t v15 = (uint64_t *)a2;
      }
      int v29 = v7 - v14;
      do
      {
        uint64_t v30 = *v15++;
        v10 += (int)v30;
        v11 += v30 >> 32;
        v12 -= v30 & 1;
        v13 -= v30 & 1;
        --v29;
      }
      while (v29);
LABEL_9:
      a2 = (int8x16_t *)((char *)a2 + v6);
      uint64_t result = v12 / v4;
      *(unsigned char *)a4 = ((v13 / v4) | result) & 1 | (v10 / v4);
      *(unsigned char *)(a4 + 1) = (unsigned __int16)(v10 / v4) >> 8;
      *(unsigned char *)(a4 + 2) = (v10 / v4) >> 16;
      *(unsigned char *)(a4 + 3) = (v10 / v4) >> 24;
      *(_WORD *)(a4 + 4) = v11 / v4;
      *(unsigned char *)(a4 + 6) = (v11 / v4) >> 16;
      *(unsigned char *)(a4 + 7) = (v11 / v4) >> 24;
      a4 += 8;
      uint64_t v8 = (int8x16_t *)((char *)v8 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,32ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = result;
  }
  if (a3)
  {
    uint64_t v7 = &a2[a3];
    uint64_t v8 = 3 * (v6 - 1) + 3;
    if (result <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = result;
    }
    if (v9 < 8)
    {
      do
      {
        unint64_t v10 = *a2;
        unint64_t v11 = a2[1];
        uint64_t v12 = a2[2];
        if (result >= 2)
        {
          v10 += a2[3];
          v11 += a2[4];
          v12 += a2[5];
          if (v6 != 2)
          {
            v10 += a2[6];
            v11 += a2[7];
            v12 += a2[8];
            if (v6 != 3)
            {
              v10 += a2[9];
              v11 += a2[10];
              v12 += a2[11];
              if (v6 != 4)
              {
                v10 += a2[12];
                v11 += a2[13];
                v12 += a2[14];
                if (v6 != 5)
                {
                  v10 += a2[15];
                  v11 += a2[16];
                  v12 += a2[17];
                  if (v6 != 6)
                  {
                    v10 += a2[18];
                    v11 += a2[19];
                    v12 += a2[20];
                  }
                }
              }
            }
          }
        }
        a2 += v8;
        *a4 = v10 / v6;
        a4[1] = v11 / v6;
        a4[2] = (unsigned __int16)((v12 << 8) / v6) >> 8;
        a4 += 3;
      }
      while (a2 < v7);
    }
    else
    {
      do
      {
        int64x2_t v13 = 0uLL;
        uint64_t v14 = v9 & 0xFFFFFFF8;
        int64x2_t v15 = 0uLL;
        int64x2_t v16 = (const char *)a2;
        int64x2_t v17 = 0uLL;
        int64x2_t v18 = 0uLL;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        do
        {
          *(int8x8x3_t *)v4.i8 = vld3_s8(v16);
          v16 += 24;
          uint32x4_t v27 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v28 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v4, (int8x16_t)xmmword_24F60F040);
          uint32x4_t v29 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v30 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v5, (int8x16_t)xmmword_24F60F040);
          uint16x8_t v32 = vmovl_u8(v31);
          uint32x4_t v33 = vmovl_high_u16(v32);
          uint32x4_t v34 = vmovl_u16(*(uint16x4_t *)v32.i8);
          int64x2_t v35 = (int64x2_t)vshll_n_u32(*(uint32x2_t *)v34.i8, 8uLL);
          int64x2_t v4 = (int64x2_t)vshll_high_n_u32(v34, 8uLL);
          int64x2_t v36 = (int64x2_t)vshll_n_u32(*(uint32x2_t *)v33.i8, 8uLL);
          int64x2_t v5 = (int64x2_t)vshll_high_n_u32(v33, 8uLL);
          int64x2_t v18 = (int64x2_t)vaddw_high_u32((uint64x2_t)v18, v27);
          int64x2_t v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, v28);
          int64x2_t v17 = (int64x2_t)vaddw_u32((uint64x2_t)v17, *(uint32x2_t *)v27.i8);
          int64x2_t v13 = (int64x2_t)vaddw_u32((uint64x2_t)v13, *(uint32x2_t *)v28.i8);
          int64x2_t v22 = (int64x2_t)vaddw_high_u32((uint64x2_t)v22, v29);
          int64x2_t v20 = (int64x2_t)vaddw_high_u32((uint64x2_t)v20, v30);
          int64x2_t v21 = (int64x2_t)vaddw_u32((uint64x2_t)v21, *(uint32x2_t *)v29.i8);
          int64x2_t v19 = (int64x2_t)vaddw_u32((uint64x2_t)v19, *(uint32x2_t *)v30.i8);
          int64x2_t v26 = vaddq_s64(v5, v26);
          int64x2_t v25 = vaddq_s64(v36, v25);
          int64x2_t v24 = vaddq_s64(v4, v24);
          int64x2_t v23 = vaddq_s64(v35, v23);
          v14 -= 8;
        }
        while (v14);
        unint64_t v37 = vaddvq_s64(vaddq_s64(vaddq_s64(v23, v25), vaddq_s64(v24, v26)));
        unint64_t v38 = vaddvq_s64(vaddq_s64(vaddq_s64(v19, v21), vaddq_s64(v20, v22)));
        unint64_t v39 = vaddvq_s64(vaddq_s64(vaddq_s64(v13, v17), vaddq_s64(v15, v18)));
        uint64_t result = v6 - (v9 & 0xFFFFFFF8);
        uint64_t v40 = 3 * (v9 & 0xFFFFFFF8);
        if ((v9 & 0xFFFFFFF8) != v9)
        {
          do
          {
            v39 += a2[v40];
            v38 += a2[v40 + 1];
            v37 += (unint64_t)a2[v40 + 2] << 8;
            v40 += 3;
            uint64_t result = (result - 1);
          }
          while (result);
        }
        a2 += v8;
        *a4 = v39 / v6;
        a4[1] = v38 / v6;
        a4[2] = (unsigned __int16)(v37 / v6) >> 8;
        a4 += 3;
      }
      while (a2 < v7);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,53ull,52ull,48ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int64x2_t v5 = &a2[a3];
    uint64_t v6 = 2 * (v4 - 1) + 2;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 < 8)
    {
      do
      {
        uint64_t v11 = *a2;
        unint64_t v12 = a2[1];
        unint64_t v13 = (v11 << 48) | (v12 << 56);
        unint64_t v14 = v12 >> 3;
        unint64_t v15 = (v13 >> 53) & 0x3F;
        unint64_t v16 = v11 & 0x1F;
        if (result >= 2)
        {
          uint64_t v17 = a2[2];
          unint64_t v18 = a2[3];
          v14 += v18 >> 3;
          v15 += (((v17 << 48) | (v18 << 56)) >> 53) & 0x3F;
          v16 += v17 & 0x1F;
          if (v4 != 2)
          {
            uint64_t v19 = a2[4];
            unint64_t v20 = a2[5];
            v14 += v20 >> 3;
            v15 += (((v19 << 48) | (v20 << 56)) >> 53) & 0x3F;
            v16 += v19 & 0x1F;
            if (v4 != 3)
            {
              uint64_t v21 = a2[6];
              unint64_t v22 = a2[7];
              v14 += v22 >> 3;
              v15 += (((v21 << 48) | (v22 << 56)) >> 53) & 0x3F;
              v16 += v21 & 0x1F;
              if (v4 != 4)
              {
                uint64_t v23 = a2[8];
                unint64_t v24 = a2[9];
                v14 += v24 >> 3;
                v15 += (((v23 << 48) | (v24 << 56)) >> 53) & 0x3F;
                v16 += v23 & 0x1F;
                if (v4 != 5)
                {
                  uint64_t v25 = a2[10];
                  unint64_t v26 = a2[11];
                  v14 += v26 >> 3;
                  v15 += (((v25 << 48) | (v26 << 56)) >> 53) & 0x3F;
                  v16 += v25 & 0x1F;
                  if (v4 != 6)
                  {
                    uint64_t v27 = a2[12];
                    unint64_t v28 = a2[13];
                    v14 += v28 >> 3;
                    v15 += (((v27 << 48) | (v28 << 56)) >> 53) & 0x3F;
                    v16 += v27 & 0x1F;
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        unint64_t v10 = (v15 / v4) << 53;
        *a4 = (v10 & 0xFFE0FFFFFFFFFFFFLL | (((v16 / v4) & 0x1F) << 48)) >> 48;
        a4[1] = (v10 & 0x700000000000000 | ((v14 / v4) << 59)) >> 56;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      int8x16_t v8 = (int8x16_t)vdupq_n_s64(0x3FuLL);
      int8x16_t v9 = (int8x16_t)vdupq_n_s64(0x1FuLL);
      do
      {
        int64x2_t v30 = 0uLL;
        uint64_t v31 = v7 & 0xFFFFFFF8;
        int64x2_t v32 = 0uLL;
        uint32x4_t v33 = (const char *)a2;
        int64x2_t v34 = 0uLL;
        int64x2_t v35 = 0uLL;
        int64x2_t v36 = 0uLL;
        int64x2_t v37 = 0uLL;
        int64x2_t v38 = 0uLL;
        int64x2_t v39 = 0uLL;
        int64x2_t v40 = 0uLL;
        int64x2_t v41 = 0uLL;
        int64x2_t v42 = 0uLL;
        int64x2_t v43 = 0uLL;
        do
        {
          uint16x8_t v65 = (uint16x8_t)vld2_s8(v33);
          v33 += 16;
          uint16x8_t v44 = vmovl_u8(*(uint8x8_t *)v65.i8);
          uint32x4_t v45 = vmovl_u16(*(uint16x4_t *)v44.i8);
          v46.i64[0] = v45.u32[0];
          v46.i64[1] = v45.u32[1];
          int64x2_t v47 = v46;
          v46.i64[0] = v45.u32[2];
          v46.i64[1] = v45.u32[3];
          int64x2_t v48 = v46;
          uint32x4_t v49 = vmovl_high_u16(v44);
          v46.i64[0] = v49.u32[0];
          v46.i64[1] = v49.u32[1];
          int64x2_t v50 = v46;
          v46.i64[0] = v49.u32[2];
          v46.i64[1] = v49.u32[3];
          int64x2_t v51 = v46;
          uint16x8_t v65 = vmovl_u8((uint8x8_t)v65.u64[1]);
          *(uint32x4_t *)((char *)&v65 + 8) = vmovl_u16(*(uint16x4_t *)v65.i8);
          v46.i64[0] = v65.u32[2];
          v46.i64[1] = v65.u32[3];
          int64x2_t v52 = v46;
          v46.i64[0] = v53;
          v46.i64[1] = v54;
          *(int64x2_t *)((char *)&v65 + 8) = v46;
          uint16x8_t v65 = (uint16x8_t)vmovl_high_u16(v65);
          v46.i64[0] = v65.u32[0];
          v46.i64[1] = v65.u32[1];
          int64x2_t v55 = v46;
          v46.i64[0] = v56;
          v46.i64[1] = v57;
          int64x2_t v35 = (int64x2_t)vsraq_n_u64((uint64x2_t)v35, (uint64x2_t)v46, 3uLL);
          int64x2_t v34 = (int64x2_t)vsraq_n_u64((uint64x2_t)v34, (uint64x2_t)v55, 3uLL);
          int64x2_t v32 = (int64x2_t)vsraq_n_u64((uint64x2_t)v32, *(uint64x2_t *)((char *)&v65 + 8), 3uLL);
          int64x2_t v30 = (int64x2_t)vsraq_n_u64((uint64x2_t)v30, (uint64x2_t)v52, 3uLL);
          int64x2_t v39 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v46, 0x38uLL), (int8x16_t)vshlq_n_s64(v51, 0x30uLL)), 0x35uLL), v8), v39);
          int64x2_t v38 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v55, 0x38uLL), (int8x16_t)vshlq_n_s64(v50, 0x30uLL)), 0x35uLL), v8), v38);
          int64x2_t v37 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v65 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v48, 0x30uLL)), 0x35uLL), v8), v37);
          int64x2_t v36 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v52, 0x38uLL), (int8x16_t)vshlq_n_s64(v47, 0x30uLL)), 0x35uLL), v8), v36);
          int64x2_t v43 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v51, v9), v43);
          int64x2_t v42 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v50, v9), v42);
          int64x2_t v41 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v9), v41);
          int64x2_t v40 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v47, v9), v40);
          v31 -= 8;
        }
        while (v31);
        unint64_t v58 = vaddvq_s64(vaddq_s64(vaddq_s64(v40, v42), vaddq_s64(v41, v43)));
        unint64_t v59 = vaddvq_s64(vaddq_s64(vaddq_s64(v36, v38), vaddq_s64(v37, v39)));
        unint64_t v60 = vaddvq_s64(vaddq_s64(vaddq_s64(v30, v34), vaddq_s64(v32, v35)));
        int v61 = v4 - (v7 & 0xFFFFFFF8);
        uint64_t v62 = 2 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            uint64_t v63 = a2[v62];
            unint64_t v64 = a2[v62 + 1];
            v60 += v64 >> 3;
            v59 += (((v63 << 48) | (v64 << 56)) >> 53) & 0x3F;
            v58 += v63 & 0x1F;
            v62 += 2;
            --v61;
          }
          while (v61);
        }
        a2 += v6;
        unint64_t v29 = (v59 / v4) << 53;
        uint64_t result = v29 & 0x700000000000000;
        *a4 = (v29 & 0xFFE0FFFFFFFFFFFFLL | (((v58 / v4) & 0x1F) << 48)) >> 48;
        a4[1] = (v29 & 0x700000000000000 | ((v60 / v4) << 59)) >> 56;
        a4 += 2;
      }
      while (a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(unint64_t result, unsigned __int8 *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = result;
  }
  if (a3)
  {
    int8x16_t v9 = &a2[a3];
    uint64_t v10 = 4 * (v8 - 1) + 4;
    if (result <= 1) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = result;
    }
    if (v11 < 8)
    {
      do
      {
        unint64_t v12 = *a2;
        unint64_t v13 = a2[1];
        unint64_t v14 = a2[2];
        unint64_t v15 = a2[3];
        if (result >= 2)
        {
          v12 += a2[4];
          v13 += a2[5];
          v14 += a2[6];
          v15 += a2[7];
          if (v8 != 2)
          {
            v12 += a2[8];
            v13 += a2[9];
            v14 += a2[10];
            v15 += a2[11];
            if (v8 != 3)
            {
              v12 += a2[12];
              v13 += a2[13];
              v14 += a2[14];
              v15 += a2[15];
              if (v8 != 4)
              {
                v12 += a2[16];
                v13 += a2[17];
                v14 += a2[18];
                v15 += a2[19];
                if (v8 != 5)
                {
                  v12 += a2[20];
                  v13 += a2[21];
                  v14 += a2[22];
                  v15 += a2[23];
                  if (v8 != 6)
                  {
                    v12 += a2[24];
                    v13 += a2[25];
                    v14 += a2[26];
                    v15 += a2[27];
                  }
                }
              }
            }
          }
        }
        a2 += v10;
        *a4 = v12 / v8;
        a4[1] = v13 / v8;
        a4[2] = v14 / v8;
        a4[3] = v15 / v8;
        a4 += 4;
      }
      while (a2 < v9);
    }
    else
    {
      do
      {
        int64x2_t v16 = 0uLL;
        uint64_t v17 = v11 & 0xFFFFFFF8;
        int64x2_t v18 = 0uLL;
        uint64_t v19 = (const char *)a2;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        int64x2_t v27 = 0uLL;
        int64x2_t v28 = 0uLL;
        int64x2_t v29 = 0uLL;
        int64x2_t v30 = 0uLL;
        int64x2_t v31 = 0uLL;
        int64x2_t v32 = 0uLL;
        int64x2_t v33 = 0uLL;
        do
        {
          *(int8x8x4_t *)v4.i8 = vld4_s8(v19);
          v19 += 32;
          uint32x4_t v34 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v35 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_24F60F040);
          uint32x4_t v36 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v37 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_24F60F040);
          uint32x4_t v38 = (uint32x4_t)vqtbl1q_s8(v6, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v39 = (uint32x4_t)vqtbl1q_s8(v6, (int8x16_t)xmmword_24F60F040);
          uint32x4_t v40 = (uint32x4_t)vqtbl1q_s8(v7, (int8x16_t)xmmword_24F60F050);
          int8x16_t v4 = vqtbl1q_s8(v7, (int8x16_t)xmmword_24F60F040);
          int64x2_t v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v34);
          int64x2_t v18 = (int64x2_t)vaddw_high_u32((uint64x2_t)v18, v35);
          int64x2_t v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, *(uint32x2_t *)v34.i8);
          int64x2_t v16 = (int64x2_t)vaddw_u32((uint64x2_t)v16, *(uint32x2_t *)v35.i8);
          int64x2_t v25 = (int64x2_t)vaddw_high_u32((uint64x2_t)v25, v36);
          int64x2_t v23 = (int64x2_t)vaddw_high_u32((uint64x2_t)v23, v37);
          int64x2_t v24 = (int64x2_t)vaddw_u32((uint64x2_t)v24, *(uint32x2_t *)v36.i8);
          int64x2_t v22 = (int64x2_t)vaddw_u32((uint64x2_t)v22, *(uint32x2_t *)v37.i8);
          int64x2_t v29 = (int64x2_t)vaddw_high_u32((uint64x2_t)v29, v38);
          int64x2_t v27 = (int64x2_t)vaddw_high_u32((uint64x2_t)v27, v39);
          int64x2_t v28 = (int64x2_t)vaddw_u32((uint64x2_t)v28, *(uint32x2_t *)v38.i8);
          int64x2_t v26 = (int64x2_t)vaddw_u32((uint64x2_t)v26, *(uint32x2_t *)v39.i8);
          int64x2_t v33 = (int64x2_t)vaddw_high_u32((uint64x2_t)v33, v40);
          int64x2_t v31 = (int64x2_t)vaddw_high_u32((uint64x2_t)v31, (uint32x4_t)v4);
          int64x2_t v32 = (int64x2_t)vaddw_u32((uint64x2_t)v32, *(uint32x2_t *)v40.i8);
          int64x2_t v30 = (int64x2_t)vaddw_u32((uint64x2_t)v30, *(uint32x2_t *)v4.i8);
          v17 -= 8;
        }
        while (v17);
        unint64_t v41 = vaddvq_s64(vaddq_s64(vaddq_s64(v30, v32), vaddq_s64(v31, v33)));
        unint64_t v42 = vaddvq_s64(vaddq_s64(vaddq_s64(v26, v28), vaddq_s64(v27, v29)));
        unint64_t v43 = vaddvq_s64(vaddq_s64(vaddq_s64(v22, v24), vaddq_s64(v23, v25)));
        unint64_t v44 = vaddvq_s64(vaddq_s64(vaddq_s64(v16, v20), vaddq_s64(v18, v21)));
        int v45 = v8 - (v11 & 0xFFFFFFF8);
        uint64_t v46 = 4 * (v11 & 0xFFFFFFF8);
        if ((v11 & 0xFFFFFFF8) != v11)
        {
          do
          {
            v44 += a2[v46];
            v43 += a2[v46 + 1];
            v42 += a2[v46 + 2];
            v41 += a2[v46 + 3];
            v46 += 4;
            --v45;
          }
          while (v45);
        }
        a2 += v10;
        uint64_t result = v44 / v8;
        *a4 = result;
        a4[1] = v43 / v8;
        a4[2] = v42 / v8;
        a4[3] = v41 / v8;
        a4 += 4;
      }
      while (a2 < v9);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,4u,false,63ull,56ull,55ull,48ull,47ull,40ull,39ull,32ull>(uint64_t result, char *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = &a2[a3];
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 < 8)
    {
      do
      {
        uint64_t v8 = *a2;
        uint64_t v9 = a2[1];
        uint64_t v10 = a2[2];
        uint64_t v11 = a2[3];
        if (result >= 2)
        {
          v8 += a2[4];
          v9 += a2[5];
          v10 += a2[6];
          v11 += a2[7];
          if (v4 != 2)
          {
            v8 += a2[8];
            v9 += a2[9];
            v10 += a2[10];
            v11 += a2[11];
            if (v4 != 3)
            {
              v8 += a2[12];
              v9 += a2[13];
              v10 += a2[14];
              v11 += a2[15];
              if (v4 != 4)
              {
                v8 += a2[16];
                v9 += a2[17];
                v10 += a2[18];
                v11 += a2[19];
                if (v4 != 5)
                {
                  v8 += a2[20];
                  v9 += a2[21];
                  v10 += a2[22];
                  v11 += a2[23];
                  if (v4 != 6)
                  {
                    v8 += a2[24];
                    v9 += a2[25];
                    v10 += a2[26];
                    v11 += a2[27];
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4 = v8 / v4;
        a4[1] = v9 / v4;
        a4[2] = v10 / v4;
        a4[3] = v11 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      do
      {
        int64x2_t v12 = 0uLL;
        uint64_t v13 = v7 & 0xFFFFFFF8;
        int64x2_t v14 = 0uLL;
        unint64_t v15 = a2;
        int64x2_t v16 = 0uLL;
        int64x2_t v17 = 0uLL;
        int64x2_t v18 = 0uLL;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        int64x2_t v27 = 0uLL;
        int64x2_t v28 = 0uLL;
        int64x2_t v29 = 0uLL;
        do
        {
          int8x8x4_t v45 = vld4_s8(v15);
          v15 += 32;
          int16x8_t v30 = vmovl_s8(v45.val[0]);
          int32x4_t v31 = vmovl_s16(*(int16x4_t *)v30.i8);
          int32x4_t v32 = vmovl_high_s16(v30);
          int16x8_t v33 = vmovl_s8(v45.val[1]);
          int32x4_t v34 = vmovl_s16(*(int16x4_t *)v33.i8);
          int32x4_t v35 = vmovl_high_s16(v33);
          int16x8_t v36 = vmovl_s8(v45.val[2]);
          int32x4_t v37 = vmovl_s16(*(int16x4_t *)v36.i8);
          int32x4_t v38 = vmovl_high_s16(v36);
          *(int16x8_t *)v45.val[0].i8 = vmovl_s8(v45.val[3]);
          *(int32x4_t *)v45.val[1].i8 = vmovl_s16((int16x4_t)v45.val[0]);
          *(int32x4_t *)v45.val[0].i8 = vmovl_high_s16(*(int16x8_t *)v45.val[0].i8);
          int64x2_t v17 = vaddw_high_s32(v17, v32);
          int64x2_t v16 = vaddw_s32(v16, *(int32x2_t *)v32.i8);
          int64x2_t v14 = vaddw_high_s32(v14, v31);
          int64x2_t v12 = vaddw_s32(v12, *(int32x2_t *)v31.i8);
          int64x2_t v21 = vaddw_high_s32(v21, v35);
          int64x2_t v20 = vaddw_s32(v20, *(int32x2_t *)v35.i8);
          int64x2_t v19 = vaddw_high_s32(v19, v34);
          int64x2_t v18 = vaddw_s32(v18, *(int32x2_t *)v34.i8);
          int64x2_t v25 = vaddw_high_s32(v25, v38);
          int64x2_t v24 = vaddw_s32(v24, *(int32x2_t *)v38.i8);
          int64x2_t v23 = vaddw_high_s32(v23, v37);
          int64x2_t v22 = vaddw_s32(v22, *(int32x2_t *)v37.i8);
          int64x2_t v29 = vaddw_high_s32(v29, *(int32x4_t *)v45.val[0].i8);
          int64x2_t v28 = vaddw_s32(v28, (int32x2_t)v45.val[0]);
          int64x2_t v27 = vaddw_high_s32(v27, *(int32x4_t *)v45.val[1].i8);
          int64x2_t v26 = vaddw_s32(v26, (int32x2_t)v45.val[1]);
          v13 -= 8;
        }
        while (v13);
        uint64_t v39 = vaddvq_s64(vaddq_s64(vaddq_s64(v26, v28), vaddq_s64(v27, v29)));
        uint64_t v40 = vaddvq_s64(vaddq_s64(vaddq_s64(v22, v24), vaddq_s64(v23, v25)));
        uint64_t v41 = vaddvq_s64(vaddq_s64(vaddq_s64(v18, v20), vaddq_s64(v19, v21)));
        uint64_t v42 = vaddvq_s64(vaddq_s64(vaddq_s64(v12, v16), vaddq_s64(v14, v17)));
        int v43 = v4 - (v7 & 0xFFFFFFF8);
        uint64_t v44 = 4 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            v42 += a2[v44];
            v41 += a2[v44 + 1];
            v40 += a2[v44 + 2];
            v39 += a2[v44 + 3];
            v44 += 4;
            --v43;
          }
          while (v43);
        }
        a2 += v6;
        uint64_t result = v42 / v4;
        *a4 = result;
        a4[1] = v41 / v4;
        a4[2] = v40 / v4;
        a4[3] = v39 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(uint64_t result, int8x16_t *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = (int8x16_t *)((char *)a2 + a3);
    uint64_t v6 = 8 * (v4 - 1) + 8;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 < 4)
    {
      do
      {
        unint64_t v10 = WORD1(a2->i64[0]);
        unint64_t v11 = (unsigned __int16)a2->i64[0];
        unint64_t v12 = (unsigned __int16)WORD2(a2->i64[0]);
        unint64_t v13 = HIWORD(a2->i64[0]);
        if (result >= 2)
        {
          unint64_t v14 = a2->u64[1];
          v11 += (unsigned __int16)v14;
          v10 += WORD1(v14);
          v12 += WORD2(v14);
          v13 += HIWORD(v14);
          if (v4 != 2)
          {
            unint64_t v15 = a2[1].u64[0];
            v11 += (unsigned __int16)v15;
            v10 += WORD1(v15);
            v12 += WORD2(v15);
            v13 += HIWORD(v15);
          }
        }
        a2 = (int8x16_t *)((char *)a2 + v6);
        *a4 = v11 / v4;
        a4[1] = v10 / v4;
        a4[2] = v12 / v4;
        a4[3] = v13 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = a2 + 1;
      v9.i64[0] = 0xFFFFLL;
      v9.i64[1] = 0xFFFFLL;
      do
      {
        int64x2_t v16 = 0uLL;
        uint64_t v17 = v7 & 0xFFFFFFFC;
        int64x2_t v18 = 0uLL;
        int64x2_t v19 = v8;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        do
        {
          int8x16_t v26 = v19[-1];
          int64x2_t v16 = vaddq_s64((int64x2_t)vandq_s8(v26, v9), v16);
          int64x2_t v18 = vaddq_s64((int64x2_t)vandq_s8(*v19, v9), v18);
          int64x2_t v20 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v26, 0x10uLL), v9), v20);
          int64x2_t v21 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(*(uint64x2_t *)v19, 0x10uLL), v9), v21);
          int64x2_t v22 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v26, 0x20uLL), v9), v22);
          int64x2_t v23 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64(*(uint64x2_t *)v19, 0x20uLL), v9), v23);
          int64x2_t v24 = (int64x2_t)vsraq_n_u64((uint64x2_t)v24, (uint64x2_t)v26, 0x30uLL);
          int64x2_t v25 = (int64x2_t)vsraq_n_u64((uint64x2_t)v25, *(uint64x2_t *)v19, 0x30uLL);
          v19 += 2;
          v17 -= 4;
        }
        while (v17);
        unint64_t v27 = vaddvq_s64(vaddq_s64(v25, v24));
        unint64_t v28 = vaddvq_s64(vaddq_s64(v23, v22));
        unint64_t v29 = vaddvq_s64(vaddq_s64(v21, v20));
        unint64_t v30 = vaddvq_s64(vaddq_s64(v18, v16));
        uint64_t result = v7 & 0xFFFFFFFC;
        if (result != v7)
        {
          do
          {
            unint64_t v31 = a2->u64[result];
            v30 += (unsigned __int16)v31;
            v29 += WORD1(v31);
            v28 += WORD2(v31);
            v27 += HIWORD(v31);
            ++result;
          }
          while (v4 != result);
        }
        a2 = (int8x16_t *)((char *)a2 + v6);
        *a4 = v30 / v4;
        a4[1] = v29 / v4;
        a4[2] = v28 / v4;
        a4[3] = v27 / v4;
        a4 += 4;
        uint64_t v8 = (int8x16_t *)((char *)v8 + v6);
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,8u,true,15ull,0ull,31ull,16ull,47ull,32ull,63ull,48ull>(uint64_t result, uint64_t *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = (uint64_t *)((char *)a2 + a3);
    uint64_t v6 = 8 * (v4 - 1) + 8;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 < 4)
    {
      do
      {
        uint64_t v9 = (__int16)*a2;
        uint64_t v10 = *a2 << 32 >> 48;
        uint64_t v11 = *a2 << 16 >> 48;
        uint64_t v12 = *a2 >> 48;
        if (result >= 2)
        {
          uint64_t v13 = a2[1];
          v9 += (__int16)v13;
          v10 += (uint64_t)(int)v13 >> 16;
          v11 += v13 << 16 >> 48;
          v12 += v13 >> 48;
          if (v4 != 2)
          {
            uint64_t v14 = a2[2];
            v9 += (__int16)v14;
            v10 += (uint64_t)(int)v14 >> 16;
            v11 += v14 << 16 >> 48;
            v12 += v14 >> 48;
          }
        }
        a2 = (uint64_t *)((char *)a2 + v6);
        *a4 = v9 / v4;
        a4[1] = v10 / v4;
        a4[2] = v11 / v4;
        a4[3] = v12 / v4;
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = (int64x2_t *)(a2 + 2);
      do
      {
        int64x2_t v15 = 0uLL;
        uint64_t v16 = v7 & 0xFFFFFFFC;
        int64x2_t v17 = 0uLL;
        int64x2_t v18 = v8;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        do
        {
          int64x2_t v25 = v18[-1];
          int64x2_t v15 = vsraq_n_s64(v15, vshlq_n_s64(v25, 0x30uLL), 0x30uLL);
          int64x2_t v17 = vsraq_n_s64(v17, vshlq_n_s64(*v18, 0x30uLL), 0x30uLL);
          int64x2_t v19 = vsraq_n_s64(v19, vshlq_n_s64(v25, 0x20uLL), 0x30uLL);
          int64x2_t v20 = vsraq_n_s64(v20, vshlq_n_s64(*v18, 0x20uLL), 0x30uLL);
          int64x2_t v21 = vsraq_n_s64(v21, vshlq_n_s64(v25, 0x10uLL), 0x30uLL);
          int64x2_t v22 = vsraq_n_s64(v22, vshlq_n_s64(*v18, 0x10uLL), 0x30uLL);
          int64x2_t v23 = vsraq_n_s64(v23, v25, 0x30uLL);
          int64x2_t v24 = vsraq_n_s64(v24, *v18, 0x30uLL);
          v18 += 2;
          v16 -= 4;
        }
        while (v16);
        uint64_t v26 = vaddvq_s64(vaddq_s64(v24, v23));
        uint64_t v27 = vaddvq_s64(vaddq_s64(v22, v21));
        uint64_t v28 = vaddvq_s64(vaddq_s64(v20, v19));
        uint64_t v29 = vaddvq_s64(vaddq_s64(v17, v15));
        uint64_t result = v7 & 0xFFFFFFFC;
        if (result != v7)
        {
          do
          {
            uint64_t v30 = a2[result];
            v29 += (__int16)v30;
            v28 += (uint64_t)(int)v30 >> 16;
            v27 += v30 << 16 >> 48;
            v26 += v30 >> 48;
            ++result;
          }
          while (v4 != result);
        }
        a2 = (uint64_t *)((char *)a2 + v6);
        *a4 = v29 / v4;
        a4[1] = v28 / v4;
        a4[2] = v27 / v4;
        a4[3] = v26 / v4;
        a4 += 4;
        uint64_t v8 = (int64x2_t *)((char *)v8 + v6);
      }
      while (a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(unint64_t result, char *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = &a2[a3];
    uint64_t v6 = 16 * (v4 - 1) + 16;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if ((v7 & 3) != 0) {
      uint64_t v8 = v7 & 3;
    }
    else {
      uint64_t v8 = 4;
    }
    if (v7 < 5)
    {
      do
      {
        unint64_t v39 = *(void *)a2;
        unint64_t v40 = HIDWORD(*(void *)a2);
        unint64_t v41 = *(void *)a2 & 1;
        if (result >= 2)
        {
          unint64_t v42 = *((void *)a2 + 2);
          v39 += v42;
          v40 += HIDWORD(v42);
          v41 += v42 & 1;
          if (v4 != 2)
          {
            unint64_t v43 = *((void *)a2 + 4);
            v39 += v43;
            v40 += HIDWORD(v43);
            v41 += v43 & 1;
            if (v4 != 3)
            {
              unint64_t v44 = *((void *)a2 + 6);
              v39 += v44;
              v40 += HIDWORD(v44);
              v41 += v44 & 1;
            }
          }
        }
        a2 += v6;
        unint64_t v37 = v39 / v4;
        *(unsigned char *)a4 = (v41 / v4) & 1 | v37;
        *(unsigned char *)(a4 + 1) = BYTE1(v37);
        *(unsigned char *)(a4 + 2) = BYTE2(v37);
        *(unsigned char *)(a4 + 3) = BYTE3(v37);
        unint64_t v38 = v40 / v4;
        *(_WORD *)(a4 + 4) = v38;
        *(unsigned char *)(a4 + 6) = BYTE2(v38);
        *(unsigned char *)(a4 + 7) = BYTE3(v38);
        a4 += 16;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v9 = v7 - v8;
      uint64_t v10 = (const double *)(a2 + 32);
      v11.i64[0] = 0xFFFFFFFFLL;
      v11.i64[1] = 0xFFFFFFFFLL;
      int8x16_t v12 = (int8x16_t)vdupq_n_s64(1uLL);
      do
      {
        int64x2_t v13 = 0uLL;
        uint64_t v14 = v9;
        int64x2_t v15 = 0uLL;
        uint64_t v16 = v10;
        int64x2_t v17 = 0uLL;
        int64x2_t v18 = 0uLL;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        do
        {
          int64x2_t v23 = v16 - 4;
          unsigned long long v24 = (unsigned __int128)vld2q_f64(v23);
          unsigned long long v25 = (unsigned __int128)vld2q_f64(v16);
          int64x2_t v26 = (int64x2_t)vandq_s8((int8x16_t)v24, v12);
          int64x2_t v27 = (int64x2_t)vandq_s8((int8x16_t)v25, v12);
          int64x2_t v13 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v24, v11), v13);
          int64x2_t v15 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v25, v11), v15);
          int64x2_t v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v24, 0x20uLL);
          int64x2_t v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, (uint64x2_t)v25, 0x20uLL);
          int64x2_t v19 = vaddq_s64(v26, v19);
          int64x2_t v20 = vaddq_s64(v27, v20);
          int64x2_t v21 = vaddq_s64(v26, v21);
          int64x2_t v22 = vaddq_s64(v27, v22);
          v16 += 8;
          v14 -= 4;
        }
        while (v14);
        unint64_t v28 = vaddvq_s64(vaddq_s64(v22, v21));
        unint64_t v29 = vaddvq_s64(vaddq_s64(v20, v19));
        unint64_t v30 = vaddvq_s64(vaddq_s64(v18, v17));
        unint64_t v31 = vaddvq_s64(vaddq_s64(v15, v13));
        int v32 = v8;
        uint64_t v33 = 16 * v9;
        do
        {
          unint64_t v34 = *(void *)&a2[v33];
          v31 += v34;
          v30 += HIDWORD(v34);
          uint64_t v35 = v34 & 1;
          v29 += v35;
          v28 += v35;
          v33 += 16;
          --v32;
        }
        while (v32);
        a2 += v6;
        uint64_t result = v31 / v4;
        *(unsigned char *)a4 = ((v28 / v4) | (v29 / v4)) & 1 | result;
        *(unsigned char *)(a4 + 1) = BYTE1(result);
        *(unsigned char *)(a4 + 2) = BYTE2(result);
        *(unsigned char *)(a4 + 3) = BYTE3(result);
        unint64_t v36 = v30 / v4;
        *(_WORD *)(a4 + 4) = v36;
        *(unsigned char *)(a4 + 6) = BYTE2(v36);
        *(unsigned char *)(a4 + 7) = BYTE3(v36);
        a4 += 16;
        uint64_t v10 = (const double *)((char *)v10 + v6);
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,16u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(uint64_t result, char *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = &a2[a3];
    uint64_t v6 = 16 * (v4 - 1) + 16;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    uint64_t v8 = v7 & 3;
    if ((v7 & 3) == 0) {
      uint64_t v8 = 4;
    }
    uint64_t v9 = v7 - v8;
    uint64_t v10 = (const double *)(a2 + 32);
    int8x16_t v11 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v7 >= 5)
      {
        int64x2_t v18 = 0uLL;
        int64x2_t v17 = (uint64_t *)&a2[16 * v9];
        int64x2_t v19 = 0uLL;
        uint64_t v20 = v9;
        int64x2_t v21 = v10;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        int64x2_t v27 = 0uLL;
        do
        {
          unint64_t v28 = v21 - 4;
          unsigned long long v29 = (unsigned __int128)vld2q_f64(v28);
          unsigned long long v30 = (unsigned __int128)vld2q_f64(v21);
          int64x2_t v31 = (int64x2_t)vandq_s8((int8x16_t)v29, v11);
          int64x2_t v32 = (int64x2_t)vandq_s8((int8x16_t)v30, v11);
          int64x2_t v18 = vsraq_n_s64(v18, vshlq_n_s64((int64x2_t)v29, 0x20uLL), 0x20uLL);
          int64x2_t v19 = vsraq_n_s64(v19, vshlq_n_s64((int64x2_t)v30, 0x20uLL), 0x20uLL);
          int64x2_t v22 = vsraq_n_s64(v22, (int64x2_t)v29, 0x20uLL);
          int64x2_t v23 = vsraq_n_s64(v23, (int64x2_t)v30, 0x20uLL);
          int64x2_t v24 = vsubq_s64(v24, v31);
          int64x2_t v25 = vsubq_s64(v25, v32);
          int64x2_t v26 = vsubq_s64(v26, v31);
          int64x2_t v27 = vsubq_s64(v27, v32);
          v21 += 8;
          v20 -= 4;
        }
        while (v20);
        uint64_t v15 = vaddvq_s64(vaddq_s64(v27, v26));
        uint64_t v14 = vaddvq_s64(vaddq_s64(v25, v24));
        uint64_t v13 = vaddvq_s64(vaddq_s64(v23, v22));
        uint64_t v12 = vaddvq_s64(vaddq_s64(v19, v18));
        int v16 = v9;
      }
      else
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        int v16 = 0;
        int64x2_t v17 = (uint64_t *)a2;
      }
      int v33 = v7 - v16;
      do
      {
        uint64_t v34 = *v17;
        v17 += 2;
        v12 += (int)v34;
        v13 += v34 >> 32;
        v14 -= v34 & 1;
        v15 -= v34 & 1;
        --v33;
      }
      while (v33);
      a2 += v6;
      uint64_t result = v14 / v4;
      *(unsigned char *)a4 = ((v15 / v4) | result) & 1 | (v12 / v4);
      *(unsigned char *)(a4 + 1) = (unsigned __int16)(v12 / v4) >> 8;
      *(unsigned char *)(a4 + 2) = (v12 / v4) >> 16;
      *(unsigned char *)(a4 + 3) = (v12 / v4) >> 24;
      *(_WORD *)(a4 + 4) = v13 / v4;
      *(unsigned char *)(a4 + 6) = (v13 / v4) >> 16;
      *(unsigned char *)(a4 + 7) = (v13 / v4) >> 24;
      a4 += 16;
      uint64_t v10 = (const double *)((char *)v10 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,4u,true,41ull,32ull,51ull,42ull,61ull,52ull,63ull,62ull>(unint64_t result, char *a2, unsigned int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = &a2[a3];
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    uint64_t v8 = a2 + 16;
    int8x16_t v9 = (int8x16_t)vdupq_n_s64(0x3FFuLL);
    do
    {
      if (v7 >= 8)
      {
        int64x2_t v19 = 0uLL;
        int64x2_t v18 = (unsigned int *)&a2[4 * (v7 & 0xFFFFFFF8)];
        int64x2_t v20 = 0uLL;
        uint64_t v21 = v7 & 0xFFFFFFF8;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = v8;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        int64x2_t v27 = 0uLL;
        int64x2_t v28 = 0uLL;
        int64x2_t v29 = 0uLL;
        int64x2_t v30 = 0uLL;
        int64x2_t v31 = 0uLL;
        int64x2_t v32 = 0uLL;
        int64x2_t v33 = 0uLL;
        int64x2_t v34 = 0uLL;
        int64x2_t v35 = 0uLL;
        int64x2_t v36 = 0uLL;
        do
        {
          long long v37 = *((_OWORD *)v23 - 1);
          v38.i64[0] = DWORD2(v37);
          v38.i64[1] = HIDWORD(v37);
          int8x16_t v39 = v38;
          v38.i64[0] = v37;
          v38.i64[1] = DWORD1(v37);
          int8x16_t v40 = v38;
          v38.i64[0] = *((void *)v23 + 1);
          v38.i64[1] = HIDWORD(*(_OWORD *)v23);
          int8x16_t v41 = v38;
          v38.i64[0] = *(_OWORD *)v23;
          v38.i64[1] = HIDWORD(*(void *)v23);
          int64x2_t v20 = vaddq_s64((int64x2_t)vandq_s8(v39, v9), v20);
          int64x2_t v19 = vaddq_s64((int64x2_t)vandq_s8(v40, v9), v19);
          int64x2_t v24 = vaddq_s64((int64x2_t)vandq_s8(v41, v9), v24);
          int64x2_t v22 = vaddq_s64((int64x2_t)vandq_s8(v38, v9), v22);
          int64x2_t v26 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v39, 0xAuLL), v9), v26);
          int64x2_t v25 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v40, 0xAuLL), v9), v25);
          int64x2_t v28 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v41, 0xAuLL), v9), v28);
          int64x2_t v27 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v38, 0xAuLL), v9), v27);
          int64x2_t v30 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v39, 0x14uLL), v9), v30);
          int64x2_t v29 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v40, 0x14uLL), v9), v29);
          int64x2_t v32 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v41, 0x14uLL), v9), v32);
          int64x2_t v31 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v38, 0x14uLL), v9), v31);
          int64x2_t v34 = (int64x2_t)vsraq_n_u64((uint64x2_t)v34, (uint64x2_t)v39, 0x1EuLL);
          int64x2_t v33 = (int64x2_t)vsraq_n_u64((uint64x2_t)v33, (uint64x2_t)v40, 0x1EuLL);
          int64x2_t v36 = (int64x2_t)vsraq_n_u64((uint64x2_t)v36, (uint64x2_t)v41, 0x1EuLL);
          int64x2_t v35 = (int64x2_t)vsraq_n_u64((uint64x2_t)v35, (uint64x2_t)v38, 0x1EuLL);
          v23 += 8;
          v21 -= 8;
        }
        while (v21);
        unint64_t v17 = vaddvq_s64(vaddq_s64(vaddq_s64(v35, v33), vaddq_s64(v36, v34)));
        unint64_t v15 = vaddvq_s64(vaddq_s64(vaddq_s64(v31, v29), vaddq_s64(v32, v30)));
        unint64_t v14 = vaddvq_s64(vaddq_s64(vaddq_s64(v27, v25), vaddq_s64(v28, v26)));
        unint64_t v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v22, v19), vaddq_s64(v24, v20)));
        int v16 = v7 & 0xFFFFFFF8;
        if ((v7 & 0xFFFFFFF8) == v7) {
          goto LABEL_9;
        }
      }
      else
      {
        unint64_t v13 = 0;
        unint64_t v14 = 0;
        unint64_t v15 = 0;
        int v16 = 0;
        unint64_t v17 = 0;
        int64x2_t v18 = (unsigned int *)a2;
      }
      int v42 = v7 - v16;
      do
      {
        unsigned int v43 = *v18++;
        v13 += v43 & 0x3FF;
        v14 += ((unint64_t)v43 >> 10) & 0x3FF;
        v15 += ((unint64_t)v43 >> 20) & 0x3FF;
        v17 += (unint64_t)v43 >> 30;
        --v42;
      }
      while (v42);
LABEL_9:
      a2 += v6;
      unint64_t v10 = v15 / v4;
      unint64_t v11 = (v14 / v4) << 42;
      uint64_t v12 = v11 & 0xF000000000000;
      uint64_t result = v11 & 0xFFFFFC0000000000 | ((v13 / v4) << 32) & 0x3FFFFFFFFFFLL;
      *a4 = v13 / v4;
      a4[1] = BYTE5(result);
      a4[2] = (v12 & 0xFFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 52)) >> 48;
      a4[3] = ((v10 << 52) & 0x3F00000000000000 | ((v17 / v4) << 62)) >> 56;
      a4 += 4;
      uint64_t v8 = (_DWORD *)((char *)v8 + v6);
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,60ull,59ull,56ull,55ull,52ull,51ull,48ull>(uint64_t result, unsigned __int8 *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = &a2[a3];
    uint64_t v6 = 2 * (v4 - 1) + 2;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 < 8)
    {
      do
      {
        unint64_t v9 = a2[1];
        unint64_t v10 = v9 >> 4;
        unint64_t v11 = *a2;
        unint64_t v12 = v9 & 0xF;
        unint64_t v13 = v11 >> 4;
        unint64_t v14 = v11 & 0xF;
        if (result >= 2)
        {
          unint64_t v15 = a2[2];
          unint64_t v16 = a2[3];
          v10 += v16 >> 4;
          v12 += v16 & 0xF;
          v13 += v15 >> 4;
          v14 += v15 & 0xF;
          if (v4 != 2)
          {
            unint64_t v17 = a2[4];
            unint64_t v18 = a2[5];
            v10 += v18 >> 4;
            v12 += v18 & 0xF;
            v13 += v17 >> 4;
            v14 += v17 & 0xF;
            if (v4 != 3)
            {
              unint64_t v19 = a2[6];
              unint64_t v20 = a2[7];
              v10 += v20 >> 4;
              v12 += v20 & 0xF;
              v13 += v19 >> 4;
              v14 += v19 & 0xF;
              if (v4 != 4)
              {
                unint64_t v21 = a2[8];
                unint64_t v22 = a2[9];
                v10 += v22 >> 4;
                v12 += v22 & 0xF;
                v13 += v21 >> 4;
                v14 += v21 & 0xF;
                if (v4 != 5)
                {
                  unint64_t v23 = a2[10];
                  unint64_t v24 = a2[11];
                  v10 += v24 >> 4;
                  v12 += v24 & 0xF;
                  v13 += v23 >> 4;
                  v14 += v23 & 0xF;
                  if (v4 != 6)
                  {
                    unint64_t v25 = a2[12];
                    unint64_t v26 = a2[13];
                    v10 += v26 >> 4;
                    v12 += v26 & 0xF;
                    v13 += v25 >> 4;
                    v14 += v25 & 0xF;
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4 = (((v13 / v4) << 52) | (((v14 / v4) & 0xF) << 48)) >> 48;
        a4[1] = (((v10 / v4) << 60) | (((v12 / v4) & 0xF) << 56)) >> 56;
        a4 += 2;
      }
      while (a2 < v5);
    }
    else
    {
      int8x16_t v8 = (int8x16_t)vdupq_n_s64(0xFuLL);
      do
      {
        int64x2_t v27 = 0uLL;
        uint64_t v28 = v7 & 0xFFFFFFF8;
        int64x2_t v29 = 0uLL;
        int64x2_t v30 = (const char *)a2;
        int64x2_t v31 = 0uLL;
        int64x2_t v32 = 0uLL;
        int64x2_t v33 = 0uLL;
        int64x2_t v34 = 0uLL;
        int64x2_t v35 = 0uLL;
        int64x2_t v36 = 0uLL;
        int64x2_t v37 = 0uLL;
        int64x2_t v38 = 0uLL;
        int64x2_t v39 = 0uLL;
        int64x2_t v40 = 0uLL;
        int64x2_t v41 = 0uLL;
        int64x2_t v42 = 0uLL;
        int64x2_t v43 = 0uLL;
        int64x2_t v44 = 0uLL;
        do
        {
          int8x8x2_t v63 = vld2_s8(v30);
          v30 += 16;
          uint16x8_t v45 = vmovl_u8((uint8x8_t)v63.val[0]);
          int8x8x2_t v63 = (int8x8x2_t)vmovl_u8((uint8x8_t)v63.val[1]);
          *(int8x8x2_t *)((char *)&v63 + 8) = (int8x8x2_t)vmovl_high_u16((uint16x8_t)v63);
          v48.val[0] = (int8x8_t)v46;
          v48.val[1] = (int8x8_t)v47;
          int64x2_t v32 = (int64x2_t)vsraq_n_u64((uint64x2_t)v32, (uint64x2_t)v48, 4uLL);
          int64x2_t v36 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v36);
          v48.val[0] = (int8x8_t)v63.val[1].u32[0];
          v48.val[1] = (int8x8_t)v63.val[1].u32[1];
          int8x8x2_t v63 = (int8x8x2_t)vmovl_u16((uint16x4_t)v63.val[0]);
          int64x2_t v31 = (int64x2_t)vsraq_n_u64((uint64x2_t)v31, (uint64x2_t)v48, 4uLL);
          int64x2_t v35 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v35);
          v48.val[0] = (int8x8_t)v49;
          v48.val[1] = (int8x8_t)v50;
          int64x2_t v29 = (int64x2_t)vsraq_n_u64((uint64x2_t)v29, (uint64x2_t)v48, 4uLL);
          int64x2_t v34 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v34);
          *(int8x8x2_t *)((char *)&v63 + 8) = (int8x8x2_t)vmovl_high_u16(v45);
          v48.val[0] = (int8x8_t)v63.val[0].u32[0];
          v48.val[1] = (int8x8_t)v63.val[0].u32[1];
          int64x2_t v27 = (int64x2_t)vsraq_n_u64((uint64x2_t)v27, (uint64x2_t)v48, 4uLL);
          int64x2_t v33 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v33);
          v48.val[0] = (int8x8_t)v51;
          v48.val[1] = (int8x8_t)v52;
          int64x2_t v40 = (int64x2_t)vsraq_n_u64((uint64x2_t)v40, (uint64x2_t)v48, 4uLL);
          int64x2_t v44 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v44);
          v48.val[0] = (int8x8_t)v63.val[1].u32[0];
          v48.val[1] = (int8x8_t)v63.val[1].u32[1];
          *(int8x8x2_t *)((char *)&v63 + 8) = (int8x8x2_t)vmovl_u16(*(uint16x4_t *)v45.i8);
          int64x2_t v39 = (int64x2_t)vsraq_n_u64((uint64x2_t)v39, (uint64x2_t)v48, 4uLL);
          int64x2_t v43 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v43);
          v48.val[0] = (int8x8_t)v53;
          v48.val[1] = (int8x8_t)v54;
          int8x8x2_t v63 = v48;
          v48.val[0] = (int8x8_t)v63.val[1].u32[0];
          v48.val[1] = (int8x8_t)v63.val[1].u32[1];
          int64x2_t v37 = (int64x2_t)vsraq_n_u64((uint64x2_t)v37, (uint64x2_t)v48, 4uLL);
          int64x2_t v38 = (int64x2_t)vsraq_n_u64((uint64x2_t)v38, (uint64x2_t)v63, 4uLL);
          int64x2_t v42 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v63, v8), v42);
          int64x2_t v41 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v48, v8), v41);
          v28 -= 8;
        }
        while (v28);
        unint64_t v55 = vaddvq_s64(vaddq_s64(vaddq_s64(v41, v43), vaddq_s64(v42, v44)));
        unint64_t v56 = vaddvq_s64(vaddq_s64(vaddq_s64(v37, v39), vaddq_s64(v38, v40)));
        unint64_t v57 = vaddvq_s64(vaddq_s64(vaddq_s64(v33, v35), vaddq_s64(v34, v36)));
        unint64_t v58 = vaddvq_s64(vaddq_s64(vaddq_s64(v27, v31), vaddq_s64(v29, v32)));
        int v59 = v4 - (v7 & 0xFFFFFFF8);
        uint64_t v60 = 2 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            unint64_t v61 = a2[v60 + 1];
            unint64_t v62 = a2[v60];
            v58 += v61 >> 4;
            v57 += v61 & 0xF;
            v56 += v62 >> 4;
            v55 += v62 & 0xF;
            v60 += 2;
            --v59;
          }
          while (v59);
        }
        a2 += v6;
        uint64_t result = ((v58 / v4) << 60) | (((v57 / v4) & 0xF) << 56);
        *a4 = (((v56 / v4) << 52) | (((v55 / v4) & 0xF) << 48)) >> 48;
        a4[1] = HIBYTE(result);
        a4 += 2;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<2u,2u,true,63ull,59ull,58ull,54ull,53ull,49ull,48ull,48ull>(uint64_t result, const char *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    int8x16_t v5 = &a2[a3];
    if (result <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = result;
    }
    int8x16_t v7 = (int8x16_t)vdupq_n_s64(0x1FuLL);
    int8x16_t v8 = (int8x16_t)vdupq_n_s64(1uLL);
    do
    {
      if (v6 >= 8)
      {
        int64x2_t v17 = 0uLL;
        unint64_t v16 = &a2[2 * (v6 & 0xFFFFFFF8)];
        int64x2_t v18 = 0uLL;
        uint64_t v19 = v6 & 0xFFFFFFF8;
        int64x2_t v20 = 0uLL;
        unint64_t v21 = a2;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        int64x2_t v27 = 0uLL;
        int64x2_t v28 = 0uLL;
        int64x2_t v29 = 0uLL;
        int64x2_t v30 = 0uLL;
        int64x2_t v31 = 0uLL;
        int64x2_t v32 = 0uLL;
        int64x2_t v33 = 0uLL;
        int64x2_t v34 = 0uLL;
        do
        {
          uint16x8_t v52 = (uint16x8_t)vld2_s8(v21);
          v21 += 16;
          uint16x8_t v35 = vmovl_u8(*(uint8x8_t *)v52.i8);
          uint32x4_t v36 = vmovl_u16(*(uint16x4_t *)v35.i8);
          v37.i64[0] = v36.u32[0];
          v37.i64[1] = v36.u32[1];
          int64x2_t v38 = v37;
          v37.i64[0] = v36.u32[2];
          v37.i64[1] = v36.u32[3];
          int64x2_t v39 = v37;
          uint32x4_t v40 = vmovl_high_u16(v35);
          v37.i64[0] = v40.u32[0];
          v37.i64[1] = v40.u32[1];
          int64x2_t v41 = v37;
          v37.i64[0] = v40.u32[2];
          v37.i64[1] = v40.u32[3];
          int64x2_t v42 = v37;
          uint16x8_t v52 = vmovl_u8((uint8x8_t)v52.u64[1]);
          *(uint32x4_t *)((char *)&v52 + 8) = vmovl_u16(*(uint16x4_t *)v52.i8);
          v37.i64[0] = v52.u32[2];
          v37.i64[1] = v52.u32[3];
          int64x2_t v43 = v37;
          v37.i64[0] = v44;
          v37.i64[1] = v45;
          *(int64x2_t *)((char *)&v52 + 8) = v37;
          uint16x8_t v52 = (uint16x8_t)vmovl_high_u16(v52);
          v37.i64[0] = v52.u32[0];
          v37.i64[1] = v52.u32[1];
          int64x2_t v46 = v37;
          v37.i64[0] = v47;
          v37.i64[1] = v48;
          int64x2_t v22 = (int64x2_t)vsraq_n_u64((uint64x2_t)v22, (uint64x2_t)v37, 3uLL);
          int64x2_t v20 = (int64x2_t)vsraq_n_u64((uint64x2_t)v20, (uint64x2_t)v46, 3uLL);
          int64x2_t v18 = (int64x2_t)vsraq_n_u64((uint64x2_t)v18, *(uint64x2_t *)((char *)&v52 + 8), 3uLL);
          int64x2_t v17 = (int64x2_t)vsraq_n_u64((uint64x2_t)v17, (uint64x2_t)v43, 3uLL);
          int64x2_t v26 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v37, 0x38uLL), (int8x16_t)vshlq_n_s64(v42, 0x30uLL)), 0x36uLL), v7), v26);
          int64x2_t v25 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v46, 0x38uLL), (int8x16_t)vshlq_n_s64(v41, 0x30uLL)), 0x36uLL), v7), v25);
          int64x2_t v24 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(*(int64x2_t *)((char *)&v52 + 8), 0x38uLL), (int8x16_t)vshlq_n_s64(v39, 0x30uLL)), 0x36uLL), v7), v24);
          int64x2_t v23 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)vorrq_s8((int8x16_t)vshlq_n_s64(v43, 0x38uLL), (int8x16_t)vshlq_n_s64(v38, 0x30uLL)), 0x36uLL), v7), v23);
          int64x2_t v30 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v42, 1uLL), v7), v30);
          int64x2_t v29 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v41, 1uLL), v7), v29);
          int64x2_t v28 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v39, 1uLL), v7), v28);
          int64x2_t v27 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)vshrq_n_u64((uint64x2_t)v38, 1uLL), v7), v27);
          int64x2_t v34 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v42, v8), v34);
          int64x2_t v33 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v41, v8), v33);
          int64x2_t v32 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v39, v8), v32);
          int64x2_t v31 = vaddq_s64((int64x2_t)vandq_s8((int8x16_t)v38, v8), v31);
          v19 -= 8;
        }
        while (v19);
        unint64_t v15 = vaddvq_s64(vaddq_s64(vaddq_s64(v31, v33), vaddq_s64(v32, v34)));
        unint64_t v13 = vaddvq_s64(vaddq_s64(vaddq_s64(v27, v29), vaddq_s64(v28, v30)));
        unint64_t v12 = vaddvq_s64(vaddq_s64(vaddq_s64(v23, v25), vaddq_s64(v24, v26)));
        unint64_t v11 = vaddvq_s64(vaddq_s64(vaddq_s64(v17, v20), vaddq_s64(v18, v22)));
        int v14 = v6 & 0xFFFFFFF8;
        if ((v6 & 0xFFFFFFF8) == v6) {
          goto LABEL_9;
        }
      }
      else
      {
        unint64_t v11 = 0;
        unint64_t v12 = 0;
        unint64_t v13 = 0;
        int v14 = 0;
        unint64_t v15 = 0;
        unint64_t v16 = a2;
      }
      int v49 = v6 - v14;
      do
      {
        unint64_t v50 = *(unsigned __int8 *)v16;
        unint64_t v51 = *((unsigned __int8 *)v16 + 1);
        v11 += v51 >> 3;
        v12 += (((v50 << 48) | (v51 << 56)) >> 54) & 0x1F;
        v13 += (v50 >> 1) & 0x1F;
        v15 += v50 & 1;
        v16 += 2;
        --v49;
      }
      while (v49);
LABEL_9:
      a2 += 2 * (v4 - 1) + 2;
      unint64_t v9 = v11 / v4;
      unint64_t v10 = v12 / v4;
      uint64_t result = (v10 << 54) & 0x700000000000000;
      *a4 = ((((v15 / v4) & 1) << 48) & 0x1FFFFFFFFFFFFLL | (((v13 / v4) & 0x1F) << 49) & 0x3FFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v10 << 54)) >> 48;
      a4[1] = (result | (v9 << 59)) >> 56;
      a4 += 2;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)11,(unsigned char)11,(unsigned char)10,(unsigned char)0>(uint64_t result, char *a2, unsigned int a3, int *a4)
{
  if (a3)
  {
    unint64_t v4 = &a2[a3];
    float v5 = (float)result;
    do
    {
      if (!result)
      {
        float v11 = 0.0;
        float v10 = 0.0;
        float v29 = 0.0 / v5;
        if ((COERCE_UNSIGNED_INT(0.0 / v5) & 0x80000000) != 0) {
          goto LABEL_53;
        }
LABEL_43:
        unsigned int v30 = LODWORD(v29) & 0x7F800000;
        unsigned int v31 = LODWORD(v29) & 0x7FFFFF;
        if (v30 == 2139095040)
        {
          int v32 = (v31 >> 17) | 0x7C0;
          float v33 = v11 / v5;
          if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0) {
            goto LABEL_54;
          }
          goto LABEL_67;
        }
        if (!v30)
        {
          int v32 = v31 >> 17;
          float v33 = v11 / v5;
          if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0) {
            goto LABEL_54;
          }
          goto LABEL_67;
        }
        if (v30 > 0x47000000)
        {
          LOWORD(v32) = 1984;
          float v33 = v11 / v5;
          if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0) {
            goto LABEL_54;
          }
          goto LABEL_67;
        }
        if (v30 >> 23 < 0x71) {
          goto LABEL_53;
        }
        int v32 = ((v30 >> 17) + 58368) | (v31 >> 17);
        float v33 = v11 / v5;
        if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) != 0) {
          goto LABEL_67;
        }
LABEL_54:
        unsigned int v34 = LODWORD(v33) & 0x7F800000;
        unsigned int v35 = LODWORD(v33) & 0x7FFFFF;
        if (v34 == 2139095040)
        {
          int v36 = (v35 >> 17) | 0x7C0;
          float v37 = v10 / v5;
          if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0) {
            goto LABEL_68;
          }
        }
        else if (v34)
        {
          if (v34 <= 0x47000000)
          {
            if (v34 >> 23 < 0x71) {
              goto LABEL_67;
            }
            int v36 = ((v34 >> 17) + 58368) | (v35 >> 17);
            float v37 = v10 / v5;
            if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0) {
              goto LABEL_68;
            }
          }
          else
          {
            LOWORD(v36) = 1984;
            float v37 = v10 / v5;
            if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0) {
              goto LABEL_68;
            }
          }
        }
        else
        {
          int v36 = v35 >> 17;
          float v37 = v10 / v5;
          if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) == 0) {
            goto LABEL_68;
          }
        }
LABEL_3:
        int v6 = 0;
        goto LABEL_4;
      }
      int v7 = 0;
      float v8 = 0.0;
      unint64_t v9 = (unsigned int *)a2;
      float v10 = 0.0;
      float v11 = 0.0;
      do
      {
        unsigned int v14 = *v9;
        int v15 = (*v9 >> 6) & 0x1F;
        int v16 = *v9 & 0x3F;
        if (v15 == 31)
        {
          LODWORD(v19) = (v16 << 17) | 0x7F800000;
          int v20 = (v14 >> 17) & 0x1F;
          int v21 = (v14 >> 11) & 0x3F;
          if (v20 == 31) {
            goto LABEL_17;
          }
          goto LABEL_21;
        }
        if (v15)
        {
          char v17 = 0;
          int v18 = (v15 << 23) + 939524096;
          goto LABEL_20;
        }
        if (v16)
        {
          char v17 = -1;
          int v18 = 956301312;
          do
          {
            ++v17;
            v18 -= 0x800000;
          }
          while (((v16 << v17) & 0x40) == 0);
LABEL_20:
          LODWORD(v19) = (v16 << (v17 + 17)) & 0x7FFFFF | v18;
          int v20 = (v14 >> 17) & 0x1F;
          int v21 = (v14 >> 11) & 0x3F;
          if (v20 == 31) {
            goto LABEL_17;
          }
          goto LABEL_21;
        }
        float v19 = 0.0;
        int v20 = (v14 >> 17) & 0x1F;
        int v21 = (v14 >> 11) & 0x3F;
        if (v20 == 31)
        {
LABEL_17:
          LODWORD(v22) = (v21 << 17) | 0x7F800000;
          unsigned int v23 = v14 >> 27;
          if (v14 >> 27 == 31) {
            goto LABEL_7;
          }
          goto LABEL_28;
        }
LABEL_21:
        if (v20)
        {
          char v24 = 0;
          int v25 = (v20 << 23) + 939524096;
          goto LABEL_27;
        }
        if (v21)
        {
          char v24 = -1;
          int v25 = 956301312;
          do
          {
            ++v24;
            v25 -= 0x800000;
          }
          while (((v21 << v24) & 0x40) == 0);
LABEL_27:
          LODWORD(v22) = (v21 << (v24 + 17)) & 0x7FFFFF | v25;
          unsigned int v23 = v14 >> 27;
          if (v14 >> 27 == 31) {
            goto LABEL_7;
          }
          goto LABEL_28;
        }
        float v22 = 0.0;
        unsigned int v23 = v14 >> 27;
        if (v14 >> 27 == 31)
        {
LABEL_7:
          int v12 = (v14 >> 22 << 18) | 0x7F800000;
LABEL_8:
          float v13 = *(float *)&v12;
          goto LABEL_9;
        }
LABEL_28:
        int v26 = (v14 >> 22) & 0x1F;
        if (v23)
        {
          char v27 = 0;
          int v28 = (v23 << 23) + 939524096;
LABEL_34:
          int v12 = (v26 << (v27 + 18)) & 0x7FFFFF | v28;
          goto LABEL_8;
        }
        if (v26)
        {
          char v27 = -1;
          int v28 = 956301312;
          do
          {
            ++v27;
            v28 -= 0x800000;
          }
          while (((v26 << v27) & 0x20) == 0);
          goto LABEL_34;
        }
        float v13 = 0.0;
LABEL_9:
        float v8 = v8 + v19;
        float v11 = v11 + v22;
        float v10 = v10 + v13;
        ++v9;
        ++v7;
      }
      while (v7 != result);
      a2 += 4 * (result - 1) + 4;
      float v29 = v8 / v5;
      if ((COERCE_UNSIGNED_INT(v8 / v5) & 0x80000000) == 0) {
        goto LABEL_43;
      }
LABEL_53:
      LOWORD(v32) = 0;
      float v33 = v11 / v5;
      if ((COERCE_UNSIGNED_INT(v11 / v5) & 0x80000000) == 0) {
        goto LABEL_54;
      }
LABEL_67:
      LOWORD(v36) = 0;
      float v37 = v10 / v5;
      if ((COERCE_UNSIGNED_INT(v10 / v5) & 0x80000000) != 0) {
        goto LABEL_3;
      }
LABEL_68:
      unsigned int v38 = LODWORD(v37) & 0x7F800000;
      unsigned int v39 = LODWORD(v37) & 0x7FFFFF;
      if (v38 == 2139095040)
      {
        int v6 = (v39 >> 18) | 0x3E0;
        goto LABEL_4;
      }
      if (!v38)
      {
        int v6 = v39 >> 18;
        goto LABEL_4;
      }
      if (v38 > 0x47000000)
      {
        int v6 = 992;
        goto LABEL_4;
      }
      if (v38 >> 23 < 0x71) {
        goto LABEL_3;
      }
      int v6 = ((v38 >> 18) + 61952) | (v39 >> 18);
LABEL_4:
      *a4++ = ((unsigned __int16)v36 << 11) | (unsigned __int16)v32 | (v6 << 22);
    }
    while (a2 < v4);
  }
  return result;
}

void GPUTools::GL::MSAABufferResolverResolveRGB9E5(GPUTools::GL *this, unsigned int *a2, const void *a3, __int32 *a4, void *a5, double a6)
{
  if (a3)
  {
    int v7 = a2;
    int v8 = (int)this;
    *(float *)&a6 = (float)this;
    unint64_t v9 = (unint64_t)a2 + a3;
    float v37 = (float)this;
    float32x2_t v36 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
    float32x2_t v10 = (float32x2_t)vdup_n_s32(0x477F8000u);
    __asm { FMOV            V0.2D, #0.5 }
    float64x2_t v35 = _Q0;
    do
    {
      float32x2_t v30 = 0;
      float v31 = 0.0;
      if (v8)
      {
        int v32 = v8;
        do
        {
          unsigned int v33 = *v7++;
          float v34 = ldexp(1.0, (v33 >> 27) - 24);
          float v31 = v31 + (float)((float)(v33 & 0x1FF) * v34);
          float32x2_t v30 = vadd_f32(v30, vmul_n_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(v33), (uint32x2_t)0xFFFFFFF7FFFFFFEELL), (int8x8_t)0x100000001)), v34));
          --v32;
        }
        while (v32);
      }
      float v15 = 65408.0;
      if ((float)(v31 / v37) < 65408.0) {
        float v15 = v31 / v37;
      }
      float v16 = 0.0;
      if ((float)(v31 / v37) > 0.0) {
        float v16 = v15;
      }
      double v17 = v16;
      float32x2_t v18 = vdiv_f32(v30, v36);
      int8x8_t v19 = vand_s8(vbsl_s8((int8x8_t)vcge_f32(v18, v10), (int8x8_t)v10, (int8x8_t)v18), (int8x8_t)vcgtz_f32(v18));
      float32x2_t v38 = (float32x2_t)v19;
      if (v16 <= *(float *)v19.i32) {
        float v20 = *(float *)v19.i32;
      }
      else {
        float v20 = v16;
      }
      if (*(float *)&v19.i32[1] > *(float *)v19.i32) {
        v19.i32[0] = v19.i32[1];
      }
      if (v16 <= *(float *)&v19.i32[1]) {
        float v21 = *(float *)v19.i32;
      }
      else {
        float v21 = v20;
      }
      if ((LODWORD(v21) >> 23) <= 0x6Fu) {
        int v22 = 111;
      }
      else {
        int v22 = (LODWORD(v21) >> 23);
      }
      double v23 = ldexp(1.0, v22 - 135);
      unsigned int v24 = vcvtmd_s64_f64(v21 / v23 + 0.5);
      _ZF = v24 == 512;
      if (v24 == 512) {
        int v26 = 18;
      }
      else {
        int v26 = 17;
      }
      int v27 = v26 + v22;
      if (_ZF) {
        double v23 = v23 + v23;
      }
      __int16 v28 = vcvtmd_s64_f64(v17 / v23 + 0.5);
      int8x8_t v29 = vand_s8((int8x8_t)vshl_u32((uint32x2_t)vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vdivq_f64(vcvtq_f64_f32(v38), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v23, 0)), v35)))), (uint32x2_t)0x900000012), (int8x8_t)0x3FE0007FC0000);
      *a4++ = v28 & 0x1FF | (v27 << 27) | v29.i32[1] | v29.i32[0];
    }
    while ((unint64_t)v7 < v9);
  }
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<2u,(unsigned char)16,(unsigned char)0,(unsigned char)0,(unsigned char)0>(uint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  if (!a3) {
    return result;
  }
  float v4 = (float)result;
  if (!result)
  {
    float v24 = 0.0 / v4;
    unsigned int v25 = HIWORD(COERCE_UNSIGNED_INT(0.0 / v4)) & 0x8000;
    int v26 = HIWORD(LODWORD(v24)) & 0x8000 | (LODWORD(v24) >> 13) & 0x3FF;
    unsigned int v27 = COERCE_UNSIGNED_INT(0.0 / v4) & 0x7F800000;
    if (v27)
    {
      if (v27 == 2139095040)
      {
        while (1)
          *a4++ = v26 | 0x7C00;
      }
      if (v27 >= 0x47000001)
      {
        for (__int16 i = v25 | 0x7C00; ; *a4++ = i)
          ;
      }
      if (v27 >> 23 < 0x71)
      {
        while (1)
          *a4++ = v25;
      }
      for (unsigned int j = (((v27 >> 13) & 0xFFFFFC00 | (LODWORD(v24) >> 13) & 0x3FF) + 0x4000) | v25; ; *a4++ = j)
        ;
    }
    while (1)
      *a4++ = v26;
  }
  float v5 = (unsigned __int16 *)((char *)a2 + a3);
  uint64_t v6 = 2 * (result - 1) + 2;
  do
  {
    while (2)
    {
      int v7 = 0;
      float v8 = 0.0;
      unint64_t v9 = a2;
      do
      {
        while (1)
        {
          unsigned int v11 = (__int16)*v9;
          int v12 = (v11 >> 10) & 0x1F;
          int v13 = v11 & 0x3FF;
          unsigned int v14 = v11 & 0x80000000;
          if (!v12) {
            break;
          }
          if (v12 != 31)
          {
            char v15 = 0;
            int v16 = (v12 << 23) + 939524096;
LABEL_14:
            int v10 = v16 | v14 | (v13 << (v15 + 13)) & 0x7FFFFF;
            goto LABEL_7;
          }
          int v10 = v14 | (*v9 << 13) | 0x7F800000;
LABEL_7:
          float v8 = v8 + *(float *)&v10;
          ++v9;
          if (++v7 == result) {
            goto LABEL_16;
          }
        }
        if ((v11 & 0x3FF) != 0)
        {
          int v16 = 956301312;
          char v15 = -1;
          do
          {
            ++v15;
            v16 -= 0x800000;
          }
          while (((v13 << v15) & 0x400) == 0);
          goto LABEL_14;
        }
        float v8 = v8 + 0.0;
        ++v9;
        ++v7;
      }
      while (v7 != result);
LABEL_16:
      float v17 = v8 / v4;
      unsigned int v18 = LODWORD(v17) & 0x7FFFFF;
      int v19 = HIWORD(LODWORD(v17)) & 0x8000;
      unsigned int v20 = LODWORD(v17) & 0x7F800000;
      if ((LODWORD(v17) & 0x7F800000) == 0)
      {
        a2 = (unsigned __int16 *)((char *)a2 + v6);
        *a4++ = v19 | (v18 >> 13);
        if (a2 >= v5) {
          return result;
        }
        continue;
      }
      break;
    }
    int v21 = v19 | (v18 >> 13) | 0x7C00;
    int v22 = ((v20 >> 13) + 0x4000) | (v18 >> 13) | v19;
    if (v20 >> 23 < 0x71) {
      int v22 = HIWORD(LODWORD(v17)) & 0x8000;
    }
    if (v20 > 0x47000000) {
      LOWORD(v22) = v19 | 0x7C00;
    }
    if (v20 == 2139095040) {
      __int16 v23 = v21;
    }
    else {
      __int16 v23 = v22;
    }
    a2 = (unsigned __int16 *)((char *)a2 + v6);
    *a4++ = v23;
  }
  while (a2 < v5);
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)32,(unsigned char)0,(unsigned char)0,(unsigned char)0>(uint64_t result, unint64_t a2, unsigned int a3, float *a4)
{
  if (a3)
  {
    float v4 = (float)result;
    if (!result)
    {
      for (float i = 0.0 / v4; ; *a4++ = i)
        ;
    }
    unint64_t v5 = a2 + a3;
    do
    {
      uint64_t v6 = 0;
      float v7 = 0.0;
      do
        float v7 = v7 + *(float *)(a2 + 4 * v6++);
      while (result != v6);
      a2 += 4 * (result - 1) + 4;
      *a4++ = v7 / v4;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<4u,(unsigned char)16,(unsigned char)16,(unsigned char)0,(unsigned char)0>(uint64_t result, char *a2, unsigned int a3, _WORD *a4)
{
  if (a3)
  {
    float v4 = &a2[a3];
    float v5 = (float)result;
    while (!result)
    {
      float v21 = 0.0;
      float v19 = 0.0;
LABEL_4:
      float v6 = v19 / v5;
      float v7 = v21 / v5;
      unsigned int v8 = LODWORD(v6) & 0x7F800000;
      int v9 = HIWORD(LODWORD(v6)) & 0x8000;
      unsigned int v10 = v9 | ((LODWORD(v6) & 0x7FFFFFu) >> 13);
      unsigned int v11 = (((LODWORD(v6) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v6) & 0x7FFFFFu) >> 13) | v9;
      if ((LODWORD(v6) & 0x7F800000u) >> 23 < 0x71) {
        unsigned int v11 = HIWORD(LODWORD(v6)) & 0x8000;
      }
      __int16 v12 = v9 | 0x7C00;
      if (v8 < 0x47000001) {
        __int16 v12 = v11;
      }
      if (!v8) {
        __int16 v12 = v10;
      }
      if (v8 == 2139095040) {
        __int16 v12 = v10 | 0x7C00;
      }
      *a4 = v12;
      unsigned int v13 = LODWORD(v7) & 0x7F800000;
      int v14 = HIWORD(LODWORD(v7)) & 0x8000;
      unsigned int v15 = v14 | ((LODWORD(v7) & 0x7FFFFFu) >> 13);
      unsigned int v16 = (((LODWORD(v7) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v7) & 0x7FFFFFu) >> 13) | v14;
      if ((LODWORD(v7) & 0x7F800000u) >> 23 < 0x71) {
        unsigned int v16 = HIWORD(LODWORD(v7)) & 0x8000;
      }
      __int16 v17 = v14 | 0x7C00;
      if (v13 < 0x47000001) {
        __int16 v17 = v16;
      }
      if (!v13) {
        __int16 v17 = v15;
      }
      if (v13 == 2139095040) {
        __int16 v17 = v15 | 0x7C00;
      }
      a4[1] = v17;
      a4 += 2;
      if (a2 >= v4) {
        return result;
      }
    }
    int v18 = 0;
    float v19 = 0.0;
    unsigned int v20 = (unsigned int *)a2;
    float v21 = 0.0;
    while (1)
    {
      unsigned int v24 = *v20;
      int v25 = (*v20 >> 10) & 0x1F;
      int v26 = *v20 & 0x3FF;
      unsigned int v27 = (*v20 << 16) & 0x80000000;
      if (v25 == 31)
      {
        LODWORD(v30) = v27 | (v26 << 13) | 0x7F800000;
        int v31 = (v24 >> 26) & 0x1F;
        unsigned int v32 = v24 & 0x80000000;
        if (v31 == 31) {
          goto LABEL_23;
        }
        goto LABEL_36;
      }
      if (v25) {
        break;
      }
      if (v26)
      {
        char v28 = -1;
        int v29 = 956301312;
        do
        {
          ++v28;
          v29 -= 0x800000;
        }
        while (((v26 << v28) & 0x400) == 0);
LABEL_35:
        LODWORD(v30) = v29 | v27 | (v26 << (v28 + 13)) & 0x7FFFFF;
        int v31 = (v24 >> 26) & 0x1F;
        unsigned int v32 = v24 & 0x80000000;
        if (v31 == 31) {
          goto LABEL_23;
        }
        goto LABEL_36;
      }
      float v30 = 0.0;
      int v31 = (v24 >> 26) & 0x1F;
      unsigned int v32 = v24 & 0x80000000;
      if (v31 == 31)
      {
LABEL_23:
        int v22 = v32 | (HIWORD(v24) << 13) | 0x7F800000;
        goto LABEL_24;
      }
LABEL_36:
      int v33 = HIWORD(v24) & 0x3FF;
      if (v31)
      {
        char v34 = 0;
        int v35 = (v31 << 23) + 939524096;
      }
      else
      {
        if (!v33)
        {
          float v23 = 0.0;
          goto LABEL_25;
        }
        char v34 = -1;
        int v35 = 956301312;
        do
        {
          ++v34;
          v35 -= 0x800000;
        }
        while (((v33 << v34) & 0x400) == 0);
      }
      int v22 = v35 | v32 | (v33 << (v34 + 13)) & 0x7FFFFF;
LABEL_24:
      float v23 = *(float *)&v22;
LABEL_25:
      float v19 = v19 + v30;
      float v21 = v21 + v23;
      ++v20;
      if (++v18 == result)
      {
        a2 += 4 * (result - 1) + 4;
        goto LABEL_4;
      }
    }
    char v28 = 0;
    int v29 = (v25 << 23) + 939524096;
    goto LABEL_35;
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)32,(unsigned char)32,(unsigned char)0,(unsigned char)0>(uint64_t result, unint64_t a2, unsigned int a3, float *a4, double a5)
{
  if (a3)
  {
    *(float *)&a5 = (float)result;
    if (!result)
    {
      float v9 = 0.0 / *(float *)&a5;
      while (1)
      {
        *a4 = v9;
        a4[1] = v9;
        a4 += 2;
      }
    }
    unint64_t v5 = a2 + a3;
    float32x2_t v6 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      uint64_t v7 = 0;
      float32x2_t v8 = 0;
      do
        float32x2_t v8 = vadd_f32(v8, *(float32x2_t *)(a2 + 8 * v7++));
      while (result != v7);
      a2 += 8 * (result - 1) + 8;
      *(float32x2_t *)a4 = vdiv_f32(v8, v6);
      a4 += 2;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(uint64_t result, char *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = &a2[a3];
    uint64_t v6 = 3 * (v4 - 1) + 3;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 < 8)
    {
      do
      {
        uint64_t v8 = *a2;
        uint64_t v9 = a2[1];
        uint64_t v10 = a2[2];
        if (result >= 2)
        {
          v8 += a2[3];
          v9 += a2[4];
          v10 += a2[5];
          if (v4 != 2)
          {
            v8 += a2[6];
            v9 += a2[7];
            v10 += a2[8];
            if (v4 != 3)
            {
              v8 += a2[9];
              v9 += a2[10];
              v10 += a2[11];
              if (v4 != 4)
              {
                v8 += a2[12];
                v9 += a2[13];
                v10 += a2[14];
                if (v4 != 5)
                {
                  v8 += a2[15];
                  v9 += a2[16];
                  v10 += a2[17];
                  if (v4 != 6)
                  {
                    v8 += a2[18];
                    v9 += a2[19];
                    v10 += a2[20];
                  }
                }
              }
            }
          }
        }
        a2 += v6;
        *a4 = v8 / v4;
        a4[1] = v9 / v4;
        a4[2] = v10 / v4;
        a4 += 3;
      }
      while (a2 < v5);
    }
    else
    {
      do
      {
        int64x2_t v11 = 0uLL;
        uint64_t v12 = v7 & 0xFFFFFFF8;
        int64x2_t v13 = 0uLL;
        int v14 = a2;
        int64x2_t v15 = 0uLL;
        int64x2_t v16 = 0uLL;
        int64x2_t v17 = 0uLL;
        int64x2_t v18 = 0uLL;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        do
        {
          int8x8x3_t v35 = vld3_s8(v14);
          v14 += 24;
          int16x8_t v25 = vmovl_s8(v35.val[0]);
          int32x4_t v26 = vmovl_s16(*(int16x4_t *)v25.i8);
          int32x4_t v27 = vmovl_high_s16(v25);
          int16x8_t v28 = vmovl_s8(v35.val[1]);
          int32x4_t v29 = vmovl_s16(*(int16x4_t *)v28.i8);
          int32x4_t v30 = vmovl_high_s16(v28);
          *(int16x8_t *)v35.val[0].i8 = vmovl_s8(v35.val[2]);
          *(int32x4_t *)v35.val[1].i8 = vmovl_s16((int16x4_t)v35.val[0]);
          *(int32x4_t *)v35.val[0].i8 = vmovl_high_s16(*(int16x8_t *)v35.val[0].i8);
          int64x2_t v16 = vaddw_high_s32(v16, v27);
          int64x2_t v15 = vaddw_s32(v15, *(int32x2_t *)v27.i8);
          int64x2_t v13 = vaddw_high_s32(v13, v26);
          int64x2_t v11 = vaddw_s32(v11, *(int32x2_t *)v26.i8);
          int64x2_t v20 = vaddw_high_s32(v20, v30);
          int64x2_t v19 = vaddw_s32(v19, *(int32x2_t *)v30.i8);
          int64x2_t v18 = vaddw_high_s32(v18, v29);
          int64x2_t v17 = vaddw_s32(v17, *(int32x2_t *)v29.i8);
          int64x2_t v24 = vaddw_high_s32(v24, *(int32x4_t *)v35.val[0].i8);
          int64x2_t v23 = vaddw_s32(v23, (int32x2_t)v35.val[0]);
          int64x2_t v22 = vaddw_high_s32(v22, *(int32x4_t *)v35.val[1].i8);
          int64x2_t v21 = vaddw_s32(v21, (int32x2_t)v35.val[1]);
          v12 -= 8;
        }
        while (v12);
        uint64_t v31 = vaddvq_s64(vaddq_s64(vaddq_s64(v21, v23), vaddq_s64(v22, v24)));
        uint64_t v32 = vaddvq_s64(vaddq_s64(vaddq_s64(v17, v19), vaddq_s64(v18, v20)));
        uint64_t v33 = vaddvq_s64(vaddq_s64(vaddq_s64(v11, v15), vaddq_s64(v13, v16)));
        uint64_t result = v4 - (v7 & 0xFFFFFFF8);
        uint64_t v34 = 3 * (v7 & 0xFFFFFFF8);
        if ((v7 & 0xFFFFFFF8) != v7)
        {
          do
          {
            v33 += a2[v34];
            v32 += a2[v34 + 1];
            v31 += a2[v34 + 2];
            v34 += 3;
            uint64_t result = (result - 1);
          }
          while (result);
        }
        a2 += v6;
        *a4 = v33 / v4;
        a4[1] = v32 / v4;
        a4[2] = v31 / v4;
        a4 += 3;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<3u,3u,false,63ull,56ull,55ull,48ull,47ull,40ull,0ull,0ull>(uint64_t result, unsigned __int8 *a2, int a3, unsigned char *a4)
{
  if (result <= 1) {
    unint64_t v7 = 1;
  }
  else {
    unint64_t v7 = result;
  }
  if (a3)
  {
    uint64_t v8 = &a2[a3];
    uint64_t v9 = 3 * (v7 - 1) + 3;
    if (result <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = result;
    }
    if (v10 < 8)
    {
      do
      {
        unint64_t v11 = *a2;
        unint64_t v12 = a2[1];
        unint64_t v13 = a2[2];
        if (result >= 2)
        {
          v11 += a2[3];
          v12 += a2[4];
          v13 += a2[5];
          if (v7 != 2)
          {
            v11 += a2[6];
            v12 += a2[7];
            v13 += a2[8];
            if (v7 != 3)
            {
              v11 += a2[9];
              v12 += a2[10];
              v13 += a2[11];
              if (v7 != 4)
              {
                v11 += a2[12];
                v12 += a2[13];
                v13 += a2[14];
                if (v7 != 5)
                {
                  v11 += a2[15];
                  v12 += a2[16];
                  v13 += a2[17];
                  if (v7 != 6)
                  {
                    v11 += a2[18];
                    v12 += a2[19];
                    v13 += a2[20];
                  }
                }
              }
            }
          }
        }
        a2 += v9;
        *a4 = v11 / v7;
        a4[1] = v12 / v7;
        a4[2] = v13 / v7;
        a4 += 3;
      }
      while (a2 < v8);
    }
    else
    {
      do
      {
        int64x2_t v14 = 0uLL;
        uint64_t v15 = v10 & 0xFFFFFFF8;
        int64x2_t v16 = 0uLL;
        int64x2_t v17 = (const char *)a2;
        int64x2_t v18 = 0uLL;
        int64x2_t v19 = 0uLL;
        int64x2_t v20 = 0uLL;
        int64x2_t v21 = 0uLL;
        int64x2_t v22 = 0uLL;
        int64x2_t v23 = 0uLL;
        int64x2_t v24 = 0uLL;
        int64x2_t v25 = 0uLL;
        int64x2_t v26 = 0uLL;
        int64x2_t v27 = 0uLL;
        do
        {
          *(int8x8x3_t *)v4.i8 = vld3_s8(v17);
          v17 += 24;
          uint32x4_t v28 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v29 = (uint32x4_t)vqtbl1q_s8(v4, (int8x16_t)xmmword_24F60F040);
          uint32x4_t v30 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_24F60F050);
          uint32x4_t v31 = (uint32x4_t)vqtbl1q_s8(v5, (int8x16_t)xmmword_24F60F040);
          uint32x4_t v32 = (uint32x4_t)vqtbl1q_s8(v6, (int8x16_t)xmmword_24F60F050);
          int8x16_t v4 = vqtbl1q_s8(v6, (int8x16_t)xmmword_24F60F040);
          int64x2_t v19 = (int64x2_t)vaddw_high_u32((uint64x2_t)v19, v28);
          int64x2_t v16 = (int64x2_t)vaddw_high_u32((uint64x2_t)v16, v29);
          int64x2_t v18 = (int64x2_t)vaddw_u32((uint64x2_t)v18, *(uint32x2_t *)v28.i8);
          int64x2_t v14 = (int64x2_t)vaddw_u32((uint64x2_t)v14, *(uint32x2_t *)v29.i8);
          int64x2_t v23 = (int64x2_t)vaddw_high_u32((uint64x2_t)v23, v30);
          int64x2_t v21 = (int64x2_t)vaddw_high_u32((uint64x2_t)v21, v31);
          int64x2_t v22 = (int64x2_t)vaddw_u32((uint64x2_t)v22, *(uint32x2_t *)v30.i8);
          int64x2_t v20 = (int64x2_t)vaddw_u32((uint64x2_t)v20, *(uint32x2_t *)v31.i8);
          int64x2_t v27 = (int64x2_t)vaddw_high_u32((uint64x2_t)v27, v32);
          int64x2_t v25 = (int64x2_t)vaddw_high_u32((uint64x2_t)v25, (uint32x4_t)v4);
          int64x2_t v26 = (int64x2_t)vaddw_u32((uint64x2_t)v26, *(uint32x2_t *)v32.i8);
          int64x2_t v24 = (int64x2_t)vaddw_u32((uint64x2_t)v24, *(uint32x2_t *)v4.i8);
          v15 -= 8;
        }
        while (v15);
        unint64_t v33 = vaddvq_s64(vaddq_s64(vaddq_s64(v24, v26), vaddq_s64(v25, v27)));
        unint64_t v34 = vaddvq_s64(vaddq_s64(vaddq_s64(v20, v22), vaddq_s64(v21, v23)));
        unint64_t v35 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v18), vaddq_s64(v16, v19)));
        uint64_t result = v7 - (v10 & 0xFFFFFFF8);
        uint64_t v36 = 3 * (v10 & 0xFFFFFFF8);
        if ((v10 & 0xFFFFFFF8) != v10)
        {
          do
          {
            v35 += a2[v36];
            v34 += a2[v36 + 1];
            v33 += a2[v36 + 2];
            v36 += 3;
            uint64_t result = (result - 1);
          }
          while (result);
        }
        a2 += v9;
        *a4 = v35 / v7;
        a4[1] = v34 / v7;
        a4[2] = v33 / v7;
        a4 += 3;
      }
      while (a2 < v8);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(uint64_t result, int *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = (unint64_t)a2 + a3;
    uint64_t v6 = 6 * (v4 - 1) + 6;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 >= 2)
    {
      unint64_t v11 = (unsigned __int8 *)a2 + 5;
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        int64x2_t v14 = 0uLL;
        uint64_t v15 = v11;
        uint64_t v16 = v7 & 0xFFFFFFFE;
        int64x2_t v17 = 0uLL;
        do
        {
          int64x2_t v17 = vsraq_n_s64(v17, (int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(*(unsigned int *)(v15 - 5)), (uint64x2_t)xmmword_24F60F080), 0x30uLL);
          int64x2_t v14 = vsraq_n_s64(v14, (int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(*(unsigned int *)(v15 + 1)), (uint64x2_t)xmmword_24F60F080), 0x30uLL);
          v12 += (uint64_t)(((unint64_t)*(v15 - 1) << 48) | ((unint64_t)*v15 << 56)) >> 48;
          v13 += (uint64_t)(((unint64_t)v15[5] << 48) | ((unint64_t)v15[6] << 56)) >> 48;
          v15 += 12;
          v16 -= 2;
        }
        while (v16);
        uint64_t v18 = v13 + v12;
        int64x2_t v19 = vaddq_s64(v14, v17);
        int v20 = v4 - (v7 & 0xFFFFFFFE);
        uint64_t v21 = 6 * (v7 & 0xFFFFFFFE);
        if ((v7 & 0xFFFFFFFE) != v7)
        {
          do
          {
            int64x2_t v19 = vsraq_n_s64(v19, (int64x2_t)vshlq_u64((uint64x2_t)vdupq_n_s64(*(unsigned int *)((char *)a2 + v21)), (uint64x2_t)xmmword_24F60F080), 0x30uLL);
            v18 += (uint64_t)(((unint64_t)*((unsigned __int8 *)a2 + v21 + 4) << 48) | ((unint64_t)*((unsigned __int8 *)a2 + v21 + 5) << 56)) >> 48;
            v21 += 6;
            --v20;
          }
          while (v20);
        }
        a2 = (int *)((char *)a2 + v6);
        uint64_t result = v19.i64[1] / v4;
        *a4 = v19.i64[0] / v4;
        a4[1] = v19.i64[1] / v4;
        a4[2] = v18 / v4;
        a4 += 3;
        v11 += v6;
      }
      while ((unint64_t)a2 < v5);
    }
    else
    {
      do
      {
        int v8 = *a2;
        uint64_t v9 = (__int16)*a2;
        uint64_t v10 = (uint64_t)(((unint64_t)*((unsigned __int8 *)a2 + 4) << 48) | ((unint64_t)*((unsigned __int8 *)a2 + 5) << 56)) >> 48;
        a2 = (int *)((char *)a2 + v6);
        *a4 = v9 / v4;
        a4[1] = ((uint64_t)v8 >> 16) / v4;
        a4[2] = v10 / v4;
        a4 += 3;
      }
      while ((unint64_t)a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<6u,6u,true,31ull,16ull,47ull,32ull,63ull,48ull,0ull,0ull>(unint64_t result, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = (unsigned int *)((char *)a2 + a3);
    uint64_t v6 = 6 * (v4 - 1) + 6;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 >= 2)
    {
      unint64_t v11 = (char *)a2 + 5;
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = v11;
        uint64_t v19 = v7 & 0xFFFFFFFE;
        do
        {
          unint64_t v20 = *(unsigned int *)(v18 - 5);
          unint64_t v21 = *(unsigned int *)(v18 + 1);
          v12 += (unsigned __int16)v20;
          v13 += (unsigned __int16)v21;
          v14 += v20 >> 16;
          v15 += v21 >> 16;
          v16 += *(unsigned __int16 *)(v18 - 1);
          v17 += *(unsigned __int16 *)(v18 + 5);
          v18 += 12;
          v19 -= 2;
        }
        while (v19);
        uint64_t result = v17 + v16;
        unint64_t v22 = v15 + v14;
        unint64_t v23 = v13 + v12;
        int v24 = v4 - (v7 & 0xFFFFFFFE);
        uint64_t v25 = 6 * (v7 & 0xFFFFFFFE);
        if ((v7 & 0xFFFFFFFE) != v7)
        {
          do
          {
            unint64_t v26 = *(unsigned int *)((char *)a2 + v25);
            v23 += (unsigned __int16)v26;
            v22 += v26 >> 16;
            result += *(unsigned __int16 *)((char *)a2 + v25 + 4);
            v25 += 6;
            --v24;
          }
          while (v24);
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v23 / v4;
        a4[1] = v22 / v4;
        a4[2] = result / v4;
        a4 += 3;
        v11 += v6;
      }
      while (a2 < v5);
    }
    else
    {
      do
      {
        unint64_t v8 = *((unsigned __int16 *)a2 + 2);
        unint64_t v9 = (unsigned __int16)*a2;
        unint64_t v10 = (unint64_t)*a2 >> 16;
        a2 = (unsigned int *)((char *)a2 + v6);
        *a4 = v9 / v4;
        a4[1] = v10 / v4;
        a4[2] = v8 / v4;
        a4 += 3;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<6u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)0>(uint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  if (a3)
  {
    unint64_t v4 = (unsigned __int16 *)((char *)a2 + a3);
    float v5 = (float)result;
    while (!result)
    {
      float v28 = 0.0;
      float v27 = 0.0;
      float v25 = 0.0;
LABEL_4:
      float v6 = v28 / v5;
      float v7 = v27 / v5;
      float v8 = v25 / v5;
      unsigned int v9 = LODWORD(v6) & 0x7F800000;
      int v10 = HIWORD(LODWORD(v6)) & 0x8000;
      unsigned int v11 = v10 | ((LODWORD(v6) & 0x7FFFFFu) >> 13);
      unsigned int v12 = (((LODWORD(v6) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v6) & 0x7FFFFFu) >> 13) | v10;
      if ((LODWORD(v6) & 0x7F800000u) >> 23 < 0x71) {
        unsigned int v12 = HIWORD(LODWORD(v6)) & 0x8000;
      }
      __int16 v13 = v10 | 0x7C00;
      if (v9 < 0x47000001) {
        __int16 v13 = v12;
      }
      if (!v9) {
        __int16 v13 = v11;
      }
      if (v9 == 2139095040) {
        __int16 v13 = v11 | 0x7C00;
      }
      *a4 = v13;
      unsigned int v14 = LODWORD(v7) & 0x7F800000;
      int v15 = HIWORD(LODWORD(v7)) & 0x8000;
      unsigned int v16 = v15 | ((LODWORD(v7) & 0x7FFFFFu) >> 13);
      unsigned int v17 = (((LODWORD(v7) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v7) & 0x7FFFFFu) >> 13) | v15;
      if ((LODWORD(v7) & 0x7F800000u) >> 23 < 0x71) {
        unsigned int v17 = HIWORD(LODWORD(v7)) & 0x8000;
      }
      __int16 v18 = v15 | 0x7C00;
      if (v14 < 0x47000001) {
        __int16 v18 = v17;
      }
      if (!v14) {
        __int16 v18 = v16;
      }
      if (v14 == 2139095040) {
        __int16 v18 = v16 | 0x7C00;
      }
      a4[1] = v18;
      unsigned int v19 = LODWORD(v8) & 0x7F800000;
      int v20 = HIWORD(LODWORD(v8)) & 0x8000;
      unsigned int v21 = v20 | ((LODWORD(v8) & 0x7FFFFFu) >> 13);
      unsigned int v22 = (((LODWORD(v8) & 0x7F800000u) >> 13) + 0x4000) | ((LODWORD(v8) & 0x7FFFFFu) >> 13) | v20;
      if ((LODWORD(v8) & 0x7F800000u) >> 23 < 0x71) {
        unsigned int v22 = HIWORD(LODWORD(v8)) & 0x8000;
      }
      __int16 v23 = v20 | 0x7C00;
      if (v19 < 0x47000001) {
        __int16 v23 = v22;
      }
      if (!v19) {
        __int16 v23 = v21;
      }
      if (v19 == 2139095040) {
        __int16 v23 = v21 | 0x7C00;
      }
      a4[2] = v23;
      a4 += 3;
      if (a2 >= v4) {
        return result;
      }
    }
    int v24 = 0;
    float v25 = 0.0;
    unint64_t v26 = a2;
    float v27 = 0.0;
    float v28 = 0.0;
    while (1)
    {
      unsigned int v31 = (__int16)*v26;
      int v32 = (v31 >> 10) & 0x1F;
      unsigned int v33 = v31 & 0x80000000;
      if (v32 == 31) {
        break;
      }
      int v34 = v31 & 0x3FF;
      if (v32)
      {
        char v35 = 0;
        int v36 = (v32 << 23) + 939524096;
        goto LABEL_42;
      }
      if (v34)
      {
        char v35 = -1;
        int v36 = 956301312;
        do
        {
          ++v35;
          v36 -= 0x800000;
        }
        while (((v34 << v35) & 0x400) == 0);
LABEL_42:
        int v37 = v36 | v33 | (v34 << (v35 + 13)) & 0x7FFFFF;
LABEL_43:
        float v38 = *(float *)&v37;
        unsigned int v39 = (__int16)v26[1];
        int v40 = (v39 >> 10) & 0x1F;
        unsigned int v41 = v39 & 0x80000000;
        if (v40 == 31) {
          goto LABEL_52;
        }
        goto LABEL_44;
      }
      float v38 = 0.0;
      unsigned int v39 = (__int16)v26[1];
      int v40 = (v39 >> 10) & 0x1F;
      unsigned int v41 = v39 & 0x80000000;
      if (v40 == 31)
      {
LABEL_52:
        int v45 = v41 | ((unsigned __int16)v39 << 13) | 0x7F800000;
LABEL_53:
        float v46 = *(float *)&v45;
        unsigned int v47 = (__int16)v26[2];
        int v48 = (v47 >> 10) & 0x1F;
        unsigned int v49 = v47 & 0x80000000;
        if (v48 == 31) {
          goto LABEL_31;
        }
        goto LABEL_54;
      }
LABEL_44:
      int v42 = v39 & 0x3FF;
      if (v40)
      {
        char v43 = 0;
        int v44 = (v40 << 23) + 939524096;
LABEL_50:
        int v45 = v44 | v41 | (v42 << (v43 + 13)) & 0x7FFFFF;
        goto LABEL_53;
      }
      if (v42)
      {
        char v43 = -1;
        int v44 = 956301312;
        do
        {
          ++v43;
          v44 -= 0x800000;
        }
        while (((v42 << v43) & 0x400) == 0);
        goto LABEL_50;
      }
      float v46 = 0.0;
      unsigned int v47 = (__int16)v26[2];
      int v48 = (v47 >> 10) & 0x1F;
      unsigned int v49 = v47 & 0x80000000;
      if (v48 == 31)
      {
LABEL_31:
        int v29 = v49 | ((unsigned __int16)v47 << 13) | 0x7F800000;
        goto LABEL_32;
      }
LABEL_54:
      int v50 = v47 & 0x3FF;
      if (v48)
      {
        char v51 = 0;
        int v52 = (v48 << 23) + 939524096;
      }
      else
      {
        if (!v50)
        {
          float v30 = 0.0;
          goto LABEL_33;
        }
        char v51 = -1;
        int v52 = 956301312;
        do
        {
          ++v51;
          v52 -= 0x800000;
        }
        while (((v50 << v51) & 0x400) == 0);
      }
      int v29 = v52 | v49 | (v50 << (v51 + 13)) & 0x7FFFFF;
LABEL_32:
      float v30 = *(float *)&v29;
LABEL_33:
      float v28 = v28 + v38;
      float v27 = v27 + v46;
      float v25 = v25 + v30;
      v26 += 3;
      if (++v24 == result)
      {
        a2 += 3 * (result - 1) + 3;
        goto LABEL_4;
      }
    }
    int v37 = v33 | (*v26 << 13) | 0x7F800000;
    goto LABEL_43;
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(uint64_t result, uint64_t *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    float v5 = (uint64_t *)((char *)a2 + a3);
    if (result <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = result;
    }
    do
    {
      if (v6 >= 2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        unsigned int v11 = (uint64_t *)((char *)a2 + 12 * (v6 & 0xFFFFFFFE));
        uint64_t v20 = v6 & 0xFFFFFFFE;
        unsigned int v21 = a2;
        do
        {
          v12 += (int)*v21;
          uint64_t v22 = *(uint64_t *)((char *)v21 + 12);
          v13 += (int)v22;
          v14 += *v21 >> 32;
          uint64_t v23 = *v21 & 1;
          v15 += v22 >> 32;
          v16 -= v23;
          v17 -= v22 & 1;
          v18 -= v23;
          v19 -= v22 & 1;
          v21 += 3;
          v20 -= 2;
        }
        while (v20);
        uint64_t v9 = v19 + v18;
        uint64_t v8 = v17 + v16;
        uint64_t v7 = v15 + v14;
        uint64_t result = v13 + v12;
        int v10 = v6 & 0xFFFFFFFE;
        if ((v6 & 0xFFFFFFFE) == v6) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t result = 0;
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        uint64_t v9 = 0;
        int v10 = 0;
        unsigned int v11 = a2;
      }
      int v24 = v6 - v10;
      do
      {
        uint64_t v25 = *v11;
        unsigned int v11 = (uint64_t *)((char *)v11 + 12);
        result += (int)v25;
        v7 += v25 >> 32;
        v8 -= v25 & 1;
        v9 -= v25 & 1;
        --v24;
      }
      while (v24);
LABEL_8:
      a2 = (uint64_t *)((char *)a2 + 12 * (v4 - 1) + 12);
      *(unsigned char *)a4 = ((v9 / v4) | (v8 / v4)) & 1 | (result / v4);
      *(unsigned char *)(a4 + 1) = (unsigned __int16)(result / v4) >> 8;
      *(unsigned char *)(a4 + 2) = (result / v4) >> 16;
      *(unsigned char *)(a4 + 3) = (result / v4) >> 24;
      *(_WORD *)(a4 + 4) = v7 / v4;
      *(unsigned char *)(a4 + 6) = (v7 / v4) >> 16;
      *(unsigned char *)(a4 + 7) = (v7 / v4) >> 24;
      a4 += 12;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, int *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = result;
  }
  if (a3)
  {
    float v5 = (int *)((char *)a2 + a3);
    uint64_t v6 = 12 * (v4 - 1) + 12;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    uint64_t v8 = 8;
    if ((v7 & 7) != 0) {
      uint64_t v8 = v7 & 7;
    }
    if (v7 < 9)
    {
      do
      {
        uint64_t v25 = *a2;
        if (result >= 2)
        {
          v25 += a2[3];
          if (v4 != 2)
          {
            v25 += a2[6];
            if (v4 != 3)
            {
              v25 += a2[9];
              if (v4 != 4)
              {
                v25 += a2[12];
                if (v4 != 5)
                {
                  v25 += a2[15];
                  if (v4 != 6)
                  {
                    v25 += a2[18];
                    if (v4 != 7) {
                      v25 += a2[21];
                    }
                  }
                }
              }
            }
          }
        }
        a2 = (int *)((char *)a2 + v6);
        uint64_t v24 = v25 / v4;
        *(_WORD *)a4 = v24;
        *(unsigned char *)(a4 + 2) = BYTE2(v24);
        *(unsigned char *)(a4 + 3) = BYTE3(v24);
        a4 += 12;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v9 = v7 - v8;
      do
      {
        int64x2_t v10 = 0uLL;
        uint64_t v11 = v9;
        uint64_t v12 = (const float *)a2;
        int64x2_t v13 = 0uLL;
        int64x2_t v14 = 0uLL;
        int64x2_t v15 = 0uLL;
        do
        {
          uint64_t v16 = v12 + 24;
          unsigned long long v18 = (unsigned __int128)vld3q_f32(v12);
          uint64_t v17 = v12 + 12;
          unsigned long long v19 = (unsigned __int128)vld3q_f32(v17);
          int64x2_t v13 = vaddw_high_s32(v13, (int32x4_t)v18);
          int64x2_t v10 = vaddw_s32(v10, *(int32x2_t *)&v18);
          int64x2_t v15 = vaddw_high_s32(v15, (int32x4_t)v19);
          int64x2_t v14 = vaddw_s32(v14, *(int32x2_t *)&v19);
          uint64_t v12 = v16;
          v11 -= 8;
        }
        while (v11);
        uint64_t v20 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
        int v21 = v8;
        uint64_t v22 = 3 * v9;
        do
        {
          v20 += a2[v22];
          v22 += 3;
          --v21;
        }
        while (v21);
        a2 = (int *)((char *)a2 + v6);
        uint64_t v23 = v20 / v4;
        *(_WORD *)a4 = v23;
        *(unsigned char *)(a4 + 2) = BYTE2(v23);
        *(unsigned char *)(a4 + 3) = BYTE3(v23);
        a4 += 12;
      }
      while (a2 < v5);
    }
  }
  return result;
}

unint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<8u,12u,true,31ull,0ull,63ull,32ull,0ull,0ull,0ull,0ull>(unint64_t result, char *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    float v5 = &a2[a3];
    if (result <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = result;
    }
    do
    {
      if (v6 >= 2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = 0;
        uint64_t v19 = 0;
        uint64_t v11 = (unint64_t *)&a2[12 * (v6 & 0xFFFFFFFE)];
        uint64_t v20 = v6 & 0xFFFFFFFE;
        int v21 = a2;
        do
        {
          v12 += *v21;
          unint64_t v22 = *(void *)((char *)v21 + 12);
          v13 += v22;
          v14 += HIDWORD(*v21);
          uint64_t v23 = *v21 & 1;
          v15 += HIDWORD(v22);
          v16 += v23;
          v17 += v22 & 1;
          v18 += v23;
          v19 += v22 & 1;
          v21 += 3;
          v20 -= 2;
        }
        while (v20);
        unint64_t v10 = v19 + v18;
        unint64_t v8 = v17 + v16;
        unint64_t v7 = v15 + v14;
        uint64_t result = v13 + v12;
        int v9 = v6 & 0xFFFFFFFE;
        if ((v6 & 0xFFFFFFFE) == v6) {
          goto LABEL_8;
        }
      }
      else
      {
        uint64_t result = 0;
        unint64_t v7 = 0;
        unint64_t v8 = 0;
        int v9 = 0;
        unint64_t v10 = 0;
        uint64_t v11 = (unint64_t *)a2;
      }
      int v24 = v6 - v9;
      do
      {
        unint64_t v25 = *v11;
        uint64_t v11 = (unint64_t *)((char *)v11 + 12);
        result += v25;
        v7 += HIDWORD(v25);
        v8 += v25 & 1;
        v10 += v25 & 1;
        --v24;
      }
      while (v24);
LABEL_8:
      a2 += 12 * (v4 - 1) + 12;
      *(unsigned char *)a4 = ((v10 / v4) | (v8 / v4)) & 1 | (result / v4);
      *(unsigned char *)(a4 + 1) = (unsigned __int16)(result / v4) >> 8;
      *(unsigned char *)(a4 + 2) = (result / v4) >> 16;
      *(unsigned char *)(a4 + 3) = (result / v4) >> 24;
      *(_WORD *)(a4 + 4) = v7 / v4;
      *(unsigned char *)(a4 + 6) = (v7 / v4) >> 16;
      *(unsigned char *)(a4 + 7) = (v7 / v4) >> 24;
      a4 += 12;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<unsigned long long>::resolve<4u,12u,true,63ull,32ull,0ull,0ull,0ull,0ull,0ull,0ull>(uint64_t result, unsigned int *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    float v5 = (unsigned int *)((char *)a2 + a3);
    uint64_t v6 = 12 * (v4 - 1) + 12;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    uint64_t v8 = 8;
    if ((v7 & 7) != 0) {
      uint64_t v8 = v7 & 7;
    }
    if (v7 < 9)
    {
      do
      {
        unint64_t v25 = *a2;
        if (result >= 2)
        {
          v25 += a2[3];
          if (v4 != 2)
          {
            v25 += a2[6];
            if (v4 != 3)
            {
              v25 += a2[9];
              if (v4 != 4)
              {
                v25 += a2[12];
                if (v4 != 5)
                {
                  v25 += a2[15];
                  if (v4 != 6)
                  {
                    v25 += a2[18];
                    if (v4 != 7) {
                      v25 += a2[21];
                    }
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        unint64_t v24 = v25 / v4;
        *(_WORD *)a4 = v24;
        *(unsigned char *)(a4 + 2) = BYTE2(v24);
        *(unsigned char *)(a4 + 3) = BYTE3(v24);
        a4 += 12;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v9 = v7 - v8;
      do
      {
        int64x2_t v10 = 0uLL;
        uint64_t v11 = v9;
        uint64_t v12 = (const float *)a2;
        int64x2_t v13 = 0uLL;
        int64x2_t v14 = 0uLL;
        int64x2_t v15 = 0uLL;
        do
        {
          uint64_t v16 = v12 + 24;
          unsigned long long v18 = (unsigned __int128)vld3q_f32(v12);
          uint64_t v17 = v12 + 12;
          unsigned long long v19 = (unsigned __int128)vld3q_f32(v17);
          int64x2_t v13 = (int64x2_t)vaddw_high_u32((uint64x2_t)v13, (uint32x4_t)v18);
          int64x2_t v10 = (int64x2_t)vaddw_u32((uint64x2_t)v10, *(uint32x2_t *)&v18);
          int64x2_t v15 = (int64x2_t)vaddw_high_u32((uint64x2_t)v15, (uint32x4_t)v19);
          int64x2_t v14 = (int64x2_t)vaddw_u32((uint64x2_t)v14, *(uint32x2_t *)&v19);
          uint64_t v12 = v16;
          v11 -= 8;
        }
        while (v11);
        unint64_t v20 = vaddvq_s64(vaddq_s64(vaddq_s64(v14, v10), vaddq_s64(v15, v13)));
        int v21 = v8;
        uint64_t v22 = 3 * v9;
        do
        {
          v20 += a2[v22];
          v22 += 3;
          --v21;
        }
        while (v21);
        a2 = (unsigned int *)((char *)a2 + v6);
        unint64_t v23 = v20 / v4;
        *(_WORD *)a4 = v23;
        *(unsigned char *)(a4 + 2) = BYTE2(v23);
        *(unsigned char *)(a4 + 3) = BYTE3(v23);
        a4 += 12;
      }
      while (a2 < v5);
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<12u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)0>(uint64_t result, float32x2_t *a2, unsigned int a3, float *a4, double a5)
{
  if (a3)
  {
    *(float *)&a5 = (float)result;
    if (!result)
    {
      float v11 = 0.0 / *(float *)&a5;
      while (1)
      {
        *a4 = v11;
        a4[1] = v11;
        a4[2] = v11;
        a4 += 3;
      }
    }
    float v5 = (float32x2_t *)((char *)a2 + a3);
    float32x2_t v6 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      float32x2_t v7 = 0;
      float v8 = 0.0;
      int v9 = result;
      int64x2_t v10 = a2;
      do
      {
        float32x2_t v7 = vadd_f32(v7, *v10);
        float v8 = v8 + v10[1].f32[0];
        int64x2_t v10 = (float32x2_t *)((char *)v10 + 12);
        --v9;
      }
      while (v9);
      a2 = (float32x2_t *)((char *)a2 + 12 * (result - 1) + 12);
      *(float32x2_t *)a4 = vdiv_f32(v7, v6);
      a4[2] = v8 / *(float *)&a5;
      a4 += 3;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<8u,(unsigned char)16,(unsigned char)16,(unsigned char)16,(unsigned char)16>(uint64_t result, __int16 *a2, unsigned int a3, _WORD *a4)
{
  if (a3)
  {
    unint64_t v4 = (__int16 *)((char *)a2 + a3);
    float v5 = (float)result;
    while (1)
    {
      if (result)
      {
        int v7 = 0;
        float v8 = 0.0;
        int v9 = a2;
        float v10 = 0.0;
        float v11 = 0.0;
        float v12 = 0.0;
        while (1)
        {
          unsigned int v15 = *v9;
          int v16 = (v15 >> 10) & 0x1F;
          unsigned int v17 = v15 & 0x80000000;
          if (v16 == 31)
          {
            LODWORD(v21) = v17 | ((unsigned __int16)*v9 << 13) | 0x7F800000;
            unsigned int v22 = v9[1];
            int v23 = (v22 >> 10) & 0x1F;
            unsigned int v24 = v22 & 0x80000000;
            if (v23 == 31) {
              goto LABEL_17;
            }
            goto LABEL_22;
          }
          int v18 = v15 & 0x3FF;
          if (v16) {
            break;
          }
          if (v18)
          {
            char v19 = -1;
            int v20 = 956301312;
            do
            {
              ++v19;
              v20 -= 0x800000;
            }
            while (((v18 << v19) & 0x400) == 0);
LABEL_21:
            LODWORD(v21) = v20 | v17 | (v18 << (v19 + 13)) & 0x7FFFFF;
            unsigned int v22 = v9[1];
            int v23 = (v22 >> 10) & 0x1F;
            unsigned int v24 = v22 & 0x80000000;
            if (v23 == 31) {
              goto LABEL_17;
            }
            goto LABEL_22;
          }
          float v21 = 0.0;
          unsigned int v22 = v9[1];
          int v23 = (v22 >> 10) & 0x1F;
          unsigned int v24 = v22 & 0x80000000;
          if (v23 == 31)
          {
LABEL_17:
            LODWORD(v25) = v24 | ((unsigned __int16)v22 << 13) | 0x7F800000;
            unsigned int v26 = v9[2];
            int v27 = (v26 >> 10) & 0x1F;
            unsigned int v28 = v26 & 0x80000000;
            if (v27 == 31) {
              goto LABEL_18;
            }
            goto LABEL_29;
          }
LABEL_22:
          int v33 = v22 & 0x3FF;
          if (v23)
          {
            char v34 = 0;
            int v35 = (v23 << 23) + 939524096;
            goto LABEL_28;
          }
          if (v33)
          {
            char v34 = -1;
            int v35 = 956301312;
            do
            {
              ++v34;
              v35 -= 0x800000;
            }
            while (((v33 << v34) & 0x400) == 0);
LABEL_28:
            LODWORD(v25) = v35 | v24 | (v33 << (v34 + 13)) & 0x7FFFFF;
            unsigned int v26 = v9[2];
            int v27 = (v26 >> 10) & 0x1F;
            unsigned int v28 = v26 & 0x80000000;
            if (v27 == 31) {
              goto LABEL_18;
            }
            goto LABEL_29;
          }
          float v25 = 0.0;
          unsigned int v26 = v9[2];
          int v27 = (v26 >> 10) & 0x1F;
          unsigned int v28 = v26 & 0x80000000;
          if (v27 == 31)
          {
LABEL_18:
            LODWORD(v29) = v28 | ((unsigned __int16)v26 << 13) | 0x7F800000;
            unsigned int v30 = v9[3];
            int v31 = (v30 >> 10) & 0x1F;
            unsigned int v32 = v30 & 0x80000000;
            if (v31 == 31) {
              goto LABEL_7;
            }
            goto LABEL_36;
          }
LABEL_29:
          int v36 = v26 & 0x3FF;
          if (v27)
          {
            char v37 = 0;
            int v38 = (v27 << 23) + 939524096;
            goto LABEL_35;
          }
          if (v36)
          {
            char v37 = -1;
            int v38 = 956301312;
            do
            {
              ++v37;
              v38 -= 0x800000;
            }
            while (((v36 << v37) & 0x400) == 0);
LABEL_35:
            LODWORD(v29) = v38 | v28 | (v36 << (v37 + 13)) & 0x7FFFFF;
            unsigned int v30 = v9[3];
            int v31 = (v30 >> 10) & 0x1F;
            unsigned int v32 = v30 & 0x80000000;
            if (v31 == 31) {
              goto LABEL_7;
            }
            goto LABEL_36;
          }
          float v29 = 0.0;
          unsigned int v30 = v9[3];
          int v31 = (v30 >> 10) & 0x1F;
          unsigned int v32 = v30 & 0x80000000;
          if (v31 == 31)
          {
LABEL_7:
            int v13 = v32 | ((unsigned __int16)v30 << 13) | 0x7F800000;
            goto LABEL_8;
          }
LABEL_36:
          int v39 = v30 & 0x3FF;
          if (v31)
          {
            char v40 = 0;
            int v41 = (v31 << 23) + 939524096;
          }
          else
          {
            if (!v39)
            {
              float v14 = 0.0;
              goto LABEL_9;
            }
            char v40 = -1;
            int v41 = 956301312;
            do
            {
              ++v40;
              v41 -= 0x800000;
            }
            while (((v39 << v40) & 0x400) == 0);
          }
          int v13 = v41 | v32 | (v39 << (v40 + 13)) & 0x7FFFFF;
LABEL_8:
          float v14 = *(float *)&v13;
LABEL_9:
          float v12 = v12 + v21;
          float v11 = v11 + v25;
          float v10 = v10 + v29;
          float v8 = v8 + v14;
          v9 += 4;
          if (++v7 == result)
          {
            a2 += 4 * (result - 1) + 4;
            goto LABEL_52;
          }
        }
        char v19 = 0;
        int v20 = (v16 << 23) + 939524096;
        goto LABEL_21;
      }
      float v12 = 0.0;
      float v11 = 0.0;
      float v10 = 0.0;
      float v8 = 0.0;
LABEL_52:
      float v42 = v12 / v5;
      unsigned int v43 = LODWORD(v42) & 0x7F800000;
      unsigned int v44 = LODWORD(v42) & 0x7FFFFF;
      int v45 = HIWORD(LODWORD(v42)) & 0x8000;
      if ((LODWORD(v42) & 0x7F800000) == 0x7F800000)
      {
        v45 |= (v44 >> 13) | 0x7C00;
      }
      else if (v43)
      {
        if (v43 < 0x47000001)
        {
          if (v43 >> 23 >= 0x71) {
            v45 |= ((v43 >> 13) + 0x4000) | (v44 >> 13);
          }
        }
        else
        {
          LOWORD(v45) = v45 | 0x7C00;
        }
      }
      else
      {
        v45 |= v44 >> 13;
      }
      float v46 = v11 / v5;
      *a4 = v45;
      unsigned int v47 = LODWORD(v46) & 0x7F800000;
      unsigned int v48 = LODWORD(v46) & 0x7FFFFF;
      int v49 = HIWORD(LODWORD(v46)) & 0x8000;
      if ((LODWORD(v46) & 0x7F800000) == 0x7F800000)
      {
        v49 |= (v48 >> 13) | 0x7C00;
      }
      else if (v47)
      {
        if (v47 < 0x47000001)
        {
          if (v47 >> 23 >= 0x71) {
            v49 |= ((v47 >> 13) + 0x4000) | (v48 >> 13);
          }
        }
        else
        {
          LOWORD(v49) = v49 | 0x7C00;
        }
      }
      else
      {
        v49 |= v48 >> 13;
      }
      float v50 = v10 / v5;
      a4[1] = v49;
      unsigned int v51 = LODWORD(v50) & 0x7F800000;
      unsigned int v52 = LODWORD(v50) & 0x7FFFFF;
      int v53 = HIWORD(LODWORD(v50)) & 0x8000;
      if ((LODWORD(v50) & 0x7F800000) == 0x7F800000)
      {
        v53 |= (v52 >> 13) | 0x7C00;
      }
      else if (v51)
      {
        if (v51 < 0x47000001)
        {
          if (v51 >> 23 >= 0x71) {
            v53 |= ((v51 >> 13) + 0x4000) | (v52 >> 13);
          }
        }
        else
        {
          LOWORD(v53) = v53 | 0x7C00;
        }
      }
      else
      {
        v53 |= v52 >> 13;
      }
      float v54 = v8 / v5;
      a4[2] = v53;
      unsigned int v55 = LODWORD(v54) & 0x7F800000;
      unsigned int v56 = LODWORD(v54) & 0x7FFFFF;
      int v6 = HIWORD(LODWORD(v54)) & 0x8000;
      if ((LODWORD(v54) & 0x7F800000) == 0x7F800000) {
        break;
      }
      if (v55)
      {
        if (v55 < 0x47000001)
        {
          if (v55 >> 23 >= 0x71) {
            v6 |= ((v55 >> 13) + 0x4000) | (v56 >> 13);
          }
          goto LABEL_4;
        }
        goto LABEL_82;
      }
      v6 |= v56 >> 13;
LABEL_4:
      a4[3] = v6;
      a4 += 4;
      if (a2 >= v4) {
        return result;
      }
    }
    v6 |= v56 >> 13;
LABEL_82:
    LOWORD(v6) = v6 | 0x7C00;
    goto LABEL_4;
  }
  return result;
}

uint64_t GPUTools::GL::MSAABufferResolver<float>::resolve<16u,(unsigned char)32,(unsigned char)32,(unsigned char)32,(unsigned char)32>(uint64_t result, unint64_t a2, unsigned int a3, int32x4_t *a4, double a5)
{
  if (a3)
  {
    *(float *)&a5 = (float)result;
    if (!result)
    {
      *(float *)&a5 = 0.0 / *(float *)&a5;
      for (int32x4_t i = vdupq_lane_s32(*(int32x2_t *)&a5, 0); ; *a4++ = i)
        ;
    }
    unint64_t v5 = a2 + a3;
    float32x4_t v6 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a5, 0);
    do
    {
      uint64_t v7 = 0;
      float32x4_t v8 = 0uLL;
      do
        float32x4_t v8 = vaddq_f32(v8, *(float32x4_t *)(a2 + 16 * v7++));
      while (result != v7);
      a2 += 16 * (result - 1) + 16;
      *(float32x4_t *)a4++ = vdivq_f32(v8, v6);
    }
    while (a2 < v5);
  }
  return result;
}

unint64_t GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<2u,2u,true,63ull,48ull,0ull,0ull>(unint64_t result, unsigned __int16 *a2, unsigned int a3, _WORD *a4)
{
  if (result <= 1) {
    int v4 = 1;
  }
  else {
    int v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = (unsigned __int16 *)((char *)a2 + a3);
    uint64_t v6 = 2 * (v4 - 1) + 2;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 >= 8)
    {
      while (1)
      {
        if (v7 >= 0x10)
        {
          v32.i64[0] = -1;
          v32.i64[1] = -1;
          uint64_t v33 = v7 & 0xFFFFFFF0;
          v34.i64[0] = -1;
          v34.i64[1] = -1;
          int v35 = (const char *)a2;
          v36.i64[0] = -1;
          v36.i64[1] = -1;
          v37.i64[0] = -1;
          v37.i64[1] = -1;
          v38.i64[0] = -1;
          v38.i64[1] = -1;
          v39.i64[0] = -1;
          v39.i64[1] = -1;
          v40.i64[0] = -1;
          v40.i64[1] = -1;
          v41.i64[0] = -1;
          v41.i64[1] = -1;
          do
          {
            int8x16x2_t v77 = vld2q_s8(v35);
            v35 += 32;
            uint16x8_t v42 = vmovl_high_u8((uint8x16_t)v77.val[0]);
            uint32x4_t v43 = vmovl_high_u16(v42);
            v44.i64[0] = v43.u32[2];
            v44.i64[1] = v43.u32[3];
            int8x16_t v45 = v44;
            v44.i64[0] = v43.u32[0];
            v44.i64[1] = v43.u32[1];
            int8x16_t v46 = v44;
            uint32x4_t v47 = vmovl_u16(*(uint16x4_t *)v42.i8);
            v44.i64[0] = v47.u32[2];
            v44.i64[1] = v47.u32[3];
            int8x16_t v48 = v44;
            uint16x8_t v49 = vmovl_u8(*(uint8x8_t *)v77.val[0].i8);
            uint32x4_t v50 = vmovl_high_u16(v49);
            v44.i64[0] = v50.u32[2];
            v44.i64[1] = v50.u32[3];
            int8x16_t v51 = v44;
            v44.i64[0] = v47.u32[0];
            v44.i64[1] = v47.u32[1];
            int8x16_t v52 = v44;
            v44.i64[0] = v50.u32[0];
            v44.i64[1] = v50.u32[1];
            int8x16_t v53 = v44;
            uint32x4_t v54 = vmovl_u16(*(uint16x4_t *)v49.i8);
            v44.i64[0] = v54.u32[2];
            v44.i64[1] = v54.u32[3];
            int8x16_t v55 = v44;
            v44.i64[0] = v54.u32[0];
            v44.i64[1] = v54.u32[1];
            uint16x8_t v56 = vmovl_u8(*(uint8x8_t *)v77.val[1].i8);
            uint32x4_t v57 = vmovl_u16(*(uint16x4_t *)v56.i8);
            uint32x4_t v58 = vmovl_high_u16(v56);
            v77.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v77.val[1]);
            v77.val[1] = (int8x16_t)vmovl_u16(*(uint16x4_t *)v77.val[0].i8);
            v77.val[0] = (int8x16_t)vmovl_high_u16((uint16x8_t)v77.val[0]);
            int8x16_t v59 = (int8x16_t)vshll_high_n_u32((uint32x4_t)v77.val[0], 8uLL);
            int8x16_t v60 = (int8x16_t)vshll_high_n_u32((uint32x4_t)v77.val[1], 8uLL);
            int8x16_t v61 = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v57.i8, 8uLL), v44);
            int8x16_t v62 = vorrq_s8((int8x16_t)vshll_high_n_u32(v57, 8uLL), v55);
            int8x16_t v63 = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v58.i8, 8uLL), v53);
            v77.val[1] = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v77.val[1].i8, 8uLL), v52);
            int8x16_t v64 = vorrq_s8((int8x16_t)vshll_high_n_u32(v58, 8uLL), v51);
            int8x16_t v65 = vorrq_s8(v60, v48);
            v77.val[0] = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v77.val[0].i8, 8uLL), v46);
            int8x16_t v66 = vorrq_s8(v59, v45);
            int8x16_t v41 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v66, (uint64x2_t)v41), v41, v66);
            int8x16_t v40 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v77.val[0], (uint64x2_t)v40), v40, v77.val[0]);
            int8x16_t v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v65, (uint64x2_t)v39), v39, v65);
            int8x16_t v37 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v64, (uint64x2_t)v37), v37, v64);
            int8x16_t v38 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v77.val[1], (uint64x2_t)v38), v38, v77.val[1]);
            int8x16_t v36 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v63, (uint64x2_t)v36), v36, v63);
            int8x16_t v34 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v62, (uint64x2_t)v34), v34, v62);
            int8x16_t v32 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v61, (uint64x2_t)v32), v32, v61);
            v33 -= 16;
          }
          while (v33);
          int8x16_t v67 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v32), v32, v38);
          int8x16_t v68 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v36), v36, v40);
          int8x16_t v69 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v68, (uint64x2_t)v67), v67, v68);
          int8x16_t v70 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v39, (uint64x2_t)v34), v34, v39);
          int8x16_t v71 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v41, (uint64x2_t)v37), v37, v41);
          int8x16_t v72 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v71, (uint64x2_t)v70), v70, v71);
          int8x16_t v73 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v72, (uint64x2_t)v69), v69, v72);
          v71.i64[0] = vextq_s8(v73, v73, 8uLL).u64[0];
          unint64_t v10 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_u64(v71.u64[0], v73.u64[0]), *(int8x8_t *)v73.i8, *(int8x8_t *)v71.i8);
          if ((v7 & 0xFFFFFFF0) == v7) {
            goto LABEL_30;
          }
          uint64_t v9 = v7 & 0xFFFFFFF0;
          uint64_t result = v9;
          if ((v7 & 8) == 0) {
            goto LABEL_41;
          }
        }
        else
        {
          uint64_t v9 = 0;
          unint64_t v10 = -1;
        }
        uint64_t v11 = v9;
        int8x16_t v12 = (int8x16_t)vdupq_n_s64(v10);
        uint64_t v13 = v9 - (v7 & 0xFFFFFFF8);
        int8x16_t v14 = v12;
        int8x16_t v15 = v12;
        int8x16_t v16 = v12;
        do
        {
          unsigned int v17 = (const char *)&a2[v11];
          int8x16_t v76 = (int8x16_t)vld2_s8(v17);
          uint16x8_t v18 = vmovl_u8(*(uint8x8_t *)v76.i8);
          uint32x4_t v19 = vmovl_high_u16(v18);
          v20.i64[0] = v19.u32[2];
          v20.i64[1] = v19.u32[3];
          int8x16_t v21 = v20;
          v20.i64[0] = v19.u32[0];
          v20.i64[1] = v19.u32[1];
          int8x16_t v22 = v20;
          uint32x4_t v23 = vmovl_u16(*(uint16x4_t *)v18.i8);
          v20.i64[0] = v23.u32[2];
          v20.i64[1] = v23.u32[3];
          int8x16_t v24 = v20;
          v20.i64[0] = v23.u32[0];
          v20.i64[1] = v23.u32[1];
          int8x16_t v76 = (int8x16_t)vmovl_u8((uint8x8_t)v76.u64[1]);
          *(uint32x4_t *)((char *)&v76 + 8) = vmovl_u16(*(uint16x4_t *)v76.i8);
          int8x16_t v76 = (int8x16_t)vmovl_high_u16((uint16x8_t)v76);
          int8x16_t v25 = (int8x16_t)vshll_high_n_u32((uint32x4_t)v76, 8uLL);
          int8x16_t v26 = (int8x16_t)vshll_high_n_u32(*(uint32x4_t *)((char *)&v76 + 8), 8uLL);
          *(int8x16_t *)((char *)&v76 + 8) = vorrq_s8((int8x16_t)vshll_n_u32((uint32x2_t)v76.u64[1], 8uLL), v20);
          int8x16_t v27 = vorrq_s8(v26, v24);
          int8x16_t v76 = vorrq_s8((int8x16_t)vshll_n_u32(*(uint32x2_t *)v76.i8, 8uLL), v22);
          int8x16_t v28 = vorrq_s8(v25, v21);
          int8x16_t v16 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v28, (uint64x2_t)v16), v16, v28);
          int8x16_t v15 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v76, (uint64x2_t)v15), v15, v76);
          int8x16_t v14 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v27, (uint64x2_t)v14), v14, v27);
          int8x16_t v12 = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)((char *)&v76 + 8), (uint64x2_t)v12), v12, *(int8x16_t *)((char *)&v76 + 8));
          v11 += 8;
          v13 += 8;
        }
        while (v13);
        int8x16_t v29 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v12), v12, v15);
        int8x16_t v30 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v16, (uint64x2_t)v14), v14, v16);
        int8x16_t v31 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v30, (uint64x2_t)v29), v29, v30);
        v30.i64[0] = vextq_s8(v31, v31, 8uLL).u64[0];
        unint64_t v10 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_u64(v30.u64[0], v31.u64[0]), *(int8x8_t *)v31.i8, *(int8x8_t *)v30.i8);
        uint64_t result = v7 & 0xFFFFFFF8;
        if (result != v7)
        {
LABEL_41:
          uint64_t v74 = result;
          int v75 = v4 - result;
          do
          {
            uint64_t result = a2[v74];
            if (v10 >= result) {
              unint64_t v10 = a2[v74];
            }
            ++v74;
            --v75;
          }
          while (v75);
        }
LABEL_30:
        a2 = (unsigned __int16 *)((char *)a2 + v6);
        *a4++ = v10;
        if (a2 >= v5) {
          return result;
        }
      }
    }
    do
    {
      unint64_t v8 = *a2;
      if (result >= 2)
      {
        if (v8 >= a2[1]) {
          unint64_t v8 = a2[1];
        }
        if (v4 != 2)
        {
          if (v8 >= a2[2]) {
            unint64_t v8 = a2[2];
          }
          if (v4 != 3)
          {
            if (v8 >= a2[3]) {
              unint64_t v8 = a2[3];
            }
            if (v4 != 4)
            {
              if (v8 >= a2[4]) {
                unint64_t v8 = a2[4];
              }
              if (v4 != 5)
              {
                if (v8 >= a2[5]) {
                  unint64_t v8 = a2[5];
                }
                if (v4 != 6 && v8 >= a2[6]) {
                  LOWORD(v8) = a2[6];
                }
              }
            }
          }
        }
      }
      a2 = (unsigned __int16 *)((char *)a2 + v6);
      *a4++ = v8;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<float>::resolve<4u,4u,true,63ull,32ull,0ull,0ull>(uint64_t result, unint64_t a2, unsigned int a3, float *a4)
{
  if (result <= 1) {
    int v4 = 1;
  }
  else {
    int v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = a2 + a3;
    uint64_t v6 = 4 * (v4 - 1) + 4;
    int v7 = result;
    if (result <= 1uLL) {
      int v7 = 1;
    }
    do
    {
      uint64_t v8 = 0;
      float v9 = 3.4028e38;
      do
      {
        if (v9 >= *(float *)(a2 + 4 * v8)) {
          float v9 = *(float *)(a2 + 4 * v8);
        }
        ++v8;
      }
      while (v7 != v8);
      a2 += v6;
      *a4++ = v9;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,0ull,0ull>(uint64_t result, uint32x4_t *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    int v4 = 1;
  }
  else {
    int v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = (uint32x4_t *)((char *)a2 + a3);
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        unsigned __int32 v25 = (unsigned __int32)a2->i32[0] >> 8;
        if (result >= 2)
        {
          if (v25 >= (unsigned __int32)a2->i32[1] >> 8) {
            unsigned __int32 v25 = (unsigned __int32)a2->i32[1] >> 8;
          }
          if (v4 != 2)
          {
            if (v25 >= (unsigned __int32)a2->i32[2] >> 8) {
              unsigned __int32 v25 = (unsigned __int32)a2->i32[2] >> 8;
            }
            if (v4 != 3)
            {
              if (v25 >= (unsigned __int32)a2->i32[3] >> 8) {
                unsigned __int32 v25 = (unsigned __int32)a2->i32[3] >> 8;
              }
              if (v4 != 4)
              {
                if (v25 >= (unsigned __int32)a2[1].i32[0] >> 8) {
                  unsigned __int32 v25 = (unsigned __int32)a2[1].i32[0] >> 8;
                }
                if (v4 != 5)
                {
                  if (v25 >= (unsigned __int32)a2[1].i32[1] >> 8) {
                    unsigned __int32 v25 = (unsigned __int32)a2[1].i32[1] >> 8;
                  }
                  if (v4 != 6 && v25 >= (unsigned __int32)a2[1].i32[2] >> 8) {
                    unsigned __int32 v25 = (unsigned __int32)a2[1].i32[2] >> 8;
                  }
                }
              }
            }
          }
        }
        a2 = (uint32x4_t *)((char *)a2 + v6);
        *(unsigned char *)a4 = 0;
        *(_WORD *)(a4 + 1) = v25;
        *(unsigned char *)(a4 + 3) = BYTE2(v25);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        float v9 = a2 + 1;
        do
        {
          v10.i64[0] = -1;
          v10.i64[1] = -1;
          uint64_t v11 = v9;
          uint64_t v12 = v8;
          v13.i64[0] = -1;
          v13.i64[1] = -1;
          v14.i64[0] = -1;
          v14.i64[1] = -1;
          v15.i64[0] = -1;
          v15.i64[1] = -1;
          do
          {
            uint32x4_t v16 = vshrq_n_u32(v11[-1], 8uLL);
            uint32x4_t v17 = vshrq_n_u32(*v11, 8uLL);
            v18.i64[0] = v16.u32[0];
            v18.i64[1] = v16.u32[1];
            int8x16_t v19 = v18;
            v18.i64[0] = v16.u32[2];
            v18.i64[1] = v16.u32[3];
            int8x16_t v20 = v18;
            v18.i64[0] = v17.u32[0];
            v18.i64[1] = v17.u32[1];
            int8x16_t v21 = v18;
            v18.i64[0] = v17.u32[2];
            v18.i64[1] = v17.u32[3];
            int8x16_t v13 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v20, (uint64x2_t)v13), v13, v20);
            int8x16_t v10 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v19, (uint64x2_t)v10), v10, v19);
            int8x16_t v15 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v18, (uint64x2_t)v15), v15, v18);
            int8x16_t v14 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v21, (uint64x2_t)v14), v14, v21);
            v11 += 2;
            v12 -= 8;
          }
          while (v12);
          int8x16_t v22 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v14, (uint64x2_t)v10), v10, v14);
          int8x16_t v23 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v15, (uint64x2_t)v13), v13, v15);
          int8x16_t v24 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v23, (uint64x2_t)v22), v22, v23);
          v23.i64[0] = vextq_s8(v24, v24, 8uLL).u64[0];
          *(int8x8_t *)v24.i8 = vbsl_s8((int8x8_t)vcgtd_u64(v23.u64[0], v24.u64[0]), *(int8x8_t *)v24.i8, *(int8x8_t *)v23.i8);
          a2 = (uint32x4_t *)((char *)a2 + v6);
          *(unsigned char *)a4 = 0;
          *(_WORD *)(a4 + 1) = v24.i16[0];
          *(unsigned char *)(a4 + 3) = v24.i8[2];
          a4 += 4;
          float v9 = (uint32x4_t *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        int8x16_t v26 = a2 + 1;
        do
        {
          v27.i64[0] = -1;
          v27.i64[1] = -1;
          uint64_t v28 = v7 & 0xFFFFFFF8;
          int8x16_t v29 = v26;
          v30.i64[0] = -1;
          v30.i64[1] = -1;
          v31.i64[0] = -1;
          v31.i64[1] = -1;
          v32.i64[0] = -1;
          v32.i64[1] = -1;
          do
          {
            uint32x4_t v33 = vshrq_n_u32(v29[-1], 8uLL);
            uint32x4_t v34 = vshrq_n_u32(*v29, 8uLL);
            v35.i64[0] = v33.u32[0];
            v35.i64[1] = v33.u32[1];
            int8x16_t v36 = v35;
            v35.i64[0] = v33.u32[2];
            v35.i64[1] = v33.u32[3];
            int8x16_t v37 = v35;
            v35.i64[0] = v34.u32[0];
            v35.i64[1] = v34.u32[1];
            int8x16_t v38 = v35;
            v35.i64[0] = v34.u32[2];
            v35.i64[1] = v34.u32[3];
            int8x16_t v30 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v37, (uint64x2_t)v30), v30, v37);
            int8x16_t v27 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v36, (uint64x2_t)v27), v27, v36);
            int8x16_t v32 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v35, (uint64x2_t)v32), v32, v35);
            int8x16_t v31 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v38, (uint64x2_t)v31), v31, v38);
            v29 += 2;
            v28 -= 8;
          }
          while (v28);
          int8x16_t v39 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v31, (uint64x2_t)v27), v27, v31);
          int8x16_t v40 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v32, (uint64x2_t)v30), v30, v32);
          int8x16_t v41 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v40, (uint64x2_t)v39), v39, v40);
          v40.i64[0] = vextq_s8(v41, v41, 8uLL).u64[0];
          unint64_t v42 = (unint64_t)vbsl_s8((int8x8_t)vcgtd_u64(v40.u64[0], v41.u64[0]), *(int8x8_t *)v41.i8, *(int8x8_t *)v40.i8);
          uint64_t v43 = v7 & 0xFFFFFFF8;
          do
          {
            if (v42 >= (unint64_t)a2->u32[v43] >> 8) {
              unint64_t v42 = (unint64_t)a2->u32[v43] >> 8;
            }
            ++v43;
          }
          while (v7 != v43);
          a2 = (uint32x4_t *)((char *)a2 + v6);
          *(unsigned char *)a4 = 0;
          *(_WORD *)(a4 + 1) = v42;
          *(unsigned char *)(a4 + 3) = BYTE2(v42);
          a4 += 4;
          int8x16_t v26 = (uint32x4_t *)((char *)v26 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<unsigned long long>::resolve<4u,4u,true,63ull,40ull,39ull,32ull>(uint64_t result, unsigned int *a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = (unsigned int *)((char *)a2 + a3);
    uint64_t v6 = 4 * (v4 - 1) + 4;
    if (result <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = result;
    }
    if (v7 <= 7)
    {
      do
      {
        unint64_t v33 = (unint64_t)*a2 >> 8;
        unint64_t v34 = *a2;
        if (result >= 2)
        {
          unint64_t v35 = a2[1];
          if (v33 >= v35 >> 8) {
            unint64_t v33 = v35 >> 8;
          }
          v34 += v35;
          if (v4 != 2)
          {
            unint64_t v36 = a2[2];
            if (v33 >= v36 >> 8) {
              unint64_t v33 = v36 >> 8;
            }
            v34 += v36;
            if (v4 != 3)
            {
              unint64_t v37 = a2[3];
              if (v33 >= v37 >> 8) {
                unint64_t v33 = v37 >> 8;
              }
              v34 += v37;
              if (v4 != 4)
              {
                unint64_t v38 = a2[4];
                if (v33 >= v38 >> 8) {
                  unint64_t v33 = v38 >> 8;
                }
                v34 += v38;
                if (v4 != 5)
                {
                  unint64_t v39 = a2[5];
                  if (v33 >= v39 >> 8) {
                    unint64_t v33 = v39 >> 8;
                  }
                  v34 += v39;
                  if (v4 != 6)
                  {
                    unint64_t v40 = a2[6];
                    if (v33 >= v40 >> 8) {
                      unint64_t v33 = v40 >> 8;
                    }
                    v34 += v40;
                  }
                }
              }
            }
          }
        }
        a2 = (unsigned int *)((char *)a2 + v6);
        *(unsigned char *)a4 = v34 / v4;
        *(_WORD *)(a4 + 1) = v33;
        *(unsigned char *)(a4 + 3) = BYTE2(v33);
        a4 += 4;
      }
      while (a2 < v5);
    }
    else
    {
      uint64_t v8 = v7 & 0xFFFFFFF8;
      if (v8 == v7)
      {
        float v9 = a2 + 4;
        v10.i64[0] = 255;
        v10.i64[1] = 255;
        do
        {
          v11.i64[0] = -1;
          v11.i64[1] = -1;
          int64x2_t v12 = 0uLL;
          int8x16_t v13 = v9;
          uint64_t v14 = v8;
          int64x2_t v15 = 0uLL;
          int64x2_t v16 = 0uLL;
          int64x2_t v17 = 0uLL;
          v18.i64[0] = -1;
          v18.i64[1] = -1;
          v19.i64[0] = -1;
          v19.i64[1] = -1;
          v20.i64[0] = -1;
          v20.i64[1] = -1;
          do
          {
            long long v21 = *((_OWORD *)v13 - 1);
            v22.i64[0] = DWORD2(v21);
            v22.i64[1] = HIDWORD(v21);
            int8x16_t v23 = v22;
            v22.i64[0] = v21;
            v22.i64[1] = DWORD1(v21);
            int8x16_t v24 = v22;
            v22.i64[0] = *((void *)v13 + 1);
            v22.i64[1] = HIDWORD(*(_OWORD *)v13);
            int8x16_t v25 = v22;
            v22.i64[0] = *(_OWORD *)v13;
            v22.i64[1] = HIDWORD(*(void *)v13);
            int8x16_t v26 = (int8x16_t)vshrq_n_u64((uint64x2_t)v24, 8uLL);
            int8x16_t v27 = (int8x16_t)vshrq_n_u64((uint64x2_t)v23, 8uLL);
            int8x16_t v28 = (int8x16_t)vshrq_n_u64((uint64x2_t)v22, 8uLL);
            int8x16_t v29 = (int8x16_t)vshrq_n_u64((uint64x2_t)v25, 8uLL);
            int8x16_t v18 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v27, (uint64x2_t)v18), v18, v27);
            int8x16_t v11 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v26, (uint64x2_t)v11), v11, v26);
            int8x16_t v20 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v29, (uint64x2_t)v20), v20, v29);
            int8x16_t v19 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v28, (uint64x2_t)v19), v19, v28);
            int64x2_t v15 = vaddq_s64((int64x2_t)vandq_s8(v23, v10), v15);
            int64x2_t v12 = vaddq_s64((int64x2_t)vandq_s8(v24, v10), v12);
            int64x2_t v17 = vaddq_s64((int64x2_t)vandq_s8(v25, v10), v17);
            int64x2_t v16 = vaddq_s64((int64x2_t)vandq_s8(v22, v10), v16);
            v13 += 8;
            v14 -= 8;
          }
          while (v14);
          int8x16_t v30 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v19, (uint64x2_t)v11), v11, v19);
          int8x16_t v31 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v20, (uint64x2_t)v18), v18, v20);
          int8x16_t v32 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v31, (uint64x2_t)v30), v30, v31);
          v31.i64[0] = vextq_s8(v32, v32, 8uLL).u64[0];
          *(int8x8_t *)v32.i8 = vbsl_s8((int8x8_t)vcgtd_u64(v31.u64[0], v32.u64[0]), *(int8x8_t *)v32.i8, *(int8x8_t *)v31.i8);
          a2 = (unsigned int *)((char *)a2 + v6);
          *(unsigned char *)a4 = vaddvq_s64(vaddq_s64(vaddq_s64(v16, v12), vaddq_s64(v17, v15))) / v4;
          *(_WORD *)(a4 + 1) = v32.i16[0];
          *(unsigned char *)(a4 + 3) = v32.i8[2];
          a4 += 4;
          float v9 = (unsigned int *)((char *)v9 + v6);
        }
        while (a2 < v5);
      }
      else
      {
        int8x16_t v41 = a2 + 4;
        v42.i64[0] = 255;
        v42.i64[1] = 255;
        do
        {
          v43.i64[0] = -1;
          v43.i64[1] = -1;
          int64x2_t v44 = 0uLL;
          uint64_t v45 = v8;
          int8x16_t v46 = v41;
          int64x2_t v47 = 0uLL;
          int64x2_t v48 = 0uLL;
          int64x2_t v49 = 0uLL;
          v50.i64[0] = -1;
          v50.i64[1] = -1;
          v51.i64[0] = -1;
          v51.i64[1] = -1;
          v52.i64[0] = -1;
          v52.i64[1] = -1;
          do
          {
            long long v53 = *((_OWORD *)v46 - 1);
            v54.i64[0] = DWORD2(v53);
            v54.i64[1] = HIDWORD(v53);
            int8x16_t v55 = v54;
            v54.i64[0] = v53;
            v54.i64[1] = DWORD1(v53);
            int8x16_t v56 = v54;
            v54.i64[0] = *((void *)v46 + 1);
            v54.i64[1] = HIDWORD(*(_OWORD *)v46);
            int8x16_t v57 = v54;
            v54.i64[0] = *(_OWORD *)v46;
            v54.i64[1] = HIDWORD(*(void *)v46);
            int8x16_t v58 = (int8x16_t)vshrq_n_u64((uint64x2_t)v56, 8uLL);
            int8x16_t v59 = (int8x16_t)vshrq_n_u64((uint64x2_t)v55, 8uLL);
            int8x16_t v60 = (int8x16_t)vshrq_n_u64((uint64x2_t)v54, 8uLL);
            int8x16_t v61 = (int8x16_t)vshrq_n_u64((uint64x2_t)v57, 8uLL);
            int8x16_t v50 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v59, (uint64x2_t)v50), v50, v59);
            int8x16_t v43 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v58, (uint64x2_t)v43), v43, v58);
            int8x16_t v52 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v61, (uint64x2_t)v52), v52, v61);
            int8x16_t v51 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v60, (uint64x2_t)v51), v51, v60);
            int64x2_t v47 = vaddq_s64((int64x2_t)vandq_s8(v55, v42), v47);
            int64x2_t v44 = vaddq_s64((int64x2_t)vandq_s8(v56, v42), v44);
            int64x2_t v49 = vaddq_s64((int64x2_t)vandq_s8(v57, v42), v49);
            int64x2_t v48 = vaddq_s64((int64x2_t)vandq_s8(v54, v42), v48);
            v46 += 8;
            v45 -= 8;
          }
          while (v45);
          int8x16_t v62 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v51, (uint64x2_t)v43), v43, v51);
          int8x16_t v63 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v52, (uint64x2_t)v50), v50, v52);
          int8x16_t v64 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v63, (uint64x2_t)v62), v62, v63);
          v63.i64[0] = vextq_s8(v64, v64, 8uLL).u64[0];
          int8x8_t v65 = vbsl_s8((int8x8_t)vcgtd_u64(v63.u64[0], v64.u64[0]), *(int8x8_t *)v64.i8, *(int8x8_t *)v63.i8);
          unint64_t v66 = vaddvq_s64(vaddq_s64(vaddq_s64(v48, v44), vaddq_s64(v49, v47)));
          uint64_t v67 = v8;
          do
          {
            unint64_t v68 = a2[v67];
            if (*(void *)&v65 >= v68 >> 8) {
              int8x8_t v65 = (int8x8_t)(v68 >> 8);
            }
            v66 += v68;
            ++v67;
          }
          while (v4 != v67);
          a2 = (unsigned int *)((char *)a2 + v6);
          *(unsigned char *)a4 = v66 / v4;
          *(_WORD *)(a4 + 1) = v65.i16[0];
          *(unsigned char *)(a4 + 3) = v65.i8[2];
          a4 += 4;
          int8x16_t v41 = (unsigned int *)((char *)v41 + v6);
        }
        while (a2 < v5);
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::MSAADepthStencilResolver<float>::resolve<8u,8u,true,63ull,32ull,31ull,24ull>(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4)
{
  if (result <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = result;
  }
  if (a3)
  {
    unint64_t v5 = a2 + a3;
    int v6 = result;
    if (result <= 1uLL) {
      int v6 = 1;
    }
    do
    {
      uint64_t v7 = 0;
      unint64_t v8 = 0;
      float v9 = 3.4028e38;
      do
      {
        uint64_t v10 = *(void *)(a2 + 8 * v7);
        if (v9 >= *((float *)&v10 + 1)) {
          LODWORD(v9) = HIDWORD(*(void *)(a2 + 8 * v7));
        }
        v8 += BYTE3(v10);
        ++v7;
      }
      while (v6 != v7);
      a2 += 8 * (v4 - 1) + 8;
      *(_WORD *)a4 = 0;
      *(unsigned char *)(a4 + 2) = 0;
      *(unsigned char *)(a4 + 3) = v8 / v4;
      *(float *)(a4 + 4) = v9;
      a4 += 8;
    }
    while (a2 < v5);
  }
  return result;
}

uint64_t GPUTools::GL::IsLumAlphaFormatTextureFilterable(GPUTools::GL *this, int a2, unsigned int a3)
{
  int v3 = (int)this;
  uint64_t result = 1;
  char v5 = v3 - 22;
  if ((v3 - 34838) <= 9)
  {
    if (((1 << v5) & 0xD) != 0) {
      return 0;
    }
    if (((1 << v5) & 0x340) != 0)
    {
      if (a2 > 2) {
        return 1;
      }
      else {
        return a3;
      }
    }
  }
  unsigned int v6 = v3 - 32828;
  if (v6 > 9 || ((1 << v6) & 0x211) == 0) {
    return 0;
  }
  return result;
}

uint64_t GPUTools::GL::IsFormatColorRenderable(GPUTools::GL *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = &GPUTools::GL::sInternalFormatsTable;
  uint64_t v5 = 6660;
  while (*v4 != this)
  {
    v4 += 15;
    v5 -= 60;
    if (!v5)
    {
      unint64_t v4 = (int *)&GPUTools::GL::sUnknownFormat;
      break;
    }
  }
  if ((v4[14] & 2) != 0) {
    return 1;
  }
  if ((int)this <= 34835)
  {
    a4 = a2;
    switch((int)this)
    {
      case 33325:
      case 33327:
        return a4;
      case 33326:
      case 33328:
        uint64_t result = a3;
        break;
      default:
        return 0;
    }
  }
  else
  {
    if ((int)this <= 35897)
    {
      a4 = a3;
      if ((this - 34836) < 2) {
        return a4;
      }
      a4 = a2;
      if ((this - 34842) < 2) {
        return a4;
      }
      return 0;
    }
    if (this != 35898)
    {
      if (this == 35901) {
        return a4;
      }
      return 0;
    }
    return a3 | a4;
  }
  return result;
}

BOOL GPUTools::GL::IsFormatDepthRenderable(GPUTools::GL *this)
{
  return (this - 33189) < 2 || (this - 36012) < 2 || this == 35056;
}

BOOL GPUTools::GL::IsFormatStencilRenderable(GPUTools::GL *this)
{
  BOOL v1 = this == 36013 || this == 36168;
  return this == 35056 || v1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x25335F5D0);
}

uint64_t *GPUTools::SM::GL::GetEnumName(GPUTools::SM::GL *this)
{
  int v2 = (int)this;
  if (GPUTools::SM::GL::GetEnumName(int)::sEnumNameMappingOnce != -1) {
    dispatch_once(&GPUTools::SM::GL::GetEnumName(int)::sEnumNameMappingOnce, &__block_literal_global_0);
  }
  uint64_t result = std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::find<int>((void *)GPUTools::SM::GL::GetEnumName(int)::sEnumNameMapping, &v2);
  if (result) {
    return (uint64_t *)result[3];
  }
  return result;
}

void ___ZN8GPUTools2SM2GL11GetEnumNameEi_block_invoke()
{
}

uint64_t GPUTools::SM::GL::GetInternalBindingEnum(GPUTools::SM::GL *this)
{
  if ((int)this > 35631)
  {
    if ((int)this <= 36005)
    {
      if ((int)this <= 35724)
      {
        if (this == 35632) {
          return 4294966774;
        }
        if (this == 35633) {
          return 4294966775;
        }
      }
      else
      {
        switch(this)
        {
          case 0x8B8D:
            return 4294966779;
          case 0x8C1D:
            return 4294966794;
          case 0x8C8F:
            return 4294966785;
        }
      }
    }
    else if ((int)this > 36388)
    {
      switch(this)
      {
        case 0x8E25:
          return 4294966776;
        case 0x8F36:
          return 4294966789;
        case 0x8F37:
          return 4294966788;
      }
    }
    else
    {
      switch(this)
      {
        case 0x8CA6:
          return 4294966781;
        case 0x8CA7:
          return 4294966783;
        case 0x8CAA:
          return 4294966780;
      }
    }
  }
  else if ((int)this <= 34963)
  {
    if ((int)this <= 33369)
    {
      if (this == 32873) {
        return 4294966796;
      }
      if (this == 32874) {
        return 4294966793;
      }
    }
    else
    {
      switch(this)
      {
        case 0x825A:
          return 4294966777;
        case 0x8514:
          return 4294966795;
        case 0x85B5:
          return 4294966778;
      }
    }
  }
  else if ((int)this > 35054)
  {
    switch(this)
    {
      case 0x88EF:
        return 4294966786;
      case 0x8919:
        return 4294966792;
      case 0x8A28:
        return 4294966784;
    }
  }
  else
  {
    switch(this)
    {
      case 0x8894:
        return 4294966791;
      case 0x8895:
        return 4294966790;
      case 0x88ED:
        return 4294966787;
    }
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
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
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      int8x16_t v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == v7) {
              return v11;
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
          int8x16_t v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  int8x16_t v11 = operator new(0x20uLL);
  *int8x16_t v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    BOOL v15 = 1;
    if (v8 >= 3) {
      BOOL v15 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v8);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<unsigned int,std::hash<unsigned int>,std::equal_to<unsigned int>,std::allocator<unsigned int>>::__rehash<true>(a1, v18);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
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
  uint64_t v19 = *(void *)a1;
  int8x16_t v20 = *(void **)(*(void *)a1 + 8 * v4);
  if (v20)
  {
    *int8x16_t v11 = *v20;
LABEL_38:
    *int8x16_t v20 = v11;
    goto LABEL_39;
  }
  *int8x16_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v11;
  *(void *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    unint64_t v21 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8) {
        v21 %= v8;
      }
    }
    else
    {
      v21 &= v8 - 1;
    }
    int8x16_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_24F5EC9E8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,char const*>,std::__unordered_map_hasher<int,std::__hash_value_type<int,char const*>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,char const*>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,char const*>>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  unsigned int v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::CopyProgramUniform(void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  unsigned int v7 = a4;
  if (a6)
  {
    uint64_t v17 = 0;
    size_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    int v20 = -1;
    uint64_t v13 = 0;
    float v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN8GPUTools2GLL23GetValidUniformLocationERKNS0_10DispatcherE11DYOpenGLAPIjRKNS0_14ProgramUniformE_block_invoke;
    v12[3] = &unk_265332D20;
    v12[5] = &v13;
    v12[6] = a5;
    v12[4] = &v17;
    GPUTools::GL::EnumerateProgramActiveUniforms(a1, a2, a4);
    unsigned int v9 = *((_DWORD *)v18 + 6);
    if (v9 == -1)
    {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    else if (*((unsigned char *)v14 + 24))
    {
      uint64_t v10 = v9;
    }
    else
    {
      uint64_t v10 = 0xFFFFFFFFLL;
    }
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    uint64_t v10 = (*(uint64_t (**)(void, void, void))(a1[1] + 5000))(*(void *)(*a1 + 16), a4, *(void *)a5);
  }
  if (v10 == -1) {
    return v10;
  }
  LODWORD(v17) = 0;
  (*(void (**)(void, uint64_t, uint64_t *))(a1[1] + 832))(*(void *)(*a1 + 16), 35725, &v17);
  (*(void (**)(void, void))(a1[1] + 4800))(*(void *)(*a1 + 16), v7);
  GPUTools::GL::DYGetShaderVariableTypeInfo(*(unsigned int *)(a5 + 24), (uint64_t)v12);
  switch(HIDWORD(v12[0]))
  {
    case 0x1404:
      operator new[]();
    case 0x1405:
      operator new[]();
    case 0x1406:
      operator new[]();
  }
  dy_string_from_enum(SHIDWORD(v12[0]));
  dy_abort();
  uint64_t result = dy_abort();
  __break(1u);
  return result;
}

void sub_24F5ED094(_Unwind_Exception *a1)
{
  MEMORY[0x25335F5B0](v1, 0x1000C8052888210);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::GL::CopyProgramActiveUniforms(void *a1, unsigned int a2, uint64_t a3)
{
  return GPUTools::GL::EnumerateProgramActiveUniforms(a1, a2, a3);
}

uint64_t GPUTools::GL::EnumerateProgramActiveUniforms(void *a1, unsigned int a2, uint64_t a3)
{
  char v8 = 0;
  uint64_t v7 = 0;
  (*(void (**)(void, uint64_t, uint64_t, char *))(a1[1] + 5264))(*(void *)(*a1 + 16), a3, 35718, (char *)&v7 + 4);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1[1] + 5264))(*(void *)(*a1 + 16), a3, 35719, &v7);
  if (HIDWORD(v7))
  {
    if (a2 < 3) {
      operator new[]();
    }
    if (a2 - 3 < 2) {
      operator new[]();
    }
  }
  return result;
}

uint64_t ___ZN8GPUTools2GL25CopyProgramActiveUniformsERKNS0_10DispatcherE11DYOpenGLAPIjjb_block_invoke(uint64_t a1, uint64_t a2)
{
  return GPUTools::GL::CopyProgramUniform(*(void **)(a1 + 32), *(_DWORD *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), a2, *(unsigned __int8 *)(a1 + 52));
}

uint64_t GPUTools::GL::CopyProgramActiveAttributes(void *a1, uint64_t a2)
{
  return GPUTools::GL::EnumerateProgramActiveAttributes(a1, a2);
}

uint64_t GPUTools::GL::EnumerateProgramActiveAttributes(void *a1, uint64_t a2)
{
  uint64_t v8 = 0;
  (*(void (**)(void, uint64_t, uint64_t, char *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35721, (char *)&v8 + 4);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35722, &v8);
  if (HIDWORD(v8))
  {
    memset(v7, 0, sizeof(v7));
    long long v6 = 0u;
    uint64_t v5 = (v8 + 32);
    operator new[]();
  }
  return result;
}

uint64_t ___ZN8GPUTools2GL27CopyProgramActiveAttributesERKNS0_10DispatcherEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(*(void *)(a1 + 32) + 8) + 5040))(*(void *)(**(void **)(a1 + 32) + 16), *(unsigned int *)(a1 + 40), *(unsigned int *)(a2 + 28), *(void *)a2);
}

void *GPUTools::GL::SetUniformArrayLocationStride(void *result, uint64_t a2, uint64_t *a3)
{
  if (*((_DWORD *)a3 + 7) != -1 && *((_DWORD *)a3 + 5) != 1)
  {
    uint64_t v5 = *a3;
    uint64_t v6 = *((int *)a3 + 4);
    if (*(unsigned char *)(v6 + *a3 - 3) == 91 && *(unsigned char *)(v5 + v6 - 2) == 48 && *(unsigned char *)(v6 + v5 - 1) == 93)
    {
      *(unsigned char *)(v5 + v6 - 2) = 49;
      uint64_t result = (void *)(*(uint64_t (**)(void, uint64_t, void))(result[1] + 5000))(*(void *)(*result + 16), a2, *a3);
      *(unsigned char *)(*((int *)a3 + 4) + *a3 - 2) = 48;
      if (result == -1) {
        __assert_rtn("void GPUTools::GL::SetUniformArrayLocationStride(const Dispatcher &, GLhandleARB, ProgramUniform &)", (const char *)&unk_24F5F0846, 0, "nextLoc != -1");
      }
      *((_DWORD *)a3 + 11) = result - *((_DWORD *)a3 + 7);
    }
  }
  return result;
}

void *___ZN8GPUTools2GL30EnumerateProgramActiveUniformsERKNS0_10DispatcherE11DYOpenGLAPIjbU13block_pointerFvRKNS0_14ProgramUniformERbE_block_invoke(void *result, uint64_t a2, int a3, unsigned char *a4)
{
  if (a2)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0;
    uint64_t v8 = a2;
    uint64_t v9 = result[5];
    do
    {
      *(_DWORD *)(v9 + 4 * v7) = a3 + v7;
      ++v7;
    }
    while (a2 != v7);
    (*(void (**)(void, void, void))(*(void *)(result[6] + 8) + 3536))(*(void *)(*(void *)result[6] + 16), *((unsigned int *)result + 34), a2);
    (*(void (**)(void, void, uint64_t, void, uint64_t, void))(*(void *)(v6[6] + 8) + 3536))(*(void *)(*(void *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35387, v6[8]);
    (*(void (**)(void, void, uint64_t, void, uint64_t, void))(*(void *)(v6[6] + 8) + 3536))(*(void *)(*(void *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35388, v6[9]);
    (*(void (**)(void, void, uint64_t, void, uint64_t, void))(*(void *)(v6[6] + 8) + 3536))(*(void *)(*(void *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35389, v6[10]);
    (*(void (**)(void, void, uint64_t, void, uint64_t, void))(*(void *)(v6[6] + 8) + 3536))(*(void *)(*(void *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35390, v6[11]);
    (*(void (**)(void, void, uint64_t, void, uint64_t, void))(*(void *)(v6[6] + 8) + 3536))(*(void *)(*(void *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35424, v6[12]);
    (*(void (**)(void, void, uint64_t, void, uint64_t, void))(*(void *)(v6[6] + 8) + 3536))(*(void *)(*(void *)v6[6] + 16), *((unsigned int *)v6 + 34), a2, v6[5], 35428, v6[13]);
    uint64_t v10 = 0;
    memset(v20, 0, sizeof(v20));
    int v21 = 0;
    uint64_t v11 = v6[14];
    v19[0] = v6[15];
    v19[1] = v11;
    uint64_t v12 = 4 * v8 - 4;
    do
    {
      uint64_t v13 = v6[5];
      float v14 = (void *)v6[6];
      *(_DWORD *)&v20[16] = *(_DWORD *)(v13 + v10);
      uint64_t result = (void *)(*(uint64_t (**)(void, void, void, void, unsigned char *, unsigned char *, unsigned char *, uint64_t))(v14[1] + 5008))(*(void *)(*v14 + 16), v6[16], *(unsigned int *)(v13 + v10), *((unsigned int *)v6 + 35), v20, &v20[4], &v20[8], v19[0]);
      uint64_t v15 = v6[8];
      *(_DWORD *)&v20[20] = *(_DWORD *)(v6[7] + v10);
      *(_DWORD *)&v20[24] = *(_DWORD *)(v15 + v10);
      uint64_t v16 = v6[10];
      *(_DWORD *)&v20[32] = *(_DWORD *)(v6[9] + v10);
      *(_DWORD *)&v20[36] = *(_DWORD *)(v16 + v10);
      v20[40] = *(_DWORD *)(v6[11] + v10);
      BOOL v17 = *(unsigned char *)v19[0] == 103 && *(unsigned char *)(v19[0] + 1) == 108 && *(unsigned __int8 *)(v19[0] + 2) == 95;
      v20[41] = v17;
      int v21 = (*(_DWORD *)(v6[12] + v10) != 0) | (2 * (*(_DWORD *)(v6[13] + v10) != 0));
      if (v17)
      {
        *(_DWORD *)&v20[12] = -1;
      }
      else
      {
        *(_DWORD *)&v20[12] = (*(uint64_t (**)(void, void))(*(void *)(v6[6] + 8) + 5000))(*(void *)(*(void *)v6[6] + 16), v6[16]);
        uint64_t result = GPUTools::GL::SetUniformArrayLocationStride((void *)v6[6], v6[16], v19);
      }
      if (!*((unsigned char *)v6 + 144) || !v20[41]) {
        uint64_t result = (void *)(*(uint64_t (**)(void))(v6[4] + 16))();
      }
      if (*a4) {
        break;
      }
      BOOL v18 = v12 == v10;
      v10 += 4;
    }
    while (!v18);
  }
  return result;
}

uint64_t GPUTools::GL::EnumerateProgramActiveUniformBlocks(void *a1, uint64_t a2)
{
  uint64_t v10 = 0;
  (*(void (**)(void, uint64_t, uint64_t, char *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35382, (char *)&v10 + 4);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35381, &v10);
  if (HIDWORD(v10))
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int v7 = 0;
    uint64_t v5 = (v10 + 32);
    operator new[]();
  }
  return result;
}

uint64_t GPUTools::GL::CopyProgramActiveUniformBlockBindings(void *a1, uint64_t a2)
{
  return GPUTools::GL::EnumerateProgramActiveUniformBlocks(a1, a2);
}

uint64_t ___ZN8GPUTools2GL37CopyProgramActiveUniformBlockBindingsERKNS0_10DispatcherEjj_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1 + 32) + 8) + 3552))(*(void *)(**(void **)(a1 + 32) + 16), *(unsigned int *)(a1 + 40), *(void *)a2);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) + 8) + 3576);
  uint64_t v6 = *(void *)(**(void **)(a1 + 32) + 16);
  uint64_t v7 = *(unsigned int *)(a1 + 40);
  uint64_t v8 = *(unsigned int *)(a2 + 44);
  return v5(v6, v7, v4, v8);
}

uint64_t GPUTools::GL::EnumerateProgramTransformFeedbackVaryings(void *a1, uint64_t a2)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  int v6 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35971, &v6);
  if (v6)
  {
    int v5 = 0;
    (*(void (**)(void, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35958, &v5);
    operator new[]();
  }
  return result;
}

uint64_t GPUTools::GL::CopyProgramTransformFeedbackVaryings(void *a1, uint64_t a2)
{
  int v7 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35971, &v7);
  if (v7)
  {
    int v5 = 0;
    int v6 = 0;
    (*(void (**)(void, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35967, &v6);
    (*(void (**)(void, uint64_t, uint64_t, int *))(a1[1] + 5264))(*(void *)(*a1 + 16), a2, 35958, &v5);
    operator new[]();
  }
  return result;
}

char *GPUTools::GL::EnumerateTextureTargets(char *result, int a2, uint64_t a3)
{
  uint64_t v4 = result;
  switch(a2)
  {
    case 0:
      uint64_t v11 = (void (**)(uint64_t, uint64_t))(a3 + 16);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3552);
      (*v11)(a3, 3553);
      (*v11)(a3, 32879);
      (*v11)(a3, 34067);
      int v5 = (char *)(*(uint64_t (**)(void, uint64_t))(*((void *)v4 + 1) + 936))(*(void *)(*(void *)v4 + 16), 7939);
      if (strstr(v5, "GL_EXT_texture_array"))
      {
        (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35864);
        (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 35866);
      }
      int v6 = (char *)(*(uint64_t (**)(void, uint64_t))(*((void *)v4 + 1) + 936))(*(void *)(*(void *)v4 + 16), 7939);
      uint64_t result = strstr(v6, "GL_ARB_texture_rectangle");
      if (result)
      {
        int v7 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
        uint64_t v8 = a3;
        uint64_t v9 = 34037;
        goto LABEL_13;
      }
      return result;
    case 1:
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      uint64_t v10 = (char *)(*(uint64_t (**)(void, uint64_t))(*((void *)v4 + 1) + 936))(*(void *)(*(void *)v4 + 16), 7939);
      uint64_t result = strstr(v10, "GL_OES_texture_cube_map");
      if (result)
      {
        int v7 = *(void (**)(uint64_t, uint64_t))(a3 + 16);
        uint64_t v8 = a3;
        uint64_t v9 = 34067;
        goto LABEL_13;
      }
      return result;
    case 2:
      uint64_t v12 = (void (**)(uint64_t, uint64_t))(a3 + 16);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      goto LABEL_12;
    case 3:
      uint64_t v13 = (void (**)(uint64_t, uint64_t))(a3 + 16);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3552);
      (*v13)(a3, 35864);
      (*v13)(a3, 3553);
      (*v13)(a3, 35866);
      (*v13)(a3, 37120);
      (*v13)(a3, 37122);
      (*v13)(a3, 32879);
      (*v13)(a3, 34067);
      (*v13)(a3, 34037);
      int v7 = *v13;
      uint64_t v8 = a3;
      uint64_t v9 = 35882;
      goto LABEL_13;
    case 4:
      uint64_t v12 = (void (**)(uint64_t, uint64_t))(a3 + 16);
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 3553);
      (*v12)(a3, 35866);
      (*v12)(a3, 32879);
LABEL_12:
      int v7 = *v12;
      uint64_t v8 = a3;
      uint64_t v9 = 34067;
LABEL_13:
      uint64_t result = (char *)((uint64_t (*)(uint64_t, uint64_t))v7)(v8, v9);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GPUTools::GL::GetTexStorageInfo(void *a1, int a2, unsigned int *a3, uint64_t a4)
{
  LODWORD(v5) = a2;
  uint64_t v7 = a4 + 4;
  *(_OWORD *)a4 = xmmword_24F611FF0;
  int v8 = 1;
  *(_DWORD *)(a4 + 16) = 1;
  if (*((unsigned char *)a3 + 9))
  {
    HIDWORD(v17) = 0;
    (*(void (**)(void, void, char *))(a1[1] + 832))(*(void *)(*a1 + 16), *a3, (char *)&v17 + 4);
    unsigned int v9 = HIDWORD(v17);
    if (HIWORD(HIDWORD(v17))) {
      unsigned int v9 = HIWORD(HIDWORD(v17));
    }
    int v10 = 16 * (HIWORD(HIDWORD(v17)) != 0);
    if (v9 > 0xFF)
    {
      v9 >>= 8;
      int v10 = (16 * (HIWORD(HIDWORD(v17)) != 0)) | 8;
    }
    if (v9 > 0xF)
    {
      v9 >>= 4;
      v10 |= 4u;
    }
    if (v9 > 3)
    {
      v9 >>= 2;
      v10 |= 2u;
    }
    int v8 = (v10 | (v9 > 1)) + 1;
  }
  uint64_t v11 = 0;
  if (v5 == 34067) {
    uint64_t v5 = 34069;
  }
  else {
    uint64_t v5 = v5;
  }
  while (1)
  {
    uint64_t v17 = 0;
    int v16 = 0;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, char *))(a1[1] + 1000))(*(void *)(*a1 + 16), v5, v11, 4096, (char *)&v17 + 4);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t *))(a1[1] + 1000))(*(void *)(*a1 + 16), v5, v11, 4097, &v17);
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, int *))(a1[1] + 1000))(*(void *)(*a1 + 16), v5, v11, 32881, &v16);
    if (v11)
    {
      int v13 = v17;
      int v14 = v16;
      if (!HIDWORD(v17)) {
        break;
      }
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a1[1] + 1000))(*(void *)(*a1 + 16), v5, 0, 4099, v7);
      int v13 = v17;
      int v15 = HIDWORD(v17);
      *(_DWORD *)(a4 + 8) = HIDWORD(v17);
      *(_DWORD *)(a4 + 12) = v13;
      int v14 = v16;
      *(_DWORD *)(a4 + 16) = v16;
      if (!v15) {
        break;
      }
    }
    if (!v13 || !v14) {
      break;
    }
    uint64_t v11 = (v11 + 1);
    if (v8 == v11)
    {
      *(_DWORD *)a4 = v8;
      return result;
    }
  }
  *(_DWORD *)a4 = v11;
  return result;
}

double GPUTools::GL::GetImageInfo(id **a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(_DWORD *)(a5 + 24) = 0;
  *(void *)(a5 + 16) = 0;
  *(void *)(a5 + 28) = 0x100000001;
  uint64_t v9 = a5 + 28;
  *(void *)(a5 + 36) = 0;
  uint64_t v10 = a5 + 36;
  *(void *)(a5 + 41) = 0;
  if (a3 == 36161)
  {
    LODWORD(v11) = 36161;
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36162, a5 + 24);
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36163, v9);
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36164, a5 + 12);
    ((void (*)(id, uint64_t, uint64_t, uint64_t))a1[1][670])((*a1)[2], 36161, 36011, a5 + 40);
  }
  else
  {
    if (a3 == 34067) {
      uint64_t v11 = 34069;
    }
    else {
      uint64_t v11 = a3;
    }
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 4096, a5 + 24);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 4097, v9);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 32881, a5 + 32);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 34465, v10);
    ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))a1[1][125])((*a1)[2], v11, a4, 4099, a5 + 12);
  }
  if (*(_DWORD *)(a5 + 24) && *(_DWORD *)(a5 + 28) && *(_DWORD *)(a5 + 32))
  {
    if (*(_DWORD *)(a5 + 36))
    {
      *(void *)(a5 + 16) = 0;
      *(void *)a5 = *(void *)(a5 + 12);
      *(_DWORD *)(a5 + 8) = *(_DWORD *)(a5 + 20);
    }
    else
    {
      *(void *)a5 = GPUTools::GL::GetImageUploadFormatInfo((GPUTools::GL *)*(unsigned int *)(a5 + 12));
      *(_DWORD *)(a5 + 8) = v13;
      if ((a2 - 1) <= 1 && v11 != 36161) {
        GPUTools::GL::DYProcessImageUploadFormatForLegacyES((int *)a5);
      }
      v14[0] = v11;
      v14[1] = a4;
      if (![**a1 getParameter:1500 to:v14])
      {
        double result = v15;
        *(double *)(a5 + 16) = v15;
      }
    }
  }
  return result;
}

uint64_t GPUTools::GL::GetImageInfo(id **a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a4 == 36161)
  {
    v16[0] = 0;
    ((void (*)(id, uint64_t, unsigned int *))a1[1][104])((*a1)[2], 36007, v16);
    ((void (*)(id, uint64_t, uint64_t))a1[1][666])((*a1)[2], 36161, a3);
    v11.n128_f64[0] = GPUTools::GL::GetImageInfo(a1, a2, 0x8D41u, a5, a6);
    return ((uint64_t (*)(id, uint64_t, void, __n128))a1[1][666])((*a1)[2], 36161, v16[0], v11);
  }
  else
  {
    unsigned int v17 = 0;
    memset(v16, 0, 15);
    double v14 = GPUTools::GL::DYGetTextureTargetInfo(a4, (uint64_t)v16);
    ((void (*)(id, void, unsigned int *, double))a1[1][104])((*a1)[2], v16[1], &v17, v14);
    ((void (*)(id, uint64_t, uint64_t))a1[1][5])((*a1)[2], a4, a3);
    v15.n128_f64[0] = GPUTools::GL::GetImageInfo(a1, a2, a4, a5, a6);
    return ((uint64_t (*)(id, uint64_t, void, __n128))a1[1][5])((*a1)[2], a4, v17, v15);
  }
}

BOOL GPUTools::GL::ShouldUseGLIReadTextureData(void *a1)
{
  uint64_t v1 = (char *)(*(uint64_t (**)(void, uint64_t))(a1[1] + 936))(*(void *)(*a1 + 16), 7937);
  return strstr(v1, "SGX") != 0;
}

uint64_t GPUTools::GL::GetImageData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  if (a6)
  {
    v15[0] = a2;
    v15[1] = a3;
    v15[2] = a4;
    v15[3] = a5;
    uint64_t v16 = a7;
    return [**(id **)a1 getParameter:605 to:v15];
  }
  else
  {
    v15[0] = 0;
    [**(id **)a1 getParameter:1501 to:v15];
    int v14 = 1;
    [**(id **)a1 setParameter:1501 to:&v14];
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 8) + 984))(*(void *)(*(void *)a1 + 16), a2, a3, a4, a5, a7);
    return [**(id **)a1 setParameter:1501 to:v15];
  }
}

uint64_t GPUTools::GL::GetFramebufferAttachmentInfo(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(a5 + 12) = 0;
  *(_DWORD *)(a5 + 28) = 0;
  *(void *)(a5 + 4) = 0;
  *(void *)(a5 + 20) = 0;
  *(_DWORD *)a5 = a4;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(void *)(*a1 + 16), a3, a4, 36049, a5 + 4);
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(void *)(*a1 + 16), a3, a4, 36048, a5 + 8);
  int v11 = *(_DWORD *)(a5 + 8);
  if (v11 != 5890)
  {
    if (v11 == 36161) {
      *(_DWORD *)(a5 + 12) = 36161;
    }
    return result;
  }
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(void *)(*a1 + 16), a3, a4, 36050, a5 + 20);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(void *)(*a1 + 16), a3, a4, 36051, a5 + 16);
  if ((a2 - 1) >= 2)
  {
    if ((a2 - 3) <= 1)
    {
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(void *)(*a1 + 16), a3, a4, 36052, a5 + 24);
LABEL_9:
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440))(*(void *)(*a1 + 16), a3, a4, 36263, a5 + 28);
      goto LABEL_10;
    }
    if (a2 >= 3) {
      goto LABEL_9;
    }
  }
LABEL_10:
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[1] + 5440);
  uint64_t v13 = *(void *)(*a1 + 16);
  return v12(v13, a3, a4, 35419, a5 + 12);
}

uint64_t GPUTools::GL::SavePixelStorePackState(void *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3333, a4 + 12);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3330, a4);
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3331, a4 + 4);
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3332, a4 + 8);
    if (a2 != 4)
    {
      (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 32876, a4 + 16);
      uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 32875, a4 + 20);
      if (a2 == 3)
      {
        (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 792))(*(void *)(*a1 + 16), 3328, a4 + 32);
        uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 792))(*(void *)(*a1 + 16), 3329, a4 + 33);
      }
    }
  }
  if (a3)
  {
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 35349, a4 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1[1] + 832);
    uint64_t v10 = *(void *)(*a1 + 16);
    return v9(v10, 35351, a4 + 28);
  }
  return result;
}

uint64_t GPUTools::GL::SavePixelStoreUnpackState(void *a1, int a2, int a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3317, a4 + 12);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3314, a4);
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3315, a4 + 4);
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 3316, a4 + 8);
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 32878, a4 + 16);
    uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 32877, a4 + 20);
    if (a2 == 3)
    {
      (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 792))(*(void *)(*a1 + 16), 3312, a4 + 32);
      uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t))(a1[1] + 792))(*(void *)(*a1 + 16), 3313, a4 + 33);
    }
  }
  if (a3)
  {
    (*(void (**)(void, uint64_t, uint64_t))(a1[1] + 832))(*(void *)(*a1 + 16), 35350, a4 + 24);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1[1] + 832);
    uint64_t v10 = *(void *)(*a1 + 16);
    return v9(v10, 35352, a4 + 28);
  }
  return result;
}

uint64_t GPUTools::GL::SavePixelStoreState(void *a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  GPUTools::GL::SavePixelStoreUnpackState(a1, a2, a3, a4);
  return GPUTools::GL::SavePixelStorePackState(a1, a2, a3, a5);
}

uint64_t GPUTools::GL::ApplyPixelStorePackState(void *a1, int a2, int a3, unsigned int *a4)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3333, a4[3]);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3330, *a4);
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3331, a4[1]);
    uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3332, a4[2]);
    if (a2 != 4)
    {
      (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 32876, a4[4]);
      uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 32875, a4[5]);
      if (a2 == 3)
      {
        (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3328, *((unsigned __int8 *)a4 + 32));
        uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3329, *((unsigned __int8 *)a4 + 33));
      }
    }
  }
  if (a3)
  {
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 35349, a4[6]);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1[1] + 1560);
    uint64_t v10 = *(void *)(*a1 + 16);
    uint64_t v11 = a4[7];
    return v9(v10, 35351, v11);
  }
  return result;
}

uint64_t GPUTools::GL::ApplyPixelStoreUnpackState(void *a1, int a2, int a3, unsigned int *a4)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3317, a4[3]);
  if ((a2 - 1) >= 2)
  {
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3314, *a4);
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3315, a4[1]);
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3316, a4[2]);
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 32878, a4[4]);
    uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 32877, a4[5]);
    if (a2 == 3)
    {
      (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3312, *((unsigned __int8 *)a4 + 32));
      uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 3313, *((unsigned __int8 *)a4 + 33));
    }
  }
  if (a3)
  {
    (*(void (**)(void, uint64_t, void))(a1[1] + 1560))(*(void *)(*a1 + 16), 35350, a4[6]);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1[1] + 1560);
    uint64_t v10 = *(void *)(*a1 + 16);
    uint64_t v11 = a4[7];
    return v9(v10, 35352, v11);
  }
  return result;
}

uint64_t GPUTools::GL::ApplyPixelStoreState(void *a1, int a2, int a3, unsigned int *a4, unsigned int *a5)
{
  GPUTools::GL::ApplyPixelStoreUnpackState(a1, a2, a3, a4);
  return GPUTools::GL::ApplyPixelStorePackState(a1, a2, a3, a5);
}

uint64_t GPUTools::GL::GetBufferSize(void *a1, int a2, uint64_t a3)
{
  if ((a2 - 3) > 1)
  {
    int v4 = 0;
    (*(void (**)(void, uint64_t, uint64_t, int *))(a1[1] + 5208))(*(void *)(*a1 + 16), a3, 34660, &v4);
    return v4;
  }
  else
  {
    uint64_t v5 = 0;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(a1[1] + 6392))(*(void *)(*a1 + 16), a3, 34660, &v5);
    return v5;
  }
}

uint64_t ___ZN8GPUTools2GLL23GetValidUniformLocationERKNS0_10DispatcherE11DYOpenGLAPIjRKNS0_14ProgramUniformE_block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = a1[6];
  uint64_t result = strcmp(*(const char **)v6, *(const char **)a2);
  if (!result)
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = *(_DWORD *)(a2 + 28);
    BOOL v8 = *(_DWORD *)(v6 + 24) == *(_DWORD *)(a2 + 24) && *(_DWORD *)(v6 + 20) == *(_DWORD *)(a2 + 20);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v8;
    *a3 = 1;
  }
  return result;
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

uint64_t DYGetGLInterposeDylibPath()
{
  return MEMORY[0x270F2DC00]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t GPUTools::FD::Function::Function(GPUTools::FD::Function *this, const Function *a2)
{
  return MEMORY[0x270F2DD00](this, a2);
}

void GPUTools::FD::Function::~Function(GPUTools::FD::Function *this)
{
}

uint64_t GPUTools::FD::Argument::ViewAsGLObjectName(GPUTools::FD::Argument *this)
{
  return MEMORY[0x270F2DD40](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dy_abort()
{
  return MEMORY[0x270F2DD48]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}